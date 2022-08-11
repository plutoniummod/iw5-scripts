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
    self.secondaryweapon = "beretta";
    self._id_20A3 = "beretta";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "ak47";

    switch ( codescripts\character::get_random_character( 7 ) )
    {
        case 0:
            _id_7A99::main();
            break;
        case 1:
            _id_7A9A::main();
            break;
        case 2:
            _id_7A9B::main();
            break;
        case 3:
            _id_7A9C::main();
            break;
        case 4:
            _id_7A9D::main();
            break;
        case 5:
            _id_7A9E::main();
            break;
        case 6:
            _id_7A9F::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_7A99::precache();
    _id_7A9A::precache();
    _id_7A9B::precache();
    _id_7A9C::precache();
    _id_7A9D::precache();
    _id_7A9E::precache();
    _id_7A9F::precache();
    precacheitem( "ak47" );
    precacheitem( "beretta" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
