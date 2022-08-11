// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_56D9();
    _id_4CBB();
    _id_47D9();
    _id_0531();
    _id_052F();
    _id_56E5();
    vending_machine();
    _id_0532();
    _id_052D();
    _id_0533();
    _id_56DE();
    _id_0530();
    _id_0534();
    _id_0538();
    _id_0536();
}
#using_animtree("generic_human");

_id_56D9()
{
    level._id_0C59["generic"]["dying_crawl"] = %dying_crawl;
    level._id_0C59["generic"]["dying_crawl_death_v2"] = %dying_crawl_death_v2;
    level._id_0C59["generic"]["exposed_death_flop"] = %exposed_death_flop;
    level._id_0C59["generic"]["dying_back_death_v1"] = %dying_back_death_v1;
    level._id_0C59["generic"]["dying_back_death_v2"] = %dying_back_death_v2;
    level._id_0C59["generic"]["dying_back_death_v3"] = %dying_back_death_v3;
    level._id_0C59["generic"]["dying_back_death_v4"] = %dying_back_death_v4;
    level._id_0C59["generic"]["dying_crawl_death_v1"] = %dying_crawl_death_v1;
    level._id_0C59["generic"]["civilian_leaning_death"] = %civilian_leaning_death;
    level._id_0C59["generic"]["exposed_death_nerve"] = %exposed_death_nerve;
    level._id_0C59["generic"]["run_death_roll"] = %run_death_roll;
    level._id_0C59["generic"]["death_pose_on_window"] = %death_pose_on_window;
    level._id_0C59["generic"]["death_pose_on_desk"] = %death_pose_on_desk;
    level._id_0C59["generic"]["exposed_death"] = %exposed_death;
    level._id_0C59["generic"]["exposed_death_falltoknees"] = %exposed_death_falltoknees;
    level._id_0C59["generic"]["civilain_crouch_hide_idle"][0] = %civilain_crouch_hide_idle;
    level._id_0C59["generic"]["station_melee_scene_sas"] = %cornersdr_melee_wina_attacker;
    level._id_0C59["generic"]["station_melee_scene_chump"] = %cornersdr_melee_wina_defender;
    level._id_0C59["generic"]["london_turnstile_traverse"] = %london_turnstile_traverse;
    level.scr_sound["generic"]["london_sas1_sir"] = "london_sas1_sir";
    maps\_anim::_id_1261( "generic", "attach_knife", "weapon_parabolic_knife", "TAG_INHAND", "station_melee_scene_sas" );
    maps\_anim::_id_1262( "generic", "detach_knife", "weapon_parabolic_knife", "TAG_INHAND", "station_melee_scene_sas" );
    maps\_anim::_id_1264( "generic", "stab", maps\london_west_code::_id_05EC, "station_melee_scene_sas" );
    level._id_0C59["generic"]["hunted_woundedhostage_check_hostage"] = %hunted_woundedhostage_check_hostage;
    level._id_0C59["generic"]["hunted_woundedhostage_check_soldier"] = %hunted_woundedhostage_check_soldier;
    level._id_0C59["generic"]["hunted_woundedhostage_check_soldier_end"] = %hunted_woundedhostage_check_soldier_end;
    level._id_0C59["generic"]["jeepride_CPR_price"] = %jeepride_cpr_price;
    level._id_0C59["generic"]["jeepride_CPR_medic"] = %jeepride_cpr_medic;
    level._id_0C59["generic"]["parabolic_phoneguy_idle"][0] = %parabolic_phoneguy_idle;
    level._id_0C59["generic"]["roadkill_videotaper_3B_explosion_idle"][0] = %roadkill_videotaper_3b_explosion_idle;
    level._id_0C59["generic"]["roadkill_videotaper_4B_explosion_idle"][0] = %roadkill_videotaper_4b_explosion_idle;
    level._id_0C59["generic"]["roadkill_videotaper_2B_explosion_idle"][0] = %roadkill_videotaper_2b_explosion_idle;
    level._id_0C59["generic"]["roadkill_videotaper_1B_explosion_idle"][0] = %roadkill_videotaper_1b_explosion_idle;
    level._id_0C59["generic"]["civilian_smoking_A"][0] = %civilian_smoking_a;
    level._id_0C59["generic"]["civilian_cower_idle"][0] = %unarmed_cowercrouch_idle_duck;
    level._id_0C59["generic"]["exposed_crouch_extendedpainA"] = %exposed_crouch_extendedpaina;
    level._id_0C59["generic"]["death_explosion_stand_B_v2"] = %death_explosion_stand_b_v2;
    level._id_0C59["generic"]["death_explosion_stand_B_v4"] = %death_explosion_stand_b_v4;
    level._id_0C59["generic"]["civilian_run_hunched_C"] = %civilian_run_hunched_c;
    level._id_0C59["generic"]["civilian_run_2_crawldeath"] = %civilian_run_2_crawldeath;
    level._id_0C59["generic"]["london_gas_hero_death_1"] = %london_gas_hero_death_1;
    level._id_0C59["generic"]["london_gas_hero_death_2"] = %london_gas_hero_death_2;
    level._id_0C59["generic"]["london_gas_hero_death_3"] = %london_gas_hero_death_3;
    level._id_0C59["generic"]["london_gas_hero_death_4"] = %london_gas_hero_death_4;
    level._id_0C59["generic"]["inspect_truck"] = %london_bomber_friendly_inspect_01;
    maps\_anim::_id_1264( "generic", "truckdoor_start", ::_id_0537, "inspect_truck" );
    level._id_0C59["generic"]["death_explosion1"] = %death_explosion_back13;
    level._id_0C59["generic"]["death_explosion2"] = %death_shotgun_back_v1;
    level._id_0C59["generic"]["explosion_reaction"] = %london_friendly_blowback;
    level._id_0C59["generic"]["hunted_woundedhostage_idle_start"][0] = %hunted_woundedhostage_idle_start;
    level._id_0C59["generic"]["hunted_woundedhostage_idle_end"][0] = %hunted_woundedhostage_idle_end;
    level.scr_sound["generic"]["london_b21_whathappened"] = "london_b21_whathappened";
}

_id_052D()
{
    level._id_0C59["takedown_enemy1"]["takedown"] = %london_enemy_capture_enemy_01;
    maps\_anim::_id_1264( "takedown_enemy1", "bodyfall large", ::_id_052E, "takedown" );
    maps\_anim::_id_1263( "takedown_enemy1", "detach gun", "takedown", 1 );
    level._id_0C59["takedown_enemy1"]["idle"][0] = %london_enemy_capture_enemy_idle_01;
    level._id_0C59["takedown_friendly1"]["takedown"] = %london_enemy_capture_friendly_01;
    level._id_0C59["takedown_friendly1"]["idle"][0] = %london_enemy_capture_friendly_idle_01;
    level._id_0C59["takedown_enemy1"]["death"] = %london_enemy_capture_enemy_death_01;
    level._id_0C59["takedown_friendly1"]["takedown_ended_on_ground"] = %london_enemy_capture_friendly_death_01;
    level._id_0C59["takedown_enemy3"]["takedown"] = %london_enemy_capture_enemy_03;
    maps\_anim::_id_1264( "takedown_enemy3", "bodyfall large", ::_id_052E, "takedown" );
    maps\_anim::_id_1263( "takedown_enemy3", "detach gun", "takedown", 1 );
    level._id_0C59["takedown_enemy3"]["idle"][0] = %london_enemy_capture_enemy_idle_01;
    level._id_0C59["takedown_friendly3"]["takedown"] = %london_enemy_capture_friendly_03;
    level._id_0C59["takedown_friendly3"]["idle"][0] = %london_enemy_capture_friendly_idle_01;
    level._id_0C59["takedown_enemy3"]["death"] = %london_enemy_capture_enemy_death_01;
    level._id_0C59["takedown_friendly3"]["takedown_ended_on_ground"] = %london_enemy_capture_friendly_death_01;
    level._id_0C59["takedown_enemy4"]["takedown"] = %london_enemy_capture_enemy_04;
    maps\_anim::_id_1264( "takedown_enemy4", "bodyfall large", ::_id_052E, "takedown" );
    maps\_anim::_id_1263( "takedown_enemy4", "detach gun", "takedown", 1 );
    level._id_0C59["takedown_enemy4"]["idle"][0] = %london_enemy_capture_enemy_idle_04;
    level._id_0C59["takedown_friendly4"]["takedown"] = %london_enemy_capture_friendly_04;
    level._id_0C59["takedown_friendly4"]["idle"][0] = %london_enemy_capture_friendly_idle_04;
    level._id_0C59["takedown_enemy4"]["death"] = %london_enemy_capture_enemy_death_04;
    level._id_0C59["takedown_friendly4"]["takedown_ended_on_ground"] = %london_enemy_capture_friendly_death_01;
    level._id_0C59["takedown_friendly4"]["crouch_to_stand"] = %cornercrl_alert_2_stand;
    level._id_0C59["takedown_friendly1"]["all_dead_idle"][0] = %stand_alertb_idle1;
    level._id_0C59["takedown_friendly2"]["all_dead_idle"][0] = %stand_alertb_idle1;
    level._id_0C59["takedown_friendly3"]["all_dead_idle"][0] = %stand_alertb_idle1;
    level._id_0C59["takedown_friendly4"]["all_dead_idle"][0] = %stand_alertb_idle1;
    level._id_0C59["generic"]["all_dead_idle"][0] = %stand_alertb_idle1;
}

_id_052E( var_0 )
{
    var_0._id_05FA._id_0607 = 1;
    var_0._id_0D50 = var_0 maps\_utility::_id_1281( "death" );
}

_id_052F()
{
    level._id_0C59["sas"]["sas_wave"] = %dcemp_door_sequence_foley_wave;
    level.scr_sound["sas"]["london_sas2_ladstaketruck"] = "london_sas2_ladstaketruck";
}

_id_0530()
{
    level._id_0C59["generic"]["front_exit_anim"] = %london_police_car_exit_2_jog_f;
    level._id_0C59["generic"]["jog"] = %london_police_jog;
}

_id_0531()
{
    level._id_0C59["russian_soldier"]["check_body_surprise"] = %exposed_idle_reactb;
    level.scr_sound["russian_soldier"]["london_ru1_gettotrucks"] = "london_ru1_gettotrucks";
    level.scr_sound["russian_soldier"]["london_ru2_gettotrucks"] = "london_ru2_gettotrucks";
}

_id_0532()
{
    level._id_0C59["vending_dude_1"]["vending_scene"] = %london_vending_blocker_guy1;
    level._id_0C59["vending_dude_2"]["vending_scene"] = %london_vending_blocker_guy2;
}

_id_4CBB()
{
    level._id_11BB["london_com_deployteams"] = "london_com_deployteams";
    level._id_11BB["london_com_stillenroute"] = "london_com_stillenroute";
    level._id_11BB["london_com_stillenroute"] = "london_com_stillenroute";
    level._id_11BB["london_com_onscene"] = "london_com_onscene";
    level._id_11BB["london_hp2_truckcoming"] = "london_hp2_truckcoming";
}

_id_0533()
{
    level._id_0C59["generic"]["police_wave"][0] = %london_police_wave_1;
    level._id_0C59["generic"]["police_wave"][1] = %london_police_wave_2;
    level._id_0C59["generic"]["civilian_stand_idle"][0] = %civilian_stand_idle;
    level._id_0C59["generic"]["civilian_smoking_A"][0] = %civilian_smoking_a;
    level._id_0C59["generic"]["setup_blockade"] = %london_sandman_sas_talk_friendly;
    level.scr_sound["generic"]["setup_blockade1"] = "london_b21_securethearea";
    level.scr_sound["generic"]["setup_blockade2"] = "london_b21_lockdown";
    level.scr_sound["generic"]["london_b21_weaponsfree"] = "london_b21_weaponsfree";
    level.scr_sound["generic"]["london_b21_clear"] = "london_b21_clear";
    level.scr_sound["generic"]["london_b21_checkit"] = "london_b21_checkit";
    level.scr_sound["generic"]["london_med1_youreallright"] = "london_med1_youreallright";
    level.scr_sound["sas medic"]["london_med1_medivac"] = "london_med1_medivac";
}

_id_0534()
{
    level._id_0C59["drone"]["standing"][0] = %london_civ_idle_lookover;
    level._id_0C59["drone"]["standingweight"][0] = 1;
    level._id_0C59["drone"]["standing"][1] = %london_civ_idle_checkwatch;
    level._id_0C59["drone"]["standingweight"][1] = 1;
    level._id_0C59["drone"]["standing"][2] = %london_civ_idle_lookbehind;
    level._id_0C59["drone"]["standingweight"][2] = 1;
    level._id_0C59["drone"]["standing"][3] = %london_civ_idle_sneeze;
    level._id_0C59["drone"]["standingweight"][3] = 1;
    level._id_0C59["drone"]["standing"][4] = %london_civ_idle_wave;
    level._id_0C59["drone"]["standingweight"][4] = 0.2;
    level._id_0C59["drone"]["standing"][5] = %london_civ_idle_foldarms_scratchass;
    level._id_0C59["drone"]["standingweight"][5] = 1;
    level._id_0C59["drone"]["standing"][6] = %london_civ_idle_foldarms2;
    level._id_0C59["drone"]["standingweight"][6] = 1;
    level._id_0C59["drone"]["standing"][7] = %london_civ_idle_scratchnose;
    level._id_0C59["drone"]["standingweight"][7] = 1;
    level._id_0C59["drone"]["police_wave"][0] = %london_police_wave_1;
    level._id_0C59["drone"]["police_wave"][1] = %london_police_wave_2;
    level._id_0C59["drone"]["hurried_walk"][0] = %civilian_walk_hurried_1_relative;
    level._id_0C59["drone"]["hurried_walk"][1] = %civilian_walk_hurried_2_relative;
    level._id_0C59["drone"]["hunched_run"][0] = %civilian_run_hunched_a_relative;
    level._id_0C59["drone"]["hunched_run"][1] = %civilian_run_hunched_c_relative;
    level._id_0C59["generic"]["hunched_run"][0] = %civilian_run_hunched_a_relative;
    level._id_0C59["generic"]["hunched_run"][1] = %civilian_run_hunched_c_relative;
}

_id_56DE()
{
    level.scr_sound["sas_leader"]["london_ldr_bastard"] = "london_ldr_bastard";
    level.scr_sound["sas_leader"]["london_ldr_notgoinganywhere"] = "london_ldr_notgoinganywhere";
    level.scr_sound["sas_leader"]["london_ldr_thatsformymates"] = "london_ldr_thatsformymates";
    level.scr_sound["sas_leader"]["london_ldr_usingthetube"] = "london_ldr_usingthetube";
    level.scr_sound["sas_leader"]["london_ldr_doubletime"] = "london_ldr_doubletime";
    level.scr_sound["sas_leader"]["london_ldr_britishwelcome"] = "london_ldr_britishwelcome";
    level.scr_sound["sas_leader"]["london_ldr_checkcorners2"] = "london_ldr_checkcorners2";
    level.scr_sound["sas_leader"]["london_ldr_watchforcivvies"] = "london_ldr_watchforcivvies";
    level.scr_sound["sas_leader"]["london_ldr_areaclear"] = "london_ldr_areaclear";
    level.scr_sound["sas_leader"]["london_ldr_wheresbackup"] = "london_ldr_wheresbackup";
    level.scr_sound["sas_leader"]["london_ldr_stoplarkin"] = "london_ldr_stoplarkin";
    level.scr_sound["sas_leader"]["london_ldr_keeppushing"] = "london_ldr_keeppushing";
    level.scr_sound["sas_leader"]["london_ldr_upthestairs"] = "london_ldr_upthestairs";
    level.scr_sound["sas_leader"]["london_ldr_grenade2"] = "london_ldr_grenade2";
    level.scr_sound["sas_leader"]["london_ldr_cheekybastards"] = "london_ldr_cheekybastards";
    level.scr_sound["sas_leader"]["london_ldr_wheresbackup"] = "london_ldr_wheresbackup";
    level.scr_sound["sas_leader"]["london_ldr_thefuzz"] = "london_ldr_thefuzz";
    level.scr_sound["sas_leader"]["london_ldr_nicetiming"] = "london_ldr_nicetiming";
    level.scr_sound["sas_leader"]["london_ldr_letsgoburns"] = "london_ldr_letsgoburns";
    level.scr_sound["sas_leader"]["london_ldr_lorries"] = "london_ldr_lorries";
    level.scr_sound["sas_leader"]["london_ldr_wherearetrucks"] = "london_ldr_wherearetrucks";
    level._id_0C59["sas_leader"]["alley_comm_check"] = %london_sandman_intro;
    level._id_0C59["sas_leader"]["alley_comm_idle"][0] = %london_sandman_talk_idle;
    level._id_0C59["sas_leader"]["westminster_stop"] = %cqb_stop_2_signal;
    level._id_0C59["sas_leader"]["littlebird_idle"][0] = %little_bird_casual_idle_guy3;
    level._id_0C59["sas_leader"]["setup_blockade"] = %london_sandman_sas_talk_sandman;
    level.scr_sound["sas_leader"]["london_ldr_atblockade"] = "london_ldr_atblockade";
    level.scr_sound["sas_leader"]["london_ldr_burnsonme"] = "london_ldr_burnsonme";
    level.scr_sound["sas_leader"]["london_ldr_stackupburns"] = "london_ldr_stackupburns";
    level.scr_sound["sas_leader"]["london_ldr_burnsherenow"] = "london_ldr_burnsherenow";
    level.scr_sound["sas_leader"]["london_ldr_aimfordriver"] = "london_ldr_aimfordriver";
    level.scr_sound["sas_leader"]["london_ldr_holdyourfire"] = "london_ldr_holdyourfire";
    level.scr_sound["sas_leader"]["london_ldr_allclear"] = "london_ldr_allclear";
    level.scr_sound["sas_leader"]["london_ldr_watchmovement"] = "london_ldr_watchmovement";
    level._id_0C59["sas_leader"]["explosion_reaction"] = %london_sandman_blowback;
    level.scr_sound["sas_leader"]["london_ldr_needamedi"] = "london_ldr_needamedi";
    level.scr_sound["sas_leader"]["london_ldr_stillwithus"] = "london_ldr_stillwithus";
    level._id_0C59["sas_leader"]["london_gas_hero_death_1"] = %london_gas_hero_death_1;
}

_id_0535( var_0 )
{
    var_1 = [ level._id_56DE, level._id_0578 ];
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_24F5 );
    level._id_56DE._id_238A = 1;
    var_2 = spawnstruct();
    var_2.origin = level._id_51F2._id_057C;
    var_2.angles = level._id_51F2._id_057D;
    var_2 maps\_anim::_id_11DD( var_1, "explosion_reaction" );
}

_id_0536()
{
    level._id_0C59["generic"]["walk"] = %civilian_walk_cool;
    level._id_0C59["generic"]["runaway1"] = %civilian_run_upright;
    level._id_0C59["generic"]["runaway2"] = %civilian_run_hunched_a;
}
#using_animtree("player");

_id_47D9()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_sas";
    level._id_0C59["player_rig"]["player_explosion"] = %london_player_blowback;
}
#using_animtree("vehicles");

_id_56E5()
{
    level._id_1245["delivery_truck"] = #animtree;
    level._id_1F90["delivery_truck"] = "vehicle_uk_delivery_truck";
    level._id_0C59["delivery_truck"]["truck_crash"] = %london_bomber_truck_crash;
    maps\_anim::_id_125D( "delivery_truck", "truck_crash1", "truck_crash", "scn_london_truck_crash_tumble" );
}

_id_0537( var_0 )
{

}
#using_animtree("script_model");

vending_machine()
{
    level._id_1245["vending_machine"] = #animtree;
    level._id_0C59["vending_machine"]["vending_scene"] = %london_vending_blocker_vendingmachine;
}

_id_0538()
{
    level._id_1245["gas_model"] = #animtree;
    level._id_0C59["gas_model"]["start"] = %london_gas_attack;
    level._id_0C59["gas_model"]["loop"][0] = %london_gas_attack_loop;
}
