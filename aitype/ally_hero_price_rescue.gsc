// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_3AA1 = "";
    self._id_3AA2 = "";
    self.team = "allies";
    self.type = "human";
    self._id_218D = "regular";
    self.accuracy = 0.6;
    self.health = 100;
    self.secondaryweapon = "at4";
    self._id_20A3 = "usp_silencer";
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "m4_grunt_rescue";
    character\character_hero_europe_price_aa::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\character_hero_europe_price_aa::precache();
    precacheitem( "m4_grunt_rescue" );
    precacheitem( "at4" );
    precacheitem( "usp_silencer" );
    precacheitem( "fraggrenade" );
}
