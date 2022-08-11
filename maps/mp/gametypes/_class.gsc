// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.classmap["class0"] = 0;
    level.classmap["class1"] = 1;
    level.classmap["class2"] = 2;
    level.classmap["class3"] = 3;
    level.classmap["class4"] = 4;
    level.classmap["class5"] = 5;
    level.classmap["class6"] = 6;
    level.classmap["class7"] = 7;
    level.classmap["class8"] = 8;
    level.classmap["class9"] = 9;
    level.classmap["class10"] = 10;
    level.classmap["class11"] = 11;
    level.classmap["class12"] = 12;
    level.classmap["class13"] = 13;
    level.classmap["class14"] = 14;
    level.classmap["custom1"] = 0;
    level.classmap["custom2"] = 1;
    level.classmap["custom3"] = 2;
    level.classmap["custom4"] = 3;
    level.classmap["custom5"] = 4;
    level.classmap["custom6"] = 5;
    level.classmap["custom7"] = 6;
    level.classmap["custom8"] = 7;
    level.classmap["custom9"] = 8;
    level.classmap["custom10"] = 9;
    level.classmap["custom11"] = 10;
    level.classmap["custom12"] = 11;
    level.classmap["custom13"] = 12;
    level.classmap["custom14"] = 13;
    level.classmap["custom15"] = 14;
    level.classmap["axis_recipe1"] = 0;
    level.classmap["axis_recipe2"] = 1;
    level.classmap["axis_recipe3"] = 2;
    level.classmap["axis_recipe4"] = 3;
    level.classmap["axis_recipe5"] = 4;
    level.classmap["allies_recipe1"] = 0;
    level.classmap["allies_recipe2"] = 1;
    level.classmap["allies_recipe3"] = 2;
    level.classmap["allies_recipe4"] = 3;
    level.classmap["allies_recipe5"] = 4;
    level.classmap["copycat"] = -1;
    level.defaultclass = "CLASS_ASSAULT";
    level.classtablename = "mp/classTable.csv";
    level thread onplayerconnecting();
}

getclasschoice( var_0 )
{
    return var_0;
}

getweaponchoice( var_0 )
{
    var_1 = strtok( var_0, "," );

    if ( var_1.size > 1 )
        return int( var_1[1] );
    else
        return 0;
}

logclasschoice( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == self.lastclass )
        return;

    self logstring( "choseclass: " + var_0 + " weapon: " + var_1 + " special: " + var_2 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        self logstring( "perk" + var_4 + ": " + var_3[var_4] );

    self.lastclass = var_0;
}

cac_getcustomclassloc()
{
    if ( getdvarint( "xblive_privatematch" ) )
        return "privateMatchCustomClasses";
    else
        return "customClasses";
}

cac_getweapon( var_0, var_1 )
{
    var_2 = cac_getcustomclassloc();
    return self getplayerdata( var_2, var_0, "weaponSetups", var_1, "weapon" );
}

cac_getweaponattachment( var_0, var_1 )
{
    var_2 = cac_getcustomclassloc();
    return self getplayerdata( var_2, var_0, "weaponSetups", var_1, "attachment", 0 );
}

cac_getweaponattachmenttwo( var_0, var_1 )
{
    var_2 = cac_getcustomclassloc();
    return self getplayerdata( var_2, var_0, "weaponSetups", var_1, "attachment", 1 );
}

cac_getweaponbuff( var_0, var_1 )
{
    var_2 = cac_getcustomclassloc();
    return self getplayerdata( var_2, var_0, "weaponSetups", var_1, "buff" );
}

cac_getweaponcamo( var_0, var_1 )
{
    var_2 = cac_getcustomclassloc();
    return self getplayerdata( var_2, var_0, "weaponSetups", var_1, "camo" );
}

cac_getweaponreticle( var_0, var_1 )
{
    var_2 = cac_getcustomclassloc();
    return self getplayerdata( var_2, var_0, "weaponSetups", var_1, "reticle" );
}

cac_getperk( var_0, var_1 )
{
    var_2 = cac_getcustomclassloc();
    return self getplayerdata( var_2, var_0, "perks", var_1 );
}

cac_getkillstreak( var_0, var_1, var_2 )
{
    var_3 = undefined;

    switch ( var_1 )
    {
        case "streaktype_support":
            var_3 = "defenseStreaks";
            break;
        case "streaktype_specialist":
            var_3 = "specialistStreaks";
            break;
        default:
            var_3 = "assaultStreaks";
            break;
    }

    var_4 = cac_getcustomclassloc();
    return self getplayerdata( var_4, var_0, var_3, var_2 );
}

cac_getdeathstreak( var_0 )
{
    var_1 = cac_getcustomclassloc();
    return self getplayerdata( var_1, var_0, "deathstreak" );
}

cac_getoffhand( var_0 )
{
    var_1 = cac_getcustomclassloc();
    return self getplayerdata( var_1, var_0, "perks", 6 );
}

recipe_getkillstreak( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    switch ( var_2 )
    {
        case "streaktype_support":
            var_4 = "defenseStreaks";
            break;
        case "streaktype_specialist":
            var_4 = "specialistStreaks";
            break;
        default:
            var_4 = "assaultStreaks";
            break;
    }

    return getmatchrulesdata( "defaultClasses", var_0, var_1, "class", var_4, var_3 );
}

table_getweapon( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimary", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondary", var_1 + 1 );
}

table_getweaponattachment( var_0, var_1, var_2, var_3 )
{
    var_4 = "none";

    if ( var_2 == 0 )
    {
        if ( !isdefined( var_3 ) || var_3 == 0 )
            var_4 = tablelookup( var_0, 0, "loadoutPrimaryAttachment", var_1 + 1 );
        else
            var_4 = tablelookup( var_0, 0, "loadoutPrimaryAttachment2", var_1 + 1 );
    }
    else if ( !isdefined( var_3 ) || var_3 == 0 )
        var_4 = tablelookup( var_0, 0, "loadoutSecondaryAttachment", var_1 + 1 );
    else
        var_4 = tablelookup( var_0, 0, "loadoutSecondaryAttachment2", var_1 + 1 );

    if ( var_4 == "" || var_4 == "none" )
        return "none";
    else
        return var_4;
}

table_getweaponbuff( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimaryBuff", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondaryBuff", var_1 + 1 );
}

table_getweaponcamo( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimaryCamo", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondaryCamo", var_1 + 1 );
}

table_getweaponreticle( var_0, var_1, var_2 )
{
    return "none";
}

table_getequipment( var_0, var_1, var_2 )
{
    return tablelookup( var_0, 0, "loadoutEquipment", var_1 + 1 );
}

table_getperk( var_0, var_1, var_2 )
{
    return tablelookup( var_0, 0, "loadoutPerk" + var_2, var_1 + 1 );
}

table_getteamperk( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutTeamPerk", var_1 + 1 );
}

table_getoffhand( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutOffhand", var_1 + 1 );
}

table_getkillstreak( var_0, var_1, var_2 )
{
    return tablelookup( var_0, 0, "loadoutStreak" + var_2, var_1 + 1 );
}

table_getdeathstreak( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutDeathstreak", var_1 + 1 );
}

getclassindex( var_0 )
{
    return level.classmap[var_0];
}

cloneloadout()
{
    var_0 = "none";
    var_1 = [];
    var_2 = self.curclass;

    if ( var_2 == "copycat" )
        return undefined;

    if ( issubstr( var_2, "axis" ) )
        var_0 = "axis";
    else if ( issubstr( var_2, "allies" ) )
        var_0 = "allies";

    if ( var_0 != "none" )
    {
        var_3 = getclassindex( var_2 );
        var_4 = "none";
        var_5 = "none";
        var_6 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 0, "weapon" );
        var_7 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 0, "attachment", 0 );
        var_4 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 0, "attachment", 1 );
        var_8 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 0, "buff" );
        var_9 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 0, "camo" );
        var_10 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 0, "reticle" );
        var_11 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 1, "weapon" );
        var_12 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 1, "attachment", 0 );
        var_5 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 1, "attachment", 1 );
        var_13 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 1, "buff" );
        var_14 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 1, "camo" );
        var_15 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "weaponSetups", 1, "reticle" );
        var_16 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "perks", 0 );
        var_17 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "perks", 1 );
        var_18 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "perks", 2 );
        var_19 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "perks", 3 );
        var_20 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "perks", 5 );
        var_21 = recipe_getkillstreak( var_0, var_3, var_20, 0 );
        var_22 = recipe_getkillstreak( var_0, var_3, var_20, 1 );
        var_23 = recipe_getkillstreak( var_0, var_3, var_20, 2 );
        var_24 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "perks", 6 );
        var_25 = getmatchrulesdata( "defaultClasses", var_0, var_3, "class", "deathstreak" );
    }
    else if ( issubstr( var_2, "custom" ) )
    {
        var_26 = getclassindex( var_2 );
        var_4 = "none";
        var_5 = "none";
        var_6 = cac_getweapon( var_26, 0 );
        var_7 = cac_getweaponattachment( var_26, 0 );
        var_4 = cac_getweaponattachmenttwo( var_26, 0 );
        var_8 = cac_getweaponbuff( var_26, 0 );
        var_9 = cac_getweaponcamo( var_26, 0 );
        var_10 = cac_getweaponreticle( var_26, 0 );
        var_11 = cac_getweapon( var_26, 1 );
        var_12 = cac_getweaponattachment( var_26, 1 );
        var_5 = cac_getweaponattachmenttwo( var_26, 1 );
        var_13 = cac_getweaponbuff( var_26, 1 );
        var_14 = cac_getweaponcamo( var_26, 1 );
        var_15 = cac_getweaponreticle( var_26, 1 );
        var_16 = cac_getperk( var_26, 0 );
        var_17 = cac_getperk( var_26, 1 );
        var_18 = cac_getperk( var_26, 2 );
        var_19 = cac_getperk( var_26, 3 );
        var_20 = cac_getperk( var_26, 5 );
        var_21 = cac_getkillstreak( var_26, var_20, 0 );
        var_22 = cac_getkillstreak( var_26, var_20, 1 );
        var_23 = cac_getkillstreak( var_26, var_20, 2 );
        var_24 = cac_getoffhand( var_26 );
        var_25 = cac_getdeathstreak( var_26 );
    }
    else
    {
        var_26 = getclassindex( var_2 );
        var_6 = table_getweapon( level.classtablename, var_26, 0 );
        var_7 = table_getweaponattachment( level.classtablename, var_26, 0, 0 );
        var_4 = table_getweaponattachment( level.classtablename, var_26, 0, 1 );
        var_8 = table_getweaponbuff( level.classtablename, var_26, 0 );
        var_9 = table_getweaponcamo( level.classtablename, var_26, 0 );
        var_10 = table_getweaponreticle( level.classtablename, var_26, 0 );
        var_11 = table_getweapon( level.classtablename, var_26, 1 );
        var_12 = table_getweaponattachment( level.classtablename, var_26, 1, 0 );
        var_5 = table_getweaponattachment( level.classtablename, var_26, 1, 1 );
        var_13 = table_getweaponbuff( level.classtablename, var_26, 1 );
        var_14 = table_getweaponcamo( level.classtablename, var_26, 1 );
        var_15 = table_getweaponreticle( level.classtablename, var_26, 1 );
        var_16 = table_getequipment( level.classtablename, var_26, 0 );
        var_17 = table_getperk( level.classtablename, var_26, 1 );
        var_18 = table_getperk( level.classtablename, var_26, 2 );
        var_19 = table_getperk( level.classtablename, var_26, 3 );
        var_20 = table_getperk( level.classtablename, var_26, 5 );
        var_24 = table_getoffhand( level.classtablename, var_26 );
        var_25 = table_getdeathstreak( level.classtablename, var_26 );

        switch ( var_20 )
        {
            case "streaktype_support":
                var_27 = table_getkillstreak( level.classtablename, 3, 1 );
                var_28 = table_getkillstreak( level.classtablename, 3, 2 );
                var_29 = table_getkillstreak( level.classtablename, 3, 3 );
                break;
            case "streaktype_specialist":
                var_27 = table_getkillstreak( level.classtablename, 1, 1 );
                var_28 = table_getkillstreak( level.classtablename, 1, 2 );
                var_29 = table_getkillstreak( level.classtablename, 1, 3 );
                break;
            default:
                var_27 = table_getkillstreak( level.classtablename, 0, 1 );
                var_28 = table_getkillstreak( level.classtablename, 0, 2 );
                var_29 = table_getkillstreak( level.classtablename, 0, 3 );
                break;
        }

        var_21 = var_27;
        var_22 = var_28;
        var_23 = var_29;
    }

    var_1["inUse"] = 0;
    var_1["loadoutPrimary"] = var_6;
    var_1["loadoutPrimaryAttachment"] = var_7;
    var_1["loadoutPrimaryAttachment2"] = var_4;
    var_1["loadoutPrimaryBuff"] = var_8;
    var_1["loadoutPrimaryCamo"] = var_9;
    var_1["loadoutPrimaryReticle"] = var_10;
    var_1["loadoutSecondary"] = var_11;
    var_1["loadoutSecondaryAttachment"] = var_12;
    var_1["loadoutSecondaryAttachment2"] = var_5;
    var_1["loadoutSecondaryBuff"] = var_13;
    var_1["loadoutSecondaryCamo"] = var_14;
    var_1["loadoutSecondaryReticle"] = var_15;
    var_1["loadoutEquipment"] = var_16;
    var_1["loadoutPerk1"] = var_17;
    var_1["loadoutPerk2"] = var_18;
    var_1["loadoutPerk3"] = var_19;
    var_1["loadoutStreakType"] = var_20;
    var_1["loadoutKillstreak1"] = var_21;
    var_1["loadoutKillstreak2"] = var_22;
    var_1["loadoutKillstreak3"] = var_23;
    var_1["loadoutDeathstreak"] = var_25;
    var_1["loadoutOffhand"] = var_24;
    return var_1;
}

loadoutfakeperks( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "streaktype_support":
            self.streaktype = "support";
            break;
        case "streaktype_specialist":
            self.streaktype = "specialist";
            break;
        default:
            self.streaktype = "assault";
    }
}

getloadoutstreaktypefromstreaktype( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "streaktype_assault";

    switch ( var_0 )
    {
        case "support":
            return "streaktype_support";
        case "specialist":
            return "streaktype_specialist";
        case "assault":
            return "streaktype_assault";
        default:
            return "streaktype_assault";
    }
}

giveloadout( var_0, var_1, var_2, var_3 )
{
    self takeallweapons();
    self.changingweapon = undefined;
    var_4 = "none";

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    var_5 = 0;
    self.specialty = [];

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_6 = undefined;
    var_7 = 0;
    var_8 = undefined;
    var_9 = undefined;
    var_10 = undefined;

    if ( issubstr( var_1, "axis" ) )
        var_4 = "axis";
    else if ( issubstr( var_1, "allies" ) )
        var_4 = "allies";

    var_11 = [];

    if ( isdefined( self.pers["copyCatLoadout"] ) && self.pers["copyCatLoadout"]["inUse"] && var_2 )
    {
        setclass( "copycat" );
        self.class_num = getclassindex( "copycat" );
        var_11 = self.pers["copyCatLoadout"];
        var_12 = var_11["loadoutPrimary"];
        var_13 = var_11["loadoutPrimaryAttachment"];
        var_14 = var_11["loadoutPrimaryAttachment2"];
        var_15 = var_11["loadoutPrimaryBuff"];
        var_16 = var_11["loadoutPrimaryCamo"];
        var_17 = var_11["loadoutPrimaryReticle"];
        var_18 = var_11["loadoutSecondary"];
        var_19 = var_11["loadoutSecondaryAttachment"];
        var_20 = var_11["loadoutSecondaryAttachment2"];
        var_21 = var_11["loadoutSecondaryBuff"];
        var_22 = var_11["loadoutSecondaryCamo"];
        var_23 = var_11["loadoutSecondaryReticle"];
        var_24 = var_11["loadoutEquipment"];
        var_25 = var_11["loadoutPerk1"];
        var_26 = var_11["loadoutPerk2"];
        var_27 = var_11["loadoutPerk3"];
        var_28 = var_11["loadoutStreakType"];
        var_29 = var_11["loadoutOffhand"];
        var_30 = var_11["loadoutDeathstreak"];
        var_31 = var_11["loadoutAmmoType"];
    }
    else if ( var_4 != "none" )
    {
        var_32 = getclassindex( var_1 );
        var_14 = "none";
        var_20 = "none";
        var_12 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 0, "weapon" );
        var_13 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 0, "attachment", 0 );
        var_14 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 0, "attachment", 1 );
        var_15 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 0, "buff" );
        var_16 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 0, "camo" );
        var_17 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 0, "reticle" );
        var_18 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 1, "weapon" );
        var_19 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 1, "attachment", 0 );
        var_20 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 1, "attachment", 1 );
        var_21 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 1, "buff" );
        var_22 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 1, "camo" );
        var_23 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "weaponSetups", 1, "reticle" );

        if ( var_12 == "throwingknife" && var_18 != "none" )
        {
            var_12 = var_18;
            var_13 = var_19;
            var_14 = var_20;
            var_15 = var_21;
            var_16 = var_22;
            var_17 = var_23;
            var_18 = "none";
            var_19 = "none";
            var_20 = "none";
            var_21 = "specialty_null";
            var_22 = "none";
            var_23 = "none";
        }
        else if ( var_12 == "throwingknife" && var_18 == "none" )
        {
            var_7 = 1;
            var_12 = "iw5_usp45";
            var_13 = "tactical";
        }

        var_24 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "perks", 0 );
        var_25 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "perks", 1 );
        var_26 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "perks", 2 );
        var_27 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "perks", 3 );

        if ( var_18 != "none" && !isvalidsecondary( var_18, var_26, var_27, 0 ) )
            var_18 = table_getweapon( level.classtablename, 10, 1 );

        var_28 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "perks", 5 );
        var_8 = recipe_getkillstreak( var_4, var_32, var_28, 0 );
        var_9 = recipe_getkillstreak( var_4, var_32, var_28, 1 );
        var_10 = recipe_getkillstreak( var_4, var_32, var_28, 2 );
        var_29 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "perks", 6 );

        if ( var_29 == "specialty_null" )
            var_29 = "none";

        var_30 = getmatchrulesdata( "defaultClasses", var_4, var_32, "class", "deathstreak" );

        if ( getmatchrulesdata( "defaultClasses", var_4, var_32, "juggernaut" ) )
        {
            self.isjuggernaut = 1;
            thread maps\mp\_utility::recipeclassapplyjuggernaut();
        }
    }
    else if ( issubstr( var_1, "custom" ) )
    {
        var_33 = getclassindex( var_1 );
        self.class_num = var_33;
        var_12 = cac_getweapon( var_33, 0 );
        var_13 = cac_getweaponattachment( var_33, 0 );
        var_14 = cac_getweaponattachmenttwo( var_33, 0 );
        var_15 = cac_getweaponbuff( var_33, 0 );
        var_16 = cac_getweaponcamo( var_33, 0 );
        var_17 = cac_getweaponreticle( var_33, 0 );
        var_18 = cac_getweapon( var_33, 1 );
        var_19 = cac_getweaponattachment( var_33, 1 );
        var_20 = cac_getweaponattachmenttwo( var_33, 1 );
        var_21 = cac_getweaponbuff( var_33, 1 );
        var_22 = cac_getweaponcamo( var_33, 1 );
        var_23 = cac_getweaponreticle( var_33, 1 );
        var_24 = cac_getperk( var_33, 0 );
        var_25 = cac_getperk( var_33, 1 );
        var_26 = cac_getperk( var_33, 2 );
        var_27 = cac_getperk( var_33, 3 );
        var_28 = cac_getperk( var_33, 5 );
        var_29 = cac_getoffhand( var_33 );
        var_30 = cac_getdeathstreak( var_33 );
    }
    else if ( var_1 == "gamemode" )
    {
        var_34 = self.pers["gamemodeLoadout"];
        var_12 = var_34["loadoutPrimary"];
        var_13 = var_34["loadoutPrimaryAttachment"];
        var_14 = var_34["loadoutPrimaryAttachment2"];
        var_15 = var_34["loadoutPrimaryBuff"];
        var_16 = var_34["loadoutPrimaryCamo"];
        var_17 = var_34["loadoutPrimaryReticle"];
        var_18 = var_34["loadoutSecondary"];
        var_19 = var_34["loadoutSecondaryAttachment"];
        var_20 = var_34["loadoutSecondaryAttachment2"];
        var_21 = var_34["loadoutSecondaryBuff"];
        var_22 = var_34["loadoutSecondaryCamo"];
        var_23 = var_34["loadoutSecondaryReticle"];

        if ( var_12 == "throwingknife" && var_18 != "none" )
        {
            var_12 = var_18;
            var_13 = var_19;
            var_14 = var_20;
            var_15 = var_21;
            var_16 = var_22;
            var_17 = var_23;
            var_18 = "none";
            var_19 = "none";
            var_20 = "none";
            var_21 = "specialty_null";
            var_22 = "none";
            var_23 = "none";
        }
        else if ( var_12 == "throwingknife" && var_18 == "none" )
        {
            var_7 = 1;
            var_12 = "iw5_usp45";
            var_13 = "tactical";
        }

        var_24 = var_34["loadoutEquipment"];
        var_29 = var_34["loadoutOffhand"];

        if ( var_29 == "specialty_null" )
            var_29 = "none";

        var_25 = var_34["loadoutPerk1"];
        var_26 = var_34["loadoutPerk2"];
        var_27 = var_34["loadoutPerk3"];

        if ( var_18 != "none" && !isvalidsecondary( var_18, var_26, var_27, 0 ) )
            var_18 = table_getweapon( level.classtablename, 10, 1 );

        if ( level.killstreakrewards && isdefined( var_34["loadoutStreakType"] ) && var_34["loadoutStreakType"] != "specialty_null" )
        {
            var_28 = var_34["loadoutStreakType"];
            var_8 = var_34["loadoutKillstreak1"];
            var_9 = var_34["loadoutKillstreak2"];
            var_10 = var_34["loadoutKillstreak3"];
        }
        else if ( level.killstreakrewards && isdefined( self.streaktype ) )
            var_28 = getloadoutstreaktypefromstreaktype( self.streaktype );
        else
        {
            var_28 = "streaktype_assault";
            var_8 = "none";
            var_9 = "none";
            var_10 = "none";
        }

        var_30 = var_34["loadoutDeathstreak"];

        if ( !maps\mp\_utility::isjuggernaut() && var_34["loadoutJuggernaut"] )
        {
            self.isjuggernaut = 1;
            thread maps\mp\_utility::recipeclassapplyjuggernaut();
        }
    }
    else if ( var_1 == "juggernaut" )
    {
        var_12 = "iw5_m60jugg";
        var_13 = "none";
        var_14 = "none";
        var_15 = "specialty_null";
        var_16 = "none";
        var_17 = "none";
        var_18 = "iw5_mp412jugg";
        var_19 = "none";
        var_20 = "none";
        var_21 = "specialty_null";
        var_22 = "none";
        var_23 = "none";
        var_24 = "frag_grenade_mp";
        var_25 = "specialty_scavenger";
        var_26 = "specialty_quickdraw";
        var_27 = "specialty_detectexplosive";
        var_28 = getloadoutstreaktypefromstreaktype( self.streaktype );
        var_29 = "smoke_grenade_mp";
        var_30 = "specialty_null";
    }
    else if ( var_1 == "juggernaut_recon" )
    {
        var_12 = "iw5_riotshieldjugg";
        var_13 = "none";
        var_14 = "none";
        var_15 = "specialty_null";
        var_16 = "none";
        var_17 = "none";
        var_18 = "iw5_usp45jugg";
        var_19 = "none";
        var_20 = "none";
        var_21 = "specialty_null";
        var_22 = "none";
        var_23 = "none";
        var_24 = "specialty_portable_radar";
        var_25 = "specialty_scavenger";
        var_26 = "specialty_coldblooded";
        var_27 = "specialty_detectexplosive";
        var_28 = getloadoutstreaktypefromstreaktype( self.streaktype );
        var_29 = "smoke_grenade_mp";
        var_30 = "specialty_null";
    }
    else
    {
        var_33 = getclassindex( var_1 );
        self.class_num = var_33;
        var_12 = table_getweapon( level.classtablename, var_33, 0 );
        var_13 = table_getweaponattachment( level.classtablename, var_33, 0, 0 );
        var_14 = table_getweaponattachment( level.classtablename, var_33, 0, 1 );
        var_15 = table_getweaponbuff( level.classtablename, var_33, 0 );
        var_16 = table_getweaponcamo( level.classtablename, var_33, 0 );
        var_17 = table_getweaponreticle( level.classtablename, var_33, 0 );
        var_18 = table_getweapon( level.classtablename, var_33, 1 );
        var_19 = table_getweaponattachment( level.classtablename, var_33, 1, 0 );
        var_20 = table_getweaponattachment( level.classtablename, var_33, 1, 1 );
        var_21 = table_getweaponbuff( level.classtablename, var_33, 1 );
        var_22 = table_getweaponcamo( level.classtablename, var_33, 1 );
        var_23 = table_getweaponreticle( level.classtablename, var_33, 1 );
        var_24 = table_getequipment( level.classtablename, var_33, 0 );
        var_25 = table_getperk( level.classtablename, var_33, 1 );
        var_26 = table_getperk( level.classtablename, var_33, 2 );
        var_27 = table_getperk( level.classtablename, var_33, 3 );
        var_28 = table_getperk( level.classtablename, var_33, 5 );
        var_29 = table_getoffhand( level.classtablename, var_33 );
        var_30 = table_getdeathstreak( level.classtablename, var_33 );
    }

    loadoutfakeperks( var_28 );
    var_35 = issubstr( var_1, "custom" );
    var_36 = issubstr( var_1, "recipe" );
    var_37 = var_1 == "gamemode";

    if ( !var_37 && !var_36 && !( isdefined( self.pers["copyCatLoadout"] ) && self.pers["copyCatLoadout"]["inUse"] && var_2 ) )
    {
        if ( !isvalidprimary( var_12 ) || level.rankedmatch && var_35 && !self isitemunlocked( var_12 ) )
            var_12 = table_getweapon( level.classtablename, 10, 0 );

        if ( !isvalidattachment( var_13 ) || level.rankedmatch && var_35 && !isattachmentunlocked( var_12, var_13 ) )
            var_13 = table_getweaponattachment( level.classtablename, 10, 0, 0 );

        if ( !isvalidattachment( var_14 ) || level.rankedmatch && var_35 && !isattachmentunlocked( var_12, var_14 ) )
            var_14 = table_getweaponattachment( level.classtablename, 10, 0, 1 );

        if ( !isvalidweaponbuff( var_15 ) || level.rankedmatch && var_35 && !isweaponbuffunlocked( var_12, var_15 ) )
            var_15 = table_getweaponbuff( level.classtablename, 10, 0 );

        if ( !isvalidcamo( var_16 ) || level.rankedmatch && var_35 && !iscamounlocked( var_12, var_16 ) )
            var_16 = table_getweaponcamo( level.classtablename, 10, 0 );

        if ( !isvalidreticle( var_17 ) )
            var_17 = table_getweaponreticle( level.classtablenum, 10, 0 );

        if ( !isvalidsecondary( var_18, var_26, var_27 ) || level.rankedmatch && level.rankedmatch && var_35 && !self isitemunlocked( var_18 ) )
            var_18 = table_getweapon( level.classtablename, 10, 1 );

        if ( !isvalidattachment( var_19 ) || level.rankedmatch && var_35 && !isattachmentunlocked( var_18, var_19 ) )
            var_19 = table_getweaponattachment( level.classtablename, 10, 1, 0 );

        if ( !isvalidattachment( var_20 ) || level.rankedmatch && var_35 && !isattachmentunlocked( var_18, var_20 ) )
            var_20 = table_getweaponattachment( level.classtablename, 10, 1, 1 );

        if ( var_26 == "specialty_twoprimaries" && !isvalidweaponbuff( var_21 ) || level.rankedmatch && var_35 && !self isitemunlocked( var_18 + " " + var_21 ) )
            var_21 = table_getweaponbuff( level.classtablename, 10, 1 );

        if ( !isvalidcamo( var_22 ) || level.rankedmatch && var_35 && !iscamounlocked( var_18, var_22 ) )
            var_22 = table_getweaponcamo( level.classtablename, 10, 1 );

        if ( !isvalidreticle( var_23 ) )
            var_23 = table_getweaponreticle( level.classtablename, 10, 1 );

        if ( !isvalidequipment( var_24 ) || level.rankedmatch && var_35 && !self isitemunlocked( var_24 ) )
            var_24 = table_getequipment( level.classtablename, 10, 0 );

        if ( !isvalidperk1( var_25 ) || level.rankedmatch && var_35 && !self isitemunlocked( var_25 ) )
            var_25 = table_getperk( level.classtablename, 10, 1 );

        if ( !isvalidperk2( var_26, var_25 ) || level.rankedmatch && var_35 && !self isitemunlocked( var_26 ) )
            var_26 = table_getperk( level.classtablename, 10, 2 );

        if ( !isvalidperk3( var_27, var_25 ) || level.rankedmatch && var_35 && !self isitemunlocked( var_27 ) )
            var_27 = table_getperk( level.classtablename, 10, 3 );

        if ( !isvaliddeathstreak( var_30 ) || level.rankedmatch && var_35 && !self isitemunlocked( var_30 ) )
            var_30 = table_getdeathstreak( level.classtablename, 10 );

        if ( !isvalidoffhand( var_29 ) )
            var_29 = table_getoffhand( level.classtablename, 10 );
    }

    self.loadoutprimary = var_12;
    self.loadoutprimarycamo = int( tablelookup( "mp/camoTable.csv", 1, var_16, 0 ) );
    self.loadoutsecondary = var_18;
    self.loadoutsecondarycamo = int( tablelookup( "mp/camoTable.csv", 1, var_22, 0 ) );

    if ( !issubstr( var_12, "iw5" ) )
        self.loadoutprimarycamo = 0;

    if ( !issubstr( var_18, "iw5" ) )
        self.loadoutsecondarycamo = 0;

    self.loadoutprimaryreticle = int( tablelookup( "mp/reticleTable.csv", 1, var_17, 0 ) );
    self.loadoutsecondaryreticle = int( tablelookup( "mp/reticleTable.csv", 1, var_23, 0 ) );

    if ( !issubstr( var_12, "iw5" ) )
        self.loadoutprimaryreticle = 0;

    if ( !issubstr( var_18, "iw5" ) )
        self.loadoutsecondaryreticle = 0;

    if ( var_18 == "none" )
        var_38 = "none";
    else
    {
        var_38 = buildweaponname( var_18, var_19, var_20, self.loadoutsecondarycamo, self.loadoutsecondaryreticle );
        maps\mp\_utility::_giveweapon( var_38 );
        var_39 = strtok( var_38, "_" );

        if ( var_39[0] == "iw5" )
            var_39[0] = var_39[0] + "_" + var_39[1];
        else if ( var_39[0] == "alt" )
            var_39[0] = var_39[1] + "_" + var_39[2];

        var_40 = var_39[0];
        var_41 = maps\mp\gametypes\_rank::getweaponrank( var_40 );
        var_42 = self getplayerdata( "weaponRank", var_40 );

        if ( var_41 != var_42 )
            self setplayerdata( "weaponRank", var_40, var_41 );
    }

    self setoffhandprimaryclass( "other" );
    maps\mp\_utility::_setactionslot( 1, "" );
    maps\mp\_utility::_setactionslot( 3, "altMode" );
    maps\mp\_utility::_setactionslot( 4, "" );
    maps\mp\_utility::_clearperks();
    _detachall();

    if ( level.diehardmode )
        maps\mp\_utility::giveperk( "specialty_pistoldeath", 0 );

    loadoutallperks( var_24, var_25, var_26, var_27, var_15, var_21 );

    if ( maps\mp\_utility::_hasperk( "specialty_extraammo" ) && var_38 != "none" && maps\mp\_utility::getweaponclass( var_38 ) != "weapon_projectile" )
        self givemaxammo( var_38 );

    self.spawnperk = 0;

    if ( !maps\mp\_utility::_hasperk( "specialty_blindeye" ) && self.avoidkillstreakonspawntimer > 0 )
        thread maps\mp\perks\_perks::giveblindeyeafterspawn();

    if ( self.pers["cur_death_streak"] > 0 )
    {
        var_43 = [];

        if ( var_30 != "specialty_null" )
            var_43[var_30] = int( tablelookup( "mp/perkTable.csv", 1, var_30, 6 ) );

        if ( getperkupgrade( var_25 ) == "specialty_rollover" || getperkupgrade( var_26 ) == "specialty_rollover" || getperkupgrade( var_27 ) == "specialty_rollover" )
        {
            foreach ( var_46, var_45 in var_43 )
                var_43[var_46] -= 1;
        }

        foreach ( var_46, var_45 in var_43 )
        {
            if ( self.pers["cur_death_streak"] >= var_45 )
            {
                if ( var_46 == "specialty_carepackage" && self.pers["cur_death_streak"] > var_45 )
                    continue;

                if ( var_46 == "specialty_uav" && self.pers["cur_death_streak"] > var_45 )
                    continue;

                thread maps\mp\_utility::giveperk( var_46, 1 );
                thread maps\mp\gametypes\_hud_message::splashnotify( var_46 );
            }
        }
    }

    if ( level.killstreakrewards && !isdefined( var_8 ) && !isdefined( var_9 ) && !isdefined( var_10 ) )
    {
        if ( isdefined( self.pers["copyCatLoadout"] ) && self.pers["copyCatLoadout"]["inUse"] && var_2 )
        {
            var_8 = var_11["loadoutKillstreak1"];
            var_9 = var_11["loadoutKillstreak2"];
            var_10 = var_11["loadoutKillstreak3"];
        }
        else
        {
            var_48 = undefined;
            var_49 = undefined;
            var_50 = undefined;
            var_51 = undefined;

            switch ( self.streaktype )
            {
                case "support":
                    var_48 = table_getkillstreak( level.classtablename, 2, 1 );
                    var_49 = table_getkillstreak( level.classtablename, 2, 2 );
                    var_50 = table_getkillstreak( level.classtablename, 2, 3 );
                    var_51 = "defenseStreaks";
                    break;
                case "specialist":
                    var_48 = table_getkillstreak( level.classtablename, 1, 1 );
                    var_49 = table_getkillstreak( level.classtablename, 1, 2 );
                    var_50 = table_getkillstreak( level.classtablename, 1, 3 );
                    var_51 = "specialistStreaks";
                    break;
                default:
                    var_48 = table_getkillstreak( level.classtablename, 0, 1 );
                    var_49 = table_getkillstreak( level.classtablename, 0, 2 );
                    var_50 = table_getkillstreak( level.classtablename, 0, 3 );
                    var_51 = "assaultStreaks";
                    break;
            }

            var_8 = undefined;
            var_9 = undefined;
            var_10 = undefined;

            if ( issubstr( var_1, "custom" ) )
            {
                var_52 = cac_getcustomclassloc();
                var_8 = self getplayerdata( var_52, self.class_num, var_51, 0 );
                var_9 = self getplayerdata( var_52, self.class_num, var_51, 1 );
                var_10 = self getplayerdata( var_52, self.class_num, var_51, 2 );
            }

            if ( issubstr( var_1, "juggernaut" ) || var_37 )
            {
                foreach ( var_54 in self.killstreaks )
                {
                    if ( !isdefined( var_8 ) )
                    {
                        var_8 = var_54;
                        continue;
                    }

                    if ( !isdefined( var_9 ) )
                    {
                        var_9 = var_54;
                        continue;
                    }

                    if ( !isdefined( var_10 ) )
                        var_10 = var_54;
                }

                if ( var_37 && self.streaktype == "specialist" )
                {
                    self.pers["gamemodeLoadout"]["loadoutKillstreak1"] = var_8;
                    self.pers["gamemodeLoadout"]["loadoutKillstreak2"] = var_9;
                    self.pers["gamemodeLoadout"]["loadoutKillstreak3"] = var_10;
                }
            }

            if ( !issubstr( var_1, "custom" ) && !issubstr( var_1, "juggernaut" ) && !var_37 )
            {
                var_8 = var_48;
                var_9 = var_49;
                var_10 = var_50;
            }

            if ( !isdefined( var_8 ) )
                var_8 = "none";

            if ( !isdefined( var_9 ) )
                var_9 = "none";

            if ( !isdefined( var_10 ) )
                var_10 = "none";

            if ( !isvalidkillstreak( var_8 ) || var_35 && !self isitemunlocked( var_8 ) )
                var_8 = table_getkillstreak( level.classtablename, 0, 1 );

            if ( !isvalidkillstreak( var_9 ) || var_35 && !self isitemunlocked( var_9 ) )
                var_9 = table_getkillstreak( level.classtablename, 0, 2 );

            if ( !isvalidkillstreak( var_10 ) || var_35 && !self isitemunlocked( var_10 ) )
                var_10 = table_getkillstreak( level.classtablename, 0, 3 );
        }
    }
    else if ( !level.killstreakrewards )
    {
        var_8 = "none";
        var_9 = "none";
        var_10 = "none";
    }

    setkillstreaks( var_8, var_9, var_10 );

    if ( isdefined( self.lastclass ) && self.lastclass != self.class && !issubstr( self.class, "juggernaut" ) && !issubstr( self.lastclass, "juggernaut" ) && !issubstr( var_1, "juggernaut" ) )
    {
        if ( maps\mp\_utility::wasonlyround() || self.lastclass != "" )
        {
            var_56 = [];
            var_57 = 0;

            if ( self.pers["killstreaks"].size > 5 )
            {
                for ( var_58 = 5; var_58 < self.pers["killstreaks"].size; var_58++ )
                {
                    var_56[var_57] = self.pers["killstreaks"][var_58].streakname;
                    var_57++;
                }
            }

            if ( self.pers["killstreaks"].size )
            {
                for ( var_58 = 1; var_58 < 4; var_58++ )
                {
                    if ( isdefined( self.pers["killstreaks"][var_58] ) && isdefined( self.pers["killstreaks"][var_58].streakname ) && self.pers["killstreaks"][var_58].available && !self.pers["killstreaks"][var_58].isspecialist )
                    {
                        var_56[var_57] = self.pers["killstreaks"][var_58].streakname;
                        var_57++;
                    }
                }
            }

            maps\mp\killstreaks\_killstreaks::clearkillstreaks();

            for ( var_58 = 0; var_58 < var_56.size; var_58++ )
                maps\mp\killstreaks\_killstreaks::givekillstreak( var_56[var_58] );
        }
    }

    if ( !issubstr( var_1, "juggernaut" ) )
    {
        if ( isdefined( self.lastclass ) && self.lastclass != "" && self.lastclass != self.class )
            maps\mp\_utility::incplayerstat( "mostclasseschanged", 1 );

        self.pers["lastClass"] = self.class;
        self.lastclass = self.class;
    }

    if ( isdefined( self.gamemode_chosenclass ) )
    {
        self.pers["class"] = self.gamemode_chosenclass;
        self.pers["lastClass"] = self.gamemode_chosenclass;
        self.class = self.gamemode_chosenclass;
        self.lastclass = self.gamemode_chosenclass;
        self.gamemode_chosenclass = undefined;
    }

    var_59 = buildweaponname( var_12, var_13, var_14, self.loadoutprimarycamo, self.loadoutprimaryreticle );
    maps\mp\_utility::_giveweapon( var_59 );
    self switchtoweapon( var_59 );
    var_39 = strtok( var_59, "_" );

    if ( var_39[0] == "iw5" )
        var_40 = var_39[0] + "_" + var_39[1];
    else if ( var_39[0] == "alt" )
        var_40 = var_39[1] + "_" + var_39[2];
    else
        var_40 = var_39[0];

    var_41 = maps\mp\gametypes\_rank::getweaponrank( var_40 );
    var_42 = self getplayerdata( "weaponRank", var_40 );

    if ( var_41 != var_42 )
        self setplayerdata( "weaponRank", var_40, var_41 );

    if ( var_59 == "riotshield_mp" && level.ingraceperiod )
        self notify( "weapon_change", "riotshield_mp" );

    if ( maps\mp\_utility::_hasperk( "specialty_extraammo" ) )
        self givemaxammo( var_59 );

    if ( var_3 )
        self setspawnweapon( var_59 );

    self.pers["primaryWeapon"] = var_40;
    var_60 = strtok( var_59, "_" );
    var_61 = var_29;

    if ( var_29 == "none" )
        self setoffhandsecondaryclass( "none" );
    else if ( var_29 == "flash_grenade_mp" )
        self setoffhandsecondaryclass( "flash" );
    else if ( var_29 == "smoke_grenade_mp" || var_29 == "concussion_grenade_mp" )
        self setoffhandsecondaryclass( "smoke" );
    else
        self setoffhandsecondaryclass( "flash" );

    switch ( var_61 )
    {
        case "none":
            break;
        case "trophy_mp":
        case "specialty_portable_radar":
        case "specialty_scrambler":
        case "specialty_tacticalinsertion":
            maps\mp\_utility::giveperk( var_61, 0 );
            break;
        default:
            self giveweapon( var_61 );

            if ( var_29 == "flash_grenade_mp" )
                self setweaponammoclip( var_61, 2 );
            else if ( var_29 == "concussion_grenade_mp" )
                self setweaponammoclip( var_61, 2 );
            else
                self setweaponammoclip( var_61, 1 );

            break;
    }

    var_6 = var_59;
    self.primaryweapon = var_6;
    self.secondaryweapon = var_38;

    if ( var_7 )
    {
        self setweaponammoclip( self.primaryweapon, 0 );
        self setweaponammostock( self.primaryweapon, 0 );
    }

    maps\mp\gametypes\_teams::playermodelforweapon( self.pers["primaryWeapon"], maps\mp\_utility::getbaseweaponname( var_38 ) );
    self.issniper = weaponclass( self.primaryweapon ) == "sniper";
    maps\mp\gametypes\_weapons::updatemovespeedscale();
    maps\mp\perks\_perks::cac_selector();
    self notify( "changed_kit" );
    self notify( "giveLoadout" );
}

_detachall()
{
    if ( isdefined( self.hasriotshield ) && self.hasriotshield )
    {
        if ( self.hasriotshieldequipped && ( !isdefined( self.hasriotshieldhidden ) || self.hasriotshieldhidden == 0 ) )
        {
            self detachshieldmodel( "weapon_riot_shield_mp", "tag_weapon_left" );
            self.hasriotshieldequipped = 0;
        }
        else
            self detachshieldmodel( "weapon_riot_shield_mp", "tag_shield_back" );

        self.hasriotshield = 0;
    }

    self detachall();
}

isperkupgraded( var_0 )
{
    var_1 = tablelookup( "mp/perktable.csv", 1, var_0, 8 );

    if ( var_1 == "" || var_1 == "specialty_null" )
        return 0;

    if ( !self isitemunlocked( var_1 ) )
        return 0;

    return 1;
}

getperkupgrade( var_0 )
{
    var_1 = tablelookup( "mp/perktable.csv", 1, var_0, 8 );

    if ( var_1 == "" || var_1 == "specialty_null" )
        return "specialty_null";

    if ( !self isitemunlocked( var_1 ) )
        return "specialty_null";

    return var_1;
}

loadoutallperks( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 = maps\mp\perks\_perks::validateperk( 1, var_0 );
    var_1 = maps\mp\perks\_perks::validateperk( 1, var_1 );
    var_2 = maps\mp\perks\_perks::validateperk( 2, var_2 );
    var_3 = maps\mp\perks\_perks::validateperk( 3, var_3 );
    var_4 = maps\mp\perks\_perks::validateperk( undefined, var_4 );

    if ( var_2 == "specialty_twoprimaries" )
        var_5 = maps\mp\perks\_perks::validateperk( undefined, var_5 );

    self.loadoutperk1 = var_1;
    self.loadoutperk2 = var_2;
    self.loadoutperk3 = var_3;
    self.loadoutperkequipment = var_0;
    self.loadoutprimarybuff = var_4;

    if ( var_2 == "specialty_twoprimaries" )
        self.loadoutsecondarybuff = var_5;

    if ( var_0 != "specialty_null" )
        maps\mp\_utility::giveperk( var_0, 1 );

    if ( var_1 != "specialty_null" )
        maps\mp\_utility::giveperk( var_1, 1 );

    if ( var_2 != "specialty_null" )
        maps\mp\_utility::giveperk( var_2, 1 );

    if ( var_3 != "specialty_null" )
        maps\mp\_utility::giveperk( var_3, 1 );

    if ( var_4 != "specialty_null" )
        maps\mp\_utility::giveperk( var_4, 1 );

    var_6[0] = tablelookup( "mp/perktable.csv", 1, var_1, 8 );
    var_6[1] = tablelookup( "mp/perktable.csv", 1, var_2, 8 );
    var_6[2] = tablelookup( "mp/perktable.csv", 1, var_3, 8 );

    foreach ( var_8 in var_6 )
    {
        if ( var_8 == "" || var_8 == "specialty_null" )
            continue;

        if ( self isitemunlocked( var_8 ) || !maps\mp\_utility::rankingenabled() )
            maps\mp\_utility::giveperk( var_8, 1 );
    }

    if ( !maps\mp\_utility::_hasperk( "specialty_assists" ) )
        self.pers["assistsToKill"] = 0;
}

watchoffhanduse()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_pullback", var_0 );

        if ( self.hasriotshieldequipped )
        {
            self detachshieldmodel( "weapon_riot_shield_mp", "tag_weapon_left" );
            self.hasriotshieldhidden = 1;
        }
        else
            continue;

        self waittill( "offhand_end", var_0 );

        if ( self.hasriotshieldequipped )
        {
            self attachshieldmodel( "weapon_riot_shield_mp", "tag_weapon_left" );
            self.hasriotshieldhidden = 0;
        }
    }
}

trackriotshield()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self.hasriotshield = self hasweapon( "riotshield_mp" );
    self.hasriotshieldequipped = self.currentweaponatspawn == "riotshield_mp";
    thread watchoffhanduse();

    if ( self.hasriotshield )
    {
        if ( self.primaryweapon == "riotshield_mp" && self.secondaryweapon == "riotshield_mp" )
        {
            self attachshieldmodel( "weapon_riot_shield_mp", "tag_weapon_left" );
            self attachshieldmodel( "weapon_riot_shield_mp", "tag_shield_back" );
        }
        else if ( self.hasriotshieldequipped )
            self attachshieldmodel( "weapon_riot_shield_mp", "tag_weapon_left" );
        else
            self attachshieldmodel( "weapon_riot_shield_mp", "tag_shield_back" );
    }

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( var_0 == "riotshield_mp" || var_0 == "iw5_riotshieldjugg_mp" )
        {
            if ( self.hasriotshieldequipped )
                continue;

            if ( self.primaryweapon == var_0 && self.secondaryweapon == var_0 )
                continue;
            else if ( self.hasriotshield )
                self moveshieldmodel( "weapon_riot_shield_mp", "tag_shield_back", "tag_weapon_left" );
            else
                self attachshieldmodel( "weapon_riot_shield_mp", "tag_weapon_left" );

            self.hasriotshield = 1;
            self.hasriotshieldequipped = 1;
            continue;
        }

        if ( self ismantling() && var_0 == "none" )
            continue;

        if ( self.hasriotshieldequipped )
        {
            self.hasriotshield = self hasweapon( "riotshield_mp" ) || self hasweapon( "iw5_riotshieldjugg_mp" );

            if ( self.hasriotshield )
                self moveshieldmodel( "weapon_riot_shield_mp", "tag_weapon_left", "tag_shield_back" );
            else
                self detachshieldmodel( "weapon_riot_shield_mp", "tag_weapon_left" );

            self.hasriotshieldequipped = 0;
            continue;
        }

        if ( self.hasriotshield )
        {
            if ( !self hasweapon( "riotshield_mp" ) && !self hasweapon( "iw5_riotshieldjugg_mp" ) )
            {
                self detachshieldmodel( "weapon_riot_shield_mp", "tag_shield_back" );
                self.hasriotshield = 0;
            }
        }
    }
}

tryattach( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 != "back" )
        var_1 = "tag_weapon_left";
    else
        var_1 = "tag_shield_back";

    var_2 = self getattachsize();

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = self getattachtagname( var_3 );

        if ( var_4 == var_1 && self getattachmodelname( var_3 ) == "weapon_riot_shield_mp" )
            return;
    }

    self attachshieldmodel( "weapon_riot_shield_mp", var_1 );
}

trydetach( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 != "back" )
        var_1 = "tag_weapon_left";
    else
        var_1 = "tag_shield_back";

    var_2 = self getattachsize();

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = self getattachmodelname( var_3 );

        if ( var_4 == "weapon_riot_shield_mp" )
        {
            self detachshieldmodel( var_4, var_1 );
            return;
        }
    }

    return;
}

buildweaponname( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level.lettertonumber ) )
        level.lettertonumber = makeletterstonumbers();

    if ( getdvarint( "scr_game_perks" ) == 0 )
        var_2 = "none";

    if ( isdefined( var_4 ) && var_4 != 0 && maps\mp\_utility::getattachmenttype( var_1 ) != "rail" && maps\mp\_utility::getattachmenttype( var_2 ) != "rail" )
        var_4 = undefined;

    if ( maps\mp\_utility::getattachmenttype( var_1 ) == "rail" )
        var_1 = maps\mp\_utility::attachmentmap( var_1, var_0 );
    else if ( maps\mp\_utility::getattachmenttype( var_2 ) == "rail" )
        var_2 = maps\mp\_utility::attachmentmap( var_2, var_0 );

    var_5 = "";

    if ( issubstr( var_0, "iw5_" ) )
    {
        var_6 = var_0 + "_mp";
        var_7 = var_0.size;
        var_5 = getsubstr( var_0, 4, var_7 );
    }
    else
        var_6 = var_0;

    var_8 = [];

    if ( var_1 != "none" && var_2 != "none" )
    {
        if ( level.lettertonumber[var_1[0]] < level.lettertonumber[var_2[0]] )
        {
            var_8[0] = var_1;
            var_8[1] = var_2;
        }
        else if ( level.lettertonumber[var_1[0]] == level.lettertonumber[var_2[0]] )
        {
            if ( level.lettertonumber[var_1[1]] < level.lettertonumber[var_2[1]] )
            {
                var_8[0] = var_1;
                var_8[1] = var_2;
            }
            else
            {
                var_8[0] = var_2;
                var_8[1] = var_1;
            }
        }
        else
        {
            var_8[0] = var_2;
            var_8[1] = var_1;
        }

        if ( maps\mp\_utility::getweaponclass( var_0 ) == "weapon_sniper" && maps\mp\_utility::getattachmenttype( var_1 ) != "rail" && maps\mp\_utility::getattachmenttype( var_2 ) != "rail" )
        {
            if ( var_1 != "zoomscope" && var_2 != "zoomscope" )
                var_8[2] = var_5 + "scope";
        }
    }
    else if ( var_1 != "none" )
    {
        var_8[0] = var_1;

        if ( maps\mp\_utility::getweaponclass( var_0 ) == "weapon_sniper" && maps\mp\_utility::getattachmenttype( var_1 ) != "rail" && var_1 != "zoomscope" )
            var_8[1] = var_5 + "scope";
    }
    else if ( var_2 != "none" )
    {
        var_8[0] = var_2;

        if ( maps\mp\_utility::getweaponclass( var_0 ) == "weapon_sniper" && maps\mp\_utility::getattachmenttype( var_2 ) != "rail" && var_2 != "zoomscope" )
            var_8[1] = var_5 + "scope";
    }
    else if ( maps\mp\_utility::getweaponclass( var_0 ) == "weapon_sniper" )
        var_8[0] = var_5 + "scope";

    if ( isdefined( var_8[0] ) && var_8[0] == "vzscope" )
        var_8[0] = var_5 + "scopevz";
    else if ( isdefined( var_8[1] ) && var_8[1] == "vzscope" )
        var_8[1] = var_5 + "scopevz";
    else if ( isdefined( var_8[2] ) && var_8[2] == "vzscope" )
        var_8[2] = var_5 + "scopevz";

    if ( isdefined( var_8.size ) && var_8.size )
    {
        var_9 = 0;

        while ( var_9 < var_8.size )
        {
            if ( isdefined( var_8[var_9 + 1] ) && common_scripts\utility::is_later_in_alphabet( var_8[var_9], var_8[var_9 + 1] ) )
            {
                var_10 = var_8[var_9];
                var_8[var_9] = var_8[var_9 + 1];
                var_8[var_9 + 1] = var_10;
                var_9 = 0;
                continue;
            }

            var_9++;
        }
    }

    foreach ( var_12 in var_8 )
        var_6 += ( "_" + var_12 );

    if ( issubstr( var_6, "iw5_" ) )
    {
        var_6 = buildweaponnamecamo( var_6, var_3 );
        var_6 = buildweaponnamereticle( var_6, var_4 );
        return var_6;
    }
    else if ( !isvalidweapon( var_6 + "_mp" ) )
        return var_0 + "_mp";
    else
    {
        var_6 = buildweaponnamecamo( var_6, var_3 );
        var_6 = buildweaponnamereticle( var_6, var_4 );
        return var_6 + "_mp";
    }
}

buildweaponnamecamo( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( var_1 <= 0 )
        return var_0;

    if ( var_1 < 10 )
        var_0 += "_camo0";
    else
        var_0 += "_camo";

    var_0 += var_1;
    return var_0;
}

buildweaponnamereticle( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( var_1 <= 0 )
        return var_0;

    var_0 += "_scope";
    var_0 += var_1;
    return var_0;
}

makeletterstonumbers()
{
    var_0 = [];
    var_0["a"] = 0;
    var_0["b"] = 1;
    var_0["c"] = 2;
    var_0["d"] = 3;
    var_0["e"] = 4;
    var_0["f"] = 5;
    var_0["g"] = 6;
    var_0["h"] = 7;
    var_0["i"] = 8;
    var_0["j"] = 9;
    var_0["k"] = 10;
    var_0["l"] = 11;
    var_0["m"] = 12;
    var_0["n"] = 13;
    var_0["o"] = 14;
    var_0["p"] = 15;
    var_0["q"] = 16;
    var_0["r"] = 17;
    var_0["s"] = 18;
    var_0["t"] = 19;
    var_0["u"] = 20;
    var_0["v"] = 21;
    var_0["w"] = 22;
    var_0["x"] = 23;
    var_0["y"] = 24;
    var_0["z"] = 25;
    return var_0;
}

setkillstreaks( var_0, var_1, var_2 )
{
    self.killstreaks = [];
    var_3 = [];

    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        var_4 = maps\mp\killstreaks\_killstreaks::getstreakcost( var_0 );
        var_3[var_4] = var_0;
    }

    if ( isdefined( var_1 ) && var_1 != "none" )
    {
        var_4 = maps\mp\killstreaks\_killstreaks::getstreakcost( var_1 );
        var_3[var_4] = var_1;
    }

    if ( isdefined( var_2 ) && var_2 != "none" )
    {
        var_4 = maps\mp\killstreaks\_killstreaks::getstreakcost( var_2 );
        var_3[var_4] = var_2;
    }

    var_5 = 0;

    foreach ( var_4, var_7 in var_3 )
    {
        if ( var_4 > var_5 )
            var_5 = var_4;
    }

    for ( var_8 = 0; var_8 <= var_5; var_8++ )
    {
        if ( !isdefined( var_3[var_8] ) )
            continue;

        var_7 = var_3[var_8];
        self.killstreaks[var_8] = var_3[var_8];
    }
}

replenishloadout()
{
    var_0 = self.pers["team"];
    var_1 = self.pers["class"];
    var_2 = self getweaponslistall();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        self givemaxammo( var_4 );
        self setweaponammoclip( var_4, 9999 );

        if ( var_4 == "claymore_mp" || var_4 == "claymore_detonator_mp" )
            self setweaponammostock( var_4, 2 );
    }

    if ( self getammocount( level.classgrenades[var_1]["primary"]["type"] ) < level.classgrenades[var_1]["primary"]["count"] )
        self setweaponammoclip( level.classgrenades[var_1]["primary"]["type"], level.classgrenades[var_1]["primary"]["count"] );

    if ( self getammocount( level.classgrenades[var_1]["secondary"]["type"] ) < level.classgrenades[var_1]["secondary"]["count"] )
        self setweaponammoclip( level.classgrenades[var_1]["secondary"]["type"], level.classgrenades[var_1]["secondary"]["count"] );
}

onplayerconnecting()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0.pers["class"] ) )
            var_0.pers["class"] = "";

        if ( !isdefined( var_0.pers["lastClass"] ) )
            var_0.pers["lastClass"] = "";

        var_0.class = var_0.pers["class"];
        var_0.lastclass = var_0.pers["lastClass"];
        var_0.detectexplosives = 0;
        var_0.bombsquadicons = [];
        var_0.bombsquadids = [];
    }
}

fadeaway( var_0, var_1 )
{
    wait(var_0);
    self fadeovertime( var_1 );
    self.alpha = 0;
}

setclass( var_0 )
{
    self.curclass = var_0;
}

getperkforclass( var_0, var_1 )
{
    var_2 = getclassindex( var_1 );

    if ( issubstr( var_1, "custom" ) )
        return cac_getperk( var_2, var_0 );
    else
        return table_getperk( level.classtablename, var_2, var_0 );
}

classhasperk( var_0, var_1 )
{
    return getperkforclass( 0, var_0 ) == var_1 || getperkforclass( 1, var_0 ) == var_1 || getperkforclass( 2, var_0 ) == var_1;
}

isvalidprimary( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    switch ( var_0 )
    {
        case "riotshield":
        case "xm25":
        case "iw5_m60jugg":
        case "iw5_riotshieldjugg":
        case "iw5_m4":
        case "iw5_ak47":
        case "iw5_m16":
        case "iw5_fad":
        case "iw5_acr":
        case "iw5_type95":
        case "iw5_mk14":
        case "iw5_scar":
        case "iw5_g36c":
        case "iw5_cm901":
        case "iw5_mp5":
        case "iw5_mp7":
        case "iw5_m9":
        case "iw5_p90":
        case "iw5_pp90m1":
        case "iw5_ump45":
        case "iw5_barrett":
        case "iw5_rsass":
        case "iw5_dragunov":
        case "iw5_msr":
        case "iw5_as50":
        case "iw5_ksg":
        case "iw5_1887":
        case "iw5_striker":
        case "iw5_aa12":
        case "iw5_usas12":
        case "iw5_spas12":
        case "iw5_m60":
        case "iw5_mk46":
        case "iw5_pecheneg":
        case "iw5_sa80":
        case "iw5_mg36":
        case "iw5_l96a1":
            return 1;
        default:
            if ( var_1 )
            {

            }

            return 0;
    }
}

isvalidsecondary( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    switch ( var_0 )
    {
        case "rpg":
        case "stinger":
        case "javelin":
        case "xm25":
        case "m320":
        case "iw5_usp45":
        case "iw5_mp412jugg":
        case "iw5_usp45jugg":
        case "iw5_44magnum":
        case "iw5_deserteagle":
        case "iw5_mp412":
        case "iw5_g18":
        case "iw5_fmg9":
        case "iw5_mp9":
        case "iw5_skorpion":
        case "iw5_p99":
        case "iw5_fnfiveseven":
        case "iw5_smaw":
            return 1;
        case "riotshield":
        case "iw5_m4":
        case "iw5_ak47":
        case "iw5_m16":
        case "iw5_fad":
        case "iw5_acr":
        case "iw5_type95":
        case "iw5_mk14":
        case "iw5_scar":
        case "iw5_g36c":
        case "iw5_cm901":
        case "iw5_mp5":
        case "iw5_mp7":
        case "iw5_m9":
        case "iw5_p90":
        case "iw5_pp90m1":
        case "iw5_ump45":
        case "iw5_barrett":
        case "iw5_rsass":
        case "iw5_dragunov":
        case "iw5_msr":
        case "iw5_as50":
        case "iw5_ksg":
        case "iw5_1887":
        case "iw5_striker":
        case "iw5_aa12":
        case "iw5_usas12":
        case "iw5_spas12":
        case "iw5_m60":
        case "iw5_mk46":
        case "iw5_pecheneg":
        case "iw5_sa80":
        case "iw5_mg36":
        case "iw5_l96a1":
            if ( getdvarint( "scr_game_perks" ) == 1 && ( var_1 == "specialty_twoprimaries" || var_2 == "specialty_twoprimaries" ) )
                return 1;
            else
                return 0;
        default:
            if ( var_3 )
            {

            }

            return 0;
    }
}

isvalidattachment( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    switch ( var_0 )
    {
        case "none":
        case "thermal":
        case "shotgun":
        case "gl":
        case "m320":
        case "akimbo":
        case "vzscope":
        case "tactical":
        case "reflex":
        case "reflexsmg":
        case "eotech":
        case "eotechsmg":
        case "acog":
        case "acogsmg":
        case "thermalsmg":
        case "reflexlmg":
        case "eotechlmg":
        case "silencer02":
        case "silencer03":
        case "silencer":
        case "gp25":
        case "zoomscope":
        case "grip":
        case "heartbeat":
        case "fmj":
        case "rof":
        case "xmags":
        case "hamrhybrid":
        case "hybrid":
            return 1;
        default:
            if ( var_1 )
            {

            }

            return 0;
    }
}

isattachmentunlocked( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 2;
    var_4 = 4;
    var_5 = self getplayerdata( "weaponRank", var_0 );
    var_6 = int( tablelookup( "mp/weaponRankTable.csv", var_2, maps\mp\_utility::getweaponclass( var_0 ), var_3 ) );
    var_7 = int( tablelookup( "mp/weaponRankTable.csv", var_6, var_1, var_4 ) );

    if ( var_5 >= var_7 )
        return 1;

    return 0;
}

isvalidweaponbuff( var_0 )
{
    switch ( var_0 )
    {
        case "specialty_armorpiercing":
        case "specialty_bulletpenetration":
        case "specialty_marksman":
        case "specialty_bling":
        case "specialty_sharp_focus":
        case "specialty_holdbreathwhileads":
        case "specialty_longerrange":
        case "specialty_fastermelee":
        case "specialty_reducedsway":
        case "specialty_lightweight":
        case "specialty_moredamage":
            return 1;
        default:
            return 0;
    }
}

isweaponbuffunlocked( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 4;
    var_4 = 4;
    var_5 = self getplayerdata( "weaponRank", var_0 );
    var_6 = int( tablelookup( "mp/weaponRankTable.csv", var_2, maps\mp\_utility::getweaponclass( var_0 ), var_3 ) );
    var_7 = int( tablelookup( "mp/weaponRankTable.csv", var_6, var_1, var_4 ) );

    if ( var_5 >= var_7 )
        return 1;

    return 0;
}

isvalidcamo( var_0 )
{
    switch ( var_0 )
    {
        case "none":
        case "red":
        case "blue":
        case "snow":
        case "gold":
        case "classic":
        case "multi":
        case "d_urban":
        case "hex":
        case "choco":
        case "marine":
        case "snake":
        case "winter":
        case "autumn":
            return 1;
        default:
            return 0;
    }
}

isvalidreticle( var_0 )
{
    switch ( var_0 )
    {
        case "none":
        case "ret1":
        case "ret2":
        case "ret3":
        case "ret4":
        case "ret5":
        case "ret6":
            return 1;
        default:
            return 0;
    }
}

iscamounlocked( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 3;
    var_4 = 4;
    var_5 = self getplayerdata( "weaponRank", var_0 );
    var_6 = int( tablelookup( "mp/weaponRankTable.csv", var_2, maps\mp\_utility::getweaponclass( var_0 ), var_3 ) );
    var_7 = int( tablelookup( "mp/weaponRankTable.csv", var_6, var_1, var_4 ) );

    if ( var_5 >= var_7 )
        return 1;

    return 0;
}

isvalidequipment( var_0 )
{
    switch ( var_0 )
    {
        case "claymore_mp":
        case "frag_grenade_mp":
        case "throwingknife_mp":
        case "specialty_portable_radar":
        case "semtex_mp":
        case "c4_mp":
        case "bouncingbetty_mp":
            return 1;
        default:
            return 0;
    }
}

isvalidoffhand( var_0 )
{
    switch ( var_0 )
    {
        case "concussion_grenade_mp":
        case "trophy_mp":
        case "smoke_grenade_mp":
        case "specialty_portable_radar":
        case "flash_grenade_mp":
        case "specialty_scrambler":
        case "specialty_tacticalinsertion":
        case "emp_grenade_mp":
            return 1;
        default:
            return 0;
    }
}

isvalidperk1( var_0 )
{
    switch ( var_0 )
    {
        case "specialty_scavenger":
        case "specialty_blindeye":
        case "specialty_longersprint":
        case "specialty_fastreload":
        case "specialty_paint":
            return 1;
        default:
            return 0;
    }
}

isvalidperk2( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 != "specialty_anytwo" )
    {
        switch ( var_0 )
        {
            case "specialty_coldblooded":
            case "specialty_assists":
            case "specialty_quickdraw":
            case "specialty_twoprimaries":
            case "specialty_hardline":
            case "_specialty_blastshield":
                return 1;
            default:
                return 0;
        }
    }

    return 1;
}

isvalidperk3( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 != "specialty_anytwo" )
    {
        switch ( var_0 )
        {
            case "specialty_bulletaccuracy":
            case "specialty_detectexplosive":
            case "specialty_autospot":
            case "specialty_quieter":
            case "specialty_stalker":
                return 1;
            default:
                return 0;
        }
    }

    return 1;
}

isvaliddeathstreak( var_0 )
{
    switch ( var_0 )
    {
        case "specialty_null":
        case "specialty_finalstand":
        case "specialty_uav":
        case "specialty_juiced":
        case "specialty_grenadepulldeath":
        case "specialty_revenge":
        case "specialty_stopping_power":
        case "specialty_c4death":
            return 1;
        default:
            return 0;
    }
}

isvalidweapon( var_0 )
{
    if ( !isdefined( level.weaponrefs ) )
    {
        level.weaponrefs = [];

        foreach ( var_2 in level.weaponlist )
            level.weaponrefs[var_2] = 1;
    }

    if ( isdefined( level.weaponrefs[var_0] ) )
        return 1;

    return 0;
}

isvalidkillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "helicopter":
        case "none":
        case "sentry":
        case "ac130":
        case "emp":
        case "uav":
        case "double_uav":
        case "triple_uav":
        case "precision_airstrike":
        case "predator_missile":
        case "counter_uav":
        case "airdrop_assault":
        case "airdrop_sentry_minigun":
        case "airdrop_juggernaut":
        case "helicopter_flares":
        case "littlebird_flock":
        case "stealth_airstrike":
        case "airdrop_trap":
        case "minigun_turret":
        case "escort_airdrop":
        case "osprey_gunner":
        case "deployable_vest":
        case "directional_uav":
        case "heli_sniper":
        case "ims":
        case "aastrike":
        case "remote_mortar":
        case "remote_mg_turret":
        case "airdrop_juggernaut_recon":
        case "uav_support":
        case "remote_uav":
        case "remote_tank":
        case "airdrop_remote_tank":
        case "sam_turret":
        case "littlebird_support":
        case "specialty_longersprint_ks":
        case "specialty_fastreload_ks":
        case "specialty_scavenger_ks":
        case "specialty_blindeye_ks":
        case "specialty_paint_ks":
        case "specialty_hardline_ks":
        case "specialty_coldblooded_ks":
        case "specialty_quickdraw_ks":
        case "specialty_assists_ks":
        case "_specialty_blastshield_ks":
        case "specialty_detectexplosive_ks":
        case "specialty_autospot_ks":
        case "specialty_bulletaccuracy_ks":
        case "specialty_quieter_ks":
        case "specialty_stalker_ks":
            return 1;
        default:
            return 0;
    }
}
