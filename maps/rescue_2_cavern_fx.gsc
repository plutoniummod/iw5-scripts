// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread _id_56D2();
    thread _id_3E60();
    thread _id_3E61();
    thread _id_3E63();
}

_id_56D2()
{
    level._effect["light_blinking_red"] = loadfx( "lights/light_blink_subway" );
}

_id_3E60()
{
    level._effect["detonator_light"] = loadfx( "misc/light_semtex_blink" );
    level._effect["fireball"] = loadfx( "explosions/fireball_rescue" );
    level._effect["deserteagle_muzzleflash"] = loadfx( "muzzleflashes/desert_eagle_flash_wv_a" );
    level._effect["floor_breach_explosion"] = loadfx( "explosions/generator_explosion" );
    level._effect["generic_explosion"] = loadfx( "explosions/generic_explosion" );
    level._effect["inner_cave_shell_blast_rescue"] = loadfx( "explosions/inner_cave_shell_blast_rescue" );
    level._effect["ambient_debris_blasts_rescue"] = loadfx( "explosions/ambient_debris_blasts_rescue" );
    level._effect["large_entrance_exp_rescue"] = loadfx( "explosions/large_entrance_exp_rescue" );
    level._effect["mega_explosion"] = loadfx( "explosions/cave_mouth_wall_blast_rescue" );
    level._effect["mega_explosion_tracer"] = loadfx( "explosions/cave_mouth_wall_blast_rescue_tracer" );
    level._effect["mega_explosion_tracer_snow"] = loadfx( "explosions/cave_mouth_wall_blast_rescue_tracer_snow" );
    level._effect["mega_explosion_tracer_snow_lots"] = loadfx( "explosions/cave_exit_snow_blasts_rescue" );
    level._effect["tracer_trails_rescue"] = loadfx( "muzzleflashes/tracer_trails_rescue" );
    level._effect["heli_smoke"] = loadfx( "smoke/smoke_trail_black_heli" );
    level._effect["heli_crash"] = loadfx( "explosions/helicopter_explosion" );
    level._effect["heli_explosion"] = loadfx( "explosions/helicopter_explosion_pavelow" );
    level._effect["bodyshot1"] = loadfx( "impacts/flesh_hit" );
    level._effect["bodyshot2"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );
    level._effect["headshot1"] = loadfx( "impacts/flesh_hit_head_fatal_exit" );
    level._effect["headshot2"] = loadfx( "impacts/flesh_hit_head_fatal_exit_exaggerated" );
    level._effect["flesh_hit_head_fatal_exit_exaggerated"] = loadfx( "impacts/flesh_hit_head_fatal_exit_exaggerated" );
    level._effect["pipe_steam"] = loadfx( "impacts/pipe_steam" );
    level._effect["electrical_transformer_sparks_a"] = loadfx( "explosions/electrical_transformer_sparks_a" );
    level._effect["cavern_bottom_collapse_dirt"] = loadfx( "dust/ceiling_collapse_dirt1" );
    level._effect["cavern_bottom_collapse_dirt_linger"] = loadfx( "dust/ceiling_collapse_dirt1_linger" );
    level._effect["ceiling_rock_collapse"] = loadfx( "explosions/ceiling_rock_collapse" );
    level._effect["ceiling_rock_collapse_big"] = loadfx( "explosions/ceiling_rock_collapse_big" );
    level._effect["ceiling_rock_collapse_big_spread"] = loadfx( "explosions/ceiling_rock_collapse_big_rescue" );
    level._effect["ceiling_rock_collapse_huge"] = loadfx( "explosions/ceiling_rock_collapse_huge" );
    level._effect["ceiling_rock_collapse_huge_spread"] = loadfx( "explosions/ceiling_rock_collapse_huge_rescue" );
    level._effect["rpg_dirt_impact"] = loadfx( "impacts/dirt_large_prague_square" );
    level._effect["dlight_blue"] = loadfx( "misc/dlight_helicopter_cockpit" );
    level._effect["bodyshot1"] = loadfx( "impacts/flesh_hit" );
    level._effect["bodyshot2"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );
    level._effect["headshot1"] = loadfx( "impacts/flesh_hit_head_fatal_exit" );
    level._effect["headshot2"] = loadfx( "impacts/flesh_hit_head_fatal_exit" );
    level._effect["knife_stab"] = loadfx( "impacts/flesh_hit_knife" );
    level._effect["water_stop"] = loadfx( "misc/parabolic_water_stand" );
    level._effect["water_movement"] = loadfx( "misc/parabolic_water_movement" );
    level._effect["mechanical explosion"] = loadfx( "explosions/grenadeexp_default" );
}

_id_3E61()
{
    var_0 = getentarray( "redlight", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_3E62 );
}

_id_3E62()
{
    var_0 = 5000;

    for (;;)
    {
        self rotatevelocity( ( 0.0, 360.0, 0.0 ), var_0 );
        wait(var_0);
    }
}

_id_3E63()
{
    var_0 = getentarray( "horizonal_spinner", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_3E64 );
}
#using_animtree("animated_props");

_id_3E64()
{
    self useanimtree( #animtree );
    self setanim( %launchfacility_b_emergencylight, 1, 0.1, 1.0 );
}
