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
static const char *ng0 = "C:/Users/greg/Documents/labOrganosi/alu/forward_unit.vhd";



static void work_a_3946787226_3212880686_p_0(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned char t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(49, ng0);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB28;

LAB29:    t2 = (unsigned char)0;

LAB30:    if (t2 == 1)
        goto LAB25;

LAB26:    t1 = (unsigned char)0;

LAB27:    if (t1 != 0)
        goto LAB23;

LAB24:    xsi_set_current_line(54, ng0);
    t3 = (t0 + 5900);
    t7 = (t0 + 3712);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 2U);
    xsi_driver_first_trans_fast_port(t7);

LAB3:    xsi_set_current_line(57, ng0);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB49;

LAB50:    t2 = (unsigned char)0;

LAB51:    if (t2 == 1)
        goto LAB46;

LAB47:    t1 = (unsigned char)0;

LAB48:    if (t1 != 0)
        goto LAB43;

LAB45:    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB69;

LAB70:    t2 = (unsigned char)0;

LAB71:    if (t2 == 1)
        goto LAB66;

LAB67:    t1 = (unsigned char)0;

LAB68:    if (t1 != 0)
        goto LAB64;

LAB65:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 5916);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 2U);
    xsi_driver_first_trans_fast_port(t7);

LAB44:    t3 = (t0 + 3632);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(50, ng0);
    t19 = (t0 + 5891);
    t21 = (t0 + 3712);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 2U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB3;

LAB5:    t13 = (t0 + 1032U);
    t14 = *((char **)t13);
    t13 = (t0 + 1352U);
    t15 = *((char **)t13);
    t16 = 1;
    if (5U == 5U)
        goto LAB17;

LAB18:    t16 = 0;

LAB19:    t1 = t16;
    goto LAB7;

LAB8:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t3 = (t0 + 5886);
    t9 = 1;
    if (5U == 5U)
        goto LAB11;

LAB12:    t9 = 0;

LAB13:    t2 = (!(t9));
    goto LAB10;

LAB11:    t10 = 0;

LAB14:    if (t10 < 5U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB12;

LAB16:    t10 = (t10 + 1);
    goto LAB14;

LAB17:    t17 = 0;

LAB20:    if (t17 < 5U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t13 = (t14 + t17);
    t18 = (t15 + t17);
    if (*((unsigned char *)t13) != *((unsigned char *)t18))
        goto LAB18;

LAB22:    t17 = (t17 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(52, ng0);
    t19 = (t0 + 5898);
    t21 = (t0 + 3712);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 2U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB3;

LAB25:    t13 = (t0 + 1192U);
    t14 = *((char **)t13);
    t13 = (t0 + 1352U);
    t15 = *((char **)t13);
    t16 = 1;
    if (5U == 5U)
        goto LAB37;

LAB38:    t16 = 0;

LAB39:    t1 = t16;
    goto LAB27;

LAB28:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 5893);
    t9 = 1;
    if (5U == 5U)
        goto LAB31;

LAB32:    t9 = 0;

LAB33:    t2 = (!(t9));
    goto LAB30;

LAB31:    t10 = 0;

LAB34:    if (t10 < 5U)
        goto LAB35;
    else
        goto LAB33;

LAB35:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB32;

LAB36:    t10 = (t10 + 1);
    goto LAB34;

LAB37:    t17 = 0;

LAB40:    if (t17 < 5U)
        goto LAB41;
    else
        goto LAB39;

LAB41:    t13 = (t14 + t17);
    t18 = (t15 + t17);
    if (*((unsigned char *)t13) != *((unsigned char *)t18))
        goto LAB38;

LAB42:    t17 = (t17 + 1);
    goto LAB40;

LAB43:    xsi_set_current_line(58, ng0);
    t19 = (t0 + 5907);
    t21 = (t0 + 3776);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 2U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB44;

LAB46:    t13 = (t0 + 1032U);
    t14 = *((char **)t13);
    t13 = (t0 + 1512U);
    t15 = *((char **)t13);
    t16 = 1;
    if (5U == 5U)
        goto LAB58;

LAB59:    t16 = 0;

LAB60:    t1 = t16;
    goto LAB48;

LAB49:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t3 = (t0 + 5902);
    t9 = 1;
    if (5U == 5U)
        goto LAB52;

LAB53:    t9 = 0;

LAB54:    t2 = (!(t9));
    goto LAB51;

LAB52:    t10 = 0;

LAB55:    if (t10 < 5U)
        goto LAB56;
    else
        goto LAB54;

LAB56:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB53;

LAB57:    t10 = (t10 + 1);
    goto LAB55;

LAB58:    t17 = 0;

LAB61:    if (t17 < 5U)
        goto LAB62;
    else
        goto LAB60;

LAB62:    t13 = (t14 + t17);
    t18 = (t15 + t17);
    if (*((unsigned char *)t13) != *((unsigned char *)t18))
        goto LAB59;

LAB63:    t17 = (t17 + 1);
    goto LAB61;

LAB64:    xsi_set_current_line(60, ng0);
    t19 = (t0 + 5914);
    t21 = (t0 + 3776);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 2U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB44;

LAB66:    t13 = (t0 + 1192U);
    t14 = *((char **)t13);
    t13 = (t0 + 1512U);
    t15 = *((char **)t13);
    t16 = 1;
    if (5U == 5U)
        goto LAB78;

LAB79:    t16 = 0;

LAB80:    t1 = t16;
    goto LAB68;

LAB69:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 5909);
    t9 = 1;
    if (5U == 5U)
        goto LAB72;

LAB73:    t9 = 0;

LAB74:    t2 = (!(t9));
    goto LAB71;

LAB72:    t10 = 0;

LAB75:    if (t10 < 5U)
        goto LAB76;
    else
        goto LAB74;

LAB76:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB73;

LAB77:    t10 = (t10 + 1);
    goto LAB75;

LAB78:    t17 = 0;

LAB81:    if (t17 < 5U)
        goto LAB82;
    else
        goto LAB80;

LAB82:    t13 = (t14 + t17);
    t18 = (t15 + t17);
    if (*((unsigned char *)t13) != *((unsigned char *)t18))
        goto LAB79;

LAB83:    t17 = (t17 + 1);
    goto LAB81;

}


extern void work_a_3946787226_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3946787226_3212880686_p_0};
	xsi_register_didat("work_a_3946787226_3212880686", "isim/forward_unit_TB_isim_beh.exe.sim/work/a_3946787226_3212880686.didat");
	xsi_register_executes(pe);
}
