// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_47D9();
    _id_47DA();
    _id_47DB();
    _id_47DE();
    _id_47DC();
    _id_47DD();
    _id_47E3();
    _id_4443();
    _id_062E::main();
    _id_062D::main();
}
#using_animtree("player");

_id_47D9()
{
    level._id_0C59["player_rig"]["player_getin"] = %roadkill_hummer_player_getin;
    level._id_0C59["player_rig"]["ny_intro"] = %ny_manhattan_intro_player;
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_delta_shg";
    level._id_0C59["player_rig"]["ny_harbor_hind_entry"] = %ny_harbor_hind_enter_viewmodel;
    level._id_1245["player_legs"] = #animtree;
    level._id_1F90["player_legs"] = "viewlegs_generic";
    level._id_0C59["player_legs"]["ny_harbor_hind_entry"] = %ny_harbor_hind_enter_legs;
    level._id_0C59["player_legs"]["ny_intro"] = %ny_manhattan_intro_player_legs;
}
#using_animtree("generic_human");

_id_47DA()
{
    level._id_0C59["lonestar"]["mulekick_transition"] = %ny_harbor_breech_mulekick_guy1_transition;
    level._id_0C59["lonestar"]["mulekick_idle"] = [ %ny_harbor_breech_mulekick_guy1_idle ];
    level._id_0C59["lonestar"]["mulekick_kick"] = %ny_harbor_breech_mulekick_guy1_kick;
    level._id_0C59["lonestar"]["flashbang_training_start"] = %ny_manhattan_signal_flashbang_delta_start;
    level._id_0C59["lonestar"]["flashbang_training_end"] = %ny_manhattan_signal_flashbang_delta_end;
    level._id_0C59["lonestar"]["flashbang_training_trans"] = %ny_manhattan_signal_flashbang_delta_intowall;
    level._id_0C59["lonestar"]["flashbang_training_idle"] = [ %ny_manhattan_signal_flashbang_delta_idlewall ];
    level._id_0C59["lonestar"]["ny_intro"] = %ny_manhattan_intro_delta;
    level._id_0C59["taxi_guy"]["taxi_guy_death"] = %death_explosion_left11;
    level._id_0C59["taxi_guy"]["taxi_guy_death2"] = %death_explosion_back13;
    level._id_0C59["lonestar"]["sandman_signal_go"] = %ny_manhattan_sandman_signal_towalk;
    level._id_0C59["gaz_entrance_guy1"]["broad_enemy_entrance"] = %ny_manhattan_enemy_entrance_01;
    level._id_0C59["gaz_entrance_guy2"]["broad_enemy_entrance"] = %ny_manhattan_enemy_entrance_02;
    level._id_0C59["gaz_entrance_guy3"]["broad_enemy_entrance"] = %ny_manhattan_enemy_entrance_03;
    level._id_0C59["gaz_entrance_guy4"]["broad_enemy_entrance"] = %ny_manhattan_enemy_entrance_04;
    level._id_0C59["wounded_guy"]["wounded_idle"] = %ny_manhattan_wounded_drag_idle_wounded;
    level._id_0C59["wounded_carrier"]["run_to"] = %ny_manhattan_wounded_run_to_carrier;
    level._id_0C59["wounded_carrier"]["drag"] = %ny_manhattan_wounded_drag_carrier;
    level._id_0C59["wounded_guy"]["drag"] = %ny_manhattan_wounded_drag_wounded;
    level._id_0C59["wounded_carrier"]["help_loop"][0] = %ny_manhattan_wounded_help_carrier;
    level._id_0C59["wounded_guy"]["help_loop"][0] = %ny_manhattan_wounded_help_wounded;
    level._id_0C59["generic"]["radio_enter"] = %ny_manhattan_radio_into_talk;
    level._id_0C59["generic"]["radio_idle"][0] = %ny_manhattan_radio_talk_idle;
    level._id_0C59["generic"]["radio_exit"] = %ny_manhattan_radio_exit_talk;
    level._id_0C59["reaper_dummy"]["reaper_dummy_idle"] = %covercrouch_hide_idle;
    level._id_0C59["flashbang_leader"]["pre_flashbang"] = %bog_javelin_dialogue_briefing;
    level._id_0C59["lonestar"]["radio_in"] = %ny_manhattan_radio_sandman_transition_in;
    level._id_0C59["lonestar"]["radio"] = %ny_manhattan_radio_sandman_talk;
    level._id_0C59["lonestar"]["radio_out"] = %ny_manhattan_radio_sandman_transition_out;
    level._id_0C59["lonestar"]["blackhawk_jump"] = %ny_manhatten_rooftop_extraction_delta_jump;
    level._id_0C59["lonestar"]["blackhawk_land"] = %ny_manhatten_rooftop_extraction_delta_land;
    level._id_0C59["lonestar"]["blackhawk_land_idle"][0] = %ny_manhatten_rooftop_extraction_delta_land_idle;
    level._id_0C59["lonestar"]["tower_destruct_react"] = %ny_manhattan_tower_react_guy2;
    level._id_0C59["truck"]["tower_destruct_react"] = %ny_manhattan_tower_react_crouch_guy2;
    level._id_0C59["reno"]["tower_destruct_react"] = %ny_manhattan_tower_react_crouch_guy1;
    level._id_0C59["lonestar"]["ny_manhattan_blackhawk_idle_nl"] = %ny_manhattan_rooftop_extraction_delta_ride_idlea;
    level._id_0C59["lonestar"]["ny_manhattan_blackhawk_idle"][0] = %ny_manhattan_rooftop_extraction_delta_ride_idlea;
    level._id_46C1["lonestar"] = "tag_player";
    level._id_0C59["truck"]["ny_manhattan_blackhawk_idle_nl"] = %ny_manhattan_rooftop_extraction_delta_ride_idleb;
    level._id_0C59["truck"]["ny_manhattan_blackhawk_idle"][0] = %ny_manhattan_rooftop_extraction_delta_ride_idleb;
    level._id_46C1["truck"] = "tag_player";
    level._id_0C59["reno"]["ny_manhattan_blackhawk_idle_nl"] = %ny_manhattan_rooftop_extraction_delta_ride_idlec;
    level._id_0C59["reno"]["ny_manhattan_blackhawk_idle"][0] = %ny_manhattan_rooftop_extraction_delta_ride_idlec;
    level._id_46C1["reno"] = "tag_player";
    level._id_1245["hind_deadguy"] = #animtree;
    level._id_0C59["hind_deadguy"]["dead_idle"] = %ny_manhattan_helicopter_dead_pose01;
    level._id_1245["humvee_deadguy"] = #animtree;
    level._id_0C59["humvee_deadguy"]["dead_idle"] = %ny_manhattan_intro_deadguy;
    _id_063C::_id_4546();
}
#using_animtree("script_model");

_id_4443()
{
    level._id_1245["rope"] = #animtree;
    level._id_1245["nyse_flag"] = #animtree;
    level._id_0C59["nyse_flag"]["flag_flap"][0] = %ny_manhattan_flappy_flag;
    level._id_1245["tower"] = #animtree;
    level._id_0C59["tower"]["collapse"] = %ny_manhattan_radio_tower_fall;
    level._id_0C59["tower"]["idle"] = %ny_manhattan_radio_tower_pre_idle;
    level._id_1245["turret"] = #animtree;
    level._id_0C59["turret"]["ny_harbor_hind_entry"] = %ny_harbor_hind_enter_minigun;
    level._id_1245["intro_m4"] = #animtree;
    level._id_0C59["intro_m4"]["ny_intro"] = %ny_manhattan_intro_m4;
    level._id_1245["intro_knife"] = #animtree;
    level._id_0C59["intro_knife"]["ny_intro"] = %ny_manhattan_intro_spiderco_knife;
    level._id_1245["intro_m4_scope"] = #animtree;
    level._id_0C59["intro_m4_scope"]["ny_intro"] = %ny_manhattan_intro_magnifier;
}
#using_animtree("vehicles");

_id_47DB()
{
    level._id_1245["ny_harbor_hind"] = #animtree;
    level._id_0C59["ny_harbor_hind"]["rotors"] = %bh_rotors;
    level._id_0C59["ny_harbor_hind"]["approach"] = %ny_manhatten_rooftop_extraction_blackhawk_approach;
    level._id_0C59["ny_harbor_hind"]["approach_idle"][0] = %ny_manhatten_rooftop_extraction_blackhawk_idle;
    _id_47E2();
}
#using_animtree("animated_props");

_id_47DC()
{
    level._id_1245["door"] = #animtree;
    level._id_0C59["door"]["closed"] = %ny_manhattan_signal_flashbang_door_idle;
    level._id_0C59["door"]["open"] = %ny_manhattan_signal_flashbang_door_open;
}
#using_animtree("script_model");

_id_47DD()
{
    level._id_1245["broad_door"] = #animtree;
    level._id_0C59["broad_door"]["door_kick_door"] = %ny_harbor_breech_mulekick_door_kick_open;
}
#using_animtree("vehicles");

_id_47DE()
{
    level._id_1245["intro_gaz"] = #animtree;
    level._id_0C59["intro_gaz"]["gazcrash"] = %ny_manhattan_gazcrash_gaz;
    maps\_anim::_id_1264( "intro_gaz", "vfx_wheel_smk_start", ::_id_47DF, "gazcrash" );
    maps\_anim::_id_1264( "intro_gaz", "vfx_wheel_smk_stop", ::_id_47E0, "gazcrash" );
    level._id_1245["intro_luxurysedan"] = #animtree;
    level._id_0C59["intro_luxurysedan"]["gazcrash"] = %ny_manhattan_gazcrash_luxurysedan;
    maps\_anim::_id_1264( "intro_luxurysedan", "vfx_glass_break_sedan", ::_id_47E1, "gazcrash" );
    level._id_1245["intro_subcompact"] = #animtree;
    level._id_0C59["intro_subcompact"]["gazcrash"] = %ny_manhattan_gazcrash_subcompact;
    maps\_anim::_id_1264( "intro_subcompact", "vfx_glass_break_compact", ::_id_47E1, "gazcrash" );
    level._id_1245["intro_humvee"] = #animtree;
    level._id_0C59["intro_humvee"]["ny_intro"] = %ny_manhattan_intro_humvee;
    level._id_0C59["intro_humvee"]["wheel_loop"][0] = %ny_manhattan_intro_humvee_wheels;
    level._id_1245["15_broad_hind"] = #animtree;
    level._id_0C59["15_broad_hind"]["blades_spin"][0] = %ny_manhattan_mi24p_destroy_idle;
}

_id_47DF( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "tread_smk_road_gaz_back" ), var_0, "tag_wheel_back_left" );
    playfxontag( common_scripts\utility::getfx( "tread_smk_road_gaz_front" ), var_0, "tag_wheel_front_left" );
    playfxontag( common_scripts\utility::getfx( "tread_smk_road_gaz_back" ), var_0, "tag_wheel_back_right" );
    playfxontag( common_scripts\utility::getfx( "tread_smk_road_gaz_front" ), var_0, "tag_wheel_front_right" );
}

_id_47E0( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "tread_smk_road_gaz_back" ), var_0, "tag_wheel_back_left" );
    stopfxontag( common_scripts\utility::getfx( "tread_smk_road_gaz_front" ), var_0, "tag_wheel_front_left" );
    stopfxontag( common_scripts\utility::getfx( "tread_smk_road_gaz_back" ), var_0, "tag_wheel_back_right" );
    stopfxontag( common_scripts\utility::getfx( "tread_smk_road_gaz_front" ), var_0, "tag_wheel_front_right" );
}

_id_47E1( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "car_glass_xl" ), var_0, "tag_glass_left_back_fx" );
    playfxontag( common_scripts\utility::getfx( "car_glass_xl" ), var_0, "tag_glass_left_front_fx" );
    playfxontag( common_scripts\utility::getfx( "car_glass_xl" ), var_0, "tag_glass_right_back_fx" );
    playfxontag( common_scripts\utility::getfx( "car_glass_xl" ), var_0, "tag_glass_right_front_fx" );
    playfxontag( common_scripts\utility::getfx( "car_glass_xl" ), var_0, "tag_glass_front_fx" );
    playfxontag( common_scripts\utility::getfx( "car_glass_xl" ), var_0, "tag_glass_back_fx" );
}

_id_47E2()
{
    level._id_1245["hind_turret"] = #animtree;
}
#using_animtree("generic_human");

_id_47E3()
{
    level._id_11BB["manhattan_hqr_newdirective"] = "manhattan_hqr_newdirective";
    level._id_11BB["manhattan_hqr_assaultvessel"] = "manhattan_hqr_assaultvessel";
    level._id_11BB["manhattan_hqr_enemybirds"] = "manhattan_hqr_enemybirds";
    level._id_11BB["manhattan_hqr_proceed"] = "manhattan_hqr_proceed";
    level._id_11BB["manhattan_hqr_backonline"] = "manhattan_hqr_backonline";
    level._id_11BB["manhattan_hqr_skiesclear"] = "manhattan_hqr_skiesclear";
    level._id_11BB["manhattan_snd_knockitout"] = "manhattan_snd_knockitout";
    level._id_11BB["manhattan_snd_rpgrpg"] = "manhattan_snd_rpgrpg";
    level._id_11BB["manhattan_snd_rogerlast"] = "manhattan_snd_rogerlast";
    level._id_11BB["manhattan_snd_scansectors"] = "manhattan_snd_scansectors";
    level._id_11BB["manhattan_snd_goodkill"] = "manhattan_snd_goodkill";
    level._id_11BB["manhattan_snd_russianbird"] = "manhattan_snd_russianbird";
    level._id_11BB["manhattan_snd_hindhindhind"] = "manhattan_snd_hindhindhind";
    level._id_11BB["manhattan_snd_beadonhim"] = "manhattan_snd_beadonhim";
    level._id_11BB["manhattan_snd_firefirefire"] = "manhattan_snd_firefirefire";
    level._id_11BB["manhattan_snd_werehit"] = "manhattan_snd_werehit";
    level._id_11BB["manhattan_snd_enroute"] = "manhattan_snd_enroute";
    level._id_11BB["manhattan_trk_hindsinbound"] = "manhattan_trk_hindsinbound";
    level._id_11BB["manhattan_trk_enemybird"] = "manhattan_trk_enemybird";
    level._id_11BB["manhattan_trk_stayonhim"] = "manhattan_trk_stayonhim";
    level._id_11BB["manhattan_trk_takingheavyfire"] = "manhattan_trk_takingheavyfire";
    level._id_11BB["manhattan_trk_lookout"] = "manhattan_trk_lookout";
    level._id_11BB["manhattan_trk_goingdown"] = "manhattan_trk_goingdown";
    level._id_11BB["manhattan_rno_lostem"] = "manhattan_rno_lostem";
    level._id_11BB["manhattan_rno_goodwork"] = "manhattan_rno_goodwork";
    level._id_11BB["manhattan_rno_behindbuilding"] = "manhattan_rno_behindbuilding";
    level._id_11BB["manhattan_rno_hangon"] = "manhattan_rno_hangon";
    level._id_11BB["manhattan_rno_holdon"] = "manhattan_rno_holdon";
    level._id_11BB["manhattan_hp1_exfilcomplete"] = "manhattan_hp1_exfilcomplete";
    level._id_11BB["manhattan_hp1_rightsidehigh"] = "manhattan_hp1_rightsidehigh";
    level._id_11BB["manhattan_hp1_evasiveaction"] = "manhattan_hp1_evasiveaction";
    level._id_11BB["manhattan_hp1_holdon"] = "manhattan_hp1_holdon";
    level._id_11BB["manhattan_hp1_pressure"] = "manhattan_hp1_pressure";
    level._id_11BB["manhattan_hp1_comeon"] = "manhattan_hp1_comeon";
    level._id_11BB["manhattan_hp1_fuel70percent"] = "manhattan_hp1_fuel70percent";
    level._id_11BB["manhattan_test_we_have_comms_fx"] = "manhattan_test_we_have_comms_fx";
    level._id_11BB["manhattan_snd_vertical"] = "manhattan_snd_vertical";
    level._id_11BB["manhattan_snd_getonit"] = "manhattan_snd_getonit";
    level.scr_sound["lonestar"]["lonestar_line15"] = "manhattan_snd_flankleft";
    level.scr_sound["lonestar"]["lonestar_line18"] = "manhattan_snd_gohotengage";
    level.scr_sound["lonestar"]["lonestar_line19"] = "manhattan_snd_presstheattack";
    level.scr_sound["lonestar"]["lonestar_line23"] = "manhattan_snd_exchangemove";
    level.scr_sound["lonestar"]["lonestar_line25"] = "manhattan_snd_rallytoeast";
    level.scr_sound["lonestar"]["lonestar_line27"] = "manhattan_snd_inthealley";
    level._id_11B7["lonestar"]["lonestar_line27"] = %ny_manhattan_signal_flashbang_delta_face_start;
    level.scr_sound["lonestar"]["lonestar_line28"] = "manhattan_snd_movemove";
    level.scr_sound["lonestar"]["lonestar_line32"] = "manhattan_snd_provideoverwatch";
    level.scr_sound["lonestar"]["lonestar_line33"] = "manhattan_snd_takecover";
    level.scr_sound["lonestar"]["lonestar_line34"] = "manhattan_snd_holeinthewall";
    level.scr_sound["lonestar"]["lonestar_line35"] = "manhattan_snd_westtostreet";
    level.scr_sound["lonestar"]["lonestar_line37"] = "manhattan_snd_anybodyhit";
    level.scr_sound["lonestar"]["lonestar_line39"] = "manhattan_snd_almostforward";
    level.scr_sound["lonestar"]["lonestar_line41"] = "manhattan_snd_insideexchange";
    level.scr_sound["lonestar"]["lonestar_line50"] = "manhattan_snd_pushmovemove";
    level.scr_sound["lonestar"]["lonestar_line51"] = "manhattan_snd_headuptop";
    level.scr_sound["lonestar"]["lonestar_line52"] = "manhattan_snd_quitdraggin";
    level.scr_sound["lonestar"]["lonestar_line53"] = "manhattan_snd_rikitik";
    level.scr_sound["lonestar"]["lonestar_line54"] = "manhattan_snd_speedsecurity";
    level.scr_sound["lonestar"]["lonestar_line57"] = "manhattan_snd_frostupladder";
    level.scr_sound["lonestar"]["lonestar_line58"] = "manhattan_snd_secondtier";
    level.scr_sound["lonestar"]["lonestar_line78"] = "manhattan_snd_aimforboxesalt";
    level.scr_sound["lonestar"]["lonestar_line102"] = "manhattan_snd_upthestairs";
    level.scr_sound["lonestar"]["lonestar_line103"] = "manhattan_snd_holdtilmygo";
    level.scr_sound["lonestar"]["lonestar_line104"] = "manhattan_snd_regroup";
    level.scr_sound["lonestar"]["lonestar_line105"] = "manhattan_snd_move";
    level.scr_sound["lonestar"]["lonestar_line106"] = "manhattan_snd_gogo";
    level.scr_sound["lonestar"]["lonestar_line107"] = "manhattan_snd_thisway";
    level.scr_sound["lonestar"]["lonestar_line108"] = "manhattan_snd_staytogether";
    level.scr_sound["lonestar"]["lonestar_line116"] = "manhattan_snd_letsroll";
    level.scr_sound["lonestar"]["lonestar_line123"] = "manhattan_snd_hoptherail";
    level.scr_sound["lonestar"]["lonestar_line131"] = "manhattan_snd_midtown";
    level.scr_sound["lonestar"]["lonestar_line132"] = "manhattan_snd_updateonair";
    level.scr_sound["lonestar"]["lonestar_line133"] = "manhattan_snd_getthisdone";
    level.scr_sound["lonestar"]["lonestar_line135"] = "manhattan_snd_switchedon";
    level._id_11B7["lonestar"]["lonestar_line135"] = %ny_manhattan_intro_delta_face_line1;
    level.scr_sound["lonestar"]["lonestar_line136"] = "manhattan_snd_legit";
    level._id_11B7["lonestar"]["lonestar_line136"] = %ny_manhattan_intro_delta_face_line2;
    level.scr_sound["lonestar"]["lonestar_line137"] = "manhattan_snd_checkpoint3b";
    level.scr_sound["lonestar"]["lonestar_line138"] = "manhattan_snd_standingby";
    level.scr_sound["lonestar"]["lonestar_line139"] = "manhattan_snd_establishuplink";
    level.scr_sound["lonestar"]["lonestar_line140"] = "manhattan_snd_isrisopcon";
    level.scr_sound["lonestar"]["lonestar_line142"] = "manhattan_snd_youownit";
    level.scr_sound["lonestar"]["lonestar_line143"] = "manhattan_snd_reapersmissile";
    level.scr_sound["lonestar"]["lonestar_line146"] = "manhattan_snd_hitexchange";
    level.scr_sound["lonestar"]["manhattan_snd_sameasbefore"] = "manhattan_snd_sameasbefore";
    level.scr_sound["lonestar"]["manhattan_snd_lessresistance"] = "manhattan_snd_lessresistance";
    level.scr_sound["lonestar"]["manhattan_snd_frostfrost"] = "manhattan_snd_frostfrost";
    level.scr_sound["lonestar"]["manhattan_snd_rogerthat"] = "manhattan_snd_rogerthat";
    level.scr_sound["lonestar"]["manhattan_snd_youup"] = "manhattan_snd_youup";
    level.scr_sound["lonestar"]["manhattan_rno_getinhere"] = "manhattan_rno_getinhere";
    level.scr_sound["lonestar"]["manhattan_snd_holdup"] = "manhattan_snd_holdup";
    level.scr_sound["lonestar"]["manhattan_snd_headingame"] = "manhattan_snd_headingame";
    level.scr_sound["lonestar"]["pred_multiple_down"] = "manhattan_snd_multipledown";
    level.scr_sound["lonestar"]["pred_multiple_eliminted"] = "manhattan_snd_multipleeliminated";
    level.scr_sound["lonestar"]["pred_good_hit"] = "manhattan_snd_goodhit";
    level.scr_sound["lonestar"]["pred_hit_confirmed"] = "manhattan_snd_hitconfirmed";
    level.scr_sound["lonestar"]["pred_5_targets_down"] = "manhattan_snd_5targets";
    level.scr_sound["lonestar"]["pred_good_effect"] = "manhattan_snd_goodeffect";
    level.scr_sound["lonestar"]["pred_miss"] = "manhattan_snd_thatsamiss";
    level.scr_sound["lonestar"]["pred_short_repeat"] = "manhattan_snd_shortrepeat";
    level.scr_sound["lonestar"]["pred_zero_kills"] = "manhattan_snd_zerokills";
    level.scr_sound["lonestar"]["manhattan_snd_pinneddown"] = "manhattan_snd_pinneddown";
    level.scr_sound["lonestar"]["manhattan_snd_usethereaper"] = "manhattan_snd_usethereaper";
    level.scr_sound["lonestar"]["manhattan_snd_alloverus"] = "manhattan_snd_alloverus";
    level.scr_sound["lonestar"]["manhattan_snd_sendanothermissile"] = "manhattan_snd_sendanothermissile";
    level.scr_sound["lonestar"]["manhattan_snd_hitemagain"] = "manhattan_snd_hitemagain";
    level.scr_sound["lonestar"]["manhattan_snd_anothermissile"] = "manhattan_snd_anothermissile";
    level.scr_sound["lonestar"]["lonestar_line157"] = "manhattan_snd_hindsmoking";
    level.scr_sound["lonestar"]["lonestar_line158"] = "manhattan_snd_ourexfil";
    level.scr_sound["lonestar"]["lonestar_line160"] = "manhattan_snd_stayinghere";
    level.scr_sound["lonestar"]["lonestar_line161"] = "manhattan_snd_burningdaylight";
    level.scr_sound["lonestar"]["lonestar_line162"] = "manhattan_snd_killingtime";
    level.scr_sound["lonestar"]["lonestar_line163"] = "manhattan_snd_boardhelo";
    level.scr_sound["lonestar"]["lonestar_line167"] = "manhattan_snd_aimforboxes2";
    level.scr_sound["lonestar"]["lonestar_line168"] = "manhattan_snd_burnhole";
    level.scr_sound["lonestar"]["lonestar_line169"] = "manhattan_snd_usethermite";
    level.scr_sound["lonestar"]["lonestar_line171"] = "manhattan_snd_burnit";
    level.scr_sound["lonestar"]["lonestar_line172"] = "manhattan_snd_lightthermite";
    level.scr_sound["lonestar"]["lonestar_line173"] = "manhattan_snd_zerotime";
    level.scr_sound["lonestar"]["lonestar_line177"] = "manhattan_snd_approaching";
    level.scr_sound["truck"]["truck_line4"] = "manhattan_trk_threatabove";
    level.scr_sound["truck"]["truck_line5"] = "manhattan_trk_friendlies";
    level.scr_sound["truck"]["truck_line7"] = "manhattan_trk_tradingfloor";
    level.scr_sound["truck"]["truck_line25"] = "manhattan_trk_takecover";
    level.scr_sound["truck"]["truck_line26"] = "manhattan_trk_birdincoming";
    level.scr_sound["truck"]["lonestar_line176"] = "manhattan_snd_flushemout";
    level.scr_sound["truck"]["lonestar_line128"] = "manhattan_snd_blastradius";
    level.scr_sound["truck"]["lonestar_line170"] = "manhattan_snd_comingdown";
    level.scr_sound["truck"]["manhattan_trk_gameplan"] = "manhattan_trk_gameplan";
    level.scr_sound["truck"]["manhattan_trk_dontshoothim"] = "manhattan_trk_dontshoothim";
    level.scr_sound["truck"]["manhattan_trk_static"] = "manhattan_trk_static";
    level.scr_sound["truck"]["manhattan_trk_clear"] = "manhattan_trk_clear";
    level.scr_sound["truck"]["manhattan_trk_moving"] = "manhattan_trk_moving";
    level.scr_sound["reno"]["reno_line3"] = "manhattan_rno_ruarmor";
    level.scr_sound["reno"]["reno_line5"] = "manhattan_rno_morenatashas";
    level.scr_sound["reno"]["reno_line6"] = "manhattan_rno_storebelow";
    level.scr_sound["reno"]["reno_line7"] = "manhattan_rno_memorialbuilding";
    level.scr_sound["reno"]["reno_line26"] = "manhattan_rno_birddown";
    level.scr_sound["reno"]["reno_line27"] = "manhattan_rno_goodwork";
    level.scr_sound["reno"]["reno_line28"] = "manhattan_rno_covering";
    level.scr_sound["reno"]["reno_line29"] = "manhattan_rno_providingcover";
    level.scr_sound["reno"]["reno_line30"] = "manhattan_rno_imonit";
    level.scr_sound["reno"]["reno_line31"] = "manhattan_rno_balcony";
    level.scr_sound["reno"]["reno_line32"] = "manhattan_rno_balconyclear";
    level.scr_sound["reno"]["reno_line34"] = "manhattan_rno_rogerwithyou";
    level.scr_sound["reno"]["reno_line36"] = "manhattan_rno_contact";
    level.scr_sound["reno"]["manhattan_rno_likeit"] = "manhattan_rno_likeit";
    level.scr_sound["reno"]["manhattan_rno_noshit"] = "manhattan_rno_noshit";
    level.scr_sound["reno"]["manhattan_rno_adios"] = "manhattan_rno_adios";
    level.scr_sound["reno"]["manhattan_rno_anythingoncomms"] = "manhattan_rno_anythingoncomms";
    level.scr_sound["reno"]["manhattan_rno_weregood"] = "manhattan_rno_weregood";
    level.scr_sound["reno"]["manhattan_rno_badguys"] = "manhattan_rno_badguys";
    level.scr_sound["delta2_leader"]["d2_line1"] = "manhattan_dlt2_weregood";
    level.scr_sound["delta2_leader"]["d2_line3"] = "manhattan_brvl_tradingfloor";
    level.scr_sound["delta2_leader"]["d2_line4"] = "manhattan_brvl_lockeddown";
    level.scr_sound["delta2_leader"]["d2_line5"] = "manhattan_brvl_jtac";
    level.scr_sound["generic"]["radio_loop02"] = "manhattan_gm2_fortyprecent";
    level.scr_sound["generic"]["radio_loop03"] = "manhattan_gm2_cryptochange";
}
