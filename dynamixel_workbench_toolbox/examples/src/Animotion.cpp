/*******************************************************************************
* Copyright 2018 ROBOTIS CO., LTD.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

/* Authors: Taehun Lim (Darby) */

#include <DynamixelWorkbench.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <signal.h>
#include <stdarg.h>
#include <getopt.h>
#include <chrono>

// LED libs
#include "clk.h"
#include "gpio.h"
#include "dma.h"
#include "pwm.h"

#include "ws2811.h"
#include "animations.h"

#include <time.h>
#include <sys/time.h>

void swap(int32_t *array);
static uint8_t running = 1;
int clear_on_exit = 0;

// defaults for cmdline options
#define TARGET_FREQ             WS2811_TARGET_FREQ
#define GPIO_PIN                18
#define DMA                     10
//#define STRIP_TYPE            WS2811_STRIP_RGB		// WS2812/SK6812RGB integrated chip+leds
/* #define STRIP_TYPE              WS2811_STRIP_GBR		// WS2812/SK6812RGB integrated chip+leds */
#define STRIP_TYPE              SK6812_STRIP_GRBW		// SK6812RGBW (NOT SK6812RGB)

#define LED_COUNT               (LUT_W * LUT_H)
#define FPS                     25
#define FRAME_DURATION          (1000000/FPS)

long elapsed_seconds = 0;
long last_switch = 0;
int switch_interval = 5;  // Switch every 5 seconds

ws2811_t ledstring =
{
    .freq = TARGET_FREQ,
    .dmanum = DMA,
    .channel =
    {
        [0] =
        {
            .gpionum = GPIO_PIN,
            .invert = 0,
            .count = LED_COUNT,
            .strip_type = STRIP_TYPE,
            .brightness = 255,
        }
    }
};

ws2811_led_t *matrix;

void matrix_render(void)
{
    int x, y;

    for (x = 0; x < LUT_W; x++)
    {
        for (y = 0; y < LUT_H; y++)
        {
            ledstring.channel[0].leds[(y * LUT_W) + x] = matrix[y * LUT_W + x];
        }
    }
}

void matrix_clear(void)
{
    int x, y;

    for (y = 0; y < (LUT_H ); y++)
    {
        for (x = 0; x < LUT_W; x++)
        {
            matrix[y * LUT_W + x] = 0;
        }
    }
}

static void ctrl_c_handler(int signum)
{
	(void)(signum);
    running = 0;
}

static void setup_handlers(void)
{
    struct sigaction sa;
    sa.sa_handler = ctrl_c_handler;

    sigaction(SIGINT, &sa, NULL);
    sigaction(SIGTERM, &sa, NULL);
}

bool initializeLEDs()
{
  ws2811_return_t ret;
  if ((ret = ws2811_init(&ledstring)) != WS2811_SUCCESS)
  {
        fprintf(stderr, "ws2811_init failed: %s\n", ws2811_get_return_t_str(ret));
        return ret;
  }

  return true;
}

bool bulkReadPosition(DynamixelWorkbench &dxl_wb, int32_t *present_position, const char **log)
{
  bool result = dxl_wb.bulkRead(log);
  if (result == false)
  {
    printf("%s\n", *log);
    printf("Failed to bulk read\n");
    return false;
  }

  result = dxl_wb.getBulkReadData(&present_position[0], log);
  if (result == false)
  {
    printf("Failed to get bulk read data%s\n", *log);
    return false;
  }
  return true;
}

bool syncWritePosition(DynamixelWorkbench &dxl_wb, uint8_t handler_index, int32_t *goal_position, const char **log)
{
  bool result = dxl_wb.syncWrite(handler_index, &goal_position[0], log);
  if (result == false)
  {
    printf("%s\n", *log);
    printf("Failed to sync write position\n");
  }
  return result;
}

bool initializeServos(DynamixelWorkbench &dxl_wb,
                   const char *port_name,
                   uint32_t baud_rate,
                   uint8_t *dxl_id,
                   int vel,
                   int acc,
                   int SERVOS) {
  const char *log;
  bool result;
  uint16_t model_number;

  // Initialize dxl_wb
  result = dxl_wb.init(port_name, baud_rate, &log);
  if (!result) {
    printf("%s\n", log);
    printf("Failed to init\n");
    return false;
  }
  printf("Succeed to init(%d)\n", baud_rate);

  // Loop through servos
  for (int cnt = 0; cnt < SERVOS; cnt++) {
    result = dxl_wb.ping(dxl_id[cnt], &model_number, &log);
    if (!result) {
      printf("%s\n", log);
      printf("Failed to ping\n");
    } else {
      printf("Succeeded to ping\n");
      printf("id : %d, model_number : %d\n", dxl_id[cnt], model_number);
    }

    result = dxl_wb.multiJointMode(dxl_id[cnt], vel, acc, &log);
    if (!result) {
      printf("%s\n", log);
      printf("Failed to change to multi joint mode\n");
    } else {
      printf("Succeed to change to multi joint mode\n");
    }
  }

  result = dxl_wb.addSyncWriteHandler(dxl_id[0], "Goal_Position", &log);
  if (!result) {
    printf("%s\n", log);
    printf("Failed to add sync write handler\n");
  }

  result = dxl_wb.initBulkRead(&log);
  if (result == false)
  {
    printf("%s\n", log);
  }
  else
  {
    printf("Suceeded init bulk read: %s\n", log);
  }

  result = dxl_wb.addBulkReadParam(dxl_id[0], "Present_Position", &log);
  if (result == false)
  {
    printf("%s\n", log);
    printf("Failed to add bulk read position param\n");
    return false;
  }
  else
  {
    printf("Succeeded bulk read for position: %s\n", log);
  }
  return result;
}

#define SERVOS 7
int main(int argc, char *argv[]) 

{
  const char* port_name = "/dev/ttyUSB0";
  int baud_rate = 115200;

  int vel = 10;
  int acc = 2;

  uint16_t model_number = 1200;
  uint8_t dxl_id[SERVOS] = {0, 1, 2, 3, 4, 5, 6};

  if (argc < 3)
  {
    printf("Please set velocity and acceleration:");
    return 0;
  }
  else
  {
    vel = atoi(argv[1]);
    acc = atoi(argv[2]);
  }

  DynamixelWorkbench dxl_wb;

  const char *log;
  bool result = false;

  if (!initializeServos(dxl_wb, port_name, baud_rate, dxl_id, vel, acc, SERVOS)) {
    printf("Failed to initialized some or all settings");
    return 0;  // Exit if the initialization failed
  }

  initializeLEDs();

  // SERVOS
  int32_t goal_position[SERVOS] = {0, -30000, -1023, -1023*10, 2048*10, 2047, 2047};
  // int32_t goal_position[SERVOS] = {2047, 2047, 3072, 3072, 3072, 0, 0};

  int32_t present_position[SERVOS] = {0, 0, 0, 0, 0, 0, 0};

  const uint8_t handler_index = 0;

  //LEDS
    ws2811_return_t ret;
    struct timeval start_time, current_time;
    gettimeofday(&start_time, NULL);

    int num_frames = FPS*10;
    int direction = 1;

    AnimationContext current_animation = {
      .frames = NULL,
      .frame_count = 0,
      .current_frame = 0,
      .direction = 1
    };

    AnimationContext next_animation = {
      .frames = NULL,
      .frame_count = 0,
      .current_frame = 0,
      .direction = 1
    };

    enum AnimationType current_animation_type = GROWING_ELLIPSE;
    enum AnimationType next_animation_type = ROTATING_FRAMES;  // Start with this animation

    make_growing_ellipse(&current_animation, num_frames);

  while(running)
  {

    // result = dxl_wb.getSyncReadData(handler_index, &present_position[0], &log);
    // if (result == false)
    // {
    //   printf("%s\n", log);
    // }
    // else
    // {
    //   for (int cnt = 0; cnt < SERVOS; cnt++)
    //     printf("[%d]G:%d P%d  ", cnt, goal_position[cnt], present_position[cnt]);
    //   printf("\n");
    // }

        gettimeofday(&current_time, NULL);
        elapsed_seconds = current_time.tv_sec - start_time.tv_sec;

        send_frame_to_neopixels(current_animation.frames[current_animation.current_frame], &ledstring);
        if ((ret = ws2811_render(&ledstring)) != WS2811_SUCCESS)
        {
            fprintf(stderr, "ws2811_render failed: %s\n", ws2811_get_return_t_str(ret));
            break;
        }

        current_animation.current_frame += current_animation.direction;
        /* printf("moved to frame: %d", current_animation.current_frame); */
        if (current_animation.current_frame >= current_animation.frame_count - 1 || current_animation.current_frame <= 0) {
          current_animation.direction *= -1;  // Reverse direction
        }

        // Check if 5 seconds have passed
        if (elapsed_seconds - last_switch >= switch_interval) {
          last_switch = elapsed_seconds;
          printf("5 seconds: current- %d  next- %d\n", current_animation_type, next_animation_type);

        // Clear or initialize current_animation before running these functions
        // Optionally use smooth transition functions here

          if (next_animation_type != current_animation_type) {
            clear_animation(&current_animation);
            switch (next_animation_type) {
                case GROWING_ELLIPSE:
                    make_growing_ellipse(&current_animation, num_frames);
                    next_animation_type = ROTATING_FRAMES;
                    break;

                case ROTATING_FRAMES:
                    make_rotating_frames(&current_animation, num_frames);
                    next_animation_type = GROWING_ELLIPSE;
                    break;

                default:
                    break;
            }
            current_animation_type = next_animation_type;  // Update the current animation type
          }
        }

  auto servo_time = std::chrono::high_resolution_clock::now();

  syncWritePosition(dxl_wb, handler_index, &goal_position[0], &log);

  auto servo_write_time = std::chrono::high_resolution_clock::now();

  bulkReadPosition(dxl_wb, present_position, &log);

  auto servo_read_time = std::chrono::high_resolution_clock::now();

  // Calculate the duration for each operation
  auto write_duration = std::chrono::duration_cast<std::chrono::microseconds>(servo_write_time - servo_time);
  auto read_duration = std::chrono::duration_cast<std::chrono::microseconds>(servo_read_time - servo_write_time);

  // Print the durations
  // printf("syncWrite took %lld microseconds\n", write_duration.count());
  // printf("syncRead took %lld microseconds\n", read_duration.count());

  // Calculate remaining time for usleep
  auto total_duration = write_duration + read_duration;
  auto remaining_time = std::chrono::microseconds(FRAME_DURATION) - total_duration;

  // printf("total took %lld microseconds\n", total_duration.count());
  // printf("sleep for: %lld microseconds\n", remaining_time.count());

  if (remaining_time.count() > 0)
  {
    usleep(remaining_time.count());
  }
}


  if (clear_on_exit) {
    matrix_clear();
    matrix_render();
  }

  ws2811_fini(&ledstring);


  return 0;
}

