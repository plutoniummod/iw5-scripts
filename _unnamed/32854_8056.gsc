// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    var_0 = maps\_utility::create_vision_set_fog( "castle_intro" );
    var_0.startdist = 1000;
    var_0.halfwaydist = 6000;
    var_0.red = 0.218899;
    var_0.green = 0.286112;
    var_0.blue = 0.330931;
    var_0.maxopacity = 0.62;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0._id_1AF0 = 0.4;
    var_0._id_1AF1 = 0.47;
    var_0._id_1AF2 = 0.47;
    var_0._id_1AF3 = ( 0.0, 0.0, -1.0 );
    var_0._id_1AF4 = 30;
    var_0._id_1AF5 = 60;
    var_0._id_1AF6 = 2;
    var_0 = maps\_utility::create_vision_set_fog( "castle_exterior" );
    var_0.startdist = 1000;
    var_0.halfwaydist = 6000;
    var_0.red = 0.218899;
    var_0.green = 0.286112;
    var_0.blue = 0.330931;
    var_0.maxopacity = 0.62;
    var_0.transitiontime = 0.5;
    var_0.sunfogenabled = 1;
    var_0._id_1AF0 = 0.4;
    var_0._id_1AF1 = 0.47;
    var_0._id_1AF2 = 0.47;
    var_0._id_1AF3 = ( 0.0, 0.0, -1.0 );
    var_0._id_1AF4 = 70;
    var_0._id_1AF5 = 90;
    var_0._id_1AF6 = 5;
    var_0 = maps\_utility::create_vision_set_fog( "castle_light_switch" );
    var_0.startdist = 1000;
    var_0.halfwaydist = 6000;
    var_0.red = 0.31;
    var_0.green = 0.32;
    var_0.blue = 0.32;
    var_0.maxopacity = 0.62;
    var_0.transitiontime = 0.5;
    var_0.sunfogenabled = 1;
    var_0._id_1AF6 = 0;
    var_0._id_1AF0 = 0.4;
    var_0._id_1AF1 = 0.47;
    var_0._id_1AF2 = 0.47;
    var_0._id_1AF3 = ( 0.0, 0.0, -1.0 );
    var_0._id_1AF4 = 88;
    var_0._id_1AF5 = 97;
    var_0._id_1AF6 = 0;
    var_0 = maps\_utility::create_vision_set_fog( "castle_interior" );
    var_0.startdist = 1000;
    var_0.halfwaydist = 6000;
    var_0.red = 0.31;
    var_0.green = 0.32;
    var_0.blue = 0.32;
    var_0.maxopacity = 0.62;
    var_0.transitiontime = 0.5;
    var_0.sunfogenabled = 1;
    var_0._id_1AF6 = 0.5;
    var_0._id_1AF0 = 0.4;
    var_0._id_1AF1 = 0.47;
    var_0._id_1AF2 = 0.47;
    var_0._id_1AF3 = ( 0.0, 0.0, -1.0 );
    var_0._id_1AF4 = 88;
    var_0._id_1AF5 = 97;
    var_0._id_1AF6 = 1.5;
    var_0 = maps\_utility::create_vision_set_fog( "castle_courtyard" );
    var_0.startdist = 1000;
    var_0.halfwaydist = 6000;
    var_0.red = 0.218899;
    var_0.green = 0.286112;
    var_0.blue = 0.330931;
    var_0.maxopacity = 0.62;
    var_0.transitiontime = 0.5;
    var_0.sunfogenabled = 1;
    var_0._id_1AF0 = 0.4;
    var_0._id_1AF1 = 0.47;
    var_0._id_1AF2 = 0.47;
    var_0._id_1AF3 = ( 0.0, 0.0, -1.0 );
    var_0._id_1AF4 = 70;
    var_0._id_1AF5 = 90;
    var_0._id_1AF6 = 5;
    var_0 = maps\_utility::create_vision_set_fog( "castle_forest" );
    var_0.startdist = 3764.17;
    var_0.halfwaydist = 19391;
    var_0.red = 0.661137;
    var_0.green = 0.554261;
    var_0.blue = 0.454014;
    var_0.maxopacity = 0.7;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 0;
    var_0 = maps\_utility::create_vision_set_fog( "castle_nvg_grain" );
    var_0.startdist = 5000;
    var_0.halfwaydist = 8000;
    var_0.red = 0;
    var_0.green = 0;
    var_0.blue = 0;
    var_0.maxopacity = 0;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 0;
    maps\_utility::vision_set_fog_changes( "castle_intro", 0 );
}
