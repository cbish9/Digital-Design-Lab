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
  15              		.file	"gpio.c"
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
  28              		.section	.text.GPIOInit,"ax",%progbits
  29              		.align	2
  30              		.global	GPIOInit
  31              		.code	16
  32              		.thumb_func
  34              	GPIOInit:
  35              	.LFB20:
  36              		.file 1 "../driver/gpio.c"
   1:../driver/gpio.c **** /****************************************************************************
   2:../driver/gpio.c ****  *   $Id:: gpio.c 4785 2010-09-03 22:39:27Z nxp21346                        $
   3:../driver/gpio.c ****  *   Project: NXP LPC11xx GPIO example
   4:../driver/gpio.c ****  *
   5:../driver/gpio.c ****  *   Description:
   6:../driver/gpio.c ****  *     This file contains GPIO code example which include GPIO 
   7:../driver/gpio.c ****  *     initialization, GPIO interrupt handler, and related APIs for 
   8:../driver/gpio.c ****  *     GPIO access.
   9:../driver/gpio.c ****  *
  10:../driver/gpio.c ****  ****************************************************************************
  11:../driver/gpio.c ****  * Software that is described herein is for illustrative purposes only
  12:../driver/gpio.c ****  * which provides customers with programming information regarding the
  13:../driver/gpio.c ****  * products. This software is supplied "AS IS" without any warranties.
  14:../driver/gpio.c ****  * NXP Semiconductors assumes no responsibility or liability for the
  15:../driver/gpio.c ****  * use of the software, conveys no license or title under any patent,
  16:../driver/gpio.c ****  * copyright, or mask work right to the product. NXP Semiconductors
  17:../driver/gpio.c ****  * reserves the right to make changes in the software without
  18:../driver/gpio.c ****  * notification. NXP Semiconductors also make no representation or
  19:../driver/gpio.c ****  * warranty that such application will be suitable for the specified
  20:../driver/gpio.c ****  * use without further testing or modification.
  21:../driver/gpio.c **** ****************************************************************************/
  22:../driver/gpio.c **** #include "driver_config.h"
  23:../driver/gpio.c **** #if CONFIG_ENABLE_DRIVER_GPIO==1
  24:../driver/gpio.c **** #include "gpio.h"
  25:../driver/gpio.c **** 
  26:../driver/gpio.c **** #if CONFIG_GPIO_DEFAULT_PIOINT0_IRQHANDLER==1
  27:../driver/gpio.c **** volatile uint32_t gpio0_counter = 0;
  28:../driver/gpio.c **** volatile uint32_t p0_1_counter  = 0;
  29:../driver/gpio.c **** /*****************************************************************************
  30:../driver/gpio.c **** ** Function name:		PIOINT0_IRQHandler
  31:../driver/gpio.c **** **
  32:../driver/gpio.c **** ** Descriptions:		Use one GPIO pin(port0 pin1) as interrupt source
  33:../driver/gpio.c **** **
  34:../driver/gpio.c **** ** parameters:			None
  35:../driver/gpio.c **** ** Returned value:		None
  36:../driver/gpio.c **** ** 
  37:../driver/gpio.c **** *****************************************************************************/
  38:../driver/gpio.c **** void PIOINT0_IRQHandler(void)
  39:../driver/gpio.c **** {
  40:../driver/gpio.c ****   uint32_t regVal;
  41:../driver/gpio.c **** 
  42:../driver/gpio.c ****   gpio0_counter++;
  43:../driver/gpio.c ****   regVal = GPIOIntStatus( PORT0, 1 );
  44:../driver/gpio.c ****   if ( regVal )
  45:../driver/gpio.c ****   {
  46:../driver/gpio.c **** 	p0_1_counter++;
  47:../driver/gpio.c **** 	GPIOIntClear( PORT0, 1 );
  48:../driver/gpio.c ****   }		
  49:../driver/gpio.c ****   return;
  50:../driver/gpio.c **** }
  51:../driver/gpio.c **** #endif
  52:../driver/gpio.c **** 
  53:../driver/gpio.c **** #if CONFIG_GPIO_DEFAULT_PIOINT1_IRQHANDLER==1
  54:../driver/gpio.c **** volatile uint32_t gpio1_counter = 0;
  55:../driver/gpio.c **** volatile uint32_t p1_1_counter  = 0;
  56:../driver/gpio.c **** /*****************************************************************************
  57:../driver/gpio.c **** ** Function name:		PIOINT1_IRQHandler
  58:../driver/gpio.c **** **
  59:../driver/gpio.c **** ** Descriptions:		Use one GPIO pin(port1 pin1) as interrupt source
  60:../driver/gpio.c **** **
  61:../driver/gpio.c **** ** parameters:			None
  62:../driver/gpio.c **** ** Returned value:		None
  63:../driver/gpio.c **** ** 
  64:../driver/gpio.c **** *****************************************************************************/
  65:../driver/gpio.c **** void PIOINT1_IRQHandler(void)
  66:../driver/gpio.c **** {
  67:../driver/gpio.c ****   uint32_t regVal;
  68:../driver/gpio.c **** 
  69:../driver/gpio.c ****   gpio1_counter++;
  70:../driver/gpio.c ****   regVal = GPIOIntStatus( PORT1, 1 );
  71:../driver/gpio.c ****   if ( regVal )
  72:../driver/gpio.c ****   {
  73:../driver/gpio.c **** 	p1_1_counter++;
  74:../driver/gpio.c **** 	GPIOIntClear( PORT1, 1 );
  75:../driver/gpio.c ****   }		
  76:../driver/gpio.c ****   return;
  77:../driver/gpio.c **** }
  78:../driver/gpio.c **** #endif
  79:../driver/gpio.c **** 
  80:../driver/gpio.c **** #if CONFIG_GPIO_DEFAULT_PIOINT2_IRQHANDLER==1
  81:../driver/gpio.c **** volatile uint32_t gpio2_counter = 0;
  82:../driver/gpio.c **** volatile uint32_t p2_1_counter  = 0;
  83:../driver/gpio.c **** /*****************************************************************************
  84:../driver/gpio.c **** ** Function name:		PIOINT2_IRQHandler
  85:../driver/gpio.c **** **
  86:../driver/gpio.c **** ** Descriptions:		Use one GPIO pin(port2 pin1) as interrupt source
  87:../driver/gpio.c **** **
  88:../driver/gpio.c **** ** parameters:			None
  89:../driver/gpio.c **** ** Returned value:		None
  90:../driver/gpio.c **** ** 
  91:../driver/gpio.c **** *****************************************************************************/
  92:../driver/gpio.c **** void PIOINT2_IRQHandler(void)
  93:../driver/gpio.c **** {
  94:../driver/gpio.c ****   uint32_t regVal;
  95:../driver/gpio.c **** 
  96:../driver/gpio.c ****   gpio2_counter++;
  97:../driver/gpio.c ****   regVal = GPIOIntStatus( PORT2, 1 );
  98:../driver/gpio.c ****   if ( regVal )
  99:../driver/gpio.c ****   {
 100:../driver/gpio.c **** 	p2_1_counter++;
 101:../driver/gpio.c **** 	GPIOIntClear( PORT2, 1 );
 102:../driver/gpio.c ****   }		
 103:../driver/gpio.c ****   return;
 104:../driver/gpio.c **** }
 105:../driver/gpio.c **** #endif
 106:../driver/gpio.c **** 
 107:../driver/gpio.c **** #if CONFIG_GPIO_DEFAULT_PIOINT3_IRQHANDLER==1
 108:../driver/gpio.c **** volatile uint32_t gpio3_counter = 0;
 109:../driver/gpio.c **** volatile uint32_t p3_1_counter  = 0;
 110:../driver/gpio.c **** /*****************************************************************************
 111:../driver/gpio.c **** ** Function name:		PIOINT3_IRQHandler
 112:../driver/gpio.c **** **
 113:../driver/gpio.c **** ** Descriptions:		Use one GPIO pin(port3 pin1) as interrupt source
 114:../driver/gpio.c **** **
 115:../driver/gpio.c **** ** parameters:			None
 116:../driver/gpio.c **** ** Returned value:		None
 117:../driver/gpio.c **** ** 
 118:../driver/gpio.c **** *****************************************************************************/
 119:../driver/gpio.c **** void PIOINT3_IRQHandler(void)
 120:../driver/gpio.c **** {
 121:../driver/gpio.c ****   uint32_t regVal;
 122:../driver/gpio.c **** 
 123:../driver/gpio.c ****   gpio3_counter++;
 124:../driver/gpio.c ****   regVal = GPIOIntStatus( PORT3, 1 );
 125:../driver/gpio.c ****   if ( regVal )
 126:../driver/gpio.c ****   {
 127:../driver/gpio.c **** 	p3_1_counter++;
 128:../driver/gpio.c **** 	GPIOIntClear( PORT3, 1 );
 129:../driver/gpio.c ****   }		
 130:../driver/gpio.c ****   return;
 131:../driver/gpio.c **** }
 132:../driver/gpio.c **** #endif //#if CONFIG_GPIO_DEFAULT_PIOINT3_IRQHANDLER==1
 133:../driver/gpio.c **** 
 134:../driver/gpio.c **** 
 135:../driver/gpio.c **** /*****************************************************************************
 136:../driver/gpio.c **** ** Function name:		GPIOInit
 137:../driver/gpio.c **** **
 138:../driver/gpio.c **** ** Descriptions:		Initialize GPIO, install the
 139:../driver/gpio.c **** **						GPIO interrupt handler
 140:../driver/gpio.c **** **
 141:../driver/gpio.c **** ** parameters:			None
 142:../driver/gpio.c **** ** Returned value:		true or false, return false if the VIC table
 143:../driver/gpio.c **** **						is full and GPIO interrupt handler can be
 144:../driver/gpio.c **** **						installed.
 145:../driver/gpio.c **** ** 
 146:../driver/gpio.c **** *****************************************************************************/
 147:../driver/gpio.c **** void GPIOInit( void )
 148:../driver/gpio.c **** {
  37              		.loc 1 148 0
  38              		.cfi_startproc
  39              		@ args = 0, pretend = 0, frame = 0
  40              		@ frame_needed = 1, uses_anonymous_args = 0
  41 0000 80B5     		push	{r7, lr}
  42              		.cfi_def_cfa_offset 8
  43              		.cfi_offset 7, -8
  44              		.cfi_offset 14, -4
  45 0002 00AF     		add	r7, sp, #0
  46              		.cfi_def_cfa_register 7
 149:../driver/gpio.c ****   /* Enable AHB clock to the GPIO domain. */
 150:../driver/gpio.c ****   LPC_SYSCON->SYSAHBCLKCTRL |= (1<<6);
  47              		.loc 1 150 0
  48 0004 0549     		ldr	r1, .L3
  49 0006 054A     		ldr	r2, .L3
  50 0008 8023     		movs	r3, #128
  51 000a D358     		ldr	r3, [r2, r3]
  52 000c 4022     		movs	r2, #64
  53 000e 1343     		orrs	r3, r2
  54 0010 8022     		movs	r2, #128
  55 0012 8B50     		str	r3, [r1, r2]
 151:../driver/gpio.c **** 
 152:../driver/gpio.c **** #ifdef __JTAG_DISABLED  
 153:../driver/gpio.c ****   LPC_IOCON->R_PIO1_1  &= ~0x07;
 154:../driver/gpio.c ****   LPC_IOCON->R_PIO1_1  |= 0x01;
 155:../driver/gpio.c **** #endif
 156:../driver/gpio.c **** 
 157:../driver/gpio.c ****   /* Set up NVIC when I/O pins are configured as external interrupts. */
 158:../driver/gpio.c **** #if CONFIG_GPIO_DEFAULT_PIOINT0_IRQHANDLER==1
 159:../driver/gpio.c ****   NVIC_EnableIRQ(EINT0_IRQn);
 160:../driver/gpio.c **** #endif
 161:../driver/gpio.c **** #if CONFIG_GPIO_DEFAULT_PIOINT1_IRQHANDLER==1
 162:../driver/gpio.c ****   NVIC_EnableIRQ(EINT1_IRQn);
 163:../driver/gpio.c **** #endif
 164:../driver/gpio.c **** #if CONFIG_GPIO_DEFAULT_PIOINT2_IRQHANDLER==1
 165:../driver/gpio.c ****   NVIC_EnableIRQ(EINT2_IRQn);
 166:../driver/gpio.c **** #endif
 167:../driver/gpio.c **** #if CONFIG_GPIO_DEFAULT_PIOINT3_IRQHANDLER==1
 168:../driver/gpio.c ****   NVIC_EnableIRQ(EINT3_IRQn);
 169:../driver/gpio.c **** #endif
 170:../driver/gpio.c ****   return;
  56              		.loc 1 170 0
  57 0014 C046     		nop
 171:../driver/gpio.c **** }
  58              		.loc 1 171 0
  59 0016 BD46     		mov	sp, r7
  60              		@ sp needed
  61 0018 80BD     		pop	{r7, pc}
  62              	.L4:
  63 001a C046     		.align	2
  64              	.L3:
  65 001c 00800440 		.word	1074036736
  66              		.cfi_endproc
  67              	.LFE20:
  69              		.section	.text.GPIOSetInterrupt,"ax",%progbits
  70              		.align	2
  71              		.global	GPIOSetInterrupt
  72              		.code	16
  73              		.thumb_func
  75              	GPIOSetInterrupt:
  76              	.LFB21:
 172:../driver/gpio.c **** 
 173:../driver/gpio.c **** /*****************************************************************************
 174:../driver/gpio.c **** ** Function name:		GPIOSetInterrupt
 175:../driver/gpio.c **** **
 176:../driver/gpio.c **** ** Descriptions:		Set interrupt sense, event, etc.
 177:../driver/gpio.c **** **						edge or level, 0 is edge, 1 is level
 178:../driver/gpio.c **** **						single or double edge, 0 is single, 1 is double 
 179:../driver/gpio.c **** **						active high or low, etc.
 180:../driver/gpio.c **** **
 181:../driver/gpio.c **** ** parameters:			port num, bit position, sense, single/doube, polarity
 182:../driver/gpio.c **** ** Returned value:		None
 183:../driver/gpio.c **** ** 
 184:../driver/gpio.c **** *****************************************************************************/
 185:../driver/gpio.c **** void GPIOSetInterrupt( uint32_t portNum, uint32_t bitPosi, uint32_t sense,
 186:../driver/gpio.c **** 			uint32_t single, uint32_t event )
 187:../driver/gpio.c **** {
  77              		.loc 1 187 0
  78              		.cfi_startproc
  79              		@ args = 4, pretend = 0, frame = 16
  80              		@ frame_needed = 1, uses_anonymous_args = 0
  81 0000 80B5     		push	{r7, lr}
  82              		.cfi_def_cfa_offset 8
  83              		.cfi_offset 7, -8
  84              		.cfi_offset 14, -4
  85 0002 84B0     		sub	sp, sp, #16
  86              		.cfi_def_cfa_offset 24
  87 0004 00AF     		add	r7, sp, #0
  88              		.cfi_def_cfa_register 7
  89 0006 F860     		str	r0, [r7, #12]
  90 0008 B960     		str	r1, [r7, #8]
  91 000a 7A60     		str	r2, [r7, #4]
  92 000c 3B60     		str	r3, [r7]
 188:../driver/gpio.c ****   switch ( portNum )
  93              		.loc 1 188 0
  94 000e FB68     		ldr	r3, [r7, #12]
  95 0010 012B     		cmp	r3, #1
  96 0012 65D0     		beq	.L7
  97 0014 06D3     		bcc	.L8
  98 0016 022B     		cmp	r3, #2
  99 0018 00D1     		bne	.LCB55
 100 001a B3E0     		b	.L9	@long jump
 101              	.LCB55:
 102 001c 032B     		cmp	r3, #3
 103 001e 00D1     		bne	.LCB57
 104 0020 02E1     		b	.L10	@long jump
 105              	.LCB57:
 189:../driver/gpio.c ****   {
 190:../driver/gpio.c **** 	case PORT0:
 191:../driver/gpio.c **** 	  if ( sense == 0 )
 192:../driver/gpio.c **** 	  {
 193:../driver/gpio.c **** 		LPC_GPIO0->IS &= ~(0x1<<bitPosi);
 194:../driver/gpio.c **** 		/* single or double only applies when sense is 0(edge trigger). */
 195:../driver/gpio.c **** 		if ( single == 0 )
 196:../driver/gpio.c **** 		  LPC_GPIO0->IBE &= ~(0x1<<bitPosi);
 197:../driver/gpio.c **** 		else
 198:../driver/gpio.c **** 		  LPC_GPIO0->IBE |= (0x1<<bitPosi);
 199:../driver/gpio.c **** 	  }
 200:../driver/gpio.c **** 	  else
 201:../driver/gpio.c **** 	  	LPC_GPIO0->IS |= (0x1<<bitPosi);
 202:../driver/gpio.c **** 	  if ( event == 0 )
 203:../driver/gpio.c **** 		LPC_GPIO0->IEV &= ~(0x1<<bitPosi);
 204:../driver/gpio.c **** 	  else
 205:../driver/gpio.c **** 		LPC_GPIO0->IEV |= (0x1<<bitPosi);
 206:../driver/gpio.c **** 	break;
 207:../driver/gpio.c ****  	case PORT1:
 208:../driver/gpio.c **** 	  if ( sense == 0 )
 209:../driver/gpio.c **** 	  {
 210:../driver/gpio.c **** 		LPC_GPIO1->IS &= ~(0x1<<bitPosi);
 211:../driver/gpio.c **** 		/* single or double only applies when sense is 0(edge trigger). */
 212:../driver/gpio.c **** 		if ( single == 0 )
 213:../driver/gpio.c **** 		  LPC_GPIO1->IBE &= ~(0x1<<bitPosi);
 214:../driver/gpio.c **** 		else
 215:../driver/gpio.c **** 		  LPC_GPIO1->IBE |= (0x1<<bitPosi);
 216:../driver/gpio.c **** 	  }
 217:../driver/gpio.c **** 	  else
 218:../driver/gpio.c **** 	  	LPC_GPIO1->IS |= (0x1<<bitPosi);
 219:../driver/gpio.c **** 	  if ( event == 0 )
 220:../driver/gpio.c **** 		LPC_GPIO1->IEV &= ~(0x1<<bitPosi);
 221:../driver/gpio.c **** 	  else
 222:../driver/gpio.c **** 		LPC_GPIO1->IEV |= (0x1<<bitPosi);  
 223:../driver/gpio.c **** 	break;
 224:../driver/gpio.c **** 	case PORT2:
 225:../driver/gpio.c **** 	  if ( sense == 0 )
 226:../driver/gpio.c **** 	  {
 227:../driver/gpio.c **** 		LPC_GPIO2->IS &= ~(0x1<<bitPosi);
 228:../driver/gpio.c **** 		/* single or double only applies when sense is 0(edge trigger). */
 229:../driver/gpio.c **** 		if ( single == 0 )
 230:../driver/gpio.c **** 		  LPC_GPIO2->IBE &= ~(0x1<<bitPosi);
 231:../driver/gpio.c **** 		else
 232:../driver/gpio.c **** 		  LPC_GPIO2->IBE |= (0x1<<bitPosi);
 233:../driver/gpio.c **** 	  }
 234:../driver/gpio.c **** 	  else
 235:../driver/gpio.c **** 	  	LPC_GPIO2->IS |= (0x1<<bitPosi);
 236:../driver/gpio.c **** 	  if ( event == 0 )
 237:../driver/gpio.c **** 		LPC_GPIO2->IEV &= ~(0x1<<bitPosi);
 238:../driver/gpio.c **** 	  else
 239:../driver/gpio.c **** 		LPC_GPIO2->IEV |= (0x1<<bitPosi);  
 240:../driver/gpio.c **** 	break;
 241:../driver/gpio.c **** 	case PORT3:
 242:../driver/gpio.c **** 	  if ( sense == 0 )
 243:../driver/gpio.c **** 	  {
 244:../driver/gpio.c **** 		LPC_GPIO3->IS &= ~(0x1<<bitPosi);
 245:../driver/gpio.c **** 		/* single or double only applies when sense is 0(edge trigger). */
 246:../driver/gpio.c **** 		if ( single == 0 )
 247:../driver/gpio.c **** 		  LPC_GPIO3->IBE &= ~(0x1<<bitPosi);
 248:../driver/gpio.c **** 		else
 249:../driver/gpio.c **** 		  LPC_GPIO3->IBE |= (0x1<<bitPosi);
 250:../driver/gpio.c **** 	  }
 251:../driver/gpio.c **** 	  else
 252:../driver/gpio.c **** 	  	LPC_GPIO3->IS |= (0x1<<bitPosi);
 253:../driver/gpio.c **** 	  if ( event == 0 )
 254:../driver/gpio.c **** 		LPC_GPIO3->IEV &= ~(0x1<<bitPosi);
 255:../driver/gpio.c **** 	  else
 256:../driver/gpio.c **** 		LPC_GPIO3->IEV |= (0x1<<bitPosi);	  
 257:../driver/gpio.c **** 	break;
 258:../driver/gpio.c **** 	default:
 259:../driver/gpio.c **** 	  break;
 106              		.loc 1 259 0
 107 0022 53E1     		b	.L17
 108              	.L8:
 191:../driver/gpio.c **** 	  {
 109              		.loc 1 191 0
 110 0024 7B68     		ldr	r3, [r7, #4]
 111 0026 002B     		cmp	r3, #0
 112 0028 2DD1     		bne	.L11
 193:../driver/gpio.c **** 		/* single or double only applies when sense is 0(edge trigger). */
 113              		.loc 1 193 0
 114 002a A023     		movs	r3, #160
 115 002c DB05     		lsls	r3, r3, #23
 116 002e A022     		movs	r2, #160
 117 0030 D205     		lsls	r2, r2, #23
 118 0032 A849     		ldr	r1, .L38
 119 0034 5258     		ldr	r2, [r2, r1]
 120 0036 0120     		movs	r0, #1
 121 0038 B968     		ldr	r1, [r7, #8]
 122 003a 8840     		lsls	r0, r0, r1
 123 003c 0100     		movs	r1, r0
 124 003e C943     		mvns	r1, r1
 125 0040 0A40     		ands	r2, r1
 126 0042 A449     		ldr	r1, .L38
 127 0044 5A50     		str	r2, [r3, r1]
 195:../driver/gpio.c **** 		  LPC_GPIO0->IBE &= ~(0x1<<bitPosi);
 128              		.loc 1 195 0
 129 0046 3B68     		ldr	r3, [r7]
 130 0048 002B     		cmp	r3, #0
 131 004a 0ED1     		bne	.L12
 196:../driver/gpio.c **** 		else
 132              		.loc 1 196 0
 133 004c A023     		movs	r3, #160
 134 004e DB05     		lsls	r3, r3, #23
 135 0050 A022     		movs	r2, #160
 136 0052 D205     		lsls	r2, r2, #23
 137 0054 A049     		ldr	r1, .L38+4
 138 0056 5258     		ldr	r2, [r2, r1]
 139 0058 0120     		movs	r0, #1
 140 005a B968     		ldr	r1, [r7, #8]
 141 005c 8840     		lsls	r0, r0, r1
 142 005e 0100     		movs	r1, r0
 143 0060 C943     		mvns	r1, r1
 144 0062 0A40     		ands	r2, r1
 145 0064 9C49     		ldr	r1, .L38+4
 146 0066 5A50     		str	r2, [r3, r1]
 147 0068 1AE0     		b	.L14
 148              	.L12:
 198:../driver/gpio.c **** 	  }
 149              		.loc 1 198 0
 150 006a A023     		movs	r3, #160
 151 006c DB05     		lsls	r3, r3, #23
 152 006e A022     		movs	r2, #160
 153 0070 D205     		lsls	r2, r2, #23
 154 0072 9949     		ldr	r1, .L38+4
 155 0074 5258     		ldr	r2, [r2, r1]
 156 0076 0120     		movs	r0, #1
 157 0078 B968     		ldr	r1, [r7, #8]
 158 007a 8840     		lsls	r0, r0, r1
 159 007c 0100     		movs	r1, r0
 160 007e 0A43     		orrs	r2, r1
 161 0080 9549     		ldr	r1, .L38+4
 162 0082 5A50     		str	r2, [r3, r1]
 163 0084 0CE0     		b	.L14
 164              	.L11:
 201:../driver/gpio.c **** 	  if ( event == 0 )
 165              		.loc 1 201 0
 166 0086 A023     		movs	r3, #160
 167 0088 DB05     		lsls	r3, r3, #23
 168 008a A022     		movs	r2, #160
 169 008c D205     		lsls	r2, r2, #23
 170 008e 9149     		ldr	r1, .L38
 171 0090 5258     		ldr	r2, [r2, r1]
 172 0092 0120     		movs	r0, #1
 173 0094 B968     		ldr	r1, [r7, #8]
 174 0096 8840     		lsls	r0, r0, r1
 175 0098 0100     		movs	r1, r0
 176 009a 0A43     		orrs	r2, r1
 177 009c 8D49     		ldr	r1, .L38
 178 009e 5A50     		str	r2, [r3, r1]
 179              	.L14:
 202:../driver/gpio.c **** 		LPC_GPIO0->IEV &= ~(0x1<<bitPosi);
 180              		.loc 1 202 0
 181 00a0 BB69     		ldr	r3, [r7, #24]
 182 00a2 002B     		cmp	r3, #0
 183 00a4 0ED1     		bne	.L15
 203:../driver/gpio.c **** 	  else
 184              		.loc 1 203 0
 185 00a6 A023     		movs	r3, #160
 186 00a8 DB05     		lsls	r3, r3, #23
 187 00aa A022     		movs	r2, #160
 188 00ac D205     		lsls	r2, r2, #23
 189 00ae 8B49     		ldr	r1, .L38+8
 190 00b0 5258     		ldr	r2, [r2, r1]
 191 00b2 0120     		movs	r0, #1
 192 00b4 B968     		ldr	r1, [r7, #8]
 193 00b6 8840     		lsls	r0, r0, r1
 194 00b8 0100     		movs	r1, r0
 195 00ba C943     		mvns	r1, r1
 196 00bc 0A40     		ands	r2, r1
 197 00be 8749     		ldr	r1, .L38+8
 198 00c0 5A50     		str	r2, [r3, r1]
 206:../driver/gpio.c ****  	case PORT1:
 199              		.loc 1 206 0
 200 00c2 03E1     		b	.L17
 201              	.L15:
 205:../driver/gpio.c **** 	break;
 202              		.loc 1 205 0
 203 00c4 A023     		movs	r3, #160
 204 00c6 DB05     		lsls	r3, r3, #23
 205 00c8 A022     		movs	r2, #160
 206 00ca D205     		lsls	r2, r2, #23
 207 00cc 8349     		ldr	r1, .L38+8
 208 00ce 5258     		ldr	r2, [r2, r1]
 209 00d0 0120     		movs	r0, #1
 210 00d2 B968     		ldr	r1, [r7, #8]
 211 00d4 8840     		lsls	r0, r0, r1
 212 00d6 0100     		movs	r1, r0
 213 00d8 0A43     		orrs	r2, r1
 214 00da 8049     		ldr	r1, .L38+8
 215 00dc 5A50     		str	r2, [r3, r1]
 206:../driver/gpio.c ****  	case PORT1:
 216              		.loc 1 206 0
 217 00de F5E0     		b	.L17
 218              	.L7:
 208:../driver/gpio.c **** 	  {
 219              		.loc 1 208 0
 220 00e0 7B68     		ldr	r3, [r7, #4]
 221 00e2 002B     		cmp	r3, #0
 222 00e4 27D1     		bne	.L18
 210:../driver/gpio.c **** 		/* single or double only applies when sense is 0(edge trigger). */
 223              		.loc 1 210 0
 224 00e6 7E49     		ldr	r1, .L38+12
 225 00e8 7D4A     		ldr	r2, .L38+12
 226 00ea 7A4B     		ldr	r3, .L38
 227 00ec D358     		ldr	r3, [r2, r3]
 228 00ee 0120     		movs	r0, #1
 229 00f0 BA68     		ldr	r2, [r7, #8]
 230 00f2 9040     		lsls	r0, r0, r2
 231 00f4 0200     		movs	r2, r0
 232 00f6 D243     		mvns	r2, r2
 233 00f8 1340     		ands	r3, r2
 234 00fa 764A     		ldr	r2, .L38
 235 00fc 8B50     		str	r3, [r1, r2]
 212:../driver/gpio.c **** 		  LPC_GPIO1->IBE &= ~(0x1<<bitPosi);
 236              		.loc 1 212 0
 237 00fe 3B68     		ldr	r3, [r7]
 238 0100 002B     		cmp	r3, #0
 239 0102 0CD1     		bne	.L19
 213:../driver/gpio.c **** 		else
 240              		.loc 1 213 0
 241 0104 7649     		ldr	r1, .L38+12
 242 0106 764A     		ldr	r2, .L38+12
 243 0108 734B     		ldr	r3, .L38+4
 244 010a D358     		ldr	r3, [r2, r3]
 245 010c 0120     		movs	r0, #1
 246 010e BA68     		ldr	r2, [r7, #8]
 247 0110 9040     		lsls	r0, r0, r2
 248 0112 0200     		movs	r2, r0
 249 0114 D243     		mvns	r2, r2
 250 0116 1340     		ands	r3, r2
 251 0118 6F4A     		ldr	r2, .L38+4
 252 011a 8B50     		str	r3, [r1, r2]
 253 011c 16E0     		b	.L21
 254              	.L19:
 215:../driver/gpio.c **** 	  }
 255              		.loc 1 215 0
 256 011e 7049     		ldr	r1, .L38+12
 257 0120 6F4A     		ldr	r2, .L38+12
 258 0122 6D4B     		ldr	r3, .L38+4
 259 0124 D358     		ldr	r3, [r2, r3]
 260 0126 0120     		movs	r0, #1
 261 0128 BA68     		ldr	r2, [r7, #8]
 262 012a 9040     		lsls	r0, r0, r2
 263 012c 0200     		movs	r2, r0
 264 012e 1343     		orrs	r3, r2
 265 0130 694A     		ldr	r2, .L38+4
 266 0132 8B50     		str	r3, [r1, r2]
 267 0134 0AE0     		b	.L21
 268              	.L18:
 218:../driver/gpio.c **** 	  if ( event == 0 )
 269              		.loc 1 218 0
 270 0136 6A49     		ldr	r1, .L38+12
 271 0138 694A     		ldr	r2, .L38+12
 272 013a 664B     		ldr	r3, .L38
 273 013c D358     		ldr	r3, [r2, r3]
 274 013e 0120     		movs	r0, #1
 275 0140 BA68     		ldr	r2, [r7, #8]
 276 0142 9040     		lsls	r0, r0, r2
 277 0144 0200     		movs	r2, r0
 278 0146 1343     		orrs	r3, r2
 279 0148 624A     		ldr	r2, .L38
 280 014a 8B50     		str	r3, [r1, r2]
 281              	.L21:
 219:../driver/gpio.c **** 		LPC_GPIO1->IEV &= ~(0x1<<bitPosi);
 282              		.loc 1 219 0
 283 014c BB69     		ldr	r3, [r7, #24]
 284 014e 002B     		cmp	r3, #0
 285 0150 0CD1     		bne	.L22
 220:../driver/gpio.c **** 	  else
 286              		.loc 1 220 0
 287 0152 6349     		ldr	r1, .L38+12
 288 0154 624A     		ldr	r2, .L38+12
 289 0156 614B     		ldr	r3, .L38+8
 290 0158 D358     		ldr	r3, [r2, r3]
 291 015a 0120     		movs	r0, #1
 292 015c BA68     		ldr	r2, [r7, #8]
 293 015e 9040     		lsls	r0, r0, r2
 294 0160 0200     		movs	r2, r0
 295 0162 D243     		mvns	r2, r2
 296 0164 1340     		ands	r3, r2
 297 0166 5D4A     		ldr	r2, .L38+8
 298 0168 8B50     		str	r3, [r1, r2]
 223:../driver/gpio.c **** 	case PORT2:
 299              		.loc 1 223 0
 300 016a AFE0     		b	.L17
 301              	.L22:
 222:../driver/gpio.c **** 	break;
 302              		.loc 1 222 0
 303 016c 5C49     		ldr	r1, .L38+12
 304 016e 5C4A     		ldr	r2, .L38+12
 305 0170 5A4B     		ldr	r3, .L38+8
 306 0172 D358     		ldr	r3, [r2, r3]
 307 0174 0120     		movs	r0, #1
 308 0176 BA68     		ldr	r2, [r7, #8]
 309 0178 9040     		lsls	r0, r0, r2
 310 017a 0200     		movs	r2, r0
 311 017c 1343     		orrs	r3, r2
 312 017e 574A     		ldr	r2, .L38+8
 313 0180 8B50     		str	r3, [r1, r2]
 223:../driver/gpio.c **** 	case PORT2:
 314              		.loc 1 223 0
 315 0182 A3E0     		b	.L17
 316              	.L9:
 225:../driver/gpio.c **** 	  {
 317              		.loc 1 225 0
 318 0184 7B68     		ldr	r3, [r7, #4]
 319 0186 002B     		cmp	r3, #0
 320 0188 27D1     		bne	.L24
 227:../driver/gpio.c **** 		/* single or double only applies when sense is 0(edge trigger). */
 321              		.loc 1 227 0
 322 018a 5649     		ldr	r1, .L38+16
 323 018c 554A     		ldr	r2, .L38+16
 324 018e 514B     		ldr	r3, .L38
 325 0190 D358     		ldr	r3, [r2, r3]
 326 0192 0120     		movs	r0, #1
 327 0194 BA68     		ldr	r2, [r7, #8]
 328 0196 9040     		lsls	r0, r0, r2
 329 0198 0200     		movs	r2, r0
 330 019a D243     		mvns	r2, r2
 331 019c 1340     		ands	r3, r2
 332 019e 4D4A     		ldr	r2, .L38
 333 01a0 8B50     		str	r3, [r1, r2]
 229:../driver/gpio.c **** 		  LPC_GPIO2->IBE &= ~(0x1<<bitPosi);
 334              		.loc 1 229 0
 335 01a2 3B68     		ldr	r3, [r7]
 336 01a4 002B     		cmp	r3, #0
 337 01a6 0CD1     		bne	.L25
 230:../driver/gpio.c **** 		else
 338              		.loc 1 230 0
 339 01a8 4E49     		ldr	r1, .L38+16
 340 01aa 4E4A     		ldr	r2, .L38+16
 341 01ac 4A4B     		ldr	r3, .L38+4
 342 01ae D358     		ldr	r3, [r2, r3]
 343 01b0 0120     		movs	r0, #1
 344 01b2 BA68     		ldr	r2, [r7, #8]
 345 01b4 9040     		lsls	r0, r0, r2
 346 01b6 0200     		movs	r2, r0
 347 01b8 D243     		mvns	r2, r2
 348 01ba 1340     		ands	r3, r2
 349 01bc 464A     		ldr	r2, .L38+4
 350 01be 8B50     		str	r3, [r1, r2]
 351 01c0 16E0     		b	.L27
 352              	.L25:
 232:../driver/gpio.c **** 	  }
 353              		.loc 1 232 0
 354 01c2 4849     		ldr	r1, .L38+16
 355 01c4 474A     		ldr	r2, .L38+16
 356 01c6 444B     		ldr	r3, .L38+4
 357 01c8 D358     		ldr	r3, [r2, r3]
 358 01ca 0120     		movs	r0, #1
 359 01cc BA68     		ldr	r2, [r7, #8]
 360 01ce 9040     		lsls	r0, r0, r2
 361 01d0 0200     		movs	r2, r0
 362 01d2 1343     		orrs	r3, r2
 363 01d4 404A     		ldr	r2, .L38+4
 364 01d6 8B50     		str	r3, [r1, r2]
 365 01d8 0AE0     		b	.L27
 366              	.L24:
 235:../driver/gpio.c **** 	  if ( event == 0 )
 367              		.loc 1 235 0
 368 01da 4249     		ldr	r1, .L38+16
 369 01dc 414A     		ldr	r2, .L38+16
 370 01de 3D4B     		ldr	r3, .L38
 371 01e0 D358     		ldr	r3, [r2, r3]
 372 01e2 0120     		movs	r0, #1
 373 01e4 BA68     		ldr	r2, [r7, #8]
 374 01e6 9040     		lsls	r0, r0, r2
 375 01e8 0200     		movs	r2, r0
 376 01ea 1343     		orrs	r3, r2
 377 01ec 394A     		ldr	r2, .L38
 378 01ee 8B50     		str	r3, [r1, r2]
 379              	.L27:
 236:../driver/gpio.c **** 		LPC_GPIO2->IEV &= ~(0x1<<bitPosi);
 380              		.loc 1 236 0
 381 01f0 BB69     		ldr	r3, [r7, #24]
 382 01f2 002B     		cmp	r3, #0
 383 01f4 0CD1     		bne	.L28
 237:../driver/gpio.c **** 	  else
 384              		.loc 1 237 0
 385 01f6 3B49     		ldr	r1, .L38+16
 386 01f8 3A4A     		ldr	r2, .L38+16
 387 01fa 384B     		ldr	r3, .L38+8
 388 01fc D358     		ldr	r3, [r2, r3]
 389 01fe 0120     		movs	r0, #1
 390 0200 BA68     		ldr	r2, [r7, #8]
 391 0202 9040     		lsls	r0, r0, r2
 392 0204 0200     		movs	r2, r0
 393 0206 D243     		mvns	r2, r2
 394 0208 1340     		ands	r3, r2
 395 020a 344A     		ldr	r2, .L38+8
 396 020c 8B50     		str	r3, [r1, r2]
 240:../driver/gpio.c **** 	case PORT3:
 397              		.loc 1 240 0
 398 020e 5DE0     		b	.L17
 399              	.L28:
 239:../driver/gpio.c **** 	break;
 400              		.loc 1 239 0
 401 0210 3449     		ldr	r1, .L38+16
 402 0212 344A     		ldr	r2, .L38+16
 403 0214 314B     		ldr	r3, .L38+8
 404 0216 D358     		ldr	r3, [r2, r3]
 405 0218 0120     		movs	r0, #1
 406 021a BA68     		ldr	r2, [r7, #8]
 407 021c 9040     		lsls	r0, r0, r2
 408 021e 0200     		movs	r2, r0
 409 0220 1343     		orrs	r3, r2
 410 0222 2E4A     		ldr	r2, .L38+8
 411 0224 8B50     		str	r3, [r1, r2]
 240:../driver/gpio.c **** 	case PORT3:
 412              		.loc 1 240 0
 413 0226 51E0     		b	.L17
 414              	.L10:
 242:../driver/gpio.c **** 	  {
 415              		.loc 1 242 0
 416 0228 7B68     		ldr	r3, [r7, #4]
 417 022a 002B     		cmp	r3, #0
 418 022c 27D1     		bne	.L30
 244:../driver/gpio.c **** 		/* single or double only applies when sense is 0(edge trigger). */
 419              		.loc 1 244 0
 420 022e 2E49     		ldr	r1, .L38+20
 421 0230 2D4A     		ldr	r2, .L38+20
 422 0232 284B     		ldr	r3, .L38
 423 0234 D358     		ldr	r3, [r2, r3]
 424 0236 0120     		movs	r0, #1
 425 0238 BA68     		ldr	r2, [r7, #8]
 426 023a 9040     		lsls	r0, r0, r2
 427 023c 0200     		movs	r2, r0
 428 023e D243     		mvns	r2, r2
 429 0240 1340     		ands	r3, r2
 430 0242 244A     		ldr	r2, .L38
 431 0244 8B50     		str	r3, [r1, r2]
 246:../driver/gpio.c **** 		  LPC_GPIO3->IBE &= ~(0x1<<bitPosi);
 432              		.loc 1 246 0
 433 0246 3B68     		ldr	r3, [r7]
 434 0248 002B     		cmp	r3, #0
 435 024a 0CD1     		bne	.L31
 247:../driver/gpio.c **** 		else
 436              		.loc 1 247 0
 437 024c 2649     		ldr	r1, .L38+20
 438 024e 264A     		ldr	r2, .L38+20
 439 0250 214B     		ldr	r3, .L38+4
 440 0252 D358     		ldr	r3, [r2, r3]
 441 0254 0120     		movs	r0, #1
 442 0256 BA68     		ldr	r2, [r7, #8]
 443 0258 9040     		lsls	r0, r0, r2
 444 025a 0200     		movs	r2, r0
 445 025c D243     		mvns	r2, r2
 446 025e 1340     		ands	r3, r2
 447 0260 1D4A     		ldr	r2, .L38+4
 448 0262 8B50     		str	r3, [r1, r2]
 449 0264 16E0     		b	.L33
 450              	.L31:
 249:../driver/gpio.c **** 	  }
 451              		.loc 1 249 0
 452 0266 2049     		ldr	r1, .L38+20
 453 0268 1F4A     		ldr	r2, .L38+20
 454 026a 1B4B     		ldr	r3, .L38+4
 455 026c D358     		ldr	r3, [r2, r3]
 456 026e 0120     		movs	r0, #1
 457 0270 BA68     		ldr	r2, [r7, #8]
 458 0272 9040     		lsls	r0, r0, r2
 459 0274 0200     		movs	r2, r0
 460 0276 1343     		orrs	r3, r2
 461 0278 174A     		ldr	r2, .L38+4
 462 027a 8B50     		str	r3, [r1, r2]
 463 027c 0AE0     		b	.L33
 464              	.L30:
 252:../driver/gpio.c **** 	  if ( event == 0 )
 465              		.loc 1 252 0
 466 027e 1A49     		ldr	r1, .L38+20
 467 0280 194A     		ldr	r2, .L38+20
 468 0282 144B     		ldr	r3, .L38
 469 0284 D358     		ldr	r3, [r2, r3]
 470 0286 0120     		movs	r0, #1
 471 0288 BA68     		ldr	r2, [r7, #8]
 472 028a 9040     		lsls	r0, r0, r2
 473 028c 0200     		movs	r2, r0
 474 028e 1343     		orrs	r3, r2
 475 0290 104A     		ldr	r2, .L38
 476 0292 8B50     		str	r3, [r1, r2]
 477              	.L33:
 253:../driver/gpio.c **** 		LPC_GPIO3->IEV &= ~(0x1<<bitPosi);
 478              		.loc 1 253 0
 479 0294 BB69     		ldr	r3, [r7, #24]
 480 0296 002B     		cmp	r3, #0
 481 0298 0CD1     		bne	.L34
 254:../driver/gpio.c **** 	  else
 482              		.loc 1 254 0
 483 029a 1349     		ldr	r1, .L38+20
 484 029c 124A     		ldr	r2, .L38+20
 485 029e 0F4B     		ldr	r3, .L38+8
 486 02a0 D358     		ldr	r3, [r2, r3]
 487 02a2 0120     		movs	r0, #1
 488 02a4 BA68     		ldr	r2, [r7, #8]
 489 02a6 9040     		lsls	r0, r0, r2
 490 02a8 0200     		movs	r2, r0
 491 02aa D243     		mvns	r2, r2
 492 02ac 1340     		ands	r3, r2
 493 02ae 0B4A     		ldr	r2, .L38+8
 494 02b0 8B50     		str	r3, [r1, r2]
 257:../driver/gpio.c **** 	default:
 495              		.loc 1 257 0
 496 02b2 0AE0     		b	.L37
 497              	.L34:
 256:../driver/gpio.c **** 	break;
 498              		.loc 1 256 0
 499 02b4 0C49     		ldr	r1, .L38+20
 500 02b6 0C4A     		ldr	r2, .L38+20
 501 02b8 084B     		ldr	r3, .L38+8
 502 02ba D358     		ldr	r3, [r2, r3]
 503 02bc 0120     		movs	r0, #1
 504 02be BA68     		ldr	r2, [r7, #8]
 505 02c0 9040     		lsls	r0, r0, r2
 506 02c2 0200     		movs	r2, r0
 507 02c4 1343     		orrs	r3, r2
 508 02c6 054A     		ldr	r2, .L38+8
 509 02c8 8B50     		str	r3, [r1, r2]
 510              	.L37:
 257:../driver/gpio.c **** 	default:
 511              		.loc 1 257 0
 512 02ca C046     		nop
 513              	.L17:
 260:../driver/gpio.c ****   }
 261:../driver/gpio.c ****   return;
 514              		.loc 1 261 0 discriminator 1
 515 02cc C046     		nop
 262:../driver/gpio.c **** }
 516              		.loc 1 262 0 discriminator 1
 517 02ce BD46     		mov	sp, r7
 518 02d0 04B0     		add	sp, sp, #16
 519              		@ sp needed
 520 02d2 80BD     		pop	{r7, pc}
 521              	.L39:
 522              		.align	2
 523              	.L38:
 524 02d4 04800000 		.word	32772
 525 02d8 08800000 		.word	32776
 526 02dc 0C800000 		.word	32780
 527 02e0 00000150 		.word	1342242816
 528 02e4 00000250 		.word	1342308352
 529 02e8 00000350 		.word	1342373888
 530              		.cfi_endproc
 531              	.LFE21:
 533              		.section	.text.GPIOIntEnable,"ax",%progbits
 534              		.align	2
 535              		.global	GPIOIntEnable
 536              		.code	16
 537              		.thumb_func
 539              	GPIOIntEnable:
 540              	.LFB22:
 263:../driver/gpio.c **** 
 264:../driver/gpio.c **** /*****************************************************************************
 265:../driver/gpio.c **** ** Function name:		GPIOIntEnable
 266:../driver/gpio.c **** **
 267:../driver/gpio.c **** ** Descriptions:		Enable Interrupt Mask for a port pin.
 268:../driver/gpio.c **** **
 269:../driver/gpio.c **** ** parameters:			port num, bit position
 270:../driver/gpio.c **** ** Returned value:		None
 271:../driver/gpio.c **** ** 
 272:../driver/gpio.c **** *****************************************************************************/
 273:../driver/gpio.c **** void GPIOIntEnable( uint32_t portNum, uint32_t bitPosi )
 274:../driver/gpio.c **** {
 541              		.loc 1 274 0
 542              		.cfi_startproc
 543              		@ args = 0, pretend = 0, frame = 8
 544              		@ frame_needed = 1, uses_anonymous_args = 0
 545 0000 80B5     		push	{r7, lr}
 546              		.cfi_def_cfa_offset 8
 547              		.cfi_offset 7, -8
 548              		.cfi_offset 14, -4
 549 0002 82B0     		sub	sp, sp, #8
 550              		.cfi_def_cfa_offset 16
 551 0004 00AF     		add	r7, sp, #0
 552              		.cfi_def_cfa_register 7
 553 0006 7860     		str	r0, [r7, #4]
 554 0008 3960     		str	r1, [r7]
 275:../driver/gpio.c ****   switch ( portNum )
 555              		.loc 1 275 0
 556 000a 7B68     		ldr	r3, [r7, #4]
 557 000c 012B     		cmp	r3, #1
 558 000e 13D0     		beq	.L42
 559 0010 04D3     		bcc	.L43
 560 0012 022B     		cmp	r3, #2
 561 0014 1CD0     		beq	.L44
 562 0016 032B     		cmp	r3, #3
 563 0018 26D0     		beq	.L45
 276:../driver/gpio.c ****   {
 277:../driver/gpio.c **** 	case PORT0:
 278:../driver/gpio.c **** 	  LPC_GPIO0->IE |= (0x1<<bitPosi); 
 279:../driver/gpio.c **** 	break;
 280:../driver/gpio.c ****  	case PORT1:
 281:../driver/gpio.c **** 	  LPC_GPIO1->IE |= (0x1<<bitPosi);	
 282:../driver/gpio.c **** 	break;
 283:../driver/gpio.c **** 	case PORT2:
 284:../driver/gpio.c **** 	  LPC_GPIO2->IE |= (0x1<<bitPosi);	    
 285:../driver/gpio.c **** 	break;
 286:../driver/gpio.c **** 	case PORT3:
 287:../driver/gpio.c **** 	  LPC_GPIO3->IE |= (0x1<<bitPosi);	    
 288:../driver/gpio.c **** 	break;
 289:../driver/gpio.c **** 	default:
 290:../driver/gpio.c **** 	  break;
 564              		.loc 1 290 0
 565 001a 31E0     		b	.L46
 566              	.L43:
 278:../driver/gpio.c **** 	break;
 567              		.loc 1 278 0
 568 001c A023     		movs	r3, #160
 569 001e DB05     		lsls	r3, r3, #23
 570 0020 A022     		movs	r2, #160
 571 0022 D205     		lsls	r2, r2, #23
 572 0024 1849     		ldr	r1, .L48
 573 0026 5258     		ldr	r2, [r2, r1]
 574 0028 0120     		movs	r0, #1
 575 002a 3968     		ldr	r1, [r7]
 576 002c 8840     		lsls	r0, r0, r1
 577 002e 0100     		movs	r1, r0
 578 0030 0A43     		orrs	r2, r1
 579 0032 1549     		ldr	r1, .L48
 580 0034 5A50     		str	r2, [r3, r1]
 279:../driver/gpio.c ****  	case PORT1:
 581              		.loc 1 279 0
 582 0036 23E0     		b	.L46
 583              	.L42:
 281:../driver/gpio.c **** 	break;
 584              		.loc 1 281 0
 585 0038 1449     		ldr	r1, .L48+4
 586 003a 144A     		ldr	r2, .L48+4
 587 003c 124B     		ldr	r3, .L48
 588 003e D358     		ldr	r3, [r2, r3]
 589 0040 0120     		movs	r0, #1
 590 0042 3A68     		ldr	r2, [r7]
 591 0044 9040     		lsls	r0, r0, r2
 592 0046 0200     		movs	r2, r0
 593 0048 1343     		orrs	r3, r2
 594 004a 0F4A     		ldr	r2, .L48
 595 004c 8B50     		str	r3, [r1, r2]
 282:../driver/gpio.c **** 	case PORT2:
 596              		.loc 1 282 0
 597 004e 17E0     		b	.L46
 598              	.L44:
 284:../driver/gpio.c **** 	break;
 599              		.loc 1 284 0
 600 0050 0F49     		ldr	r1, .L48+8
 601 0052 0F4A     		ldr	r2, .L48+8
 602 0054 0C4B     		ldr	r3, .L48
 603 0056 D358     		ldr	r3, [r2, r3]
 604 0058 0120     		movs	r0, #1
 605 005a 3A68     		ldr	r2, [r7]
 606 005c 9040     		lsls	r0, r0, r2
 607 005e 0200     		movs	r2, r0
 608 0060 1343     		orrs	r3, r2
 609 0062 094A     		ldr	r2, .L48
 610 0064 8B50     		str	r3, [r1, r2]
 285:../driver/gpio.c **** 	case PORT3:
 611              		.loc 1 285 0
 612 0066 0BE0     		b	.L46
 613              	.L45:
 287:../driver/gpio.c **** 	break;
 614              		.loc 1 287 0
 615 0068 0A49     		ldr	r1, .L48+12
 616 006a 0A4A     		ldr	r2, .L48+12
 617 006c 064B     		ldr	r3, .L48
 618 006e D358     		ldr	r3, [r2, r3]
 619 0070 0120     		movs	r0, #1
 620 0072 3A68     		ldr	r2, [r7]
 621 0074 9040     		lsls	r0, r0, r2
 622 0076 0200     		movs	r2, r0
 623 0078 1343     		orrs	r3, r2
 624 007a 034A     		ldr	r2, .L48
 625 007c 8B50     		str	r3, [r1, r2]
 288:../driver/gpio.c **** 	default:
 626              		.loc 1 288 0
 627 007e C046     		nop
 628              	.L46:
 291:../driver/gpio.c ****   }
 292:../driver/gpio.c ****   return;
 629              		.loc 1 292 0 discriminator 1
 630 0080 C046     		nop
 293:../driver/gpio.c **** }
 631              		.loc 1 293 0 discriminator 1
 632 0082 BD46     		mov	sp, r7
 633 0084 02B0     		add	sp, sp, #8
 634              		@ sp needed
 635 0086 80BD     		pop	{r7, pc}
 636              	.L49:
 637              		.align	2
 638              	.L48:
 639 0088 10800000 		.word	32784
 640 008c 00000150 		.word	1342242816
 641 0090 00000250 		.word	1342308352
 642 0094 00000350 		.word	1342373888
 643              		.cfi_endproc
 644              	.LFE22:
 646              		.section	.text.GPIOIntDisable,"ax",%progbits
 647              		.align	2
 648              		.global	GPIOIntDisable
 649              		.code	16
 650              		.thumb_func
 652              	GPIOIntDisable:
 653              	.LFB23:
 294:../driver/gpio.c **** 
 295:../driver/gpio.c **** /*****************************************************************************
 296:../driver/gpio.c **** ** Function name:		GPIOIntDisable
 297:../driver/gpio.c **** **
 298:../driver/gpio.c **** ** Descriptions:		Disable Interrupt Mask for a port pin.
 299:../driver/gpio.c **** **
 300:../driver/gpio.c **** ** parameters:			port num, bit position
 301:../driver/gpio.c **** ** Returned value:		None
 302:../driver/gpio.c **** ** 
 303:../driver/gpio.c **** *****************************************************************************/
 304:../driver/gpio.c **** void GPIOIntDisable( uint32_t portNum, uint32_t bitPosi )
 305:../driver/gpio.c **** {
 654              		.loc 1 305 0
 655              		.cfi_startproc
 656              		@ args = 0, pretend = 0, frame = 8
 657              		@ frame_needed = 1, uses_anonymous_args = 0
 658 0000 80B5     		push	{r7, lr}
 659              		.cfi_def_cfa_offset 8
 660              		.cfi_offset 7, -8
 661              		.cfi_offset 14, -4
 662 0002 82B0     		sub	sp, sp, #8
 663              		.cfi_def_cfa_offset 16
 664 0004 00AF     		add	r7, sp, #0
 665              		.cfi_def_cfa_register 7
 666 0006 7860     		str	r0, [r7, #4]
 667 0008 3960     		str	r1, [r7]
 306:../driver/gpio.c ****   switch ( portNum )
 668              		.loc 1 306 0
 669 000a 7B68     		ldr	r3, [r7, #4]
 670 000c 012B     		cmp	r3, #1
 671 000e 14D0     		beq	.L52
 672 0010 04D3     		bcc	.L53
 673 0012 022B     		cmp	r3, #2
 674 0014 1ED0     		beq	.L54
 675 0016 032B     		cmp	r3, #3
 676 0018 29D0     		beq	.L55
 307:../driver/gpio.c ****   {
 308:../driver/gpio.c **** 	case PORT0:
 309:../driver/gpio.c **** 	  LPC_GPIO0->IE &= ~(0x1<<bitPosi); 
 310:../driver/gpio.c **** 	break;
 311:../driver/gpio.c ****  	case PORT1:
 312:../driver/gpio.c **** 	  LPC_GPIO1->IE &= ~(0x1<<bitPosi);	
 313:../driver/gpio.c **** 	break;
 314:../driver/gpio.c **** 	case PORT2:
 315:../driver/gpio.c **** 	  LPC_GPIO2->IE &= ~(0x1<<bitPosi);	    
 316:../driver/gpio.c **** 	break;
 317:../driver/gpio.c **** 	case PORT3:
 318:../driver/gpio.c **** 	  LPC_GPIO3->IE &= ~(0x1<<bitPosi);	    
 319:../driver/gpio.c **** 	break;
 320:../driver/gpio.c **** 	default:
 321:../driver/gpio.c **** 	  break;
 677              		.loc 1 321 0
 678 001a 35E0     		b	.L56
 679              	.L53:
 309:../driver/gpio.c **** 	break;
 680              		.loc 1 309 0
 681 001c A023     		movs	r3, #160
 682 001e DB05     		lsls	r3, r3, #23
 683 0020 A022     		movs	r2, #160
 684 0022 D205     		lsls	r2, r2, #23
 685 0024 1A49     		ldr	r1, .L58
 686 0026 5258     		ldr	r2, [r2, r1]
 687 0028 0120     		movs	r0, #1
 688 002a 3968     		ldr	r1, [r7]
 689 002c 8840     		lsls	r0, r0, r1
 690 002e 0100     		movs	r1, r0
 691 0030 C943     		mvns	r1, r1
 692 0032 0A40     		ands	r2, r1
 693 0034 1649     		ldr	r1, .L58
 694 0036 5A50     		str	r2, [r3, r1]
 310:../driver/gpio.c ****  	case PORT1:
 695              		.loc 1 310 0
 696 0038 26E0     		b	.L56
 697              	.L52:
 312:../driver/gpio.c **** 	break;
 698              		.loc 1 312 0
 699 003a 1649     		ldr	r1, .L58+4
 700 003c 154A     		ldr	r2, .L58+4
 701 003e 144B     		ldr	r3, .L58
 702 0040 D358     		ldr	r3, [r2, r3]
 703 0042 0120     		movs	r0, #1
 704 0044 3A68     		ldr	r2, [r7]
 705 0046 9040     		lsls	r0, r0, r2
 706 0048 0200     		movs	r2, r0
 707 004a D243     		mvns	r2, r2
 708 004c 1340     		ands	r3, r2
 709 004e 104A     		ldr	r2, .L58
 710 0050 8B50     		str	r3, [r1, r2]
 313:../driver/gpio.c **** 	case PORT2:
 711              		.loc 1 313 0
 712 0052 19E0     		b	.L56
 713              	.L54:
 315:../driver/gpio.c **** 	break;
 714              		.loc 1 315 0
 715 0054 1049     		ldr	r1, .L58+8
 716 0056 104A     		ldr	r2, .L58+8
 717 0058 0D4B     		ldr	r3, .L58
 718 005a D358     		ldr	r3, [r2, r3]
 719 005c 0120     		movs	r0, #1
 720 005e 3A68     		ldr	r2, [r7]
 721 0060 9040     		lsls	r0, r0, r2
 722 0062 0200     		movs	r2, r0
 723 0064 D243     		mvns	r2, r2
 724 0066 1340     		ands	r3, r2
 725 0068 094A     		ldr	r2, .L58
 726 006a 8B50     		str	r3, [r1, r2]
 316:../driver/gpio.c **** 	case PORT3:
 727              		.loc 1 316 0
 728 006c 0CE0     		b	.L56
 729              	.L55:
 318:../driver/gpio.c **** 	break;
 730              		.loc 1 318 0
 731 006e 0B49     		ldr	r1, .L58+12
 732 0070 0A4A     		ldr	r2, .L58+12
 733 0072 074B     		ldr	r3, .L58
 734 0074 D358     		ldr	r3, [r2, r3]
 735 0076 0120     		movs	r0, #1
 736 0078 3A68     		ldr	r2, [r7]
 737 007a 9040     		lsls	r0, r0, r2
 738 007c 0200     		movs	r2, r0
 739 007e D243     		mvns	r2, r2
 740 0080 1340     		ands	r3, r2
 741 0082 034A     		ldr	r2, .L58
 742 0084 8B50     		str	r3, [r1, r2]
 319:../driver/gpio.c **** 	default:
 743              		.loc 1 319 0
 744 0086 C046     		nop
 745              	.L56:
 322:../driver/gpio.c ****   }
 323:../driver/gpio.c ****   return;
 746              		.loc 1 323 0 discriminator 1
 747 0088 C046     		nop
 324:../driver/gpio.c **** }
 748              		.loc 1 324 0 discriminator 1
 749 008a BD46     		mov	sp, r7
 750 008c 02B0     		add	sp, sp, #8
 751              		@ sp needed
 752 008e 80BD     		pop	{r7, pc}
 753              	.L59:
 754              		.align	2
 755              	.L58:
 756 0090 10800000 		.word	32784
 757 0094 00000150 		.word	1342242816
 758 0098 00000250 		.word	1342308352
 759 009c 00000350 		.word	1342373888
 760              		.cfi_endproc
 761              	.LFE23:
 763              		.section	.text.GPIOIntStatus,"ax",%progbits
 764              		.align	2
 765              		.global	GPIOIntStatus
 766              		.code	16
 767              		.thumb_func
 769              	GPIOIntStatus:
 770              	.LFB24:
 325:../driver/gpio.c **** 
 326:../driver/gpio.c **** /*****************************************************************************
 327:../driver/gpio.c **** ** Function name:		GPIOIntStatus
 328:../driver/gpio.c **** **
 329:../driver/gpio.c **** ** Descriptions:		Get Interrupt status for a port pin.
 330:../driver/gpio.c **** **
 331:../driver/gpio.c **** ** parameters:			port num, bit position
 332:../driver/gpio.c **** ** Returned value:		None
 333:../driver/gpio.c **** ** 
 334:../driver/gpio.c **** *****************************************************************************/
 335:../driver/gpio.c **** uint32_t GPIOIntStatus( uint32_t portNum, uint32_t bitPosi )
 336:../driver/gpio.c **** {
 771              		.loc 1 336 0
 772              		.cfi_startproc
 773              		@ args = 0, pretend = 0, frame = 16
 774              		@ frame_needed = 1, uses_anonymous_args = 0
 775 0000 80B5     		push	{r7, lr}
 776              		.cfi_def_cfa_offset 8
 777              		.cfi_offset 7, -8
 778              		.cfi_offset 14, -4
 779 0002 84B0     		sub	sp, sp, #16
 780              		.cfi_def_cfa_offset 24
 781 0004 00AF     		add	r7, sp, #0
 782              		.cfi_def_cfa_register 7
 783 0006 7860     		str	r0, [r7, #4]
 784 0008 3960     		str	r1, [r7]
 337:../driver/gpio.c ****   uint32_t regVal = 0;
 785              		.loc 1 337 0
 786 000a 0023     		movs	r3, #0
 787 000c FB60     		str	r3, [r7, #12]
 338:../driver/gpio.c **** 
 339:../driver/gpio.c ****   switch ( portNum )
 788              		.loc 1 339 0
 789 000e 7B68     		ldr	r3, [r7, #4]
 790 0010 012B     		cmp	r3, #1
 791 0012 12D0     		beq	.L62
 792 0014 04D3     		bcc	.L63
 793 0016 022B     		cmp	r3, #2
 794 0018 1BD0     		beq	.L64
 795 001a 032B     		cmp	r3, #3
 796 001c 25D0     		beq	.L65
 340:../driver/gpio.c ****   {
 341:../driver/gpio.c **** 	case PORT0:
 342:../driver/gpio.c **** 	  if ( LPC_GPIO0->MIS & (0x1<<bitPosi) )
 343:../driver/gpio.c **** 		regVal = 1;
 344:../driver/gpio.c **** 	break;
 345:../driver/gpio.c ****  	case PORT1:
 346:../driver/gpio.c **** 	  if ( LPC_GPIO1->MIS & (0x1<<bitPosi) )
 347:../driver/gpio.c **** 		regVal = 1;	
 348:../driver/gpio.c **** 	break;
 349:../driver/gpio.c **** 	case PORT2:
 350:../driver/gpio.c **** 	  if ( LPC_GPIO2->MIS & (0x1<<bitPosi) )
 351:../driver/gpio.c **** 		regVal = 1;		    
 352:../driver/gpio.c **** 	break;
 353:../driver/gpio.c **** 	case PORT3:
 354:../driver/gpio.c **** 	  if ( LPC_GPIO3->MIS & (0x1<<bitPosi) )
 355:../driver/gpio.c **** 		regVal = 1;		    
 356:../driver/gpio.c **** 	break;
 357:../driver/gpio.c **** 	default:
 358:../driver/gpio.c **** 	  break;
 797              		.loc 1 358 0
 798 001e 37E0     		b	.L67
 799              	.L63:
 342:../driver/gpio.c **** 		regVal = 1;
 800              		.loc 1 342 0
 801 0020 A023     		movs	r3, #160
 802 0022 DB05     		lsls	r3, r3, #23
 803 0024 1D4A     		ldr	r2, .L76
 804 0026 9B58     		ldr	r3, [r3, r2]
 805 0028 0121     		movs	r1, #1
 806 002a 3A68     		ldr	r2, [r7]
 807 002c 9140     		lsls	r1, r1, r2
 808 002e 0A00     		movs	r2, r1
 809 0030 1340     		ands	r3, r2
 810 0032 26D0     		beq	.L72
 343:../driver/gpio.c **** 	break;
 811              		.loc 1 343 0
 812 0034 0123     		movs	r3, #1
 813 0036 FB60     		str	r3, [r7, #12]
 344:../driver/gpio.c ****  	case PORT1:
 814              		.loc 1 344 0
 815 0038 23E0     		b	.L72
 816              	.L62:
 346:../driver/gpio.c **** 		regVal = 1;	
 817              		.loc 1 346 0
 818 003a 194A     		ldr	r2, .L76+4
 819 003c 174B     		ldr	r3, .L76
 820 003e D358     		ldr	r3, [r2, r3]
 821 0040 0121     		movs	r1, #1
 822 0042 3A68     		ldr	r2, [r7]
 823 0044 9140     		lsls	r1, r1, r2
 824 0046 0A00     		movs	r2, r1
 825 0048 1340     		ands	r3, r2
 826 004a 1CD0     		beq	.L73
 347:../driver/gpio.c **** 	break;
 827              		.loc 1 347 0
 828 004c 0123     		movs	r3, #1
 829 004e FB60     		str	r3, [r7, #12]
 348:../driver/gpio.c **** 	case PORT2:
 830              		.loc 1 348 0
 831 0050 19E0     		b	.L73
 832              	.L64:
 350:../driver/gpio.c **** 		regVal = 1;		    
 833              		.loc 1 350 0
 834 0052 144A     		ldr	r2, .L76+8
 835 0054 114B     		ldr	r3, .L76
 836 0056 D358     		ldr	r3, [r2, r3]
 837 0058 0121     		movs	r1, #1
 838 005a 3A68     		ldr	r2, [r7]
 839 005c 9140     		lsls	r1, r1, r2
 840 005e 0A00     		movs	r2, r1
 841 0060 1340     		ands	r3, r2
 842 0062 12D0     		beq	.L74
 351:../driver/gpio.c **** 	break;
 843              		.loc 1 351 0
 844 0064 0123     		movs	r3, #1
 845 0066 FB60     		str	r3, [r7, #12]
 352:../driver/gpio.c **** 	case PORT3:
 846              		.loc 1 352 0
 847 0068 0FE0     		b	.L74
 848              	.L65:
 354:../driver/gpio.c **** 		regVal = 1;		    
 849              		.loc 1 354 0
 850 006a 0F4A     		ldr	r2, .L76+12
 851 006c 0B4B     		ldr	r3, .L76
 852 006e D358     		ldr	r3, [r2, r3]
 853 0070 0121     		movs	r1, #1
 854 0072 3A68     		ldr	r2, [r7]
 855 0074 9140     		lsls	r1, r1, r2
 856 0076 0A00     		movs	r2, r1
 857 0078 1340     		ands	r3, r2
 858 007a 08D0     		beq	.L75
 355:../driver/gpio.c **** 	break;
 859              		.loc 1 355 0
 860 007c 0123     		movs	r3, #1
 861 007e FB60     		str	r3, [r7, #12]
 356:../driver/gpio.c **** 	default:
 862              		.loc 1 356 0
 863 0080 05E0     		b	.L75
 864              	.L72:
 344:../driver/gpio.c ****  	case PORT1:
 865              		.loc 1 344 0
 866 0082 C046     		nop
 867 0084 04E0     		b	.L67
 868              	.L73:
 348:../driver/gpio.c **** 	case PORT2:
 869              		.loc 1 348 0
 870 0086 C046     		nop
 871 0088 02E0     		b	.L67
 872              	.L74:
 352:../driver/gpio.c **** 	case PORT3:
 873              		.loc 1 352 0
 874 008a C046     		nop
 875 008c 00E0     		b	.L67
 876              	.L75:
 356:../driver/gpio.c **** 	default:
 877              		.loc 1 356 0
 878 008e C046     		nop
 879              	.L67:
 359:../driver/gpio.c ****   }
 360:../driver/gpio.c ****   return ( regVal );
 880              		.loc 1 360 0
 881 0090 FB68     		ldr	r3, [r7, #12]
 361:../driver/gpio.c **** }
 882              		.loc 1 361 0
 883 0092 1800     		movs	r0, r3
 884 0094 BD46     		mov	sp, r7
 885 0096 04B0     		add	sp, sp, #16
 886              		@ sp needed
 887 0098 80BD     		pop	{r7, pc}
 888              	.L77:
 889 009a C046     		.align	2
 890              	.L76:
 891 009c 18800000 		.word	32792
 892 00a0 00000150 		.word	1342242816
 893 00a4 00000250 		.word	1342308352
 894 00a8 00000350 		.word	1342373888
 895              		.cfi_endproc
 896              	.LFE24:
 898              		.section	.text.GPIOIntClear,"ax",%progbits
 899              		.align	2
 900              		.global	GPIOIntClear
 901              		.code	16
 902              		.thumb_func
 904              	GPIOIntClear:
 905              	.LFB25:
 362:../driver/gpio.c **** 
 363:../driver/gpio.c **** /*****************************************************************************
 364:../driver/gpio.c **** ** Function name:		GPIOIntClear
 365:../driver/gpio.c **** **
 366:../driver/gpio.c **** ** Descriptions:		Clear Interrupt for a port pin.
 367:../driver/gpio.c **** **
 368:../driver/gpio.c **** ** parameters:			port num, bit position
 369:../driver/gpio.c **** ** Returned value:		None
 370:../driver/gpio.c **** ** 
 371:../driver/gpio.c **** *****************************************************************************/
 372:../driver/gpio.c **** void GPIOIntClear( uint32_t portNum, uint32_t bitPosi )
 373:../driver/gpio.c **** {
 906              		.loc 1 373 0
 907              		.cfi_startproc
 908              		@ args = 0, pretend = 0, frame = 8
 909              		@ frame_needed = 1, uses_anonymous_args = 0
 910 0000 80B5     		push	{r7, lr}
 911              		.cfi_def_cfa_offset 8
 912              		.cfi_offset 7, -8
 913              		.cfi_offset 14, -4
 914 0002 82B0     		sub	sp, sp, #8
 915              		.cfi_def_cfa_offset 16
 916 0004 00AF     		add	r7, sp, #0
 917              		.cfi_def_cfa_register 7
 918 0006 7860     		str	r0, [r7, #4]
 919 0008 3960     		str	r1, [r7]
 374:../driver/gpio.c ****   switch ( portNum )
 920              		.loc 1 374 0
 921 000a 7B68     		ldr	r3, [r7, #4]
 922 000c 012B     		cmp	r3, #1
 923 000e 13D0     		beq	.L80
 924 0010 04D3     		bcc	.L81
 925 0012 022B     		cmp	r3, #2
 926 0014 1CD0     		beq	.L82
 927 0016 032B     		cmp	r3, #3
 928 0018 26D0     		beq	.L83
 375:../driver/gpio.c ****   {
 376:../driver/gpio.c **** 	case PORT0:
 377:../driver/gpio.c **** 	  LPC_GPIO0->IC |= (0x1<<bitPosi); 
 378:../driver/gpio.c **** 	break;
 379:../driver/gpio.c ****  	case PORT1:
 380:../driver/gpio.c **** 	  LPC_GPIO1->IC |= (0x1<<bitPosi);	
 381:../driver/gpio.c **** 	break;
 382:../driver/gpio.c **** 	case PORT2:
 383:../driver/gpio.c **** 	  LPC_GPIO2->IC |= (0x1<<bitPosi);	    
 384:../driver/gpio.c **** 	break;
 385:../driver/gpio.c **** 	case PORT3:
 386:../driver/gpio.c **** 	  LPC_GPIO3->IC |= (0x1<<bitPosi);	    
 387:../driver/gpio.c **** 	break;
 388:../driver/gpio.c **** 	default:
 389:../driver/gpio.c **** 	  break;
 929              		.loc 1 389 0
 930 001a 31E0     		b	.L84
 931              	.L81:
 377:../driver/gpio.c **** 	break;
 932              		.loc 1 377 0
 933 001c A023     		movs	r3, #160
 934 001e DB05     		lsls	r3, r3, #23
 935 0020 A022     		movs	r2, #160
 936 0022 D205     		lsls	r2, r2, #23
 937 0024 1849     		ldr	r1, .L86
 938 0026 5258     		ldr	r2, [r2, r1]
 939 0028 0120     		movs	r0, #1
 940 002a 3968     		ldr	r1, [r7]
 941 002c 8840     		lsls	r0, r0, r1
 942 002e 0100     		movs	r1, r0
 943 0030 0A43     		orrs	r2, r1
 944 0032 1549     		ldr	r1, .L86
 945 0034 5A50     		str	r2, [r3, r1]
 378:../driver/gpio.c ****  	case PORT1:
 946              		.loc 1 378 0
 947 0036 23E0     		b	.L84
 948              	.L80:
 380:../driver/gpio.c **** 	break;
 949              		.loc 1 380 0
 950 0038 1449     		ldr	r1, .L86+4
 951 003a 144A     		ldr	r2, .L86+4
 952 003c 124B     		ldr	r3, .L86
 953 003e D358     		ldr	r3, [r2, r3]
 954 0040 0120     		movs	r0, #1
 955 0042 3A68     		ldr	r2, [r7]
 956 0044 9040     		lsls	r0, r0, r2
 957 0046 0200     		movs	r2, r0
 958 0048 1343     		orrs	r3, r2
 959 004a 0F4A     		ldr	r2, .L86
 960 004c 8B50     		str	r3, [r1, r2]
 381:../driver/gpio.c **** 	case PORT2:
 961              		.loc 1 381 0
 962 004e 17E0     		b	.L84
 963              	.L82:
 383:../driver/gpio.c **** 	break;
 964              		.loc 1 383 0
 965 0050 0F49     		ldr	r1, .L86+8
 966 0052 0F4A     		ldr	r2, .L86+8
 967 0054 0C4B     		ldr	r3, .L86
 968 0056 D358     		ldr	r3, [r2, r3]
 969 0058 0120     		movs	r0, #1
 970 005a 3A68     		ldr	r2, [r7]
 971 005c 9040     		lsls	r0, r0, r2
 972 005e 0200     		movs	r2, r0
 973 0060 1343     		orrs	r3, r2
 974 0062 094A     		ldr	r2, .L86
 975 0064 8B50     		str	r3, [r1, r2]
 384:../driver/gpio.c **** 	case PORT3:
 976              		.loc 1 384 0
 977 0066 0BE0     		b	.L84
 978              	.L83:
 386:../driver/gpio.c **** 	break;
 979              		.loc 1 386 0
 980 0068 0A49     		ldr	r1, .L86+12
 981 006a 0A4A     		ldr	r2, .L86+12
 982 006c 064B     		ldr	r3, .L86
 983 006e D358     		ldr	r3, [r2, r3]
 984 0070 0120     		movs	r0, #1
 985 0072 3A68     		ldr	r2, [r7]
 986 0074 9040     		lsls	r0, r0, r2
 987 0076 0200     		movs	r2, r0
 988 0078 1343     		orrs	r3, r2
 989 007a 034A     		ldr	r2, .L86
 990 007c 8B50     		str	r3, [r1, r2]
 387:../driver/gpio.c **** 	default:
 991              		.loc 1 387 0
 992 007e C046     		nop
 993              	.L84:
 390:../driver/gpio.c ****   }
 391:../driver/gpio.c ****   return;
 994              		.loc 1 391 0 discriminator 1
 995 0080 C046     		nop
 392:../driver/gpio.c **** }
 996              		.loc 1 392 0 discriminator 1
 997 0082 BD46     		mov	sp, r7
 998 0084 02B0     		add	sp, sp, #8
 999              		@ sp needed
 1000 0086 80BD     		pop	{r7, pc}
 1001              	.L87:
 1002              		.align	2
 1003              	.L86:
 1004 0088 1C800000 		.word	32796
 1005 008c 00000150 		.word	1342242816
 1006 0090 00000250 		.word	1342308352
 1007 0094 00000350 		.word	1342373888
 1008              		.cfi_endproc
 1009              	.LFE25:
 1011              		.section	.text.GPIOSetValue,"ax",%progbits
 1012              		.align	2
 1013              		.global	GPIOSetValue
 1014              		.code	16
 1015              		.thumb_func
 1017              	GPIOSetValue:
 1018              	.LFB26:
 393:../driver/gpio.c **** 
 394:../driver/gpio.c **** /*****************************************************************************
 395:../driver/gpio.c **** ** Function name:		GPIOSetValue
 396:../driver/gpio.c **** **
 397:../driver/gpio.c **** ** Descriptions:		Set/clear a bitvalue in a specific bit position
 398:../driver/gpio.c **** **						in GPIO portX(X is the port number.)
 399:../driver/gpio.c **** **
 400:../driver/gpio.c **** ** parameters:			port num, bit position, bit value
 401:../driver/gpio.c **** ** Returned value:		None
 402:../driver/gpio.c **** **
 403:../driver/gpio.c **** *****************************************************************************/
 404:../driver/gpio.c **** void GPIOSetValue( uint32_t portNum, uint32_t bitPosi, uint32_t bitVal )
 405:../driver/gpio.c **** {
 1019              		.loc 1 405 0
 1020              		.cfi_startproc
 1021              		@ args = 0, pretend = 0, frame = 16
 1022              		@ frame_needed = 1, uses_anonymous_args = 0
 1023 0000 80B5     		push	{r7, lr}
 1024              		.cfi_def_cfa_offset 8
 1025              		.cfi_offset 7, -8
 1026              		.cfi_offset 14, -4
 1027 0002 84B0     		sub	sp, sp, #16
 1028              		.cfi_def_cfa_offset 24
 1029 0004 00AF     		add	r7, sp, #0
 1030              		.cfi_def_cfa_register 7
 1031 0006 F860     		str	r0, [r7, #12]
 1032 0008 B960     		str	r1, [r7, #8]
 1033 000a 7A60     		str	r2, [r7, #4]
 406:../driver/gpio.c ****   LPC_GPIO[portNum]->MASKED_ACCESS[(1<<bitPosi)] = (bitVal<<bitPosi);
 1034              		.loc 1 406 0
 1035 000c 084B     		ldr	r3, .L89
 1036 000e FA68     		ldr	r2, [r7, #12]
 1037 0010 9200     		lsls	r2, r2, #2
 1038 0012 D358     		ldr	r3, [r2, r3]
 1039 0014 0121     		movs	r1, #1
 1040 0016 BA68     		ldr	r2, [r7, #8]
 1041 0018 9140     		lsls	r1, r1, r2
 1042 001a 0A00     		movs	r2, r1
 1043 001c 7868     		ldr	r0, [r7, #4]
 1044 001e B968     		ldr	r1, [r7, #8]
 1045 0020 8840     		lsls	r0, r0, r1
 1046 0022 0100     		movs	r1, r0
 1047 0024 9200     		lsls	r2, r2, #2
 1048 0026 D150     		str	r1, [r2, r3]
 407:../driver/gpio.c **** }
 1049              		.loc 1 407 0
 1050 0028 C046     		nop
 1051 002a BD46     		mov	sp, r7
 1052 002c 04B0     		add	sp, sp, #16
 1053              		@ sp needed
 1054 002e 80BD     		pop	{r7, pc}
 1055              	.L90:
 1056              		.align	2
 1057              	.L89:
 1058 0030 00000000 		.word	LPC_GPIO
 1059              		.cfi_endproc
 1060              	.LFE26:
 1062              		.section	.text.GPIOSetDir,"ax",%progbits
 1063              		.align	2
 1064              		.global	GPIOSetDir
 1065              		.code	16
 1066              		.thumb_func
 1068              	GPIOSetDir:
 1069              	.LFB27:
 408:../driver/gpio.c **** 
 409:../driver/gpio.c **** /*****************************************************************************
 410:../driver/gpio.c **** ** Function name:		GPIOSetDir
 411:../driver/gpio.c **** **
 412:../driver/gpio.c **** ** Descriptions:		Set the direction in GPIO port
 413:../driver/gpio.c **** **
 414:../driver/gpio.c **** ** parameters:			port num, bit position, direction (1 out, 0 input)
 415:../driver/gpio.c **** ** Returned value:		None
 416:../driver/gpio.c **** **
 417:../driver/gpio.c **** *****************************************************************************/
 418:../driver/gpio.c **** void GPIOSetDir( uint32_t portNum, uint32_t bitPosi, uint32_t dir )
 419:../driver/gpio.c **** {
 1070              		.loc 1 419 0
 1071              		.cfi_startproc
 1072              		@ args = 0, pretend = 0, frame = 16
 1073              		@ frame_needed = 1, uses_anonymous_args = 0
 1074 0000 80B5     		push	{r7, lr}
 1075              		.cfi_def_cfa_offset 8
 1076              		.cfi_offset 7, -8
 1077              		.cfi_offset 14, -4
 1078 0002 84B0     		sub	sp, sp, #16
 1079              		.cfi_def_cfa_offset 24
 1080 0004 00AF     		add	r7, sp, #0
 1081              		.cfi_def_cfa_register 7
 1082 0006 F860     		str	r0, [r7, #12]
 1083 0008 B960     		str	r1, [r7, #8]
 1084 000a 7A60     		str	r2, [r7, #4]
 420:../driver/gpio.c ****   if(dir)
 1085              		.loc 1 420 0
 1086 000c 7B68     		ldr	r3, [r7, #4]
 1087 000e 002B     		cmp	r3, #0
 1088 0010 13D0     		beq	.L92
 421:../driver/gpio.c **** 	LPC_GPIO[portNum]->DIR |= 1<<bitPosi;
 1089              		.loc 1 421 0
 1090 0012 164B     		ldr	r3, .L95
 1091 0014 FA68     		ldr	r2, [r7, #12]
 1092 0016 9200     		lsls	r2, r2, #2
 1093 0018 D258     		ldr	r2, [r2, r3]
 1094 001a 144B     		ldr	r3, .L95
 1095 001c F968     		ldr	r1, [r7, #12]
 1096 001e 8900     		lsls	r1, r1, #2
 1097 0020 C958     		ldr	r1, [r1, r3]
 1098 0022 8023     		movs	r3, #128
 1099 0024 1B02     		lsls	r3, r3, #8
 1100 0026 CB58     		ldr	r3, [r1, r3]
 1101 0028 0120     		movs	r0, #1
 1102 002a B968     		ldr	r1, [r7, #8]
 1103 002c 8840     		lsls	r0, r0, r1
 1104 002e 0100     		movs	r1, r0
 1105 0030 1943     		orrs	r1, r3
 1106 0032 8023     		movs	r3, #128
 1107 0034 1B02     		lsls	r3, r3, #8
 1108 0036 D150     		str	r1, [r2, r3]
 422:../driver/gpio.c ****   else
 423:../driver/gpio.c **** 	LPC_GPIO[portNum]->DIR &= ~(1<<bitPosi);
 424:../driver/gpio.c **** }
 1109              		.loc 1 424 0
 1110 0038 13E0     		b	.L94
 1111              	.L92:
 423:../driver/gpio.c **** }
 1112              		.loc 1 423 0
 1113 003a 0C4B     		ldr	r3, .L95
 1114 003c FA68     		ldr	r2, [r7, #12]
 1115 003e 9200     		lsls	r2, r2, #2
 1116 0040 D258     		ldr	r2, [r2, r3]
 1117 0042 0A4B     		ldr	r3, .L95
 1118 0044 F968     		ldr	r1, [r7, #12]
 1119 0046 8900     		lsls	r1, r1, #2
 1120 0048 C958     		ldr	r1, [r1, r3]
 1121 004a 8023     		movs	r3, #128
 1122 004c 1B02     		lsls	r3, r3, #8
 1123 004e CB58     		ldr	r3, [r1, r3]
 1124 0050 0120     		movs	r0, #1
 1125 0052 B968     		ldr	r1, [r7, #8]
 1126 0054 8840     		lsls	r0, r0, r1
 1127 0056 0100     		movs	r1, r0
 1128 0058 C943     		mvns	r1, r1
 1129 005a 1940     		ands	r1, r3
 1130 005c 8023     		movs	r3, #128
 1131 005e 1B02     		lsls	r3, r3, #8
 1132 0060 D150     		str	r1, [r2, r3]
 1133              	.L94:
 1134              		.loc 1 424 0
 1135 0062 C046     		nop
 1136 0064 BD46     		mov	sp, r7
 1137 0066 04B0     		add	sp, sp, #16
 1138              		@ sp needed
 1139 0068 80BD     		pop	{r7, pc}
 1140              	.L96:
 1141 006a C046     		.align	2
 1142              	.L95:
 1143 006c 00000000 		.word	LPC_GPIO
 1144              		.cfi_endproc
 1145              	.LFE27:
 1147              		.text
 1148              	.Letext0:
 1149              		.file 2 "/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis/LPC11xx.h"
 1150              		.file 3 "/usr/local/lpcxpresso_8.2.2_650/lpcxpresso/tools/redlib/include/stdint.h"
 1151              		.file 4 "../driver/gpio.h"
DEFINED SYMBOLS
                            *ABS*:00000000 gpio.c
     /tmp/cc4EN6fg.s:20     .rodata:00000000 $d
     /tmp/cc4EN6fg.s:23     .rodata:00000000 LPC_GPIO
     /tmp/cc4EN6fg.s:29     .text.GPIOInit:00000000 $t
     /tmp/cc4EN6fg.s:34     .text.GPIOInit:00000000 GPIOInit
     /tmp/cc4EN6fg.s:65     .text.GPIOInit:0000001c $d
     /tmp/cc4EN6fg.s:70     .text.GPIOSetInterrupt:00000000 $t
     /tmp/cc4EN6fg.s:75     .text.GPIOSetInterrupt:00000000 GPIOSetInterrupt
     /tmp/cc4EN6fg.s:524    .text.GPIOSetInterrupt:000002d4 $d
     /tmp/cc4EN6fg.s:534    .text.GPIOIntEnable:00000000 $t
     /tmp/cc4EN6fg.s:539    .text.GPIOIntEnable:00000000 GPIOIntEnable
     /tmp/cc4EN6fg.s:639    .text.GPIOIntEnable:00000088 $d
     /tmp/cc4EN6fg.s:647    .text.GPIOIntDisable:00000000 $t
     /tmp/cc4EN6fg.s:652    .text.GPIOIntDisable:00000000 GPIOIntDisable
     /tmp/cc4EN6fg.s:756    .text.GPIOIntDisable:00000090 $d
     /tmp/cc4EN6fg.s:764    .text.GPIOIntStatus:00000000 $t
     /tmp/cc4EN6fg.s:769    .text.GPIOIntStatus:00000000 GPIOIntStatus
     /tmp/cc4EN6fg.s:891    .text.GPIOIntStatus:0000009c $d
     /tmp/cc4EN6fg.s:899    .text.GPIOIntClear:00000000 $t
     /tmp/cc4EN6fg.s:904    .text.GPIOIntClear:00000000 GPIOIntClear
     /tmp/cc4EN6fg.s:1004   .text.GPIOIntClear:00000088 $d
     /tmp/cc4EN6fg.s:1012   .text.GPIOSetValue:00000000 $t
     /tmp/cc4EN6fg.s:1017   .text.GPIOSetValue:00000000 GPIOSetValue
     /tmp/cc4EN6fg.s:1058   .text.GPIOSetValue:00000030 $d
     /tmp/cc4EN6fg.s:1063   .text.GPIOSetDir:00000000 $t
     /tmp/cc4EN6fg.s:1068   .text.GPIOSetDir:00000000 GPIOSetDir
     /tmp/cc4EN6fg.s:1143   .text.GPIOSetDir:0000006c $d
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
                           .group:00000000 wm4.gpio.h.21.b2ddaf0d47502e45407acf26ba3b8ec3

NO UNDEFINED SYMBOLS
