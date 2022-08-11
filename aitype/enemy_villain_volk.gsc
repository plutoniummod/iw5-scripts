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
    self.secondaryweapon = "deserteagle";
    self._id_20A3 = "deserteagle";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 128.0, 0.0 );
        self setengagementmaxdist( 512.0, 1024.0 );
    }

    self.weapon = "none";
    _id_60E0::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_60E0::precache();
    precacheitem( "deserteagle" );
    precacheitem( "deserteagle" );
    precacheitem( "fraggrenade" );
}
