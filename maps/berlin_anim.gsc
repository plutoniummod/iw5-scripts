// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4444();
    _id_6F3D();
    _id_4443();
    _id_6F3C();
    _id_0B5A();
    level._id_48D6 = ::_id_7388;
}
#using_animtree("player");

_id_4444()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_delta";
    level._id_1245["player_rig_bloody"] = #animtree;
    level._id_1F90["player_rig_bloody"] = "viewhands_player_delta_dirty";
    level._id_0C59["player_rig"]["rappel_player"] = %berlin_player_rappel;
    level._id_1245["player_legs"] = #animtree;
    level._id_1F90["player_legs"] = "viewlegs_generic";
    level._id_0C59["player_legs"]["rappel_player"] = %berlin_player_legs_rappel;
    level._id_0C59["player_rig"]["bahn_tower"] = %berlin_sgt_down_bomb_hit_player;
    maps\_anim::_id_1264( "player_rig", "vehicle_impact", maps\berlin_code::_id_72AB, "bahn_tower" );
    level._id_0C59["player_rig_bloody"]["aftermath"] = %berlin_sgt_down_recovery_vm;
    maps\_anim::_id_1264( "player_rig_bloody", "sandmanStart", ::_id_738E, "aftermath" );
    level._id_0C59["player_rig"]["reverse_breach"] = %berlin_reverse_breach_player;
    level._id_0C59["player_rig"]["reverse_breach_idle"][0] = %berlin_reverse_breach_player_idle;
    level._id_0C59["player_rig"]["reverse_breach_getup"] = %berlin_reveres_breach_player_getup;
    maps\_anim::_id_1264( "player_rig", "weapon_pullout", maps\berlin_code::_id_7329, "reverse_breach" );
    maps\_anim::_id_1264( "player_rig", "door_breach", maps\berlin_code::_id_732B, "reverse_breach" );
    maps\_anim::_id_1264( "player_rig", "draw_pistol", maps\berlin_code::_id_732E, "reverse_breach" );
    level._id_0C59["player_rig"]["goggles_on"] = %viewmodel_glock_nvg_puton;
    level._id_0C59["player_rig"]["goggles_off"] = %viewmodel_glock_nvg_takeoff;
}
#using_animtree("script_model");

_id_4443()
{
    level._id_1245["rope"] = #animtree;
    level._id_1F90["rope"] = "weapon_rappel_rope_long";
    level._id_0C59["rope"]["bravo_rappel_mount"] = %berlin_granite_team_rappel_intro_rope;
    level._id_0C59["rope"]["bravo_rappel_drop"] = %berlin_granite_team_rappel_drop_rope;
    level._id_0C59["rope"]["bravo_rappel_drop02"] = %berlin_granite_team_rappel_drop02_rope;
    level._id_0C59["rope"]["bravo_rappel_drop03"] = %berlin_granite_team_rappel_drop03_rope;
    level._id_0C59["rope"]["bravo_rappel_drop04"] = %berlin_granite_team_rappel_drop04_rope;
    level._id_0C59["rope"]["bravo_rappel_idle"][0] = %berlin_granite_team_rappel_idle_rope;
    level._id_1245["ai_rope"] = #animtree;
    level._id_1F90["ai_rope"] = "weapon_rappel_rope_long";
    level._id_0C59["ai_rope"]["rappel_ai"] = %berlin_rappel_rope_long_npc;
    level._id_1245["rope_player"] = #animtree;
    level._id_1F90["rope_player"] = "weapon_rappel_rope_long";
    level._id_0C59["rope_player"]["rappel_player"] = %berlin_rope_long_rappel;
    level._id_0C59["rope_player"]["rappel_player_idle"] = %berlin_rappel_rope_long_npc;
    level._id_1245["player_rope_long_obj"] = #animtree;
    level._id_1F90["player_rope_long_obj"] = "weapon_rappel_rope_long_obj";
    level._id_0C59["player_rope_long_obj"]["rappel_player"] = %berlin_rappel_rope_long_npc;
    level._id_1245["rope_carabiner"] = #animtree;
    level._id_1F90["rope_carabiner"] = "weapon_carabiner_thin_rope";
    level._id_0C59["rope_carabiner"]["rappel_player"] = %berlin_rope_carabiner_rappel;
    precachemodel( "building_tower_fall" );
    level._id_0C59["bahn_tower_collapse"]["bahn_tower"] = %berlin_sgt_down_bldg_collapse_bldg;
    level._id_1245["bahn_tower_collapse"] = #animtree;
    level._id_1F90["bahn_tower_collapse"] = "building_tower_fall";
    precachemodel( "berlin_destroyed_bldg_animated_parts" );
    level._id_0C59["berlin_sgt_down_recovery_wires"]["bahn_tower_parts"] = %berlin_sgt_down_recovery_wires;
    level._id_1245["berlin_sgt_down_recovery_wires"] = #animtree;
    level._id_1F90["berlin_sgt_down_recovery_wires"] = "berlin_destroyed_bldg_animated_parts";
    precachemodel( "concrete_column_collapse" );
    level._id_0C59["berlin_falling_column"]["falling_column"] = %berlin_falling_column;
    level._id_1245["berlin_falling_column"] = #animtree;
    level._id_1F90["berlin_falling_column"] = "concrete_column_collapse";
    level._id_0C59["breach_door_model"]["breach"] = %breach_player_door_hinge_v1;
    level._id_1245["breach_door_model"] = #animtree;
    level._id_1F90["breach_door_model"] = "com_door_piece_hinge5";
    level._id_0C59["reverse_breach_gun"]["reverse_breach_getup"] = %berlin_reveres_breach_beretta_getup;
    level._id_0C59["reverse_breach_gun"]["reverse_breach"] = %berlin_reveres_breach_beretta;
    level._id_1245["reverse_breach_gun"] = #animtree;
    level._id_1F90["reverse_breach_gun"] = "weapon_fn_fiveseven_sp_iw5";
}

_id_6F3C()
{

}
#using_animtree("generic_human");

_id_6F3D()
{
    level._id_0C59["generic"]["little_bird_death_guy1"] = %little_bird_death_guy1;
    level._id_0C59["generic"]["little_bird_death_guy2"] = %little_bird_death_guy2;
    level._id_0C59["generic"]["little_bird_death_guy3"] = %little_bird_death_guy3;
    level._id_0C59["generic"]["contengency_rocket_moment"] = %contengency_rocket_moment;
    maps\_anim::_id_1264( "generic", "fire rocket", ::_id_7390, "contengency_rocket_moment" );
    level._id_0C59["generic"]["bravo_rappel_mount"] = %berlin_granite_team_rappel_intro;
    maps\_anim::_id_1264( "generic", "ropeVis", ::_id_7389, "bravo_rappel_mount" );
    level._id_0C59["generic"]["bravo_rappel_drop"] = %berlin_granite_team_rappel_drop;
    level._id_0C59["generic"]["bravo_rappel_drop02"] = %berlin_granite_team_rappel_drop02;
    level._id_0C59["generic"]["bravo_rappel_drop03"] = %berlin_granite_team_rappel_drop03;
    level._id_0C59["generic"]["bravo_rappel_drop04"] = %berlin_granite_team_rappel_drop04;
    level._id_0C59["generic"]["bravo_rappel_idle"][0] = %berlin_granite_team_rappel_idle;
    level._id_0C59["generic"]["prone_aim_idle"][0] = %prone_aim_idle;
    level._id_0C59["generic"]["berlin_crouch_2_spotting_idle"][0] = %berlin_crouch_2_spotting_idle;
    level._id_0C59["generic"]["berlin_crouch_2_spotting"] = %berlin_crouch_2_spotting;
    level._id_0C59["generic"]["hunted_woundedhostage_check"] = %hunted_woundedhostage_check_hostage;
    level._id_0C59["generic"]["hunted_woundedhostage_idle_start"] = %hunted_woundedhostage_idle_start;
    level._id_0C59["generic"]["hunted_woundedhostage_check_end"] = %hunted_woundedhostage_idle_end;
    level._id_0C59["generic"]["dying_corpse_pose"] = %dcburning_elevator_corpse_idle_b;
    level._id_0C59["generic"]["dcburning_elevator_corpse_idle_B"] = %dcburning_elevator_corpse_idle_b;
    level._id_0C59["generic"]["hunted_dying_deadguy_endidle"] = %hunted_dying_deadguy_endidle;
    level._id_0C59["generic"]["dying_crawl"] = %dying_crawl;
    level._id_0C59["generic"]["dying_crawl_death_v1"] = %dying_crawl_death_v1;
    level._id_0C59["generic"]["dying_crawl_death_v2"] = %dying_crawl_death_v2;
    level._id_0C59["generic"]["DC_Burning_bunker_stumble"] = %dc_burning_bunker_stumble;
    level._id_0C59["generic"]["DC_Burning_bunker_sit_idle"][0] = %dc_burning_bunker_sit_idle;
    level._id_0C59["generic"]["civilain_crouch_hide_idle"][0] = %civilain_crouch_hide_idle;
    level._id_0C59["generic"]["death_sitting_pose_v2"] = %death_sitting_pose_v2;
    level._id_0C59["generic"]["paris_npc_dead_poses_v02"] = %paris_npc_dead_poses_v02;
    level._id_0C59["generic"]["paris_npc_dead_poses_v06"] = %paris_npc_dead_poses_v06;
    level._id_0C59["generic"]["paris_npc_dead_poses_v07"] = %paris_npc_dead_poses_v07;
    level._id_0C59["generic"]["cqb_to_ventwalk"] = %berlin_cqb_to_ventwalk;
    level._id_0C59["generic"]["ventwalk"] = %launchfacility_b_ventwalk_v1_cycle;
    level._id_0C59["generic"]["tank_corpse"] = %berlin_tank_dead_pose;
    level._id_0C59["generic"]["slide"] = %berlin_fallen_building_slide_npc;
    level._id_0C59["generic"]["DRS_sprint"] = %sprint1_loop;
    level._id_0C59["generic"]["reverse_breach_enemy_right"] = %berlin_reverse_breach_enemy_guy1;
    level._id_0C59["generic"]["reverse_breach_enemy_left"] = %berlin_reverse_breach_enemy_guy2;
    level._id_0C59["alena"]["reverse_breach_idle"][0] = %berlin_reverse_breach_hind_girl_idle;
    level._id_0C59["alena"]["reverse_breach_getup"] = %berlin_reverse_breach_hind_girl_getup;
    level._id_0C59["guy_2"]["reverse_breach_idle"][0] = %berlin_reverse_breach_hind_guy2_idle;
    level._id_0C59["guy_2"]["reverse_breach_getup"] = %berlin_reverse_breach_hind_guy2_getup;
    level._id_0C59["lone_star"]["bahn_tower"] = %berlin_sgt_down_bomb_hit;
    level._id_0C59["lone_star"]["building_explosion_hit_wounded_loop"][0] = %berlin_sgt_down_bomb_loop;
    level._id_0C59["lone_star"]["aftermath"] = %berlin_sgt_down_recovery_sgt;
    level._id_11B7["lone_star"]["head_for_building"] = %berlin_sgt_down_recovery_sgt_face;
    level.scr_sound["lone_star"]["head_for_building"] = "berlin_cby_headforbuilding";
    level._id_0C59["lone_star"]["run"] = %afchase_shepherd_flee_loop;
    level._id_0C59["lone_star"]["patrol_jog"] = %patrol_jog;
    level._id_0C59["lone_star"]["patrol_jog_look_up"] = %patrol_jog_look_up;
    level._id_0C59["lone_star"]["heli_ride"][0] = %berlin_littleb_intro_behaviors;
    level._id_0C59["lone_star"]["heli_crash_reaction"] = %berlin_littleb_intro_explosion_react;
    level._id_11B7["lone_star"]["berlin_cby_graniteteam"] = %berlin_littleb_intro_behaviors_facial;
    level.scr_sound["lone_star"]["berlin_cby_graniteteam"] = "berlin_cby_graniteteam";
    level._id_0C59["lone_star"]["berlin_throw_from_building"] = %berlin_throw_from_building_delta;
    level._id_0C59["lone_star"]["combatcombat_run_fast_rampup_short"] = %berlin_npc_ramp_up_qcb_walk;
    level._id_0C59["lone_star"]["combatcombat_run_fast_rampup_short_alt"] = %berlin_npc_ramp_up_qcb_walk_alt;
    level._id_0C59["lone_star"]["stand_2_crouch"] = %exposed_stand_2_crouch;
    level._id_0C59["lone_star"]["casual_crouch_idle_in"] = %casual_crouch_idle_in;
    level._id_0C59["lone_star"]["casual_crouch_idle_out"] = %casual_crouch_idle_out;
    level._id_0C59["lone_star"]["bog_b_spotter_spot_2_casual"] = %berlin_spotter_spot_2_casual;
    level._id_0C59["lone_star"]["bog_b_spotter_casual_2_spot"] = %berlin_spotter_casual_2_spot;
    level._id_0C59["lone_star"]["bog_b_spotter_spot_idle"][0] = %berlin_spotter_spot_idle;
    level._id_0C59["lone_star"]["rappel_ai"] = %berlin_rappel_npc;
    level._id_0C59["lone_star"]["cover_radio"][0] = %roadkill_cover_radio_soldier2;
    level._id_0C59["lone_star"]["roof_collapse"] = %berlin_building_collapse_react_delta;
    level._id_0C59["lone_star"]["ventwalk"] = %launchfacility_b_ventwalk_v1_cycle;
    level._id_0C59["lone_star"]["cqb_to_ventwalk"] = %berlin_cqb_to_ventwalk;
    level._id_0C59["lone_star"]["slide"] = %berlin_fallen_building_slide_npc;
    level._id_0C59["lone_star"]["emerge_open_door"] = %berlin_delta_bust_door;
    maps\_anim::_id_1264( "lone_star", "door_open", ::_id_738F, "emerge_open_door" );
    level._id_0C59["lone_star"]["patrol_jog_360_once"] = %berlin_patrol_jog_360;
    level._id_0C59["lone_star"]["breach_kick"] = %breach_kick_stackl1_enter;
    level._id_0C59["lone_star"]["doorkick_2_cqbrun"] = %doorkick_2_cqbrun;
    level._id_0C59["lone_star"]["reverse_breach_guy_enter"] = %berlin_reverse_breach_guy_enter;
    level._id_0C59["lone_star"]["reverse_breach_stand_idle"][0] = %berlin_reverse_breach_sandman_cover_idle;
    level._id_0C59["lone_star"]["reverse_breach"] = %berlin_reverse_breach_guy;
    level._id_0C59["lone_star"]["reverse_breach_idle"][0] = %berlin_reverse_breach_guy_idle;
    level._id_0C59["lone_star"]["reverse_breach_getup"] = %berlin_reverse_breach_guy_getup;
    level._id_0C59["lone_star"]["reverse_breach_end_1"] = %berlin_reverse_breach_sandman_end1;
    level._id_0C59["lone_star"]["reverse_breach_end_2"] = %berlin_reverse_breach_sandman_end2;
    level.scr_sound["lone_star"]["berlin_cby_cantriskit"] = "berlin_cby_cantriskit";
    level._id_11B7["lone_star"]["berlin_cby_cantriskit"] = %berlin_reverse_breach_sandman_end_face1;
    level.scr_sound["lone_star"]["berlin_cby_welosther"] = "berlin_cby_welosther";
    level._id_11B7["lone_star"]["berlin_cby_welosther"] = %berlin_reverse_breach_sandman_end_face2;
    level._id_0C59["essex"]["berlin_throw_from_building"] = %berlin_throw_from_building_delta;
    level._id_0C59["defender"]["berlin_throw_from_building"] = %berlin_throw_from_building_russian;
    maps\_anim::_id_1264( "defender", "fire", ::_id_738D, "berlin_throw_from_building" );
    maps\_anim::_id_1264( "defender", "start_ragdoll", ::_id_738C, "berlin_throw_from_building" );
    level._id_0C59["essex"]["combatcombat_run_fast_rampup_short"] = %berlin_npc_ramp_up_qcb_walk;
    level._id_0C59["essex"]["combatcombat_run_fast_rampup_short_alt"] = %berlin_npc_ramp_up_qcb_walk_alt;
    level._id_0C59["essex"]["rappel_ai"] = %berlin_rappel_npc;
    level._id_0C59["essex"]["ventwalk"] = %launchfacility_b_ventwalk_v1_cycle;
    level._id_0C59["essex"]["cqb_to_ventwalk"] = %berlin_cqb_to_ventwalk;
    level._id_0C59["essex"]["slide"] = %berlin_fallen_building_slide_npc;
    level._id_0C59["essex"]["breach_kick"] = %breach_kick_kickerr1_enter;
    level._id_0C59["essex"]["reverse_breach_getup"] = %berlin_reverse_breach_grinch_getup;
    level._id_0C59["essex"]["reverse_breach_end"] = %berlin_reverse_breach_grinch_end;
    level._id_0C59["truck"]["sniper_escape_spotter_idle"][0] = %berlin_crouch_2_spotting_idle;
    level._id_0C59["truck"]["berlin_crouch_2_spotting"] = %berlin_crouch_2_spotting;
    level._id_1F90["binocs"] = "weapon_binocular";
    level._id_0C59["truck"]["combatcombat_run_fast_rampup_short"] = %berlin_npc_ramp_up_qcb_walk;
    level._id_0C59["truck"]["combatcombat_run_fast_rampup_short_alt"] = %berlin_npc_ramp_up_qcb_walk_alt;
    level._id_0C59["truck"]["rappel_ai"] = %berlin_rappel_npc;
    level._id_0C59["truck"]["hunted_woundedhostage_check"] = %hunted_woundedhostage_check_soldier;
    level._id_0C59["truck"]["hunted_woundedhostage_check_end"] = %hunted_woundedhostage_check_soldier_end;
    level._id_0C59["truck"]["ventwalk"] = %launchfacility_b_ventwalk_v1_cycle;
    level._id_0C59["truck"]["cqb_to_ventwalk"] = %berlin_cqb_to_ventwalk;
    level._id_0C59["truck"]["slide"] = %berlin_fallen_building_slide_npc;
    level._id_0C59["reverse_breach_player_body"]["reverse_breach"] = %berlin_reverse_breach_playerbody;
    level._id_0C59["reverse_breach_player_body"]["reverse_breach_idle"][0] = %berlin_reverse_breach_playerbody_idle;
    level._id_0C59["reverse_breach_player_body"]["reverse_breach_getup"] = %berlin_reveres_breach_playerbody_getup;
    level._id_1F90["reverse_breach_player_body"] = "body_delta_woodland_assault_aa_dusty";
    level._id_1245["reverse_breach_player_body"] = #animtree;
}

_id_7388()
{
    var_0 = %gaz_turret_death;

    if ( isdefined( self._id_0EF1 ) )
    {
        if ( self._id_0EF1.classname == "script_vehicle_t90_tank_woodland_berlin" )
            var_0 = %berlin_tank_gunner_death;
    }

    return var_0;
}
#using_animtree("vehicles");

_id_0B5A()
{
    level._id_0C59["car"]["bahn_tower"] = %berlin_sgt_down_bldg_collapse_subcompact;
    maps\_anim::_id_1264( "car", "vfx_firesmk_carfly", ::_id_738A, "bahn_tower" );
    maps\_anim::_id_1264( "car", "vfx_firesmk_carfly_stop", ::_id_738B, "bahn_tower" );
    level._id_1245["car"] = #animtree;
    level._id_1F90["car"] = "vehicle_subcompact_blue_destroyed";
    level._id_0C59["a10"]["berlin_a10_strafe_run_01"] = %berlin_a10_strafe_run_01;
    level._id_0C59["a10"]["berlin_a10_strafe_run_02"] = %berlin_a10_strafe_run_02;
    level._id_0C59["a10"]["berlin_a10_strafe_run_03"] = %berlin_a10_strafe_run_03;
    level._id_1F90["a10"] = "vehicle_a10_warthog";
    level._id_1245["a10"] = #animtree;
    maps\_anim::_id_1264( "a10", "a10_fire", maps\berlin_a10::_id_4E1B, "berlin_a10_strafe_run_01" );
    maps\_anim::_id_1264( "a10", "a10_fire", maps\berlin_a10::_id_4E1B, "berlin_a10_strafe_run_02" );
    maps\_anim::_id_1264( "a10", "a10_fire", maps\berlin_a10::_id_4E1B, "berlin_a10_strafe_run_03" );
    level._id_0C59["heli"]["reverse_breach_first_frame"] = %berlin_reverse_breach_hind_idle;
    level._id_0C59["heli"]["reverse_breach_idle"][0] = %berlin_reverse_breach_hind_idle;
    level._id_0C59["heli"]["reverse_breach_getup"] = %berlin_reverse_breach_hind_getup;
    level._id_1245["heli"] = #animtree;
}

_id_7389( var_0 )
{
    var_0 notify( "spawn_rope" );
}

_id_738A( var_0 )
{
    wait 0.5;
    playfxontag( common_scripts\utility::getfx( "fire_smoke_trail_emitter" ), var_0, "TAG_BODY" );
}

_id_738B( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "fire_smoke_trail_emitter" ), var_0, "TAG_BODY" );
}

_id_738C( var_0 )
{
    if ( isalive( var_0 ) )
        var_0 kill();
}

_id_738D( var_0 )
{
    level._id_71D6++;

    if ( level._id_71D6 == 6 )
    {
        var_1 = getglass( "building_throw_break_glass" );
        wait 0.6;
        destroyglass( var_1, ( -1.0, 0.0, 0.0 ) );
    }
}

_id_738E( var_0 )
{
    common_scripts\utility::flag_set( "sandman_start_aftermath" );
}

_id_738F( var_0 )
{
    common_scripts\utility::flag_set( "emerge_door_begin_open" );
}

_id_7390( var_0 )
{
    common_scripts\utility::flag_set( "sniper_rooftop_fire_rocket" );
}
