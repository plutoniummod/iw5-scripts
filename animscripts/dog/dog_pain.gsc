// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("dog");

main()
{
    self endon( "killanimscript" );

    if ( isdefined( self.enemy ) && isdefined( self.enemy.syncedmeleetarget ) && self.enemy.syncedmeleetarget == self )
    {
        self unlink();
        self.enemy.syncedmeleetarget = undefined;
    }

    self clearanim( %root, 0.2 );
    self setflaggedanimrestart( "dog_pain_anim", %german_shepherd_run_pain, 1, 0.2, 1 );
    animscripts\shared::_id_0C51( "dog_pain_anim" );
}