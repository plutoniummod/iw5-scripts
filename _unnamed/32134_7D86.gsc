// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    var_0 = maps\_utility::create_vision_set_fog( "hamburg" );
    var_0.startdist = 108.978;
    var_0.halfwaydist = 6098.16;
    var_0.red = 0.555083;
    var_0.green = 0.516596;
    var_0.blue = 0.488973;
    var_0.maxopacity = 0.428619;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0._id_1AF0 = 0.741022;
    var_0._id_1AF1 = 0.654154;
    var_0._id_1AF2 = 0.503102;
    var_0._id_1AF3 = ( 0.807453, -0.107477, 0.580059 );
    var_0._id_1AF4 = 31.2405;
    var_0._id_1AF5 = 46.9162;
    var_0._id_1AF6 = 0.91799;
    var_0 = maps\_utility::create_vision_set_fog( "hamburg_garage" );
    var_0.startdist = 636.105;
    var_0.halfwaydist = 8145.02;
    var_0.red = 0.495015;
    var_0.green = 0.554261;
    var_0.blue = 0.454984;
    var_0.maxopacity = 0.641317;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 0;
    var_0 = maps\_utility::create_vision_set_fog( "hamburg_landing" );
    var_0.startdist = 108.978;
    var_0.halfwaydist = 6098.16;
    var_0.red = 0.555083;
    var_0.green = 0.516596;
    var_0.blue = 0.488973;
    var_0.maxopacity = 0.964131;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0._id_1AF0 = 0.741022;
    var_0._id_1AF1 = 0.654154;
    var_0._id_1AF2 = 0.503102;
    var_0._id_1AF3 = ( 0.807453, -0.107477, 0.580059 );
    var_0._id_1AF4 = 31.2405;
    var_0._id_1AF5 = 46.9162;
    var_0._id_1AF6 = 0.91799;
    var_0 = maps\_utility::create_vision_set_fog( "hamburg_garage_inside_tank" );
    var_0.startdist = 0;
    var_0.halfwaydist = 734.528;
    var_0.red = 0.586333;
    var_0.green = 0.547846;
    var_0.blue = 0.512411;
    var_0.maxopacity = 0.0209443;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0._id_1AF0 = 0.391866;
    var_0._id_1AF1 = 0.247685;
    var_0._id_1AF2 = 0.186887;
    var_0._id_1AF3 = ( 0.807453, -0.107477, 0.580059 );
    var_0._id_1AF4 = 8;
    var_0._id_1AF5 = 145.938;
    var_0._id_1AF6 = 6.33423;
    var_0 = maps\_utility::create_vision_set_fog( "hamburg_end_building" );
    var_0.startdist = 3764.17;
    var_0.halfwaydist = 19391;
    var_0.red = 0.661137;
    var_0.green = 0.554261;
    var_0.blue = 0.454014;
    var_0.maxopacity = 0.7;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 0;
    maps\_utility::vision_set_fog_changes( "hamburg", 0 );
}
