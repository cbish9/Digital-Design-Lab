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
  15              		.file	"timer32.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.section	.text.NVIC_EnableIRQ,"ax",%progbits
  20              		.align	2
  21              		.code	16
  22              		.thumb_func
  24              	NVIC_EnableIRQ:
  25              	.LFB11:
  26              		.file 1 "/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h"
   1:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**************************************************************************//**
   2:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * $Id:: core_cm0.h 4785 2010-09-03 22:39:27Z nxp21346                    $
   3:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
   4:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @file     core_cm0.h
   5:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief    CMSIS Cortex-M0 Core Peripheral Access Layer Header File
   6:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @version  V1.30
   7:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @date     30. October 2009
   8:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
   9:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @note
  10:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Copyright (C) 2009 ARM Limited. All rights reserved.
  11:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
  12:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @par
  13:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * ARM Limited (ARM) is supplying this software for use with Cortex-M 
  14:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * processor based microcontrollers.  This file can be freely distributed 
  15:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * within development tools that are supporting such ARM based processors. 
  16:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
  17:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @par
  18:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
  19:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
  20:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
  21:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
  22:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
  23:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
  24:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  ******************************************************************************/
  25:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  26:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #ifndef __CM0_CORE_H__
  27:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __CM0_CORE_H__
  28:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  29:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_core_LintCinfiguration CMSIS CM0 Core Lint Configuration
  30:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
  31:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * List of Lint messages which will be suppressed and not shown:
  32:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *   - not yet checked
  33:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * .
  34:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Note:  To re-enable a Message, insert a space before 'lint' *
  35:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
  36:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
  37:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  38:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  39:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_core_definitions CM0 Core Definitions
  40:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   This file defines all structures and symbols for CMSIS core:
  41:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****     - CMSIS version number
  42:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****     - Cortex-M core registers and bitfields
  43:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****     - Cortex-M core peripheral base address
  44:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   @{
  45:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
  46:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  47:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #ifdef __cplusplus
  48:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  extern "C" {
  49:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #endif 
  50:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  51:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __CM0_CMSIS_VERSION_MAIN  (0x01)                                                       /*!<
  52:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __CM0_CMSIS_VERSION_SUB   (0x30)                                                       /*!<
  53:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __CM0_CMSIS_VERSION       ((__CM0_CMSIS_VERSION_MAIN << 16) | __CM0_CMSIS_VERSION_SUB) /*!<
  54:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  55:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __CORTEX_M                (0x00)                                                       /*!<
  56:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  57:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #include <stdint.h>                           /* Include standard types */
  58:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  59:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #if defined (__ICCARM__)
  60:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #include <intrinsics.h>                     /* IAR Intrinsics   */
  61:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #endif
  62:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  63:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  64:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #ifndef __NVIC_PRIO_BITS
  65:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define __NVIC_PRIO_BITS    2               /*!< standard definition for NVIC Priority Bits */
  66:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #endif
  67:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  68:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  69:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  70:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  71:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
  72:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * IO definitions
  73:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
  74:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * define access restrictions to peripheral registers
  75:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
  76:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  77:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #ifdef __cplusplus
  78:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define     __I     volatile                /*!< defines 'read only' permissions      */
  79:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #else
  80:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define     __I     volatile const          /*!< defines 'read only' permissions      */
  81:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #endif
  82:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define     __O     volatile                  /*!< defines 'write only' permissions     */
  83:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define     __IO    volatile                  /*!< defines 'read / write' permissions   */
  84:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  85:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  86:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  87:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /*******************************************************************************
  88:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *                 Register Abstraction
  89:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  ******************************************************************************/
  90:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_core_register CMSIS CM0 Core Register
  91:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  @{
  92:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** */
  93:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  94:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
  95:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_NVIC CMSIS CM0 NVIC
  96:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   memory mapped structure for Nested Vectored Interrupt Controller (NVIC)
  97:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   @{
  98:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
  99:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** typedef struct
 100:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** {
 101:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t ISER[1];                      /*!< (Offset: 0x000) Interrupt Set Enable Register   
 102:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****        uint32_t RESERVED0[31];
 103:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t ICER[1];                      /*!< (Offset: 0x080) Interrupt Clear Enable Register 
 104:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****        uint32_t RSERVED1[31];
 105:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t ISPR[1];                      /*!< (Offset: 0x100) Interrupt Set Pending Register  
 106:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****        uint32_t RESERVED2[31];
 107:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t ICPR[1];                      /*!< (Offset: 0x180) Interrupt Clear Pending Register
 108:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****        uint32_t RESERVED3[31];
 109:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****        uint32_t RESERVED4[64];
 110:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t IPR[8];                       /*!< (Offset: 0x3EC) Interrupt Priority Register     
 111:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** }  NVIC_Type;
 112:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_NVIC */
 113:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 114:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 115:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_SCB CMSIS CM0 SCB
 116:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   memory mapped structure for System Control Block (SCB)
 117:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   @{
 118:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 119:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** typedef struct
 120:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** {
 121:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __I  uint32_t CPUID;                        /*!< Offset: 0x00  CPU ID Base Register              
 122:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t ICSR;                         /*!< Offset: 0x04  Interrupt Control State Register  
 123:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****        uint32_t RESERVED0;                                      
 124:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t AIRCR;                        /*!< Offset: 0x0C  Application Interrupt / Reset Cont
 125:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t SCR;                          /*!< Offset: 0x10  System Control Register           
 126:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t CCR;                          /*!< Offset: 0x14  Configuration Control Register    
 127:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****        uint32_t RESERVED1;                                      
 128:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t SHP[2];                       /*!< Offset: 0x1C  System Handlers Priority Registers
 129:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t SHCSR;                        /*!< Offset: 0x24  System Handler Control and State R
 130:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****        uint32_t RESERVED2[2];                                   
 131:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t DFSR;                         /*!< Offset: 0x30  Debug Fault Status Register       
 132:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** } SCB_Type;                                                
 133:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 134:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SCB CPUID Register Definitions */
 135:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_IMPLEMENTER_Pos          24                                             /*!< SCB 
 136:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_IMPLEMENTER_Msk          (0xFFul << SCB_CPUID_IMPLEMENTER_Pos)          /*!< SCB 
 137:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 138:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_VARIANT_Pos              20                                             /*!< SCB 
 139:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_VARIANT_Msk              (0xFul << SCB_CPUID_VARIANT_Pos)               /*!< SCB 
 140:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 141:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_ARCHITECTURE_Pos         16                                             /*!< SCB 
 142:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_ARCHITECTURE_Msk         (0xFul << SCB_CPUID_ARCHITECTURE_Pos)          /*!< SCB 
 143:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 144:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_PARTNO_Pos                4                                             /*!< SCB 
 145:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_PARTNO_Msk               (0xFFFul << SCB_CPUID_PARTNO_Pos)              /*!< SCB 
 146:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 147:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_REVISION_Pos              0                                             /*!< SCB 
 148:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CPUID_REVISION_Msk             (0xFul << SCB_CPUID_REVISION_Pos)              /*!< SCB 
 149:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 150:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SCB Interrupt Control State Register Definitions */
 151:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_NMIPENDSET_Pos            31                                             /*!< SCB 
 152:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_NMIPENDSET_Msk            (1ul << SCB_ICSR_NMIPENDSET_Pos)               /*!< SCB 
 153:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 154:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_PENDSVSET_Pos             28                                             /*!< SCB 
 155:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_PENDSVSET_Msk             (1ul << SCB_ICSR_PENDSVSET_Pos)                /*!< SCB 
 156:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 157:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_PENDSVCLR_Pos             27                                             /*!< SCB 
 158:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_PENDSVCLR_Msk             (1ul << SCB_ICSR_PENDSVCLR_Pos)                /*!< SCB 
 159:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 160:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_PENDSTSET_Pos             26                                             /*!< SCB 
 161:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_PENDSTSET_Msk             (1ul << SCB_ICSR_PENDSTSET_Pos)                /*!< SCB 
 162:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 163:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_PENDSTCLR_Pos             25                                             /*!< SCB 
 164:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_PENDSTCLR_Msk             (1ul << SCB_ICSR_PENDSTCLR_Pos)                /*!< SCB 
 165:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 166:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_ISRPREEMPT_Pos            23                                             /*!< SCB 
 167:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_ISRPREEMPT_Msk            (1ul << SCB_ICSR_ISRPREEMPT_Pos)               /*!< SCB 
 168:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 169:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_ISRPENDING_Pos            22                                             /*!< SCB 
 170:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_ISRPENDING_Msk            (1ul << SCB_ICSR_ISRPENDING_Pos)               /*!< SCB 
 171:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 172:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_VECTPENDING_Pos           12                                             /*!< SCB 
 173:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_VECTPENDING_Msk           (0x1FFul << SCB_ICSR_VECTPENDING_Pos)          /*!< SCB 
 174:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 175:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_VECTACTIVE_Pos             0                                             /*!< SCB 
 176:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_ICSR_VECTACTIVE_Msk            (0x1FFul << SCB_ICSR_VECTACTIVE_Pos)           /*!< SCB 
 177:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 178:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SCB Application Interrupt and Reset Control Register Definitions */
 179:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_VECTKEY_Pos              16                                             /*!< SCB 
 180:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_VECTKEY_Msk              (0xFFFFul << SCB_AIRCR_VECTKEY_Pos)            /*!< SCB 
 181:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 182:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_VECTKEYSTAT_Pos          16                                             /*!< SCB 
 183:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_VECTKEYSTAT_Msk          (0xFFFFul << SCB_AIRCR_VECTKEYSTAT_Pos)        /*!< SCB 
 184:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 185:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_ENDIANESS_Pos            15                                             /*!< SCB 
 186:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_ENDIANESS_Msk            (1ul << SCB_AIRCR_ENDIANESS_Pos)               /*!< SCB 
 187:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 188:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_SYSRESETREQ_Pos           2                                             /*!< SCB 
 189:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_SYSRESETREQ_Msk          (1ul << SCB_AIRCR_SYSRESETREQ_Pos)             /*!< SCB 
 190:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 191:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_VECTCLRACTIVE_Pos         1                                             /*!< SCB 
 192:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_AIRCR_VECTCLRACTIVE_Msk        (1ul << SCB_AIRCR_VECTCLRACTIVE_Pos)           /*!< SCB 
 193:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 194:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SCB System Control Register Definitions */
 195:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_SCR_SEVONPEND_Pos               4                                             /*!< SCB 
 196:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_SCR_SEVONPEND_Msk              (1ul << SCB_SCR_SEVONPEND_Pos)                 /*!< SCB 
 197:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 198:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_SCR_SLEEPDEEP_Pos               2                                             /*!< SCB 
 199:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_SCR_SLEEPDEEP_Msk              (1ul << SCB_SCR_SLEEPDEEP_Pos)                 /*!< SCB 
 200:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 201:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_SCR_SLEEPONEXIT_Pos             1                                             /*!< SCB 
 202:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_SCR_SLEEPONEXIT_Msk            (1ul << SCB_SCR_SLEEPONEXIT_Pos)               /*!< SCB 
 203:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 204:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SCB Configuration Control Register Definitions */
 205:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CCR_STKALIGN_Pos                9                                             /*!< SCB 
 206:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CCR_STKALIGN_Msk               (1ul << SCB_CCR_STKALIGN_Pos)                  /*!< SCB 
 207:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 208:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CCR_UNALIGN_TRP_Pos             3                                             /*!< SCB 
 209:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_CCR_UNALIGN_TRP_Msk            (1ul << SCB_CCR_UNALIGN_TRP_Pos)               /*!< SCB 
 210:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 211:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SCB System Handler Control and State Register Definitions */
 212:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_SHCSR_SVCALLPENDED_Pos         15                                             /*!< SCB 
 213:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_SHCSR_SVCALLPENDED_Msk         (1ul << SCB_SHCSR_SVCALLPENDED_Pos)            /*!< SCB 
 214:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 215:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SCB Debug Fault Status Register Definitions */
 216:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_EXTERNAL_Pos               4                                             /*!< SCB 
 217:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_EXTERNAL_Msk              (1ul << SCB_DFSR_EXTERNAL_Pos)                 /*!< SCB 
 218:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 219:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_VCATCH_Pos                 3                                             /*!< SCB 
 220:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_VCATCH_Msk                (1ul << SCB_DFSR_VCATCH_Pos)                   /*!< SCB 
 221:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 222:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_DWTTRAP_Pos                2                                             /*!< SCB 
 223:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_DWTTRAP_Msk               (1ul << SCB_DFSR_DWTTRAP_Pos)                  /*!< SCB 
 224:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 225:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_BKPT_Pos                   1                                             /*!< SCB 
 226:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_BKPT_Msk                  (1ul << SCB_DFSR_BKPT_Pos)                     /*!< SCB 
 227:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 228:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_HALTED_Pos                 0                                             /*!< SCB 
 229:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_DFSR_HALTED_Msk                (1ul << SCB_DFSR_HALTED_Pos)                   /*!< SCB 
 230:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_SCB */
 231:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 232:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 233:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_SysTick CMSIS CM0 SysTick
 234:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   memory mapped structure for SysTick
 235:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   @{
 236:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 237:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** typedef struct
 238:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** {
 239:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t CTRL;                         /*!< Offset: 0x00  SysTick Control and Status Registe
 240:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t LOAD;                         /*!< Offset: 0x04  SysTick Reload Value Register     
 241:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t VAL;                          /*!< Offset: 0x08  SysTick Current Value Register    
 242:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __I  uint32_t CALIB;                        /*!< Offset: 0x0C  SysTick Calibration Register      
 243:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** } SysTick_Type;
 244:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 245:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SysTick Control / Status Register Definitions */
 246:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CTRL_COUNTFLAG_Pos         16                                             /*!< SysT
 247:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CTRL_COUNTFLAG_Msk         (1ul << SysTick_CTRL_COUNTFLAG_Pos)            /*!< SysT
 248:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 249:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CTRL_CLKSOURCE_Pos          2                                             /*!< SysT
 250:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CTRL_CLKSOURCE_Msk         (1ul << SysTick_CTRL_CLKSOURCE_Pos)            /*!< SysT
 251:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 252:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CTRL_TICKINT_Pos            1                                             /*!< SysT
 253:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CTRL_TICKINT_Msk           (1ul << SysTick_CTRL_TICKINT_Pos)              /*!< SysT
 254:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 255:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CTRL_ENABLE_Pos             0                                             /*!< SysT
 256:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CTRL_ENABLE_Msk            (1ul << SysTick_CTRL_ENABLE_Pos)               /*!< SysT
 257:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 258:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SysTick Reload Register Definitions */
 259:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_LOAD_RELOAD_Pos             0                                             /*!< SysT
 260:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_LOAD_RELOAD_Msk            (0xFFFFFFul << SysTick_LOAD_RELOAD_Pos)        /*!< SysT
 261:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 262:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SysTick Current Register Definitions */
 263:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_VAL_CURRENT_Pos             0                                             /*!< SysT
 264:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_VAL_CURRENT_Msk            (0xFFFFFFul << SysTick_VAL_CURRENT_Pos)        /*!< SysT
 265:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 266:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* SysTick Calibration Register Definitions */
 267:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CALIB_NOREF_Pos            31                                             /*!< SysT
 268:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CALIB_NOREF_Msk            (1ul << SysTick_CALIB_NOREF_Pos)               /*!< SysT
 269:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 270:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CALIB_SKEW_Pos             30                                             /*!< SysT
 271:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CALIB_SKEW_Msk             (1ul << SysTick_CALIB_SKEW_Pos)                /*!< SysT
 272:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 273:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CALIB_TENMS_Pos             0                                             /*!< SysT
 274:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_CALIB_TENMS_Msk            (0xFFFFFFul << SysTick_VAL_CURRENT_Pos)        /*!< SysT
 275:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_SysTick */
 276:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 277:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 278:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_CoreDebug CMSIS CM0 Core Debug
 279:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   memory mapped structure for Core Debug Register
 280:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   @{
 281:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 282:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** typedef struct
 283:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** {
 284:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t DHCSR;                        /*!< Offset: 0x00  Debug Halting Control and Status R
 285:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __O  uint32_t DCRSR;                        /*!< Offset: 0x04  Debug Core Register Selector Regis
 286:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t DCRDR;                        /*!< Offset: 0x08  Debug Core Register Data Register 
 287:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __IO uint32_t DEMCR;                        /*!< Offset: 0x0C  Debug Exception and Monitor Contro
 288:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** } CoreDebug_Type;
 289:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 290:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* Debug Halting Control and Status Register */
 291:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_DBGKEY_Pos         16                                             /*!< Core
 292:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_DBGKEY_Msk         (0xFFFFul << CoreDebug_DHCSR_DBGKEY_Pos)       /*!< Core
 293:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 294:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_RESET_ST_Pos     25                                             /*!< Core
 295:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_RESET_ST_Msk     (1ul << CoreDebug_DHCSR_S_RESET_ST_Pos)        /*!< Core
 296:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 297:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_RETIRE_ST_Pos    24                                             /*!< Core
 298:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_RETIRE_ST_Msk    (1ul << CoreDebug_DHCSR_S_RETIRE_ST_Pos)       /*!< Core
 299:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 300:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_LOCKUP_Pos       19                                             /*!< Core
 301:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_LOCKUP_Msk       (1ul << CoreDebug_DHCSR_S_LOCKUP_Pos)          /*!< Core
 302:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 303:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_SLEEP_Pos        18                                             /*!< Core
 304:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_SLEEP_Msk        (1ul << CoreDebug_DHCSR_S_SLEEP_Pos)           /*!< Core
 305:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 306:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_HALT_Pos         17                                             /*!< Core
 307:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_HALT_Msk         (1ul << CoreDebug_DHCSR_S_HALT_Pos)            /*!< Core
 308:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 309:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_REGRDY_Pos       16                                             /*!< Core
 310:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_S_REGRDY_Msk       (1ul << CoreDebug_DHCSR_S_REGRDY_Pos)          /*!< Core
 311:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 312:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_MASKINTS_Pos      3                                             /*!< Core
 313:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_MASKINTS_Msk     (1ul << CoreDebug_DHCSR_C_MASKINTS_Pos)        /*!< Core
 314:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 315:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_STEP_Pos          2                                             /*!< Core
 316:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_STEP_Msk         (1ul << CoreDebug_DHCSR_C_STEP_Pos)            /*!< Core
 317:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 318:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_HALT_Pos          1                                             /*!< Core
 319:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_HALT_Msk         (1ul << CoreDebug_DHCSR_C_HALT_Pos)            /*!< Core
 320:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 321:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_DEBUGEN_Pos       0                                             /*!< Core
 322:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DHCSR_C_DEBUGEN_Msk      (1ul << CoreDebug_DHCSR_C_DEBUGEN_Pos)         /*!< Core
 323:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 324:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* Debug Core Register Selector Register */
 325:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DCRSR_REGWnR_Pos         16                                             /*!< Core
 326:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DCRSR_REGWnR_Msk         (1ul << CoreDebug_DCRSR_REGWnR_Pos)            /*!< Core
 327:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 328:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DCRSR_REGSEL_Pos          0                                             /*!< Core
 329:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DCRSR_REGSEL_Msk         (0x1Ful << CoreDebug_DCRSR_REGSEL_Pos)         /*!< Core
 330:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 331:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* Debug Exception and Monitor Control Register */
 332:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DEMCR_DWTENA_Pos         24                                             /*!< Core
 333:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DEMCR_DWTENA_Msk         (1ul << CoreDebug_DEMCR_DWTENA_Pos)            /*!< Core
 334:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 335:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DEMCR_VC_HARDERR_Pos     10                                             /*!< Core
 336:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DEMCR_VC_HARDERR_Msk     (1ul << CoreDebug_DEMCR_VC_HARDERR_Pos)        /*!< Core
 337:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 338:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DEMCR_VC_CORERESET_Pos    0                                             /*!< Core
 339:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_DEMCR_VC_CORERESET_Msk   (1ul << CoreDebug_DEMCR_VC_CORERESET_Pos)      /*!< Core
 340:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_CoreDebug */
 341:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 342:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 343:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* Memory mapping of Cortex-M0 Hardware */
 344:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCS_BASE            (0xE000E000)                              /*!< System Control Space Bas
 345:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug_BASE      (0xE000EDF0)                              /*!< Core Debug Base Address 
 346:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick_BASE        (SCS_BASE +  0x0010)                      /*!< SysTick Base Address    
 347:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define NVIC_BASE           (SCS_BASE +  0x0100)                      /*!< NVIC Base Address       
 348:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB_BASE            (SCS_BASE +  0x0D00)                      /*!< System Control Block Bas
 349:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 350:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SCB                 ((SCB_Type *)           SCB_BASE)         /*!< SCB configuration struct
 351:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define SysTick             ((SysTick_Type *)       SysTick_BASE)     /*!< SysTick configuration st
 352:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define NVIC                ((NVIC_Type *)          NVIC_BASE)        /*!< NVIC configuration struc
 353:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define CoreDebug           ((CoreDebug_Type *)     CoreDebug_BASE)   /*!< Core Debug configuration
 354:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 355:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /*@}*/ /* end of group CMSIS_CM0_core_register */
 356:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 357:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 358:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /*******************************************************************************
 359:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *                Hardware Abstraction Layer
 360:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  ******************************************************************************/
 361:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 362:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #if defined ( __CC_ARM   )
 363:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define __ASM            __asm                                      /*!< asm keyword for ARM Comp
 364:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define __INLINE         __inline                                   /*!< inline keyword for ARM C
 365:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 366:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #elif defined ( __ICCARM__ )
 367:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define __ASM           __asm                                       /*!< asm keyword for IAR Comp
 368:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define __INLINE        inline                                      /*!< inline keyword for IAR C
 369:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 370:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #elif defined   (  __GNUC__  )
 371:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define __ASM            __asm                                      /*!< asm keyword for GNU Comp
 372:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define __INLINE         inline                                     /*!< inline keyword for GNU C
 373:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 374:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #elif defined   (  __TASKING__  )
 375:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define __ASM            __asm                                      /*!< asm keyword for TASKING 
 376:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   #define __INLINE         inline                                     /*!< inline keyword for TASKI
 377:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 378:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #endif
 379:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 380:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 381:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* ###################  Compiler specific Intrinsics  ########################### */
 382:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 383:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #if defined ( __CC_ARM   ) /*------------------RealView Compiler -----------------*/
 384:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* ARM armcc specific functions */
 385:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 386:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __enable_fault_irq                __enable_fiq
 387:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __disable_fault_irq               __disable_fiq
 388:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 389:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __NOP                             __nop
 390:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __WFI                             __wfi
 391:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __WFE                             __wfe
 392:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __SEV                             __sev
 393:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __ISB()                           __isb(0)
 394:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __DSB()                           __dsb(0)
 395:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __DMB()                           __dmb(0)
 396:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __REV                             __rev
 397:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 398:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 399:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* intrinsic void __enable_irq();     */
 400:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* intrinsic void __disable_irq();    */
 401:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 402:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 403:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 404:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Process Stack Pointer
 405:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 406:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return ProcessStackPointer
 407:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 408:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return the actual process stack pointer
 409:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 410:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __get_PSP(void);
 411:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 412:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 413:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Process Stack Pointer
 414:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 415:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  topOfProcStack  Process Stack Pointer
 416:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 417:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Assign the value ProcessStackPointer to the MSP 
 418:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * (process stack pointer) Cortex processor register
 419:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 420:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_PSP(uint32_t topOfProcStack);
 421:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 422:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 423:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Main Stack Pointer
 424:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 425:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return Main Stack Pointer
 426:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 427:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return the current value of the MSP (main stack pointer)
 428:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Cortex processor register
 429:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 430:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __get_MSP(void);
 431:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 432:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 433:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Main Stack Pointer
 434:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 435:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  topOfMainStack  Main Stack Pointer
 436:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 437:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Assign the value mainStackPointer to the MSP 
 438:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * (main stack pointer) Cortex processor register
 439:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 440:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_MSP(uint32_t topOfMainStack);
 441:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 442:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 443:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Reverse byte order in unsigned short value
 444:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 445:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param   value  value to reverse
 446:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return         reversed value
 447:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 448:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Reverse byte order in unsigned short value
 449:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 450:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __REV16(uint16_t value);
 451:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 452:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 453:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Reverse byte order in signed short value with sign extension to integer
 454:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 455:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param   value  value to reverse
 456:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return         reversed value
 457:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 458:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Reverse byte order in signed short value with sign extension to integer
 459:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 460:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern int32_t __REVSH(int16_t value);
 461:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 462:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 463:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #if (__ARMCC_VERSION < 400000)
 464:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 465:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 466:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Priority Mask value
 467:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 468:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return PriMask
 469:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 470:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return state of the priority mask bit from the priority mask register
 471:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 472:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __get_PRIMASK(void);
 473:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 474:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 475:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Priority Mask value
 476:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 477:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param   priMask  PriMask
 478:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 479:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Set the priority mask bit in the priority mask register
 480:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 481:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_PRIMASK(uint32_t priMask);
 482:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 483:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 484:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Control Register value
 485:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * 
 486:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return Control value
 487:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 488:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return the content of the control register
 489:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 490:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __get_CONTROL(void);
 491:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 492:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 493:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Control Register value
 494:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 495:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  control  Control value
 496:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 497:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Set the control register
 498:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 499:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_CONTROL(uint32_t control);
 500:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 501:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #else  /* (__ARMCC_VERSION >= 400000)  */
 502:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 503:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 504:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 505:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Priority Mask value
 506:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 507:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return PriMask
 508:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 509:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return state of the priority mask bit from the priority mask register
 510:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 511:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE uint32_t __get_PRIMASK(void)
 512:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** {
 513:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   register uint32_t __regPriMask         __ASM("primask");
 514:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   return(__regPriMask);
 515:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** }
 516:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 517:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 518:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Priority Mask value
 519:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 520:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  priMask  PriMask
 521:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 522:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Set the priority mask bit in the priority mask register
 523:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 524:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __set_PRIMASK(uint32_t priMask)
 525:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** {
 526:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   register uint32_t __regPriMask         __ASM("primask");
 527:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __regPriMask = (priMask);
 528:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** }
 529:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 530:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 531:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Control Register value
 532:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * 
 533:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return Control value
 534:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 535:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return the content of the control register
 536:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 537:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE uint32_t __get_CONTROL(void)
 538:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** {
 539:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   register uint32_t __regControl         __ASM("control");
 540:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   return(__regControl);
 541:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** }
 542:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 543:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 544:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Control Register value
 545:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 546:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  control  Control value
 547:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 548:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Set the control register
 549:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 550:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __set_CONTROL(uint32_t control)
 551:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** {
 552:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   register uint32_t __regControl         __ASM("control");
 553:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   __regControl = control;
 554:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** }
 555:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 556:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #endif /* __ARMCC_VERSION  */ 
 557:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 558:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 559:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 560:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #elif (defined (__ICCARM__)) /*------------------ ICC Compiler -------------------*/
 561:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* IAR iccarm specific functions */
 562:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 563:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __enable_irq                              __enable_interrupt        /*!< global Interrupt e
 564:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __disable_irq                             __disable_interrupt       /*!< global Interrupt d
 565:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 566:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __enable_fault_irq()         { __ASM ("cpsie f"); }
 567:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __disable_fault_irq()        { __ASM ("cpsid f"); }
 568:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 569:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define __NOP                                     __no_operation            /*!< no operation intri
 570:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE  void __WFI()                     { __ASM ("wfi"); }
 571:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE  void __WFE()                     { __ASM ("wfe"); }
 572:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE  void __SEV()                     { __ASM ("sev"); }
 573:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 574:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* intrinsic void __ISB(void)                                     */
 575:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* intrinsic void __DSB(void)                                     */
 576:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* intrinsic void __DMB(void)                                     */
 577:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* intrinsic void __set_PRIMASK();                                */
 578:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* intrinsic void __get_PRIMASK();                                */
 579:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 580:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 581:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* intrinsic uint32_t __REV(uint32_t value);                      */
 582:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* intrinsic uint32_t __REVSH(uint32_t value);                    */
 583:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 584:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 585:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 586:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Process Stack Pointer
 587:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 588:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return ProcessStackPointer
 589:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 590:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return the actual process stack pointer
 591:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 592:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __get_PSP(void);
 593:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 594:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 595:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Process Stack Pointer
 596:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 597:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  topOfProcStack  Process Stack Pointer
 598:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 599:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Assign the value ProcessStackPointer to the MSP 
 600:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * (process stack pointer) Cortex processor register
 601:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 602:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_PSP(uint32_t topOfProcStack);
 603:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 604:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 605:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Main Stack Pointer
 606:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 607:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return Main Stack Pointer
 608:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 609:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return the current value of the MSP (main stack pointer)
 610:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Cortex processor register
 611:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 612:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __get_MSP(void);
 613:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 614:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 615:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Main Stack Pointer
 616:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 617:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  topOfMainStack  Main Stack Pointer
 618:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 619:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Assign the value mainStackPointer to the MSP 
 620:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * (main stack pointer) Cortex processor register
 621:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 622:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_MSP(uint32_t topOfMainStack);
 623:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 624:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 625:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Reverse byte order in unsigned short value
 626:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 627:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  value  value to reverse
 628:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return        reversed value
 629:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 630:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Reverse byte order in unsigned short value
 631:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 632:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __REV16(uint16_t value);
 633:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 634:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 635:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 636:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 637:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 638:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #elif (defined (__GNUC__)) /*------------------ GNU Compiler ---------------------*/
 639:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* GNU gcc specific functions */
 640:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 641:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __enable_irq()               { __ASM volatile ("cpsie i"); }
 642:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __disable_irq()              { __ASM volatile ("cpsid i"); }
 643:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 644:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __enable_fault_irq()         { __ASM volatile ("cpsie f"); }
 645:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __disable_fault_irq()        { __ASM volatile ("cpsid f"); }
 646:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 647:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __NOP()                      { __ASM volatile ("nop"); }
 648:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __WFI()                      { __ASM volatile ("wfi"); }
 649:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __WFE()                      { __ASM volatile ("wfe"); }
 650:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __SEV()                      { __ASM volatile ("sev"); }
 651:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __ISB()                      { __ASM volatile ("isb"); }
 652:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __DSB()                      { __ASM volatile ("dsb"); }
 653:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void __DMB()                      { __ASM volatile ("dmb"); }
 654:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 655:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 656:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 657:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Process Stack Pointer
 658:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 659:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return ProcessStackPointer
 660:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 661:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return the actual process stack pointer
 662:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 663:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __get_PSP(void);
 664:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 665:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 666:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Process Stack Pointer
 667:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 668:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  topOfProcStack  Process Stack Pointer
 669:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 670:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Assign the value ProcessStackPointer to the MSP 
 671:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * (process stack pointer) Cortex processor register
 672:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 673:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_PSP(uint32_t topOfProcStack);
 674:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 675:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 676:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Main Stack Pointer
 677:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 678:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return Main Stack Pointer
 679:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 680:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return the current value of the MSP (main stack pointer)
 681:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Cortex processor register
 682:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 683:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __get_MSP(void);
 684:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 685:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 686:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Main Stack Pointer
 687:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 688:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  topOfMainStack  Main Stack Pointer
 689:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 690:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Assign the value mainStackPointer to the MSP 
 691:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * (main stack pointer) Cortex processor register
 692:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 693:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_MSP(uint32_t topOfMainStack);
 694:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 695:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 696:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Priority Mask value
 697:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 698:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return PriMask
 699:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 700:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return state of the priority mask bit from the priority mask register
 701:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 702:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t  __get_PRIMASK(void);
 703:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 704:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 705:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Priority Mask value
 706:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 707:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  priMask  PriMask
 708:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 709:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Set the priority mask bit in the priority mask register
 710:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 711:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_PRIMASK(uint32_t priMask);
 712:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 713:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 714:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Return the Control Register value
 715:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** * 
 716:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** *  @return Control value
 717:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 718:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Return the content of the control register
 719:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 720:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __get_CONTROL(void);
 721:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 722:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 723:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Set the Control Register value
 724:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 725:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  control  Control value
 726:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 727:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Set the control register
 728:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 729:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern void __set_CONTROL(uint32_t control);
 730:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 731:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 732:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Reverse byte order in integer value
 733:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 734:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  value  value to reverse
 735:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return        reversed value
 736:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 737:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Reverse byte order in integer value
 738:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 739:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __REV(uint32_t value);
 740:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 741:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 742:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Reverse byte order in unsigned short value
 743:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 744:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  value  value to reverse
 745:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return        reversed value
 746:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 747:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Reverse byte order in unsigned short value
 748:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 749:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern uint32_t __REV16(uint16_t value);
 750:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 751:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 752:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Reverse byte order in signed short value with sign extension to integer
 753:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 754:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  value  value to reverse
 755:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @return        reversed value
 756:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 757:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Reverse byte order in signed short value with sign extension to integer
 758:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 759:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** extern int32_t __REVSH(int16_t value);
 760:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 761:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 762:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #elif (defined (__TASKING__)) /*------------------ TASKING Compiler ---------------------*/
 763:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* TASKING carm specific functions */
 764:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 765:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /*
 766:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * The CMSIS functions have been implemented as intrinsics in the compiler.
 767:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Please use "carm -?i" to get an up to date list of all instrinsics,
 768:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Including the CMSIS ones.
 769:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 770:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 771:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #endif
 772:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 773:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 774:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /** @addtogroup CMSIS_CM0_Core_FunctionInterface CMSIS CM0 Core Function Interface
 775:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   Core  Function Interface containing:
 776:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   - Core NVIC Functions
 777:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   - Core SysTick Functions
 778:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   - Core Reset Functions
 779:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** */
 780:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /*@{*/
 781:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 782:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* ##########################   NVIC functions  #################################### */
 783:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 784:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* Interrupt Priorities are WORD accessible only under ARMv6M                   */
 785:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /* The following MACROS handle generation of the register offset and byte masks */
 786:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define _BIT_SHIFT(IRQn)         (  (((uint32_t)(IRQn)       )    &  0x03) * 8 )
 787:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define _SHP_IDX(IRQn)           ( ((((uint32_t)(IRQn) & 0x0F)-8) >>    2)     )
 788:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** #define _IP_IDX(IRQn)            (   ((uint32_t)(IRQn)            >>    2)     )
 789:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 790:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** 
 791:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** /**
 792:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @brief  Enable Interrupt in NVIC Interrupt Controller
 793:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 794:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * @param  IRQn   The positive number of the external interrupt to enable
 795:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  *
 796:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * Enable a device specific interupt in the NVIC interrupt controller.
 797:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  * The interrupt number cannot be a negative value.
 798:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****  */
 799:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** static __INLINE void NVIC_EnableIRQ(IRQn_Type IRQn)
 800:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** {
  27              		.loc 1 800 0
  28              		.cfi_startproc
  29              		@ args = 0, pretend = 0, frame = 8
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  31 0000 80B5     		push	{r7, lr}
  32              		.cfi_def_cfa_offset 8
  33              		.cfi_offset 7, -8
  34              		.cfi_offset 14, -4
  35 0002 82B0     		sub	sp, sp, #8
  36              		.cfi_def_cfa_offset 16
  37 0004 00AF     		add	r7, sp, #0
  38              		.cfi_def_cfa_register 7
  39 0006 0200     		movs	r2, r0
  40 0008 FB1D     		adds	r3, r7, #7
  41 000a 1A70     		strb	r2, [r3]
 801:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h ****   NVIC->ISER[0] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* enable interrupt */
  42              		.loc 1 801 0
  43 000c 064B     		ldr	r3, .L2
  44 000e FA1D     		adds	r2, r7, #7
  45 0010 1278     		ldrb	r2, [r2]
  46 0012 1100     		movs	r1, r2
  47 0014 1F22     		movs	r2, #31
  48 0016 0A40     		ands	r2, r1
  49 0018 0121     		movs	r1, #1
  50 001a 9140     		lsls	r1, r1, r2
  51 001c 0A00     		movs	r2, r1
  52 001e 1A60     		str	r2, [r3]
 802:/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/core_cm0.h **** }
  53              		.loc 1 802 0
  54 0020 C046     		nop
  55 0022 BD46     		mov	sp, r7
  56 0024 02B0     		add	sp, sp, #8
  57              		@ sp needed
  58 0026 80BD     		pop	{r7, pc}
  59              	.L3:
  60              		.align	2
  61              	.L2:
  62 0028 00E100E0 		.word	-536813312
  63              		.cfi_endproc
  64              	.LFE11:
  66              		.global	timer32_0_period
  67              		.bss
  68              		.align	2
  71              	timer32_0_period:
  72 0000 00000000 		.space	4
  73              		.global	timer32_0_counter
  74              		.align	2
  77              	timer32_0_counter:
  78 0004 00000000 		.space	4
  79              		.global	timer32_0_capture
  80              		.align	2
  83              	timer32_0_capture:
  84 0008 00000000 		.space	4
  85              		.global	timer32_1_period
  86              		.align	2
  89              	timer32_1_period:
  90 000c 00000000 		.space	4
  91              		.global	__aeabi_uidiv
  92              		.section	.text.delay32Ms,"ax",%progbits
  93              		.align	2
  94              		.global	delay32Ms
  95              		.code	16
  96              		.thumb_func
  98              	delay32Ms:
  99              	.LFB20:
 100              		.file 2 "../driver/timer32.c"
   1:../driver/timer32.c **** /****************************************************************************
   2:../driver/timer32.c ****  *   $Id:: timer32.c 4785 2010-09-03 22:39:27Z nxp21346                     $
   3:../driver/timer32.c ****  *   Project: NXP LPC11xx 32-bit timer example
   4:../driver/timer32.c ****  *
   5:../driver/timer32.c ****  *   Description:
   6:../driver/timer32.c ****  *     This file contains 32-bit timer code example which include timer 
   7:../driver/timer32.c ****  *     initialization, timer interrupt handler, and related APIs for 
   8:../driver/timer32.c ****  *     timer setup.
   9:../driver/timer32.c ****  *
  10:../driver/timer32.c ****  ****************************************************************************
  11:../driver/timer32.c ****  * Software that is described herein is for illustrative purposes only
  12:../driver/timer32.c ****  * which provides customers with programming information regarding the
  13:../driver/timer32.c ****  * products. This software is supplied "AS IS" without any warranties.
  14:../driver/timer32.c ****  * NXP Semiconductors assumes no responsibility or liability for the
  15:../driver/timer32.c ****  * use of the software, conveys no license or title under any patent,
  16:../driver/timer32.c ****  * copyright, or mask work right to the product. NXP Semiconductors
  17:../driver/timer32.c ****  * reserves the right to make changes in the software without
  18:../driver/timer32.c ****  * notification. NXP Semiconductors also make no representation or
  19:../driver/timer32.c ****  * warranty that such application will be suitable for the specified
  20:../driver/timer32.c ****  * use without further testing or modification.
  21:../driver/timer32.c **** ****************************************************************************/
  22:../driver/timer32.c **** #include "driver_config.h"
  23:../driver/timer32.c **** #if CONFIG_ENABLE_DRIVER_TIMER32==1
  24:../driver/timer32.c **** #include "timer32.h"
  25:../driver/timer32.c **** 
  26:../driver/timer32.c **** /* ===================
  27:../driver/timer32.c ****  * CodeRed - Modified file to extract out interrupt handler related code,
  28:../driver/timer32.c ****  * which is really application project specific.
  29:../driver/timer32.c ****  * Set TIMER32_GENERIC_INTS to 1 to reenable original code.
  30:../driver/timer32.c ****  * =================== */
  31:../driver/timer32.c **** volatile uint32_t timer32_0_period = 0;
  32:../driver/timer32.c **** #ifdef CONFIG_TIMER32_DEFAULT_TIMER32_0_IRQHANDLER
  33:../driver/timer32.c **** volatile uint32_t timer32_0_counter = 0;
  34:../driver/timer32.c **** volatile uint32_t timer32_0_capture = 0;
  35:../driver/timer32.c **** #endif //CONFIG_TIMER32_DEFAULT_TIMER32_0_IRQHANDLER
  36:../driver/timer32.c **** 
  37:../driver/timer32.c **** volatile uint32_t timer32_1_period = 0;
  38:../driver/timer32.c **** #ifdef CONFIG_TIMER32_DEFAULT_TIMER32_1_IRQHANDLER
  39:../driver/timer32.c **** volatile uint32_t timer32_1_counter = 0;
  40:../driver/timer32.c **** volatile uint32_t timer32_1_capture = 0;
  41:../driver/timer32.c **** #endif //CONFIG_TIMER32_DEFAULT_TIMER32_1_IRQHANDLER
  42:../driver/timer32.c **** 
  43:../driver/timer32.c **** /*****************************************************************************
  44:../driver/timer32.c **** ** Function name:		delay32Ms
  45:../driver/timer32.c **** **
  46:../driver/timer32.c **** ** Descriptions:		Start the timer delay in milo seconds
  47:../driver/timer32.c **** **						until elapsed
  48:../driver/timer32.c **** **
  49:../driver/timer32.c **** ** parameters:			timer number, Delay value in milo second			 
  50:../driver/timer32.c **** ** 						
  51:../driver/timer32.c **** ** Returned value:		None
  52:../driver/timer32.c **** ** 
  53:../driver/timer32.c **** *****************************************************************************/
  54:../driver/timer32.c **** void delay32Ms(uint8_t timer_num, uint32_t delayInMs)
  55:../driver/timer32.c **** {
 101              		.loc 2 55 0
 102              		.cfi_startproc
 103              		@ args = 0, pretend = 0, frame = 8
 104              		@ frame_needed = 1, uses_anonymous_args = 0
 105 0000 90B5     		push	{r4, r7, lr}
 106              		.cfi_def_cfa_offset 12
 107              		.cfi_offset 4, -12
 108              		.cfi_offset 7, -8
 109              		.cfi_offset 14, -4
 110 0002 83B0     		sub	sp, sp, #12
 111              		.cfi_def_cfa_offset 24
 112 0004 00AF     		add	r7, sp, #0
 113              		.cfi_def_cfa_register 7
 114 0006 0200     		movs	r2, r0
 115 0008 3960     		str	r1, [r7]
 116 000a FB1D     		adds	r3, r7, #7
 117 000c 1A70     		strb	r2, [r3]
  56:../driver/timer32.c ****   if (timer_num == 0)
 118              		.loc 2 56 0
 119 000e FB1D     		adds	r3, r7, #7
 120 0010 1B78     		ldrb	r3, [r3]
 121 0012 002B     		cmp	r3, #0
 122 0014 2BD1     		bne	.L5
  57:../driver/timer32.c ****   {
  58:../driver/timer32.c ****     /* setup timer #0 for delay */
  59:../driver/timer32.c ****     LPC_TMR32B0->TCR = 0x02;		/* reset timer */
 123              		.loc 2 59 0
 124 0016 304B     		ldr	r3, .L11
 125 0018 0222     		movs	r2, #2
 126 001a 5A60     		str	r2, [r3, #4]
  60:../driver/timer32.c ****     LPC_TMR32B0->PR  = 0x00;		/* set prescaler to zero */
 127              		.loc 2 60 0
 128 001c 2E4B     		ldr	r3, .L11
 129 001e 0022     		movs	r2, #0
 130 0020 DA60     		str	r2, [r3, #12]
  61:../driver/timer32.c ****     LPC_TMR32B0->MR0 = delayInMs * ((SystemCoreClock/(LPC_TMR32B0->PR+1)) / 1000);
 131              		.loc 2 61 0
 132 0022 2D4C     		ldr	r4, .L11
 133 0024 2D4B     		ldr	r3, .L11+4
 134 0026 1A68     		ldr	r2, [r3]
 135 0028 2B4B     		ldr	r3, .L11
 136 002a DB68     		ldr	r3, [r3, #12]
 137 002c 0133     		adds	r3, r3, #1
 138 002e 1900     		movs	r1, r3
 139 0030 1000     		movs	r0, r2
 140 0032 FFF7FEFF 		bl	__aeabi_uidiv
 141 0036 0300     		movs	r3, r0
 142 0038 1A00     		movs	r2, r3
 143 003a FA23     		movs	r3, #250
 144 003c 9900     		lsls	r1, r3, #2
 145 003e 1000     		movs	r0, r2
 146 0040 FFF7FEFF 		bl	__aeabi_uidiv
 147 0044 0300     		movs	r3, r0
 148 0046 1A00     		movs	r2, r3
 149 0048 3B68     		ldr	r3, [r7]
 150 004a 5343     		muls	r3, r2
 151 004c A361     		str	r3, [r4, #24]
  62:../driver/timer32.c ****     LPC_TMR32B0->IR  = 0xff;		/* reset all interrrupts */
 152              		.loc 2 62 0
 153 004e 224B     		ldr	r3, .L11
 154 0050 FF22     		movs	r2, #255
 155 0052 1A60     		str	r2, [r3]
  63:../driver/timer32.c ****     LPC_TMR32B0->MCR = 0x04;		/* stop timer on match */
 156              		.loc 2 63 0
 157 0054 204B     		ldr	r3, .L11
 158 0056 0422     		movs	r2, #4
 159 0058 5A61     		str	r2, [r3, #20]
  64:../driver/timer32.c ****     LPC_TMR32B0->TCR = 0x01;		/* start timer */
 160              		.loc 2 64 0
 161 005a 1F4B     		ldr	r3, .L11
 162 005c 0122     		movs	r2, #1
 163 005e 5A60     		str	r2, [r3, #4]
  65:../driver/timer32.c ****   
  66:../driver/timer32.c ****     /* wait until delay time has elapsed */
  67:../driver/timer32.c ****     while (LPC_TMR32B0->TCR & 0x01);
 164              		.loc 2 67 0
 165 0060 C046     		nop
 166              	.L6:
 167              		.loc 2 67 0 is_stmt 0 discriminator 1
 168 0062 1D4B     		ldr	r3, .L11
 169 0064 5B68     		ldr	r3, [r3, #4]
 170 0066 0122     		movs	r2, #1
 171 0068 1340     		ands	r3, r2
 172 006a FAD1     		bne	.L6
  68:../driver/timer32.c ****   }
  69:../driver/timer32.c ****   else if (timer_num == 1)
  70:../driver/timer32.c ****   {
  71:../driver/timer32.c ****     /* setup timer #1 for delay */
  72:../driver/timer32.c ****     LPC_TMR32B1->TCR = 0x02;		/* reset timer */
  73:../driver/timer32.c ****     LPC_TMR32B1->PR  = 0x00;		/* set prescaler to zero */
  74:../driver/timer32.c ****     LPC_TMR32B1->MR0 = delayInMs * ((SystemCoreClock/(LPC_TMR32B0->PR+1)) / 1000);
  75:../driver/timer32.c ****     LPC_TMR32B1->IR  = 0xff;		/* reset all interrrupts */
  76:../driver/timer32.c ****     LPC_TMR32B1->MCR = 0x04;		/* stop timer on match */
  77:../driver/timer32.c ****     LPC_TMR32B1->TCR = 0x01;		/* start timer */
  78:../driver/timer32.c ****   
  79:../driver/timer32.c ****     /* wait until delay time has elapsed */
  80:../driver/timer32.c ****     while (LPC_TMR32B1->TCR & 0x01);
  81:../driver/timer32.c ****   }
  82:../driver/timer32.c ****   return;
 173              		.loc 2 82 0 is_stmt 1
 174 006c 2FE0     		b	.L10
 175              	.L5:
  69:../driver/timer32.c ****   {
 176              		.loc 2 69 0
 177 006e FB1D     		adds	r3, r7, #7
 178 0070 1B78     		ldrb	r3, [r3]
 179 0072 012B     		cmp	r3, #1
 180 0074 2BD1     		bne	.L10
  72:../driver/timer32.c ****     LPC_TMR32B1->PR  = 0x00;		/* set prescaler to zero */
 181              		.loc 2 72 0
 182 0076 1A4B     		ldr	r3, .L11+8
 183 0078 0222     		movs	r2, #2
 184 007a 5A60     		str	r2, [r3, #4]
  73:../driver/timer32.c ****     LPC_TMR32B1->MR0 = delayInMs * ((SystemCoreClock/(LPC_TMR32B0->PR+1)) / 1000);
 185              		.loc 2 73 0
 186 007c 184B     		ldr	r3, .L11+8
 187 007e 0022     		movs	r2, #0
 188 0080 DA60     		str	r2, [r3, #12]
  74:../driver/timer32.c ****     LPC_TMR32B1->IR  = 0xff;		/* reset all interrrupts */
 189              		.loc 2 74 0
 190 0082 174C     		ldr	r4, .L11+8
 191 0084 154B     		ldr	r3, .L11+4
 192 0086 1A68     		ldr	r2, [r3]
 193 0088 134B     		ldr	r3, .L11
 194 008a DB68     		ldr	r3, [r3, #12]
 195 008c 0133     		adds	r3, r3, #1
 196 008e 1900     		movs	r1, r3
 197 0090 1000     		movs	r0, r2
 198 0092 FFF7FEFF 		bl	__aeabi_uidiv
 199 0096 0300     		movs	r3, r0
 200 0098 1A00     		movs	r2, r3
 201 009a FA23     		movs	r3, #250
 202 009c 9900     		lsls	r1, r3, #2
 203 009e 1000     		movs	r0, r2
 204 00a0 FFF7FEFF 		bl	__aeabi_uidiv
 205 00a4 0300     		movs	r3, r0
 206 00a6 1A00     		movs	r2, r3
 207 00a8 3B68     		ldr	r3, [r7]
 208 00aa 5343     		muls	r3, r2
 209 00ac A361     		str	r3, [r4, #24]
  75:../driver/timer32.c ****     LPC_TMR32B1->MCR = 0x04;		/* stop timer on match */
 210              		.loc 2 75 0
 211 00ae 0C4B     		ldr	r3, .L11+8
 212 00b0 FF22     		movs	r2, #255
 213 00b2 1A60     		str	r2, [r3]
  76:../driver/timer32.c ****     LPC_TMR32B1->TCR = 0x01;		/* start timer */
 214              		.loc 2 76 0
 215 00b4 0A4B     		ldr	r3, .L11+8
 216 00b6 0422     		movs	r2, #4
 217 00b8 5A61     		str	r2, [r3, #20]
  77:../driver/timer32.c ****   
 218              		.loc 2 77 0
 219 00ba 094B     		ldr	r3, .L11+8
 220 00bc 0122     		movs	r2, #1
 221 00be 5A60     		str	r2, [r3, #4]
  80:../driver/timer32.c ****   }
 222              		.loc 2 80 0
 223 00c0 C046     		nop
 224              	.L8:
  80:../driver/timer32.c ****   }
 225              		.loc 2 80 0 is_stmt 0 discriminator 1
 226 00c2 074B     		ldr	r3, .L11+8
 227 00c4 5B68     		ldr	r3, [r3, #4]
 228 00c6 0122     		movs	r2, #1
 229 00c8 1340     		ands	r3, r2
 230 00ca FAD1     		bne	.L8
 231              		.loc 2 82 0 is_stmt 1 discriminator 1
 232 00cc C046     		nop
 233              	.L10:
 234              		.loc 2 82 0 is_stmt 0
 235 00ce C046     		nop
  83:../driver/timer32.c **** }
 236              		.loc 2 83 0 is_stmt 1
 237 00d0 BD46     		mov	sp, r7
 238 00d2 03B0     		add	sp, sp, #12
 239              		@ sp needed
 240 00d4 90BD     		pop	{r4, r7, pc}
 241              	.L12:
 242 00d6 C046     		.align	2
 243              	.L11:
 244 00d8 00400140 		.word	1073823744
 245 00dc 00000000 		.word	SystemCoreClock
 246 00e0 00800140 		.word	1073840128
 247              		.cfi_endproc
 248              	.LFE20:
 250              		.section	.text.TIMER32_0_IRQHandler,"ax",%progbits
 251              		.align	2
 252              		.global	TIMER32_0_IRQHandler
 253              		.code	16
 254              		.thumb_func
 256              	TIMER32_0_IRQHandler:
 257              	.LFB21:
  84:../driver/timer32.c **** 
  85:../driver/timer32.c **** 
  86:../driver/timer32.c **** #if CONFIG_TIMER32_DEFAULT_TIMER32_0_IRQHANDLER==1
  87:../driver/timer32.c **** /******************************************************************************
  88:../driver/timer32.c **** ** Function name:		TIMER32_0_IRQHandler
  89:../driver/timer32.c **** **
  90:../driver/timer32.c **** ** Descriptions:		Timer/Counter 0 interrupt handler
  91:../driver/timer32.c **** **						executes each 10ms @ 60 MHz CPU Clock
  92:../driver/timer32.c **** **
  93:../driver/timer32.c **** ** parameters:			None
  94:../driver/timer32.c **** ** Returned value:		None
  95:../driver/timer32.c **** ** 
  96:../driver/timer32.c **** ******************************************************************************/
  97:../driver/timer32.c **** void TIMER32_0_IRQHandler(void)
  98:../driver/timer32.c **** {  
 258              		.loc 2 98 0
 259              		.cfi_startproc
 260              		@ args = 0, pretend = 0, frame = 0
 261              		@ frame_needed = 1, uses_anonymous_args = 0
 262 0000 80B5     		push	{r7, lr}
 263              		.cfi_def_cfa_offset 8
 264              		.cfi_offset 7, -8
 265              		.cfi_offset 14, -4
 266 0002 00AF     		add	r7, sp, #0
 267              		.cfi_def_cfa_register 7
  99:../driver/timer32.c ****   if ( LPC_TMR32B0->IR & 0x01 )
 268              		.loc 2 99 0
 269 0004 0E4B     		ldr	r3, .L18
 270 0006 1B68     		ldr	r3, [r3]
 271 0008 0122     		movs	r2, #1
 272 000a 1340     		ands	r3, r2
 273 000c 07D0     		beq	.L14
 100:../driver/timer32.c ****   {  
 101:../driver/timer32.c **** 	LPC_TMR32B0->IR = 1;				/* clear interrupt flag */
 274              		.loc 2 101 0
 275 000e 0C4B     		ldr	r3, .L18
 276 0010 0122     		movs	r2, #1
 277 0012 1A60     		str	r2, [r3]
 102:../driver/timer32.c **** 	timer32_0_counter++;
 278              		.loc 2 102 0
 279 0014 0B4B     		ldr	r3, .L18+4
 280 0016 1B68     		ldr	r3, [r3]
 281 0018 5A1C     		adds	r2, r3, #1
 282 001a 0A4B     		ldr	r3, .L18+4
 283 001c 1A60     		str	r2, [r3]
 284              	.L14:
 103:../driver/timer32.c ****   }
 104:../driver/timer32.c ****   if ( LPC_TMR32B0->IR & (0x1<<4) )
 285              		.loc 2 104 0
 286 001e 084B     		ldr	r3, .L18
 287 0020 1B68     		ldr	r3, [r3]
 288 0022 1022     		movs	r2, #16
 289 0024 1340     		ands	r3, r2
 290 0026 08D0     		beq	.L17
 105:../driver/timer32.c ****   {  
 106:../driver/timer32.c **** 	LPC_TMR32B0->IR = 0x1<<4;			/* clear interrupt flag */
 291              		.loc 2 106 0
 292 0028 054B     		ldr	r3, .L18
 293 002a 1022     		movs	r2, #16
 294 002c 1A60     		str	r2, [r3]
 107:../driver/timer32.c **** 	timer32_0_capture++;
 295              		.loc 2 107 0
 296 002e 064B     		ldr	r3, .L18+8
 297 0030 1B68     		ldr	r3, [r3]
 298 0032 5A1C     		adds	r2, r3, #1
 299 0034 044B     		ldr	r3, .L18+8
 300 0036 1A60     		str	r2, [r3]
 108:../driver/timer32.c ****   }
 109:../driver/timer32.c ****   return;
 301              		.loc 2 109 0
 302 0038 C046     		nop
 303              	.L17:
 304 003a C046     		nop
 110:../driver/timer32.c **** }
 305              		.loc 2 110 0
 306 003c BD46     		mov	sp, r7
 307              		@ sp needed
 308 003e 80BD     		pop	{r7, pc}
 309              	.L19:
 310              		.align	2
 311              	.L18:
 312 0040 00400140 		.word	1073823744
 313 0044 00000000 		.word	timer32_0_counter
 314 0048 00000000 		.word	timer32_0_capture
 315              		.cfi_endproc
 316              	.LFE21:
 318              		.section	.text.enable_timer32,"ax",%progbits
 319              		.align	2
 320              		.global	enable_timer32
 321              		.code	16
 322              		.thumb_func
 324              	enable_timer32:
 325              	.LFB22:
 111:../driver/timer32.c **** #endif //CONFIG_TIMER32_DEFAULT_TIMER32_0_IRQHANDLER
 112:../driver/timer32.c **** 
 113:../driver/timer32.c **** #if CONFIG_TIMER32_DEFAULT_TIMER32_1_IRQHANDLER==1
 114:../driver/timer32.c **** /******************************************************************************
 115:../driver/timer32.c **** ** Function name:		TIMER32_1_IRQHandler
 116:../driver/timer32.c **** **
 117:../driver/timer32.c **** ** Descriptions:		Timer/Counter 1 interrupt handler
 118:../driver/timer32.c **** **						executes each 10ms @ 60 MHz CPU Clock
 119:../driver/timer32.c **** **
 120:../driver/timer32.c **** ** parameters:			None
 121:../driver/timer32.c **** ** Returned value:		None
 122:../driver/timer32.c **** ** 
 123:../driver/timer32.c **** ******************************************************************************/
 124:../driver/timer32.c **** void TIMER32_1_IRQHandler(void)
 125:../driver/timer32.c **** {  
 126:../driver/timer32.c ****   if ( LPC_TMR32B1->IR & 0x01 )
 127:../driver/timer32.c ****   {    
 128:../driver/timer32.c **** 	LPC_TMR32B1->IR = 1;			/* clear interrupt flag */
 129:../driver/timer32.c **** 	timer32_1_counter++;
 130:../driver/timer32.c ****   }
 131:../driver/timer32.c ****   if ( LPC_TMR32B1->IR & (0x1<<4) )
 132:../driver/timer32.c ****   {  
 133:../driver/timer32.c **** 	LPC_TMR32B1->IR = 0x1<<4;			/* clear interrupt flag */
 134:../driver/timer32.c **** 	timer32_1_capture++;
 135:../driver/timer32.c ****   }
 136:../driver/timer32.c ****   return;
 137:../driver/timer32.c **** }
 138:../driver/timer32.c **** #endif //CONFIG_TIMER32_DEFAULT_TIMER32_1_IRQHANDLER
 139:../driver/timer32.c **** 
 140:../driver/timer32.c **** /******************************************************************************
 141:../driver/timer32.c **** ** Function name:		enable_timer
 142:../driver/timer32.c **** **
 143:../driver/timer32.c **** ** Descriptions:		Enable timer
 144:../driver/timer32.c **** **
 145:../driver/timer32.c **** ** parameters:			timer number: 0 or 1
 146:../driver/timer32.c **** ** Returned value:		None
 147:../driver/timer32.c **** ** 
 148:../driver/timer32.c **** ******************************************************************************/
 149:../driver/timer32.c **** void enable_timer32(uint8_t timer_num)
 150:../driver/timer32.c **** {
 326              		.loc 2 150 0
 327              		.cfi_startproc
 328              		@ args = 0, pretend = 0, frame = 8
 329              		@ frame_needed = 1, uses_anonymous_args = 0
 330 0000 80B5     		push	{r7, lr}
 331              		.cfi_def_cfa_offset 8
 332              		.cfi_offset 7, -8
 333              		.cfi_offset 14, -4
 334 0002 82B0     		sub	sp, sp, #8
 335              		.cfi_def_cfa_offset 16
 336 0004 00AF     		add	r7, sp, #0
 337              		.cfi_def_cfa_register 7
 338 0006 0200     		movs	r2, r0
 339 0008 FB1D     		adds	r3, r7, #7
 340 000a 1A70     		strb	r2, [r3]
 151:../driver/timer32.c ****   if ( timer_num == 0 )
 341              		.loc 2 151 0
 342 000c FB1D     		adds	r3, r7, #7
 343 000e 1B78     		ldrb	r3, [r3]
 344 0010 002B     		cmp	r3, #0
 345 0012 03D1     		bne	.L21
 152:../driver/timer32.c ****   {
 153:../driver/timer32.c ****     LPC_TMR32B0->TCR = 1;
 346              		.loc 2 153 0
 347 0014 054B     		ldr	r3, .L24
 348 0016 0122     		movs	r2, #1
 349 0018 5A60     		str	r2, [r3, #4]
 154:../driver/timer32.c ****   }
 155:../driver/timer32.c ****   else
 156:../driver/timer32.c ****   {
 157:../driver/timer32.c ****     LPC_TMR32B1->TCR = 1;
 158:../driver/timer32.c ****   }
 159:../driver/timer32.c ****   return;
 350              		.loc 2 159 0
 351 001a 03E0     		b	.L20
 352              	.L21:
 157:../driver/timer32.c ****   }
 353              		.loc 2 157 0
 354 001c 044B     		ldr	r3, .L24+4
 355 001e 0122     		movs	r2, #1
 356 0020 5A60     		str	r2, [r3, #4]
 357              		.loc 2 159 0
 358 0022 C046     		nop
 359              	.L20:
 160:../driver/timer32.c **** }
 360              		.loc 2 160 0
 361 0024 BD46     		mov	sp, r7
 362 0026 02B0     		add	sp, sp, #8
 363              		@ sp needed
 364 0028 80BD     		pop	{r7, pc}
 365              	.L25:
 366 002a C046     		.align	2
 367              	.L24:
 368 002c 00400140 		.word	1073823744
 369 0030 00800140 		.word	1073840128
 370              		.cfi_endproc
 371              	.LFE22:
 373              		.section	.text.disable_timer32,"ax",%progbits
 374              		.align	2
 375              		.global	disable_timer32
 376              		.code	16
 377              		.thumb_func
 379              	disable_timer32:
 380              	.LFB23:
 161:../driver/timer32.c **** 
 162:../driver/timer32.c **** /******************************************************************************
 163:../driver/timer32.c **** ** Function name:		disable_timer
 164:../driver/timer32.c **** **
 165:../driver/timer32.c **** ** Descriptions:		Disable timer
 166:../driver/timer32.c **** **
 167:../driver/timer32.c **** ** parameters:			timer number: 0 or 1
 168:../driver/timer32.c **** ** Returned value:		None
 169:../driver/timer32.c **** ** 
 170:../driver/timer32.c **** ******************************************************************************/
 171:../driver/timer32.c **** void disable_timer32(uint8_t timer_num)
 172:../driver/timer32.c **** {
 381              		.loc 2 172 0
 382              		.cfi_startproc
 383              		@ args = 0, pretend = 0, frame = 8
 384              		@ frame_needed = 1, uses_anonymous_args = 0
 385 0000 80B5     		push	{r7, lr}
 386              		.cfi_def_cfa_offset 8
 387              		.cfi_offset 7, -8
 388              		.cfi_offset 14, -4
 389 0002 82B0     		sub	sp, sp, #8
 390              		.cfi_def_cfa_offset 16
 391 0004 00AF     		add	r7, sp, #0
 392              		.cfi_def_cfa_register 7
 393 0006 0200     		movs	r2, r0
 394 0008 FB1D     		adds	r3, r7, #7
 395 000a 1A70     		strb	r2, [r3]
 173:../driver/timer32.c ****   if ( timer_num == 0 )
 396              		.loc 2 173 0
 397 000c FB1D     		adds	r3, r7, #7
 398 000e 1B78     		ldrb	r3, [r3]
 399 0010 002B     		cmp	r3, #0
 400 0012 03D1     		bne	.L27
 174:../driver/timer32.c ****   {
 175:../driver/timer32.c ****     LPC_TMR32B0->TCR = 0;
 401              		.loc 2 175 0
 402 0014 054B     		ldr	r3, .L30
 403 0016 0022     		movs	r2, #0
 404 0018 5A60     		str	r2, [r3, #4]
 176:../driver/timer32.c ****   }
 177:../driver/timer32.c ****   else
 178:../driver/timer32.c ****   {
 179:../driver/timer32.c ****     LPC_TMR32B1->TCR = 0;
 180:../driver/timer32.c ****   }
 181:../driver/timer32.c ****   return;
 405              		.loc 2 181 0
 406 001a 03E0     		b	.L26
 407              	.L27:
 179:../driver/timer32.c ****   }
 408              		.loc 2 179 0
 409 001c 044B     		ldr	r3, .L30+4
 410 001e 0022     		movs	r2, #0
 411 0020 5A60     		str	r2, [r3, #4]
 412              		.loc 2 181 0
 413 0022 C046     		nop
 414              	.L26:
 182:../driver/timer32.c **** }
 415              		.loc 2 182 0
 416 0024 BD46     		mov	sp, r7
 417 0026 02B0     		add	sp, sp, #8
 418              		@ sp needed
 419 0028 80BD     		pop	{r7, pc}
 420              	.L31:
 421 002a C046     		.align	2
 422              	.L30:
 423 002c 00400140 		.word	1073823744
 424 0030 00800140 		.word	1073840128
 425              		.cfi_endproc
 426              	.LFE23:
 428              		.section	.text.reset_timer32,"ax",%progbits
 429              		.align	2
 430              		.global	reset_timer32
 431              		.code	16
 432              		.thumb_func
 434              	reset_timer32:
 435              	.LFB24:
 183:../driver/timer32.c **** 
 184:../driver/timer32.c **** /******************************************************************************
 185:../driver/timer32.c **** ** Function name:		reset_timer
 186:../driver/timer32.c **** **
 187:../driver/timer32.c **** ** Descriptions:		Reset timer
 188:../driver/timer32.c **** **
 189:../driver/timer32.c **** ** parameters:			timer number: 0 or 1
 190:../driver/timer32.c **** ** Returned value:		None
 191:../driver/timer32.c **** ** 
 192:../driver/timer32.c **** ******************************************************************************/
 193:../driver/timer32.c **** void reset_timer32(uint8_t timer_num)
 194:../driver/timer32.c **** {
 436              		.loc 2 194 0
 437              		.cfi_startproc
 438              		@ args = 0, pretend = 0, frame = 16
 439              		@ frame_needed = 1, uses_anonymous_args = 0
 440 0000 80B5     		push	{r7, lr}
 441              		.cfi_def_cfa_offset 8
 442              		.cfi_offset 7, -8
 443              		.cfi_offset 14, -4
 444 0002 84B0     		sub	sp, sp, #16
 445              		.cfi_def_cfa_offset 24
 446 0004 00AF     		add	r7, sp, #0
 447              		.cfi_def_cfa_register 7
 448 0006 0200     		movs	r2, r0
 449 0008 FB1D     		adds	r3, r7, #7
 450 000a 1A70     		strb	r2, [r3]
 195:../driver/timer32.c ****   uint32_t regVal;
 196:../driver/timer32.c **** 
 197:../driver/timer32.c ****   if ( timer_num == 0 )
 451              		.loc 2 197 0
 452 000c FB1D     		adds	r3, r7, #7
 453 000e 1B78     		ldrb	r3, [r3]
 454 0010 002B     		cmp	r3, #0
 455 0012 0AD1     		bne	.L33
 198:../driver/timer32.c ****   {
 199:../driver/timer32.c ****     regVal = LPC_TMR32B0->TCR;
 456              		.loc 2 199 0
 457 0014 0C4B     		ldr	r3, .L36
 458 0016 5B68     		ldr	r3, [r3, #4]
 459 0018 FB60     		str	r3, [r7, #12]
 200:../driver/timer32.c ****     regVal |= 0x02;
 460              		.loc 2 200 0
 461 001a FB68     		ldr	r3, [r7, #12]
 462 001c 0222     		movs	r2, #2
 463 001e 1343     		orrs	r3, r2
 464 0020 FB60     		str	r3, [r7, #12]
 201:../driver/timer32.c ****     LPC_TMR32B0->TCR = regVal;
 465              		.loc 2 201 0
 466 0022 094B     		ldr	r3, .L36
 467 0024 FA68     		ldr	r2, [r7, #12]
 468 0026 5A60     		str	r2, [r3, #4]
 202:../driver/timer32.c ****   }
 203:../driver/timer32.c ****   else
 204:../driver/timer32.c ****   {
 205:../driver/timer32.c ****     regVal = LPC_TMR32B1->TCR;
 206:../driver/timer32.c ****     regVal |= 0x02;
 207:../driver/timer32.c ****     LPC_TMR32B1->TCR = regVal;
 208:../driver/timer32.c ****   }
 209:../driver/timer32.c ****   return;
 469              		.loc 2 209 0
 470 0028 0AE0     		b	.L32
 471              	.L33:
 205:../driver/timer32.c ****     regVal |= 0x02;
 472              		.loc 2 205 0
 473 002a 084B     		ldr	r3, .L36+4
 474 002c 5B68     		ldr	r3, [r3, #4]
 475 002e FB60     		str	r3, [r7, #12]
 206:../driver/timer32.c ****     LPC_TMR32B1->TCR = regVal;
 476              		.loc 2 206 0
 477 0030 FB68     		ldr	r3, [r7, #12]
 478 0032 0222     		movs	r2, #2
 479 0034 1343     		orrs	r3, r2
 480 0036 FB60     		str	r3, [r7, #12]
 207:../driver/timer32.c ****   }
 481              		.loc 2 207 0
 482 0038 044B     		ldr	r3, .L36+4
 483 003a FA68     		ldr	r2, [r7, #12]
 484 003c 5A60     		str	r2, [r3, #4]
 485              		.loc 2 209 0
 486 003e C046     		nop
 487              	.L32:
 210:../driver/timer32.c **** }
 488              		.loc 2 210 0
 489 0040 BD46     		mov	sp, r7
 490 0042 04B0     		add	sp, sp, #16
 491              		@ sp needed
 492 0044 80BD     		pop	{r7, pc}
 493              	.L37:
 494 0046 C046     		.align	2
 495              	.L36:
 496 0048 00400140 		.word	1073823744
 497 004c 00800140 		.word	1073840128
 498              		.cfi_endproc
 499              	.LFE24:
 501              		.section	.text.init_timer32,"ax",%progbits
 502              		.align	2
 503              		.global	init_timer32
 504              		.code	16
 505              		.thumb_func
 507              	init_timer32:
 508              	.LFB25:
 211:../driver/timer32.c **** 
 212:../driver/timer32.c **** /******************************************************************************
 213:../driver/timer32.c **** ** Function name:		init_timer
 214:../driver/timer32.c **** **
 215:../driver/timer32.c **** ** Descriptions:		Initialize timer, set timer interval, reset timer,
 216:../driver/timer32.c **** **						install timer interrupt handler
 217:../driver/timer32.c **** **
 218:../driver/timer32.c **** ** parameters:			timer number and timer interval
 219:../driver/timer32.c **** ** Returned value:		None
 220:../driver/timer32.c **** ** 
 221:../driver/timer32.c **** ******************************************************************************/
 222:../driver/timer32.c **** void init_timer32(uint8_t timer_num, uint32_t TimerInterval) 
 223:../driver/timer32.c **** {
 509              		.loc 2 223 0
 510              		.cfi_startproc
 511              		@ args = 0, pretend = 0, frame = 8
 512              		@ frame_needed = 1, uses_anonymous_args = 0
 513 0000 80B5     		push	{r7, lr}
 514              		.cfi_def_cfa_offset 8
 515              		.cfi_offset 7, -8
 516              		.cfi_offset 14, -4
 517 0002 82B0     		sub	sp, sp, #8
 518              		.cfi_def_cfa_offset 16
 519 0004 00AF     		add	r7, sp, #0
 520              		.cfi_def_cfa_register 7
 521 0006 0200     		movs	r2, r0
 522 0008 3960     		str	r1, [r7]
 523 000a FB1D     		adds	r3, r7, #7
 524 000c 1A70     		strb	r2, [r3]
 224:../driver/timer32.c ****   if ( timer_num == 0 )
 525              		.loc 2 224 0
 526 000e FB1D     		adds	r3, r7, #7
 527 0010 1B78     		ldrb	r3, [r3]
 528 0012 002B     		cmp	r3, #0
 529 0014 57D1     		bne	.L39
 225:../driver/timer32.c ****   {
 226:../driver/timer32.c ****     /* Some of the I/O pins need to be carefully planned if
 227:../driver/timer32.c ****     you use below module because JTAG and TIMER CAP/MAT pins are muxed. */
 228:../driver/timer32.c ****     LPC_SYSCON->SYSAHBCLKCTRL |= (1<<9);
 530              		.loc 2 228 0
 531 0016 4149     		ldr	r1, .L43
 532 0018 404A     		ldr	r2, .L43
 533 001a 8023     		movs	r3, #128
 534 001c D358     		ldr	r3, [r2, r3]
 535 001e 8022     		movs	r2, #128
 536 0020 9200     		lsls	r2, r2, #2
 537 0022 1343     		orrs	r3, r2
 538 0024 8022     		movs	r2, #128
 539 0026 8B50     		str	r3, [r1, r2]
 229:../driver/timer32.c ****     LPC_IOCON->PIO1_5 &= ~0x07;	/*  Timer0_32 I/O config */
 540              		.loc 2 229 0
 541 0028 3D49     		ldr	r1, .L43+4
 542 002a 3D4A     		ldr	r2, .L43+4
 543 002c A023     		movs	r3, #160
 544 002e D358     		ldr	r3, [r2, r3]
 545 0030 0722     		movs	r2, #7
 546 0032 9343     		bics	r3, r2
 547 0034 A022     		movs	r2, #160
 548 0036 8B50     		str	r3, [r1, r2]
 230:../driver/timer32.c ****     LPC_IOCON->PIO1_5 |= 0x02;	/* Timer0_32 CAP0 */
 549              		.loc 2 230 0
 550 0038 3949     		ldr	r1, .L43+4
 551 003a 394A     		ldr	r2, .L43+4
 552 003c A023     		movs	r3, #160
 553 003e D358     		ldr	r3, [r2, r3]
 554 0040 0222     		movs	r2, #2
 555 0042 1343     		orrs	r3, r2
 556 0044 A022     		movs	r2, #160
 557 0046 8B50     		str	r3, [r1, r2]
 231:../driver/timer32.c ****     LPC_IOCON->PIO1_6 &= ~0x07;
 558              		.loc 2 231 0
 559 0048 3549     		ldr	r1, .L43+4
 560 004a 354A     		ldr	r2, .L43+4
 561 004c A423     		movs	r3, #164
 562 004e D358     		ldr	r3, [r2, r3]
 563 0050 0722     		movs	r2, #7
 564 0052 9343     		bics	r3, r2
 565 0054 A422     		movs	r2, #164
 566 0056 8B50     		str	r3, [r1, r2]
 232:../driver/timer32.c ****     LPC_IOCON->PIO1_6 |= 0x02;	/* Timer0_32 MAT0 */
 567              		.loc 2 232 0
 568 0058 3149     		ldr	r1, .L43+4
 569 005a 314A     		ldr	r2, .L43+4
 570 005c A423     		movs	r3, #164
 571 005e D358     		ldr	r3, [r2, r3]
 572 0060 0222     		movs	r2, #2
 573 0062 1343     		orrs	r3, r2
 574 0064 A422     		movs	r2, #164
 575 0066 8B50     		str	r3, [r1, r2]
 233:../driver/timer32.c ****     LPC_IOCON->PIO1_7 &= ~0x07;
 576              		.loc 2 233 0
 577 0068 2D49     		ldr	r1, .L43+4
 578 006a 2D4A     		ldr	r2, .L43+4
 579 006c A823     		movs	r3, #168
 580 006e D358     		ldr	r3, [r2, r3]
 581 0070 0722     		movs	r2, #7
 582 0072 9343     		bics	r3, r2
 583 0074 A822     		movs	r2, #168
 584 0076 8B50     		str	r3, [r1, r2]
 234:../driver/timer32.c ****     LPC_IOCON->PIO1_7 |= 0x02;	/* Timer0_32 MAT1 */
 585              		.loc 2 234 0
 586 0078 2949     		ldr	r1, .L43+4
 587 007a 294A     		ldr	r2, .L43+4
 588 007c A823     		movs	r3, #168
 589 007e D358     		ldr	r3, [r2, r3]
 590 0080 0222     		movs	r2, #2
 591 0082 1343     		orrs	r3, r2
 592 0084 A822     		movs	r2, #168
 593 0086 8B50     		str	r3, [r1, r2]
 235:../driver/timer32.c ****     LPC_IOCON->PIO0_1 &= ~0x07;	
 594              		.loc 2 235 0
 595 0088 254B     		ldr	r3, .L43+4
 596 008a 254A     		ldr	r2, .L43+4
 597 008c 1269     		ldr	r2, [r2, #16]
 598 008e 0721     		movs	r1, #7
 599 0090 8A43     		bics	r2, r1
 600 0092 1A61     		str	r2, [r3, #16]
 236:../driver/timer32.c ****     LPC_IOCON->PIO0_1 |= 0x02;	/* Timer0_32 MAT2 */
 601              		.loc 2 236 0
 602 0094 224B     		ldr	r3, .L43+4
 603 0096 224A     		ldr	r2, .L43+4
 604 0098 1269     		ldr	r2, [r2, #16]
 605 009a 0221     		movs	r1, #2
 606 009c 0A43     		orrs	r2, r1
 607 009e 1A61     		str	r2, [r3, #16]
 237:../driver/timer32.c **** #ifdef __JTAG_DISABLED
 238:../driver/timer32.c ****     LPC_IOCON->JTAG_TDI_PIO0_11 &= ~0x07;	
 239:../driver/timer32.c ****     LPC_IOCON->JTAG_TDI_PIO0_11 |= 0x03;	/* Timer0_32 MAT3 */
 240:../driver/timer32.c **** #endif
 241:../driver/timer32.c **** #if CONFIG_TIMER32_DEFAULT_TIMER32_0_IRQHANDLER==1
 242:../driver/timer32.c ****     timer32_0_counter = 0;
 608              		.loc 2 242 0
 609 00a0 204B     		ldr	r3, .L43+8
 610 00a2 0022     		movs	r2, #0
 611 00a4 1A60     		str	r2, [r3]
 243:../driver/timer32.c ****     timer32_0_capture = 0;
 612              		.loc 2 243 0
 613 00a6 204B     		ldr	r3, .L43+12
 614 00a8 0022     		movs	r2, #0
 615 00aa 1A60     		str	r2, [r3]
 244:../driver/timer32.c **** #endif //TIMER32_0_DEFAULT_HANDLER
 245:../driver/timer32.c ****     LPC_TMR32B0->MR0 = TimerInterval;
 616              		.loc 2 245 0
 617 00ac 1F4B     		ldr	r3, .L43+16
 618 00ae 3A68     		ldr	r2, [r7]
 619 00b0 9A61     		str	r2, [r3, #24]
 246:../driver/timer32.c **** #if TIMER_MATCH
 247:../driver/timer32.c **** 	LPC_TMR32B0->EMR &= ~(0xFF<<4);
 248:../driver/timer32.c **** 	LPC_TMR32B0->EMR |= ((0x3<<4)|(0x3<<6)|(0x3<<8)|(0x3<<10));	/* MR0/1/2/3 Toggle */
 249:../driver/timer32.c **** #else
 250:../driver/timer32.c **** 	/* Capture 0 on rising edge, interrupt enable. */
 251:../driver/timer32.c **** 	LPC_TMR32B0->CCR = (0x1<<0)|(0x1<<2);
 620              		.loc 2 251 0
 621 00b2 1E4B     		ldr	r3, .L43+16
 622 00b4 0522     		movs	r2, #5
 623 00b6 9A62     		str	r2, [r3, #40]
 252:../driver/timer32.c **** #endif
 253:../driver/timer32.c ****     LPC_TMR32B0->MCR = 3;			/* Interrupt and Reset on MR0 */
 624              		.loc 2 253 0
 625 00b8 1C4B     		ldr	r3, .L43+16
 626 00ba 0322     		movs	r2, #3
 627 00bc 5A61     		str	r2, [r3, #20]
 254:../driver/timer32.c **** 
 255:../driver/timer32.c **** #if CONFIG_TIMER32_DEFAULT_TIMER32_0_IRQHANDLER==1
 256:../driver/timer32.c ****     /* Enable the TIMER0 Interrupt */
 257:../driver/timer32.c ****     NVIC_EnableIRQ(TIMER_32_0_IRQn);
 628              		.loc 2 257 0
 629 00be 1220     		movs	r0, #18
 630 00c0 FFF7FEFF 		bl	NVIC_EnableIRQ
 258:../driver/timer32.c **** #endif
 259:../driver/timer32.c ****   }
 260:../driver/timer32.c ****   else if ( timer_num == 1 )
 261:../driver/timer32.c ****   {
 262:../driver/timer32.c ****     /* Some of the I/O pins need to be clearfully planned if
 263:../driver/timer32.c ****     you use below module because JTAG and TIMER CAP/MAT pins are muxed. */
 264:../driver/timer32.c ****     LPC_SYSCON->SYSAHBCLKCTRL |= (1<<10);
 265:../driver/timer32.c **** #ifdef __JTAG_DISABLED
 266:../driver/timer32.c ****     LPC_IOCON->JTAG_TMS_PIO1_0  &= ~0x07;	/*  Timer1_32 I/O config */
 267:../driver/timer32.c ****     LPC_IOCON->JTAG_TMS_PIO1_0  |= 0x03;	/* Timer1_32 CAP0 */
 268:../driver/timer32.c ****     LPC_IOCON->JTAG_TDO_PIO1_1  &= ~0x07;	
 269:../driver/timer32.c ****     LPC_IOCON->JTAG_TDO_PIO1_1  |= 0x03;	/* Timer1_32 MAT0 */
 270:../driver/timer32.c ****     LPC_IOCON->JTAG_nTRST_PIO1_2 &= ~0x07;
 271:../driver/timer32.c ****     LPC_IOCON->JTAG_nTRST_PIO1_2 |= 0x03;	/* Timer1_32 MAT1 */
 272:../driver/timer32.c ****     LPC_IOCON->ARM_SWDIO_PIO1_3  &= ~0x07;
 273:../driver/timer32.c ****     LPC_IOCON->ARM_SWDIO_PIO1_3  |= 0x03;	/* Timer1_32 MAT2 */
 274:../driver/timer32.c **** #endif
 275:../driver/timer32.c ****     LPC_IOCON->PIO1_4 &= ~0x07;
 276:../driver/timer32.c ****     LPC_IOCON->PIO1_4 |= 0x02;		/* Timer0_32 MAT3 */
 277:../driver/timer32.c **** 
 278:../driver/timer32.c **** #if CONFIG_TIMER32_DEFAULT_TIMER32_1_IRQHANDLER==1
 279:../driver/timer32.c ****     timer32_1_counter = 0;
 280:../driver/timer32.c ****     timer32_1_capture = 0;
 281:../driver/timer32.c **** #endif //TIMER32_1_DEFAULT_HANDLER
 282:../driver/timer32.c **** 
 283:../driver/timer32.c ****     LPC_TMR32B1->MR0 = TimerInterval;
 284:../driver/timer32.c **** #if TIMER_MATCH
 285:../driver/timer32.c **** 	LPC_TMR32B1->EMR &= ~(0xFF<<4);
 286:../driver/timer32.c **** 	LPC_TMR32B1->EMR |= ((0x3<<4)|(0x3<<6)|(0x3<<8)|(0x3<<10));	/* MR0/1/2 Toggle */
 287:../driver/timer32.c **** #else
 288:../driver/timer32.c **** 	/* Capture 0 on rising edge, interrupt enable. */
 289:../driver/timer32.c **** 	LPC_TMR32B1->CCR = (0x1<<0)|(0x1<<2);
 290:../driver/timer32.c **** #endif
 291:../driver/timer32.c ****     LPC_TMR32B1->MCR = 3;			/* Interrupt and Reset on MR0 */
 292:../driver/timer32.c **** 
 293:../driver/timer32.c **** #if CONFIG_TIMER32_DEFAULT_TIMER32_1_IRQHANDLER==1
 294:../driver/timer32.c ****     /* Enable the TIMER1 Interrupt */
 295:../driver/timer32.c ****     NVIC_EnableIRQ(TIMER_32_1_IRQn);
 296:../driver/timer32.c **** #endif
 297:../driver/timer32.c ****   }
 298:../driver/timer32.c ****   return;
 631              		.loc 2 298 0
 632 00c4 26E0     		b	.L42
 633              	.L39:
 260:../driver/timer32.c ****   {
 634              		.loc 2 260 0
 635 00c6 FB1D     		adds	r3, r7, #7
 636 00c8 1B78     		ldrb	r3, [r3]
 637 00ca 012B     		cmp	r3, #1
 638 00cc 22D1     		bne	.L42
 264:../driver/timer32.c **** #ifdef __JTAG_DISABLED
 639              		.loc 2 264 0
 640 00ce 1349     		ldr	r1, .L43
 641 00d0 124A     		ldr	r2, .L43
 642 00d2 8023     		movs	r3, #128
 643 00d4 D358     		ldr	r3, [r2, r3]
 644 00d6 8022     		movs	r2, #128
 645 00d8 D200     		lsls	r2, r2, #3
 646 00da 1343     		orrs	r3, r2
 647 00dc 8022     		movs	r2, #128
 648 00de 8B50     		str	r3, [r1, r2]
 275:../driver/timer32.c ****     LPC_IOCON->PIO1_4 |= 0x02;		/* Timer0_32 MAT3 */
 649              		.loc 2 275 0
 650 00e0 0F49     		ldr	r1, .L43+4
 651 00e2 0F4A     		ldr	r2, .L43+4
 652 00e4 9423     		movs	r3, #148
 653 00e6 D358     		ldr	r3, [r2, r3]
 654 00e8 0722     		movs	r2, #7
 655 00ea 9343     		bics	r3, r2
 656 00ec 9422     		movs	r2, #148
 657 00ee 8B50     		str	r3, [r1, r2]
 276:../driver/timer32.c **** 
 658              		.loc 2 276 0
 659 00f0 0B49     		ldr	r1, .L43+4
 660 00f2 0B4A     		ldr	r2, .L43+4
 661 00f4 9423     		movs	r3, #148
 662 00f6 D358     		ldr	r3, [r2, r3]
 663 00f8 0222     		movs	r2, #2
 664 00fa 1343     		orrs	r3, r2
 665 00fc 9422     		movs	r2, #148
 666 00fe 8B50     		str	r3, [r1, r2]
 283:../driver/timer32.c **** #if TIMER_MATCH
 667              		.loc 2 283 0
 668 0100 0B4B     		ldr	r3, .L43+20
 669 0102 3A68     		ldr	r2, [r7]
 670 0104 9A61     		str	r2, [r3, #24]
 289:../driver/timer32.c **** #endif
 671              		.loc 2 289 0
 672 0106 0A4B     		ldr	r3, .L43+20
 673 0108 0522     		movs	r2, #5
 674 010a 9A62     		str	r2, [r3, #40]
 291:../driver/timer32.c **** 
 675              		.loc 2 291 0
 676 010c 084B     		ldr	r3, .L43+20
 677 010e 0322     		movs	r2, #3
 678 0110 5A61     		str	r2, [r3, #20]
 679              		.loc 2 298 0
 680 0112 C046     		nop
 681              	.L42:
 682 0114 C046     		nop
 299:../driver/timer32.c **** }
 683              		.loc 2 299 0
 684 0116 BD46     		mov	sp, r7
 685 0118 02B0     		add	sp, sp, #8
 686              		@ sp needed
 687 011a 80BD     		pop	{r7, pc}
 688              	.L44:
 689              		.align	2
 690              	.L43:
 691 011c 00800440 		.word	1074036736
 692 0120 00400440 		.word	1074020352
 693 0124 00000000 		.word	timer32_0_counter
 694 0128 00000000 		.word	timer32_0_capture
 695 012c 00400140 		.word	1073823744
 696 0130 00800140 		.word	1073840128
 697              		.cfi_endproc
 698              	.LFE25:
 700              		.section	.text.init_timer32PWM,"ax",%progbits
 701              		.align	2
 702              		.global	init_timer32PWM
 703              		.code	16
 704              		.thumb_func
 706              	init_timer32PWM:
 707              	.LFB26:
 300:../driver/timer32.c **** /******************************************************************************
 301:../driver/timer32.c **** ** Function name:		init_timer32PWM
 302:../driver/timer32.c **** **
 303:../driver/timer32.c **** ** Descriptions:		Initialize timer as PWM
 304:../driver/timer32.c **** **
 305:../driver/timer32.c **** ** parameters:			timer number, period and match enable:
 306:../driver/timer32.c **** **										match_enable[0] = PWM for MAT0 
 307:../driver/timer32.c **** **										match_enable[1] = PWM for MAT1
 308:../driver/timer32.c **** **										match_enable[2] = PWM for MAT2
 309:../driver/timer32.c **** **			
 310:../driver/timer32.c **** ** Returned value:		None
 311:../driver/timer32.c **** ** 
 312:../driver/timer32.c **** ******************************************************************************/
 313:../driver/timer32.c **** void init_timer32PWM(uint8_t timer_num, uint32_t period, uint8_t match_enable)
 314:../driver/timer32.c **** {
 708              		.loc 2 314 0
 709              		.cfi_startproc
 710              		@ args = 0, pretend = 0, frame = 8
 711              		@ frame_needed = 1, uses_anonymous_args = 0
 712 0000 80B5     		push	{r7, lr}
 713              		.cfi_def_cfa_offset 8
 714              		.cfi_offset 7, -8
 715              		.cfi_offset 14, -4
 716 0002 82B0     		sub	sp, sp, #8
 717              		.cfi_def_cfa_offset 16
 718 0004 00AF     		add	r7, sp, #0
 719              		.cfi_def_cfa_register 7
 720 0006 3960     		str	r1, [r7]
 721 0008 1100     		movs	r1, r2
 722 000a FB1D     		adds	r3, r7, #7
 723 000c 021C     		adds	r2, r0, #0
 724 000e 1A70     		strb	r2, [r3]
 725 0010 BB1D     		adds	r3, r7, #6
 726 0012 0A1C     		adds	r2, r1, #0
 727 0014 1A70     		strb	r2, [r3]
 315:../driver/timer32.c **** 	
 316:../driver/timer32.c **** 	disable_timer32(timer_num);
 728              		.loc 2 316 0
 729 0016 FB1D     		adds	r3, r7, #7
 730 0018 1B78     		ldrb	r3, [r3]
 731 001a 1800     		movs	r0, r3
 732 001c FFF7FEFF 		bl	disable_timer32
 317:../driver/timer32.c **** 	if (timer_num == 1)
 733              		.loc 2 317 0
 734 0020 FB1D     		adds	r3, r7, #7
 735 0022 1B78     		ldrb	r3, [r3]
 736 0024 012B     		cmp	r3, #1
 737 0026 00D0     		beq	.LCB601
 738 0028 81E0     		b	.L46	@long jump
 739              	.LCB601:
 318:../driver/timer32.c **** 	{
 319:../driver/timer32.c **** 	    /* Some of the I/O pins need to be clearfully planned if
 320:../driver/timer32.c **** 	    you use below module because JTAG and TIMER CAP/MAT pins are muxed. */
 321:../driver/timer32.c **** 	    LPC_SYSCON->SYSAHBCLKCTRL |= (1<<10);
 740              		.loc 2 321 0
 741 002a 7649     		ldr	r1, .L56
 742 002c 754A     		ldr	r2, .L56
 743 002e 8023     		movs	r3, #128
 744 0030 D358     		ldr	r3, [r2, r3]
 745 0032 8022     		movs	r2, #128
 746 0034 D200     		lsls	r2, r2, #3
 747 0036 1343     		orrs	r3, r2
 748 0038 8022     		movs	r2, #128
 749 003a 8B50     		str	r3, [r1, r2]
 322:../driver/timer32.c **** 
 323:../driver/timer32.c **** 		/* Setup the external match register */
 324:../driver/timer32.c **** 		LPC_TMR32B1->EMR = (1<<EMC3)|(1<<EMC2)|(2<<EMC1)|(1<<EMC0)|(1<<3)|(match_enable);
 750              		.loc 2 324 0
 751 003c 724B     		ldr	r3, .L56+4
 752 003e BA1D     		adds	r2, r7, #6
 753 0040 1278     		ldrb	r2, [r2]
 754 0042 B321     		movs	r1, #179
 755 0044 C900     		lsls	r1, r1, #3
 756 0046 0A43     		orrs	r2, r1
 757 0048 DA63     		str	r2, [r3, #60]
 325:../driver/timer32.c **** 
 326:../driver/timer32.c **** 		/* Setup the outputs */
 327:../driver/timer32.c **** 		/* If match0 is enabled, set the output */
 328:../driver/timer32.c **** 		if (match_enable & 0x01)
 758              		.loc 2 328 0
 759 004a BB1D     		adds	r3, r7, #6
 760 004c 1B78     		ldrb	r3, [r3]
 761 004e 0122     		movs	r2, #1
 762 0050 1340     		ands	r3, r2
 763 0052 0BD0     		beq	.L47
 329:../driver/timer32.c **** 		{
 330:../driver/timer32.c **** 		  	LPC_IOCON->R_PIO1_1  &= ~0x07;
 764              		.loc 2 330 0
 765 0054 6D4B     		ldr	r3, .L56+8
 766 0056 6D4A     		ldr	r2, .L56+8
 767 0058 D26F     		ldr	r2, [r2, #124]
 768 005a 0721     		movs	r1, #7
 769 005c 8A43     		bics	r2, r1
 770 005e DA67     		str	r2, [r3, #124]
 331:../driver/timer32.c ****   			LPC_IOCON->R_PIO1_1  |= 0x03;		/* Timer1_32 MAT0 */
 771              		.loc 2 331 0
 772 0060 6A4B     		ldr	r3, .L56+8
 773 0062 6A4A     		ldr	r2, .L56+8
 774 0064 D26F     		ldr	r2, [r2, #124]
 775 0066 0321     		movs	r1, #3
 776 0068 0A43     		orrs	r2, r1
 777 006a DA67     		str	r2, [r3, #124]
 778              	.L47:
 332:../driver/timer32.c **** 		}
 333:../driver/timer32.c **** 		/* If match1 is enabled, set the output */
 334:../driver/timer32.c **** 		if (match_enable & 0x02)
 779              		.loc 2 334 0
 780 006c BB1D     		adds	r3, r7, #6
 781 006e 1B78     		ldrb	r3, [r3]
 782 0070 0222     		movs	r2, #2
 783 0072 1340     		ands	r3, r2
 784 0074 0FD0     		beq	.L48
 335:../driver/timer32.c **** 		{
 336:../driver/timer32.c **** 		  LPC_IOCON->R_PIO1_2 &= ~0x07;
 785              		.loc 2 336 0
 786 0076 6549     		ldr	r1, .L56+8
 787 0078 644A     		ldr	r2, .L56+8
 788 007a 8023     		movs	r3, #128
 789 007c D358     		ldr	r3, [r2, r3]
 790 007e 0722     		movs	r2, #7
 791 0080 9343     		bics	r3, r2
 792 0082 8022     		movs	r2, #128
 793 0084 8B50     		str	r3, [r1, r2]
 337:../driver/timer32.c **** 		  LPC_IOCON->R_PIO1_2 |= 0x03;		/* Timer1_32 MAT1 */
 794              		.loc 2 337 0
 795 0086 6149     		ldr	r1, .L56+8
 796 0088 604A     		ldr	r2, .L56+8
 797 008a 8023     		movs	r3, #128
 798 008c D358     		ldr	r3, [r2, r3]
 799 008e 0322     		movs	r2, #3
 800 0090 1343     		orrs	r3, r2
 801 0092 8022     		movs	r2, #128
 802 0094 8B50     		str	r3, [r1, r2]
 803              	.L48:
 338:../driver/timer32.c **** 		}
 339:../driver/timer32.c **** 		/* If match2 is enabled, set the output */
 340:../driver/timer32.c **** 		if (match_enable & 0x04)
 804              		.loc 2 340 0
 805 0096 BB1D     		adds	r3, r7, #6
 806 0098 1B78     		ldrb	r3, [r3]
 807 009a 0422     		movs	r2, #4
 808 009c 1340     		ands	r3, r2
 809 009e 0FD0     		beq	.L49
 341:../driver/timer32.c **** 		{
 342:../driver/timer32.c **** 		  LPC_IOCON->SWDIO_PIO1_3   &= ~0x07;
 810              		.loc 2 342 0
 811 00a0 5A49     		ldr	r1, .L56+8
 812 00a2 5A4A     		ldr	r2, .L56+8
 813 00a4 9023     		movs	r3, #144
 814 00a6 D358     		ldr	r3, [r2, r3]
 815 00a8 0722     		movs	r2, #7
 816 00aa 9343     		bics	r3, r2
 817 00ac 9022     		movs	r2, #144
 818 00ae 8B50     		str	r3, [r1, r2]
 343:../driver/timer32.c **** 		  LPC_IOCON->SWDIO_PIO1_3   |= 0x03;		/* Timer1_32 MAT2 */
 819              		.loc 2 343 0
 820 00b0 5649     		ldr	r1, .L56+8
 821 00b2 564A     		ldr	r2, .L56+8
 822 00b4 9023     		movs	r3, #144
 823 00b6 D358     		ldr	r3, [r2, r3]
 824 00b8 0322     		movs	r2, #3
 825 00ba 1343     		orrs	r3, r2
 826 00bc 9022     		movs	r2, #144
 827 00be 8B50     		str	r3, [r1, r2]
 828              	.L49:
 344:../driver/timer32.c **** 		}
 345:../driver/timer32.c **** 		/* If match3 is enabled, set the output */
 346:../driver/timer32.c **** 		if (match_enable & 0x08)
 829              		.loc 2 346 0
 830 00c0 BB1D     		adds	r3, r7, #6
 831 00c2 1B78     		ldrb	r3, [r3]
 832 00c4 0822     		movs	r2, #8
 833 00c6 1340     		ands	r3, r2
 834 00c8 0FD0     		beq	.L50
 347:../driver/timer32.c **** 		{
 348:../driver/timer32.c **** 		  LPC_IOCON->PIO1_4           &= ~0x07;
 835              		.loc 2 348 0
 836 00ca 5049     		ldr	r1, .L56+8
 837 00cc 4F4A     		ldr	r2, .L56+8
 838 00ce 9423     		movs	r3, #148
 839 00d0 D358     		ldr	r3, [r2, r3]
 840 00d2 0722     		movs	r2, #7
 841 00d4 9343     		bics	r3, r2
 842 00d6 9422     		movs	r2, #148
 843 00d8 8B50     		str	r3, [r1, r2]
 349:../driver/timer32.c **** 		  LPC_IOCON->PIO1_4           |= 0x02;		/* Timer1_32 MAT3 */
 844              		.loc 2 349 0
 845 00da 4C49     		ldr	r1, .L56+8
 846 00dc 4B4A     		ldr	r2, .L56+8
 847 00de 9423     		movs	r3, #148
 848 00e0 D358     		ldr	r3, [r2, r3]
 849 00e2 0222     		movs	r2, #2
 850 00e4 1343     		orrs	r3, r2
 851 00e6 9422     		movs	r2, #148
 852 00e8 8B50     		str	r3, [r1, r2]
 853              	.L50:
 350:../driver/timer32.c **** 		}
 351:../driver/timer32.c **** 
 352:../driver/timer32.c **** //#ifdef __JTAG_DISABLED
 353:../driver/timer32.c **** //	  PIO1_0_JTAG_TMS  &= ~0x07;	/*  Timer1_32 I/O config */
 354:../driver/timer32.c **** //	  PIO1_0_JTAG_TMS  |= 0x03;		/* Timer1_32 CAP0 */
 355:../driver/timer32.c **** //#endif
 356:../driver/timer32.c **** 
 357:../driver/timer32.c **** 		/* Enable the selected PWMs and enable Match3 */
 358:../driver/timer32.c **** 		LPC_TMR32B1->PWMC = (1<<3)|(match_enable);
 854              		.loc 2 358 0
 855 00ea 474B     		ldr	r3, .L56+4
 856 00ec BA1D     		adds	r2, r7, #6
 857 00ee 1278     		ldrb	r2, [r2]
 858 00f0 0821     		movs	r1, #8
 859 00f2 0A43     		orrs	r2, r1
 860 00f4 D2B2     		uxtb	r2, r2
 861 00f6 5A67     		str	r2, [r3, #116]
 359:../driver/timer32.c ****  
 360:../driver/timer32.c **** 		/* Setup the match registers */
 361:../driver/timer32.c **** 		/* set the period value to a global variable */
 362:../driver/timer32.c **** 		timer32_1_period = period;
 862              		.loc 2 362 0
 863 00f8 454B     		ldr	r3, .L56+12
 864 00fa 3A68     		ldr	r2, [r7]
 865 00fc 1A60     		str	r2, [r3]
 363:../driver/timer32.c **** 		LPC_TMR32B1->MR3 = timer32_1_period;
 866              		.loc 2 363 0
 867 00fe 424A     		ldr	r2, .L56+4
 868 0100 434B     		ldr	r3, .L56+12
 869 0102 1B68     		ldr	r3, [r3]
 870 0104 5362     		str	r3, [r2, #36]
 364:../driver/timer32.c **** 		LPC_TMR32B1->MR0	= timer32_1_period/2;
 871              		.loc 2 364 0
 872 0106 404A     		ldr	r2, .L56+4
 873 0108 414B     		ldr	r3, .L56+12
 874 010a 1B68     		ldr	r3, [r3]
 875 010c 5B08     		lsrs	r3, r3, #1
 876 010e 9361     		str	r3, [r2, #24]
 365:../driver/timer32.c **** 		LPC_TMR32B1->MR1	= timer32_1_period/2;
 877              		.loc 2 365 0
 878 0110 3D4A     		ldr	r2, .L56+4
 879 0112 3F4B     		ldr	r3, .L56+12
 880 0114 1B68     		ldr	r3, [r3]
 881 0116 5B08     		lsrs	r3, r3, #1
 882 0118 D361     		str	r3, [r2, #28]
 366:../driver/timer32.c **** 		LPC_TMR32B1->MR2	= timer32_1_period/2;
 883              		.loc 2 366 0
 884 011a 3B4A     		ldr	r2, .L56+4
 885 011c 3C4B     		ldr	r3, .L56+12
 886 011e 1B68     		ldr	r3, [r3]
 887 0120 5B08     		lsrs	r3, r3, #1
 888 0122 1362     		str	r3, [r2, #32]
 367:../driver/timer32.c **** 		
 368:../driver/timer32.c **** 		/* */
 369:../driver/timer32.c ****     	LPC_TMR32B1->MCR = 1<<10;				/* Reset on MR3 */
 889              		.loc 2 369 0
 890 0124 384B     		ldr	r3, .L56+4
 891 0126 8022     		movs	r2, #128
 892 0128 D200     		lsls	r2, r2, #3
 893 012a 5A61     		str	r2, [r3, #20]
 370:../driver/timer32.c **** 	}
 371:../driver/timer32.c **** 	else
 372:../driver/timer32.c **** 	{
 373:../driver/timer32.c **** 	    /* Some of the I/O pins need to be clearfully planned if
 374:../driver/timer32.c **** 	    you use below module because JTAG and TIMER CAP/MAT pins are muxed. */
 375:../driver/timer32.c **** 	    LPC_SYSCON->SYSAHBCLKCTRL |= (1<<9);
 376:../driver/timer32.c **** 
 377:../driver/timer32.c **** 		/* Setup the external match register */
 378:../driver/timer32.c **** 		LPC_TMR32B0->EMR = (1<<EMC3)|(2<<EMC2)|(1<<EMC1)|(1<<EMC0)|(1<<3)|(match_enable);
 379:../driver/timer32.c ****  
 380:../driver/timer32.c **** 		/* Setup the outputs */
 381:../driver/timer32.c **** 		/* If match0 is enabled, set the output */
 382:../driver/timer32.c **** 		if (match_enable & 0x01)
 383:../driver/timer32.c **** 		{
 384:../driver/timer32.c **** //	 		LPC_IOCON->PIO1_6           &= ~0x07;
 385:../driver/timer32.c **** //		  	LPC_IOCON->PIO1_6           |= 0x02;		/* Timer0_32 MAT0 */
 386:../driver/timer32.c **** 		}
 387:../driver/timer32.c **** 		/* If match1 is enabled, set the output */
 388:../driver/timer32.c **** 		if (match_enable & 0x02)
 389:../driver/timer32.c **** 		{
 390:../driver/timer32.c **** 			LPC_IOCON-> PIO1_7           &= ~0x07;
 391:../driver/timer32.c **** 		  	LPC_IOCON->PIO1_7           |= 0x02;		/* Timer0_32 MAT1 */
 392:../driver/timer32.c **** 		}
 393:../driver/timer32.c **** 		/* If match2 is enabled, set the output */
 394:../driver/timer32.c **** 		if (match_enable & 0x04)
 395:../driver/timer32.c **** 		{
 396:../driver/timer32.c **** 		  LPC_IOCON->PIO0_1           &= ~0x07;	
 397:../driver/timer32.c **** 		  LPC_IOCON->PIO0_1           |= 0x02;		/* Timer0_32 MAT2 */
 398:../driver/timer32.c **** 		}
 399:../driver/timer32.c **** 		/* If match3 is enabled, set the output */
 400:../driver/timer32.c **** 		if (match_enable & 0x08)
 401:../driver/timer32.c **** 		{
 402:../driver/timer32.c **** 		  LPC_IOCON->R_PIO0_11 &= ~0x07;
 403:../driver/timer32.c **** 		  LPC_IOCON->R_PIO0_11 |= 0x03;		/* Timer0_32 MAT3 */
 404:../driver/timer32.c **** 		}
 405:../driver/timer32.c **** 
 406:../driver/timer32.c **** 		/* Enable the selected PWMs and enable Match3 */
 407:../driver/timer32.c **** 		LPC_TMR32B0->PWMC = (1<<3)|(match_enable);
 408:../driver/timer32.c **** 
 409:../driver/timer32.c **** 		/* Setup the match registers */
 410:../driver/timer32.c **** 		/* set the period value to a global variable */
 411:../driver/timer32.c **** 		timer32_0_period = period;
 412:../driver/timer32.c **** 		LPC_TMR32B0->MR3 = timer32_0_period;
 413:../driver/timer32.c **** 		LPC_TMR32B0->MR0	= timer32_0_period;	///2;
 414:../driver/timer32.c **** 		LPC_TMR32B0->MR1	= timer32_0_period/2;
 415:../driver/timer32.c **** 		LPC_TMR32B0->MR2	= timer32_0_period/2;
 416:../driver/timer32.c **** 
 417:../driver/timer32.c ****     	LPC_TMR32B0->MCR = 1<<10;				/* Reset on MR3 */
 418:../driver/timer32.c **** 	}
 419:../driver/timer32.c **** 
 420:../driver/timer32.c **** 
 421:../driver/timer32.c **** }
 894              		.loc 2 421 0
 895 012c 66E0     		b	.L55
 896              	.L46:
 375:../driver/timer32.c **** 
 897              		.loc 2 375 0
 898 012e 3549     		ldr	r1, .L56
 899 0130 344A     		ldr	r2, .L56
 900 0132 8023     		movs	r3, #128
 901 0134 D358     		ldr	r3, [r2, r3]
 902 0136 8022     		movs	r2, #128
 903 0138 9200     		lsls	r2, r2, #2
 904 013a 1343     		orrs	r3, r2
 905 013c 8022     		movs	r2, #128
 906 013e 8B50     		str	r3, [r1, r2]
 378:../driver/timer32.c ****  
 907              		.loc 2 378 0
 908 0140 344B     		ldr	r3, .L56+16
 909 0142 BA1D     		adds	r2, r7, #6
 910 0144 1278     		ldrb	r2, [r2]
 911 0146 CB21     		movs	r1, #203
 912 0148 C900     		lsls	r1, r1, #3
 913 014a 0A43     		orrs	r2, r1
 914 014c DA63     		str	r2, [r3, #60]
 388:../driver/timer32.c **** 		{
 915              		.loc 2 388 0
 916 014e BB1D     		adds	r3, r7, #6
 917 0150 1B78     		ldrb	r3, [r3]
 918 0152 0222     		movs	r2, #2
 919 0154 1340     		ands	r3, r2
 920 0156 0FD0     		beq	.L52
 390:../driver/timer32.c **** 		  	LPC_IOCON->PIO1_7           |= 0x02;		/* Timer0_32 MAT1 */
 921              		.loc 2 390 0
 922 0158 2C49     		ldr	r1, .L56+8
 923 015a 2C4A     		ldr	r2, .L56+8
 924 015c A823     		movs	r3, #168
 925 015e D358     		ldr	r3, [r2, r3]
 926 0160 0722     		movs	r2, #7
 927 0162 9343     		bics	r3, r2
 928 0164 A822     		movs	r2, #168
 929 0166 8B50     		str	r3, [r1, r2]
 391:../driver/timer32.c **** 		}
 930              		.loc 2 391 0
 931 0168 2849     		ldr	r1, .L56+8
 932 016a 284A     		ldr	r2, .L56+8
 933 016c A823     		movs	r3, #168
 934 016e D358     		ldr	r3, [r2, r3]
 935 0170 0222     		movs	r2, #2
 936 0172 1343     		orrs	r3, r2
 937 0174 A822     		movs	r2, #168
 938 0176 8B50     		str	r3, [r1, r2]
 939              	.L52:
 394:../driver/timer32.c **** 		{
 940              		.loc 2 394 0
 941 0178 BB1D     		adds	r3, r7, #6
 942 017a 1B78     		ldrb	r3, [r3]
 943 017c 0422     		movs	r2, #4
 944 017e 1340     		ands	r3, r2
 945 0180 0BD0     		beq	.L53
 396:../driver/timer32.c **** 		  LPC_IOCON->PIO0_1           |= 0x02;		/* Timer0_32 MAT2 */
 946              		.loc 2 396 0
 947 0182 224B     		ldr	r3, .L56+8
 948 0184 214A     		ldr	r2, .L56+8
 949 0186 1269     		ldr	r2, [r2, #16]
 950 0188 0721     		movs	r1, #7
 951 018a 8A43     		bics	r2, r1
 952 018c 1A61     		str	r2, [r3, #16]
 397:../driver/timer32.c **** 		}
 953              		.loc 2 397 0
 954 018e 1F4B     		ldr	r3, .L56+8
 955 0190 1E4A     		ldr	r2, .L56+8
 956 0192 1269     		ldr	r2, [r2, #16]
 957 0194 0221     		movs	r1, #2
 958 0196 0A43     		orrs	r2, r1
 959 0198 1A61     		str	r2, [r3, #16]
 960              	.L53:
 400:../driver/timer32.c **** 		{
 961              		.loc 2 400 0
 962 019a BB1D     		adds	r3, r7, #6
 963 019c 1B78     		ldrb	r3, [r3]
 964 019e 0822     		movs	r2, #8
 965 01a0 1340     		ands	r3, r2
 966 01a2 0BD0     		beq	.L54
 402:../driver/timer32.c **** 		  LPC_IOCON->R_PIO0_11 |= 0x03;		/* Timer0_32 MAT3 */
 967              		.loc 2 402 0
 968 01a4 194B     		ldr	r3, .L56+8
 969 01a6 194A     		ldr	r2, .L56+8
 970 01a8 526F     		ldr	r2, [r2, #116]
 971 01aa 0721     		movs	r1, #7
 972 01ac 8A43     		bics	r2, r1
 973 01ae 5A67     		str	r2, [r3, #116]
 403:../driver/timer32.c **** 		}
 974              		.loc 2 403 0
 975 01b0 164B     		ldr	r3, .L56+8
 976 01b2 164A     		ldr	r2, .L56+8
 977 01b4 526F     		ldr	r2, [r2, #116]
 978 01b6 0321     		movs	r1, #3
 979 01b8 0A43     		orrs	r2, r1
 980 01ba 5A67     		str	r2, [r3, #116]
 981              	.L54:
 407:../driver/timer32.c **** 
 982              		.loc 2 407 0
 983 01bc 154B     		ldr	r3, .L56+16
 984 01be BA1D     		adds	r2, r7, #6
 985 01c0 1278     		ldrb	r2, [r2]
 986 01c2 0821     		movs	r1, #8
 987 01c4 0A43     		orrs	r2, r1
 988 01c6 D2B2     		uxtb	r2, r2
 989 01c8 5A67     		str	r2, [r3, #116]
 411:../driver/timer32.c **** 		LPC_TMR32B0->MR3 = timer32_0_period;
 990              		.loc 2 411 0
 991 01ca 134B     		ldr	r3, .L56+20
 992 01cc 3A68     		ldr	r2, [r7]
 993 01ce 1A60     		str	r2, [r3]
 412:../driver/timer32.c **** 		LPC_TMR32B0->MR0	= timer32_0_period;	///2;
 994              		.loc 2 412 0
 995 01d0 104A     		ldr	r2, .L56+16
 996 01d2 114B     		ldr	r3, .L56+20
 997 01d4 1B68     		ldr	r3, [r3]
 998 01d6 5362     		str	r3, [r2, #36]
 413:../driver/timer32.c **** 		LPC_TMR32B0->MR1	= timer32_0_period/2;
 999              		.loc 2 413 0
 1000 01d8 0E4A     		ldr	r2, .L56+16
 1001 01da 0F4B     		ldr	r3, .L56+20
 1002 01dc 1B68     		ldr	r3, [r3]
 1003 01de 9361     		str	r3, [r2, #24]
 414:../driver/timer32.c **** 		LPC_TMR32B0->MR2	= timer32_0_period/2;
 1004              		.loc 2 414 0
 1005 01e0 0C4A     		ldr	r2, .L56+16
 1006 01e2 0D4B     		ldr	r3, .L56+20
 1007 01e4 1B68     		ldr	r3, [r3]
 1008 01e6 5B08     		lsrs	r3, r3, #1
 1009 01e8 D361     		str	r3, [r2, #28]
 415:../driver/timer32.c **** 
 1010              		.loc 2 415 0
 1011 01ea 0A4A     		ldr	r2, .L56+16
 1012 01ec 0A4B     		ldr	r3, .L56+20
 1013 01ee 1B68     		ldr	r3, [r3]
 1014 01f0 5B08     		lsrs	r3, r3, #1
 1015 01f2 1362     		str	r3, [r2, #32]
 417:../driver/timer32.c **** 	}
 1016              		.loc 2 417 0
 1017 01f4 074B     		ldr	r3, .L56+16
 1018 01f6 8022     		movs	r2, #128
 1019 01f8 D200     		lsls	r2, r2, #3
 1020 01fa 5A61     		str	r2, [r3, #20]
 1021              	.L55:
 1022              		.loc 2 421 0
 1023 01fc C046     		nop
 1024 01fe BD46     		mov	sp, r7
 1025 0200 02B0     		add	sp, sp, #8
 1026              		@ sp needed
 1027 0202 80BD     		pop	{r7, pc}
 1028              	.L57:
 1029              		.align	2
 1030              	.L56:
 1031 0204 00800440 		.word	1074036736
 1032 0208 00800140 		.word	1073840128
 1033 020c 00400440 		.word	1074020352
 1034 0210 00000000 		.word	timer32_1_period
 1035 0214 00400140 		.word	1073823744
 1036 0218 00000000 		.word	timer32_0_period
 1037              		.cfi_endproc
 1038              	.LFE26:
 1040              		.section	.text.setMatch_timer32PWM,"ax",%progbits
 1041              		.align	2
 1042              		.global	setMatch_timer32PWM
 1043              		.code	16
 1044              		.thumb_func
 1046              	setMatch_timer32PWM:
 1047              	.LFB27:
 422:../driver/timer32.c **** /******************************************************************************
 423:../driver/timer32.c **** ** Function name:		pwm32_setMatch
 424:../driver/timer32.c **** **
 425:../driver/timer32.c **** ** Descriptions:		Set the pwm32 match values
 426:../driver/timer32.c **** **
 427:../driver/timer32.c **** ** parameters:			timer number, match numner and the value
 428:../driver/timer32.c **** **
 429:../driver/timer32.c **** ** Returned value:		None
 430:../driver/timer32.c **** ** 
 431:../driver/timer32.c **** ******************************************************************************/
 432:../driver/timer32.c **** void setMatch_timer32PWM (uint8_t timer_num, uint8_t match_nr, uint32_t value)
 433:../driver/timer32.c **** {
 1048              		.loc 2 433 0
 1049              		.cfi_startproc
 1050              		@ args = 0, pretend = 0, frame = 8
 1051              		@ frame_needed = 1, uses_anonymous_args = 0
 1052 0000 80B5     		push	{r7, lr}
 1053              		.cfi_def_cfa_offset 8
 1054              		.cfi_offset 7, -8
 1055              		.cfi_offset 14, -4
 1056 0002 82B0     		sub	sp, sp, #8
 1057              		.cfi_def_cfa_offset 16
 1058 0004 00AF     		add	r7, sp, #0
 1059              		.cfi_def_cfa_register 7
 1060 0006 3A60     		str	r2, [r7]
 1061 0008 FB1D     		adds	r3, r7, #7
 1062 000a 021C     		adds	r2, r0, #0
 1063 000c 1A70     		strb	r2, [r3]
 1064 000e BB1D     		adds	r3, r7, #6
 1065 0010 0A1C     		adds	r2, r1, #0
 1066 0012 1A70     		strb	r2, [r3]
 434:../driver/timer32.c **** 	if (timer_num)
 1067              		.loc 2 434 0
 1068 0014 FB1D     		adds	r3, r7, #7
 1069 0016 1B78     		ldrb	r3, [r3]
 1070 0018 002B     		cmp	r3, #0
 1071 001a 1CD0     		beq	.L59
 435:../driver/timer32.c **** 	{
 436:../driver/timer32.c **** 		switch (match_nr)
 1072              		.loc 2 436 0
 1073 001c BB1D     		adds	r3, r7, #6
 1074 001e 1B78     		ldrb	r3, [r3]
 1075 0020 012B     		cmp	r3, #1
 1076 0022 0CD0     		beq	.L61
 1077 0024 02DC     		bgt	.L62
 1078 0026 002B     		cmp	r3, #0
 1079 0028 05D0     		beq	.L63
 437:../driver/timer32.c **** 		{
 438:../driver/timer32.c **** 			case 0:
 439:../driver/timer32.c **** 				LPC_TMR32B1->MR0 = value;
 440:../driver/timer32.c **** 				break;
 441:../driver/timer32.c **** 			case 1: 
 442:../driver/timer32.c **** 				LPC_TMR32B1->MR1 = value;
 443:../driver/timer32.c **** 				break;
 444:../driver/timer32.c **** 			case 2:
 445:../driver/timer32.c **** 				LPC_TMR32B1->MR2 = value;
 446:../driver/timer32.c **** 				break;
 447:../driver/timer32.c **** 			case 3: 
 448:../driver/timer32.c **** 				LPC_TMR32B1->MR3 = value;
 449:../driver/timer32.c **** 				break;
 450:../driver/timer32.c **** 			default:
 451:../driver/timer32.c **** 				break;
 1080              		.loc 2 451 0
 1081 002a 31E0     		b	.L67
 1082              	.L62:
 436:../driver/timer32.c **** 		{
 1083              		.loc 2 436 0
 1084 002c 022B     		cmp	r3, #2
 1085 002e 0AD0     		beq	.L64
 1086 0030 032B     		cmp	r3, #3
 1087 0032 0CD0     		beq	.L65
 1088              		.loc 2 451 0
 1089 0034 2CE0     		b	.L67
 1090              	.L63:
 439:../driver/timer32.c **** 				break;
 1091              		.loc 2 439 0
 1092 0036 184B     		ldr	r3, .L74
 1093 0038 3A68     		ldr	r2, [r7]
 1094 003a 9A61     		str	r2, [r3, #24]
 440:../driver/timer32.c **** 			case 1: 
 1095              		.loc 2 440 0
 1096 003c 28E0     		b	.L67
 1097              	.L61:
 442:../driver/timer32.c **** 				break;
 1098              		.loc 2 442 0
 1099 003e 164B     		ldr	r3, .L74
 1100 0040 3A68     		ldr	r2, [r7]
 1101 0042 DA61     		str	r2, [r3, #28]
 443:../driver/timer32.c **** 			case 2:
 1102              		.loc 2 443 0
 1103 0044 24E0     		b	.L67
 1104              	.L64:
 445:../driver/timer32.c **** 				break;
 1105              		.loc 2 445 0
 1106 0046 144B     		ldr	r3, .L74
 1107 0048 3A68     		ldr	r2, [r7]
 1108 004a 1A62     		str	r2, [r3, #32]
 446:../driver/timer32.c **** 			case 3: 
 1109              		.loc 2 446 0
 1110 004c 20E0     		b	.L67
 1111              	.L65:
 448:../driver/timer32.c **** 				break;
 1112              		.loc 2 448 0
 1113 004e 124B     		ldr	r3, .L74
 1114 0050 3A68     		ldr	r2, [r7]
 1115 0052 5A62     		str	r2, [r3, #36]
 449:../driver/timer32.c **** 			default:
 1116              		.loc 2 449 0
 1117 0054 1CE0     		b	.L67
 1118              	.L59:
 452:../driver/timer32.c **** 		}	
 453:../driver/timer32.c **** 
 454:../driver/timer32.c **** 	}
 455:../driver/timer32.c **** 	else 
 456:../driver/timer32.c **** 	{
 457:../driver/timer32.c **** 		switch (match_nr)
 1119              		.loc 2 457 0
 1120 0056 BB1D     		adds	r3, r7, #6
 1121 0058 1B78     		ldrb	r3, [r3]
 1122 005a 012B     		cmp	r3, #1
 1123 005c 0CD0     		beq	.L69
 1124 005e 02DC     		bgt	.L70
 1125 0060 002B     		cmp	r3, #0
 1126 0062 05D0     		beq	.L71
 458:../driver/timer32.c **** 		{
 459:../driver/timer32.c **** 			case 0:
 460:../driver/timer32.c **** 				LPC_TMR32B0->MR0 = value;
 461:../driver/timer32.c **** 				break;
 462:../driver/timer32.c **** 			case 1: 
 463:../driver/timer32.c **** 				LPC_TMR32B0->MR1 = value;
 464:../driver/timer32.c **** 				break;
 465:../driver/timer32.c **** 			case 2:
 466:../driver/timer32.c **** 				LPC_TMR32B0->MR2 = value;
 467:../driver/timer32.c **** 				break;
 468:../driver/timer32.c **** 			case 3: 
 469:../driver/timer32.c **** 				LPC_TMR32B0->MR3 = value;
 470:../driver/timer32.c **** 				break;
 471:../driver/timer32.c **** 			default:
 472:../driver/timer32.c **** 				break;
 1127              		.loc 2 472 0
 1128 0064 14E0     		b	.L67
 1129              	.L70:
 457:../driver/timer32.c **** 		{
 1130              		.loc 2 457 0
 1131 0066 022B     		cmp	r3, #2
 1132 0068 0AD0     		beq	.L72
 1133 006a 032B     		cmp	r3, #3
 1134 006c 0CD0     		beq	.L73
 1135              		.loc 2 472 0
 1136 006e 0FE0     		b	.L67
 1137              	.L71:
 460:../driver/timer32.c **** 				break;
 1138              		.loc 2 460 0
 1139 0070 0A4B     		ldr	r3, .L74+4
 1140 0072 3A68     		ldr	r2, [r7]
 1141 0074 9A61     		str	r2, [r3, #24]
 461:../driver/timer32.c **** 			case 1: 
 1142              		.loc 2 461 0
 1143 0076 0BE0     		b	.L67
 1144              	.L69:
 463:../driver/timer32.c **** 				break;
 1145              		.loc 2 463 0
 1146 0078 084B     		ldr	r3, .L74+4
 1147 007a 3A68     		ldr	r2, [r7]
 1148 007c DA61     		str	r2, [r3, #28]
 464:../driver/timer32.c **** 			case 2:
 1149              		.loc 2 464 0
 1150 007e 07E0     		b	.L67
 1151              	.L72:
 466:../driver/timer32.c **** 				break;
 1152              		.loc 2 466 0
 1153 0080 064B     		ldr	r3, .L74+4
 1154 0082 3A68     		ldr	r2, [r7]
 1155 0084 1A62     		str	r2, [r3, #32]
 467:../driver/timer32.c **** 			case 3: 
 1156              		.loc 2 467 0
 1157 0086 03E0     		b	.L67
 1158              	.L73:
 469:../driver/timer32.c **** 				break;
 1159              		.loc 2 469 0
 1160 0088 044B     		ldr	r3, .L74+4
 1161 008a 3A68     		ldr	r2, [r7]
 1162 008c 5A62     		str	r2, [r3, #36]
 470:../driver/timer32.c **** 			default:
 1163              		.loc 2 470 0
 1164 008e C046     		nop
 1165              	.L67:
 473:../driver/timer32.c **** 		}	
 474:../driver/timer32.c **** 	}
 475:../driver/timer32.c **** 
 476:../driver/timer32.c **** }
 1166              		.loc 2 476 0
 1167 0090 C046     		nop
 1168 0092 BD46     		mov	sp, r7
 1169 0094 02B0     		add	sp, sp, #8
 1170              		@ sp needed
 1171 0096 80BD     		pop	{r7, pc}
 1172              	.L75:
 1173              		.align	2
 1174              	.L74:
 1175 0098 00800140 		.word	1073840128
 1176 009c 00400140 		.word	1073823744
 1177              		.cfi_endproc
 1178              	.LFE27:
 1180              		.text
 1181              	.Letext0:
 1182              		.file 3 "/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/LPC11xx.h"
 1183              		.file 4 "/usr/local/lpcxpresso_8.2.2_650/lpcxpresso/tools/redlib/include/stdint.h"
 1184              		.file 5 "/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/config/system_LPC11xx.h"
DEFINED SYMBOLS
                            *ABS*:00000000 timer32.c
     /tmp/ccKyZmQj.s:20     .text.NVIC_EnableIRQ:00000000 $t
     /tmp/ccKyZmQj.s:24     .text.NVIC_EnableIRQ:00000000 NVIC_EnableIRQ
     /tmp/ccKyZmQj.s:62     .text.NVIC_EnableIRQ:00000028 $d
     /tmp/ccKyZmQj.s:71     .bss:00000000 timer32_0_period
     /tmp/ccKyZmQj.s:68     .bss:00000000 $d
     /tmp/ccKyZmQj.s:77     .bss:00000004 timer32_0_counter
     /tmp/ccKyZmQj.s:83     .bss:00000008 timer32_0_capture
     /tmp/ccKyZmQj.s:89     .bss:0000000c timer32_1_period
     /tmp/ccKyZmQj.s:93     .text.delay32Ms:00000000 $t
     /tmp/ccKyZmQj.s:98     .text.delay32Ms:00000000 delay32Ms
     /tmp/ccKyZmQj.s:244    .text.delay32Ms:000000d8 $d
     /tmp/ccKyZmQj.s:251    .text.TIMER32_0_IRQHandler:00000000 $t
     /tmp/ccKyZmQj.s:256    .text.TIMER32_0_IRQHandler:00000000 TIMER32_0_IRQHandler
     /tmp/ccKyZmQj.s:312    .text.TIMER32_0_IRQHandler:00000040 $d
     /tmp/ccKyZmQj.s:319    .text.enable_timer32:00000000 $t
     /tmp/ccKyZmQj.s:324    .text.enable_timer32:00000000 enable_timer32
     /tmp/ccKyZmQj.s:368    .text.enable_timer32:0000002c $d
     /tmp/ccKyZmQj.s:374    .text.disable_timer32:00000000 $t
     /tmp/ccKyZmQj.s:379    .text.disable_timer32:00000000 disable_timer32
     /tmp/ccKyZmQj.s:423    .text.disable_timer32:0000002c $d
     /tmp/ccKyZmQj.s:429    .text.reset_timer32:00000000 $t
     /tmp/ccKyZmQj.s:434    .text.reset_timer32:00000000 reset_timer32
     /tmp/ccKyZmQj.s:496    .text.reset_timer32:00000048 $d
     /tmp/ccKyZmQj.s:502    .text.init_timer32:00000000 $t
     /tmp/ccKyZmQj.s:507    .text.init_timer32:00000000 init_timer32
     /tmp/ccKyZmQj.s:691    .text.init_timer32:0000011c $d
     /tmp/ccKyZmQj.s:701    .text.init_timer32PWM:00000000 $t
     /tmp/ccKyZmQj.s:706    .text.init_timer32PWM:00000000 init_timer32PWM
     /tmp/ccKyZmQj.s:1031   .text.init_timer32PWM:00000204 $d
     /tmp/ccKyZmQj.s:1041   .text.setMatch_timer32PWM:00000000 $t
     /tmp/ccKyZmQj.s:1046   .text.setMatch_timer32PWM:00000000 setMatch_timer32PWM
     /tmp/ccKyZmQj.s:1175   .text.setMatch_timer32PWM:00000098 $d
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
                           .group:00000000 wm4.timer32.h.22.d3f9a365e27a81b7ebd583960465985c

UNDEFINED SYMBOLS
__aeabi_uidiv
SystemCoreClock
