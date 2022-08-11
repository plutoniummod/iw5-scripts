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
            self.weapon = "pp90m1";
            break;
        case 1:
            self.weapon = "pp90m1_reflex";
            break;
        case 2:
            self.weapon = "pp90m1_silencer";
            break;
    }

    _id_7D83::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_7D83::precache();
    precacheitem( "pp90m1" );
    precacheitem( "pp90m1_reflex" );
    precacheitem( "pp90m1_silencer" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
