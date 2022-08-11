// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "";
    self.team = "neutral";
    self.type = "civilian";
    self._id_218D = "regular";
    self.accuracy = 0.2;
    self.health = 30;
    self.secondaryweapon = "";
    self._id_20A3 = "";
    self.grenadeweapon = "";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "none";

    switch ( codescripts\character::get_random_character( 3 ) )
    {
        case 0:
            _id_7A30::main();
            break;
        case 1:
            _id_7A31::main();
            break;
        case 2:
            _id_7A32::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "neutral" );
}

precache()
{
    _id_7A30::precache();
    _id_7A31::precache();
    _id_7A32::precache();
}
