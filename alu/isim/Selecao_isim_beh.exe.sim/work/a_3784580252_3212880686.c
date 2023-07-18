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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/laboratorio-sd/alu/counter_seconds.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );


static void work_a_3784580252_3212880686_p_0(char *t0)
{
    char t15[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    unsigned char t10;
    char *t11;
    int t12;
    int t13;
    char *t14;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3312);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(22, ng0);
    t4 = (t0 + 1768U);
    t8 = *((char **)t4);
    t9 = *((int *)t8);
    t10 = (t9 <= 10);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t2 = (t0 + 5344U);
    t5 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t15, t4, t2, 1);
    t8 = (t15 + 12U);
    t16 = *((unsigned int *)t8);
    t17 = (1U * t16);
    t1 = (4U != t17);
    if (t1 == 1)
        goto LAB11;

LAB12:    t11 = (t0 + 3408);
    t14 = (t11 + 56U);
    t18 = *((char **)t14);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t5, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1768U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    *((int *)t2) = 0;

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(23, ng0);
    t4 = (t0 + 1768U);
    t11 = *((char **)t4);
    t12 = *((int *)t11);
    t13 = (t12 + 1);
    t4 = (t0 + 1768U);
    t14 = *((char **)t4);
    t4 = (t14 + 0);
    *((int *)t4) = t13;
    goto LAB9;

LAB11:    xsi_size_not_matching(4U, t17, 0);
    goto LAB12;

}

static void work_a_3784580252_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(31, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 3472);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3328);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3784580252_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3784580252_3212880686_p_0,(void *)work_a_3784580252_3212880686_p_1};
	xsi_register_didat("work_a_3784580252_3212880686", "isim/Selecao_isim_beh.exe.sim/work/a_3784580252_3212880686.didat");
	xsi_register_executes(pe);
}
