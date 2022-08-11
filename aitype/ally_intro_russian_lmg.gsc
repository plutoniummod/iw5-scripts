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
    self.secondaryweapon = "mp412";
    self._id_20A3 = "mp412";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 2 ) )
    {
        case 0:
            self.weapon = "pecheneg";
            break;
        case 1:
            self.weapon = "mg36";
            break;
    }

    _id_6482::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    _id_6482::precache();
    precacheitem( "pecheneg" );
    precacheitem( "mg36" );
    precacheitem( "mp412" );
    precacheitem( "mp412" );
    precacheitem( "fraggrenade" );
}
