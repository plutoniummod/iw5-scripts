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
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "pecheneg";

    switch ( codescripts\character::get_random_character( 2 ) )
    {
        case 0:
            _id_7A7C::main();
            break;
        case 1:
            _id_7A7D::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_7A7C::precache();
    _id_7A7D::precache();
    precacheitem( "pecheneg" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
