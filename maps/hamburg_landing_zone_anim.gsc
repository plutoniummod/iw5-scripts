// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_7EC3();
    _id_7EC4();
    _id_47DE();
    _id_7EC2();
    _id_454D();
    _id_7EC5();
}
#using_animtree("generic_human");

_id_7EC2()
{
    level._id_0C59["generic"]["death_sitting_pose_v1"] = %death_sitting_pose_v1;
    level._id_0C59["generic"]["run_low"] = %run_lowready_f;
    level._id_0C59["generic"]["carrier_walk_loop"] = %wounded_carry_jog_carrier;
    level._id_0C59["generic"]["wounded_carry_fastwalk_carrier"] = %wounded_carry_fastwalk_carrier;
    level._id_0C59["generic"]["wounded_three"] = %wounded_carry_sprint_carrier;
    level._id_0C59["generic"]["patrol_jog"] = %patrol_jog;
    level._id_0C59["generic"]["patrol_jog_orders"] = %patrol_jog_orders;
    level._id_0C59["generic"]["crouch_sprint"] = %crouch_sprint;
    level._id_0C59["generic"]["airport_civ_dying_groupB_wounded"] = %airport_civ_dying_groupb_wounded;
    level._id_0C59["generic"]["airport_civ_dying_groupB_wounded_death"] = %airport_civ_dying_groupb_wounded_death;
    level._id_0C59["generic"]["airport_civ_dying_groupB_pull_death"] = %airport_civ_dying_groupb_pull_death;
    level._id_0C59["generic"]["airport_civ_dying_groupB_pull"] = %airport_civ_dying_groupb_pull;
    level._id_0C59["generic"]["airport_civ_dying_groupB_pull"] = %airport_civ_dying_groupb_pull;
    level._id_0C59["generic"]["airport_civ_dying_groupB_pull"] = %airport_civ_dying_groupb_pull;
    level._id_0C59["generic"]["airport_civ_dying_groupB_pull"] = %airport_civ_dying_groupb_pull;
    level._id_0C59["generic"]["payback_pmc_sandstorm_stumble_1"] = %payback_pmc_sandstorm_stumble_1;
    level._id_0C59["generic"]["payback_pmc_sandstorm_stumble_2"] = %payback_pmc_sandstorm_stumble_2;
    level._id_0C59["generic"]["payback_pmc_sandstorm_stumble_3"] = %payback_pmc_sandstorm_stumble_3;
    level._id_0C59["generic"]["hunted_dazed_walk_A_zombie"] = %hunted_dazed_walk_a_zombie;
    level._id_0C59["generic"]["hunted_dazed_walk_B_blind"] = %hunted_dazed_walk_b_blind;
    level._id_0C59["generic"]["hunted_dazed_walk_C_limp"] = %hunted_dazed_walk_c_limp;
    level._id_0C59["generic"]["hamburg_tank_call"] = %hamburg_tank_call;
    level._id_0C59["tank_loader"]["idle_reload"] = %abrams_loader_load;
}
#using_animtree("player");

_id_7EC3()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_0C59["player_rig"]["player_getin"] = %roadkill_hummer_player_getin;
    level._id_1F90["player_rig"] = "viewhands_player_delta";
    level._id_0C59["player_rig"]["mount_tank"] = %hamburg_tank_entry_upperbody;
    level._id_1245["player_rig_legs"] = #animtree;
    level._id_1F90["player_rig_legs"] = "viewlegs_generic";
    level._id_0C59["player_rig_legs"]["mount_tank"] = %hamburg_tank_entry_lowerbody;
}

_id_7EC4()
{
    maps\_utility::_id_2832( "tank_snd_locatedbeacon" );
    maps\_utility::_id_2832( "tank_hqr_lostallcontact" );
    maps\_utility::_id_2832( "tank_snd_sendlast" );
    maps\_utility::_id_2832( "tank_hqr_uploadingnow" );
    maps\_utility::_id_2832( "tank_snd_getmeopcon" );
    maps\_utility::_id_2832( "hamburg_op2_raptorinbound" );
    maps\_utility::_id_2832( "hamburg_snd_regroup" );
    level.scr_sound["sandman"]["hamburg_snd_holdup"] = "hamburg_snd_holdup";
    level.scr_sound["sandman"]["hamburg_snd_sniper"] = "hamburg_snd_sniper";
    maps\_utility::_id_2832( "tank_rh1_wherearetargets" );
    level.scr_sound["sandman"]["hamburg_snd_hititnow"] = "hamburg_snd_hititnow";
    level.scr_sound["sandman"]["hamburg_snd_onminigun"] = "hamburg_snd_onminigun";
    level.scr_sound["sandman"]["hamburg_snd_upyougo"] = "hamburg_snd_upyougo";
    level.scr_sound["sandman"]["hamburg_snd_getongun"] = "hamburg_snd_getongun";
    level.scr_sound["sandman"]["hamburg_snd_rightflank"] = "hamburg_snd_rightflank";
    level.scr_sound["sandman"]["hamburg_snd_goinright"] = "hamburg_snd_goinright";
    level.scr_sound["sandman"]["hamburg_snd_sticktoright"] = "hamburg_snd_sticktoright";
    level.scr_sound["sandman"]["hamburg_snd_letsgomove"] = "hamburg_snd_letsgomove";
    maps\_utility::_id_2832( "hamburg_snd_nevermadeit" );
    level._effect["mortar"]["bunker_ceiling"] = loadfx( "dust/ceiling_dust_bunker" );
    level._effect["mortar"]["bunker_ceiling_green"] = loadfx( "dust/ceiling_dust_bunker_green" );
    level._effect["mortar"]["concrete"] = loadfx( "explosions/grenadeExp_concrete_1_low" );
    level.scr_sound["mortar"]["incomming"] = "mortar_incoming";
    level.scr_sound["mortar"]["dirt"] = "mortar_explosion_dirt";
    level.scr_sound["mortar"]["dirt_large"] = "mortar_explosion_dirt";
    level.scr_sound["mortar"]["concrete"] = "mortar_explosion_dirt";
    level.scr_sound["mortar"]["mud"] = "mortar_explosion_water";
    level.scr_sound["mortar"]["water"] = "mortar_explosion_water";
    level.scr_sound["mortar"]["water_ocean"] = "mortar_explosion_water";
}
#using_animtree("vehicles");

_id_47DE()
{
    level._id_0C59["generic"]["hovercraft_tank_back_exit"] = %lcac_tank_exit_02;
    level._id_0C59["generic"]["hovercraft_tank_forward_exit"] = %lcac_tank_exit_01;
    level._id_0C59["suburban_hands"]["player_getin"] = %hamburg_minigun_mount;
    level._id_1F90["suburban_hands"] = "weapon_m1a1_minigun";
    level._id_1245["suburban_hands"] = #animtree;
}
#using_animtree("script_model");

_id_7EC5()
{
    level._id_1245["crane"] = #animtree;
    level._id_0C59["crane"]["crash"] = %hamburg_crane_crash_crane;
}
#using_animtree("vehicles");

_id_454D()
{
    level._id_1245["minigun_m1a1"] = #animtree;
    level._id_1F90["minigun_m1a1"] = "weapon_m1a1_minigun";
    level._id_0C59["minigun_m1a1"]["mount_tank"] = %hamburg_tank_entry_minigun;
}
