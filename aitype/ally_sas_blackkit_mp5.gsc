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
    self.secondaryweapon = "usp";
    self._id_20A3 = "usp";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "mp5_eotech";

    switch ( codescripts\character::get_random_character( 4 ) )
    {
        case 0:
            _id_7935::main();
            break;
        case 1:
            _id_7936::main();
            break;
        case 2:
            _id_7937::main();
            break;
        case 3:
            _id_7938::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    _id_7935::precache();
    _id_7936::precache();
    _id_7937::precache();
    _id_7938::precache();
    precacheitem( "mp5_eotech" );
    precacheitem( "usp" );
    precacheitem( "usp" );
    precacheitem( "fraggrenade" );
}
