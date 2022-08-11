// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_60D5::_id_60D4();
    _id_47D9();
    _id_770F();
    _id_7710();
    _id_7711();
    _id_4CAC();
}
#using_animtree("player");

_id_47D9()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_delta";
    level._id_0C59["player_rig"]["player_manhole"] = %paris_player_enter_manhole;
}
#using_animtree("generic_human");

_id_770F()
{
    level._id_0C59["generic"]["stand_cover_right_signal_move_out"] = %cornerstndr_alert_signal_move_out;
    level._id_0C59["generic"]["DRS_sprint"] = %sprint1_loop;
    level._id_0C59["lonestar"]["intro_heli_loop"] = [ %paris_intro_heli_idle_sandman ];
    level._id_0C59["reno"]["intro_heli_loop"] = [ %paris_intro_heli_idle_truck ];
    level._id_0C59["pilot"]["intro_heli_loop"] = [ %helicopter_pilot1_idle ];
    level._id_0C59["reno"]["intro_roof_idle"] = [ %paris_intro_roof_idle_truck ];
    level._id_0C59["lonestar"]["intro_heli_exit"] = %paris_intro_heli_exit_sandman;
    level._id_0C59["reno"]["intro_heli_exit"] = %paris_intro_heli_exit_grinch;
    level._id_0C59["lonestar"]["intro_roof_talk"] = %paris_intro_roof_talk_sandman;
    level._id_0C59["lonestar"]["intro_roof_jumpdown"] = %paris_intro_roof_jumpdown_sandman;
    level._id_0C59["reno"]["intro_roof_jumpdown"] = %paris_intro_roof_jumpdown_truck;
    level._id_0C59["lonestar"]["delta_check_vitals"] = %paris_delta_check_vitals_delta;
    level._id_0C59["corpse"]["delta_check_vitals"] = %paris_delta_check_vitals_corpse;
    level._id_0C59["reno"]["move_debris_in"] = %paris_delta_move_debris_in_guy2;
    level._id_0C59["reno"]["move_debris_idle"] = [ %paris_delta_move_debris_idle_guy2 ];
    level._id_0C59["reno"]["move_debris"] = %paris_delta_move_debris_out_guy2;
    level._id_0C59["lonestar"]["move_debris"] = %paris_delta_move_debris_guy1;
    level._id_0C59["lonestar"]["delta_ledge_walk"] = %paris_delta_ledge_walk_01;
    level._id_0C59["reno"]["delta_ledge_walk"] = %paris_delta_ledge_walk_02;
    level._id_0C59["reno"]["delta_stairwell_reaction"] = %paris_npc_shot_reaction_guy1;
    level._id_0C59["lonestar"]["delta_stairwell_reaction"] = %paris_npc_shot_reaction_guy2;
    level._id_0C59["reno"]["bookstore_exit_st"] = %paris_bookstore_exit_guy1_st;
    level._id_0C59["reno"]["bookstore_exit_idle"] = [ %paris_bookstore_exit_guy1_idle ];
    level._id_0C59["reno"]["bookstore_exit_exit"] = %paris_bookstore_exit_guy1_exit;
    level._id_0C59["lonestar"]["bookstore_exit_st"] = %paris_bookstore_exit_guy2_st;
    level._id_0C59["lonestar"]["bookstore_exit_idle"] = [ %paris_bookstore_exit_guy2_idle ];
    level._id_0C59["lonestar"]["bookstore_exit_exit"] = %paris_bookstore_exit_guy2_exit;
    maps\_anim::_id_1264( "reno", "door_fx", ::_id_7713, "bookstore_exit_exit" );
    level._id_0C59["generic"]["bookstore_alley_shooting_1"] = %paris_van_climb_paired_guy1_alt;
    level._id_0C59["generic"]["bookstore_alley_shooting_2"] = %run_death_legshot;
    level._id_0C59["generic"]["bookstore_alley_shooting_1_death"] = %paris_van_climb_paired_guy1_death;
    level._id_0C59["generic"]["gign_meeting_runner"] = %paris_sabre_wave_kitchen;
    level._id_0C59["generic"]["gign_wave"] = [ %launchfacility_b_blast_door_seq_waveidle ];
    level._id_0C59["gign_leader"]["conversation_with_gign_idle"] = [ %paris_delta_conversation_with_gign_a_idle ];
    level._id_0C59["gign_leader"]["conversation_with_gign"] = %paris_gign_conversation_wheres_volk_guy2;
    level._id_0C59["lonestar"]["conversation_with_gign"] = %paris_gign_conversation_wheres_volk_guy1;
    level._id_0C59["lonestar"]["conversation_with_gign_end"] = %cqb_walk_turn_4;
    level._id_0C59["redshirt"]["conversation_blocker"] = %paris_delta_conversation_blocker_guard;
    level._id_0C59["wounded"]["conversation_blocker"] = %paris_delta_conversation_blocker_wounded;
    level._id_0C59["redshirt"]["conversation_blocker_idle_no_origin"] = [ %corner_standl_alert_twitch03 ];
    level._id_0C59["redshirt"]["conversation_blocker_exit"] = %corner_standl_trans_out_2;
    level._id_0C59["redshirt"]["conversation_blocker_exit_end"] = %run_turn_l90;
    level._id_0C59["wounded"]["conversation_blocker_idle_no_origin"] = [ %wounded_carry_closet_idle_wounded ];
    level._id_0C59["generic"]["balcony_death"] = [];
    level._id_0C59["generic"]["balcony_death"][0] = %paris_rooftop_death_a;
    level._id_0C59["generic"]["balcony_death"][1] = %paris_rooftop_death_b;
    level._id_0C59["generic"]["balcony_death"][2] = %paris_rooftop_death_c;
    level._id_0C59["generic"]["balcony_death"][3] = %paris_rooftop_death_d;
    level._id_0C59["generic"]["balcony_death"][4] = %paris_rooftop_death_e;
    level._id_0C59["gign_leader"]["delta_pull_movemanhole"] = %paris_delta_pull_movemanhole_guy1;
    level._id_0C59["lonestar"]["delta_pull_movemanhole"] = %paris_delta_pull_movemanhole_guy2;
    level._id_0C59["lonestar"]["delta_pull_movemanhole_idle"] = [ %paris_delta_pull_movemanhole__idle_guy2 ];
    maps\_anim::_id_1264( "gign_leader", "ps_scn_pars_manhole_open", ::_id_7712, "delta_pull_movemanhole" );
    level._id_0C59["generic"]["death_pose_window"] = %death_pose_on_window;
    level._id_0C59["generic"]["death_pose_desk"] = %death_pose_on_desk;
    level._id_0C59["generic"]["death_sitting_pose_1"] = %death_sitting_pose_v1;
    level._id_0C59["generic"]["death_sitting_pose_2"] = %death_sitting_pose_v2;
    level._id_0C59["generic"]["death_pose_farmer"] = %hunted_farmsequence_farmer_deathpose;
    level._id_0C59["generic"]["death_pose_01"] = %paris_npc_dead_poses_v01;
    level._id_0C59["generic"]["death_pose_02"] = %paris_npc_dead_poses_v02;
    level._id_0C59["generic"]["death_pose_03"] = %paris_npc_dead_poses_v03;
    level._id_0C59["generic"]["death_pose_04"] = %paris_npc_dead_poses_v04;
    level._id_0C59["generic"]["death_pose_05"] = %paris_npc_dead_poses_v05;
    level._id_0C59["generic"]["death_pose_06"] = %paris_npc_dead_poses_v06;
    level._id_0C59["generic"]["death_pose_07"] = %paris_npc_dead_poses_v07;
    level._id_0C59["generic"]["death_pose_08"] = %paris_npc_dead_poses_v08;
    level._id_0C59["generic"]["death_pose_09"] = %paris_npc_dead_poses_v09;
    level._id_0C59["generic"]["death_pose_10"] = %paris_npc_dead_poses_v10;
    level._id_0C59["generic"]["death_pose_12"] = %paris_npc_dead_poses_v12;
    level._id_0C59["generic"]["death_pose_13"] = %paris_npc_dead_poses_v13;
    level._id_0C59["generic"]["death_pose_14"] = %paris_npc_dead_poses_v14;
    level._id_0C59["generic"]["death_pose_15"] = %paris_npc_dead_poses_v15;
    level._id_0C59["generic"]["death_pose_16"] = %paris_npc_dead_poses_v16;
    level._id_0C59["generic"]["death_pose_17"] = %paris_npc_dead_poses_v17;
    level._id_0C59["generic"]["death_pose_18"] = %paris_npc_dead_poses_v18;
    level._id_0C59["generic"]["death_pose_19"] = %paris_npc_dead_poses_v19;
    level._id_0C59["generic"]["death_pose_21"] = %paris_npc_dead_poses_v21;
    level._id_0C59["generic"]["death_pose_24"] = %paris_npc_dead_poses_v24_chair_sq;
    level._id_0C59["generic"]["death_pose_25"] = %paris_npc_dead_poses_v25_chair_wicker;
    level._id_0C59["generic"]["death_pose_26"] = %paris_npc_dead_poses_v26_couch;
    level._id_0C59["generic"]["death_pose_27"] = %paris_npc_dead_poses_v27_chair_bistro;
    level._id_0C59["generic"]["death_pose_28"] = %paris_npc_dead_poses_v28_table_bistro;
}

_id_7710()
{

}
#using_animtree("animated_props");

_id_7711()
{
    level._id_1245["manhole"] = #animtree;
    level._id_0C59["manhole"]["delta_pull_movemanhole"] = %paris_delta_pull_movemanhole_manhole;
    level._id_0C59["manhole"]["delta_pull_movemanhole_idle"] = [ %paris_delta_pull_movemanhole_idle_manhole ];
}
#using_animtree("script_model");

_id_4CAC()
{
    level._id_1245["debris"] = #animtree;
    level._id_1F90["debris"] = "rooftop_roof_slab";
    level._id_0C59["debris"]["move_debris"] = %paris_delta_move_debris;
    level._id_1245["bookstore_door"] = #animtree;
    level._id_1F90["bookstore_door"] = "paris_exit_door_01_rigged";
    level._id_0C59["bookstore_door"]["bookstore_exit_exit"] = %paris_bookstore_exit_door_exit;
}

_id_7712( var_0 )
{
    common_scripts\utility::exploder( "manholesteam" );
    setsaveddvar( "fx_alphathreshold", 0 );
}

_id_7713( var_0 )
{
    common_scripts\utility::exploder( "msg_door_breach" );
}
