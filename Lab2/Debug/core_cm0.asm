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
  15              		.file	"core_cm0.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.section	.text.__get_PSP,"ax",%progbits
  20              		.align	2
  21              		.global	__get_PSP
  22              		.code	16
  23              		.thumb_func
  25              	__get_PSP:
  26              	.LFB0:
  27              		.file 1 "../cmsis/core_cm0.c"
   1:../cmsis/core_cm0.c **** /**************************************************************************
   2:../cmsis/core_cm0.c ****  * $Id:: core_cm0.c 4785 2010-09-03 22:39:27Z nxp21346                    $
   3:../cmsis/core_cm0.c ****  *
   4:../cmsis/core_cm0.c ****  * @file     core_cm0.c
   5:../cmsis/core_cm0.c ****  * @brief    CMSIS Cortex-M0 Core Peripheral Access Layer Source File
   6:../cmsis/core_cm0.c ****  * @version  V1.30
   7:../cmsis/core_cm0.c ****  * @date     30. October 2009
   8:../cmsis/core_cm0.c ****  *
   9:../cmsis/core_cm0.c ****  * @note
  10:../cmsis/core_cm0.c ****  * Copyright (C) 2009 ARM Limited. All rights reserved.
  11:../cmsis/core_cm0.c ****  *
  12:../cmsis/core_cm0.c ****  * @par
  13:../cmsis/core_cm0.c ****  * ARM Limited (ARM) is supplying this software for use with Cortex-M 
  14:../cmsis/core_cm0.c ****  * processor based microcontrollers.  This file can be freely distributed 
  15:../cmsis/core_cm0.c ****  * within development tools that are supporting such ARM based processors. 
  16:../cmsis/core_cm0.c ****  *
  17:../cmsis/core_cm0.c ****  * @par
  18:../cmsis/core_cm0.c ****  * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
  19:../cmsis/core_cm0.c ****  * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
  20:../cmsis/core_cm0.c ****  * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
  21:../cmsis/core_cm0.c ****  * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
  22:../cmsis/core_cm0.c ****  * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
  23:../cmsis/core_cm0.c ****  *
  24:../cmsis/core_cm0.c ****  ******************************************************************************/
  25:../cmsis/core_cm0.c **** 
  26:../cmsis/core_cm0.c **** #include <stdint.h>
  27:../cmsis/core_cm0.c **** 
  28:../cmsis/core_cm0.c **** /* define compiler specific symbols */
  29:../cmsis/core_cm0.c **** #if defined ( __CC_ARM   )
  30:../cmsis/core_cm0.c ****   #define __ASM            __asm                                      /*!< asm keyword for ARM Comp
  31:../cmsis/core_cm0.c ****   #define __INLINE         __inline                                   /*!< inline keyword for ARM C
  32:../cmsis/core_cm0.c **** 
  33:../cmsis/core_cm0.c **** #elif defined ( __ICCARM__ )
  34:../cmsis/core_cm0.c ****   #define __ASM           __asm                                       /*!< asm keyword for IAR Comp
  35:../cmsis/core_cm0.c ****   #define __INLINE        inline                                      /*!< inline keyword for IAR C
  36:../cmsis/core_cm0.c **** 
  37:../cmsis/core_cm0.c **** #elif defined   (  __GNUC__  )
  38:../cmsis/core_cm0.c ****   #define __ASM            __asm                                      /*!< asm keyword for GNU Comp
  39:../cmsis/core_cm0.c ****   #define __INLINE         inline                                     /*!< inline keyword for GNU C
  40:../cmsis/core_cm0.c **** 
  41:../cmsis/core_cm0.c **** #elif defined   (  __TASKING__  )
  42:../cmsis/core_cm0.c ****   #define __ASM            __asm                                      /*!< asm keyword for TASKING 
  43:../cmsis/core_cm0.c ****   #define __INLINE         inline                                     /*!< inline keyword for TASKI
  44:../cmsis/core_cm0.c **** 
  45:../cmsis/core_cm0.c **** #endif
  46:../cmsis/core_cm0.c **** 
  47:../cmsis/core_cm0.c **** 
  48:../cmsis/core_cm0.c **** /* ###################  Compiler specific Intrinsics  ########################### */
  49:../cmsis/core_cm0.c **** 
  50:../cmsis/core_cm0.c **** #if defined ( __CC_ARM   ) /*------------------RealView Compiler -----------------*/
  51:../cmsis/core_cm0.c **** /* ARM armcc specific functions */
  52:../cmsis/core_cm0.c **** 
  53:../cmsis/core_cm0.c **** /**
  54:../cmsis/core_cm0.c ****  * @brief  Return the Process Stack Pointer
  55:../cmsis/core_cm0.c ****  *
  56:../cmsis/core_cm0.c ****  * @return ProcessStackPointer
  57:../cmsis/core_cm0.c ****  *
  58:../cmsis/core_cm0.c ****  * Return the actual process stack pointer
  59:../cmsis/core_cm0.c ****  */
  60:../cmsis/core_cm0.c **** __ASM uint32_t __get_PSP(void)
  61:../cmsis/core_cm0.c **** {
  62:../cmsis/core_cm0.c ****   mrs r0, psp
  63:../cmsis/core_cm0.c ****   bx lr
  64:../cmsis/core_cm0.c **** }
  65:../cmsis/core_cm0.c **** 
  66:../cmsis/core_cm0.c **** /**
  67:../cmsis/core_cm0.c ****  * @brief  Set the Process Stack Pointer
  68:../cmsis/core_cm0.c ****  *
  69:../cmsis/core_cm0.c ****  * @param  topOfProcStack  Process Stack Pointer
  70:../cmsis/core_cm0.c ****  *
  71:../cmsis/core_cm0.c ****  * Assign the value ProcessStackPointer to the MSP 
  72:../cmsis/core_cm0.c ****  * (process stack pointer) Cortex processor register
  73:../cmsis/core_cm0.c ****  */
  74:../cmsis/core_cm0.c **** __ASM void __set_PSP(uint32_t topOfProcStack)
  75:../cmsis/core_cm0.c **** {
  76:../cmsis/core_cm0.c ****   msr psp, r0
  77:../cmsis/core_cm0.c ****   bx lr
  78:../cmsis/core_cm0.c **** }
  79:../cmsis/core_cm0.c **** 
  80:../cmsis/core_cm0.c **** /**
  81:../cmsis/core_cm0.c ****  * @brief  Return the Main Stack Pointer
  82:../cmsis/core_cm0.c ****  *
  83:../cmsis/core_cm0.c ****  * @return Main Stack Pointer
  84:../cmsis/core_cm0.c ****  *
  85:../cmsis/core_cm0.c ****  * Return the current value of the MSP (main stack pointer)
  86:../cmsis/core_cm0.c ****  * Cortex processor register
  87:../cmsis/core_cm0.c ****  */
  88:../cmsis/core_cm0.c **** __ASM uint32_t __get_MSP(void)
  89:../cmsis/core_cm0.c **** {
  90:../cmsis/core_cm0.c ****   mrs r0, msp
  91:../cmsis/core_cm0.c ****   bx lr
  92:../cmsis/core_cm0.c **** }
  93:../cmsis/core_cm0.c **** 
  94:../cmsis/core_cm0.c **** /**
  95:../cmsis/core_cm0.c ****  * @brief  Set the Main Stack Pointer
  96:../cmsis/core_cm0.c ****  *
  97:../cmsis/core_cm0.c ****  * @param  topOfMainStack  Main Stack Pointer
  98:../cmsis/core_cm0.c ****  *
  99:../cmsis/core_cm0.c ****  * Assign the value mainStackPointer to the MSP 
 100:../cmsis/core_cm0.c ****  * (main stack pointer) Cortex processor register
 101:../cmsis/core_cm0.c ****  */
 102:../cmsis/core_cm0.c **** __ASM void __set_MSP(uint32_t mainStackPointer)
 103:../cmsis/core_cm0.c **** {
 104:../cmsis/core_cm0.c ****   msr msp, r0
 105:../cmsis/core_cm0.c ****   bx lr
 106:../cmsis/core_cm0.c **** }
 107:../cmsis/core_cm0.c **** 
 108:../cmsis/core_cm0.c **** /**
 109:../cmsis/core_cm0.c ****  * @brief  Reverse byte order in unsigned short value
 110:../cmsis/core_cm0.c ****  *
 111:../cmsis/core_cm0.c ****  * @param   value  value to reverse
 112:../cmsis/core_cm0.c ****  * @return         reversed value
 113:../cmsis/core_cm0.c ****  *
 114:../cmsis/core_cm0.c ****  * Reverse byte order in unsigned short value
 115:../cmsis/core_cm0.c ****  */
 116:../cmsis/core_cm0.c **** __ASM uint32_t __REV16(uint16_t value)
 117:../cmsis/core_cm0.c **** {
 118:../cmsis/core_cm0.c ****   rev16 r0, r0
 119:../cmsis/core_cm0.c ****   bx lr
 120:../cmsis/core_cm0.c **** }
 121:../cmsis/core_cm0.c **** 
 122:../cmsis/core_cm0.c **** /**
 123:../cmsis/core_cm0.c ****  * @brief  Reverse byte order in signed short value with sign extension to integer
 124:../cmsis/core_cm0.c ****  *
 125:../cmsis/core_cm0.c ****  * @param   value  value to reverse
 126:../cmsis/core_cm0.c ****  * @return         reversed value
 127:../cmsis/core_cm0.c ****  *
 128:../cmsis/core_cm0.c ****  * Reverse byte order in signed short value with sign extension to integer
 129:../cmsis/core_cm0.c ****  */
 130:../cmsis/core_cm0.c **** __ASM int32_t __REVSH(int16_t value)
 131:../cmsis/core_cm0.c **** {
 132:../cmsis/core_cm0.c ****   revsh r0, r0
 133:../cmsis/core_cm0.c ****   bx lr
 134:../cmsis/core_cm0.c **** }
 135:../cmsis/core_cm0.c **** 
 136:../cmsis/core_cm0.c **** 
 137:../cmsis/core_cm0.c **** #if (__ARMCC_VERSION < 400000)
 138:../cmsis/core_cm0.c **** 
 139:../cmsis/core_cm0.c **** 
 140:../cmsis/core_cm0.c **** /**
 141:../cmsis/core_cm0.c ****  * @brief  Return the Priority Mask value
 142:../cmsis/core_cm0.c ****  *
 143:../cmsis/core_cm0.c ****  * @return PriMask
 144:../cmsis/core_cm0.c ****  *
 145:../cmsis/core_cm0.c ****  * Return state of the priority mask bit from the priority mask register
 146:../cmsis/core_cm0.c ****  */
 147:../cmsis/core_cm0.c **** __ASM uint32_t __get_PRIMASK(void)
 148:../cmsis/core_cm0.c **** {
 149:../cmsis/core_cm0.c ****   mrs r0, primask
 150:../cmsis/core_cm0.c ****   bx lr
 151:../cmsis/core_cm0.c **** }
 152:../cmsis/core_cm0.c **** 
 153:../cmsis/core_cm0.c **** /**
 154:../cmsis/core_cm0.c ****  * @brief  Set the Priority Mask value
 155:../cmsis/core_cm0.c ****  *
 156:../cmsis/core_cm0.c ****  * @param  priMask  PriMask
 157:../cmsis/core_cm0.c ****  *
 158:../cmsis/core_cm0.c ****  * Set the priority mask bit in the priority mask register
 159:../cmsis/core_cm0.c ****  */
 160:../cmsis/core_cm0.c **** __ASM void __set_PRIMASK(uint32_t priMask)
 161:../cmsis/core_cm0.c **** {
 162:../cmsis/core_cm0.c ****   msr primask, r0
 163:../cmsis/core_cm0.c ****   bx lr
 164:../cmsis/core_cm0.c **** }
 165:../cmsis/core_cm0.c **** 
 166:../cmsis/core_cm0.c **** /**
 167:../cmsis/core_cm0.c ****  * @brief  Return the Control Register value
 168:../cmsis/core_cm0.c ****  * 
 169:../cmsis/core_cm0.c ****  * @return Control value
 170:../cmsis/core_cm0.c ****  *
 171:../cmsis/core_cm0.c ****  * Return the content of the control register
 172:../cmsis/core_cm0.c ****  */
 173:../cmsis/core_cm0.c **** __ASM uint32_t __get_CONTROL(void)
 174:../cmsis/core_cm0.c **** {
 175:../cmsis/core_cm0.c ****   mrs r0, control
 176:../cmsis/core_cm0.c ****   bx lr
 177:../cmsis/core_cm0.c **** }
 178:../cmsis/core_cm0.c **** 
 179:../cmsis/core_cm0.c **** /**
 180:../cmsis/core_cm0.c ****  * @brief  Set the Control Register value
 181:../cmsis/core_cm0.c ****  *
 182:../cmsis/core_cm0.c ****  * @param  control  Control value
 183:../cmsis/core_cm0.c ****  *
 184:../cmsis/core_cm0.c ****  * Set the control register
 185:../cmsis/core_cm0.c ****  */
 186:../cmsis/core_cm0.c **** __ASM void __set_CONTROL(uint32_t control)
 187:../cmsis/core_cm0.c **** {
 188:../cmsis/core_cm0.c ****   msr control, r0
 189:../cmsis/core_cm0.c ****   bx lr
 190:../cmsis/core_cm0.c **** }
 191:../cmsis/core_cm0.c **** 
 192:../cmsis/core_cm0.c **** #endif /* __ARMCC_VERSION  */ 
 193:../cmsis/core_cm0.c **** 
 194:../cmsis/core_cm0.c **** 
 195:../cmsis/core_cm0.c **** 
 196:../cmsis/core_cm0.c **** #elif (defined (__ICCARM__)) /*------------------ ICC Compiler -------------------*/
 197:../cmsis/core_cm0.c **** /* IAR iccarm specific functions */
 198:../cmsis/core_cm0.c **** #pragma diag_suppress=Pe940
 199:../cmsis/core_cm0.c **** 
 200:../cmsis/core_cm0.c **** /**
 201:../cmsis/core_cm0.c ****  * @brief  Return the Process Stack Pointer
 202:../cmsis/core_cm0.c ****  *
 203:../cmsis/core_cm0.c ****  * @return ProcessStackPointer
 204:../cmsis/core_cm0.c ****  *
 205:../cmsis/core_cm0.c ****  * Return the actual process stack pointer
 206:../cmsis/core_cm0.c ****  */
 207:../cmsis/core_cm0.c **** uint32_t __get_PSP(void)
 208:../cmsis/core_cm0.c **** {
 209:../cmsis/core_cm0.c ****   __ASM("mrs r0, psp");
 210:../cmsis/core_cm0.c ****   __ASM("bx lr");
 211:../cmsis/core_cm0.c **** }
 212:../cmsis/core_cm0.c **** 
 213:../cmsis/core_cm0.c **** /**
 214:../cmsis/core_cm0.c ****  * @brief  Set the Process Stack Pointer
 215:../cmsis/core_cm0.c ****  *
 216:../cmsis/core_cm0.c ****  * @param  topOfProcStack  Process Stack Pointer
 217:../cmsis/core_cm0.c ****  *
 218:../cmsis/core_cm0.c ****  * Assign the value ProcessStackPointer to the MSP 
 219:../cmsis/core_cm0.c ****  * (process stack pointer) Cortex processor register
 220:../cmsis/core_cm0.c ****  */
 221:../cmsis/core_cm0.c **** void __set_PSP(uint32_t topOfProcStack)
 222:../cmsis/core_cm0.c **** {
 223:../cmsis/core_cm0.c ****   __ASM("msr psp, r0");
 224:../cmsis/core_cm0.c ****   __ASM("bx lr");
 225:../cmsis/core_cm0.c **** }
 226:../cmsis/core_cm0.c **** 
 227:../cmsis/core_cm0.c **** /**
 228:../cmsis/core_cm0.c ****  * @brief  Return the Main Stack Pointer
 229:../cmsis/core_cm0.c ****  *
 230:../cmsis/core_cm0.c ****  * @return Main Stack Pointer
 231:../cmsis/core_cm0.c ****  *
 232:../cmsis/core_cm0.c ****  * Return the current value of the MSP (main stack pointer)
 233:../cmsis/core_cm0.c ****  * Cortex processor register
 234:../cmsis/core_cm0.c ****  */
 235:../cmsis/core_cm0.c **** uint32_t __get_MSP(void)
 236:../cmsis/core_cm0.c **** {
 237:../cmsis/core_cm0.c ****   __ASM("mrs r0, msp");
 238:../cmsis/core_cm0.c ****   __ASM("bx lr");
 239:../cmsis/core_cm0.c **** }
 240:../cmsis/core_cm0.c **** 
 241:../cmsis/core_cm0.c **** /**
 242:../cmsis/core_cm0.c ****  * @brief  Set the Main Stack Pointer
 243:../cmsis/core_cm0.c ****  *
 244:../cmsis/core_cm0.c ****  * @param  topOfMainStack  Main Stack Pointer
 245:../cmsis/core_cm0.c ****  *
 246:../cmsis/core_cm0.c ****  * Assign the value mainStackPointer to the MSP 
 247:../cmsis/core_cm0.c ****  * (main stack pointer) Cortex processor register
 248:../cmsis/core_cm0.c ****  */
 249:../cmsis/core_cm0.c **** void __set_MSP(uint32_t topOfMainStack)
 250:../cmsis/core_cm0.c **** {
 251:../cmsis/core_cm0.c ****   __ASM("msr msp, r0");
 252:../cmsis/core_cm0.c ****   __ASM("bx lr");
 253:../cmsis/core_cm0.c **** }
 254:../cmsis/core_cm0.c **** 
 255:../cmsis/core_cm0.c **** /**
 256:../cmsis/core_cm0.c ****  * @brief  Reverse byte order in unsigned short value
 257:../cmsis/core_cm0.c ****  *
 258:../cmsis/core_cm0.c ****  * @param  value  value to reverse
 259:../cmsis/core_cm0.c ****  * @return        reversed value
 260:../cmsis/core_cm0.c ****  *
 261:../cmsis/core_cm0.c ****  * Reverse byte order in unsigned short value
 262:../cmsis/core_cm0.c ****  */
 263:../cmsis/core_cm0.c **** uint32_t __REV16(uint16_t value)
 264:../cmsis/core_cm0.c **** {
 265:../cmsis/core_cm0.c ****   __ASM("rev16 r0, r0");
 266:../cmsis/core_cm0.c ****   __ASM("bx lr");
 267:../cmsis/core_cm0.c **** }
 268:../cmsis/core_cm0.c **** 
 269:../cmsis/core_cm0.c **** 
 270:../cmsis/core_cm0.c **** #pragma diag_default=Pe940
 271:../cmsis/core_cm0.c **** 
 272:../cmsis/core_cm0.c **** 
 273:../cmsis/core_cm0.c **** #elif (defined (__GNUC__)) /*------------------ GNU Compiler ---------------------*/
 274:../cmsis/core_cm0.c **** /* GNU gcc specific functions */
 275:../cmsis/core_cm0.c **** 
 276:../cmsis/core_cm0.c **** /**
 277:../cmsis/core_cm0.c ****  * @brief  Return the Process Stack Pointer
 278:../cmsis/core_cm0.c ****  *
 279:../cmsis/core_cm0.c ****  * @return ProcessStackPointer
 280:../cmsis/core_cm0.c ****  *
 281:../cmsis/core_cm0.c ****  * Return the actual process stack pointer
 282:../cmsis/core_cm0.c ****  */
 283:../cmsis/core_cm0.c **** uint32_t __get_PSP(void) __attribute__( ( naked ) );
 284:../cmsis/core_cm0.c **** uint32_t __get_PSP(void)
 285:../cmsis/core_cm0.c **** {
  28              		.loc 1 285 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
 286:../cmsis/core_cm0.c ****   uint32_t result=0;
 287:../cmsis/core_cm0.c **** 
 288:../cmsis/core_cm0.c ****   __ASM volatile ("MRS %0, psp\n\t" 
  33              		.loc 1 288 0
  34              		.syntax divided
  35              	@ 288 "../cmsis/core_cm0.c" 1
  36 0000 EFF30983 		MRS r3, psp
  37 0004 181C     		MOV r0, r3 
  38 0006 7047     		BX  lr     
  39              		
  40              	@ 0 "" 2
  41              		.thumb
  42              		.syntax unified
  43 0008 1C00     		movs	r4, r3
 289:../cmsis/core_cm0.c ****                   "MOV r0, %0 \n\t"
 290:../cmsis/core_cm0.c ****                   "BX  lr     \n\t"  : "=r" (result) );
 291:../cmsis/core_cm0.c ****   return(result);
  44              		.loc 1 291 0
  45 000a 2300     		movs	r3, r4
 292:../cmsis/core_cm0.c **** }
  46              		.loc 1 292 0
  47 000c 1800     		movs	r0, r3
  48              		.cfi_endproc
  49              	.LFE0:
  51 000e C046     		.section	.text.__set_PSP,"ax",%progbits
  52              		.align	2
  53              		.global	__set_PSP
  54              		.code	16
  55              		.thumb_func
  57              	__set_PSP:
  58              	.LFB1:
 293:../cmsis/core_cm0.c **** 
 294:../cmsis/core_cm0.c **** /**
 295:../cmsis/core_cm0.c ****  * @brief  Set the Process Stack Pointer
 296:../cmsis/core_cm0.c ****  *
 297:../cmsis/core_cm0.c ****  * @param  topOfProcStack  Process Stack Pointer
 298:../cmsis/core_cm0.c ****  *
 299:../cmsis/core_cm0.c ****  * Assign the value ProcessStackPointer to the MSP 
 300:../cmsis/core_cm0.c ****  * (process stack pointer) Cortex processor register
 301:../cmsis/core_cm0.c ****  */
 302:../cmsis/core_cm0.c **** void __set_PSP(uint32_t topOfProcStack) __attribute__( ( naked ) );
 303:../cmsis/core_cm0.c **** void __set_PSP(uint32_t topOfProcStack)
 304:../cmsis/core_cm0.c **** {
  59              		.loc 1 304 0
  60              		.cfi_startproc
  61              		@ Naked Function: prologue and epilogue provided by programmer.
  62              		@ args = 0, pretend = 0, frame = 0
  63              		@ frame_needed = 1, uses_anonymous_args = 0
  64 0000 0300     		movs	r3, r0
 305:../cmsis/core_cm0.c ****   __ASM volatile ("MSR psp, %0\n\t"
  65              		.loc 1 305 0
  66              		.syntax divided
  67              	@ 305 "../cmsis/core_cm0.c" 1
  68 0002 83F30988 		MSR psp, r3
  69 0006 7047     		BX  lr     
  70              		
  71              	@ 0 "" 2
 306:../cmsis/core_cm0.c ****                   "BX  lr     \n\t" : : "r" (topOfProcStack) );
 307:../cmsis/core_cm0.c **** }
  72              		.loc 1 307 0
  73              		.thumb
  74              		.syntax unified
  75 0008 C046     		nop
  76              		.cfi_endproc
  77              	.LFE1:
  79 000a C046     		.section	.text.__get_MSP,"ax",%progbits
  80              		.align	2
  81              		.global	__get_MSP
  82              		.code	16
  83              		.thumb_func
  85              	__get_MSP:
  86              	.LFB2:
 308:../cmsis/core_cm0.c **** 
 309:../cmsis/core_cm0.c **** /**
 310:../cmsis/core_cm0.c ****  * @brief  Return the Main Stack Pointer
 311:../cmsis/core_cm0.c ****  *
 312:../cmsis/core_cm0.c ****  * @return Main Stack Pointer
 313:../cmsis/core_cm0.c ****  *
 314:../cmsis/core_cm0.c ****  * Return the current value of the MSP (main stack pointer)
 315:../cmsis/core_cm0.c ****  * Cortex processor register
 316:../cmsis/core_cm0.c ****  */
 317:../cmsis/core_cm0.c **** uint32_t __get_MSP(void) __attribute__( ( naked ) );
 318:../cmsis/core_cm0.c **** uint32_t __get_MSP(void)
 319:../cmsis/core_cm0.c **** {
  87              		.loc 1 319 0
  88              		.cfi_startproc
  89              		@ Naked Function: prologue and epilogue provided by programmer.
  90              		@ args = 0, pretend = 0, frame = 0
  91              		@ frame_needed = 1, uses_anonymous_args = 0
 320:../cmsis/core_cm0.c ****   uint32_t result=0;
 321:../cmsis/core_cm0.c **** 
 322:../cmsis/core_cm0.c ****   __ASM volatile ("MRS %0, msp\n\t" 
  92              		.loc 1 322 0
  93              		.syntax divided
  94              	@ 322 "../cmsis/core_cm0.c" 1
  95 0000 EFF30883 		MRS r3, msp
  96 0004 181C     		MOV r0, r3 
  97 0006 7047     		BX  lr     
  98              		
  99              	@ 0 "" 2
 100              		.thumb
 101              		.syntax unified
 102 0008 1C00     		movs	r4, r3
 323:../cmsis/core_cm0.c ****                   "MOV r0, %0 \n\t"
 324:../cmsis/core_cm0.c ****                   "BX  lr     \n\t"  : "=r" (result) );
 325:../cmsis/core_cm0.c ****   return(result);
 103              		.loc 1 325 0
 104 000a 2300     		movs	r3, r4
 326:../cmsis/core_cm0.c **** }
 105              		.loc 1 326 0
 106 000c 1800     		movs	r0, r3
 107              		.cfi_endproc
 108              	.LFE2:
 110 000e C046     		.section	.text.__set_MSP,"ax",%progbits
 111              		.align	2
 112              		.global	__set_MSP
 113              		.code	16
 114              		.thumb_func
 116              	__set_MSP:
 117              	.LFB3:
 327:../cmsis/core_cm0.c **** 
 328:../cmsis/core_cm0.c **** /**
 329:../cmsis/core_cm0.c ****  * @brief  Set the Main Stack Pointer
 330:../cmsis/core_cm0.c ****  *
 331:../cmsis/core_cm0.c ****  * @param  topOfMainStack  Main Stack Pointer
 332:../cmsis/core_cm0.c ****  *
 333:../cmsis/core_cm0.c ****  * Assign the value mainStackPointer to the MSP 
 334:../cmsis/core_cm0.c ****  * (main stack pointer) Cortex processor register
 335:../cmsis/core_cm0.c ****  */
 336:../cmsis/core_cm0.c **** void __set_MSP(uint32_t topOfMainStack) __attribute__( ( naked ) );
 337:../cmsis/core_cm0.c **** void __set_MSP(uint32_t topOfMainStack)
 338:../cmsis/core_cm0.c **** {
 118              		.loc 1 338 0
 119              		.cfi_startproc
 120              		@ Naked Function: prologue and epilogue provided by programmer.
 121              		@ args = 0, pretend = 0, frame = 0
 122              		@ frame_needed = 1, uses_anonymous_args = 0
 123 0000 0300     		movs	r3, r0
 339:../cmsis/core_cm0.c ****   __ASM volatile ("MSR msp, %0\n\t"
 124              		.loc 1 339 0
 125              		.syntax divided
 126              	@ 339 "../cmsis/core_cm0.c" 1
 127 0002 83F30888 		MSR msp, r3
 128 0006 7047     		BX  lr     
 129              		
 130              	@ 0 "" 2
 340:../cmsis/core_cm0.c ****                   "BX  lr     \n\t" : : "r" (topOfMainStack) );
 341:../cmsis/core_cm0.c **** }
 131              		.loc 1 341 0
 132              		.thumb
 133              		.syntax unified
 134 0008 C046     		nop
 135              		.cfi_endproc
 136              	.LFE3:
 138 000a C046     		.section	.text.__get_PRIMASK,"ax",%progbits
 139              		.align	2
 140              		.global	__get_PRIMASK
 141              		.code	16
 142              		.thumb_func
 144              	__get_PRIMASK:
 145              	.LFB4:
 342:../cmsis/core_cm0.c **** 
 343:../cmsis/core_cm0.c **** 
 344:../cmsis/core_cm0.c **** /**
 345:../cmsis/core_cm0.c ****  * @brief  Return the Priority Mask value
 346:../cmsis/core_cm0.c ****  *
 347:../cmsis/core_cm0.c ****  * @return PriMask
 348:../cmsis/core_cm0.c ****  *
 349:../cmsis/core_cm0.c ****  * Return state of the priority mask bit from the priority mask register
 350:../cmsis/core_cm0.c ****  */
 351:../cmsis/core_cm0.c **** uint32_t __get_PRIMASK(void)
 352:../cmsis/core_cm0.c **** {
 146              		.loc 1 352 0
 147              		.cfi_startproc
 148              		@ args = 0, pretend = 0, frame = 8
 149              		@ frame_needed = 1, uses_anonymous_args = 0
 150 0000 80B5     		push	{r7, lr}
 151              		.cfi_def_cfa_offset 8
 152              		.cfi_offset 7, -8
 153              		.cfi_offset 14, -4
 154 0002 82B0     		sub	sp, sp, #8
 155              		.cfi_def_cfa_offset 16
 156 0004 00AF     		add	r7, sp, #0
 157              		.cfi_def_cfa_register 7
 353:../cmsis/core_cm0.c ****   uint32_t result=0;
 158              		.loc 1 353 0
 159 0006 0023     		movs	r3, #0
 160 0008 7B60     		str	r3, [r7, #4]
 354:../cmsis/core_cm0.c **** 
 355:../cmsis/core_cm0.c ****   __ASM volatile ("MRS %0, primask" : "=r" (result) );
 161              		.loc 1 355 0
 162              		.syntax divided
 163              	@ 355 "../cmsis/core_cm0.c" 1
 164 000a EFF31083 		MRS r3, primask
 165              	@ 0 "" 2
 166              		.thumb
 167              		.syntax unified
 168 000e 7B60     		str	r3, [r7, #4]
 356:../cmsis/core_cm0.c ****   return(result);
 169              		.loc 1 356 0
 170 0010 7B68     		ldr	r3, [r7, #4]
 357:../cmsis/core_cm0.c **** }
 171              		.loc 1 357 0
 172 0012 1800     		movs	r0, r3
 173 0014 BD46     		mov	sp, r7
 174 0016 02B0     		add	sp, sp, #8
 175              		@ sp needed
 176 0018 80BD     		pop	{r7, pc}
 177              		.cfi_endproc
 178              	.LFE4:
 180 001a C046     		.section	.text.__set_PRIMASK,"ax",%progbits
 181              		.align	2
 182              		.global	__set_PRIMASK
 183              		.code	16
 184              		.thumb_func
 186              	__set_PRIMASK:
 187              	.LFB5:
 358:../cmsis/core_cm0.c **** 
 359:../cmsis/core_cm0.c **** /**
 360:../cmsis/core_cm0.c ****  * @brief  Set the Priority Mask value
 361:../cmsis/core_cm0.c ****  *
 362:../cmsis/core_cm0.c ****  * @param  priMask  PriMask
 363:../cmsis/core_cm0.c ****  *
 364:../cmsis/core_cm0.c ****  * Set the priority mask bit in the priority mask register
 365:../cmsis/core_cm0.c ****  */
 366:../cmsis/core_cm0.c **** void __set_PRIMASK(uint32_t priMask)
 367:../cmsis/core_cm0.c **** {
 188              		.loc 1 367 0
 189              		.cfi_startproc
 190              		@ args = 0, pretend = 0, frame = 8
 191              		@ frame_needed = 1, uses_anonymous_args = 0
 192 0000 80B5     		push	{r7, lr}
 193              		.cfi_def_cfa_offset 8
 194              		.cfi_offset 7, -8
 195              		.cfi_offset 14, -4
 196 0002 82B0     		sub	sp, sp, #8
 197              		.cfi_def_cfa_offset 16
 198 0004 00AF     		add	r7, sp, #0
 199              		.cfi_def_cfa_register 7
 200 0006 7860     		str	r0, [r7, #4]
 368:../cmsis/core_cm0.c ****   __ASM volatile ("MSR primask, %0" : : "r" (priMask) );
 201              		.loc 1 368 0
 202 0008 7B68     		ldr	r3, [r7, #4]
 203              		.syntax divided
 204              	@ 368 "../cmsis/core_cm0.c" 1
 205 000a 83F31088 		MSR primask, r3
 206              	@ 0 "" 2
 369:../cmsis/core_cm0.c **** }
 207              		.loc 1 369 0
 208              		.thumb
 209              		.syntax unified
 210 000e C046     		nop
 211 0010 BD46     		mov	sp, r7
 212 0012 02B0     		add	sp, sp, #8
 213              		@ sp needed
 214 0014 80BD     		pop	{r7, pc}
 215              		.cfi_endproc
 216              	.LFE5:
 218 0016 C046     		.section	.text.__get_CONTROL,"ax",%progbits
 219              		.align	2
 220              		.global	__get_CONTROL
 221              		.code	16
 222              		.thumb_func
 224              	__get_CONTROL:
 225              	.LFB6:
 370:../cmsis/core_cm0.c **** 
 371:../cmsis/core_cm0.c **** /**
 372:../cmsis/core_cm0.c ****  * @brief  Return the Control Register value
 373:../cmsis/core_cm0.c **** * 
 374:../cmsis/core_cm0.c **** *  @return Control value
 375:../cmsis/core_cm0.c ****  *
 376:../cmsis/core_cm0.c ****  * Return the content of the control register
 377:../cmsis/core_cm0.c ****  */
 378:../cmsis/core_cm0.c **** uint32_t __get_CONTROL(void)
 379:../cmsis/core_cm0.c **** {
 226              		.loc 1 379 0
 227              		.cfi_startproc
 228              		@ args = 0, pretend = 0, frame = 8
 229              		@ frame_needed = 1, uses_anonymous_args = 0
 230 0000 80B5     		push	{r7, lr}
 231              		.cfi_def_cfa_offset 8
 232              		.cfi_offset 7, -8
 233              		.cfi_offset 14, -4
 234 0002 82B0     		sub	sp, sp, #8
 235              		.cfi_def_cfa_offset 16
 236 0004 00AF     		add	r7, sp, #0
 237              		.cfi_def_cfa_register 7
 380:../cmsis/core_cm0.c ****   uint32_t result=0;
 238              		.loc 1 380 0
 239 0006 0023     		movs	r3, #0
 240 0008 7B60     		str	r3, [r7, #4]
 381:../cmsis/core_cm0.c **** 
 382:../cmsis/core_cm0.c ****   __ASM volatile ("MRS %0, control" : "=r" (result) );
 241              		.loc 1 382 0
 242              		.syntax divided
 243              	@ 382 "../cmsis/core_cm0.c" 1
 244 000a EFF31483 		MRS r3, control
 245              	@ 0 "" 2
 246              		.thumb
 247              		.syntax unified
 248 000e 7B60     		str	r3, [r7, #4]
 383:../cmsis/core_cm0.c ****   return(result);
 249              		.loc 1 383 0
 250 0010 7B68     		ldr	r3, [r7, #4]
 384:../cmsis/core_cm0.c **** }
 251              		.loc 1 384 0
 252 0012 1800     		movs	r0, r3
 253 0014 BD46     		mov	sp, r7
 254 0016 02B0     		add	sp, sp, #8
 255              		@ sp needed
 256 0018 80BD     		pop	{r7, pc}
 257              		.cfi_endproc
 258              	.LFE6:
 260 001a C046     		.section	.text.__set_CONTROL,"ax",%progbits
 261              		.align	2
 262              		.global	__set_CONTROL
 263              		.code	16
 264              		.thumb_func
 266              	__set_CONTROL:
 267              	.LFB7:
 385:../cmsis/core_cm0.c **** 
 386:../cmsis/core_cm0.c **** /**
 387:../cmsis/core_cm0.c ****  * @brief  Set the Control Register value
 388:../cmsis/core_cm0.c ****  *
 389:../cmsis/core_cm0.c ****  * @param  control  Control value
 390:../cmsis/core_cm0.c ****  *
 391:../cmsis/core_cm0.c ****  * Set the control register
 392:../cmsis/core_cm0.c ****  */
 393:../cmsis/core_cm0.c **** void __set_CONTROL(uint32_t control)
 394:../cmsis/core_cm0.c **** {
 268              		.loc 1 394 0
 269              		.cfi_startproc
 270              		@ args = 0, pretend = 0, frame = 8
 271              		@ frame_needed = 1, uses_anonymous_args = 0
 272 0000 80B5     		push	{r7, lr}
 273              		.cfi_def_cfa_offset 8
 274              		.cfi_offset 7, -8
 275              		.cfi_offset 14, -4
 276 0002 82B0     		sub	sp, sp, #8
 277              		.cfi_def_cfa_offset 16
 278 0004 00AF     		add	r7, sp, #0
 279              		.cfi_def_cfa_register 7
 280 0006 7860     		str	r0, [r7, #4]
 395:../cmsis/core_cm0.c ****   __ASM volatile ("MSR control, %0" : : "r" (control) );
 281              		.loc 1 395 0
 282 0008 7B68     		ldr	r3, [r7, #4]
 283              		.syntax divided
 284              	@ 395 "../cmsis/core_cm0.c" 1
 285 000a 83F31488 		MSR control, r3
 286              	@ 0 "" 2
 396:../cmsis/core_cm0.c **** }
 287              		.loc 1 396 0
 288              		.thumb
 289              		.syntax unified
 290 000e C046     		nop
 291 0010 BD46     		mov	sp, r7
 292 0012 02B0     		add	sp, sp, #8
 293              		@ sp needed
 294 0014 80BD     		pop	{r7, pc}
 295              		.cfi_endproc
 296              	.LFE7:
 298 0016 C046     		.section	.text.__REV,"ax",%progbits
 299              		.align	2
 300              		.global	__REV
 301              		.code	16
 302              		.thumb_func
 304              	__REV:
 305              	.LFB8:
 397:../cmsis/core_cm0.c **** 
 398:../cmsis/core_cm0.c **** 
 399:../cmsis/core_cm0.c **** /**
 400:../cmsis/core_cm0.c ****  * @brief  Reverse byte order in integer value
 401:../cmsis/core_cm0.c ****  *
 402:../cmsis/core_cm0.c ****  * @param  value  value to reverse
 403:../cmsis/core_cm0.c ****  * @return        reversed value
 404:../cmsis/core_cm0.c ****  *
 405:../cmsis/core_cm0.c ****  * Reverse byte order in integer value
 406:../cmsis/core_cm0.c ****  */
 407:../cmsis/core_cm0.c **** uint32_t __REV(uint32_t value)
 408:../cmsis/core_cm0.c **** {
 306              		.loc 1 408 0
 307              		.cfi_startproc
 308              		@ args = 0, pretend = 0, frame = 16
 309              		@ frame_needed = 1, uses_anonymous_args = 0
 310 0000 80B5     		push	{r7, lr}
 311              		.cfi_def_cfa_offset 8
 312              		.cfi_offset 7, -8
 313              		.cfi_offset 14, -4
 314 0002 84B0     		sub	sp, sp, #16
 315              		.cfi_def_cfa_offset 24
 316 0004 00AF     		add	r7, sp, #0
 317              		.cfi_def_cfa_register 7
 318 0006 7860     		str	r0, [r7, #4]
 409:../cmsis/core_cm0.c ****   uint32_t result=0;
 319              		.loc 1 409 0
 320 0008 0023     		movs	r3, #0
 321 000a FB60     		str	r3, [r7, #12]
 410:../cmsis/core_cm0.c ****   
 411:../cmsis/core_cm0.c ****   __ASM volatile ("rev %0, %1" : "=r" (result) : "r" (value) );
 322              		.loc 1 411 0
 323 000c 7B68     		ldr	r3, [r7, #4]
 324              		.syntax divided
 325              	@ 411 "../cmsis/core_cm0.c" 1
 326 000e 1BBA     		rev r3, r3
 327              	@ 0 "" 2
 328              		.thumb
 329              		.syntax unified
 330 0010 FB60     		str	r3, [r7, #12]
 412:../cmsis/core_cm0.c ****   return(result);
 331              		.loc 1 412 0
 332 0012 FB68     		ldr	r3, [r7, #12]
 413:../cmsis/core_cm0.c **** }
 333              		.loc 1 413 0
 334 0014 1800     		movs	r0, r3
 335 0016 BD46     		mov	sp, r7
 336 0018 04B0     		add	sp, sp, #16
 337              		@ sp needed
 338 001a 80BD     		pop	{r7, pc}
 339              		.cfi_endproc
 340              	.LFE8:
 342              		.section	.text.__REV16,"ax",%progbits
 343              		.align	2
 344              		.global	__REV16
 345              		.code	16
 346              		.thumb_func
 348              	__REV16:
 349              	.LFB9:
 414:../cmsis/core_cm0.c **** 
 415:../cmsis/core_cm0.c **** /**
 416:../cmsis/core_cm0.c ****  * @brief  Reverse byte order in unsigned short value
 417:../cmsis/core_cm0.c ****  *
 418:../cmsis/core_cm0.c ****  * @param  value  value to reverse
 419:../cmsis/core_cm0.c ****  * @return        reversed value
 420:../cmsis/core_cm0.c ****  *
 421:../cmsis/core_cm0.c ****  * Reverse byte order in unsigned short value
 422:../cmsis/core_cm0.c ****  */
 423:../cmsis/core_cm0.c **** uint32_t __REV16(uint16_t value)
 424:../cmsis/core_cm0.c **** {
 350              		.loc 1 424 0
 351              		.cfi_startproc
 352              		@ args = 0, pretend = 0, frame = 16
 353              		@ frame_needed = 1, uses_anonymous_args = 0
 354 0000 80B5     		push	{r7, lr}
 355              		.cfi_def_cfa_offset 8
 356              		.cfi_offset 7, -8
 357              		.cfi_offset 14, -4
 358 0002 84B0     		sub	sp, sp, #16
 359              		.cfi_def_cfa_offset 24
 360 0004 00AF     		add	r7, sp, #0
 361              		.cfi_def_cfa_register 7
 362 0006 0200     		movs	r2, r0
 363 0008 BB1D     		adds	r3, r7, #6
 364 000a 1A80     		strh	r2, [r3]
 425:../cmsis/core_cm0.c ****   uint32_t result=0;
 365              		.loc 1 425 0
 366 000c 0023     		movs	r3, #0
 367 000e FB60     		str	r3, [r7, #12]
 426:../cmsis/core_cm0.c ****   
 427:../cmsis/core_cm0.c ****   __ASM volatile ("rev16 %0, %1" : "=r" (result) : "r" (value) );
 368              		.loc 1 427 0
 369 0010 BB1D     		adds	r3, r7, #6
 370 0012 1B88     		ldrh	r3, [r3]
 371              		.syntax divided
 372              	@ 427 "../cmsis/core_cm0.c" 1
 373 0014 5BBA     		rev16 r3, r3
 374              	@ 0 "" 2
 375              		.thumb
 376              		.syntax unified
 377 0016 FB60     		str	r3, [r7, #12]
 428:../cmsis/core_cm0.c ****   return(result);
 378              		.loc 1 428 0
 379 0018 FB68     		ldr	r3, [r7, #12]
 429:../cmsis/core_cm0.c **** }
 380              		.loc 1 429 0
 381 001a 1800     		movs	r0, r3
 382 001c BD46     		mov	sp, r7
 383 001e 04B0     		add	sp, sp, #16
 384              		@ sp needed
 385 0020 80BD     		pop	{r7, pc}
 386              		.cfi_endproc
 387              	.LFE9:
 389 0022 C046     		.section	.text.__REVSH,"ax",%progbits
 390              		.align	2
 391              		.global	__REVSH
 392              		.code	16
 393              		.thumb_func
 395              	__REVSH:
 396              	.LFB10:
 430:../cmsis/core_cm0.c **** 
 431:../cmsis/core_cm0.c **** /**
 432:../cmsis/core_cm0.c ****  * @brief  Reverse byte order in signed short value with sign extension to integer
 433:../cmsis/core_cm0.c ****  *
 434:../cmsis/core_cm0.c ****  * @param  value  value to reverse
 435:../cmsis/core_cm0.c ****  * @return        reversed value
 436:../cmsis/core_cm0.c ****  *
 437:../cmsis/core_cm0.c ****  * Reverse byte order in signed short value with sign extension to integer
 438:../cmsis/core_cm0.c ****  */
 439:../cmsis/core_cm0.c **** int32_t __REVSH(int16_t value)
 440:../cmsis/core_cm0.c **** {
 397              		.loc 1 440 0
 398              		.cfi_startproc
 399              		@ args = 0, pretend = 0, frame = 16
 400              		@ frame_needed = 1, uses_anonymous_args = 0
 401 0000 80B5     		push	{r7, lr}
 402              		.cfi_def_cfa_offset 8
 403              		.cfi_offset 7, -8
 404              		.cfi_offset 14, -4
 405 0002 84B0     		sub	sp, sp, #16
 406              		.cfi_def_cfa_offset 24
 407 0004 00AF     		add	r7, sp, #0
 408              		.cfi_def_cfa_register 7
 409 0006 0200     		movs	r2, r0
 410 0008 BB1D     		adds	r3, r7, #6
 411 000a 1A80     		strh	r2, [r3]
 441:../cmsis/core_cm0.c ****   uint32_t result=0;
 412              		.loc 1 441 0
 413 000c 0023     		movs	r3, #0
 414 000e FB60     		str	r3, [r7, #12]
 442:../cmsis/core_cm0.c ****   
 443:../cmsis/core_cm0.c ****   __ASM volatile ("revsh %0, %1" : "=r" (result) : "r" (value) );
 415              		.loc 1 443 0
 416 0010 BB1D     		adds	r3, r7, #6
 417 0012 1B88     		ldrh	r3, [r3]
 418              		.syntax divided
 419              	@ 443 "../cmsis/core_cm0.c" 1
 420 0014 DBBA     		revsh r3, r3
 421              	@ 0 "" 2
 422              		.thumb
 423              		.syntax unified
 424 0016 FB60     		str	r3, [r7, #12]
 444:../cmsis/core_cm0.c ****   return(result);
 425              		.loc 1 444 0
 426 0018 FB68     		ldr	r3, [r7, #12]
 445:../cmsis/core_cm0.c **** }
 427              		.loc 1 445 0
 428 001a 1800     		movs	r0, r3
 429 001c BD46     		mov	sp, r7
 430 001e 04B0     		add	sp, sp, #16
 431              		@ sp needed
 432 0020 80BD     		pop	{r7, pc}
 433              		.cfi_endproc
 434              	.LFE10:
 436 0022 C046     		.text
 437              	.Letext0:
 438              		.file 2 "/usr/local/lpcxpresso_8.2.2_650/lpcxpresso/tools/redlib/include/stdint.h"
DEFINED SYMBOLS
                            *ABS*:00000000 core_cm0.c
     /tmp/ccM9WlDh.s:20     .text.__get_PSP:00000000 $t
     /tmp/ccM9WlDh.s:25     .text.__get_PSP:00000000 __get_PSP
     /tmp/ccM9WlDh.s:52     .text.__set_PSP:00000000 $t
     /tmp/ccM9WlDh.s:57     .text.__set_PSP:00000000 __set_PSP
     /tmp/ccM9WlDh.s:80     .text.__get_MSP:00000000 $t
     /tmp/ccM9WlDh.s:85     .text.__get_MSP:00000000 __get_MSP
     /tmp/ccM9WlDh.s:111    .text.__set_MSP:00000000 $t
     /tmp/ccM9WlDh.s:116    .text.__set_MSP:00000000 __set_MSP
     /tmp/ccM9WlDh.s:139    .text.__get_PRIMASK:00000000 $t
     /tmp/ccM9WlDh.s:144    .text.__get_PRIMASK:00000000 __get_PRIMASK
     /tmp/ccM9WlDh.s:181    .text.__set_PRIMASK:00000000 $t
     /tmp/ccM9WlDh.s:186    .text.__set_PRIMASK:00000000 __set_PRIMASK
     /tmp/ccM9WlDh.s:219    .text.__get_CONTROL:00000000 $t
     /tmp/ccM9WlDh.s:224    .text.__get_CONTROL:00000000 __get_CONTROL
     /tmp/ccM9WlDh.s:261    .text.__set_CONTROL:00000000 $t
     /tmp/ccM9WlDh.s:266    .text.__set_CONTROL:00000000 __set_CONTROL
     /tmp/ccM9WlDh.s:299    .text.__REV:00000000 $t
     /tmp/ccM9WlDh.s:304    .text.__REV:00000000 __REV
     /tmp/ccM9WlDh.s:343    .text.__REV16:00000000 $t
     /tmp/ccM9WlDh.s:348    .text.__REV16:00000000 __REV16
     /tmp/ccM9WlDh.s:390    .text.__REVSH:00000000 $t
     /tmp/ccM9WlDh.s:395    .text.__REVSH:00000000 __REVSH
                     .debug_frame:00000010 $d
                           .group:00000000 wm4.0.935e200dcf4f236f804f4066baa4d700
                           .group:00000000 wm4.redlib_version.h.14.62abddb5b4efb2dd619a7dca5647eb78
                           .group:00000000 wm4.libconfigarm.h.18.48d18a57a6aa6fedadbcea02294a713f
                           .group:00000000 wm4.stdint.h.30.30f575a65a9bde434c705acf40986e1b

NO UNDEFINED SYMBOLS
