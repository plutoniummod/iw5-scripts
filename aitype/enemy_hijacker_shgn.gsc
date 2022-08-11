// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "";
    self.team = "axis";
    self.type = "human";
    self._id_218D = "regular";
    self.accuracy = 0.18;
    self.health = 150;
    self.secondaryweapon = "";
    self._id_20A3 = "fnfiveseven";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 0.0, 0.0 );
        self setengagementmaxdist( 140.0, 200.0 );
    }

    self.weapon = "aa12";

    switch ( codescripts\character::get_random_character( 2 ) )
    {
        case 0:
            _id_805B::main();
            break;
        case 1:
            _id_805C::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_805B::precache();
    _id_805C::precache();
    precacheitem( "aa12" );
    precacheitem( "fnfiveseven" );
    precacheitem( "fraggrenade" );
}
