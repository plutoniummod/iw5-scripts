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
    self._id_20A3 = "fnfiveseven";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 5 ) )
    {
        case 0:
            self.weapon = "mp5";
            break;
        case 1:
            self.weapon = "mp5_eotech";
            break;
        case 2:
            self.weapon = "mp5_reflex";
            break;
        case 3:
            self.weapon = "mp5_silencer";
            break;
        case 4:
            self.weapon = "mp5_silencer_reflex";
            break;
    }

    switch ( codescripts\character::get_random_character( 2 ) )
    {
        case 0:
            _id_0609::main();
            break;
        case 1:
            _id_060A::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    _id_0609::precache();
    _id_060A::precache();
    precacheitem( "mp5" );
    precacheitem( "mp5_eotech" );
    precacheitem( "mp5_reflex" );
    precacheitem( "mp5_silencer" );
    precacheitem( "mp5_silencer_reflex" );
    precacheitem( "fnfiveseven" );
    precacheitem( "fraggrenade" );
}
