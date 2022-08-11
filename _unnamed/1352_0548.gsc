// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

init()
{
    level._id_200D["allies"]["stand"]["idle"] = %casual_stand_idle;
    level._id_200D["allies"]["stand"]["run"] = %run_lowready_f_relative;
    level._id_200D["allies"]["stand"]["death"] = %exposed_death;
    level._id_200D["allies"]["covercrouch"]["idle"][0] = %covercrouch_hide_idle;
    level._id_200D["allies"]["covercrouch"]["idle"][1] = %covercrouch_twitch_1;
    level._id_200D["allies"]["covercrouch"]["idle"][2] = %covercrouch_twitch_2;
    level._id_200D["allies"]["covercrouch"]["idle"][3] = %covercrouch_twitch_3;
    level._id_200D["allies"]["covercrouch"]["idle"][4] = %covercrouch_hide_look;
    level._id_200D["allies"]["covercrouch"]["hide_2_aim"] = %covercrouch_hide_2_aim;
    level._id_200D["allies"]["covercrouch"]["aim_2_hide"] = %covercrouch_aim_2_hide;
    level._id_200D["allies"]["covercrouch"]["reload"] = %covercrouch_reload_hide;
    level._id_200D["allies"]["covercrouch"]["fire"] = %covercrouch_aim5;
    level._id_200D["allies"]["covercrouch"]["death"] = %covercrouch_death_1;
    level._id_200D["allies"]["covercrouch"]["pop_up_chance"] = 1;
    level._id_200D["allies"]["coverstand"]["idle"][0] = %coverstand_hide_idle;
    level._id_200D["allies"]["coverstand"]["idle"][1] = %coverstand_look_quick;
    level._id_200D["allies"]["coverstand"]["idle"][2] = %coverstand_look_quick_v2;
    level._id_200D["allies"]["coverstand"]["idle"][3] = %coverstand_hide_idle_twitch04;
    level._id_200D["allies"]["coverstand"]["idle"][4] = %coverstand_hide_idle_twitch05;
    level._id_200D["allies"]["coverstand"]["hide_2_aim"] = %coverstand_hide_2_aim;
    level._id_200D["allies"]["coverstand"]["aim_2_hide"] = %coverstand_aim_2_hide;
    level._id_200D["allies"]["coverstand"]["reload"] = %coverstand_reloada;
    level._id_200D["allies"]["coverstand"]["fire"] = %exposed_aim_5;
    level._id_200D["allies"]["coverstand"]["death"] = %coverstand_death_left;
    level._id_200D["allies"]["coverstand"]["pop_up_chance"] = 1;
    level._id_200D["allies"]["coverleftstand"]["idle"][0] = %corner_standl_alert_idle;
    level._id_200D["allies"]["coverleftstand"]["idle"][1] = %corner_standl_alert_twitch01;
    level._id_200D["allies"]["coverleftstand"]["idle"][2] = %corner_standl_alert_twitch02;
    level._id_200D["allies"]["coverleftstand"]["idle"][3] = %corner_standl_alert_twitch03;
    level._id_200D["allies"]["coverleftstand"]["idle"][4] = %corner_standl_alert_twitch04;
    level._id_200D["allies"]["coverleftstand"]["hide_2_aim"] = %corner_standl_trans_alert_2_b_v2;
    level._id_200D["allies"]["coverleftstand"]["aim_2_hide"] = %corner_standl_trans_b_2_alert_v2;
    level._id_200D["allies"]["coverleftstand"]["reload"] = %corner_standl_reload_v1;
    level._id_200D["allies"]["coverleftstand"]["fire"] = %exposed_aim_5;
    level._id_200D["allies"]["coverleftstand"]["death"] = %corner_standl_deathb;
    level._id_200D["allies"]["coverleftstand"]["pop_up_chance"] = 1;
    level._id_200D["allies"]["coverrightstand"]["idle"][0] = %corner_standr_alert_idle;
    level._id_200D["allies"]["coverrightstand"]["idle"][1] = %corner_standr_alert_twitch01;
    level._id_200D["allies"]["coverrightstand"]["idle"][2] = %corner_standr_alert_twitch02;
    level._id_200D["allies"]["coverrightstand"]["idle"][3] = %corner_standr_alert_twitch04;
    level._id_200D["allies"]["coverrightstand"]["hide_2_aim"] = %corner_standr_trans_alert_2_b;
    level._id_200D["allies"]["coverrightstand"]["aim_2_hide"] = %corner_standr_trans_b_2_alert;
    level._id_200D["allies"]["coverrightstand"]["reload"] = %corner_standr_reload_v1;
    level._id_200D["allies"]["coverrightstand"]["fire"] = %exposed_aim_5;
    level._id_200D["allies"]["coverrightstand"]["death"] = %corner_standr_deathb;
    level._id_200D["allies"]["coverrightstand"]["pop_up_chance"] = 1;
    level._id_200D["allies"]["coverrightcrouch"]["idle"][0] = %cornercrr_alert_idle;
    level._id_200D["allies"]["coverrightcrouch"]["idle"][1] = %cornercrr_alert_twitch_v1;
    level._id_200D["allies"]["coverrightcrouch"]["idle"][2] = %cornercrr_alert_twitch_v2;
    level._id_200D["allies"]["coverrightcrouch"]["idle"][3] = %cornercrr_alert_twitch_v3;
    level._id_200D["allies"]["coverrightcrouch"]["hide_2_aim"] = %cornercrr_alert_2_lean;
    level._id_200D["allies"]["coverrightcrouch"]["aim_2_hide"] = %cornercrr_lean_2_alert;
    level._id_200D["allies"]["coverrightcrouch"]["reload"] = %cornercrr_reloada;
    level._id_200D["allies"]["coverrightcrouch"]["death"] = %exposed_crouch_death_fetal;
    level._id_200D["allies"]["coverrightcrouch"]["pop_up_chance"] = 1;
    level._id_200D["allies"]["coverguard"]["idle"][0] = %exposed_crouch_idle_twitch_v2;
    level._id_200D["allies"]["coverguard"]["idle"][1] = %exposed_crouch_idle_twitch_v3;
    level._id_200D["allies"]["coverguard"]["reload"] = %exposed_crouch_reload;
    level._id_200D["allies"]["coverguard"]["fire"] = %exposed_crouch_aim_5;
    level._id_200D["allies"]["coverguard"]["death"] = %exposed_crouch_death_fetal;
    level._id_200D["allies"]["coverguard"]["pop_up_chance"] = 0;
    level._id_200D["allies"]["coverprone"]["idle"][0] = %prone_reaction_a;
    level._id_200D["allies"]["coverprone"]["idle"][1] = %prone_twitch_ammocheck;
    level._id_200D["allies"]["coverprone"]["idle"][2] = %prone_twitch_scan;
    level._id_200D["allies"]["coverprone"]["idle"][3] = %prone_twitch_look;
    level._id_200D["allies"]["coverprone"]["idle"][4] = %prone_twitch_lookup;
    level._id_200D["allies"]["coverprone"]["hide_2_aim"] = %prone_2_crouch;
    level._id_200D["allies"]["coverprone"]["aim_2_hide"] = %crouch_2_prone;
    level._id_200D["allies"]["coverprone"]["reload"] = %prone_reload;
    level._id_200D["allies"]["coverprone"]["fire"] = %prone_fire_1;
    level._id_200D["allies"]["coverprone"]["fire_exposed"] = %exposed_crouch_aim_5;
    level._id_200D["allies"]["coverprone"]["death"] = %saw_gunner_prone_death;
    level._id_200D["allies"]["coverprone"]["pop_up_chance"] = 0.5;
    level._id_200D["allies"]["coverprone_no_pop"]["idle"][0] = %prone_reaction_a;
    level._id_200D["allies"]["coverprone_no_pop"]["idle"][1] = %prone_twitch_ammocheck;
    level._id_200D["allies"]["coverprone_no_pop"]["idle"][2] = %prone_twitch_scan;
    level._id_200D["allies"]["coverprone_no_pop"]["idle"][3] = %prone_twitch_look;
    level._id_200D["allies"]["coverprone_no_pop"]["idle"][4] = %prone_twitch_lookup;
    level._id_200D["allies"]["coverprone_no_pop"]["hide_2_aim"] = %prone_2_crouch;
    level._id_200D["allies"]["coverprone_no_pop"]["aim_2_hide"] = %crouch_2_prone;
    level._id_200D["allies"]["coverprone_no_pop"]["reload"] = %prone_reload;
    level._id_200D["allies"]["coverprone_no_pop"]["fire"] = %prone_fire_1;
    level._id_200D["allies"]["coverprone_no_pop"]["fire_exposed"] = %exposed_crouch_aim_5;
    level._id_200D["allies"]["coverprone_no_pop"]["death"] = %saw_gunner_prone_death;
    level._id_200D["allies"]["coverprone_no_pop"]["pop_up_chance"] = 0;
    level._id_200D["axis"]["stand"]["idle"] = %casual_stand_idle;
    level._id_200D["axis"]["stand"]["run"] = %run_lowready_f_relative;
    level._id_200D["axis"]["stand"]["death"] = %exposed_death;
    level._id_200D["axis"]["covercrouch"]["idle"][0] = %covercrouch_hide_idle;
    level._id_200D["axis"]["covercrouch"]["idle"][1] = %covercrouch_twitch_1;
    level._id_200D["axis"]["covercrouch"]["idle"][2] = %covercrouch_twitch_2;
    level._id_200D["axis"]["covercrouch"]["idle"][3] = %covercrouch_twitch_3;
    level._id_200D["axis"]["covercrouch"]["idle"][4] = %covercrouch_hide_look;
    level._id_200D["axis"]["covercrouch"]["hide_2_aim"] = %covercrouch_hide_2_aim;
    level._id_200D["axis"]["covercrouch"]["aim_2_hide"] = %covercrouch_aim_2_hide;
    level._id_200D["axis"]["covercrouch"]["reload"] = %covercrouch_reload_hide;
    level._id_200D["axis"]["covercrouch"]["fire"] = %covercrouch_aim5;
    level._id_200D["axis"]["covercrouch"]["death"] = %covercrouch_death_1;
    level._id_200D["axis"]["covercrouch"]["pop_up_chance"] = 1;
    level._id_200D["axis"]["coverstand"]["idle"][0] = %coverstand_hide_idle;
    level._id_200D["axis"]["coverstand"]["idle"][1] = %coverstand_look_quick;
    level._id_200D["axis"]["coverstand"]["idle"][2] = %coverstand_look_quick_v2;
    level._id_200D["axis"]["coverstand"]["idle"][3] = %coverstand_hide_idle_twitch04;
    level._id_200D["axis"]["coverstand"]["idle"][4] = %coverstand_hide_idle_twitch05;
    level._id_200D["axis"]["coverstand"]["hide_2_aim"] = %coverstand_hide_2_aim;
    level._id_200D["axis"]["coverstand"]["aim_2_hide"] = %coverstand_aim_2_hide;
    level._id_200D["axis"]["coverstand"]["reload"] = %coverstand_reloada;
    level._id_200D["axis"]["coverstand"]["fire"] = %exposed_aim_5;
    level._id_200D["axis"]["coverstand"]["death"] = %coverstand_death_left;
    level._id_200D["axis"]["coverstand"]["pop_up_chance"] = 1;
    level._id_200D["axis"]["coverleftstand"]["idle"][0] = %corner_standl_alert_idle;
    level._id_200D["axis"]["coverleftstand"]["idle"][1] = %corner_standl_alert_twitch01;
    level._id_200D["axis"]["coverleftstand"]["idle"][2] = %corner_standl_alert_twitch02;
    level._id_200D["axis"]["coverleftstand"]["idle"][3] = %corner_standl_alert_twitch03;
    level._id_200D["axis"]["coverleftstand"]["idle"][4] = %corner_standl_alert_twitch04;
    level._id_200D["axis"]["coverleftstand"]["hide_2_aim"] = %corner_standl_trans_alert_2_b_v2;
    level._id_200D["axis"]["coverleftstand"]["aim_2_hide"] = %corner_standl_trans_b_2_alert_v2;
    level._id_200D["axis"]["coverleftstand"]["reload"] = %corner_standl_reload_v1;
    level._id_200D["axis"]["coverleftstand"]["fire"] = %exposed_aim_5;
    level._id_200D["axis"]["coverleftstand"]["death"] = %corner_standl_deathb;
    level._id_200D["axis"]["coverleftstand"]["pop_up_chance"] = 1;
    level._id_200D["axis"]["coverrightstand"]["idle"][0] = %corner_standr_alert_idle;
    level._id_200D["axis"]["coverrightstand"]["idle"][1] = %corner_standr_alert_twitch01;
    level._id_200D["axis"]["coverrightstand"]["idle"][2] = %corner_standr_alert_twitch02;
    level._id_200D["axis"]["coverrightstand"]["idle"][3] = %corner_standr_alert_twitch04;
    level._id_200D["axis"]["coverrightstand"]["hide_2_aim"] = %corner_standr_trans_alert_2_b;
    level._id_200D["axis"]["coverrightstand"]["aim_2_hide"] = %corner_standr_trans_b_2_alert;
    level._id_200D["axis"]["coverrightstand"]["reload"] = %corner_standr_reload_v1;
    level._id_200D["axis"]["coverrightstand"]["fire"] = %exposed_aim_5;
    level._id_200D["axis"]["coverrightstand"]["death"] = %corner_standr_deathb;
    level._id_200D["axis"]["coverrightstand"]["pop_up_chance"] = 1;
    level._id_200D["axis"]["coverrightcrouch"]["idle"][0] = %cornercrr_alert_idle;
    level._id_200D["axis"]["coverrightcrouch"]["idle"][1] = %cornercrr_alert_twitch_v1;
    level._id_200D["axis"]["coverrightcrouch"]["idle"][2] = %cornercrr_alert_twitch_v2;
    level._id_200D["axis"]["coverrightcrouch"]["idle"][3] = %cornercrr_alert_twitch_v3;
    level._id_200D["axis"]["coverrightcrouch"]["hide_2_aim"] = %cornercrr_alert_2_lean;
    level._id_200D["axis"]["coverrightcrouch"]["aim_2_hide"] = %cornercrr_lean_2_alert;
    level._id_200D["axis"]["coverrightcrouch"]["reload"] = %cornercrr_reloada;
    level._id_200D["axis"]["coverrightcrouch"]["death"] = %exposed_crouch_death_fetal;
    level._id_200D["axis"]["coverrightcrouch"]["pop_up_chance"] = 1;
    level._id_200D["axis"]["coverguard"]["idle"][0] = %exposed_crouch_idle_twitch_v2;
    level._id_200D["axis"]["coverguard"]["idle"][1] = %exposed_crouch_idle_twitch_v3;
    level._id_200D["axis"]["coverguard"]["reload"] = %exposed_crouch_reload;
    level._id_200D["axis"]["coverguard"]["fire"] = %exposed_crouch_aim_5;
    level._id_200D["axis"]["coverguard"]["death"] = %exposed_crouch_death_fetal;
    level._id_200D["axis"]["coverguard"]["pop_up_chance"] = 0;
    level._id_200D["axis"]["coverprone"]["idle"][0] = %prone_reaction_a;
    level._id_200D["axis"]["coverprone"]["idle"][1] = %prone_twitch_ammocheck;
    level._id_200D["axis"]["coverprone"]["idle"][2] = %prone_twitch_scan;
    level._id_200D["axis"]["coverprone"]["idle"][3] = %prone_twitch_look;
    level._id_200D["axis"]["coverprone"]["idle"][4] = %prone_twitch_lookup;
    level._id_200D["axis"]["coverprone"]["hide_2_aim"] = %prone_2_crouch;
    level._id_200D["axis"]["coverprone"]["aim_2_hide"] = %crouch_2_prone;
    level._id_200D["axis"]["coverprone"]["reload"] = %prone_reload;
    level._id_200D["axis"]["coverprone"]["fire"] = %prone_fire_1;
    level._id_200D["axis"]["coverprone"]["fire_exposed"] = %exposed_crouch_aim_5;
    level._id_200D["axis"]["coverprone"]["death"] = %saw_gunner_prone_death;
    level._id_200D["axis"]["coverprone"]["pop_up_chance"] = 0.5;
    level._id_200D["axis"]["coverprone_no_pop"]["idle"][0] = %prone_reaction_a;
    level._id_200D["axis"]["coverprone_no_pop"]["idle"][1] = %prone_twitch_ammocheck;
    level._id_200D["axis"]["coverprone_no_pop"]["idle"][2] = %prone_twitch_scan;
    level._id_200D["axis"]["coverprone_no_pop"]["idle"][3] = %prone_twitch_look;
    level._id_200D["axis"]["coverprone_no_pop"]["idle"][4] = %prone_twitch_lookup;
    level._id_200D["axis"]["coverprone_no_pop"]["hide_2_aim"] = %prone_2_crouch;
    level._id_200D["axis"]["coverprone_no_pop"]["aim_2_hide"] = %crouch_2_prone;
    level._id_200D["axis"]["coverprone_no_pop"]["reload"] = %prone_reload;
    level._id_200D["axis"]["coverprone_no_pop"]["fire"] = %prone_fire_1;
    level._id_200D["axis"]["coverprone_no_pop"]["fire_exposed"] = %exposed_crouch_aim_5;
    level._id_200D["axis"]["coverprone_no_pop"]["death"] = %saw_gunner_prone_death;
    level._id_200D["axis"]["coverprone_no_pop"]["pop_up_chance"] = 0;
    level._id_200D["team3"]["stand"]["idle"] = %casual_stand_idle;
    level._id_200D["team3"]["stand"]["run"] = %run_lowready_f_relative;
    level._id_200D["team3"]["stand"]["death"] = %exposed_death;
    level._effect["ak47_muzzleflash"] = loadfx( "muzzleflashes/ak47_flash_wv" );
    level._effect["m16_muzzleflash"] = loadfx( "muzzleflashes/m16_flash_wv" );
    maps\_drone::_id_1FF7();
}
