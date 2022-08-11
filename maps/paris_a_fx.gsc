// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread precachefx();
    _id_5018::main();
    maps\_shg_fx::_id_4445();
    maps\_vehicle::_id_29FE( "script_vehicle_btr80", "btr80", "vehicle_btr80", "fire/fire_med_pm_nolight_atlas", "TAG_CARGOFIRE", "fire_metal_medium", undefined, undefined, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_btr80", "btr80", "vehicle_btr80", "explosions/vehicle_explosion_btr80_physics_paris", "tag_deathfx", "exp_armor_vehicle" );
    common_scripts\utility::flag_init( "game_fx_started" );
    common_scripts\utility::flag_init( "msg_fx_in_bookstore" );
    common_scripts\utility::flag_init( "player_rooftop_jump_complete" );
    thread maps\_shg_fx::_id_445E( 1100, "msg_fx_zone1100" );
    thread maps\_shg_fx::_id_445E( 1110, "msg_fx_zone1110" );
    thread maps\_shg_fx::_id_445E( 1200, "msg_fx_zone1200", "msg_fx_zone1210" );
    thread maps\_shg_fx::_id_445E( 2000, "msg_fx_zone2000" );
    thread maps\_shg_fx::_id_445E( 2500, "msg_fx_zone2500" );
    thread maps\_shg_fx::_id_445E( 3000, "msg_fx_zone3000" );
    thread maps\_shg_fx::_id_445E( 3500, "msg_fx_zone3500", "msg_fx_zone3600" );
    thread maps\_shg_fx::_id_445E( 4000, "msg_fx_zone4000" );
    thread maps\_shg_fx::_id_445E( 5000, "msg_fx_zone5000" );
    thread maps\_shg_fx::_id_445E( 6000, "msg_fx_zone6000" );
    thread maps\_shg_fx::_id_445E( 110, "msg_fx_walkwind_10" );
    thread maps\_shg_fx::_id_445E( 201, "msg_fx_entrywind_01" );
    thread maps\_shg_fx::_id_445E( 202, "msg_fx_entrywind_02" );
    thread _id_501D();
    thread _id_501F();
    thread _id_476D();
    thread _id_5019();
    thread _id_501A();
    thread _id_4ABB();
    thread _id_4ABD();
    thread _id_5020();
    thread _id_4AC8();
    thread _id_5022();
    thread _id_4780();
    thread _id_4AC4();
    thread _id_5024();
    thread maps\_shg_fx::_id_4456();
    thread _id_4743();
}

precachefx()
{
    level._effect["wall_destruction"] = loadfx( "explosions/transformer_explosion" );
    level._effect["truck_sparks"] = loadfx( "misc/vehicle_scrape_sparks" );
    level._effect["large_vehicle_explosion"] = loadfx( "explosions/large_vehicle_explosion" );
    level._effect["ground_smoke_dcburning1200x1200"] = loadfx( "smoke/ground_smoke1200x1200_dcburning" );
    level._effect["firelp_small_pm"] = loadfx( "fire/firelp_small_pm" );
    level._effect["firelp_med_pm"] = loadfx( "fire/firelp_med_pm" );
    level._effect["firelp_large_pm"] = loadfx( "fire/firelp_large_pm" );
    level._effect["heli_strafe_impact"] = loadfx( "impacts/ac130_25mm_IR_impact" );
    level._effect["light_police_car"] = loadfx( "lights/light_blink_paris_police" );
    level._effect["fireball_smk_S"] = loadfx( "fire/fireball_lp_smk_S" );
    level._effect["ambient_explosion"] = loadfx( "maps/paris/ambient_explosion_paris" );
    level._effect["smoke_geotrail_genericexplosion"] = loadfx( "smoke/smoke_geotrail_genericexplosion_b" );
    level._effect["antiair_runner_flak_day"] = loadfx( "misc/antiair_runner_flak_day" );
    level._effect["antiair_runner_cloudy_paris"] = loadfx( "maps/paris/antiair_runner_cloudy_paris" );
    level._effect["battlefield_smk_directional_white_m_cheap"] = loadfx( "smoke/battlefield_smk_directional_white_m_cheap" );
    level._effect["battlefield_smk_directional_grey_m_cheap"] = loadfx( "smoke/battlefield_smk_directional_grey_m_cheap" );
    level._effect["amb_dust_small"] = loadfx( "smoke/amb_dust_small" );
    level._effect["amb_ash"] = loadfx( "smoke/amb_ash" );
    level._effect["firelp_small_pm"] = loadfx( "fire/firelp_small_pm" );
    level._effect["fire_flash"] = loadfx( "fire/fire_flash_small" );
    level._effect["embers_smokecolumn"] = loadfx( "fire/embers_smokecolumn" );
    level._effect["firelp_tiny"] = loadfx( "fire/firelp_small_pm_a" );
    level._effect["firelp_small_streak_pm_v_nolight"] = loadfx( "fire/firelp_small_streak_pm_v_nolight" );
    level._effect["fire_line_sm"] = loadfx( "fire/fire_line_sm" );
    level._effect["fire_line_sm_cheap"] = loadfx( "fire/fire_line_sm_cheap" );
    level._effect["fire_ceiling_md_slow"] = loadfx( "fire/fire_ceiling_md_slow" );
    level._effect["firelp_med_pm_nolight_atlas"] = loadfx( "fire/fire_med_pm_nolight_atlas" );
    level._effect["firelp_med_pm_atlas_nodist_cheap"] = loadfx( "fire/firelp_med_pm_atlas_nodist_cheap" );
    level._effect["fire_embers_directional_slow"] = loadfx( "fire/fire_embers_directional_slow" );
    level._effect["dust_wind_slow_paper_narrow"] = loadfx( "dust/dust_wind_slow_paper_narrow" );
    level._effect["dust_wind_slow_paper_narrow_flaming"] = loadfx( "dust/dust_wind_slow_paper_narrow_flaming" );
    level._effect["distant_ambient_dust"] = loadfx( "smoke/amb_smoke_distant_paris" );
    level._effect["cloud_ash_lite_london"] = loadfx( "weather/cloud_ash_lite_london" );
    level._effect["trash_spiral_runner"] = loadfx( "misc/trash_spiral_runner" );
    level._effect["insects_carcass_flies"] = loadfx( "misc/insects_carcass_flies" );
    level._effect["embers_burst_runner_mediumlife"] = loadfx( "fire/embers_burst_runner_mediumlife" );
    level._effect["steam_vent_small"] = loadfx( "smoke/steam_vent_small" );
    level._effect["powerline_runner_sound"] = loadfx( "explosions/powerline_runner_sound" );
    level._effect["electrical_transformer_spark_runner_loop"] = loadfx( "explosions/electrical_transformer_spark_runner_loop" );
    level._effect["falling_dirt_light_2"] = loadfx( "dust/falling_dirt_light_2" );
    level._effect["falling_dirt_light_2_runner"] = loadfx( "dust/falling_dirt_light_2_runner" );
    level._effect["falling_dirt_light_2_paris"] = loadfx( "dust/falling_dirt_light_2_paris" );
    level._effect["falling_dirt_light_2_runner_paris"] = loadfx( "dust/falling_dirt_light_2_runner_paris" );
    level._effect["lights_conelight_smokey"] = loadfx( "lights/lights_conelight_smokey" );
    level._effect["lights_godray_default"] = loadfx( "lights/lights_conelight_default" );
    level._effect["lights_uplight_haze"] = loadfx( "lights/lights_uplight_haze" );
    level._effect["window_explosion"] = loadfx( "explosions/window_explosion" );
    level._effect["fire_falling_localized_runner"] = loadfx( "fire/fire_falling_localized_runner_paris" );
    level._effect["ceiling_smoke_generic"] = loadfx( "smoke/ceiling_smoke_generic" );
    level._effect["ceiling_smoke_undulating"] = loadfx( "smoke/ceiling_smoke_undulating" );
    level._effect["thick_dark_smoke_giant_paris"] = loadfx( "smoke/thick_dark_smoke_giant_paris" );
    level._effect["thick_dark_smoke_giant_paris_oneshot"] = loadfx( "smoke/thick_dark_smoke_giant_paris" );
    level._effect["leaves_runner_1"] = loadfx( "misc/leaves_runner_1" );
    level._effect["leaves_fall_gentlewind"] = loadfx( "misc/leaves_fall_gentlewind" );
    level._effect["smoke_column_skybox_paris"] = loadfx( "maps/paris/smoke_column_skybox_paris" );
    level._effect["smoke_column_skybox_paris_oneshot"] = loadfx( "maps/paris/smoke_column_skybox_paris" );
    level._effect["skybox_mig29_flyby_manual_loop"] = loadfx( "misc/skybox_mig29_flyby_manual_loop" );
    level._effect["skybox_hind_flyby_loop"] = loadfx( "misc/skybox_hind_flyby" );
    level._effect["powerline_runner_cheap_paristv"] = loadfx( "explosions/powerline_runner_cheap_paristv" );
    level._effect["powerline_runner_cheap"] = loadfx( "explosions/powerline_runner_cheap" );
    level._effect["drips_faucet_fast"] = loadfx( "water/drips_faucet_fast" );
    level._effect["drips_faucet_slow"] = loadfx( "water/drips_faucet_slow" );
    level._effect["stove_burner_blue"] = loadfx( "misc/stove_burner_blue" );
    level._effect["steam_pot_small"] = loadfx( "smoke/steam_pot_small" );
    level._effect["embers_paris_alley"] = loadfx( "fire/embers_paris_alley" );
    level._effect["embers_spurt"] = loadfx( "fire/embers_spurt" );
    level._effect["lights_godray_beam"] = loadfx( "lights/lights_godray_beam" );
    level._effect["lights_godray_beam_bookstore"] = loadfx( "maps/paris/lights_godray_beam_bookstore" );
    level._effect["lighthaze_bookstore_window_lg"] = loadfx( "maps/paris/lighthaze_bookstore_window_lg" );
    level._effect["lighthaze_bookstore_window_sm"] = loadfx( "maps/paris/lighthaze_bookstore_window_sm" );
    level._effect["lighthaze_ledgewalk"] = loadfx( "maps/paris/lighthaze_ledgewalk" );
    level._effect["lighthaze_restaurant_window_lg"] = loadfx( "maps/paris/lighthaze_restaurant_window_lg" );
    level._effect["slava_missile_bg"] = loadfx( "maps/ny_harbor/smoke_geo_ssnm12_cheap_background" );
    level._effect["horizon_flash_runner"] = loadfx( "weather/horizon_flash_runner_harbor" );
    level._effect["flesh_hit"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );
    level._effect["poisonous_gas_paris_vertical"] = loadfx( "smoke/poisonous_gas_paris_vertical" );
    level._effect["poisonous_gas_paris_vertical_thin"] = loadfx( "smoke/poisonous_gas_paris_vertical_thin" );
    level._effect["poisonous_gas_paris_vertical_shadow"] = loadfx( "smoke/poisonous_gas_paris_vertical_shadow" );
    level._effect["poisonous_gas_ground_paris_200"] = loadfx( "smoke/poisonous_gas_ground_paris_200" );
    level._effect["poisonous_gas_ground_paris_200_light"] = loadfx( "smoke/poisonous_gas_ground_paris_200_light" );
    level._effect["poisonous_gas_ground_paris_200_sunlight"] = loadfx( "smoke/poisonous_gas_ground_paris_200_sunlight" );
    level._effect["poisonous_gas_ground_paris_200_bookstore"] = loadfx( "smoke/poisonous_gas_ground_paris_200_bookstore" );
    level._effect["poisonous_gas_wallCrawl_paris"] = loadfx( "smoke/poisonous_gas_wallCrawl_paris" );
    level._effect["poisonous_gas_wallCrawl_paris_light"] = loadfx( "smoke/poisonous_gas_wallCrawl_paris_light" );
    level._effect["poisonous_gas_paris_walkwind"] = loadfx( "smoke/poisonous_gas_paris_walkwind" );
    level._effect["poisonous_gas_paris_walkwind_dark"] = loadfx( "smoke/poisonous_gas_paris_walkwind_dark" );
    level._effect["poisonous_gas_paris_entrywind"] = loadfx( "smoke/poisonous_gas_paris_entrywind" );
    level._effect["poisonous_gas_paris_entrywind_shadow"] = loadfx( "smoke/poisonous_gas_paris_entrywind_shadow" );
    level._effect["poisonous_gas_paris_pillar1"] = loadfx( "smoke/poisonous_gas_paris_pillar1" );
    level._effect["poison_movement"] = loadfx( "impacts/footstep_poison" );
    level._effect["poison_movement_light"] = loadfx( "impacts/footstep_poison_light" );
    level._effect["poison_movement_sunlight"] = loadfx( "impacts/footstep_poison_sunlight" );
    level._effect["poison_movement_firelight"] = loadfx( "impacts/footstep_poison_firelight" );
    level._effect["poison_movement_dark_groundcover"] = loadfx( "impacts/footstep_poison_dark_groundcover" );
    level._effect["poisonous_gas_paris_flowing"] = loadfx( "smoke/poisonous_gas_paris_flowing" );
    level._effect["poisonous_gas_paris_flowing_far"] = loadfx( "smoke/poisonous_gas_paris_flowing_far" );
    level._effect["poisonous_gas_paris_truck_wreck"] = loadfx( "smoke/poisonous_gas_paris_truck_wreck" );
    level._effect["poisonous_gas_paris_flowing_down_small"] = loadfx( "smoke/poisonous_gas_paris_flowing_down_small" );
    level._effect["poisonous_gas_paris_flowing_down_tall"] = loadfx( "smoke/poisonous_gas_paris_flowing_down_tall" );
    level._effect["poisonous_gas_paris_flowing_down_impact"] = loadfx( "smoke/poisonous_gas_paris_flowing_down_impact" );
    level._effect["door_kick_poison_gas"] = loadfx( "dust/door_kick_poison_gas" );
    level._effect["smoke_column_intro_paris_a"] = loadfx( "maps/paris/smoke_column_intro_paris_a" );
    level._effect["smoke_column_intro_paris_blowaway"] = loadfx( "maps/paris/smoke_column_intro_paris_blowaway" );
    level._effect["papers_heli_landing"] = loadfx( "maps/paris/papers_heli_landing" );
    level._effect["ledge_window_smoke"] = loadfx( "maps/paris/ledge_window_smoke" );
    level._effect["ledge_footstep_dust"] = loadfx( "maps/paris/ledge_footstep_dust" );
    level._effect["monitor_flatscreen_explosion"] = loadfx( "explosions/monitor_flatscreen_explosion" );
    level._effect["water_drips_fat_fast_speed"] = loadfx( "water/water_drips_fat_fast_speed" );
    level._effect["water_drips_fat_slow_speed"] = loadfx( "water/water_drips_fat_slow_speed" );
    level._effect["drips_fast"] = loadfx( "misc/drips_fast" );
    level._effect["drips_slow"] = loadfx( "misc/drips_slow" );
    level._effect["steam_manhole_paris"] = loadfx( "maps/paris/steam_manhole_paris" );
    level._effect["steam_manhole_paris_ambient"] = loadfx( "maps/paris/steam_manhole_paris_ambient" );
    level._effect["littlebird_exhaust"] = loadfx( "distortion/littlebird_exhaust" );
    level._effect["tread_dust_paris"] = loadfx( "treadfx/tread_dust_paris" );
    level._effect["heli_dust_paris"] = loadfx( "treadfx/heli_dust_paris" );
    level._effect["scripted_flashbang"] = loadfx( "explosions/flashbang" );
    level._effect["vehicle_explosion_btr80_physics_paris"] = loadfx( "explosions/vehicle_explosion_btr80_physics_paris" );
    level._effect["btr_dest_blacksmoke"] = loadfx( "smoke/btr_dest_blacksmoke" );
    level._effect["russian_paratrp_jet"] = loadfx( "misc/russian_paratrp_jet" );
    level._effect["plate_shatter_single"] = loadfx( "props/plate_shatter_single" );
}

_id_4743()
{
    setsaveddvar( "fx_alphathreshold", 10 );
}

_id_5019()
{
    wait 0.1;
    maps\_shg_fx::_id_4468( "thick_dark_smoke_giant_paris_oneshot" );
    maps\_shg_fx::_id_4468( "smoke_column_skybox_paris_oneshot" );
}

_id_501A()
{
    wait 0.1;
    common_scripts\utility::flag_wait( "flag_little_bird_landed" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone1100" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone1200" );
    wait 10;
    maps\_shg_fx::_id_4468( "smoke_column_intro_paris_a" );
}

_id_501B()
{

}

_id_501C()
{
    for ( var_0 = 0; var_0 < 40; var_0++ )
    {
        playfxontag( common_scripts\utility::getfx( "littlebird_exhaust" ), self, "tag_engine" );
        wait 0.25;
    }
}

_id_501D()
{
    level common_scripts\utility::waitframe();
    var_0 = [ ( 6505.49, 5888.73, 1692.79 ), ( 11736.7, 6552.0, 1769.03 ), ( 11960.1, 5952.24, 1776.06 ), ( 13681.2, 4513.68, 1825.63 ), ( 13315.7, 3572.87, 1884.65 ), ( 13544.6, 4214.83, 1836.6 ), ( 11036.6, 2264.1, 1830.96 ), ( 10258.5, 1526.81, 1808.53 ), ( 9678.35, 1214.24, 1724.61 ), ( 9626.72, -82.2788, 1736.13 ), ( 8947.07, -145.142, 1736.68 ), ( 8170.38, -136.929, 1736.89 ), ( 6498.5, -464.099, 1652.66 ), ( 5680.61, -2832.2, 1909.47 ), ( 5092.5, -5765.18, 1940.72 ), ( 4612.75, -5638.95, 1931.07 ), ( 4143.7, -4824.45, 1953.98 ), ( 2694.37, -3235.55, 1480.88 ), ( 2067.73, -3247.95, 1382.59 ), ( 841.024, -3378.74, 1371.32 ), ( 251.777, -3501.85, 1499.74 ), ( -940.448, -3931.86, 1674.33 ), ( -1298.23, -3657.76, 1692.87 ), ( -1702.45, -2935.15, 1701.41 ), ( -2552.23, -3350.26, 1613.59 ), ( -2859.55, -4025.1, 1676.56 ), ( -3793.26, -5382.22, 1768.94 ), ( -2859.82, -5271.38, 1702.73 ), ( -2734.26, -5024.82, 1804.07 ), ( -3039.49, -5107.27, 1803.52 ), ( -4420.65, -4046.23, 1816.55 ), ( -4225.24, -4244.98, 1795.87 ), ( -4907.63, -3132.69, 1595.52 ), ( -5006.05, -2424.46, 1494.06 ), ( -5431.67, -2204.63, 1529.58 ), ( -5912.19, -2126.15, 1756.93 ), ( -6460.29, -2156.72, 1773.43 ), ( -7176.41, -1898.5, 1813.82 ), ( -8566.13, -1204.44, 1792.86 ), ( -8550.15, -896.05, 1617.95 ), ( -9252.61, -949.501, 1392.83 ), ( -10836.4, -2444.73, 1179.23 ), ( -11262.8, -2767.1, 1196.43 ), ( -12248.2, -1860.45, 1220.89 ), ( -12435.3, -1765.22, 1230.64 ), ( -14384.7, -1332.65, 1198.2 ), ( -14137.4, -1335.72, 1173.54 ), ( -18298.2, -1241.34, 801.097 ), ( -18710.9, -689.57, 886.749 ), ( -18432.1, 69.3459, 840.785 ), ( -17428.5, 231.543, 926.315 ), ( -15907.0, 292.558, 1060.87 ), ( -15723.7, 2789.99, 1156.64 ), ( -15718.6, 3213.07, 1166.79 ), ( -14544.0, 6514.53, 1189.67 ), ( -14432.8, 6557.28, 1275.29 ), ( -14328.8, 7188.14, 1145.89 ), ( -14307.0, 6970.36, 1228.98 ), ( -14848.0, 8598.96, 1146.96 ), ( -14464.1, 8901.04, 1267.1 ), ( -14560.0, 9334.39, 1144.12 ), ( -14245.5, 10160.9, 1117.66 ), ( -13912.2, 11016.2, 1043.69 ), ( -13933.5, 10835.1, 1146.92 ), ( -13222.2, 11547.7, 1176.94 ), ( -13434.5, 11244.6, 1279.34 ), ( -12380.0, 11506.8, 1091.53 ), ( -12808.1, 9254.62, 1054.09 ), ( -12507.6, 8862.31, 1085.23 ), ( -11674.0, 9018.09, 1269.91 ), ( -11174.9, 8862.37, 981.754 ), ( -10862.2, 8964.89, 1030.13 ), ( -10344.1, 9055.94, 1200.24 ), ( -9051.32, 9638.49, 1127.08 ), ( -9481.87, 8755.83, 1185.17 ), ( -8407.56, 8968.14, 1023.61 ), ( -7815.09, 8979.76, 1000.37 ), ( -7429.0, 8921.93, 1282.77 ), ( -6575.75, 8942.94, 1039.22 ), ( -6375.46, 8925.83, 1046.76 ), ( -4887.0, 9344.01, 1104.06 ), ( -4730.68, 8935.41, 1091.99 ), ( -4215.5, 8723.02, 1180.0 ), ( -2819.03, 8089.01, 1151.03 ), ( -2880.98, 7266.66, 1065.83 ), ( -3010.1, 6837.0, 1291.75 ), ( -2868.0, 6558.34, 1158.97 ), ( -3778.01, 4418.69, 1706.79 ), ( -3483.11, 3952.02, 1757.42 ), ( -3100.41, 3951.97, 1760.34 ), ( -3292.34, 2806.17, 1742.52 ), ( -3117.31, 2558.45, 1770.68 ), ( -2586.05, 2259.76, 1715.49 ), ( -960.534, 2296.68, 1610.08 ), ( -514.935, 2431.93, 1539.13 ), ( -553.36, 2101.79, 1602.13 ), ( -1257.94, 1138.38, 1799.95 ), ( 864.276, 2386.09, 1717.02 ), ( 1259.05, 2391.62, 1650.88 ), ( 2365.52, 3607.41, 1880.91 ), ( 3633.76, 5008.42, 1983.61 ), ( 4715.27, 4932.42, 1904.04 ), ( 5738.63, 5201.83, 1764.85 ), ( 6197.68, 5295.45, 1739.24 ), ( 6771.28, 5160.61, 1789.38 ), ( 7331.13, 5144.45, 1795.47 ), ( 8222.75, 5131.4, 1782.37 ), ( 8944.91, 5176.09, 1862.85 ), ( 9101.0, 4138.82, 1857.16 ), ( 9465.68, 4034.64, 1780.17 ), ( 10021.9, 7119.32, 1767.32 ), ( 10346.4, 6994.52, 1802.99 ), ( 10818.3, 6622.81, 1770.0 ), ( 11193.0, 5763.97, 1798.62 ) ];
    thread maps\_shg_fx::_id_4454( 10000, "smoke_geotrail_genericexplosion", 7, 500, 2000, 10, 30, 200, 75, 1200 );
    common_scripts\utility::flag_wait( "game_fx_started" );
    wait 5.0;

    for (;;)
    {
        var_1 = randomfloatrange( -0.5, 0.5 ) + 1.5;
        wait(var_1);
        var_2 = [];
        var_3 = level.player getplayerangles();
        var_4 = vectornormalize( anglestoforward( var_3 ) );
        var_5 = maps\_shg_fx::_id_446A( 10000 );
        var_6 = -1;
        var_7 = [];

        for ( var_8 = 0; var_8 < var_0.size; var_8++ )
        {
            if ( !isdefined( var_5 ) )
                continue;

            var_9 = vectornormalize( var_0[var_8] - level.player.origin );

            if ( vectordot( var_4, var_9 ) > 0.45 && distance( var_0[var_8], level.player.origin ) > 6000 )
            {
                var_6 = 1;
                var_7[var_7.size] = var_0[var_8];
            }
        }

        if ( var_6 > 0 )
        {
            var_10 = randomint( var_7.size + 1 );

            if ( isdefined( var_10 ) )
            {
                var_5.v["origin"] = var_7[var_10];

                if ( isdefined( var_5.v["origin"] ) && isdefined( var_5 ) )
                    common_scripts\utility::exploder( 10000 );

                maps\_audio::aud_send_msg( "msg_audio_fx_ambientExp", var_7[var_10] );
            }

            wait 1;
        }
    }
}

_id_476D()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = self.player getorigin();
    var_0.angles = ( 270.0, 0.0, -45.0 );

    if ( !isdefined( level._id_476E ) )
    {
        level._id_476E = 18;
        level._id_476F = 7;
    }

    wait 15.0;
    common_scripts\utility::flag_init( "enable_distant_bombShakes" );

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "msg_fx_in_bookstore" );
        common_scripts\utility::flag_wait( "enable_distant_bombShakes" );

        if ( common_scripts\utility::flag( "enable_distant_bombShakes" ) )
            _id_501E( var_0 );

        var_1 = randomfloatrange( level._id_476F * -1, level._id_476F ) + level._id_476E;
        wait(var_1);
    }
}

_id_501E( var_0, var_1 )
{
    maps\_audio::aud_send_msg( "generic_building_bomb_shake" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    maps\_shg_fx::_id_444F( "falling_dirt_light_2_paris", "viewmodel_medium", 0.127, 2, 0.3, 0.53, 1, var_1 );
}

_id_501F()
{
    level common_scripts\utility::waitframe();
    common_scripts\utility::flag_wait( "game_fx_started" );
    wait 5.0;
    common_scripts\utility::exploder( 10001 );
}

_id_4ABB()
{
    common_scripts\utility::waitframe();
    var_0 = spawnstruct();
    _id_4AC3( 999, var_0 );
    var_1 = var_0.v["ents"];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        thread _id_4ABC( var_1[var_2], "msg_fx_zone1100" );
}

_id_4ABC( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_1 );
    wait(randomfloat( 4 ));
    var_2 = anglestoright( var_0.v["angles"] ) * -50000 + var_0.v["origin"];
    var_3[0] = var_0.v["origin"];
    var_3[1] = var_2;
    var_3[2] = 25;
    maps\_audio::aud_send_msg( "fx_skybox_hind", var_3 );
    var_0 common_scripts\utility::activate_individual_exploder();

    for (;;)
    {
        common_scripts\utility::flag_wait( var_1 );
        wait(randomfloat( 6 ) + 10);
        var_0 common_scripts\utility::activate_individual_exploder();
        maps\_audio::aud_send_msg( "fx_skybox_hind", var_3 );
    }
}

_id_4ABD()
{
    common_scripts\utility::waitframe();
    var_0 = spawnstruct();
    _id_4AC3( 998, var_0 );
    var_1 = var_0.v["ents"];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        thread _id_4ABE( var_1[var_2], "msg_fx_zone1100" );
}

_id_4ABE( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_1 );
    wait(randomfloat( 4 ));
    var_2 = anglestoright( var_0.v["angles"] ) * -140000 + var_0.v["origin"] + ( 0.0, 0.0, 7000.0 );
    var_3[0] = var_0.v["origin"];
    var_3[1] = var_2;
    var_3[2] = 10;
    maps\_audio::aud_send_msg( "fx_skybox_mig", var_3 );
    var_0 common_scripts\utility::activate_individual_exploder();

    for (;;)
    {
        common_scripts\utility::flag_wait( var_1 );
        wait(randomfloat( 9 ) + 3);
        wait 2;
        var_0 common_scripts\utility::activate_individual_exploder();
        maps\_audio::aud_send_msg( "fx_skybox_mig", var_3 );
    }
}

_id_5020()
{
    common_scripts\utility::waitframe();
    var_0 = spawnstruct();
    _id_4AC3( 997, var_0 );
    var_1 = var_0.v["ents"];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        thread _id_5021( var_1[var_2], "msg_fx_zone1100" );
}

_id_5021( var_0, var_1 )
{
    common_scripts\utility::waitframe();
    var_2 = anglestoup( var_0.v["angles"] ) * 68250 + var_0.v["origin"];
    var_3[0] = var_0.v["origin"];
    var_3[1] = var_2;
    var_3[2] = 39;
    maps\_audio::aud_send_msg( "fx_paratrooper_jet", var_3 );
    var_0 common_scripts\utility::activate_individual_exploder();

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        common_scripts\utility::flag_wait( var_1 );
        wait 9;
        var_0 common_scripts\utility::activate_individual_exploder();
        maps\_audio::aud_send_msg( "fx_paratrooper_jet", var_3 );
    }
}

_id_5022()
{
    level common_scripts\utility::waitframe();
    common_scripts\utility::flag_wait( "flag_little_bird_landed" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone1100" );
    common_scripts\utility::exploder( 10002 );
}

_id_4AC8()
{
    common_scripts\utility::waitframe();
    var_0 = getentarray( "missile_launcher", "targetname" );
    var_1 = -1;
    var_2 = 0;

    for (;;)
    {
        common_scripts\utility::flag_wait( "msg_fx_zone1100" );

        while ( var_2 == var_1 )
        {
            var_2 = randomint( var_0.size );
            var_3 = var_0[var_2];
        }

        var_1 = var_2;
        thread _id_4AC9( var_0[var_2] );
        var_4 = randomfloat( 2.5 ) + 1;
        wait(var_4);
    }
}

_id_4AC9( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "tag_origin" );
    var_1.angles = var_0.angles;
    var_2[0] = var_1;
    maps\_audio::aud_send_msg( "pars_missile_launch", var_2 );
    playfxontag( common_scripts\utility::getfx( "slava_missile_bg" ), var_1, "tag_origin" );
    var_3 = 18000;
    var_4 = 130;
    var_5 = vectornormalize( anglestoforward( var_1.angles ) );
    var_6 = var_5;
    var_7 = var_6 * var_3 * 0.05;
    var_8 = ( 0.0, 0.0, -4.0 );
    var_9 = 0;

    while ( var_9 == 0 )
    {
        var_1.origin += var_7;
        var_7 += var_8;
        var_10 = vectornormalize( var_7 );
        var_11 = vectortoangles( var_10 );
        var_1.angles = var_11;
        level common_scripts\utility::waitframe();

        if ( var_1.origin[2] <= 0 )
            var_9 = 1;
    }

    stopfxontag( common_scripts\utility::getfx( "slava_missile_bg" ), var_1, "tag_origin" );
    playfx( common_scripts\utility::getfx( "horizon_flash_runner" ), var_1.origin );
    var_2[0] = var_1.origin;
    maps\_audio::aud_send_msg( "pars_missile_explode", var_2 );
    var_1 delete();
}

_id_4780()
{
    wait 0.1;
    var_0 = "treadfx/tread_dust_paris";
    var_1[0] = "script_vehicle_t72_tank";
    var_1[1] = "script_vehicle_gaz_tigr_harbor";

    foreach ( var_3 in var_1 )
    {
        maps\_treadfx::_id_28EF( var_3, "brick", var_0 );
        maps\_treadfx::_id_28EF( var_3, "bark", var_0 );
        maps\_treadfx::_id_28EF( var_3, "carpet", var_0 );
        maps\_treadfx::_id_28EF( var_3, "cloth", var_0 );
        maps\_treadfx::_id_28EF( var_3, "concrete", var_0 );
        maps\_treadfx::_id_28EF( var_3, "dirt", var_0 );
        maps\_treadfx::_id_28EF( var_3, "flesh", var_0 );
        maps\_treadfx::_id_28EF( var_3, "foliage", var_0 );
        maps\_treadfx::_id_28EF( var_3, "glass", var_0 );
        maps\_treadfx::_id_28EF( var_3, "grass", var_0 );
        maps\_treadfx::_id_28EF( var_3, "gravel", var_0 );
        maps\_treadfx::_id_28EF( var_3, "ice", var_0 );
        maps\_treadfx::_id_28EF( var_3, "metal", var_0 );
        maps\_treadfx::_id_28EF( var_3, "mud", var_0 );
        maps\_treadfx::_id_28EF( var_3, "paper", var_0 );
        maps\_treadfx::_id_28EF( var_3, "plaster", var_0 );
        maps\_treadfx::_id_28EF( var_3, "rock", var_0 );
        maps\_treadfx::_id_28EF( var_3, "sand", var_0 );
        maps\_treadfx::_id_28EF( var_3, "snow", var_0 );
        maps\_treadfx::_id_28EF( var_3, "wood", var_0 );
        maps\_treadfx::_id_28EF( var_3, "asphalt", var_0 );
        maps\_treadfx::_id_28EF( var_3, "ceramic", var_0 );
        maps\_treadfx::_id_28EF( var_3, "plastic", var_0 );
        maps\_treadfx::_id_28EF( var_3, "rubber", var_0 );
        maps\_treadfx::_id_28EF( var_3, "cushion", var_0 );
        maps\_treadfx::_id_28EF( var_3, "fruit", var_0 );
        maps\_treadfx::_id_28EF( var_3, "paintedmetal", var_0 );
        maps\_treadfx::_id_28EF( var_3, "riotshield", var_0 );
        maps\_treadfx::_id_28EF( var_3, "slush", var_0 );
        maps\_treadfx::_id_28EF( var_3, "default", var_0 );
        maps\_treadfx::_id_28EF( var_3, "none" );
    }

    var_5[0] = "script_vehicle_littlebird_bench";
    var_5[1] = "script_vehicle_mi17_woodland_fly";
    var_0 = "treadfx/heli_dust_paris";

    foreach ( var_7 in var_5 )
    {
        maps\_treadfx::_id_28EF( var_7, "brick", var_0 );
        maps\_treadfx::_id_28EF( var_7, "bark", var_0 );
        maps\_treadfx::_id_28EF( var_7, "carpet", var_0 );
        maps\_treadfx::_id_28EF( var_7, "cloth", var_0 );
        maps\_treadfx::_id_28EF( var_7, "concrete", var_0 );
        maps\_treadfx::_id_28EF( var_7, "dirt", var_0 );
        maps\_treadfx::_id_28EF( var_7, "flesh", var_0 );
        maps\_treadfx::_id_28EF( var_7, "foliage", var_0 );
        maps\_treadfx::_id_28EF( var_7, "glass", var_0 );
        maps\_treadfx::_id_28EF( var_7, "grass", var_0 );
        maps\_treadfx::_id_28EF( var_7, "gravel", var_0 );
        maps\_treadfx::_id_28EF( var_7, "ice", var_0 );
        maps\_treadfx::_id_28EF( var_7, "metal", var_0 );
        maps\_treadfx::_id_28EF( var_7, "mud", var_0 );
        maps\_treadfx::_id_28EF( var_7, "paper", var_0 );
        maps\_treadfx::_id_28EF( var_7, "plaster", var_0 );
        maps\_treadfx::_id_28EF( var_7, "rock", var_0 );
        maps\_treadfx::_id_28EF( var_7, "sand", var_0 );
        maps\_treadfx::_id_28EF( var_7, "snow", var_0 );
        maps\_treadfx::_id_28EF( var_7, "wood", var_0 );
        maps\_treadfx::_id_28EF( var_7, "asphalt", var_0 );
        maps\_treadfx::_id_28EF( var_7, "ceramic", var_0 );
        maps\_treadfx::_id_28EF( var_7, "plastic", var_0 );
        maps\_treadfx::_id_28EF( var_7, "rubber", var_0 );
        maps\_treadfx::_id_28EF( var_7, "cushion", var_0 );
        maps\_treadfx::_id_28EF( var_7, "fruit", var_0 );
        maps\_treadfx::_id_28EF( var_7, "paintedmetal", var_0 );
        maps\_treadfx::_id_28EF( var_7, "riotshield", var_0 );
        maps\_treadfx::_id_28EF( var_7, "slush", var_0 );
        maps\_treadfx::_id_28EF( var_7, "default", var_0 );
        maps\_treadfx::_id_28EF( var_7, "none" );
    }
}

_id_4AC4()
{
    var_0 = getentarray( "poison_wake_volume", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_4AC5 );
}

_id_4AC5()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 maps\_utility::_id_133C( "in_poison_volume" ) )
        {

        }
        else
            var_0 maps\_utility::_id_1402( "in_poison_volume" );

        if ( distancesquared( var_0.origin, level.player.origin ) < 9250000 )
        {
            if ( var_0 maps\_utility::_id_1008( "in_poison_volume" ) )
                continue;

            var_0 thread _id_4AC6( self );
            var_0 maps\_utility::_id_13DC( "in_poison_volume" );
        }
    }
}

_id_4AC6( var_0 )
{
    self endon( "death" );
    var_1 = 200;

    for (;;)
    {
        if ( self istouching( var_0 ) )
        {
            if ( var_1 > 0 )
                wait(max( 1 - var_1 / 120, 0.1 ));
            else
                wait 0.15;

            var_2 = var_0.script_fxid;

            if ( isplayer( self ) )
            {
                var_1 = distance( self getvelocity(), ( 0.0, 0.0, 0.0 ) );

                if ( var_1 < 5 )
                    var_2 = "null";
            }

            if ( isai( self ) )
            {
                var_1 = distance( self.velocity, ( 0.0, 0.0, 0.0 ) );

                if ( var_1 < 5 )
                    var_2 = "null";
            }

            if ( var_2 != "null" )
            {
                var_3 = self.origin + ( 0.0, 0.0, 64.0 );
                var_4 = self.origin - ( 0.0, 0.0, 150.0 );
                var_5 = bullettrace( var_3, var_4, 0, undefined );
                var_6 = common_scripts\utility::getfx( var_2 );
                var_3 = var_5["position"];
                var_7 = ( 0, self.angles[1], 0 );
                var_8 = anglestoforward( var_7 );
                var_9 = anglestoup( var_7 );
                playfx( var_6, var_3, var_9, var_8 );
            }

            continue;
        }

        maps\_utility::_id_13DE( "in_poison_volume" );
        return;
    }
}

_id_5023()
{
    self waittill( "death" );
    earthquake( 0.6, 2, self.origin, 1500 );
    var_0 = self.origin + anglestoforward( self.angles ) * ( 60.0, 0.0, 0.0 );
    physicsexplosionsphere( var_0, 64, 64, 3.5 );
    wait 2;
    playfxontag( common_scripts\utility::getfx( "electrical_transformer_spark_runner_loop" ), self, "tag_deathfx_hood" );
    playfxontag( common_scripts\utility::getfx( "firelp_tiny" ), self, "tag_deathfx_hood" );
    playfxontag( common_scripts\utility::getfx( "btr_dest_blacksmoke" ), self, "TAG_SIDESMOKE" );
}

_id_5024()
{
    var_0 = getentarray( "manual_bombshake", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_5025 );
}

_id_5025()
{
    self waittill( "trigger", var_0 );

    if ( common_scripts\utility::flag_exist( "enable_distant_bombshakes" ) )
        common_scripts\utility::flag_clear( "enable_distant_bombshakes" );

    maps\_audio::aud_send_msg( "aud_manual_bombshake_triggered" );
    _id_501E( level.player, 1 );
    wait 16;
    common_scripts\utility::flag_set( "enable_distant_bombShakes" );
}

_id_5026()
{
    common_scripts\utility::flag_wait( "msg_fx_zone1100" );

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );

    common_scripts\utility::flag_wait( "msg_fx_heli_smoke_touch" );
    wait 6.5;

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 0 );
}

_id_4AC3( var_0, var_1 )
{
    var_2 = [];
    var_3 = [];
    var_4 = [];
    var_5 = maps\_shg_fx::_id_4446( var_0 );

    foreach ( var_7 in var_5 )
    {
        var_2[var_2.size] = var_7.v["origin"];
        var_3[var_3.size] = var_7.v["angles"];
        var_4[var_4.size] = var_7;
    }

    var_1.v["origins"] = var_2;
    var_1.v["angles"] = var_3;
    var_1.v["ents"] = var_4;
}
