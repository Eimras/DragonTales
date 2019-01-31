#define MAXBUFFS 3

obj/Skills
	var/Cooldown
	var/BeamUsing
	var/BuffUsing
	var/Basic
	var/ForceSpec
	var/SkillCost=1
	var/RevNum = 0
	var/CustomBPmod=0
	var/CustomBPadd=1
	var/CustomStr=1
	var/CustomForce=1
	var/CustomDura=1
	var/CustomRes=1
	var/CustomOff=1
	var/CustomDef=1
	var/CustomSpeed=1
	var/CustomRecov=1
	var/CustomRegen=1
	var/CustomAnger=1
	var/bpmult = 1
	var/energymult = 1
	var/strmult = 1
	var/endmult = 1
	var/speedmult = 1
	var/forcemult = 1
	var/resmult = 1
	var/offmult = 1
	var/defmult = 1
	var/regenmult = 1
	var/recovmult = 1
	var/sicon
	var/sicon_state
	var/Big
	var/Pierce
	var/list/Learn=new
	var/DragonFist
	var/BlackDragon
	var/Slicing
	var/MegaFlare
	var/GouHadoken
	var/Magic
	var/Pushing
	var/Element
	var/NormalEnchant
	var/TransType
	//var/Homing
	icon='Skillz.dmi'
	var/Teachable

	var/delay = 0

	proc/delayTimer()
		delay = 1
		sleep(5)
		delay = 0

	NuWorldOfNothingness
		verb/World_Of_Nothingness()
			set category="Skills"
			usr.StartWoN()
			usr << "You start the end of the world..."
			for(var/mob/m in world)
				if(m.z == usr.z)
					m << "[usr] has initiated the end of the world at [usr.x], [usr.y], [usr.z]!"
	TargetSwitch
		desc="Switch targets."
		Cooldown=5
		verb/Target_Switch()
			set category="Skills"
			usr.TargetSkillX("TargetSwitch", src)

	Namekian
		ExtendAttack
			Cooldown=20
			sicon='MysticArm.dmi'
			desc = "Extend your arm to punch!"
			verb
				Extend_Attack()

					set category="Skills"
					usr.SkillX("ExtendAttack", src)
		ExtendGrab
			Cooldown=25
			sicon='MysticArm.dmi'
			desc = "Extend your arm to grab someone!"
			verb
				Extend_Grab()

					set category="Skills"
					usr.SkillX("ExtendGrab", src)
		Telekinesis
			Cooldown=45
			desc = "Holds your target in the air briefly and then knocks them away."
			verb
				Telekinesis()
					set category="Skills"
					usr.SkillX("Telekinesis", src)
		InjuryRecovery
			desc="Recover all injuries at the cost of fatigue."
			verb
				Injury_Recovery()
					set category="Skills"
					usr.SkillX("InjuryRecovery", src)
	DeadAgain
		Cooldown=60
		verb/Dead_Again()
			set category="Skills"
			usr.Skill1X("DeadAgain", src)
	RhoAias
		Cooldown=120
		verb/Rho_Aias()
			set category="Skills"
			usr.Skill1X("RhoAias", src)
	KakuyokuSanren
		Cooldown=240
		verb/Kakuyoku_Sanren()
			set category="Skills"
			usr.Skill1X("KakuyokuSanren", src)
	IonioiHetairoi
		Cooldown=3600
		verb/Ionioi_Hetairoi()
			set category="Skills"
			usr.Skill1X("IonioiHetairoi", src)
	UnlimitedBladeWorks
		Cooldown=3600
		verb/Unlimited_Blade_Works()
			set category="Skills"
			usr.Skill1X("UnlimitedBladeWorks", src)
	Caladbolg
		desc="Send your blade flying through the air with the passion of millions."
		Cooldown=1800
		sicon='Caladbolg.dmi'
		verb/Caladbolg()
			set category="Skills"
			usr.Skill1X("Caladbolg", src)
	NineLivesBladeWorks
		desc="Unleash nine deadly strikes upon your opponent!"
		Cooldown=900
		verb/Nine_Lives_Blade_Works()
			set category="Skills"
			usr.Skill1X("NineLivesBladeWorks", src)
	Sense
		Basic=1
		Teachable=0
		Level=0
		desc="Activates your sense tab, with a range dependant on the tier of Sense you have unlocked."
		verb/Sense()
			set category="Skills"
			if(usr.SenseActive)
				usr.SenseActive=0
				usr.SenseRange=0
				usr.see_invisible=0
				usr<<"You stop using your energy senses."
			else
				usr.SenseActive=usr.SenseUnlocked
				if(usr.SenseUnlocked>=2)
					usr.see_invisible=50
				if(!usr.SenseRangeOverride)
					if(usr.SenseActive==1)
						usr.SenseRange=25
					if(usr.SenseActive==2)
						usr.SenseRange=100
					if(usr.SenseActive==3)
						usr.SenseRange=500
					if(usr.SenseActive==4)
						usr.SenseRange=500
				else
					usr.SenseRange=usr.SenseRangeOverride

	ConquerorsHaki
		Cooldown=300
		Teachable=0
		Level=0
		Basic=1
		desc="Can knockout those with low willpower (or regular power for that matter) instantly. Amatsu hates this."
		verb/ConquerorsHaki()
			set category="Skills"
			usr.SkillX("ConquerorsHaki",src)
	Rebirth
		var/LastMod
		desc="Look deep within yourself..."
		verb/Rebirth()
			set category="Skills"
			usr.BuffX("Rebirth",src)
	Bojack
		Level=100
		Teachable=0
		desc="Tear through the restraints of others!"
		verb/Bojack()
			set category="Skills"
			usr.BuffX("Bojack",src)
	Resolve
		Level=100
		Teachable=0
		desc="Become infused with your fighting spirit!"
		verb/Resolve()
			set category="Skills"
			usr.BuffX("Resolve",src)
	Taunt
		Cooldown=300
		desc="Taunt your opponent into a frenzy."
		var
			Kamina="WHO THE HELL DO YOU THINK I AM!?"
		verb/CustomizeTaunt()
			set category="Other"
			set name="Customize Taunt"
			Kamina=input(usr,"Taunt","How it will appear: [usr] [Kamina]" ,Kamina) as text
		verb/Taunt()
			set category="Skills"
			usr.SkillX("Taunt",src)
	RequestBelief
		desc="It's up to them, now."
		Cooldown=50000
		verb/RequestBelief()
			set category="Other"
			usr.BuffX("Hope",src)
	Spirit
		desc="Embue something inanimate with your heroic spirit!"
		verb/Spirit()
			set category="Other"
			usr.SkillX("Spirit",src)
	SecondWind
		Cooldown=120
		desc="Don't give up, shitlord!"
		verb/SecondWind()
			set category="Skills"
			set name="Second Wind"
			usr.SkillX("SecondWind",src)
	Showstopper
		Cooldown=240
		desc="Don't let that motherfucker land that shit!"
		verb/Showstopper()
			set category="Skills"
			usr.SkillX("Showstopper",src)
	Fearless
		Cooldown=120
		desc="I will not be stopped."
		verb/Fearless()
			set category="Skills"
			usr.SkillX("Fearless",src)
	Defiance
		Cooldown=3600
		desc="Channel your inner ichigo."
		verb/Defiance()
			set category="Skills"
			usr.SkillX("Defiance",src)
	Martyr
		Cooldown=3600
		desc="Don't let them fall."
		verb/Martyr()
			set category="Skills"
			usr.SkillX("Martyr",src)
	StrengthOfWill
		Cooldown=180
		desc="Can't let this miss."
		verb/StrengthOfWill()
			set category="Skills"
			set name="Strength Of Will"
			usr.SkillX("StrengthOfWill",src)
	HeroSoul
		Cooldown=5000
		desc="Absolute determination."
		verb/HeroSoul()
			set category="Skills"
			set name="Hero's Soul"
			usr.SkillX("HeroSoul",src)
	HeroHeart
		Cooldown=5000
		desc="Strength and willpower."
		verb/HeroHeart()
			set category="Skills"
			set name="Hero's Heart"
			usr.SkillX("HeroHeart",src)

	Emotion
		var/LastMod
		desc="Concentrate on your negative Od..."
		verb/Emotion()
/*			set category="Skills"
			if(usr.BerserkerMod < 1)
				usr.BerserkerMod=1
			usr.BuffX("Emotion", src)*/

	RefineRipple
		var/LastMod
		desc = "Refine your Rippling."
		verb/RefineRipple()
			set category="Skills"
			set name="Refine Ripple"
			if(usr.RippleMod < 1)
				usr.RippleMod=1
			usr.BuffX("RefineRipple", src)
	RebuffOverdrive
		Cooldown=10
		desc = "Obadraivuuuu."
		verb/Rebuff_Overdrive()
			set category="Skills"
			usr.BuffX("RebuffOverdrive", src)
	ZoomPunch
		Cooldown=30
		Teachable=0
		Level=100
		desc = "Lengthen your arm for a surprise punch!"
		verb/Zoom_Punch()
			set category="Skills"
			usr.BuffX("ZoomPunch", src)
	HealingRipple
		Cooldown=60
		Teachable=0
		Level=100
		desc = "Strike someone with the Ripple to heal them."
		verb/Healing_Ripple()
			set category="Skills"
			usr.BuffX("HealingRipple", src)
	HamonHairAttack
		Cooldown=90
		desc = "Harden your hair for defense!"
		verb/Hamon_Hair_Attack()
			set name="Hamon Hair Attack!"
			set category="Skills"
			usr.BuffX("HamonHairAttack", src)
	TimelyCounter
		Cooldown=120
		Teachable=0
		Level=100
		desc = "Your next line is...!!!"
		verb/Timely_Counter()
			set category="Skills"
			usr.BuffX("TimelyCounter", src)
	OverdriveBarrage
		Cooldown=600
		desc="Unleash a barrage of Overdrives.  Seems obvious."
		verb/Overdrive_Barrage()
			set category="Skills"
			usr.BuffX("OverdriveBarrage", src)
	SendoWaveKick
		Cooldown=90
		desc="Stun an enemy with the Ripple."
		verb/Sendo_Wave_Kick()
			set category="Skills"
			usr.BuffX("SendoWaveKick", src)
	UltimateDeepPassOverdrive
		Teachable=0
		Level=100
		desc = "Pass on all of your knowledge of the Ripple to a worthy successor."
		verb/Ultimate_Deep_Pass_Overdrive()
			set category="Skills"
			usr.BuffX("UltimateDeepPassOverdrive", src)
	//TornadoOverdrive
	//	Cooldown=120
	//	desc = "Charge the wind around you with Ripple, then go in hard."
	//	verb/Tornado_Overdrive()
	//		set category="Skills"
	//		usr.BuffX("TornadoOverdrive", src)
	FinalRipple
		Teachable=0
		Level=100
		desc = "Make one final, fabulous stand."
		verb/Final_Hamon()
			set category="Skills"
			usr.BuffX("FinalRipple", src)
	KamuiRegeneration
		Cooldown=600
		Teachable=0
		Level=0
		desc="Regenerate your body with your affinity for Life Fibers."
		verb/Kamui_Regeneration()
			set category="Skills"
			usr.BlastX("KamuiRegen", src)
	ReturnToLife
		var/LastX
		var/LastY
		var/LastZ
		desc = "Regenerate."
		verb/ReturnToLife()
			set category = "Skills"
			usr.loc = locate(src.LastX, src.LastY, src.LastZ)
			usr.OMessage(10, "[src]'s form regenerates before your very eyes!", "[usr]([usr.key]) used Return to Life.")
			del src
	/*HeadRemoval
		Cooldown=5
		Teachable=1
		Level=0
		desc="Channel your inner Oxywaddle..."
		verb/Head_Removal()
			set category="Skills"
			usr.BuffX("HeadRemoval", src)*/
	/*ManifestScissorBlade
		var/LastUse
		desc = "Make the blade you are using into a Scissor Blade."
		verb/Manifest_Scissor_Blade()
			set category = "Skills"
			for(var/obj/Items/Sword/s in usr.contents)
				if(s.suffix)
					if(usr.SexyMod<4)
						s.ScissorBlade=1
						usr << "You imbue your blade with the power to cut Life Fibers."
					else
						s.ScissorBlade=2
						usr << "You imbue your blade with the power to utterly erase Life Fibers."*/
	CaptainPlanet
		Teachable=0
		Level=0
		desc="It just puts planets overlayed onto you."
		verb/CaptainPlanet()
			set category="Skills"
			usr.BuffX("CaptainPlanet", src)
	SandCoffin
		Cooldown=120
		Teachable=0
		Level=0
		desc="Crush an enemy with inescapable sands."
		verb/Sand_Coffin()
			set category="Skills"
			usr.BlastX("SandCoffin", src)
	Deus_Ex_Machina
		var/LastMod
		Teachable=0
		Level=0
		desc = "Fuse your soul itself with the God of Machines."
		verb/DeusExMachina()
			set category="Skills"
			set name="Sync & Unite"
			if(usr.MachinaMod <= 0)
				usr.MachinaMod=1
			usr.BuffX("DeusExMachina", src)
	DonateRPP
		Basic=1
		desc="Donate RPP."
		verb/Donate_RPP()
			set category="Other"
			usr.BuffX("DonateRPP", src)
	/*DonateDevPoints
		Basic=1
		desc="Donate from your Dev Point bank."
		verb/Donate_Dev_Points()
			set category="Other"
			usr.BuffX("GrantDevPoints", src)*/
	TimeFuck
		Cooldown=1
		desc = "Assume the position of a past self."
		verb/Timefuck()
			set category="Skills"
			usr.BuffX("TimeFuck", src)
	SpaceFuck
		Cooldown=1
		desc = "Teleport to anywhere on your Z plane."
		verb/Spacefuck()
			set category="Skills"
			usr.BuffX("SpaceFuck", src)
	BITCH_I_AM_YOMI
		Cooldown=5
		desc = "A shield that freezes you in place but heals you for half of all the damage a non-physical attack would have done."
		verb/Demon_Energy_Shield()
			set category="Skills"
			usr.BuffX("DemonEnergyShield", src)
	ProtectShade
		Cooldown=100
		desc = "Project a shield of energy that blocks any attack for five seconds. Long cooldown."
		verb/Protect_Shade()
			set category="Skills"
			usr.BuffX("ProtectShade", src)
	PlasmaHold
		Cooldown=30
		desc = "Stuns your target for a short period of time and does minor damage. Decent cooldown."
		verb/PlasmaHold()
			set category="Skills"
			usr.BuffX("PlasmaHold", src)
	WindyThing
		Cooldown=30
		desc = "Use the Windy Thing to become really accurate."
		verb/The_Windy_Thing()
			set category="Skills"
			usr.BuffX("WindyThing", src)
	DeathTolls
		Cooldown=30
		desc = "Use the power of Doom to augment your strength."
		verb/Death_Tolls()
			set category = "Skills"
			usr.BuffX("DeathTolls", src)
	BloodSport
		Cooldown=75
		desc = "Heal your wounds with the blood you spill around."
		verb/Blood_Sport()
			set category="Skills"
			usr.Skill1X("BloodSport", src)
	ThoughtSurge
		Cooldown=30
		desc = "This is probably overpowered."
		verb/Thought_Surge()
			set category="Skills"
			usr.BuffX("ThoughtSurge", src)
	LuckCheck
		Cooldown=1
		desc = "This makes no logical sense."
		verb/Luck_Check()
			set category="Skills"
			usr << "Your luck is: [usr.LightLuck]"
	LuckCleanse
		Cooldown=30
		desc = "This also makes no logical sense."
		verb/Luck_Cleanse()
			set category="Skills"
			usr.LightLuck=100
			if(src.Using)
				return
			usr << "Your luck has been cleansed."
			src.Using=1
			spawn(300)
				src.Using=0
				usr << "Luck Cleanse is off cooldown."
	VoidCheck
		Cooldown=1
		desc = "This makes no logical sense, which means it makes sense."
		verb/Void_Check()
			set category="Skills"
			usr << "Your tolerance to pain is: [usr.VoidPain]"
	VoidCleanse
		Cooldown=30
		desc = "This also makes no logical sense, ensuring that it does make sense."
		verb/Void_Cleanse()
			set category="Skills"
			usr.VoidPain=100
			if(src.Using)
				return
			usr << "Your tolerance to pain has been reset."
			src.Using=1
			spawn(300)
				src.Using=0
				usr << "Void Cleanse is off cooldown."
	RAGE
		Cooldown=30
		desc = "AMATSUUUUUUUUUUUUUUUUUUUUUUUU!!!"
		verb/RAGE()
			set category="Skills"
			usr.BuffX("RAGE", src)
	HopeHarpoon
		Cooldown=30
		desc = "Actually powered by science.  It steals someone's PU and adds it to your's."
		verb/Hope_Harpoon()
			set category="Skills"
			usr.BuffX("HopeHarpoon", src)
	LifeBurst
		Cooldown=600
		desc = "A priceless regeneration burst with a huge cooldown."
		verb/Life_Burst()
			set category="Skills"
			usr.BuffX("LifeBurst", src)
	ChaosTeleport
		Basic=1
		Cooldown=300
		Teachable=0
		Level=100
		desc="Oh god why"
		verb/Chaos_Teleport()
			set category="Skills"
			var/blah=input("Options")in list("Person","Cordinates","Cancel")
			switch(blah)
				if("Person")
					var/list/people=new
					for(var/mob/Players/QQ in world)
						people.Add(QQ)
					var/mob/whoto=people[rand(1, people.len)];
					usr.overlays+=image('BlackHole.dmi',"full")
					sleep(20)
					usr.overlays-=image('BlackHole.dmi',"full")
					if(whoto)
						usr.loc=whoto.loc
						usr.overlays+=image('BlackHole.dmi',"full2")
						sleep(7)
						usr.overlays-=image('BlackHole.dmi',"full2")
						sleep(20)
				if("Cordinates")
					var/blahx=rand(1, 500)
					var/blahy=rand(1, 500)
					var/blahz=rand(1, 27)
					usr.overlays+=image('BlackHole.dmi',"full")
					sleep(20)
					usr.overlays-=image('BlackHole.dmi',"full")
					usr.loc=locate(blahx,blahy,blahz)
					usr.overlays+=image('BlackHole.dmi',"full2")
					sleep(7)
					usr.overlays-=image('BlackHole.dmi',"full2")
					sleep(20)



	RiftTeleport
		Basic=1
		Cooldown=10
		Teachable=0
		Level=100
		desc="Open a rift between dimensions and instantly appear somewhere else."
		verb/Rift_Teleport()
			set category="Skills"
			var/blah=input("Options")in list("Person","Cordinates","Cancel")
			switch(blah)
				if("Person")
					var/list/people=new
					for(var/mob/Players/QQ in world)
						people.Add(QQ)
					var/mob/whoto=input("Teleport to who?")in people
					usr.overlays+=image('BlackHole.dmi',"full")
					sleep(20)
					usr.overlays-=image('BlackHole.dmi',"full")
					if(whoto)
						usr.loc=whoto.loc
						usr.overlays+=image('BlackHole.dmi',"full2")
						sleep(7)
						usr.overlays-=image('BlackHole.dmi',"full2")
						sleep(20)
				if("Cordinates")
					var/blahx=input("x")as num
					var/blahy=input("y")as num
					var/blahz=input("z")as num
					usr.overlays+=image('BlackHole.dmi',"full")
					sleep(20)
					usr.overlays-=image('BlackHole.dmi',"full")
					usr.loc=locate(blahx,blahy,blahz)
					usr.overlays+=image('BlackHole.dmi',"full2")
					sleep(7)
					usr.overlays-=image('BlackHole.dmi',"full2")
					sleep(20)

	LocalSense
		Level=100
		desc="Able to sense people that are in a small area around you."
		verb/LocalSense()
			set category="Skills"
			set name="Local Sense"
			if(usr.SenseCD)
				usr<<"You have to wait inbetween uses of this!"
				return
			usr.Grid("LocalSense")
			usr.SenseCD=1
			usr<<"Sense complete! You can use this verb again in 5 seconds."
			spawn(50)usr.SenseCD=null

	GlobalSense
		Level=100
		desc="Able to sense people on the planet you are currently on."
		verb/GlobalSense()
			set category="Skills"
			set name="Global Sense"
			if(usr.SenseCD)
				usr<<"You have to wait inbetween uses of this!"
				return
			usr.Grid("GlobalSense")
			usr.SenseCD=1
			usr<<"Sense complete! You can use this verb again in 5 seconds."
			spawn(50)usr.SenseCD=null

	UniverseSense
		Teachable=0
		Level=100
		desc="Able to sense people within the entire universe. This includes the Afterlife and Underground areas, but it is not specific where they are in a given area."
		verb/UniversalSense()
			set category="Skills"
			set name="Universal Sense"
			if(usr.SenseCD)
				usr<<"You have to wait inbetween uses of this!"
				return
			usr.Grid("UniverseSense")
//			usr.UniverseWindowRefresher()
			usr.SenseCD=1
			usr<<"Sense complete! You can use this verb again in 5 seconds."
			spawn(50)usr.SenseCD=null

	verb/CustomChangeSkillIcon(Z as icon)
		set category="Other"
		src.sicon_state=input("icon state?") as text
		src.pixel_x=input("Pixel X?") as num
		src.pixel_y=input("Pixel Y?") as num
		src.sicon=Z
		usr<<"[src] icon is now changed to: [src.sicon] / [src.sicon_state]"

	Teach
		Basic=1
		Teachable=0
		Level=0
		desc="Used to teach folks mad skills."
		verb/Teach()
			set category="Skills"
			usr.Teach(src)
	proc/Skill_Increase(Amount=1)
		Level+=1/sqrt(Level)*Amount/MasteryHard
		Level=min(Level,100)
	Super_Saiyan_4
		Teachable=0
		Level=100
		icon = 'SSj4Overlay.dmi'
		desc= "Transform into Super Sand 4"
		verb/Super_Saiyan_4()
			set category = "Skills"
			usr.GoSSJ4()
	Heart_of_Darkness
		Teachable=0
		Level=100
		icon = 'SSj4Overlay.dmi'
		desc= "Unleash the evil within your heart."
		verb/Heart_of_Darkness()
			set category = "Skills"
			if(usr.Class!= "Deus")
				usr<< "You're not evil enough."
				return
			if(usr.Void)
				usr.HeartOfDarkness()
			else
				usr.FakeHOD()
	/*World_of_Nothingness
		Teachable=0
		Level=100
		desc= "Consume everything."
		verb/World_Of_Nothingness()
			set category = "Skills"
			VoidPlanet(usr.z,usr)
			for(var/mob/Players/Q in world)
				if(Q.z == usr.z)
					Q<<"The planet begins to shake and tremble, as clouds begin gathering in the sky."
			sleep(50)
			for(var/mob/Players/Q in world)
				if(Q.z == usr.z)
					Q<<"The clouds turn to static, as the ground below begins to tremble."
			sleep(50)
			for(var/mob/Players/Q in world)
				if(Q.z == usr.z)
					Q<<"A giant glowing heart appears within the sky, as something begins to consume it!"*/

	Bojack_Mode
		Teachable=0
		Level=100
		desc= "Bring to the surface the power of the Galatic Warriors, enhancing your power to new heights."
		verb/BojackMode()
			set category = "Skills"
			set name = "Bojack Mode"
			usr.GoBojack()
	LastBreath
		Basic=1
		Teachable=0
		Level=100
		desc= "Go beyond your limits and continue fighting as long as your body can move. Only use this if this is the last time you will ever fight alive."
		verb/LastBreath()
			set category = "Skills"
			set name = "Last Breath"
			if(usr.Dead) return
/*			if(usr.LastBreath=1)
				usr.LastBreath=0
				return*/
			if(usr.Alert("You sure you want to use Last Breath?"))
				usr.LastBreath=1
	Absorb
		Teachable=0
		Level=100
		icon_state=""
		desc="Allows you to absorb people for their power."
		verb/Absorb()
			set category="Skills"
			usr.Skill1X("Absorb",src)
	BodyMorph
		Cooldown=60
		Teachable=0
		Level=100
		icon_state=""
		desc="Enables you to alter the proportions of your body..!?"
		verb/BodyMorph()
			set category="Skills"
			set name="Body Morph"
			usr.Skill1X("BodyMorph",src)
	Feedback
		Cooldown=120
		Teachable=0
		Level=100
		icon_state=""
		desc="Destroy your opponent with their own energy..."
		verb/Feedback()
			set category="Skills"
			usr.Skill1X("Feedback",src)
	Devour
		Teachable=0
		Level=100
		icon_state=""
		desc="Allows a hollow to eat the lifeforce of others to gain more power."
		verb/Devour()
			set category="Skills"
			usr.Bleach("Devour",src)
	BreakMask
		Teachable=0
		Level=100
		icon_state=""
		desc="Breaking your mask allows you to force yourself into being an Arrancar, the last stage of Hollow Evolution."
		verb/BreakMask()
			set category="Skills"
			usr.Bleach("BreakMask",src)
	Garganta
		Teachable=0
		Level=100
		icon_state=""
		desc="A Hollows perfered method of transportation!"
		verb/Garganta()
			set category="Skills"
			usr.SkillX("Garganta",src)
	SoulContract
		Basic=1
		var
			ContractKey
			SummonX=0
			SummonY=0
			SummonZ=0
			TeleportX=0
			TeleportY=0
			TeleportZ=0
			Teleported=0
			Summoned=0
			Powerz
		Teachable=0
		Level=100
		icon_state="Majin"
		desc="You've been contracted by a powerful entity.."

	Heal
		Learn=list("energyreq"=2000,"difficulty"=3)
		icon_state="Heal"
		desc="This allows you to heal people you are facing."
		verb/Heal()
			set category="Skills"
			usr.SkillX("Heal",src)

	ChaosPunch
		Basic=1
		desc="Much different from the Chaos Dunk.";
		verb
			Chaos_Punch()
				set category="Skills"
				if(usr.ChaosPunching)
				{
					usr.ChaosPunching = 0
					usr << "You dispell the chaos from your fists."
				}
				else
				{
					usr.ChaosPunching = 1
					usr << "You imbue your fists with the power of chaos."
				}

	Fly
		Basic=1
		Level=100
		SkillCost=5
		Learn=list("energyreq"=1000,"difficulty"=2)
		icon_state="Fly"
		desc="This allows you to fly while it constantly drains your energy."
		verb/Fly()
			set category="Skills"
			usr.SkillX("Fly",src)
			sleep()
	ZPlaneWarp
		desc="This allows you to swap between underground and aboveground z planes."
		verb/Z_Plane_Warp(var/num as num)
			set category="Skills"
			var/newZ=num
			usr.loc=locate(usr.x, usr.y, newZ)



	Meditate
		Basic=1
		Level=100
		SkillCost=5
		Learn=list("energyreq"=1000,"difficulty"=2)
		icon_state="Meditate"
		desc="Meditation allows you to recover energy faster then standing, as well as Health and Mana. You are far more likely to be hit in Meditation."
		verb/Meditation()
			set category="Skills"
			usr.SkillX("Meditate",src)
			sleep(10)

	Dig
		Basic=1
		Level=100
		SkillCost=5
		Learn=list("energyreq"=1000,"difficulty"=2)
		icon_state="Meditate"
		desc="Diggity diggity diggity hole. Gets you resources, enhanced by your current digging tool, if any."
		verb/Dig()
			set category="Skills"
			usr.SkillX("Dig",src)
			sleep()

	Train
		Basic=1
		Level=100
		SkillCost=5
		Learn=list("energyreq"=1000,"difficulty"=2)
		icon_state="Meditate"
		desc="No one uses this, but it SLOWLY increases BP, Strength, and Endurance. Shadow box to your heart's content."
		verb/Train()
			set category="Skills"
			usr.SkillX("Train",src)
			sleep()


	Regenerate
		Cooldown=60
		Teachable=0
		Level=100
		icon_state="Regenerate"
		desc="This allows you to highten your regeneration at the loss of energy."
		verb/Regenerate()
			set category="Skills"
			usr.SkillX("Regenerate",src)
	BurstRegenerate
		Cooldown=600
		Teachable=0
		Level=100
		icon_state="Regenerate"
		desc="Cut a large portion of your energy to recover some health. Has a lengthy cooldown."
		verb/Burst_Regeneration()
			set category="Skills"
			usr.Skill1X("BurstRegen",src)
	MayuriRegenerate
		Cooldown=120
		Teachable=0
		Level=100
		icon_state="Regenerate"
		desc="Drink a serum that temporarily paralyzes you in exchange for health..."
		verb/Mayuri_Regenerate()
			set category="Skills"
			usr.Skill1X("MayuriRegen",src)
	ChaosRegenerate
		Cooldown=600
		Teachable=1
		Level=100
		icon_state="Regenerate"
		desc="Cut a large portion of your energy to recover some health. Has a lengthy cooldown."
		verb/Chaos_Regeneration()
			set category="Skills"
			usr.BuffX("ChaosRegen",src)
	BattleOnTheBigBridge
		Basic=1
		Teachable=0
		Level=100
		icon_state="Regenerate"
		desc="Play your background music."
		verb/Battle_On_The_Big_Bridge()
			set category="Skills"
			if(global.AnnoyingCD)
				usr<<"Things like tokusentai have cooldowns these days..."
				return
			global.AnnoyingCD=1
			for(var/mob/P in view(20,usr)) P<<sound('BigBridge.ogg')
			spawn(300)
				global.AnnoyingCD=0
	TOKUSENTAI
		Basic=1
		Teachable=1
		Level=100
		desc="TOKUSENTAI TOKUSENTAI TOKUSENTAI"
		verb/TOKUSENTAI()
			set category="Skills"
			if(global.AnnoyingCD)
				usr<<"Things like tokusentai have cooldowns these days..."
				return
			global.AnnoyingCD=1
			for(var/mob/P in view(20,usr)) P<<sound('Tokusentai.wav')
			spawn(100)
				usr<<"Tokusentai is off cooldown, Adam."
				global.AnnoyingCD=0
	NamekianFusion
		Teachable=0
		Level=100
		desc="Combine powers with another Namekian at a fatal price!"
		verb/Fuse(mob/M)
			set category="Skills"
			set name="Namekian Fusion"
			var/answer=input(M,"[usr] wants to fuse with you, do you accept?")in list("Yes","No")
			if(answer=="Yes")
				if(M&&usr)
					if(M==usr) return
					if(M.Race!="Namekian") return
			//		var/OriginalBP=M.Base
			//		var/OriginalBPMod=M.BaseMod
					if(M.BaseMod==1.8)
						M.BaseMod=3
						M.Base*=3
						M.Base/=1.8
						M.EnergyMod*=1.25
						M.EnergyMax*=1.25
						M.Recovery*=1.25
						if(M.AngerMax<1.5)
							M.AngerMax=1.5
						return
					if(M.BaseMod==3)
						M.BaseMod=5
						M.Base*=5
						M.Base/=3
						return
					if(M.BaseMod==3.5)
						M.BaseMod=4.95
						M.Base*=4.95
						M.Base/=3.5
						M.EnergyMod*=1.25
						M.EnergyMax*=1.25
						M.Recovery*=1.25
						if(M.AngerMax<1.5)
							M.AngerMax=1.5
						return
					if(M.BaseMod==4.95)
						M.BaseMod=10
						M.Base*=10
						M.Base/=4.95
						return
					M.Base=(usr.Base+M.Base)*2
					usr.Death(null,"fusing with [M]!")
					Log("Admin","[M] has Namekian fused with [ExtractInfo(usr)], please check if this was unauthorized")
			//		M.BaseMod=(usr.BaseMod+M.BaseMod)*2
	Bebi
		Teachable=0
		Level=100
		desc="Allow yourself to infect other people! This throttles your stat mods except speed, but gives you good Regeneration and Recovery. Infect people to raise your stats."
		verb/Bebi()
			set category="Skills"
			usr.contents-=/obj/Skills/Bebi
			if(!locate(/obj/Skills/Infect,usr.contents))
				usr.contents+=new/obj/Skills/Infect
				usr.contents+=new/obj/Skills/KillInfected

	Infect // So, I can replace your code with what I wrote?

		Teachable=0
		Level=100
		desc="Infect another person with yourself! You gain their exact stats plus a small boost for each time you've infected someone."

		verb/Infect(mob/M)
			set category="Skills"
			/*      if(usr.Infecting)
			        usr<<"You cannot use this unless you're not currently in someone's body."*/

			if(M==usr) return
			if(M.Health>=2) return

			if(usr.BebiAbsorbs<1)
				usr.BebiAbsorbs+=0.2
				if(usr.BebiAbsorbs>1){usr.BebiAbsorbs=1} // Sanity check!

	//		if(usr.BebiAbsorbs>=1)
	//			usr.BebiAbsorbs=1

			//STAT Boost they get
			usr.boostBebi_Base			=	M.Base 			*	(1+(usr.BebiAbsorbs*1.5))
			usr.boostBebi_Strength		=	M.Strength 		*	(1+(usr.BebiAbsorbs/2))
			usr.boostBebi_Force			=	M.Force 		*	(1+(usr.BebiAbsorbs/2))
			usr.boostBebi_Endurance		=	M.Endurance 	*	(1+(usr.BebiAbsorbs/2))
			usr.boostBebi_Resistance	=	M.Resistance 	*	(1+(usr.BebiAbsorbs/2))
			usr.boostBebi_Speed			=	M.Speed 		*	(1+(usr.BebiAbsorbs/2))
			usr.boostBebi_SpeedMod		=	M.SpeedMod 		*	(1+(usr.BebiAbsorbs/2))
			usr.boostBebi_Offense		=	M.Offense 		*	(1+(usr.BebiAbsorbs/2))
			usr.boostBebi_Defense		=	M.Defense 		*	(1+(usr.BebiAbsorbs/2))

			// Backup their original race and graphics
			usr.preBebi_Race		=	M.Race

			usr.preBebi_Class		=	usr.Class
			usr.preBebi_icon		=	usr.icon // This saves their icon into their savefile, might want to consider improving this at some point.
			usr.preBebi_overlays	=	usr.overlays
			usr.preBebi_Hair		=	usr.Hair


// Anyway, any other questions while Im here?
			usr.modif_Bebi(TRUE) // Change their stats, backup mods and graphics

			//Change their mods
/*			usr.BaseMod			=	M.BaseMod/2
			usr.StrengthMod		=	M.StrengthMod/2
			usr.ForceMod		=	M.ForceMod/2
			usr.EnduranceMod	=	M.EnduranceMod/2
			usr.ResistanceMod	=	M.ResistanceMod/2
			usr.SpeedMod		=	M.SpeedMod/2
			usr.OffenseMod		=	M.OffenseMod/2
			usr.DefenseMod		=	M.DefenseMod/2*/

			//Change their race and other crap.
			usr.Race			=	M.Race

			//Spiffy graphics
			usr.Class			=	M.Class
			usr.icon			=	M.icon
			usr.overlays		=	M.overlays
			usr.Hair			=	M.Hair

			//      usr.contents+=M.contents
			M.Infected			=	1
			usr.Infecting		=	1
			usr.SetVars()

			M.loc				=	locate(487,460,13)

			M<<"You have been infected."
			usr<<"You have infected someone. Alert an admin when you switch bodies."

	UnInfect
		Teachable=0
		Level=100

		verb/Bebi_reversal()
			set category="Skills"

		//		if(usr.BebiAbsorbs>=1)
		//			usr.BebiAbsorbs=1


			usr.modif_Bebi(FALSE)

		//	M.Infected=1 // Up to you on how to change this if you want to keep them alive
			usr.Infecting=0

			usr.SetVars()
			usr<<"You release the body you possessed." // Like taking off a coat!

	KillInfected
		Teachable=0
		Level=100
		desc="Kills an infected person."
		verb/Kill_Infected(mob/M)
			if(usr.Dead) return
			if(M.Infected==0) return
			M.Death(usr)

	MetamoreanFusion
		Cooldown=600
		Teachable=0
		Level=100


		desc="Combine powers with another person for five minutes! They'll receive your best stats, if they are superior to theirs, and your BP!"
		SkillCost=1000
		verb/MetaFusion(mob/M)
			set category="Skills"
			set name="Fusion Dance"
			var/answer=input(M,"[usr] strikes the pose needed for fusion! Mirror their actions and accept Fusion?")in list("Yes","No")
			if(answer=="Yes")
				if(M&&usr)
					if(M==usr)
						usr<<"The hell you doing? You can't fusion dance with yourself!"
						return
					else
						M.FusionBaseStorage=M.Base
						M.Base=(usr.Base+M.Base)*1.25
						M.FusionBaseModStorage=M.BaseMod
						M.BaseMod=(usr.BaseMod+M.BaseMod)*1.25
						if(usr.Strength>M.Strength)
							M.FusionStrStorage=M.Strength
							M.Strength=usr.Strength
						if(usr.Endurance>M.Endurance)
							M.FusionEndStorage=M.Endurance
							M.Endurance=usr.Endurance
						if(usr.SpeedMod>M.SpeedMod)
							M.FusionSpeedStorage=M.SpeedMod
							M.SpeedMod=usr.SpeedMod
						if(usr.Force>M.Force)
							M.FusionForceStorage=M.Force
							M.Force=usr.Force
						if(usr.Resistance>M.Resistance)
							M.FusionResStorage=M.Resistance
							M.Resistance=usr.Resistance
						if(usr.Offense>M.Offense)
							M.FusionOffStorage=M.Offense
							M.Offense=usr.Offense
						if(usr.Defense>M.Defense)
							M.FusionDefStorage=M.Defense
							M.Defense=usr.Defense
						if(usr.Recovery>M.Recovery)
							M.FusionRecovStorage=M.Recovery
							M.Recovery=usr.Recovery
						if(usr.Regeneration>M.Regeneration)
							M.FusionRegenStorage=M.Regeneration
							M.Regeneration=usr.Regeneration
						if(usr.AngerMax>M.AngerMax)
							M.FusionAngerStorage=M.AngerMax
							M.AngerMax=usr.AngerMax
						view(usr)<<"<b>Fuuuuuuuuuuuu....</b>"
						sleep(20)
						view(usr)<<"<b>SION!!</b>"
						sleep(20)
						view(usr)<<"<b>HAAAAAAAAAA!!</b>"
						sleep(20)
						usr.OMessage(15,"fuses with [M]!")
						usr.PrevX=usr.x
						usr.PrevY=usr.y
						usr.PrevZ=usr.z
						usr.loc=locate(444,403,13)
						usr.client.eye=M
						M.FusionTimer=300
						usr.FusionTimer=300
						usr.Fusee=1
						usr.FusionTarget=M.key
						spawn()src.Cooldown()



/*		verb/M_Fuse(mob/M)
			set category="Skills"
			set name="Fusion Dance"
			var/answer=input(M,"[usr] wants to fuse with you, do you accept?")in list("Yes","No")
			if(answer=="Yes")
				if(M&&usr)
					if(M==usr) return
					M.Base=(usr.Base+M.Base)*5
					usr.Fusee=1
					M.Fused=1
					usr.Death(null,"fusing with [M]!")
					usr.FusionTarget="[M.key]"
					Log("Admin","[M] has fusion danced with [ExtractInfo(usr)], please check if this was unauthorized")*/
	PotaraFusion
		Learn=list("energyreq"=30000)
		Teachable=0
		Level=100
		desc="Combine powers with another person, regardless of race! This method is permanent!"
		verb/Potara_Fuse(mob/M in world)
			set category="Skills"
			set name="Potara Fusion"
			var/answer=input(M,"[usr] wants to fuse with you,this method is PERMANENT, do you accept?")in list("Yes","No")
			if(answer=="Yes")
				if(M&&usr)
			//		var/OriginalBP=M.Base
			//		var/OriginalBPMod=M.BaseMod
					M.Base=(usr.Base+M.Base)*10
					M.BaseMod=(usr.BaseMod+M.BaseMod)*2
					M.contents+=usr.contents
					if(usr.Class=="Elite" && M.Class=="Low-Class")
						M.Class="Vegito"
					if(usr.Class=="Low-Class"&& M.Class=="Elite")
						M.Class="Vegito"
					if(usr.Class=="Legendary" && M.Class=="Hellspawn")
						M.Class="Fire God"
					if(usr.Class=="Hellspawn"&& M.Class=="Legendary")
						M.Class="Fire God"
					usr.Death(null,"fusing permanently with [M]!")
					usr.OMessage(10,"[usr] fused with [M]!","<font color=red>[usr]([usr.key]) POTARA FUSED with [M]([M.key])")
					M.Fused=1
					Log("Admin","[M] has Potara fused with [ExtractInfo(usr)], please check if this was unauthorized")
	Materialization
		Basic=1
		Learn=list("energyreq"=2000)
		Level=100
		icon_state="Materialize"
		desc="This allows you to create weights out of thin air."
		SkillCost=50
		verb/Materialization()
			set category="Skills"
			usr.SkillX("Materialize",src)
	SelfDestruct
		Basic=1
		Learn=list("energyreq"=2000)
		Level=100
		desc="The ultimate sacrifice."
		SkillCost=300
		verb/SelfDestruct()
			set name="Self Destruct"
			set category="Skills"
			usr.SkillX("SelfDestruct",src)
	EventSelfDestruct
		Basic=1
		Learn=list("energyreq"=2000)
		Level=100
		desc="The ultimate sacrifice."
		verb/EventSelfDestruct()
			set name="Event-Self-Destruct"
			set category="Skills"
			usr.SkillX("EventcharSelfDestruct",src)
	RedMiles
		Basic=1
		Learn=list("energyreq"=2000)
		Level=100
		desc="The ultimate sacrifice."
		verb/Red_Miles()
			set name="Red Miles"
			set category="Skills"
			usr.SkillX("Red Miles",src)
	SuperExplosiveWave
		Basic=1
		Cooldown=300
		Learn=list("energyreq"=2000)
		Level=100
		desc="A weaker Self Destruct. Does major damage to all in range."
		SkillCost=100
		verb/SelfDestruct()
			set name="Super Explosive Wave"
			set category="Skills"
			usr.SkillX("SuperExplosiveWave",src)
	Nova
		Cooldown=300
		Learn=list("energyreq"=2000)
		Level=100
		Teachable=0
		desc="Envelops everything in the area in a large wave of lava."
		SkillCost=100
		Magic=1
		verb/Nova()
			set name="Nova"
			set category="Skills"
			usr.SkillX("Nova",src)
	Flare
		Cooldown=30
		Learn=list("energyreq"=45000)
		Level=100
		Teachable=0
		Magic=1
		desc="Blinds your opponent with a flash of fire!"
		SkillCost=50
		verb/Flare()
			set name="Flare"
			set category="Skills"
			usr.SkillX("Flare",src)
	Hurricane
		Cooldown=100
		Learn=list("energyreq"=2000)
		Level=100
		Teachable=0
		desc="Causes a raging windstorm to slice up everyone in view, dealing far greater damage to those who fly."
		SkillCost=100
		Magic=1
		verb/Hurricane()
			set name="Hurricane"
			set category="Skills"
			usr.SkillX("Hurricane",src)
/*	SuperExplosiveWaveJ
		Learn=list("energyreq"=2000)
		Level=100
		desc="shemad"
		verb/Jade()
			set name="Jade"
			set category="Skills"
			usr.SkillX("SuperExplosiveWave",src)*/
	FalseMoon
		Cooldown=600
		Learn=list("energyreq"=2500)
		Level=100
		desc="Create a false moon."
		verb/FalseMoon()
			set name="False Moon"
			set category="Skills"
			usr.SkillX("FalseMoon",src)
	Advanced
		AdvancedMagic

	Attacks
		var/Charging=0
		var/ChargeRate=0
		var/Mighty=0
		var/KamehamehaCharge=0

		VoidNova
			Cooldown=300
			Teachable=0
			Learn=list("energyreq"=2000)
			Level=100
			desc="???"
			verb/VoidNova()
				set name="Void Nova"
				set category="Skills"
				usr.SkillX("VoidNova",src)
		VoidDeathBall
			Cooldown=150
			Teachable=0
			Learn=list("energyreq"=2000)
			Level=100
			desc="???"
			sicon='DeathBallStrong.dmi'
			verb/VoidDeathBall()
				set name="Void Death Ball"
				set category="Skills"
				usr.SkillX("VoidDeathBall",src)

		WolfFangFist
			Cooldown=30
			Learn=list("energyreq"=2000,"difficulty"=50)
			desc="The physical art of the wolf hermit!"
			SkillCost=300
			verb/WolfFangFist()
				set name="Wolf Fang Fist"
				set category="Skills"
				usr.SkillX("WolfFangFist",src)
		HyperTornado
			Cooldown=30
			Teachable=0
			Learn=list("energyreq"=10000,"difficulty"=50000)
			desc="A powerful strike, intended to knockback targets considerably."
			verb/HyperTornado()
				set name="Hyper Tornado"
				set category="Skills"
				usr.SkillX("HyperTornado",src)
		GigaDrillBreaker
			Learn=list("energyreq"=10000,"difficulty"=50000)
			desc="<b>MAN</b>"
			verb/GigaDrillBreak()
				set name="Giga Drill Breaker"
				set category="Skills"
				usr.BuffX("GigaDrillBreaker",src)
		AntiGigaDrillBreaker
			Learn=list("energyreq"=10000,"difficulty"=50000)
			desc="???"
			verb/AntiGigaDrillBreak()
				set name="Anti-Spiral Giga Drill Breaker"
				set category="Skills"
				usr.BuffX("AntiSpiralGigaDrillBreaker",src)
		AntiSpiralEnergy
			Learn=list("energyreq"=10000,"difficulty"=50000)
			desc="???"
			verb/AntiSpiralSeal()
				set name="Spiral Energy Seal"
				set category="Skills"
				usr.BuffX("SpiralEnergySeal",src)
			verb/AbsoluteDespair()
				set name="Absolute Despair"
				set category="Skills"
				usr.BuffX("AbsoluteDespair")
		Tengenkotsu
			Cooldown=1
			Learn=list("energyreq"=2000,"difficulty"=50000)
			desc="The ultimate attack."
			verb/WolfFangFist()
				set name="Tengenkotsu"
				set category="Skills"
				usr.SkillX("Tengenkotsu",src)
		DragonFist
			Cooldown=300
			Learn=list("energyreq"=2000,"difficulty"=50000)
			desc="A blow with the strength of a monster behind it..!"
			verb/WolfFangFist()
				set name="Dragon Fist"
				set category="Skills"
				usr.SkillX("DragonFist",src)
		HomingFinisher
			Cooldown=300
			Learn=list("energyreq"=2000,"difficulty"=20)
			icon_state="HF"
			sicon='Blasts.dmi'
			sicon_state="67"
			Power=0.5
			Speed=7
			Efficiency=1
			Distance=20
			SkillCost=300
			verb/HomingFinisher()
				set name="Homing Finisher"
				set category="Skills"
				usr.SkillX("HomingFinisher",src)

	/*	MagicBullet
			Cooldown=600
			icon_state="HF"
			sicon='Blasts.dmi'
			sicon_state="67"
			Power=1
			Speed=5
			Efficiency=1
			Distance=30
			SkillCost=3000
			verb/Magic_Bullet()
				set category="Skills"
				usr.SkillX("MagicBullet",src)*/
		Checkmate
			Cooldown=150
			Learn=list("energyreq"=2000,"difficulty"=20)
			sicon='Dio knives.dmi'
			Power=0.5
			Speed=7
			Efficiency=1
			Distance=20
			verb/Checkmate()
				set name="Checkmate"
				set category="Skills"
				usr.SkillX("Checkmate",src)
		WaterCoffin
			Cooldown=150
			Learn=list("energyreq"=2000,"difficulty"=250)
			icon_state="HF"
			sicon='Blasts.dmi'
			sicon_state="67"
			Power=0.5
			Speed=7
			Teachable=0
			Efficiency=1
			desc="Call upon all the water surrounding you to crash down on whoever you desire."
			Distance=20
			SkillCost=300
			verb/WaterCoffin()
				set name="Water Coffin"
				set category="Skills"
				usr.SkillX("WaterCoffin",src)
		IceCoffin
			Cooldown=150
			Learn=list("energyreq"=2000,"difficulty"=250)
			icon_state="HF"
			sicon='IceBurst.dmi'
			Power=0.5
			Speed=7
			Teachable=0
			Efficiency=1
			desc="Fire an orb of energy that, if it hits someone, encases them in ice and causes icicles to rain down on them."
			Distance=20
			SkillCost=300
			SkillCost=1000
			verb/IceCoffin()
				set name="Ice Coffin"
				set category="Skills"
				usr.SkillX("IceCoffin",src)

		Makosen
			Cooldown=10
			Learn=list("energyreq"=500,"difficulty"=10)
			icon_state="Makosen"
			sicon='Blasts.dmi'
			sicon_state="29"
			Power=0.2
			Speed=10
			Efficiency=1
			Distance=10
			verb/Makosen()
				set category="Skills"
				usr.BlastX("Makosen",src)
		KuroHitsugi
			Cooldown=300
			Learn=list("energyreq"=5000,"difficulty"=250)
		//	Mighty=1
		//	sicon='ObliterationBall.dmi'
			desc="If unchanted, it creates a field of gravity around you that damages everyone in the field. If chanted, after the chant is over, your target is encased in a larger field of gravity that crushes them and the ground under."
			verb/KuroHitsugi()
				set name="Kuro Hitsugi"
				set category="Skills"
				usr.SkillX("KuroHitsugi",src)
		BlackHole
			Cooldown=1200
			Learn=list("energyreq"=5000,"difficulty"=250)
			sicon='deathballstrong.dmi'
			desc="See: Name"
			verb/BlackHole()
				set name="Throw a Fucking Black Hole at Someone"
				set category="Skills"
				usr.SkillX("BlackHole",src)

		BlackHoleFinisher
			Cooldown=1200
			Learn=list("energyreq"=5000,"difficulty"=250)
			Level=100
			sicon='deathballstrong.dmi'
			desc="Holy shit."
			verb/BlackHoleFinisher()
				set name="End The World"
				set category="Skills"
				usr.Skill1X("BlackHoleFinisher",src)

		DeathBall
			Cooldown=150
			Learn=list("energyreq"=5000,"difficulty"=250)
			Mighty=1
			sicon='BigAttack.dmi'
			icon_state="DB"
			sicon_state="DB"
			desc="Encrypt a gruesome force into a charged destructive sphere."
			SkillCost=1000
			verb/DeathBall()
				set name="Death Ball"
				set category="Skills"
				usr.SkillX("DeathBall",src)
		OmegaBlaster
			Cooldown=150
			Learn=list("energyreq"=5000,"difficulty"=250)
			Level=100
			sicon='OmegaBlaster.dmi'
			desc="Fire an all-powerful orb of energy that obliterates whatever it comes in contact with."
			verb/Omega_Blaster()
				set category="Skills"
				usr.SkillX("OmegaBlaster",src)
		OmegaHomingFinisher
			Cooldown=600
			Learn=list("energyreq"=5000,"difficulty"=250)
			Level=100
			sicon='OmegaBlaster.dmi'
			desc="Holy shit."
			verb/Omega_Homing_Finisher()
				set category="Skills"
				usr.SkillX("OmegaHomingFinisher",src)

		Ultima
			Cooldown=1200
			Teachable=0
			Level=100
			sicon='UltimaStrike.dmi'
			desc="N-Nigga..."
			verb/Ultima()
				set category="Skills"
				usr.Skill1X("Ultima",src)

		SpiritBomb
			Cooldown=5
			Teachable=0
			Learn=list("energyreq"=5000,"difficulty"=250)
			icon_state="SB"
			sicon='KunaiMod/Icons/spiritbomb.dmi'
			desc="Use the good energy of your planet to charge up a giant ball of spiritual energy that will certainly destroy all evil!"
			verb/SpiritBomb()
				set name="Spirit Bomb"
				set category="Skills"
				usr.SkillX("SpiritBomb",src)

		Sokidan
			Cooldown=15
			Learn=list("energyreq"=500,"difficulty"=6)
			icon_state="Sokidan"
			sicon='Blasts.dmi'
			sicon_state="57"
			desc="Manipulates an orb of energy."
			SkillCost=50
			verb/Sokidan()
				set category="Skills"
				usr.BlastX("Sokidan",src)
		GaleWindDestructionStrike
			Cooldown=150
			icon_state="Sokidan"
			sicon='Blasts.dmi'
			sicon_state="57"
			desc="Launch your ki forward to obliterate an opponent."
			verb/Gale_Wind_Destruction_Strike()
				set category="Skills"
				usr.Skill1X("GaleWindDestructionStrike",src)
		JechtShot
			Cooldown=60
			Learn=list("energyreq"=50000,"difficulty"=100)
			icon_state="Sokidan"
			sicon='Blasts.dmi'
			sicon_state="57"
			desc="Kick an orb of energy forth, increasing in strength the longer it's allowed to linger. Jumps in size after a certain amount of time."
			SkillCost=300
			verb/Jecht_Shot()
				set category="Skills"
				usr.SkillX("JechtShot",src)
		Kienzan
			Cooldown=45
			Learn=list("energyreq"=2500,"difficulty"=8)
			icon_state="Kienzan"
			sicon='Blasts.dmi'
			sicon_state="71"
			desc="Charges a powerful disc of energy."
			SkillCost=50
			verb/Kienzan()
				set category="Skills"
				usr.BlastX("Kienzan",src)
		Charge
			Cooldown=20
			SkillCost=5
			Learn=list("energyreq"=1000,"difficulty"=1.5)
			icon_state="Charge"
			sicon='Blasts.dmi'
			sicon_state="5"
			Speed=1
			desc="Charges a powerful, but slow, energy blast."
			verb/Charge()
				set category="Skills"
				usr.BlastX("Charge",src)
		Fire_Shot
			Cooldown=0.1
			Teachable=0
			Learn=list("energyreq"=1000,"difficulty"=1.5)
			sicon='Bullet.dmi'
			sicon_state=""
			Speed=10
			desc="Manifest bullets and release them!."
			verb/Fire_Shot()
				set category="Skills"
				set name="Fire Shot"
				usr.BlastX("Fire_Shot",src)

		DrillKnee
			Level=100
			Teachable=0
			Cooldown=23
			desc="Form a drill on your knee with your COURAGE and smash it into someones face."
			verb/DrillKnee()
				set name="Drill Knee"
				set category="Skills"
				usr.BuffX("DrillKnee",src)

		BrokenMagnum
			Level=100
			Teachable=0
			icon_state="Charge"
			sicon='Blasts.dmi'
			sicon_state="5"
			Speed=1
			Cooldown=15
			desc="Physical charge blast of COURAGE."
			verb/BrokenMagnum()
				set name="Broken Magnum"
				set category="Skills"
				usr.Skill1X("BrokenMagnum",src)

		BrokenPhantom
			Level=100
			Teachable=0
			icon_state="Charge"
			sicon='Blasts.dmi'
			sicon_state="5"
			Speed=1.2
			Cooldown=25
			desc="Physical charge blast of COURAGE, empowered by a PHANTOM RING."
			verb/BrokenPhantom()
				set name="Broken Phantom"
				set category="Skills"
				usr.Skill1X("BrokenPhantom",src)

		SekihaTenkyoken
			Cooldown=30
			SkillCost=5
			Learn=list("energyreq"=1000,"difficulty"=1.5)
			icon_state="Charge"
			sicon='Blasts.dmi'
			sicon_state="5"
			Speed=1
			desc="Ultimate secret technique of the School of the East. Uses a portion of Strength and Force"
			verb/SekihaTenkyoken()
				set category="Skills"
				usr.SkillX("SekihaTenkyoken",src)
		SekihaLoveLoveTenkyoken
			Cooldown=600
			SkillCost=5
			Learn=list("energyreq"=1000,"difficulty"=1.5)
			icon_state="Charge"
			sicon='Blasts.dmi'
			sicon_state="5"
			Speed=1
			desc="Combines Burning Finger and Sekiha Tenkyoken. Can only be used with a partner, using your Strength and Force combined with theirs. Pierces enemies, and cannot be deflected."
			verb/SekihaLoveLoveTenkyoken()
				set category="Skills"
				usr.SkillX("SekihaLoveLoveTenkyoken",src)
		BigBang
			Cooldown=100
			Learn=list("energyreq"=50000,"difficulty"=10)
			icon_state="BigBang"
			sicon='BlastSpiralingKi.dmi'
			sicon_state=""
			desc="A super powerful charge attack."
			SkillCost=400
			verb/Big_Bang()
				set category="Skills"
				usr.Skill1X("BigBang",src)
		Fireball
			Cooldown=5
			Learn=list("energyreq"=1000,"difficulty"=1.5)
			icon_state="Charge"
			sicon='Fireball.dmi'
			Teachable=0
//			sicon_state="75"
			Speed=2
			Magic=1
			desc="Launches a sphere of flame forward."
			SkillCost=50
			verb/Fireball()
				set category="Skills"
				usr.BlastX("Fireball",src)
		PoisonBolt
			Cooldown=5
			Learn=list("energyreq"=1000,"difficulty"=1.5)
			icon_state="Charge"
			sicon='Blasts.dmi'
			sicon_state="15"
			Teachable=0
			Speed=1.8
			Magic=1
			desc="Launches a bolt of poison forward."
			SkillCost=50
			verb/PoisonBolt()
				set category="Skills"
				usr.BlastX("PoisonBolt",src)
		PoisonGas
			Cooldown=45
			Learn=list("energyreq"=5000,"difficulty"=1.5)
			Teachable=0
			desc="Spawns two poison gas clouds around the user."
			SkillCost=100
			Magic=1
			verb/PoisonGas()
				set category="Skills"
				usr.SkillX("PoisonGas",src)
		Meteor
			Cooldown=30
			Learn=list("energyreq"=1000,"difficulty"=500)
			icon_state="DB"
			sicon='BigAttack.dmi'
			desc="Cause meteors to descend from the heavens, annihilating everything they touch."
			Teachable=0
			SkillCost=1000
			Magic=1
			verb/Meteor()
				set category="Skills"
				usr.SkillX("Meteor",src)
		SlicingWind
			Cooldown=10
			Learn=list("energyreq"=1000,"difficulty"=10)
			icon_state="BigBang"
			sicon='Scarring Breeze.dmi'
			sicon_state=""
			Teachable=0
			Speed=2
			desc="Grants you a controllable wave of wind that goes wherever you click, slicing up everything it hits in the process."
			SkillCost=300
			verb/SlicingWind()
				set category="Skills"
				usr.SkillX("SlicingWind",src)

		ChaosBlast
			Cooldown=1
			sicon='fevCharge.dmi'
			Power=1
			Speed=10
			Efficiency=1
			Distance=25
			desc="Abuse the power of pseudo-randomness for fun and profit."
			verb/Chaos_Blast()
				set category="Skills"
				usr.SkillX("ChaosBlast",src)

		Blast
			Cooldown=0.25
			SkillCost=5
			icon_state="Blast"
			sicon='fevBlast.dmi'
			sicon_state="Blast"
			Power=1
			Speed=10
			Efficiency=1
			Distance=25
			desc="A weak, but fast energy blast."
			verb/Blast()
				set category="Skills"
				usr.Skill1X("Blast",src)

		MagiBolt
			Cooldown=1
			SkillCost=5
			icon_state="Blast"
			sicon='Blasts.dmi'
			sicon_state="5"
			Power=1.25
			Speed=9
			Efficiency=1
			Distance=25
			Magic=1
			desc="Using mana, this attack is slightly stronger then a Ki based blast."
			verb/MagiBolt()
				set category="Skills"
				usr.SkillX("MagiBolt",src)

		WetShot
			Cooldown=1
			SkillCost=5
			icon_state="Blast"
			sicon='Blasts.dmi'
			sicon_state="5"
			Power=1
			Speed=8
			Efficiency=1
			Distance=25
			Magic=1
			desc="A slow, but decently powerful mana fueled attack. It is always water elemental."
			verb/WetShot()
				set category="Skills"
				usr.BlastX("WetShot",src)

		FlickeringEmber
			Cooldown=1
			SkillCost=5
			icon_state="Blast"
			sicon='Blasts.dmi'
			sicon_state="5"
			Power=1
			Speed=12
			Efficiency=1
			Distance=25
			Magic=1
			desc="A fast, but weak mana fueled attack. It is always fire elemental."
			verb/FlickeringEmber()
				set category="Skills"
				usr.BlastX("FlickeringEmber",src)

		AeroShot
			Cooldown=1
			SkillCost=5
			icon_state="Blast"
			sicon='Blasts.dmi'
			sicon_state="5"
			Power=1
			Speed=15
			Efficiency=1
			Distance=25
			Magic=1
			desc="A very fast, but weak mana fueled attack. It is always wind elemental."
			verb/AeroShot()
				set category="Skills"
				usr.Skill1X("AeroShot",src)

		StoneThrow
			Cooldown=1
			SkillCost=5
			icon_state="Blast"
			sicon='Blasts.dmi'
			sicon_state="5"
			Power=1
			Speed=6
			Efficiency=1
			Distance=25
			Magic=1
			desc="A very slow, but strong mana fueled attack. It is always earth elemental."
			verb/StoneThrow()
				set category="Skills"
				usr.BlastX("StoneThrow",src)

		Barrage
			Cooldown=0.75
			SkillCost=10
			icon_state="Barrage"
			sicon='Blasts.dmi'
			sicon_state="51"
			Power=1
			Speed=10
			Efficiency=1
			Distance=25
			desc="You'll fire a row of three blasts forward, they will move in a straight line."
			verb/Barrage()
				set category="Skills"
				usr.Skill1X("Barrage",src)

		Trishot
			Cooldown=2
			icon_state="Barrage"
			sicon='Blasts.dmi'
			sicon_state="51"
			Power=1
			Speed=10
			Efficiency=1
			Distance=25
			desc="You'll fire a row of three blasts forward, they will move in a fork shape your cardinals."
			verb/Trishot()
				set category="Skills"
				usr.SkillX("Tri-Shot",src)

		RotatingBlasts
			Cooldown=0.1
			icon_state="Barrage"
			sicon='Blasts.dmi'
			sicon_state="51"
			Power=1
			Speed=10
			Efficiency=1
			Distance=25
			desc="You'll fire a row of three blasts in random cardinal directions."
			var/Rotation=0
			verb/RotatingBlasts()
				set category="Skills"
				usr.BlastX("RotatingBlasts",src)

		KunaiBarrage
			Cooldown=0.75
			SkillCost=10
			icon_state="Barrage"
			sicon='KunaiMod/Icons/kunai.dmi'
			Power=1
			Speed=10
			Efficiency=1
			Distance=25
			desc="You'll fire a row of three kunai knives forward, they will move in a straight line."
			verb/KunaiBarrage()
				set category="Skills"
				usr.Skill1X("KunaiBarrage",src)

		SpiritGun
			Cooldown=25
			Learn=list("energyreq"=5000,"difficulty"=500)
			icon_state="Blast"
			sicon='BlastSpiralingKi.dmi'
			Power=1
			Speed=1
			Efficiency=1
			Distance=10
			verb/Spirit_Gun()
				set category="Skills"
				usr.SkillX("SpiritGun",src)

		SpiritSword
			verb/Manifest_Spirit_Sword()
				set category="Skills"
				usr.SpiritSword=1
				var/obj/Items/Sword/spirit=new
				spirit.SpiritSword=1
				spirit.Shatterproof=1
				spirit.Damage_Multiplier=2
				spirit.Accuracy_Multiplier=1.25
				spirit.Delay_Multiplier=1
				spirit.PointsAssigned=1
				spirit.Points=0
				spirit.name="Spirit Sword"
				usr.contents+=spirit
				usr.OMessage(10, "[usr] manifests a <b>Spirit Sword</b>!", "<font color='red'>[usr]([usr.key]) activated Spirit Sword.</font color>")
				spawn(50)del src
		DimensionSword
			verb/Manifest_Dimension_Sword()
				set category="Skills"
				usr.MadeDimensionSword=1
				usr.SpiritSword=1
				var/obj/Items/Sword/spirit=new
				spirit.SpiritSword=1
				spirit.Shatterproof=1
				spirit.Damage_Multiplier=3
				spirit.Accuracy_Multiplier=1.5
				spirit.Delay_Multiplier=1.25
				spirit.PointsAssigned=1
				spirit.Points=0
				spirit.name="Dimension Sword"
				usr.contents+=spirit
				usr.OMessage(10, "[usr] manifests a <b>Dimension Sword</b>!", "<font color='red'>[usr]([usr.key]) activated Dimension Sword.</font color>")
				spawn(50)del src
		Kikoho
			Cooldown=10
			Learn=list("energyreq"=5000,"difficulty"=50)
			icon_state="Blast"
			sicon='BlastSpiralingKi.dmi'
			Power=1
			Speed=1
			Efficiency=1
			Distance=10
			verb/Kikoho()
				set category="Skills"
				usr.SkillX("Kikoho",src)

		ShinKikoho
			Cooldown=5
			Learn=list("energyreq"=5000,"difficulty"=50)
			icon_state="Blast"
			sicon='BlastSpiralingKi.dmi'
			Power=1
			Speed=1
			Efficiency=1
			Distance=10
			verb/ShinKikoho()
				set category="Skills"
				usr.SkillX("ShinKikoho",src)

		GigaFlare
			Cooldown=10
			Learn=list("energyreq"=500,"difficulty"=500000)
			icon_state="Blast"
			sicon='GigaFlare.dmi'
			Power=1
			Speed=1
			Efficiency=1
			Distance=10
			verb/GigaFlare()
				set category="Skills"
				usr.SkillX("GigaFlare",src)

		DragonNova
			Cooldown=10
			Learn=list("energyreq"=500000,"difficulty"=50000)
			icon_state="Blast"
			sicon='DragonNova.dmi'
			Power=1
			Speed=1
			Efficiency=1
			Distance=10
			desc="Fire a concussive 'charge' blast that knocks back."
			SkillCost=300
			verb/DragonNova()
				set category="Skills"
				set name="Dragon Nova"
				usr.SkillX("DragonNova",src)



		Beams
			Learn=list("energyreq"=2500,"difficulty"=10)
			New()
				..()
				desc="Strength:[Power]<br>Speed:[Speed]<br>Draining Effiency:[Efficiency]<br>Distance:[Distance]<br>Charge: [ChargeRate]"
			icon='Skillz.dmi'
			icon_state="Beam"
			Beam
				Cooldown=5
				Power=1.5
				Speed=4
				Efficiency=1
				ChargeRate=1.5
				Distance=10
				sicon='Beam5.dmi'
				desc = "A beam that travels in a straight line."
				verb/Beam()
					set category="Skills"
					set name="Normal Beam"
					set desc="A beam that travels in a straight line."
					usr.SkillX("Beam",src)
			TyphoonCannon
				Cooldown=3
				Power=1
				Speed=9
				Efficiency=1
				ChargeRate=1
				Distance=20
				Pushing=1
				//I was lazy and didn't change the base icon of beam, sue me.
				sicon='Beam5.dmi'
				verb/Beam()
					set category="Skills"
					set name="Typhoon Cannon"
					usr.SkillX("Beam",src)
			SuperDragonFist
				Cooldown=600
				Power=0
				Speed=8
				Efficiency=1
				ChargeRate=1
				Distance=100
				Big=1
				DragonFist=1
				Level=100
				Teachable=0
				sicon='DragonFist.dmi'
				verb/Super_Dragon_Fist()
					set category="Skills"
				//	var/icon/E=icon('Effects.dmi',"Shock")
					if(usr.DragonFist)
						usr.DragonFist=0
						LightningFlash(usr)
				//		spawn()Shockwave(E,1)
						for(var/turf/T in Turf_Circle(usr,4))
							if(prob(1)) sleep(0.005)
							spawn(rand(4,8)) Destroy(T)
					//		if(prob(10))sleep(0.1)
							for(var/mob/M in view(0,T))
								if(M!=usr)
									M.Health-=((usr.Force*usr.Power)/(M.Resistance*M.Power))*30
					if(!usr.Beaming)
						usr.DragonFist=1
					usr.SkillX("Beam",src)
					sleep(100)
					for(var/mob/M in world) if(M.DragonFisted)
						M.DragonFisted=0
						M.Frozen=0


			FinalFlash
				Cooldown=60
				Power=3.5
				Speed=4
				Efficiency=0.5
				Distance=10
				ChargeRate=1
				Big=1
				Teachable=0
				sicon='BeamBig3.dmi'
				verb/FinalFlash()
					set category="Skills"
					set name="Final Flash"
					usr.SkillX("Beam",src)
			MegaFlare
				Cooldown=600
				Learn=list("energyreq"=25000,"difficulty"=100)
				Power=10
				Speed=9
				Efficiency=1
				Distance=10
				ChargeRate=7.5
				Big=1
				MegaFlare=1
				Mighty=1
				Level=100
				Teachable=0
				sicon='MegaFlare.dmi'
				verb/MegaFlare()
					set category="Skills"
					set name="Mega Flare"
					usr.SkillX("Beam",src)
					desc="The strongest beam of all that obliteates anything in its path at heavy cost to the user."
			GouHadoken
				var/LastUse
				Power=10
				Speed=9
				Efficiency=1
				Distance=10
				ChargeRate=7.5
				Big=1
				GouHadoken=1
				Mighty=1
				Level=100
				Teachable=0
				sicon='Megaflare.dmi'
				desc="The strongest hadoken of all."
				verb/GouHadoken()
					set category="Skills"
					if(world.realtime < (src.LastUse+(600*60*24*3)))
						src << "You cannot use this technique again yet."
						return
					usr.SkillX("Beam",src)

			SuperFinal_Flash
				Cooldown=150
				Learn=list("energyreq"=25000,"difficulty"=100)
				Power=5.5
				Speed=4
				Efficiency=0.5
				Distance=30
				ChargeRate=2.5
				Big=1
				Mighty=1
				Level = 10000
				Teachable=0
				sicon='BeamBig3.dmi'
				verb/SuperFinalFlash()
					set category="Skills"
					set name="Super Final Flash"
					usr.SkillX("Beam",src)
			GalicGun
				Cooldown=30
				Power=2.5
				Speed=6
				Efficiency=1.5
				Distance=9
				ChargeRate=2
				Big=1
				Teachable=0
				sicon='BeamBig2.dmi'
				verb/GalicGun()
					set category="Skills"
					set name="Galic Gun"
					usr.SkillX("Beam",src)
			Ray
				Cooldown=10
				icon_state="Ray"
				Power=1.5
				Speed=8
				Efficiency=0.8
				Distance=20
				ChargeRate=1
				Pierce=1
				Slicing=1
				sicon='Beam8.dmi'
				verb/Ray()
					set category="Skills"
					usr.SkillX("Beam",src)
			ChaoticHeavensDestructionStrike
				Cooldown=60
				Power=5
				Speed=9
				Efficiency=0.5
				Distance=40
				ChargeRate=2
				Big=1
				Pierce=1
				Slicing=1
				sicon='Sensei.dmi'
				Teachable=0
				verb/ChaoticHeavensDestructionStrike()
					set category="Skills"
					set name="Chaotic Heavens Destruction Strike"
					usr.SkillX("Beam",src)
			ThunderFlash
				Cooldown=60
				Power=3
				Speed=10
				Efficiency=0.75
				Distance=25
				ChargeRate=1.5
				Big=1
				sicon='BeamBig4.dmi'
				Teachable=0
				verb/ThunderFlash()
					set category="Skills"
					set name="Thunder Flash"
					usr.SkillX("Beam",src)
			DaytimeTiger
				Cooldown=300
				Power=6
				Speed=9
				Efficiency=0.3
				Distance=75
				ChargeRate=1
				Big=1
				Mighty=1
				sicon='BeamBig8.dmi'
				Teachable=0
				verb/ThunderFlash()
					set category="Skills"
					set name="Daytime Tiger"
					if(usr.GateNumber<=6)
						usr<<"You need the seventh gate open to utilize this technique."
						return
					usr.SkillX("Beam",src)
			TestBall
				icon_state="Ray"
				Power=2.2
				Speed=7
				Efficiency=0.3
				Distance=13
				ChargeRate=0.1
				sicon='TestBall.dmi'
				verb/TestBall()
					set category="Skills"
					usr.SkillX("Beam",src)
			Piercer
				Cooldown=10
				icon_state="Ray"
				Power=2.2
				Speed=7
				Efficiency=0.3
				Distance=13
				ChargeRate=1
				Pierce=1
				Slicing=1
				sicon='Beam18.dmi'
				verb/Piercer()
					set category="Skills"
					usr.SkillX("Beam",src)
			Masenko
				Cooldown=200
				Power=4.5
				Speed=5.5
				Efficiency=1
				Distance=15
				ChargeRate=2
				sicon='Beam15.dmi'
				Teachable=0
				verb/Masenko()
					set category="Skills"
					usr.SkillX("Beam",src)

			Cero
				Cooldown=15
				Power=2
				Speed=5
				Efficiency=1.5
				Distance=15
				ChargeRate=1.5
				sicon='Cero2.dmi'
				Big=1
				Teachable=0
				verb/Cero()
					set category="Skills"
					usr.SkillX("Beam",src)

			GranReyCero
				Cooldown=45
				Power=5
				Speed=7.5
				Efficiency=2
				Distance=25
				ChargeRate=2
				sicon='CeroBlue2.dmi'
				Big=1
				Teachable=0
				verb/Gran_Rey_Cero()
					set category="Skills"
					usr.SkillX("Beam",src)

			Kamehameha
				Cooldown=30
				Power=3
				Speed=5
				Efficiency=1.5
				Distance=12
				ChargeRate=1.5
				sicon='BeamBig1.dmi'
				Big=1
				Teachable=0
				verb/Kamehameha()
					set category="Skills"
					KamehamehaCharge=1
					usr.SkillX("Beam",src)

			SuperKamehameha
				Cooldown=150
				Learn=list("energyreq"=25000,"difficulty"=100)
				Power=4
				Speed=5.5
				Efficiency=0.5
				Distance=30
				ChargeRate=2.5
				sicon='BeamBig1.dmi'
				Big=1
				Mighty=1
				Teachable=0
				verb/SuperKamehameha()
					set category="Skills"
					set name="Super Kamehameha"
					usr.SkillX("Beam",src)

			FinalKamehameha
				Cooldown=300
				Learn=list("energyreq"=35000,"difficulty"=1000)
				Power=6.5
				Speed=6.5
				Efficiency=0.5
				Distance=30
				ChargeRate=3
				Big=1
				Mighty=1
				Teachable=0
				sicon='BeamBig5.dmi'
				verb/FinalKamehameha()
					set category="Skills"
					set name="Final Kamehameha"
					usr.SkillX("Beam",src)

			Dodompa
				Cooldown=10
				Power=2
				Speed=7
				Efficiency=2
				Distance=5
				ChargeRate=3
				Teachable=0
				sicon='Beam4.dmi'
				verb/Dodompa()
					set category="Skills"
					usr.SkillX("Beam",src)
			Dodohameha
				Cooldown=20
				Learn=list("energyreq"=35000,"difficulty"=1000)
				Power=4
				Speed=7
				Efficiency=0.5
				Distance=30
				ChargeRate=3
				Teachable=0
				sicon='BeamBig1.dmi'
				verb/Dodohameha()
					set category="Skills"
					usr.SkillX("Beam",src)
			CustomBeam
				Cooldown=15
				Power=1
				Speed=1
				Efficiency=1
				Distance=1
				ChargeRate=1
				desc="A customizable beam."
				sicon='Beam4.dmi'
				SkillCost=300
				verb/CustomBeam()
					set category="Skills"
					set name="Custom Beam"
				//	set name= "[usr.CustomBeamName]"
					Power=usr.CustomPower
					Speed=usr.CustomSpeed
					Efficiency=usr.CustomEfficiency
					Distance=usr.CustomDistance
					ChargeRate=usr.CustomChargeRate
					usr.SkillX("Beam",src)
		/*	Customize_Beam
				icon_state="Beam"
				desc="Allows you to customize your beam."
				Level=100*/
				verb/Customize_Beam()
					set category="Skills"
					winshow(usr,"BeamCustom",0)
					if(src in usr.contents)
						winshow(usr,"BeamCustom",1)
						usr.Customizing=src
						usr.UpdateBeamWindow(src)
/*				verb/Customize_Beam()
					set category="Skills"
					if(usr.CustomPoints>=70)
						usr.CustomPoints=70
					var/boost = input("How many points do you want to put into the stat? You have [usr.CustomPoints]. Each point adds 0.1 to the given stat, so putting 10 in it increases it by 1. The exception to this is distance, which adds 0.5.") as num|null
					if( usr.CustomPoints < boost || boost == null|| boost <=-1)
						src << "Invalid amount."
						return
					switch(input("What stat are you giving [boost] points to?") in list("Power", "Speed", "Distance", "Charge Rate", "Drain"))
						if("Power")
							usr.CustomPower += boost/10
						if("Speed")
							if(boost>=80)
								src<< "You can only put up to 80 points in speed."
								return
							usr.CustomSpeed += boost/10
						if("Drain")
							usr.CustomEfficiency += boost/10
						if("Distance")
							usr.CustomDistance += boost/2
						if("Charge Rate")
							usr.CustomChargeRate += boost/10
					usr.CustomPoints-=boost*/
/*	Reset_Beam
		icon_state="Beam"
		desc="Resets the stats of your beam, and gives you points based on your... idk i'll decide this later lol"
		Level=100*/
				verb/Reset_Beam()
					set hidden=1
					set name=".Reset_Beam"
					usr.CustomPower=1
					usr.CustomSpeed=1
					usr.CustomEfficiency=1
					usr.CustomDistance=1
					usr.CustomChargeRate=1
					usr.CustomPoints=70
					usr.UpdateBeamWindow(src)

			FireBreath
				Cooldown=45
				Learn=list("energyreq"=35000,"difficulty"=1000)
				Power=2.2
				Speed=6
				Efficiency=0.5
				Distance=5
				ChargeRate=0.75
				Big=0
				Element="Fire"
				sicon='BeamBig6.dmi'
				verb/FireBreath()
					set category="Skills"
					set name="Fire Breath"
					usr.SkillX("Beam",src)
			TidalWave
				Cooldown=30
				Learn=list("energyreq"=35000,"difficulty"=1000)
				Power=2.2
				Speed=7
				Efficiency=0.5
				Distance=5
				ChargeRate=0.75
				Big=1
				Pierce=1
				Element="Water"
				sicon='BeamBig7.dmi'
				verb/TidalWave()
					set category="Skills"
					set name="Tidal Wave"
					usr.SkillX("Beam",src)
			LightningBlast
				Cooldown=30
				Learn=list("energyreq"=35000,"difficulty"=1000)
				Power=0.25
				Speed=9
				Efficiency=0.5
				Distance=5
				ChargeRate=0.01
				Magic=1
				Element="Lightning"
				sicon='Black Lightning.dmi'
				SkillCost=300
				verb/LightningWave()
					set category="Skills"
					set name="Lightning Wave"
					usr.SkillX("Beam",src)
			IceDragon
				Cooldown=60
				Learn=list("energyreq"=35000,"difficulty"=1000)
				Power=8
				Speed=4
				Efficiency=0.5
				Distance=20
				ChargeRate=0.25
				Big=1
				Element="Water"
				sicon='BeamBig1.dmi'
				SkillCost=1000
				verb/IceDragon()
					set category="Skills"
					set name="Ice Dragon"
					usr.SkillX("Beam",src)
			BlackDragon
				Cooldown=600
				Learn=list("energyreq"=35000,"difficulty"=1000)
				Power=8
				Speed=4
				Efficiency=0.5
				Distance=20
				ChargeRate=1
				Big=1
				BlackDragon=1
				sicon='BlackFlameDragon.dmi'
				SkillCost=1000
				verb/BlackDragon()
					set category="Skills"
					set name="Dragon of the Darkness Flame"
					usr.SkillX("Beam",src)
	TimeAlter
		icon_state="Observe"
		desc="Increase the time of your body in exchange for damage to your body..."
		Level=100
		verb/Time_Alter()
			set category = "Skills"
			usr.BuffX("TimeAlter",src)
	ChaosObserve
		Basic=1
		icon_state="Observe"
		desc="Allows you to watch over someone."
		Level=100
		verb/Chaos_Observe()
			set category = "Skills"
			usr.SkillX("ChaosObserve", src)
	Observe
		Basic=1
		Learn=list("energyreq"=10000)
		icon_state="Observe"
		desc="Allows you to watch over someone."
		Level=100
		verb/Observe(var/mob/A in world)
			set category="Skills"
			if(A)
				if(A!=usr && A.z==10)
					usr<<"For some reason, you cannot observe them."
					return
				Observify(usr,A)
				if(A==usr)
					usr.Observing=0
				else
					if(A!=usr && locate(/obj/Skills/Observe,A.contents))
						A<< "You feel as if you're being watched."
					usr.Observing=1
			//usr.SkillX("Observe",src)

	ChaosTelepathy
		Basic=1
		desc="Allows you to send a telepathic message to someone...though God knows who will get it."
		Level=100
		verb/Chaos_Telepath()
			set category="Skills"
			usr.SkillX("ChaosTelepath",src)

	Telepathy
		Basic=1
		Learn=list("energyreq"=1000)
		icon_state="Telepathy"
		desc="Allows you to send a telepathic message to someone."
		Level=100
		verb/Telepath()
			set category="Skills"
			usr.SkillX("Telepath",src)
		verb/Testpath()
			set category="Skills"
			set name="Full Telepath"
			var/list/playerstotelepath=list("Cancel")
			for(var/mob/Players/A in world)
				playerstotelepath+=A
			var/mob/Players/selector=input("Select a player to telepath.") in playerstotelepath
			if(selector=="Cancel")
				return
			usr.TwoWayTelepath(selector)

	LocalTelepathy
		Basic=1
		icon_state="Telepathy"
		desc="Allows you to send a telepathic message to someone near you."
		Level=100
		verb/LocalTelepath()
			set category="Skills"
			var/list/playerstotelepath=list("Cancel")
			for(var/mob/Players/A in view(20,usr))
				playerstotelepath+=A
			var/mob/Players/selector=input("Select a player to telepath.") in playerstotelepath
			if(selector=="Cancel")
				return
			usr.TwoWayTelepath(selector)

	GlobalTelepathy
		Basic=1
		icon_state="Telepathy"
		desc="Allows you to send a telepathic message to anyone on the same world as you."
		Level=100
		verb/GlobalTelepath()
			set category="Skills"
			var/list/playerstotelepath=list("Cancel")
			for(var/mob/Players/A in world)
				if(usr.z==A.z)
					playerstotelepath+=A
			var/mob/Players/selector=input("Select a player to telepath.") in playerstotelepath
			if(selector=="Cancel")
				return
			usr.TwoWayTelepath(selector)

	PowerControl
		ForceSpec=1
		SkillCost=5
		Level=100
		Learn=list("energyreq"=1000,"difficulty"=20)
		icon='Skillz.dmi'
		icon_state="PC"
		sicon='Auras.dmi'
		sicon_state="1"
		desc="Allows you to highten or lower your energy level."
		var/HTAura
		verb/Power_Up()
			set category="Skills"
			usr.SkillX("PowerUp",src)
		verb/Power_Down()
			set category="Skills"
			usr.SkillX("PowerDown",src)
		verb/Power_Recovery()
			set category="Skills"
			usr.SkillX("PowerRecovery",src)
	SoultearStorm
		Cooldown=300
		desc="Using the powers of darkness, you attack your opponent's soul directly, inflicting major damage with a chance to rip their soul from the body."
		Level=100
		SkillCost=1000
		verb/SoultearStorm()
			set name="Soultear Storm"
			set category="Skills"
			usr.SkillX("SoultearStorm",src)


	Magnet
		Cooldown=10
		desc="Draw those around you towards you, damaging them."
		Teachable=0
		verb/Magnet()
			set category="Skills"
			usr.SkillX("Magnet",src)
	Gravity
		Cooldown=60
		Teachable=0
		desc="Create a gravity wave that exerts crushing force on all within its range. Those with extensive gravity training may be resistant to it."
		verb/Gravity()
			set category="Skills"
			set name="Gravity Bomb"
			usr.SkillX("Gravity",src)
	Blizzard
		Cooldown=300
		desc="Create a mighty blizzard, regardless of what planet you're on."
		Teachable=0
		SkillCost=100
		verb/Blizzard()
			set category="Skills"
			usr.SkillX("Blizzard",src)
	DireWinter
		Cooldown=300
		Teachable=0
		desc="A small area is rendered freezing briefly. Anyone caught within the area wil be left freezing for several moments. The caster is immune."
		verb/DireWinter()
			set category="Skills"
			usr.SkillX("DireWinter",src)
	TerraGraviton
		Cooldown=300
		Teachable=0
		desc="Increase the gravity in the general area by several orders of magnitude, inflicting critical damage on everyone in view- including yourself."
		verb/Terra_Graviton()
			set category="Skills"
			usr.SkillX("Terra-Graviton",src)
	AquaRing
		Cooldown=600
		Learn=list("energyreq"=20000,"difficulty"=3)
		icon_state="Heal"
		Teachable=0
		desc="This allows you to heal anyone within a single tile radius of you, however, it will weaken in effectiveness the more people you heal."
		SkillCost=100
		verb/AquaRing()
			set category="Skills"
			set name="Aqua Ring"
			usr.Skill1X("AquaRing",src)
	Barrier
		Cooldown=600
		Learn=list("energyreq"=20000,"difficulty"=3)
		desc="A powerful, area wide barrier spell."
		Teachable=0
		SkillCost=100
		Magic=1
		verb/Barrier()
			set category="Skills"
			usr.SkillX("Barrier",src)
	Inferno
		Cooldown=120
		desc="Surround yourself with flames!"
		Teachable=0
		Magic=1
		verb/Inferno()
			set category="Skills"
			usr.SkillX("Inferno",src)
	Stoneskin
		Cooldown=30
		desc="A support spell that bolsters the Endurance of the target."
		Teachable=0
		Magic=1
		verb/Stoneskin()
			set category="Skills"
			usr.SkillX("Stoneskin",src)
	SearingHeart
		Cooldown=30
		desc="A support spell that bolsters the Strength of the target."
		Teachable=0
		Magic=1
		verb/SearingHeart()
			set category="Skills"
			usr.SkillX("SearingHeart",src)
	OceanMind
		Cooldown=30
		desc="A support spell that bolsters the Force of the target."
		Teachable=0
		Magic=1
		verb/OceanMind()
			set category="Skills"
			usr.SkillX("OceanMind",src)
	ZephyrVision
		Cooldown=30
		desc="A support spell that bolsters the Offense and Defense of the target."
		Teachable=0
		Magic=1
		verb/ZephyrVision()
			set category="Skills"
			usr.SkillX("ZephyrVision",src)
	GrandThunderStorm
		Cooldown=300
		desc="Create a mighty Thunderstorm, striking everyone in view."
		Teachable=0
		SkillCost=300
		verb/GrandThunderStorm()
			set category="Skills"
			usr.SkillX("GrandThunderStorm",src)
	LanzaDelRelampago
		Cooldown=12
		Learn=list("energyreq"=5000,"difficulty"=50)
	//	icon_state="Blast"
		Teachable=0
		sicon='Lanza Del Relampago.dmi'
		desc="Focus a large amount of mana into a rather small spear, creating a -massive- explosion on whatever it hits."
		Distance=10
		SkillCost=1000
		verb/LanzaDelRelampago()
			set name="Lightning Lance"
			set category="Skills"
			usr.SkillX("LanzaDelRelampago",src)
	DeathSentence
		Level=100
		desc="A highly powerful and dangerous magic skill. Offer your blood to the Angel of Death, reducing your maximum health to inflict a mortal blow on your opponent."
		verb/DeathSentence()
			set category="Skills"
			usr.SkillX("DeathSentence",src)
	CurseOfSuffering
		Level=100
		desc="A highly powerful and dangerous magic skill. Offer your blood to the Gods of Slaughter, reducing your maximum health to inflict damage to your opponent equal to the total health you've lost, even including blood sacrifices, in the form of a mighty orb of energy."
		verb/CurseOfSuffering()
			set category="Skills"
			set name="Curse of Suffering"
			usr.SkillX("CurseOfSuffering",src)

obj/Skills/Swords
	MakeUltima
		desc="Make an ultima sword."
		verb/Make_Ultima()
			set category="Skills"
			set name="Make Ultima"
			var/obj/Items/Sword/u=new
			u.EnchantType="Ultima"
			usr.contents+=u
			usr << "You make a new sword imbued with ultimate power."
	SpinAttack
		Cooldown=90
		desc="Charge up your Master Sword and unleash a devestating spin attack!"
		verb/SpinAttack()
			set category="Skills"
			set name="Spin Rave"
			usr.BuffX("SpinAttack", src)
	ArcSlash
		Cooldown=30
		desc="Widely sweep your blade in front of you!"
		verb/SpinAttack()
			set category="Skills"
			set name="Arc Slash"
			usr.BuffX("ArcSlash", src)
	Tipper
		Cooldown=120
		desc="POKE for Demacia!"
		verb/Tipper()
			set category="Skills"
			usr.BuffX("Tipper", src)
	ImproveSword
		desc="Improve a sword...which is somehow better than upgrading it?"
		verb/ImproveSword()
			set category="Skills"
			set name="Improve Sword"
			var/list/swords=list("Cancel")
			for(var/obj/Items/Sword/S in usr.contents)
				swords.Add(S)
			var/obj/Items/Sword/Choice=input("Home onto who?")in swords
//			if(Choice.EnchantLock)
//				usr<<"You're already trying to enchant this weapon, or it's already enchanted."
//				return
			if(Choice.Enchanted)
				usr<<"This weapon's properties cannot be altered further."
				return
			var/Choice2=input("What type of Enchantment?") in list ("Elemental","Additional Points","Weapon Poison", "Nevermind")
			switch(Choice2)
				if("Elemental")
					var/Choice3=input("Select a Element. You may only have one.") in list ("Fire","Wind","Earth","Water","Light","Darkness","Nevermind")
					switch(Choice3)
						if("Fire")
							usr<<"The weapon glows a vibrant red for a few moments, and now feels eternally warm to the touch."
							Choice.EnchantType="Fire"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Wind")
							usr<<"The weapon glows a bright green for a few moments. It feels like wind is slowly swirling around it."
							Choice.EnchantType="Wind"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Earth")
							usr<<"The weapon glows a dull yellow for a few moments. It feels harder, for some reason."
							Choice.EnchantType="Earth"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Water")
							usr<<"The weapon glows a deep blue for a few moments. Moisture seems to gather about the weapon."
							Choice.EnchantType="Water"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Darkness")
							usr<<"The weapon glows a deep purple for a few moments. Grasping the weapon seems to hurt your hand."
							Choice.EnchantType="Darkness"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Light")
							usr<<"The weapon glows a bright silver for a few moments. Grasping the weapon seems to revitalize you."
							Choice.EnchantType="Light"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Nevermind")
							Choice.EnchantLock=0
							return
				if("Additional Points")
					if(Choice.EnchantLock==1)
						usr<<"Stop trying to cheat the system. :|"
						return
					Choice.EnchantLock=1
					if(Choice.Improved||Choice.Upgraded)
						usr<<"This weapon has already been improved or upgraded."
						return
					if(Choice.Enchanted)
						usr<<"This weapon has already been given extra points."
						return
					Choice.Points+=10
					Choice.Improved=1
					usr<<"The weapon now can be enhanced slightly more."
					//Choice.Enchanted=1
					Choice.EnchantLock=0
				if("Weapon Poison")
					Choice.EnchantType="Poison"
					usr<<"You concoct a magical poison and apply it to the weapon. It does not look like the poison can be removed now..."
					Choice.Enchanted=1
					Choice.EnchantLock=0
				if("Nevermind")
					Choice.EnchantLock=0
					return
	HitenMitsurugi
		desc = "Not the best sword style, but definitely the most flashy!"
		var/LastSord
		verb/Hiten_Mitsurugi()
			set category = "Skills"
			//if(!usr.HitenMitsurugi)
			//	usr.HitenMitsurugi=1
			usr.BuffX("HitenMitsurugi", src)
	Ryutsuisen
		Cooldown=10
		desc = "Bring your sword down with twice the force!"
		verb/Ryutsuisen()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			usr.BuffX("Ryutsuisen", src)
			//else
			//	usr << "You're not flashy enough to use this skill."
	Ryukansen
		Cooldown=30
		desc = "Use your opponent's momentum against them with a swift counter!"
		verb/Ryukansen()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			usr.BuffX("Ryukansen", src)
			//else
			//	usr << "You're not flashy enough to use this skill."
	Ryushosen
		Cooldown=30
		desc = "Utilize the secret weapon of the sword: the pommel!"
		verb/Ryushosen()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			usr.BuffX("Ryushosen", src)
			//else
			//	usr << "You're not flashy enough to use this skill."
	Doryusen
		Cooldown=5
		icon_state="Kiai"
		sicon='Air Render.dmi'
		Power=1
		Speed=10
		Efficiency=1
		Distance=2
		Teachable=0
		SkillCost=10
		desc = "Kick debris at your opponent and weaken them!"
		verb/Doryusen()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			usr.BuffX("Doryusen", src)
			//else
			//	usr << "You're not flashy enough to use this skill."
	Kuzuryusen
		desc="Unleash a string of 9 unblockable attacks at your opponent."
		Cooldown=300
		verb/Kuzuryusen()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			usr.BuffX("Kuzuryusen", src)
			//else
			//	usr << "You're not flashy enough to use this technique."
	Soryusen
		desc="Two fluid strikes at increased power.  Hard to dodge."
		Cooldown=20
		verb/Soryusen()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			usr.BuffX("Soryusen", src)
			//else
			//	usr << "You're not flashy enough to use this technique."
	Ryumeisen
		desc = "Sheath your sword with such authority that it cripples those in the area."
		Cooldown=300
		verb/Ryumeisen()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			usr.BuffX("Ryumeisen", src)
			//else
			//	usr << "You're not flashy enough to use this technique."
	Amakakeru_Ryu_no_Hirameki
		desc = "The ultimate, secret technique of Hiten Mitsurugi.  Only one person may know this technique at any given moment in time."
		verb/AmakakeruRyuNoHirameki()
			set name="Amakakeru Ryu no Hirameki"
			set category = "Skills"
			//if(usr.HitenMitsurugi)
			usr.Skill1X("AmakakeruRyuNoHirameki", src)
			//else
			//	usr << "You're not flashy enough to use this technique."
	/*DualWield
		ForceSpec=1
		desc="Double your swordpower with double your sword."
		Level=100
		verb/Dual_Wield()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.BuffX("DualWield", src)
	TripleWield
		ForceSpec=1
		desc="You're probably going to end up the greatest swordsman in the world."
		Level=100
		verb/Triple_Wield()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.BuffX("TripleWield", src)*/
	Megiddo
		Cooldown=300
		desc="Call upon a meteor with your blade, and rain it down upon whoever you hit."
		Level=100
		SkillCost=1000
		verb/Megiddo()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.SkillX("Megiddo",src)
	RevealExcalibur
		desc="Cast the invisible winds away from your sacred blade, revealing its full grace and announcing the name of your Noble Phantasm!"
		Level=100
		var/UsedSpecial
		var/UsedNormal
		verb/RevealExcalibur()
			set category="Skills"
			set name="Wield Excalibur"
			usr.SkillX("RevealExcalibur",src)/*
	Lightbringer
		desc="Transform whatever sword you're currently using into the blade of evil's bane."
		var/UsedSpecial
		var/UsedNormal
		Level=100
		verb/Lightbringer()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.BuffX("Lightbringer",src)
	Deathbringer
		var/UsedSpecial
		var/UsedNormal
		desc="Transform whatever sword you're currently using into the blade of ultimate evil. This weapon, while powerful, has just as much of a chance of harming you as it does your opponent."
		Level=100
		verb/Deathbringer()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.BuffX("Deathbringer",src)
	Muramasa
		desc="Transform whatever sword you're currently using into the bloodthirsty blade that corrupts whatever it strikes."
		Level=100
		var/UsedSpecial
		var/UsedNormal
		verb/Muramasa()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.SkillX("Muramasa",src)*/
	Bladed_Flurry
		desc="Swing your sword faster, but with less power and accuracy."
		Level=100
		SkillCost=10
		verb/Bladed_Flurry()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.SkillX("BladedFlurry",src)
	Mugetsu
		Cooldown=600
		Teachable=0
		Level=100
		sicon='blackslash.dmi'
		desc="The most powerful swordsmanship technique. Unleashes all of your inner power in the form of a massive wave of energy, but every usage takes a great toll on your body, effectively halving your lifespan."
		verb/Final_Getsuga_Tenshou()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.SkillX("Mugetsu",src)
	EnumaElish
		Cooldown=300
		Teachable=0
		Level=100
		sicon='blackslash.dmi'
		desc="A chaotic force that can only be achieved with alien technology..."
		verb/Enuma_Elish()
			set category="Skills"
			usr.Skill1X("EnumaElish",src)
	BalefulBarrier
		Cooldown=120
		Teachable=0
		Level=100
		desc="Disrupt the natural forces that conspire against you!"
		verb/Baleful_Barrier()
			set category="Skills"
			usr.Skill1X("BalefulBarrier",src)
	BuffGetsu
		Teachable=0
		Level=100
		var/LockedUntil
		var/Uses
		sicon='blackslash.dmi'
		desc="The strongest union between swordsman and blade."
		verb/Mugetsu()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.BuffX("BuffGetsu",src)
	Sweeping_Blade
		ForceSpec=1
		Cooldown=30
		Teachable=0
		desc="Wildly swing your blade around you, potentially striking all around you."
		Level=100
		SkillCost=100
		verb/Sweeping_Blade()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.SkillX("SweepingBlade",src)
	AirRender
		Cooldown=2
		desc="Slash your sword at a high speeds, ripping space!"
		icon_state="Kiai"
		sicon='Air Render.dmi'
		Power=1
		Speed=10
		Efficiency=1
		Distance=25
		Teachable=0
		SkillCost=10
		verb/AirRender()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.Skill1X("AirRender",src)
	ScarringBreeze
		Cooldown=10
		SkillCost=150
		Teachable=0
		desc="A fast and powerful cut through space with your sword, easily destroying everything in it's path!"
		icon_state="Kiai"
		sicon='Scarring Breeze.dmi'
		Speed=9
		verb/ScarringBreeze()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.SkillX("ScarringBreeze",src)
	/*WeaponMaster
		Level=100
		Teachable=0
		desc="Show off the fury of one who has mastered their weapon."
		sicon='WMFAura.dmi'
		SkillCost=300
		verb/Weapon_Master()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.BuffX("WeaponMaster",src)*/
	GreatDivide
		Cooldown=120
		Learn=list("energyreq"=5000,"difficulty"=250)
		Level=100
		desc="Bring down your sword with supreme force, cleaving the earth before you in two."
		SkillCost=1000
		verb/Great_Divide()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.SkillX("GreatDivide",src)
	TsunamiStrike
		Cooldown=60
		var/TotalWaterTiles=0
		Learn=list("energyreq"=5000,"difficulty"=250)
		Level=100
		sicon='BlueGetsuga.dmi'
		desc="Empower your sword with any nearby water, releasing it all in the form of a mighty slicing wave."
		SkillCost=1000
		verb/Tsunami_Strike()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.SkillX("TsunamiStrike",src)
	UBW
		Learn=list("energyreq"=1000,"difficulty"=500)
		sicon='SwordBlast2.dmi'
		desc="Summon a Reality Marble to entrap you and your target in, allowing you to engage in the ultimate final showdown. Use this with care,  as it can have deadly effects on one's body if overused."
		Teachable=0
		SkillCost=3000
		verb/UBW()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.SkillX("UBW",src)
	Omnislash
		ForceSpec=1
		Cooldown=7777
		Learn=list("energyreq"=5000,"difficulty"=10000)
		desc="A flurry of furious slashes that can rend dimensions itself! And sadly any poor bastard who stands in your way."
		Level=100
		verb/Omnislash()
			set category="Skills"
			//if(usr.HitenMitsurugi)
			//	usr << "You're too flashy to use this skill."
			//	return
			usr.BuffX("Omnislash",src)
	FluffyTailHell
		Cooldown=360
		desc="A flurry of furious tail whips that can rend dimensions itself! And sadly any poor bastard who stands in your way. Or not?"
		Level=100
		verb/FluffyTailHell()
			set name="Pinny Ougi: Fluffy Tail Hell!!!"
			set category="Skills"
			usr.BuffX("FluffyTailHell",src)

obj/Skills/MartialArts
	CounterAttack
		Basic=1
		Cooldown=30
		verb/CounterA()
			set name="Counter Attack"
			set category="Skills(Defensive)"
			usr.BuffX("Block:Counter", src)
	Forcepalm
		Cooldown=120
		desc="POKE"
		verb/Forcepalm()
			set category="Skills"
			usr.BuffX("Forcepalm", src)
	Headbutt
		Cooldown=30
		desc="Brutally slam your head on the enemy, doing damage to them and taking half as a recoil."
		verb/Headbutt()
			set name="Headbutt"
			set category="Skills"
			usr.BuffX("Headbutt", src)
	CrossPunch
		Cooldown=30
		desc="Unleash cross shaped punch shockwaves!"
		verb/CrossPunch()
			set category="Skills"
			set name="Cross Punch"
			usr.BuffX("CrossPunch", src)
	HammerFist
		Cooldown=40
		desc="Massively knockback foes with a uppercut!"
		verb/HammerFist()
			set category="Skills"
			set name="Hammer Fist"
			usr.BuffX("HammerFist", src)
	WhirlwindStrike
		Cooldown=30
		desc="Perform a rotating kick that will briefly stun enemies around you."
		verb/Whirlwind_Strike()
			set name="Whirlwind Strike"
			set category="Skills"
			usr.BuffX("WhirlwindStrike", src)
/*	Parry
		Basic=1
		Cooldown=45
		verb/CounterA()
			set name="Parry"
			set category="Skills(Defensive)"
			usr.BuffX("Block:Parry", src)
	SonicSway
		Basic=1
		Cooldown=75
		verb/CounterA()
			set name="Sonic Sway"
			set category="Skills(Defensive)"
			usr.BuffX("SonicSway", src)
	EZSonicSway
		Basic=1
		Cooldown=75
		verb/CounterA()
			set name="Sonic Sway"
			set category="Skills(Defensive)"
			usr.BuffX("EZSonicSway", src)*/
	ShutThemUp
		Level=100
		Cooldown=60
		desc="Press B to shut X up."
		verb/Shut_Them_Up()
			set category="Skills"
			usr.BuffX("ShutThemUp", src)
	StrongFlurry
		Level=100
		Cooldown=60
		desc="Throw yo hands in tha air like u just don't care."
		verb/Strong_Flurry()
			set category="Skills"
			usr.BuffX("StrongFlurry", src)

	SuperHumanDrug
		Cooldown=1200
		desc="Slow down a person's perception of time..."
		Level=100
		verb/Super_Human_Drug()
			set category="Skills"
			usr.SkillX("SuperHumanDrug",src)
	TheKnee
		Cooldown=300
		desc="Slam your knee into your opponent's gut!"
		Level=100
		verb/The_Knee()
			set category="Skills"
			usr.SkillX("TheKnee",src)
	HeavyShot
		Basic=1
		Cooldown=15
		Learn=list("energyreq"=5000,"difficulty"=10000)
		desc="Strike your next opponent with far more force."
		Level=100
		SkillCost=50
		verb/HeavyShot()
			set name="Heavy Strike"
			set category="Skills"
			usr.SkillX("HeavyShot",src)
	JumpyPunch
		Cooldown=30
		Level=100
		sicon='Hadoken.dmi'
		verb/JumpyPunch()
			set name="Jumpy Punch!"
			set category="Skills"
			usr.SkillX("JumpyPunch",src)
	Hadoken
		Cooldown=15
		desc = "A wave of energy that uses strength and force."
		Level=100
		sicon='Hadoken.dmi'
		verb/Hadoken()
			set category="Skills"
			usr.TierSX("Hadoken", src)
	ExHadoken
		Cooldown=120
		desc = "A massive wave of energy that utilizes both strength and force."
		Level=100
		sicon='Hadoken.dmi'
		verb/ExHadoken()
			set category="Skills"
			usr.TierSX("ExHadoken", src)
	ShinkuHadoken
		var/LastUse
		desc="A nearly godlike wave of energy that utilizes both strength and force."
		Level=100
		sicon='Hadoken.dmi'
		verb/ShinkuHadoken()
			set category="Skills"
			usr.TierSX("ShinkuHadoken", src)
/*	Shoryuken
		Cooldown=30
		desc = "A series of uppercuts."
		Level=100
		verb/Shoryuken()
			set category="Skills"
			usr.BlastX("Shoryuken", src)
	ExShoryuken
		Cooldown=120
		desc = "A brutal series of uppercuts.  It channels the fires of dragons!"
		Level=100
		verb/ExShoryuken()
			set category="Skills"
			usr.BlastX("ExShoryuken", src)*/
	Shoryureppa
		var/LastUse
		desc = "A nearly godlike barrage of uppercuts."
		Level=100
		verb/Shoryureppa()
			set category="Skills"
			usr.TierSX("Shoryureppa", src)
	Tatsumaki
		Cooldown=45
		desc = "An advancing whirlwind of kicks."
		Level=100
		verb/Tatsumaki()
			set category="Skills"
			usr.TierSX("Tatsumaki", src)
	ExTatsumaki
		Cooldown=120
		desc = "A stationary whirlwind of kicks...don't ask how this works."
		Level=100
		verb/ExTatsumaki()
			set category="Skills"
			usr.TierSX("ExTatsumaki", src)
	ShinkuTatsumaki
		var/LastUse
		desc = "An utterly stunning display of footwork and contempt for gravity."
		Level=100
		verb/ShinkuTatsumaki()
			set category="Skills"
			usr.TierSX("ShinkuTatsumaki", src)
	CleanseSatsui
		desc="Use this to cleanse the Satsui no Hado corruption from someone...forcefully, if necessary."
		Level=100
		verb/Cleanse_Satsui()
			set category="Skills"
			usr.TierSX("CleanseSatsui", src)
	InfectSatsui
		desc="Use this to infect someone with the Satsui no Hado's corruptive power...forcefully, if you want to."
		Level=100
		verb/Infect_Satsui()
			set category="Skills"
			usr.TierSX("InfectSatsui", src)
	ShunGokuSatsu
		Cooldown=600
		desc = "The most refined killing art of the Satsui no Hado."
		Level=100
		verb/ShunGokuSatsu()
			set category="Skills"
			usr.TierSX("RagingDemon", src)
	AsaKujaku
		Cooldown=150
		Learn=list("energyreq"=5000,"difficulty"=10000)
		desc="Set your fists aflame and crush your enemy with a 30 hit combo."
		Level=100
		verb/MorningPeacock()
			set name="Morning Peacock"
			set category="Skills"
			usr.Skill1X("AsaKujaku",src)
	SunlightYellowOverdrive
		Cooldown=120
		var/LastUse
		Learn=list("energyreq"=5000,"difficulty"=10000)
		desc="Set your spirit aflame and crush your enemy with a 30 hit combo."
		Level=100
		verb/SunlightYellowOverdrive()
			set name="Sunlight Yellow Overdrive"
			set category="Skills"
			usr.BuffX("SunlightYellowOverdrive",src)
	EveningElephant
		Cooldown=300
		Learn=list("energyreq"=5000,"difficulty"=10000)
		desc="A high risk, high reward technique. Strike your opponent with a flurry of crushingly powerful blows."
		Level=100
		verb/EveningElephant()
			set name="Evening Elephant"
			set category="Skills"
			usr.BuffX("EveningElephant",src)
	NightGuy
		Cooldown=600
		Learn=list("energyreq"=5000,"difficulty"=10000)
		desc="The ultimate physical attack. Release a kick of such might that it shatters the fabric of time and space!"
		Level=100
		verb/NightGuy()
			set name="Night Guy"
			set category="Skills"
			usr.BuffX("NightGuy",src)
	Sweeping_Kick
		Cooldown=35
		desc="Wildly swing your leg around you, striking all around you and tripping them."
		Level=100
		SkillCost=100
		verb/Sweeping_Kick()
			set category="Skills"
			set name="Sweeping Kick"
			usr.SkillX("SweepingKick",src)
	HeavySmash
		Cooldown=90
		desc="Slam your fists into the ground to create a shockwave!"
		Level=100
		SkillCost=100
		verb/Heavy_Smash()
			set category="Skills"
			usr.Skill1X("HeavySmash",src)
	Throw
		Basic=1
		Cooldown=45
		SkillCost=150
		verb/Throw()
			set category="Skills"
			set name="Throw"
			usr.SkillX("Throw",src)
	Get_Dunked
		Cooldown=60
		desc="Bring your fist down with the force of a meteor, taking anyone unlucky enough to get hit by it to the hoop. Your next Melee move will warp you to your opponent and punch the everliving shit out of them."
		Level=100
		SkillCost=300
		verb/Get_Dunked()
			set category="Skills"
			set name="GET DUNKED"
			usr.SkillX("GETDUNKED",src)
	FrontLotus
		Cooldown=240
		desc="Slam your opponent downwards with amazing youth!"
		verb/Front_Lotus()
			set category="Skills"
			usr.Skill1X("FrontLotus",src)
	ReverseLotus
		Cooldown=240
		desc="Slam your opponent not once, but twice with the force of your youth!"
		verb/Reverse_Lotus()
			set category="Skills"
			usr.Skill1X("ReverseLotus",src)
	Eight_Gates
		desc="Remove the limits on your energy reserves, multiplying them many times over with heavy strain and progressively worsening consequences for each one. The eighth gate will grant you power surpassing that of even gods, but at the cost of your own life."
		Level=100
		var/LockedUntil
		var/Uses
		Teachable=0
		verb/Eight_Gates()
			set category="Skills"
			usr.BuffX("TrueEightGates",src)
	CAST_FIST
		Cooldown=300
		Learn=list("energyreq"=2000)
		Level=100
		desc="What ho, Muscle Wizard! Might you cast us a Spell? Ho ho ho ho, of course, young adventurer!"
		SkillCost=300
		verb/CASTFIST()
			set name="I CAST FIST"
			set category="Skills"
			usr.SkillX("CASTFIST",src)
	AxeKick
		Cooldown=10
		Learn=list("energyreq"=5000,"difficulty"=10000)
		desc="A kick that brings the foot downwards onto the shoulder or head, if the opponent is standing, or onto the body if the opponent is in a prone position. Hits harder if the target is meditating, due to being able to gather more momentum before impact."
		Level=100
		SkillCost=50
		verb/AxeKick()
			set name="Axe Kick"
			set category="Skills"
			usr.Skill1X("AxeKick",src)
	Burning_Finger
		Cooldown=120
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="If you grab someone within ten seconds, they explode."
		Level=100
		SkillCost=100
		verb/Burning_Finger()
			set name="BurningFinger"
			set category="Skills"
			usr.Skill1X("BurningFinger",src)
	Clothes_Line
		Cooldown=60
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="Charges forward with arms outstretched. Once started, the direction cannot be changed."
		Level=100
		SkillCost=1000
		verb/Clothes_Line()
			set name="Clothesline"
			set category="Skills"
			usr.SkillX("Clothesline",src)
	Pursuit
		Basic=1
		Cooldown=35
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="Dash towards your target and render them vulnerable to a devastating combo attack!"
		Level=100
		SkillCost=1000
		verb/Pursuit()
			set name="Pursuit"
			set category="Skills"
			usr.BuffX("Pursuit",src)
	AerialPayback
		Basic=1
		Cooldown=30
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="Cancel knockback and dash towards your target!"
		Level=100
		SkillCost=1000
		verb/AerialRecovery()
			set name="Aerial Payback"
			set category="Skills"
			usr.Skill1X("AerialPayback",src)
	//		usr.BuffX("Pursuit",src)
	AerialRecovery2
		Basic=1
		name="Aerial Recovery"
		Cooldown=15
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="Cancel knockback!"
		Level=100
		SkillCost=1000
		verb/AerialRecovery2()
			set name="Aerial Recovery"
			set category="Skills"
			usr.Skill1X("AerialRecovery",src)
	EightArms
		Basic=1
		Cooldown=90
		desc="Move your arms fast enough to make it look like you attack with more!"
		verb/Hasshuken()
			set name="Hasshuken"
			set category="Skills"
			usr.BuffX("EightArms",src)
	OneHundredArms
		Basic=1
		Cooldown=90
		desc="Move your arms fast enough to make it look like you attack with more!"
		verb/OneHundredArms()
			set name="One-Hundred Arms"
			set category="Skills"
			usr.BuffX("OneHundredArms",src)
	DragonDash
		Basic=1
		Cooldown=20
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="Dash towards your target!"
		Level=100
		SkillCost=1000
		verb/DistanceBreaker()
			set name="Dragon Dash"
			set category="Skills"
			usr.BuffX("DistanceBreaker",src)
	ReverseDash
		Basic=1
		Cooldown=20
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="Quickly dash away!"
		Level=100
		SkillCost=1000
		verb/ReverseDash()
			set name="Reverse Dash"
			set category="Skills"
			usr.BuffX("NormalDash",src)
	HypersonicCombo
		Basic=1
		Cooldown=1
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="Dash towards your target and render them vulnerable to a devastating series of hypersonic attacks! Missing will stun you for a time, however, so it's best used on a vulnerable opponent."
		Level=100
		SkillCost=1000
		verb/HypersonicCombo()
			set name="Hypersonic Combo"
			set category="Skills"
			usr.BuffX("HypersonicCombo",src)
	LightningLariat
		Cooldown=90
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="Charges forward with arms outstretched, enveloping one's body in an armor of lightning. Once started, the direction cannot be changed."
		Level=100
		SkillCost=1000
		verb/Lariat()
			set name="Lariat"
			set category="Skills"
			usr.BuffX("Lariat",src)
	Activate_Stance
		var/list/validstancelist
		Learn=list("energyreq"=100000,"difficulty"=5000000)
		desc="Use this to activate your selected stance."
		Level=100
		verb/Activate_Stance()
			set name="Toggle Stance"
			set category="Skills"
			usr.SkillX("Stance",src)
		verb/QuickToggleStance(stancename as text)
			set category="Skills"
			set src=usr.contents
			if(usr.StanceActive==1)
				usr.SkillX("Stance",src)
				src.StanceListGenerator()
				if(!validstancelist.Find("[stancename]"))
					usr<<"You don't have the [stancename] stance. Assure spelling is right and the first letter has a capital."
					return
				else
					usr.Stance=stancename
					usr.SkillX("Stance",src)
			else
				src.StanceListGenerator()
				if(!validstancelist.Find("[stancename]"))
					usr<<"You don't have the [stancename] stance. Assure spelling is right and the first letter has a capital."
					return
				else
					usr.Stance=stancename
					usr.SkillX("Stance",src)

		proc/StanceListGenerator()
			validstancelist=list("Training","Turtle","Bat","Crane","Wolf","Armadillo","Cheetah","Horse","Ripple","Resshuken","Fox","Circulation","Tortoise","Dragon","Tiger","Phoenix","Ansatsuken","Drunken Fist","Strong Fist","Southpaw","Black Leg","CQC",)
			if(usr.TrainingStanceUnlocked!=1)
				validstancelist.Remove("Training")
			if(usr.TurtleStanceUnlocked!=1)
				validstancelist.Remove("Turtle")
			if(usr.BatStanceUnlocked!=1)
				validstancelist.Remove("Bat")
			if(usr.CraneStanceUnlocked!=1)
				validstancelist.Remove("Crane")
			if(usr.WolfStanceUnlocked!=1)
				validstancelist.Remove("Wolf")
			if(usr.ArmadilloStanceUnlocked!=1)
				validstancelist.Remove("Armadillo")
			if(usr.CheetahStanceUnlocked!=1)
				validstancelist.Remove("Cheetah")
			if(usr.HorseStanceUnlocked!=1)
				validstancelist.Remove("Horse")
			if(usr.RippleStanceUnlocked!=1)
				validstancelist.Remove("Ripple")
			if(usr.ResshukenUnlocked!=1)
				validstancelist.Remove("Resshuken")
			if(usr.Class!="Kitsune")
				validstancelist.Remove("Fox")
			if(usr.CirculationUnlocked!=1)
				validstancelist.Remove("Circulation")
			if(usr.TortoiseUnlocked!=1)
				validstancelist.Remove("Tortoise")
			if(usr.DragonUnlocked!=1)
				validstancelist.Remove("Dragon")
			if(usr.TigerUnlocked!=1)
				validstancelist.Remove("Tiger")
			if(usr.PhoenixUnlocked!=1)
				validstancelist.Remove("Phoenix")
			if(usr.AnsatsukenUnlocked!=1)
				validstancelist.Remove("Ansatsuken")
			if(usr.BlackLegUnlocked!=1)
				validstancelist.Remove("Black Leg")
			if(usr.DrunkenFistUnlocked!=1)
				validstancelist.Remove("Drunken Fist")
			if(usr.StrongFistUnlocked!=1)
				validstancelist.Remove("Strong Fist")
			if(usr.SouthpawUnlocked!=1)
				validstancelist.Remove("Southpaw")
			if(usr.CQCUnlocked!=1)
				validstancelist.Remove("CQC")

	Set_Stance
		Learn=list("energyreq"=100000,"difficulty"=5000000)
		desc="Use this to configure your Stances."
		Level=100
		var/list/stancelist=list("Cancel")
		verb/Set_Stance()
			set name="Set Stance"
			set category="Skills"
			var/StanceIncrease=50//usr.Skillz["Unarmed"]["Level"]
			if(usr.StanceActive==1)
				if(usr.Stance=="Fox")
				{
					usr << "Motherfoxer, you can't switch stances while using a stance!  Goddamn flippin' witty Kitsunes, man!";
					return
				}
				else
				{
					usr<<"You can't switch stances while using a stance!"
					return
				}
			usr.StanceLock=1
			stancelist=null
			stancelist=list("Cancel")
			if(usr.TrainingStanceUnlocked==1)
				stancelist.Add("Training Stance")
			if(usr.TurtleStanceUnlocked==1)
				stancelist.Add("Turtle Stance")
			if(usr.BatStanceUnlocked==1)
				stancelist.Add("Bat Stance")
			if(usr.CraneStanceUnlocked==1)
				stancelist.Add("Crane Stance")
			if(usr.WolfStanceUnlocked==1)
				stancelist.Add("Wolf Stance")
			if(usr.ArmadilloStanceUnlocked==1)
				stancelist.Add("Armadillo Stance")
			if(usr.CheetahStanceUnlocked==1)
				stancelist.Add("Cheetah Stance")
			if(usr.HorseStanceUnlocked==1)
				stancelist.Add("Horse Stance")
			if(usr.RippleStanceUnlocked==1)
				stancelist.Add("Ripple")
			if(usr.ResshukenUnlocked==1)
				stancelist.Add("Resshuken")
			if(usr.Class=="Kitsune")
				stancelist.Add("Fox Stance")
			if(usr.CirculationUnlocked==1)
				stancelist.Add("Circulation Form")
			if(usr.TortoiseUnlocked)
				stancelist.Add("Tortoise Stance")
			if(usr.DragonUnlocked)
				stancelist.Add("Dragon Stance")
			if(usr.TigerUnlocked)
				stancelist.Add("Tiger Stance")
			if(usr.PhoenixUnlocked)
				stancelist.Add("Phoenix Stance")
			if(usr.AnsatsukenUnlocked==1)
				stancelist.Add("Ansatsuken Stance")
			if(usr.BlackLegUnlocked==1)
				stancelist.Add("Black Leg Stance")
			if(usr.DrunkenFistUnlocked==1)
				stancelist.Add("Drunken Fist")
			if(usr.StrongFistUnlocked==1)
				stancelist.Add("Strong Fist")
			if(usr.SouthpawUnlocked==1)
				stancelist.Add("Southpaw Stance")
			if(usr.MonkeyUnlocked==1)
				stancelist.Add("Monkey Stance")
			if(usr.CQCUnlocked==1)
				stancelist.Add("CQC Stance")
			///
			for(var/obj/Skills/Buffs/Stances/S in usr)
				stancelist.Add(S)
			///

			var/obj/selection=input("")in stancelist
			if(selection=="Cancel")
				return
			if(usr.StanceActive==1)
				usr<<"You can't switch stances while using a stance!"
				return
			if(selection=="Training Stance")
				var/Choice1=alert(usr,"Training Stance dramatically weakens you, so you may train with a reduced risk of injuring your sparring partner.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Training"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Turtle Stance")
				var/Choice1=alert(usr,"Turtle Stance is a highly defensive stance. It'll increase your Endurance and Resistance by [StanceIncrease]%.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Turtle"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Bat Stance")
				var/Choice1=alert(usr,"Bat Stance is a highly offensive stance. It'll increase your Strength and Force by [StanceIncrease]%.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Bat"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Crane Stance")
				var/Choice1=alert(usr,"Crane Stance is a force oriented stance. It'll increase your Force and Offense by [StanceIncrease]%.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Crane"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Wolf Stance")
				var/Choice1=alert(usr,"Wolf Stance is a highly offensive, but durable stance. It'll increase your Strength and Offense by [StanceIncrease]%.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Wolf"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Cheetah Stance")
				var/Choice1=alert(usr,"Cheetah Stance is a speed stance. It'll increase your Speed and Strength by [StanceIncrease]%, but reduce Offense by half. Meow.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Cheetah"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Horse Stance")
				var/Choice1=alert(usr,"Horse Stance is the ultimate speed stance. Doing so sacrifices your dignity. Will you embark down this path..?","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Horse"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Armadillo Stance")
				var/Choice1=alert(usr,"Armadillo Stance is a defensive, high power stance. It'll increase your Defense and Endurance by [StanceIncrease]%.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Armadillo"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Resshuken")
				var/Choice1=alert(usr,"A form of martial arts, said to be the strongest. It incorporates elements of every fighting style, with a pronounced emphasis on grace and poise.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Resshuken"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Ripple")
				var/Choice1=alert(usr,"Ripple Stance is a stance dedicated to fighting the undead. It'll increase your Offense and Defense by [StanceIncrease]%, as well as grant you the ability to inflict extra damage to Lycans, Vampires, Demons, and Majinized people- as well as possibly a few extra races.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Ripple"
						usr.StanceLock=0
						return
					if("No")
						return
/*			if(selection=="Weapon Breaker")
				if(usr.StanceActive==1)
					usr<<"You can't switch stances while using a stance!"
					return
				var/Choice1=alert(usr,"Weapon Breaker is a stance that utilizes the discipline and concentration one learns from martial arts to match and negate close-range weaponry. Increases strength, offense, and defense by 15%, but cuts speed by 25%.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Breaker"
						usr.StanceLock=0
						return
					if("No")
						return*/
			if(selection=="Fox Stance")
			{
				var/choice1=alert(usr, "The Fox Stance is the epitome of being a fox.  Never before will you be more foxxy than when you use a fox stance.  It might make you grow a dick too?  Maybe.  Can never tell with Kitsunes.","","Yes", "No");
				switch(choice1)
				{
					if("Yes")
					{
						usr.Stance="Fox"
						usr.StanceLock=0
						usr << "It has happened.  You have ascended to the pinnacle of Foxiliciousness.";
						return
					}
					if("No")
					{
						usr << "Yeah, I don't blame you.  It's tough being a fox.  Maybe you should be a race that, you know, isn't a furry next time."
						usr << "Then again, maybe not."
						return
					}
				}
			}
			if(selection=="Dragon Stance")
				var/Choice1=alert(usr,"Dragon Stance is a powerful stance that boosts BP by 50%, Force and Strength by 40%, and Endurance+Resistance by 20%","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Dragon"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Phoenix Stance")
				var/Choice1=alert(usr,"I got bored writing flavor text for these. It's +50% BP and +75% recov.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Phoenix"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Tiger Stance")
				var/Choice1=alert(usr,"Tiger Stance is a powerful stance dedicated to speed, offering +50% strength, +25% speed and force.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Tiger"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Tortoise Stance")
				var/Choice1=alert(usr,"Tortoise Stance is a powerful stance dedicated to defensive prowess. It cuts speed by 25%, but boosts strength by the same amount, and boosts your BP by 50%, and your Endurance, and Resistance by 75%.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Tortoise"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Ansatsuken Stance")
				var/Choice1=alert(usr,"Something about Street Fighter...","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Ansatsuken"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Circulation Form")
				var/Choice1=alert(usr,"Would you like to redistribute ki throughout your body?","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Circulation"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Southpaw Stance")
				var/Choice1=alert(usr,"#oxywaddle","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Southpaw"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Black Leg Stance")
				var/Choice1=alert(usr,"A stance focusing entirely on kicks.  Increases strength, endurance and offense.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="BlackLeg"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Drunken Fist")
				var/Choice1=alert(usr,"#oxywaddle","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="DrunkenFist"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Strong Fist")
				var/Choice1=alert(usr,"#oxywaddle","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="StrongFist"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Monkey Stance")
				var/Choice1=alert(usr,"Monkey Stance a stance built around speed.  2x speed, 1.75x offense and defense.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="Monkey"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="CQC Stance")
				var/Choice1=alert(usr,"CQC Stance is an advanced martial stance that combines many martial arts in one. Once you master this, you'll pretty much overpower anyone in close-quarters and no questions asked.  3x to Strength, Durability, Resistance, 2x all stats.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="CQC"
						usr.StanceLock=0
						return
					if("No")
						return
			else
				var/obj/Skills/Buffs/Stances/this = selection
				var/Choice1=alert(usr,"[this.desc]","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.Stance="[this.name]"
						usr.StanceLock=0
						return
					if("No")
						return


	Activate_Advanced_Stance
		Learn=list("energyreq"=100000,"difficulty"=5000000)
		desc="Use this to activate your selected Advanced stance."
		Level=100
		verb/Activate_AdvancedStance()
			set name="Activate Advanced Stance"
			set category="Skills"
			usr.Skill1X("AdvancedStance",src)

	Set_Advanced_Stance
		Learn=list("energyreq"=100000,"difficulty"=5000000)
		desc="Use this to configure your Advanced Stances. Advanced stances have certain special effects, but offer -no- form of stat boost."
		Level=100
		var/list/stancelist=list("Cancel")
		verb/Set_AdvancedStance()
			set name="Set Advanced Stance"
			set category="Skills"
			var/StanceIncrease=usr.Skillz["Unarmed"]["Level"]
			if(StanceIncrease>49)
				StanceIncrease=50
			if(usr.AdvancedStanceActive==1)
				usr<<"You can't switch stances while using a stance!"
				return
			usr.StanceLock=1
			stancelist=null
			stancelist=list("Cancel")
			if(usr.SoulCrushingUnlocked==1)
				stancelist.Add("Soul Crushing")
			if(usr.ChiBlockUnlocked==1)
				stancelist.Add("Chi Block")
			if(usr.ExplosionUnlocked==1)
				stancelist.Add("Explosion")
			if(usr.FireFistsUnlocked==1)
				stancelist.Add("Fire Fists")
			if(usr.EarthFistsUnlocked==1)
				stancelist.Add("Earth Fists")
			if(usr.WindFistsUnlocked==1)
				stancelist.Add("Wind Fists")
			if(usr.WaterFistsUnlocked==1)
				stancelist.Add("Water Fists")
			if(usr.SolarUnlocked==1)
				stancelist.Add("Solar Stance")
			if(usr.MoonlightUnlocked==1)
				stancelist.Add("Moonlight Stance")
			if(usr.EmptyFistUnlocked==1)
				stancelist.Add("Empty Fist")
			if(usr.DyingFistsUnlocked==1)
				stancelist.Add("Dying Fists")
			var/obj/selection=input("")in stancelist
			if(selection=="Cancel")
				return
			if(selection=="Soul Crushing")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"Channel your ki into your fists to deliver devastating blows...","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="SoulCrushing"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Chi Block")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"Prevent someone from raising their power for an amount of time based on the amount of Ki they can output in an offensive manner.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="ChiBlock"
						usr.StanceLock=0
						return
					if("No")
						return
			if(selection=="Explosion")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"Your fists are full of reactive potential!","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="Explosion"
						usr.StanceLock=0
					if("No")
						return
			if(selection=="Fire Fists")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"Your fists are ignited in flames!","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="FireFists"
						usr.StanceLock=0
					if("No")
						return
			if(selection=="Earth Fists")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"Your fists are covered in spikey rocks!","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="EarthFists"
						usr.StanceLock=0
					if("No")
						return
			if(selection=="Water Fists")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"Your fists are covered in a layer of flowing water!","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="WaterFists"
						usr.StanceLock=0
					if("No")
						return
			if(selection=="Wind Fists")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"Your fists are covered in a swirling tornado!","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="WindFists"
						usr.StanceLock=0
					if("No")
						return
			if(selection=="Moonlight Stance")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"You gain a pale aura, granting you the same attributes as if you equipped Darkness Elemental Swords and Armor.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="Moonlight"
						usr.StanceLock=0
					if("No")
						return
			if(selection=="Solar Stance")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"You gain a bright aura, granting you the same attributes as if you equipped Light Elemental Swords and Armor.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="Solar"
						usr.StanceLock=0
					if("No")
						return
			if(selection=="Empty Fist")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"A refined martial art taking all of the benefits of Light and suffering no disadvantages.","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="Empty Fist"
						usr.StanceLock=0
					if("No")
						return
			if(selection=="Dying Fists")
				if(usr.AdvancedStanceActive==1)
					usr<<"You can't switch advanced stances while using a advanced stance!"
					return
				var/Choice1=alert(usr,"Imbue your fists with the power of darkness and smoke to destroy your enemies!","","Yes","No")
				switch(Choice1)
					if("Yes")
						usr.AdvancedStance="Dying Fists"
						usr.StanceLock=0
					if("No")
						return

mob/var
	list/BuffList = list()


obj/Skills/Buffs
///
//this is the start of an attempt to undo the hardcoding of buffs
	var
		PowerLock = 0 //Is this locked if powered up?
		PowerAdd = 0 //this should be what is added to the power multiplier
		StrengthMult = 1 //what strength should be multiplied by
		ForceMult = 1 //what force should be multiplied by
		EnduranceMult = 1 //what endurance should be multiplied by
		ResistanceMult = 1 //what resistance should be multiplied by
		OffenseMult = 1 //what offense should be multiplied by
		DefenseMult = 1 //what defense should be multiplied by
		SpeedMult = 1 //what speed should be multiplied by
		RecoveryMult = 1 //what recovery should be multiplied by
		RegenerationMult = 1 //what regeneration should be multiplied by
		ManaAdd = 0 //this should be what is added to the max and current mana
		AngerAdd = 0 //this should be what is added to the anger
		SlotsUsed = 3 //how many of the "active buff" slots this uses
		Special = 0 //boolean for if this is a special slot or not
		activation_flavor = " activates the buff."
		deactivation_flavor = " deactivates the buff."
		description_flavor as text
		buff_icon as icon

	New()
		src.Update()
		..()

	Click()
		if(src in usr) src.ToggleBuff(usr)
		..()

	proc
		Update()
			if(src.description_flavor) src.desc = "[src.description_flavor]\nUses [src.SlotsUsed] buff slot[ abs(src.SlotsUsed) > 1 ? "s" : ""][src.Special ? " and a special slot" : ""]."//\n[src.PowerAdd ? "+[src.PowerAdd*100]% BP " : ""][src.ManaAdd ? "+[src.ManaAdd] Mana " : ""][src.AngerAdd ? "+[src.AngerAdd*100]% Anger " : ""][src.StrengthMult != 1 ? "x[src.StrengthMult] Str " : ""][src.ForceMult != 1 ? "x[src.ForceMult] Force " : ""][src.EnduranceMult != 1 ? "x[src.EnduranceMult] End " : ""][src.ResistanceMult != 1 ? "x[src.ResistanceMult] Res " : ""][src.OffenseMult != 1 ? "x[src.OffenseMult] Off " : ""][src.DefenseMult != 1 ? "x[src.DefenseMult] Def " : ""][src.SpeedMult != 1 ? "x[src.SpeedMult] Spd " : ""][src.RecoveryMult != 1 ? "x[src.RecoveryMult] Rec " : ""][src.RegenerationMult != 1 ? "x[src.RegenerationMult] Regen " : ""]"

		//for extra hard coded benefits
		//sort of a bandaid since not entirely sure what aspects of existing buffs need to be folded in
		Special(var/on, var/mob/subject)

		/*
		  Passive() is called once a tick if your buff is in the BuffList
		  ideally you will be able to shove most passive behaviors into this later, for now only some work well
		  still way too hardcoded for my liking
		*/
		Passive(var/mob/subject)

		//a generic use verb, create a seperate verb to call this
		//in the actual object, so that it appears to the user as the object's name
		//this is the proc that adds/removes a buff from the user
		//subject should be the one the buff is applying too
		ToggleBuff(var/mob/subject)
			if(!src.BuffUsing)
				if(src.PowerLock)
					if(subject.ControlPower>100 || subject.PowerUp)
						subject << "You can not activate [src] while powered up."
						return
				if(subject.ActiveBuffs + src.SlotsUsed > MAXBUFFS) return
				if(src.Special)
					if(subject.SpecialSlot) return
					subject.SpecialSlot = 1
				subject.ActiveBuffs += src.SlotsUsed
				subject.BuffList += src
				subject.Power_Multiplier += src.PowerAdd
				subject.StrengthMultiplier *= src.StrengthMult
				subject.ForceMultiplier *= src.ForceMult
				subject.EnduranceMultiplier *= src.EnduranceMult
				subject.ResistanceMultiplier *= src.ResistanceMult
				subject.OffenseMultiplier *= src.OffenseMult
				subject.DefenseMultiplier *= src.DefenseMult
				subject.SpeedMultiplier *= src.SpeedMult
				subject.RecoveryMultiplier *= src.RecoveryMult
				subject.RegenerationMultiplier *= src.RegenerationMult
				subject.ManaMax += src.ManaAdd
				subject.ManaAmount += src.ManaAdd
				subject.overlays += src.buff_icon
				src.BuffUsing = 1
				src.Special(1, subject)
				usr.OMessage(10,"[subject][activation_flavor]","<font color=red>[subject]([subject.key]) activated [src.name].")
				return 1 //returns 1 to mark that the buff has been turned on
			else
				if(src.Special) subject.SpecialSlot = 0
				subject.ActiveBuffs -= src.SlotsUsed
				subject.BuffList -= src
				subject.Power_Multiplier -= src.PowerAdd
				subject.StrengthMultiplier /= src.StrengthMult
				subject.ForceMultiplier /= src.ForceMult
				subject.EnduranceMultiplier /= src.EnduranceMult
				subject.ResistanceMultiplier /= src.ResistanceMult
				subject.OffenseMultiplier /= src.OffenseMult
				subject.DefenseMultiplier /= src.DefenseMult
				subject.SpeedMultiplier /= src.SpeedMult
				subject.RecoveryMultiplier /= src.RecoveryMult
				subject.RegenerationMultiplier /= src.RegenerationMult
				subject.ManaMax -= src.ManaAdd
				subject.ManaAmount -= src.ManaAdd
				subject.overlays -= src.buff_icon
				src.BuffUsing = 0
				src.Special(0, subject)
				usr.OMessage(10,"[subject][deactivation_flavor]","<font color=red>[subject]([subject.key]) deactivated [src.name].")
				return 0 //return 0 to mark the buff has been turned off

	/*
	This stance
	*/
	Stances
		name = "Custom Stance"
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc = "Custom stance."
		activation_flavor = " activates their custom stance!"
		deactivation_flavor = " deactivates their custom stance!"
		SlotsUsed = 0
		ToggleBuff(var/mob/subject)
			if(subject.StanceLock==1)
				subject<<"You're trying to set a stance at the same time as activating one. Don't do that."
				return
			subject.BuffCalc=1.5
			if(locate(/obj/Skills/TierS/SpiritEnergyNu,subject)&&subject.SpiritWeaponChosen!="Style")
				subject.BuffCalc*=1.1
			if(subject.SpiritWeaponChosen=="Style"&&subject.SpiritLevel<4)
				subject.BuffCalc*=1.2
			if(subject.SpiritWeaponChosen=="Style"&&subject.SpiritLevel>=4)
				subject.BuffCalc*=1.25
			if(locate(/obj/Skills/TierS/DemonEnergy,subject)&&subject.SpiritLevel>=2)
				subject.BuffCalc*=1.15
			for(var/obj/Items/Sword/S in subject)
				if(S.suffix)
					subject<<"Stances are more for punching people in the face, not stabbing them. No swords allowed."
					return
			..()
		Special(on, mob/subject)
			if(on)
				subject.StanceActive=1
				for(var/obj/Skills/MartialArts/S in subject)
					S.BuffUsing = 1
			else
				subject.StanceActive=0
				for(var/obj/Skills/MartialArts/S in subject)
					S.BuffUsing = 0

	Warrior_Stride
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Carry yourself like a warrior."
		activation_flavor = " proudly prepares themselves for battle!"
		deactivation_flavor = " stands down."
		PowerAdd = 0.5
		StrengthMult = 1.35
		ForceMult = 1.1
		EnduranceMult = 1.35
		ResistanceMult = 0.8
		DefenseMult = 0.8
		SpeedMult = 1.25

		verb/Warrior_Stride()
			set category="Skills"
			src.ToggleBuff(usr)

	//t2 warrior stride

	Battle_Ready
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Carry yourself like a warrior.  Heavy shots knock back further, stun foes longer."
		activation_flavor = " prepares for the most difficult battles, as they emit an aura of violence!"
		deactivation_flavor = " stands down."
		PowerAdd = 0.5
		StrengthMult = 2
		EnduranceMult = 2
		ResistanceMult = 0.5
		SpeedMult = 1.65

		verb/Battle_Ready()
			set category="Skills"
			src.ToggleBuff(usr)

		Passive(var/mob/subject)

	Shadow_Walk
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Slip into the shadows, making yourself harder to hit."
		activation_flavor = " switches to a more stealthy approach, moving within the shadows!"
		deactivation_flavor = " emerges from the shadows."
		PowerAdd = 0.5
		StrengthMult = 0.65
		EnduranceMult = 0.65
		DefenseMult = 1.1
		SpeedMult = 1.65

		Special(var/on)
			if(on) animate( usr, alpha=alpha/2, time=10 )
			else animate( usr, alpha=alpha*2, time=10 )

		verb/Shadow_Walk()
			set category="Skills"
			src.ToggleBuff(usr)

	//tier 2 shadow walk
	Nightingale
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Vanish into the darkness, with a chance of turning invisible briefly when hit."
		activation_flavor = " becomes one with the shadows, assuming command over their new domain!"
		deactivation_flavor = " emerges from the shadows."
		PowerAdd = 0.5
		StrengthMult = 0.5
		EnduranceMult = 0.5
		DefenseMult = 1.35
		SpeedMult = 2.75
		var/previous_alpha = 0

		Special(var/on, var/mob/subject)
			if(on) animate( subject, alpha=alpha/3, time=10 )
			else animate( subject, alpha=alpha*3, time=10 )

		verb/Nightingale()
			set category="Skills"
			if(!src.previous_alpha)
				src.ToggleBuff(usr)
			else
				animate( usr, alpha=src.previous_alpha, time=1 )
				src.previous_alpha=0
				src.ToggleBuff(usr)

		Passive(var/mob/subject)
			if(subject.HitBy["Attacked"])
				if(!src.previous_alpha && prob(50))
					src.previous_alpha = subject.alpha
					animate( subject, alpha=0, time=1 )
					sleep(30)
					if(src.previous_alpha)
						animate( subject, alpha=src.previous_alpha, time=1 )
						src.previous_alpha = 0

	Mana_Blitz
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Shroud yourself with mana."
		activation_flavor = " becomes engulfed in mana!"
		deactivation_flavor = " releases the mana around them."
		PowerAdd = 0.5
		ManaAdd = 150
		RecoveryMult = 1.45

		verb/Mana_Blitz()
			set category="Skills"
			src.ToggleBuff(usr)

	//t2 Mana Blitz
	Catalyst
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Shroud yourself with mana."
		activation_flavor = " becomes engulfed in mana!"
		deactivation_flavor = " releases the mana around them."
		PowerAdd = 0.5
		ManaAdd = 400
		RecoveryMult = 1.75

		verb/Catalyst()
			set category="Skills"
			src.ToggleBuff(usr)

		//restore mana when hit by a heavy shot
		Passive(var/mob/subject)
			if(subject.HitBy["HeavyShot"] && prob(50))
				subject.Recover("Mana",subject.ManaMax/20)
				view(10) << "[subject] surges with mana!"

	Raging_Soul
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Unleash your fury."
		activation_flavor = " fights with pure, untainted fury!"
		deactivation_flavor = " restrains their fury."
		PowerAdd = 0.5
		AngerAdd = 0.5
		EnduranceMult = 0.8

		verb/Raging_Soul()
			set category="Skills"
			src.ToggleBuff(usr)

	//t2 raging soul
	Spirit_Fury
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Unleash your fury.  Angers at 75 hp."
		activation_flavor = " cast aside all thoughts and emotion outside of their utter, unforgiving rage!"
		deactivation_flavor = " restrains their fury."
		PowerAdd = 0.5
		AngerAdd = 1.25
		EnduranceMult = 0.5
		ResistanceMult = 0.5

		verb/Spirit_Fury()
			set category="Skills"
			src.ToggleBuff(usr)

		//trigger anger at 75 hp
		Special(var/on, var/mob/subject)
			if(on) subject.AngerThreshold = 75
			else subject.AngerThreshold = 50


	Shining_Star
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Focus and refine your ki so much that you practically are glowing."
		activation_flavor = " begins to gently illuminate like the night sky!"
		deactivation_flavor = " dims."
		PowerAdd = 0.5
		ForceMult = 2
		OffenseMult = 2
		DefenseMult = 0.8
		StrengthMult = 0.65

		verb/Shining_Star()
			set category="Skills"
			src.ToggleBuff(usr)

	//tier 2 shining star
/* wip
	Nebula
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Focus and refine your ki so much that you are glowing.  Chance to fire a projectile twice."
		activation_flavor = " begins to dazzle in the brilliance of the cosmos!"
		deactivation_flavor = " dims."
		PowerAdd = 0.5
		ForceMult = 2.75
		OffenseMult = 2.75
		DefenseMult = 0.5
		StrengthMult = 0.4
		RecoveryMult = 1.2

		verb/Nebula()
			set category="Skills"
			src.ToggleBuff(usr)

		Passive(var/mob/subject)
*/

	Kindred_Heart
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Call upon your inner strength."
		activation_flavor = " begins to use whats inside, to make it really count!"
		deactivation_flavor = " ceases calling upon their inner strength."
		PowerAdd = 0.5
		EnduranceMult = 0.5
		DefenseMult = 1.5
		StrengthMult = 1.3

		verb/Kindred_Heart()
			set category="Skills"
			src.ToggleBuff(usr)

		Passive(var/mob/subject)
			if(subject.HitBy["HeavyShot"])
				subject.Recover("Energy",usr.MaxEnergy()/20)
				view(subject, 10) << "[subject] grows more determined."

	//t2 Kindred Heart
	Driven_Grace
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Call upon your inner strength. Recover 10 energy when heavy shot, and gain 5 power"
		activation_flavor = " refuses to quit, as every bit of their soul is put to use!"
		deactivation_flavor = " ceases calling upon their inner strength."
		PowerAdd = 0.5
		EnduranceMult = 0.5
		DefenseMult = 1.5
		StrengthMult = 1.3

		verb/Driven_Grace()
			set category="Skills"
			src.ToggleBuff(usr)

		Passive(var/mob/subject)
			if(subject.HitBy["HeavyShot"])
				subject.Recover("Energy",10)
				view(subject, 10) << "[subject] seems even more determined!"

	Silk_Armor
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Wrap yourself in a layer of silk, offering great protection and improved mobility."
		activation_flavor = " wraps themselves in layers of silk, empowering their movement!"
		deactivation_flavor = "'s silk falls off and decays away."
		PowerLock = 1
		PowerAdd = 0.75
		OffenseMult = 2
		DefenseMult = 2
		StrengthMult = 1.5

		verb/Silk_Armor()
			set category="Skills"
			src.ToggleBuff(usr)

	Ghost_Armor
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Ability that lets you phase through most things and improves your regeneration.  Allows movement through characters."// and all built tiles other than roofs."
		activation_flavor = " surrounds themselves in an armor that lets them phase through objects!"
		deactivation_flavor = " rephases."
		PowerLock = 1
		PowerAdd = 0.75
		RegenerationMult = 3
		RecoveryMult = 1.5

		verb/Ghost_Armor()
			set category="Skills"
			src.ToggleBuff(usr)

	Mana_Armor
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Gathers mana about yourself."
		activation_flavor = " starts to sparkle brightly as they arm themselves with raw mana!"
		deactivation_flavor = " dispells the mana gathered."
		PowerLock = 1
		PowerAdd = 0.75
		ManaAdd = 500

		verb/Mana_Armor()
			set category="Skills"
			src.ToggleBuff(usr)

	Salt_Armor
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Condense the salt around you into armor."
		activation_flavor = " takes the salt of the planet for themselves!"
		deactivation_flavor = " returns the salt."
		PowerLock = 1
		PowerAdd = 0.75
		EnduranceMult = 2
		ResistanceMult = 2
		StrengthMult = 1.25
		OffenseMult = 1.25

		verb/Salt_Armor()
			set category="Skills"
			src.ToggleBuff(usr)


	Wood_Armor
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Warps or creates wood to defend yourself."
		activation_flavor = " calls upon nature, as they are gracefully wrapped in layers of wood!"
		deactivation_flavor = "'s layers of armor return to nature."
		PowerLock = 1
		PowerAdd = 0.75
		ResistanceMult = 2
		StrengthMult = 2
		DefenseMult = 1.5

		verb/Wood_Armor()
			set category="Skills"
			src.ToggleBuff(usr)

	Oxygen_Armor
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Energizes themself by breathing in air."
		activation_flavor = " deeply inhales as they take breath from an armor of clean air, jump kicking their vitals!"
		deactivation_flavor = " lets the air around them return to normal."
		PowerLock = 1
		PowerAdd = 0.75
		ForceMult = 1.6
		ResistanceMult = 1.6
		StrengthMult = 1.45
		EnduranceMult = 1.45
		OffenseMult = 1.45
		DefenseMult = 1.45

		verb/Oxygen_Armor()
			set category="Skills"
			src.ToggleBuff(usr)


	Bubble_Armor
		Learn=list("energyreq"=5000,"difficulty"=50)
		description_flavor = "Surround yourself with bubbles.\nMore images when after image striking, increased heavy shot knockback."
		activation_flavor = " summons row after row of bubbles to protect them from harm, as they become slippery and glisten light off their form!"
		deactivation_flavor = "'s bubbles dissipate."
		PowerLock = 1
		PowerAdd = 1.5

		verb/Bubble_Armor()
			set category="Skills"
			src.ToggleBuff(usr)

///

	RefineUBW
		var/LastMod
		verb
			Refine_UBW()
				set category="Skills"
				usr.BuffX("RefineUBW", src)
	Reinforcement
		verb
			Reinforcement()
				set category="Skills"
				usr.BuffX("Reinforcement", src)
	Projection
		var/Lockout
		var/Projection
		var/UsedSpecial
		var/UsedNormal
		var/PreviousElement
		verb
			Projection()
				set category="Skills"
				usr.BuffX("Projection", src)
	BrokenPhantasm
		verb
			Broken_Phantasm()
				set category="Skills"
				usr.Skill1X("BrokenPhantasm", src)
	Avalon
		Level=100
		Teachable=0
		desc = "Draw on King Arthur's sheath to become embued with Saber-class abilities!"
		verb/Avalon()
			set category="Skills"
			usr.Skill1X("Avalon",src)
	InvisibleAir
		Level=100
		Teachable=0
		desc = "Cloak your blade with magic!"
		verb/InvisibleAir()
			set category="Skills"
			set name="Invisible Air"
			usr.Skill1X("InvisibleAir", src)
	/*TheForce
		ForceSpec=1
		var/LastMod
		desc="You can feel the energy uniting the entire universe and can use this to your benefit."
		verb
			Force_Forge()
				set category="Skills"
				if(usr.ForceLevel < 1)
					usr.ForceSensitive=1
					usr.ForceLevel=1
				usr.BuffX("ForceForge", src)*/


	SSjGrade2
		Basic=1
		verb
			SSj_Grade_2()
				set category="Skills"
				usr.BuffX("SSjGrade2", src)
	SSjGrade3
		Basic=1
		verb
			SSj_Grade_3()
				set category="Skills"
				usr.BuffX("SSjGrade3", src)
	Stand
		verb
			Stand()
				set category="Skills"
				usr.BuffX("Stand",src)
	StandCustom
		verb
			StandCustom()
				set category="Skills"
				usr.BuffX("StandCustom", src)
	MetalVessel
		verb
			MetalVessel()
				set category="Skills"
				usr.Skill1X("MetalVessel", src)
	DjinnEquip
		verb
			Djinn_Equip()
				set category="Skills"
				usr.Skill1X("DjinnEquip", src)
	FullDjinnEquip
		verb
			Full_Djinn_Equip()
				set category="Skills"
				usr.Skill1X("FullDjinnEquip", src)
	TheHunger
		verb
			The_Hunger()
				set category="Skills"
				usr.Skill1X("TheHunger", src)
	/*HeraclesFury
		verb
			HeraclesFury()
				set category="Skills"
				set name="Heracles Fury"
				usr.BuffX("HeraclesFury", src)*/
	VitalicBurst
		Cooldown=2
		Level=1
		var/Uses
		Teachable=0
		var/LastUse
		desc = "Release your pent up anger."
		verb/Vitalic_Burst()
			set category="Skills"
			usr << "nope nope nope"
			//usr.BuffX("VitalicBurst", src)
	/*WrathArmor
		Level=100
		Teachable=0
		desc = "Cloak yourself in powerful anger."
		verb/Wrath_Armor()
			set category="Skills"
			usr.BuffX("WrathArmor", src)
	WrathShield
		Level=100
		Teachable=0
		desc = "Shield yourself with poingant rage."
		verb/Wrath_Shield()
			set category="Skills"
			usr.BuffX("WrathShield", src)
	WrathBlade
		Level=100
		Teachable=0
		desc = "Arm yourself with potent fury."
		verb/Wrath_Blade()
			set category="Skills"
			usr.BuffX("WrathBlade", src)*/
	MantraArms
		Level=100
		desc="Fuses your arms with Mantra."
		verb/Mantra_Arms()
			set category="Skills"
			usr.BuffX("MantraArms", src)
	WrathOfDeva
		Level=100
		Teachable=0
		desc = "BECOME ASURA"
		verb/Wrath_Of_Deva()
			set category="Skills"
			usr.BuffX("WrathOfDeva", src)
	HeroOfAspect
		Level=100
		Teachable=0
		desc="We Homestuck now, nigga."
		verb/Hero_Of_Aspect()
			set category="Skills"
			usr.BuffX("HeroOfAspect", src)
	/*TheZone
		Level=100
		Teachable=0
		desc="Focus within and enter a state of utter calm and concentration!"
		verb/The_Zone()
			set category="Skills"
			set name="The Zone"
			usr.BuffX("TheZone",src)*/
	Bijuu
		Level=100
		Teachable=0
		var/PreviousEnergy
		desc="Draw on the power of the tailed beast within you!"
		verb/Bijuu()
			set category="Skills"
			usr.BuffX("Bijuu", src)
	KyuubiControlledMode
		Level=100
		Teachable=0
		desc="Become Naruto."
		verb/Kyuubi_Controlled_Mode()
			set category="Skills"
			usr.BuffX("KyuubiControlledMode", src)
	Ansatsuken
		Level=100
		Teachable=0
		var/LastMod=0 //This tracks what level your mods have been boosted to.
		desc="A martial arts style focusing on victory through fists rather than weaponry."
		verb
			Refresh_Ansatsuken()
				set category="Skills"
				if(usr.AnsatsukenMod < 1)
					usr.AnsatsukenMod=1
					usr << "You cast away all weapons in the pursuit of martial perfection."
				usr.Skill1X("Ansatsuken", src)
	Satsui_no_Hado
		Level=100
		Teachable=0
		desc="Overcome by the desire for victory, you infuse yourself with insane strength."
		verb
			Satsui_no_Hado()
				set category = "Skills"
				usr.BuffX("SatsuiNoHado", src)
	SatsuiCorruption
		Basic=1
		Level=100
		Teachable=0
		desc = "You have been infected by the Satsui no Hado.  Victory is your highest priority, even larger than life itself!"
		verb
			SatsuiCorruption()
				set category="Skills"
				set name="Satsui Corruption"
				usr.BuffX("SatsuiCorruption", src)
	ThirdEye
		Level=100
		Teachable=0
		name = "Human_Spirit"
		desc="This allows you to use your Human Spirit."
		icon_state="TE"
		icon='Third Eye.dmi'

		var
			Form1Trans="is now tapping into the power of their third eye."
			FormRevert="is no longer tapping into the power of their third eye."

		verb/Customize_Human_Spirit()
			set category="Other"
			while(1)
				var/choice = input("Select what you would like to edit.", "Customize Human Spirit") as null|anything in list("Activation Flavor", "Deactivation Flavor")
				switch(choice)
					if(null) return
					if("Activation Flavor") Form1Trans=input(usr,"How it will appear: [usr] [Form1Trans]","Unleash Power" ,Form1Trans) as text
					if("Deactivation Flavor") FormRevert=input(usr,"How it will appear: [usr] [FormRevert]","Unleash Power (Revert)" ,FormRevert) as text
		verb/Human_Spirit()
			set category="Skills"
			usr.SkillX("ThirdEye",src)
	/*SpiritEnergy
		Level=100
		desc="Tap into your innate spiritual power."
		verb/Spirit_Energy()
			set category = "Skills"
			usr.BuffX("SpiritEnergyRevamp",src)
	SpiritEnergyNu
		var/LevelUsed
		desc="Tap into your innate spiritual power."
		verb/Spirit_Energy()
			set category="Skills"
			if(usr.SpiritLevel==1||src.LevelUsed==1)
				usr.TierSX("SpiritEnergy1", src)
				return
			if(usr.SpiritLevel==2||src.LevelUsed==2)
				if(!usr.SpiritWeaponChosen)
					usr.ChooseSpiritWeapon()
				usr.TierSX("SpiritEnergy2", src)
				return
			if(usr.SpiritLevel==3||src.LevelUsed==3)
				usr.TierSX("SpiritEnergy3", src)
				return
			if(usr.SpiritLevel==4||src.LevelUsed==4)
				usr.TierSX("SpiritEnergy4", src)
				return
			if(usr.SpiritLevel==5||src.LevelUsed==5)
				usr.TierSX("SacredEnergy", src)
				return
	DemonEnergy
		var/LevelUsed
		desc="Tap into your innate demonic power."
		verb/Demon_Energy()
			set category="Skills"
			if(usr.SpiritLevel==1||src.LevelUsed==1)
				usr.TierSX("DemonEnergy1", src)
			if(usr.SpiritLevel==2||src.LevelUsed==2)
				if(!usr.SpiritWeaponChosen)
					usr.ChooseDemonWeapon()
				usr.TierSX("DemonEnergy2", src)
			if(usr.SpiritLevel==3||src.LevelUsed==3)
				usr.TierSX("DemonEnergy3", src)
			if(usr.SpiritLevel==4||src.LevelUsed==4)
				usr.TierSX("DemonEnergy4", src)
			if(usr.SpiritLevel==5||src.LevelUsed==5)
				usr.TierSX("SacredEnergy", src)
	PercentagePower
		Level=100
		desc="Tap into your Demon Energy to engorge your muscles with power! May be slightly dangerous to your health."
		verb/PercentagePower()
			set category="Skills"
			usr.BuffX("PercentagePower",src)*/
	Hammertime
		Cooldown=60
		Level=100
		desc="Become immune to bullets for 10 seconds."
		verb/Hammertime()
			set category="Skills"
			usr.BuffX("Hammertime", src)
	ShareThePain
		Cooldown=30
		Level=100
		desc="Inflict half of the damage you take on your enemy."
		verb/ShareThePain()
			set category="Skills"
			usr.BuffX("ShareThePain", src)
	PriceOfSafety
		Cooldown=600
		Level=100
		desc="Burn your power away in return for temporary ability."
		verb/PriceOfSafety()
			set category="Skills"
			usr.BuffX("PriceOfSafety", src)
	MarkOfEnergy
		Cooldown=15
		Level=100
		desc="Power up via Mana rather than recovery."
		verb/MarkOfEnergy()
			set category="Skills"
			usr.BuffX("MarkOfEnergy", src)
	DiplomaticImmunity
		Cooldown=30
		Level=100
		desc="Be unable to be attacked, but unable to attack others as well."
		verb/DiplomaticImmunity()
			set category = "Skills"
			usr.BuffX("DiplomaticImmunity", src)
	Rinnegan
		Level=100
		Teachable=0
		desc="The Based Nenshou looks down at you with a twinkle in his eye.  You'll do just fine."
		verb/Rinnegan()
		{
			set category="Skills"
			usr.SkillX("Rinnegan", src);
		}
		verb/Give_Rinnegan()
		{
			set category="Skills"
			usr.SkillX("GiveRinnegan", src);
		}
	SpiralEnergy
		Level=100
		Teachable=0
		desc="ahahahaha"
		verb/Spiral_Energy()
		{
			set category="Skills"
			usr.BuffX("SpiralEnergy", src)
		}
	/*Kamui
		Level=100
		Teachable=0
		var/UsedSpecial
		var/UsedBuff
		desc="ahahahaha"
		verb/Kamui()
		{
			set category="Skills"
			if(usr.SexyMod < 1)
				usr.SexyMod=1
			usr.BuffX("Kamui", src)
		}
	KamuiSenjin
		Level=100
		Teachable=0
		var/UsedSpecial
		var/UsedBuff
		desc="Body o' Blades"
		verb/Senjin()
			set category="Skills"
			usr.BuffX("KamuiSenjin", src)
	KamuiShippu
		Level=100
		Teachable=0
		var/UsedSpecial
		var/UsedBuff
		desc="Paper planes."
		verb/Shippu()
			set category="Skills"
			usr.BuffX("KamuiShippu", src)*/
	SpiralNemesis
		Level=100
		Teachable=0
		desc="ahahahaha"
		verb/Spiral_Nemesis()
		{
			set category="Skills"
			usr.BuffX("SpiralNemesis", src)
		}
	DarknessFlame
		Level=100
		Teachable=0
		var/UsingBuffs=0
		var/UsingSpecial=0
		desc="Empower yourself with flames from the deepest pits of Hell."
		icon_state="TE"
		sicon='blackflameaura.dmi'
		verb/DarknessFlame()
			set category="Skills"
			set name="Darkness Surge"
			usr.BuffX("DarknessBuff",src)
	SpiritWave
		Level=100
		Teachable=0
		desc="Turn your body into a catalyst for your spirit energy, strengthening your control over your body's energy and granting you slow passive regeneration in combat."
		verb/Spirit_Wave()
			set category="Skills"
			usr.SkillX("SpiritWave",src)
	/*SacredEnergyArmorNu
		Level=100
		Teachable=0
		var/UsingSpecial=0
		var/UsingBuffs=0
		desc="Weaponize your Sacred Energy."
		verb/Sacred_Energy_Armor_Nu()
			set name="Sacred Energy Armor"
			set category="Skills"
			usr.BuffX("SacredEnergyArmorNu",src)*/
	KingofBraves
		Level=100
		Teachable=0
		desc="Weaponize your courage"
		verb/KingofBraves()
			set name="King of Braves"
			set category="Skills"
			usr.BuffX("KingofBraves",src)
	BraveHeart
		Level=100
		Teachable=0
		desc="Weaponize your courage"
		verb/BraveHeart()
			set name="Brave Heart"
			set category="Skills"
			usr.BuffX("Braveheart",src)
	/*SacredEnergyArmor
		Level=100
		Teachable=0
		desc="Weaponize your Sacred Energy, turning it into an armor that can function either offensively or defensively."
		verb/Sacred_Energy_Armor()
			set category="Skills"
			usr.SkillX("SacredEnergyArmor",src)
	HighTension
		Level=100
		Teachable=0
		desc="This allows you to unlock your Third Eye."
		icon_state="TE"
		sicon='Third Eye.dmi'
		verb/High_Tension()
			set category="Skills"
			usr.SkillX("HighTension",src)
	FuryOfNature
		Level=100
		Teachable=0
		desc="Fondle Mother Nature to make her really mad."
		verb/Fury_Of_Nature()
			set category="Skills"
			usr.SkillX("FuryOfNature",src)
	SpiritOfEarth
		Level=100
		Teachable=0
		desc="Fondle Mother Nature for fun and profit."
		verb/Spirit_Of_Earth()
			set category="Skills"
			usr.SkillX("SpiritOfEarth",src)
	SpiritOfWisdom
		Level=100
		Teachable=0
		desc="Fondle Mother Wisdom...Okay, that joke doesn't really work here."
		verb/Spirit_Of_Wisdom()
			set category="Skills"
			usr.SkillX("SpiritOfWisdom",src)*/

	SpiritOfWar
		Level=100
		Teachable=0
		desc="Abandon hope for the sake of victory."
		verb/Spirit_Of_War()
			set category="Skills"
			usr.Skill1X("SpiritOfWar",src)

	GatesOfBabylon
		Cooldown=15
		Level=100
		Teachable=0
		desc="( :"
		verb/Gates_Of_Babylon()
			set category="Skills"
			usr.Skill1X("GatesOfBabylon",src)

	Caster
		Cooldown=30
		Level=100
		Teachable=0
		desc="Alter someone's fate irreversibly..."
		verb/Caster()
			set category="Skills"
			set name="Curse"
			usr.Skill1X("Caster",src)

	DivineArmy
		Cooldown=60
		Level=100
		Teachable=0
		desc="Bring forth your friends to fight alongside you!"
		verb/Divine_Army()
			set category="Skills"
			usr.Skill1X("DivineArmy",src)

	WillOfChaos
		Level=100
		Teachable=0
		desc="Pretty much the only way for the Pathless to be not shit."
		verb/Will_Of_Chaos()
			set category="Skills"
			usr.BuffX("WillOfChaos",src)
	AetherTransfiguration
		Level=100
		Teachable=0

		var/icon/OldBody
		var/icon/NewBody

		var/icon/OldHair
		var/icon/NewHair

		var/icon/OldAura
		var/icon/NewAura
		var/auraX
		var/auraY

		desc="Kind of sort of a transformation."
		verb/Aether_Transfiguration()
			set category="Skills"
			usr.BuffX("AetherTransfiguration", src)
			//i'll also do this later
		verb/Aether_Configuration()
			set category="Skills"
			var/choice=input(usr, "What do you want to configure?", "Aether Configuration") in list("Stats", "Base Icon", "Hair Icon", "Aura Icon")
			switch(choice)
				if("Stats")
					src.CustomStr=0
					src.CustomDura=0
					src.CustomForce=0
					src.CustomRes=0
					src.CustomOff=0
					src.CustomDef=0
					src.CustomRecov=0

					for(var/points=5, points > 0, points--)
						var/choice2=input(usr, "Which stat do you want to add points to?  You have [points] left.", "Aether Configuration") in list("Strength", "Endurance", "Force", "Resistance", "Offense", "Defense", "Recovery")
						switch(choice2)
							if("Strength") src.CustomStr++
							if("Endurance") src.CustomDura++
							if("Force") src.CustomForce++
							if("Resistance") src.CustomRes++
							if("Offense") src.CustomOff++
							if("Defense") src.CustomDef++
							if("Recovery") src.CustomRecov++
				if("Base Icon")
					src.NewBody = input("What do you want for a base icon?", "Aether Configuration") as icon
				if("Hair Icon")
					src.NewHair = input("What do you want for a hair icon?", "Aether Configuration") as icon
				if("Aura Icon")
					src.NewAura = input("What do you want for an aura icon?", "Aether Configuration") as icon
					src.auraX = input(usr, "What X offset do you want?", "Aether Configuration") as num
					src.auraY = input(usr, "What Y offset do you want?", "Aether Configuration") as num

	OlympianFury
		Level=100
		Teachable=0
		sicon='Glowing Electricity.dmi'
		desc="This allows you to unlock the power of your inner Olympian God."
		icon_state="TE"
		verb/Olympian_Fury()
			set category="Skills"
			usr.SkillX("OlympianFury",src)
/*	PathFind
		Level=100
		Teachable=0
		desc="Choose a path. Life and Death are the most dangerous, and the former cannot be come back from."
		icon_state="TE"
		verb/Choose_A_Path()
			set category="Skills"
			usr.BuffX("SixPathsOfJumpy",src)
	EmbarkOnPath
		Level=100
		Teachable=0
		desc="Gain power based on the path you have chosen."
		icon_state="TE"
		verb/Embark_On_Path()
			set category="Skills"
			usr.BuffX("PathFind",src)*/
	Duel
		Cooldown=600
		Level=100
		Teachable=0
		desc="1v1 me nerd"
		icon_state="TE"
		verb/Duel()
			set category="Skills"
			usr.BuffX("UJW",src)
	Focus
		Learn=list("energyreq"=1000,"difficulty"=5)
		desc="Allows you to focus."
		icon_state="Focus"
		SkillCost=10
		verb/Focus()
			set category="Skills"
			usr.SkillX("Focus",src)
	Berserk
		desc="Slight boost to stats and triggers a more powerful version of Anger, at a cost to your recovery."
		Level=100
		Teachable=0
		icon_state="Focus"
		var/BerserkLevelSelected="Berserk"
		var/SpamLockout=0
		var
			FormPoints=5
			FormStr=1
			FormEnd=1
			FormFor=1
			FormRes=1
			FormOff=1
			FormDef=1
			Form1Trans="snaps and goes Berserk!"
			Form2Trans="becomes filled with a powerful rage!"
			Form3Trans="floods with adrenaline and anger!"
			Form4Trans="is now the embodiment of raw, untainted fury!"
			FormRevert="calms their rage..."
			FormTempBodyIcon //Stores their original base icon.
			Form1BodyIcon
			Form1BodyX=0
			Form1BodyY=0
		verb/CustomizeBerserk()
			set category="Other"
			set name="Customize Unleash Power"
			if(src.BuffUsing)
				usr<<"You can't use this verb while Unleash Power is active."
				return
			var/choice=input(usr,"Customize auras, body icons, hairs, flavor text or stat bonuses of Unleash Power?") in list("Aura","Body Icon","Hair","Flavor Text","Stats")
			if(choice=="Aura")
				usr<<"not ready yet..."
				return
			if(choice=="Body Icon")
				var/formselect=input("Select the form you wish to give a body icon to.") in list("Cancel","Unleash Power")
				if(formselect=="Cancel")
					return
				if(formselect=="Unleash Power")
					if(src.Form1BodyIcon)
						var/clearconfirm=input("Would you like to clear your Unleash Power icon?") in list ("Yes","No")
						if(clearconfirm=="Yes")
							src.Form1BodyIcon=null
							src.Form1BodyX=0
							src.Form1BodyY=0
							return
					else
						var/Z=input(usr,"Choose an icon for Unleash Power!","ChangeIcon")as icon|null
						if(Z==null)
							return
						if((length(Z) > 102400))
							usr <<"This file exceeds the limit of 100KB. It cannot be used."
							return
						src.Form1BodyIcon=Z
						src.Form1BodyX=input("X adjustment.") as num
						src.Form1BodyY=input("Y adjustment.") as num

			if(choice=="Hair")
				usr<<"not ready yet..."
				return
			if(choice=="Flavor Text")
				Form1Trans=input(usr,"Unleash Power","How it will appear: [usr] [Form1Trans]" ,Form1Trans) as text
				Form2Trans=input(usr,"(Super) Unleash Power","How it will appear: [usr] [Form2Trans]" ,Form2Trans) as text
				Form3Trans=input(usr,"(Super) Unleash Power 2","How it will appear: [usr] [Form3Trans]" ,Form3Trans) as text
				Form4Trans=input(usr,"(Super) Unleash Power 3","How it will appear: [usr] [Form4Trans]" ,Form4Trans) as text
				FormRevert=input(usr,"Unleash Power (Revert)","How it will appear: [usr] [FormRevert]" ,FormRevert) as text
			if(choice=="Stats")
				var/choice2=input(usr,"Customize stats, or reset to default? You should reset after getting a transformation unlocked.") in list("Customize","Reset","Cancel")
				if(choice2=="Cancel")
					return
				if(choice2=="Reset")
					if(src.BuffUsing)
						usr<<"I'm pretty sure resetting while Unleash Power is on is bad."
						return
					FormStr=1
					FormEnd=1
					FormFor=1
					FormRes=1
					FormOff=1
					FormDef=1
					FormPoints=5+(usr.trans["unlocked"]*5)
					usr<<"Unleash Power reset. Use customize again to set it up how you desire."
					return
				if(choice2=="Customize")
					if(src.BuffUsing)
						usr<<"Don't try to cheat the system by opening the dialog -then- turning Berserk on. :|"
						return
					else
						set src in usr
						winshow(usr,"BerserkCustom",0)
						if(src in usr.contents)
							winshow(usr,"BerserkCustom",1)
							usr.Customizing=src
							usr.UpdateBerserkWindow(src)
		verb/Berserk()
			set category="Skills"
			set name="Unleash Power"
			usr.SkillX("Berserk",src)

	Sharingan
		desc="A 'Doujutsu' from Naruto series. You gather your spiritual energy in your eyes and blend in your hatred along, enhancing your vision with extreme reflexes, and the power to read movements and cast powerful illusions!"
		Level=100
		Teachable=0
		icon_state="Focus"
		var/SharinganLevelSelected="Sharingan"
		var/SpamLockout=0
		verb/Sharingan()
			set category="Skills"
			set name="Sharingan"
			usr.BuffX("Sharingan",src)
	Byakugan
		desc="A 'Doujutsu' from Naruto series. You gather your spiritual energy in your eyes, enhancing them greatly. You'll be able to see the spiritual energy flow of the enemy with those white, clear eyes, as well as zoom into great distances! (PS: This also enables the Chi Block Stance while active.)"
		Level=100
		Teachable=0
		icon_state="Focus"
		var/ByakuganSelected="Byakugan"
		var/SpamLockout=0
		verb/Byakugan()
			set category="Skills"
			set name="Byakugan"
			usr.BuffX("Byakugan",src)
			usr.ChiBlockUnlocked=1
	/*DriveForm
		desc="Flavor text here."
		Level=100
		Teachable=0
		icon_state="Focus"
		var/KeybladeLevelSelected="Valor"
		var/SpamLockout=0
		verb/DriveForm()
			set category="Skills"
			set name="Drive Form"
			usr.BuffX("DriveForm",src)*/
	LightningAura
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="An advanced elemental aura that makes the user become one with lightning, greatly increasing your speed. Not the stat itself, however- it removes any movement delay and makes you combo whether you miss or not. Due to being an advanced element, it requires heavy concentration and hence has a large mana drain."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		Magic=1
		verb/LightningAura()
			set category="Skills"
			set name="Lightning Aura"
			usr.SkillX("LightningAura",src)
	LightningBlessing
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="An advanced elemental aura that makes the user become one with lightning, greatly increasing your speed. Not the stat itself, however- it removes any movement delay and makes you combo whether you miss or not. Due to being an advanced element, it requires heavy concentration and hence has a large mana drain."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		Magic=1
		verb/LightningBlessing()
			set category="Skills"
			set name="Lightning Blessing"
			usr.BuffX("LightningBlessing",src)
	ThorsIre
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="An advanced elemental aura that makes the user become one with lightning, greatly increasing your speed. Not the stat itself, however- it removes any movement delay and makes you combo whether you miss or not. Due to being an advanced element, it requires heavy concentration and hence has a large mana drain."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		Magic=1
		verb/ThorsIre()
			set category="Skills"
			set name="Thor's Ire"
			usr.BuffX("ThorsIre",src)

	Alacrity
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Ultimate speed."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		verb/Alacrity()
			set category="Skills"
			set name="Alacrity"
			usr.BuffX("Alacrity",src)

	AphoticShield
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Ultimate speed."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		verb/Alacrity()
			set category="Skills"
			set name="Aphotic Shield"
			usr.BuffX("AphoticShield",src)

	ReactiveCuirass
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Reactive things up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		verb/ReactiveCuirass()
			set category="Skills"
			set name="Reactive Cuirass"
			usr.BuffX("ReactiveCuirass",src)
	ExplosiveAugment
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Reactive things up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		verb/ExplosiveAugment()
			set category="Skills"
			set name="Explosive Augment"
			usr.BuffX("ExplosiveAugment",src)

	LightningArmor
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Convert your Ki into lightning, greatly increasing your speed and reflexes. However, using this requires utilization of all of your Ki, preventing you from powering up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		PowerLock=1
		verb/LightningArmor()
			set category="Skills"
			set name="Lightning Armor"
			usr.BuffX("LightningArmor",src)
	StaticAugment
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Convert your Ki into lightning, greatly increasing your speed and reflexes. However, using this requires utilization of all of your Ki, preventing you from powering up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		verb/StaticAugment()
			set category="Skills"
			set name="Static Augment"
			usr.BuffX("StaticAugment",src)

	BloodArmor
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Use your Ki to greatly increase the amount of blood in your body and control over it, granting you greater reflexes. However, using this requires utilization of all of your Ki, preventing you from powering up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		PowerLock=1
		verb/BloodArmor()
			set category="Skills"
			set name="Blood Armor"
			usr.BuffX("BloodArmor",src)
	CrimsonAugment
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Use your Ki to greatly increase the amount of blood in your body and control over it, granting you greater reflexes. However, using this requires utilization of all of your Ki, preventing you from powering up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		verb/CrimsonAugment()
			set category="Skills"
			set name="Crimson Augment"
			usr.BuffX("CrimsonAugment",src)

	MagmaArmor
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Convert your Ki into magma, vastly increasing your defensive prowess and harming whoever tries to punch you. However, using this requires utilization of all of your Ki, preventing you from powering up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		PowerLock=1
		verb/MagmaArmor()
			set category="Skills"
			set name="Magma Armor"
			usr.BuffX("MagmaArmor",src)
	MoltenAugment
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Convert your Ki into magma, vastly increasing your defensive prowess and harming whoever tries to punch you. However, using this requires utilization of all of your Ki, preventing you from powering up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		verb/MoltenAugment()
			set category="Skills"
			set name="Molten Augment"
			usr.BuffX("MoltenAugment",src)

	StormArmor
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Detonate your Ki and turn it incredibly volatile, greatly increasing your destructive power. However, using this requires utilization of all of your Ki, preventing you from powering up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		PowerLock=1
		verb/StormArmor()
			set category="Skills"
			set name="Storm Armor"
			usr.BuffX("StormArmor",src)
	ThunderAugment
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Detonate your Ki and turn it incredibly volatile, greatly increasing your destructive power. However, using this requires utilization of all of your Ki, preventing you from powering up."
		icon_state="Focus"
		Teachable=0
		SkillCost=300
		verb/StormArmor()
			set category="Skills"
			set name="Thunder Augment"
			usr.BuffX("ThunderAugment",src)

	TranceForm
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Greatly increase your power with an awe-inspiriing burst of magical energy."
		icon_state="Focus"
		verb/TranceForm()
			set category="Skills"
			set name="Trance Form"
			usr.BuffX("TranceForm",src)

	IceArmor
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Ice Magic, you can increase your defensive stats."
		icon_state="Focus"
		PowerLock=1
		verb/IceArmor()
			set category="Skills"
			set name="Ice Armor"
			usr.BuffX("IceArmor",src)
	FrozenAugment
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Ice Magic, you can increase your defensive stats."
		icon_state="Focus"
		verb/FrozenAugment()
			set category="Skills"
			set name="Frozen Augment"
			usr.BuffX("FrozenAugment",src)


	BlazingWrath
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Using the power of Fire Magic, you can increase your offensive capabilities and power at the cost of gradually burning you."
		icon_state="Focus"
		SkillCost=50
		Teachable=0
		Using = 0
		Magic=1
		sicon="FireAuraBurst.dmi"
		verb/BlazingWrath()
			set category="Skills"
			set name="Blazing Wrath"
//			src.Using=!src.Using // Whatever Using is now, reverse it. 1 becomes 0, true becomes false
			usr.SkillX("BlazingWrath",src)
	FireBlessing
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Using the power of Fire Magic, you can increase your offensive capabilities and power at the cost of gradually burning you."
		icon_state="Focus"
		SkillCost=50
		Teachable=0
		Using = 0
		Magic=1
		sicon="FireAuraBurst.dmi"
		verb/FireBlessing()
			set category="Skills"
			set name="Fire Blessing"
//			src.Using=!src.Using // Whatever Using is now, reverse it. 1 becomes 0, true becomes false
			usr.BuffX("FireBlessing",src)
	InfernalRamapge
		Learn=list("energyreq"=5000,"difficulty"=50)
		desc="Using the power of Fire Magic, you can increase your offensive capabilities and power at the cost of gradually burning you."
		icon_state="Focus"
		SkillCost=50
		Teachable=0
		Using = 0
		Magic=1
		sicon="FireAuraBurst.dmi"
		verb/FireBlessing()
			set category="Skills"
			set name="Infernal Rampage"
//			src.Using=!src.Using // Whatever Using is now, reverse it. 1 becomes 0, true becomes false
			usr.BuffX("InfernalRampage",src)

	BoostingWinds
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Wind Magic, you can increase your Speed, but at the cost of your Endurance."
		SkillCost=50
		icon_state="Focus"
		Magic=1
		verb/BoostingWinds()
			set category="Skills"
			set name="Boosting Winds"
			usr.SkillX("BoostingWinds",src)
	WindBlessing
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Wind Magic, you can increase your Speed, but at the cost of your Endurance."
		SkillCost=50
		icon_state="Focus"
		Magic=1
		verb/WindBlessing()
			set category="Skills"
			set name="Wind Blessing"
			usr.BuffX("WindBlessing",src)
	HurricaneFrenzy
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Wind Magic, you can increase your Speed, but at the cost of your Endurance."
		SkillCost=50
		icon_state="Focus"
		Magic=1
		verb/HurricaneFrenzy()
			set category="Skills"
			set name="Hurricane Frenzy"
			usr.BuffX("HurricaneFrenzy",src)

	EarthenWall
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Earth Magic, you can increase your Endurance, at the cost of your Speed."
		SkillCost=50
		icon_state="Focus"
		Magic=1
		verb/EarthenWall()
			set category="Skills"
			set name="Earthen Wall"
			usr.SkillX("EarthenWall",src)
	EarthBlessing
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Earth Magic, you can increase your Endurance, at the cost of your Speed."
		SkillCost=50
		icon_state="Focus"
		Magic=1
		verb/EarthBlessing()
			set category="Skills"
			set name="Earth Blessing"
			usr.BuffX("EarthBlessing",src)
	TerrasMight
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Earth Magic, you can increase your Endurance, at the cost of your Speed."
		SkillCost=50
		icon_state="Focus"
		Magic=1
		verb/TerrasMight()
			set category="Skills"
			set name="Terra's Might"
			usr.BuffX("TerrasMight",src)

	MistVeil
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Water Magic, you can increase your defense and overall recovery capabilities, at the cost of your Offense."
		icon_state="Focus"
		SkillCost=50
		Magic=1
		verb/MistVeil()
			set category="Skills"
			set name="Mist Veil"
			usr.SkillX("MistVeil",src)

///
	Frost_Veil
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Ice Magic, you can increase your defense, strength and regen capabilities, at the cost of your Offense."
		icon_state="Focus"
		SkillCost=50
		Magic=1
		verb/Frost_Veil()
			set category="Skills"
			usr.SkillX("Frost_Veil",src)
///

	WaterBlessing
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Water Magic, you can increase your defense and overall recovery capabilities, at the cost of your Offense."
		icon_state="Focus"
		SkillCost=50
		Magic=1
		verb/WaterBlessing()
			set category="Skills"
			set name="Water Blessing"
			usr.BuffX("WaterBlessing",src)
	MaelstromSurge
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Using the power of Water Magic, you can increase your defense and overall recovery capabilities, at the cost of your Offense."
		icon_state="Focus"
		SkillCost=50
		Magic=1
		verb/MaelstromSurge()
			set category="Skills"
			set name="Maelstrom Surge"
			usr.BuffX("MaelstromSurge",src)



	StoneWall
		Learn=list("energyreq"=15000,"difficulty"=5)
		Teachable=0
		desc="Using the power of Stone(r) Magic, you can increase all your defenses, but at the cost of your speed, recovery, and regeneration."
		icon_state="Focus"
		verb/Stonewall()
			set category="Skills"
			set name="Stone Wall"
			usr.SkillX("StoneWall",src)
	Expand
		Learn=list("energyreq"=1000,"difficulty"=4)
		icon_state="Expand"
		desc="A muscle manipulation skill, allows the user to sacrifice a bit of their recovery, skill, and speed for extra power, strength, and endurance! Trainable up to 4 times expansion."
		var/list/Overlayz=new
		var/Iconz
		SkillCost=10
		verb/Expand()
			set category="Skills"
			usr.BuffX("Expand",src)
	RedHenshin
		icon_state="Expand"
		desc="EMBRACE THE STAGE!"
		Teachable=0
		verb/RedHenshin()
			set category="Skills"
			set name="Red Henshin"
			usr.BuffX("RedHenshin",src)
	MonsterofGod
		icon_state="Expand"
		desc="Monster of God"
		Teachable=0
		verb/MonsterofGod()
			set category="Skills"
			set name="Monster of God"
			usr.BuffX("MonsterofGod",src)
	BlueHenshin
		icon_state="Expand"
		desc="STROLL ONTO THE STAGE!"
		Teachable=0
		verb/BlueHenshin()
			set category="Skills"
			set name="Blue Henshin"
			usr.BuffX("BlueHenshin",src)
	BlackHenshin
		icon_state="Expand"
		desc="DOMINATE THE STAGE!"
		Teachable=0
		verb/BlackHenshin()
			set category="Skills"
			set name="Black Henshin"
			usr.BuffX("BlackHenshin",src)
	Fast
		desc="MMMM THAT SPEED"
		Teachable=0
		verb/Fast()
			set category="Skills"
			set name="Go Faster!"
			usr.BuffX("Fast",src)
	Slow
		desc="Aw, that lack of speed tho"
		Teachable=0
		verb/Slow()
			set category="Skills"
			set name="Go Slower!"
			usr.BuffX("Slow",src)
	Mach
		desc="MMMMMMM COCAINE BABEH"
		Teachable=0
		verb/Mach()
			set category="Skills"
			set name="EVEN FASTER!"
			usr.BuffX("Mach",src)
	DarkHero
		desc="Sck."
		Teachable=0
		verb/DarkHero()
			set category="Skills"
			set name="Dark Hero"
			usr.BuffX("DarkHero",src)
	DirectorsCut
		desc="Lights. Camera. Action!"
		Teachable=0
		verb/DirectorsCut()
			set category="Skills"
			set name="Director's Cut"
			usr.BuffX("DirectorsCut",src)
	TitanForm
		Learn=list("energyreq"=1000,"difficulty"=999)
		icon_state="Expand"
		desc="Tap into your powers as a Titan, greatly increasing your size and power, but also making you a bigger target. It also makes you naked. I have no idea how to fix this. At least it's accurate to the show this move is referencing."
		var/list/Overlayz=new
		var/Iconz
		verb/TitanForm()
			set category="Skills"
			set name="Titan Form"
			usr.SkillX("GiantForm",src)
	ClearMind
		Level=100
		Teachable=0
		desc="Clears your mind of all anger, assuming a calm state of being."
		verb/ClearMind()
			set category="Skills"
			usr.SkillX("Clear Mind",src)
	Mystic
		Level=100
		Teachable=0
		desc="Allows you to enter a state of pureness."
		icon_state="Mystic"
		verb/Mystic()
			set category="Skills"
			usr.SkillX("Mystic",src)
	FallenMystic
		Level=100
		Teachable=0
		desc="Allows you to enter a state of pureness."
		icon_state="Mystic"
		verb/Fallen_Mystic()
			set category="Skills"
			usr.SkillX("FallenMystic",src)
	WillOfNothingness
		Level=100
		Teachable=0
		desc="Nobody racial trait."
		verb/WON()
			set category="Skills"
			set name="Will of Nothingness"
			usr.SkillX("WON",src)
	LunarWrath
		Level=100
		Teachable=0
		desc="git mad."
		verb/LunarWrath()
			set category="Skills"
			set name="Lunar Wrath"
			usr.SkillX("MoonBerserker",src)
	DemonicWill
		Level=100
		Teachable=0
		desc="Tap into your inner self, and yield to the temptations of hell..."
		verb/DemonicWill()
			set category="Skills"
			set name="Demonic Will"
			usr.SkillX("DemonicWill",src)
	DivineBlessing
		Level=100
		Teachable=0
		desc="Tap into your inner self, and empower yourself in the bright veil of God."
		verb/DemonicWill()
			set category="Skills"
			set name="Divine Blessing"
			usr.SkillX("DivineBlessing",src)
	NuclearFusion
		Level=100
		Teachable=0
		desc="Utilize the overwhelming power of Nuclear Fusion!"
		verb/NuclearFusion()
			set category="Skills"
			set name="Nuclear Fusion"
			usr.SkillX("NuclearFusion",src)
	NuclearFission
		Level=100
		Teachable=0
		desc="Utilize the somewhat less overwhelming power of Nuclear Fission."
		verb/NuclearFission()
			set category="Skills"
			set name="Nuclear Fission"
			usr.SkillX("NuclearFission",src)
	/*WeaponSoul
		Level=100
		Teachable=0
		desc="Tap into the power gained from wielding a blade."
		verb/Weapon_Soul()
			set category="Skills"
			set name="Weapon Soul"
			usr.SkillX("CursedBlade",src)*/

	Majin
		Level=100
		Teachable=0
		desc="Allows you to enter a state of chaos."
		icon_state="Majin"
		verb/Majin()
			set category="Skills"
			usr.SkillX("Majin",src)
	CustomBuff
		Level=100
		Teachable=0
		var/offdesc
		sicon='Third Eye.dmi'
		desc="A customizable buff, of which the stats are set by admins."
		icon_state="TE"
		verb/CustomBuff()
			set category="Skills"
			usr.SkillX("CustomBuff",src)
	KiBlade
		Basic=1
		Level=100
		Teachable=0
		SkillCost=10
		sicon='KiSword.dmi'
		desc="Form a blade of Ki around your hand, using your Force to inflict damage in melee."
		icon='KiSword.dmi'
		verb/KiBlade()
			set name="Ki Blade"
			set category="Skills"
			usr.SkillX("KiBlade",src)
	Moonlight_Aura
		Level=100
		Teachable=0
		desc="Taps into the power of moonlight, granting you the powers of darkness as if you were wielding a sword or wearing armor."
		verb/MoonlightAura()
			set name="Moonlight Aura"
			set category="Skills"
			usr.SkillX("MoonlightAura",src)
	Sunlight_Aura
		Level=100
		Teachable=0
		desc="Taps into the power of sunlight, granting you the powers of light as if you were wielding a sword or wearing armor."
		verb/SunlightAura()
			set name="Sunlight Aura"
			set category="Skills"
			usr.SkillX("SolarAura",src)
	LockOn
		Level=100
		Teachable=0
		sicon='KiSword.dmi'
		desc="Drain heat from around your hand, utilizing the energy to lock on to your opponent and render them easier to hit at the cost of hitting power."
		icon='KiSword.dmi'
		verb/LockOn()
			set name="Lock-On"
			set category="Skills"
			usr.SkillX("LockOn",src)



mob/proc/Shielded()
	if(locate(/obj/Skills/Rank/Shield, src.contents))
		for(var/obj/Skills/Rank/Shield/S in src.contents)
			if(S.Using)
				src.Energy-=(EnergyMax/100)
				return 0.25
			else
				return 1
	else
		return 1

obj
	Reincarnate
		var
			RBase
			REnergy
			Rein

obj/Skills/Rank
	Learn=list("energyreq"=5000,"difficulty"=10)
	Reincarnation
		Teachable=0
		Level=100
		verb/Reincarnate()
			set category="Skills"
			usr.SkillX("Reincarnate",src)
	GiveJaganEye
		Teachable=0
		Level=100
		verb/Give_Jagan()
			set category="Skills"
			set name="Give Jagan"
			usr.BuffX("GiveJagan",src)
	Susanoo
		Level=100
		desc="Force all of your latent energy to the surface in the form of a massive suit of armor. This move disables powering up and is highly straining to ones eyes and body, causing irreperable damage to the former and great pain to the latter, unless..."
		verb/Susanoo()
			set category="Skills"
			set name="Susano'o"
			usr.BuffX("Susanoo",src)
	TheWorld
		Level=100
		desc="Freeze time for everyone in view."
		verb/The_World()
			set category="Skills"
			usr.SkillX("TheWorld",src)
	TheWorldRequiem
		Level=100
		desc="Freeze time for everyone in view, even capable of ignoring heroic willpower. It's the first half of the ultimate Stand: The Universe."
		verb/The_World_Requiem()
			set category="Skills"
			set name="The World: Requiem"
			usr.SkillX("TheWorldRequiem",src)
	KingCrimson
		Level=100
		desc="It just works."
		verb/King_Crimson()
			set category="Skills"
			usr.SkillX("KingCrimson",src)
	KingCrimsonEpitaph
		Level=100
		desc="The upgraded form of King Crimson and the other half of the ultimate Stand: The Universe. It just works."
		verb/Epitaph()
			set category="Skills"
			usr.SkillX("Epitaph",src)
	GoldExperienceRequiem
		Level=100
		desc="Erase the result."
		verb/Gold_Experience_Requiem()
			set category="Skills"
			usr.SkillX("GER",src)
	BlueExperienceRequiem
		Level=100
		desc="Who needs offense and defense when you're this fucking fast?"
		verb/Blue_Experience_Requiem()
			set category="Skills"
			usr.SkillX("BER",src)
	RedExperienceRequiem
		Level=100
		desc="Beware of da Reel Red."
		verb/Red_Experience_Requiem()
			set category="Skills"
			usr.SkillX("RER",src)
	CreatorWings
		Level=100
		desc="Tap into the power of the creator."
		verb/CreatorWings()
			set category="Skills"
			set name="Wings of the Creator"
			usr.BuffX("CreatorWings",src)
	DestroyerWings
		Level=100
		desc="Tap into the power of the destroyer."
		verb/DestroyerWings()
			set category="Skills"
			set name="Wing of the Destroyer"
			usr.BuffX("DestroyerWings",src)
	StarPlatinum
		Level=100
		desc="An exclusive buff for Ripple users. Call forth a ghostly manifestation of your fighting spirit to fight along side you, essentially doubling the power and speed of your attacks."
		verb/Star_Platinum()
			set category="Skills"
			usr.SkillX("StarPlatinum",src)
	HeartlessAngel
		Cooldown=600
		Level=100
		desc="A highly powerful and dangerous dark magic skill. It takes time to cast, but is certain death on whomever it hits."
		SkillCost=1000
		Teachable=0
		verb/HeartlessAngel()
			set category="Skills"
			usr.SkillX("HeartlessAngel",src)
	AgonyField
		Level=100
		desc="Dark magic that creates a field that damages anyone under it, including the user."
		Teachable=0
		verb/AgonyField()
			set category="Skills"
			if(usr.AgonyField)
				usr.Frozen=0
				usr.AgonyField=0
				return
			if(!usr.AgonyField)
				usr.Frozen=1
				usr.AgonyField=1
				usr.OMessage(5,"[usr] is surrounded by an agonizing miasma!","[usr]([usr.key]) used Agony Field!")
	GiveSpiritCuffs
		Basic=1
		Level=100
		desc="Seal the power of whomever you give them to, allowing them to break it for a massive boost to power when the time is right."
		SkillCost=1000
		Teachable=0
		verb/Give_Spirit_Cuffs()
			set category="Skills"
			usr.BuffX("GiveSpiritCuffs",src)
	BreakSpiritCuffs
		Basic=1
		Level=100
		desc="You -can- break these cuffs."
		SkillCost=1000
		Teachable=0
		verb/Break_Spirit_Cuffs()
			set category="Skills"
			usr.Skill1X("BreakSpiritCuffs",src)
	Necromancy
		Level=100
		Teachable=0
		desc="Call forth the spirits of the dead. Sacrificing the living to them can increase their power."
		verb/Necromancy()
			set category="Skills"
			if(usr.Necromancy)
				usr.Necromancy=0
				usr<<"You no longer bring up a menu of options on the dead on click."
			else if(!usr.Necromancy)
				usr.Necromancy=1
				usr<<"You may now click on the dead (or your summoned minions) for additional options."
		verb/Sacrifice()
			set category="Skills"
			var/list/minions=list("Cancel")
			for(var/mob/M in oview(12,usr))
				if(M.NecroRisen)
					minions.Add(M)
			var/list/people=list("Cancel")
			for(var/mob/C in oview(12,usr))
				people.Add(C)
			var/mob/Choice=input("Sacrifice who?")in people
			var/mob/MinionChoice=input("Who will receive the Sacrifice?")in minions
			if(Choice=="Cancel")return
			if(Choice==usr)
				usr<<"As awesome as it would be to sacrifice yourself, nope."
				return
			if(Choice.Health>=2)
				usr<<"Your sacrifice is too lively to sacrifice!"
				return
			if(MinionChoice.NecroLevel==3)
				usr<<"This minion is as strong as possible."
				return
			Choice.Death(usr)
			MinionChoice.NecroLevel+=1
			if(MinionChoice.NecroLevel==1)
				usr.OMessage(15,null,"<font color=red>[usr]([usr.key]) sacrificed someone via Necromancy.")
				view(usr)<<"[usr] called up the hands of the underworld, dragging down [Choice] to power up [MinionChoice]. [MinionChoice] has their living body returned to them and is granted regenerative abilities."
				if(MinionChoice.Dead)
					MinionChoice.Dead=0
					MinionChoice.overlays-='Halo.dmi'
			else if(MinionChoice.NecroLevel==2)
				usr.OMessage(15,null,"<font color=red>[usr]([usr.key]) sacrificed someone via Necromancy.")
				view(usr)<<"[usr] called up the hands of the underworld, dragging down [Choice] to power up [MinionChoice]. [MinionChoice] has been imbued with immortality."
				if(MinionChoice.Dead)
					MinionChoice.Dead=0
				MinionChoice.contents+=new/obj/Regenerate
				for(var/obj/Regenerate/x in MinionChoice)
					x.Level=3
			else if(MinionChoice.NecroLevel==3)
				usr.OMessage(15,null,"<font color=red>[usr]([usr.key]) sacrificed someone via Necromancy.")
				view(usr)<<"[usr] called up the hands of the underworld, dragging down [Choice] to power up [MinionChoice]. [MinionChoice] has been imbued with superb energy recovery abilities."
				if(MinionChoice.Dead)
					MinionChoice.Dead=0
				MinionChoice.Recovery*=2
	Conjure
		Level=100
		Teachable=0
		desc="Call forth demons from Hell."
		verb/Conjure()
			set category="Skills"
			if(usr.Conjure)
				usr.Conjure=0
				return
			if(!usr.Conjure)
				usr.Conjure=1

	RedHotOneHundred
		Cooldown=150
		Basic=1
		Level=100
		desc="FILL THEM WITH YOUR FURY!"
		Teachable=0
		verb/RedHotOneHundred()
			set category="Skills"
			set name="Red Hot One Hundred"
			usr.SkillX("RedHotOneHundred",src)
	RedKick
		Cooldown=30
		Basic=1
		Level=100
		desc="Spin around with your feet SWINGIN' BOY!"
		Teachable=0
		verb/RedKick()
			set category="Skills"
			set name="360 Kick"
			usr.SkillX("RedKick",src)
	JetSlash
		Cooldown=90
		Basic=1
		Level=100
		desc="Swing with all of your might!"
		Teachable=0
		verb/JetSlash()
			set category="Skills"
			set name="Jet Slash"
			usr.SkillX("JetSlash",src)

	Dragonballs
		Teachable=0
		Level=100
		verb/MakeDragonballs()
			set category="Skills"
			usr.SkillX("DBSMake",src)
		verb/ScatterDragonballs()
			set category="Skills"
			usr.SkillX("DBSScatter",src)

	Bind
		var/LastTime
		Level=100
		desc="Condemn someone to hell."
		verb/Bind()
			set category="Skills"
			usr.SkillX("Bind",src)
		verb/UnBind()
			set category="Skills"
			usr.SkillX("UnBind",src)
	Contractor
		Level=100
		desc="Allows you to contract souls and use them."
		verb/ContractSoul()
			set category="Skills"
			var/list/PeopleX=new
			for(var/mob/Players/M in get_step(usr,usr.dir))
				PeopleX+=M
			var/mob/A=input(usr,"Contract who?") in PeopleX||null
			if(A)
				/*if((A.Power>(usr.Power-usr.CyberPower)/usr.BaseMod)
					usr.OMessage(10,"[A] deflected [usr]'s contract!","<font color=red>[usr]([usr.key]) contract was failed and deflected by [A]([A.key])")
					return
				else*/
				usr.OMessage(10,"[A] had their soul contracted by [usr].","<font color=red>[usr]([usr.key]) was contracted by [A]([A.key])")
//						var/obj/SoulContract/L=new
				var/obj/L=new/obj/Skills/SoulContract
				L:ContractKey=usr.key
				A.contents+=L
		verb/UseContract()
		//De-Summon and De-Teleport need to be finished, as well as adding in the commands that only work if Majin is involved.
			set category="Skills"
			var/list/ContractedPeople=list("Cancel")
			var/ContractConfirmed=0
			for(var/mob/Players/A in world)
				if(locate(/obj/Skills/SoulContract,A.contents))
					for(var/obj/Skills/SoulContract/B in A)
						if(B.ContractKey==usr.key)
							ContractedPeople+=A
							ContractConfirmed=1
//							B.SummonX=A.loc
//							B.SummonY=A.y
//							B.SummonZ=A.z
//							B.TeleportX=usr.loc
//							B.TeleportY=usr.y
//							B.TeleportZ=usr.z

			if(ContractConfirmed==0)
				usr<<"You have no active contracts currently."
				return
			var/mob/C=input(usr,"Who would you like to invoke your Contract abilities on?") in ContractedPeople
			if(C=="Cancel")
				return
			else
				var/list/thelist=list("Summon","Unsummon","Teleport","Unteleport",,"Transfer Gains","Take Gains","Communicate","Cancel")

				if(locate(/obj/Skills/Buffs/Majin,C.contents))
					if(locate(/obj/Skills/Rank/Majinize,usr.contents))
						thelist.Add("Remote KO","Remote Kill")

				var/Choice=input("What action would you like to do?") in thelist
				switch(Choice)
					if("Cancel")
						return
					if("Summon")
						if(usr.Energy<usr.EnergyMax/2)
							usr<<"You're too tired to Summon!"
							return
						else
							for(var/obj/Skills/SoulContract/D in C)
								if(D.SummonX!=0)
									usr<<"You've already summoned them! You have to return them to their point of origin first!"
									return
								else
									D.SummonX=C.x
									D.SummonY=C.y
									D.SummonZ=C.z
									C.loc=locate(usr.x,usr.y,usr.z)
									if(usr.y==1)
										C.y=usr.y
									else
										C.y=usr.y-1
									//usr.Energy=1
									//usr.ManaAmount=0
									usr<<"You've successfully summoned [C]!"
									C<<"You've been summoned by [usr]!"
					if("Unsummon")
						if(usr.Energy<usr.EnergyMax/2)
							usr<<"You're too tired to Unsummon!"
							return
						else
							for(var/obj/Skills/SoulContract/D in C)
								if(D.SummonX==0||D.SummonY==0||D.SummonZ==0)
									usr<<"You can't unsummon someone without summoning them first!"
									return
								C.loc=locate(D.SummonX,D.SummonY,D.SummonZ)
								D.SummonX=0
								D.SummonY=0
								D.SummonZ=0
								//usr.ManaAmount=0
								usr<<"You've successfully returned [C] from where you summoned them!"
								C<<"You've been returned to where you were before!"
					if("Teleport")
						if(usr.Energy<usr.EnergyMax/2)
							usr<<"You're too tired to Teleport!"
							return
						else
							for(var/obj/Skills/SoulContract/D in C)
								if(D.TeleportX!=0)
									usr<<"You must return to where you came from before teleporting!"
									return
								else
									D.TeleportX=usr.x
									D.TeleportY=usr.y
									D.TeleportZ=usr.z
									usr.loc=locate(C.x,C.y,C.z)
									if(C.y==500)
										usr.y=C.y
									else
										usr.y=C.y+1
									usr<<"You've successfully teleported to [C]!"
									C<<"[usr] has teleported to you!"
					if("Unteleport")
						if(usr.Energy<usr.EnergyMax/2)
							usr<<"You're too tired to Unteleport!"
							return
						else
							for(var/obj/Skills/SoulContract/D in C)
								if(D.TeleportX==0||D.TeleportY==0||D.TeleportZ==0)
									usr<<"You can't unteleport someone without teleporting to them first!"
									break
								usr.loc=locate(D.TeleportX,D.TeleportY,D.TeleportZ)
								D.TeleportX=0
								D.TeleportY=0
								D.TeleportZ=0
								usr<<"You've successfully returned to where you were before!"
								C<<"[usr] vanishes back to where they were before!"
/*					if("Transfer Energy")
						if(usr.EnergyMax/usr.EnergyMod<C.EnergyMax/C.EnergyMod)
							usr<<"They have more energy reserves than you."
							return
						else
							if(usr.ManaAmount<usr.ManaMax)
								usr<<"You're too magically exhausted to perform this."
								return
							else
								usr<<"You've transfered your energy to [C]."
								C<<"You've received energy from [usr]."
								C.EnergyMax=usr.EnergyMax
								C.EnergyMax/=usr.EnergyMod
								C.EnergyMax*=C.EnergyMod
								usr.ManaAmount=0
					if("Take Energy")
						if(usr.EnergyMax/usr.EnergyMod>C.EnergyMax/C.EnergyMod)
							usr<<"You have more energy reserves than they have."
							return
						else
							if(usr.ManaAmount<usr.ManaMax)
								usr<<"You're too magically exhausted to perform this."
								return
							else
								usr<<"You've taken energy from [C]."
								C<<"[usr] has taken energy from you."
								usr.EnergyMax=C.EnergyMax
								usr.EnergyMax/=C.EnergyMod
								usr.EnergyMax*=usr.EnergyMod
								usr.ManaAmount=0*/
					if("Take Gains")
						if(usr.EXP>C.EXP)
							usr<<"You have more than them!"
							return
						else
							if(usr.ManaAmount<usr.ManaMax)
								usr<<"You're too magically exhausted to perform this."
								return
							else
								usr<<"You have received the gaining rate from [C]."
								usr.EXP=C.EXP
								usr.ManaAmount=0
								usr.Energy=0
					if("Transfer Gains")
						if(usr.EXP<C.EXP)
							usr<<"They have more than you!"
							return
						else
							if(usr.ManaAmount<usr.ManaMax)
								usr<<"You're too magically exhausted to perform this."
								return
							else
								usr<<"You have transfered your gaining rate to [C]."
								C.EXP=usr.EXP
								usr.ManaAmount=0
								usr.Energy=0
					if("Communicate")
						usr.TwoWayTelepath(C)
						return
//////The rest of these are in case usr has Majinize, and C has Majin, I don't know if you'd want to add more of these or not.
					if("Remote KO")
						if(usr.Base/usr.BaseMod>C.Base/C.BaseMod)
							C.Health=-1000
							usr.ManaAmount=0
							usr.Energy=1
							usr<<"You have remotely made [C] fall unconscious!"
					if("Remote Kill")
						if(usr.Base/usr.BaseMod>C.Base/C.BaseMod)
							usr.ManaAmount=0
							usr.Energy=1
							C.Death(null,"heart attack!")
							usr<<"You have caused [C] to have a heart attack!"
							C.Majin=0
							for(var/obj/Skills/SoulContract/B in C)
								del(B)
							for(var/obj/Skills/Buffs/Majin/D in C)
								del(D)





	BindToPlanet
		var/YearUsed
		var/LastTime
		Level=100
		desc="Bind someone to a planet for 10 years, and you can call them back to Hell at any time."
		verb/Bind_To_Planet()
			set category="Skills"
			usr.SkillX("BindToPlanet",src)
		verb/Call_From_Planet()
			set category="Skills"
			usr.SkillX("CallPlanet",src)
	RestoreYouth
		Level=100
		desc="Restores the youth of whoever."
		name="Restore Youth"
		verb/Restore_Youth()
			set category="Skills"
			usr.SkillX("RestoreYouth",src)
	UnlockPotential
		Level=100
		var/Uses
		desc="Allows you to Unlock someone's Potential."
		name="Unlock Potential"
		Teachable=0
		verb/Unlock_Potential()
			set category="Skills"
			usr.SkillX("UnlockPotential",src)

	KaioRevive
		Level=100
		desc="Allows you to Revive someone, however you have a 50% chance of killing yourself.  This goes on cooldown for 3 OOC days * the number of times you've revived someone.  Never use it to revive another person who can revive...or else!!"
		icon_state="Revive"
		var/LockedUntil
		var/Uses
		verb/Kaio_Revive()
			set category="Skills"
			usr.SkillX("Revive",src)
	StarRevive
		Level=100
		desc="Allows you to Revive someone with no Negative effects, however this can only be used during the Makyo Star."
		icon_state="Revive"
		var/LastTime
		verb/Star_Revive()
			set category="Skills"
			set name="Star Revive"
			usr.SkillX("StarRevive",src)
	KeepBody
		Level=100
		desc="Allows you to give someone their body."
		icon_state="KeepBody"
		Teachable=0
		verb/KeepBody()
			set name="Keep Body"
			set category="Skills"
			usr.SkillX("KeepBody",src)
	KaioTeleport
		Level=100
		desc="Allows you to Teleport."
		icon_state="KT"
		Teachable=0
		verb/KaioTeleport()
			set category="Skills"
			usr.SkillX("KaioTeleport",src)
	GivePower
		Cooldown=600
		Level=100
		desc="Transfers your power to another."
		SkillCost=50
		verb/GivePower()
			set name="Give Power"
			set category="Skills"
			usr.SkillX("GivePower",src)
	Taiyoken
		Cooldown=30
		desc="Used to blind your opponents with blinding light."
		Teachable=0
		verb/Taiyoken()
			set category="Skills"
			for(var/mob/P in view(10,usr)) P<<sound('solarflare.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
			usr.SkillX("Taiyoken",src)

	ShunkanIdo
		Cooldown=600
		Level=100
		Learn=list("energyreq"=10000,"difficulty"=500)
		icon_state="SI"
		Teachable=0
		verb/ShunkanIdo()
			set category="Skills"
			set name="Shunkan Ido"
			usr.SkillX("ShunkanIdo",src)

	SpaceSwap
		Cooldown=300
		Level=100
		icon_state="SI"
		Teachable=0
		verb/SpaceSwap()
			set category="Skills"
			set name="Space Swap"
			usr.Skill1X("SpaceSwap",src)

	Shield
		Learn=list("energyreq"=1000)
		Level=100
		desc="Engulfs yourself in a shield of energy."
		icon_state="Shield"
		sicon
		SkillCost=100
		verb/Shield()
			set category="Skills"
			usr.SkillX("Shield",src)
	SummonMakyoStar
		Learn=list("energyreq"=1000)
		Level=100
		desc="Call forth the dreaded Makyo Star, blanketing the world in its sickening red glow until the day you die."
		icon_state="Shield"
		sicon
		SkillCost=100
		verb/Summon_Makyo_Star()
			set category="Skills"
			usr.BuffX("SummonStar",src)

	ForceStomp
		Cooldown=60
		desc="Slam downwards with your feet to obliterate opponents' bodies."
		icon_state="Kiai"
		verb/Force_Stomp()
			set category="Skills"
			usr.Skill1X("ForceStomp",src)

	Kiai
		Basic=1
		Cooldown=30
		Learn=list("energyreq"=500)
		desc="Allows you to push away your enemies."
		icon_state="Kiai"
		SkillCost=100
		verb/Kiai()
			set category="Skills"
			usr.SkillX("Kiai",src)
	PlanetDestruction
		desc="Literally destroy the planet."
		icon_state="PD"
		verb/PlanetDestruction()
			set category="Skills"
			if(usr.Alert("Are you SURE you want to do this!?!!??"))
				DestroyPlanet(usr.z)
				usr<<"The destruction has begun."
				for(var/mob/Players/Q in world)
					if(Q.z == usr.z)
						usr<<"The planet begins to shake and tremble as something bad is about to happen..."
	ConsumePlanet
		desc="Literally consume the planet in the void."
		icon_state="PD"
		verb/ConsumePlanet()
			set name="Consume Planet"
			set category="Skills"
			if(usr.Alert("Are you SURE you want to do this!?!!??"))
				VoidPlanet(usr.z,usr)
				usr<<"DO NOT LOGOUT UNTIL THE CONSUMPTION IS FINISHED"
				usr<<"The consumption has begun."
				for(var/mob/Players/Q in world)
					if(Q.z == usr.z)
						usr<<"The planet begins to shake and tremble as something bad is about to happen...worse than usual"


	VoidTeleport
		Cooldown=600
		desc="Teleport to the void"
		var/savex
		var/savey
		var/savez
		verb/VoidTeleport()
			set name="Door to Darkness"
			set category="Skills"
			if(savex||savey||savez)
				usr<<"You teleport back to where you were."
				usr.loc=locate(savex,savey,savez)
				savex=null
				savey=null
				savez=null
			else
				usr<<"You teleport to the void"
				savex=usr.x
				savey=usr.y
				savez=usr.z
				usr.loc=locate(250,250,9)




	Majinize
		Level=100
		desc="Allows you to Majinize someone."
		icon_state="Majinize"
		verb/Majinize()
			set category="Skills"
			usr.SkillX("Majinize",src)
	Mysticize
		Level=100
		desc="Allows you to Mysticize someone."
		icon_state="Mysticize"
		verb/Mysticize()
			set category="Skills"
			usr.SkillX("Mysticize",src)
	MakeAmulet
		Level=100
		desc="Allows you to create an Amulet."
		icon_state="MakeAmulet"
		verb/MakeAmulet()
			set category="Skills"
			usr.SkillX("MakeAmulet",src)
	Invisibility
		Cooldown=25
		desc="Allows you to enter a phase of invisibility."
		icon_state="Invisible"
		verb/Invisibility()
			set category="Skills"
			usr.SkillX("Invisible",src)
	DesoInvisibility
		Cooldown=25
		desc="Allows you to enter a phase of extreme invisibility."
		icon_state="Invisible"
		verb/Invisibility()
			set category="Skills"
			usr.SkillX("DesoInvisible",src)
	/*ForcedHollowEvolve
		desc="Allows the user to force a Hollow to evolve if they have half their requirements for evolution or more."
		icon_state="Invisible"
		verb/ForcedHollowEvolve()
			set category="Skills"
			usr.Bleach("ForcedHollowEvolve",src)
	ForcedArrancar
		desc="Allows the user to force a Hollow to Become an Arrancar at half usual Requirements."
		icon_state="Invisible"
		verb/ForcedArrancar()
			set category="Skills"
			usr.Bleach("ForcedArrancar",src)*/
	ChaosImitate
		Level=100
		desc="Allows you to Imitate someone...somewhere..."
		icon_state="Imitate"
		var/imitating
		var/imitatorname
		var/list/imitatoroverlays=new/list
		var/imitatoricon
		verb/Chaos_Imitate()
			set category="Skills"
			usr.SkillX("ChaosImitate",src)

	Imitation
		Level=100
		desc="Allows you to Imitate someone."
		icon_state="Imitate"
		var/imitating
		var/imitatorname
		var/list/imitatoroverlays=new/list
		var/imitatoricon
		verb/Imitate()
			set category="Skills"
			usr.SkillX("Imitate",src)
	Splitclone
		Cooldown=60
		Level=100
		desc="Allows you to create a duplicate of yourself."
		SkillCost=100
		verb/Splitclone()
			set category="Skills"
			usr.SkillX("Splitclone",src)
	Splitform2
		desc="Alternate splitform that duplicates your exact stats. Debug purposes only."
		verb/Splitform2()
			set category="Skills"
			usr.SkillX("Splitform2",src)
	SuperGhostKamikaze
		Cooldown=60
		desc="Create a ghost copy of yourself that blows up whatever it comes in contact with... including you."
		SkillCost=1000
		verb/Super_Ghost_Kamikaze_Attack()
			set category="Skills"
			usr.SkillX("SGKA",src)
	LosLobos
		Cooldown=60
		desc="Beasts formed from your own reishi attempts to destroy your enemies!"
		SkillCost=1000
		verb/Los_Lobos()
			set category="Skills"
			usr.SkillX("LosLobos",src)
	KyokaSuigetsuClone
		Cooldown=10
		desc="Fill your enemies with despair, toying them with an undefeatable version of yourself!"
		SkillCost=9001
		verb/KyokaSuigetsuClone()
			set category="Skills"
			set name="Hallucination"
			usr.SkillX("KyokaSuigetsuClone",src)
	Enlarge
		Level=100
		icon_state="Expand"
		desc="Simply become larger, with no stat or BP boosts."
		var/list/Overlayz=new
		var/Iconz
		Teachable=0
		verb/Enlarge()
			set category="Skills"
			usr.Skill1X("Enlarge",src)
	Kaioken
		Learn=list("energyreq"=5000,"difficulty"=500)
		Level=100
		desc="Allows you to use the Legendary Kaioken technique."
		icon_state="Kaioken"
		Teachable=0
		verb/Kaioken()
			set category="Skills"
			set name="Kaioken"
			usr.SkillX("Kaioken",src)
	SuperKaioken
		Learn=list("energyreq"=5000,"difficulty"=500)
		Level=100
		desc="Take your Kaioken up to its absolute limit!"
		icon_state="Kaioken"
		Teachable=0
		verb/SuperKaioken()
			set category="Skills"
			set name="Super Kaioken"
			usr.SkillX("SuperKaioken",src)
	KaiokenStrike
		Basic=1
		Cooldown=15
		Learn=list("energyreq"=10000,"difficulty"=50000)
		desc="Dash towards your target and render them vulnerable to a devastating combo attack!"
		Level=100
		SkillCost=1000
		verb/KaiokenStrike()
			set name="Kaioken Strike"
			set category="Skills"
			usr.BuffX("KaiokenPursuit",src)

	BurningShot
		Learn=list("energyreq"=5000,"difficulty"=500)
		Level=0.5
		Using = 0
		var/num
		desc="Allows an amazing burst of power."
		icon_state="Kaioken"
		Teachable=0
		verb/BurningShot()
			set category="Skills"
			set name="Burning Shot"
//			src.Using=!src.Using // Whatever Using is now, reverse it. 1 becomes 0, true becomes false
			usr.SkillX("BurningShot",src)

	SpiritBurst
		Learn=list("energyreq"=5000,"difficulty"=500)
		Level=100
		desc="Offers one a quick and efficient boost to their power."
		icon_state="Kaioken"
		Teachable=0
		verb/SpiritBurst()
			set category="Skills"
			usr.SkillX("SpiritBurst",src)


	Zanzoken
		Basic=1
		SkillCost=5
		Level=100
		Cooldown=10
		desc="Allows you to move at high velocities."
		icon_state="Zanzoken"
		var/ZanzoDistance
		var/ZanzoArea
		verb/Zanzoken()
			set category="Skills"
			usr.SkillX("Zanzoken",src)

	Walking
		Level=100
		Cooldown=15
		desc="Shift your position around at unfathomable speeds!"
		icon_state="Zanzoken"
		var/ZanzoDistance
		var/ZanzoArea
		verb/Walking()
			set category="Skills"
			set name="Foot Techniques"
			usr.SkillX("Walking",src)

	AfterImageStrike
		Basic=1
		SkillCost=5
		Level=100
		Cooldown=60
		desc="When attacked you will automatically dodge with after images and hit back, up to three times."
		icon_state="Zanzoken"
		verb/Zanzoken2()
			set category="Skills"
			set name="After Image Strike"
			usr.Skill1X("After Image Strike",src)
	ButchPower
		desc="Speak to your ancestors..."
		verb/ButchPower()
			set category="Skills"
			set name="Butch Power"
			usr.Skill1X("ButchPower",src)
	ButchDrinkSummon
		desc="Craft the legendary elixir..."
		verb/ButchDrinkSummon()
			set category="Skills"
			set name="Butch Drink"
			usr.Skill1X("ButchDrinkSummon",src)
	WildSense
		Basic=1
		SkillCost=5
		Level=100
		Cooldown=45
		desc="Sense and Dodge."
		icon_state="Zanzoken"
		verb/Zanzoken2()
			set category="Skills"
			set name="Wild Sense"
			usr.SkillX("Wild Sense",src)
	GunKata
		Level=100
		Teachable=0
		var/GunKataType="None"
		var/GunKataTier=1
		desc="Allows you to combine swordplay and gunplay."
		icon_state="Zanzoken"
		verb/GunKata()
			set category="Skills"
			set name="Gun Kata"
			usr.SkillX("GunKata",src)
	ToggleSense
		Level=100
		Teachable=0
		desc="Toggle your ability to be sensed as an Android."
		verb/Toggle_Sense()
			set category="Skills"
			set name="Toggle Sense"
			if(!usr.PowerSense)
				usr.PowerSense=1
				return
			if(usr.PowerSense)
				usr.PowerSense=0
				return
	MakeSword
		Level=100
		Teachable=0
		desc="Forge a basic blade."
		verb/MakeSword()
			set category="Skills"
			usr.contents+=new/obj/Items/Sword
			usr<<"You create a blade."
	MakeBlade
		Level=100
		Teachable=0
		desc="Summon forth a new weapon."
		verb/MakeBlade()
			set category="Skills"
			if(usr.ManaAmount<=10)
				usr << "You need more mana to make swords."
				return
			if(locate(/obj/Items/Sword,usr))
				usr << "You already have a sword that you can use!"
				return
			usr.contents+=new/obj/Items/Sword
			for(var/obj/Items/Sword/S in usr)
				S.ShatterTier=(rand(6,10)-usr.UBWLevel)
				S.ShatterCounter=rand(20,100)
				S.Keyblade=1
				S.KeybladeOwner="[usr]"
				S.Damage_Multiplier=pick(1,1.5,2,2.5,3)
				S.Accuracy_Multiplier=pick(0.75,1,1.5)
				S.Delay_Multiplier=pick(0.75,1,1.5)
				S.Explosive=pick(0,1)
				S.Homing=pick(0,1)
				S.Points=0
				S.PointsAssigned=40
				S.Upgraded=1
				S.Improved=1
				S.EnchantLock=1
				S.suffix="Equipped"
			usr<<"You brought forth a new weapon."
			usr.ManaAmount-=rand(1,5)

	UpgradeSword
		Level=100
		Teachable=0
		desc="Power up a sword utilizing the knowledge of a sword master. You can switch elemental enchantment at will. Note that swords have to be named to make use of this."
		verb/Upgrade_Sword()
			set category="Skills"
			var/list/swords=list("Cancel")
			for(var/obj/Items/Sword/S in usr.contents)
				swords.Add(S)
			var/obj/Items/Sword/Choice=input("Which blade shall you carve?")in swords
//			if(Choice.EnchantLock)
//				usr<<"You're already trying to enchant this weapon, or it's already enchanted."
//				return
			if(Choice.Enchanted)
				usr<<"This weapon's properties cannot be altered further."
				return
			var/Choice2=input("What type of Enchantment?") in list ("Elemental","Additional Points","Weapon Poison", "Nevermind")
			switch(Choice2)
				if("Elemental")
					var/Choice3=input("Select a Element. You may only have one.") in list ("Fire","Wind","Earth","Water","Light","Darkness","Nevermind")
					switch(Choice3)
						if("Fire")
							usr<<"The weapon glows a vibrant red for a few moments, and now feels eternally warm to the touch."
							Choice.EnchantType="Fire"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Wind")
							usr<<"The weapon glows a bright green for a few moments. It feels like wind is slowly swirling around it."
							Choice.EnchantType="Wind"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Earth")
							usr<<"The weapon glows a dull yellow for a few moments. It feels harder, for some reason."
							Choice.EnchantType="Earth"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Water")
							usr<<"The weapon glows a deep blue for a few moments. Moisture seems to gather about the weapon."
							Choice.EnchantType="Water"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Darkness")
							usr<<"The weapon glows a deep purple for a few moments. Grasping the weapon seems to hurt your hand."
							Choice.EnchantType="Darkness"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Light")
							usr<<"The weapon glows a bright silver for a few moments. Grasping the weapon seems to revitalize you."
							Choice.EnchantType="Light"
							Choice.Enchanted=1
							Choice.EnchantLock=0
						if("Nevermind")
							Choice.EnchantLock=0
							return
				if("Additional Points")
					if(Choice.EnchantLock==1)
						usr<<"Stop trying to cheat the system. :|"
						return
					Choice.EnchantLock=1
					if(Choice.Improved||Choice.Upgraded)
						usr<<"This weapon has already been improved or upgraded."
						return
					if(Choice.Enchanted)
						usr<<"This weapon has already been given extra points."
						return
					Choice.Points+=5
					Choice.Upgraded=1
					usr<<"The weapon now can be enhanced slightly more."
					//Choice.Enchanted=1
					Choice.EnchantLock=0
				if("Weapon Poison")
					Choice.EnchantType="Poison"
					usr<<"You concoct a magical poison and apply it to the weapon. It does not look like the poison can be removed now..."
					Choice.Enchanted=1
					Choice.EnchantLock=0
				if("Nevermind")
					Choice.EnchantLock=0
					return


obj/Skills/Senjutsu
	SageMode
		Level=100
		desc="Gather natural energy, allowing you to use special versions of standard attacks."
		verb/SageMode()
			set category="Skills"
			usr.BuffX("SageMode",src)
	SageKikoho
		Cooldown=30
		Level=100
		desc="A last resort attack. Combine natural energy and your own life energy into one super powerful destructive sphere."
		verb/SageKikoho()
			set category="Skills"
			set name="Sage Art: Energy Cannon"
			usr.BuffX("SageKikoho",src)

	SageExpand
		Learn=list("energyreq"=1000,"difficulty"=4)
		icon_state="Expand"
		var/list/Overlayz=new
		var/Iconz
		verb/SageExpand()
			set category="Skills"
			set name="Sage Art: Muscle Expansion"
			usr.BuffX("SageExpand",src)
	SageFocus
		Learn=list("energyreq"=1000,"difficulty"=5)
		desc="Allows you to focus."
		icon_state="Focus"
		SkillCost=10
		verb/SageFocus()
			set category="Skills"
			usr.BuffX("SageFocus",src)
	SageSplitform
		Cooldown=30
		Level=100
		desc="Create a body double from natural energy (mana.) You're granted far more control over these clones than normal ones."
		SkillCost=100
		verb/Sage_Art_Bunshin()
			set category="Skills"
			usr.SkillX("SageSplit",src)
	SunlightSpear
		Cooldown=30
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		sicon='SunlightSpear.dmi'
		desc="Praise the sun, motherfucker."
		Distance=10
		SkillCost=1000
		verb/SunlightSpear()
			set name="Sunlight Spear"
			set category="Skills"
			usr.BuffX("SunlightSpear",src)
obj/Skills/HalfDemonAbilities
	/*Quicksilver
		Cooldown=420
		Teachable=0
		sicon='SunlightSpear.dmi'
		desc="Gotta go fast."
		verb/Quicksilver()
			set name="Quicksilver"
			set category="Skills"
			usr.SkillHX("Quicksilver",src)*/
	WrathRevenge
		Cooldown=1
	//	Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		sicon='SunlightSpear.dmi'
		desc="Get payback."
		verb/Revenge()
			set name="Revenge"
			set category="Skills"
			usr.SkillHX("Revenge",src)
obj/Skills/Keyblade
	Finisher
		Cooldown=60
		Teachable=0
		desc="Combo breaker."
		verb/Finisher()
			set category="Skills"
			usr.BlastX("ComboFinisher", src)
	ManifestKeyblade
		Cooldown=30
		Learn=list("energyreq"=5000,"difficulty"=50)
		Teachable=0
		desc="Turn the sword you're wielding into a Keyblade...!"
		Distance=10
		SkillCost=1000
		verb/ManifestKeyblade()
			set name="Manifest Keyblade"
			set category="Skills"
			usr.BuffX("ManifestKeyblade",src)
	CallKeyblade
		Cooldown=15
		desc = "Activate your Keyblade powers."
		verb/Call_Keyblade()
			set category="Skills"
			usr.BuffX("CallKeyblade", src)
	BestowKeyblade
		desc="Give your keyblade to someone else."
		verb/Bestow_Keyblade()
			set category="Skills"
			usr.BuffX("BestowKeyblade", src)
	DarkMode
		desc = "blah blah blah darkness within every heart."
		verb/Dark_Mode()
			set category="Skills"
			usr.BuffX("DarkMode", src);


obj/Items/Amulet
	icon='ArtificalObj.dmi'
	icon_state="Amulet"
	var/tmp/using
	verb/Open()
		set src in usr
		if(!using)
			using=1
			usr.OMessage(20,"[usr] opens the amulet and a portal to the dead zone appears!!","[usr]([usr.key]) opened the deadzone.")
			new/obj/Effects/DeadZone(locate(usr.x,usr.y+4,usr.z))
			spawn(300) using=0


turf/Click(turf/T)
	if(!usr.Observing&&!usr.Control&&!usr.Frozen)
		if(locate(/obj/Skills/Attacks/SlicingWind,usr.contents))
			for(var/obj/Skills/Attacks/SlicingWind/SW in usr.contents)
				if(SW.Using==1)
					for(var/obj/Projectiles/Mystical/V in view(8, usr))
						if(V.SlicingW)
							if(V.Owner==usr)
								walk_towards(V,src)
								sleep(3)



		if(locate(/obj/Skills/Rank/Zanzoken,usr.contents))
			//si zanzo
			var/OP
			if(locate(/obj/Skills/Rank/ShunkanIdo,usr.contents))
				for(var/obj/Skills/Rank/ShunkanIdo/BUH in usr.contents)
					if(BUH.Level>99)
						OP=1

			for(var/obj/Skills/Rank/Zanzoken/CM in usr.contents)
				if(CM.BuffUsing==1&&OP!=1&&!usr.KO)
				//	CM.ZanzoDistance=10
					for(var/mob/P in range(1,usr)) if(P.Grab==usr) return
					if(usr.Energy<=usr.EnergyMax/10) return
					if(usr.client.eye!=usr) return
					if(usr.Health<=10) return
					if(usr.Beaming) return
					if(usr.icon_state=="Meditate"||usr.icon_state=="Train"||usr.icon_state=="Blast"||usr.icon_state=="KB"||usr.icon_state=="KO") return
					if(T) if(T.icon)
						flick('Dodge.dmi',usr)
						var/formerdir=usr.dir
						usr.dir=formerdir
						usr.Energy-=(usr.EnergyMax/100)
						usr.ZanzokenSkill+=(1*usr.ZanzokenSkillMod)
						if(usr.Energy<1) usr.Energy=1
						for(CM.ZanzoDistance=3, , CM.ZanzoDistance --)
							if(CM.ZanzoDistance <=1) break
							var/turf/q = get_step_towards(usr,src)
							for(var/obj/Turfs/v in get_step_towards(usr,src))
								if(v && v.density && v.Glass)
									usr.Quake(10)
									usr.Health*=0.9
									return
							for(var/obj/Effects/x in get_step_towards(usr,src))
								if(x && x.density && x.Glass)
									usr.Quake(15)
									usr.Health*=0.9
									return
							for(var/obj/Items/Tech/ReinforcedDoor/RD in get_step_towards(usr,src))
								if(RD && RD.density)
									usr.Quake(10)
									usr.Health*=0.9
									return
							if(q && q.density) break
							CM.ZanzoArea = locate(q.x, q.y, q.z)
							usr.loc = CM.ZanzoArea
				else if(CM.BuffUsing==1&&OP==1)
					if(T) if(T.icon)
						for(var/turf/A in view(0,usr)) if(A==src) return
						if(usr.Energy<=usr.EnergyMax/10) return
						if(usr.client.eye!=usr) return
						if(usr.Health<=10) return
						if(!T.density)
							flick('Dodge.dmi',usr)
							var/formerdir=usr.dir
							usr.Move(src)
							usr.dir=formerdir
							//usr.Energy-=(5/usr.ZanzokenSkill)
							usr.ZanzokenSkill+=(10*usr.ZanzokenSkillMod)
							if(usr.Energy<1) usr.Energy=1

						/*var/turf/q = get_step_towards(usr,src)
						if(CM.ZanzoDistance<=1) break
						if(q && q.density) break
						CM.ZanzoArea = locate(q.x, q.y, q.z)
						CM.ZanzoDistance--
						for(var/turf/A in view(0,usr)) if(A==src) return
						if(!T.density)
							if(usr.icon_state!="Meditate"&&usr.icon_state!="Train"&&usr.icon_state!="Blast"&&usr.icon_state!="KB"&&usr.icon_state!="KO")
								flick('Dodge.dmi',usr)
								var/formerdir=usr.dir
							//	usr.Move(src)
								usr.dir=formerdir
								usr.loc=src
								usr.Energy-=(usr.EnergyMax/100)
								usr.ZanzokenSkill+=(1*usr.ZanzokenSkillMod)
								if(usr.Energy<0) usr.Energy=0
								sleep(usr.CantZanzo)
								usr.CantZanzo+=3*/

		if(locate(/obj/Skills/Rank/Walking,usr.contents))
			var/OP
			if(usr.CirculationUnlocked==1)
				OP=1

			for(var/obj/Skills/Rank/Walking/CM in usr.contents)
				if(CM.Using==1&&OP==1&&!usr.Knockbacked)
					if(T) if(T.icon)
						for(var/turf/A in view(0,usr)) if(A==src) return
						if(usr.Energy<=usr.EnergyMax/10) return
						if(usr.client.eye!=usr) return
						if(usr.Health<=10) return
						if(!T.density)
							flick('Dodge.dmi',usr)
							var/formerdir=usr.dir
							usr.Move(src)
							usr.dir=formerdir
							usr.Energy-=usr.EnergyMax/100
							if(usr.Energy<1) usr.Energy=1

// BEBI TRANS. Proc handles to and from transformation state depending on TRUE/FALSE statement.
mob/proc/modif_Bebi(trans)

	switch(trans)
		if(TRUE)

			//Modifying their actual stats
			src.Base					=	src.boostBebi_Base
			src.Strength				=	src.boostBebi_Strength
			src.Force					=	src.boostBebi_Force
			src.Endurance				=	src.boostBebi_Endurance
			src.Resistance				=	src.boostBebi_Resistance
			src.Speed					=	src.boostBebi_Speed
			src.SpeedMod				=	src.boostBebi_SpeedMod
			src.Offense					=	src.boostBebi_Offense
			src.Defense					=	src.boostBebi_Defense

			//Mods
			src.preBebi_BaseMod			=	src.BaseMod
			src.preBebi_StrengthMod		=	src.StrengthMod
			src.preBebi_ForceMod		=	src.ForceMod
			src.preBebi_EnduranceMod	=	src.EnduranceMod
			src.preBebi_ResistanceMod	=	src.ResistanceMod
			src.preBebi_SpeedMod		=	src.SpeedMod
			src.preBebi_OffenseMod		=	src.OffenseMod
			src.preBebi_DefenseMod		=	src.DefenseMod
			src.contents+=new/obj/Skills/UnInfect

		if(FALSE)

			//Undo the boost their received but leave other 'gained' crap intact
			src.Base					-=	src.boostBebi_Base
			src.Strength				-=	src.boostBebi_Strength
			src.Force					-=	src.boostBebi_Force
			src.Endurance				-=	src.boostBebi_Endurance
			src.Resistance				-=	src.boostBebi_Resistance
			src.Speed					-=	src.boostBebi_Speed
			src.SpeedMod				-=	src.boostBebi_SpeedMod
			src.Offense					-=	src.boostBebi_Offense
			src.Defense					-=	src.boostBebi_Defense

			//Return their mods to their original state
			src.BaseMod					=	src.preBebi_BaseMod
			src.StrengthMod				=	src.preBebi_StrengthMod
			src.ForceMod				=	src.preBebi_ForceMod
			src.EnduranceMod			=	src.preBebi_EnduranceMod
			src.ResistanceMod			=	src.preBebi_ResistanceMod
			src.SpeedMod				=	src.preBebi_SpeedMod
			src.OffenseMod				=	src.preBebi_OffenseMod
			src.DefenseMod				=	src.preBebi_DefenseMod

			// same with race and graphics
			src.Race					=	src.preBebi_Race

			src.Class					=	src.preBebi_Class
			src.icon					=	src.preBebi_icon
			src.overlays				=	src.preBebi_overlays
			src.Hair					=	src.preBebi_Hair

			// Set all their Boosted shit back to null so it doesnt needlessly waste savefile space

			src.boostBebi_Base			=	null
			src.boostBebi_Strength		=	null
			src.boostBebi_Force			=	null
			src.boostBebi_Endurance		=	null
			src.boostBebi_Resistance	=	null
			src.boostBebi_Speed			=	null
			src.boostBebi_SpeedMod		=	null
			src.boostBebi_Offense		=	null
			src.boostBebi_Defense		=	null

			//Mod boosts
			src.preBebi_BaseMod			=	null
			src.preBebi_StrengthMod		=	null
			src.preBebi_ForceMod		=	null
			src.preBebi_EnduranceMod	=	null
			src.preBebi_ResistanceMod	=	null
			src.preBebi_SpeedMod		=	null
			src.preBebi_OffenseMod		=	null
			src.preBebi_DefenseMod		=	null

			src.preBebi_Race			=	null

			src.preBebi_Class			=	null
			src.preBebi_icon			=	null
			src.preBebi_overlays		=	null
			src.preBebi_Hair			=	null
			src.contents+=new/obj/Skills/UnInfect

		else
			world << "SOMETHING DUN GON DERPED WITH BEBI. THE FUCK YOU FEEDING IT?"
			world.log << "Bebi modif_Bebi() crashed with [trans] in the switch statement instead of TRUE/FALSE"

// Bebi vars! Saves the boost it got :)
// Done

mob/var

	boostBebi_Base
	boostBebi_Strength
	boostBebi_Force
	boostBebi_Endurance
	boostBebi_Resistance
	boostBebi_Speed
	boostBebi_SpeedMod
	boostBebi_Offense
	boostBebi_Defense

	preBebi_BaseMod
	preBebi_StrengthMod
	preBebi_ForceMod
	preBebi_EnduranceMod
	preBebi_ResistanceMod
	preBebi_SpeedMod
	preBebi_OffenseMod
	preBebi_DefenseMod

	preBebi_Race

	preBebi_Class
	preBebi_icon
	preBebi_overlays
	preBebi_Hair

mob/proc
	UpdateBeamWindow(var/obj/Skills/Attacks/Beams/CustomBeam/I)
		if(I)
			if(istype(I,/obj/Skills/Attacks/Beams/CustomBeam))
				winset(usr,"BeamPoints","text=[usr.CustomPoints]")
				var/list/changes=list("LabelBeamPower","LabelBeamSpeed","LabelBeamDrain","LabelBeamDistance","LabelBeamChargeRate")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelBeamPower")blah="[usr.CustomPower]"
						if("LabelBeamSpeed")blah="[usr.CustomSpeed]"
						if("LabelBeamDrain")blah="[usr.CustomEfficiency]"
						if("LabelBeamDistance")blah="[usr.CustomDistance]"
						if("LabelBeamChargeRate")blah="[usr.CustomChargeRate]"
					winset(usr,x,"text=[blah]")

mob/Players/verb/CustomizeBeam(type as text)
	set name=".BeamCustom"
	set hidden=1
	var/obj/Skills/Attacks/Beams/CustomBeam/Q=usr.Customizing
	if(Q)
		if(istype(Q,/obj/Skills/Attacks/Beams/CustomBeam))
			if(usr.CustomPoints>0)
				if(type in list("Power","Speed","Efficiency","ChargeRate"))
					if(type == "Speed" && usr.CustomSpeed>8)
						usr.CustomSpeed=8
						return
					else
						usr.vars["Custom[type]"]+=0.1
					usr.CustomPoints--
				else
					usr.vars["CustomDistance"]+=0.5
					usr.CustomPoints--
				UpdateBeamWindow(Q)
				sleep(1)

mob/New()
	src.CheckPassives()
	..()

mob/proc
	//A simple proc for checking every passive, only works with current buffs
	CheckPassives()
		spawn while(src)
			for(var/obj/Skills/Buffs/B in src.BuffList) B.Passive(src)
			src.TickDownHits()
			sleep(world.tick_lag)

mob/var/AngerThreshold = 50

