// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_7A0D();
    _id_7A0E();
    _id_7A0F();
    _id_56DE();
    _id_4CBB();
}
#using_animtree("player");

_id_7A0D()
{
    level._id_1F90["player_rig_tunnel_crash"] = "viewhands_player_sas";
    level._id_0C59["player_rig_tunnel_crash"]["train_crash"] = %london_player_bail;
    level._id_1F90["player_mount_truck"] = "viewhands_player_sas";
    level._id_0C59["player_mount_truck"]["truck_mount"] = %london_utilitytruck_player_mount;
    level._id_1245["player_mount_truck"] = #animtree;
    maps\_anim::_id_1265( "player_rig_tunnel_crash", "dirt_kickup_hands_start", "train_crash", "dirt_kickup_hands", "J_wrist_RI" );
    maps\_anim::_id_1265( "player_rig_tunnel_crash", "dirt_kickup_hands_start", "train_crash", "dirt_kickup_hands", "J_wrist_LE" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash", "dirt_kickup_hands_stop", "train_crash", "dirt_kickup_hands", "J_wrist_RI" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash", "dirt_kickup_hands_stop", "train_crash", "dirt_kickup_hands", "J_wrist_LE" );
    maps\_anim::_id_1265( "player_rig_tunnel_crash", "dirt_kickup_hands_light_start", "train_crash", "dirt_kickup_hands_light", "J_wrist_RI" );
    maps\_anim::_id_1265( "player_rig_tunnel_crash", "dirt_kickup_hands_light_start", "train_crash", "dirt_kickup_hands_light", "J_wrist_LE" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash", "dirt_kickup_hands_light_stop", "train_crash", "dirt_kickup_hands_light", "J_wrist_RI" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash", "dirt_kickup_hands_light_stop", "train_crash", "dirt_kickup_hands_light", "J_wrist_LE" );
    maps\_anim::_id_1265( "player_rig_tunnel_crash", "dirt_kickup_head_start", "train_crash", "dirt_kickup_head", "TAG_CAMERA" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash", "dirt_kickup_head_stop", "train_crash", "dirt_kickup_head", "TAG_CAMERA" );
    level._id_1245["player_rig_tunnel_crash"] = #animtree;
    level._id_1F90["player_rig_tunnel_crash_teleport"] = "viewhands_player_sas";
    level._id_0C59["player_rig_tunnel_crash_teleport"]["train_crash"] = %london_player_bail;
    maps\_anim::_id_1267( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_light_start", "smoke_fill", "train_crash" );
    maps\_anim::_id_1264( "player_rig_tunnel_crash_teleport", "dirt_kickup_head_start", maps\westminster_code::_id_79BF, "train_crash" );
    maps\_anim::_id_1264( "player_rig_tunnel_crash_teleport", "transition", maps\westminster_code::_id_79BE, "train_crash" );
    maps\_anim::_id_1264( "player_rig_tunnel_crash_teleport", "dirt_kickup_head_start", maps\westminster_code::_id_404E, "train_crash" );
    maps\_anim::_id_1265( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_start", "train_crash", "dirt_kickup_hands", "J_wrist_RI" );
    maps\_anim::_id_1265( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_start", "train_crash", "dirt_kickup_hands", "J_wrist_LE" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_stop", "train_crash", "dirt_kickup_hands", "J_wrist_RI" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_stop", "train_crash", "dirt_kickup_hands", "J_wrist_LE" );
    maps\_anim::_id_1265( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_light_start", "train_crash", "dirt_kickup_hands_light", "J_wrist_RI" );
    maps\_anim::_id_1265( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_light_start", "train_crash", "dirt_kickup_hands_light", "J_wrist_LE" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_light_stop", "train_crash", "dirt_kickup_hands_light", "J_wrist_RI" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_light_stop", "train_crash", "dirt_kickup_hands_light", "J_wrist_LE" );
    maps\_anim::_id_1265( "player_rig_tunnel_crash_teleport", "dirt_kickup_head_start", "train_crash", "dirt_kickup_head", "TAG_CAMERA" );
    maps\_anim::_id_1266( "player_rig_tunnel_crash_teleport", "dirt_kickup_head_stop", "train_crash", "dirt_kickup_head", "TAG_CAMERA" );
    maps\_anim::_id_1267( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_stop", "train_crash_tumble_stops", "train_crash" );
    level._id_1245["player_rig_tunnel_crash_teleport"] = #animtree;
}
#using_animtree("generic_human");

_id_7A0E()
{
    level._id_0C59["london_station_civ1"]["idle"][0] = %london_station_civ1_idle;
    level._id_0C59["london_station_civ1"]["reaction"] = %london_station_civ1_reaction;
    level._id_0C59["london_station_civ2"]["idle"][0] = %london_station_civ2_idle;
    level._id_0C59["london_station_civ2"]["reaction"] = %london_station_civ2_reaction;
    level._id_0C59["london_station_civ3"]["reaction"] = %london_station_civ3_reaction;
    level._id_0C59["london_station_civ4"]["idle"][0] = %london_station_civ4_idle;
    level._id_0C59["london_station_civ4"]["reaction"] = %london_station_civ4_reaction;
    level._id_0C59["london_station_civ5"]["idle"][0] = %london_station_civ5_idle;
    level._id_0C59["london_station_civ5"]["reaction"] = %london_station_civ5_reaction;
    level._id_0C59["london_station_civ6"]["idle"][0] = %london_station_civ6_idle;
    level._id_0C59["london_station_civ6"]["reaction"] = %london_station_civ6_reaction;
    level._id_0C59["london_station_civ7"]["idle"][0] = %london_station_civ7_idle;
    level._id_0C59["london_station_civ7"]["reaction"] = %london_station_civ7_reaction;
    level._id_0C59["london_station_civ8"]["reaction"] = %london_station_civ8_reaction;
    level._id_0C59["london_station_civ9a"]["reaction"] = %london_station_civ9a_reaction;
    level._id_0C59["london_station_civ9b"]["reaction"] = %london_station_civ9b_reaction;
    level._id_0C59["london_station_civ10a"]["reaction"] = %london_station_civ10a_reaction;
    level._id_0C59["london_station_civ10b"]["reaction"] = %london_station_civ10b_reaction;
    level._id_0C59["london_station_civ11"]["idle"][0] = %london_station_civ11_idle;
    level._id_0C59["london_station_civ11"]["reaction"] = %london_station_civ11_reaction;
    level._id_0C59["generic"]["death_in_place"] = %death_stand_dropinplace;
    level._id_0C59["generic"]["run_lowready_reload"] = %run_lowready_reload;
    level._id_0C59["generic"]["run_n_gun_l_120"] = %run_n_gun_l_120;
    level._id_0C59["generic"]["run_n_gun_l"] = %run_n_gun_l;
    level._id_0C59["generic"]["heat_run_loop"] = %heat_run_loop;
    level._id_0C59["truck_gunner"]["train_crash"] = %london_truck_crash_guy;
    level._id_0C59["truck_gunner"]["idle_loop"] = [ %exposed_crouch_idle_twitch_v2, %exposed_crouch_idle_twitch_v3 ];
    level._id_0C59["generic"]["utility_driver_mount"] = %london_utilitytruck_driver_mount;
    level._id_0C59["generic"]["crouch2stand"] = %crouch2stand;
    level._id_0C59["generic"]["sandman_stumble"] = %london_truckcrash_crawl;
}

_id_56DE()
{
    level.scr_sound["sas_leader"]["london_ldr_inthetrucks"] = "london_ldr_inthetrucks";
    level.scr_sound["sas_leader"]["london_ldr_burnsintruck"] = "london_ldr_burnsintruck";
    level.scr_sound["sas_leader"]["london_ldr_arseintruck"] = "london_ldr_arseintruck";
    level.scr_sound["sas_leader"]["london_ldr_burnsalright"] = "london_ldr_burnsalright";
    level.scr_sound["sas_leader"]["london_ldr_burnsalright"] = "london_ldr_burnsalright";
    level.scr_sound["sas_leader"]["london_ldr_scrapmetal2"] = "london_ldr_scrapmetal2";
    level.scr_sound["sas_leader"]["london_ldr_nothingwecando"] = "london_ldr_nothingwecando";
}

_id_4CBB()
{
    level._id_11BB["london_gfn_skivin"] = "london_gfn_skivin";
    level._id_11BB["london_ldr_holdon"] = "london_ldr_holdon";
    level._id_11BB["train_ride_rpg"] = "london_gfn_rpg";
    level._id_11BB["london_ldr_alongside"] = "london_ldr_alongside";
    level._id_11BB["london_sasl_incomingtrain"] = "london_sasl_incomingtrain";
    level._id_11BB["littleclose"] = [ "london_ldr_littleclose", "london_gfn_inonepiece", "london_ldr_keepsteady" ];
    level._id_11BB["london_ldr_littleclose"] = "london_ldr_littleclose";
    level._id_11BB["london_gfn_inonepiece"] = "london_gfn_inonepiece";
    level._id_11BB["london_ldr_keepsteady"] = "london_ldr_keepsteady";
    level._id_11BB["london_ldr_civviesahead"] = "london_ldr_civviesahead";
    level._id_11BB["wheretheyheaded"] = [ "london_ldr_throughtube", "london_com_metroexits" ];
    level._id_11BB["london_ldr_throughtube"] = "london_ldr_throughtube";
    level._id_11BB["london_com_metroexits"] = "london_com_metroexits";
    level._id_11BB["outside_help"] = [ "london_ldr_whereareyou", "london_hp2_inboundandhot" ];
    level._id_11BB["london_ldr_whereareyou"] = "london_ldr_whereareyou";
    level._id_11BB["london_hp2_inboundandhot"] = "london_hp2_inboundandhot";
    level._id_11BB["stillbreathing"] = [ "london_ldr_stillkickin", "london_sasl_cantgetashot" ];
    level._id_11BB["london_ldr_stillkickin"] = "london_ldr_stillkickin";
    level._id_11BB["london_sasl_cantgetashot"] = "london_sasl_cantgetashot";
    level._id_11BB["london_ldr_stoptrainnow2"] = "london_ldr_stoptrainnow2";
    level._id_11BB["london_sasl_seethedriver"] = "london_sasl_seethedriver";
    level._id_11BB["london_sas2_pierceisdown"] = "london_sas2_pierceisdown";
    level._id_11BB["london_ldr_finghell"] = "london_ldr_finghell";
    level._id_11BB["london_ldr_holdon2"] = "london_ldr_holdon2";
}
#using_animtree("vehicles");

_id_7A0F()
{
    level._id_0C59["generic"]["subway_doors_root"] = %subway_cart;
    level._id_0C59["generic"]["subway_doors_open"] = %subway_cart_doors_open;
    level._id_0C59["generic"]["subway_doors_close"] = %subway_cart_doors_close;
    level._id_0C59["generic"]["subway_doors_open2"] = %subway_cart_doors_open2;
    level._id_0C59["generic"]["subway_doors_close2"] = %subway_cart_doors_close2;
    level._id_0C59["train_car1"]["train_crash"] = %london_train_crash_1;
    maps\_anim::_id_1267( "train_car1", "break", "train_breaks_in_half", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_213", "train_column_213", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_212", "train_column_212", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_211", "train_column_211", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_203", "train_column_203", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_202", "train_column_202", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_201", "train_column_201", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_193", "train_column_193", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_192", "train_column_192", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_191", "train_column_191", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_183", "train_column_183", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_182", "train_column_182", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_181", "train_column_181", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_173", "train_column_173", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_172", "train_column_172", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_171", "train_column_171", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_163", "train_column_163", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_162", "train_column_162", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_161", "train_column_161", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_153", "train_column_153", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_152", "train_column_152", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_151", "train_column_151", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_143", "train_column_143", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_142", "train_column_142", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_141", "train_column_141", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_133", "train_column_133", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_132", "train_column_132", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_131", "train_column_131", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_123", "train_column_123", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_122", "train_column_122", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_121", "train_column_121", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_113", "train_column_113", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_112", "train_column_112", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_111", "train_column_111", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_103", "train_column_103", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_102", "train_column_102", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_101", "train_column_101", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_093", "train_column_093", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_092", "train_column_092", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_091", "train_column_091", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_083", "train_column_083", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_082", "train_column_082", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_081", "train_column_081", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_073", "train_column_073", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_072", "train_column_072", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_071", "train_column_071", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_063", "train_column_063", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_062", "train_column_062", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_061", "train_column_061", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_053", "train_column_053", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_052", "train_column_052", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_051", "train_column_051", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_043", "train_column_043", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_042", "train_column_042", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_041", "train_column_041", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_033", "train_column_033", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_032", "train_column_032", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_031", "train_column_031", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_023", "train_column_023", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_022", "train_column_022", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_021", "train_column_021", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_013", "train_column_013", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_012", "train_column_012", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_011", "train_column_011", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_003", "train_column_003", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_002", "train_column_002", "train_crash" );
    maps\_anim::_id_1267( "train_car1", "collumn_001", "train_column_001", "train_crash" );
    maps\_anim::_id_1267( "truck", "truck_debris", "london_truck_crash", "train_crash" );
    maps\_anim::_id_1267( "truck", "explode", "train_crash_explode", "train_crash" );
    maps\_anim::_id_1265( "train_car1", "sparks_start", "train_crash", "sparks_subway_scrape_line", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1266( "train_car1", "sparks_stop", "train_crash", "sparks_subway_scrape_line", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1265( "train_car1", "sparks_front_start", "train_crash", "sparks_subway_scrape_point", "TAG_FRONT_FX" );
    maps\_anim::_id_1266( "train_car1", "sparks_front_stop", "train_crash", "sparks_subway_scrape_point", "TAG_FRONT_FX" );
    maps\_anim::_id_1265( "train_car1", "sparks_back_start", "train_crash", "sparks_subway_scrape_point", "TAG_BACK_FX" );
    maps\_anim::_id_1266( "train_car1", "sparks_back_stop", "train_crash", "sparks_subway_scrape_point", "TAG_BACK_FX" );
    maps\_anim::_id_1265( "train_car1", "bottom_player_fx_start", "train_crash", "debris_subway_scrape_line", "TAG_PLAYER1_FX" );
    maps\_anim::_id_1266( "train_car1", "bottom_player_fx_stop", "train_crash", "debris_subway_scrape_line", "TAG_PLAYER1_FX" );
    maps\_anim::_id_1265( "train_car1", "wheel_sparks_on", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1266( "train_car1", "wheel_sparks_off", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1265( "train_car1", "wheel_sparks_on_2", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_TOP_FX" );
    maps\_anim::_id_1266( "train_car1", "wheel_sparks_off_2", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_TOP_FX" );
    maps\_anim::_id_1265( "train_car1", "wheel_sparks_on_3", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BACK_FX" );
    maps\_anim::_id_1266( "train_car1", "wheel_sparks_off_3", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BACK_FX" );
    maps\_anim::_id_1265( "train_car1", "wheel_sparks_on_4", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_PLAYER2_FX" );
    maps\_anim::_id_1266( "train_car1", "wheel_sparks_off_4", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_PLAYER2_FX" );
    maps\_anim::_id_1264( "train_car1", "truck_spew_on", ::_id_7A15, "train_crash" );
    maps\_anim::_id_1264( "train_car1", "truck_spew_off", ::_id_7A16, "train_crash" );
    maps\_anim::_id_1264( "train_car1", "subway_fallover", ::_id_7A13, "train_crash" );
    level._id_0C59["train_car1_broken"]["train_crash"] = %london_train_break;
    maps\_anim::_id_1264( "train_car1_broken", "sparks_start", ::_id_7A1C, "train_crash" );
    maps\_anim::_id_1264( "train_car1_broken", "sparks_stop", ::_id_7A1D, "train_crash" );
    maps\_anim::_id_1264( "train_car1_broken", "sparks_start_2", ::_id_7A1E, "train_crash" );
    maps\_anim::_id_1264( "train_car1_broken", "sparks_stop_2", ::_id_7A1F, "train_crash" );
    maps\_anim::_id_1264( "train_car1_broken", "sparks_end", ::_id_7A20, "train_crash" );
    maps\_anim::_id_1264( "train_car1_broken", "sparks_end_2", ::_id_7A21, "train_crash" );
    maps\_anim::_id_1264( "train_car1_broken", "train_impact_1", ::_id_7A22, "train_crash" );
    maps\_anim::_id_1264( "train_car1_broken", "train_impact_2", ::_id_7A23, "train_crash" );
    maps\_anim::_id_1264( "train_car1_broken", "sparks_grind", ::_id_7A24, "train_crash" );
    maps\_anim::_id_1264( "train_car1_broken", "sparks_grind_stop", ::_id_7A25, "train_crash" );
    level._id_0C59["train_car2"]["train_crash"] = %london_train_crash_2;
    maps\_anim::_id_1265( "train_car2", "wheel_sparks_on", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1266( "train_car2", "wheel_sparks_off", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1265( "train_car2", "wheel_sparks_on_2", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_TOP_FX" );
    maps\_anim::_id_1266( "train_car2", "wheel_sparks_off_2", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_TOP_FX" );
    maps\_anim::_id_1265( "train_car2", "wheel_sparks_on_3", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BACK_FX" );
    maps\_anim::_id_1266( "train_car2", "wheel_sparks_off_3", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BACK_FX" );
    maps\_anim::_id_1265( "train_car2", "wheel_sparks_on_4", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_PLAYER2_FX" );
    maps\_anim::_id_1266( "train_car2", "wheel_sparks_off_4", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_PLAYER2_FX" );
    maps\_anim::_id_1264( "train_car2", "subway_fallover", ::_id_7A14, "train_crash" );
    level._id_0C59["train_car3"]["train_crash"] = %london_train_crash_3;
    maps\_anim::_id_1265( "train_car3", "wheel_sparks_on", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1266( "train_car3", "wheel_sparks_off", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1265( "train_car3", "wheel_sparks_on_2", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_TOP_FX" );
    maps\_anim::_id_1266( "train_car3", "wheel_sparks_off_2", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_TOP_FX" );
    maps\_anim::_id_1265( "train_car3", "wheel_sparks_on_3", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BACK_FX" );
    maps\_anim::_id_1266( "train_car3", "wheel_sparks_off_3", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BACK_FX" );
    maps\_anim::_id_1265( "train_car3", "wheel_sparks_on_4", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_PLAYER2_FX" );
    maps\_anim::_id_1266( "train_car3", "wheel_sparks_off_4", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_PLAYER2_FX" );
    level._id_0C59["train_car4"]["train_crash"] = %london_train_crash_4;
    level._id_0C59["train_car4_mirrored"]["train_crash"] = %london_train_crash_4;
    maps\_anim::_id_1265( "train_car4", "wheel_sparks_on", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1266( "train_car4", "wheel_sparks_off", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BOTTOM_FX" );
    maps\_anim::_id_1265( "train_car4", "wheel_sparks_on_2", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_TOP_FX" );
    maps\_anim::_id_1266( "train_car4", "wheel_sparks_off_2", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_TOP_FX" );
    maps\_anim::_id_1265( "train_car4", "wheel_sparks_on_3", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BACK_FX" );
    maps\_anim::_id_1266( "train_car4", "wheel_sparks_off_3", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_BACK_FX" );
    maps\_anim::_id_1265( "train_car4", "wheel_sparks_on_4", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_PLAYER2_FX" );
    maps\_anim::_id_1266( "train_car4", "wheel_sparks_off_4", "train_crash", "sparks_subway_scrape_point_wheels", "TAG_PLAYER2_FX" );
    level._id_0C59["truck"]["train_crash"] = %london_truck_crash;
    maps\_anim::_id_1264( "truck", "truck_dust_start", ::_id_7A26, "train_crash" );
    maps\_anim::_id_1264( "truck", "truck_dust_stop", ::_id_7A27, "train_crash" );
    level._id_0C59["truck_wrecked"]["train_crash"] = %london_truck_crash;
    level._id_0C59["player_car"]["train_crash"] = %london_player_truck;
    maps\_anim::_id_1264( "player_car", "player_bail", maps\westminster_code::_id_79BB, "train_crash" );
    level._id_0C59["player_car_mirrored"]["train_crash"] = %london_player_truck;
    maps\_anim::_id_1264( "player_car_mirrored", "truck_slowing_1_start", ::_id_7A1B, "train_crash" );
    level._id_1F90["train_car1"] = "vehicle_subway_cart_destructible";
    level._id_1F90["train_car1_broken"] = "vehicle_subway_cart_destroyed";
    level._id_1F90["train_car2"] = "vehicle_subway_cart_destructible";
    level._id_1F90["train_car3"] = "vehicle_subway_cart_destructible";
    level._id_1F90["train_car4"] = "vehicle_subway_cart_destructible";
    level._id_1F90["train_car4_mirrored"] = "vehicle_subway_cart_destructible";
    level._id_1F90["truck"] = "vehicle_uk_utility_truck_destructible";
    level._id_1F90["truck_wrecked"] = "vehicle_uk_utility_truck_trainwreck";
    level._id_1F90["player_car"] = "vehicle_uk_utility_truck_destructible";
    level._id_1F90["player_car_mirrored"] = "vehicle_uk_utility_truck_destructible";
    level._id_0C59["train_intersect_car"]["intersection_crash"] = %london_railcross_car_crash;
    level._id_1F90["train_intersect_car"] = "uk_police_estate_destructible";
    level._id_1245["train_intersect_car"] = #animtree;
    level._id_1245["train_car1"] = #animtree;
    level._id_1245["train_car1_broken"] = #animtree;
    level._id_1245["train_car2"] = #animtree;
    level._id_1245["train_car3"] = #animtree;
    level._id_1245["train_car4"] = #animtree;
    level._id_1245["train_car4_mirrored"] = #animtree;
    level._id_1245["truck"] = #animtree;
    level._id_1245["truck_wrecked"] = #animtree;
    level._id_1245["player_car"] = #animtree;
    level._id_1245["player_car_mirrored"] = #animtree;
}

_id_7A10()
{
    wait 0.1;
    self clearanim( %london_utilitytruck_driver_mount_door, 0 );
    self clearanim( %london_utilitytruck_passenger_mount_door, 0 );
}

_id_7A11( var_0 )
{

}

_id_7A12( var_0 )
{

}

_id_7A13( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "debris_subway_fallover" ), var_0, "TAG_PLAYER1_FX" );
}

_id_7A14( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "debris_subway_fallover_sparky" ), var_0, "TAG_PLAYER1_FX" );
}

_id_7A15( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "uk_utility_truck_spew" ), var_0, "TAG_FRONT_FX" );
}

_id_7A16( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "uk_utility_truck_spew" ), var_0, "TAG_FRONT_FX" );
}

_id_7A17( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short" ), var_0, "TAG_BOTTOM_FX" );
}

_id_7A18( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short" ), var_0, "TAG_BOTTOM_FX" );
}

_id_7A19( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "debris_subway_scrape_line_short" ), var_0, "TAG_TOP_FX" );
}

_id_7A1A( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "debris_subway_scrape_line_short" ), var_0, "TAG_TOP_FX" );
}

_id_7A1B( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "sparks_truck_scrape_line_short_diminishing" ), var_0, "TAG_TAIL_LIGHT_LEFT" );
}

_id_7A1C( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short" ), var_0, "TAG_BACK_SEVERED_FX" );
    playfxontag( common_scripts\utility::getfx( "debris_subway_scrape_line_short" ), var_0, "TAG_BACK_SEVERED_FX" );
}

_id_7A1D( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short" ), var_0, "TAG_BACK_SEVERED_FX" );
    stopfxontag( common_scripts\utility::getfx( "debris_subway_scrape_line_short" ), var_0, "TAG_BACK_SEVERED_FX" );
}

_id_7A1E( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short" ), var_0, "TAG_FRONT_SEVERED_FX" );
    playfxontag( common_scripts\utility::getfx( "debris_subway_scrape_line_short" ), var_0, "TAG_FRONT_SEVERED_FX" );
}

_id_7A1F( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short" ), var_0, "TAG_FRONT_SEVERED_FX" );
    stopfxontag( common_scripts\utility::getfx( "debris_subway_scrape_line_short" ), var_0, "TAG_FRONT_SEVERED_FX" );
}

_id_7A20( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short_diminishing" ), var_0, "TAG_BACK_SEVERED_FX" );
}

_id_7A21( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short_diminishing" ), var_0, "TAG_FRONT_SEVERED_FX" );
}

_id_7A22( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "debris_subway_impact_line" ), var_0, "TAG_BACK_SEVERED_FX" );
}

_id_7A23( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "debris_subway_impact_line" ), var_0, "TAG_FRONT_SEVERED_FX" );
}

_id_7A24( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "debris_subway_scrape_line_short_heavy" ), var_0, "TAG_FRONT_SEVERED_FX" );
    playfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short_heavy" ), var_0, "TAG_FRONT_SEVERED_FX" );
}

_id_7A25( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "debris_subway_scrape_line_short_heavy" ), var_0, "TAG_FRONT_SEVERED_FX" );
    stopfxontag( common_scripts\utility::getfx( "sparks_subway_scrape_line_short_heavy" ), var_0, "TAG_FRONT_SEVERED_FX" );
}

_id_7A26( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "tread_dust_london_loop" ), var_0, "TAG_WHEEL_FRONT_RIGHT" );
    playfxontag( common_scripts\utility::getfx( "tread_dust_london_loop" ), var_0, "TAG_WHEEL_FRONT_LEFT" );
    playfxontag( common_scripts\utility::getfx( "tread_dust_london_loop" ), var_0, "TAG_WHEEL_BACK_RIGHT" );
    playfxontag( common_scripts\utility::getfx( "tread_dust_london_loop" ), var_0, "TAG_WHEEL_BACK_LEFT" );
}

_id_7A27( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "tread_dust_london_loop" ), var_0, "TAG_WHEEL_FRONT_RIGHT" );
    stopfxontag( common_scripts\utility::getfx( "tread_dust_london_loop" ), var_0, "TAG_WHEEL_FRONT_LEFT" );
    stopfxontag( common_scripts\utility::getfx( "tread_dust_london_loop" ), var_0, "TAG_WHEEL_BACK_RIGHT" );
    stopfxontag( common_scripts\utility::getfx( "tread_dust_london_loop" ), var_0, "TAG_WHEEL_BACK_LEFT" );
}
