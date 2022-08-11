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
    self._id_20A3 = "usp";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 128.0, 0.0 );
        self setengagementmaxdist( 512.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 2 ) )
    {
        case 0:
            self.weapon = "pecheneg_reflex";
            break;
        case 1:
            self.weapon = "pecheneg";
            break;
    }

    _id_5C0A::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_5C0A::precache();
    precacheitem( "pecheneg_reflex" );
    precacheitem( "pecheneg" );
    precacheitem( "usp" );
    precacheitem( "fraggrenade" );
}