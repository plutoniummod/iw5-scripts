// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "subway", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD0( "vehicle_subway_cart_destructible", "vehicle_subway_cart" );
    maps\_vehicle::_id_2ACE( 9999 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    level._id_0C59["generic"]["london_train_shooter_guy1_opendoor_door_TAG_DOOR_1_LE"] = %london_train_shooter_guy1_opendoor_door_front_left;
    level._id_0C59["generic"]["london_train_shooter_guy2_opendoor_door_TAG_DOOR_1_LE"] = %london_train_shooter_guy2_opendoor_door_front_left;
    level._id_0C59["generic"]["london_train_shooter_guy3_opendoor_door_TAG_DOOR_1_LE"] = %london_train_shooter_guy3_opendoor_door_front_left;
    level._id_0C59["generic"]["london_train_shooter_guy4_opendoor_door_TAG_DOOR_1_LE"] = %london_train_shooter_guy4_opendoor_door_front_left;
    level._id_0C59["generic"]["london_train_shooter_guy_closedoor_door_TAG_DOOR_1_LE"] = %subway_cart_doors_close_front_left;
    level._id_0C59["generic"]["london_train_shooter_guy1_opendoor_door_TAG_DOOR_1_RI"] = %london_train_shooter_guy1_opendoor_door_front_right;
    level._id_0C59["generic"]["london_train_shooter_guy2_opendoor_door_TAG_DOOR_1_RI"] = %london_train_shooter_guy2_opendoor_door_front_right;
    level._id_0C59["generic"]["london_train_shooter_guy3_opendoor_door_TAG_DOOR_1_RI"] = %london_train_shooter_guy3_opendoor_door_front_right;
    level._id_0C59["generic"]["london_train_shooter_guy4_opendoor_door_TAG_DOOR_1_RI"] = %london_train_shooter_guy4_opendoor_door_front_right;
    level._id_0C59["generic"]["london_train_shooter_guy_closedoor_door_TAG_DOOR_1_RI"] = %subway_cart_doors_close_front_right;
    level._id_0C59["generic"]["london_train_shooter_guy1_opendoor_door_TAG_DOOR_2_LE"] = %london_train_shooter_guy1_opendoor_door_back_left;
    level._id_0C59["generic"]["london_train_shooter_guy2_opendoor_door_TAG_DOOR_2_LE"] = %london_train_shooter_guy2_opendoor_door_back_left;
    level._id_0C59["generic"]["london_train_shooter_guy3_opendoor_door_TAG_DOOR_2_LE"] = %london_train_shooter_guy3_opendoor_door_back_left;
    level._id_0C59["generic"]["london_train_shooter_guy4_opendoor_door_TAG_DOOR_2_LE"] = %london_train_shooter_guy4_opendoor_door_back_left;
    level._id_0C59["generic"]["london_train_shooter_guy_closedoor_door_TAG_DOOR_2_LE"] = %subway_cart_doors_close_back_left;
    level._id_0C59["generic"]["london_train_shooter_guy1_opendoor_door_TAG_DOOR_2_RI"] = %london_train_shooter_guy1_opendoor_door_back_right;
    level._id_0C59["generic"]["london_train_shooter_guy2_opendoor_door_TAG_DOOR_2_RI"] = %london_train_shooter_guy2_opendoor_door_back_right;
    level._id_0C59["generic"]["london_train_shooter_guy3_opendoor_door_TAG_DOOR_2_RI"] = %london_train_shooter_guy3_opendoor_door_back_right;
    level._id_0C59["generic"]["london_train_shooter_guy4_opendoor_door_TAG_DOOR_2_RI"] = %london_train_shooter_guy4_opendoor_door_back_right;
    level._id_0C59["generic"]["london_train_shooter_guy_closedoor_door_TAG_DOOR_2_RI"] = %subway_cart_doors_close_back_right;
    level._id_0C59["generic"]["london_train_shooter_doors_tree"] = %london_train_doors;
    _id_56BC();
}
#using_animtree("generic_human");

_id_56BC()
{
    level._id_0C59["generic"]["london_train_shooter_guy1_opendoor"] = %london_train_shooter_guy1_opendoor;
    level._id_0C59["generic"]["london_train_shooter_guy1_idle"] = %london_train_shooter_guy1_aim5;
    level._id_0C59["generic"]["london_train_shooter_guy1_idle_right"] = %london_train_shooter_guy1_aim6;
    level._id_0C59["generic"]["london_train_shooter_guy1_idle_left"] = %london_train_shooter_guy1_aim4;
    level._id_0C59["generic"]["london_train_shooter_guy1_death"] = %london_train_shooter_guy1_death;
    level._id_0C59["generic"]["london_train_shooter_guy2_opendoor"] = %london_train_shooter_guy2_opendoor;
    level._id_0C59["generic"]["london_train_shooter_guy2_idle"] = %london_train_shooter_guy2_aim5;
    level._id_0C59["generic"]["london_train_shooter_guy2_idle_right"] = %london_train_shooter_guy2_aim6;
    level._id_0C59["generic"]["london_train_shooter_guy2_idle_left"] = %london_train_shooter_guy2_aim4;
    level._id_0C59["generic"]["london_train_shooter_guy2_death"] = %london_train_shooter_guy2_death;
    level._id_0C59["generic"]["london_train_shooter_guy3_opendoor"] = %london_train_shooter_guy3_opendoor;
    level._id_0C59["generic"]["london_train_shooter_guy3_idle"] = %london_train_shooter_guy3_aim5;
    level._id_0C59["generic"]["london_train_shooter_guy3_idle_right"] = %london_train_shooter_guy3_aim6;
    level._id_0C59["generic"]["london_train_shooter_guy3_idle_left"] = %london_train_shooter_guy3_aim4;
    level._id_0C59["generic"]["london_train_shooter_guy3_death"] = %london_train_shooter_guy3_death;
    level._id_0C59["generic"]["london_train_shooter_guy4_opendoor"] = %london_train_shooter_guy4_opendoor;
    level._id_0C59["generic"]["london_train_shooter_guy4_idle"] = %london_train_shooter_guy4_aim5;
    level._id_0C59["generic"]["london_train_shooter_guy4_idle_right"] = %london_train_shooter_guy4_aim6;
    level._id_0C59["generic"]["london_train_shooter_guy4_idle_left"] = %london_train_shooter_guy4_aim4;
    level._id_0C59["generic"]["london_train_shooter_guy4_death"] = %london_train_shooter_guy4_death;
}

_id_2B1D()
{

}

_id_56BD()
{
    if ( !isdefined( level._id_56BD ) || level._id_56BD.size == 0 )
        level._id_56BD = [ 1, 2, 3, 4 ];

    var_0 = common_scripts\utility::random( level._id_56BD );
    level._id_56BD = common_scripts\utility::array_remove( level._id_56BD, var_0 );
    return var_0;
}

_id_56BE( var_0, var_1 )
{
    var_2 = _id_56BD();
    var_3 = spawnstruct();
    var_3._id_56BF = self;
    var_3.tag = var_0;
    var_3._id_56C0 = var_2;
    var_1._id_56C1 = var_3;
    var_4 = self;
    var_1.health = 1;
    var_5 = maps\_utility::_id_26EC( "london_train_shooter_guy" + var_2 + "_opendoor_door_" + var_0 );
    var_6 = maps\_utility::_id_26EC( "london_train_shooter_guy_closedoor_door_" + var_0 );
    thread _id_56C3( var_1, var_5, var_6 );
    var_4 clearanim( var_6, 0.1 );
    var_4._id_56C2 clearanim( var_6, 0.1 );
    var_4 setanim( var_5, 1 );
    var_4._id_56C2 setanim( var_5, 1 );
    var_1 _id_56C7( var_4, var_0, 0 );
    var_1 animcustom( ::_id_56C4 );
}

_id_56C3( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3 = var_0._id_56C1.tag;
    var_0 waittill( "death" );
    wait 1;
    var_4 = 0.2;
    self clearanim( var_1, var_4 );
    self._id_56C2 clearanim( var_1, var_4 );
    self setanim( var_2 );
    self._id_56C2 setanim( var_2 );
}

_id_56C4()
{
    self notify( "stop_door_guy_think" );
    self endon( "stop_door_guy_think" );
    animscripts\utility::_id_0D15( "subway cart guy" );
    var_0 = self;
    var_1 = var_0._id_56C1;
    var_2 = var_1._id_56C0;
    var_3 = var_1.tag;
    var_4 = var_1._id_56BF;
    var_0._id_56C5 = var_4;
    var_5 = maps\_utility::_id_26EC( "london_train_shooter_guy" + var_2 + "_opendoor" );
    var_6 = getanimlength( var_5 );
    var_0 setanim( var_5, 1, 0, 1 );
    wait(var_6);

    if ( !isalive( var_0 ) )
        return;

    var_0 clearanim( var_5, 0.2 );
    var_7 = maps\_utility::_id_26EC( "london_train_shooter_guy" + var_2 + "_idle" );
    var_1._id_2540 = var_7;
    var_0._id_56C6 = var_4;
    var_0 thread _id_56C8();
    var_0 clearanim( %root, 0.5 );
    var_0 setanim( var_7, 1, 0.2, 1 );
    var_4 waittill( "forever" );
}

_id_56C7( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    maps\_utility::_id_27A0( var_0, var_1 );
    self linktoblendtotag( var_0, var_1, var_2, var_3 );
}

_id_56C8()
{
    self endon( "stop_door_guy_think" );
    self._id_0D50 = maps\_utility::_id_26EC( "london_train_shooter_guy" + self._id_56C1._id_56C0 + "_death" );
    self._id_56C5 endon( "stop_door_loop" + self._id_56C1.tag );
    var_0 = maps\_utility::_id_26EC( "london_train_shooter_guy" + self._id_56C1._id_56C0 + "_idle_right" );
    var_1 = maps\_utility::_id_26EC( "london_train_shooter_guy" + self._id_56C1._id_56C0 + "_idle_left" );
    var_2 = self._id_56C1._id_2540;
    var_3 = 0;
    self endon( "death" );

    for (;;)
    {
        var_4 = self gettagangles( "tag_flash" );
        var_5 = self gettagorigin( "tag_flash" );
        var_6 = vectortoangles( anglestoright( var_4 ) );
        var_7 = 0;

        if ( isdefined( self.enemy ) )
            var_7 = maps\_utility::_id_26AC( var_5, var_6, self.enemy.origin );

        if ( abs( var_7 ) < 0.1 )
            var_3 = var_3;

        if ( var_7 > 0 )
            var_3 += -0.25;
        else
            var_3 += 0.25;

        var_3 = clamp( var_3, -1, 1 );
        var_8 = abs( var_3 );

        if ( var_3 == 0 )
        {
            self clearanim( var_1, 0.1 );
            self clearanim( var_0, 0.1 );
            self setanim( var_2, 1 );
        }
        else if ( var_3 < 0 )
        {
            self clearanim( var_1, 0.1 );
            self setanim( var_2, 1 - var_8 );
            self setanim( var_0, var_8 );
        }
        else
        {
            self clearanim( var_0, 0.1 );
            self setanim( var_2, 1 - var_8 );
            self setanim( var_1, var_8 );
        }

        if ( !isdefined( self.enemy ) )
        {
            wait 0.05;
            continue;
        }

        if ( abs( var_7 ) < 0.45 )
            self shoot();

        wait 0.05;
    }
}
