// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "juggernaut.csv";
    self.team = "axis";
    self.type = "human";
    self._id_218D = "juggernaut";
    self.accuracy = 0.2;
    self.health = 3600;
    self.secondaryweapon = "beretta";
    self._id_20A3 = "beretta";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 0.0, 0.0 );
        self setengagementmaxdist( 256.0, 1024.0 );
    }

    self.weapon = "pecheneg";
    _id_05CA::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_05CA::precache();
    precacheitem( "pecheneg" );
    precacheitem( "beretta" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
    _id_05C6::main();
}
