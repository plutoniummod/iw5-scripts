// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "";
    self.team = "allies";
    self.type = "human";
    self._id_218D = "regular";
    self.accuracy = 0.2;
    self.health = 100;
    self.secondaryweapon = "";
    self._id_20A3 = "beretta";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 8 ) )
    {
        case 0:
            self.weapon = "m16_basic";
            break;
        case 1:
            self.weapon = "scar_h";
            break;
        case 2:
            self.weapon = "m16_grenadier";
            break;
        case 3:
            self.weapon = "m4_grunt";
            break;
        case 4:
            self.weapon = "m16_acog";
            break;
        case 5:
            self.weapon = "scar_h_reflex";
            break;
        case 6:
            self.weapon = "m4_grenadier";
            break;
        case 7:
            self.weapon = "scar_h_grenadier";
            break;
    }

    _id_0636::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    _id_0636::precache();
    precacheitem( "m16_basic" );
    precacheitem( "scar_h" );
    precacheitem( "m16_grenadier" );
    precacheitem( "m203" );
    precacheitem( "m4_grunt" );
    precacheitem( "m16_acog" );
    precacheitem( "scar_h_reflex" );
    precacheitem( "m4_grenadier" );
    precacheitem( "m203_m4" );
    precacheitem( "scar_h_grenadier" );
    precacheitem( "SCAR_H_M203" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
