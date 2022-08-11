// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "";
    self.team = "axis";
    self.type = "human";
    self._id_218D = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.secondaryweapon = "";
    self._id_20A3 = "glock";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 128.0, 0.0 );
        self setengagementmaxdist( 512.0, 768.0 );
    }

    switch ( codescripts\character::get_random_weapon( 3 ) )
    {
        case 0:
            self.weapon = "spas12";
            break;
        case 1:
            self.weapon = "spas12_eotech";
            break;
        case 2:
            self.weapon = "spas12_reflex";
            break;
    }

    _id_2B2A::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_2B2A::precache();
    precacheitem( "spas12" );
    precacheitem( "spas12_eotech" );
    precacheitem( "spas12_reflex" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
