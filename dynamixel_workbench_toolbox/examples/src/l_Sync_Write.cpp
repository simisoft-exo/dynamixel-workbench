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
#include "ws2811.h"

void swap(int32_t *array);

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

  result = dxl_wb.init(port_name, baud_rate, &log);
  if (result == false)
  {
    printf("%s\n", log);
    printf("Failed to init\n");

    return 0;
  }
  else
    printf("Succeed to init(%d)\n", baud_rate);  

  for (int cnt = 0; cnt < SERVOS; cnt++)
  {
    result = dxl_wb.ping(dxl_id[cnt], &model_number, &log);
    if (result == false)
    {
      printf("%s\n", log);
      printf("Failed to ping\n");
    }
    else
    {
      printf("Succeeded to ping\n");
      printf("id : %d, model_number : %d\n", dxl_id[cnt], model_number);
    }

    result = dxl_wb.multiJointMode(dxl_id[cnt], vel, acc, &log);
    if (result == false)
    {
      printf("%s\n", log);
      printf("Failed to change to multi joint mode\n");
    }
    else
    {
      printf("Succeed to change to multi joint mode\n");
    }
  }

  result = dxl_wb.addSyncWriteHandler(dxl_id[0], "Goal_Position", &log);
  if (result == false)
  {
    printf("%s\n", log);
    printf("Failed to add sync write handler\n");
  }

  result = dxl_wb.addSyncReadHandler(dxl_id[0], "Present_Position", &log);
  if (result == false)
  {
    printf("%s\n", log);
    printf("Failed to add sync read handler\n");
  }

  int32_t goal_position[SERVOS] = {0, -30000, -1023, -1023*10, 2048*10, 2047, 2047};
  // int32_t goal_position[SERVOS] = {2047, 2047, 3072, 3072, 3072, 0, 0};

  int32_t present_position[SERVOS] = {0, 0, 0, 0, 0, 0, 0};

  const uint8_t handler_index = 0;
  
  while(1)
  {
    result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
    if (result == false)
    {
      printf("%s\n", log);
      printf("Failed to sync write position\n");
    }
        result = dxl_wb.syncRead(handler_index, &log);
    if (result == false)
    {
      printf("%s\n", log);
      printf("Failed to sync read position\n");
    }

    result = dxl_wb.getSyncReadData(handler_index, &present_position[0], &log);
    if (result == false)
    {
      printf("%s\n", log);
    }
    else
    {
      for (int cnt = 0; cnt < SERVOS; cnt++)
        printf("[%d]G:%d P%d  ", cnt, goal_position[cnt], present_position[cnt]);
      printf("\n");
    }

  }

  return 0;
}

