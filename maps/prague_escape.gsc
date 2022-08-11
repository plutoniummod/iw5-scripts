// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_56FB();
    _id_4D6D();
    _id_7D73();
    _id_7D75();
    _id_766A();
    maps\createart\prague_escape_art::main();
    maps\prague_scape_fx::main();
    maps\prague_escape_precache::main();
    maps\prague_escape_anim::main();
    _id_7D76();
    maps\_load::main();
    level thread maps\prague_escape_amb::main();
    level thread _id_7B5C();
    maps\_molotov::init();
    _id_64AB();
    _id_7D74();
    level.player disableweapons();
}

_id_7B5C()
{
    common_scripts\utility::flag_wait( "queue_sniper_music" );
    maps\_utility::_id_1428( "prague_escape_sniper_mx", 1 );
    common_scripts\utility::flag_wait( "queue_player_carry_music" );
    maps\_utility::_id_1428( "prague_escape_player_carry_mx", 1 );
    common_scripts\utility::flag_wait( "queue_price_carry_music" );
    maps\_utility::_id_1428( "prague_escape_price_carry_mx", 1 );
    common_scripts\utility::flag_wait( "queue_defend_music" );
    maps\_utility::_id_1428( "prague_escape_plaza_defend_mx", 1 );
    common_scripts\utility::flag_wait( "queue_soap_death_music" );
    maps\_utility::_id_1428( "prague_escape_soap_death_mx", 1 );
}

_id_56FB()
{
    maps\_load::_id_1F5C( "viewhands_player_yuri_europe" );
    vehicle_scripts\_suburban::main( "vehicle_suburban", undefined, "script_vehicle_suburban" );
    maps\prague_escape_code::_id_7A49();
    precachestring( &"PRAGUE_ESCAPE_WATCH_PRICE_LOOK" );
    precachestring( &"PRAGUE_ESCAPE_PICK_UP_SOAP" );
    precachestring( &"PRAGUE_ESCAPE_PICK_UP" );
    precachestring( &"PRAGUE_ESCAPE_FOLLOW_PRICE" );
    precachestring( &"PRAGUE_ESCAPE_SET_SOAP_DOWN" );
    precachestring( &"PRAGUE_ESCAPE_SET_DOWN" );
    precachestring( &"PRAGUE_ESCAPE_WATCH_CONVOY" );
    precachestring( &"PRAGUE_ESCAPE_FIND_PRICE" );
    precachestring( &"PRAGUE_ESCAPE_BALCONY_SNIPE" );
    precachestring( &"PRAGUE_ESCAPE_PROTECT_SOAP" );
    precachestring( &"PRAGUE_ESCAPE_PROTECT" );
    precachestring( &"PRAGUE_ESCAPE_CLEAR_ROOM" );
    precachestring( &"PRAGUE_ESCAPE_OPEN_DOOR" );
    precachestring( &"PRAGUE_ESCAPE_REVENGE_MAKAROV" );
    precachestring( &"PRAGUE_ESCAPE_STOP_MASSACRE" );
    precachemodel( "vehicle_shadow_suburban" );
    precachemodel( "pigeon_iw5" );
    precachemodel( "weapon_m82_MG_Setup" );
    precachemodel( "viewmodel_rsass_sp_iw5" );
    precachemodel( "tag_origin_animate" );
    precachemodel( "weapon_us_smoke_grenade" );
    precachemodel( "prop_journal" );
    precachemodel( "com_office_chair_killhouse" );
    precachemodel( "paris_debris_burnt_wood_panels_05" );
    precachemodel( "debris_rubble_chunk_09" );
    precachemodel( "ny_debris_rubble_chunk_01" );
    precachemodel( "debris_wood_shard_large" );
    precachemodel( "debris_wood_shard_med" );
    precacheitem( "m4m203_reflex" );
    precacheitem( "m203_m4" );
    precacheitem( "rpg_straight" );
    precacheitem( "p99" );
    precacheitem( "p99_airport_flashback" );
    precacheitem( "nosound_magicbullet" );
    precacheitem( "flash_grenade" );
    precacheitem( "fraggrenade" );
    precacheitem( "g36c" );
    precacheitem( "pecheneg" );
    precacheitem( "ak74u" );
    precacheitem( "btr80_ac130_turret" );
    precachemodel( "weapon_walther_p99" );
    precachemodel( "viewmodel_walther_p99" );
    precachemodel( "body_complete_onearm_sp_zakhaev" );
    precachemodel( "com_gold_brick_case" );
    precachemodel( "prop_car_flag" );
    precachemodel( "hjk_cell_phone_off" );
    precachemodel( "vehicle_uaz_covered_destructible" );
    precachemodel( "body_tf141_assault_a" );
    precachemodel( "head_hero_price_desert" );
    precachemodel( "body_secret_service_assault_a" );
    precachemodel( "body_urban_civ_male_bb" );
    precachemodel( "body_urban_civ_male_ba" );
    precachemodel( "body_slum_civ_female_ba" );
    precachemodel( "head_city_civ_female_a_drone" );
    precachemodel( "head_city_civ_male_a_drone" );
    precachemodel( "body_complete_civilian_suit_male_1" );
    precachemodel( "body_urban_civ_male_aa" );
    precachemodel( "body_urban_civ_male_ac" );
    precachemodel( "body_urban_civ_male_bc" );
    precachemodel( "head_opforce_fsb_a" );
    precachemodel( "head_prague_civ_hero_male_d" );
    precachemodel( "head_secret_service_b" );
    precachemodel( "head_prague_civ_hero_male_a" );
    precachemodel( "head_prague_civ_hero_male_b" );
    precachemodel( "head_prague_civ_hero_male_c" );
    precachemodel( "viewhands_player_yuri_airport" );
    precachemodel( "viewhands_yuri_airport" );
    precachemodel( "viewhands_player_airport" );
    precachemodel( "viewhands_player_russian_c" );
    precachemodel( "viewhands_player_russian_b" );
    precacherumble( "heavy_1s" );
    precacherumble( "heavy_2s" );
    precacherumble( "heavy_3s" );
    precacherumble( "light_1s" );
    precacherumble( "light_2s" );
    precacherumble( "light_3s" );
    precacherumble( "grenade_rumble" );
    precacherumble( "tank_rumble" );
    precacheshellshock( "slowview" );
    precacheshellshock( "prague_escape" );
    precacheshellshock( "prague_escape_airport" );
    precacheshellshock( "prague_escape_flashback" );
    precacheshader( "overlay_flashback_blur" );
    maps\_utility::add_hint_string( "barrett", &"PRAGUE_ESCAPE_PRESS_FORWARDS_OR_BACKWARDS" );
    maps\_utility::add_hint_string( "save_soap", &"PRAGUE_ESCAPE_SOAP_DEATH_OBJ" );
    precachestring( &"PRAGUE_ESCAPE_HINT_CRAWL_RIGHT" );
    maps\_utility::add_hint_string( "HINT_crawl_right", &"PRAGUE_ESCAPE_HINT_CRAWL_RIGHT", maps\prague_escape_flashback_airport_code::_id_7CF3 );
    precachestring( &"PRAGUE_ESCAPE_HINT_CRAWL_LEFT" );
    maps\_utility::add_hint_string( "HINT_crawl_left", &"PRAGUE_ESCAPE_HINT_CRAWL_LEFT", maps\prague_escape_flashback_airport_code::_id_7CF4 );
}

_id_4D6D()
{
    common_scripts\utility::flag_init( "statue_go" );
    common_scripts\utility::flag_init( "dumpster_go" );
    common_scripts\utility::flag_init( "player_left_statue" );
    common_scripts\utility::flag_init( "defend_go" );
    common_scripts\utility::flag_init( "FLAG_attack_button_pressed" );
    common_scripts\utility::flag_init( "FLAG_ads_button_pressed" );
    common_scripts\utility::flag_init( "FLAG_store_soap_sitting_at_statue" );
    common_scripts\utility::flag_init( "FLAG_street_soap_sitting_by_mailbox" );
    maps\prague_escape_code::_id_7A3A();
    maps\prague_escape_sniper::_id_7AA9();
    maps\prague_escape_scaffold::_id_7AA9();
    maps\prague_escape_soap_carry::_id_7AA9();
    maps\prague_escape_dumpster::_id_7B87();
    maps\prague_escape_store::_id_7BB6();
    maps\prague_escape_statue::_id_7D6F();
    maps\prague_escape_bank::_id_7BDF();
    maps\prague_escape_defend::_id_7C11();
    maps\prague_escape_medic::_id_7BE5();
    maps\prague_escape_to_cellar::_id_7CC4();
    maps\prague_escape_flashback_sniper::_id_7C8C();
    maps\prague_escape_flashback_nuke::_id_7CD8();
    maps\prague_escape_flashback_airport::_id_7D09();
    maps\prague_escape_outro::_id_7CD2();
}

_id_7D73()
{
    level._id_7A43 = 0;
    soundsettimescalefactor( "Music", 0 );
    soundsettimescalefactor( "Menu", 0 );
    soundsettimescalefactor( "local3", 0.0 );
    soundsettimescalefactor( "Mission", 0.0 );
    soundsettimescalefactor( "Announcer", 0.0 );
    soundsettimescalefactor( "Bulletimpact", 0.6 );
    soundsettimescalefactor( "Voice", 0.3 );
    soundsettimescalefactor( "norestrict", 0.2 );
    soundsettimescalefactor( "norestrict2d", 0.2 );
    soundsettimescalefactor( "local", 0.4 );
    soundsettimescalefactor( "physics", 0.2 );
    soundsettimescalefactor( "ambient", 0.4 );
    soundsettimescalefactor( "auto", 0.5 );
}

_id_64AB()
{
    maps\prague_escape_dumpster::_id_7B8A();
    maps\prague_escape_store::_id_7BB8();
    maps\prague_escape_statue::_id_7D70();
    maps\prague_escape_bank::_id_7BE0();
    maps\prague_escape_defend::_id_7C50();
}

_id_7D74()
{
    maps\prague_escape_dumpster::_id_7B8B();
    maps\prague_escape_statue::_id_7D71();
    maps\prague_escape_defend::_id_7C7D();
}

_id_7D75()
{

}

_id_766A()
{
    maps\_utility::_id_26A9( "sniper" );
    maps\_utility::_id_1E74( "sniper", maps\prague_escape_sniper::_id_7395, "Sniper Tower", maps\prague_escape_sniper::_id_7AA7 );
    maps\_utility::_id_1E74( "scaffold", maps\prague_escape_scaffold::_id_7B3A, "Scaffolding Fall", maps\prague_escape_scaffold::_id_7B3B );
    maps\_utility::_id_1E74( "soap_carry", maps\prague_escape_soap_carry::_id_7AF8, "Soap Carry", maps\prague_escape_soap_carry::_id_7AF9 );
    maps\_utility::_id_1E74( "dumpster", maps\prague_escape_dumpster::_id_7B5B, "Dumpster to Store", maps\prague_escape_dumpster::_id_7B5D );
    maps\_utility::_id_1E74( "store", maps\prague_escape_store::_id_7B94, "Store to Statue", maps\prague_escape_store::_id_7B95 );
    maps\_utility::_id_1E74( "statue", maps\prague_escape_statue::_id_7D59, "Statue to Bank", maps\prague_escape_statue::_id_7D5A );
    maps\_utility::_id_1E74( "bank", maps\prague_escape_bank::_id_7BB9, "Bank to Plaza", maps\prague_escape_bank::_id_7BBA );
    maps\_utility::_id_1E74( "defend", maps\prague_escape_defend::_id_7C12, "Plaza Defend", maps\prague_escape_defend::_id_7C15 );
    maps\_utility::_id_1E74( "resistance_carry", maps\prague_escape_defend::_id_7C13, "Resistance Carry Soap", maps\prague_escape_defend::_id_7C14 );
    maps\_utility::_id_1E74( "medic", maps\prague_escape_medic::_id_7BE1, "Medic", maps\prague_escape_medic::_id_7BE4 );
    maps\_utility::_id_1E74( "to_cellar", maps\prague_escape_to_cellar::_id_7CC2, "To Cellar", maps\prague_escape_to_cellar::_id_7CC5 );
    maps\_utility::_id_1E74( "flashback_sniper", maps\prague_escape_flashback_sniper::_id_7C83, "Flashback: Sniper", maps\prague_escape_flashback_sniper::_id_7C84 );
    maps\_utility::_id_1E74( "flashback_nuke", maps\prague_escape_flashback_nuke::_id_7CD7, "Flashback: Nuke", maps\prague_escape_flashback_nuke::_id_7CD9 );
    maps\_utility::_id_1E74( "flashback_airport", maps\prague_escape_flashback_airport::_id_7D08, "Flashback: Airport", maps\prague_escape_flashback_airport::_id_7D0A );
    maps\_utility::_id_1E74( "outro", maps\prague_escape_outro::_id_7CD0, "Outro", maps\prague_escape_outro::_id_7CD1 );
}

_id_7D76()
{
    level thread _id_7D77();
    level thread _id_7D78();
    level thread _id_7D79();
    level thread _id_7D7A();
}

_id_7D77()
{
    level waittill( "fxanim_test_hotel_explosion" );
    common_scripts\utility::exploder( 160 );
    var_0 = getent( "fxanim_prague2_hotel_mod", "targetname" );
    var_0._id_1032 = "hotel_columns";
    var_0 useanimtree( level._id_1245["script_model"] );
    var_0 thread maps\_anim::_id_1246( var_0, "hotel_explode" );
}

_id_7D78()
{
    level waittill( "fxanim_test_belltower_explosion" );
    maps\prague_escape_scaffold::_id_7B4B( level.player );
    maps\prague_escape_scaffold::_id_7B4C( level.player );
    maps\prague_escape_scaffold::_id_7B4D( level.player );
}

_id_7D79()
{
    var_0 = getent( "fxanim_rpg_wall", "targetname" );
    var_0 hide();
    var_1 = getentarray( "esc_wall_clean_01", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 hide();

    level waittill( "fxanim_test_rpg_wall" );
    var_0 = getent( "fxanim_rpg_wall", "targetname" );
    var_0 show();
    var_0 useanimtree( level._id_1245["script_model"] );
    var_0._id_1032 = "rpg_wall";
    var_0 thread maps\_anim::_id_1246( var_0, "rpg_wall_explode" );
    common_scripts\utility::exploder( 250 );
    var_1 = getentarray( "esc_wall_destroy_01", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 hide();

    var_7 = getentarray( "esc_wall_clean_01", "targetname" );

    foreach ( var_3 in var_7 )
        var_3 show();
}

_id_7D7A()
{
    var_0 = getent( "fxanim_exit_wall", "targetname" );
    var_0 hide();
    var_1 = getentarray( "apt_wall_destroyed", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 hide();

    level waittill( "fxanim_test_m203_wall" );
    var_5 = common_scripts\utility::getstruct( "exit_wall_struct", "targetname" );
    var_0 moveto( var_5.origin, 0.05 );
    maps\prague_escape_soap_carry::_id_7B39();
    common_scripts\utility::exploder( 280 );
    var_0 show();
    var_0 useanimtree( level._id_1245["script_model"] );
    var_0._id_1032 = "exit_wall";
    var_0 maps\_anim::_id_1246( var_0, "exit_wall_explode" );
    var_1 = getentarray( "apt_wall_destroyed", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 show();

    var_8 = getentarray( "apt_wall_clean", "targetname" );

    foreach ( var_10 in var_8 )
        var_10 delete();
}
