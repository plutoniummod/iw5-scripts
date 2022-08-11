// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_56D9();
    _id_56DE();
    _id_56E1();
    _id_4CBB();
    _id_56E2();
    _id_56DC();
    _id_56DD();
    _id_56DA();
    _id_56DB();
    _id_56E8();
    _id_56E9();
    _id_56E5();
    _id_47D9();
    _id_200D();
}
#using_animtree("generic_human");

_id_56D9()
{
    level._id_11BB["london_dlt2_guysay"] = "london_dlt2_guysay";
    level._id_11BB["london_dlt1_outallnight"] = "london_dlt1_outallnight";
    level._id_11BB["london_trk_packinheat"] = "london_trk_packinheat";
    level._id_0C59["generic"]["alert_idle"][0] = %stand_alertb_idle1;
    level._id_0C59["truck_door_guy1"]["idle"][0] = %london_deliverytruck_close_door_guy1_idle;
    level._id_0C59["truck_door_guy1"]["close_door"] = %london_deliverytruck_close_door_guy1;
    level._id_0C59["truck_door_guy2"]["idle"][0] = %london_deliverytruck_close_door_guy2_idle;
    level._id_0C59["truck_door_guy2"]["close_door"] = %london_deliverytruck_close_door_guy2;
    level._id_0C59["generic"]["enemy_cellphone"] = %london_warehouse_phone_walk;
    level._id_0C59["generic"]["enemy_cellphone_death"] = %london_warehouse_phone_death;
    level._id_0C59["generic"]["enemy_cellphone_react"] = %london_warehouse_phone_reaction;
    level.scr_sound["generic"]["cellphone_line1"] = "london_ru3_fathercomesin";
    level.scr_sound["generic"]["cellphone_line2"] = "london_ru3_brothersbirthday";
    level.scr_sound["generic"]["cellphone_line3"] = "london_ru3_getoverit";
    level._id_0C59["generic"]["enemy_sleeping"][0] = %london_warehouse_sleeper_idle;
    level._id_0C59["generic"]["enemy_sleeping_death"] = %london_warehouse_sleeper_death;
    level._id_0C59["generic"]["enemy_sleeping_react"] = %london_warehouse_sleeper_getup;
    level._id_0C59["generic"]["enemy_sleeping2"][0] = %parabolic_guard_sleeper_idle;
    level._id_0C59["generic"]["enemy_sleeping2_death"] = %parabolic_guard_sleeper_react;
    level._id_0C59["generic"]["enemy_sleeping2_react"] = %parabolic_guard_sleeper_react;
    level._id_0C59["generic"]["surprise_react_left"] = %london_surprise_turnaround_left;
    level._id_0C59["generic"]["surprise_react_right"] = %london_surprise_turnaround_right;
    level.scr_sound["generic"]["london_dlt1_ready"] = "london_dlt1_ready";
    level._id_0C59["generic"]["warehouse_computer_death"] = %london_warehouse_computer_death;
    level._id_0C59["generic"]["warehouse_computer_react"] = %london_warehouse_computer_reaction;
    level._id_0C59["generic"]["warehouse_computer"][0] = %london_warehouse_computer_idle;
    level._id_0C59["generic"]["warehouse_tv_watcher1"][0] = %london_warehouse_tv_idle_a;
    level._id_0C59["generic"]["warehouse_tv_watcher2"][0] = %london_warehouse_tv_idle_b;
    level._id_0C59["generic"]["warehouse_tv_watcher1_death"] = %london_warehouse_tv_death_a;
    level._id_0C59["generic"]["warehouse_tv_watcher2_death"] = %london_warehouse_tv_death_b;
    level._id_0C59["generic"]["warehouse_tv_watcher1_react"] = %london_warehouse_tv_reaction_a;
    level._id_0C59["generic"]["warehouse_tv_watcher2_react"] = %london_warehouse_tv_reaction_b;
    level._id_0C59["generic"]["standing_death"] = %exposed_death_nerve;
    level._id_0C59["generic"]["walk_casual"] = %london_inspector_walk;
    level._id_0C59["generic"]["walk_gunup"] = %london_dock_soldier_walk_gunup;
    level._id_0C59["generic"]["walk_point"] = %london_dock_soldier_walk_point;
    level._id_0C59["generic"]["walk_gundown"] = %london_dock_soldier_walk;
    level._id_0C59["generic"]["window_explosion_reaction_idle"][0] = %london_kickout_window_idle_reaction;
    level._id_0C59["generic"]["window_explosion_reaction"] = %london_kickout_window_kick_reaction;
    level.scr_sound["generic"]["london_spt_rpgloose"] = "london_spt_rpgloose";
    level.scr_sound["generic"]["london_myr_clearboss"] = "london_myr_clearboss";
    level._id_0C59["generic"]["warehouse2_cutter_enter"] = %breach_kick_kickerr1_enter;
    maps\_anim::_id_1264( "generic", "kick", ::_id_56EC, "warehouse2_cutter_enter" );
    level._id_0C59["generic"]["warehouse2_breacher2_enter"] = %breach_kick_stackl1_enter;
    level._id_0C59["generic"]["warehouse2_breacher_trans"] = %breach_stackl_approach;
    level._id_0C59["generic"]["warehouse2_breacher_idle"][0] = %explosivebreach_v1_stackl_idle;
    level._id_0C59["generic"]["warehouse2_breacher_enter"] = %explosivebreach_v1_stackl_enter;
    level._id_0C59["generic"]["mole_walk"] = %london_inspector_walk;
    level._id_0C59["generic"]["stack_right1_idle"][0] = %breach_flash_r1_idle;
    level._id_0C59["generic"]["stack_right2_idle"][0] = %breach_flash_r2_idle;
    level._id_0C59["generic"]["stack_left1_idle"][0] = %explosivebreach_v1_stackl_idle;
    level._id_0C59["generic"]["stack_left2_idle"][0] = %explosivebreach_v1_detcord_idle;
    level._id_0C59["generic"]["stack_left2_idle"][0] = %explosivebreach_v1_detcord_idle;
    level.scr_sound["generic"]["london_myr_contact"] = "london_myr_contact";
    level.scr_sound["generic"]["london_sasl_gotcompany"] = "london_sasl_gotcompany";
}

_id_56DA()
{
    level._id_0C59["attacker"]["warehouse_melee1"] = %cornersdl_melee_wind_attacker;
    level._id_0C59["defender"]["warehouse_melee1"] = %cornersdl_melee_wind_defender;
    level._id_11B9["attacker"]["warehouse_melee1"] = "scn_london_corner_melee";
    maps\_anim::_id_1264( "attacker", "unsync", ::_id_56EF, "warehouse_melee1" );
    maps\_anim::_id_1264( "attacker", "melee_death", ::_id_56F0, "warehouse_melee1" );
    maps\_anim::_id_1264( "defender", "fire_spray", ::_id_56ED, "warehouse_melee1" );
    maps\_anim::_id_125D( "attacker", "playsound_kneehit", "warehouse_melee1", "scn_london_corner_melee_hit" );
}

_id_56DB()
{
    level._id_0C59["target1"]["idle"][0] = %london_sniper_death_allen_idle;
    level._id_0C59["target1"]["death"] = %london_sniper_death_allen;
    level._id_0C59["target2"]["idle"][0] = %london_sniper_death_lateef_idle;
    level._id_0C59["target2"]["death"] = %london_sniper_death_lateef;
    maps\_anim::_id_1264( "target1", "impact", ::_id_0098, "death" );
    maps\_anim::_id_1264( "target2", "impact", ::_id_0098, "death" );
}

_id_56DC()
{
    level._id_0C59["docks_loader1"]["idle"][0] = %london_loader1_idle;
    level._id_0C59["docks_loader1"]["idle"][1] = %london_loader1_twitch;
    level._id_0C59["docks_loader1"]["loading"] = %london_loader1_loading;
    level._id_0C59["docks_loader1"]["stepback"] = %london_loader1_stepback;
    level._id_0C59["docks_loader1"]["twitch"] = %london_loader1_twitch;
    level._id_0C59["docks_loader1"]["unloading"] = %london_loader1_unloading;
    level._id_0C59["guard"]["idle"][0] = %london_loader3_idle;
    level._id_0C59["guard"]["idle"][1] = %london_loader3_twitch;
    level._id_0C59["guard"]["loading"] = %london_loader3_loading;
    level._id_0C59["guard"]["shove"] = %london_loader3_shove;
    level._id_0C59["guard"]["shootout"] = %london_loader3_shootout;
}

_id_56DD()
{
    level._id_0C59["docks_guard"]["mole_shake_hands"] = %london_guard_handshake;
    level._id_0C59["docks_guard"]["idle"][0] = %london_guard_idle1;
    level._id_0C59["docks_guard"]["idle"][1] = %london_guard_idle2;
    level._id_0C59["docks_guard"]["idle"][2] = %london_guard_twitch_lookleft1;
    level._id_0C59["docks_guard"]["idle"][3] = %london_guard_twitch_lookright1;
    level._id_0C59["docks_guard"]["idle"][4] = %london_guard_twitch_lookright2;
    level._id_0C59["docks_guard"]["idle"][5] = %london_guard_twitch_stretch;
}

_id_56DE()
{
    level._id_11BB["london_ldr_seeingthis"] = "london_ldr_seeingthis";
    level._id_11BB["london_ldr_trucksaremovin"] = "london_ldr_trucksaremovin";
    level._id_11BB["london_ldr_focusontrucks"] = "london_ldr_focusontrucks";
    level._id_11BB["london_ldr_trucksaremovin"] = "london_ldr_trucksaremovin";
    level._id_11BB["london_ldr_somethingbig"] = "london_ldr_somethingbig";
    level._id_11BB["london_ldr_rollingout"] = "london_ldr_rollingout";
    level._id_11BB["london_ldr_wilco"] = "london_ldr_wilco";
    level._id_11BB["london_ldr_eyesopen"] = "london_ldr_eyesopen";
    level._id_11BB["london_ldr_readytorock"] = "london_ldr_readytorock";
    level._id_11BB["london_ldr_gettowork"] = "london_ldr_gettowork";
    level.scr_sound["sas_leader"]["london_ldr_gettowork"] = "london_ldr_gettowork";
    level._id_0C59["sas_leader"]["alley_comm_check"] = %london_sandman_intro;
    level._id_0C59["sas_leader"]["alley_comm_idle"][0] = %london_sandman_talk_idle;
    level._id_0C59["sas_leader"]["alley_comm_trans"] = %london_sandman_talk_trans_cqb;
    level.scr_sound["sas_leader"]["london_ldr_youclean"] = "london_ldr_youclean";
    level.scr_sound["sas_leader"]["london_ldr_weaponsfree"] = "london_ldr_weaponsfree";
    level.scr_sound["sas_leader"]["london_ldr_alleyclear"] = "london_ldr_alleyclear";
    level.scr_sound["sas_leader"]["london_ldr_keepemsilent"] = "london_ldr_keepemsilent";
    level.scr_sound["sas_leader"]["london_ldr_bravo9ontime"] = "london_ldr_bravo9ontime";
    level.scr_sound["sas_leader"]["london_ldr_onme"] = "london_ldr_onme";
    level.scr_sound["sas_leader"]["stackup_nag1"] = "london_ldr_stackupdoor";
    level.scr_sound["sas_leader"]["stackup_nag2"] = "london_ldr_stackupletsgo";
    level.scr_sound["sas_leader"]["warehouse_breacher_trans"] = "london_ldr_stackup";
    level._id_0C59["sas_leader"]["warehouse_breacher_trans"] = %london_boltcut_b_entry;
    level._id_0C59["sas_leader"]["warehouse_breacher_idle"][0] = %london_boltcut_b_idle;
    level._id_0C59["sas_leader"]["warehouse_breacher_enter"] = %london_boltcut_b_breach_quiet;
    level.scr_sound["sas_leader"]["warehouse_breacher_enter"] = "london_ldr_alrightcutit";
    maps\_anim::_id_1264( "sas_leader", "door_open", ::_id_56EB, "warehouse_breacher_enter" );
    level.scr_sound["sas_leader"]["london_ldr_takepoint"] = "london_ldr_takepoint";
    level.scr_sound["sas_leader"]["takepoint_nag"] = "london_ldr_youreup";
    level.scr_sound["sas_leader"]["london_ldr_checkthosecorners"] = "london_ldr_checkthosecorners";
    level.scr_sound["sas_leader"]["london_ldr_move"] = "london_ldr_move";
    level.scr_sound["sas_leader"]["london_ldr_roomclear"] = "london_ldr_roomclear";
    level.scr_sound["sas_leader"]["london_ldr_upstairs"] = "london_ldr_upstairs";
    level._id_0C59["sas_leader"]["window_kick_enter"] = %london_kickout_window_entrance;
    level._id_0C59["sas_leader"]["window_kick_idle"][0] = %london_kickout_window_idle;
    level._id_0C59["sas_leader"]["window_kick_action"] = %london_kickout_window_kick;
    level._id_0C59["sas_leader"]["window_kick_end_idle"][0] = %london_kickout_window_end_idle;
    level._id_0C59["sas_leader"]["door_kick"] = %doorkick_2_stand;
    level.scr_sound["sas_leader"]["london_ldr_bravostatus"] = "london_ldr_bravostatus";
    level.scr_sound["sas_leader"]["london_trk_whatthehell"] = "london_trk_whatthehell";
    level.scr_sound["sas_leader"]["downhere_nag1"] = "london_ldr_letsgo2";
    level.scr_sound["sas_leader"]["downhere_nag2"] = "london_ldr_moveit";
    level.scr_sound["sas_leader"]["downhere_nag3"] = "london_ldr_letsgo";
    level.scr_sound["sas_leader"]["downhere_nag4"] = "london_ldr_getdownhere";
    level.scr_sound["sas_leader"]["london_ldr_onfoot"] = "london_ldr_onfoot";
    level.scr_sound["sas_leader"]["london_ldr_allclear2"] = "london_ldr_allclear2";
    level.scr_sound["sas_leader"]["london_ldr_perimetersecure"] = "london_ldr_perimetersecure";
    level.scr_sound["sas_leader"]["london_ldr_lorrysecure"] = "london_ldr_lorrysecure";
    level.scr_sound["sas_leader"]["london_ldr_keepusposted"] = "london_ldr_keepusposted";
    level.scr_sound["sas_leader"]["london_ldr_opendoors"] = "london_ldr_opendoors";
    level._id_0C59["sas_leader"]["search_truck_entry"] = %london_truck_search_wallcroft_entry;
    maps\_anim::_id_1264( "sas_leader", "point", ::_id_56DF, "search_truck_entry" );
    level._id_0C59["sas_leader"]["search_truck_idle"] = %london_truck_search_wallcroft_idle;
    level._id_0C59["sas_leader"]["search_truck_point"] = %london_truck_search_wallcroft_point;
    level._id_0C59["sas_leader"]["search_truck_lookinside"] = %london_truck_search_wallcroft_lookinside;
    maps\_anim::_id_1264( "sas_leader", "ps_london_ldr_nickedweapons", ::_id_56E0, "search_truck_lookinside" );
    level.scr_sound["sas_leader"]["london_ldr_welcomingparty"] = "london_ldr_welcomingparty";
    level.scr_sound["sas_leader"]["london_ldr_tangosoncatwalk"] = "london_ldr_tangosoncatwalk";
    level.scr_sound["sas_leader"]["frost_nag1"] = "london_ldr_waitingfor";
    level.scr_sound["sas_leader"]["frost_nag2"] = "london_ldr_holdingusback";
    level.scr_sound["sas_leader"]["frost_nag3"] = "london_ldr_goingtoescape";
    level.scr_sound["sas_leader"]["frost_nag4"] = "london_ldr_moveupfrost";
    level.scr_sound["sas_leader"]["frost_nag5"] = "london_ldr_movemove";
    level.scr_sound["sas_leader"]["frost_nag6"] = "london_ldr_letsgo2";
    level.scr_sound["sas_leader"]["frost_nag7"] = "london_ldr_gogogo2";
    level.scr_sound["sas_leader"]["frost_nag8"] = "london_ldr_moveit";
    level.scr_sound["sas_leader"]["frost_nag9"] = "london_ldr_letsgo";
    level.scr_sound["sas_leader"]["london_ldr_keepuscovered"] = "london_ldr_keepuscovered";
    level.scr_sound["sas_leader"]["london_ldr_firefromwest"] = "london_ldr_firefromwest";
    level.scr_sound["sas_leader"]["london_ldr_pursuing"] = "london_ldr_pursuing";
}

_id_56DF( var_0 )
{
    var_0 maps\_utility::_id_168C( "london_ldr_opendoors" );
    common_scripts\utility::flag_set( "player_open_doors" );
}

_id_56E0( var_0 )
{
    wait 3;
    thread maps\_utility::_id_11F4( "london_com_headedyourway" );
}

_id_56E1()
{
    level._id_0C59["sas_guy"]["alley_fence_traverse"] = %london_fence_drop;
    level.scr_sound["sas_guy"]["london_trk_dozin"] = "london_trk_dozin";
    level.scr_sound["sas_guy"]["london_trk_10meters"] = "london_trk_10meters";
    level.scr_sound["sas_guy"]["london_trk_alleyclear"] = "london_trk_alleyclear";
    level._id_0C59["sas_guy"]["warehouse_breach_cut_trans"] = %london_boltcut_a_entry;
    level._id_0C59["sas_guy"]["warehouse_breach_cut_idle"][0] = %london_boltcut_a_idle;
    level._id_0C59["sas_guy"]["warehouse_breach_cut_enter"] = %london_boltcut_a_breach;
    maps\_anim::_id_1264( "sas_guy", "attach_boltcutters", ::_id_56F5, "warehouse_breach_cut_trans" );
    maps\_anim::_id_1264( "sas_guy", "detach_boltcutters", ::_id_56F7, "warehouse_breach_cut_enter" );
    level.scr_sound["sas_guy"]["london_gfn_gotashadow"] = "london_gfn_gotashadow";
    level.scr_sound["sas_guy"]["takepoint_nag"] = "london_gfn_youslag";
    level.scr_sound["sas_guy"]["london_gfn_morningents"] = "london_gfn_morningents";
    level.scr_sound["sas_guy"]["london_trk_roomclear"] = "london_trk_roomclear";
    level.scr_sound["sas_guy"]["london_gfn_nickedweapons"] = "london_gfn_nickedweapons";
    level.scr_sound["sas_guy"]["london_gfn_clear2"] = "london_gfn_clear2";
    level.scr_sound["sas_guy"]["london_gfn_tothetube"] = "london_gfn_tothetube";
}

_id_4CBB()
{
    level._id_11BB["london_com_haveeyes"] = "london_com_haveeyes";
    level._id_11BB["london_com_missionisgo"] = "london_com_missionisgo";
    level._id_11BB["london_uav1_tapesrollin"] = "london_uav1_tapesrollin";
    level._id_11BB["london_uav2_2miles"] = "london_uav2_2miles";
    level._id_11BB["london_ovl_copy2miles"] = "london_ovl_copy2miles";
    level._id_11BB["london_uav1_notcleared"] = "london_uav1_notcleared";
    level._id_11BB["london_ovl_5trucks"] = "london_ovl_5trucks";
    level._id_11BB["london_uav1_5vehicles"] = "london_uav1_5vehicles";
    level._id_11BB["london_uav2_tracking"] = "london_uav2_tracking";
    level._id_11BB["london_uav1_roger"] = "london_uav1_roger";
    level._id_11BB["london_uav2_rollinout"] = "london_uav2_rollinout";
    level._id_11BB["london_uav1_movingout"] = "london_uav1_movingout";
    level._id_11BB["london_ovl_twovans"] = "london_ovl_twovans";
    level._id_11BB["london_ovl_squarebuilding"] = "london_ovl_squarebuilding";
    level._id_11BB["london_uav1_rogerthat"] = "london_uav1_rogerthat";
    level._id_11BB["london_uav2_inwindows"] = "london_uav2_inwindows";
    level._id_11BB["london_uav1_visible"] = "london_uav1_visible";
    level._id_11BB["london_ovl_identifyweapons"] = "london_ovl_identifyweapons";
    level._id_11BB["london_uav1_definitelyhot"] = "london_uav1_definitelyhot";
    level._id_11BB["london_uav2_maderpg"] = "london_uav2_maderpg";
    level._id_11BB["london_sasl_copy"] = "london_sasl_copy";
    level._id_11BB["london_spt_takingtheshot"] = "london_spt_takingtheshot";
    level._id_11BB["london_spt_sendthem"] = "london_spt_sendthem";
    level._id_11BB["london_sasl_inpositionmate"] = "london_sasl_inpositionmate";
    level._id_11BB["london_ldr_grinchup"] = "london_ldr_grinchup";
    level._id_11BB["london_sr1_rogerboss"] = "london_sr1_rogerboss";
    level._id_11BB["london_sr1_thrubuildings"] = "london_sr1_thrubuildings";
    level._id_11BB["london_gfn_rpg"] = "london_gfn_rpg";
    level._id_11BB["london_hp2_pullup"] = "london_hp2_pullup";
    level._id_11BB["london_sr1_thrubuildings"] = "london_sr1_thrubuildings";
    level._id_11BB["london_com_headedyourway"] = "london_com_headedyourway";
    level._id_11BB["london_hp2_engaging"] = "london_hp2_engaging";
    level._id_11BB["london_hp2_wereonit"] = "london_hp2_wereonit";
    level._id_11BB["london_hp2_backaround"] = "london_hp2_backaround";
    level._id_11BB["london_com_awaitorders"] = "london_com_awaitorders";
    level._id_11BB["london_hp2_maintainshadow"] = "london_hp2_maintainshadow";
}

_id_200D()
{
    level._id_0C59["drone"]["body"] = %body;
    level._id_0C59["drone"]["windowclimb"] = %windowclimb;
    level._id_0C59["drone"]["stand_2_prone"] = %stand_2_prone;
    level._id_0C59["drone"]["prone_2_stand"] = %prone_2_stand;
    level._id_0C59["drone"]["walk_CQB_F_relative"] = %walk_cqb_f_relative;
    level._id_0C59["drone"]["reload"] = %prone_reload;
    level._id_0C59["drone"]["fire"] = %prone_fire_1;
}
#using_animtree("vehicles");

_id_56E2()
{
    level._id_1245["forklift"] = #animtree;
    level._id_0C59["forklift"]["up"] = %london_docks_forklift_up;
    level._id_0C59["forklift"]["down"] = %london_docks_forklift_down;
}

_id_56E3()
{
    self setanimknoballrestart( maps\_utility::_id_1281( "up" ), %root );
}

_id_56E4()
{
    self setanimknoballrestart( maps\_utility::_id_1281( "down" ), %root );
}

_id_56E5()
{
    level._id_1245["delivery_truck"] = #animtree;
    level._id_1F90["delivery_truck"] = "vehicle_uk_delivery_truck_flir";
    level._id_0C59["delivery_truck"]["docks_doors_open"] = %london_dock_truck_doors;
    level.scr_sound["delivery_truck"]["docks_doors_open"] = "scn_docks_truck_door_open";
    level._id_0C59["delivery_truck"]["docks_doors_close"] = %london_dock_truck_doors_close;
    level._id_0C59["delivery_truck"]["close1"] = %london_deliverytruck_close_door_guy1_truck;
    level._id_0C59["delivery_truck"]["idle1"][0] = %london_deliverytruck_close_door_guy1_truck_idle;
    level._id_0C59["delivery_truck"]["close2"] = %london_deliverytruck_close_door_guy2_truck;
    level._id_0C59["delivery_truck"]["idle2"][0] = %london_deliverytruck_close_door_guy2_truck_idle;
    level._id_0C59["delivery_truck"]["docks_doors_open_nosound"] = %london_dock_truck_doors;
    level._id_0C59["delivery_truck"]["player_open_truck_doors"] = %london_truck_open_doors;
}

_id_56E6()
{
    var_0 = maps\_utility::_id_1281( "idle1" );
    var_1 = maps\_utility::_id_1281( "idle2" );
    self setanimrestart( var_0[0] );
    self setanimrestart( var_1[0] );
}

_id_56E7()
{
    var_0 = maps\_utility::_id_1281( "close1" );
    var_1 = maps\_utility::_id_1281( "close2" );
    self setflaggedanimknobrestart( "close_door1", var_0 );
    self setflaggedanimknobrestart( "close_door2", var_1 );
    self waittillmatch( "close_door2", "end" );
}
#using_animtree("script_model");

_id_56E8()
{
    level._id_1245["boltcutters"] = #animtree;
    level._id_0C59["boltcutters"]["warehouse_breach_cut_trans"] = %london_boltcut_boltcutters_entry;
    level._id_0C59["boltcutters"]["warehouse_breach_cut_idle"][0] = %london_boltcut_boltcutters_idle;
    level._id_0C59["boltcutters"]["warehouse_breach_cut_enter"] = %london_boltcut_boltcutters_breach;
    level._id_0C59["enemy_sleeping2_prop"]["enemy_sleeping2_death"] = %parabolic_guard_sleeper_react_chair;
    level._id_1245["enemy_sleeping2_prop"] = #animtree;
    level._id_1F90["enemy_sleeping2_prop"] = "com_folding_chair";
}

_id_56E9()
{
    level._id_1245["sewer_pipe1"] = #animtree;
    level._id_1245["sewer_pipe2"] = #animtree;
    level._id_1245["sewer_pipe3"] = #animtree;
    level._id_1245["bulldozer"] = #animtree;
    level._id_0C59["sewer_pipe1"]["sewer_pipe_roll"] = %london_concrete_pipe_roll_1;
    maps\_anim::_id_1264( "sewer_pipe1", "end", ::_id_56EA, "sewer_pipe_roll" );
    level._id_0C59["sewer_pipe2"]["sewer_pipe_roll"] = %london_concrete_pipe_roll_2;
    maps\_anim::_id_1264( "sewer_pipe2", "end", ::_id_56EA, "sewer_pipe_roll" );
    level._id_0C59["sewer_pipe3"]["sewer_pipe_roll"] = %london_concrete_pipe_roll_3;
    level._id_0C59["bulldozer"]["sewer_pipe_roll"] = %london_concrete_pipe_roll_bulldozer;
}

_id_56EA( var_0 )
{
    var_0 maps\_utility::_id_13DC( "end" );
}

_id_56EB( var_0 )
{
    var_1 = getent( "warehouse_door", "targetname" );
    var_2 = getentarray( var_1.target, "targetname" );
    common_scripts\utility::array_call( var_2, ::linkto, var_1 );
    var_1 playsound( "scn_london_door_slow_open" );
    var_1 connectpaths();
    var_1 rotateyaw( 140, 3, 0.25 );
    common_scripts\utility::flag_set( "london_warehouse_door_kicked" );
}

_id_56EC( var_0 )
{
    var_1 = getent( "warehouse2_door", "targetname" );
    var_1 connectpaths();
    var_1 playsound( "metal_door_kick" );
    var_1 rotateyaw( 120, 0.5 );
    var_2 = getentarray( "sas_breacher_enemy_ai", "targetname" );
    var_2 = maps\_utility::_id_2672( var_2 );

    foreach ( var_0 in var_2 )
        var_0 notify( "react" );
}

_id_56ED( var_0 )
{
    if ( !isdefined( var_0._id_56EE ) )
        return;

    var_1 = [ "J_Clavicle_LE", "J_Shoulder_LE" ];
    var_2 = [ "impact_fx_nonfatal", "impact_fx" ];
    var_3 = var_1[randomint( var_1.size )];
    var_4 = var_2[randomint( var_2.size )];
    var_5 = var_0._id_56EE gettagorigin( var_3 );
    playfx( common_scripts\utility::getfx( var_4 ), var_5 );
}

_id_56EF( var_0 )
{
    var_0.allowdeath = 1;
    var_0.forceragdollimmediate = 1;
    var_0._id_0EC4 = 10;
}

_id_56F0( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    var_0.a._id_0D55 = 1;
    var_0.allowdeath = 1;
    var_0 maps\_utility::_id_0D72( 0 );
    var_0 kill();
}

_id_0098( var_0 )
{
    var_0.a._id_0D55 = 1;
}

_id_56F1( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0 animscripts\shared::_id_0D73();
    return 1;
}

_id_56F2( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    var_0 maps\_utility::_id_257D();
}

_id_56F3( var_0 )
{
    common_scripts\utility::exploder( "warehouse_window_frame" );
}

_id_56F4( var_0 )
{
    common_scripts\utility::exploder( "warehouse_window_frame_med" );
}

_id_56F5( var_0 )
{
    var_0._id_56F6 show();
}

_id_56F7( var_0 )
{
    var_0._id_56F6 maps\_utility::_id_1414();
}
#using_animtree("player");

_id_47D9()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_sas";
    level._id_0C59["player_rig"]["player_open_truck_doors"] = %london_truck_open_player;
}

_id_527E()
{
    wait 0.1;
    var_0 = maps\_utility::_id_1BF9( "water_rock", "script_noteworthy" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = spawn( "script_model", var_3.origin );
        var_4.angles = var_3.angles;
        var_4 setmodel( var_3.script_modelname );
        var_4 thread _id_527F( var_3 );
        var_1 = maps\_utility::_id_0BC3( var_1, var_4 );
    }

    var_0 = undefined;
    wait 1;
    common_scripts\utility::flag_wait( "docks_littlebird_strafe" );
    common_scripts\utility::array_call( var_1, ::delete );
}

_id_527F( var_0 )
{
    self endon( "death" );
    childthread _id_5280( var_0 );
    childthread _id_5281( var_0 );
}

_id_5280( var_0 )
{
    var_1 = var_0.origin;
    var_2 = 5;

    if ( isdefined( var_0._id_2184 ) )
        var_2 = var_0._id_2184;

    var_3 = var_2 * 0.5;
    var_4 = 8;

    if ( isdefined( var_0._id_1662 ) )
        var_4 = var_0._id_1662;

    var_5 = var_4 * 0.5;
    var_0 = undefined;

    for (;;)
    {
        var_6 = randomfloatrange( var_3, var_2 );
        var_7 = randomfloatrange( var_5, var_4 );
        self moveto( var_1 + ( 0, 0, var_6 ), var_7, var_7 / 2.0, var_7 / 2.0 );
        self waittill( "movedone" );
        self moveto( var_1 - ( 0, 0, var_6 ), var_7, var_7 / 2.0, var_7 / 2.0 );
        self waittill( "movedone" );
    }
}

_id_5281( var_0 )
{
    var_1 = var_0.angles;
    var_2 = 5;

    if ( isdefined( var_0._id_1DCB ) )
        var_2 = var_0._id_1DCB;

    var_3 = var_2 * 0.5;
    var_4 = 8;

    if ( isdefined( var_0._id_1662 ) )
        var_4 = var_0._id_1662;

    var_5 = var_4 * 0.5;
    var_0 = undefined;

    for (;;)
    {
        var_6 = ( randomfloatrange( var_3, var_2 ), 0, randomfloatrange( var_3, var_2 ) );
        var_7 = randomfloatrange( 5, 8 );
        self rotateto( var_1 + var_6, var_7, var_7 / 2.0, var_7 / 2.0 );
        self waittill( "rotatedone" );
        self rotateto( var_1 - var_6, var_7, var_7 / 2.0, var_7 / 2.0 );
        self waittill( "rotatedone" );
    }
}
