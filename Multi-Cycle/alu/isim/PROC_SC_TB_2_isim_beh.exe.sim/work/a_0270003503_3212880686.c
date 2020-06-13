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

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/greg/Videos/labOrganosi/alu/myCloud.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2045698577_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2770553711_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_3410769178_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_4004982826_1035706684(char *, char *, char *, char *, int );


static void work_a_0270003503_3212880686_p_0(char *t0)
{
    char t14[16];
    char t23[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4634);
    t4 = xsi_mem_cmp(t1, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB8:    t5 = (t0 + 4636);
    t7 = xsi_mem_cmp(t5, t2, 2U);
    if (t7 == 1)
        goto LAB4;

LAB9:    t8 = (t0 + 4638);
    t10 = xsi_mem_cmp(t8, t2, 2U);
    if (t10 == 1)
        goto LAB5;

LAB10:    t11 = (t0 + 4640);
    t13 = xsi_mem_cmp(t11, t2, 2U);
    if (t13 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(42, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 2832);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(38, ng0);
    t15 = (t0 + 1032U);
    t16 = *((char **)t15);
    t15 = (t0 + 4560U);
    t17 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t14, t16, t15, 32);
    t18 = (t0 + 2912);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t17, 32U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB2;

LAB4:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4560U);
    t3 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t23, t2, t1, 32);
    t5 = ieee_p_1242562249_sub_4004982826_1035706684(IEEE_P_1242562249, t14, t3, t23, 2);
    t6 = (t0 + 2912);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t5, 32U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB2;

LAB5:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4560U);
    t3 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t14, t2, t1, 32);
    t5 = (t0 + 2912);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t3, 32U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB2;

LAB6:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4560U);
    t3 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t23, t2, t1, 32);
    t5 = ieee_p_1242562249_sub_2770553711_1035706684(IEEE_P_1242562249, t14, t3, t23, 16);
    t6 = (t0 + 2912);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t5, 32U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB2;

LAB12:;
}


extern void work_a_0270003503_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0270003503_3212880686_p_0};
	xsi_register_didat("work_a_0270003503_3212880686", "isim/PROC_SC_TB_2_isim_beh.exe.sim/work/a_0270003503_3212880686.didat");
	xsi_register_executes(pe);
}
