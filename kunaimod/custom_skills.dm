obj/Effects/Extra/Amaterasu
	icon='KunaiMod/Icons/amaterasu.dmi'

obj/Effects/ShadowNui
	icon='KunaiMod/Icons/kagenui.dmi'
	layer=111

obj/Effects/ShadowGasp
	icon='KunaiMod/Icons/kagekubi.dmi'
	layer=111

obj/Effects/Extra/Amaterasu/Toust
	icon='KunaiMod/Icons/amaterasu.dmi'

obj/Effects/Extra/SixFour
	icon='KunaiMod/Icons/trigrams.dmi'
	layer=2
	pixel_x=-96
	pixel_y=-40

obj
	Effects
		EyeCandy
			icon='KunaiMod/Icons/eyecandy.dmi'
			pixel_x=-18
			pixel_y=5
proc
	EyeCandy(mob/m,State)
		var/obj/Effects/EyeCandy/RP=new
		RP.loc=m.loc
		RP.icon_state=State
		m.Frozen=1

		animate(RP,transform=matrix()*2,time=7)
		spawn(10)
			animate(RP,transform=matrix()*3,alpha=0,time=7)
		spawn(20)
			m.Frozen=0
			del RP

var/list/genfluff = list("Your body suddenly stops moving?!","You feel calm... mind wanders off... Wait, no!--","You dodge a sudden Kunai aimed at your face!-- Where did that come from!?","You halt to shield your eyes from rose petals... Huh?","You curse as you feel a tight knot in your chest!--","You groan subtly as your legs feel extremely painful!","You feel drowzy... sleepy...","What a nice day, isn't it? LOL!-- What?","You can't forget those cursed eyes, no matter how much you try...","GODDAMN IT... GENJUTSU!!!","G-Genjutsu?... What the fuck?","Oh god, the pain...")

/mob/proc/WeakTsukiyomi(mob/boi)
	var/tricked = pick(genfluff)
	if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(1,2))
		boi.Energy-=2
	else if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(1,2))
		boi.Energy-=3
	else if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(1,3))
		boi.Energy-=4
	else if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(1,3))
		boi.Energy-=5
	else if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(1,4))
		boi.Energy-=6
	else if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(2,4))
		boi.Energy-=7
	else if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(3,6))
		boi.Energy-=8
	else if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(4,7))
		boi.Energy-=9
	else if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(5,8))
		boi.Energy-=10
	else if(prob(10))
		boi<<"[tricked]"
		Stun(boi,rand(10,12))
		boi.Energy-=11

/mob/proc/WeakBleed(mob/aye)
	var/BloodLV=15
	while(BloodLV)
		SpawnBlood(aye)
		aye.Health-=0.25
		BloodLV--
		sleep(65)
		if(BloodLV==0||aye.KO)
			BloodLV=0
			break

/mob/proc/StrongBleed(mob/aye)
	var/BloodLV=8
	while(BloodLV)
		SpawnBlood(aye)
		aye.Health-=0.75
		BloodLV--
		sleep(65)
		if(BloodLV==0||aye.KO)
			BloodLV=0
			break

/mob/proc/LowHPBleed(mob/aye)
	while(aye.InjuryAnnounce90==1)
		SpawnBlood(aye)
		aye.Health-=0.02
		sleep(35)
		if(aye.InjuryAnnounce90==0||aye.KO||aye.Health==0)
			aye.Bleeding=0
			break

/mob/proc/SpawnBlood(mob/Bleh)
	var/obj/Effects/Blood/gib=new
	gib.loc=Bleh.loc
	gib.pixel_y=rand(-20,20)
	gib.pixel_x=rand(-20,20)
	spawn(5000)
	del gib

/mob/proc/SpawnBBlood(mob/Bleh)
	var/obj/Effects/Blood/gib=new
	gib.loc=Bleh.loc
	gib.pixel_y=rand(-10,10)
	gib.pixel_x=rand(-10,10)
	spawn(5000)
	del gib

/obj/Effects/BBlood
	icon='KunaiMod/Icons/blood.dmi'
	name="Blood"
	desc="What a mess..."
	Health=100000
	Grabbable=0
	layer=2
	density=0
	Savable=1
	verb/Clean()
		view(usr)<<"[usr] wipes the blood from the ground."
		del src

/obj/Effects/Blood
	icon='KunaiMod/Icons/bloods.dmi'
	desc="Bloody hell..."
	name="Blood"
	Health=100000
	Grabbable=0
	layer=2
	density=0
	Savable=1
	verb/Clean()
		view(usr)<<"[usr] wipes the blood from the ground."
		del src

/obj/Grave
	icon='KunaiMod/Icons/SHIZA.dmi'
	desc="A gravestone, with remains buried below."
	Health=100000
	Grabbable=0
	Savable=1

/obj/Remains
	icon='KunaiMod/Icons/remains.dmi'
	desc="A few mortal remains of something or someone."
	Grabbable=0
	Health=100000
	Savable=1

/obj/Ashes
	icon='KunaiMod/Icons/remainsash.dmi'
	desc="Ashes of what once was probably a living being."
	Grabbable=0
	Health=100000
	Savable=1

/obj/SHIZA
	icon='KunaiMod/Icons/remainsshiza.dmi'
	desc="...*sob*...*sob*...Shiza..."
	Grabbable=0
	Health=100000
	Savable=1
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Bonus DBZ Goonstoof

obj/Skills/Extra/Genkidama
	Teachable=0
	Level=100
	desc="Genkidama thing."
	verb/Genkidama()
		set category="Skills"
		set name="Genkidama"
		usr.SkillX("Genkidama",src)


mob/proc/Genkidama_Energy()
	var/blasts=0
	var/maxblasts=20
	while(blasts<maxblasts&&src.GatheringEnergy)
		blasts++
		var/obj/Projectiles/Mystical/B=new(locate(min(max(src.x+rand(-40,40),1),500),min(max(src.y+rand(-40,40),1),500),src.z))
		B.Distance=Distance
		B.density=0
		B.icon='KunaiMod/Icons/spiritbombenergy.dmi'
		if(!(B in view(50,src)))
			spawn del(B)
			continue
		spawn(10) if(B) spawn()Homing(B,src)
		if(prob(50))sleep(0.1)
		else if(prob(20))sleep(1)
		spawn(40)
		del B

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Vampire Rework

obj/Skills/Extra/Banquet
	Cooldown=5
	Learn=list("energyreq"=5000,"difficulty"=10000)
	desc="succ"
	Level=0
	verb/Banquet()
		set name="Banquet"
		set category="Skills"
		usr.SkillX("Banquet",src)

obj/Skills/Extra/Silvermists
	Cooldown=5
	Learn=list("energyreq"=5000,"difficulty"=10000)
	desc="fluffy regenerate that drains essence"
	Level=0
	verb/Silvermists()
		set name="Silvermists"
		set category="Skills"
		usr.SkillX("Silvermists",src)

obj/Skills/Extra/MinorCharm
	Cooldown=5
	desc="give smol boner"
	Level=0
	verb/MCharm()
		set name="Minor Charm"
		set category="Skills"
		usr.SkillX("MCharm",src)

obj/Skills/Extra/Charm
	Cooldown=5
	desc="give true boner"
	Level=0
	verb/Charm()
		set name="Charm"
		set category="Skills"
		usr.SkillX("Charm",src)



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Naruto Stuff

obj/Skills/Extra/Rasengan
	Cooldown=300
	Learn=list("energyreq"=5000,"difficulty"=10000)
	desc="The Rasengan is a spinning ball of chakra formed and held in the palm of the user's hand. On contact, the Rasengan grinds into its target, propels them along the Rasengan's trajectory - either away from the user - and at some point bursts, causing severe damage at the point of contact."
	Level=0
	verb/Rasengan()
		set name="Rasengan"
		set category="Skills"
		if(src.Level==100)
			src.Cooldown=10
		usr.BuffX("Rasengan",src)

obj/Skills/Extra/Chidori
	Cooldown=300
	Learn=list("energyreq"=5000,"difficulty"=10000)
	desc="The Chidori is a high concentration of lightning chakra around the user's hand. Once the chakra is gathered, users charge at their target and thrust the Chidori into them, piercing them and typically causing fatal damage. Chidori when used with Sharingan will make you imprevious to damage until you hit the enemy"
	Level=0
	verb/Chidori()
		set name="Chidori"
		set category="Skills"
		if(src.Level==100)
			src.Cooldown=10
		usr.BuffX("Chidori",src)

/*obj/Skills/Extra/Raikiri
	Cooldown=500
	Learn=list("energyreq"=5000,"difficulty"=10000)
	desc="The Raikiri is a mastered version of Chidori, which is a higher concentration of lightning chakra around the user's hand. Once the chakra is gathered, users charge at their target and thrust the technique into them, piercing them and typically causing fatal damage. Raikiri when used with Sharingan will make you warp to the enemy on Medium Attack."
	Level=0
	verb/Raikiri()
		set name="Raikiri"
		set category="Skills"
		if(src.Level==100)
			src.Cooldown=10
		usr.BuffX("Raikiri",src)*/

obj/Skills/Extra/SixFourPalms
	desc="Completely wreck your enemy's internals by using your Byakugan to see through and disrupt their spiritual flow."
	Cooldown=500
	verb/SixFourPalms()
		set name="Eight Trigrams: 64 palms"
		set category="Skills"
		usr.BuffX("SixFourPalms", src)


/*obj/Skills/Extra/SharinganKamui
	Teachable=0
	Level=100
	desc="A Mangekyou Sharingan ability. Your left eye is able to utilise a long-range version of Kamui, which can transport targets anywhere in the user's line of sight. The target is surrounded with a barrier space, the location and size of which can be specified at will, and when the user concentrates on the target within, the space at the barrier's centre distorts and draws everything within into another dimension."
	verb/SharinganKamui()
		set category="Skills"
		set name="Mangekyou: Kamui"
		usr.SkillX("PoisonBite",src)*/

obj/Skills/Extra/Amaterasu
	Basic=1
	Teachable=0
	Cooldown=210
	verb/Amaterasu()
		set name="Mangekyou: Amaterasu"
		set category="Skills"
		usr.SkillX("Amaterasu",src)

obj/Skills/Extra/Tsukiyomi
	Basic=1
	Teachable=0
	Cooldown=210
	desc="A Mangekyou Sharingan ability. Your left eye is able to utilise an utterly realistic Genjutsu that damages the enemy's soul itself."
	verb/Tsukiyomi()
		set name="Mangekyou: Tsukiyomi"
		set category="Skills"
		usr.SkillKoon("Tsukiyomi",src)

obj/Skills/Extra/SharinGen
	Basic=1
	Teachable=0
	Cooldown=120
	verb/SharinGen()
		set name="Sharingan: Genjutsu"
		set category="Skills"
		usr.SkillX("Sharingan: Genjutsu",src)

obj/Skills/Extra/ShadowBind
	Basic=1
	Teachable=0
	Cooldown=5
	desc="The Nara clan's secret jutsu. The user extends their shadow on any surface to merge with a target's shadow, thereby forcing them to freeze their movements."
	verb/ShadowBind()
		set name="Shadow Bind Jutsu"
		set category="Skills"
		usr.SkillKoon("ShadowBind",src)

obj/Skills/Extra/ShadowImitate
	Basic=1
	Teachable=0
	Cooldown=10
	desc="The Nara clan's secret jutsu. The user extends their shadow on any surface to merge with a target's shadow, thereby forcing them to freeze their movements. The imitation part is achieved after hard training."
	verb/ShadowBind()
		set name="Shadow Bind Jutsu: Imitate"
		set category="Skills"
		usr.SkillKoon("ShadowImitate",src)


obj/Skills/Extra/ShadowChoke
	Basic=1
	Teachable=0
	Cooldown=20
	desc="The Nara clan's advanced secret jutsu. A technique developed from the Nara clan's secret Shadow Bind Technique with combat in mind. It is possible to inflict direct damage to the enemy by transforming and moving shadows endowed with physical power."
	verb/ShadowChoke()
		set name="Shadow Strangle Jutsu"
		set category="Skills"
		usr.SkillKoon("ShadowChoke",src)


obj/Skills/Extra/ShadowSew
	Basic=1
	Teachable=0
	Cooldown=20
	desc="The Nara clan's advanced hidden jutsu. This is a ninjutsu from among the Nara clan's secret techniques that uses materialised shadows to attack and bind, instead of merely immobilizing and controlling like the Shadow Imitation Technique. The user changes the shape of their shadow into several sharp needles and controls each separately. They can then attack several targets simultaneously and at the same time snatch away their ability to move by sewing them stuck with the shadow threads."
	verb/ShadowSew()
		set name="Shadow Sewing Jutsu"
		set category="Skills"
		usr.SkillKoon("ShadowSew",src)

obj/Skills/Extra/Goukakyuu
	Cooldown=50
	Teachable=0
	Magic=1
	desc="A technique where chakra kneaded inside the body is converted into fire and expelled from the mouth either as a massive orb of roaring flame or as a continuous flame-thrower."
	verb/Fireball()
		set category="Skills"
		usr.BlastX("Goukakyuu",src)

obj/Skills/Extra/HandsealPractice
	Basic=1
	Teachable=0
	Cooldown=40
	verb/PracticeDesu()
		set name="Practice Handseals"
		set category="Other"
		usr.SkillX("HSPractice",src)

mob/proc/Rasengan_Check()
	if(RasenganCharge==1)
		src.overlays+=image('KunaiMod/Icons/rasengancharge.dmi')
		view(src)<<sound('KunaiMod/Sounds/rasenganprep.ogg',volume=50,wait=1)
	else if(RasenganCharge==0)
		src.overlays-=image('KunaiMod/Icons/rasengancharge.dmi')

	if(RasenganReady==1)
		src.overlays+=image('KunaiMod/Icons/rasenganready.dmi')
	while(RasenganReady)
		view(src)<<sound('KunaiMod/Sounds/rasenganloop.ogg',volume=50,wait=1)
		sleep(4)
		if(RasenganReady==0)
			src.overlays-=image('KunaiMod/Icons/rasenganready.dmi')
			break
	if(RasenganReady==0)
		src.overlays-=image('KunaiMod/Icons/rasenganready.dmi')


mob/proc/Chidori_Check()
	if(ChidoriCharge==1)
		src.overlays+=image('KunaiMod/Icons/chidoricharge.dmi')
		view(src)<<sound('KunaiMod/Sounds/chidoriprep.ogg',volume=50,wait=1)
	else if(ChidoriCharge==0)
		src.overlays-=image('KunaiMod/Icons/chidoricharge.dmi')

	if(ChidoriReady==1)
		src.overlays+=image('KunaiMod/Icons/chidoriready.dmi')
	while(ChidoriReady)
		view(src)<<sound('KunaiMod/Sounds/chidoriloop.ogg',volume=25,wait=1)
		sleep(4)
		if(ChidoriReady==0)
			src.overlays-=image('KunaiMod/Icons/chidoriready.dmi')
			break
	if(ChidoriReady==0)
		src.overlays-=image('KunaiMod/Icons/chidoriready.dmi')

mob/proc/Choke()
	while(IsChoke)
		src.overlays+=image('KunaiMod/Icons/kagekubi.dmi')
		src.TotalFatigue+=0.15
		src.Health-=0.25
		if(src.IsWeaker)
			src.Health-=0.25
			src.TotalFatigue+=0.15
		sleep(15)
		if(IsChoke==0)
			src.overlays-=image('KunaiMod/Icons/kagekubi.dmi')
			break

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Naga

/*obj/Skills/Extra/SnakeHug
	Teachable=0
	Level=100
	desc="Strangle whoever you have in your hold with your snake tail. Snakegirls really give the best hugs I guess."
	verb/Strangle()
		set category="Skills"
		set name="Snaketail Strangle"
		usr.SkillX("SnakeHug",src)

obj/Skills/Extra/PoisonBite
	Teachable=0
	Level=100
	desc="Bite whoever you have in your hold with your poisonous fangs."
	verb/PoisonBite()
		set category="Skills"
		set name="Snakefang Bite"
		usr.SkillX("PoisonBite",src)

obj/Skills/Extra/PoisonAbsorb
	Teachable=0
	Level=100
	desc="SUCC poison."
	verb/PoisonBite()
		set category="Skills"
		set name="Snakefang Bite"
		usr.SkillX("PoisonBite",src)

obj/Skills/Extra/StoneGaze
	Teachable=0
	Level=100
	desc="Turn someone partially into stone."
	verb/StoneGaze()
		set category="Skills"
		set name="Cursed Eyes: Stone Gaze"
		usr.SkillX("StoneGaze",src)*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CQC

obj/Skills/Extra/NanayaRemember
	Basic=1
	Teachable=0
	Cooldown=10
	desc="Remember the basics of your training... Remember how killing feels really good..."
	verb/NanayaRemember()
		set name="Remember The Basics of Nanaya Training"
		set category="Skills"
		if(usr.Using)
			usr<<"((If you spam this it won't be my fault if you somehow end up with 304295839421 of the same skill, k? Just wait, memories can't flood back in a blink, boy.))"
			return
		usr.Using=1
		sleep(10)
		usr<<"<i>...Shitomeru ka...</i>"
		usr.contents+=new/obj/Skills/Extra/NanayaMode
		sleep(30)
		usr<<"<i>...Sensou...</i>"
		usr.contents+=new/obj/Skills/Extra/NanayaDash
		sleep(30)
		usr<<"<i>...Ochirou...</i>"
		usr.contents+=new/obj/Skills/Feva/NanayaKick
		sleep(30)
		usr<<"<i>...Zankei ni shosu...</i>"
		usr.contents+=new/obj/Skills/Extra/NanayaCombo
		sleep(30)
		usr<<"<i>...Gokusaitochire...</i>"
		usr.contents+=new/obj/Skills/Extra/NanayaFatalStrike
		sleep(30)
		usr<<"<i>...Nanatsu-Yoru...</i>"
		usr.contents+=new/obj/Items/Dagger
		sleep(30)
		for(var/obj/Skills/Extra/NanayaRemember/R in usr)
			del(R)
		usr.Using=0

obj/Skills/Extra/DHRemember
	Basic=1
	Teachable=0
	Cooldown=10
	desc="Remember the basics of your Demon Hunter training... Pizza, man, Pizza..."
	verb/Remember()
		set name="How To Be A Donte 101"
		set category="Skills"
		if(usr.Using)
			usr<<"((If you spam this it won't be my fault if you somehow end up with 304295839421 of the same skill, k? Just wait, memories can't flood back in a blink, boy.))"
			return
		usr.Using=1
		sleep(11)
		usr<<"<i>...Dance with 'em!</i>"
		usr.contents+=new/obj/Skills/Extra/LeadStorm
		sleep(11)
		usr<<"<i>...Make 'em dance!</i>"
		usr.contents+=new/obj/Skills/Extra/BulletTime
		sleep(11)
		usr<<"<i>...Dance around 'em!</i>"
		usr.contents+=new/obj/Skills/Extra/ThinAir
		sleep(11)
		usr<<"<i>...Chase 'em up!</i>"
		usr.contents+=new/obj/Skills/Extra/Chaser
		sleep(11)
		usr<<"<i>...Sting 'em up!</i>"
		usr.contents+=new/obj/Skills/Extra/ThousandStabs
		sleep(11)
		usr<<"<i>...Swing 'em up!</i>"
		usr.contents+=new/obj/Skills/Feva/Extra/RisingTide
		sleep(11)
		usr<<"<i>...Make 'em take it slow!</i>"
		usr.contents+=new/obj/Skills/Extra/Quicksilver
		sleep(11)
		usr<<"<i>...Shrug 'em off!</i>"
		usr.contents+=new/obj/Skills/Extra/Relentless
		sleep(11)
		usr<<"<i>...Divine retribution!</i>"
		usr.contents+=new/obj/Skills/Extra/Retaliate
		sleep(11)
		usr<<"<i>...Know no pain!</i>"
		usr.contents+=new/obj/Skills/Extra/AbsorbKarma
		sleep(11)
		usr<<"<i>...Rebellion or Redemption?</i>"
		usr.contents+=new/obj/Items/Sword
		sleep(11)
		for(var/obj/Skills/Extra/DHRemember/R in usr)
			del(R)
		usr.Using=0

obj/Skills/Extra/NaraRemember
	Basic=1
	Teachable=0
	Cooldown=10
	desc="Remember the basics of your Shinobi training... What a drag!"
	verb/Remember()
		set name="What A Draaaaag..."
		set category="Skills"
		if(usr.Using)
			usr<<"((If you spam this it won't be my fault if you somehow end up with 304295839421 of the same skill, k? Just wait, memories can't flood back in a blink, boy.))"
			return
		usr.Using=1
		sleep(11)
		usr<<"<i>...Shadow Bind...</i>"
		usr.contents+=new/obj/Skills/Extra/ShadowBind
		sleep(11)
		usr<<"<i>...Shadow Imitation...</i>"
		usr.contents+=new/obj/Skills/Extra/ShadowImitate
		sleep(11)
		usr<<"<i>...Shadow Choke...</i>"
		usr.contents+=new/obj/Skills/Extra/ShadowChoke
		sleep(11)
		usr<<"<i>...Shadow Sewing...</i>"
		usr.contents+=new/obj/Skills/Extra/ShadowSew
		sleep(11)
		for(var/obj/Skills/Extra/NaraRemember/R in usr)
			del(R)
		usr.Using=0


obj/Skills/Extra/CQC_Remember
	desc="Close your eyes and remember the basics of CQC..."
	Cooldown=5
	verb/RememberTheBasics()
		set name="Remember The Basics Of CQC..."
		set category="Skills"
		if(usr.Using)return
		usr<<"<i>(Disclaimer: You better not log off during this, my boy.)</i>"
		usr<<"Knife..."
		usr.contents+=new/obj/Items/Dagger
		sleep(30)
		usr<<"Gun..."
		//src.contents+=new/obj/Items/TranqGun
		sleep(30)
		usr<<"Knife-Gun...!!"
		usr.contents+=new/obj/Skills/Extra/MakeCuffs
		sleep(30)
		usr<<"I'm not a murderer..."
		usr.contents+=new/obj/Skills/Extra/CQC_Slam
		sleep(30)
		usr<<"I'm a soldier...!!"
		usr.contents+=new/obj/Skills/Extra/CQC_Restrain
		sleep(30)
		usr<<"I believe in my ideals... My country... My people..."
		usr.contents+=new/obj/Items/Tech/iDroid
		sleep(30)
		usr<<"My... mentor."
		usr.contents+=new/obj/Items/FultonBeacon
		sleep(30)
/*		usr<<"I'll be the one who will bring forth the Boss's final will..."
		usr.contents+=new/obj/Skills/Extra/CQC_Disarm
		sleep(30)
		usr<<"<i>You remember the basics of CQC...</i>"
		usr.contents+=new/obj/Skills/Extra/CQC_Combo*/
		usr.CQCUnlocked=1
		for(var/obj/Skills/Extra/CQC_Remember/R in usr)
			del(R)

/*obj/Skills/Extra/CQC_Combo
	desc="Strike your enemy with three precise hits that will cripple their movement speed and defenses for a bit."
	Cooldown=5
	verb/CQC_Combo()
		set name="CQC: Consecutive"
		set category="Skills"
		usr.BuffX("ConCQC", src)*/

/*obj/Skills/Extra/CQC_Disarm
	desc="Nimbly disarm your enemy from their weapon with a palm to the nose and an arm chop on your next maneuver."
	Cooldown=5
	verb/CQC_Slam()
		set name="CQC Technique: Disarm"
		set category="Skills"
		usr.BuffX("SlamCQC", src)*/

obj/Skills/Extra/CQC_Restrain
	desc="Quickly throw your enemy's attack off their course and grapple them in a restraining position."
	Cooldown=5
	verb/CQC_Slam()
		set name="CQC: Restrain"
		set category="Skills"
		usr.BuffX("CQCRestrain", src)

obj/Skills/Extra/CQC_Slam
	desc="Rapidly put your enemy down on their back with a relatively brutal slamdunk."
	Cooldown=5
	verb/CQC_Slam()
		set name="CQC: Slam"
		set category="Skills"
		usr.SkillX("CQCSlam", src)

obj/Skills/Extra/MakeCuffs
	desc="Project handcuffs from your ass to permanently restrain an evil-doer... Until you release them, that's it."
	Cooldown=5
	verb/MakeCuffs()
		set name="Make Cuffs"
		set category="Skills"
		usr<<"Boop, cuffs appear out of nowhere."
		usr.contents+=new/obj/Items/Handcuffs
		usr.contents+=new/obj/Items/HandcuffKeycard

/*obj/Skills/Extra/FultonRecov
	desc="Send your fellow prisoners straight and off to the motherbase."
	Cooldown=5
	verb/FultonRecov()
		set name="Fulton Recovery"
		set category="Skills"
		usr.SkillX("FultonRecov", src)*/

//////////////////////////////////////////
//Maid-Fu

obj/Skills/Extra/SweepingBroom
	desc="A broom is a maid's weapon of choice for cleaning garbage."
	Cooldown=10
	verb/SweepingBroom()
		set name="Housemaid Art: Sweeping Broom!"
		set category="Skills"
		usr.SkillX("SweepingBroom", src)

obj/Skills/Extra/HiddenBlade2
	desc="Counterattack an unexpecting enemy with the hidden broom in your broom. They'll never see it coming! But no, not really, just counterattack them before they lay a hand on you."
	Cooldown=120
	verb/HiddenBlade2()
		set name="Housemaid Soft Art: Kohakuru Counter!"
		set category="Skills"
		usr.BuffX("HiddenBlade2", src)

obj/Skills/Extra/HiddenBlade
	desc="Counterattack an unexpecting enemy with the hidden blade in your broom. They'll never see it coming!"
	Cooldown=120
	verb/HiddenBlade()
		set name="Housemaid Art: Kohakuru Counter!"
		set category="Skills"
		usr.BuffX("HiddenBlade", src)

obj/Skills/Extra/MemeHomerun
	desc="Time to toss the garbage very very far away, huh?!"
	Cooldown=120
	verb/MemeHomerun()
		set name="Housemaid Art: Homerun Cleaner!"
		set category="Skills"
		usr.BuffX("MemeHomerun", src)

obj/Skills/Extra/MemeTrap
	desc="A good mastermind is required to be proficient in the trap-fu... Though some go far and become the traps themselves for Vax's delight!"
	Cooldown=5
	verb/MemeTrap()
		set name="Mastermind Art: Tee-Hee!"
		set category="Skills"
		usr.SkillX("MemeTrap", src)

obj/Skills/Extra/Sidewhack
	Level=100
	Teachable=0
	Cooldown=8
	desc="Dash forth and past your enemies, whacking them down with your blunt staff."
	verb/Sidewhack()
		set category="Skills"
		set name="Sidewhack"
		usr.SkillX("Sidewhack", src)

obj/Skills/Extra/MakeStaff
	Level=100
	Teachable=0
	Cooldown=25
	desc="Forge a staff."
	verb/MakeStaff()
		set category="Skills"
		usr.contents+=new/obj/Items/BambooStaff
		usr<<"You create a bamboo staff, which seems fitting for giving great beatdowns."

obj/Skills/Extra/MakeFood
	Level=100
	Teachable=0
	Cooldown=25
	desc="Draw out food ingredients from nowhere in particular."
	verb/MakeFood()
		set category="Skills"
		usr.contents+=new/obj/Items/Food
		usr<<"You project food from the oblivion to your inventory. Bluespace's rolling in it's grave right now."

obj/Skills/Extra/MakeDrink
	Level=100
	Teachable=0
	Cooldown=25
	desc="Draw out food ingredients from nowhere in particular."
	verb/MakeDrink()
		set category="Skills"
		usr.contents+=new/obj/Items/Drink
		usr<<"You project drink from the oblivion to your inventory. Bluespace's rolling in it's grave right now."
//////////////////////////////////////////
//Kitsunes

/*/obj/Skills/Extra/Foxfire
	Level=100
	Teachable=0
	desc="Release the blue flames from the depths of your vulpine soul."
	verb/Foxfire()
		set category="Skills"
		set name="Fox Fire"
		usr.BuffX("Foxfire", src)

/obj/Skills/Extra/FoxfireTrick
	Level=100
	Teachable=0
	desc="Confuse your enemies with the blue flames from the depths of your vulpine soul."
	verb/FoxfireBurst()
		set category="Skills"
		set name="Fox Fire: Trick"
		usr.SkillX("FoxfireTrick", src)

/obj/Skills/Extra/FoxfireBurst
	Level=100
	Teachable=0
	desc="Unleash a harming shockwave of blue flames from the depths of your vulpine soul."
	verb/FoxfireBurst()
		set category="Skills"
		set name="Fox Fire: Burst"
		usr.SkillX("FoxfireBurst", src)

/obj/Skills/Extra/FoxfireDrain
	Level=100
	Teachable=0
	desc="Use your blue flames to steal an enemy's life essence."
	verb/FoxfireDrain()
		set category="Skills"
		set name="Fox Fire: Steal"
		usr.SkillX("FoxfireDrain", src)

/obj/Skills/Extra/FoxfireControl
	Level=100
	Teachable=0
	desc="Manipulate a confused enemy into obeying your commands."
	verb/FoxfireDrain()
		set category="Skills"
		set name="Fox Fire: Control"
		usr.SkillX("FoxfireDrain", src)

/obj/Skills/Extra/FoxfireFists
	Level=100
	Teachable=0
	desc="Contain the searing, cold anger of your blue flames in your fists."
	verb/FoxfireFists()
		set category="Skills"
		set name="Fox Fire: Blazing Fists"
		usr.SkillX("FoxfireFists", src)*/

//////////////////////////////////////////
//Fern's wet dream

obj/Skills/Extra/UltraInstinct
	Basic=1
	Teachable=0
	Cooldown=5
	desc="...Release it."
	verb/UltraInstinct()
		set name="Ultra Instinct"
		set category="Skills"
		usr.SkillX("UltraInstinct",src)


//////////////////////////////////////////
//Nanaya

/*obj/Skills/Extra/MEoDP
	Basic=1
	Teachable=0
	Cooldown=10
	desc="The gift from surviving a near-death experience. Those eyes allow you to see the Lines of Death, in which if you cut them, you'll erase the existence of whatever you're attacking and those wounds can't be healed by any method. But seeing the concept of death is not something an average being should have."
	verb/MEoDP()
		set name="Mystic Eyes of Death Perception"
		set category="Skills"
		usr.BuffX("MEoDP",src)

obj/Skills/Extra/TrueMEoDP
	Basic=1
	Teachable=0
	Cooldown=10
	desc="An enhanced version of your Mystic Eyes of Death Perception, in which you fully hold mastery over them."
	verb/MEoDP()
		set name="True Mystic Eyes of Death Perception"
		set category="Skills"
		usr.BuffX("TrueMEoDP",src)*/


obj/Skills/Extra/NanayaMode
	Basic=1
	Teachable=0
	Cooldown=10
	desc="Remember the basics of your training... Remember how killing feels really good..."
	verb/NanayaMode()
		set name="Nanaya Mode"
		set category="Skills"
		usr.BuffX("NanayaMode",src)

obj/Skills/Extra/NanayaKick
	Basic=1
	Teachable=0
	Cooldown=10
	desc="--You'll be the one to fall!! (Omae ga, oshirou!!)"
	verb/NanayaKick()
		set name="Sensou: Blinding Sky"
		set category="Skills"
		usr.SkillX("NanayaKick",src)

obj/Skills/Extra/NanayaSlam
	Basic=1
	Teachable=0
	Cooldown=10
	desc="Time to kill you? (Shitomeru ka?)"
	verb/NanayaSlam()
		set name="Sensa: Dead Horizon"
		set category="Skills"
		usr.BuffX("NanayaSlam",src)

obj/Skills/Extra/NanayaCombo
	Basic=1
	Teachable=0
	Cooldown=10
	desc="--Off with your head! (--Zankei ni shosu!)"
	verb/NanayaCombo()
		set name="Sensa: Riverbed Writings"
		set category="Skills"
		usr.SkillX("NanayaCombo",src)

obj/Skills/Extra/NanayaFatalStrike
	Basic=1
	Teachable=0
	Cooldown=777
	desc="<i>I can see it... (Mieta...)</i>"
	verb/NanayaFatalStrike()
		set name="Sensa: Fatal Strike"
		set category="Skills"
		usr.BuffX("FatalStrike",src)

obj/Skills/Extra/NanayaDash
	Basic=1
	Teachable=0
	desc="Move in blinding speed in a straight line!"
	verb/NanayaDash()
		set name="Sensou: Folded Earth"
		set category="Skills"
		usr.SkillKoon("NanayaDash",src)

//////////////////////////////////////////
//Reploid Racials

/*obj/Skills/Extra/ZBurster
	Basic=1
	Teachable=0
	Cooldown=0.15
	desc="Blast people down with your cybernetic arm cannon! Bang bang!"
	verb/ZBurster()
		set name="Z-Burster"
		set category="Skills"
		usr.SkillX("ZBurster",src)

obj/Skills/Extra/ZSaber
		Basic=1
		Level=100
		Teachable=0
		sicon='KiSword.dmi'
		desc="Form a blade of photon from your arm, using your Force and Strength to inflict damage in melee."
		icon='KiSword.dmi'
		verb/ZSaber()
			set name="Z-Saber"
			set category="Skills"
			usr.SkillX("ZSaber",src) */

//////////////////////////////////////////
//Demon Hunter

obj/Skills/Extra/Relentless
	Level=100
	Teachable=0
	Cooldown=2
	desc="Block the next incoming damage and generate Negative Karma."
	verb/Relentless()
		set category="Skills"
		set name="Royalguard: Relentless"
		usr.SkillKoon("Relentless", src)

obj/Skills/Extra/AbsorbKarma
	Level=100
	Teachable=0
	Cooldown=50
	desc="Convert your Negative Karma into a full heal."
	verb/AbsorbKarma()
		set category="Skills"
		set name="Royalguard: Absorb Karma"
		usr.SkillKoon("AbsorbKarma", src)

obj/Skills/Extra/Retaliate
	Level=100
	Teachable=0
	Cooldown=50
	desc="Convert your Negative Karma into a one-hit fuck up."
	verb/Retaliate()
		set category="Skills"
		set name="Royalguard: Retaliate"
		usr.SkillKoon("Retaliate", src)

obj/Skills/Extra/Quicksilver
	Level=100
	Teachable=0
	Cooldown=5
	desc="Cause a temporary space-time disruption around you."
	verb/Quicksilver()
		set category="Skills"
		set name="Trickster: Quicksilver"
		usr.SkillX("QuicksilverTime", src)

/*obj/Skills/Extra/Roundtrip
	Cooldown=45
	Learn=list("energyreq"=2500,"difficulty"=8)
	icon_state="Kienzan"
	sicon='Blasts.dmi'
	sicon_state="71"
	desc="Winds up and throws your sword at the target. Sword will keep damaging the enemy and root them in place for a few secs"
	SkillCost=50
	verb/Roundtrip()
		set name="Swordmaster: Roundtrip"
		set category="Skills"
		usr.BlastX("Roundtrip",src)
		usr<<"WIP."*/

obj/Skills/Extra/Sidecut
	Level=100
	Teachable=0
	Cooldown=25
	desc="Dash forth and past your enemies, cutting them down with your blade."
	verb/Sidecut()
		set category="Skills"
		set name="Sidecut"
		usr.SkillX("Sidecut", src)

obj/Skills/Extra/ThinAir
	Level=100
	Teachable=0
	Cooldown=0.25
	desc="Move and slide around the target, frustrating them."
	verb/ThinAir()
		set category="Skills"
		set name="Trickster: Thin Air"
		usr.Skill1X("ThinAir",src)

obj/Skills/Extra/Chaser
	Level=100
	Teachable=0
	Cooldown=9
	desc="Dash forth a long distance and slash the first enemy you impact your blade against, dragging them forth."
	verb/Chaser()
		set category="Skills"
		set name="Swordmaster: Chaser"
		usr.SkillKoon("Chaser", src)

obj/Skills/Extra/ThousandStabs
	Level=100
	Teachable=0
	Cooldown=12
	desc="Lockdown the enemy infront of you in a flurry of stabs and thrusts with your blade."
	verb/ThousandStabs()
		set category="Skills"
		set name="Swordmaster: Thousand Stabs"
		usr.SkillKoon("DHCombo", src)

obj/Skills/Extra/BulletTime
	Level=100
	Teachable=0
	Cooldown=0.3
	desc="Lock down the targeted enemy in a flurry of precise shots with your guns."
	verb/BulletTime()
		set category="Skills"
		set name="Gunslinger: Bullet Time"
		usr.SkillKoon("DHBullet", src)

obj/Skills/Extra/LeadStorm
	Level=100
	Teachable=0
	Cooldown=0.4
	desc="Spin around and gun wildly around you, disregarding friends or foes!"
	verb/LeadStorm()
		set category="Skills"
		set name="Gunslinger: Lead Storm"
		usr.SkillKoon("DHLead", src)

/*obj/Skills/Extra/Swordmaster/Roundtrip
	Level=100
	Teachable=0
	Cooldown=5
	desc="Brutally fling your sword at the enemy, the sword will lock in place and stun them while spinning. But sword will be unequipped for the duration."
	verb/Roundtrip()
		set category="Skills"
		set name="Swordmaster: Roundtrip"
			if(var/mob/DemonHuntah==1&&var/mob/Swordmastah==1)
				usr.SkillX("Roundtrip", src)
				for(var/mob/E in hearers(13,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Here's a...!"
			else if(var/mob/DemonHuntah==1&&var/mob/Swordmastah==0)
				src.Swordmastah=1
				src.Gunslinger=0
				src.Royalguard=0
				src.Trickster=0
				for(var/mob/E in hearers(13,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: <b>Swordmaster!</b>"
						E<<"<font color=[C.Text_Color]>[src] says: Here's a...!"
				usr.SkillX("Roundtrip", src)
			else
				src<<"Ur not donte. Don'te try it."
			return*/

/*animate(B.client, color = null, time = 1)
animate(M.client, color = list(0.3,0.3,0.3, 0.59,0.59,0.59, 0.11,0.11,0.11), time = 3)*/
