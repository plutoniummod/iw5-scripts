// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_47D9();
    _id_770F();
    _id_7710();
    _id_7711();
    _id_4CAC();
    _id_60D5::_id_60D4();
}
#using_animtree("player");

_id_47D9()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_delta";
    level._id_0C59["player_rig"]["a_b_switch_pt1"] = %paris_a_b_switch_player_pt1;
    level._id_0C59["player_rig"]["a_b_switch_pt2"] = %paris_a_b_switch_player_pt2;
    maps\_anim::_id_1264( "player_rig", "mask_off", maps\paris_b_code::_id_7742, "a_b_switch_pt1" );
    level._id_0C59["player_rig"]["fallen_corridor_b"] = %paris_delta_corridor_player_b;
    level._id_0C59["player_rig"]["fallen_corridor_f"] = %paris_delta_corridor_player_f;
    level._id_0C59["player_rig"]["volk_escape"] = %paris_volk_escape_player;
    level._id_0C59["player_rig"]["player_enter_van"] = %paris_van_player_enter_door;
    maps\_anim::_id_1264( "player_rig", "rumble_small", ::_id_012A, "player_enter_van" );
    maps\_anim::_id_1264( "player_rig", "rumble_medium", ::_id_012B, "player_enter_van" );
    maps\_anim::_id_1264( "player_rig", "rumble_large", ::_id_012C, "player_enter_van" );
    maps\_anim::_id_1264( "player_rig", "vfx_window_punch_start", ::_id_7744, "player_enter_van" );
    maps\_anim::_id_1264( "player_rig", "vfx_window_punch_end", ::_id_7744, "player_enter_van" );
    maps\_anim::_id_1264( "player_rig", "vfx_window_hit_hood", ::_id_7745, "player_enter_van" );
    level._id_0C59["player_rig"]["player_gaz_barricade"] = %paris_chase_gaz_barricade_player;
    level._id_0C59["player_rig"]["player_front_to_back"] = %paris_van_player_front_to_back;
    maps\_anim::_id_1264( "player_rig", "rumble_medium", ::_id_012B, "player_front_to_back" );
    maps\_anim::_id_1264( "player_rig", "rumble_large", ::_id_012C, "player_front_to_back" );
    level._id_0C59["player_rig"]["player_back_to_front"] = %paris_van_player_back_to_front;
    level._id_0C59["player_rig"]["chase_ending_start"] = %paris_chase_ending_player_start;
    maps\_anim::_id_1264( "player_rig", "door_kick_fx", ::_id_7754, "chase_ending_start" );
    level._id_0C59["player_rig"]["chase_final_crash"] = %paris_chase_final_crash_player;
    maps\_anim::_id_1264( "player_rig", "rumble_medium", ::_id_012B, "chase_final_crash" );
    maps\_anim::_id_1264( "player_rig", "rumble_large", ::_id_012C, "chase_final_crash" );
}
#using_animtree("generic_human");

_id_770F()
{
    level._id_0C59["generic"]["DRS_sprint"] = %sprint1_loop;
    level._id_0C59["redshirt"]["a_b_switch_pt1"] = %paris_a_b_switch_npc_pt1;
    level._id_0C59["redshirt"]["a_b_switch_pt2"] = %paris_a_b_switch_npc_pt2;
    level._id_0C59["lonestar"]["a_b_switch_pt1"] = %paris_a_b_switch_sandman_pt1;
    level._id_0C59["lonestar"]["a_b_switch_pt2"] = %paris_a_b_switch_sandman_pt2;
    maps\_anim::_id_1264( "lonestar", "dialog", maps\paris_b_vo::_id_7725, "a_b_switch_pt2" );
    level._id_0C59["generic"]["plant_flare"] = %paris_delta_deply_flare_crouched_alt;
    level._id_0C59["generic"]["catacombs_signal_move_out"] = %cqb_stand_signal_move_out;
    level._id_0C59["generic"]["catacombs_signal_stop"] = %cqb_stand_signal_stop;
    level._id_0C59["generic"]["catacombs_signal_quick_stop"] = %cqb_stop_2_signal;
    level._id_0C59["generic"]["catacombs_signal_look"] = %cqb_stand_signal_twitch_look;
    level._id_0C59["generic"]["catacombs_signal_quick_look"] = %cqb_stand_signal_twitch_quicklook;
    level._id_0C59["gign_leader"]["catacombs_gate_enter_enter"] = %paris_delta_door_pry_trans_guy2;
    level._id_0C59["redshirt"]["catacombs_gate_enter_enter"] = %paris_delta_door_pry_tans_guy1;
    level._id_0C59["gign_leader"]["catacombs_gate_enter_idle"] = [ %paris_delta_door_pry_idle_guy2 ];
    level._id_0C59["redshirt"]["catacombs_gate_enter_idle"] = [ %paris_delta_door_pry_idle_guy1 ];
    level._id_0C59["gign_leader"]["catacombs_gate_enter"] = %paris_delta_door_pry_guy2;
    level._id_0C59["redshirt"]["catacombs_gate_enter"] = %paris_delta_door_pry_guy1;
    level._id_0C59["gign_leader"]["squeeze_through_fallen_corridor"] = %paris_delta_squeeze_through_fallen_corridor_a;
    level._id_0C59["lonestar"]["squeeze_through_fallen_corridor"] = %paris_delta_squeeze_through_fallen_corridor_b;
    level._id_0C59["reno"]["squeeze_through_fallen_corridor"] = %paris_delta_squeeze_through_fallen_corridor_a;
    level._id_0C59["redshirt"]["squeeze_through_fallen_corridor"] = %paris_delta_squeeze_through_fallen_corridor_b;
    level._id_0C59["generic"]["gate_ambush"] = %paris_catacombs_gate_ambush_enemy;
    level._id_0C59["gign_leader"]["gate_ambush"] = %paris_catacombs_gate_ambush;
    level._id_0C59["guard"]["volk_escape"] = %paris_volk_escape_guard;
    level._id_0C59["volk"]["volk_escape"] = %paris_volk_escape_volk;
    level._id_0C59["gign_leader"]["volk_escape"] = %paris_volk_escape_reaction;
    level._id_0C59["sedan_guard"]["sedan_escape_passengers_loop"] = [ %paris_sedan_idle_backr ];
    level._id_0C59["volk"]["sedan_escape"] = %paris_sedan_enter_frontr;
    level._id_0C59["volk"]["sedan_escape_loop"] = [ %paris_sedan_idle_frontr ];
    level._id_0C59["generic"]["death_pose_window"] = %death_pose_on_window;
    level._id_0C59["generic"]["death_pose_desk"] = %death_pose_on_desk;
    level._id_0C59["generic"]["death_sitting_pose_1"] = %death_sitting_pose_v1;
    level._id_0C59["generic"]["death_sitting_pose_2"] = %death_sitting_pose_v2;
    level._id_0C59["generic"]["death_pose_farmer"] = %hunted_farmsequence_farmer_deathpose;
    level._id_0C59["lonestar"]["van_ride_enter"] = %paris_delta_van_enter;
    level._id_0C59["lonestar"]["van_ride_enter_idle"] = [ %paris_delta_van_enter_idle ];
    level._id_0C59["generic"]["chase_gaz_barricade"] = %paris_chase_gaz_barricade_guy1;
    level._id_0C59["lonestar"]["van_ride_to_combat"] = %paris_van_sandman_to_combat;
    level._id_0C59["reno"]["van_driver_bullet_react"] = %paris_delta_van_driver_bullet_react;
    level._id_0C59["reno"]["van_driver_driving"] = [ %paris_delta_van_driver_driving ];
    level._id_0C59["reno"]["van_driver_driving_braced"] = [ %paris_delta_van_driver_driving_braced ];
    level._id_0C59["reno"]["van_driver_enter"] = %paris_delta_van_driver_enter;
    level._id_0C59["reno"]["van_driver_exit"] = %paris_delta_van_driver_exit;
    level._id_0C59["reno"]["van_driver_idle"] = [ %paris_delta_van_driver_idle ];
    level._id_0C59["reno"]["van_driver_impact_big"] = %paris_delta_van_driver_impact_big;
    level._id_0C59["reno"]["van_driver_impact_small"] = %paris_delta_van_driver_impact_small;
    level._id_0C59["reno"]["van_driver_start_engine"] = %paris_delta_van_driver_start_engine;
    level._id_0C59["reno"]["van_driver_turn_full_left"] = %paris_delta_van_driver_turn_full_left;
    level._id_0C59["reno"]["van_driver_turn_full_right"] = %paris_delta_van_driver_turn_full_right;
    level._id_0C59["reno"]["van_driver_turn_pose_left"] = [ %paris_delta_van_driver_turn_pose_left ];
    level._id_0C59["reno"]["van_driver_turn_pose_right"] = [ %paris_delta_van_driver_turn_pose_right ];
    level._id_0C59["lonestar"]["van_ride_fire_fwd"] = [ %paris_delta_van_ride_fire_fwd ];
    level._id_0C59["lonestar"]["van_ride_fire_left"] = [ %paris_delta_van_ride_fire_left ];
    level._id_0C59["lonestar"]["van_ride_fire_right"] = [ %paris_delta_van_ride_fire_right ];
    level._id_0C59["lonestar"]["van_ride_fire_spray"] = %paris_delta_van_ride_fire_spray;
    level._id_0C59["lonestar"]["van_ride_fire_spray_variant"] = %paris_delta_van_ride_fire_spray_variant;
    level._id_0C59["lonestar"]["van_ride_hardslam_left"] = %paris_delta_van_ride_hardslam_left;
    level._id_0C59["lonestar"]["van_ride_hardslam_right"] = %paris_delta_van_ride_hardslam_right;
    level._id_0C59["lonestar"]["van_ride_idle_fwd"] = [ %paris_delta_van_ride_idle ];
    level._id_0C59["lonestar"]["van_ride_idle_left"] = [ %paris_delta_van_ride_idle_left ];
    level._id_0C59["lonestar"]["van_ride_idle_right"] = [ %paris_delta_van_ride_idle_right ];
    level._id_0C59["lonestar"]["van_noneride_idle"] = [ %paris_delta_van_noneride_idle ];
    level._id_0C59["lonestar"]["van_ride_idle_check"] = %paris_delta_van_ride_idle_check;
    level._id_0C59["lonestar"]["van_ride_lightslam_left"] = %paris_delta_van_ride_lightslam_left;
    level._id_0C59["lonestar"]["van_ride_lightslam_right"] = %paris_delta_van_ride_lightslam_right;
    level._id_0C59["lonestar"]["van_ride_slam_left"] = %paris_delta_van_ride_slam_left;
    level._id_0C59["lonestar"]["van_ride_slam_right"] = %paris_delta_van_ride_slam_right;
    maps\_anim::_id_1264( "lonestar", "fire", maps\paris_b_code::_id_7743, "van_ride_fire_fwd" );
    maps\_anim::_id_1264( "lonestar", "fire", maps\paris_b_code::_id_7743, "van_ride_fire_left" );
    maps\_anim::_id_1264( "lonestar", "fire", maps\paris_b_code::_id_7743, "van_ride_fire_right" );
    maps\_anim::_id_1264( "lonestar", "fire", maps\paris_b_code::_id_7743, "van_ride_fire_spray" );
    maps\_anim::_id_1264( "lonestar", "fire", maps\paris_b_code::_id_7743, "van_ride_fire_spray_variant" );
    level._id_0C59["lonestar"]["van_climb_paired"] = %paris_van_climb_paired_sandman_alt;
    level._id_0C59["generic"]["van_climb_paired"] = %paris_van_climb_paired_guy1_alt;
    level._id_0C59["generic"]["van_climb_paired_death"] = [ %paris_van_climb_paired_guy1_death ];
    maps\_anim::_id_1264( "generic", "flesh_impact", ::_id_7758, "van_climb_paired" );
    level._id_1245["player_rig_feet"] = #animtree;
    level._id_1F90["player_rig_feet"] = "viewlegs_generic";
    level._id_0C59["player_rig_feet"]["player_front_to_back"] = %paris_van_playerlegs_front_to_back;
    level._id_0C59["player_rig_feet"]["chase_ending_start"] = %paris_chase_ending_player_legs_start;
    level._id_0C59["generic"]["escort_gaz_crash"] = %paris_escort_gaz_crash_guy1;
    level._id_0C59["sedan_guard_r"]["ending_breach_driving_loop"] = [ %paris_sedan_idle_backr ];
    level._id_0C59["sedan_guard_l"]["ending_breach_driving_loop"] = [ %paris_sedan_idle_backr ];
    level._id_0C59["volk"]["ending_breach_driving_loop"] = [ %paris_sedan_idle_frontr ];
    level._id_0C59["sedan_guard_r"]["ending_breach_intro"] = %paris_chase_final_crash_rearright;
    level._id_0C59["sedan_guard_l"]["ending_breach_intro"] = %paris_chase_final_crash_rearleft;
    level._id_0C59["sedan_driver"]["ending_breach_intro"] = %paris_chase_final_crash_driver;
    level._id_0C59["volk"]["ending_breach_intro"] = %paris_chase_final_crash_volk;
    level._id_0C59["sedan_guard_r"]["ending_breach_death"] = %paris_chase_final_crash_rearright_death;
    level._id_0C59["sedan_guard_l"]["ending_breach_death"] = %paris_chase_final_crash_rearleft_death;
    level._id_0C59["sedan_driver"]["ending_breach_death"] = %paris_chase_final_crash_driver_death;
    level._id_0C59["sedan_guard_r"]["ending_breach_death_pose"] = [ %paris_chase_final_crash_rearright_death_pose ];
    level._id_0C59["lonestar"]["van_dismount"] = %paris_delta_van_dismount_01;
    level._id_0C59["gign_leader"]["van_dismount"] = %paris_delta_van_dismount_03;
    level._id_0C59["ali_guard_1"]["terrorists_wounded_vehicle_loop"] = [ %paris_terrorists_wounded_vehicle_exit_a_loop ];
    level._id_0C59["ali_guard_2"]["terrorists_wounded_vehicle_loop"] = [ %paris_terrorists_wounded_vehicle_exit_b_loop ];
    level._id_0C59["ali_guard_3"]["terrorists_wounded_vehicle_loop"] = [ %paris_terrorists_wounded_vehicle_exit_c_loop ];
    level._id_0C59["ali_guard_1"]["terrorists_wounded_vehicle_exit_simple"] = %paris_terrorists_wounded_vehicle_exit_simple_guy1;
    level._id_0C59["ali_guard_2"]["terrorists_wounded_vehicle_exit_simple"] = %paris_terrorists_wounded_vehicle_exit_simple_guy2;
    level._id_0C59["ali_guard_3"]["terrorists_wounded_vehicle_exit_simple"] = %paris_terrorists_wounded_vehicle_exit_simple_guy3;
    level._id_0C59["volk"]["chase_ending_start"] = %paris_chase_ending_volk_start;
    level._id_0C59["lonestar"]["chase_ending_start"] = %paris_chase_ending_sandman_start;
    level._id_0C59["volk"]["chase_ending_end"] = %paris_chase_ending_volk_end;
    level._id_0C59["lonestar"]["chase_ending_end"] = %paris_chase_ending_sandman_end;
    maps\_anim::_id_1264( "volk", "fx_glass_drag_start", ::_id_775B, "chase_ending_start" );
    maps\_anim::_id_1264( "volk", "fx_hood_slam", ::_id_7759, "chase_ending_start" );
    maps\_anim::_id_1264( "volk", "fx_ground_slam", ::_id_775A, "chase_ending_end" );
    maps\_anim::_id_1264( "volk", "fx_start_drag", ::_id_775C, "chase_ending_end" );
}
#using_animtree("vehicles");

_id_7710()
{
    level._id_1245["bomb_truck"] = #animtree;
    level._id_0C59["bomb_truck"]["van_ride_enter"] = %paris_delta_van_enter_vehicle;
    level._id_0C59["bomb_truck"]["van_driver_enter"] = %paris_van_driver_enter;
    level._id_0C59["bomb_truck"]["player_enter_van"] = %paris_van_side_door_open;
    level._id_0C59["bomb_truck"]["player_enter_van_glass"] = %paris_van_side_door_open_glass;
    level._id_0C59["bomb_truck"]["player_front_to_back"] = %paris_van_back_door_open;
    level._id_0C59["bomb_truck"]["van_back_door_idle"] = %paris_van_back_door_idle;
    level._id_0C59["bomb_truck"]["van_back_door_open"] = %paris_van_back_door_open;
    level._id_0C59["bomb_truck"]["van_back_door_rip_off"] = %paris_van_back_door_rip_off;
    level._id_0C59["bomb_truck"]["van_driver_driving"] = %paris_van_driver_driving;
    level._id_0C59["bomb_truck"]["van_driver_driving_braced"] = %paris_van_driver_driving;
    level._id_0C59["bomb_truck"]["van_driver_impact_big"] = %paris_van_driver_driving;
    level._id_0C59["bomb_truck"]["van_driver_turn_full_left"] = %paris_van_driver_turn_full_left;
    level._id_0C59["bomb_truck"]["van_driver_turn_full_right"] = %paris_van_driver_turn_full_right;
    level._id_0C59["bomb_truck"]["van_driver_turn_pose_right"] = %paris_van_driver_turn_pose_right;
    level._id_0C59["bomb_truck"]["van_driver_turn_pose_left"] = %paris_van_driver_turn_pose_left;
    level._id_0C59["bomb_truck"]["van_driver_idle"] = %paris_van_driver_idle;
    level._id_0C59["bomb_truck"]["chase_ending_start"] = %paris_chase_ending_van_start;
    level._id_0C59["bomb_truck"]["van_driver_exit"] = %paris_van_driver_exit;
    level._id_0C59["bomb_truck"]["chase_gaz_barricade"] = %paris_chase_gaz_barricade_armored_van;
    level._id_0C59["gaz1"]["chase_gaz_barricade"] = %paris_chase_gaz_barricade_gaz1;
    level._id_0C59["gaz2"]["chase_gaz_barricade"] = %paris_chase_gaz_barricade_gaz2;
    level._id_1245["escape_sedan"] = #animtree;
    level._id_0C59["escape_sedan"]["sedan_escape"] = %paris_sedan_peel_out;
    level._id_0C59["escape_sedan"]["chase_ending_start"] = %paris_chase_ending_sedan_start;
    level._id_0C59["escape_sedan"]["chase_ending_end"] = %paris_chase_ending_sedan_end;
    maps\_anim::_id_1264( "escape_sedan", "wall_impact_1", ::_id_7747, "chase_final_crash" );
    level._id_0C59["escape_sedan"]["chase_final_crash"] = %paris_chase_final_crash_sedan;
    level._id_0C59["bomb_truck"]["chase_final_crash"] = %paris_chase_final_crash_van;
    maps\_anim::_id_1264( "escape_sedan", "van_impact", ::_id_7746, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "wall_impact_1", ::_id_7747, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "wall_impact_2", ::_id_7748, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "potted_plant_impact", ::_id_774A, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "van_crash_1", ::_id_7749, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "slide_sparks_end", ::_id_774B, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "stair_impact", ::_id_774C, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "sedan_flip_impact_1", ::_id_774F, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "wheel_pop_1", ::_id_7750, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "sedan_flip_impact_2", ::_id_7751, "chase_final_crash" );
    maps\_anim::_id_1264( "escape_sedan", "van_crash_end", ::_id_7752, "chase_final_crash" );
    level._id_1245["sedan"] = #animtree;
    level.scr_sound["tank_crush"] = "paris_tank_crush_car";
    level._id_0C59["sedan"]["tank_crush"] = %paris_80s_sedan1_tankcrush;
    level._id_0C59["tank"]["tank_crush"] = %paris_abrams_tankcrush;
    level._id_0C59["gaz"]["escort_gaz_crash"] = %paris_escort_gaz_crash_gaz;
}

_id_7711()
{

}
#using_animtree("script_model");

_id_4CAC()
{
    level._id_1245["player_gasmask"] = #animtree;
    level._id_1F90["player_gasmask"] = "paris_player_gasmask";
    level._id_0C59["player_gasmask"]["a_b_switch_pt2"] = %paris_a_b_switch_mask_pt2;
    level._id_1245["catacombs_flare"] = #animtree;
    level._id_1F90["catacombs_flare"] = "mil_emergency_flare";
    level._id_0C59["catacombs_flare"]["plant_flare"] = %paris_delta_deply_flare_crouched_alt_flare;
    level._id_0C59["catacombs_flare"]["plant_flare_idle"] = [ %paris_delta_deply_flare_crouched_alt_flare_idle ];
    level._id_1245["catacombs_gate"] = #animtree;
    level._id_0C59["catacombs_gate"]["catacombs_gate_enter"] = %paris_delta_door_pry_door;
    level._id_1F90["crowbar"] = "paris_crowbar_01";
    level._id_1245["crowbar"] = #animtree;
    level._id_0C59["crowbar"]["catacombs_gate_enter"] = %paris_delta_door_pry_crowbar;
    level._id_1245["ambush_gate"] = #animtree;
    level._id_0C59["ambush_gate"]["gate_ambush"] = %paris_catacombs_gate_ambush_door;
    maps\_anim::_id_1264( "ambush_gate", "gate_push", ::_id_7756, "gate_ambush" );
    maps\_anim::_id_1264( "ambush_gate", "gate_fall", ::_id_7756, "gate_ambush" );
    level._id_1245["volk_escape_table"] = #animtree;
    level._id_0C59["volk_escape_table"]["volk_escape"] = %paris_volk_escape_table;
    level._id_1245["volk_escape_table_props"] = #animtree;
    level._id_0C59["volk_escape_table_props"]["volk_escape"] = %paris_volk_escape_table_clutter;
    maps\_anim::_id_1264( "volk_escape_table", "table_flip_dust", ::_id_7757, "volk_escape" );
    level._id_1245["final_crash_fence"] = #animtree;
    level._id_0C59["final_crash_fence"]["chase_final_crash"] = %paris_chase_final_crash_fence;
}

_id_7744( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "glass_punch_paris" ), var_0, "J_Wrist_LE" );
    playfxontag( common_scripts\utility::getfx( "glass_punch_paris" ), var_0, "J_Wrist_RI" );
}

_id_7745( var_0 )
{
    var_0 = level._id_5157;
    playfxontag( common_scripts\utility::getfx( "window_hit_hood" ), var_0, "tag_engine_left" );
}

_id_7746( var_0 )
{
    var_1 = [ "hitA", "trunk", "wheel_A_KL", "wheel_A_KR" ];
    _id_7755( var_1 );
    playfxontag( common_scripts\utility::getfx( "sedan_trunk_papers" ), var_0, "trunk" );
}

_id_7747( var_0 )
{
    common_scripts\utility::flag_set( "flag_final_crash_wall_impact_1" );
    var_1 = common_scripts\utility::getstruct( "fruit_cart_explosion1", "targetname" );
    physicsexplosionsphere( var_1.origin, 100, 100, 1.2 );
    radiusdamage( var_1.origin, 150, 5000, 5000 );
}

_id_7748( var_0 )
{
    var_1 = [ "hitB", "wheel_A_FL", "wheel_A_FR" ];
    _id_7755( var_1 );
    var_2 = common_scripts\utility::getstruct( "postcard_rack_explosion1", "targetname" );
    radiusdamage( var_2.origin, 100, 5000, 5000 );
    physicsexplosionsphere( var_2.origin, 150, 150, 1.2 );
    wait 0.1;
    radiusdamage( var_2.origin, 100, 5000, 5000 );
    wait 0.1;
    radiusdamage( var_2.origin, 100, 5000, 5000 );
    var_2 = common_scripts\utility::getstruct( "postcard_rack_explosion2", "targetname" );
    radiusdamage( var_2.origin, 150, 5000, 5000 );
    physicsexplosionsphere( var_2.origin, 100, 100, 1.2 );
    wait 0.5;
    var_2 = common_scripts\utility::getstruct( "postcard_rack_explosion3", "targetname" );
    radiusdamage( var_2.origin, 150, 5000, 5000 );
    physicsexplosionsphere( var_2.origin, 100, 100, 1.2 );
}

_id_7749( var_0 )
{
    var_1 = [ "hitC", "TAG_GLASS_LEFT_BACK", "TAG_GLASS_RIGHT_FRONT", "TAG_GLASS_RIGHT_BACK", "TAG_GLASS_FRONT", "doorC_FL", "doorC_KL", "doorC_FR", "doorC_KR" ];
    _id_7755( var_1 );
    playfxontag( common_scripts\utility::getfx( "car_glass_med_moving" ), var_0, "TAG_GLASS_LEFT_BACK_FX" );
    playfxontag( common_scripts\utility::getfx( "car_glass_med_moving" ), var_0, "TAG_GLASS_RIGHT_FRONT_FX" );
    playfxontag( common_scripts\utility::getfx( "car_glass_med_moving" ), var_0, "TAG_GLASS_RIGHT_BACK_FX" );
    playfxontag( common_scripts\utility::getfx( "car_glass_large_moving" ), var_0, "TAG_GLASS_FRONT_FX" );
    var_2 = level._id_5157;
    playfxontag( common_scripts\utility::getfx( "van_crash_1" ), var_2, "tag_engine_left" );
    setblur( 2.0, 0.1 );
    level.player playrumbleonentity( "damage_heavy" );
    wait 0.2;
    setblur( 0, 0.4 );
    playfxontag( common_scripts\utility::getfx( "van_grill_smoke" ), var_2, "body_animate_jnt" );
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_3 linkto( var_0, "tag_origin", ( -95.0, 30.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 linkto( var_0, "tag_origin", ( 55.0, 30.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );

    while ( !common_scripts\utility::flag( "flag_slide_sparks_end" ) )
    {
        playfxontag( common_scripts\utility::getfx( "sedan_skid_sparks" ), var_3, "tag_origin" );
        playfxontag( common_scripts\utility::getfx( "sedan_skid_sparks" ), var_4, "tag_origin" );
        wait 0.1;
    }
}

_id_774A( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "topiary_explosion1", "targetname" );
    var_2 = getentarray( "oak_branch_destructible", "targetname" );

    foreach ( var_4 in var_2 )
        var_4 hide();

    var_6 = getent( "topiary_explosion_pot", "targetname" );
    var_7 = var_6.origin;
    var_8 = var_6.angles;
    playfx( common_scripts\utility::getfx( "topiary_explosion_crash" ), var_7, anglestoforward( var_8 ), anglestoup( var_8 ) );
    var_6 hide();
    wait 0.05;
    physicsexplosionsphere( var_1.origin, 75, 75, 6 );
}

_id_774B( var_0 )
{
    common_scripts\utility::flag_set( "flag_slide_sparks_end" );
}

_id_774C( var_0 )
{
    common_scripts\utility::flag_set( "flag_stair_impact" );
    _id_774D();
    var_1 = [ "hitC", "TAG_GLASS_LEFT_FRONT", "TAG_GLASS_ROOF", "doorC_FL", "doorC_KL", "doorC_FR", "doorC_KR" ];
    _id_7755( var_1 );
    playfxontag( common_scripts\utility::getfx( "car_glass_med" ), var_0, "TAG_GLASS_LEFT_FRONT_FX" );
    playfxontag( common_scripts\utility::getfx( "car_glass_sunroof" ), var_0, "TAG_GLASS_ROOF_FX" );
    var_2 = level._id_5157;
    playfxontag( common_scripts\utility::getfx( "van_fence_impact" ), var_2, "tag_engine_left" );
    setblur( 2.0, 0.1 );
    level.player playrumbleonentity( "damage_heavy" );
    wait 0.2;
    setblur( 0, 0.4 );
}

_id_774D()
{
    foreach ( var_1 in getentarray( "final_crash_fence_undamaged", "script_noteworthy" ) )
        var_1 hide();

    foreach ( var_4 in getentarray( "final_crash_fence_broken_base", "script_noteworthy" ) )
        var_4 show();

    level._id_774E show();
}

_id_774F( var_0 )
{
    var_1 = [ "hitD", "TAG_GLASS_BACK" ];
    _id_7755( var_1 );
    playfxontag( common_scripts\utility::getfx( "car_glass_large_moving" ), var_0, "TAG_GLASS_FRONT_FX" );
    playfxontag( common_scripts\utility::getfx( "car_decal_spawner" ), var_0, "TAG_WHEEL_FRONT_LEFT" );
    playfxontag( common_scripts\utility::getfx( "sedan_tire_smoketrail" ), var_0, "left_wheel_01_jnt" );
    common_scripts\utility::exploder( 9208 );
}

_id_7750( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "sedan_tire_smoketrail" ), var_0, "left_wheel_02_jnt" );
}

_id_7751( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "car_decal_spawner" ), var_0, "TAG_DOOR_RIGHT_BACK" );
    playfxontag( common_scripts\utility::getfx( "car_decal_spawner" ), var_0, "TAG_DOOR_RIGHT_FRONT" );
}

_id_7752( var_0 )
{
    for ( var_1 = 1; var_1 < 10; var_1++ )
        level._id_50DE maps\paris_b_code::_id_7753( level._id_50DE, var_1, 1 );

    level._id_50DE setmodel( "vehicle_armored_van_destroyed" );
    var_2 = level._id_5157;
    playfxontag( common_scripts\utility::getfx( "van_final_crash" ), var_2, "tag_engine_left" );
    setblur( 2.0, 0.1 );
    level.player playrumbleonentity( "grenade_rumble" );
    wait 0.5;
    setblur( 0, 0.4 );
    common_scripts\utility::exploder( 9207 );
}

_id_7754( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "van_door_kick" ), level._id_5157, "door_FR" );
    var_1 = getentarray( "final_crash_skidmarks", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 show();
}

_id_7755( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        level._id_5166 hidepart( var_2 );
        level._id_5164 hidepart( var_2 );
        level._id_5166 showpart( var_2 + "_D" );
        level._id_5164 showpart( var_2 + "_D" );
    }
}

_id_7756( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "ambush_gate_dust" ), var_0, "tag_fx" );
}

_id_7757( var_0 )
{
    common_scripts\utility::exploder( 62001 );
}

_id_7758( var_0 )
{
    var_1 = [ "J_SpineLower", "J_SpineUpper", "J_Spine4", "J_Neck", "J_Hip_LE", "J_Knee_LE", "J_Hip_RI", "J_Knee_RI" ];
    var_2 = randomint( var_1.size );
    var_3 = [ "flesh_hit", "flesh_hit_small" ];
    var_4 = randomint( var_3.size );
    playfxontag( common_scripts\utility::getfx( var_3[var_4] ), var_0, var_1[var_2] );
}

_id_7759( var_0 )
{
    common_scripts\utility::exploder( 9205 );
    common_scripts\utility::flag_set( "msg_fx_end_drag_glass" );
}

_id_775A( var_0 )
{
    common_scripts\utility::exploder( 9206 );
}

_id_775B( var_0 )
{
    var_0 endon( "death" );

    while ( !common_scripts\utility::flag( "msg_fx_end_drag_glass" ) )
    {
        playfxontag( common_scripts\utility::getfx( "drag_glass_trail" ), var_0, "J_SpineUpper" );
        wait 0.1;
    }
}

_id_775C( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "body_drag_trail" ), var_0, "J_SpineUpper" );
        wait 0.2;
    }
}

_id_012A( var_0 )
{
    level.player playrumbleonentity( "viewmodel_small" );
}

_id_012B( var_0 )
{
    level.player playrumbleonentity( "viewmodel_medium" );
}

_id_012C( var_0 )
{
    level.player playrumbleonentity( "viewmodel_large" );
}
