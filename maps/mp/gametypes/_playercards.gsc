// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level thread onplayerconnect();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_1 = var_0 maps\mp\gametypes\_persistence::statget( "cardIcon" );
        var_2 = tablelookupbyrow( "mp/cardIconTable.csv", var_1, 0 );
        var_0 setcardicon( var_2 );
        var_3 = var_0 maps\mp\gametypes\_persistence::statget( "cardTitle" );
        var_4 = tablelookupbyrow( "mp/cardTitleTable.csv", var_3, 0 );
        var_0 setcardtitle( var_4 );
        var_5 = var_0 maps\mp\gametypes\_persistence::statget( "cardNameplate" );
        var_0 setcardnameplate( var_5 );
    }
}
