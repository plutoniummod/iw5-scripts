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
    self._id_20A3 = "p99_tactical_silencer";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 5 ) )
    {
        case 0:
            self.weapon = "ak47_silencer";
            break;
        case 1:
            self.weapon = "ak47_silencer_reflex";
            break;
        case 2:
            self.weapon = "ak47_silencer_acog";
            break;
        case 3:
            self.weapon = "scar_h_silencer";
            break;
        case 4:
            self.weapon = "g36c_silencer";
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
            character\character_opforce_henchmen_lmg_a::main();
            break;
        case 3:
            _id_8059::main();
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
    character\character_opforce_henchmen_lmg_a::precache();
    _id_8059::precache();
    precacheitem( "ak47_silencer" );
    precacheitem( "ak47_silencer_reflex" );
    precacheitem( "ak47_silencer_acog" );
    precacheitem( "scar_h_silencer" );
    precacheitem( "g36c_silencer" );
    precacheitem( "p99_tactical_silencer" );
    precacheitem( "fraggrenade" );
}
