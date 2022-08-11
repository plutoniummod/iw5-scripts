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
            self.weapon = "g36c";
            break;
        case 3:
            self.weapon = "g36c_reflex";
            break;
    }

    _id_2B37::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_2B37::precache();
    precacheitem( "ak47" );
    precacheitem( "ak47_acog" );
    precacheitem( "g36c" );
    precacheitem( "g36c_reflex" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
