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
static const char *ng0 = "D:/EDA/New folder/EDA/ram.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_3830602496_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t1 = (t0 + 3948U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 1500U);
    t5 = *((char **)t4);
    t4 = (t5 + 0);
    *((int *)t4) = t3;
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 3964U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 1568U);
    t5 = *((char **)t4);
    t4 = (t5 + 0);
    *((int *)t4) = t3;
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 868U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB11;

LAB13:
LAB12:    t1 = (t0 + 2320);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1144U);
    t4 = *((char **)t1);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB8;

LAB9:    t8 = (unsigned char)0;

LAB10:    if (t8 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(55, ng0);
    t5 = (t0 + 592U);
    t12 = *((char **)t5);
    t5 = (t0 + 1500U);
    t13 = *((char **)t5);
    t3 = *((int *)t13);
    t14 = (t3 - 0);
    t15 = (t14 * 1);
    t16 = (8U * t15);
    t17 = (0U + t16);
    t5 = (t0 + 2364);
    t18 = (t5 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    memcpy(t21, t12, 8U);
    xsi_driver_first_trans_delta(t5, t17, 8U, 0LL);
    goto LAB6;

LAB8:    t1 = (t0 + 1120U);
    t11 = xsi_signal_has_event(t1);
    t8 = t11;
    goto LAB10;

LAB11:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1236U);
    t4 = *((char **)t1);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB17;

LAB18:    t8 = (unsigned char)0;

LAB19:    if (t8 != 0)
        goto LAB14;

LAB16:
LAB15:    goto LAB12;

LAB14:    xsi_set_current_line(60, ng0);
    t5 = (t0 + 1328U);
    t12 = *((char **)t5);
    t5 = (t0 + 1568U);
    t13 = *((char **)t5);
    t3 = *((int *)t13);
    t14 = (t3 - 0);
    t15 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, t3);
    t16 = (8U * t15);
    t17 = (0 + t16);
    t5 = (t12 + t17);
    t18 = (t0 + 2400);
    t19 = (t18 + 32U);
    t20 = *((char **)t19);
    t21 = (t20 + 40U);
    t22 = *((char **)t21);
    memcpy(t22, t5, 8U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB15;

LAB17:    t1 = (t0 + 1212U);
    t11 = xsi_signal_has_event(t1);
    t8 = t11;
    goto LAB19;

}


extern void work_a_3830602496_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3830602496_3212880686_p_0};
	xsi_register_didat("work_a_3830602496_3212880686", "isim/router_tb_isim_beh.exe.sim/work/a_3830602496_3212880686.didat");
	xsi_register_executes(pe);
}
