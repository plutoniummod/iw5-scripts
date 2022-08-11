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
    self.secondaryweapon = "pp90m1_eotech";
    self._id_20A3 = "fnfiveseven";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "rpg";

    switch ( codescripts\character::get_random_character( 8 ) )
    {
        case 0:
            _id_793A::main();
            break;
        case 1:
            _id_793B::main();
            break;
        case 2:
            _id_793C::main();
            break;
        case 3:
            _id_793D::main();
            break;
        case 4:
            _id_793E::main();
            break;
        case 5:
            _id_793F::main();
            break;
        case 6:
            _id_7940::main();
            break;
        case 7:
            _id_7941::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_793A::precache();
    _id_793B::precache();
    _id_793C::precache();
    _id_793D::precache();
    _id_793E::precache();
    _id_793F::precache();
    _id_7940::precache();
    _id_7941::precache();
    precacheitem( "rpg" );
    precacheitem( "pp90m1_eotech" );
    precacheitem( "fnfiveseven" );
    precacheitem( "fraggrenade" );
}
