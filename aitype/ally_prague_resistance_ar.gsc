// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "common_rambo_anims.csv";
    self.team = "allies";
    self.type = "human";
    self._id_218D = "militia";
    self.accuracy = 0.12;
    self.health = 150;
    self.secondaryweapon = "";
    self._id_20A3 = "glock";
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
            self.weapon = "ak47";
            break;
        case 1:
            self.weapon = "ak74u";
            break;
    }

    switch ( codescripts\character::get_random_character( 18 ) )
    {
        case 0:
            _id_7A80::main();
            break;
        case 1:
            _id_7A83::main();
            break;
        case 2:
            _id_7A86::main();
            break;
        case 3:
            _id_7A89::main();
            break;
        case 4:
            _id_7A8C::main();
            break;
        case 5:
            _id_7A8F::main();
            break;
        case 6:
            _id_7A81::main();
            break;
        case 7:
            _id_7A84::main();
            break;
        case 8:
            _id_7A87::main();
            break;
        case 9:
            _id_7A8A::main();
            break;
        case 10:
            _id_7A8D::main();
            break;
        case 11:
            _id_7A90::main();
            break;
        case 12:
            _id_7A82::main();
            break;
        case 13:
            _id_7A85::main();
            break;
        case 14:
            _id_7A88::main();
            break;
        case 15:
            _id_7A8B::main();
            break;
        case 16:
            _id_7A8E::main();
            break;
        case 17:
            _id_7A91::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    _id_7A80::precache();
    _id_7A83::precache();
    _id_7A86::precache();
    _id_7A89::precache();
    _id_7A8C::precache();
    _id_7A8F::precache();
    _id_7A81::precache();
    _id_7A84::precache();
    _id_7A87::precache();
    _id_7A8A::precache();
    _id_7A8D::precache();
    _id_7A90::precache();
    _id_7A82::precache();
    _id_7A85::precache();
    _id_7A88::precache();
    _id_7A8B::precache();
    _id_7A8E::precache();
    _id_7A91::precache();
    precacheitem( "ak47" );
    precacheitem( "ak74u" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
    _id_05C2::main();
}
