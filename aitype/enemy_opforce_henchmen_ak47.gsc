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

    self.weapon = "ak47";

    switch ( codescripts\character::get_random_character( 4 ) )
    {
        case 0:
            _id_5FD7::main();
            break;
        case 1:
            _id_5FD8::main();
            break;
        case 2:
            _id_5FD9::main();
            break;
        case 3:
            _id_5FDA::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_5FD7::precache();
    _id_5FD8::precache();
    _id_5FD9::precache();
    _id_5FDA::precache();
    precacheitem( "ak47" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
