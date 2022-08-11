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
        self setengagementmindist( 128.0, 0.0 );
        self setengagementmaxdist( 512.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 5 ) )
    {
        case 0:
            self.weapon = "sa80";
            break;
        case 1:
            self.weapon = "sa80_scope";
            break;
        case 2:
            self.weapon = "pecheneg";
            break;
        case 3:
            self.weapon = "pecheneg_acog";
            break;
        case 4:
            self.weapon = "pecheneg_reflex";
            break;
    }

    switch ( codescripts\character::get_random_character( 2 ) )
    {
        case 0:
            character\character_opforce_henchmen_lmg_a::main();
            break;
        case 1:
            character\character_opforce_henchmen_lmg_b::main();
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
    character\character_opforce_henchmen_lmg_b::precache();
    precacheitem( "sa80" );
    precacheitem( "sa80_scope" );
    precacheitem( "pecheneg" );
    precacheitem( "pecheneg_acog" );
    precacheitem( "pecheneg_reflex" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
