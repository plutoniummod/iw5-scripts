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
    self.health = 100;
    self.secondaryweapon = "";
    self._id_20A3 = "usp_silencer";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "ak47";
    _id_2B2B::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    _id_2B2B::precache();
    precacheitem( "ak47" );
    precacheitem( "usp_silencer" );
    precacheitem( "fraggrenade" );
}
