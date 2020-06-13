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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *WORK_P_2249957415;
char *IEEE_P_1242562249;
char *IEEE_P_0774719531;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *STD_TEXTIO;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    ieee_p_3564397177_init();
    ieee_p_1242562249_init();
    work_a_1973193242_3212880686_init();
    work_a_1837178026_3212880686_init();
    work_a_0734482308_3212880686_init();
    work_a_1913148318_3212880686_init();
    ieee_p_0774719531_init();
    work_p_2249957415_init();
    work_a_0270003503_3212880686_init();
    work_a_0309337994_3212880686_init();
    work_a_2263464102_3212880686_init();
    work_a_0290344353_3212880686_init();
    work_a_2166523021_3212880686_init();
    work_a_3967920148_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_2597622678_3212880686_init();
    work_a_2965463356_3212880686_init();
    work_a_4200723274_3212880686_init();
    work_a_2399776393_3212880686_init();
    work_a_3222946569_3212880686_init();
    work_a_3830602496_0000452272_init();
    work_a_1316506521_3212880686_init();
    work_a_4250137463_2372691052_init();


    xsi_register_tops("work_a_4250137463_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_2249957415 = xsi_get_engine_memory("work_p_2249957415");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
