/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    tim.h
  * @brief   This file contains all the function prototypes for
  *          the tim.c file
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __TIM_H__
#define __TIM_H__

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* USER CODE BEGIN Includes */

#define GET_CLOCK_COUNT(TIMx) 	TIMx.Instance->CNT
#define SET_CLOCK(TIMx,VAL) 	TIMx.Instance->CNT = VAL


#define TIMER_INTERRUPT						htim3

#define ti_set_prescaler(htim, value)       htim.Init.Prescaler = value;\
											HAL_TIM_Base_Init(&htim);

#define ti_start_timer_interrupt(htim) 		HAL_TIM_Base_Start(&htim);\
									   		HAL_TIM_Base_Start_IT(&htim)

#define ti_stop_timer_interrupt(htim) 		HAL_TIM_Base_Stop(&htim);\
											HAL_TIM_Base_Stop_IT(&htim)

#define ti_set_timer_counter(htim,val) 		htim.Instance->CNT = val

#define ti_reset_timer_counter(htim) 		htim.Instance->CNT = 0

#define ti_set_period(htim,val) 			htim.Instance->ARR = val % 65535

//#define ti_set_prescaler(htim,val) 			htim.Instance->Prescaler = val

/* USER CODE END Includes */

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

void MX_TIM3_Init(void);
void ti_syncDebbugTimer();

/* USER CODE BEGIN Prototypes */

/* USER CODE END Prototypes */

#ifdef __cplusplus
}
#endif

#endif /* __TIM_H__ */

