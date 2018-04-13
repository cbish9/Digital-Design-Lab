   1              		.syntax unified
   2              		.cpu cortex-m0
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 0
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.syntax unified
  15              		.file	"main.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.section	.rodata
  20              		.align	2
  23              	LPC_GPIO:
  24 0000 00000050 		.word	1342177280
  25 0004 00000150 		.word	1342242816
  26 0008 00000250 		.word	1342308352
  27 000c 00000350 		.word	1342373888
  28              		.comm	digit,4,4
  29              		.comm	value,4,4
  30              		.comm	dig1,4,4
  31              		.comm	dig2,4,4
  32              		.comm	dig3,4,4
  33              		.comm	dig4,4,4
  34              		.comm	size,4,4
  35              		.comm	size1,4,4
  36              		.comm	size2,4,4
  37              		.comm	size3,4,4
  38              		.comm	size4,4,4
  39              		.bss
  40              		.align	2
  41              	loop:
  42 0000 00000000 		.space	4
  43              		.section	.text.delay,"ax",%progbits
  44              		.align	2
  45              		.global	delay
  46              		.code	16
  47              		.thumb_func
  49              	delay:
  50              	.LFB20:
  51              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "driver_config.h"
   2:../src/main.c **** #include "target_config.h"
   3:../src/main.c **** #include "timer32.h"
   4:../src/main.c **** #include "gpio.h"
   5:../src/main.c **** #include <math.h>
   6:../src/main.c **** #include <string.h>
   7:../src/main.c **** 
   8:../src/main.c **** /* Main Program */
   9:../src/main.c **** 
  10:../src/main.c **** extern int fibonacci_asm(int z);
  11:../src/main.c **** int digit; // number of digits
  12:../src/main.c **** int value; //for switch table
  13:../src/main.c **** int dig1;
  14:../src/main.c **** int dig2;
  15:../src/main.c **** int dig3;
  16:../src/main.c **** int dig4;
  17:../src/main.c **** 
  18:../src/main.c **** int size;
  19:../src/main.c **** int size1;
  20:../src/main.c **** int size2;
  21:../src/main.c **** int size3;
  22:../src/main.c **** int size4;
  23:../src/main.c **** 
  24:../src/main.c **** volatile static int loop = 0;
  25:../src/main.c **** 
  26:../src/main.c **** void delay(int time){
  52              		.loc 1 26 0
  53              		.cfi_startproc
  54              		@ args = 0, pretend = 0, frame = 8
  55              		@ frame_needed = 1, uses_anonymous_args = 0
  56 0000 80B5     		push	{r7, lr}
  57              		.cfi_def_cfa_offset 8
  58              		.cfi_offset 7, -8
  59              		.cfi_offset 14, -4
  60 0002 82B0     		sub	sp, sp, #8
  61              		.cfi_def_cfa_offset 16
  62 0004 00AF     		add	r7, sp, #0
  63              		.cfi_def_cfa_register 7
  64 0006 7860     		str	r0, [r7, #4]
  27:../src/main.c ****         timer32_0_counter = 0;
  65              		.loc 1 27 0
  66 0008 0A4B     		ldr	r3, .L4
  67 000a 0022     		movs	r2, #0
  68 000c 1A60     		str	r2, [r3]
  28:../src/main.c ****         while(timer32_0_counter < time){
  69              		.loc 1 28 0
  70 000e 04E0     		b	.L2
  71              	.L3:
  29:../src/main.c ****                 loop++;
  72              		.loc 1 29 0
  73 0010 094B     		ldr	r3, .L4+4
  74 0012 1B68     		ldr	r3, [r3]
  75 0014 5A1C     		adds	r2, r3, #1
  76 0016 084B     		ldr	r3, .L4+4
  77 0018 1A60     		str	r2, [r3]
  78              	.L2:
  28:../src/main.c ****         while(timer32_0_counter < time){
  79              		.loc 1 28 0
  80 001a 064B     		ldr	r3, .L4
  81 001c 1A68     		ldr	r2, [r3]
  82 001e 7B68     		ldr	r3, [r7, #4]
  83 0020 9A42     		cmp	r2, r3
  84 0022 F5D3     		bcc	.L3
  30:../src/main.c ****         }
  31:../src/main.c ****         timer32_0_counter = 0;
  85              		.loc 1 31 0
  86 0024 034B     		ldr	r3, .L4
  87 0026 0022     		movs	r2, #0
  88 0028 1A60     		str	r2, [r3]
  32:../src/main.c **** }
  89              		.loc 1 32 0
  90 002a C046     		nop
  91 002c BD46     		mov	sp, r7
  92 002e 02B0     		add	sp, sp, #8
  93              		@ sp needed
  94 0030 80BD     		pop	{r7, pc}
  95              	.L5:
  96 0032 C046     		.align	2
  97              	.L4:
  98 0034 00000000 		.word	timer32_0_counter
  99 0038 00000000 		.word	loop
 100              		.cfi_endproc
 101              	.LFE20:
 103              		.section	.text.display,"ax",%progbits
 104              		.align	2
 105              		.global	display
 106              		.code	16
 107              		.thumb_func
 109              	display:
 110              	.LFB21:
  33:../src/main.c **** 
  34:../src/main.c **** void display(int number[], int digits_hex){
 111              		.loc 1 34 0
 112              		.cfi_startproc
 113              		@ args = 0, pretend = 0, frame = 16
 114              		@ frame_needed = 1, uses_anonymous_args = 0
 115 0000 80B5     		push	{r7, lr}
 116              		.cfi_def_cfa_offset 8
 117              		.cfi_offset 7, -8
 118              		.cfi_offset 14, -4
 119 0002 84B0     		sub	sp, sp, #16
 120              		.cfi_def_cfa_offset 24
 121 0004 00AF     		add	r7, sp, #0
 122              		.cfi_def_cfa_register 7
 123 0006 7860     		str	r0, [r7, #4]
 124 0008 3960     		str	r1, [r7]
 125              	.LBB2:
  35:../src/main.c ****         for(int m=0; m < digits_hex; m++){
 126              		.loc 1 35 0
 127 000a 0023     		movs	r3, #0
 128 000c FB60     		str	r3, [r7, #12]
 129 000e 35E0     		b	.L7
 130              	.L10:
  36:../src/main.c ****                 GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
 131              		.loc 1 36 0
 132 0010 0122     		movs	r2, #1
 133 0012 0721     		movs	r1, #7
 134 0014 0020     		movs	r0, #0
 135 0016 FFF7FEFF 		bl	GPIOSetValue
  37:../src/main.c ****                 if(number[m] == 0){
 136              		.loc 1 37 0
 137 001a FB68     		ldr	r3, [r7, #12]
 138 001c 9B00     		lsls	r3, r3, #2
 139 001e 7A68     		ldr	r2, [r7, #4]
 140 0020 D318     		adds	r3, r2, r3
 141 0022 1B68     		ldr	r3, [r3]
 142 0024 002B     		cmp	r3, #0
 143 0026 10D1     		bne	.L8
  38:../src/main.c ****                         delay(5);
 144              		.loc 1 38 0
 145 0028 0520     		movs	r0, #5
 146 002a FFF7FEFF 		bl	delay
  39:../src/main.c ****                         GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_ON );
 147              		.loc 1 39 0
 148 002e 0022     		movs	r2, #0
 149 0030 0721     		movs	r1, #7
 150 0032 0020     		movs	r0, #0
 151 0034 FFF7FEFF 		bl	GPIOSetValue
  40:../src/main.c ****                         delay(10);
 152              		.loc 1 40 0
 153 0038 0A20     		movs	r0, #10
 154 003a FFF7FEFF 		bl	delay
  41:../src/main.c ****                         GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
 155              		.loc 1 41 0
 156 003e 0122     		movs	r2, #1
 157 0040 0721     		movs	r1, #7
 158 0042 0020     		movs	r0, #0
 159 0044 FFF7FEFF 		bl	GPIOSetValue
 160 0048 0FE0     		b	.L9
 161              	.L8:
  42:../src/main.c ****                 }else{
  43:../src/main.c ****                         delay(5);
 162              		.loc 1 43 0
 163 004a 0520     		movs	r0, #5
 164 004c FFF7FEFF 		bl	delay
  44:../src/main.c ****                         GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_ON );
 165              		.loc 1 44 0
 166 0050 0022     		movs	r2, #0
 167 0052 0721     		movs	r1, #7
 168 0054 0020     		movs	r0, #0
 169 0056 FFF7FEFF 		bl	GPIOSetValue
  45:../src/main.c ****                         delay(30);
 170              		.loc 1 45 0
 171 005a 1E20     		movs	r0, #30
 172 005c FFF7FEFF 		bl	delay
  46:../src/main.c ****                         GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
 173              		.loc 1 46 0
 174 0060 0122     		movs	r2, #1
 175 0062 0721     		movs	r1, #7
 176 0064 0020     		movs	r0, #0
 177 0066 FFF7FEFF 		bl	GPIOSetValue
 178              	.L9:
  47:../src/main.c ****                 }
  48:../src/main.c ****                 //Delay in between digits
  49:../src/main.c ****                 m++;
 179              		.loc 1 49 0 discriminator 2
 180 006a FB68     		ldr	r3, [r7, #12]
 181 006c 0133     		adds	r3, r3, #1
 182 006e FB60     		str	r3, [r7, #12]
  50:../src/main.c ****                 delay(5);
 183              		.loc 1 50 0 discriminator 2
 184 0070 0520     		movs	r0, #5
 185 0072 FFF7FEFF 		bl	delay
  35:../src/main.c ****                 GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
 186              		.loc 1 35 0 discriminator 2
 187 0076 FB68     		ldr	r3, [r7, #12]
 188 0078 0133     		adds	r3, r3, #1
 189 007a FB60     		str	r3, [r7, #12]
 190              	.L7:
  35:../src/main.c ****                 GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
 191              		.loc 1 35 0 is_stmt 0 discriminator 1
 192 007c FA68     		ldr	r2, [r7, #12]
 193 007e 3B68     		ldr	r3, [r7]
 194 0080 9A42     		cmp	r2, r3
 195 0082 C5DB     		blt	.L10
 196              	.LBE2:
  51:../src/main.c ****         }
  52:../src/main.c ****         GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
 197              		.loc 1 52 0 is_stmt 1
 198 0084 0122     		movs	r2, #1
 199 0086 0721     		movs	r1, #7
 200 0088 0020     		movs	r0, #0
 201 008a FFF7FEFF 		bl	GPIOSetValue
  53:../src/main.c ****         GPIOSetValue( LED_PORT_B, LED_BIT_B, LED_ON );
 202              		.loc 1 53 0
 203 008e 0022     		movs	r2, #0
 204 0090 0921     		movs	r1, #9
 205 0092 0020     		movs	r0, #0
 206 0094 FFF7FEFF 		bl	GPIOSetValue
  54:../src/main.c ****         // Slight Delay
  55:../src/main.c ****         delay(5);
 207              		.loc 1 55 0
 208 0098 0520     		movs	r0, #5
 209 009a FFF7FEFF 		bl	delay
  56:../src/main.c ****         GPIOSetValue( LED_PORT_B, LED_BIT_B, LED_OFF );
 210              		.loc 1 56 0
 211 009e 0122     		movs	r2, #1
 212 00a0 0921     		movs	r1, #9
 213 00a2 0020     		movs	r0, #0
 214 00a4 FFF7FEFF 		bl	GPIOSetValue
  57:../src/main.c **** }
 215              		.loc 1 57 0
 216 00a8 C046     		nop
 217 00aa BD46     		mov	sp, r7
 218 00ac 04B0     		add	sp, sp, #16
 219              		@ sp needed
 220 00ae 80BD     		pop	{r7, pc}
 221              		.cfi_endproc
 222              	.LFE21:
 224              		.section	.text.translateFib,"ax",%progbits
 225              		.align	2
 226              		.global	translateFib
 227              		.code	16
 228              		.thumb_func
 230              	translateFib:
 231              	.LFB22:
  58:../src/main.c **** 
  59:../src/main.c **** 
  60:../src/main.c **** 
  61:../src/main.c **** void translateFib(int fibNum){
 232              		.loc 1 61 0
 233              		.cfi_startproc
 234              		@ args = 0, pretend = 0, frame = 8
 235              		@ frame_needed = 1, uses_anonymous_args = 0
 236 0000 80B5     		push	{r7, lr}
 237              		.cfi_def_cfa_offset 8
 238              		.cfi_offset 7, -8
 239              		.cfi_offset 14, -4
 240 0002 82B0     		sub	sp, sp, #8
 241              		.cfi_def_cfa_offset 16
 242 0004 00AF     		add	r7, sp, #0
 243              		.cfi_def_cfa_register 7
 244 0006 7860     		str	r0, [r7, #4]
  62:../src/main.c **** 	//switch table
  63:../src/main.c **** 	switch(value){
 245              		.loc 1 63 0
 246 0008 734B     		ldr	r3, .L40
 247 000a 1B68     		ldr	r3, [r3]
 248 000c 0F2B     		cmp	r3, #15
 249 000e 64D8     		bhi	.L12
 250 0010 9A00     		lsls	r2, r3, #2
 251 0012 724B     		ldr	r3, .L40+4
 252 0014 D318     		adds	r3, r2, r3
 253 0016 1B68     		ldr	r3, [r3]
 254 0018 9F46     		mov	pc, r3
 255              		.section	.rodata
 256              		.align	2
 257              	.L14:
 258 0010 1A000000 		.word	.L13
 259 0014 26000000 		.word	.L15
 260 0018 32000000 		.word	.L16
 261 001c 3E000000 		.word	.L17
 262 0020 4A000000 		.word	.L18
 263 0024 56000000 		.word	.L19
 264 0028 62000000 		.word	.L20
 265 002c 6E000000 		.word	.L21
 266 0030 7A000000 		.word	.L22
 267 0034 86000000 		.word	.L23
 268 0038 92000000 		.word	.L24
 269 003c 9E000000 		.word	.L25
 270 0040 AA000000 		.word	.L26
 271 0044 B6000000 		.word	.L27
 272 0048 C2000000 		.word	.L28
 273 004c CE000000 		.word	.L29
 274              		.section	.text.translateFib
 275              	.L13:
  64:../src/main.c **** 			case 0: {value = 0b11111;
 276              		.loc 1 64 0
 277 001a 6F4B     		ldr	r3, .L40
 278 001c 1F22     		movs	r2, #31
 279 001e 1A60     		str	r2, [r3]
  65:../src/main.c **** 				size = 5;}
 280              		.loc 1 65 0
 281 0020 6F4B     		ldr	r3, .L40+8
 282 0022 0522     		movs	r2, #5
 283 0024 1A60     		str	r2, [r3]
 284              	.L15:
  66:../src/main.c **** 			case 1: {value = 0b01111;
 285              		.loc 1 66 0
 286 0026 6C4B     		ldr	r3, .L40
 287 0028 0F22     		movs	r2, #15
 288 002a 1A60     		str	r2, [r3]
  67:../src/main.c **** 				size =5;}
 289              		.loc 1 67 0
 290 002c 6C4B     		ldr	r3, .L40+8
 291 002e 0522     		movs	r2, #5
 292 0030 1A60     		str	r2, [r3]
 293              	.L16:
  68:../src/main.c **** 			case 2: {value = 0b00111;
 294              		.loc 1 68 0
 295 0032 694B     		ldr	r3, .L40
 296 0034 0722     		movs	r2, #7
 297 0036 1A60     		str	r2, [r3]
  69:../src/main.c **** 				size =5;}
 298              		.loc 1 69 0
 299 0038 694B     		ldr	r3, .L40+8
 300 003a 0522     		movs	r2, #5
 301 003c 1A60     		str	r2, [r3]
 302              	.L17:
  70:../src/main.c **** 			case 3: {value = 0b00011;
 303              		.loc 1 70 0
 304 003e 664B     		ldr	r3, .L40
 305 0040 0322     		movs	r2, #3
 306 0042 1A60     		str	r2, [r3]
  71:../src/main.c **** 				size =5;}
 307              		.loc 1 71 0
 308 0044 664B     		ldr	r3, .L40+8
 309 0046 0522     		movs	r2, #5
 310 0048 1A60     		str	r2, [r3]
 311              	.L18:
  72:../src/main.c **** 			case 4: {value = 0b00001;
 312              		.loc 1 72 0
 313 004a 634B     		ldr	r3, .L40
 314 004c 0122     		movs	r2, #1
 315 004e 1A60     		str	r2, [r3]
  73:../src/main.c **** 				size =5;}
 316              		.loc 1 73 0
 317 0050 634B     		ldr	r3, .L40+8
 318 0052 0522     		movs	r2, #5
 319 0054 1A60     		str	r2, [r3]
 320              	.L19:
  74:../src/main.c **** 			case 5: {value = 0b00000;
 321              		.loc 1 74 0
 322 0056 604B     		ldr	r3, .L40
 323 0058 0022     		movs	r2, #0
 324 005a 1A60     		str	r2, [r3]
  75:../src/main.c **** 				size =5;}
 325              		.loc 1 75 0
 326 005c 604B     		ldr	r3, .L40+8
 327 005e 0522     		movs	r2, #5
 328 0060 1A60     		str	r2, [r3]
 329              	.L20:
  76:../src/main.c **** 			case 6: {value = 0b10000;
 330              		.loc 1 76 0
 331 0062 5D4B     		ldr	r3, .L40
 332 0064 1022     		movs	r2, #16
 333 0066 1A60     		str	r2, [r3]
  77:../src/main.c **** 				size =5;}
 334              		.loc 1 77 0
 335 0068 5D4B     		ldr	r3, .L40+8
 336 006a 0522     		movs	r2, #5
 337 006c 1A60     		str	r2, [r3]
 338              	.L21:
  78:../src/main.c **** 			case 7: {value = 0b11000;
 339              		.loc 1 78 0
 340 006e 5A4B     		ldr	r3, .L40
 341 0070 1822     		movs	r2, #24
 342 0072 1A60     		str	r2, [r3]
  79:../src/main.c **** 				size =5;}
 343              		.loc 1 79 0
 344 0074 5A4B     		ldr	r3, .L40+8
 345 0076 0522     		movs	r2, #5
 346 0078 1A60     		str	r2, [r3]
 347              	.L22:
  80:../src/main.c **** 			case 8: {value = 0b11100;
 348              		.loc 1 80 0
 349 007a 574B     		ldr	r3, .L40
 350 007c 1C22     		movs	r2, #28
 351 007e 1A60     		str	r2, [r3]
  81:../src/main.c **** 				size =5;}
 352              		.loc 1 81 0
 353 0080 574B     		ldr	r3, .L40+8
 354 0082 0522     		movs	r2, #5
 355 0084 1A60     		str	r2, [r3]
 356              	.L23:
  82:../src/main.c **** 			case 9: {value =0b11110;
 357              		.loc 1 82 0
 358 0086 544B     		ldr	r3, .L40
 359 0088 1E22     		movs	r2, #30
 360 008a 1A60     		str	r2, [r3]
  83:../src/main.c **** 				size = 5;}
 361              		.loc 1 83 0
 362 008c 544B     		ldr	r3, .L40+8
 363 008e 0522     		movs	r2, #5
 364 0090 1A60     		str	r2, [r3]
 365              	.L24:
  84:../src/main.c **** 			case 10: {value =0b01;
 366              		.loc 1 84 0
 367 0092 514B     		ldr	r3, .L40
 368 0094 0122     		movs	r2, #1
 369 0096 1A60     		str	r2, [r3]
  85:../src/main.c **** 				size = 2;}
 370              		.loc 1 85 0
 371 0098 514B     		ldr	r3, .L40+8
 372 009a 0222     		movs	r2, #2
 373 009c 1A60     		str	r2, [r3]
 374              	.L25:
  86:../src/main.c **** 			case 11: {value = 0b1000;
 375              		.loc 1 86 0
 376 009e 4E4B     		ldr	r3, .L40
 377 00a0 0822     		movs	r2, #8
 378 00a2 1A60     		str	r2, [r3]
  87:../src/main.c **** 				size = 4;}
 379              		.loc 1 87 0
 380 00a4 4E4B     		ldr	r3, .L40+8
 381 00a6 0422     		movs	r2, #4
 382 00a8 1A60     		str	r2, [r3]
 383              	.L26:
  88:../src/main.c **** 			case 12: {value = 0b1010;
 384              		.loc 1 88 0
 385 00aa 4B4B     		ldr	r3, .L40
 386 00ac 0A22     		movs	r2, #10
 387 00ae 1A60     		str	r2, [r3]
  89:../src/main.c **** 				size = 4;}
 388              		.loc 1 89 0
 389 00b0 4B4B     		ldr	r3, .L40+8
 390 00b2 0422     		movs	r2, #4
 391 00b4 1A60     		str	r2, [r3]
 392              	.L27:
  90:../src/main.c **** 			case 13: {value = 0b100;
 393              		.loc 1 90 0
 394 00b6 484B     		ldr	r3, .L40
 395 00b8 0422     		movs	r2, #4
 396 00ba 1A60     		str	r2, [r3]
  91:../src/main.c **** 				size = 3;}
 397              		.loc 1 91 0
 398 00bc 484B     		ldr	r3, .L40+8
 399 00be 0322     		movs	r2, #3
 400 00c0 1A60     		str	r2, [r3]
 401              	.L28:
  92:../src/main.c **** 			case 14: {value = 0b0;
 402              		.loc 1 92 0
 403 00c2 454B     		ldr	r3, .L40
 404 00c4 0022     		movs	r2, #0
 405 00c6 1A60     		str	r2, [r3]
  93:../src/main.c **** 				size = 1;}
 406              		.loc 1 93 0
 407 00c8 454B     		ldr	r3, .L40+8
 408 00ca 0122     		movs	r2, #1
 409 00cc 1A60     		str	r2, [r3]
 410              	.L29:
  94:../src/main.c **** 			case 15: {value = 0b0010;
 411              		.loc 1 94 0
 412 00ce 424B     		ldr	r3, .L40
 413 00d0 0222     		movs	r2, #2
 414 00d2 1A60     		str	r2, [r3]
  95:../src/main.c **** 				size = 4;}
 415              		.loc 1 95 0
 416 00d4 424B     		ldr	r3, .L40+8
 417 00d6 0422     		movs	r2, #4
 418 00d8 1A60     		str	r2, [r3]
 419              	.L12:
  96:../src/main.c **** 			}
  97:../src/main.c **** 
  98:../src/main.c **** 	if(fibNum < 0x1000) digit = 4;
 420              		.loc 1 98 0
 421 00da 7B68     		ldr	r3, [r7, #4]
 422 00dc 414A     		ldr	r2, .L40+12
 423 00de 9342     		cmp	r3, r2
 424 00e0 02DC     		bgt	.L30
 425              		.loc 1 98 0 is_stmt 0 discriminator 1
 426 00e2 414B     		ldr	r3, .L40+16
 427 00e4 0422     		movs	r2, #4
 428 00e6 1A60     		str	r2, [r3]
 429              	.L30:
  99:../src/main.c **** 	if(fibNum < 0x100) digit = 3;
 430              		.loc 1 99 0 is_stmt 1
 431 00e8 7B68     		ldr	r3, [r7, #4]
 432 00ea FF2B     		cmp	r3, #255
 433 00ec 02DC     		bgt	.L31
 434              		.loc 1 99 0 is_stmt 0 discriminator 1
 435 00ee 3E4B     		ldr	r3, .L40+16
 436 00f0 0322     		movs	r2, #3
 437 00f2 1A60     		str	r2, [r3]
 438              	.L31:
 100:../src/main.c **** 	if (fibNum < 0x10) digit = 2;
 439              		.loc 1 100 0 is_stmt 1
 440 00f4 7B68     		ldr	r3, [r7, #4]
 441 00f6 0F2B     		cmp	r3, #15
 442 00f8 02DC     		bgt	.L32
 443              		.loc 1 100 0 is_stmt 0 discriminator 1
 444 00fa 3B4B     		ldr	r3, .L40+16
 445 00fc 0222     		movs	r2, #2
 446 00fe 1A60     		str	r2, [r3]
 447              	.L32:
 101:../src/main.c **** 	if (fibNum < 0x1) digit = 1;
 448              		.loc 1 101 0 is_stmt 1
 449 0100 7B68     		ldr	r3, [r7, #4]
 450 0102 002B     		cmp	r3, #0
 451 0104 02DC     		bgt	.L33
 452              		.loc 1 101 0 is_stmt 0 discriminator 1
 453 0106 384B     		ldr	r3, .L40+16
 454 0108 0122     		movs	r2, #1
 455 010a 1A60     		str	r2, [r3]
 456              	.L33:
 102:../src/main.c **** 	if(digit == 1){
 457              		.loc 1 102 0 is_stmt 1
 458 010c 364B     		ldr	r3, .L40+16
 459 010e 1B68     		ldr	r3, [r3]
 460 0110 012B     		cmp	r3, #1
 461 0112 07D1     		bne	.L34
 103:../src/main.c **** 		switch(fibNum);
 104:../src/main.c **** 		dig1 = value;
 462              		.loc 1 104 0
 463 0114 304B     		ldr	r3, .L40
 464 0116 1A68     		ldr	r2, [r3]
 465 0118 344B     		ldr	r3, .L40+20
 466 011a 1A60     		str	r2, [r3]
 105:../src/main.c **** 		size1 = size;
 467              		.loc 1 105 0
 468 011c 304B     		ldr	r3, .L40+8
 469 011e 1A68     		ldr	r2, [r3]
 470 0120 334B     		ldr	r3, .L40+24
 471 0122 1A60     		str	r2, [r3]
 472              	.L34:
 106:../src/main.c **** 	}
 107:../src/main.c **** 	if(digit == 2){
 473              		.loc 1 107 0
 474 0124 304B     		ldr	r3, .L40+16
 475 0126 1B68     		ldr	r3, [r3]
 476 0128 022B     		cmp	r3, #2
 477 012a 0FD1     		bne	.L35
 108:../src/main.c **** 		switch(((fibNum && 0xF0) >> 4));
 109:../src/main.c **** 		dig2 = value;
 478              		.loc 1 109 0
 479 012c 2A4B     		ldr	r3, .L40
 480 012e 1A68     		ldr	r2, [r3]
 481 0130 304B     		ldr	r3, .L40+28
 482 0132 1A60     		str	r2, [r3]
 110:../src/main.c **** 		size2 = size;
 483              		.loc 1 110 0
 484 0134 2A4B     		ldr	r3, .L40+8
 485 0136 1A68     		ldr	r2, [r3]
 486 0138 2F4B     		ldr	r3, .L40+32
 487 013a 1A60     		str	r2, [r3]
 111:../src/main.c **** 		switch(((fibNum && 0x0F)));
 112:../src/main.c **** 		dig1 = value;
 488              		.loc 1 112 0
 489 013c 264B     		ldr	r3, .L40
 490 013e 1A68     		ldr	r2, [r3]
 491 0140 2A4B     		ldr	r3, .L40+20
 492 0142 1A60     		str	r2, [r3]
 113:../src/main.c **** 		size1 = size;
 493              		.loc 1 113 0
 494 0144 264B     		ldr	r3, .L40+8
 495 0146 1A68     		ldr	r2, [r3]
 496 0148 294B     		ldr	r3, .L40+24
 497 014a 1A60     		str	r2, [r3]
 498              	.L35:
 114:../src/main.c **** 	}
 115:../src/main.c **** 	if(digit == 3){
 499              		.loc 1 115 0
 500 014c 264B     		ldr	r3, .L40+16
 501 014e 1B68     		ldr	r3, [r3]
 502 0150 032B     		cmp	r3, #3
 503 0152 17D1     		bne	.L36
 116:../src/main.c **** 		switch(((fibNum && 0xF00)>> 8));
 117:../src/main.c **** 		dig3 = value;
 504              		.loc 1 117 0
 505 0154 204B     		ldr	r3, .L40
 506 0156 1A68     		ldr	r2, [r3]
 507 0158 284B     		ldr	r3, .L40+36
 508 015a 1A60     		str	r2, [r3]
 118:../src/main.c **** 		size3 = size;
 509              		.loc 1 118 0
 510 015c 204B     		ldr	r3, .L40+8
 511 015e 1A68     		ldr	r2, [r3]
 512 0160 274B     		ldr	r3, .L40+40
 513 0162 1A60     		str	r2, [r3]
 119:../src/main.c **** 		switch(((fibNum && 0x0F0) >> 4));
 120:../src/main.c **** 		dig2 = value;
 514              		.loc 1 120 0
 515 0164 1C4B     		ldr	r3, .L40
 516 0166 1A68     		ldr	r2, [r3]
 517 0168 224B     		ldr	r3, .L40+28
 518 016a 1A60     		str	r2, [r3]
 121:../src/main.c **** 		size2 = size;
 519              		.loc 1 121 0
 520 016c 1C4B     		ldr	r3, .L40+8
 521 016e 1A68     		ldr	r2, [r3]
 522 0170 214B     		ldr	r3, .L40+32
 523 0172 1A60     		str	r2, [r3]
 122:../src/main.c **** 		switch(((fibNum && 0x0F)));
 123:../src/main.c **** 		dig1 = value;
 524              		.loc 1 123 0
 525 0174 184B     		ldr	r3, .L40
 526 0176 1A68     		ldr	r2, [r3]
 527 0178 1C4B     		ldr	r3, .L40+20
 528 017a 1A60     		str	r2, [r3]
 124:../src/main.c **** 		size1=size;
 529              		.loc 1 124 0
 530 017c 184B     		ldr	r3, .L40+8
 531 017e 1A68     		ldr	r2, [r3]
 532 0180 1B4B     		ldr	r3, .L40+24
 533 0182 1A60     		str	r2, [r3]
 534              	.L36:
 125:../src/main.c **** 		}
 126:../src/main.c **** 	if(digit == 4){
 535              		.loc 1 126 0
 536 0184 184B     		ldr	r3, .L40+16
 537 0186 1B68     		ldr	r3, [r3]
 538 0188 042B     		cmp	r3, #4
 539 018a 20D1     		bne	.L39
 127:../src/main.c **** 		switch(((fibNum && 0xF000)>>12));
 128:../src/main.c **** 		dig4 = value;
 540              		.loc 1 128 0
 541 018c 124B     		ldr	r3, .L40
 542 018e 1A68     		ldr	r2, [r3]
 543 0190 1C4B     		ldr	r3, .L40+44
 544 0192 1A60     		str	r2, [r3]
 129:../src/main.c **** 		size4 = size;
 545              		.loc 1 129 0
 546 0194 124B     		ldr	r3, .L40+8
 547 0196 1A68     		ldr	r2, [r3]
 548 0198 1B4B     		ldr	r3, .L40+48
 549 019a 1A60     		str	r2, [r3]
 130:../src/main.c **** 		switch(((fibNum && 0xF00)>> 8));
 131:../src/main.c **** 		dig3 = value;
 550              		.loc 1 131 0
 551 019c 0E4B     		ldr	r3, .L40
 552 019e 1A68     		ldr	r2, [r3]
 553 01a0 164B     		ldr	r3, .L40+36
 554 01a2 1A60     		str	r2, [r3]
 132:../src/main.c **** 		size3 = size;
 555              		.loc 1 132 0
 556 01a4 0E4B     		ldr	r3, .L40+8
 557 01a6 1A68     		ldr	r2, [r3]
 558 01a8 154B     		ldr	r3, .L40+40
 559 01aa 1A60     		str	r2, [r3]
 133:../src/main.c **** 		switch(((fibNum && 0x0F0) >> 4));
 134:../src/main.c **** 		dig2 = value;
 560              		.loc 1 134 0
 561 01ac 0A4B     		ldr	r3, .L40
 562 01ae 1A68     		ldr	r2, [r3]
 563 01b0 104B     		ldr	r3, .L40+28
 564 01b2 1A60     		str	r2, [r3]
 135:../src/main.c **** 		size2 = size;
 565              		.loc 1 135 0
 566 01b4 0A4B     		ldr	r3, .L40+8
 567 01b6 1A68     		ldr	r2, [r3]
 568 01b8 0F4B     		ldr	r3, .L40+32
 569 01ba 1A60     		str	r2, [r3]
 136:../src/main.c **** 		switch(((fibNum && 0x0F)));
 137:../src/main.c **** 		dig1 = value;
 570              		.loc 1 137 0
 571 01bc 064B     		ldr	r3, .L40
 572 01be 1A68     		ldr	r2, [r3]
 573 01c0 0A4B     		ldr	r3, .L40+20
 574 01c2 1A60     		str	r2, [r3]
 138:../src/main.c **** 		size1 = size;
 575              		.loc 1 138 0
 576 01c4 064B     		ldr	r3, .L40+8
 577 01c6 1A68     		ldr	r2, [r3]
 578 01c8 094B     		ldr	r3, .L40+24
 579 01ca 1A60     		str	r2, [r3]
 139:../src/main.c **** 	}
 140:../src/main.c **** 	return;
 580              		.loc 1 140 0
 581 01cc C046     		nop
 582              	.L39:
 583 01ce C046     		nop
 141:../src/main.c **** }
 584              		.loc 1 141 0
 585 01d0 BD46     		mov	sp, r7
 586 01d2 02B0     		add	sp, sp, #8
 587              		@ sp needed
 588 01d4 80BD     		pop	{r7, pc}
 589              	.L41:
 590 01d6 C046     		.align	2
 591              	.L40:
 592 01d8 00000000 		.word	value
 593 01dc 10000000 		.word	.L14
 594 01e0 00000000 		.word	size
 595 01e4 FF0F0000 		.word	4095
 596 01e8 00000000 		.word	digit
 597 01ec 00000000 		.word	dig1
 598 01f0 00000000 		.word	size1
 599 01f4 00000000 		.word	dig2
 600 01f8 00000000 		.word	size2
 601 01fc 00000000 		.word	dig3
 602 0200 00000000 		.word	size3
 603 0204 00000000 		.word	dig4
 604 0208 00000000 		.word	size4
 605              		.cfi_endproc
 606              	.LFE22:
 608              		.comm	printarray,20,4
 609              		.section	.text.array,"ax",%progbits
 610              		.align	2
 611              		.global	array
 612              		.code	16
 613              		.thumb_func
 615              	array:
 616              	.LFB23:
 142:../src/main.c **** //Alright so one bug that might be here^  hexadicemila # is base 16 but other numbers are base 10?
 143:../src/main.c **** 
 144:../src/main.c **** int printarray[5];
 145:../src/main.c **** 
 146:../src/main.c **** void array(int smallSize, int bin){
 617              		.loc 1 146 0
 618              		.cfi_startproc
 619              		@ args = 0, pretend = 0, frame = 8
 620              		@ frame_needed = 1, uses_anonymous_args = 0
 621 0000 80B5     		push	{r7, lr}
 622              		.cfi_def_cfa_offset 8
 623              		.cfi_offset 7, -8
 624              		.cfi_offset 14, -4
 625 0002 82B0     		sub	sp, sp, #8
 626              		.cfi_def_cfa_offset 16
 627 0004 00AF     		add	r7, sp, #0
 628              		.cfi_def_cfa_register 7
 629 0006 7860     		str	r0, [r7, #4]
 630 0008 3960     		str	r1, [r7]
 147:../src/main.c **** 	if(smallSize == 5){
 631              		.loc 1 147 0
 632 000a 7B68     		ldr	r3, [r7, #4]
 633 000c 052B     		cmp	r3, #5
 634 000e 22D1     		bne	.L43
 148:../src/main.c **** 		printarray[0] = ((0b00001) && bin);
 635              		.loc 1 148 0
 636 0010 3B68     		ldr	r3, [r7]
 637 0012 5A1E     		subs	r2, r3, #1
 638 0014 9341     		sbcs	r3, r3, r2
 639 0016 DBB2     		uxtb	r3, r3
 640 0018 1A00     		movs	r2, r3
 641 001a 3A4B     		ldr	r3, .L49
 642 001c 1A60     		str	r2, [r3]
 149:../src/main.c **** 		printarray[1] = ((0b00010) && bin);
 643              		.loc 1 149 0
 644 001e 3B68     		ldr	r3, [r7]
 645 0020 5A1E     		subs	r2, r3, #1
 646 0022 9341     		sbcs	r3, r3, r2
 647 0024 DBB2     		uxtb	r3, r3
 648 0026 1A00     		movs	r2, r3
 649 0028 364B     		ldr	r3, .L49
 650 002a 5A60     		str	r2, [r3, #4]
 150:../src/main.c **** 		printarray[2] = ((0b00100) && bin);
 651              		.loc 1 150 0
 652 002c 3B68     		ldr	r3, [r7]
 653 002e 5A1E     		subs	r2, r3, #1
 654 0030 9341     		sbcs	r3, r3, r2
 655 0032 DBB2     		uxtb	r3, r3
 656 0034 1A00     		movs	r2, r3
 657 0036 334B     		ldr	r3, .L49
 658 0038 9A60     		str	r2, [r3, #8]
 151:../src/main.c **** 		printarray[3] = ((0b01000) && bin);
 659              		.loc 1 151 0
 660 003a 3B68     		ldr	r3, [r7]
 661 003c 5A1E     		subs	r2, r3, #1
 662 003e 9341     		sbcs	r3, r3, r2
 663 0040 DBB2     		uxtb	r3, r3
 664 0042 1A00     		movs	r2, r3
 665 0044 2F4B     		ldr	r3, .L49
 666 0046 DA60     		str	r2, [r3, #12]
 152:../src/main.c **** 		printarray[4] = ((0b10000) && bin);
 667              		.loc 1 152 0
 668 0048 3B68     		ldr	r3, [r7]
 669 004a 5A1E     		subs	r2, r3, #1
 670 004c 9341     		sbcs	r3, r3, r2
 671 004e DBB2     		uxtb	r3, r3
 672 0050 1A00     		movs	r2, r3
 673 0052 2C4B     		ldr	r3, .L49
 674 0054 1A61     		str	r2, [r3, #16]
 675              	.L43:
 153:../src/main.c **** }
 154:../src/main.c **** 	if(smallSize == 4){
 676              		.loc 1 154 0
 677 0056 7B68     		ldr	r3, [r7, #4]
 678 0058 042B     		cmp	r3, #4
 679 005a 1BD1     		bne	.L44
 155:../src/main.c **** 		printarray[0] = ((0b00001) && bin);
 680              		.loc 1 155 0
 681 005c 3B68     		ldr	r3, [r7]
 682 005e 5A1E     		subs	r2, r3, #1
 683 0060 9341     		sbcs	r3, r3, r2
 684 0062 DBB2     		uxtb	r3, r3
 685 0064 1A00     		movs	r2, r3
 686 0066 274B     		ldr	r3, .L49
 687 0068 1A60     		str	r2, [r3]
 156:../src/main.c **** 		printarray[1] = ((0b00010) && bin);
 688              		.loc 1 156 0
 689 006a 3B68     		ldr	r3, [r7]
 690 006c 5A1E     		subs	r2, r3, #1
 691 006e 9341     		sbcs	r3, r3, r2
 692 0070 DBB2     		uxtb	r3, r3
 693 0072 1A00     		movs	r2, r3
 694 0074 234B     		ldr	r3, .L49
 695 0076 5A60     		str	r2, [r3, #4]
 157:../src/main.c **** 		printarray[2] = ((0b00100) && bin);
 696              		.loc 1 157 0
 697 0078 3B68     		ldr	r3, [r7]
 698 007a 5A1E     		subs	r2, r3, #1
 699 007c 9341     		sbcs	r3, r3, r2
 700 007e DBB2     		uxtb	r3, r3
 701 0080 1A00     		movs	r2, r3
 702 0082 204B     		ldr	r3, .L49
 703 0084 9A60     		str	r2, [r3, #8]
 158:../src/main.c **** 		printarray[3] = ((0b01000) && bin);
 704              		.loc 1 158 0
 705 0086 3B68     		ldr	r3, [r7]
 706 0088 5A1E     		subs	r2, r3, #1
 707 008a 9341     		sbcs	r3, r3, r2
 708 008c DBB2     		uxtb	r3, r3
 709 008e 1A00     		movs	r2, r3
 710 0090 1C4B     		ldr	r3, .L49
 711 0092 DA60     		str	r2, [r3, #12]
 712              	.L44:
 159:../src/main.c **** 	}
 160:../src/main.c **** 	if(smallSize == 3){
 713              		.loc 1 160 0
 714 0094 7B68     		ldr	r3, [r7, #4]
 715 0096 032B     		cmp	r3, #3
 716 0098 14D1     		bne	.L45
 161:../src/main.c **** 		printarray[0] = ((0b00001) && bin);
 717              		.loc 1 161 0
 718 009a 3B68     		ldr	r3, [r7]
 719 009c 5A1E     		subs	r2, r3, #1
 720 009e 9341     		sbcs	r3, r3, r2
 721 00a0 DBB2     		uxtb	r3, r3
 722 00a2 1A00     		movs	r2, r3
 723 00a4 174B     		ldr	r3, .L49
 724 00a6 1A60     		str	r2, [r3]
 162:../src/main.c **** 		printarray[1] = ((0b00010) && bin);
 725              		.loc 1 162 0
 726 00a8 3B68     		ldr	r3, [r7]
 727 00aa 5A1E     		subs	r2, r3, #1
 728 00ac 9341     		sbcs	r3, r3, r2
 729 00ae DBB2     		uxtb	r3, r3
 730 00b0 1A00     		movs	r2, r3
 731 00b2 144B     		ldr	r3, .L49
 732 00b4 5A60     		str	r2, [r3, #4]
 163:../src/main.c **** 		printarray[2] = ((0b00100) && bin);
 733              		.loc 1 163 0
 734 00b6 3B68     		ldr	r3, [r7]
 735 00b8 5A1E     		subs	r2, r3, #1
 736 00ba 9341     		sbcs	r3, r3, r2
 737 00bc DBB2     		uxtb	r3, r3
 738 00be 1A00     		movs	r2, r3
 739 00c0 104B     		ldr	r3, .L49
 740 00c2 9A60     		str	r2, [r3, #8]
 741              	.L45:
 164:../src/main.c **** 	}
 165:../src/main.c **** 	if(smallSize == 2){
 742              		.loc 1 165 0
 743 00c4 7B68     		ldr	r3, [r7, #4]
 744 00c6 022B     		cmp	r3, #2
 745 00c8 0DD1     		bne	.L46
 166:../src/main.c **** 		printarray[0] = ((0b00001) && bin);
 746              		.loc 1 166 0
 747 00ca 3B68     		ldr	r3, [r7]
 748 00cc 5A1E     		subs	r2, r3, #1
 749 00ce 9341     		sbcs	r3, r3, r2
 750 00d0 DBB2     		uxtb	r3, r3
 751 00d2 1A00     		movs	r2, r3
 752 00d4 0B4B     		ldr	r3, .L49
 753 00d6 1A60     		str	r2, [r3]
 167:../src/main.c **** 		printarray[1] = ((0b00010) && bin);
 754              		.loc 1 167 0
 755 00d8 3B68     		ldr	r3, [r7]
 756 00da 5A1E     		subs	r2, r3, #1
 757 00dc 9341     		sbcs	r3, r3, r2
 758 00de DBB2     		uxtb	r3, r3
 759 00e0 1A00     		movs	r2, r3
 760 00e2 084B     		ldr	r3, .L49
 761 00e4 5A60     		str	r2, [r3, #4]
 762              	.L46:
 168:../src/main.c **** 	}
 169:../src/main.c **** 	if(smallSize == 1){
 763              		.loc 1 169 0
 764 00e6 7B68     		ldr	r3, [r7, #4]
 765 00e8 012B     		cmp	r3, #1
 766 00ea 06D1     		bne	.L48
 170:../src/main.c **** 		printarray[0] = ((0b00001) && bin);
 767              		.loc 1 170 0
 768 00ec 3B68     		ldr	r3, [r7]
 769 00ee 5A1E     		subs	r2, r3, #1
 770 00f0 9341     		sbcs	r3, r3, r2
 771 00f2 DBB2     		uxtb	r3, r3
 772 00f4 1A00     		movs	r2, r3
 773 00f6 034B     		ldr	r3, .L49
 774 00f8 1A60     		str	r2, [r3]
 775              	.L48:
 171:../src/main.c **** 	}
 172:../src/main.c **** }
 776              		.loc 1 172 0
 777 00fa C046     		nop
 778 00fc BD46     		mov	sp, r7
 779 00fe 02B0     		add	sp, sp, #8
 780              		@ sp needed
 781 0100 80BD     		pop	{r7, pc}
 782              	.L50:
 783 0102 C046     		.align	2
 784              	.L49:
 785 0104 00000000 		.word	printarray
 786              		.cfi_endproc
 787              	.LFE23:
 789              		.global	__aeabi_uidiv
 790              		.section	.rodata
 791              		.align	2
 792              	.LC16:
 793 0050 25640A00 		.ascii	"%d\012\000"
 794              		.align	2
 795              	.LC19:
 796 0054 44696769 		.ascii	"Digits: %d\012\000"
 796      74733A20 
 796      25640A00 
 797              		.align	2
 798              	.LC22:
 799 0060 44696734 		.ascii	"Dig4: %X\012\000"
 799      3A202558 
 799      0A00
 800 006a 0000     		.align	2
 801              	.LC25:
 802 006c 44696733 		.ascii	"Dig3: %X\012\000"
 802      3A202558 
 802      0A00
 803 0076 0000     		.align	2
 804              	.LC28:
 805 0078 44696732 		.ascii	"Dig2: %X\012\000"
 805      3A202558 
 805      0A00
 806 0082 0000     		.align	2
 807              	.LC31:
 808 0084 44696731 		.ascii	"Dig1: %X\012\000"
 808      3A202558 
 808      0A00
 809              		.section	.text.main,"ax",%progbits
 810              		.align	2
 811              		.global	main
 812              		.code	16
 813              		.thumb_func
 815              	main:
 816              	.LFB24:
 173:../src/main.c **** 
 174:../src/main.c **** int main(void) {
 817              		.loc 1 174 0
 818              		.cfi_startproc
 819              		@ args = 0, pretend = 0, frame = 16
 820              		@ frame_needed = 1, uses_anonymous_args = 0
 821 0000 80B5     		push	{r7, lr}
 822              		.cfi_def_cfa_offset 8
 823              		.cfi_offset 7, -8
 824              		.cfi_offset 14, -4
 825 0002 84B0     		sub	sp, sp, #16
 826              		.cfi_def_cfa_offset 24
 827 0004 00AF     		add	r7, sp, #0
 828              		.cfi_def_cfa_register 7
 175:../src/main.c **** 	////////////////////////////////////////
 176:../src/main.c **** 	int i = 0, on = 0;
 829              		.loc 1 176 0
 830 0006 0023     		movs	r3, #0
 831 0008 FB60     		str	r3, [r7, #12]
 832 000a 0023     		movs	r3, #0
 833 000c BB60     		str	r3, [r7, #8]
 177:../src/main.c **** 
 178:../src/main.c **** 	/* Initialize 32-bit timer 0. TIME_INTERVAL is defined as 10mS */
 179:../src/main.c **** 	/* You may also want to use the Cortex SysTick timer to do this */
 180:../src/main.c **** 	init_timer32(0, TIME_INTERVAL);
 834              		.loc 1 180 0
 835 000e 814B     		ldr	r3, .L56
 836 0010 1B68     		ldr	r3, [r3]
 837 0012 6421     		movs	r1, #100
 838 0014 1800     		movs	r0, r3
 839 0016 FFF7FEFF 		bl	__aeabi_uidiv
 840 001a 0300     		movs	r3, r0
 841 001c 013B     		subs	r3, r3, #1
 842 001e 1900     		movs	r1, r3
 843 0020 0020     		movs	r0, #0
 844 0022 FFF7FEFF 		bl	init_timer32
 181:../src/main.c **** 	/* Enable timer 0. Our interrupt handler will begin incrementing
 182:../src/main.c **** 	 * the TimeTick global each time timer 0 matches and resets.
 183:../src/main.c **** 	 */
 184:../src/main.c **** 	enable_timer32(0);
 845              		.loc 1 184 0
 846 0026 0020     		movs	r0, #0
 847 0028 FFF7FEFF 		bl	enable_timer32
 185:../src/main.c **** 	/* Initialize GPIO (sets up clock) */
 186:../src/main.c **** 	GPIOInit();
 848              		.loc 1 186 0
 849 002c FFF7FEFF 		bl	GPIOInit
 187:../src/main.c **** 	/* Set LED port pin to output */
 188:../src/main.c **** 	GPIOSetDir(LED_PORT_R, LED_BIT_R, 1 );
 850              		.loc 1 188 0
 851 0030 0122     		movs	r2, #1
 852 0032 0721     		movs	r1, #7
 853 0034 0020     		movs	r0, #0
 854 0036 FFF7FEFF 		bl	GPIOSetDir
 189:../src/main.c **** 	GPIOSetDir(LED_PORT_B, LED_BIT_B, 1);
 855              		.loc 1 189 0
 856 003a 0122     		movs	r2, #1
 857 003c 0921     		movs	r1, #9
 858 003e 0020     		movs	r0, #0
 859 0040 FFF7FEFF 		bl	GPIOSetDir
 190:../src/main.c **** 
 191:../src/main.c **** 	GPIOSetValue( LED_PORT_R, LED_BIT_R, LED_OFF );
 860              		.loc 1 191 0
 861 0044 0122     		movs	r2, #1
 862 0046 0721     		movs	r1, #7
 863 0048 0020     		movs	r0, #0
 864 004a FFF7FEFF 		bl	GPIOSetValue
 192:../src/main.c **** 	GPIOSetValue( LED_PORT_B, LED_BIT_B, LED_OFF );
 865              		.loc 1 192 0
 866 004e 0122     		movs	r2, #1
 867 0050 0921     		movs	r1, #9
 868 0052 0020     		movs	r0, #0
 869 0054 FFF7FEFF 		bl	GPIOSetValue
 193:../src/main.c **** 	////////////////////////////////////////
 194:../src/main.c **** 
 195:../src/main.c **** 
 196:../src/main.c **** 
 197:../src/main.c **** 
 198:../src/main.c **** 
 199:../src/main.c **** 	int j, k;
 200:../src/main.c **** 
 201:../src/main.c **** //	i = sum(1, 2);
 202:../src/main.c **** //	j = asm_sum(5, 6);
 203:../src/main.c **** 
 204:../src/main.c **** 	//k = fib(8);
 205:../src/main.c **** 	j = fibonacci_asm(20);
 870              		.loc 1 205 0
 871 0058 1420     		movs	r0, #20
 872 005a FFF7FEFF 		bl	fibonacci_asm
 873 005e 0300     		movs	r3, r0
 874 0060 7B60     		str	r3, [r7, #4]
 206:../src/main.c **** 	printf("%d\n", j);
 875              		.loc 1 206 0
 876 0062 7A68     		ldr	r2, [r7, #4]
 877 0064 6C4B     		ldr	r3, .L56+4
 878 0066 1100     		movs	r1, r2
 879 0068 1800     		movs	r0, r3
 880 006a FFF7FEFF 		bl	printf
 207:../src/main.c **** 
 208:../src/main.c **** 
 209:../src/main.c **** 	translateFib(j);
 881              		.loc 1 209 0
 882 006e 7B68     		ldr	r3, [r7, #4]
 883 0070 1800     		movs	r0, r3
 884 0072 FFF7FEFF 		bl	translateFib
 210:../src/main.c **** 
 211:../src/main.c **** 	//printf("Hex is %d%d%d%d\n" ,dig4, dig3, dig2, dig1);
 212:../src/main.c **** 	printf("Digits: %d\n", digit);
 885              		.loc 1 212 0
 886 0076 694B     		ldr	r3, .L56+8
 887 0078 1A68     		ldr	r2, [r3]
 888 007a 694B     		ldr	r3, .L56+12
 889 007c 1100     		movs	r1, r2
 890 007e 1800     		movs	r0, r3
 891 0080 FFF7FEFF 		bl	printf
 213:../src/main.c **** 	printf("Dig4: %X\n",dig4);
 892              		.loc 1 213 0
 893 0084 674B     		ldr	r3, .L56+16
 894 0086 1A68     		ldr	r2, [r3]
 895 0088 674B     		ldr	r3, .L56+20
 896 008a 1100     		movs	r1, r2
 897 008c 1800     		movs	r0, r3
 898 008e FFF7FEFF 		bl	printf
 214:../src/main.c **** 	printf("Dig3: %X\n",dig3);
 899              		.loc 1 214 0
 900 0092 664B     		ldr	r3, .L56+24
 901 0094 1A68     		ldr	r2, [r3]
 902 0096 664B     		ldr	r3, .L56+28
 903 0098 1100     		movs	r1, r2
 904 009a 1800     		movs	r0, r3
 905 009c FFF7FEFF 		bl	printf
 215:../src/main.c **** 	printf("Dig2: %X\n",dig2);
 906              		.loc 1 215 0
 907 00a0 644B     		ldr	r3, .L56+32
 908 00a2 1A68     		ldr	r2, [r3]
 909 00a4 644B     		ldr	r3, .L56+36
 910 00a6 1100     		movs	r1, r2
 911 00a8 1800     		movs	r0, r3
 912 00aa FFF7FEFF 		bl	printf
 216:../src/main.c **** 	printf("Dig1: %X\n",dig1);
 913              		.loc 1 216 0
 914 00ae 634B     		ldr	r3, .L56+40
 915 00b0 1A68     		ldr	r2, [r3]
 916 00b2 634B     		ldr	r3, .L56+44
 917 00b4 1100     		movs	r1, r2
 918 00b6 1800     		movs	r0, r3
 919 00b8 FFF7FEFF 		bl	printf
 217:../src/main.c **** 
 218:../src/main.c **** 
 219:../src/main.c **** 	if(digit==1){
 920              		.loc 1 219 0
 921 00bc 574B     		ldr	r3, .L56+8
 922 00be 1B68     		ldr	r3, [r3]
 923 00c0 012B     		cmp	r3, #1
 924 00c2 0ED1     		bne	.L52
 220:../src/main.c **** 		array(size1, dig1);
 925              		.loc 1 220 0
 926 00c4 5F4B     		ldr	r3, .L56+48
 927 00c6 1A68     		ldr	r2, [r3]
 928 00c8 5C4B     		ldr	r3, .L56+40
 929 00ca 1B68     		ldr	r3, [r3]
 930 00cc 1900     		movs	r1, r3
 931 00ce 1000     		movs	r0, r2
 932 00d0 FFF7FEFF 		bl	array
 221:../src/main.c **** 		display(printarray, size1);
 933              		.loc 1 221 0
 934 00d4 5B4B     		ldr	r3, .L56+48
 935 00d6 1A68     		ldr	r2, [r3]
 936 00d8 5B4B     		ldr	r3, .L56+52
 937 00da 1100     		movs	r1, r2
 938 00dc 1800     		movs	r0, r3
 939 00de FFF7FEFF 		bl	display
 940              	.L52:
 222:../src/main.c **** 	}
 223:../src/main.c **** 	if(digit==2){
 941              		.loc 1 223 0
 942 00e2 4E4B     		ldr	r3, .L56+8
 943 00e4 1B68     		ldr	r3, [r3]
 944 00e6 022B     		cmp	r3, #2
 945 00e8 1DD1     		bne	.L53
 224:../src/main.c **** 		array(size2, dig2);
 946              		.loc 1 224 0
 947 00ea 584B     		ldr	r3, .L56+56
 948 00ec 1A68     		ldr	r2, [r3]
 949 00ee 514B     		ldr	r3, .L56+32
 950 00f0 1B68     		ldr	r3, [r3]
 951 00f2 1900     		movs	r1, r3
 952 00f4 1000     		movs	r0, r2
 953 00f6 FFF7FEFF 		bl	array
 225:../src/main.c **** 		display(printarray, size2);
 954              		.loc 1 225 0
 955 00fa 544B     		ldr	r3, .L56+56
 956 00fc 1A68     		ldr	r2, [r3]
 957 00fe 524B     		ldr	r3, .L56+52
 958 0100 1100     		movs	r1, r2
 959 0102 1800     		movs	r0, r3
 960 0104 FFF7FEFF 		bl	display
 226:../src/main.c **** 
 227:../src/main.c **** 		array(size1, dig1);
 961              		.loc 1 227 0
 962 0108 4E4B     		ldr	r3, .L56+48
 963 010a 1A68     		ldr	r2, [r3]
 964 010c 4B4B     		ldr	r3, .L56+40
 965 010e 1B68     		ldr	r3, [r3]
 966 0110 1900     		movs	r1, r3
 967 0112 1000     		movs	r0, r2
 968 0114 FFF7FEFF 		bl	array
 228:../src/main.c **** 		display(printarray, size1);
 969              		.loc 1 228 0
 970 0118 4A4B     		ldr	r3, .L56+48
 971 011a 1A68     		ldr	r2, [r3]
 972 011c 4A4B     		ldr	r3, .L56+52
 973 011e 1100     		movs	r1, r2
 974 0120 1800     		movs	r0, r3
 975 0122 FFF7FEFF 		bl	display
 976              	.L53:
 229:../src/main.c **** 	}
 230:../src/main.c **** 	if(digit==3){
 977              		.loc 1 230 0
 978 0126 3D4B     		ldr	r3, .L56+8
 979 0128 1B68     		ldr	r3, [r3]
 980 012a 032B     		cmp	r3, #3
 981 012c 2CD1     		bne	.L54
 231:../src/main.c **** 		array(size3, dig3);
 982              		.loc 1 231 0
 983 012e 484B     		ldr	r3, .L56+60
 984 0130 1A68     		ldr	r2, [r3]
 985 0132 3E4B     		ldr	r3, .L56+24
 986 0134 1B68     		ldr	r3, [r3]
 987 0136 1900     		movs	r1, r3
 988 0138 1000     		movs	r0, r2
 989 013a FFF7FEFF 		bl	array
 232:../src/main.c **** 		display(printarray, size3);
 990              		.loc 1 232 0
 991 013e 444B     		ldr	r3, .L56+60
 992 0140 1A68     		ldr	r2, [r3]
 993 0142 414B     		ldr	r3, .L56+52
 994 0144 1100     		movs	r1, r2
 995 0146 1800     		movs	r0, r3
 996 0148 FFF7FEFF 		bl	display
 233:../src/main.c **** 
 234:../src/main.c **** 		array(size2, dig2);
 997              		.loc 1 234 0
 998 014c 3F4B     		ldr	r3, .L56+56
 999 014e 1A68     		ldr	r2, [r3]
 1000 0150 384B     		ldr	r3, .L56+32
 1001 0152 1B68     		ldr	r3, [r3]
 1002 0154 1900     		movs	r1, r3
 1003 0156 1000     		movs	r0, r2
 1004 0158 FFF7FEFF 		bl	array
 235:../src/main.c **** 		display(printarray, size2);
 1005              		.loc 1 235 0
 1006 015c 3B4B     		ldr	r3, .L56+56
 1007 015e 1A68     		ldr	r2, [r3]
 1008 0160 394B     		ldr	r3, .L56+52
 1009 0162 1100     		movs	r1, r2
 1010 0164 1800     		movs	r0, r3
 1011 0166 FFF7FEFF 		bl	display
 236:../src/main.c **** 
 237:../src/main.c **** 		array(size1, dig1);
 1012              		.loc 1 237 0
 1013 016a 364B     		ldr	r3, .L56+48
 1014 016c 1A68     		ldr	r2, [r3]
 1015 016e 334B     		ldr	r3, .L56+40
 1016 0170 1B68     		ldr	r3, [r3]
 1017 0172 1900     		movs	r1, r3
 1018 0174 1000     		movs	r0, r2
 1019 0176 FFF7FEFF 		bl	array
 238:../src/main.c **** 		display(printarray, size1);
 1020              		.loc 1 238 0
 1021 017a 324B     		ldr	r3, .L56+48
 1022 017c 1A68     		ldr	r2, [r3]
 1023 017e 324B     		ldr	r3, .L56+52
 1024 0180 1100     		movs	r1, r2
 1025 0182 1800     		movs	r0, r3
 1026 0184 FFF7FEFF 		bl	display
 1027              	.L54:
 239:../src/main.c **** 	}
 240:../src/main.c **** 	if(digit==4){
 1028              		.loc 1 240 0
 1029 0188 244B     		ldr	r3, .L56+8
 1030 018a 1B68     		ldr	r3, [r3]
 1031 018c 042B     		cmp	r3, #4
 1032 018e 3BD1     		bne	.L55
 241:../src/main.c **** 		array(size4, dig4);
 1033              		.loc 1 241 0
 1034 0190 304B     		ldr	r3, .L56+64
 1035 0192 1A68     		ldr	r2, [r3]
 1036 0194 234B     		ldr	r3, .L56+16
 1037 0196 1B68     		ldr	r3, [r3]
 1038 0198 1900     		movs	r1, r3
 1039 019a 1000     		movs	r0, r2
 1040 019c FFF7FEFF 		bl	array
 242:../src/main.c **** 		display(printarray, size4);
 1041              		.loc 1 242 0
 1042 01a0 2C4B     		ldr	r3, .L56+64
 1043 01a2 1A68     		ldr	r2, [r3]
 1044 01a4 284B     		ldr	r3, .L56+52
 1045 01a6 1100     		movs	r1, r2
 1046 01a8 1800     		movs	r0, r3
 1047 01aa FFF7FEFF 		bl	display
 243:../src/main.c **** 
 244:../src/main.c **** 		array(size3, dig3);
 1048              		.loc 1 244 0
 1049 01ae 284B     		ldr	r3, .L56+60
 1050 01b0 1A68     		ldr	r2, [r3]
 1051 01b2 1E4B     		ldr	r3, .L56+24
 1052 01b4 1B68     		ldr	r3, [r3]
 1053 01b6 1900     		movs	r1, r3
 1054 01b8 1000     		movs	r0, r2
 1055 01ba FFF7FEFF 		bl	array
 245:../src/main.c **** 		display(printarray, size3);
 1056              		.loc 1 245 0
 1057 01be 244B     		ldr	r3, .L56+60
 1058 01c0 1A68     		ldr	r2, [r3]
 1059 01c2 214B     		ldr	r3, .L56+52
 1060 01c4 1100     		movs	r1, r2
 1061 01c6 1800     		movs	r0, r3
 1062 01c8 FFF7FEFF 		bl	display
 246:../src/main.c **** 
 247:../src/main.c **** 		array(size2, dig2);
 1063              		.loc 1 247 0
 1064 01cc 1F4B     		ldr	r3, .L56+56
 1065 01ce 1A68     		ldr	r2, [r3]
 1066 01d0 184B     		ldr	r3, .L56+32
 1067 01d2 1B68     		ldr	r3, [r3]
 1068 01d4 1900     		movs	r1, r3
 1069 01d6 1000     		movs	r0, r2
 1070 01d8 FFF7FEFF 		bl	array
 248:../src/main.c **** 		display(printarray, size2);
 1071              		.loc 1 248 0
 1072 01dc 1B4B     		ldr	r3, .L56+56
 1073 01de 1A68     		ldr	r2, [r3]
 1074 01e0 194B     		ldr	r3, .L56+52
 1075 01e2 1100     		movs	r1, r2
 1076 01e4 1800     		movs	r0, r3
 1077 01e6 FFF7FEFF 		bl	display
 249:../src/main.c **** 
 250:../src/main.c **** 		array(size1, dig1);
 1078              		.loc 1 250 0
 1079 01ea 164B     		ldr	r3, .L56+48
 1080 01ec 1A68     		ldr	r2, [r3]
 1081 01ee 134B     		ldr	r3, .L56+40
 1082 01f0 1B68     		ldr	r3, [r3]
 1083 01f2 1900     		movs	r1, r3
 1084 01f4 1000     		movs	r0, r2
 1085 01f6 FFF7FEFF 		bl	array
 251:../src/main.c **** 		display(printarray, size1);
 1086              		.loc 1 251 0
 1087 01fa 124B     		ldr	r3, .L56+48
 1088 01fc 1A68     		ldr	r2, [r3]
 1089 01fe 124B     		ldr	r3, .L56+52
 1090 0200 1100     		movs	r1, r2
 1091 0202 1800     		movs	r0, r3
 1092 0204 FFF7FEFF 		bl	display
 1093              	.L55:
 252:../src/main.c **** 	}
 253:../src/main.c **** 
 254:../src/main.c **** 
 255:../src/main.c **** 
 256:../src/main.c **** 
 257:../src/main.c **** 
 258:../src/main.c **** 	//printf("%d", k);
 259:../src/main.c **** 	// Enter an infinite loop, just incrementing a counter
 260:../src/main.c **** 	volatile static int loop = 0;
 261:../src/main.c **** 	while (1) {
 262:../src/main.c **** 		loop++;
 1094              		.loc 1 262 0 discriminator 1
 1095 0208 134B     		ldr	r3, .L56+68
 1096 020a 1B68     		ldr	r3, [r3]
 1097 020c 5A1C     		adds	r2, r3, #1
 1098 020e 124B     		ldr	r3, .L56+68
 1099 0210 1A60     		str	r2, [r3]
 263:../src/main.c **** 	}
 1100              		.loc 1 263 0 discriminator 1
 1101 0212 F9E7     		b	.L55
 1102              	.L57:
 1103              		.align	2
 1104              	.L56:
 1105 0214 00000000 		.word	SystemCoreClock
 1106 0218 50000000 		.word	.LC16
 1107 021c 00000000 		.word	digit
 1108 0220 54000000 		.word	.LC19
 1109 0224 00000000 		.word	dig4
 1110 0228 60000000 		.word	.LC22
 1111 022c 00000000 		.word	dig3
 1112 0230 6C000000 		.word	.LC25
 1113 0234 00000000 		.word	dig2
 1114 0238 78000000 		.word	.LC28
 1115 023c 00000000 		.word	dig1
 1116 0240 84000000 		.word	.LC31
 1117 0244 00000000 		.word	size1
 1118 0248 00000000 		.word	printarray
 1119 024c 00000000 		.word	size2
 1120 0250 00000000 		.word	size3
 1121 0254 00000000 		.word	size4
 1122 0258 04000000 		.word	loop.4636
 1123              		.cfi_endproc
 1124              	.LFE24:
 1126              		.bss
 1127              		.align	2
 1128              	loop.4636:
 1129 0004 00000000 		.space	4
 1130              		.text
 1131              	.Letext0:
 1132              		.file 2 "/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/LPC11xx.h"
 1133              		.file 3 "/usr/local/lpcxpresso_8.2.2_650/lpcxpresso/tools/redlib/include/stdint.h"
 1134              		.file 4 "/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/driver/gpio.h"
 1135              		.file 5 "/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/config/system_LPC11xx.h"
 1136              		.file 6 "/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/driver/timer32.h"
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
     /tmp/cc8m9PqC.s:20     .rodata:00000000 $d
     /tmp/cc8m9PqC.s:23     .rodata:00000000 LPC_GPIO
                            *COM*:00000004 digit
                            *COM*:00000004 value
                            *COM*:00000004 dig1
                            *COM*:00000004 dig2
                            *COM*:00000004 dig3
                            *COM*:00000004 dig4
                            *COM*:00000004 size
                            *COM*:00000004 size1
                            *COM*:00000004 size2
                            *COM*:00000004 size3
                            *COM*:00000004 size4
     /tmp/cc8m9PqC.s:40     .bss:00000000 $d
     /tmp/cc8m9PqC.s:41     .bss:00000000 loop
     /tmp/cc8m9PqC.s:44     .text.delay:00000000 $t
     /tmp/cc8m9PqC.s:49     .text.delay:00000000 delay
     /tmp/cc8m9PqC.s:98     .text.delay:00000034 $d
     /tmp/cc8m9PqC.s:104    .text.display:00000000 $t
     /tmp/cc8m9PqC.s:109    .text.display:00000000 display
     /tmp/cc8m9PqC.s:225    .text.translateFib:00000000 $t
     /tmp/cc8m9PqC.s:230    .text.translateFib:00000000 translateFib
     /tmp/cc8m9PqC.s:592    .text.translateFib:000001d8 $d
                            *COM*:00000014 printarray
     /tmp/cc8m9PqC.s:610    .text.array:00000000 $t
     /tmp/cc8m9PqC.s:615    .text.array:00000000 array
     /tmp/cc8m9PqC.s:785    .text.array:00000104 $d
     /tmp/cc8m9PqC.s:810    .text.main:00000000 $t
     /tmp/cc8m9PqC.s:815    .text.main:00000000 main
     /tmp/cc8m9PqC.s:1105   .text.main:00000214 $d
     /tmp/cc8m9PqC.s:1128   .bss:00000004 loop.4636
                     .debug_frame:00000010 $d
                           .group:00000000 wm4.0.935e200dcf4f236f804f4066baa4d700
                           .group:00000000 wm4.LPC11xx.h.22.18118eb75d0712ca7ff4a68c2fe5f6ea
                           .group:00000000 wm4.core_cm0.h.27.38988b494c3e5c5e2cb83260439c9743
                           .group:00000000 wm4.redlib_version.h.14.62abddb5b4efb2dd619a7dca5647eb78
                           .group:00000000 wm4.libconfigarm.h.18.48d18a57a6aa6fedadbcea02294a713f
                           .group:00000000 wm4.stdint.h.30.30f575a65a9bde434c705acf40986e1b
                           .group:00000000 wm4.core_cm0.h.80.b07010dfaa91a360af4e28c41693e9a2
                           .group:00000000 wm4.system_LPC11xx.h.29.5024c6a4c85b3276f8cc51914c1388c0
                           .group:00000000 wm4.LPC11xx.h.506.5b3ceafec87e73a002e73580a1f7418e
                           .group:00000000 wm4.driver_config.h.13.15585a2c3be646d09594a000007ce9a0
                           .group:00000000 wm4.target_config.h.23.9258b67bb997e4595cfdca7ea776e142
                           .group:00000000 wm4.timer32.h.22.d3f9a365e27a81b7ebd583960465985c
                           .group:00000000 wm4.gpio.h.21.b2ddaf0d47502e45407acf26ba3b8ec3
                           .group:00000000 wm4.math.h.9.e0fac7c18ffc4430a3b17b4c6aa65d4f

UNDEFINED SYMBOLS
timer32_0_counter
GPIOSetValue
__aeabi_uidiv
init_timer32
enable_timer32
GPIOInit
GPIOSetDir
fibonacci_asm
printf
SystemCoreClock
