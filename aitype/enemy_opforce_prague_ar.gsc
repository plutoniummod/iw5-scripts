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

    switch ( codescripts\character::get_random_weapon( 4 ) )
    {
        case 0:
            self.weapon = "ak47";
            break;
        case 1:
            self.weapon = "ak47_acog";
            break;
        case 2:
            self.weapon = "g36c_reflex";
            break;
        case 3:
            self.weapon = "g36c";
            break;
    }

    switch ( codescripts\character::get_random_character( 3 ) )
    {
        case 0:
            _id_7A7A::main();
            break;
        case 1:
            _id_7A7B::main();
            break;
        case 2:
            _id_60DA::main();
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
    _id_60DA::precache();
    precacheitem( "ak47" );
    precacheitem( "ak47_acog" );
    precacheitem( "g36c_reflex" );
    precacheitem( "g36c" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
