// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    level._id_4044 = 100;
    level._id_4043 = 50;
    level._id_4036 = 250;
    level._id_683F = "com_door_breach_left_obj";
    level._id_4037 = 1;
    precachemodel( level._id_683F );
    precachemodel( "weapon_detcord" );
    level._id_0C59["generic"]["detcord_stack_left_start_01"] = %breach_stackl_approach;
    level._id_0C59["generic"]["detcord_stack_left_start_02"] = %breach_explosive_approach;
    level._id_0C59["generic"]["detcord_stack_left_start_no_approach_01"] = %explosivebreach_v1_stackl_idle;
    level._id_0C59["generic"]["detcord_stack_left_start_no_approach_02"] = %explosivebreach_v1_detcord_idle;
    level._id_0C59["generic"]["detcord_stack_leftidle_01"][0] = %explosivebreach_v1_stackl_idle;
    level._id_0C59["generic"]["detcord_stack_leftidle_02"][0] = %explosivebreach_v1_detcord_idle;
    level._id_0C59["generic"]["detcord_stack_leftbreach_01"] = %explosivebreach_v1_stackl;
    level._id_0C59["generic"]["detcord_stack_leftbreach_02"] = %explosivebreach_v1_detcord;
    level._id_0C59["generic"]["exposed_flashbang_v1"] = %exposed_flashbang_v1;
    level._id_0C59["generic"]["exposed_flashbang_v2"] = %exposed_flashbang_v2;
}
