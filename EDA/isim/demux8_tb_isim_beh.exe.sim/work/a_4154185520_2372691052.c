/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/EDA/New folder/EDA/demux8_tb.vhd";
extern char *IEEE_P_1242562249;
static const char *ng2 = "rem 0 asked for.  Divide by zero error.";

char *ieee_p_1242562249_sub_2563015576_1035706684(char *, char *, int , int );


static void work_a_4154185520_2372691052_p_0(char *t0)
{
    char t9[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    int t16;
    int64 t17;

LAB0:    t1 = (t0 + 1804U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2036);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3671);
    *((int *)t2) = 0;
    t3 = (t0 + 3675);
    *((int *)t3) = 6;
    t7 = 0;
    t8 = 6;

LAB4:    if (t7 <= t8)
        goto LAB5;

LAB7:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2036);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 3679);
    *((int *)t2) = 0;
    t3 = (t0 + 3683);
    *((int *)t3) = 6;
    t7 = 0;
    t8 = 6;

LAB17:    if (t7 <= t8)
        goto LAB18;

LAB20:    xsi_set_current_line(101, ng0);

LAB32:    *((char **)t1) = &&LAB33;

LAB1:    return;
LAB5:    xsi_set_current_line(90, ng0);
    t4 = (t0 + 3671);
    t5 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t9, *((int *)t4), 8);
    t6 = (t0 + 2072);
    t10 = (t6 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t5, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 3671);
    if (4 == 0)
        goto LAB8;

LAB9:    t14 = abs(*((int *)t2));
    t15 = (t14 % 4);
    if (*((int *)t2) < 0)
        goto LAB10;

LAB11:    t3 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t9, t15, 2);
    t4 = (t0 + 2108);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t10 = (t6 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(92, ng0);
    t17 = (20 * 1000LL);
    t2 = (t0 + 1704);
    xsi_process_wait(t2, t17);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB6:    t2 = (t0 + 3671);
    t7 = *((int *)t2);
    t3 = (t0 + 3675);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB7;

LAB16:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 3671);
    *((int *)t4) = t7;
    goto LAB4;

LAB8:    xsi_error(ng2);
    goto LAB9;

LAB10:    t16 = (-(t15));
    t15 = t16;
    goto LAB11;

LAB12:    goto LAB6;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB18:    xsi_set_current_line(97, ng0);
    t4 = (t0 + 3679);
    t5 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t9, *((int *)t4), 8);
    t6 = (t0 + 2072);
    t10 = (t6 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t5, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 3679);
    if (4 == 0)
        goto LAB21;

LAB22:    t14 = abs(*((int *)t2));
    t15 = (t14 % 4);
    if (*((int *)t2) < 0)
        goto LAB23;

LAB24:    t3 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t9, t15, 2);
    t4 = (t0 + 2108);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t10 = (t6 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(99, ng0);
    t17 = (20 * 1000LL);
    t2 = (t0 + 1704);
    xsi_process_wait(t2, t17);

LAB27:    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB19:    t2 = (t0 + 3679);
    t7 = *((int *)t2);
    t3 = (t0 + 3683);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB20;

LAB29:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 3679);
    *((int *)t4) = t7;
    goto LAB17;

LAB21:    xsi_error(ng2);
    goto LAB22;

LAB23:    t16 = (-(t15));
    t15 = t16;
    goto LAB24;

LAB25:    goto LAB19;

LAB26:    goto LAB25;

LAB28:    goto LAB26;

LAB30:    goto LAB2;

LAB31:    goto LAB30;

LAB33:    goto LAB31;

}


extern void work_a_4154185520_2372691052_init()
{
	static char *pe[] = {(void *)work_a_4154185520_2372691052_p_0};
	xsi_register_didat("work_a_4154185520_2372691052", "isim/demux8_tb_isim_beh.exe.sim/work/a_4154185520_2372691052.didat");
	xsi_register_executes(pe);
}
