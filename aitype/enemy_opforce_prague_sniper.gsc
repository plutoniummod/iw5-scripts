// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "";
    self.team = "axis";
    self.type = "human";
    self._id_218D = "regular";
    self.accuracy = 0.7;
    self.health = 150;
    self.secondaryweapon = "ak47";
    self._id_20A3 = "glock";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 2048.0, 4096.0 );
    }

    self.weapon = "rsass";

    switch ( codescripts\character::get_random_character( 2 ) )
    {
        case 0:
            _id_7A7A::main();
            break;
        case 1:
            _id_7A7B::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_7A7A::precache();
    _id_7A7B::precache();
    precacheitem( "rsass" );
    precacheitem( "ak47" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
