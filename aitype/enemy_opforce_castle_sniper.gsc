// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "sniper_glint.csv";
    self.team = "axis";
    self.type = "human";
    self._id_218D = "regular";
    self.accuracy = 0.5;
    self.health = 150;
    self.secondaryweapon = "";
    self._id_20A3 = "glock";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 2048.0, 4096.0 );
    }

    switch ( codescripts\character::get_random_weapon( 2 ) )
    {
        case 0:
            self.weapon = "barrett";
            break;
        case 1:
            self.weapon = "rsass";
            break;
    }

    switch ( codescripts\character::get_random_character( 2 ) )
    {
        case 0:
            character\character_opforce_henchmen_lmg_a::main();
            break;
        case 1:
            _id_5FD8::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\character_opforce_henchmen_lmg_a::precache();
    _id_5FD8::precache();
    precacheitem( "barrett" );
    precacheitem( "rsass" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
