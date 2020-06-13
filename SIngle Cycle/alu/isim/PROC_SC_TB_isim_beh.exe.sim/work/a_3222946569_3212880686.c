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
static const char *ng0 = "C:/Users/greg/Documents/labOrganosi/alu/CONTROL.vhd";



static void work_a_3222946569_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(27, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 10704);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast(t6);

LAB2:    t11 = (t0 + 10336);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3222946569_3212880686_p_1(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 4072U);
    t4 = *((char **)t3);
    t3 = (t0 + 15960);
    t6 = 1;
    if (6U == 6U)
        goto LAB11;

LAB12:    t6 = 0;

LAB13:    if (t6 == 1)
        goto LAB8;

LAB9:    t10 = (t0 + 4072U);
    t11 = *((char **)t10);
    t10 = (t0 + 15966);
    t13 = 1;
    if (6U == 6U)
        goto LAB17;

LAB18:    t13 = 0;

LAB19:    t2 = t13;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 4072U);
    t18 = *((char **)t17);
    t17 = (t0 + 15972);
    t20 = 1;
    if (6U == 6U)
        goto LAB23;

LAB24:    t20 = 0;

LAB25:    t1 = t20;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(35, ng0);
    t3 = (t0 + 10768);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t3);

LAB3:    t3 = (t0 + 10352);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(33, ng0);
    t24 = (t0 + 10768);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    *((unsigned char *)t28) = (unsigned char)2;
    xsi_driver_first_trans_fast(t24);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t7 = 0;

LAB14:    if (t7 < 6U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t8 = (t4 + t7);
    t9 = (t3 + t7);
    if (*((unsigned char *)t8) != *((unsigned char *)t9))
        goto LAB12;

LAB16:    t7 = (t7 + 1);
    goto LAB14;

LAB17:    t14 = 0;

LAB20:    if (t14 < 6U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t15 = (t11 + t14);
    t16 = (t10 + t14);
    if (*((unsigned char *)t15) != *((unsigned char *)t16))
        goto LAB18;

LAB22:    t14 = (t14 + 1);
    goto LAB20;

LAB23:    t21 = 0;

LAB26:    if (t21 < 6U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t22 = (t18 + t21);
    t23 = (t17 + t21);
    if (*((unsigned char *)t22) != *((unsigned char *)t23))
        goto LAB24;

LAB28:    t21 = (t21 + 1);
    goto LAB26;

}

static void work_a_3222946569_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 15978);
    t4 = 1;
    if (6U == 6U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 10832);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 10368);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(42, ng0);
    t8 = (t0 + 10832);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t8);
    goto LAB3;

LAB5:    t5 = 0;

LAB8:    if (t5 < 6U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

}

static void work_a_3222946569_3212880686_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 4072U);
    t3 = *((char **)t2);
    t4 = (5 - 5);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (t8 == (unsigned char)3);
    if (t9 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t2 = (t0 + 4072U);
    t3 = *((char **)t2);
    t2 = (t0 + 15984);
    t1 = 1;
    if (6U == 6U)
        goto LAB10;

LAB11:    t1 = 0;

LAB12:    if (t1 != 0)
        goto LAB8;

LAB9:    t2 = (t0 + 4072U);
    t3 = *((char **)t2);
    t2 = (t0 + 15994);
    t8 = 1;
    if (6U == 6U)
        goto LAB21;

LAB22:    t8 = 0;

LAB23:    if (t8 == 1)
        goto LAB18;

LAB19:    t19 = (t0 + 4072U);
    t23 = *((char **)t19);
    t19 = (t0 + 16000);
    t9 = 1;
    if (6U == 6U)
        goto LAB27;

LAB28:    t9 = 0;

LAB29:    t1 = t9;

LAB20:    if (t1 != 0)
        goto LAB16;

LAB17:    t2 = (t0 + 4072U);
    t3 = *((char **)t2);
    t2 = (t0 + 16010);
    t8 = 1;
    if (6U == 6U)
        goto LAB38;

LAB39:    t8 = 0;

LAB40:    if (t8 == 1)
        goto LAB35;

LAB36:    t19 = (t0 + 4072U);
    t23 = *((char **)t19);
    t19 = (t0 + 16016);
    t9 = 1;
    if (6U == 6U)
        goto LAB44;

LAB45:    t9 = 0;

LAB46:    t1 = t9;

LAB37:    if (t1 != 0)
        goto LAB33;

LAB34:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 16026);
    t10 = (t0 + 10896);
    t11 = (t10 + 56U);
    t18 = *((char **)t11);
    t19 = (t18 + 56U);
    t23 = *((char **)t19);
    memcpy(t23, t2, 4U);
    xsi_driver_first_trans_fast(t10);

LAB3:    t2 = (t0 + 10384);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(55, ng0);
    t18 = (t0 + 1032U);
    t19 = *((char **)t18);
    t20 = (31 - 3);
    t21 = (t20 * 1U);
    t22 = (0 + t21);
    t18 = (t19 + t22);
    t23 = (t0 + 10896);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t18, 4U);
    xsi_driver_first_trans_fast(t23);
    goto LAB3;

LAB5:    t10 = (t0 + 4072U);
    t11 = *((char **)t10);
    t12 = (4 - 5);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t10 = (t11 + t15);
    t16 = *((unsigned char *)t10);
    t17 = (t16 == (unsigned char)2);
    t1 = t17;
    goto LAB7;

LAB8:    xsi_set_current_line(57, ng0);
    t19 = (t0 + 15990);
    t24 = (t0 + 10896);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t19, 4U);
    xsi_driver_first_trans_fast(t24);
    goto LAB3;

LAB10:    t5 = 0;

LAB13:    if (t5 < 6U)
        goto LAB14;
    else
        goto LAB12;

LAB14:    t11 = (t3 + t5);
    t18 = (t2 + t5);
    if (*((unsigned char *)t11) != *((unsigned char *)t18))
        goto LAB11;

LAB15:    t5 = (t5 + 1);
    goto LAB13;

LAB16:    xsi_set_current_line(59, ng0);
    t27 = (t0 + 16006);
    t29 = (t0 + 10896);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t27, 4U);
    xsi_driver_first_trans_fast(t29);
    goto LAB3;

LAB18:    t1 = (unsigned char)1;
    goto LAB20;

LAB21:    t5 = 0;

LAB24:    if (t5 < 6U)
        goto LAB25;
    else
        goto LAB23;

LAB25:    t11 = (t3 + t5);
    t18 = (t2 + t5);
    if (*((unsigned char *)t11) != *((unsigned char *)t18))
        goto LAB22;

LAB26:    t5 = (t5 + 1);
    goto LAB24;

LAB27:    t6 = 0;

LAB30:    if (t6 < 6U)
        goto LAB31;
    else
        goto LAB29;

LAB31:    t25 = (t23 + t6);
    t26 = (t19 + t6);
    if (*((unsigned char *)t25) != *((unsigned char *)t26))
        goto LAB28;

LAB32:    t6 = (t6 + 1);
    goto LAB30;

LAB33:    xsi_set_current_line(61, ng0);
    t27 = (t0 + 16022);
    t29 = (t0 + 10896);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t27, 4U);
    xsi_driver_first_trans_fast(t29);
    goto LAB3;

LAB35:    t1 = (unsigned char)1;
    goto LAB37;

LAB38:    t5 = 0;

LAB41:    if (t5 < 6U)
        goto LAB42;
    else
        goto LAB40;

LAB42:    t11 = (t3 + t5);
    t18 = (t2 + t5);
    if (*((unsigned char *)t11) != *((unsigned char *)t18))
        goto LAB39;

LAB43:    t5 = (t5 + 1);
    goto LAB41;

LAB44:    t6 = 0;

LAB47:    if (t6 < 6U)
        goto LAB48;
    else
        goto LAB46;

LAB48:    t25 = (t23 + t6);
    t26 = (t19 + t6);
    if (*((unsigned char *)t25) != *((unsigned char *)t26))
        goto LAB45;

LAB49:    t6 = (t6 + 1);
    goto LAB47;

}

static void work_a_3222946569_3212880686_p_4(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 4072U);
    t3 = *((char **)t2);
    t2 = (t0 + 16030);
    t5 = 1;
    if (6U == 6U)
        goto LAB8;

LAB9:    t5 = 0;

LAB10:    if (t5 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 4072U);
    t10 = *((char **)t9);
    t9 = (t0 + 16036);
    t12 = 1;
    if (6U == 6U)
        goto LAB14;

LAB15:    t12 = 0;

LAB16:    t1 = t12;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 10960);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB3:    t2 = (t0 + 10400);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(71, ng0);
    t16 = (t0 + 10960);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast(t16);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t6 = 0;

LAB11:    if (t6 < 6U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t7 = (t3 + t6);
    t8 = (t2 + t6);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB9;

LAB13:    t6 = (t6 + 1);
    goto LAB11;

LAB14:    t13 = 0;

LAB17:    if (t13 < 6U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t14 = (t10 + t13);
    t15 = (t9 + t13);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB15;

LAB19:    t13 = (t13 + 1);
    goto LAB17;

}

static void work_a_3222946569_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;

LAB0:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 16042);
    t4 = 1;
    if (6U == 6U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 16048);
    t4 = 1;
    if (6U == 6U)
        goto LAB13;

LAB14:    t4 = 0;

LAB15:    if (t4 != 0)
        goto LAB11;

LAB12:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 16054);
    t4 = 1;
    if (6U == 6U)
        goto LAB24;

LAB25:    t4 = 0;

LAB26:    if (t4 != 0)
        goto LAB22;

LAB23:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 11024);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 10416);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(81, ng0);
    t8 = (t0 + 11024);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t8);
    goto LAB3;

LAB5:    t5 = 0;

LAB8:    if (t5 < 6U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    xsi_set_current_line(83, ng0);
    t8 = (t0 + 2632U);
    t9 = *((char **)t8);
    t13 = *((unsigned char *)t9);
    t14 = (t13 == (unsigned char)2);
    if (t14 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 11024);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB20:    goto LAB3;

LAB13:    t5 = 0;

LAB16:    if (t5 < 6U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB14;

LAB18:    t5 = (t5 + 1);
    goto LAB16;

LAB19:    xsi_set_current_line(84, ng0);
    t8 = (t0 + 11024);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t8);
    goto LAB20;

LAB22:    xsi_set_current_line(89, ng0);
    t8 = (t0 + 2632U);
    t9 = *((char **)t8);
    t13 = *((unsigned char *)t9);
    t14 = (t13 == (unsigned char)2);
    if (t14 != 0)
        goto LAB30;

LAB32:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 11024);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB31:    goto LAB3;

LAB24:    t5 = 0;

LAB27:    if (t5 < 6U)
        goto LAB28;
    else
        goto LAB26;

LAB28:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB25;

LAB29:    t5 = (t5 + 1);
    goto LAB27;

LAB30:    xsi_set_current_line(90, ng0);
    t8 = (t0 + 11024);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t8);
    goto LAB31;

}

static void work_a_3222946569_3212880686_p_6(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 4072U);
    t3 = *((char **)t2);
    t2 = (t0 + 16060);
    t5 = 1;
    if (6U == 6U)
        goto LAB8;

LAB9:    t5 = 0;

LAB10:    if (t5 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 4072U);
    t10 = *((char **)t9);
    t9 = (t0 + 16066);
    t12 = 1;
    if (6U == 6U)
        goto LAB14;

LAB15:    t12 = 0;

LAB16:    t1 = t12;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 11088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB3:    t2 = (t0 + 10432);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(103, ng0);
    t16 = (t0 + 11088);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast(t16);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t6 = 0;

LAB11:    if (t6 < 6U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t7 = (t3 + t6);
    t8 = (t2 + t6);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB9;

LAB13:    t6 = (t6 + 1);
    goto LAB11;

LAB14:    t13 = 0;

LAB17:    if (t13 < 6U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t14 = (t10 + t13);
    t15 = (t9 + t13);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB15;

LAB19:    t13 = (t13 + 1);
    goto LAB17;

}

static void work_a_3222946569_3212880686_p_7(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(112, ng0);
    t3 = (t0 + 4072U);
    t4 = *((char **)t3);
    t3 = (t0 + 16072);
    t6 = 1;
    if (6U == 6U)
        goto LAB11;

LAB12:    t6 = 0;

LAB13:    if (t6 == 1)
        goto LAB8;

LAB9:    t10 = (t0 + 4072U);
    t11 = *((char **)t10);
    t10 = (t0 + 16078);
    t13 = 1;
    if (6U == 6U)
        goto LAB17;

LAB18:    t13 = 0;

LAB19:    t2 = t13;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 4072U);
    t18 = *((char **)t17);
    t17 = (t0 + 16084);
    t20 = 1;
    if (6U == 6U)
        goto LAB23;

LAB24:    t20 = 0;

LAB25:    t1 = t20;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(115, ng0);
    t3 = (t0 + 11152);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t3);

LAB3:    t3 = (t0 + 10448);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(113, ng0);
    t24 = (t0 + 11152);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    *((unsigned char *)t28) = (unsigned char)3;
    xsi_driver_first_trans_fast(t24);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t7 = 0;

LAB14:    if (t7 < 6U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t8 = (t4 + t7);
    t9 = (t3 + t7);
    if (*((unsigned char *)t8) != *((unsigned char *)t9))
        goto LAB12;

LAB16:    t7 = (t7 + 1);
    goto LAB14;

LAB17:    t14 = 0;

LAB20:    if (t14 < 6U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t15 = (t11 + t14);
    t16 = (t10 + t14);
    if (*((unsigned char *)t15) != *((unsigned char *)t16))
        goto LAB18;

LAB22:    t14 = (t14 + 1);
    goto LAB20;

LAB23:    t21 = 0;

LAB26:    if (t21 < 6U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t22 = (t18 + t21);
    t23 = (t17 + t21);
    if (*((unsigned char *)t22) != *((unsigned char *)t23))
        goto LAB24;

LAB28:    t21 = (t21 + 1);
    goto LAB26;

}

static void work_a_3222946569_3212880686_p_8(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned char t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(122, ng0);
    t4 = (t0 + 4072U);
    t5 = *((char **)t4);
    t4 = (t0 + 16090);
    t7 = 1;
    if (6U == 6U)
        goto LAB14;

LAB15:    t7 = 0;

LAB16:    if (t7 == 1)
        goto LAB11;

LAB12:    t11 = (t0 + 4072U);
    t12 = *((char **)t11);
    t11 = (t0 + 16096);
    t14 = 1;
    if (6U == 6U)
        goto LAB20;

LAB21:    t14 = 0;

LAB22:    t3 = t14;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t18 = (t0 + 4072U);
    t19 = *((char **)t18);
    t18 = (t0 + 16102);
    t21 = 1;
    if (6U == 6U)
        goto LAB26;

LAB27:    t21 = 0;

LAB28:    t2 = t21;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t25 = (t0 + 4072U);
    t26 = *((char **)t25);
    t25 = (t0 + 16108);
    t28 = 1;
    if (6U == 6U)
        goto LAB32;

LAB33:    t28 = 0;

LAB34:    t1 = t28;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(125, ng0);
    t4 = (t0 + 11216);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t4);

LAB3:    t4 = (t0 + 10464);
    *((int *)t4) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(123, ng0);
    t32 = (t0 + 11216);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    *((unsigned char *)t36) = (unsigned char)2;
    xsi_driver_first_trans_fast(t32);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t3 = (unsigned char)1;
    goto LAB13;

LAB14:    t8 = 0;

LAB17:    if (t8 < 6U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t9 = (t5 + t8);
    t10 = (t4 + t8);
    if (*((unsigned char *)t9) != *((unsigned char *)t10))
        goto LAB15;

LAB19:    t8 = (t8 + 1);
    goto LAB17;

LAB20:    t15 = 0;

LAB23:    if (t15 < 6U)
        goto LAB24;
    else
        goto LAB22;

LAB24:    t16 = (t12 + t15);
    t17 = (t11 + t15);
    if (*((unsigned char *)t16) != *((unsigned char *)t17))
        goto LAB21;

LAB25:    t15 = (t15 + 1);
    goto LAB23;

LAB26:    t22 = 0;

LAB29:    if (t22 < 6U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t23 = (t19 + t22);
    t24 = (t18 + t22);
    if (*((unsigned char *)t23) != *((unsigned char *)t24))
        goto LAB27;

LAB31:    t22 = (t22 + 1);
    goto LAB29;

LAB32:    t29 = 0;

LAB35:    if (t29 < 6U)
        goto LAB36;
    else
        goto LAB34;

LAB36:    t30 = (t26 + t29);
    t31 = (t25 + t29);
    if (*((unsigned char *)t30) != *((unsigned char *)t31))
        goto LAB33;

LAB37:    t29 = (t29 + 1);
    goto LAB35;

}

static void work_a_3222946569_3212880686_p_9(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned char t23;
    unsigned char t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;

LAB0:    xsi_set_current_line(132, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 16114);
    t4 = 1;
    if (6U == 6U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 16122);
    t15 = 1;
    if (6U == 6U)
        goto LAB16;

LAB17:    t15 = 0;

LAB18:    if (t15 == 1)
        goto LAB13;

LAB14:    t8 = (t0 + 4072U);
    t9 = *((char **)t8);
    t8 = (t0 + 16128);
    t16 = 1;
    if (6U == 6U)
        goto LAB22;

LAB23:    t16 = 0;

LAB24:    t4 = t16;

LAB15:    if (t4 != 0)
        goto LAB11;

LAB12:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 16136);
    t16 = 1;
    if (6U == 6U)
        goto LAB36;

LAB37:    t16 = 0;

LAB38:    if (t16 == 1)
        goto LAB33;

LAB34:    t8 = (t0 + 4072U);
    t9 = *((char **)t8);
    t8 = (t0 + 16142);
    t23 = 1;
    if (6U == 6U)
        goto LAB42;

LAB43:    t23 = 0;

LAB44:    t15 = t23;

LAB35:    if (t15 == 1)
        goto LAB30;

LAB31:    t13 = (t0 + 4072U);
    t14 = *((char **)t13);
    t13 = (t0 + 16148);
    t24 = 1;
    if (6U == 6U)
        goto LAB48;

LAB49:    t24 = 0;

LAB50:    t4 = t24;

LAB32:    if (t4 != 0)
        goto LAB28;

LAB29:    xsi_set_current_line(139, ng0);
    t1 = (t0 + 16156);
    t3 = (t0 + 11280);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast(t3);

LAB3:    t1 = (t0 + 10480);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(133, ng0);
    t8 = (t0 + 16120);
    t10 = (t0 + 11280);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t8, 2U);
    xsi_driver_first_trans_fast(t10);
    goto LAB3;

LAB5:    t5 = 0;

LAB8:    if (t5 < 6U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    xsi_set_current_line(135, ng0);
    t13 = (t0 + 16134);
    t18 = (t0 + 11280);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t13, 2U);
    xsi_driver_first_trans_fast(t18);
    goto LAB3;

LAB13:    t4 = (unsigned char)1;
    goto LAB15;

LAB16:    t5 = 0;

LAB19:    if (t5 < 6U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB17;

LAB21:    t5 = (t5 + 1);
    goto LAB19;

LAB22:    t17 = 0;

LAB25:    if (t17 < 6U)
        goto LAB26;
    else
        goto LAB24;

LAB26:    t11 = (t9 + t17);
    t12 = (t8 + t17);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB23;

LAB27:    t17 = (t17 + 1);
    goto LAB25;

LAB28:    xsi_set_current_line(137, ng0);
    t21 = (t0 + 16154);
    t26 = (t0 + 11280);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t21, 2U);
    xsi_driver_first_trans_fast(t26);
    goto LAB3;

LAB30:    t4 = (unsigned char)1;
    goto LAB32;

LAB33:    t15 = (unsigned char)1;
    goto LAB35;

LAB36:    t5 = 0;

LAB39:    if (t5 < 6U)
        goto LAB40;
    else
        goto LAB38;

LAB40:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB37;

LAB41:    t5 = (t5 + 1);
    goto LAB39;

LAB42:    t17 = 0;

LAB45:    if (t17 < 6U)
        goto LAB46;
    else
        goto LAB44;

LAB46:    t11 = (t9 + t17);
    t12 = (t8 + t17);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB43;

LAB47:    t17 = (t17 + 1);
    goto LAB45;

LAB48:    t25 = 0;

LAB51:    if (t25 < 6U)
        goto LAB52;
    else
        goto LAB50;

LAB52:    t19 = (t14 + t25);
    t20 = (t13 + t25);
    if (*((unsigned char *)t19) != *((unsigned char *)t20))
        goto LAB49;

LAB53:    t25 = (t25 + 1);
    goto LAB51;

}

static void work_a_3222946569_3212880686_p_10(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(144, ng0);

LAB3:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11344);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 10496);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3222946569_3212880686_p_11(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(145, ng0);

LAB3:    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 10512);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3222946569_3212880686_p_12(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(146, ng0);

LAB3:    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    t1 = (t0 + 11472);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 10528);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3222946569_3212880686_p_13(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(147, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11536);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 10544);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3222946569_3212880686_p_14(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(148, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11600);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 10560);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3222946569_3212880686_p_15(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(149, ng0);

LAB3:    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11664);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 10576);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3222946569_3212880686_p_16(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(150, ng0);

LAB3:    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11728);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 10592);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3222946569_3212880686_p_17(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(151, ng0);

LAB3:    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11792);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 10608);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3222946569_3212880686_p_18(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(152, ng0);

LAB3:    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 11856);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 10624);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3222946569_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3222946569_3212880686_p_0,(void *)work_a_3222946569_3212880686_p_1,(void *)work_a_3222946569_3212880686_p_2,(void *)work_a_3222946569_3212880686_p_3,(void *)work_a_3222946569_3212880686_p_4,(void *)work_a_3222946569_3212880686_p_5,(void *)work_a_3222946569_3212880686_p_6,(void *)work_a_3222946569_3212880686_p_7,(void *)work_a_3222946569_3212880686_p_8,(void *)work_a_3222946569_3212880686_p_9,(void *)work_a_3222946569_3212880686_p_10,(void *)work_a_3222946569_3212880686_p_11,(void *)work_a_3222946569_3212880686_p_12,(void *)work_a_3222946569_3212880686_p_13,(void *)work_a_3222946569_3212880686_p_14,(void *)work_a_3222946569_3212880686_p_15,(void *)work_a_3222946569_3212880686_p_16,(void *)work_a_3222946569_3212880686_p_17,(void *)work_a_3222946569_3212880686_p_18};
	xsi_register_didat("work_a_3222946569_3212880686", "isim/PROC_SC_TB_isim_beh.exe.sim/work/a_3222946569_3212880686.didat");
	xsi_register_executes(pe);
}
