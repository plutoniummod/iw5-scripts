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
    self.health = 150;
    self.secondaryweapon = "";
    self._id_20A3 = "fnfiveseven";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "ak74u";

    switch ( codescripts\character::get_random_character( 2 ) )
    {
        case 0:
            _id_34E0::main();
            break;
        case 1:
            _id_34E1::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    _id_34E0::precache();
    _id_34E1::precache();
    precacheitem( "ak74u" );
    precacheitem( "fnfiveseven" );
    precacheitem( "fraggrenade" );
}
