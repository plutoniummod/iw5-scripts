// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "juggernaut.csv";
    self.team = "allies";
    self.type = "human";
    self._id_218D = "juggernaut";
    self.accuracy = 0.2;
    self.health = 3600;
    self.secondaryweapon = "deserteagle";
    self._id_20A3 = "deserteagle";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 0.0, 0.0 );
        self setengagementmaxdist( 256.0, 1024.0 );
    }

    self.weapon = "mk46";
    _id_2019::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    _id_2019::precache();
    precacheitem( "mk46" );
    precacheitem( "deserteagle" );
    precacheitem( "deserteagle" );
    precacheitem( "fraggrenade" );
    _id_05C6::main();
}
