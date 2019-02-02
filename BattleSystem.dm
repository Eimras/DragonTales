var/list/kyoon=list("Kyoon","Pyoon","Nyoon","Wryuun","Myuun","Vroom","Awoon","Zwoon","Fwoon")

mob/var/LastAnger
mob/var/list/HitBy = list()

mob/proc/TickDownHits()
	for(var/hits in src.HitBy)
		if(src.HitBy[hits] > 0 ) src.HitBy[hits]--

mob/proc/SaiyanAnger()
	if(src.Majin)
		return
	var/BonusAnger=0.0
	if(src.SaiyanAngerAscensions>=1)
		BonusAnger+=0.2
	if(src.SaiyanAngerAscensions>=2)
		BonusAnger+=0.25
	if(src.SaiyanAngerAscensions>=3)
		BonusAnger+=0.3
	if(Health<=80 && Health>=5&&src.icon_state!="Meditate")
		if(Health<= 80 && Health>=61 && !src.SaiyanAnger)
			src.OMessage(20,"[src] grows more ferocious...!")
			if(Class=="Elite")
				Anger=1.3+BonusAnger
			if(Class=="Normal")
				Anger=1.15+BonusAnger
			if(Class=="Low-Class")
				Anger=1.1+BonusAnger
			src.SaiyanAnger=1
		if(Health<= 60 && Health>=51 && src.SaiyanAnger<=1)
			if(Class=="Elite")
				Anger=1.55+BonusAnger
			if(Class=="Normal")
				Anger=1.3+BonusAnger
			if(Class=="Low-Class")
				Anger=1.25+BonusAnger
			src.SaiyanAnger=2
		if(Health<= 50 && Health>=41 && src.SaiyanAnger<=2)
			src.OMessage(20,"[src] reaches their limit of anger!")
			if(Class=="Elite")
				Anger=1.6+BonusAnger
			if(Class=="Normal")
				Anger=1.5+BonusAnger
			if(Class=="Low-Class")
				Anger=1.4+BonusAnger
			src.SaiyanAnger=3
		if(Health<= 40 && Health>=31 && src.SaiyanAnger<=3)
			if(Class=="Elite")
				Anger=1.65+BonusAnger
			if(Class=="Normal")
				Anger=1.65+BonusAnger
			if(Class=="Low-Class")
				Anger=1.6+BonusAnger
			src.SaiyanAnger=4
		if(Health<= 30 && Health>=21 && src.SaiyanAnger<=4)
			if(Class=="Elite")
				Anger=1.7+BonusAnger
			if(Class=="Normal")
				Anger=1.85+BonusAnger
			if(Class=="Low-Class")
				Anger=1.9+BonusAnger
			src.SaiyanAnger=5
		if(Health<= 20 && src.SaiyanAnger<=5)
			src.OMessage(20,"[src] shatters their limits through sheer, unsurpassed rage!")
			if(Class=="Elite")
				Anger=1.75+BonusAnger
			if(Class=="Normal")
				Anger=2+BonusAnger
			if(Class=="Low-Class")
				Anger=2.25+BonusAnger
			src.SaiyanAnger=6
	else if(Health>80&&src.icon_state=="Meditate"&&src.SaiyanAnger)
		Anger=0
		src.SaiyanAnger=0
		src.OMessage(10,"<font color=white><i>[src] becomes calm.","<font color=silver>[src]([src.key]) becomes calm.")
mob/proc/Anger()
	if(src.Race=="Saiyan") return
	if(AngerMax>1&&Anger==0)
		/*if(LastAnger)
			if(abs(src.LastAnger-world.realtime)<3500)
				return*/
		if(src.KeybladeLevel)
			if(src.DarkModeCD&&src.UnmasteredDarkKeyblade())
				return
		Anger=AngerMax
		src.OMessage(15,"<font color=red>[src] becomes angry!","<font color=blue>[src]([src.key]) becomes angry!")
		if(Class=="Bardock")
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] yells: <b>FRIIIIIIIIIIIIEEEEEEEEEEZZZZZZZZAAAAAAAAAAAAA!</b>"
		if(Class=="Butch")
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] yells: <b>KEEEEEEEEEEEEELLLLLLLLLLLLLVIIIIIIIIIIIIIIIIIIIIIIIIIIIIIN!</b>"
		if(Class=="Infini")
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] yells: <b>CLOOOOOOOOOOOOOTHEEEEEEEEEEEEEEESLIIIIIIIIIIIIIIIIIIIIIIIIINE!</b>"
		if(Class=="Jesse")
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] yells: <b>DAAAAAAAAAAAAAAAAAAAAAAAAAARWIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIN!</b>"
		if(src.Kowala)
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] yells: <b>(this game is banwagon the admins hate me)</b>"
		if(src.ChinChin)
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] yells: <b>ORE WA OCHINCHIN GA DAISUKI DAYO!</b>"
		if(src.Darlose)
			src.Anger=1
			src.AngerFail=1
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] yells: <b>AND AS I PRAY... UNLIMITED WHITE KNIGHT SOCIAL JUSTICE WORKS!!!</b>"
		//src.LastAnger=world.realtime

mob/proc/Unconscious(mob/P,var/text)

	if(src.KO)
		return
/*	if(src.GijiAllowed)// && (src.Base*20)>=ssj["1req"]/4))
		src.GijiSSj(1)
		src.GijiAllowed=0
		return*/
	if(P)
		src.ZenkaiMatch=P.Base
		if(!istype(src,/mob/Player/FevaSplits))
			src.OMessage(15,"[src] is knocked out by [P]!","<font color=red>[src]([src.key]) is knocked out by [P]([P.key])")
		src.Overdrive=0
	if(text)
		src.Overdrive=0
		if(!istype(src,/mob/Player/FevaSplits))
			src.OMessage(15,"[src] is knocked out by [text]!","<font color=red>[src]([src.key]) is knocked out by [text]")
	/*if(!src.GijiTrigger&&src.Race=="Saiyan")
		if(1000000<=src.Base*20)
			if(prob(15))
				src.GijiSSj(1)*/
	if(src.LastBreath && src.Energy>=(EnergyMax/10))
		src.KO=0
		src.OMessage(15,"...but [src] refuses to go down!","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
		src.Health=1
		src.HealHealth(20)
		if(src.TotalInjury > 80)
			var/num = src.TotalInjury-80
			src.HealWounds(num)
	if(src.GateNumber==8)
		src.KO=0
		src.OMessage(15,"...but [src]'s youth is burning too bright to be stopped!","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
		src.Health=1
		src.TotalInjury=0
		src.HealHealth(100)
	if(src.Avalon)
		src.KO=0
		src.OMessage(15,"...but [src] is brought back to their feet by a dazzling light!","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
		src.Health=1
		src.Energy=src.EnergyMax
		src.ManaAmount+=30
		if(src.TotalInjury > 35)
			var/num = src.TotalInjury-35
			src.HealWounds(num)
	if(src.Berserkering)
		if(src.EarthAndHeaven)
			if(prob(80))
				src.KO=0
				src.Health=1
				if(src.TotalInjury > 40)
					var/num = src.TotalInjury-40
					src.HealWounds(num)
				src.HealHealth(75)
				src.OMessage(15,"[src] slowly rises back on their feet in dead silence...","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				sleep(15)
				src.OMessage(15,"[src] surges forward again!")
				src.Berserkering=1
				src.BerserkerInsanity=1
				spawn(1) src.BlackOriginMode()
				if(src.EarthAndHell>=55)
					src.EarthAndHell-=50
			else
				src.BerserkerInsanity=0
				src.BerserkerInsanityLock=0
				src.Berserkering=0
				src.Death(null, "reaching the limit of The Black Origin Threshold!")
		if(src.BerserkerRise==0)
			if(src.VisoredStage==1)
				if(prob(5))
					src.BerserkerInsanity=0
					src.BerserkerInsanityLock=0
					src.Berserkering=0
					src.Death(null, "being devoured by their inner hollow!")
				else
					src.BerserkerInsanity=0
					src.BerserkerInsanityLock=0
					src.Berserkering=0
			else if(src.VisoredStage==4)
				src.KO=0
				src.OMessage(15,"[src]'s inner hollow consumes even more of their body...!?","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				src.Health=1
				src.BerserkerRise=1
				if(src.TotalInjury > 60)
					var/num = src.TotalInjury-60
					src.HealWounds(num)
				src.HealHealth(40)
				return
//			else if(src.BerserkerMod>=1&&prob(70))
			else if(src.Berserkering<3&&prob(50))
				src.KO=0
				src.OMessage(15,"[src]'s armor digs into their flesh, forcing them to rise once more!","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				src.Health=30
				src.BerserkerRise=1
//				if(src.TotalInjury > 80)
//					var/num = src.TotalInjury-80
//					src.HealWounds(num)
//				src.HealHealth(15)
				return
			else if(src.Berserkering==4&&prob(75))
				src.KO=0
				src.OMessage(15,"[src]'s armor digs into their flesh, forcing them to rise once more!","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				src.Health=50
				src.BerserkerRise=1
				src.Power_Multiplier=1
				src.Power_Multiplier+=0.9
//				if(src.TotalInjury > 80)
//					var/num = src.TotalInjury-80
//					src.HealWounds(num)
//				src.HealHealth(15)
				return
			else if(src.Berserkering>=5&&prob(100))
				src.KO=0
				src.OMessage(15,"[src]'s armor digs into their flesh, forcing them to rise once more!","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				src.Health=75
				src.BerserkerRise=1
				src.Power_Multiplier=1
				src.Power_Multiplier+=1.5
//				if(src.TotalInjury > 80)
//					var/num = src.TotalInjury-80
//					src.HealWounds(num)
//				src.HealHealth(15)
				return
			else
				src.Berserkering=0
				src.BerserkerInsanity=0
				src.BerserkerInsanityLock=0
		else if(src.BerserkerRise==1)
			if(src.VisoredStage==4)
				if(prob(25))
					src.BerserkerInsanity=0
					src.BerserkerInsanityLock=0
					src.Berserkering=0
					src.Death(null, "their soul giving in to the strain of hollowification!")
				else
					src.BerserkerInsanity=0
					src.BerserkerInsanityLock=0
					src.Berserkering=0
			if(src.Berserkering==4&&prob(75))
				src.KO=0
				src.OMessage(15,"[src]'s armor eats into the meat of their muscle groups, twisting their limbs back into place..!?","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				src.Health=10
				src.Power_Multiplier=1
				src.Power_Multiplier+=1.1
				src.BerserkerRise=2
				return
			if(src.Berserkering>=5&&prob(100))
				src.KO=0
				src.OMessage(15,"[src]'s armor eats into the meat of their muscle groups, twisting their limbs back into place..!?","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				src.Health=50
				src.Power_Multiplier=1
				src.Power_Multiplier+=1.7
				src.BerserkerRise=2
			else
				src.BerserkerInsanity=0
				src.BerserkerInsanityLock=0
				src.Berserkering=0
		else if(src.BerserkerRise==2)
			if(src.Berserkering>=5&&prob(100))
				src.KO=0
				src.OMessage(15,"[src]'s armor consumes many of their injuries, bringing them back onto their feet...","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				src.Health=25
				src.BerserkerRise=3
				src.Power_Multiplier=1
				src.Power_Multiplier+=2
				return
			else
				src.BerserkerInsanity=0
				src.BerserkerInsanityLock=0
				src.Berserkering=0
/*		else if(src.BerserkerRise==3)
			if(src.BerserkerMod>&&prob(70))
				src.KO=0
				src.OMessage(15,"[src]'s armor forces itself into their skeletal structure, pushing them forward endlessly...","<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				src.Health=1
				src.BerserkerRise=4
				if(src.TotalInjury > 20)
					var/num = src.TotalInjury-20
					src.HealWounds(num)
				src.HealHealth(100)
				return
			else
				src.BerserkerInsanity=0
				src.BerserkerInsanityLock=0
				src.Berserkering=0*/
		else if(src.BerserkerRise==3)
			src.BerserkerInsanity=0
			src.BerserkerInsanityLock=0
			src.Berserkering=0
			src.Death(null, "massive bloodloss due to the armor devouring vital organs, their armor now serving as a metal coffin!")

	/*if(src.Visored==1 && src.VisoredStage==0))
					var/blurp=input(src,"A white substance forms on your face, what shape does it take?","Your Visored Mask is Permanent") in list("Resolve","Zeal","Pursuit","Strength")
			if(blurp=="Resolve")
				src.MaskType="Resolve"
				src<<"You have picked the Mask of Resolve!"
				src.SkillX("MaskForm",src)
				src.Health=0
				src.Health+=50
				src.Energy=src.EnergyMax
				src.VisoredStage=1

			else if(blurp=="Zeal")
				src.MaskType="Zeal"
				src<<"You have picked the Mask of Zeal!"
				src.SkillX("MaskForm",src)
				src.Health=0
				src.Health+=50
				src.Energy=src.EnergyMax
				src.VisoredStage=1

			else if(blurp=="Pursuit")
				src.MaskType="Pursuit"
				src<<"You have picked the Mask of Pursuit!"
				src.SkillX("MaskForm",src)
				src.Health=0
				src.Health+=50
				src.Energy=src.EnergyMax
				src.VisoredStage=1

			else if(blurp=="Strength")
				src.MaskType="Strength"
				src<<"You have picked the Mask of Strength!"
				src.SkillX("MaskForm",src)
				src.OMessage(15,"...but [src] seems to form some strange mask on their face, standing right back up!","<font color=red>[src]([src.key]) remains standing due to some strange mask!")
				src.Health=0
				src.Health+=50
				src.Energy=src.EnergyMax
				src.VisoredStage=1

	*/
		return
	for(var/obj/Items/Sword/S in src) if(S.suffix)
		if(S.EnchantType=="SORD....." && S.SwordPot>=5)
			S.EnchantType="Ultima"
			src.Health=0
			src<<"You have unlocked the ultimate sword element! This sword has power to rival that of Excalibur itself."
	var/GetUpOdds=rand(1,6)
	if(src.SecondChance&&!src.SecondChanceActive)
		src.HealHealth(10)

		src.HealEnergy(src.EnergyMax)
		if(src.HasKeyblade("Light", 4)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
			src.Energy*=1.5
		src.OMessage("[src] forces themselves to their feet to fight on!", "[src]([src.key]) used Second Chance.")
		src.SecondChanceActive=1
		return
	if(src.SecondChance&&src.SecondChanceActive)
		src.SecondChanceActive=0
	for(var/obj/Items/StoneMask/S in src) if(S.suffix)
		if(src.Class!="Dio")
			if(!locate(/obj/Skills/Regenerate,src.contents))
				src.contents+=new/obj/Skills/Regenerate
			src.Class="Dio"
			src.TotalEssence=25
			src.IsVamp=1
			src.EssenceMax=300
			src.Regeneration*=1.5
			src.Conscious()
			src.LoseEssence(1)
			src.HealHealth(100)
			src.Energy=EnergyMax
			if(!(locate(/obj/Skills/VampireAbsorb,src.contents)))
				src.contents+=new/obj/Skills/VampireAbsorb
			if(!(locate(/obj/Skills/VampireFrenzy,src.contents)))
				src.contents+=new/obj/Skills/VampireFrenzy
			if(!(locate(/obj/Skills/VampireInfect,src.contents)))
				src.contents+=new/obj/Skills/VampireInfect
			if(!(locate(/obj/Skills/SendEnergy,src.contents)))
				src.contents+=new/obj/Skills/SendEnergy
			if(!(locate(/obj/Skills/BloodDrain,src.contents)))
				src.contents+=new/obj/Skills/BloodDrain
			if(!(locate(/obj/Skills/LifeDrain,src.contents)))
				src.contents+=new/obj/Skills/LifeDrain
	if(prob(5))
		GetUpOdds=12
	var/KOTimer=1200/(src.Regeneration*src.RegenerationMultiplier)*GetUpVar/GetUpOdds
	//world<<"[src] will be knocked out for [KOTimer/10] seconds."
	spawn(KOTimer)if(src && !src.MortallyWounded)src.Conscious()
	//if(ismob(P)) P.Anger=0
/*	var/Gain=Zenkai_Rate*BaseMod*0.1
	Base+=Gain
	ZenkaiAmount+=Gain*/
	Injure(src,30)
	src.KO=1
	src.icon_state="KO"
	src.Health=1
	src.Energy=1
	src.ControlPower=100
	src.Burning=0
	src.Flying=0
//	FlyGains.Remove(src)
	src.MeditationCD=0
	src.TrainingCD=0
	src.DiggingCD=0
	src.LastBreath=0
	src.ChiBlockTimer=1
	src.SuperHumanDrugTimer=0
	src.BerserkerInsanity=0
	src.BerserkerInsanityLock=0
	src.Berserkering=0
	if(src.client)
		for(var/obj/Skills/Buffs/DivineBlessing/x in src)
			if(x.BuffUsing)
				src.SkillX("DivineBlessing",x)
		for(var/obj/Skills/Buffs/DemonicWill/x in src)
			if(x.BuffUsing)
				src.SkillX("DemonicWill",x)
		for(var/obj/Skills/Buffs/ThirdEye/x in src)
			if(x.BuffUsing)
				src.SkillX("ThirdEye",x)
		/*for(var/obj/Skills/Buffs/OlympianFury/x in src)
			if(x.BuffUsing)
				src.SkillX("OlympianFury",x)*/
		for(var/obj/Skills/Buffs/BlazingWrath/x in src)
			if(x.BuffUsing)
				src.SkillX("BlazingWrath",x)
		for(var/obj/Skills/Rank/BurningShot/x in src)
			if(x.BuffUsing)
				src.SkillX("BurningShot",x)
		for(var/obj/Skills/Rank/Susanoo/x in src)
			if(x.BuffUsing)
				src.BuffX("Susanoo",x)
		if(src.LetztStilOn==1)
			//SanreiEffect Removals
			src.AngerMax*=1.2
			src.Recovery/=1.35
			src.SpeedMod/=1.25
			src.BaseMod/=1.75
			if(src.BodyType=="Small")
				src.StrengthMod/=1.5
				src.EnduranceMod/=1.5
				src.ResistanceMod/=1.5
				src.Strength/=1.5
				src.Endurance/=1.5
				src.Resistance/=1.5
			else if (src.BodyType=="Large")
				src.OffenseMod/=1.5
				src.DefenseMod/=1.5
				src.ForceMod/=1.5
				src.SpeedMod/=1.25
				src.Offense/=1.5
				src.Defense/=1.5
				src.Force/=1.5
			else if (src.BodyType=="Medium")
				src.StrengthMod/=1.2
				src.EnduranceMod/=1.2
				src.ForceMod/=1.2
				src.ResistanceMod/=1.2
				src.OffenseMod/=1.2
				src.DefenseMod/=1.2
				src.Strength/=1.2
				src.Endurance/=1.2
				src.Force/=1.2
				src.Resistance/=1.2
				src.Offense/=1.2
				src.Defense/=1.2
			//Stats removed from LetztStil
			src.Base=1
			src.BaseMod/=5
			src.ForceMultiplier/=1.25
			src.SpeedMultiplier/=1.25
			src.<<"Your power becomes completely exhausted, losing not only your Letzt Stil but your Sanrei's boosts as well."
			src.LetztStilOn=0 //Makes sure you do not fall victim to being overly nerfed
			src.SanreiActive=0 //Allows you to use Third Eye and Anger
			src.SanreiBreak=1 //But Prevents you from using Sanrei again.
			sleep(10)//Sanity-checking to make sure that lag will not force you to be nerfed twice.
		if(src.trans["active"]>0&&src.CyberPower==0)
			if(src.Race!="Changeling")
				src.Revert()
				src<<"Being knocked out forced you to revert!"
		if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
			src.Oozaru(0)
		if(locate(/obj/Lycan,src.contents))
			src.Wolfman(0)
	if(src.Golden)
		src.GoldenOozaru(0)
	if(src.Grab) src.Grab_Release()
	if(istype(src,/mob/Split))
		del(src)
	if(istype(src,/mob/SuperGhost))
		del(src)
mob/proc/Conscious()
	if(src.KO)
		src.Last_Zenkai=Value(world.realtime)
		src.MortallyWounded=0
		src.KO=0
		src.icon_state=""
		src.Health=1
		src.Energy=EnergyMax/100
		if(!src.Anger) src.Anger()
		src.OMessage(15,"[src] regains consciousness.","<font color=blue>[src]([src.key]) regains consciousness")

obj/Spirit
	icon='NewObjects.dmi'
	icon_state="35"
	Health=1.#INF
	Grabbable=0
	var/list/who=new
/*	verb/Use()
		set src in oview(1)
		if(who.Find(usr.key))
			if(who[usr.key]<=Year)
				usr<<"You cannot use this until next month."
				return
			else
				if(prob(20))
					who.Remove(usr.key)
					usr<<"...Get out of here."
					usr.loc=locate(236,260,8)

				else
					usr<<"...You're out of luck..try again next month."
					who[usr.key]=Year
		else
			usr<<"..Welcome to The Final Realms! You may train, conversate with others...and enjoy the rest of eternity haha! You may talk to me once every month starting next month to see if I qualify you to get out of this dump!"
			who.Add("[usr.key]"=Year)*/

	verb/Use(var/mob/A in world)
		set src in oview(1)
		set category="Other"
		if(!locate(/obj/Skills/Observe, usr))
			usr.contents+=new/obj/Skills/Observe
			usr<< "You may now watch over the living until your spirit is joined with Rebirth."
		else
			usr<< "Overuse of ancient relics can cause immense pain... ( :"
			return

mob/proc/Death(mob/P,var/text,var/deather=0)
	if(src.z==14)return
	var/obj/Regenerate/A

	if(text && !src.Regenerating)
		src.OMessage(20,"[src] was just killed by [text]!","<font color=red>[src] was just killed by [text]!")
	if(P && !src.Regenerating)
		src.OMessage(20,"[src] was just killed by [P]!","<font color=red>[src] was just killed by [P]([P.key])!")
/*		if(P.HasTierS())
			P.KillCount++*/
	if(src.GodTier)
		src << "Please adminhelp for a death judgement.  You have conditional immortality."
		src << "If your death wasn't just or heroic, you'll be returned to life!"
		src.PrevX = src.x
		src.PrevY = src.y
		src.PrevZ = src.z
		src.loc = locate(190, 50, 12)
		return
	if(!src.GodTier)
		if(locate(/obj/Skills/Buffs/HeroOfAspect, src) && src.HeroTitle && src.AspectTitle)
			if(src.GodTierAllowed)
				src.PrevX = src.x
				src.PrevY = src.y
				src.PrevZ = src.z
				src.loc = locate(190, 50, 12)
				src << "You have died, but it's okay!!  You died at the right place at the right time."
				src << "In other words, you're going to become a God."
				src << "Sit tight for 5 minutes and don't log out."
				spawn(3000)
					src.loc = locate(src.PrevX, src.PrevY, src.PrevZ)
					world << "[src] has ascended as a God Tier [src.HeroTitle] of [src.AspectTitle]!!"
					src.HeroLevel=5
					src.GodTier=1
					return
			else
				src.HeroLevel=4
				src << "You almost became a God, but it wasn't the right time."
	if(src.Darlose)
		src.OMessage(20,"[src] just had their face sucked off by [P]!","<font color=red>[src] was just anally annihilated by [P]!")
	sleep()
	if(Grab) Grab_Release()
	for(var/mob/Players/B) if(B.Grab==src) B.Grab_Release()
	if(Immortal)
		src<<"You are immortal. What are you doing here? Get the fuck back!"
		src.SendToSpawn()
		return
	for(A in src) break
	if(A)
		if(src.Regenerating) return
		src.Regenerating=1
		sleep(10)
	//	src.Regenerating=0
		if(Health>=(A.Level*-5))
			A.X=x
			A.Y=y
			A.Z=z
			Regenerate(A)
			loc=locate(190, 50, 12)
			sleep(1210/A.Level)
			for(var/mob/PPP in view(10,usr))
				PPP<<sound('KunaiMod/Sounds/squelch.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
				return
		else if(Health<=(A.Level*-3.5))
			src<< "Your regeneration has been broken, thusly killing you."
			src.OMessage(20,"[src] was just killed by [P]!","<font color=red>[src] was just killed by [P]!")
			src.loc=locate(190, 50, 12)
			src.Regenerating=0
			src.Dead=1
			src.overlays-='Halo.dmi'
			src.overlays+='Halo.dmi'
			src.Conscious()
			del A
			return
	/*	if(deather<100*A.Level)
			A.X=x
			A.Y=y
			A.Z=z
			loc=locate(485,458,13)
			Regenerate(A)
			return*/
	else
		if(!src.client)
			del(src)
			return
		if(src.Fusee==1)
			src.loc=locate(190, 50, 12)
			src.Fusee=0
			src.Fusion()
			return
		if(!src.Dead)
			src.Leave_Body()
		else
			for(var/obj/Items/I in src)
				if(I.Stealable)
					if(I.suffix=="Equipped")
						spawn(5) I.suffix=null
				I.loc=src.loc

		for(var/obj/Money/Q in src)
			if(Q.Level)
				var/obj/Money/M=new(src.loc)
				M.Level=Q.Level
				M.name="[Commas(M.Level)] Resources"
				Q.Level=0
		if(src.client)
			if(!(locate(/obj/Lycan/Master,src.contents)))
				for(var/obj/Lycan/Q in src.contents)
					del(Q)
			if(!(locate(/obj/Skills/VampireInfect,src.contents)))
				for(var/obj/Skills/VampireAbsorb/Q in src.contents)
					if(src.Package["Vampire"]==1)
						src.SkillX("VAbsorb",Q)
						src.Package["Vampire"]=null
					spawn()del(Q)
				for(var/obj/Skills/VampireFrenzy/Q in src.contents)
					if(Q.Using)
						src.SkillX("VFrenzy",Q)
					spawn()del(Q)
			src.overlays-='Halo.dmi'
			src.overlays+='Halo.dmi'
			src.AbsorbPower=null
			if(!src.MachinaMod)
				src.CyberPower=null
			src.Poison=0
			src.Burning=0
			src.TotalInjury=0
/*			if(src.TotalMysticInjury>10)
				src<<"You can still feel the immense pain of your wounds even after death, as part of your soul also got erased."
				if(src.TotalMysticInjury>90)
					sleep(30)
					src<<"No matter how much sense you try to make, you can't seem to have hope of ever coming back... You're dead. Your existence got torn apart by one's blade and savage eyes. You've been utterly annihilated from the present and future. You'll probably do well in another timeline, because not even reincarnation is saving you from this."
					src.Savable=1
					fdel("Saves/Players/[src.ckey]")
					Log("Admin","<font color=blue>[ExtractInfo(usr)] SAVE DELETED [ExtractInfo(src)] got too much damage from Lines of Death like a noob.")
					src.OMessage(10,"[src]'s soul vanishes!","<font color=red>[src]([src.key]) faded from existence...")
					del(usr)*/
			if(src.Race=="Makyo" && MakyoStar)
				MakyoStar=0
				world<<"<small><font color=red>The Makyo Star fades upon the death of [src]!"
			if(src.Dead)
		//		if(global.JinxMap)
				src.loc=locate(190, 50, 12)
				src.Conscious()
	/*			else
					src.loc=locate(441,467,13)
					src.Conscious()*/
			else
				src.Dead=1
			//	src.loc=locate(441, 467, 13)
				src.loc=locate(190, 50, 12)
				src.Conscious()
				for(var/obj/Items/Tech/CloningTank/zz in world)
					if(zz.Revive==src.key && src.UsedTanks == 1)
						src<<"Your cloning tank brings you back to life!"
						src.Revive()
						src.loc=zz.loc
					else if(zz.Revive==src.key && src.UsedTanks == 2)
						src<<"Your cloning tank brings you back to life!"
						src.Revive()
						src.loc=zz.loc
					else
						return





mob/proc/Revive()
	if(src.Darlose)
		src<<"Fuck you, nigga!"
		src.OMessage(10,null,"[src]([src.key]) is a faggot and cannot be brought back to life.")
		return
	else
		overlays-='Halo.dmi'
		Dead=0
obj/Regenerate
	var/X
	var/Y
	var/Z

mob/proc/Fusion()
	var/Timer=3000
	src<<"You will return to your previous location in 5 minutes"
	src.OMessage(10,null,"[src]([src.key]) will return to their previous location in 5 minutes.")
	if(KO) Conscious()
	Health=100
	spawn(Timer)
		for(var/mob/A) if(A.key=="[src.FusionTarget]")
			src.loc=A.loc
			A.Revert()
			src.Revert()
			A.Base=(A.Base/5)-src.Base
			A.Fused=0
mob/proc/Regenerate(obj/Regenerate/R)
	var/Timer=1200/R.Level
	src.Regenerating=1
	src<<"You will regenerate in [Timer/600] minutes"
	src.OMessage(10,null,"[src]([src.key]) will regenerate in [Timer/600] minutes.")
	if(KO) Conscious()
	Health=100
	spawn(Timer) if(src&&R) if(R.X&&R.Y&&R.Z)
		loc=locate(R.X,R.Y,R.Z)
		Health=max(50,Health)
		src.TotalInjury=0
		src.TotalFatigue=0
		R.X=null
		R.Y=null
		R.Z=null
		src.Regenerating=0
	if(src.Race== "Bio Android" && src.bioform3 == 1 && superperfect==0)
		superperfect=1
		BaseMod=60
		src<< "You have unlocked your Super Perfect form."
	//	world<<sound('cellreturns.wav', repeat = 0, wait = 0, channel = 0, volume = 50)

	//LABEL: ACCURACY FORMULA
proc/Sharingan_Formula(mob/User,Chance)
	if(User.SharinganLevel==1)
		Chance=85
	else if(User.SharinganLevel==2)
		Chance=75
	else if(User.SharinganLevel==3)
		Chance=65
	else if(User.SharinganLevel==4)
		Chance=55


proc/Accuracy_Formula(mob/Offender,mob/Defender,Chance=WorldDefaultAcc)
	if(Offender&&Defender)
		if(Offender.SpiralOffense)
		{
			Chance = WorldDefaultAcc*1.2
		}
		if(Defender.SenseActive>=3)
			Chance*=0.8
		if(Offender.HopeHero)
			Chance*=1+(((Offender.ControlPower/100)-1)/5*Offender.HeroLevel/3)
		if(Defender.MindHero)
			if(Defender.MindDodges >= (7 - Defender.HeroLevel))
				Defender.MindDodges=0
				Chance=0
		if(Offender.DoomHero)
			Chance=WorldDefaultAcc+(10*Offender.HeroLevel)
		if(Offender.WindyThing)
			Chance*=3
		if(Offender.LightHero)
			Chance*=(Offender.LightLuck/100)
		if(Offender.dir==Defender.dir)
			Chance*=2
		if(Defender.VoidHero)
			Chance/=(Defender.VoidPain/100)
		if(Defender.Ryukansen)
			Chance=0
		if(Defender.HiddenBlade)
			Chance=0
		if(Defender.CQCRestrain)
			Chance=0
		if(Defender.HiddenBlade2)
			Chance=0
		for(var/obj/Items/Armor/A in Defender)
			if(A.suffix)
				Chance*=1.25
		for(var/obj/Items/Shield/S in Defender)
			if(S.suffix)
				Chance*=1.25
		var/Offense=(Offender.Power*((Offender.Offense*Offender.OffenseMultiplier)*1.3)*Offender.Skill) * ((Offender.SpeedMod*Offender.SpeedMultiplier))
		var/Defense=(Defender.Power*((Defender.Defense*Defender.DefenseMultiplier)*1.3)*Defender.Skill) * ((Defender.SpeedMod*Defender.SpeedMultiplier))
		var/TotalAccuracy= Chance*(Offense/max(Defense,0.01))
		if(TotalAccuracy>=100)
			TotalAccuracy=100
		for(var/obj/Items/Sword/Q in Offender) if(Q.suffix)
			TotalAccuracy*=Q.Accuracy_Multiplier
		if(Defender.GER && !Offender.SpiralOffense)
			TotalAccuracy=0
	//	Offender << "Your total accuracy is [TotalAccuracy]"
		return TotalAccuracy//Chance*(Offense/max(Defense,0.01))


mob/proc/Comboz(var/mob/M,var/forced)
	if(M==1)return
	if(M)
		var/turf/W=locate(M.x+rand(-1,1),M.y+rand(-1,1),usr.z)
		if(W)
			if(istype(W,/turf/Special/Blank))
				return
			if(!W.density)
				for(var/atom/x in W)
					if(x.density)
						return
				src.loc=W
				src.dir=ReturnDirection(src,M)
			//	if(prob(5*M.SpeedMod)||M.Warp=1)
				M.dir=ReturnDirection(M,src)
				Blok(src)
				if(!forced)
					src.SkillUP("Warp",pick(rand(1,2),0.5))

mob/proc/ComboX(var/mob/X,var/forced)
	if(X==1)return
	if(X)
		var/turf/Y=locate(X.x+rand(-1,1),X.y+rand(-1,1),usr.z)
		if(Y)
			if(istype(Y,/turf/Special/Blank))
				return
			if(!Y.density)
				for(var/atom/x in Y)
					if(x.density)
						return
				src.loc=Y
				src.dir=ReturnDirection(src,X)
				Blok(src)
				if(!forced)
					src.SkillUP("Warp",pick(rand(1,2),0.5))

mob/proc/ComboCobra(var/mob/X,var/forced)
	if(X==1)return
	if(X)
		var/turf/Y=locate(X.x+rand(-3,3),X.y+rand(-3,3),usr.z)
		if(Y)
			if(istype(Y,/turf/Special/Blank))
				return
			if(!Y.density)
				for(var/atom/x in Y)
					if(x.density)
						return
				src.loc=Y
				src.dir=ReturnDirection(src,X)
				Blok(src)
				if(!forced)
					src.SkillUP("Warp",pick(rand(1,2),0.5))

mob/proc
/*	Dodge(var/mob/P)
		flick('Dodge.dmi',P)*/
	PunchGain(var/mob/P)
		if(istype(P,/obj))
			if(istype(src.SparGuy,/obj/Items/Tech/PunchingBag))
				Melee_Gain(0.75/sqrt(src.SpeedMod),1)
				src.SkillUP("Unarmed",10)
			else if(istype(src.SparGuy,/obj/Items/Enchantment/Book_of_Hitting))
				if(IntFocus==1)
					IntGainofHitting(0.75)
				else if(EnchantmentFocus==1)
					EnchantmentGainofHitting(0.75)
				src.SkillUP("Unarmed",0.5)
			//else if(istype(src.SparGuy,/obj/Items/Tech/PunchingBag))



		else
			if(src.SparGuy==P&&P.SparGuy==src)
				if(P.client)
					var/PowerGains=1
					if(src.GetPowerRank(1)>P.GetPowerRank(1))
						PowerGains*=abs(src.GetPowerRank(1)/P.GetPowerRank(1))
					if(PowerGains>=2)
						PowerGains=2
					else if(PowerGains>=1)
						PowerGains=1
					if(P.EXP>src.EXP)
						if(prob(100/sqrt(src.SpeedMod)))
							src.EXP+=sqrt(abs(P.EXP-src.EXP))/2
					src.Melee_Gain((2.25*sparmod))
					var/SwordGains=1
					for(var/obj/Items/Sword/Z in P) if(Z.suffix)
						SwordGains=2
					for(var/obj/Items/Sword/S in src) if(S.suffix && !src.Warp)
						src.SkillUP("Sword",10*SwordGains)
						src.SkillUP("Unarmed",-5)
					if(!src.Warp)
						src.SkillUP("Unarmed",5)
				else
					//var/WarpCut=1
					src.Melee_Gain((2.25*sparmod))
					for(var/obj/Items/Sword/S in src) if(S.suffix && !src.Warp)
						src.SkillUP("Sword",5)
						src.SkillUP("Unarmed",-5)
					if(!src.Warp)
						src.SkillUP("Unarmed",5)
			else
				src.SparGuy=P

mob/proc/Melee(var/damagemulti,var/speedmulti,var/iconoverlay,var/forcewarp,var/MeleeTarget=null,var/ExtendoAttack=null,var/SecondStrike,var/ThirdStrike,var/Accur_Multi=1,var/WFF=0, var/MultiPunch=0)
	if(src.Knockbacked)
		for(var/obj/Skills/MartialArts/AerialPayback/x in src)
			src.Skill1X("AerialPayback",x)
			return
	if(src.Attacking)return
//	if(src.Regenning)return
//	var/AttackTypeModifier=1
/*	if(src.AttackHardness=2)
		AttackTypeModifier=10
	if(src.AttackHardness=3)
		AttackTypeModifier=30*/
	var/Drain=0//5/src.Efficiency*DrainHard*AttackTypeModifier
	var/SwordFighting=0
	var/StaffFighting=0
	if(!(src.CanBlast(Drain)))return
	var/Delay=SpeedDelay()//Refire
	var/Accuracy=80
	var/Damage
	if(kiblade==0&&SpiritSword==0&&SoulCrushing==0)
		Damage=src.Power*(src.Strength*src.StrengthMultiplier)*rand(20,160)/10*WorldDamageMult
/*		if(SpiralStrength)
		{
			Damage=src.Power*(src.Strength*src.StrengthMultiplier)*5
		}*/
	else if(src.SoulCrushing)
		Damage=src.Power*((src.Strength*src.StrengthMultiplier)*0.5+((src.Force*src.ForceMultiplier)*2))*rand(2,16)*WorldDamageMult
	else if(kiblade==1&&!src.GetDunked&&!src.StrengthOfWill&&!src.SoulCrushing)
		Damage=src.Power*((src.Strength*src.StrengthMultiplier)*0.8+((src.Force*src.ForceMultiplier)*0.66))*rand(2,16)*WorldDamageMult
	else if(src.SpiritSword)
		var/hasSpirit=0
		for(var/obj/Items/Sword/s in src)
			if(s.suffix)
				if(s.SpiritSword)
					hasSpirit=1
		if(hasSpirit)
			Damage=src.Power*((src.Strength*src.StrengthMultiplier)+((src.Force*src.ForceMultiplier)))*rand(2,16)*WorldDamageMult
		else
			Damage=src.Power*((src.Strength*src.StrengthMultiplier))*rand(2,8)*WorldDamageMult
	else
		Damage=src.Power*(src.Strength*src.StrengthMultiplier)*rand(1,5)*WorldDamageMult
	if(src.SoulEdge)
		Damage=src.Power*(src.GetStr(5)*WorldDamageMult)
	if(src.ChaosPunching)
	{
		Damage*=GoCrand(0.2,5)
		Accuracy*=GoCrand(0.2,5)
	}
	if(src.Headbutt)
		Damage*=5
		if(src.Headbuttantispam==0)
			src.OMessage(10, "[src] slams their head into their opponent!", "[src] triggered Headbutt.")
			src.Headbuttantispam=1
			spawn(20)
				src.Headbuttantispam=0
	if(src.WhirlwindStrike)
		Damage*=2.5
		src.OMessage(10, "[src]'s strike creates a whirlwind, drawing everyone closer!", "[src] triggered Whirlwind Strike.")
		for(var/mob/m in oview(3, src))
			step_towards(m, src)
		for(var/mob/m in oview(5, src))
			step_towards(m, src)
		for(var/mob/m in oview(8, src))
			step_towards(m, src)
		src.WhirlwindStrike=0
	if(src.RebuffOverdrive)
		Damage*=2
		src.OMessage(10, "[src] strikes their opponent with Hamon-infused elbows!", "[src] triggered Rebuff Overdrive.")
		src.RebuffOverdrive=0
	if(src.PathType=="Luck")
		Damage*=GoCrand(0,1.6)
		Accuracy*=rand(0,3)
		if(src.trans["unlocked"] >=1)
			Damage*=GoCrand(0,3)
			Accuracy*=GoCrand(0,2)
	if(src.EightArms)
		if(prob(50) && !SecondStrike)
			for(var/i = 0, i<=4, i++)
				//sleep(0)
				Melee(SecondStrike=1, MultiPunch = 1)
				//for(var/mob/P in get_step(src,dir))
				//	var/PixelX = rand(-10,10)
				//	var/PixelyY = rand(-10,10)
				//	PunchEffect(P, PixelX, PixelyY)
	if(src.OneHundredArms)
		if(prob(10) && !SecondStrike)
			for(var/i = 0, i<=100, i++)
			//	sleep(0)
				Melee(damagemulti = 0.20, SecondStrike=1, MultiPunch = 1)
				//for(var/mob/P in get_step(src,dir))
				//	var/PixelX = rand(-10,10)
				//	var/PixelyY = rand(-10,10)
				//	PunchEffect(P, PixelX, PixelyY)
	var/explode
	if(src.WeaponMaster)
		explode=1
	/*for(var/obj/Skills/Swords/WeaponMaster/V in src)
		if(V.Using)
			explode=1*/

//	if(src.BerserkerInsanity)
//		src.Lethal=1

	for(var/obj/Items/Dagger/S in src) if(S.suffix)
		SwordFighting=1
		StaffFighting=0
		Accuracy/=1.25
		Accuracy*=src.SwordAccuracy

	for(var/obj/Items/BambooStaff/S in src) if(S.suffix)
		SwordFighting=0
		StaffFighting=1
		Accuracy/=1.25
		Accuracy*=src.SwordAccuracy

	for(var/obj/Items/Sword/S in src) if(S.suffix)
		SwordFighting=1
		Accuracy/=1.5
		Accuracy*=src.SwordAccuracy
		var/hitenmult=1
		if(src.HitenMitsurugi)
			hitenmult+=(src.HitenMitsurugi/10)
			if(src.HitenMitsurugi==6)
				hitenmult=1.75
		Accuracy*=hitenmult
		var/AccuracyUnnerf = S.ScissorBlade
		while(AccuracyUnnerf)
			AccuracyUnnerf--
			Accuracy*=1.25
		if(src.DualWield)
			if(prob(50+(25*TripleWield))&&!SecondStrike)
				Melee(SecondStrike=1)
				//world<<"[src] attacked twice!"
			//	Damage*=GoCrand(1.5,3)
		if(src.TripleWield)
			if(prob(50)&&SecondStrike&&!ThirdStrike)
				Melee(SecondStrike=1,ThirdStrike=1)
				//world<<"[src] attacked three times!"
				//Damage*=GoCrand(1.5,3)
		if(src.Kusanagi)
			src.HealEnergy(0.001*src.EnergyMax)
			if(src.Kusanagi==2)
				src.HealHealth(0.05)
		if(src.Durendal==2)
			Accuracy*=1.5
		if(!src.HexaWield)
			Delay/=S.Delay_Multiplier
			Drain/=S.Drain_Multiplier
		if(src.InUBW&&src.MadeOfSwords)
			Accuracy*=1.5
		if(src.InUBW&&src.CounterGuardian)
			Damage*=1.5
		if(Delay<=2)
			Delay=2
		if(src.InUBW)
			Delay=1

		Damage*=S.Damage_Multiplier
		if(S.Explosive)
			explode=1
		if(!forcewarp&&S.Homing)
			forcewarp=1
		//if(S.Accuracy_Multiplier>=1)
		//	S.Accuracy_Multiplier=1
		if(S.Cursed)
			src.Cursed=1
		if(src.invisibility==200)
			forcewarp=1
			Damage*=1.2
			src.invisibility=0
		if(src.AttackHardness==3)
			Delay*=5


	if(src.Warp|| forcewarp|| src.GetDunked||src.JumpyPunch||src.KingCrimson||src.EpitaphUse)
		if(forcewarp==1 &&!src.Warp==1||src.Warp==2|| src.GetDunked||src.JumpyPunch||src.KingCrimson||src.EpitaphUse)
			if(prob(src.ZanzokenSkill/50)|| src.GetDunked||src.JumpyPunch||src.KingCrimson||src.EpitaphUse)
				if(src.Target)
					var/mob/M=usr.Target
					if(M)
						if(M!=src)
							if(!src.LightningAura)
								var/lol=abs(src.x-M.x)+abs(src.y-M.y)
								if(lol<5&&lol>2)
									forcewarp=M
							if(src.LightningAura)
								var/lol=abs(src.x-M.x)+abs(src.y-M.y)
								if(lol<3&&lol>1)
									forcewarp=M
		Comboz(forcewarp,1)
	var/list/Pawnch=list()
	if(ExtendoAttack)
		Damage*=sqrt(get_dist(src,MeleeTarget))
		Pawnch:Add(MeleeTarget)
//	for(var/mob/Yo in fevDir(src,16))
	//	Pawnch:Add(Yo)
	for(var/mob/Yo in get_step(src,dir))
		Pawnch:Add(Yo)

	for(var/mob/P in Pawnch)
		P.HitBy["Attacked"]++
		if(src.HeavyShot)
			P.HitBy["HeavyShot"] = 1 //mark down we've been hit by a heavy shot, used for some passives
		if(P.LogiaDefense)
			var/Chance=(src.WillPower*20)
			if(!prob(Chance))
				//src.OMessage(10, "[src]'s attack failed to affect [P]!", "")
				return
		if(speedmulti)Delay*=speedmulti
		var/BlahX=0
		var/ArmorDamage
		var/ShieldDamage
		var/ShieldDamageCut=1
		var/ElementalDef="None"
		var/DamageCut=1
		if(kiblade==0&&axekick==0)
			BlahX=P.Power*(P.Endurance*P.EnduranceMultiplier)
		else if(kiblade==1&&axekick==0)
			BlahX=P.Power*((P.Endurance*P.EnduranceMultiplier)+((P.Resistance*P.ResistanceMultiplier)))/1.75
		else if(SoulCrushing)
			BlahX=P.Power*((P.Endurance*P.EnduranceMultiplier)+((P.Resistance*P.ResistanceMultiplier)))/2
		else
			if(P.icon_state=="Meditate")
				BlahX=P.Power*((P.Endurance*P.EnduranceMultiplier)*0.70)
			else
				BlahX=P.Power*(P.Endurance*P.EnduranceMultiplier)
		if(BlahX<=0)
			BlahX=0.002
		for(var/obj/Items/Shield/S in P) if(S.suffix)
			ShieldDamageCut=1.25
		for(var/obj/Items/Armor/I in P) if(I.suffix)
			DamageCut=2
			if(I.EnchantType)
				ElementalDef="[I.EnchantType]"
		ArmorDamage=(Damage/(P.Endurance*P.EnduranceMultiplier))/100
		ShieldDamage=(Damage/(P.Endurance*P.EnduranceMultiplier))/100
		Damage/=BlahX
		Damage/=DamageCut
		Damage/=ShieldDamageCut
		if(damagemulti)Damage*=damagemulti
		var/Knock_Distance=round((Power*(Strength*StrengthMultiplier))/(P.Power*(P.Endurance*P.EnduranceMultiplier))*rand(0.5,2))
		///
		//unelegant hardcoding for this for the moment
		//checks your BuffList list, and if you have the proper buff in there
		//we can assume it is active, and will modify Knock_Distance Accordingly
		for(var/obj/Skills/Buffs/B in src.BuffList)
			if(istype(B, /obj/Skills/Buffs/Battle_Ready))
				P.HitBy["Battle_Ready"]++
				Knock_Distance *= 2
		///
		if(src.AttackHardness==3)Knock_Distance*=5
//		if(src.AttackHardness==4)Knock_Distance*=20
		if(src.AttackHardness==4)Knock_Distance+=1
		if(src.HeavyShot) Knock_Distance*=5
		if(src.TheKnee) Knock_Distance*=10
		if(src.HeavyShot) Knock_Distance+=15
		if(src.ShutUp) Knock_Distance=10
		if(src.EveningElephant) Knock_Distance+=5
		if(src.KamuiShippu||src.SuperKamuiAscension) Knock_Distance+=5
		if(src.AsaKujaku)Knock_Distance=0
		if(src.DjinnMagic=="Sound") Knock_Distance+=10
//		if(src.SoulCrushing)
//			Knock_Distance*=3
		if(src.Stance=="StrongFist"&&src.StanceActive||src.Stance=="StrongestFist"&&src.StanceActive)
			if(prob(20))
				Knock_Distance+=1
			if(prob(10))
				Knock_Distance+=3
			if(prob(3))
				Knock_Distance+=5
		if(src.SpiralStrength)
			if(prob(10))
				Knock_Distance+=1
			if(prob(5))
				Knock_Distance+=3
			if(prob(2))
				Knock_Distance+=5
		if(prob(70)&&!src.HeavyShot)
			Knock_Distance=0
		for(var/obj/Items/Weights/W in src) if(W.suffix) Drain*=3

		for(var/obj/Items/Sword/S in src) if(S.suffix)
			if(S.EnchantType=="Holy...?")
				Accuracy*=99
			else if(S.EnchantType=="Holy")
				Damage*=1.5
				Accuracy*=1.25
			else if(S.EnchantType=="Ultima-Holy")
				if(P.IsEvil())
					Damage*=2
			else if(S.EnchantType=="SORD....")
				Damage*=0.25
				Accuracy*=0.25
			else if(S.EnchantType=="SORD.....")
				Damage*=0.7
				Accuracy*=0.7
			else if(S.EnchantType=="Ultima")
				Damage*=1.5
				Accuracy*=1.25
			else if(S.EnchantType=="Abyssal")
				if(prob(35))
					P.Poison+=0.015
					P.Burning+=0.015
					spawn()P.Poisoned_Check()
					spawn()P.Burning_Check()
				Accuracy*=1.5
			else if(S.ShatterTier)
				if(prob(10*S.ShatterTier))
					S.ShatterCounter-=1
					if(prob(20))
						S.ShatterCounter-=5
				if(S.ShatterCounter<=10)
					src.overlays-=S.icon
					del(S)
					src << "Your weapon has shattered!"
/*		if(src.Berserkering)
			var/DamnFam=BlockDamage(P,Damage)
			if(src.BerserkerInsanity)
				Injure(P,DamnFam)*/
		if(src.GetDunked&&!SwordFighting)
			Damage*=4*(100/P.Health)*3
			Accuracy*=5
		if(src.DjinnMagic=="Wind")
			Accuracy*=2
		if(src.DjinnMagic=="Strength")
			Damage*=2
		if(src.TheKnee)
//			Damage*=rand(3,15)
			if(src.Health>=75)
				Damage*=2.5
			if(src.Health>=50&&src.Health<=75)
				Damage*=5
			if(src.Health>=25&&src.Health<=50)
				Damage*=7.5
			if(src.Health>=0&&src.Health<=25)
				Damage*=10
		if(src.AsaKujaku&&!SwordFighting)
			Damage*=(100/P.Health)
			Accuracy*=3
		if(src.ExplosionExpert)
			//Damage*=src.ForceMod/2
			Damage*=1+sqrt(src.ForceMod + src.ForceMultiplier/2)
		if(src.NineLives)
			Damage*=9
		if(src.NineLivesFinal)
			Damage*=999
		if(src.XStrike)
			Damage*=5
			Accuracy*=1.5
		if(src.XStrikeFinal)
			Damage*=15*(100/P.Health)
			Accuracy*=2
		if(src.JumpyPunch&&!SwordFighting)
			Damage*=2*(100/P.Health)
			Accuracy*=1.5
		if(src.SpiritOfWar)
			Damage*=src.SpiritCounter/10
			Accuracy*=src.SpiritCounter/10
		if(src.Stance=="Southpaw"&&src.StanceActive)
			if(prob(20))
				src.Southpaw=1
				src.OMessage(10,"[src]'s jabs become unpredictable!","<font color=red>[src]([src.key]) triggered Southpaw's passive effect.")

		if(src.Southpaw)
			Damage*=1.25
			Accuracy*=100
			if(prob(50))
				src.Southpaw=0

		if(src.SoulCrushing)
	//		Damage*=2
			Accuracy*=0.75

		if(src.GunKata)
			Damage*=1.15
			Accuracy*=1.15

		if(src.lockon)
			Accuracy*=1.5
			Damage*=0.75
		if(src.RhoAias)
			Accuracy*=1.25
		if(src.StrengthOfWill)
			Damage*=1.25
			Accuracy*=250
		if(src.KingCrimson)
			Damage*=4
			Accuracy*=500
		if(src.EpitaphUse)
			Damage*=0.5
			Accuracy*=500
		if(P.CursedBeta=="Tome")
			Accuracy*=2

		if(src.CursedBeta=="Empty")
			if(prob(0.5))
				var/blades=rand(1,5)
				var/bladedamage=rand(1,3)
				spawn()while(blades)
					blades--
					var/obj/Projectiles/Mystical/A=new(locate(rand(src.x-3, src.x+3),rand(src.y-3, src.y+3), src.z))
					A.Distance=rand(20,60)
					A.Explosive=1
					A.Physical=1
					A.icon=pick('Demon1.dmi','Demon2.dmi','Demon4.dmi','Demon5.dmi','Demon6.dmi','Demon6Female.dmi','Demon7.dmi','Demon8.dmi','Demon9.dmi')
					A.Owner=P
					A.Damage_Multiplier=bladedamage
					A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*2
					spawn(10) if(A) spawn()Homing(A,src)
					if(prob(50))sleep(0.1)
					else if(prob(20))sleep(1)

		//LABEL: ACCURACY
		if(forcewarp)
			Accuracy/=2
		if(src.AttackHardness==3)
			Accuracy*=4
		if(!prob(Accuracy_Formula(src,P,Accuracy))&&!src.BladeMode&&!src.ShutUp) Accuracy=0
		if(src.ComboPlus&&src.AttackHardness==1)
			Accuracy=100
		if(P.icon_state=="Meditate"||P.KO) Accuracy=100
		var/brk=0
		var/dork=0
		if(src.InUBW&&src.MadeOfSwords)
			var/obj/Items/Sword/othersword=P.EquippedSword()
			if(othersword&&!othersword.Shatterproof)
				if(P.SpiritSword&&P.SpiritLevel < 3)
					dork=1
				if(othersword.Keyblade&&P.KeybladeWielder&&P.KeybladeLevel<3)
					dork=1
				else if(P.WeaponSoul)
					if(P.WeaponSoul=="Holy"||P.WeaponSoul=="Corrupt"||P.WeaponSoul=="Dual")
						dork=1
				else
					dork=1
		if(src.Muramasa==1)
			var/obj/Items/Sword/othersword=P.EquippedSword()
			if(othersword&&!othersword.Shatterproof)
				if(P.SpiritSword&&P.SpiritLevel < 3)
					brk=1
				if(othersword.Keyblade&&P.KeybladeWielder&&P.KeybladeLevel<3)
					brk=1
				else if(P.WeaponSoul)
					if(P.WeaponSoul=="Holy"||P.WeaponSoul=="Corrupt"||P.WeaponSoul=="Dual")
						brk=1
				else
					brk=1
		if(src.Muramasa==2)
			var/obj/Items/Sword/othersword=P.EquippedSword()
			if(othersword&&!othersword.Shatterproof)
				if(P.SpiritSword&&P.SpiritLevel < 4)
					brk=1
				if(othersword.Keyblade&&P.KeybladeWielder&&P.KeybladeLevel<4)
					brk=1
				else if(P.WeaponSoul)
					if(P.WeaponSoul=="Holy"||P.WeaponSoul=="Corrupt"||P.WeaponSoul=="Dual")
						brk=1
					if(P.WeaponSoul=="Kusanagi")
						if(P.Kusanagi < 2)
							brk=1
					if(P.WeaponSoul=="Durendal")
						if(P.Durendal < 2)
							brk=1
					if(P.WeaponSoul=="Masamune")
						if(P.Masamune < 2)
							brk=1
					if(P.WeaponSoul=="Triple")
						if(!P.WeaponMaster)
							brk=1
					if(P.WeaponSoul=="Calibur")
						if(src.SoulCalibur < 2)
							brk=1
					if(P.WeaponSoul=="Edge")
						if(src.SoulEdge < 2)
							brk=1
					if(P.WeaponSoul=="Muramasa")
						if(src.Muramasa < 2)
							brk=1
				else
					brk=1
		if(brk)
			var/obj/Items/Sword/othersword=P.EquippedSword()
			src.OMessage(10, "[src]'s corrupt blade shatters [P]'s sword!", "[src]([src.key]) triggered Muramasa's effect on [P]([P.key]).")
			othersword.suffix=null
			P.SwordOverlays(othersword, "Remove")
			del othersword
		if(dork)
			var/obj/Items/Sword/othersword=P.EquippedSword()
			src.OMessage(10, "[src]'s righteous soul shatters [P]'s sword!", "[src]([src.key]) triggered UBW's effect on [P]([P.key]).")
			othersword.suffix=null
			P.SwordOverlays(othersword, "Remove")
			del othersword


		if(src.StandActive)
			if(prob(src.StandLevel*15))
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						if(!src.StandCried)
							E<<"<font color=[C.Text_Color]>[src.StandName] yells: <b>[src.StandCry]</b>!"
							src.StandCried=1
				Damage*=1.25
				Knock_Distance+=5
				spawn(30)
					src.StandCried=0
		if(src.SendoWaveKick)
			P.Knockback(3, src)
			Stun(P,amount=2)
			src.SendoWaveKick=0
			spawn(10)
				src.OMessage(10, "[src] infuses Hamon into their knee, thrusting it into [P]'s gut and stunning them!", "[src]([src.key]) triggered Sendo Wave Kick.")
		if(!Accuracy && P.Ryukansen)
			P.Ryukansen=0
			P.dir=ReturnDirection(P,src)//to face the enemy
			P.OMessage(10, "[P] gracefully sidesteps their foe and retaliates with a swift strike!", "[P]([P.key]) used Ryukansen.")
	/*		var/num = Damage/src.Power/(src.Strength*src.StrengthMultiplier)/(src.SpeedMod)
			num*=((src.Power)*(src.Strength*src.StrengthMultiplier)*(src.SpeedMod))*1.5*/
			P.StrVsEnd(src, 2.5)

		if(!Accuracy && P.CQCRestrain)
			src.Frozen=1
			P.Using=1
			P.Frozen=1
			P.CQCRestrain=0
			P.dir=ReturnDirection(P,src)//to face the enemy
			src.dir=ReturnDirection(src,P)//enemy faces you
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/cqchit2.ogg')
			sleep(7)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/cqchit1.ogg')
			sleep(7)
			P.CQCChokehold=1
			P.OMessage(10, "[P] skillfully backhands [src]'s attack, throwing it off-course, and moves in to grapple and firmly restrain them!", "[P]([P.key]) used CQC Restrain.")
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/thudswoosh.ogg')
			sleep(8)
			P.Grab(src)
			spawn(10)
			P.Frozen=0
			src.Frozen=0
			P.Using=0

		if(Accuracy && src.Chidori)
			if(P.UltraInstinct)
				AfterImageStrike(P,src)
				P.dir=ReturnDirection(P,src)//to face the enemy
				src.dir=ReturnDirection(src,P)//enemy faces you
				view(src)<<"[P] avoids [src]'s Chidori with nothing but raw instinct, making it dispell!"
				view(src)<<sound('KunaiMod/Sounds/migattedoge.ogg',wait=1)
				src.ChidoriHit=0
				src.Chidori=0
				src.ChidoriCharge=0
				src.ChidoriReady=0
				src.Using=0
				P.Using=0
				Stun(src,8)
				spawn()Rasengan_Check()
				spawn()Chidori_Check()
			if(P.SharinganLevel>2||P.Defense>src.Offense)
				P.dir=ReturnDirection(P,src)//to face the enemy
				src.dir=ReturnDirection(src,P)//enemy faces you
				view(src)<<"[P] nimbly avoids [src]'s Chidori, making it dispell!"
				src.ChidoriHit=0
				src.Chidori=0
				src.ChidoriCharge=0
				src.ChidoriReady=0
				src.Using=0
				P.Using=0
				spawn()Rasengan_Check()
				spawn()Chidori_Check()
				Stun(src,3)

		if(Accuracy && src.Rasengan)
			if(P.UltraInstinct)
				AfterImageStrike(P,src)
				P.dir=ReturnDirection(P,src)//to face the enemy
				src.dir=ReturnDirection(src,P)//enemy faces you
				view(src)<<"[P] avoids [src]'s Rasengan with nothing but raw instinct, making it dispell!"
				view(src)<<sound('KunaiMod/Sounds/migattedoge.ogg',wait=1)
				src.RasenganHit=0
				src.Rasengan=0
				src.RasenganCharge=0
				src.RasenganReady=0
				src.Using=0
				P.Using=0
				Stun(src,8)
				spawn()Rasengan_Check()
				spawn()Chidori_Check()
			if(P.SharinganLevel>2||P.Defense>src.Offense)
				P.dir=ReturnDirection(P,src)//to face the enemy
				src.dir=ReturnDirection(src,P)//enemy faces you
				view(src)<<"[P] nimbly avoids [src]'s Rasengan, making it dispell!"
				src.RasenganHit=0
				src.Rasengan=0
				src.RasenganCharge=0
				src.RasenganReady=0
				src.Using=0
				P.Using=0
				spawn()Rasengan_Check()
				spawn()Chidori_Check()
				Stun(src,2)

		if(!Accuracy && P.HiddenBlade)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/shieldblock.ogg')
			P.dir=ReturnDirection(P,src)//to face the enemy
			P.Using=1
			P.HiddenBlade=0
			P.Frozen=1
			src.Frozen=1
			P.OMessage(10, "[P] memely sidesteps their foe and retaliates with a swift... slash?!", "[P]([P.key]) used Hidden Blade (Counter).")
			P.OMessage(10, "--There's a blade hidden in their broom's body!")
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/k-ougi.ogg')
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in P) //P color = enemy i think, src = yours
					E<<"<font color=[C.Text_Color]>[P] yells: <b>Kohakuru Battoujutsu: Ougi!</b>"
			sleep(8)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/k-shing.ogg')
			sleep(8)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/slash.ogg')
			sleep(16)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/k-boom.ogg')
			src.TotalInjury+=45
			src.Knockback(15, P)
			src.Frozen=0
			Stun(src, 9)
			sleep(25)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/k-sheath.wav')
			P.OMessage(10, "<i>[P] subtly sheathes the hidden blade...</i>")
			P.Frozen=0
			P.Using=0
		if(!Accuracy && P.HiddenBlade2)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/shieldblock.ogg')
			P.dir=ReturnDirection(P,src)//to face the enemy
			P.Using=1
			P.HiddenBlade2=0
			P.Frozen=1
			src.Frozen=1
			P.OMessage(10, "[P] memely sidesteps their foe and retaliates with a swift whack?!", "[P]([P.key]) used Hidden Broom (Counter).")
			P.OMessage(10, "--This should hurt a lot!")
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/k-ougi.ogg')
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in P) //P = you
					E<<"<font color=[C.Text_Color]>[P] yells: <b>Kohakuru \"Non-Lethal\" Battoujutsu: Ougi!</b>"
			sleep(8)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/daggerslash.ogg')
			sleep(8)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/blunt.ogg')
			sleep(16)
			for(var/mob/E in hearers(12,src))
				E<<sound('KunaiMod/Sounds/k-boom.ogg')
			src.TotalFatigue+=45
			src.Knockback(15, P)
			src.Frozen=0
			Stun(src, 16)
			P.Frozen=0
			P.Using=0
		if(P.LifeHero)//if the defender is a hero of life and they dodge, they get healed
			if(!Accuracy)
				P.HealHealth(0.05*P.HeroLevel)
				if(P.Health > 100)
					P.Health=100
		if(src.MindHero)
			if(src.MindHits >= (7 - src.HeroLevel))
				Accuracy=100
				src.MindHits=0
		if(P.MindHero)
			if(!Accuracy)
				P.MindDodges++
		Attacking=1
	/*	if(src.client&&src.Energy<src.EnergyMax)
			if(src.AttackHardness==1&&src.ControlPower<=200)
				src.Energy+=rand(10,40)*0.05*src.EnergyMod
				if(src.Energy>EnergyMax)
					src.Energy=src.EnergyMax
			if(src.AttackHardness==2&&src.ControlPower<=200)
				src.Energy+=rand(10,40)*src.EnergyMod
				if(src.Energy>EnergyMax)
					src.Energy=src.EnergyMax
			if(src.AttackHardness==3&&src.ControlPower<=200) //heavy shot
				src.Energy+=rand(10,40)*src.EnergyMod*5
				if(src.Energy>EnergyMax)
					src.Energy=src.EnergyMax*/
		Melee_Graphics()
		var/icon/E=icon('Effects.dmi',"Shock")

		if((src.RipplePassive||src.HolyBlade)&&!P.Divine)
			var/holiness=1
			if(src.RipplePassive)
				holiness=src.RipplePassive
			if(src.HolyBlade)
				holiness=src.HolyBlade
				if(src.Masamune)
					holiness*=(src.Masamune+1)
			if(P.IsEvil())
				Damage*=(holiness+1)
				if(src.Masamune==2)
					var/amt=BlockDamage(P, Damage)
					src.HealHealth(amt/4)
					src.HealEnergy(amt/2)
		if(src.CorruptEdge&&!P.Divine)
			if(prob(40))
				P.Poison+=0.015
				P.Burning+=0.015
				spawn()P.Poisoned_Check()
				spawn()P.Burning_Check()

		if(src.Megiddo||src.EveningElephant)
			Accuracy=1
		if(src.BreathHero||src.KamuiShippu||src.SuperKamuiAscension||(src.InUBW&&src.MadeOfSwords))
			Delay/=10
		if(src.SuperHumanDrugTimer)
			Delay*=10
		if(src.CursedBeta=="Slow")
			Delay*=2
		if(src.DjinnMagic=="Lightning")
			Delay/=2
		if(src.LightningAura==1)
			if(prob(src.ZanzokenSkill/50))
				src.Comboz(P)
				Damage*=0.3
				Delay/=10
		if(src.AttackHardness==1)
			src.Comboz(P)
			Damage/=10
			Delay/=20
			Knock_Distance=0
		if(src.AttackHardness==4)
			Accuracy=1
			if(prob(10))
				KenShockwave(P)
			src.Comboz(P)
			Damage/=20
			Delay/=10
		if(!prob(Accuracy_Formula(src,P,WorldWhiffChance)&&!Tengenkotsu)||src.AttackHardness==1) //whiffing
			if(!src.HeavyShot&&!src.StrengthOfWill)
				Damage/=rand(3,7)
		if(P.KingCrimson)
			Damage=0
			P.Melee(2,2)
		if(P.Epitaph)
			if(prob(10))
				P.EpitaphUse=1
				Damage=0
				P.Melee(2,2)
		if(P.Frozen||P.Knockbacked||P.Stunned||src.Pursuiting)
			Accuracy=1
		if(P.Indomitable)
			P.Indomitable=0
			Quake(3)
			P.dir=ReturnDirection(P,src)//to face the enemy
			P.OMessage(10,"[P] stylishly blocks and nullifies [src]'s attack with a smirk!","<font color=red>[P]([P.key]) matadors [src].")
			view(P)<<sound('KunaiMod/Sounds/shieldblock.ogg')
			Stun(src,1)
			P.KarmaEnergy+=Damage
			P<<"Karma Energy: [KarmaEnergy]!!"
			Damage=0
		if(P.CounterBlock)
			P.CounterBlock=0
			P.OMessage(10,"[P] counters [src]'s attack!","<font color=red>[P]([P.key]) counters [src].")
			Damage=0
			P.Melee(1.5)
		else if(P.CounterParry)
			P.CounterParry=0
			Damage=0
			P.OMessage(10,"[P] parries [src]'s attack!","<font color=red>[P]([P.key]) parries [src].")
			src.Knockback(1,P,Direction=get_dir(P,src),KB_Damage=1)
			Stun(src,0.75)
		else if(P.SonicSway)
			Accuracy=0
			Damage=0
			if(P.SonicSway==1)
				SonicSway(P,src)
		if(src.StrengthOfWill)
			Accuracy=1
		if(Accuracy)
			if(src.AsaFireball)
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(locate(rand(P.x-5, P.x+5),rand(P.y-5, P.y+5), P.z))
				A.Distance=rand(20,60)
				A.Explosive=1
				A.Knockback=3
				A.dir=pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST)
				A.icon='Fireball.dmi'
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=5
				A.Offense=(src.Offense*src.OffenseMultiplier)*200
				A.Elemental="Fire"
//				A.Burning=1
				spawn if(A) walk(A,A.dir)
				src.AsaFireball-=1
				sleep(1)
			if(src.HeavyShot)
				//src.HeavyShot=0
				Quake(3)
				if(src.InUBW&&src.CounterGuardian)
					var/blades=rand(1,10)
					var/bladedamage=pick(0.25,0.5,1,1.5,2,2.5,3)
					spawn()while(blades)
						blades--
						var/obj/Projectiles/Mystical/A=new(locate(rand(P.x-5, P.x+5),rand(P.y-5, P.y+5), P.z))
						A.Distance=rand(20,60)
						A.Explosive=1
						A.Physical=1
						A.icon='SwordBlast2.dmi'
						A.icon_state=pick("1","2","3","4","5","6","7","8")
						A.Owner=src
						A.Damage_Multiplier=bladedamage
						A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*2
						spawn(30) if(A) spawn()Homing(A,P)
						if(prob(50))sleep(0.1)
						else if(prob(20))sleep(1)
				if(src.CursedBeta=="Empty")
					var/blades=rand(1,15)
					var/bladedamage=rand(1,5)
					spawn()while(blades)
						blades--
						var/obj/Projectiles/Mystical/A=new(locate(rand(src.x-3, src.x+3),rand(src.y-3, src.y+3), src.z))
						A.Distance=rand(20,60)
						A.Explosive=1
						A.Physical=1
						A.icon=pick('Demon1.dmi','Demon2.dmi','Demon4.dmi','Demon5.dmi','Demon6.dmi','Demon6Female.dmi','Demon7.dmi','Demon8.dmi','Demon9.dmi')
						A.Owner=P
						A.Damage_Multiplier=bladedamage
						A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*2
						spawn(10) if(A) spawn()Homing(A,src)
						if(prob(50))sleep(0.1)
						else if(prob(20))sleep(1)
//			if(P.MagmaArmor)
//				if(prob(50))
//					var/MagmaDamage=src.ResVsFor(P,GoCrand(0.5, 2))
//					var/MagmaDamage=(src.Power*src.GetRes())/(P.Power*P.GetFor())
//					if(MagmaDamage>2)
//						MagmaDamage=2
//					src.Health-=MagmaDamage
//					P.DoDamage(src,MagmaDamage)
			if(P.IceArmor)
				if(prob(75))
					src.Chilled+=0.5
					src.Chilled_Check()
			if(src.SunlightYellowOverdrive)
				if(src.ShinkuTatsumaki)
					for(var/mob/m in hearers(12, src))
						for(var/obj/Communication/c in src)
							m << "<font color=[c.Text_Color]>[src] says: <b>SENPUKYAKU!</b>"
				else
					for(var/mob/SYO in hearers(12,src))
						for(var/obj/Communication/C in src)
							SYO<<"<font color=[C.Text_Color]>[src] says: <b>SUNLIGHT YELLOW OVERDRIVE!</b>"
			if(P.HeartlessAngel)
				P.HeartlessAngel=0
// KOONAI //
			if(P.Amaterasu)
				P.Amaterasu=0
			if(P.SharinGen)
				P.SharinGen=0
			if(src.ChiBlock||src.Byakugan)
				if(prob(50))
					var/LockTime=(((src.Strength*src.StrengthMultiplier)+(src.Force*src.ForceMultiplier))/2)/(((P.Strength*P.StrengthMultiplier)+(P.Force/P.ForceMultiplier))/2)
					if(LockTime>5)
						LockTime=5
					P.ChiBlockTimer+=LockTime
					if(P.ChiBlockTimer>19)
						P.ChiBlockTimer=20
			if(src.SpiritOfWar)
				if(prob(100))
					var/Boys=((src.Strength*src.StrengthMultiplier)+(src.Force*src.ForceMultiplier))/(((P.Strength*P.StrengthMultiplier)+(P.Force/P.ForceMultiplier))/2)
					if(Boys>10)
						Boys=10
					src.SpiritCounter+=Boys
					if(src.SpiritCounter>100)
						src.SpiritCounter=100
			if(src.SuperHumanDrug)
				if(prob(80))
					var/Time=(((src.Strength*src.StrengthMultiplier)+(src.Force*src.ForceMultiplier))/2)/(((P.Strength*P.StrengthMultiplier)+(P.Force/P.ForceMultiplier))/2)
					if(Time>10)
						Time=10
					P.SuperHumanDrugTimer+=Time
					if(P.SuperHumanDrugTimer>50)
						P.SuperHumanDrugTimer=50
			if(iconoverlay)
				if(MultiPunch)
					var/image/ImageOverlay = iconoverlay
					var/pixelx = rand(10,25)
					var/pixely = rand(10,32)
					ImageOverlay.pixel_x = pixelx
					ImageOverlay.pixel_y = pixely
					P.overlays+=ImageOverlay
					spawn(5)P.overlays-=ImageOverlay
				P.overlays+=image(iconoverlay)
				spawn(20)P.overlays-=image(iconoverlay)
			if(src.Warp==1)
				Damage*=0.35
			else if(src.Warp==2 || forcewarp)
				Damage*=0.75
			else if(src.Warp==3)
				Damage*=0.95
			for(var/obj/Items/Shield/S in P) if(S.suffix)
				S.Durability-=(ShieldDamage/60)
				if(src.StrongestFistUnlocked)
					S.Durability=0
					P<<"The power of your fist shatters your shield...!"
				if(S.Durability<=1)
					S.Equip(P)
					P<< "Your shield broke!"
					del S
					P.contents+=new/obj/Items/Scraps
					for(var/obj/Items/Scraps/SS in P)
						SS.ScrapLevel+=4
			for(var/obj/Items/Armor/I in P) if(I.suffix)
				I.Durability-=(ArmorDamage/60)
				if(src.StrongestFistUnlocked)
					I.Durability=0
					P<<"The power of your fist shatters your armor...!"
				if(I.Durability<=1)
					I.Equip(P)
					P<< "Your armor broke!"
					del I
					P.contents+=new/obj/Items/Scraps
					for(var/obj/Items/Scraps/SS in P)
						SS.ScrapLevel+=4
			if(src.TheHunger)
				var/amt=Damage*0.15
				amt=BlockDamage(P, amt)
				src.HealHealth(amt)
			if(src.ElementAuraType=="Solar"||src.PathType=="Rejuvenation")
				Damage*=0.75
				var/amt=Damage*0.25
				if(amt > 5)
					amt=5
				src.HealHealth(amt)
			else if(src.ElementAuraType=="Lunar"||src.PathType=="Sacrifice")
				if(src.DiplomaticImmunity)
					Damage*=0
				var/recoil = Damage*0.15
				recoil = BlockDamage(src,recoil)
				if(P.ControlPower<=40)
					P.DoDamage(P, recoil)
				else
					src.DoDamage(src, recoil)
				Damage*=1.5
			else if(src.GateNumber>=4&&prob(30))
				var/recoil = Damage*0.1
				recoil = BlockDamage(src,recoil)
				if(P.ControlPower<=40)
					P.DoDamage(P, recoil)
				else
					src.DoDamage(src, recoil)
				Damage*=1.25
				Accuracy*=1.25
			else if(src.ElementalFist)// || (src.Race=="Pathless" && src.RedAscension))
				var/Fist=src.ElementalFist
/*				if(src.Race=="Pathless" && src.RedAscension && !src.ElementalFist)
					Fist="Fire"
					if(src.Race=="Pathless" && src.VioletAscension)
						if(prob(35))
							P.Poison+=0.01
							spawn()P.Poisoned_Check()*/
				var/FistDef=ElementalDef
				P.ElementalProc(Fist,FistDef)
			if(P.ElementAuraType=="Solar")
				P.Energy+=min((P.EnergyMod*(Damage/10)),50)
			if(src.ElementalFist=="Darkness")
				if(prob(40))
					Damage*=1.75*(100/src.Health)
					var/recoil=Damage*0.5
					recoil=BlockDamage(src, recoil)
					src.DoDamage(src,recoil)
			if(src.PathType=="Life")
				P.Dead=0
				P.overlays-='Halo.dmi'
			else if(P.ElementAuraType=="Lunar"||P.PathType=="Sacrifice")
				var/recoil = Damage*0.15
				recoil=BlockDamage(src,recoil)
				src.DoDamage(src, recoil)
			else if(src.WrathRevenge)
				if(prob(40))
					Damage*=1.75*(100/src.Health)
					var/recoil=Damage*0.5
					recoil=BlockDamage(src, recoil)
					src.DoDamage(src,recoil)
			for(var/obj/Items/Sword/S in src) if(S.suffix)
				if(P.WeaponBreaker && !src.HexaWield && !src.DualWield)
					Damage/=S.Damage_Multiplier
					Delay*=S.Delay_Multiplier
				if(S.EnchantType && !src.HexaWield)
					P.ElementalProc(S.EnchantType,ElementalDef)
					if(S.EnchantType=="Darkness")
						Damage*=1.5
						var/recoil=Damage*0.15
						recoil=BlockDamage(src, recoil)
						if(P.ControlPower<=40)
							P.DoDamage(P, recoil)
						else
							src.DoDamage(src, recoil)
					else if(S.EnchantType=="Ultima-Darkness")
						if(prob(40))
							Damage*=1.75*(100/src.Health)
							var/recoil=Damage*0.5
							recoil=BlockDamage(src, recoil)
							src.DoDamage(src,recoil)
					else if(S.EnchantType=="Light")
						Damage*=0.5
						var/amt=Damage*0.5
						if(amt > 4)
							amt=4
						src.HealHealth(amt)
					else if(S.EnchantType=="Poison")
						if(prob(15))
							P.Poison+=0.015
							spawn()P.Poisoned_Check()
					else if(S.EnchantType=="Fire")
						if(prob(15))
							P.Burning+=0.015
							spawn()P.Burning_Check()
					else if(S.EnchantType=="Water")
						if(prob(25))
							P.Chilled+=2
							spawn()P.Chilled_Check()
					else if(S.EnchantType=="Earth")
						if(prob(25))
							P.EndBreak+=2
							spawn()P.EnduranceBreak_Check()
					else if(S.EnchantType=="Wind")
						if(prob(10))
							P.ElecShock+=2
							P.Frozen=1
							spawn()P.ElecShock_Check()
					else if(S.EnchantType=="Holy...?")
						Damage=0.1
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('swordhit.wav', repeat = 0, wait = 0, channel = 0, volume = 50)

			for(var/obj/Items/BambooStaff/S in src) if(S.suffix)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('KunaiMod/Sounds/blunt.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)

			for(var/obj/Items/Dagger/S in src) if(S.suffix)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('KunaiMod/Sounds/daggerswing.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						X<<sound('KunaiMod/Sounds/daggerhit.ogg', repeat = 0, wait = 0, channel = 0, volume = 25)

			var/SexSex=BlockDamage(P,Damage)
	//		src<< "[Damage]"
			if(P.SpiralEndurance)
				if(prob(10))
					src.HealHealth(SexSex*0.25)
			if(P.Berserkering)
				if(prob(30))
					Damage*=(100/src.Health)
					var/recoil=SexSex*0.1
					recoil=BlockDamage(src, recoil)
					if(P.ControlPower<=40)
						P.DoDamage(P, recoil)
					else
						src.DoDamage(src, recoil)
			if(P.TranceObtained && P.TranceForm!=1)
				if(P.TranceCounter<30)
					if(prob(80))
						P.TranceCounter+=Damage/3
					if(P.TranceCounter>=30)
						P<<"Your Trance Counter has been refilled!"
				if(P.TranceCounter>=30)
					P.TranceCounter=30


			if(src.PathType=="Sacrifice")
				var/mult
				mult=5
				if(src.Health > 20)
					mult=4
				if(src.Health > 40)
					mult=3
				if(src.Health > 60)
					mult=2
				if(src.Health > 80)
					mult=1
				if(src.trans["unlocked"] >=1)
					var/multmulti
					multmulti=1
					if(P.Health < 80)
						multmulti=1.25
					if(P.Health < 60)
						multmulti=1.5
					if(P.Health < 40)
						multmulti=1.75
					if(P.Health < 20)
						multmulti=2
					mult*=multmulti
				Damage*=mult
			if(src.DiplomaticImmunity || P.DiplomaticImmunity)
				Damage*=0
			if(P.Baleful)
				var/fag=BlockDamage(src, Damage)
				src.Health-=fag/2
				Damage*=0

			if(src.TimeHero)
				src.TimeHits++
				if(src.TimeHits>(10/(max(1, src.HeroLevel/2))))
					src.TimeHits=0
					Damage*=2//temporary fix
					//spawn time clone

			if(P.SpaceHero)
				P.SpaceHits++
				var/spc=BlockDamage(src, Damage)
				P.SpaceDamage+=spc
				if(P.SpaceHits >= (7 - P.HeroLevel))
					P.Health+=(P.SpaceDamage/2)
					P.SpaceDamage=0
					P.SpaceHits=0
					if(P.Health > 100)
						P.Health=100

			if(src.BloodHero)
				if(src.BloodSport)
					src.Health+=(0.01*src.HeroLevel)*3
					src.Energy+=(0.001*src.EnergyMax*src.HeroLevel)*3
					if(src.Health > 100)
						src.Health=100
					if(src.Energy > src.EnergyMax)
						src.Energy=src.EnergyMax
				else
					src.Health+=(0.01*src.HeroLevel)
					src.Energy+=(0.001*src.EnergyMax*src.HeroLevel)
					if(src.Health > 100)
						src.Health=100
					if(src.Energy>src.EnergyMax)
						src.Energy=src.EnergyMax

			if(src.LightHero)
				var/roll1 = roll("1d6") * src.SpeedMod * src.SpeedMultiplier
				var/roll2 = roll("1d6") * P.SpeedMod * P.SpeedMultiplier
				src.LightLuck+=(roll1-roll2)*src.HeroLevel
				if(src.LightLuck > 200)
					src.LightLuck=200
				if(src.LightLuck < 50)
					src.LightLuck=50
			if(P.LightHero)
				var/roll1 = roll("1d6") * P.SpeedMod * P.SpeedMultiplier
				var/roll2 = roll("1d6") * src.SpeedMod * src.SpeedMultiplier
				P.LightLuck+=(roll1-roll2)*P.HeroLevel
				if(P.LightLuck > 200)
					P.LightLuck=200
				if(P.LightLuck < 50)
					P.LightLuck=50
			if(src.LightHero)
				Damage*=(src.LightLuck/100)

			if(src.VoidHero)
				var/roll1 = roll("1d6") * ((src.Endurance * src.EnduranceMultiplier)/2) * ((src.Resistance * src.ResistanceMultiplier)/2)
				var/roll2 = roll("1d6") * ((P.Endurance * P.EnduranceMultiplier)/2) * ((P.Resistance * P.ResistanceMultiplier)/2)
				src.VoidPain+=(roll1-roll2)*src.HeroLevel
				if(src.VoidPain > 200)
					src.VoidPain=200
				if(src.VoidPain < 50)
					src.VoidPain=50
			if(P.VoidHero)
				var/roll1 = roll("1d6") * ((P.Endurance * P.EnduranceMultiplier)/2) * ((P.Resistance * P.ResistanceMultiplier)/2)
				var/roll2 = roll("1d6") * ((src.Endurance * src.EnduranceMultiplier)/2) * ((src.Resistance * src.ResistanceMultiplier)/2)
				P.VoidPain+=(roll1-roll2)*P.HeroLevel
				if(P.VoidPain > 200)
					P.VoidPain=200
				if(P.VoidPain < 50)
					P.VoidPain=50
			if(P.VoidHero)
				if(src.VoidPain<50)
					src.VoidPain=50
				Damage/=(src.VoidPain/100)
			if(src.MindHero)
				src.MindHits++
			if(src.HopeHero)
				Damage*=1+(((src.ControlPower/100)-1)/5*src.HeroLevel/3)
			if(src.DeathTolls)
				Damage*=3
			if(src.HopeHarpoon)
				src.ControlPower+=min(Damage*src.HeroLevel, 5)
				P.ControlPower-=min(Damage*src.HeroLevel, 5)

			if(P.DemonEnergyShield)
				if(src.kiblade || src.SpiritSword)
					var/amt=BlockDamage(P, Damage)
					P.HealHealth(amt*1.5)
					if(P.Health > 100)
						P.Health = 100

			if(src.Ryutsuisen)
				src.Ryutsuisen=0
				Damage*=2
				src.OMessage(10,"[src] leaps into the air and uses the fall to strengthen their blow!", "[src]([src.key]) used Ryutsuisen.")
			if(src.Ryushosen)
				src.Ryushosen=0
				Damage*=1.5
				src.OMessage(10, "[src] slams the side of their sword into [P]'s chin, briefly stunning them!", "[src]([src.key]) used Ryushosen.");
				P.Knockback(1, src)
				Stun(P, 3)

			if(src.JuggernautMode)
				Damage*=0.75
				src.Energy-=Damage*10

			if(src.TurtleCannonMode)
				Damage*=0.25
				src.Energy-=Damage*100

			if(src.HeavyDrain)
				P.Energy-=Damage

			if(src.SatsuiFist)
				if(prob(40))
					Damage*=1.75*(100/src.Health)

			if(src.ShoryukenCount)
				if(src.AmatsukenAscension=="Satsui no Hado")
					Damage*=1.25
				if(src.AmatsukenAscension=="Chikara no Hado")
					if(prob(10))
						P.Frozen=1
						spawn(20)
							P.Frozen=0
				if(src.SatsuiNoHado)
					P.Poisoned+=0.1
				if(src.ShoryukenBurn)
					P.Burned+=0.1
				if(src.ShoryukenQuake)
					spawn()src.Quake(10)
					src.ShoryukenQuake=0
				if(src.Shoryureppa)
					Damage*=1.25
				switch(src.AmatsukenPath)
					if("Hadoken")
						Damage*=0.75
					if("Shoryuken")
						Damage*=1.1
					if("Tatsumaki")
						Damage*=0.9

			if(src.AdvancedStance=="Empty Fist")
				var/amt=Damage*0.25
				amt=BlockDamage(P, amt)
				src.HealHealth(amt)
			if(P.AdvancedStance=="Empty Fist")
				var/amt = P.EnergyMax*Damage/10
				amt=BlockDamage(P, amt)
				P.HealEnergy(amt)

			if(src.AttackHardness==1&&src.ComboPlus)
				Damage/=10
				src.ComboPlusNumber+=1
			if(src.ShutUp)
				src.ShutUp=0
				Damage*=1.5
				for(var/mob/m in hearers(12, src))
					for(var/obj/Communication/c in src)
						m << "<font color='#FF0000'>[src] roars: <b>SHUT UP!</b></font color>"
				src.OMessage(10, "<font color='#FF0000'>[src] drives their fist deeply into [src.Target]'s face!!!</font color>", "[src] is still using Shut Them Up.")
				P.Frozen=1
				spawn(20)
					P.Frozen=0
		/*	if(src.HealingRipple)
				Damage*=(-1)*/
			if(axekick==1&&!src.GetDunked&&!src.JumpyPunch&&!SwordFighting)
				Damage*=((src.SpeedMod)/2)
				src.OMessage(10, "[src] brings their heel down in a mighty axe kick!", "[src]([src.key]) used Axe Kick.");
				src.axekick=0
		//	world<<"[P] took [Damage] damg!"
			if(P.WildSense>0)
				WildSense(P,src)
			else if(P.AfterImageStrike>0)
				AfterImageStrike(P,src)
			else
				if(Fatal_Mode)
					Damage*=2
				var/Final_Damage=BlockDamage(P,Damage)

				if(P.Health-Final_Damage<=P.AngerThreshold&&!P.Anger&&!P.Mystic)
					P.Anger()
					Final_Damage/=P.AngerMax
				var/canHeal
				if(P.Health>20&&!P.WillHealed)
					canHeal=1
				if(P.WillTriggered)
					if(P.Willpower<3)
						Final_Damage*=0.5
					else
						Final_Damage*=0.2
				if(!src.HealingRipple)
					if(src.WoundIntent)
						if(Final_Damage>20)
							Injure(P,20)
						else
							Injure(P,Final_Damage)
				if(src.Masamune&&!(P.IsEvil()))
					P.HealHealth(Final_Damage)
					if(src.Masamune==2)
						P.HealHealth(Final_Damage)
				else
					if(src.SoulEdge)
						if(src.SoulEdge==1)
							Final_Damage*=1.35
							src.DoDamage(src, 0.25)
							if(prob(20))
								src.HealHealth(Final_Damage/2)
						if(src.SoulEdge==2)
							Final_Damage*=1.5
							src.DoDamage(src, 0.75)
							if(prob(20))
								src.HealHealth(Final_Damage)
					if(P.SoulCalibur)
						Final_Damage=P.SoulCaliburChecks(Final_Damage)
					src.DoDamage(P, Final_Damage) //melee dmg
					if(src.ChiBlock||src.Byakugan)
						if(prob(50))
							P.ControlPower-=(Final_Damage*7)
							if(P.ControlPower<100)
								P.ControlPower=100
					if(src.ReactiveCuirass)
						src.Health-=Final_Damage/10
					if(P.MagmaArmor)
						if(prob(50))
		//					var/MagmaDamage=src.ResVsFor(P,GoCrand(0.5, 2))
							var/MagmaDamage=Final_Damage/10
							if(MagmaDamage>2)
								MagmaDamage=2
							src.Health-=MagmaDamage
				if(src.Muramasa==2)
					var/hp=Final_Damage/4
					if(hp>5)
						hp=5
					var/mp=hp*(src.EnergyMax/100)
					src.HealHealth(hp)
					src.HealEnergy(mp)
				if(src.Durendal)
					var/dmg=Final_Damage/2
					dmg=min(2.5, dmg)
					src.HealHealth(dmg)
				if(src.Headbutt)
					src.DoDamage(src, Final_Damage*(2/100))
					src << "You take recoil from using your head as a battering ram."
					src.Headbutt=0
				if(src.HealingRipple)
					P.HealHealth(Final_Damage*2)
				if(P.Willpower==5&&P.Health<=15&&!P.WillGER)
					P.OMessage(10, "[P] is on their last legs, but they're just getting started!", "[P]([P.key]) triggered Willpower 5.");
					P.WillGER=1
					P.GER=1
					spawn(150)
						P.GER=0
				if(P.Willpower>=4&&P.Health<=20)
					var/chance
					if(P.Willpower==4)
						chance=5
					if(P.Willpower==5)
						chance=10
					if(prob(chance))
						P.Comboz(src)
						P.AttackHardness=3
						P.HeavyShot=1
						P.Melee(1,1)
				if(P.Willpower&&!P.WillSpeed)
					if(P.Willpower>=4&&P.Health<=10)
						P.WillSpeed=1
					if(P.Willpower>=2&&P.Health<=5)
						P.WillSpeed=1
				if(P.Willpower&&!P.WillHealed&&canHeal&&P.Health<=20)
					P.WillHealed=1
					P.HealHealth(P.TotalInjury)
				if(P.Willpower&&!P.WillTriggered)
					if(P.Willpower<3)
						P.OMessage(10, "[P] may be barely standing, but they keep pushing forward!", "[P]([P.key]) triggered Willpower.")
						P.WillTriggered=1
						P.Health=7
					else
						P.OMessage(10, "[P] is on their last legs...but they won't go down easily!", "[P]([P.key]) triggered Willpower.")
						P.WillTriggered=1
						P.Health=10
				if(SwordFighting)
					Slash(P)
				else if(StaffFighting)
					StaffEffect(P)
			//	else if(SaberFighting)
			//		SaberEffect(P)
				else
					HitEffect(P)
				if(P.MPRage)
					if(P.PowerUp)
						if(P.HasKeyblade("Light", 4)&&P.DiveWeapon=="Staff"||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
							if(P.ControlPower < 400)
								P.ControlPower+=Damage/2
							else
								P.Energy+=Damage/15*(P.EnergyMax/35)
							if(P.Energy>P.EnergyMax)
								P.Energy=P.EnergyMax
						else
							if(P.ControlPower < 300)
								P.ControlPower+=Damage/2
							else
								P.HealEnergy(Final_Damage/20*(P.EnergyMax/50))
							if(P.Energy>P.EnergyMax)
								P.Energy=P.EnergyMax
					else
						if(P.HasKeyblade("Light", 4)&&P.DiveWeapon=="Staff"||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
							P.HealEnergy(Final_Damage/5*(P.EnergyMax/20))
							if(P.Energy>P.EnergyMax)
								P.Energy=P.EnergyMax
						else
							P.HealEnergy(Final_Damage/10*(P.EnergyMax/35))
							if(P.Energy>P.EnergyMax)
								P.Energy=P.EnergyMax

				if(src.RageHero)
					if(src.Anger>1)
						if(src.Anger < src.RageMax)
							src.Anger+=(0.02*(max(1, src.HeroLevel/2)))
							if(src.Anger > src.RageMax)
								src.Anger=src.RageMax
				if(P.RageHero)
					if(P.Anger>1)
						if(P.Anger < P.RageMax)
							P.Anger+=(0.02*(max(1, P.HeroLevel/2)))
							if(P.Anger > P.RageMax)
								P.Anger=P.RageMax

				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						src.HitSounds(Damage)
				//P.Hit_Sparks("Normal")
				if(Damage > 5)
					if(AttackHardness!=4)
						spawn()KenShockwave(P,Size=Damage/5)
					if(AttackHardness==4)
						if(prob(30))
							spawn()KenShockwave(P,Size=Damage/5)
					var/QuakeIntensity=Damage
					if(QuakeIntensity>24)
						QuakeIntensity=24
					P.Earthquake(QuakeIntensity,-4,4,-4,4)
				if(P.KO&&P.Health<=-5 && src.Lethal)
					P.Death(src,null,Damage)

				if(src.HeavyShot||(Damage>=3 && !Tengenkotsu)||(Tengenkotsu && !UsingFist)||src.GokuDragonFist||src.GetDunked||src.JumpyPunch||src.EveningElephant||src.AttackHardness==4||src.StrengthOfWill||src.Rasengan||src.Raikiri||src.Chidori)
					if(Tengenkotsu && !UsingFist)
						P.Tengenkotsued=1
						Knock_Distance=100
						LightningFlash(P)
						spawn()Shockwave(E,1)
						Tengenkotsu=0
						if(src.DiplomaticImmunity || P.DiplomaticImmunity)
							Damage*=0
						spawn()src.DoDamage(P,Final_Damage*100)

					if(src.Chidori)
						if(P.SharinganLevel>2||P.Defense>src.Offense)
							P.dir=ReturnDirection(P,src)//to face the enemy
							src.dir=ReturnDirection(src,P)//enemy faces you
							view(src)<<"[P] nimbly avoids [src]'s Chidori, making it dispell!"
							src.ChidoriHit=0
							src.Chidori=0
							src.ChidoriCharge=0
							src.ChidoriReady=0
							Stun(src,2)
							spawn()Rasengan_Check()
							spawn()Chidori_Check()
							return
						if(P.UltraInstinct)
							AfterImageStrike(P,src)
							P.dir=ReturnDirection(P,src)//to face the enemy
							src.dir=ReturnDirection(src,P)//enemy faces you
							view(src)<<"[P] avoids [src]'s Chidori with nothing but raw instinct, making it dispell!"
							view(src)<<sound('KunaiMod/Sounds/migattedoge.ogg',wait=1)
							src.ChidoriHit=0
							src.Chidori=0
							src.ChidoriCharge=0
							src.ChidoriReady=0
							Stun(src,8)
							spawn()Rasengan_Check()
							spawn()Chidori_Check()
							return
						else
							view(src)<<"[src] slams the Chidori on [P]'s torso as the concentrated energy of pure lightning eletrocutes them apart in a devastating blow!!"
							src.icon_state="Attack"
							P.overlays+=image('KunaiMod/Icons/chidorihit.dmi',pixel_x=-18,pixel_y=-18)
							P.ChidoriHit=1
						var/ChidoriRepeat=2
						var/Distance=5
						while(ChidoriRepeat)
							spawn()Shockwave(E,1)
							if(P.Chidori)
								src.TotalInjury+=2.25
							P.TotalInjury+=2.25
							if(P.Chidori)
								src.TotalFatigue+=5
							P.TotalFatigue+=5
							Quake(5)
							sleep(5)
							ChidoriRepeat--
							if(ChidoriRepeat==0)
								while(Distance)
									step(src,src.dir)
									src.density=0
									Distance--
									sleep(10)
								LightningFlash(P)
								spawn()Shockwave(E,1)
								ChidoriCharge=0
								ChidoriReady=0
								Chidori=0
								spawn()Rasengan_Check()
								spawn()Chidori_Check()
								src.icon_state=""
								if(src.DiplomaticImmunity || P.DiplomaticImmunity)
									Damage*=0
								spawn()src.DoDamage(P,Final_Damage*100)
								P.overlays-=image('KunaiMod/Icons/rasenganhit.dmi',pixel_x=-18,pixel_y=-18)
								P.overlays-=image('KunaiMod/Icons/chidorihit.dmi',pixel_x=-18,pixel_y=-18)
								src.overlays-=image('KunaiMod/Icons/rasenganhit.dmi',pixel_x=-18,pixel_y=-18)
								src.overlays-=image('KunaiMod/Icons/chidorihit.dmi',pixel_x=-18,pixel_y=-18)

					if(src.Rasengan)
						if(P.Raikiri||P.SharinganLevel>2||P.Defense>src.Offense)
							P.dir=ReturnDirection(P,src)//to face the enemy
							src.dir=ReturnDirection(src,P)//enemy faces you
							view(src)<<"[P] nimbly avoids [src]'s Rasengan, making it dispell!"
							src.RasenganHit=0
							src.Rasengan=0
							src.RasenganCharge=0
							src.RasenganReady=0
							Stun(src,2)
							spawn()Rasengan_Check()
							spawn()Chidori_Check()
							return
						if(P.UltraInstinct)
							AfterImageStrike(P,src)
							P.dir=ReturnDirection(P,src)//to face the enemy
							src.dir=ReturnDirection(src,P)//enemy faces you
							view(src)<<"[P] avoids [src]'s Rasengan with nothing but raw instinct, making it dispell!"
							view(src)<<sound('KunaiMod/Sounds/migattedoge.ogg',wait=1)
							src.RasenganHit=0
							src.Rasengan=0
							src.RasenganCharge=0
							src.RasenganReady=0
							Stun(src,8)
							spawn()Rasengan_Check()
							spawn()Chidori_Check()
							return
						else
							view(src)<<"[src] slams the Rasengan on [P]'s torso as the sphere blasts and expands immensely, spinning violently!!"
							src.icon_state="Attack"
							P.overlays+=image('KunaiMod/Icons/rasenganhit.dmi',pixel_x=-18,pixel_y=-18)
							P.RasenganHit=1
						var/RasenganRepeat=5
						while(RasenganRepeat)
							spawn()Shockwave(E,1)
							if(P.Rasengan)
								src.TotalInjury+=2.25
							P.TotalInjury+=2.25
							if(P.Rasengan)
								src.TotalFatigue+=5
							P.TotalFatigue+=5
							Quake(15)
							sleep(10)
							RasenganRepeat--
							if(RasenganRepeat==0)
								Knock_Distance=50
								LightningFlash(P)
								spawn()Shockwave(E,1)
								P.TotalInjury+=2
								P.TotalFatigue+=5
								RasenganCharge=0
								RasenganReady=0
								Rasengan=0
								spawn()Rasengan_Check()
								spawn()Chidori_Check()
								src.icon_state=""
								if(src.DiplomaticImmunity || P.DiplomaticImmunity)
									Damage*=0
								spawn()src.DoDamage(P,Final_Damage*100)
								P.overlays-=image('KunaiMod/Icons/rasenganhit.dmi',pixel_x=-18,pixel_y=-18)
								P.overlays-=image('KunaiMod/Icons/chidorihit.dmi',pixel_x=-18,pixel_y=-18)
								src.overlays-=image('KunaiMod/Icons/rasenganhit.dmi',pixel_x=-18,pixel_y=-18)
								src.overlays-=image('KunaiMod/Icons/chidorihit.dmi',pixel_x=-18,pixel_y=-18)
					if(src.GokuDragonFist)
						P.GokuDragonFisted=1
						Knock_Distance=50
						spawn()Shockwave(E,1)
						GokuDragonFist=0
						if(src.DiplomaticImmunity || P.DiplomaticImmunity)
							Damage*=0
						spawn()src.DoDamage(P,Final_Damage*50)
					if(src.EveningElephant)
						P.Tengenkotsued=1
						Knock_Distance=100
						spawn()Shockwave(E,1)
						for(var/mob/EE in hearers(12,src))
							for(var/obj/Communication/C in src)
								EE<<"<font color=[C.Text_Color]>[src] says: <b>EVENING ELEPHANT - FIRST STEP!</b>"
					if(src.GetDunked)
						for(var/turf/A in oview(src,2))
							A.CreateExplosion()
						src.GetDunked=0
						src.Energy*=0.95
					if(src.ExplosionExpert)
						for(var/turf/A in oview(src,2))
							A.CreateExplosion()
					if(src.JumpyPunch)
						for(var/turf/A in oview(src,2))
							A.CreateExplosion()
						Quake(15)
						src.JumpyPunch=0
					if(src.StrengthOfWill)
						for(var/turf/A in oview(src,2))
							A.CreateExplosion()
						Knock_Distance=30
						src.StrengthOfWill=0
					if(src.KingCrimson)
						for(var/turf/A in oview(src,2))
							A.CreateExplosion()
						src.KingCrimson=0
					if(src.EpitaphUse)
						for(var/turf/A in oview(src,2))
							A.CreateExplosion()
						src.EpitaphUse=0
					P.Knockback(Knock_Distance,src)



				if(Megiddo)
					var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
					A.Distance=30//sqrt(Z.Level)*4
					A.x=P.x
					A.y=P.y+5
					A.z=P.z
					A.dir=SOUTH
					A.icon='Megiddo.dmi'
					A.Radius=1
					A.Divide=1
					A.Explosive=1
					A.Deflectable=1
					A.Dodgeable=1
					A.Knockback=1
					A.Physical=1
					A.Lethality=src.Lethal
				//	A.icon_state=Z.sicon_state
					A.Owner=src
					A.Damage_Multiplier=25
					A.Offense=(src.Offense*src.OffenseMultiplier)*3
					for(var/turf/T in Turf_Circle(A,8))
						if(prob(1)) sleep(0.005)
						if(prob(15))
							spawn(rand(4,8)) ReplaceLava(T)
						spawn(rand(4,8)) Destroy(T)
				//		if(prob(10))sleep(0.1)
					sleep(10)
					while(A)
						if(!src)break
						step(A,SOUTH)
						sleep((1/src.SpeedMod))
						if(A) spawn()Homing(A,P)
					src.Megiddo=0

				while(src.SunlightYellowOverdrive)
					src.Frozen=1
					P.Frozen=1
					LightningFlash(P)
					if(src.dir==NORTH||src.dir==SOUTH)
						src.x=P.x+rand(-1,1)
					else if(src.dir==EAST||src.dir==WEST)
						src.y=P.y+rand(-1,1)
					src.z=P.z
					if(prob(40))
						spawn()Shockwave(E,1)
					src.StrVsEnd(P, 1.25)
					src.SunlightYellowOverdrive-=1
					if(src.SunlightYellowOverdrive==0)
						src.SunlightFinal=1
					flick("Attack",src)
					sleep(2)
				if(src.SunlightFinal)
					P.Knockback(20,src)
					src.StrVsEnd(P, 5)
					P.Frozen=0
					src.Frozen=0
					src.SunlightFinal=0
				while(src.AsaKujaku)
					src.Frozen=1
					P.Frozen=1
					src.z=P.z
					if(prob(40))
						spawn()Shockwave(E,1)
					src.StrVsEnd(P, 0.75)
					src.AsaKujaku-=1
					src.AsaFireball+=3
					if(src.AsaKujaku==0)
						src.AsaKujakuFinal=1
					if(prob(25))
						P.Burning+=0.15
						spawn()P.Burning_Check()
					flick("Attack",src)
					P.overlays+=image('FireAuraBurst.dmi',,pixel_x=-48)
					sleep(1)
				if(src.AsaKujakuFinal && !UsingFist)
					P.AsaKujakuued=1
					Knock_Distance=100
					LightningFlash(P)
					spawn()Shockwave(E,1)
					src.AsaKujakuFinal=0
					if(src.DiplomaticImmunity || P.DiplomaticImmunity)
						Damage*=0
					spawn()P.Health-=Damage*10
					src.Frozen=0
					P.Frozen=0
					P.overlays-=image('FireAuraBurst.dmi',,pixel_x=-48)
				while(src.NineLives)
					src.Frozen=1
					P.Frozen=1
					LightningFlash(P)
					src.Comboz(P)
					if(prob(40))
						spawn()Shockwave(E,1)
					src.StrVsEnd(P, 3)
					src.NineLives-=1
					if(src.NineLives==0)
						src.NineLivesFinal=1
					flick("Attack",src)
					sleep(2)
				if(src.NineLivesFinal)
					P.Knockback(45,src)
					P.Frozen=0
					src.Frozen=0
					src.NineLivesFinal=0
				while(src.XStrike)
					src.Frozen=1
					P.Frozen=1
					LightningFlash(P)
					src.Comboz(P)
					if(prob(40))
						spawn()Shockwave(E,1)
					src.StrVsRes(P, 3)
					src.XStrike-=1
					if(src.XStrike==0)
						src.XStrikeFinal=1
					flick("Attack",src)
					sleep(2)
				if(src.XStrikeFinal)
					P.Knockback(45,src)
					P.Frozen=0
					src.Frozen=0
					src.XStrikeFinal=0
				if(src.Soryusen)
					src.OMessage(10, "[src] swings their sheath ahead of their sword!", "[src]([src.key]) used Shoryusen.")
					flick("Attack", src)
					src.StrVsEnd(P, 3)
					src.Comboz(P)
					src.OMessage(10, "[src] follows up their previous attack with a slash from their sword at the enemy's back!", "[src]([src.key]) used Shoryusen.")
					flick("Attack", src)
					src.StrVsEnd(P, 5)
					src.Soryusen=0
				if(src.OverdriveBarrage)
					src.OMessage(10, "[src] throws a series of overwhelming overdrives, striking [P] around like a pinball!", "[src]([src.key] triggered Overdrive Barrage!")
					src.Frozen=1
					P.Frozen=1
					flick('Dodge.dmi', src)
					src.Comboz(P)
					while(src.OverdriveBarrage > 0)
						if(src.OverdriveBarrage==1)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>OVER--</b>"
									src.Comboz(P)
						if(src.OverdriveBarrage==2)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>DRIVE!!!</b>"
									src.Comboz(P)
						if(src.OverdriveBarrage==3)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>BA--</b>"
									src.Comboz(P)
						if(src.OverdriveBarrage==4)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>RAGE!!</b>"
									src.Comboz(P)
						if(src.OverdriveBarrage==5)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>COMBO!!</b>"
									src.Comboz(P)
									src.Shockwave(E, 1)

						flick("Attack", src)
						P.Knockback(3, src)
						src.StrVsEnd(P, rand(1,5))
						if(src.OverdriveBarrage < 5)
							src.OverdriveBarrage++
						else
							src.OverdriveBarrage=0
						sleep(3)
					src.Frozen=0
					P.Frozen=0
				if(src.Kuzuryusen)
					src.OMessage(10, "[src] strikes at blinding speeds, overwhelming [P] with unreadable attacks!", "[src]([src.key]) used Kuzuryusen.")
					src.Frozen=1
					P.Frozen=1
					flick('Dodge.dmi', src)
					while(src.Kuzuryusen > 0)
						flick("Attack", src)
						flick('Dodge.dmi', src)
						src.ComboX(P)
						if(src.Kuzuryusen==1)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>Karatake Strike!</b>"
									e<<sound('KunaiMod/Sounds/slash.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						if(src.Kuzuryusen==2)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>Sakagesagiri Strike!</b>"
									e<<sound('KunaiMod/Sounds/slash.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						if(src.Kuzuryusen==3)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>Miginagi Strike!</b>"
									e<<sound('KunaiMod/Sounds/slash.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						if(src.Kuzuryusen==4)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>Migikiriage Strike!</b>"
									e<<sound('KunaiMod/Sounds/slash.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						if(src.Kuzuryusen==5)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>Sakakaze Strike!</b>"
									e<<sound('KunaiMod/Sounds/slash.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						if(src.Kuzuryusen==6)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>Hidarikiriage Strike!</b>"
									e<<sound('KunaiMod/Sounds/slash.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						if(src.Kuzuryusen==7)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>Hidarinagi Strike!</b>"
									e<<sound('KunaiMod/Sounds/slash.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						if(src.Kuzuryusen==8)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>Kesagiri Strike!</b>"
									e<<sound('KunaiMod/Sounds/slash.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						if(src.Kuzuryusen==9)
							for(var/mob/e in hearers(12,src))
								for(var/obj/Communication/C in src)
									e<<"<font color=[C.Text_Color]>[src] yells: <b>Shitotsu Strike!</b>"
									e<<sound('KunaiMod/Sounds/impact1.ogg', repeat = 0, wait = 0, channel = 0, volume = 50)
						src.StrVsEnd(P, rand(1, 4))
						if(src.Kuzuryusen < 9)
							src.Kuzuryusen++
						else
							src.Kuzuryusen=0
						sleep(3)
					src.Frozen=0
					P.Frozen=0

				if(src.SixFourPalms)
					if(src.Byakugan==0)
						src<<"Nigga, where's your Byakugan?! You can't see shit without your Byakugan!"
						src.SixFourPalms=0
						src.Using=0
						return
					else
						src.OMessage(10, "[src] dashes forth, white eyes glaring at [P]'s internal spiritual flow!", "[src]([src.key]) used 8 Trigrams 64 palms.")
						var/obj/Effects/Extra/SixFour/SE2=new
						SE2.loc=P.loc
						src.Frozen=1
						src.Grabbable=0
						P.Frozen=1
						P.Grabbable=0
						for(var/mob/e in hearers(12,src))
							for(var/obj/Communication/C in src)
								e<<"<font color=[C.Text_Color]>[src] yells: <b>--Eight Trigrams...</b>"
						while(src.SixFourPalms > 0)
							HitEffect(P)
							HitEffect(P)
							flick("Attack", src)
							src.ComboX(P)
							P.Energy-=1.65
							P.TotalFatigue+=1.25
							src.TotalFatigue+=0.65
							P.Health-=0.25
							P.TotalInjury+=0.05
							view(src)<<sound('KunaiMod/Sounds/daggerswing.ogg', wait=0)
							view(src)<<sound('KunaiMod/Sounds/taphit.ogg', volume=50, wait=0)
							if(src.SixFourPalms==2)
								for(var/mob/e in hearers(12,src))
									for(var/obj/Communication/C in src)
										e<<"<font color=[C.Text_Color]>[src] yells: <b>2 palms!</b>"
							if(src.SixFourPalms==4)
								for(var/mob/e in hearers(12,src))
									for(var/obj/Communication/C in src)
										e<<"<font color=[C.Text_Color]>[src] yells: <b>4 palms!</b>"
							if(src.SixFourPalms==8)
								for(var/mob/e in hearers(12,src))
									for(var/obj/Communication/C in src)
										e<<"<font color=[C.Text_Color]>[src] yells: <b>8 palms!</b>"
							if(src.SixFourPalms==16)
								for(var/mob/e in hearers(12,src))
									for(var/obj/Communication/C in src)
										e<<"<font color=[C.Text_Color]>[src] yells: <b>16 palms!</b>"
							if(src.SixFourPalms==32)
								for(var/mob/e in hearers(12,src))
									for(var/obj/Communication/C in src)
										e<<"<font color=[C.Text_Color]>[src] yells: <b>32 palms!</b>"
							if(src.SixFourPalms==64)
								for(var/mob/e in hearers(12,src))
									for(var/obj/Communication/C in src)
										e<<"<font color=[C.Text_Color]>[src] yells: <b>64 palms!!</b>"
							if(src.SixFourPalms < 64)
								src.SixFourPalms+=1
							else
								view(src)<<sound('KunaiMod/Sounds/impact1.ogg')
								spawn()Shockwave(E,1)
								P.Knockback(8,src)
								del SE2
								src.Frozen=0
								P.Frozen=0
								P.Grabbable=1
								src.Grabbable=1
								src.SixFourPalms=0
							sleep(1.5)

				if(src.MemeHomerun)
					for(var/mob/e in hearers(12,src))
						e<<sound('KunaiMod/Sounds/taphit.ogg')
					src.OMessage(10, "[src] bops [P]'s nose with the butt of their broom, briefly stunning them!")
					src.Frozen=1
					src.Using=1
					P.Frozen=1
					P.Grabbable=0
					src.Grabbable=0
					src.Comboz(P)
					for(var/mob/e in hearers(12,src))
						e<<sound('KunaiMod/Sounds/nanayaspecial.ogg')
					for(var/mob/e in hearers(12,src))
						e<<sound('KunaiMod/Sounds/charge.ogg')
					for(var/mob/e in hearers(12,src))
						e<<"[src] holds their broom like a bat and winds up..."
					src.ComboX(P)
					sleep(12)
					for(var/mob/e in hearers(12,src))
						for(var/obj/Communication/C in src)
							e<<"<font color=[C.Text_Color]>[src] yells: <b>Soiyaa!!</b>"
					for(var/mob/e in hearers(12,src))
						e<<sound('KunaiMod/Sounds/k-soiyaa.ogg')
					for(var/mob/e in hearers(12,src))
						e<<"<b>[src] brutally swings their broom in an arc, aiming for a relentless home-run!! Oh shit, [P] is flying!!</b>"
					for(var/mob/e in hearers(12,src))
						e<<sound('KunaiMod/Sounds/k-brush.ogg')
						e<<sound('KunaiMod/Sounds/blunt.ogg')
						e<<sound('KunaiMod/Sounds/impact1.ogg')
					src.Frozen=0
					P.Frozen=0
					P.Knockback(120,src)
					P.TotalFatigue+=75
					Stun(P,20)
					sleep(15)
					for(var/mob/f in hearers(22,src))
						f<<sound('KunaiMod/Sounds/homerun.ogg')
					src.MemeHomerun=0
					src.Using=0
					P.Grabbable=1
					src.Grabbable=1
					sleep(6)

				if(src.Retaliate)
					var/Rage=src.KarmaEnergy
					src.Frozen=1
					src.Using=1
					P.Frozen=1
					P.Grabbable=0
					src.Grabbable=0
					for(var/mob/e in hearers(12,src))
						e<<sound('KunaiMod/Sounds/nanayaspecial.ogg')
					for(var/mob/e in hearers(12,src))
						e<<sound('KunaiMod/Sounds/charge.ogg')
					for(var/mob/e in hearers(12,src))
						e<<"[src] cocks their arm back, the energy expands tremendously and..."
					sleep(20)
					for(var/mob/e in hearers(12,src))
						for(var/obj/Communication/C in src)
							e<<"<font color=[C.Text_Color]>[src] yells: <b>HYYAAAAAAAAAAAAAARRRRHHHHHHH!!</b>"
					spawn()Shockwave(E,1)
					for(var/mob/e in hearers(12,src))
						e<<"<b>[src] brutally swings their whole body down at [P] in a shoulder tackle!! The impact releases a crude shockwave made of darkness!</b>"
					for(var/mob/e in hearers(12,src))
						e<<sound('KunaiMod/Sounds/k-brush.ogg')
						e<<sound('KunaiMod/Sounds/blunt.ogg')
						e<<sound('KunaiMod/Sounds/impact1.ogg')
					var/obj/x=new/obj/Taiyoken
					for(var/mob/Players/T in view(Rage/12))
						spawn()T.Quake(Rage/8)
					for(var/turf/T in Turf_Circle(P,Rage/12))
						if(prob(1)) sleep(0.005)
						x.layer=MOB_LAYER+1
						x.icon_state=pick("1","2","3","4","5","6","7")
						T.overlays+=x
						spawn(rand(1,2))T.overlays+=x
						spawn(rand(2,3))T.overlays+=x
						spawn(rand(3,4))T.overlays+=x
						spawn(rand(1,2))T.overlays-=x
						spawn(rand(2,3))T.overlays-=x
						spawn(rand(3,4))T.overlays-=x
						spawn(rand(1,2))T.overlays-=x
						spawn(rand(3,4))T.overlays-=x
						spawn(rand(4,8)) new/turf/Dirt1(locate(T.x,T.y,T.z))
						spawn(rand(4,8)) Destroy(T)
					src.Frozen=0
					P.Frozen=0
					P.Knockback(Rage/4,src)
					P.TotalInjury+=Rage/2
					P.TotalFatigue+=Rage/2
					Stun(P,Rage/4)
					sleep(15)
					src.Retaliate=0
					src.Using=0
					P.Grabbable=1
					src.Grabbable=1

				while(src.Omnislash)
					src.Frozen=1
					P.Frozen=1
					src.Comboz(P)
					if(prob(40))
						spawn()Shockwave(E,1)
					src.StrVsEnd(P, 2)
					if(src.kiblade)
						src.ForVsRes(P, 2*0.66)
					src.Omnislash-=1
					if(src.Omnislash==0)
						src.OmnislashFinal=1
					flick("Attack",src)
					sleep(2)
				if(src.OmnislashFinal)
					for(var/mob/e in hearers(12,src))
						for(var/obj/Communication/C in src)
							e<<"<font color=[C.Text_Color]>[src] yells: <b>HOORYAAH!</b>"
					P.Knockback(20,src)
					src.StrVsEnd(P, 50)
					if(src.kiblade)
						src.ForVsEnd(P, 50*0.66)
					P.Frozen=0
					src.Frozen=0
					src.OmnislashFinal=0

				while(src.Omnislash2)
//					var/pyoon=pick(kyoon)
//					view(src)<<"<i>[pyoon]!~</i>"
					if(src.Omnislash2==11)
						for(var/mob/e in hearers(12,src))
							for(var/obj/Communication/C in src)
								e<<"<font color=[C.Text_Color]>[src] yells: <b>FLUFFY----!!</b>"
					src.Frozen=1
					P.Frozen=1
					src.Comboz(P)
					if(prob(40))
						spawn()Shockwave(E,1)
					src.StrVsEnd(P, 2)
					src.Omnislash2-=1
					if(src.Omnislash2==6)
						for(var/mob/e in hearers(12,src))
							for(var/obj/Communication/C in src)
								e<<"<font color=[C.Text_Color]>[src] yells: <b>-----TAIL-----!!</b>"
					if(src.Omnislash2==0)
						src.OmnislashFinal2=1
					flick("Attack",src)
					sleep(5)
				if(src.OmnislashFinal2)
					for(var/mob/e in hearers(12,src))
						for(var/obj/Communication/C in src)
							e<<"<font color=[C.Text_Color]>[src] yells: <b>--------HELL!!~</b>"
					P.Knockback(20,src)
					Stun(P,6)
					src.StrVsEnd(P, 6)
					P.Frozen=0
					src.Frozen=0
					src.OmnislashFinal2=0
				if(src.FistOfTheChaosStar)
					src.Frozen=1
					P.Frozen=1
					for(var/mob/EE in hearers(12,src))
						for(var/obj/Communication/C in src)
							EE<<"<font color=[C.Text_Color]>[src] says: In this fist, I hold <b>chaos</b>..."
					for(var/mob/EE in hearers(12,src))
						for(var/obj/Communication/C in src)
							EE<<"<font color=[C.Text_Color]>[src] says: And..."

					for(var/count = 100, count > 0, count--)
						var/thing = pick("cats", "dogs", "rainbows", "donkeys", "mice", "men", "women", "titties", "lesbians", "Darwin",
						"drills", "infinity", "exfinity", "Exman's claim to the title of Booty Destroyer", "Blue's entitlement",
						"Kyle's thirst", "Amatsu's relevance", "Bones' salt", "Steve's Afro", "Darwin's philosophy", "the color red", "the color blue", "the color green",
						"the color yellow", "the color violet", "the color indigo", "the color orange", "Jumpy's soul", "Zane's cheese", "Greg's salt", "my dreams", "the power of a nuclear device",
						"nothing", "unlimited power", "someone else's dreams", "my hope", "someone else's hope", "Jumpy's hope", "the desire to get laid",
						"many many things", "almost all the things", "Andrew Hussie's writing ability", "the impetus of the ages", "endless time",
						"endless space", "Spiral Energy", "Sexy Energy", "a goldfish", "a goldfist", "lutefisk", "lutefist", "Monday", "Sunday",
						"Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "boobies", "elephants", "manliness incarnate", "womanliness incarnate",
						"gender ambiguity", "the power of those who do not subscribe to a specific gender", "the power of those who do subscribe to a specific gender",
						"sleep deprivation", "the world", "the end", "the wipe", "the chariot", "the tower", "the hermit", "the judgement",
						"the magician", "the aspect of doom", "the aspect of breath", "the aspect of blood", "the aspect of mind", "the aspect of light", "darkness", "the aspect of void", "the aspect of rage", "the aspect of life", "Orion's competence",
						"the raw power to fuck you up", "the raw power to fuck myself up", "the raw power to fuck", "the past", "the present",
						"the future", "Tori's greatest intentions", "the power to annihilate suspense of disbelief", "the power to shatter the fourth wall",
						"edginess", "no edginess", "pseudorandom entities", "an attack that does approximately 33% of your health if you're around the same power and stats as me",
						"true darkness", "true light", "Kingdom Hearts", "the Road to the Dawn", "the Path to Nothing", "the Places Between",
						"ominous, dark objects", "sex toys", "more lesbians than you can shake a stick at", "more dildos than you can shake a stick at",
						"more dildos than you can shake a dildo at", "more dildos than you can shake a lesbian at", "more lesbians than you can shake a dildo at",
						"more cats than there are in the universe", "infinite rainbows", "my greatest joy", "my greatest pleasure", "your greatest pleasure",
						"an agenda that cannot be denied", "the center of mankind", "the center of womankind", "your very essence", "your will to live",
						"your future", "your past", "your present", "the ability to call forth a win from any hard position I find myself in",
						"homoerotic tendencies", "heterosexual tendencies", "heteroflexibility", "the beginning", "the end", "the middle part of everything",
						"the Water Temple from Legend of Zelda: Ocarina of Time", "all the other Water Temples from the Zelda games", "invalidation",
						"moonlight", "sunlight", "romance", "the will of conquerors")
						for(var/mob/EE in hearers(12,src))
							for(var/obj/Communication/C in src)
								EE<<"<font color=[C.Text_Color]>[src] says: I hold <b>[thing]</b>!"
						var/direction = pick("North", "Northwest", "West", "Southwest", "South", "Southeast", "East", "Northeast")
						if(direction=="North") src.loc = locate(P.x, P.y+1, P.z)
						if(direction=="Northwest") src.loc = locate(P.x-1, P.y+1, P.z)
						if(direction=="West") src.loc = locate(P.x-1, P.y, P.z)
						if(direction=="Southwest") src.loc = locate(P.x-1, P.y-1, P.z)
						if(direction=="South") src.loc = locate(P.x, P.y-1, P.z)
						if(direction=="Southeast") src.loc = locate(P.x+1, P.y-1, P.z)
						if(direction=="East") src.loc = locate(P.x+1, P.y, P.z)
						if(direction=="Northeast") src.loc = locate(P.x+1, P.y+1, P.z)
						src.dir = get_dir(src, P)
						flick("Attack", src)
						src.StrVsEnd(P, 0.02*GoCrand(1,2))
						P.Knockback(2,src)
						sleep(1)

					src.loc = locate(P.x, P.y+1, P.z)
					src.dir = get_dir(src, P)

					//approx. a full power punch get dunked, with randomness thrown in.
					sleep(10)
					for(var/mob/EE in hearers(12,src))
						for(var/obj/Communication/C in src)
							EE<<"<font color=[C.Text_Color]>[src] says: This fist..."
					sleep(10)
					for(var/mob/EE in hearers(12,src))
						for(var/obj/Communication/C in src)
							EE<<"<font color=[C.Text_Color]>[src] says: ...is <b>my soul</b>!"
					sleep(20)
					for(var/mob/EE in hearers(12,src))
						for(var/obj/Communication/C in src)
							EE<<"<font color=[C.Text_Color]>[src] says: <b>CHAOS DUNK!!!</b>"

					flick("Attack", src)

					LightningFlash(P)
					spawn() Shockwave(E,rand(1,5))
					Quake(10)

					src.StrVsEnd(P, GoCrand(20, 60))
					P.Knockback(50, src)

					src.Frozen=0
					P.Frozen=0
					src.FistOfTheChaosStar=0

				if(Soultear)
					src.Frozen=1
					P.Frozen=1
					src.Comboz(P)
					src.StrVsEnd(P, 1)
					if(src.kiblade)
						src.ForVsRes(P, 0.66)
					sleep(10)

					src.Comboz(P)
					src.StrVsEnd(P, 2)
					if(src.kiblade)
						src.ForVsRes(P, 2*0.66)
					sleep(10)

					src.Comboz(P)
					src.StrVsEnd(P, 3)
					if(src.kiblade)
						src.ForVsRes(P, 3*0.66)
					sleep(10)

					src.Comboz(P)
					src.StrVsEnd(P, 4)
					if(src.kiblade)
						src.ForVsRes(P, 4*0.66)
					sleep(10)

					src.Comboz(P)
					LightningFlash(P)
					spawn()Shockwave(E,1)
					src.StrVsEnd(P, 15)
					if(src.kiblade)
						src.ForVsRes(P, 15*0.66)
					P.Frozen=0
					src.Frozen=0
					if(P.KO||P.Health<=-5)
						P.Death(null,"having their soul torn out!")
						P.KeepBody=0
					src.Soultear=0

				if(src.ReverseLotus)
					P.Tengenkotsued=1
					Knock_Distance=100

				if(src.EveningElephant)
					Quake(10)
					src.Frozen=1
					P.Frozen=1
					src.x=P.x
					src.y=P.y+3
					src.z=P.z
					P.Tengenkotsued=1
					Knock_Distance=100
					spawn()Shockwave(E,1)
					src.StrVsEnd(P, rand(15,25))
					src.dir=SOUTH
					for(var/mob/EE in hearers(12,src))
						for(var/obj/Communication/C in src)
							EE<<"<font color=[C.Text_Color]>[src] says: <b>SECOND STEP!</b>"
					Quake(10)
					src.x=P.x+3
					src.y=P.y
					src.z=P.z
					P.Tengenkotsued=1
					Knock_Distance=100
					spawn()Shockwave(E,1)
					src.StrVsEnd(P, rand(15,25))
					src.dir=WEST
					for(var/mob/EE in hearers(12,src))
						for(var/obj/Communication/C in src)
							EE<<"<font color=[C.Text_Color]>[src] says: <b>THIRD STEP!</b>"
					Quake(10)
					src.x=P.x-3
					src.y=P.y
					src.z=P.z
					P.Tengenkotsued=1
					Knock_Distance=100
					spawn()Shockwave(E,1)
					src.StrVsEnd(P, rand(15,25))
					src.dir=EAST
					for(var/mob/EE in hearers(12,src))
						for(var/obj/Communication/C in src)
							EE<<"<font color=[C.Text_Color]>[src] says: <b>FOURTH STEP!</b>"
					Quake(10)
					src.x=P.x
					src.y=P.y-3
					src.z=P.z
					P.Tengenkotsued=1
					Knock_Distance=100
					spawn()Shockwave(E,1)
					src.StrVsEnd(P, rand(15,25))
					src.dir=NORTH
					for(var/mob/EE in hearers(12,src))
						for(var/obj/Communication/C in src)
							EE<<"<font color=[C.Text_Color]>[src] says: <b>FIFTH STEP!</b>"
					Quake(10)
					LightningFlash(P)
		//			spawn()Shockwave(E,1)
					src.StrVsEnd(P, rand(15,25))
					P.Frozen=0
					src.Frozen=0
					src.EveningElephant=0
					src.Energy/=2
					if(P.KO||P.Health<=0)
						P.Death(null,"being crushed by [src]'s power!!!")
						P.KeepBody=0

				if(P.Health<=0&&!P.KO)
					P.Unconscious(src)
					src.Attacking=0
					for(var/obj/Items/Sword/S in src) if(S.suffix)
						if(S.EnchantType=="SORD.....")
							S.SwordPot+=1

/*				if(P.Health<=-25 && src.Lethal)
					if(!P.MortallyWounded)
						src.OMessage(10,"[src] has mortally wounded [P]")
					P.MortallyWounded=1
					P << "The threat to your life increases your affinity for Life Fibers!"
					P.LifeFiberFusion++
					P.EnergyMod*=1.05
					P.EnergyMax*=1.05
					P.Energy*=1.05
					P.StrengthMod*=1.05
					P.EnduranceMod*=1.05
					P.SpeedMod*=1.025
					P.ForceMod*=1.05
					P.ResistanceMod*=1.05
					P.OffenseMod*=1.05
					P.DefenseMod*=1.05*/
				if(P && !P.WeaponBreaker)
					if(explode)
						var/obj/Projectiles/Mystical/Q=new(get_step(src,dir))
						Explosion(Q,0,Damage*0.2,1)

				else
					walk(src,0)

				if(src.BreathHero||src.KamuiShippu||src.SuperKamuiAscension||(src.InUBW&&src.MadeOfSwords))
					Delay/=10
				if(src.Warp==1 && !src.LightningAura)
					if(prob(src.ZanzokenSkill/50))
						src.Comboz(P)
						Delay/=10
		//		if(src.DjinnMagic=="Lightning")
		//			Delay/=5
				if(src.Package["Vampire"]==1)
					if(prob(50))
						var/amountz=src.EnergyMax/100
						if(P.Energy>amountz)
							P.Energy-=amountz
							src.Energy+=amountz
						else
							P.Energy=0

		else
			flick('Dodge.dmi',P)
			if(src.AttackHardness==3)
				if(prob(30))
					src.Frozen=1
					sleep(20)
					src.Frozen=0
		if(P)
			if(prob(Delay*20))
				src.SparGuy=P
				src.PunchGain(P)


		if(Delay<=1 && src.Warp!=1 || Delay<=1 && src.Warp==0 && !src.LightningAura)
			Delay=1
		spawn(Delay) Attacking=0
//		spawn(20) HealingDelay=0
		return
	src.HeavyShot=0
	src.StrengthOfWill=0
	for(var/obj/P in get_step(src,dir))
		Attacking=1
		if(src.client)
			Energy-=Drain
		if(istype(P,/obj/Items/Tech/PunchingBag))
			spawn(SpeedDelay()/1.2) Attacking=0
			if(src.dir==4)
				if(P.icon_state!="Destroyed")
					Melee_Graphics()
					src.SparGuy=P
					src.PunchGain(P)
					flick("Hit",P)
					var/damage=src.Power*((src.Strength*src.StrengthMultiplier)-P.LogPEndurance)/1000
					if(damage<=100)
						damage=100
					if(src.DiplomaticImmunity)
						Damage*=0
					P.Health-=damage
					if(P.Health<1)
						P.icon_state="Destroyed"
					return
			else
				return
		else if(istype(P,/obj/Items/Enchantment/Book_of_Hitting))
			spawn(SpeedDelay()/2) Attacking=0
			if(src.dir==1)
				if(P.icon_state!="Destroyed")
					Melee_Graphics()
					src.SparGuy=P
					flick("Hit",P)
					var/damage=src.Power*((src.Strength*src.StrengthMultiplier)-P.LogPEndurance)/1000
					if(damage<=100)
						damage=100
					if(src.DiplomaticImmunity)
						Damage*=0
					P.Health-=damage
					if(P.Health<1)
						P.icon_state="Destroyed"
					return
			else
				return
		else if(istype(P,/obj/Items/Tech/Log))
			spawn(SpeedDelay()/15) Attacking=0
			if(!P.icon_state)
				spawn(3000) if(P) P.icon_state=""
				P.icon_state="On"
				return
			Melee_Graphics()
			if(P.dir==turn(dir,180))
				src.SparGuy=P
				Melee_Gain(2.75,1)
				P.dir=turn(P.dir,pick(90,-90))
				src.SkillUP("Unarmed",10)
			else
				if(prob(90))
					usr<<"The log cracks as you hit the wrong side! Be careful or it may break!"
					P.Health-=src.Power*(src.Strength*src.StrengthMultiplier)/1000
				if(prob(10))
					usr<<"The log makes a loud creaking sound as you hit the wrong side! Be careful or it may break!"
					P.Health-=src.Power*2*(src.Strength*src.StrengthMultiplier)/750
			var/damage=src.Power*((src.Strength*src.StrengthMultiplier)-P.LogPEndurance)/1000
			if(damage<=100)
				damage=100
			if(src.DiplomaticImmunity)
				Damage*=0
			P.Health-=damage

			if(P.Health<=0)
				P.icon_state="KO"
				spawn(600) if(P)if(P.icon_state=="KO") del(P)
			return
		else
			Melee_Graphics()
			spawn(SpeedDelay()/1.5) Attacking=0
		if(!isIndestructable(P.Health)) // If it's NOT indestructable apply damage (else clause implied is no damage automagically)
			P.Health-=Power*(Strength*StrengthMultiplier)/(P.LogPEndurance+1)
			if(P.Health<=0) Destroy(P)
		return
	for(var/turf/P in get_step(src,dir))
		if(P.density)
			Attacking=1
			if(src.client)
				Energy-=Drain
			Melee_Graphics()
			spawn(SpeedDelay()/1.5) Attacking=0
			P.Health-=Power*(Strength*StrengthMultiplier)
			if(P.Health<=0) Destroy(P)
			return
/*mob/proc/SpeedDelay()
	var/WTF=Speed
	var/Lawl=(Speed/1000)+SpeedMod
	if(Lawl>SpeedMod*10)
		Lawl=SpeedMod*10
	else
		Lawl=(SpeedMod+(WTF/1000))+1
	if(Lawl>10+SpeedMod)
		Lawl=10+SpeedMod
	if(Lawl>40)
		Lawl=40
	src<< "[(100/Lawl)/SpeedEffect]"
	return (100/Lawl)/SpeedEffect*/

mob/proc/SpeedDelay()
	var/BaseSpeed=(SpeedMod*SpeedMultiplier)
	var/Modifier=1//((Speed*SpeedMultiplier)/1000)
	if(Modifier>=30)
		Modifier=30
	var/Delay=BaseSpeed+(Modifier/10)
	if(Delay>=3*SpeedMod)
		Delay=3*SpeedMod
	if(Delay>=30)
		Delay=30
	return 30/Delay





mob/proc/Knockback(var/Distance,mob/P,Direction=get_dir(P,src),KB_Damage=1) spawn if(src)//Some abilities won't damage upon KB
	if(istype(src,/mob/Player/Afterimage)) return
	///if we have Bubble Armor active, knock them back half again as far
	for(var/obj/Skills/Buffs/Bubble_Armor/B in P)
		if(B.BuffUsing)
			Distance *= 1.5
			break
	if(src.Class=="Heracles")
		Distance*=2
	if(P.Class=="Heracles")
		Distance*=0.5
	if(src.Darlose)
		Distance*=20
	if(src.SatsuiNoHado||src.KamuiSenjin||src.SuperKamuiAscension||src.Oozaru)
		return
	if(src.BladeSlow)
		src.DelayedKB+=Distance
		src.DelayedKBCatalyst=P
		return
	if(Distance>50)
		Distance=50
/*	if(Distance<1)
		Distance=1*/

//	src<< "Your knock distance is [Distance]"
	flick("KB",src)
	//icon_state="KB"
	Knockbacked=Direction//Sets the direction that P should be kncoked back

	var
		InitialLoc
		Attack
		Defense=src.Power*(src.Endurance*src.EnduranceMultiplier)
	if(P)
		Attack=P.Power*(P.Strength*P.StrengthMultiplier)*rand(1,5)/10

	while(Distance>0&&P)
		InitialLoc=src.loc
		if(global.DustControl==1)
			if(prob(50))
				new/obj/Effects/Dust(src.loc)
				if(prob(25))
					new/obj/Effects/Dust(src.loc)
		//step_away(src,P,50)

		step(src,Knockbacked)
		flick("KB",src)


		if(KB_Damage)

			for(var/mob/M in get_step(src,Direction))
				var/Defense2=M.Power*(M.Endurance*M.EnduranceMultiplier)
				M.Health-=(Attack/Defense2)/10
				if(src.WoundIntent)
					Injure(M,Attack/Defense2/10)
					Injure(src,Attack/Defense/10)
/*				if(src.MysticEyes||src.TrueMysticEyes)
					MysticInjure(M,Attack/Defense2/10)
					MysticInjure(src,Attack/Defense/10)*/
				src.Health-=(Attack/Defense)/10
				step(M,Knockbacked)
				Distance=round(Distance*0.5)
			if(src.loc==InitialLoc)
				src.Health-=(Attack/Defense)/10
				if(src.WoundIntent)
					Injure(src,Attack/Defense/10)
				if(src.MysticEyes||src.TrueMysticEyes)
					Injure(src,Attack/Defense/10)
				Distance=round(Distance*0.5)

		var/turf/E = get_step(src,Direction)
		E.Health-=(P.Power/(E.LogPEndurance+1))
		if(E.Health<=0)
			if(E.density)
				src.Health-=Attack/Defense/10
				if(src.WoundIntent)
					Injure(src,Attack/Defense/10)
/*				if(src.MysticEyes||src.TrueMysticEyes)
					MysticInjure(src,Attack/Defense/10)*/

			global.GlobalTurfDestroyer=src.ckey
			Destroy(E)
		if(E&&E.density||src.x==500||src.x==1||src.y==1||src.y==500)
			Distance=0
			Knockbacked=0


		for(var/turf/B in Turf_Circle(src,1)) if(Tengenkotsued || DragonFisted || AsaKujakuued || GokuDragonFisted)
			B.density=0
			Destroy(B)


		/*for(var/atom/A in get_step(src,Direction))
			if(isobj(A)||isturf(A))
				if(A.density)
					A.Health-=P.Power
					if(A.Health<=0) Destroy(A)*/
		Distance-=1
		if(src.Pursuited)
			Distance=0
			src.Pursuited=0
			Knockbacked=0
			return
		if(src.AerialRecovery==1)
			src.AerialRecovery=0
			Knockbacked=0
			Distance=0
			return
		if(src.AerialRecovery==2)
			src.AerialRecovery=1
			Knockbacked=0
			Distance=0
			return
		if(Distance==0&&global.DustControl==1)
			if(prob(90))
				new/obj/Effects/Dust(src.loc)
		sleep(2)
	walk(src,0)
	if(DragonFisted && Distance==0)
		P.Frozen=0
		P.DragonFisted=0
	if(NightGuyTarget && Distance==0)
		if(src.Health<=5)
			src.Death(P)
		src.NightGuyTarget=0
	if(AsaKujakuued&&Distance==0)
		src.overlays-=image('FireAuraBurst.dmi',,pixel_x=-48)
		AsaKujakuued=0
	if(Distance==0 && src.Finishered)
		for(var/mob/m in view(20, src))
			spawn()Quake(5)
		if(src.Finishered=="Ice")
			for(var/turf/T in Turf_Circle(src,4))
				spawn(rand(4,8))new/turf/Ice1(locate(T.x, T.y, T.z))
				spawn(rand(4,8))Destroy(T)
		if(src.Finishered=="Fire")
			for(var/turf/T in Turf_Circle(src,6))
				spawn(rand(4,8))new/turf/Waters/Water7(locate(T.x, T.y, T.z))
				spawn(rand(4,8))Destroy(T)
			src.Burning=0.2*GoCrand(1,5)*GoCrand(0.25, 1)
			src.Burning_Check()
		if(src.Finishered=="Omega")
			for(var/turf/T in Turf_Circle(src,8))
				spawn(rand(4,8))new/turf/Dirt1(locate(T.x, T.y, T.z))
				spawn(rand(4,8))Destroy(T)
		if(src.Finishered=="Ultima")
			for(var/turf/T in Turf_Circle(src,20))
				spawn(rand(5,20))new/turf/Dirt1(locate(T.x, T.y, T.z))
				spawn(rand(5,20))Destroy(T)
		src.Finishered=null
	if(Distance==0 && Tengenkotsued)
		Tengenkotsued=0
		var/obj/x=new/obj/Taiyoken
		for(var/mob/Players/T in view(18))
			spawn()T.Quake(50)
		for(var/turf/T in Turf_Circle(src,8))
			if(prob(1)) sleep(0.005)
			x.layer=MOB_LAYER+1
			x.icon_state=pick("1","2","3","4","5","6","7")
			T.overlays+=x
			spawn(rand(1,2))T.overlays+=x
			spawn(rand(2,3))T.overlays+=x
			spawn(rand(3,4))T.overlays+=x
			spawn(rand(1,2))T.overlays-=x
			spawn(rand(2,3))T.overlays-=x
			spawn(rand(3,4))T.overlays-=x
			spawn(rand(1,2))T.overlays-=x
			spawn(rand(3,4))T.overlays-=x
			spawn(rand(4,8)) new/turf/Dirt1(locate(T.x,T.y,T.z))
			spawn(rand(4,8)) Destroy(T)
	if(Distance==0 && GokuDragonFisted)
		GokuDragonFisted=0
		var/obj/x=new/obj/Taiyoken
		for(var/mob/Players/T in view(18))
			spawn()T.Quake(50)
		for(var/turf/T in Turf_Circle(src,8))
			if(prob(1)) sleep(0.005)
			x.layer=MOB_LAYER+1
			x.icon_state=pick("1","2","3","4","5","6","7")
			T.overlays+=x
			spawn(rand(1,2))T.overlays+=x
			spawn(rand(2,3))T.overlays+=x
			spawn(rand(3,4))T.overlays+=x
			spawn(rand(1,2))T.overlays-=x
			spawn(rand(2,3))T.overlays-=x
			spawn(rand(3,4))T.overlays-=x
			spawn(rand(1,2))T.overlays-=x
			spawn(rand(3,4))T.overlays-=x
			spawn(rand(4,8)) new/turf/Dirt1(locate(T.x,T.y,T.z))
			spawn(rand(4,8)) Destroy(T)
				//		if(prob(10))sleep(0.1)
		//	for(var/mob/M in view(0,T))
				//M.Health-=((usr.Force*usr.Power)/(M.Resistance*Power))*1000// 50010)/48361410))*1000
	if(Distance==0 && RasenganHit)
		src.overlays+=image('KunaiMod/Icons/rasenganhit.dmi',pixel_x=-18,pixel_y=-18)
		var/obj/x=new/obj/Taiyoken
		for(var/mob/Players/T in view(80))
			spawn()T.Quake(50)
		for(var/turf/T in Turf_Circle(src,8))
			if(prob(1)) sleep(0.005)
			x.layer=MOB_LAYER+1
			x.icon_state=pick("1","2","3","4","5","6","7")
			T.overlays+=x
			spawn(rand(1,2))T.overlays+=x
			spawn(rand(2,3))T.overlays+=x
			spawn(rand(3,4))T.overlays+=x
			spawn(rand(1,2))T.overlays-=x
			spawn(rand(2,3))T.overlays-=x
			spawn(rand(3,4))T.overlays-=x
			spawn(rand(1,2))T.overlays-=x
			spawn(rand(3,4))T.overlays-=x
			spawn(rand(4,8)) new/turf/Dirt1(locate(T.x,T.y,T.z))
			spawn(rand(4,8)) Destroy(T)
		src.overlays-=image('KunaiMod/Icons/rasenganhit.dmi',pixel_x=-18,pixel_y=-18)
		RasenganHit=0
	Knockbacked=0

mob/proc/Melee_Graphics()
	if(istype(src,/mob/Animals)) flick("[src.icon_state]Attack",src)
	else flick("Attack",src)

mob/Body
	New()
		..()
//		spawn(6000)if(src)Spoil()
	verb/GetRidOf()
		var/customselect=input("Choose a command.") in list("Cancel","Bury","Destroy","Gib","Stone Cross","Cremate")
		set src in oview(1)
		set name="Destroy Corpse"
		switch(customselect)
			if("Cancel")
				return
			if("Bury")
				set src in oview(1)
				var/obj/Grave/R=new(get_step(src,src.dir))
				R.loc=src.loc
				flick('KunaiMod/Icons/bloodyheck.dmi', src)
				for(var/mob/E in hearers(12,src))
					E<<"[usr] buried [src]."
					E<<sound('KunaiMod/Sounds/ripmario.ogg')
				del(src)
			if("Destroy")
				set src in oview(1)
				var/obj/Remains/R=new(get_step(src,src.dir))
				R.loc=src.loc
				flick('KunaiMod/Icons/bloodyheck.dmi', src)
				for(var/mob/E in hearers(12,src))
					E<<"[usr] destroys [src]!"
					E<<sound('KunaiMod/Sounds/ripmario.ogg')
				del(src)
			if("Gib")
				set src in oview(1)
				var/obj/Remains/R=new(get_step(src,src.dir))
				R.loc=src.loc
				flick('KunaiMod/Icons/bloodyheck.dmi', src)
				for(var/mob/E in hearers(12,src))
					E<<"[usr] smashes [src] to bloody gibs!"
					E<<sound('KunaiMod/Sounds/squelch.ogg',wait=1)
				del(src)
			if("Stone Cross")
				set src in oview(1)
				var/obj/SHIZA/R=new(get_step(src,src.dir))
				R.loc=src.loc
				flick('KunaiMod/Icons/bloodyheck.dmi', src)
				for(var/mob/E in hearers(12,src))
					E<<"[usr] looks up as a fucking stone cross falls on [src]"
					E<<sound('KunaiMod/Sounds/squelch.ogg',wait=1)
					E<<sound('KunaiMod/Sounds/SHIZA.ogg')
				del(src)
			if("Cremate")
				set src in oview(1)
				var/obj/Ashes/R=new(get_step(src,src.dir))
				R.loc=src.loc
				flick('KunaiMod/Icons/faiya.dmi', src)
				for(var/mob/E in hearers(12,src))
					E<<"[usr] cremated [src] to ashes!"
					E<<sound('KunaiMod/Sounds/fiya.ogg',wait=1)
				del(src)
	Del()
		for(var/obj/Items/I in src)
			if(I.Stealable)
				if(I.suffix=="Equipped")
					spawn(5) I.suffix=null
			I.loc=src.loc

		if(Target) Target<<"Your body has been destroyed."
		..()
mob/proc/Leave_Body()
	var/mob/Body/A=new(loc)
	A.icon_state="KO"
	A.name="Body of [src]"
	if(src.AlienRacialPassive=="HoneyBadger")
		if(prob(20))
			src<<"<font color=red><big>DO NOT LOG OUT!"
			src<<"Your life is on the verge of complete oblivion, you are not completely dead and may still return to your body if it still remains!"
			Target=src //There is a small chance you will come back to life like Bardock
			spawn(600) if(src&&A) A.Barely_Alive(Target)
	else
		if(prob(10)||src.Class=="Mazoku" && src.Race=="Human" && !src.MazokuAscend && src.Base>=150000*src.BaseMod||src.MazokuEarly||src.StealthVoid||(src.SexyMod>=3&&src.GetBPM() >= 300000))
			src<<"<font color=red><big>DO NOT LOG OUT!"
			src<<"Your life is on the verge of complete oblivion, you are not completely dead and may still return to your body if it still remains!"
			src.OMessage(0,"","<font color=red>[src] is voiding.")
			Target=src //There is a small chance you will come back to life like Bardock
			spawn(600) if(src&&A) A.Barely_Alive(Target)
			if(src.StealthVoid)
				src.StealthVoid=0
	A.Race=Race
	A.Body=Body
	A.Health=10000
	A.EnergyMax=EnergyMax
	A.Energy=Energy
	A.Power=Power
	A.Strength=Strength
	A.Endurance=Endurance
	A.Force=Force
	A.Resistance=Resistance
	A.icon=src.icon
	A.overlays=overlays
	A.overlays+=image('ArtificalObj.dmi',"Blood")
	for(var/obj/Items/I in src) if(I.Stealable)
		if(I.suffix=="Equipped")
			I.Equip(src)
			spawn(5)if(I) I.suffix=null
		A.contents+=I
	if(src.SelfDestructed)
		src.SelfDestructed=0
		del A
mob/proc/Barely_Alive(mob/P) if(P)
	P.loc=loc
	P.Conscious()
	P.Health=10
	P.Energy=10
	P.Revive()
	P<<"You have returned to your body, barely alive."
	if(P.SexyMod>=3&&P.GetBPM()>=300000)
		P.SuperKamuiAscension()
		P<<"Your body is knit back together by life fibers."
		P.HealWounds(100)
		P.HealFatigue(100)
		P.HealHealth(100)
		P.HealEnergy(100)
	if(P.Class=="Mazoku" && P.Race=="Human" && !P.MazokuAscend&& P.Base>=150000*P.BaseMod||P.MazokuEarly)
		if(P.BaseMod==1.5)
			P.BaseMod/=1.5
			P.Base/=1.5
			P.BaseMod=10
			P.Base*=10
			P.StrengthMod*=1.25
			P.EnduranceMod*=1.25
			P.ForceMod*=1.25
			P.ResistanceMod*=1.25
			P.OffenseMod*=1.25
			P.DefenseMod*=1.25
		else
			P.BaseMod/=2.5
			P.Base/=2.5
			P.BaseMod=10
			P.Base*=10
		P.MazokuAscend=1
		P.MazokuEarly=0
		P<<"You suddenly feel a surge of demonic energy as your power increases many times over!"
		P.SetVars()
		P.trans["unlocked"]=0
		P.Health=100
		P.Energy=100
		P.TotalInjury=0
		P.TotalFatigue=0
	for(var/obj/Items/I in src)
		if(I.suffix=="Equipped")
			I.Equip(src)
			P.overlays+=I
		P.contents+=I
	del(src)


mob/proc/Grab()
	if(Stunned||icon_state=="KB") return
	if(!Grab)
		var/list/Choices=new
		for(var/atom/O in get_step(src,dir))
			if((isobj(O)||ismob(O))&&O.Grabbable)
				if(istype(O,/obj/Items/Tech))
					if(O:Bolt)
						continue
				Choices+=O
		var/mob/P=input(src,"Grab what?") in Choices
		src.key1=0
		src.key2=0
		src.key3=0
		src.key4=0
		if(!(locate(P) in get_step(src,dir))) return
		if(istype(P,/obj/Materials))
			P.Grab()
		if(istype(P,/obj/Items))
			var/obj/Items/buh=P
			var/PotionFound=0
			if(buh:Pickable==1)
				var/Amount=0
				for(var/obj/Items/I in src) if(!istype(I,/obj/Items/Wearables)) Amount+=1
				if(Amount>=99)
					src<<"You cannot carry any more non-clothing items."
					return
				src.OMessage(10,"[src] picks up [P].","[src]([src.key]) picks up [ExtractInfo(P)] made by [buh.CreatorKey].")
				if(istype(P,/obj/Items/Enchantment/BuffPotions))
					var/obj/Items/Enchantment/BuffPotions/Z=P
					if(Z.PotionType=="Strength")
						if(Z.Cost==50000)
							for(var/obj/Items/Enchantment/BuffPotions/StrengthPotion/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
						else if(Z.Cost==125000)
							for(var/obj/Items/Enchantment/BuffPotions/StrengthPotion2/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
					else if(Z.PotionType=="Endurance")
						if(Z.Cost==50000)
							for(var/obj/Items/Enchantment/BuffPotions/EndurancePotion/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
						else if(Z.Cost==125000)
							for(var/obj/Items/Enchantment/BuffPotions/EndurancePotion2/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
					else if(Z.PotionType=="Resistance")
						if(Z.Cost==50000)
							for(var/obj/Items/Enchantment/BuffPotions/ResistancePotion/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
						else if(Z.Cost==125000)
							for(var/obj/Items/Enchantment/BuffPotions/ResistancePotion2/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
					else if(Z.PotionType=="Force")
						if(Z.Cost==50000)
							for(var/obj/Items/Enchantment/BuffPotions/ForcePotion/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
						else if(Z.Cost==125000)
							for(var/obj/Items/Enchantment/BuffPotions/ForcePotion2/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
					else if(Z.PotionType=="Offense")
						if(Z.Cost==50000)
							for(var/obj/Items/Enchantment/BuffPotions/OffensePotion/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
						else if(Z.Cost==125000)
							for(var/obj/Items/Enchantment/BuffPotions/OffensePotion2/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
					else if(Z.PotionType=="Defense")
						if(Z.Cost==50000)
							for(var/obj/Items/Enchantment/BuffPotions/DefensePotion/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
						else if(Z.Cost==125000)
							for(var/obj/Items/Enchantment/BuffPotions/DefensePotion2/B in src)
								PotionFound=1
								if(PotionFound==1)
									B.PotionsRemaining+=Z.PotionsRemaining
									B.suffix="[Commas(B.PotionsRemaining)]"
									del(P)
									return
				else if(istype(P,/obj/Items/Enchantment/Potions))
					var/obj/Items/Enchantment/Potions/Z=P
					if(istype(P,/obj/Items/Enchantment/Potions/HealingPotion))
						for(var/obj/Items/Enchantment/Potions/HealingPotion/B in src)
							PotionFound=1
							if(PotionFound==1)
								B.PotionsRemaining+=Z.PotionsRemaining
								B.suffix="[Commas(B.PotionsRemaining)]"
								del(P)
								return
					else if(istype(P,/obj/Items/Enchantment/Potions/EnergyPotion))
						for(var/obj/Items/Enchantment/Potions/EnergyPotion/B in src)
							PotionFound=1
							if(PotionFound==1)
								B.PotionsRemaining+=Z.PotionsRemaining
								B.suffix="[Commas(B.PotionsRemaining)]"
								del(P)
								return
					else if(istype(P,/obj/Items/Enchantment/Potions/Antidote))
						for(var/obj/Items/Enchantment/Potions/Antidote/B in src)
							PotionFound=1
							if(PotionFound==1)
								B.PotionsRemaining+=Z.PotionsRemaining
								B.suffix="[Commas(B.PotionsRemaining)]"
								del(P)
								return
					else if(istype(P,/obj/Items/Enchantment/Potions/ManaPotion))
						for(var/obj/Items/Enchantment/Potions/ManaPotion/B in src)
							PotionFound=1
							if(PotionFound==1)
								B.PotionsRemaining+=Z.PotionsRemaining
								B.suffix="[Commas(B.PotionsRemaining)]"
								del(P)
								return
					else if(istype(P,/obj/Items/Enchantment/Potions/HiPotion))
						for(var/obj/Items/Enchantment/Potions/HiPotion/B in src)
							PotionFound=1
							if(PotionFound==1)
								B.PotionsRemaining+=Z.PotionsRemaining
								B.suffix="[Commas(B.PotionsRemaining)]"
								del(P)
								return
					else if(istype(P,/obj/Items/Enchantment/Potions/Ether))
						for(var/obj/Items/Enchantment/Potions/Ether/B in src)
							PotionFound=1
							if(PotionFound==1)
								B.PotionsRemaining+=Z.PotionsRemaining
								B.suffix="[Commas(B.PotionsRemaining)]"
								del(P)
								return
					else if(istype(P,/obj/Items/Enchantment/Potions/Elixer))
						for(var/obj/Items/Enchantment/Potions/Elixer/B in src)
							PotionFound=1
							if(PotionFound==1)
								B.PotionsRemaining+=Z.PotionsRemaining
								B.suffix="[Commas(B.PotionsRemaining)]"
								del(P)
								return
					else if(istype(P,/obj/Items/Enchantment/Potions/FrostPotion))
						for(var/obj/Items/Enchantment/Potions/FrostPotion/B in src)
							PotionFound=1
							if(PotionFound==1)
								B.PotionsRemaining+=Z.PotionsRemaining
								B.suffix="[Commas(B.PotionsRemaining)]"
								del(P)
								return
					else if(istype(P,/obj/Items/Enchantment/Potions/FlamePotion))
						for(var/obj/Items/Enchantment/Potions/FlamePotion/B in src)
							PotionFound=1
							if(PotionFound==1)
								B.PotionsRemaining+=Z.PotionsRemaining
								B.suffix="[Commas(B.PotionsRemaining)]"
								del(P)
								return
				else if(istype(P,/obj/Items/Tech/Gravity))
					var/obj/Items/Tech/Gravity/Q=P
					Q.GravOff()
/*				else if(istype(P,/obj/Items/Tech/Frame))
					var/obj/Items/Tech/Frame/FrameOverride=P
					if(FrameOverride.MachineType=="Gravity")
						FrameOverride.GravOff()*/
				P.Move(src)
				if(P.suffix=="Equipped")
					P.suffix=null
				return
		if(istype(P,/obj/Money))
			var/obj/Money/buh=P
			for(var/obj/Money/M in src) M.Level+=P.Level
			src.OMessage(10,"[src] picks up [P].","[src]([src.key]) picks up ([P.Level])[ExtractInfo(P)] made by [buh.MoneyCreator].")
			del(P)
			return
		Grab=P
		src.OMessage(10,"[src] grabbed [P]!","[src]([src.key]) grabs [ExtractInfo(P)]")
		src.Grab_Update()
		if(src.Banquet)
			P.Succ(rand(0.4,0.9))
		if(src.BloodDrain)
			P.Drain(rand(0.2,0.8)) //DrainD is the X variable in the Drain(var/x) proc in GainProcs.DM
		if(src.FrontLotus==1)
			var/Damage=(src.Power*(src.Strength*src.StrengthMultiplier))/(P.Power*(P.Endurance*P.EnduranceMultiplier))*2//no
			src.FrontLotus=0
			P.Frozen=1
			Damage=BlockDamage(P,Damage)
			src.OMessage(10,"[src] dives up into the air with [P]!","[src]([src.key]) uses Front Lotus [ExtractInfo(P)]")
			P.overlays+=image('Silver Sword SlashTornado Beam.dmi', "struggle",pixel_x=-32, pixel_y=-16)
			sleep(30)
			if(src.DiplomaticImmunity || P.DiplomaticImmunity)
				Damage*=0
			P.Knockback(3,src)
			P.Tengenkotsued=1
	//		fevExplosion(src,P,4,Power=0)
			KenShockwave(P)
			P.Health-=Damage*10
			if(src.WoundIntent)
				P.TotalInjury+=(Damage)/5
			src.TotalInjury+=(Damage)/10
			P.Frozen=0
			LightningFlash(P)
			src.OMessage(10,"[src] kicked [P] into the ground with a sickening crunch!","[src]([src.key]) uses Front Lotus [ExtractInfo(P)]")
			P.overlays-=image('Silver Sword SlashTornado Beam.dmi', "struggle",pixel_x=-32, pixel_y=-16)
	/*		for(var/turf/T in Turf_Circle(P,3))
				if(prob(1)) sleep(0.005)
				spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
				spawn(rand(4,8)) Destroy(T)*/
			if(P.Health<=0 && src.Lethal)
				P.Death(null,"[src]'s wealth of youth!")
			Grab_Release()
		if(src.BurningFinger==1)
			var/Damage=(src.Power*(src.Strength*src.StrengthMultiplier))/(P.Power*(P.Endurance*P.EnduranceMultiplier))*25*3//no
			src.BurningFinger=0
			Damage=BlockDamage(P,Damage)
			sleep(30)
			if(src.DiplomaticImmunity || P.DiplomaticImmunity)
				Damage*=0

			if(P.Health-Damage<=P.AngerThreshold&&!P.Anger&&!P.Mystic)
				P.Anger()
				Damage/=P.AngerMax

	//		fevExplosion(src,P,4,Power=0)
			KenShockwave(P)
			P.Health-=Damage
			if(src.WoundIntent)
				P.TotalInjury+=(Damage)/20
			LightningFlash(P)
	/*		for(var/turf/T in Turf_Circle(P,3))
				if(prob(1)) sleep(0.005)
				spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
				spawn(rand(4,8)) Destroy(T)*/
			if(P.Health<=0 && src.Lethal)
				P.Death(null,"the King of Hearts!")
			Grab_Release()
		if(src.CQCChokehold==1)
			while(src.CQCChokehold)
				if(prob(50))
					P.TotalFatigue+=15
					P<<"You suffocate on [src]'s chokehold..!"
					src<<"[P] suffocates on your chokehold..!"
				else
					continue
				sleep(125)
		if(src.ThunderHands==1)
			var/Damage=(src.Power*(src.Force*src.ForceMultiplier))/(P.Power*(P.Resistance*P.ResistanceMultiplier))*30*3//no
			src.ThunderHands=0
			Damage=BlockDamage(P,Damage)
			sleep(30)
			if(src.DiplomaticImmunity || P.DiplomaticImmunity)
				Damage*=0

			if(P.Health-Damage<=P.AngerThreshold&&!P.Anger&&!P.Mystic)
				P.Anger()
				Damage/=P.AngerMax

			LightningStrike(P)
			P.Health-=Damage
			if(src.WoundIntent)
				P.TotalInjury+=(Damage)/5
			LightningFlash(P)
	/*		for(var/turf/T in Turf_Circle(P,3))
				if(prob(1)) sleep(0.005)
				spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
				spawn(rand(4,8)) Destroy(T)*/
			if(P.Health<=0 && src.Lethal)
				P.Death(null,"the King of Hearts!")
			Grab_Release()
	else
		if(src.CQCChokehold)
			src<<"You can't release them once you lock them in a chokehold. Slam them down!"
		Grab_Release()

mob/proc/Grab_Release() Grab=null
mob/proc/Grab_Update()
	if(src.Grab)
		Grab.loc=loc
		if(istype(src.Grab,/mob))
			if(Grab.Knockbacked)
				Grab_Release()
		if(src.KO)Grab_Release()

mob/proc/Hit_Sparks(var/SparkType)
	if(SparkType=="Normal")
		var/hitstaterand=rand(1,5)
		var/image/AA=image('Effects.dmi',icon_state="hit[hitstaterand]")
		src.overlays+=AA
		spawn(5)
			src.overlays-=AA
	else if(SparkType=="AxeKick")
		var/image/AK=image('Effects.dmi',icon_state="axekick")
		src.overlays+=AK
		spawn(7)
			src.overlays-=AK

// Check the string supplied with this proc
// If the string supplied is -not- an integer then we don't want it destroyed

proc/isIndestructable(var/_health)
	if(isnum(_health)) // If it is a number
		return 0 // OFF WITH ITS HEAD
	else
		return 1 // not a number cannot remove health