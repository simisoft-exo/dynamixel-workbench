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
#include <cmath> // for std::abs
#include <algorithm> // for std::reverse

// LED libs
#include "clk.h"
#include "gpio.h"
#include "dma.h"
#include "pwm.h"

#include "ws2811.h"
#include "animations.h"

#include <time.h>
#include <sys/time.h>
#include <unordered_map>

static uint8_t running = 1;
int clear_on_exit = 0;

#define SERVOS                  7
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
int switch_interval = 20;  // Switch every 5 seconds

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
                   int acc) {
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


bool checkIfPositionsReached(const int32_t goal_position[], const int32_t present_position[], size_t size)
{
  bool reached = true;
  for (size_t i = 0; i < size; ++i)
  {
    long delta = std::abs(goal_position[i] - present_position[i]);
    if (delta > 30)
    {
      reached = false;
    }
  }
  printf("\n");
  return reached;
}

enum class TransitionState {
  NONE,
  TRANSITIONING
};

class AnimationPlayer {
  private:
    std::unordered_map<AnimationType, AnimationContext> animations;
    AnimationContext *current_animation;
    AnimationContext *transition_animation = nullptr;
    AnimationContext *next_animation;
    std::vector<AnimationType> animation_sequence;
    size_t current_animation_index;
    int num_frames = FPS*10;
    TransitionState transition_state = TransitionState::NONE;
  public:
    // Constructor
    AnimationPlayer() {

    initializeLEDs();
        // Create all the animations
    AnimationContext rotating_frames = {
      .frames = NULL,
      .frame_count = 0,
      .current_frame = 0,
      .direction = 1
    };

    make_rotating_frames(&rotating_frames,num_frames);
    animations[AnimationType::ROTATING_FRAMES] = rotating_frames;
    animation_sequence.push_back(AnimationType::ROTATING_FRAMES);

    AnimationContext growing_ellipse_frames = {
      .frames = NULL,
      .frame_count = 0,
      .current_frame = 0,
      .direction = 1
    };

    make_growing_ellipse(&growing_ellipse_frames,num_frames);
    animations[AnimationType::GROWING_ELLIPSE] = growing_ellipse_frames;
    animation_sequence.push_back(AnimationType::GROWING_ELLIPSE);

    AnimationContext surface_spectrum_frames = {
      .frames = NULL,
      .frame_count = 0,
      .current_frame = 0,
      .direction = 1
    };

    make_color_spectrum(&surface_spectrum_frames, 10*num_frames);
    animations[AnimationType::SURFACE_SPECTRUM] = surface_spectrum_frames;
    animation_sequence.push_back(AnimationType::SURFACE_SPECTRUM);


    AnimationContext side_wave_frames = {
      .frames = NULL,
      .frame_count = 0,
      .current_frame = 0,
      .direction = 1
    };

    // make_side_waves(&side_wave_frames,num_frames);
    // animations[AnimationType::SIDE_WAVE] = side_wave_frames;

    // animation_sequence.push_back(AnimationType::SIDE_WAVE);

        // Initialize current and next animations
    current_animation = &animations[animation_sequence[current_animation_index]];
    }

    void nextAnimation() {
        // Increment the index and wrap around if necessary
        current_animation_index = (current_animation_index + 1) % animation_sequence.size();

        // Switch to the next animation
        next_animation = &animations[animation_sequence[current_animation_index]];
        if (transition_animation == nullptr) {
            transition_animation = new AnimationContext;
            transition_animation->frames = NULL;
            transition_animation->frame_count = 0;
            transition_animation->current_frame = 0;
            transition_animation->direction = 1;
        } else {
          for (int i = 0; i < transition_animation->frame_count; ++i) {
            if (transition_animation->frames[i] != NULL) {
              cairo_surface_destroy(transition_animation->frames[i]);  // Replace with your specific deallocation function
            }
          }
          free(transition_animation->frames);  // Use free() since realloc was used for allocation
          transition_animation = new AnimationContext;  // or however you create a new AnimationContext
          transition_animation->frames = NULL;
          transition_animation->frame_count = 0;
          transition_animation->current_frame = 0;
          transition_animation->direction = 1;
        }

        smooth_interpolate_to_new_frames(current_animation, next_animation, transition_animation, 2*FPS);
        current_animation = next_animation;
        transition_state = TransitionState::TRANSITIONING;
    }

    void play () {
      if (transition_state == TransitionState::TRANSITIONING){

        int frame_no = transition_animation->current_frame;

        transition_animation->current_frame++;
        if (transition_animation->current_frame >= transition_animation->frame_count - 1) {
          transition_state = TransitionState::NONE;
        } else {
          send_frame_to_neopixels(transition_animation->frames[transition_animation->current_frame], &ledstring);
        }
      }
      else
      {
        // Send current animation
        send_frame_to_neopixels(current_animation->frames[current_animation->current_frame], &ledstring);

        current_animation->current_frame += current_animation->direction;
        /* printf("moved to frame: %d", current_animation.current_frame); */
        if (current_animation->current_frame >= current_animation->frame_count - 1 || current_animation->current_frame <= 0) {
          current_animation->direction *= -1;  // Reverse direction
        }
      }

    }
};


class ServoPlayer {
private:
    const char *port_name;
    int baud_rate;
    int vel, acc;
    uint16_t model_number;
    uint8_t dxl_id[SERVOS];
    DynamixelWorkbench dxl_wb;
    int32_t positions1[SERVOS];
    int32_t positions2[SERVOS];
    int32_t goal_positions[SERVOS];
    int32_t present_positions[SERVOS];
    int current_goal_pos;

public:
    ServoPlayer(int velocity, int acceleration)
      : port_name("/dev/ttyUSB0"), baud_rate(3000000),
        vel(velocity), acc(acceleration), model_number(1200), current_goal_pos(2) {

        dxl_id[0] = 0; dxl_id[1] = 1; dxl_id[2] = 2; dxl_id[3] = 3;
        dxl_id[4] = 4; dxl_id[5] = 5; dxl_id[6] = 6;

        positions1[0] = 100000; positions1[1] = -300000; positions1[2] = -210230;
        positions1[3] = -102300; positions1[4] = 204800; positions1[5] = 120470; positions1[6] = 32047;

        positions2[0] = -320470; positions2[1] = -120470; positions2[2] = -204800;
        positions2[3] = 102300; positions2[4] = 210230; positions2[5] = 300000; positions2[6] = -10000;

        for (int i = 0; i < SERVOS; ++i) {
            present_positions[i] = 0;
        }

        const char *log;
        if (!initializeServos()) {
            printf("Failed to initialized some or all settings");
            exit(0);  // Exit if the initialization failed
        }
    }

    bool initializeServos() {
        const char *log;
        return ::initializeServos(dxl_wb, port_name, baud_rate, dxl_id, vel, acc);
    }

    void updateGoalPositions() {
      const char *log;
      const uint8_t handler_index = 0;
      syncWritePosition(dxl_wb, handler_index, &goal_positions[0], &log);
        bool reached = checkIfPositionsReached(goal_positions, present_positions, SERVOS);
        if (reached) {
            if (current_goal_pos == 1) {
                std::copy(std::begin(positions2), std::end(positions2), std::begin(goal_positions));
                current_goal_pos = 2;
            } else if (current_goal_pos == 2) {
                std::copy(std::begin(positions1), std::end(positions1), std::begin(goal_positions));
                current_goal_pos = 1;
            }
        }
    }

    void bulkReadPositions() {
        const char *log;
        bulkReadPosition(dxl_wb, present_positions, &log);
    }

};

int main(int argc, char *argv[])
{
  const char* port_name = "/dev/ttyUSB0";
  int baud_rate = 3000000;

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

  ServoPlayer servoPlayer(vel, acc);
  AnimationPlayer *anim = new AnimationPlayer();

  anim->play();

  //LEDS
  struct timeval start_time, current_time;
  gettimeofday(&start_time, NULL);

  while(running)
  {
     gettimeofday(&current_time, NULL);
     elapsed_seconds = current_time.tv_sec - start_time.tv_sec;
     // Check if 5 seconds have passed
     if (elapsed_seconds - last_switch >= switch_interval) {
       last_switch = elapsed_seconds;
       anim->nextAnimation();
     }
     anim->play();

     auto servo_time = std::chrono::high_resolution_clock::now();
     servoPlayer.updateGoalPositions();
     auto servo_write_time = std::chrono::high_resolution_clock::now();
     servoPlayer.bulkReadPositions();
     auto servo_read_time = std::chrono::high_resolution_clock::now();

     // Calculate the duration for each operation
     auto write_duration = std::chrono::duration_cast<std::chrono::microseconds>(servo_write_time - servo_time);
     auto read_duration = std::chrono::duration_cast<std::chrono::microseconds>(servo_read_time - servo_write_time);

     // Print the durations
     printf("syncWrite took %lld microseconds\n", write_duration.count());
     printf("syncRead took %lld microseconds\n", read_duration.count());

     // Calculate remaining time for usleep
     auto total_duration = write_duration + read_duration;
     auto remaining_time = std::chrono::microseconds(FRAME_DURATION) - total_duration;

     printf("total took %lld microseconds\n", total_duration.count());
     printf("sleep for: %lld microseconds\n", remaining_time.count());

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
