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

    switch ( codescripts\character::get_random_character( 4 ) )
    {
        case 0:
            _id_34F6::main();
            break;
        case 1:
            _id_34F7::main();
            break;
        case 2:
            _id_34F8::main();
            break;
        case 3:
            _id_34F9::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "neutral" );
}

precache()
{
    _id_34F6::precache();
    _id_34F7::precache();
    _id_34F8::precache();
    _id_34F9::precache();
}
