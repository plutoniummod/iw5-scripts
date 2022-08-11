// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "dog.atr";
    self._id_3AA2 = "common_dogs.csv";
    self.team = "axis";
    self.type = "dog";
    self._id_218D = "regular";
    self.accuracy = 0.2;
    self.health = 200;
    self.secondaryweapon = "dog_bite";
    self._id_20A3 = "";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "dog_bite";
    _id_060E::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_060E::precache();
    precacheitem( "dog_bite" );
    precacheitem( "dog_bite" );
    precacheitem( "fraggrenade" );
    animscripts\dog\dog_init::_id_3AF2();
}
