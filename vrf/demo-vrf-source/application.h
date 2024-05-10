#ifndef __APPLICATION_H
#define __APPLICATION_H


#define BASIC			0 //

#define ULT				1 //
#define TEMP			2 //
#define SYRINGE			3 //
#define GEIGER			4 //
#define GPS				5 //

#define SEARCH			6 //
#define DUFF			7 //
#define PRIME			8 //

#define DIJKSTRA		76 //
#define HAMMING			78
#define ATTACK			79
#define MOUSE			710

#define CRC32			9 //
#define LIBBS			10 //
#define FIBCALL			11  //
#define COVER			12  //
#define LCDNUM			13  //
#define JFDCTINT	    14  //
#define AHA_COMPRESS	15 ///


#define APP_SEL 		LIBBS

#include "stdint.h"

#if APP_SEL == BASIC
void func();
#endif

#if APP_SEL == SYRINGE

uint16_t sensor = 0xa5;

#define false  0
#define true   1

// Syringe pump
/* -- Constants -- */
#define SYRINGE_VOLUME_ML 50.0
#define SYRINGE_BARREL_LENGTH_MM 8.0

#define THREADED_ROD_PITCH 1.25
#define STEPS_PER_REVOLUTION 4.0
#define MICROSTEPS_PER_STEP 16.0

#define SPEED_MICROSECONDS_DELAY 100
#define TIME_BETWEEN_INJECTIONS  1000
#define TOTAL_INJECTIONS		 3

#define LED_OUT_PIN 0

void delay(uint32_t);
char getserialinput(uint8_t);
#endif // Syringe

#if APP_SEL == TEMP
uint16_t sensor = 0xa5;

#define TEMP_PIN		0x02
#define MAX_READINGS	83
#define P2OUT		sensor
#define P2IN		sensor

void delay(uint32_t us);
void read_data();
uint16_t get_temperature();
uint16_t get_humidity();

#endif // TMP

#if APP_SEL == ULT
#define ULT_PIN         0x02
#define MAX_DURATION    1000

#define P2OUT		sensor
#define P2IN		sensor
#define P2DIR		sensor

void delay(uint32_t us);
uint32_t pulseIn(void);
uint32_t getUltrasonicReading(void);

#endif//ult

#if APP_SEL == ATTACK
void delay(unsigned int);
void read_data(void);
uint16_t get_temperature(void);
uint16_t get_humidity(void);
uint32_t pulseIn(void);
long getUltrasonicReading(void);
long run_ultrasonic(int);
long run_temperature(int);
long run_humidity(int);
void process_command(void);
int record_output_data(char data);
#endif

#if APP_SEL == JFDCTINT
#define DCT_ISLOW_SUPPORTED
#define DCTSIZE 8
#define BITS_IN_JSAMPLE 8
#define MULTIPLY16C16(var,const)  ((var) * (const))
#define DCTELEM int
#define INT32   int
#define GLOBAL
#define RIGHT_SHIFT(x,shft)	((x) >> (shft))
#define ONE	((INT32) 1)
#define DESCALE(x,n)  RIGHT_SHIFT((x) + (ONE << ((n)-1)), n)
#define SHIFT_TEMPS
#define FIX_0_298631336  ((INT32)  2446)	/* FIX(0.298631336) */
#define FIX_0_390180644  ((INT32)  3196)	/* FIX(0.390180644) */
#define FIX_0_541196100  ((INT32)  4433)	/* FIX(0.541196100) */
#define FIX_0_765366865  ((INT32)  6270)	/* FIX(0.765366865) */
#define FIX_0_899976223  ((INT32)  7373)	/* FIX(0.899976223) */
#define FIX_1_175875602  ((INT32)  9633)	/* FIX(1.175875602) */
#define FIX_1_501321110  ((INT32)  12299)	/* FIX(1.501321110) */
#define FIX_1_847759065  ((INT32)  15137)	/* FIX(1.847759065) */
#define FIX_1_961570560  ((INT32)  16069)	/* FIX(1.961570560) */
#define FIX_2_053119869  ((INT32)  16819)	/* FIX(2.053119869) */
#define FIX_2_562915447  ((INT32)  20995)	/* FIX(2.562915447) */
#define FIX_3_072711026  ((INT32)  25172)	/* FIX(3.072711026) */
// bits_in_jsample == 8
#define CONST_BITS  13
#define PASS1_BITS  2
#define MULTIPLY(var,const)  MULTIPLY16C16(var,const)
//else
// #define CONST_BITS  13
// #define PASS1_BITS  1		/* lose a little precision to avoid overflow */
// #define MULTIPLY(var,const)  ((var) * (const))
#endif

void application();

#endif /* __APPLICATION_H */