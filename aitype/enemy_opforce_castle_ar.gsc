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
    self.secondaryweapon = "";
    self._id_20A3 = "glock";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 9 ) )
    {
        case 0:
            self.weapon = "ak47";
            break;
        case 1:
            self.weapon = "ak47_reflex";
            break;
        case 2:
            self.weapon = "ak47_eotech";
            break;
        case 3:
            self.weapon = "ak47_acog";
            break;
        case 4:
            self.weapon = "scar_h";
            break;
        case 5:
            self.weapon = "scar_h_acog";
            break;
        case 6:
            self.weapon = "g36c_acog";
            break;
        case 7:
            self.weapon = "g36c_reflex";
            break;
        case 8:
            self.weapon = "g36c";
            break;
    }

    switch ( codescripts\character::get_random_character( 4 ) )
    {
        case 0:
            _id_5FD7::main();
            break;
        case 1:
            _id_5FD8::main();
            break;
        case 2:
            character\character_opforce_henchmen_lmg_b::main();
            break;
        case 3:
            _id_8058::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    _id_5FD7::precache();
    _id_5FD8::precache();
    character\character_opforce_henchmen_lmg_b::precache();
    _id_8058::precache();
    precacheitem( "ak47" );
    precacheitem( "ak47_reflex" );
    precacheitem( "ak47_eotech" );
    precacheitem( "ak47_acog" );
    precacheitem( "scar_h" );
    precacheitem( "scar_h_acog" );
    precacheitem( "g36c_acog" );
    precacheitem( "g36c_reflex" );
    precacheitem( "g36c" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
