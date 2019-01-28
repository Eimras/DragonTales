//ADD GIVE POWER TO KAIOSHIN AND SHIT
var/list/Rankz=list(\
"Basic"=list(/obj/Skills/Fly,/obj/Skills/Attacks/Blast,/obj/Skills/Attacks/Charge,/obj/Skills/Attacks/Beams/Beam,/obj/Skills/PowerControl,/obj/Skills/Rank/Zanzoken),

"Nine Arts Dragon"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/GaleWindDestructionStrike,/obj/Skills/Rank/Walking,/obj/Skills/MartialArts/Set_Stance,/obj/Skills/MartialArts/Activate_Stance,/obj/Skills/MartialArts/Activate_Advanced_Stance,/obj/Skills/MartialArts/Set_Advanced_Stance,/obj/Skills/PowerControl,/obj/Skills/Attacks/Beams/ChaoticHeavensDestructionStrike,/obj/Skills/Rank/ForceStomp,/obj/Skills/TierS/BlackOriginThreshold),

"Guardian"=list(/obj/Skills/DonateRPP, //Guardian Skills start here
/obj/Skills/Heal,
/obj/Skills/PowerControl,
/obj/Skills/Materialization,
/obj/Skills/Rank/GivePower,
/obj/Skills/SendEnergy,
/obj/Skills/Rank/UnlockPotential,
/obj/Skills/Rank/Splitclone,
/obj/Skills/Buffs/Expand,
/obj/Skills/Buffs/Focus,
/obj/Skills/Telepathy,
/obj/Projectiles/fevProjectile/HellzoneGrenade,
/obj/Skills/Attacks/Beams/Masenko,
/obj/Skills/Attacks/Makosen,
/obj/Skills/Rank/Dragonballs,
/obj/Skills/Rank/MakeSword,
/obj/Skills/Rank/UpgradeSword,
/obj/Skills/Attacks/Sokidan), //Guardian Skills end here

"Assistant Guardian"=list(/obj/Skills/Heal,/obj/Skills/Rank/GivePower,/obj/Skills/Rank/Zanzoken,/obj/Skills/PowerControl),

"Turtle Hermit"=list(/obj/Skills/Attacks/Beams/Kamehameha,
/obj/Skills/Rank/SpiritBurst,
/obj/Skills/Attacks/HyperTornado,
/obj/Skills/Feva/Beam/BusterBarrage,
/obj/Skills/Rank/Zanzoken,
/obj/Skills/Buffs/Expand,
/obj/Skills/Buffs/Focus,
/obj/Skills/SendEnergy,
/obj/Skills/Heal,
/obj/Skills/Rank/GivePower,
/obj/Skills/Attacks/SekihaTenkyoken,
/obj/Skills/Attacks/Beams/TyphoonCannon,
/obj/Skills/SuperExplosiveWave),

"Crane Hermit"=list(/obj/Skills/Attacks/Beams/Dodompa,
/obj/Skills/Rank/Taiyoken,
/obj/Skills/Attacks/Kikoho,
/obj/Skills/SelfDestruct,
/obj/Skills/Rank/Splitclone,
/obj/Skills/Feva/MassSplitform,
/obj/Skills/Feva/Splitform,
/obj/Skills/Rank/SuperGhostKamikaze,
/obj/Skills/Rank/BurningShot,
/obj/Skills/Attacks/Kienzan,
/obj/Skills/SendEnergy,
/obj/Skills/Attacks/Beams/ThunderFlash),

"Wolf Hermit"=list(/obj/Effects/WolfFangFist,
/obj/Skills/Attacks/JechtShot,
/obj/Skills/MartialArts/Clothes_Line,
/obj/Skills/MartialArts/LightningLariat,
/obj/Skills/MartialArts/SunlightYellowOverdrive,
/obj/Skills/MartialArts/CAST_FIST,
/obj/Skills/MartialArts/TheKnee,
/obj/Skills/MartialArts/AsaKujaku),

"Sword Master"=list(/obj/Skills/TierS/WeaponSoul,
/obj/Skills/Swords/AirRender,
/obj/Skills/Swords/Sweeping_Blade,
/obj/Skills/Swords/GreatDivide,
/obj/Skills/Swords/TsunamiStrike,
/obj/Skills/Swords/ScarringBreeze,
/obj/Skills/Rank/MakeSword,
/obj/Skills/Rank/UpgradeSword,
/obj/Skills/Swords/Megiddo,
/obj/Skills/Swords/Tipper,
/obj/Skills/Swords/SpinAttack),

/*"Demon Hunter"=list(/obj/Skills/Extra/QuicksilverTime,
/obj/Skills/Swords/AirRender,
/obj/Skills/Swords/Sweeping_Blade,
/obj/Skills/Swords/GreatDivide,
/obj/Skills/Swords/TsunamiStrike,
/obj/Skills/Swords/ScarringBreeze,
/obj/Skills/Rank/MakeSword,
/obj/Skills/Rank/UpgradeSword,
/obj/Skills/Swords/Megiddo,
/obj/Skills/Swords/Tipper,
/obj/Skills/Swords/SpinAttack),

"Maid-Fu"=list(/obj/Skills/TierS/WeaponSoul,
/obj/Skills/Swords/AirRender,
/obj/Skills/Swords/Sweeping_Blade,
/obj/Skills/Swords/GreatDivide,
/obj/Skills/Swords/TsunamiStrike,
/obj/Skills/Swords/ScarringBreeze,
/obj/Skills/Rank/MakeSword,
/obj/Skills/Rank/UpgradeSword,
/obj/Skills/Swords/Megiddo,
/obj/Skills/Swords/Tipper,
/obj/Skills/Swords/SpinAttack),

"Hyuuga"=list(/obj/Skills/TierS/WeaponSoul,
/obj/Skills/Swords/AirRender,
/obj/Skills/Swords/Sweeping_Blade,
/obj/Skills/Swords/GreatDivide,
/obj/Skills/Swords/TsunamiStrike,
/obj/Skills/Swords/ScarringBreeze,
/obj/Skills/Rank/MakeSword,
/obj/Skills/Rank/UpgradeSword,
/obj/Skills/Swords/Megiddo,
/obj/Skills/Swords/Tipper,
/obj/Skills/Swords/SpinAttack),

"Uchiha"=list(/obj/Skills/TierS/WeaponSoul,
/obj/Skills/Swords/AirRender,
/obj/Skills/Swords/Sweeping_Blade,
/obj/Skills/Swords/GreatDivide,
/obj/Skills/Swords/TsunamiStrike,
/obj/Skills/Swords/ScarringBreeze,
/obj/Skills/Rank/MakeSword,
/obj/Skills/Rank/UpgradeSword,
/obj/Skills/Swords/Megiddo,
/obj/Skills/Swords/Tipper,
/obj/Skills/Swords/SpinAttack),*/

"Spirit Detective"=list(/obj/Skills/Attacks/SpiritGun,/obj/Skills/Rank/Kiai,/obj/Skills/Rank/Zanzoken,/obj/Skills/Buffs/Expand,/obj/Skills/Buffs/Focus,/obj/Skills/Buffs/SpiritWave,/obj/Skills/Rank/GivePower,/obj/Skills/Telepathy),

"Namekian Elder"=list(/obj/Skills/DonateRPP,/obj/Skills/PowerControl,/obj/Skills/Heal,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/Shield,/obj/Skills/Rank/UnlockPotential,/obj/Skills/Rank/GivePower,/obj/Skills/NamekianFusion,/obj/Skills/Rank/Dragonballs,/obj/Skills/Rank/Splitclone,/obj/Skills/Telepathy,/obj/Skills/Attacks/Beams/Masenko,/obj/Skills/Attacks/Beams/Piercer,/obj/Skills/Attacks/Sokidan,/obj/Skills/Attacks/Makosen),
"Namek Teacher"=list(/obj/Skills/Feva/Beam/HellzoneGrenade,/obj/Skills/Buffs/Focus,/obj/Skills/Attacks/Beams/Masenko,/obj/Skills/Attacks/Beams/Piercer,/obj/Skills/Attacks/Makosen,/obj/Skills/Buffs/Expand,/obj/Skills/Rank/Zanzoken,/obj/Skills/Attacks/Beams/Ray,/obj/Skills/Attacks/HomingFinisher,/obj/Skills/Attacks/Beams/ThunderFlash,/obj/Skills/Rank/Splitclone,),

"Vegeta Leader"=list(/obj/Skills/DonateRPP,
/obj/Skills/Attacks/Beams/GalicGun,
/obj/Skills/Attacks/Beams/FinalFlash,
/obj/Skills/Buffs/Expand,
/obj/Skills/Buffs/Focus,
/obj/Skills/MartialArts/Clothes_Line,
/obj/Skills/PowerControl,
/obj/Skills/FalseMoon,
/obj/Skills/ConquerorsHaki),

"Vegeta Teacher"=list(/obj/Skills/SelfDestruct,/obj/Skills/Buffs/Expand,/obj/Skills/SuperExplosiveWave,/obj/Skills/FalseMoon,/obj/Skills/Attacks/BigBang),

"Yardrat Master"=list(/obj/Skills/Rank/ShunkanIdo,/obj/Skills/Rank/Zanzoken,/obj/Skills/Attacks/Sokidan,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Rank/Splitclone,/obj/Skills/Heal,/obj/Skills/PowerControl,/obj/Skills/Materialization),
"Arconia SM"=list(/obj/Skills/Rank/Splitclone,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Expand,/obj/Skills/Attacks/Barrage,/obj/Skills/Buffs/Focus),

"Changeling Lord"=list(/obj/Skills/Attacks/Kienzan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Expand,/obj/Skills/Attacks/Beams/Ray,/obj/Skills/Attacks/DeathBall,/obj/Skills/Attacks/Barrage,/obj/Skills/Buffs/Focus),
"Ice SM"=list(/obj/Skills/PowerControl,/obj/Skills/Rank/Shield,/obj/Skills/Buffs/Focus,/obj/Skills/Attacks/Sokidan,/obj/Skills/Buffs/Expand),

"Kaioshin"=list(/obj/Skills/DonateRPP,
/obj/Skills/Attacks/Beams/SuperDragonFist,
/obj/Skills/Buffs/Mystic,
/obj/Skills/Rank/Mysticize,
/obj/Skills/Rank/KaioTeleport,
/obj/Skills/Attacks/HomingFinisher,
/obj/Skills/Attacks/Makosen,
/obj/Skills/Attacks/Sokidan,
/obj/Skills/Buffs/Focus,
/obj/Skills/PowerControl,
/obj/Skills/Materialization,
/obj/Skills/Rank/KaioRevive,
/obj/Skills/Rank/KeepBody,
/obj/Skills/Heal,
/obj/Skills/Rank/Shield,
/obj/Skills/Rank/UnlockPotential,
/obj/Skills/Rank/RestoreYouth,
/obj/Skills/Rank/Bind,
/obj/Skills/Rank/GivePower,
/obj/Skills/SendEnergy,
/obj/Skills/Rank/Kiai,
/obj/Skills/Attacks/Beams/GouHadoken,
/obj/Skills/Telepathy,
/obj/Skills/Observe,
/obj/Skills/Rank/Splitclone,
/obj/Skills/Feva/Splitform,
/obj/Skills/Attacks/SpiritGun,
/obj/Skills/Attacks/SpiritSword,
/obj/Skills/Rank/Kaioken,
/obj/Skills/Attacks/SpiritBomb,
/obj/Skills/Rank/MakeSword,
/obj/Skills/Swords/ImproveSword,
/obj/Skills/Senjutsu/SageMode,
/obj/Skills/Senjutsu/SageKikoho,
/obj/Skills/Senjutsu/SageExpand,
/obj/Skills/Senjutsu/SageFocus,
/obj/Skills/Senjutsu/SageSplitform,
/obj/Skills/Senjutsu/SunlightSpear
),

"North Kaio"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/KeepBody,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Rank/Kaioken,/obj/Skills/Rank/GivePower,/obj/Skills/Attacks/SpiritBomb,/obj/Skills/Rank/KaioTeleport,/obj/Skills/Observe,/obj/Skills/Telepathy),
"South Kaio"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/KeepBody,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Rank/Splitclone,/obj/Skills/Rank/GivePower,/obj/Skills/Attacks/Beams/SuperDragonFist,/obj/Skills/Rank/SpiritBurst,/obj/Skills/Rank/KaioTeleport,/obj/Skills/Observe,/obj/Skills/Telepathy),
"East Kaio"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/KeepBody,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Buffs/Expand,/obj/Skills/Rank/GivePower,/obj/Skills/MetamoreanFusion,/obj/Skills/Attacks/HyperTornado,/obj/Skills/Rank/KaioTeleport,/obj/Skills/Observe,/obj/Skills/Telepathy),
"West Kaio"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/KeepBody,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Rank/GivePower,/obj/Skills/SuperExplosiveWave,/obj/Skills/Attacks/Beams/ThunderFlash,/obj/Skills/SelfDestruct,/obj/Skills/Rank/KaioTeleport,/obj/Skills/Observe,/obj/Skills/Telepathy),

"Daimaou"=list(/obj/Skills/DonateRPP,
/obj/Skills/Buffs/TitanForm,
/obj/Skills/Rank/MakeSword,
/obj/Skills/Swords/ImproveSword,
/obj/Skills/Attacks/Beams/Piercer,
/obj/Skills/Attacks/Beams/Ray,
/obj/Skills/Buffs/Majin,
/obj/Skills/Rank/KaioRevive,
/obj/Skills/Rank/MakeAmulet,
/obj/Skills/PowerControl,
/obj/Skills/Rank/Majinize,
/obj/Skills/Rank/KeepBody,
/obj/Skills/Materialization,
/obj/Skills/Rank/Imitation,
/obj/Skills/Rank/RestoreYouth,
/obj/Skills/Rank/Bind,
/obj/Skills/Attacks/DeathBall,
/obj/Skills/SuperExplosiveWave,
/obj/Skills/Rank/Splitclone,
/obj/Skills/Rank/UnlockPotential,
/obj/Skills/Telepathy,
/obj/Skills/Rank/Contractor,
/obj/Skills/Rank/HeartlessAngel,
/obj/Skills/Extra/Amaterasu,
/obj/Skills/SoultearStorm,
/obj/Skills/Rank/Necromancy,
/obj/Skills/Rank/Conjure,
/obj/Skills/Rank/StarRevive,
/obj/Skills/Rank/GiveJaganEye,
/obj/Skills/Buffs/DarknessFlame,
/obj/Skills/Attacks/Beams/BlackDragon,
/obj/Skills/Attacks/Makosen,
/obj/Skills/Attacks/JechtShot,
/obj/Skills/Buffs/Expand,
/obj/Skills/Rank/GivePower,
/obj/Skills/SendEnergy,
/obj/Skills/Rank/Kiai,
/obj/Skills/SelfDestruct,
/obj/Skills/Feva/Splitform,
/obj/Skills/Observe,
/obj/Skills/Rank/SuperGhostKamikaze,
/obj/Skills/SoultearStorm,
/obj/Skills/Rank/AgonyField
),

"Hell SM"=list(/obj/Skills/Attacks/Kienzan,/obj/Skills/Attacks/Beams/Ray,/obj/Skills/Attacks/Sokidan,/obj/Skills/Buffs/Expand,/obj/Skills/Buffs/Majin,/obj/Skills/Materialization,/obj/Skills/SelfDestruct,/obj/Skills/Rank/Imitation,/obj/Skills/Attacks/Barrage,/obj/Skills/SuperExplosiveWave,/obj/Skills/Buffs/Focus,/obj/Skills/Rank/KeepBody,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/Contractor,/obj/Skills/Rank/HeartlessAngel,/obj/Skills/Observe,/obj/Skills/Telepathy),
"Lower Hell Warden"=list(/obj/Skills/Attacks/Kienzan,/obj/Skills/Attacks/Beams/Ray,/obj/Skills/Attacks/Sokidan,/obj/Skills/Attacks/Barrage,/obj/Skills/SuperExplosiveWave,/obj/Skills/Buffs/Focus,/obj/Skills/Rank/KeepBody,/obj/Skills/Rank/HeartlessAngel,/obj/Skills/Buffs/Majin,/obj/Skills/Rank/SuperGhostKamikaze,/obj/Skills/Telepathy,/obj/Skills/Rank/StarRevive),
"Upper Hell Warden"=list(/obj/Skills/Buffs/Expand,/obj/Skills/Buffs/TitanForm,/obj/Skills/Rank/Splitclone,/obj/Skills/Buffs/Majin,/obj/Skills/Attacks/JechtShot,/obj/Skills/Telepathy,/obj/Skills/Rank/KeepBody,/obj/Skills/Swords/GreatDivide,/obj/Skills/SoultearStorm,/obj/Skills/Rank/StarRevive))


var/Ranks={"<html><body>
<u>Guardian</u>
 <ul>
  <li>Earth</u>:
  <li>Namek</lu>:
 </ul>
<u>Assistant Guardian</u>
 <ul>
  <li>Earth</u>:
  <li>Namek</lu>:
 </ul>
<u>Supreme Teachers</u>
 <ul>
  <li>Yardrat:</li>
  <li>Turtle:</li>
  <li>Crane:</li>
 </ul>
<u>Minor Teachers</u>
 <ul>
  <li>Earth:</li> 0/2
  <li>Vegeta:</li> 0/2
  <li>Namek:</li> 0/2
 </ul>
<u>Leaders*</u>
 <ul>
  <li>Vegeta:</li>
  <li>Earth:</li>
  <li>Arconia:</li>
 </ul>
<u>Afterlife</u>
 <ul>
  <li>Kaioshin:</li>
  <li>North Kaio:</li>
  <li>South Kaio:</li>
  <li>East Kaio:</li>
  <li>West Kaio:</li>
  <li>Daimaous:</li>
  <li>Upper Warden:</li>
  <li>Lower Warden:</li>
 </ul>
*Since there's only one official leader skillset and that's normally reserved for Vegeta's KoV, you'll have to share skills or ask for others as a leader of another world.

</body><html>"}

var/AdminNotes={"<html><head><title>Admin Notes</title></head><body><body bgcolor="#000000"><font color="#FFFFFF">
</center>
<h2>DNR List.</h2>
<h4>Put the reason too</h4>
<ul>
<li></li>
<li></li>
<li></li>
<li></lli>
<li></li>
</ul>
<br />
<hr />

</body></html>
"}


var/Notes={"<html><head><title>Notes</title></head><body><body bgcolor="#000000">
<font color="#CCCCCC"><center><h1>Welcome!</h1></center>
Jump into the adventure with your very own character that you can constructvely roleplay! If you'd like to help the game out, you can donate at <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LYLMWM7M5S7DA&lc=GB&item_name=Valekor%20shell%20server%20costs&item_number=Shell%20Server%20Donation&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted">this link</a> to support our server costs!
<br>
</nl>

</body></html>
"}


var/Story={"

"}
var/Rules={"<html>
<body>
<h1 id="Top">Rules</h1>
<h2>Universal</h2>
<ul>
<li>If an action you take is clearly making the game stressful for others, action will be taken to remove you.
<li>If something’s 'technically' not against the rules, action will be taken as if you had broken the rules.
<li>If something’s 'technically' against the rules, it’s not against the rules. This applies to staff too. This basically mean you can’t ruleshark a player (or admin) over something that’s ambiguously a violation of the rules. For admins, this means they can’t take action on a player they don’t like over the pretense of “technically” breaking a rule.
<li>If you have a legitimate problem and/or concern with the game, its features, its management or its conduct, report it in some manner. Do not keep it to yourself if it’s a real concern.
</ul>

<h2>OOC</h2>
<ul>
<li>Don’t flame/troll/etc. Kindness and courtesy go a long way in this community, contrary to popular belief. This means don’t intentionally instigate arguments and flame wars over the OOC channel constantly.
<li>Staff decisions are final. Do not argue, complain or try to bribe the person making the decision over Skype, OOC, or Say. Take it to the complaint forum and leave it there. We –will- listen.
<li>While the staff is not above you, they need to be treated with respect because they’re taking their time out to make sure you have the best playing experience. If they are failing to do their job, then stick it into the complaint section of the forums. That being said, if a staff member does not show you basic respect, you do not need to show them respect.
<li>Actually help new players. If you’re dissing the new guy without an RP name that’s actually trying to figure stuff out, you’ll get banned outright.
<li>No form of bug abusing is allowed. If you think it’s a bug, chances are it is one. It’s best to ask staff first, however.
<li>People who say 'Save for wipe', 'First', 'Last', or any variation will have their save deleted. (Just kidding!)
<li>No alt interaction of any kind without express admin permission.
<li>Ranks are to be held at a higher standard than normal players. Any punishments a normal player would receive should be expected to be greater if you are a rank. We reserve the right to strip you at our discretion if we believe you are acting unsportsmanlike or not roleplaying in a manner befitting of a rank. Set an example. Don’t become one.
<li>You’re not allowed to state the legal status of something without providing a source for the actual law on a national (not state) level.
<li>Do NOT sexually harass anyone OOCly, this includes but is not limited to talking about sexual content to the point it is offensive and grotesque. There is a difference between joking and harassment, learn the difference!
</ul>

<h2>Roleplay/Game</h2>
<ul>
<li>No rape. Even with OOC consent. Giving people the worst L of their lives does not count as rape.
<li>Do not stay cloaked/invisible for long periods of time, especially while powered down.
<li>Do not spill IC information over the OOC channel, such as the identities of ranks.
<li>Custom icons are fine as long as others can still recognize your race from it.
<li>Do not be passive aggressive in your Roleplays no matter the situation. If something obviously bothers you and is legitimate, report it.
<li>If someone is KOed, be courteous enough to allow them to roleplay. However, if it comes to the point where they are taking too long and keeping an IC situation at a stand-still and/or it feels like they are stalling for something such as rescuers, you may report it.
<li>Don't EZ. This means don't utilize third-party programs in order to better your training/combat experiences or others.
<li>Use common sense when doing an action that’d negatively impact another player - countdown, roleplay, etc. Only a countdown is required for destroying walls/doors, same with most actions.
<li>Don’t teleport away from a fight unless you RP it first.
<li>You cannot use invisibility in direct combat unless you are aiming to escape or have express permission to do so.
<li>You can only steal from, relocate or imprison people who are AFK. You may also KO them, but it cannot lead to indirect killing such as from drowning or from brutal wounds.
<li>Use some measure of basic common sense while fighting. Don’t step into regenerations tanks while in combat, don’t use an amulet while beaming, don’t use Keep Body on someone mid-verb (unless specifically RPed.) Don’t build while fighting either, etc.
<li>Only the Earth Guardian and the Assistant Guardian ICly know how to plant and grow Senzu Beans.
</ul>

<h2>Combat</h2>
<ul>
<li>If someone has to go AFK in a hostile situation, they will still be there. They’ll just be unable to defend themselves and can be lethal’d without mercy even if they’ve logged off or it wasn’t implied before the AFK.
<li>Do not toggle and use lethal in combat unless all participants agree and everyone in the area is aware that you are using lethal.
<li>Lethal beaming is explicitly banned. This rule can be ignored in the case of mutually-agreed epic moments, and Event Characters may still lethal during combat as they are temporary villains designed to cause damage.
<li>If someone states lethal against you, it’s assumed that you’re lethal against them unless otherwise expressed.
<li>After being KOed, you must turn on pure RP mode if requested, but the person who requested it must also turn it on. The person who KOed you is the only one who can request you turning RP mode on, however. If the person who KO'd you has their attention taken away from you for longer than a single fight, then you may turn off RP mode but are still KO'd unless healed or allowed to be conscious and up by the person who KO'd you.
<li>Everyone has one save attempt allowed for them, but can have more if the person who KO'd them allows it. Within that single save attempt, only up to four people can try.
<li>You can't snipe a kill from someone somebody else KOed without the explicit permission from the who did the KOing.
<li>It is to be assumed that the person you have knocked out wants to roleplay in response to any actions. If they do not respond for an excessive amount of time, adminhelp about it. However, if your adminhelp is not addressed after an excessive amount of time, you may proceed with whatever you wish as long as no save is attempted or the save attempt is used up.
<li>While in a hostile situation, the only time you are allowed to meditate to regain health is after the start of a new fight when a countdown hits 15 seconds, and then must stop when it hits 0. A hostile situation is defined as a situation where one or more people seek to KO and/or kill you with obvious malicious intent in mind.
<li>Burst Regeneration can only be used in one fight three times.
<li>DAing (Death Avoiding) can and will result in severe punishment.
<li>Beams cannot be charged until the countdown before firing them. Special rank beams (read: those multitiled "fuck everything in your general direction" beams) cannot be held for more than fifteen seconds per use (Unless utilizing them to break down a wall)
<li>You can Power Up before a countdown ends, but ONLY after the first 15 seconds of the countdown have passed. You also usually cannot be powered-up before a fight unless you were in a previous combat situation. There is some leeway with this, I.E. powering up into a trans before engaging in actual combat, and holding it with RP mode to account for greater drain due to the strain. This is more for situations such as storing 200% PU and keeping RP mode on (or are an android) when you think you're about to fight.
<li>Senzu Beans cannot be used during combat. If used on someone KOed and aimed at for death/maiming/whatever it counts as a save attempt.
</ul>

<h2>Death</h2>
<ul>
<li>Killing over bad/poor/nonexistant reasons can warrant a revive for the victim and severe punishment for you.
<li>Do not pretype Kill RPs.
<li>Unless stated otherwise by staff, you are only allowed to stay in the Final Realms for 3 OOC days. After those have passed, you are forcibly reincarnated.
<li>Prior to any sort of battle/skirmish, you must have clearly stated OOCly that you have lethal intent towards the party of whom you wish to kill.
</ul>
</body>
</html>

"}

var/Credits={"<html><head><title>Credits</title></head><body><body bgcolor="#000000"><br><br>
A listing of all known people that have provided assistance in some form or another to this game.<br>
Owner: lol<br>
Coders: lol<br>
"}

var/TransTiers={"<html>
<b>Sub-SSJ:</b> Giji, Spirit Doll Ascension 1, Namekian Ascension 1, Tuffle Ascension 1<br>
<b>SSJ:</b> Super Saiyan, High Tension, Pulse, God Mode, Devil Trigger, Unbound Mode, Super Berserk<br>
<b>SSJ1.5:</b> Red High Tension, Transcend, Namekian Ascension 2, 3 Tails, Balls of Iron, Tuffle Ascension 2, Cardinal Ascension, Makyo Ascension 1, Nanite 1, Alpha, Super Frenzy<br>
<b>SSJ2:</b> Super Saiyan 2, Titan God Mode, Ascended Devil Trigger, 6 Tails, Super Berserk 2<br>
<b>SSJ2.5:</b> Blue High Tension, Transcend Ascension 2, Super Namekian, 9 Tails, Tuffle Ascension 3, Ascension 1 Unbound Mode, Divine Ascension, Makyo Ascension 2, True LSSj, Nanite 2, Super Frenzy 2<br>
<b>SSJ3:</b> Super Saiyan 3, Super Saiyan 4, Final Ascension Super Namekian, Mantra God Mode, Balls of Steel, Ascension 2 Unbound Mode, Super Berserk 3, Super Frenzy 3, Alpha 2<br>
<b>SSJ3.5:</b> Blue Super High Tension, Mazoku Devil Trigger, Final Tuffle Ascension, Blessed Ascension, Makyo Ascension 3, Nanite 3<br>
<b>oh:</b> Super Spiral Mode, Heart of Darkness, Kaioshin Ascension, LSSj3, CSSj4, Super Saiyan God<br>
<b>Variable:</b> Super Mystic, Super Majin, Makyo Star Infusion, CSSj<br>
<br>
Disclaimer: If you're inferior to your opponent at verb, or they possess bullshit amounts of enablement, they will still beat the brakes off your monkey ass, wholesale. If you think offense dump small Goten is a good build, no level of a trans will save you from that boomerang chop to the throat. Get good, scrub.
"}


mob/proc/Index(var/blah)
	var/htmlz={"<body bgcolor="#000000" text="#CCCCCC" link="aqua" vlink="green" alink="white">
<font face="Tahoma" style="font-size: 8pt"> <center><big><b>[blah]</b></big></center><br>"}
	switch(blah)
		if("Index")
			src<<browse({"[htmlz]
<b>Welcome to [world.name]!</b><br>
Click on the guide(s) pertaining to your curiousity.<br><br>
<font color=red>Be <i>SURE</i> to read the Rules and if you're new I suggest the Guide!<font color=white><br><br>
<a href=?src=\ref[usr];action=Updates>Updates</a><br><hr>
<a href=?src=\ref[usr];action=Rules>Rules</a><br><hr>
<a href=?src=\ref[usr];action=Story>Story</a><br><hr>
<a href=?src=\ref[usr];action=Ranks>Ranks</a><br><hr>
<a href=?src=\ref[usr];action=Guide>Guide</a><br><hr>
<a href=?src=\ref[usr];action=Credits>Credits</a><br><hr>
<a href=?src=\ref[usr];action=TransformationTiers>Transformation Tiers</a><br><hr><br>"})
		if("Story")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Story]<br><br>")
		if("Rules")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Rules]<br><br>")
		if("Ranks")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Ranks]<br><br>")
		if("Updates")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Updates]<br><br>")
		if("Guide")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Guide]<br><br>")
		if("Credits")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Credits]<br><br>")
		if("TransformationTiers")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[TransTiers]<br><br>")

mob/Topic(A,B[])
	if(B["action"]!="edit"&&B["action"]!="magic")
		switch(B["action"])
			if("Index")
				usr.Index("Index")
			if("Guide")
				usr.Index("Guide")
			if("Story")
				usr.Index("Story")
			if("Rules")
				usr.Index("Rules")
			if("Ranks")
				usr.Index("Ranks")
			if("Updates")
				usr.Index("Updates")
			if("Credits")
				usr.Index("Credits")
			if("TransformationTiers")
				usr.Index("TransformationTiers")
	else
		..()


client/Topic(href,href_list[],hsrc)
	if(href_list["action"]=="MasterControl"&&href_list["do"]=="Vote"&&usr.Admin)
		usr:AdminVote(hsrc)
	else if(href_list["action"]=="MasterControl"&&ismob(hsrc))
		if(href_list["do"]=="PM")
			usr:PM(hsrc, href_list["ID"])
		if(href_list["do"]=="PM2")
			usr:PM2(hsrc)
		if(href_list["do"]=="TPM")
			usr:TwoWayTelepath(hsrc)
		if(href_list["do"]=="CTPM")
		{
			usr:CHAOSTwoWayTelepath(hsrc)
		}
		else
			if(usr:Admin)
				if(href_list["do"])
					switch(href_list["do"])
						if("Adminize")
							usr:Adminize(hsrc)
						if("Rewarderize")
							usr:Rewarderize(hsrc)
						if("Edit")
							usr:Edit(hsrc)
						if("Mute")
							usr:Mute(hsrc)
						if("Observe")
							usr:Observe_(hsrc)
						if("Heal")
							usr:AdminHeal(hsrc)
						if("Ban")
							usr:Ban(hsrc)
						if("Give")
							usr:MagicMaterialize(hsrc)
						if("Revive")
							usr:AdminRevive(hsrc)
						if("Summon")
							usr:Summon(hsrc)
						if("Teleport")
							usr:Teleport(hsrc)
						if("XYZTeleport")
							usr:XYZTeleport(hsrc)
						if("Log")
							usr:PlayerLog(hsrc)
						if("TempLog")
							usr:PlayerTempLog(hsrc)
						if("ArchiveLog")
							usr:PlayerArchiveLog(hsrc)
						if("SkillLog")
							usr:PlayerSkillLog(hsrc)
						if("Assess")
							usr<<browse(hsrc:GetAssess(),"window=Assess;size=275x650")
						if("Boot")
							usr:Delete(hsrc)
						if("KO")
							usr:AdminKO(hsrc)
						if("Kill")
							usr:AdminKill(hsrc)
						if("SendToSpawn")
							usr:SendToSpawnz(hsrc)
						if("Reward")
							usr:Reward(hsrc)
				else
					var/View={"<html><head><title>Player Control [hsrc:key]</title><body>
					<font size=3><font color=red>[hsrc:name]<hr><font size=2><font color=black>"}
					View+={"

					\[ <a href=?src=\ref[hsrc];action=MasterControl;do=Adminize>Promote/Demote</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Mute>Mute</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=PM>Admin PM</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Observe>Observe</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=SendToSpawn>Send to Spawn</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Assess>Assess | <a href=?src=\ref[hsrc];action=MasterControl;do=Give>Give</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Kill>Kill</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=KO>Knockout</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Heal>Heal<a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Revive>Revive</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Log>Check Log</a href>  | <a href=?src=\ref[hsrc];action=MasterControl;do=TempLog>Check Temp Log</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=ArchiveLog>Check Archive Log</a href> |<a href=?src=\ref[hsrc];action=MasterControl;do=SkillLog>Check Skill log</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Reward>Reward</a href>  | <a href=?src=\ref[hsrc];action=MasterControl;do=Edit>Edit</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Summon>Summon</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Teleport>Teleport to</a href>  | <a href=?src=\ref[hsrc];action=MasterControl;do=XYZTeleport>XYZ Teleport</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Boot>Boot</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Ban>Ban</a href> \]
					"}
					src<<browse(View,"window=Person;size=500x135")
	else if(href_list["action"]=="RewardControl"&&ismob(hsrc))
		if(href_list["do"])
			switch(href_list["do"])
				if("Log")
					usr:RewarderPlayerLog(hsrc)
				if("TempLog")
					usr:RewarderPlayerTempLog(hsrc)
				if("ArchiveLog")
					usr:RewarderPlayerArchiveLog(hsrc)
				if("Reward")
					usr:RewardRPP(hsrc)
				if("ManualReward")
					usr:ManualReward(hsrc)
		else
			var/View={"<html><head><title>Reward Control [hsrc:key]</title><body>
			<font size=3><font color=red>[hsrc:name]<hr><font size=2><font color=black>"}
			View+={"
			\[ <a href=?src=\ref[hsrc];action=RewardControl;do=Log>Check Log</a href>  | <a href=?src=\ref[hsrc];action=RewardControl;do=TempLog>Check Temp Log</a href> | <a href=?src=\ref[hsrc];action=RewardControl;do=ArchiveLog>Check Archive Log</a href> | <a href=?src=\ref[hsrc];action=RewardControl;do=Reward>Reward</a href> | <a href=?src=\ref[hsrc];action=RewardControl;do=ManualReward>Manual Reward</a href> \]
			"}
			src<<browse(View,"window=RewardPerson;size=500x135")
	..()


var/Guide={"
<html>
<head><title>Guide</title></head>
<body><body bgcolor=black text=white>
<p>The guide isn't all done as you might contemplate, but its good

enough for now.</p>
 <h2>Roleplay</h2>
  <p>There is a roleplay game! Use the say verb and emote verb

frequenctly and often! Rewards in this game are based on roleplay! Sure

you could train all day and not roleplay but eventually rewards will

become more important and you will be left in the desert power-wise.</p>
<ul>
<li><b>Battle</b> Make it clear that you want to initiate battle with

someone, then allow them time to respond. DONT countdown like a panzy

unless its been awhile and you think they're stalling, its alright to

countdown then.</li>
<li><b>Stealing</b> Make your intention clear then countdown despite if

anyones around, if someone intervenes in stopping you, stop what you're

doing and reply to them, then countdown again.</li>
<li><b>Killing</b> Enter your roleplay, and if theres no one around,

kill them. However, if there is, you must hit countdown, and if anyone

intervenes you must stop what you're doing and reply to them and then

recountdown unless you make clear in your roleplay that you do not

intend to stop, in that case that person can react to you, and you can

react to the person you're trying to kill.
</ul>

 <h2>Training</h2>
  <p>There are a few ways of training: training skills, flying,

sparring, punching logs or punching bags. You can intensify and increase

the gain by using weights or using gravity!</p>
 <h2>Items</h2>
 <p>I spoon-fed you most of the skills but these you're going to have to

find out :)</p>
<h2>Mating/Breeding</h2>
 <p>I'll let you figure this one out too :)</p>
 <h2>Skills</h2>
 <p>Nearly all skills are masterable besides skills like self destruct

for obvious reasons. There are three ways to learn a skill: naturally,

observing, or being taught. After a skill is mastered 100% you may teach

it to someone using the teach verb, otherwise you can 'teach' them it be

continually using it in front of them, otherwise known as 'leeching'.

Some skills are more diffucult to leech then others, and some even have

energy reqs. before even considering if you can learn it.</p>
 <ul>
   <li><b>Beams</b>  A channeled beam of concentrated energy that

increases in distance, power, and speed when trained.
    <ol>
      <li>Basic - naturally learned</li>
      <li>Dodompa</li>
      <li>Final Flash</li>
      <li>Galic Gun - a multi-tiled beam.</li>
      <li>Kamehameha - a multi-tiled beam.</li>
      <li>Masenko</li>
      <li>Piercer</li>
      <li>Ray</li>
    </ol></li>
   <li><b>Blast</b> A basic skill, naturally learned by every race at a

certain energy req. Fires a single rapid blast that if trained can

lessen the delay for rapid fire action! </li>
   <li><b>Charge</b> A basic skill, naturally learned by every race at a

certain energy req. A single super charged ki blast. At first the blast

takes seemingly forever to charge but as its mastery increases the

tediousness decreases, a decent refire time for a well-worth charged

ball of energy!</li>
   <li><b>Expand</b> A muscle manipulation skill, allows the user to

sacrifice a bit of their recovery, skill, and speed for extra power,

strength, and endurance! Trainable up to 4 times expansion. </li>
   <li><b>Fly</b> A basic skill, naturally learned by every race at a

certain energy req. Circulates energy outward to levitate into the air

enabling flight over buildings, water, and the such. Drain is reduced

upon training.</li>
   <li><b>Focus</b> A mind enhancement skill, allows the user to

heighten their force, regeneration, speed, and power at the cost of a

steady drain! The drain lessens upon more mastery. </li>
   <li><b>Give Power</b> A power transfer skill, the user sacrifices

their well-being to give their power to another. The higher the mastery

the less percent of getting knocked out. </li>
   <li><b>Heal</b> A healing technique, the user sacrifices some of

their energy and power to restore the health of another person. The

higher the mastery the less consequence. </li>
   <li><b>Homing Finisher</b> A homing type of energy attack, creating

multiple concentrated balls of energy that target against a victim. The

higher the mastery, the more spheres and less delay. </li>
   <li><b>Invisibility</b> An invisibility rendering skill, unmasterable

at thsi time. </li>
   <li><b>Kaioken</b> A special skill devised by the North Kaio,

masterable up to 20x. </li>
   <li><b>Kienzan</b> A piercing disc of concentrated energy that will

slice through person after wall after wall after person. Trainable to

reduce charge time and delay. </li>
   <li><b>Kikoho</b> A multi-tiled huge sphere of concentrated energy,

takes a toll out of its user to use but the consequence can be lessened

upon mastery along with delay. </li>
   <li><b>Kiai</b> An energy explosion type of attack, damages people in

the area and sends them flying. Damage and distance multiplier can be

increased by mastery. </li>
   <li><b>Majinize</b> Used by the Daimaou to create servants. </li>
   <li><b>Majin</b> A buff type of skill that increases raw power but

grants servitude to the one who majinized you. </li>
   <li><b>Make Amulet</b> Used by the Daimaou to create Amulets to the

dead zone. </li>
   <li><b>Makosen</b> A series of blasts are combursted instantly. Delay

decreased and blasts increased upon mastery. </li>
   <li><b>Materialize</b> Materialize weights out of thin air! Weights

are used for training enhancements. </li>
   <li><b>Mysticize</b> Used by the kaioshin to purify their loyals.

</li>
   <li><b>Mystic</b> A buff type of skill that increases potential

rather than raw power, cancels anger. </li>
   <li><b>Namekian Fusion</b> Racial skill for namekians, pay the

ultimate price with their life, is it worth it for the power? Obviously

unmasterable.</li>
   <li><b>Observe</b> Used to observe people! Unmasterable. </li>
   <li><b>Planet Destruction</b> beh </li>
   <li><b>Power Control</b> Lower your higher your power, unmasterable

at thsi time but will change in the future. </li>
   <li><b>Regenerate</b> Namekian racial skill, unmasterable. Sacrifice

energy for increased health regeneration. </li>
   <li><b>Revive</b> Can be used to revive the dead! Unmasterable. </li>
   <li><b>Self Destruct</b> Pretty obvious, unmasterable. </li>
   <li><b>Shield</b> A skill used to lessen the severity of energy

attacks and the such- drains upon impact. Unmasterable. </li>
   <li><b>Shunkan Ido</b> A skill devised by the Master, can teleport to

any person if in their range of mastery specifications. </li>
   <li><b>Sokidan</b> A manipulation sphere of energy that you can

control by shifting your direction. Higher mastery means faster

reaction, less delay. </li>
   <li><b>Splitform</b> Can duplicate an exact replica of yourself,

clicking them gives control over their actions. Higher mastery means a

higher number of splitforms at one time. </li>
   <li><b>Taiyoken</b> A skill devised by the crane hermit, can blind

their victims. Range and severity increases upon mastery. </li>
   <li><b>Telepathy</b> Obtained by nearly everyone after a certain req,

allows communication between two people telepathically. </li>
   <li><b>Teleport</b> Used by supremacy rulers such as the kaioshin,

this is leechable as well so watch out! </li>
   <li><b>Third Eye</b> A racial skill for humans after a certain req. A

buff that increases regeneration, power, speed and the such at the

expense of lowered anger. </li>
   <li><b>Unlock Potential</b> A skill used by supremacy rulers and such

to unlock powers deep in an individual. Can only be used once on a

person. </li>
   <li><b>Zanzoken</b> Increases velocity to unimaginable heights, click

a turf to instantly 'zap' to it. Increasing mastery decreases drain.

</li>



 </ul>



</body>
</html>
"}