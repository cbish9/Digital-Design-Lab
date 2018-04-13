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
  15              		.file	"system_LPC11xx.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.section	.text.__NOP,"ax",%progbits
  20              		.align	2
  21              		.code	16
  22              		.thumb_func
  24              	__NOP:
  25              	.LFB4:
  26              		.file 1 "../cmsis/core_cm0.h"
   1:../cmsis/core_cm0.h **** /**************************************************************************//**
   2:../cmsis/core_cm0.h ****  * $Id:: core_cm0.h 4785 2010-09-03 22:39:27Z nxp21346                    $
   3:../cmsis/core_cm0.h ****  *
   4:../cmsis/core_cm0.h ****  * @file     core_cm0.h
   5:../cmsis/core_cm0.h ****  * @brief    CMSIS Cortex-M0 Core Peripheral Access Layer Header File
   6:../cmsis/core_cm0.h ****  * @version  V1.30
   7:../cmsis/core_cm0.h ****  * @date     30. October 2009
   8:../cmsis/core_cm0.h ****  *
   9:../cmsis/core_cm0.h ****  * @note
  10:../cmsis/core_cm0.h ****  * Copyright (C) 2009 ARM Limited. All rights reserved.
  11:../cmsis/core_cm0.h ****  *
  12:../cmsis/core_cm0.h ****  * @par
  13:../cmsis/core_cm0.h ****  * ARM Limited (ARM) is supplying this software for use with Cortex-M 
  14:../cmsis/core_cm0.h ****  * processor based microcontrollers.  This file can be freely distributed 
  15:../cmsis/core_cm0.h ****  * within development tools that are supporting such ARM based processors. 
  16:../cmsis/core_cm0.h ****  *
  17:../cmsis/core_cm0.h ****  * @par
  18:../cmsis/core_cm0.h ****  * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
  19:../cmsis/core_cm0.h ****  * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
  20:../cmsis/core_cm0.h ****  * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
  21:../cmsis/core_cm0.h ****  * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
  22:../cmsis/core_cm0.h ****  * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
  23:../cmsis/core_cm0.h ****  *
  24:../cmsis/core_cm0.h ****  ******************************************************************************/
  25:../cmsis/core_cm0.h **** 
  26:../cmsis/core_cm0.h **** #ifndef __CM0_CORE_H__
  27:../cmsis/core_cm0.h **** #define __CM0_CORE_H__
  28:../cmsis/core_cm0.h **** 
  29:../cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_core_LintCinfiguration CMSIS CM0 Core Lint Configuration
  30:../cmsis/core_cm0.h ****  *
  31:../cmsis/core_cm0.h ****  * List of Lint messages which will be suppressed and not shown:
  32:../cmsis/core_cm0.h ****  *   - not yet checked
  33:../cmsis/core_cm0.h ****  * .
  34:../cmsis/core_cm0.h ****  * Note:  To re-enable a Message, insert a space before 'lint' *
  35:../cmsis/core_cm0.h ****  *
  36:../cmsis/core_cm0.h ****  */
  37:../cmsis/core_cm0.h **** 
  38:../cmsis/core_cm0.h **** 
  39:../cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_core_definitions CM0 Core Definitions
  40:../cmsis/core_cm0.h ****   This file defines all structures and symbols for CMSIS core:
  41:../cmsis/core_cm0.h ****     - CMSIS version number
  42:../cmsis/core_cm0.h ****     - Cortex-M core registers and bitfields
  43:../cmsis/core_cm0.h ****     - Cortex-M core peripheral base address
  44:../cmsis/core_cm0.h ****   @{
  45:../cmsis/core_cm0.h ****  */
  46:../cmsis/core_cm0.h **** 
  47:../cmsis/core_cm0.h **** #ifdef __cplusplus
  48:../cmsis/core_cm0.h ****  extern "C" {
  49:../cmsis/core_cm0.h **** #endif 
  50:../cmsis/core_cm0.h **** 
  51:../cmsis/core_cm0.h **** #define __CM0_CMSIS_VERSION_MAIN  (0x01)                                                       /*!<
  52:../cmsis/core_cm0.h **** #define __CM0_CMSIS_VERSION_SUB   (0x30)                                                       /*!<
  53:../cmsis/core_cm0.h **** #define __CM0_CMSIS_VERSION       ((__CM0_CMSIS_VERSION_MAIN << 16) | __CM0_CMSIS_VERSION_SUB) /*!<
  54:../cmsis/core_cm0.h **** 
  55:../cmsis/core_cm0.h **** #define __CORTEX_M                (0x00)                                                       /*!<
  56:../cmsis/core_cm0.h **** 
  57:../cmsis/core_cm0.h **** #include <stdint.h>                           /* Include standard types */
  58:../cmsis/core_cm0.h **** 
  59:../cmsis/core_cm0.h **** #if defined (__ICCARM__)
  60:../cmsis/core_cm0.h ****   #include <intrinsics.h>                     /* IAR Intrinsics   */
  61:../cmsis/core_cm0.h **** #endif
  62:../cmsis/core_cm0.h **** 
  63:../cmsis/core_cm0.h **** 
  64:../cmsis/core_cm0.h **** #ifndef __NVIC_PRIO_BITS
  65:../cmsis/core_cm0.h ****   #define __NVIC_PRIO_BITS    2               /*!< standard definition for NVIC Priority Bits */
  66:../cmsis/core_cm0.h **** #endif
  67:../cmsis/core_cm0.h **** 
  68:../cmsis/core_cm0.h **** 
  69:../cmsis/core_cm0.h **** 
  70:../cmsis/core_cm0.h **** 
  71:../cmsis/core_cm0.h **** /**
  72:../cmsis/core_cm0.h ****  * IO definitions
  73:../cmsis/core_cm0.h ****  *
  74:../cmsis/core_cm0.h ****  * define access restrictions to peripheral registers
  75:../cmsis/core_cm0.h ****  */
  76:../cmsis/core_cm0.h **** 
  77:../cmsis/core_cm0.h **** #ifdef __cplusplus
  78:../cmsis/core_cm0.h ****   #define     __I     volatile                /*!< defines 'read only' permissions      */
  79:../cmsis/core_cm0.h **** #else
  80:../cmsis/core_cm0.h ****   #define     __I     volatile const          /*!< defines 'read only' permissions      */
  81:../cmsis/core_cm0.h **** #endif
  82:../cmsis/core_cm0.h **** #define     __O     volatile                  /*!< defines 'write only' permissions     */
  83:../cmsis/core_cm0.h **** #define     __IO    volatile                  /*!< defines 'read / write' permissions   */
  84:../cmsis/core_cm0.h **** 
  85:../cmsis/core_cm0.h **** 
  86:../cmsis/core_cm0.h **** 
  87:../cmsis/core_cm0.h **** /*******************************************************************************
  88:../cmsis/core_cm0.h ****  *                 Register Abstraction
  89:../cmsis/core_cm0.h ****  ******************************************************************************/
  90:../cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_core_register CMSIS CM0 Core Register
  91:../cmsis/core_cm0.h ****  @{
  92:../cmsis/core_cm0.h **** */
  93:../cmsis/core_cm0.h **** 
  94:../cmsis/core_cm0.h **** 
  95:../cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_NVIC CMSIS CM0 NVIC
  96:../cmsis/core_cm0.h ****   memory mapped structure for Nested Vectored Interrupt Controller (NVIC)
  97:../cmsis/core_cm0.h ****   @{
  98:../cmsis/core_cm0.h ****  */
  99:../cmsis/core_cm0.h **** typedef struct
 100:../cmsis/core_cm0.h **** {
 101:../cmsis/core_cm0.h ****   __IO uint32_t ISER[1];                      /*!< (Offset: 0x000) Interrupt Set Enable Register   
 102:../cmsis/core_cm0.h ****        uint32_t RESERVED0[31];
 103:../cmsis/core_cm0.h ****   __IO uint32_t ICER[1];                      /*!< (Offset: 0x080) Interrupt Clear Enable Register 
 104:../cmsis/core_cm0.h ****        uint32_t RSERVED1[31];
 105:../cmsis/core_cm0.h ****   __IO uint32_t ISPR[1];                      /*!< (Offset: 0x100) Interrupt Set Pending Register  
 106:../cmsis/core_cm0.h ****        uint32_t RESERVED2[31];
 107:../cmsis/core_cm0.h ****   __IO uint32_t ICPR[1];                      /*!< (Offset: 0x180) Interrupt Clear Pending Register
 108:../cmsis/core_cm0.h ****        uint32_t RESERVED3[31];
 109:../cmsis/core_cm0.h ****        uint32_t RESERVED4[64];
 110:../cmsis/core_cm0.h ****   __IO uint32_t IPR[8];                       /*!< (Offset: 0x3EC) Interrupt Priority Register     
 111:../cmsis/core_cm0.h **** }  NVIC_Type;
 112:../cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_NVIC */
 113:../cmsis/core_cm0.h **** 
 114:../cmsis/core_cm0.h **** 
 115:../cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_SCB CMSIS CM0 SCB
 116:../cmsis/core_cm0.h ****   memory mapped structure for System Control Block (SCB)
 117:../cmsis/core_cm0.h ****   @{
 118:../cmsis/core_cm0.h ****  */
 119:../cmsis/core_cm0.h **** typedef struct
 120:../cmsis/core_cm0.h **** {
 121:../cmsis/core_cm0.h ****   __I  uint32_t CPUID;                        /*!< Offset: 0x00  CPU ID Base Register              
 122:../cmsis/core_cm0.h ****   __IO uint32_t ICSR;                         /*!< Offset: 0x04  Interrupt Control State Register  
 123:../cmsis/core_cm0.h ****        uint32_t RESERVED0;                                      
 124:../cmsis/core_cm0.h ****   __IO uint32_t AIRCR;                        /*!< Offset: 0x0C  Application Interrupt / Reset Cont
 125:../cmsis/core_cm0.h ****   __IO uint32_t SCR;                          /*!< Offset: 0x10  System Control Register           
 126:../cmsis/core_cm0.h ****   __IO uint32_t CCR;                          /*!< Offset: 0x14  Configuration Control Register    
 127:../cmsis/core_cm0.h ****        uint32_t RESERVED1;                                      
 128:../cmsis/core_cm0.h ****   __IO uint32_t SHP[2];                       /*!< Offset: 0x1C  System Handlers Priority Registers
 129:../cmsis/core_cm0.h ****   __IO uint32_t SHCSR;                        /*!< Offset: 0x24  System Handler Control and State R
 130:../cmsis/core_cm0.h ****        uint32_t RESERVED2[2];                                   
 131:../cmsis/core_cm0.h ****   __IO uint32_t DFSR;                         /*!< Offset: 0x30  Debug Fault Status Register       
 132:../cmsis/core_cm0.h **** } SCB_Type;                                                
 133:../cmsis/core_cm0.h **** 
 134:../cmsis/core_cm0.h **** /* SCB CPUID Register Definitions */
 135:../cmsis/core_cm0.h **** #define SCB_CPUID_IMPLEMENTER_Pos          24                                             /*!< SCB 
 136:../cmsis/core_cm0.h **** #define SCB_CPUID_IMPLEMENTER_Msk          (0xFFul << SCB_CPUID_IMPLEMENTER_Pos)          /*!< SCB 
 137:../cmsis/core_cm0.h **** 
 138:../cmsis/core_cm0.h **** #define SCB_CPUID_VARIANT_Pos              20                                             /*!< SCB 
 139:../cmsis/core_cm0.h **** #define SCB_CPUID_VARIANT_Msk              (0xFul << SCB_CPUID_VARIANT_Pos)               /*!< SCB 
 140:../cmsis/core_cm0.h **** 
 141:../cmsis/core_cm0.h **** #define SCB_CPUID_ARCHITECTURE_Pos         16                                             /*!< SCB 
 142:../cmsis/core_cm0.h **** #define SCB_CPUID_ARCHITECTURE_Msk         (0xFul << SCB_CPUID_ARCHITECTURE_Pos)          /*!< SCB 
 143:../cmsis/core_cm0.h **** 
 144:../cmsis/core_cm0.h **** #define SCB_CPUID_PARTNO_Pos                4                                             /*!< SCB 
 145:../cmsis/core_cm0.h **** #define SCB_CPUID_PARTNO_Msk               (0xFFFul << SCB_CPUID_PARTNO_Pos)              /*!< SCB 
 146:../cmsis/core_cm0.h **** 
 147:../cmsis/core_cm0.h **** #define SCB_CPUID_REVISION_Pos              0                                             /*!< SCB 
 148:../cmsis/core_cm0.h **** #define SCB_CPUID_REVISION_Msk             (0xFul << SCB_CPUID_REVISION_Pos)              /*!< SCB 
 149:../cmsis/core_cm0.h **** 
 150:../cmsis/core_cm0.h **** /* SCB Interrupt Control State Register Definitions */
 151:../cmsis/core_cm0.h **** #define SCB_ICSR_NMIPENDSET_Pos            31                                             /*!< SCB 
 152:../cmsis/core_cm0.h **** #define SCB_ICSR_NMIPENDSET_Msk            (1ul << SCB_ICSR_NMIPENDSET_Pos)               /*!< SCB 
 153:../cmsis/core_cm0.h **** 
 154:../cmsis/core_cm0.h **** #define SCB_ICSR_PENDSVSET_Pos             28                                             /*!< SCB 
 155:../cmsis/core_cm0.h **** #define SCB_ICSR_PENDSVSET_Msk             (1ul << SCB_ICSR_PENDSVSET_Pos)                /*!< SCB 
 156:../cmsis/core_cm0.h **** 
 157:../cmsis/core_cm0.h **** #define SCB_ICSR_PENDSVCLR_Pos             27                                             /*!< SCB 
 158:../cmsis/core_cm0.h **** #define SCB_ICSR_PENDSVCLR_Msk             (1ul << SCB_ICSR_PENDSVCLR_Pos)                /*!< SCB 
 159:../cmsis/core_cm0.h **** 
 160:../cmsis/core_cm0.h **** #define SCB_ICSR_PENDSTSET_Pos             26                                             /*!< SCB 
 161:../cmsis/core_cm0.h **** #define SCB_ICSR_PENDSTSET_Msk             (1ul << SCB_ICSR_PENDSTSET_Pos)                /*!< SCB 
 162:../cmsis/core_cm0.h **** 
 163:../cmsis/core_cm0.h **** #define SCB_ICSR_PENDSTCLR_Pos             25                                             /*!< SCB 
 164:../cmsis/core_cm0.h **** #define SCB_ICSR_PENDSTCLR_Msk             (1ul << SCB_ICSR_PENDSTCLR_Pos)                /*!< SCB 
 165:../cmsis/core_cm0.h **** 
 166:../cmsis/core_cm0.h **** #define SCB_ICSR_ISRPREEMPT_Pos            23                                             /*!< SCB 
 167:../cmsis/core_cm0.h **** #define SCB_ICSR_ISRPREEMPT_Msk            (1ul << SCB_ICSR_ISRPREEMPT_Pos)               /*!< SCB 
 168:../cmsis/core_cm0.h **** 
 169:../cmsis/core_cm0.h **** #define SCB_ICSR_ISRPENDING_Pos            22                                             /*!< SCB 
 170:../cmsis/core_cm0.h **** #define SCB_ICSR_ISRPENDING_Msk            (1ul << SCB_ICSR_ISRPENDING_Pos)               /*!< SCB 
 171:../cmsis/core_cm0.h **** 
 172:../cmsis/core_cm0.h **** #define SCB_ICSR_VECTPENDING_Pos           12                                             /*!< SCB 
 173:../cmsis/core_cm0.h **** #define SCB_ICSR_VECTPENDING_Msk           (0x1FFul << SCB_ICSR_VECTPENDING_Pos)          /*!< SCB 
 174:../cmsis/core_cm0.h **** 
 175:../cmsis/core_cm0.h **** #define SCB_ICSR_VECTACTIVE_Pos             0                                             /*!< SCB 
 176:../cmsis/core_cm0.h **** #define SCB_ICSR_VECTACTIVE_Msk            (0x1FFul << SCB_ICSR_VECTACTIVE_Pos)           /*!< SCB 
 177:../cmsis/core_cm0.h **** 
 178:../cmsis/core_cm0.h **** /* SCB Application Interrupt and Reset Control Register Definitions */
 179:../cmsis/core_cm0.h **** #define SCB_AIRCR_VECTKEY_Pos              16                                             /*!< SCB 
 180:../cmsis/core_cm0.h **** #define SCB_AIRCR_VECTKEY_Msk              (0xFFFFul << SCB_AIRCR_VECTKEY_Pos)            /*!< SCB 
 181:../cmsis/core_cm0.h **** 
 182:../cmsis/core_cm0.h **** #define SCB_AIRCR_VECTKEYSTAT_Pos          16                                             /*!< SCB 
 183:../cmsis/core_cm0.h **** #define SCB_AIRCR_VECTKEYSTAT_Msk          (0xFFFFul << SCB_AIRCR_VECTKEYSTAT_Pos)        /*!< SCB 
 184:../cmsis/core_cm0.h **** 
 185:../cmsis/core_cm0.h **** #define SCB_AIRCR_ENDIANESS_Pos            15                                             /*!< SCB 
 186:../cmsis/core_cm0.h **** #define SCB_AIRCR_ENDIANESS_Msk            (1ul << SCB_AIRCR_ENDIANESS_Pos)               /*!< SCB 
 187:../cmsis/core_cm0.h **** 
 188:../cmsis/core_cm0.h **** #define SCB_AIRCR_SYSRESETREQ_Pos           2                                             /*!< SCB 
 189:../cmsis/core_cm0.h **** #define SCB_AIRCR_SYSRESETREQ_Msk          (1ul << SCB_AIRCR_SYSRESETREQ_Pos)             /*!< SCB 
 190:../cmsis/core_cm0.h **** 
 191:../cmsis/core_cm0.h **** #define SCB_AIRCR_VECTCLRACTIVE_Pos         1                                             /*!< SCB 
 192:../cmsis/core_cm0.h **** #define SCB_AIRCR_VECTCLRACTIVE_Msk        (1ul << SCB_AIRCR_VECTCLRACTIVE_Pos)           /*!< SCB 
 193:../cmsis/core_cm0.h **** 
 194:../cmsis/core_cm0.h **** /* SCB System Control Register Definitions */
 195:../cmsis/core_cm0.h **** #define SCB_SCR_SEVONPEND_Pos               4                                             /*!< SCB 
 196:../cmsis/core_cm0.h **** #define SCB_SCR_SEVONPEND_Msk              (1ul << SCB_SCR_SEVONPEND_Pos)                 /*!< SCB 
 197:../cmsis/core_cm0.h **** 
 198:../cmsis/core_cm0.h **** #define SCB_SCR_SLEEPDEEP_Pos               2                                             /*!< SCB 
 199:../cmsis/core_cm0.h **** #define SCB_SCR_SLEEPDEEP_Msk              (1ul << SCB_SCR_SLEEPDEEP_Pos)                 /*!< SCB 
 200:../cmsis/core_cm0.h **** 
 201:../cmsis/core_cm0.h **** #define SCB_SCR_SLEEPONEXIT_Pos             1                                             /*!< SCB 
 202:../cmsis/core_cm0.h **** #define SCB_SCR_SLEEPONEXIT_Msk            (1ul << SCB_SCR_SLEEPONEXIT_Pos)               /*!< SCB 
 203:../cmsis/core_cm0.h **** 
 204:../cmsis/core_cm0.h **** /* SCB Configuration Control Register Definitions */
 205:../cmsis/core_cm0.h **** #define SCB_CCR_STKALIGN_Pos                9                                             /*!< SCB 
 206:../cmsis/core_cm0.h **** #define SCB_CCR_STKALIGN_Msk               (1ul << SCB_CCR_STKALIGN_Pos)                  /*!< SCB 
 207:../cmsis/core_cm0.h **** 
 208:../cmsis/core_cm0.h **** #define SCB_CCR_UNALIGN_TRP_Pos             3                                             /*!< SCB 
 209:../cmsis/core_cm0.h **** #define SCB_CCR_UNALIGN_TRP_Msk            (1ul << SCB_CCR_UNALIGN_TRP_Pos)               /*!< SCB 
 210:../cmsis/core_cm0.h **** 
 211:../cmsis/core_cm0.h **** /* SCB System Handler Control and State Register Definitions */
 212:../cmsis/core_cm0.h **** #define SCB_SHCSR_SVCALLPENDED_Pos         15                                             /*!< SCB 
 213:../cmsis/core_cm0.h **** #define SCB_SHCSR_SVCALLPENDED_Msk         (1ul << SCB_SHCSR_SVCALLPENDED_Pos)            /*!< SCB 
 214:../cmsis/core_cm0.h **** 
 215:../cmsis/core_cm0.h **** /* SCB Debug Fault Status Register Definitions */
 216:../cmsis/core_cm0.h **** #define SCB_DFSR_EXTERNAL_Pos               4                                             /*!< SCB 
 217:../cmsis/core_cm0.h **** #define SCB_DFSR_EXTERNAL_Msk              (1ul << SCB_DFSR_EXTERNAL_Pos)                 /*!< SCB 
 218:../cmsis/core_cm0.h **** 
 219:../cmsis/core_cm0.h **** #define SCB_DFSR_VCATCH_Pos                 3                                             /*!< SCB 
 220:../cmsis/core_cm0.h **** #define SCB_DFSR_VCATCH_Msk                (1ul << SCB_DFSR_VCATCH_Pos)                   /*!< SCB 
 221:../cmsis/core_cm0.h **** 
 222:../cmsis/core_cm0.h **** #define SCB_DFSR_DWTTRAP_Pos                2                                             /*!< SCB 
 223:../cmsis/core_cm0.h **** #define SCB_DFSR_DWTTRAP_Msk               (1ul << SCB_DFSR_DWTTRAP_Pos)                  /*!< SCB 
 224:../cmsis/core_cm0.h **** 
 225:../cmsis/core_cm0.h **** #define SCB_DFSR_BKPT_Pos                   1                                             /*!< SCB 
 226:../cmsis/core_cm0.h **** #define SCB_DFSR_BKPT_Msk                  (1ul << SCB_DFSR_BKPT_Pos)                     /*!< SCB 
 227:../cmsis/core_cm0.h **** 
 228:../cmsis/core_cm0.h **** #define SCB_DFSR_HALTED_Pos                 0                                             /*!< SCB 
 229:../cmsis/core_cm0.h **** #define SCB_DFSR_HALTED_Msk                (1ul << SCB_DFSR_HALTED_Pos)                   /*!< SCB 
 230:../cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_SCB */
 231:../cmsis/core_cm0.h **** 
 232:../cmsis/core_cm0.h **** 
 233:../cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_SysTick CMSIS CM0 SysTick
 234:../cmsis/core_cm0.h ****   memory mapped structure for SysTick
 235:../cmsis/core_cm0.h ****   @{
 236:../cmsis/core_cm0.h ****  */
 237:../cmsis/core_cm0.h **** typedef struct
 238:../cmsis/core_cm0.h **** {
 239:../cmsis/core_cm0.h ****   __IO uint32_t CTRL;                         /*!< Offset: 0x00  SysTick Control and Status Registe
 240:../cmsis/core_cm0.h ****   __IO uint32_t LOAD;                         /*!< Offset: 0x04  SysTick Reload Value Register     
 241:../cmsis/core_cm0.h ****   __IO uint32_t VAL;                          /*!< Offset: 0x08  SysTick Current Value Register    
 242:../cmsis/core_cm0.h ****   __I  uint32_t CALIB;                        /*!< Offset: 0x0C  SysTick Calibration Register      
 243:../cmsis/core_cm0.h **** } SysTick_Type;
 244:../cmsis/core_cm0.h **** 
 245:../cmsis/core_cm0.h **** /* SysTick Control / Status Register Definitions */
 246:../cmsis/core_cm0.h **** #define SysTick_CTRL_COUNTFLAG_Pos         16                                             /*!< SysT
 247:../cmsis/core_cm0.h **** #define SysTick_CTRL_COUNTFLAG_Msk         (1ul << SysTick_CTRL_COUNTFLAG_Pos)            /*!< SysT
 248:../cmsis/core_cm0.h **** 
 249:../cmsis/core_cm0.h **** #define SysTick_CTRL_CLKSOURCE_Pos          2                                             /*!< SysT
 250:../cmsis/core_cm0.h **** #define SysTick_CTRL_CLKSOURCE_Msk         (1ul << SysTick_CTRL_CLKSOURCE_Pos)            /*!< SysT
 251:../cmsis/core_cm0.h **** 
 252:../cmsis/core_cm0.h **** #define SysTick_CTRL_TICKINT_Pos            1                                             /*!< SysT
 253:../cmsis/core_cm0.h **** #define SysTick_CTRL_TICKINT_Msk           (1ul << SysTick_CTRL_TICKINT_Pos)              /*!< SysT
 254:../cmsis/core_cm0.h **** 
 255:../cmsis/core_cm0.h **** #define SysTick_CTRL_ENABLE_Pos             0                                             /*!< SysT
 256:../cmsis/core_cm0.h **** #define SysTick_CTRL_ENABLE_Msk            (1ul << SysTick_CTRL_ENABLE_Pos)               /*!< SysT
 257:../cmsis/core_cm0.h **** 
 258:../cmsis/core_cm0.h **** /* SysTick Reload Register Definitions */
 259:../cmsis/core_cm0.h **** #define SysTick_LOAD_RELOAD_Pos             0                                             /*!< SysT
 260:../cmsis/core_cm0.h **** #define SysTick_LOAD_RELOAD_Msk            (0xFFFFFFul << SysTick_LOAD_RELOAD_Pos)        /*!< SysT
 261:../cmsis/core_cm0.h **** 
 262:../cmsis/core_cm0.h **** /* SysTick Current Register Definitions */
 263:../cmsis/core_cm0.h **** #define SysTick_VAL_CURRENT_Pos             0                                             /*!< SysT
 264:../cmsis/core_cm0.h **** #define SysTick_VAL_CURRENT_Msk            (0xFFFFFFul << SysTick_VAL_CURRENT_Pos)        /*!< SysT
 265:../cmsis/core_cm0.h **** 
 266:../cmsis/core_cm0.h **** /* SysTick Calibration Register Definitions */
 267:../cmsis/core_cm0.h **** #define SysTick_CALIB_NOREF_Pos            31                                             /*!< SysT
 268:../cmsis/core_cm0.h **** #define SysTick_CALIB_NOREF_Msk            (1ul << SysTick_CALIB_NOREF_Pos)               /*!< SysT
 269:../cmsis/core_cm0.h **** 
 270:../cmsis/core_cm0.h **** #define SysTick_CALIB_SKEW_Pos             30                                             /*!< SysT
 271:../cmsis/core_cm0.h **** #define SysTick_CALIB_SKEW_Msk             (1ul << SysTick_CALIB_SKEW_Pos)                /*!< SysT
 272:../cmsis/core_cm0.h **** 
 273:../cmsis/core_cm0.h **** #define SysTick_CALIB_TENMS_Pos             0                                             /*!< SysT
 274:../cmsis/core_cm0.h **** #define SysTick_CALIB_TENMS_Msk            (0xFFFFFFul << SysTick_VAL_CURRENT_Pos)        /*!< SysT
 275:../cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_SysTick */
 276:../cmsis/core_cm0.h **** 
 277:../cmsis/core_cm0.h **** 
 278:../cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_CoreDebug CMSIS CM0 Core Debug
 279:../cmsis/core_cm0.h ****   memory mapped structure for Core Debug Register
 280:../cmsis/core_cm0.h ****   @{
 281:../cmsis/core_cm0.h ****  */
 282:../cmsis/core_cm0.h **** typedef struct
 283:../cmsis/core_cm0.h **** {
 284:../cmsis/core_cm0.h ****   __IO uint32_t DHCSR;                        /*!< Offset: 0x00  Debug Halting Control and Status R
 285:../cmsis/core_cm0.h ****   __O  uint32_t DCRSR;                        /*!< Offset: 0x04  Debug Core Register Selector Regis
 286:../cmsis/core_cm0.h ****   __IO uint32_t DCRDR;                        /*!< Offset: 0x08  Debug Core Register Data Register 
 287:../cmsis/core_cm0.h ****   __IO uint32_t DEMCR;                        /*!< Offset: 0x0C  Debug Exception and Monitor Contro
 288:../cmsis/core_cm0.h **** } CoreDebug_Type;
 289:../cmsis/core_cm0.h **** 
 290:../cmsis/core_cm0.h **** /* Debug Halting Control and Status Register */
 291:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_DBGKEY_Pos         16                                             /*!< Core
 292:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_DBGKEY_Msk         (0xFFFFul << CoreDebug_DHCSR_DBGKEY_Pos)       /*!< Core
 293:../cmsis/core_cm0.h **** 
 294:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_RESET_ST_Pos     25                                             /*!< Core
 295:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_RESET_ST_Msk     (1ul << CoreDebug_DHCSR_S_RESET_ST_Pos)        /*!< Core
 296:../cmsis/core_cm0.h **** 
 297:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_RETIRE_ST_Pos    24                                             /*!< Core
 298:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_RETIRE_ST_Msk    (1ul << CoreDebug_DHCSR_S_RETIRE_ST_Pos)       /*!< Core
 299:../cmsis/core_cm0.h **** 
 300:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_LOCKUP_Pos       19                                             /*!< Core
 301:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_LOCKUP_Msk       (1ul << CoreDebug_DHCSR_S_LOCKUP_Pos)          /*!< Core
 302:../cmsis/core_cm0.h **** 
 303:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_SLEEP_Pos        18                                             /*!< Core
 304:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_SLEEP_Msk        (1ul << CoreDebug_DHCSR_S_SLEEP_Pos)           /*!< Core
 305:../cmsis/core_cm0.h **** 
 306:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_HALT_Pos         17                                             /*!< Core
 307:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_HALT_Msk         (1ul << CoreDebug_DHCSR_S_HALT_Pos)            /*!< Core
 308:../cmsis/core_cm0.h **** 
 309:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_REGRDY_Pos       16                                             /*!< Core
 310:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_REGRDY_Msk       (1ul << CoreDebug_DHCSR_S_REGRDY_Pos)          /*!< Core
 311:../cmsis/core_cm0.h **** 
 312:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_MASKINTS_Pos      3                                             /*!< Core
 313:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_MASKINTS_Msk     (1ul << CoreDebug_DHCSR_C_MASKINTS_Pos)        /*!< Core
 314:../cmsis/core_cm0.h **** 
 315:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_STEP_Pos          2                                             /*!< Core
 316:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_STEP_Msk         (1ul << CoreDebug_DHCSR_C_STEP_Pos)            /*!< Core
 317:../cmsis/core_cm0.h **** 
 318:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_HALT_Pos          1                                             /*!< Core
 319:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_HALT_Msk         (1ul << CoreDebug_DHCSR_C_HALT_Pos)            /*!< Core
 320:../cmsis/core_cm0.h **** 
 321:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_DEBUGEN_Pos       0                                             /*!< Core
 322:../cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_DEBUGEN_Msk      (1ul << CoreDebug_DHCSR_C_DEBUGEN_Pos)         /*!< Core
 323:../cmsis/core_cm0.h **** 
 324:../cmsis/core_cm0.h **** /* Debug Core Register Selector Register */
 325:../cmsis/core_cm0.h **** #define CoreDebug_DCRSR_REGWnR_Pos         16                                             /*!< Core
 326:../cmsis/core_cm0.h **** #define CoreDebug_DCRSR_REGWnR_Msk         (1ul << CoreDebug_DCRSR_REGWnR_Pos)            /*!< Core
 327:../cmsis/core_cm0.h **** 
 328:../cmsis/core_cm0.h **** #define CoreDebug_DCRSR_REGSEL_Pos          0                                             /*!< Core
 329:../cmsis/core_cm0.h **** #define CoreDebug_DCRSR_REGSEL_Msk         (0x1Ful << CoreDebug_DCRSR_REGSEL_Pos)         /*!< Core
 330:../cmsis/core_cm0.h **** 
 331:../cmsis/core_cm0.h **** /* Debug Exception and Monitor Control Register */
 332:../cmsis/core_cm0.h **** #define CoreDebug_DEMCR_DWTENA_Pos         24                                             /*!< Core
 333:../cmsis/core_cm0.h **** #define CoreDebug_DEMCR_DWTENA_Msk         (1ul << CoreDebug_DEMCR_DWTENA_Pos)            /*!< Core
 334:../cmsis/core_cm0.h **** 
 335:../cmsis/core_cm0.h **** #define CoreDebug_DEMCR_VC_HARDERR_Pos     10                                             /*!< Core
 336:../cmsis/core_cm0.h **** #define CoreDebug_DEMCR_VC_HARDERR_Msk     (1ul << CoreDebug_DEMCR_VC_HARDERR_Pos)        /*!< Core
 337:../cmsis/core_cm0.h **** 
 338:../cmsis/core_cm0.h **** #define CoreDebug_DEMCR_VC_CORERESET_Pos    0                                             /*!< Core
 339:../cmsis/core_cm0.h **** #define CoreDebug_DEMCR_VC_CORERESET_Msk   (1ul << CoreDebug_DEMCR_VC_CORERESET_Pos)      /*!< Core
 340:../cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_CoreDebug */
 341:../cmsis/core_cm0.h **** 
 342:../cmsis/core_cm0.h **** 
 343:../cmsis/core_cm0.h **** /* Memory mapping of Cortex-M0 Hardware */
 344:../cmsis/core_cm0.h **** #define SCS_BASE            (0xE000E000)                              /*!< System Control Space Bas
 345:../cmsis/core_cm0.h **** #define CoreDebug_BASE      (0xE000EDF0)                              /*!< Core Debug Base Address 
 346:../cmsis/core_cm0.h **** #define SysTick_BASE        (SCS_BASE +  0x0010)                      /*!< SysTick Base Address    
 347:../cmsis/core_cm0.h **** #define NVIC_BASE           (SCS_BASE +  0x0100)                      /*!< NVIC Base Address       
 348:../cmsis/core_cm0.h **** #define SCB_BASE            (SCS_BASE +  0x0D00)                      /*!< System Control Block Bas
 349:../cmsis/core_cm0.h **** 
 350:../cmsis/core_cm0.h **** #define SCB                 ((SCB_Type *)           SCB_BASE)         /*!< SCB configuration struct
 351:../cmsis/core_cm0.h **** #define SysTick             ((SysTick_Type *)       SysTick_BASE)     /*!< SysTick configuration st
 352:../cmsis/core_cm0.h **** #define NVIC                ((NVIC_Type *)          NVIC_BASE)        /*!< NVIC configuration struc
 353:../cmsis/core_cm0.h **** #define CoreDebug           ((CoreDebug_Type *)     CoreDebug_BASE)   /*!< Core Debug configuration
 354:../cmsis/core_cm0.h **** 
 355:../cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_core_register */
 356:../cmsis/core_cm0.h **** 
 357:../cmsis/core_cm0.h **** 
 358:../cmsis/core_cm0.h **** /*******************************************************************************
 359:../cmsis/core_cm0.h ****  *                Hardware Abstraction Layer
 360:../cmsis/core_cm0.h ****  ******************************************************************************/
 361:../cmsis/core_cm0.h **** 
 362:../cmsis/core_cm0.h **** #if defined ( __CC_ARM   )
 363:../cmsis/core_cm0.h ****   #define __ASM            __asm                                      /*!< asm keyword for ARM Comp
 364:../cmsis/core_cm0.h ****   #define __INLINE         __inline                                   /*!< inline keyword for ARM C
 365:../cmsis/core_cm0.h **** 
 366:../cmsis/core_cm0.h **** #elif defined ( __ICCARM__ )
 367:../cmsis/core_cm0.h ****   #define __ASM           __asm                                       /*!< asm keyword for IAR Comp
 368:../cmsis/core_cm0.h ****   #define __INLINE        inline                                      /*!< inline keyword for IAR C
 369:../cmsis/core_cm0.h **** 
 370:../cmsis/core_cm0.h **** #elif defined   (  __GNUC__  )
 371:../cmsis/core_cm0.h ****   #define __ASM            __asm                                      /*!< asm keyword for GNU Comp
 372:../cmsis/core_cm0.h ****   #define __INLINE         inline                                     /*!< inline keyword for GNU C
 373:../cmsis/core_cm0.h **** 
 374:../cmsis/core_cm0.h **** #elif defined   (  __TASKING__  )
 375:../cmsis/core_cm0.h ****   #define __ASM            __asm                                      /*!< asm keyword for TASKING 
 376:../cmsis/core_cm0.h ****   #define __INLINE         inline                                     /*!< inline keyword for TASKI
 377:../cmsis/core_cm0.h **** 
 378:../cmsis/core_cm0.h **** #endif
 379:../cmsis/core_cm0.h **** 
 380:../cmsis/core_cm0.h **** 
 381:../cmsis/core_cm0.h **** /* ###################  Compiler specific Intrinsics  ########################### */
 382:../cmsis/core_cm0.h **** 
 383:../cmsis/core_cm0.h **** #if defined ( __CC_ARM   ) /*------------------RealView Compiler -----------------*/
 384:../cmsis/core_cm0.h **** /* ARM armcc specific functions */
 385:../cmsis/core_cm0.h **** 
 386:../cmsis/core_cm0.h **** #define __enable_fault_irq                __enable_fiq
 387:../cmsis/core_cm0.h **** #define __disable_fault_irq               __disable_fiq
 388:../cmsis/core_cm0.h **** 
 389:../cmsis/core_cm0.h **** #define __NOP                             __nop
 390:../cmsis/core_cm0.h **** #define __WFI                             __wfi
 391:../cmsis/core_cm0.h **** #define __WFE                             __wfe
 392:../cmsis/core_cm0.h **** #define __SEV                             __sev
 393:../cmsis/core_cm0.h **** #define __ISB()                           __isb(0)
 394:../cmsis/core_cm0.h **** #define __DSB()                           __dsb(0)
 395:../cmsis/core_cm0.h **** #define __DMB()                           __dmb(0)
 396:../cmsis/core_cm0.h **** #define __REV                             __rev
 397:../cmsis/core_cm0.h **** 
 398:../cmsis/core_cm0.h **** 
 399:../cmsis/core_cm0.h **** /* intrinsic void __enable_irq();     */
 400:../cmsis/core_cm0.h **** /* intrinsic void __disable_irq();    */
 401:../cmsis/core_cm0.h **** 
 402:../cmsis/core_cm0.h **** 
 403:../cmsis/core_cm0.h **** /**
 404:../cmsis/core_cm0.h ****  * @brief  Return the Process Stack Pointer
 405:../cmsis/core_cm0.h ****  *
 406:../cmsis/core_cm0.h ****  * @return ProcessStackPointer
 407:../cmsis/core_cm0.h ****  *
 408:../cmsis/core_cm0.h ****  * Return the actual process stack pointer
 409:../cmsis/core_cm0.h ****  */
 410:../cmsis/core_cm0.h **** extern uint32_t __get_PSP(void);
 411:../cmsis/core_cm0.h **** 
 412:../cmsis/core_cm0.h **** /**
 413:../cmsis/core_cm0.h ****  * @brief  Set the Process Stack Pointer
 414:../cmsis/core_cm0.h ****  *
 415:../cmsis/core_cm0.h ****  * @param  topOfProcStack  Process Stack Pointer
 416:../cmsis/core_cm0.h ****  *
 417:../cmsis/core_cm0.h ****  * Assign the value ProcessStackPointer to the MSP 
 418:../cmsis/core_cm0.h ****  * (process stack pointer) Cortex processor register
 419:../cmsis/core_cm0.h ****  */
 420:../cmsis/core_cm0.h **** extern void __set_PSP(uint32_t topOfProcStack);
 421:../cmsis/core_cm0.h **** 
 422:../cmsis/core_cm0.h **** /**
 423:../cmsis/core_cm0.h ****  * @brief  Return the Main Stack Pointer
 424:../cmsis/core_cm0.h ****  *
 425:../cmsis/core_cm0.h ****  * @return Main Stack Pointer
 426:../cmsis/core_cm0.h ****  *
 427:../cmsis/core_cm0.h ****  * Return the current value of the MSP (main stack pointer)
 428:../cmsis/core_cm0.h ****  * Cortex processor register
 429:../cmsis/core_cm0.h ****  */
 430:../cmsis/core_cm0.h **** extern uint32_t __get_MSP(void);
 431:../cmsis/core_cm0.h **** 
 432:../cmsis/core_cm0.h **** /**
 433:../cmsis/core_cm0.h ****  * @brief  Set the Main Stack Pointer
 434:../cmsis/core_cm0.h ****  *
 435:../cmsis/core_cm0.h ****  * @param  topOfMainStack  Main Stack Pointer
 436:../cmsis/core_cm0.h ****  *
 437:../cmsis/core_cm0.h ****  * Assign the value mainStackPointer to the MSP 
 438:../cmsis/core_cm0.h ****  * (main stack pointer) Cortex processor register
 439:../cmsis/core_cm0.h ****  */
 440:../cmsis/core_cm0.h **** extern void __set_MSP(uint32_t topOfMainStack);
 441:../cmsis/core_cm0.h **** 
 442:../cmsis/core_cm0.h **** /**
 443:../cmsis/core_cm0.h ****  * @brief  Reverse byte order in unsigned short value
 444:../cmsis/core_cm0.h ****  *
 445:../cmsis/core_cm0.h ****  * @param   value  value to reverse
 446:../cmsis/core_cm0.h ****  * @return         reversed value
 447:../cmsis/core_cm0.h ****  *
 448:../cmsis/core_cm0.h ****  * Reverse byte order in unsigned short value
 449:../cmsis/core_cm0.h ****  */
 450:../cmsis/core_cm0.h **** extern uint32_t __REV16(uint16_t value);
 451:../cmsis/core_cm0.h **** 
 452:../cmsis/core_cm0.h **** /**
 453:../cmsis/core_cm0.h ****  * @brief  Reverse byte order in signed short value with sign extension to integer
 454:../cmsis/core_cm0.h ****  *
 455:../cmsis/core_cm0.h ****  * @param   value  value to reverse
 456:../cmsis/core_cm0.h ****  * @return         reversed value
 457:../cmsis/core_cm0.h ****  *
 458:../cmsis/core_cm0.h ****  * Reverse byte order in signed short value with sign extension to integer
 459:../cmsis/core_cm0.h ****  */
 460:../cmsis/core_cm0.h **** extern int32_t __REVSH(int16_t value);
 461:../cmsis/core_cm0.h **** 
 462:../cmsis/core_cm0.h **** 
 463:../cmsis/core_cm0.h **** #if (__ARMCC_VERSION < 400000)
 464:../cmsis/core_cm0.h **** 
 465:../cmsis/core_cm0.h **** /**
 466:../cmsis/core_cm0.h ****  * @brief  Return the Priority Mask value
 467:../cmsis/core_cm0.h ****  *
 468:../cmsis/core_cm0.h ****  * @return PriMask
 469:../cmsis/core_cm0.h ****  *
 470:../cmsis/core_cm0.h ****  * Return state of the priority mask bit from the priority mask register
 471:../cmsis/core_cm0.h ****  */
 472:../cmsis/core_cm0.h **** extern uint32_t __get_PRIMASK(void);
 473:../cmsis/core_cm0.h **** 
 474:../cmsis/core_cm0.h **** /**
 475:../cmsis/core_cm0.h ****  * @brief  Set the Priority Mask value
 476:../cmsis/core_cm0.h ****  *
 477:../cmsis/core_cm0.h ****  * @param   priMask  PriMask
 478:../cmsis/core_cm0.h ****  *
 479:../cmsis/core_cm0.h ****  * Set the priority mask bit in the priority mask register
 480:../cmsis/core_cm0.h ****  */
 481:../cmsis/core_cm0.h **** extern void __set_PRIMASK(uint32_t priMask);
 482:../cmsis/core_cm0.h **** 
 483:../cmsis/core_cm0.h **** /**
 484:../cmsis/core_cm0.h ****  * @brief  Return the Control Register value
 485:../cmsis/core_cm0.h ****  * 
 486:../cmsis/core_cm0.h ****  * @return Control value
 487:../cmsis/core_cm0.h ****  *
 488:../cmsis/core_cm0.h ****  * Return the content of the control register
 489:../cmsis/core_cm0.h ****  */
 490:../cmsis/core_cm0.h **** extern uint32_t __get_CONTROL(void);
 491:../cmsis/core_cm0.h **** 
 492:../cmsis/core_cm0.h **** /**
 493:../cmsis/core_cm0.h ****  * @brief  Set the Control Register value
 494:../cmsis/core_cm0.h ****  *
 495:../cmsis/core_cm0.h ****  * @param  control  Control value
 496:../cmsis/core_cm0.h ****  *
 497:../cmsis/core_cm0.h ****  * Set the control register
 498:../cmsis/core_cm0.h ****  */
 499:../cmsis/core_cm0.h **** extern void __set_CONTROL(uint32_t control);
 500:../cmsis/core_cm0.h **** 
 501:../cmsis/core_cm0.h **** #else  /* (__ARMCC_VERSION >= 400000)  */
 502:../cmsis/core_cm0.h **** 
 503:../cmsis/core_cm0.h **** 
 504:../cmsis/core_cm0.h **** /**
 505:../cmsis/core_cm0.h ****  * @brief  Return the Priority Mask value
 506:../cmsis/core_cm0.h ****  *
 507:../cmsis/core_cm0.h ****  * @return PriMask
 508:../cmsis/core_cm0.h ****  *
 509:../cmsis/core_cm0.h ****  * Return state of the priority mask bit from the priority mask register
 510:../cmsis/core_cm0.h ****  */
 511:../cmsis/core_cm0.h **** static __INLINE uint32_t __get_PRIMASK(void)
 512:../cmsis/core_cm0.h **** {
 513:../cmsis/core_cm0.h ****   register uint32_t __regPriMask         __ASM("primask");
 514:../cmsis/core_cm0.h ****   return(__regPriMask);
 515:../cmsis/core_cm0.h **** }
 516:../cmsis/core_cm0.h **** 
 517:../cmsis/core_cm0.h **** /**
 518:../cmsis/core_cm0.h ****  * @brief  Set the Priority Mask value
 519:../cmsis/core_cm0.h ****  *
 520:../cmsis/core_cm0.h ****  * @param  priMask  PriMask
 521:../cmsis/core_cm0.h ****  *
 522:../cmsis/core_cm0.h ****  * Set the priority mask bit in the priority mask register
 523:../cmsis/core_cm0.h ****  */
 524:../cmsis/core_cm0.h **** static __INLINE void __set_PRIMASK(uint32_t priMask)
 525:../cmsis/core_cm0.h **** {
 526:../cmsis/core_cm0.h ****   register uint32_t __regPriMask         __ASM("primask");
 527:../cmsis/core_cm0.h ****   __regPriMask = (priMask);
 528:../cmsis/core_cm0.h **** }
 529:../cmsis/core_cm0.h **** 
 530:../cmsis/core_cm0.h **** /**
 531:../cmsis/core_cm0.h ****  * @brief  Return the Control Register value
 532:../cmsis/core_cm0.h ****  * 
 533:../cmsis/core_cm0.h ****  * @return Control value
 534:../cmsis/core_cm0.h ****  *
 535:../cmsis/core_cm0.h ****  * Return the content of the control register
 536:../cmsis/core_cm0.h ****  */
 537:../cmsis/core_cm0.h **** static __INLINE uint32_t __get_CONTROL(void)
 538:../cmsis/core_cm0.h **** {
 539:../cmsis/core_cm0.h ****   register uint32_t __regControl         __ASM("control");
 540:../cmsis/core_cm0.h ****   return(__regControl);
 541:../cmsis/core_cm0.h **** }
 542:../cmsis/core_cm0.h **** 
 543:../cmsis/core_cm0.h **** /**
 544:../cmsis/core_cm0.h ****  * @brief  Set the Control Register value
 545:../cmsis/core_cm0.h ****  *
 546:../cmsis/core_cm0.h ****  * @param  control  Control value
 547:../cmsis/core_cm0.h ****  *
 548:../cmsis/core_cm0.h ****  * Set the control register
 549:../cmsis/core_cm0.h ****  */
 550:../cmsis/core_cm0.h **** static __INLINE void __set_CONTROL(uint32_t control)
 551:../cmsis/core_cm0.h **** {
 552:../cmsis/core_cm0.h ****   register uint32_t __regControl         __ASM("control");
 553:../cmsis/core_cm0.h ****   __regControl = control;
 554:../cmsis/core_cm0.h **** }
 555:../cmsis/core_cm0.h **** 
 556:../cmsis/core_cm0.h **** #endif /* __ARMCC_VERSION  */ 
 557:../cmsis/core_cm0.h **** 
 558:../cmsis/core_cm0.h **** 
 559:../cmsis/core_cm0.h **** 
 560:../cmsis/core_cm0.h **** #elif (defined (__ICCARM__)) /*------------------ ICC Compiler -------------------*/
 561:../cmsis/core_cm0.h **** /* IAR iccarm specific functions */
 562:../cmsis/core_cm0.h **** 
 563:../cmsis/core_cm0.h **** #define __enable_irq                              __enable_interrupt        /*!< global Interrupt e
 564:../cmsis/core_cm0.h **** #define __disable_irq                             __disable_interrupt       /*!< global Interrupt d
 565:../cmsis/core_cm0.h **** 
 566:../cmsis/core_cm0.h **** static __INLINE void __enable_fault_irq()         { __ASM ("cpsie f"); }
 567:../cmsis/core_cm0.h **** static __INLINE void __disable_fault_irq()        { __ASM ("cpsid f"); }
 568:../cmsis/core_cm0.h **** 
 569:../cmsis/core_cm0.h **** #define __NOP                                     __no_operation            /*!< no operation intri
 570:../cmsis/core_cm0.h **** static __INLINE  void __WFI()                     { __ASM ("wfi"); }
 571:../cmsis/core_cm0.h **** static __INLINE  void __WFE()                     { __ASM ("wfe"); }
 572:../cmsis/core_cm0.h **** static __INLINE  void __SEV()                     { __ASM ("sev"); }
 573:../cmsis/core_cm0.h **** 
 574:../cmsis/core_cm0.h **** /* intrinsic void __ISB(void)                                     */
 575:../cmsis/core_cm0.h **** /* intrinsic void __DSB(void)                                     */
 576:../cmsis/core_cm0.h **** /* intrinsic void __DMB(void)                                     */
 577:../cmsis/core_cm0.h **** /* intrinsic void __set_PRIMASK();                                */
 578:../cmsis/core_cm0.h **** /* intrinsic void __get_PRIMASK();                                */
 579:../cmsis/core_cm0.h **** 
 580:../cmsis/core_cm0.h **** 
 581:../cmsis/core_cm0.h **** /* intrinsic uint32_t __REV(uint32_t value);                      */
 582:../cmsis/core_cm0.h **** /* intrinsic uint32_t __REVSH(uint32_t value);                    */
 583:../cmsis/core_cm0.h **** 
 584:../cmsis/core_cm0.h **** 
 585:../cmsis/core_cm0.h **** /**
 586:../cmsis/core_cm0.h ****  * @brief  Return the Process Stack Pointer
 587:../cmsis/core_cm0.h ****  *
 588:../cmsis/core_cm0.h ****  * @return ProcessStackPointer
 589:../cmsis/core_cm0.h ****  *
 590:../cmsis/core_cm0.h ****  * Return the actual process stack pointer
 591:../cmsis/core_cm0.h ****  */
 592:../cmsis/core_cm0.h **** extern uint32_t __get_PSP(void);
 593:../cmsis/core_cm0.h **** 
 594:../cmsis/core_cm0.h **** /**
 595:../cmsis/core_cm0.h ****  * @brief  Set the Process Stack Pointer
 596:../cmsis/core_cm0.h ****  *
 597:../cmsis/core_cm0.h ****  * @param  topOfProcStack  Process Stack Pointer
 598:../cmsis/core_cm0.h ****  *
 599:../cmsis/core_cm0.h ****  * Assign the value ProcessStackPointer to the MSP 
 600:../cmsis/core_cm0.h ****  * (process stack pointer) Cortex processor register
 601:../cmsis/core_cm0.h ****  */
 602:../cmsis/core_cm0.h **** extern void __set_PSP(uint32_t topOfProcStack);
 603:../cmsis/core_cm0.h **** 
 604:../cmsis/core_cm0.h **** /**
 605:../cmsis/core_cm0.h ****  * @brief  Return the Main Stack Pointer
 606:../cmsis/core_cm0.h ****  *
 607:../cmsis/core_cm0.h ****  * @return Main Stack Pointer
 608:../cmsis/core_cm0.h ****  *
 609:../cmsis/core_cm0.h ****  * Return the current value of the MSP (main stack pointer)
 610:../cmsis/core_cm0.h ****  * Cortex processor register
 611:../cmsis/core_cm0.h ****  */
 612:../cmsis/core_cm0.h **** extern uint32_t __get_MSP(void);
 613:../cmsis/core_cm0.h **** 
 614:../cmsis/core_cm0.h **** /**
 615:../cmsis/core_cm0.h ****  * @brief  Set the Main Stack Pointer
 616:../cmsis/core_cm0.h ****  *
 617:../cmsis/core_cm0.h ****  * @param  topOfMainStack  Main Stack Pointer
 618:../cmsis/core_cm0.h ****  *
 619:../cmsis/core_cm0.h ****  * Assign the value mainStackPointer to the MSP 
 620:../cmsis/core_cm0.h ****  * (main stack pointer) Cortex processor register
 621:../cmsis/core_cm0.h ****  */
 622:../cmsis/core_cm0.h **** extern void __set_MSP(uint32_t topOfMainStack);
 623:../cmsis/core_cm0.h **** 
 624:../cmsis/core_cm0.h **** /**
 625:../cmsis/core_cm0.h ****  * @brief  Reverse byte order in unsigned short value
 626:../cmsis/core_cm0.h ****  *
 627:../cmsis/core_cm0.h ****  * @param  value  value to reverse
 628:../cmsis/core_cm0.h ****  * @return        reversed value
 629:../cmsis/core_cm0.h ****  *
 630:../cmsis/core_cm0.h ****  * Reverse byte order in unsigned short value
 631:../cmsis/core_cm0.h ****  */
 632:../cmsis/core_cm0.h **** extern uint32_t __REV16(uint16_t value);
 633:../cmsis/core_cm0.h **** 
 634:../cmsis/core_cm0.h **** 
 635:../cmsis/core_cm0.h **** 
 636:../cmsis/core_cm0.h **** 
 637:../cmsis/core_cm0.h **** 
 638:../cmsis/core_cm0.h **** #elif (defined (__GNUC__)) /*------------------ GNU Compiler ---------------------*/
 639:../cmsis/core_cm0.h **** /* GNU gcc specific functions */
 640:../cmsis/core_cm0.h **** 
 641:../cmsis/core_cm0.h **** static __INLINE void __enable_irq()               { __ASM volatile ("cpsie i"); }
 642:../cmsis/core_cm0.h **** static __INLINE void __disable_irq()              { __ASM volatile ("cpsid i"); }
 643:../cmsis/core_cm0.h **** 
 644:../cmsis/core_cm0.h **** static __INLINE void __enable_fault_irq()         { __ASM volatile ("cpsie f"); }
 645:../cmsis/core_cm0.h **** static __INLINE void __disable_fault_irq()        { __ASM volatile ("cpsid f"); }
 646:../cmsis/core_cm0.h **** 
 647:../cmsis/core_cm0.h **** static __INLINE void __NOP()                      { __ASM volatile ("nop"); }
  27              		.loc 1 647 0
  28              		.cfi_startproc
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  31 0000 80B5     		push	{r7, lr}
  32              		.cfi_def_cfa_offset 8
  33              		.cfi_offset 7, -8
  34              		.cfi_offset 14, -4
  35 0002 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37              		.loc 1 647 0
  38              		.syntax divided
  39              	@ 647 "../cmsis/core_cm0.h" 1
  40 0004 C046     		nop
  41              	@ 0 "" 2
  42              		.thumb
  43              		.syntax unified
  44 0006 C046     		nop
  45 0008 BD46     		mov	sp, r7
  46              		@ sp needed
  47 000a 80BD     		pop	{r7, pc}
  48              		.cfi_endproc
  49              	.LFE4:
  51              		.global	SystemCoreClock
  52              		.data
  53              		.align	2
  56              	SystemCoreClock:
  57 0000 006CDC02 		.word	48000000
  58              		.global	__aeabi_uidiv
  59              		.section	.text.SystemCoreClockUpdate,"ax",%progbits
  60              		.align	2
  61              		.global	SystemCoreClockUpdate
  62              		.code	16
  63              		.thumb_func
  65              	SystemCoreClockUpdate:
  66              	.LFB20:
  67              		.file 2 "../cmsis/system_LPC11xx.c"
   1:../cmsis/system_LPC11xx.c **** /**************************************************************************//**
   2:../cmsis/system_LPC11xx.c ****  * $Id:: system_LPC11xx.c 5140 2010-10-07 19:30:43Z nxp21346              $
   3:../cmsis/system_LPC11xx.c ****  *
   4:../cmsis/system_LPC11xx.c ****  * @file     system_LPC11xx.c
   5:../cmsis/system_LPC11xx.c ****  * @brief    CMSIS Cortex-M0 Device Peripheral Access Layer Source File
   6:../cmsis/system_LPC11xx.c ****  *           for the NXP LPC11xx Device Series
   7:../cmsis/system_LPC11xx.c ****  * @version  V1.00
   8:../cmsis/system_LPC11xx.c ****  * @date     17. November 2009
   9:../cmsis/system_LPC11xx.c ****  *
  10:../cmsis/system_LPC11xx.c ****  * @note
  11:../cmsis/system_LPC11xx.c ****  * Copyright (C) 2009 ARM Limited. All rights reserved.
  12:../cmsis/system_LPC11xx.c ****  *
  13:../cmsis/system_LPC11xx.c ****  * @par
  14:../cmsis/system_LPC11xx.c ****  * ARM Limited (ARM) is supplying this software for use with Cortex-M 
  15:../cmsis/system_LPC11xx.c ****  * processor based microcontrollers.  This file can be freely distributed 
  16:../cmsis/system_LPC11xx.c ****  * within development tools that are supporting such ARM based processors. 
  17:../cmsis/system_LPC11xx.c ****  *
  18:../cmsis/system_LPC11xx.c ****  * @par
  19:../cmsis/system_LPC11xx.c ****  * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
  20:../cmsis/system_LPC11xx.c ****  * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
  21:../cmsis/system_LPC11xx.c ****  * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
  22:../cmsis/system_LPC11xx.c ****  * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
  23:../cmsis/system_LPC11xx.c ****  * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
  24:../cmsis/system_LPC11xx.c ****  *
  25:../cmsis/system_LPC11xx.c ****  ******************************************************************************/
  26:../cmsis/system_LPC11xx.c **** 
  27:../cmsis/system_LPC11xx.c **** 
  28:../cmsis/system_LPC11xx.c **** #include <stdint.h>
  29:../cmsis/system_LPC11xx.c **** #include "LPC11xx.h"
  30:../cmsis/system_LPC11xx.c **** 
  31:../cmsis/system_LPC11xx.c **** 
  32:../cmsis/system_LPC11xx.c **** /*----------------------------------------------------------------------------
  33:../cmsis/system_LPC11xx.c ****   Check the register settings
  34:../cmsis/system_LPC11xx.c ****  *----------------------------------------------------------------------------*/
  35:../cmsis/system_LPC11xx.c **** #define CHECK_RANGE(val, min, max)                ((val < min) || (val > max))
  36:../cmsis/system_LPC11xx.c **** #define CHECK_RSVD(val, mask)                     (val & mask)
  37:../cmsis/system_LPC11xx.c **** 
  38:../cmsis/system_LPC11xx.c **** /* Clock Configuration -------------------------------------------------------*/
  39:../cmsis/system_LPC11xx.c **** #if (CHECK_RSVD((SYSOSCCTRL_Val),  ~0x00000003))
  40:../cmsis/system_LPC11xx.c ****    #error "SYSOSCCTRL: Invalid values of reserved bits!"
  41:../cmsis/system_LPC11xx.c **** #endif
  42:../cmsis/system_LPC11xx.c **** 
  43:../cmsis/system_LPC11xx.c **** #if (CHECK_RSVD((WDTOSCCTRL_Val),  ~0x000001FF))
  44:../cmsis/system_LPC11xx.c ****    #error "WDTOSCCTRL: Invalid values of reserved bits!"
  45:../cmsis/system_LPC11xx.c **** #endif
  46:../cmsis/system_LPC11xx.c **** 
  47:../cmsis/system_LPC11xx.c **** #if (CHECK_RANGE((SYSPLLCLKSEL_Val), 0, 2))
  48:../cmsis/system_LPC11xx.c ****    #error "SYSPLLCLKSEL: Value out of range!"
  49:../cmsis/system_LPC11xx.c **** #endif
  50:../cmsis/system_LPC11xx.c **** 
  51:../cmsis/system_LPC11xx.c **** #if (CHECK_RSVD((SYSPLLCTRL_Val),  ~0x000001FF))
  52:../cmsis/system_LPC11xx.c ****    #error "SYSPLLCTRL: Invalid values of reserved bits!"
  53:../cmsis/system_LPC11xx.c **** #endif
  54:../cmsis/system_LPC11xx.c **** 
  55:../cmsis/system_LPC11xx.c **** #if (CHECK_RSVD((MAINCLKSEL_Val),  ~0x00000003))
  56:../cmsis/system_LPC11xx.c ****    #error "MAINCLKSEL: Invalid values of reserved bits!"
  57:../cmsis/system_LPC11xx.c **** #endif
  58:../cmsis/system_LPC11xx.c **** 
  59:../cmsis/system_LPC11xx.c **** #if (CHECK_RANGE((SYSAHBCLKDIV_Val), 0, 255))
  60:../cmsis/system_LPC11xx.c ****    #error "SYSAHBCLKDIV: Value out of range!"
  61:../cmsis/system_LPC11xx.c **** #endif
  62:../cmsis/system_LPC11xx.c **** 
  63:../cmsis/system_LPC11xx.c **** #if (CHECK_RSVD((AHBCLKCTRL_Val),  ~0x0001FFFF))
  64:../cmsis/system_LPC11xx.c ****    #error "AHBCLKCTRL: Invalid values of reserved bits!"
  65:../cmsis/system_LPC11xx.c **** #endif
  66:../cmsis/system_LPC11xx.c **** 
  67:../cmsis/system_LPC11xx.c **** #if (CHECK_RANGE((SSP0CLKDIV_Val), 0, 255))
  68:../cmsis/system_LPC11xx.c ****    #error "SSP0CLKDIV: Value out of range!"
  69:../cmsis/system_LPC11xx.c **** #endif
  70:../cmsis/system_LPC11xx.c **** 
  71:../cmsis/system_LPC11xx.c **** #if (CHECK_RANGE((UARTCLKDIV_Val), 0, 255))
  72:../cmsis/system_LPC11xx.c ****    #error "UARTCLKDIV: Value out of range!"
  73:../cmsis/system_LPC11xx.c **** #endif
  74:../cmsis/system_LPC11xx.c **** 
  75:../cmsis/system_LPC11xx.c **** #if (CHECK_RANGE((SSP1CLKDIV_Val), 0, 255))
  76:../cmsis/system_LPC11xx.c ****    #error "SSP1CLKDIV: Value out of range!"
  77:../cmsis/system_LPC11xx.c **** #endif
  78:../cmsis/system_LPC11xx.c **** 
  79:../cmsis/system_LPC11xx.c **** #if (CHECK_RSVD((SYSMEMREMAP_Val), ~0x00000003))
  80:../cmsis/system_LPC11xx.c ****    #error "SYSMEMREMAP: Invalid values of reserved bits!"
  81:../cmsis/system_LPC11xx.c **** #endif
  82:../cmsis/system_LPC11xx.c **** 
  83:../cmsis/system_LPC11xx.c **** 
  84:../cmsis/system_LPC11xx.c **** /*----------------------------------------------------------------------------
  85:../cmsis/system_LPC11xx.c ****   DEFINES
  86:../cmsis/system_LPC11xx.c ****  *----------------------------------------------------------------------------*/
  87:../cmsis/system_LPC11xx.c ****     
  88:../cmsis/system_LPC11xx.c **** /*----------------------------------------------------------------------------
  89:../cmsis/system_LPC11xx.c ****   Define clocks
  90:../cmsis/system_LPC11xx.c ****  *----------------------------------------------------------------------------*/
  91:../cmsis/system_LPC11xx.c **** #define __XTAL            (12000000UL)    /* Oscillator frequency             */
  92:../cmsis/system_LPC11xx.c **** #define __SYS_OSC_CLK     (    __XTAL)    /* Main oscillator frequency        */
  93:../cmsis/system_LPC11xx.c **** #define __IRC_OSC_CLK     (12000000UL)    /* Internal RC oscillator frequency */
  94:../cmsis/system_LPC11xx.c **** 
  95:../cmsis/system_LPC11xx.c **** 
  96:../cmsis/system_LPC11xx.c **** #define __FREQSEL   ((WDTOSCCTRL_Val >> 5) & 0x0F)
  97:../cmsis/system_LPC11xx.c **** #define __DIVSEL   (((WDTOSCCTRL_Val & 0x1F) << 1) + 2)
  98:../cmsis/system_LPC11xx.c **** 
  99:../cmsis/system_LPC11xx.c **** #if (CLOCK_SETUP)                         /* Clock Setup              */
 100:../cmsis/system_LPC11xx.c ****   #if (SYSCLK_SETUP)                      /* System Clock Setup       */
 101:../cmsis/system_LPC11xx.c ****     #if (WDTOSC_SETUP)                    /* Watchdog Oscillator Setup*/
 102:../cmsis/system_LPC11xx.c ****         #if  (__FREQSEL ==  0)
 103:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        ( 400000 / __DIVSEL)
 104:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL ==  1)
 105:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        ( 500000 / __DIVSEL)
 106:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL ==  2)
 107:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        ( 800000 / __DIVSEL)
 108:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL ==  3)
 109:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (1100000 / __DIVSEL)
 110:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL ==  4)
 111:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (1400000 / __DIVSEL)
 112:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL ==  5)
 113:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (1600000 / __DIVSEL)
 114:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL ==  6)
 115:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (1800000 / __DIVSEL)
 116:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL ==  7)
 117:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (2000000 / __DIVSEL)
 118:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL ==  8)
 119:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (2200000 / __DIVSEL)
 120:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL ==  9)
 121:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (2400000 / __DIVSEL)
 122:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL == 10)
 123:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (2600000 / __DIVSEL)
 124:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL == 11)
 125:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (2700000 / __DIVSEL)
 126:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL == 12)
 127:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (2900000 / __DIVSEL)
 128:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL == 13)
 129:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (3100000 / __DIVSEL)
 130:../cmsis/system_LPC11xx.c ****         #elif (__FREQSEL == 14)
 131:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (3200000 / __DIVSEL)
 132:../cmsis/system_LPC11xx.c ****         #else
 133:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (3400000 / __DIVSEL)
 134:../cmsis/system_LPC11xx.c ****         #endif
 135:../cmsis/system_LPC11xx.c ****     #else
 136:../cmsis/system_LPC11xx.c ****           #define __WDT_OSC_CLK        (1600000 / 2)
 137:../cmsis/system_LPC11xx.c ****     #endif  // WDTOSC_SETUP
 138:../cmsis/system_LPC11xx.c **** 
 139:../cmsis/system_LPC11xx.c ****     /* sys_pllclkin calculation */
 140:../cmsis/system_LPC11xx.c ****     #if   ((SYSPLLCLKSEL_Val & 0x03) == 0)
 141:../cmsis/system_LPC11xx.c ****       #define __SYS_PLLCLKIN           (__IRC_OSC_CLK)
 142:../cmsis/system_LPC11xx.c ****     #elif ((SYSPLLCLKSEL_Val & 0x03) == 1)
 143:../cmsis/system_LPC11xx.c ****       #define __SYS_PLLCLKIN           (__SYS_OSC_CLK)
 144:../cmsis/system_LPC11xx.c ****     #elif ((SYSPLLCLKSEL_Val & 0x03) == 2)
 145:../cmsis/system_LPC11xx.c ****       #define __SYS_PLLCLKIN           (__WDT_OSC_CLK)
 146:../cmsis/system_LPC11xx.c ****     #else
 147:../cmsis/system_LPC11xx.c ****       #define __SYS_PLLCLKIN           (0)
 148:../cmsis/system_LPC11xx.c ****     #endif
 149:../cmsis/system_LPC11xx.c **** 
 150:../cmsis/system_LPC11xx.c ****     #if (SYSPLL_SETUP)                    /* System PLL Setup         */
 151:../cmsis/system_LPC11xx.c ****       #define  __SYS_PLLCLKOUT         (__SYS_PLLCLKIN * ((SYSPLLCTRL_Val & 0x01F) + 1))
 152:../cmsis/system_LPC11xx.c ****     #else
 153:../cmsis/system_LPC11xx.c ****       #define  __SYS_PLLCLKOUT         (__SYS_PLLCLKIN * (1))
 154:../cmsis/system_LPC11xx.c ****     #endif  // SYSPLL_SETUP
 155:../cmsis/system_LPC11xx.c **** 
 156:../cmsis/system_LPC11xx.c ****     /* main clock calculation */
 157:../cmsis/system_LPC11xx.c ****     #if   ((MAINCLKSEL_Val & 0x03) == 0)
 158:../cmsis/system_LPC11xx.c ****       #define __MAIN_CLOCK             (__IRC_OSC_CLK)
 159:../cmsis/system_LPC11xx.c ****     #elif ((MAINCLKSEL_Val & 0x03) == 1)
 160:../cmsis/system_LPC11xx.c ****       #define __MAIN_CLOCK             (__SYS_PLLCLKIN)
 161:../cmsis/system_LPC11xx.c ****     #elif ((MAINCLKSEL_Val & 0x03) == 2)
 162:../cmsis/system_LPC11xx.c ****       #define __MAIN_CLOCK             (__WDT_OSC_CLK)
 163:../cmsis/system_LPC11xx.c ****     #elif ((MAINCLKSEL_Val & 0x03) == 3)
 164:../cmsis/system_LPC11xx.c ****       #define __MAIN_CLOCK             (__SYS_PLLCLKOUT)
 165:../cmsis/system_LPC11xx.c ****     #else
 166:../cmsis/system_LPC11xx.c ****       #define __MAIN_CLOCK             (0)
 167:../cmsis/system_LPC11xx.c ****     #endif
 168:../cmsis/system_LPC11xx.c **** 
 169:../cmsis/system_LPC11xx.c ****     #define __SYSTEM_CLOCK             (__MAIN_CLOCK / SYSAHBCLKDIV_Val)         
 170:../cmsis/system_LPC11xx.c **** 
 171:../cmsis/system_LPC11xx.c ****   #else // SYSCLK_SETUP
 172:../cmsis/system_LPC11xx.c ****     #if (SYSAHBCLKDIV_Val == 0)
 173:../cmsis/system_LPC11xx.c ****       #define __SYSTEM_CLOCK           (0)
 174:../cmsis/system_LPC11xx.c ****     #else
 175:../cmsis/system_LPC11xx.c ****       #define __SYSTEM_CLOCK           (__XTAL / SYSAHBCLKDIV_Val)
 176:../cmsis/system_LPC11xx.c ****     #endif
 177:../cmsis/system_LPC11xx.c ****   #endif // SYSCLK_SETUP
 178:../cmsis/system_LPC11xx.c **** 
 179:../cmsis/system_LPC11xx.c **** #else
 180:../cmsis/system_LPC11xx.c ****   #define __SYSTEM_CLOCK               (__XTAL)
 181:../cmsis/system_LPC11xx.c **** #endif  // CLOCK_SETUP 
 182:../cmsis/system_LPC11xx.c **** 
 183:../cmsis/system_LPC11xx.c **** 
 184:../cmsis/system_LPC11xx.c **** /*----------------------------------------------------------------------------
 185:../cmsis/system_LPC11xx.c ****   Clock Variable definitions
 186:../cmsis/system_LPC11xx.c ****  *----------------------------------------------------------------------------*/
 187:../cmsis/system_LPC11xx.c **** uint32_t SystemCoreClock = __SYSTEM_CLOCK;/*!< System Clock Frequency (Core Clock)*/
 188:../cmsis/system_LPC11xx.c **** 
 189:../cmsis/system_LPC11xx.c **** #if CONFIG_ENABLE_CMSIS_SYSTEMCORECLOCKUPDATE==1 || !defined(CONFIG_ENABLE_CMSIS_SYSTEMCORECLOCKUPD
 190:../cmsis/system_LPC11xx.c **** /*----------------------------------------------------------------------------
 191:../cmsis/system_LPC11xx.c ****   Clock functions
 192:../cmsis/system_LPC11xx.c ****  *----------------------------------------------------------------------------*/
 193:../cmsis/system_LPC11xx.c **** void SystemCoreClockUpdate (void)            /* Get Core Clock Frequency      */
 194:../cmsis/system_LPC11xx.c **** {
  68              		.loc 2 194 0
  69              		.cfi_startproc
  70              		@ args = 0, pretend = 0, frame = 8
  71              		@ frame_needed = 1, uses_anonymous_args = 0
  72 0000 90B5     		push	{r4, r7, lr}
  73              		.cfi_def_cfa_offset 12
  74              		.cfi_offset 4, -12
  75              		.cfi_offset 7, -8
  76              		.cfi_offset 14, -4
  77 0002 83B0     		sub	sp, sp, #12
  78              		.cfi_def_cfa_offset 24
  79 0004 00AF     		add	r7, sp, #0
  80              		.cfi_def_cfa_register 7
 195:../cmsis/system_LPC11xx.c ****   uint32_t wdt_osc = 0;
  81              		.loc 2 195 0
  82 0006 0023     		movs	r3, #0
  83 0008 7B60     		str	r3, [r7, #4]
 196:../cmsis/system_LPC11xx.c **** 
 197:../cmsis/system_LPC11xx.c ****   /* Determine clock frequency according to clock register values             */
 198:../cmsis/system_LPC11xx.c ****   switch ((LPC_SYSCON->WDTOSCCTRL >> 5) & 0x0F) {
  84              		.loc 2 198 0
  85 000a 714B     		ldr	r3, .L43
  86 000c 5B6A     		ldr	r3, [r3, #36]
  87 000e 5B09     		lsrs	r3, r3, #5
  88 0010 0F22     		movs	r2, #15
  89 0012 1340     		ands	r3, r2
  90 0014 0F2B     		cmp	r3, #15
  91 0016 34D8     		bhi	.L3
  92 0018 9A00     		lsls	r2, r3, #2
  93 001a 6E4B     		ldr	r3, .L43+4
  94 001c D318     		adds	r3, r2, r3
  95 001e 1B68     		ldr	r3, [r3]
  96 0020 9F46     		mov	pc, r3
  97              		.section	.rodata
  98              		.align	2
  99              	.L5:
 100 0000 22000000 		.word	.L4
 101 0004 28000000 		.word	.L6
 102 0008 2E000000 		.word	.L7
 103 000c 34000000 		.word	.L8
 104 0010 3A000000 		.word	.L9
 105 0014 40000000 		.word	.L10
 106 0018 46000000 		.word	.L11
 107 001c 4C000000 		.word	.L12
 108 0020 52000000 		.word	.L13
 109 0024 58000000 		.word	.L14
 110 0028 5E000000 		.word	.L15
 111 002c 64000000 		.word	.L16
 112 0030 6A000000 		.word	.L17
 113 0034 70000000 		.word	.L18
 114 0038 76000000 		.word	.L19
 115 003c 7C000000 		.word	.L20
 116              		.section	.text.SystemCoreClockUpdate
 117              	.L4:
 199:../cmsis/system_LPC11xx.c ****     case 0:  wdt_osc =  400000; break;
 118              		.loc 2 199 0
 119 0022 6D4B     		ldr	r3, .L43+8
 120 0024 7B60     		str	r3, [r7, #4]
 121 0026 2CE0     		b	.L3
 122              	.L6:
 200:../cmsis/system_LPC11xx.c ****     case 1:  wdt_osc =  500000; break;
 123              		.loc 2 200 0
 124 0028 6C4B     		ldr	r3, .L43+12
 125 002a 7B60     		str	r3, [r7, #4]
 126 002c 29E0     		b	.L3
 127              	.L7:
 201:../cmsis/system_LPC11xx.c ****     case 2:  wdt_osc =  800000; break;
 128              		.loc 2 201 0
 129 002e 6C4B     		ldr	r3, .L43+16
 130 0030 7B60     		str	r3, [r7, #4]
 131 0032 26E0     		b	.L3
 132              	.L8:
 202:../cmsis/system_LPC11xx.c ****     case 3:  wdt_osc = 1100000; break;
 133              		.loc 2 202 0
 134 0034 6B4B     		ldr	r3, .L43+20
 135 0036 7B60     		str	r3, [r7, #4]
 136 0038 23E0     		b	.L3
 137              	.L9:
 203:../cmsis/system_LPC11xx.c ****     case 4:  wdt_osc = 1400000; break;
 138              		.loc 2 203 0
 139 003a 6B4B     		ldr	r3, .L43+24
 140 003c 7B60     		str	r3, [r7, #4]
 141 003e 20E0     		b	.L3
 142              	.L10:
 204:../cmsis/system_LPC11xx.c ****     case 5:  wdt_osc = 1600000; break;
 143              		.loc 2 204 0
 144 0040 6A4B     		ldr	r3, .L43+28
 145 0042 7B60     		str	r3, [r7, #4]
 146 0044 1DE0     		b	.L3
 147              	.L11:
 205:../cmsis/system_LPC11xx.c ****     case 6:  wdt_osc = 1800000; break;
 148              		.loc 2 205 0
 149 0046 6A4B     		ldr	r3, .L43+32
 150 0048 7B60     		str	r3, [r7, #4]
 151 004a 1AE0     		b	.L3
 152              	.L12:
 206:../cmsis/system_LPC11xx.c ****     case 7:  wdt_osc = 2000000; break;
 153              		.loc 2 206 0
 154 004c 694B     		ldr	r3, .L43+36
 155 004e 7B60     		str	r3, [r7, #4]
 156 0050 17E0     		b	.L3
 157              	.L13:
 207:../cmsis/system_LPC11xx.c ****     case 8:  wdt_osc = 2200000; break;
 158              		.loc 2 207 0
 159 0052 694B     		ldr	r3, .L43+40
 160 0054 7B60     		str	r3, [r7, #4]
 161 0056 14E0     		b	.L3
 162              	.L14:
 208:../cmsis/system_LPC11xx.c ****     case 9:  wdt_osc = 2400000; break;
 163              		.loc 2 208 0
 164 0058 684B     		ldr	r3, .L43+44
 165 005a 7B60     		str	r3, [r7, #4]
 166 005c 11E0     		b	.L3
 167              	.L15:
 209:../cmsis/system_LPC11xx.c ****     case 10: wdt_osc = 2600000; break;
 168              		.loc 2 209 0
 169 005e 684B     		ldr	r3, .L43+48
 170 0060 7B60     		str	r3, [r7, #4]
 171 0062 0EE0     		b	.L3
 172              	.L16:
 210:../cmsis/system_LPC11xx.c ****     case 11: wdt_osc = 2700000; break;
 173              		.loc 2 210 0
 174 0064 674B     		ldr	r3, .L43+52
 175 0066 7B60     		str	r3, [r7, #4]
 176 0068 0BE0     		b	.L3
 177              	.L17:
 211:../cmsis/system_LPC11xx.c ****     case 12: wdt_osc = 2900000; break;
 178              		.loc 2 211 0
 179 006a 674B     		ldr	r3, .L43+56
 180 006c 7B60     		str	r3, [r7, #4]
 181 006e 08E0     		b	.L3
 182              	.L18:
 212:../cmsis/system_LPC11xx.c ****     case 13: wdt_osc = 3100000; break;
 183              		.loc 2 212 0
 184 0070 664B     		ldr	r3, .L43+60
 185 0072 7B60     		str	r3, [r7, #4]
 186 0074 05E0     		b	.L3
 187              	.L19:
 213:../cmsis/system_LPC11xx.c ****     case 14: wdt_osc = 3200000; break;
 188              		.loc 2 213 0
 189 0076 664B     		ldr	r3, .L43+64
 190 0078 7B60     		str	r3, [r7, #4]
 191 007a 02E0     		b	.L3
 192              	.L20:
 214:../cmsis/system_LPC11xx.c ****     case 15: wdt_osc = 3400000; break;
 193              		.loc 2 214 0
 194 007c 654B     		ldr	r3, .L43+68
 195 007e 7B60     		str	r3, [r7, #4]
 196 0080 C046     		nop
 197              	.L3:
 215:../cmsis/system_LPC11xx.c ****   }
 216:../cmsis/system_LPC11xx.c ****   wdt_osc /= ((LPC_SYSCON->WDTOSCCTRL & 0x1F) << 1) + 2;
 198              		.loc 2 216 0
 199 0082 534B     		ldr	r3, .L43
 200 0084 5B6A     		ldr	r3, [r3, #36]
 201 0086 1F22     		movs	r2, #31
 202 0088 1340     		ands	r3, r2
 203 008a 5B00     		lsls	r3, r3, #1
 204 008c 0233     		adds	r3, r3, #2
 205 008e 1900     		movs	r1, r3
 206 0090 7868     		ldr	r0, [r7, #4]
 207 0092 FFF7FEFF 		bl	__aeabi_uidiv
 208 0096 0300     		movs	r3, r0
 209 0098 7B60     		str	r3, [r7, #4]
 217:../cmsis/system_LPC11xx.c ****  
 218:../cmsis/system_LPC11xx.c ****   switch (LPC_SYSCON->MAINCLKSEL & 0x03) {
 210              		.loc 2 218 0
 211 009a 4D4B     		ldr	r3, .L43
 212 009c 1B6F     		ldr	r3, [r3, #112]
 213 009e 0322     		movs	r2, #3
 214 00a0 1340     		ands	r3, r2
 215 00a2 012B     		cmp	r3, #1
 216 00a4 09D0     		beq	.L22
 217 00a6 04D3     		bcc	.L23
 218 00a8 022B     		cmp	r3, #2
 219 00aa 23D0     		beq	.L24
 220 00ac 032B     		cmp	r3, #3
 221 00ae 25D0     		beq	.L25
 222 00b0 71E0     		b	.L21
 223              	.L23:
 219:../cmsis/system_LPC11xx.c ****     case 0:                             /* Internal RC oscillator             */
 220:../cmsis/system_LPC11xx.c ****       SystemCoreClock = __IRC_OSC_CLK;
 224              		.loc 2 220 0
 225 00b2 594B     		ldr	r3, .L43+72
 226 00b4 594A     		ldr	r2, .L43+76
 227 00b6 1A60     		str	r2, [r3]
 221:../cmsis/system_LPC11xx.c ****       break;
 228              		.loc 2 221 0
 229 00b8 6DE0     		b	.L21
 230              	.L22:
 222:../cmsis/system_LPC11xx.c ****     case 1:                             /* Input Clock to System PLL          */
 223:../cmsis/system_LPC11xx.c ****       switch (LPC_SYSCON->SYSPLLCLKSEL & 0x03) {
 231              		.loc 2 223 0
 232 00ba 454B     		ldr	r3, .L43
 233 00bc 1B6C     		ldr	r3, [r3, #64]
 234 00be 0322     		movs	r2, #3
 235 00c0 1340     		ands	r3, r2
 236 00c2 012B     		cmp	r3, #1
 237 00c4 09D0     		beq	.L27
 238 00c6 04D3     		bcc	.L28
 239 00c8 022B     		cmp	r3, #2
 240 00ca 0AD0     		beq	.L29
 241 00cc 032B     		cmp	r3, #3
 242 00ce 0CD0     		beq	.L30
 224:../cmsis/system_LPC11xx.c ****           case 0:                       /* Internal RC oscillator             */
 225:../cmsis/system_LPC11xx.c ****             SystemCoreClock = __IRC_OSC_CLK;
 226:../cmsis/system_LPC11xx.c ****             break;
 227:../cmsis/system_LPC11xx.c ****           case 1:                       /* System oscillator                  */
 228:../cmsis/system_LPC11xx.c ****             SystemCoreClock = __SYS_OSC_CLK;
 229:../cmsis/system_LPC11xx.c ****             break;
 230:../cmsis/system_LPC11xx.c ****           case 2:                       /* WDT Oscillator                     */
 231:../cmsis/system_LPC11xx.c ****             SystemCoreClock = wdt_osc;
 232:../cmsis/system_LPC11xx.c ****             break;
 233:../cmsis/system_LPC11xx.c ****           case 3:                       /* Reserved                           */
 234:../cmsis/system_LPC11xx.c ****             SystemCoreClock = 0;
 235:../cmsis/system_LPC11xx.c ****             break;
 236:../cmsis/system_LPC11xx.c ****       }
 237:../cmsis/system_LPC11xx.c ****       break;
 243              		.loc 2 237 0
 244 00d0 61E0     		b	.L21
 245              	.L28:
 225:../cmsis/system_LPC11xx.c ****             break;
 246              		.loc 2 225 0
 247 00d2 514B     		ldr	r3, .L43+72
 248 00d4 514A     		ldr	r2, .L43+76
 249 00d6 1A60     		str	r2, [r3]
 226:../cmsis/system_LPC11xx.c ****           case 1:                       /* System oscillator                  */
 250              		.loc 2 226 0
 251 00d8 0BE0     		b	.L26
 252              	.L27:
 228:../cmsis/system_LPC11xx.c ****             break;
 253              		.loc 2 228 0
 254 00da 4F4B     		ldr	r3, .L43+72
 255 00dc 4F4A     		ldr	r2, .L43+76
 256 00de 1A60     		str	r2, [r3]
 229:../cmsis/system_LPC11xx.c ****           case 2:                       /* WDT Oscillator                     */
 257              		.loc 2 229 0
 258 00e0 07E0     		b	.L26
 259              	.L29:
 231:../cmsis/system_LPC11xx.c ****             break;
 260              		.loc 2 231 0
 261 00e2 4D4B     		ldr	r3, .L43+72
 262 00e4 7A68     		ldr	r2, [r7, #4]
 263 00e6 1A60     		str	r2, [r3]
 232:../cmsis/system_LPC11xx.c ****           case 3:                       /* Reserved                           */
 264              		.loc 2 232 0
 265 00e8 03E0     		b	.L26
 266              	.L30:
 234:../cmsis/system_LPC11xx.c ****             break;
 267              		.loc 2 234 0
 268 00ea 4B4B     		ldr	r3, .L43+72
 269 00ec 0022     		movs	r2, #0
 270 00ee 1A60     		str	r2, [r3]
 235:../cmsis/system_LPC11xx.c ****       }
 271              		.loc 2 235 0
 272 00f0 C046     		nop
 273              	.L26:
 274              		.loc 2 237 0
 275 00f2 50E0     		b	.L21
 276              	.L24:
 238:../cmsis/system_LPC11xx.c ****     case 2:                             /* WDT Oscillator                     */
 239:../cmsis/system_LPC11xx.c ****       SystemCoreClock = wdt_osc;
 277              		.loc 2 239 0
 278 00f4 484B     		ldr	r3, .L43+72
 279 00f6 7A68     		ldr	r2, [r7, #4]
 280 00f8 1A60     		str	r2, [r3]
 240:../cmsis/system_LPC11xx.c ****       break;
 281              		.loc 2 240 0
 282 00fa 4CE0     		b	.L21
 283              	.L25:
 241:../cmsis/system_LPC11xx.c ****     case 3:                             /* System PLL Clock Out               */
 242:../cmsis/system_LPC11xx.c ****       switch (LPC_SYSCON->SYSPLLCLKSEL & 0x03) {
 284              		.loc 2 242 0
 285 00fc 344B     		ldr	r3, .L43
 286 00fe 1B6C     		ldr	r3, [r3, #64]
 287 0100 0322     		movs	r2, #3
 288 0102 1340     		ands	r3, r2
 289 0104 012B     		cmp	r3, #1
 290 0106 19D0     		beq	.L32
 291 0108 04D3     		bcc	.L33
 292 010a 022B     		cmp	r3, #2
 293 010c 2AD0     		beq	.L34
 294 010e 032B     		cmp	r3, #3
 295 0110 3CD0     		beq	.L35
 243:../cmsis/system_LPC11xx.c ****           case 0:                       /* Internal RC oscillator             */
 244:../cmsis/system_LPC11xx.c ****             if (LPC_SYSCON->SYSPLLCTRL & 0x180) {
 245:../cmsis/system_LPC11xx.c ****               SystemCoreClock = __IRC_OSC_CLK;
 246:../cmsis/system_LPC11xx.c ****             } else {
 247:../cmsis/system_LPC11xx.c ****               SystemCoreClock = __IRC_OSC_CLK * ((LPC_SYSCON->SYSPLLCTRL & 0x01F) + 1);
 248:../cmsis/system_LPC11xx.c ****             }
 249:../cmsis/system_LPC11xx.c ****             break;
 250:../cmsis/system_LPC11xx.c ****           case 1:                       /* System oscillator                  */
 251:../cmsis/system_LPC11xx.c ****             if (LPC_SYSCON->SYSPLLCTRL & 0x180) {
 252:../cmsis/system_LPC11xx.c ****               SystemCoreClock = __SYS_OSC_CLK;
 253:../cmsis/system_LPC11xx.c ****             } else {
 254:../cmsis/system_LPC11xx.c ****               SystemCoreClock = __SYS_OSC_CLK * ((LPC_SYSCON->SYSPLLCTRL & 0x01F) + 1);
 255:../cmsis/system_LPC11xx.c ****             }
 256:../cmsis/system_LPC11xx.c ****             break;
 257:../cmsis/system_LPC11xx.c ****           case 2:                       /* WDT Oscillator                     */
 258:../cmsis/system_LPC11xx.c ****             if (LPC_SYSCON->SYSPLLCTRL & 0x180) {
 259:../cmsis/system_LPC11xx.c ****               SystemCoreClock = wdt_osc;
 260:../cmsis/system_LPC11xx.c ****             } else {
 261:../cmsis/system_LPC11xx.c ****               SystemCoreClock = wdt_osc * ((LPC_SYSCON->SYSPLLCTRL & 0x01F) + 1);
 262:../cmsis/system_LPC11xx.c ****             }
 263:../cmsis/system_LPC11xx.c ****             break;
 264:../cmsis/system_LPC11xx.c ****           case 3:                       /* Reserved                           */
 265:../cmsis/system_LPC11xx.c ****             SystemCoreClock = 0;
 266:../cmsis/system_LPC11xx.c ****             break;
 267:../cmsis/system_LPC11xx.c ****       }
 268:../cmsis/system_LPC11xx.c ****       break;
 296              		.loc 2 268 0
 297 0112 3FE0     		b	.L42
 298              	.L33:
 244:../cmsis/system_LPC11xx.c ****               SystemCoreClock = __IRC_OSC_CLK;
 299              		.loc 2 244 0
 300 0114 2E4B     		ldr	r3, .L43
 301 0116 9A68     		ldr	r2, [r3, #8]
 302 0118 C023     		movs	r3, #192
 303 011a 5B00     		lsls	r3, r3, #1
 304 011c 1340     		ands	r3, r2
 305 011e 03D0     		beq	.L36
 245:../cmsis/system_LPC11xx.c ****             } else {
 306              		.loc 2 245 0
 307 0120 3D4B     		ldr	r3, .L43+72
 308 0122 3E4A     		ldr	r2, .L43+76
 309 0124 1A60     		str	r2, [r3]
 249:../cmsis/system_LPC11xx.c ****           case 1:                       /* System oscillator                  */
 310              		.loc 2 249 0
 311 0126 35E0     		b	.L31
 312              	.L36:
 247:../cmsis/system_LPC11xx.c ****             }
 313              		.loc 2 247 0
 314 0128 294B     		ldr	r3, .L43
 315 012a 9B68     		ldr	r3, [r3, #8]
 316 012c 1F22     		movs	r2, #31
 317 012e 1340     		ands	r3, r2
 318 0130 0133     		adds	r3, r3, #1
 319 0132 3A4A     		ldr	r2, .L43+76
 320 0134 5A43     		muls	r2, r3
 321 0136 384B     		ldr	r3, .L43+72
 322 0138 1A60     		str	r2, [r3]
 249:../cmsis/system_LPC11xx.c ****           case 1:                       /* System oscillator                  */
 323              		.loc 2 249 0
 324 013a 2BE0     		b	.L31
 325              	.L32:
 251:../cmsis/system_LPC11xx.c ****               SystemCoreClock = __SYS_OSC_CLK;
 326              		.loc 2 251 0
 327 013c 244B     		ldr	r3, .L43
 328 013e 9A68     		ldr	r2, [r3, #8]
 329 0140 C023     		movs	r3, #192
 330 0142 5B00     		lsls	r3, r3, #1
 331 0144 1340     		ands	r3, r2
 332 0146 03D0     		beq	.L38
 252:../cmsis/system_LPC11xx.c ****             } else {
 333              		.loc 2 252 0
 334 0148 334B     		ldr	r3, .L43+72
 335 014a 344A     		ldr	r2, .L43+76
 336 014c 1A60     		str	r2, [r3]
 256:../cmsis/system_LPC11xx.c ****           case 2:                       /* WDT Oscillator                     */
 337              		.loc 2 256 0
 338 014e 21E0     		b	.L31
 339              	.L38:
 254:../cmsis/system_LPC11xx.c ****             }
 340              		.loc 2 254 0
 341 0150 1F4B     		ldr	r3, .L43
 342 0152 9B68     		ldr	r3, [r3, #8]
 343 0154 1F22     		movs	r2, #31
 344 0156 1340     		ands	r3, r2
 345 0158 0133     		adds	r3, r3, #1
 346 015a 304A     		ldr	r2, .L43+76
 347 015c 5A43     		muls	r2, r3
 348 015e 2E4B     		ldr	r3, .L43+72
 349 0160 1A60     		str	r2, [r3]
 256:../cmsis/system_LPC11xx.c ****           case 2:                       /* WDT Oscillator                     */
 350              		.loc 2 256 0
 351 0162 17E0     		b	.L31
 352              	.L34:
 258:../cmsis/system_LPC11xx.c ****               SystemCoreClock = wdt_osc;
 353              		.loc 2 258 0
 354 0164 1A4B     		ldr	r3, .L43
 355 0166 9A68     		ldr	r2, [r3, #8]
 356 0168 C023     		movs	r3, #192
 357 016a 5B00     		lsls	r3, r3, #1
 358 016c 1340     		ands	r3, r2
 359 016e 03D0     		beq	.L40
 259:../cmsis/system_LPC11xx.c ****             } else {
 360              		.loc 2 259 0
 361 0170 294B     		ldr	r3, .L43+72
 362 0172 7A68     		ldr	r2, [r7, #4]
 363 0174 1A60     		str	r2, [r3]
 263:../cmsis/system_LPC11xx.c ****           case 3:                       /* Reserved                           */
 364              		.loc 2 263 0
 365 0176 0DE0     		b	.L31
 366              	.L40:
 261:../cmsis/system_LPC11xx.c ****             }
 367              		.loc 2 261 0
 368 0178 154B     		ldr	r3, .L43
 369 017a 9B68     		ldr	r3, [r3, #8]
 370 017c 1F22     		movs	r2, #31
 371 017e 1340     		ands	r3, r2
 372 0180 0133     		adds	r3, r3, #1
 373 0182 7A68     		ldr	r2, [r7, #4]
 374 0184 5A43     		muls	r2, r3
 375 0186 244B     		ldr	r3, .L43+72
 376 0188 1A60     		str	r2, [r3]
 263:../cmsis/system_LPC11xx.c ****           case 3:                       /* Reserved                           */
 377              		.loc 2 263 0
 378 018a 03E0     		b	.L31
 379              	.L35:
 265:../cmsis/system_LPC11xx.c ****             break;
 380              		.loc 2 265 0
 381 018c 224B     		ldr	r3, .L43+72
 382 018e 0022     		movs	r2, #0
 383 0190 1A60     		str	r2, [r3]
 266:../cmsis/system_LPC11xx.c ****       }
 384              		.loc 2 266 0
 385 0192 C046     		nop
 386              	.L31:
 387              	.L42:
 388              		.loc 2 268 0
 389 0194 C046     		nop
 390              	.L21:
 269:../cmsis/system_LPC11xx.c ****   }
 270:../cmsis/system_LPC11xx.c **** 
 271:../cmsis/system_LPC11xx.c ****   SystemCoreClock /= LPC_SYSCON->SYSAHBCLKDIV;  
 391              		.loc 2 271 0
 392 0196 0E4B     		ldr	r3, .L43
 393 0198 9A6F     		ldr	r2, [r3, #120]
 394 019a 1F4B     		ldr	r3, .L43+72
 395 019c 1B68     		ldr	r3, [r3]
 396 019e 1100     		movs	r1, r2
 397 01a0 1800     		movs	r0, r3
 398 01a2 FFF7FEFF 		bl	__aeabi_uidiv
 399 01a6 0300     		movs	r3, r0
 400 01a8 1A00     		movs	r2, r3
 401 01aa 1B4B     		ldr	r3, .L43+72
 402 01ac 1A60     		str	r2, [r3]
 272:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSTCKCAL = (SystemCoreClock / 100) - 1;
 403              		.loc 2 272 0
 404 01ae 084C     		ldr	r4, .L43
 405 01b0 194B     		ldr	r3, .L43+72
 406 01b2 1B68     		ldr	r3, [r3]
 407 01b4 6421     		movs	r1, #100
 408 01b6 1800     		movs	r0, r3
 409 01b8 FFF7FEFF 		bl	__aeabi_uidiv
 410 01bc 0300     		movs	r3, r0
 411 01be 5A1E     		subs	r2, r3, #1
 412 01c0 AA23     		movs	r3, #170
 413 01c2 5B00     		lsls	r3, r3, #1
 414 01c4 E250     		str	r2, [r4, r3]
 273:../cmsis/system_LPC11xx.c **** }
 415              		.loc 2 273 0
 416 01c6 C046     		nop
 417 01c8 BD46     		mov	sp, r7
 418 01ca 03B0     		add	sp, sp, #12
 419              		@ sp needed
 420 01cc 90BD     		pop	{r4, r7, pc}
 421              	.L44:
 422 01ce C046     		.align	2
 423              	.L43:
 424 01d0 00800440 		.word	1074036736
 425 01d4 00000000 		.word	.L5
 426 01d8 801A0600 		.word	400000
 427 01dc 20A10700 		.word	500000
 428 01e0 00350C00 		.word	800000
 429 01e4 E0C81000 		.word	1100000
 430 01e8 C05C1500 		.word	1400000
 431 01ec 006A1800 		.word	1600000
 432 01f0 40771B00 		.word	1800000
 433 01f4 80841E00 		.word	2000000
 434 01f8 C0912100 		.word	2200000
 435 01fc 009F2400 		.word	2400000
 436 0200 40AC2700 		.word	2600000
 437 0204 E0322900 		.word	2700000
 438 0208 20402C00 		.word	2900000
 439 020c 604D2F00 		.word	3100000
 440 0210 00D43000 		.word	3200000
 441 0214 40E13300 		.word	3400000
 442 0218 00000000 		.word	SystemCoreClock
 443 021c 001BB700 		.word	12000000
 444              		.cfi_endproc
 445              	.LFE20:
 447              		.section	.text.SystemInit,"ax",%progbits
 448              		.align	2
 449              		.global	SystemInit
 450              		.code	16
 451              		.thumb_func
 453              	SystemInit:
 454              	.LFB21:
 274:../cmsis/system_LPC11xx.c **** #else
 275:../cmsis/system_LPC11xx.c **** void SystemCoreClockUpdate (void)            /* Get Core Clock Frequency      */
 276:../cmsis/system_LPC11xx.c **** {
 277:../cmsis/system_LPC11xx.c **** 	SystemCoreClock = CONFIG_CMSIS_SET_SYSTEMCORECLOCK_DEFAULT;
 278:../cmsis/system_LPC11xx.c **** }
 279:../cmsis/system_LPC11xx.c **** #endif
 280:../cmsis/system_LPC11xx.c **** #if CONFIG_ENABLE_CMSIS_SYSTEMINIT==1 || !defined(CONFIG_ENABLE_CMSIS_SYSTEMINIT)
 281:../cmsis/system_LPC11xx.c **** 
 282:../cmsis/system_LPC11xx.c **** /**
 283:../cmsis/system_LPC11xx.c ****  * Initialize the system
 284:../cmsis/system_LPC11xx.c ****  *
 285:../cmsis/system_LPC11xx.c ****  * @param  none
 286:../cmsis/system_LPC11xx.c ****  * @return none
 287:../cmsis/system_LPC11xx.c ****  *
 288:../cmsis/system_LPC11xx.c ****  * @brief  Setup the microcontroller system.
 289:../cmsis/system_LPC11xx.c ****  *         Initialize the System.
 290:../cmsis/system_LPC11xx.c ****  */
 291:../cmsis/system_LPC11xx.c **** extern void (* const g_pfnVectors[])(void);
 292:../cmsis/system_LPC11xx.c **** 
 293:../cmsis/system_LPC11xx.c **** void SystemInit (void)
 294:../cmsis/system_LPC11xx.c **** {
 455              		.loc 2 294 0
 456              		.cfi_startproc
 457              		@ args = 0, pretend = 0, frame = 8
 458              		@ frame_needed = 1, uses_anonymous_args = 0
 459 0000 80B5     		push	{r7, lr}
 460              		.cfi_def_cfa_offset 8
 461              		.cfi_offset 7, -8
 462              		.cfi_offset 14, -4
 463 0002 82B0     		sub	sp, sp, #8
 464              		.cfi_def_cfa_offset 16
 465 0004 00AF     		add	r7, sp, #0
 466              		.cfi_def_cfa_register 7
 295:../cmsis/system_LPC11xx.c **** 	void * volatile v = (void *)&g_pfnVectors[0];
 467              		.loc 2 295 0
 468 0006 3B4B     		ldr	r3, .L52
 469 0008 3B60     		str	r3, [r7]
 296:../cmsis/system_LPC11xx.c **** 
 297:../cmsis/system_LPC11xx.c **** 	// If vector table symbol is not at vector table address (0)
 298:../cmsis/system_LPC11xx.c ****     if(v != 0)
 470              		.loc 2 298 0
 471 000a 3B68     		ldr	r3, [r7]
 472 000c 002B     		cmp	r3, #0
 473 000e 07D0     		beq	.L46
 299:../cmsis/system_LPC11xx.c ****     {
 300:../cmsis/system_LPC11xx.c ****     	// Then assume need to map vectors to RAM
 301:../cmsis/system_LPC11xx.c ****     	LPC_SYSCON->SYSMEMREMAP = ((LPC_SYSCON->SYSMEMREMAP)& ~3) | 1;
 474              		.loc 2 301 0
 475 0010 394B     		ldr	r3, .L52+4
 476 0012 394A     		ldr	r2, .L52+4
 477 0014 1268     		ldr	r2, [r2]
 478 0016 0321     		movs	r1, #3
 479 0018 8A43     		bics	r2, r1
 480 001a 0121     		movs	r1, #1
 481 001c 0A43     		orrs	r2, r1
 482 001e 1A60     		str	r2, [r3]
 483              	.L46:
 302:../cmsis/system_LPC11xx.c ****     }// else
 303:../cmsis/system_LPC11xx.c ****      //	LPC_SYSCON->SYSMEMREMAP |= 3; // Map to flash
 304:../cmsis/system_LPC11xx.c **** 
 305:../cmsis/system_LPC11xx.c **** #if (CLOCK_SETUP)                                 /* Clock Setup              */
 306:../cmsis/system_LPC11xx.c **** #if (SYSCLK_SETUP)                                /* System Clock Setup       */
 307:../cmsis/system_LPC11xx.c **** #if (SYSOSC_SETUP)                                /* System Oscillator Setup  */
 308:../cmsis/system_LPC11xx.c ****   uint32_t i;
 309:../cmsis/system_LPC11xx.c **** 
 310:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->PDRUNCFG     &= ~(1 << 5);          /* Power-up System Osc      */
 484              		.loc 2 310 0
 485 0020 3549     		ldr	r1, .L52+4
 486 0022 354A     		ldr	r2, .L52+4
 487 0024 8E23     		movs	r3, #142
 488 0026 9B00     		lsls	r3, r3, #2
 489 0028 D358     		ldr	r3, [r2, r3]
 490 002a 2022     		movs	r2, #32
 491 002c 9343     		bics	r3, r2
 492 002e 1A00     		movs	r2, r3
 493 0030 8E23     		movs	r3, #142
 494 0032 9B00     		lsls	r3, r3, #2
 495 0034 CA50     		str	r2, [r1, r3]
 311:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSOSCCTRL    = SYSOSCCTRL_Val;
 496              		.loc 2 311 0
 497 0036 304B     		ldr	r3, .L52+4
 498 0038 0022     		movs	r2, #0
 499 003a 1A62     		str	r2, [r3, #32]
 312:../cmsis/system_LPC11xx.c ****   for (i = 0; i < 200; i++) __NOP();
 500              		.loc 2 312 0
 501 003c 0023     		movs	r3, #0
 502 003e 7B60     		str	r3, [r7, #4]
 503 0040 04E0     		b	.L47
 504              	.L48:
 505              		.loc 2 312 0 is_stmt 0 discriminator 3
 506 0042 FFF7FEFF 		bl	__NOP
 507 0046 7B68     		ldr	r3, [r7, #4]
 508 0048 0133     		adds	r3, r3, #1
 509 004a 7B60     		str	r3, [r7, #4]
 510              	.L47:
 511              		.loc 2 312 0 discriminator 1
 512 004c 7B68     		ldr	r3, [r7, #4]
 513 004e C72B     		cmp	r3, #199
 514 0050 F7D9     		bls	.L48
 313:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSPLLCLKSEL  = SYSPLLCLKSEL_Val;   /* Select PLL Input         */
 515              		.loc 2 313 0 is_stmt 1
 516 0052 294B     		ldr	r3, .L52+4
 517 0054 0122     		movs	r2, #1
 518 0056 1A64     		str	r2, [r3, #64]
 314:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSPLLCLKUEN  = 0x01;               /* Update Clock Source      */
 519              		.loc 2 314 0
 520 0058 274B     		ldr	r3, .L52+4
 521 005a 0122     		movs	r2, #1
 522 005c 5A64     		str	r2, [r3, #68]
 315:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSPLLCLKUEN  = 0x00;               /* Toggle Update Register   */
 523              		.loc 2 315 0
 524 005e 264B     		ldr	r3, .L52+4
 525 0060 0022     		movs	r2, #0
 526 0062 5A64     		str	r2, [r3, #68]
 316:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSPLLCLKUEN  = 0x01;
 527              		.loc 2 316 0
 528 0064 244B     		ldr	r3, .L52+4
 529 0066 0122     		movs	r2, #1
 530 0068 5A64     		str	r2, [r3, #68]
 317:../cmsis/system_LPC11xx.c ****   while (!(LPC_SYSCON->SYSPLLCLKUEN & 0x01));     /* Wait Until Updated       */
 531              		.loc 2 317 0
 532 006a C046     		nop
 533              	.L49:
 534              		.loc 2 317 0 is_stmt 0 discriminator 1
 535 006c 224B     		ldr	r3, .L52+4
 536 006e 5B6C     		ldr	r3, [r3, #68]
 537 0070 0122     		movs	r2, #1
 538 0072 1340     		ands	r3, r2
 539 0074 FAD0     		beq	.L49
 318:../cmsis/system_LPC11xx.c **** #if (SYSPLL_SETUP)                                /* System PLL Setup         */
 319:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSPLLCTRL    = SYSPLLCTRL_Val;
 540              		.loc 2 319 0 is_stmt 1
 541 0076 204B     		ldr	r3, .L52+4
 542 0078 2322     		movs	r2, #35
 543 007a 9A60     		str	r2, [r3, #8]
 320:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->PDRUNCFG     &= ~(1 << 7);          /* Power-up SYSPLL          */
 544              		.loc 2 320 0
 545 007c 1E49     		ldr	r1, .L52+4
 546 007e 1E4A     		ldr	r2, .L52+4
 547 0080 8E23     		movs	r3, #142
 548 0082 9B00     		lsls	r3, r3, #2
 549 0084 D358     		ldr	r3, [r2, r3]
 550 0086 8022     		movs	r2, #128
 551 0088 9343     		bics	r3, r2
 552 008a 1A00     		movs	r2, r3
 553 008c 8E23     		movs	r3, #142
 554 008e 9B00     		lsls	r3, r3, #2
 555 0090 CA50     		str	r2, [r1, r3]
 321:../cmsis/system_LPC11xx.c ****   while (!(LPC_SYSCON->SYSPLLSTAT & 0x01));	      /* Wait Until PLL Locked    */
 556              		.loc 2 321 0
 557 0092 C046     		nop
 558              	.L50:
 559              		.loc 2 321 0 is_stmt 0 discriminator 1
 560 0094 184B     		ldr	r3, .L52+4
 561 0096 DB68     		ldr	r3, [r3, #12]
 562 0098 0122     		movs	r2, #1
 563 009a 1340     		ands	r3, r2
 564 009c FAD0     		beq	.L50
 322:../cmsis/system_LPC11xx.c **** #endif
 323:../cmsis/system_LPC11xx.c **** #endif
 324:../cmsis/system_LPC11xx.c **** #if (WDTOSC_SETUP)                                /* Watchdog Oscillator Setup*/
 325:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->WDTOSCCTRL    = WDTOSCCTRL_Val;
 326:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->PDRUNCFG     &= ~(1 << 6);          /* Power-up WDT Clock       */
 327:../cmsis/system_LPC11xx.c **** #endif
 328:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->MAINCLKSEL    = MAINCLKSEL_Val;     /* Select PLL Clock Output  */
 565              		.loc 2 328 0 is_stmt 1
 566 009e 164B     		ldr	r3, .L52+4
 567 00a0 0322     		movs	r2, #3
 568 00a2 1A67     		str	r2, [r3, #112]
 329:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->MAINCLKUEN    = 0x01;               /* Update MCLK Clock Source */
 569              		.loc 2 329 0
 570 00a4 144B     		ldr	r3, .L52+4
 571 00a6 0122     		movs	r2, #1
 572 00a8 5A67     		str	r2, [r3, #116]
 330:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->MAINCLKUEN    = 0x00;               /* Toggle Update Register   */
 573              		.loc 2 330 0
 574 00aa 134B     		ldr	r3, .L52+4
 575 00ac 0022     		movs	r2, #0
 576 00ae 5A67     		str	r2, [r3, #116]
 331:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->MAINCLKUEN    = 0x01;
 577              		.loc 2 331 0
 578 00b0 114B     		ldr	r3, .L52+4
 579 00b2 0122     		movs	r2, #1
 580 00b4 5A67     		str	r2, [r3, #116]
 332:../cmsis/system_LPC11xx.c ****   while (!(LPC_SYSCON->MAINCLKUEN & 0x01));       /* Wait Until Updated       */
 581              		.loc 2 332 0
 582 00b6 C046     		nop
 583              	.L51:
 584              		.loc 2 332 0 is_stmt 0 discriminator 1
 585 00b8 0F4B     		ldr	r3, .L52+4
 586 00ba 5B6F     		ldr	r3, [r3, #116]
 587 00bc 0122     		movs	r2, #1
 588 00be 1340     		ands	r3, r2
 589 00c0 FAD0     		beq	.L51
 333:../cmsis/system_LPC11xx.c **** #endif
 334:../cmsis/system_LPC11xx.c **** 
 335:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSAHBCLKDIV  = SYSAHBCLKDIV_Val;
 590              		.loc 2 335 0 is_stmt 1
 591 00c2 0D4B     		ldr	r3, .L52+4
 592 00c4 0122     		movs	r2, #1
 593 00c6 9A67     		str	r2, [r3, #120]
 336:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSAHBCLKCTRL = AHBCLKCTRL_Val;
 594              		.loc 2 336 0
 595 00c8 0B4A     		ldr	r2, .L52+4
 596 00ca 8023     		movs	r3, #128
 597 00cc 0B49     		ldr	r1, .L52+8
 598 00ce D150     		str	r1, [r2, r3]
 337:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SSP0CLKDIV    = SSP0CLKDIV_Val;
 599              		.loc 2 337 0
 600 00d0 094A     		ldr	r2, .L52+4
 601 00d2 9423     		movs	r3, #148
 602 00d4 0121     		movs	r1, #1
 603 00d6 D150     		str	r1, [r2, r3]
 338:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->UARTCLKDIV    = UARTCLKDIV_Val;
 604              		.loc 2 338 0
 605 00d8 074A     		ldr	r2, .L52+4
 606 00da 9823     		movs	r3, #152
 607 00dc 0121     		movs	r1, #1
 608 00de D150     		str	r1, [r2, r3]
 339:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SSP1CLKDIV    = SSP1CLKDIV_Val;
 609              		.loc 2 339 0
 610 00e0 054A     		ldr	r2, .L52+4
 611 00e2 9C23     		movs	r3, #156
 612 00e4 0121     		movs	r1, #1
 613 00e6 D150     		str	r1, [r2, r3]
 340:../cmsis/system_LPC11xx.c **** #endif
 341:../cmsis/system_LPC11xx.c **** 
 342:../cmsis/system_LPC11xx.c **** 
 343:../cmsis/system_LPC11xx.c **** #if (MEMMAP_SETUP || MEMMAP_INIT)       /* Memory Mapping Setup               */
 344:../cmsis/system_LPC11xx.c ****   LPC_SYSCON->SYSMEMREMAP = SYSMEMREMAP_Val;
 345:../cmsis/system_LPC11xx.c **** #endif
 346:../cmsis/system_LPC11xx.c ****   SystemCoreClockUpdate();
 614              		.loc 2 346 0
 615 00e8 FFF7FEFF 		bl	SystemCoreClockUpdate
 347:../cmsis/system_LPC11xx.c **** }
 616              		.loc 2 347 0
 617 00ec C046     		nop
 618 00ee BD46     		mov	sp, r7
 619 00f0 02B0     		add	sp, sp, #8
 620              		@ sp needed
 621 00f2 80BD     		pop	{r7, pc}
 622              	.L53:
 623              		.align	2
 624              	.L52:
 625 00f4 00000000 		.word	g_pfnVectors
 626 00f8 00800440 		.word	1074036736
 627 00fc 5F000100 		.word	65631
 628              		.cfi_endproc
 629              	.LFE21:
 631              		.text
 632              	.Letext0:
 633              		.file 3 "../cmsis/LPC11xx.h"
 634              		.file 4 "/usr/local/lpcxpresso_8.2.2_650/lpcxpresso/tools/redlib/include/stdint.h"
DEFINED SYMBOLS
                            *ABS*:00000000 system_LPC11xx.c
     /tmp/ccEz2FGo.s:20     .text.__NOP:00000000 $t
     /tmp/ccEz2FGo.s:24     .text.__NOP:00000000 __NOP
     /tmp/ccEz2FGo.s:56     .data:00000000 SystemCoreClock
     /tmp/ccEz2FGo.s:53     .data:00000000 $d
     /tmp/ccEz2FGo.s:60     .text.SystemCoreClockUpdate:00000000 $t
     /tmp/ccEz2FGo.s:65     .text.SystemCoreClockUpdate:00000000 SystemCoreClockUpdate
     /tmp/ccEz2FGo.s:98     .rodata:00000000 $d
     /tmp/ccEz2FGo.s:424    .text.SystemCoreClockUpdate:000001d0 $d
     /tmp/ccEz2FGo.s:448    .text.SystemInit:00000000 $t
     /tmp/ccEz2FGo.s:453    .text.SystemInit:00000000 SystemInit
     /tmp/ccEz2FGo.s:625    .text.SystemInit:000000f4 $d
                     .debug_frame:00000010 $d
                           .group:00000000 wm4.0.935e200dcf4f236f804f4066baa4d700
                           .group:00000000 wm4.redlib_version.h.14.62abddb5b4efb2dd619a7dca5647eb78
                           .group:00000000 wm4.libconfigarm.h.18.48d18a57a6aa6fedadbcea02294a713f
                           .group:00000000 wm4.stdint.h.30.30f575a65a9bde434c705acf40986e1b
                           .group:00000000 wm4.LPC11xx.h.22.18118eb75d0712ca7ff4a68c2fe5f6ea
                           .group:00000000 wm4.core_cm0.h.27.2db28520dd3f2d80cee6297bdccc6281
                           .group:00000000 wm4.system_LPC11xx.h.29.5024c6a4c85b3276f8cc51914c1388c0
                           .group:00000000 wm4.LPC11xx.h.506.5b3ceafec87e73a002e73580a1f7418e

UNDEFINED SYMBOLS
__aeabi_uidiv
g_pfnVectors
