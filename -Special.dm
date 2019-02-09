//Vampire and Lycan and Demon Contracts oh my.
mob/var/tmp/Shocked=0


obj/Skills
	SixthSense
		Teachable=0
		Level=0
		desc="Allows enhanced senses, but does drain to use."
		verb/SixthSense()
			set category="Skills"
			set name="Sixth Sense"
			usr.BuffX("SixthSense",src)


	AlienRacials
		Teachable=0
		Level=0
		desc="Use this to get your Alien Racial powers."
		var/alienraciallockout
		verb/PickRacials()
			set category="Other"
			if(alienraciallockout)
				usr<<"Don't try to pick multiple racials. It's unhealthy for you."
				return
			alienraciallockout=1
			var/Choice=input("Pick a Active ability. This cannot be undone.") in list ("Invisiblity","Imitate","Venom","Ki Weapon","Fishman","Adrenaline","Striker")
			switch(Choice)
				if("Invisiblity")
					usr.contents+=new/obj/Skills/Rank/Invisibility
				if("Imitate")
					usr.contents+=new/obj/Skills/Rank/Imitation
				if("Absorb")
					usr.contents+=new/obj/Skills/Absorb
				if("Venom")
					usr.contents+=new/obj/Skills/Attacks/PoisonBolt
					usr.contents+=new/obj/Skills/Attacks/PoisonGas
				if("Ki Weapon")
					usr.contents+=new/obj/Skills/Buffs/KiBlade
				if("Regeneration")
					usr.contents+=new/obj/Skills/BurstRegenerate
				if("Limit Breaker")
					usr.contents+=new/obj/Skills/LimitBreaker
				if("Fishman")
					usr.Fishman=1
				if("Flicker")
					usr.contents+=new/obj/Skills/Rank/AfterImageStrike
					usr.contents+=new/obj/Skills/Rank/Zanzoken
				if("Adrenaline")
					usr.passives["adrenaline"] = 1
				if("Striker")
					usr.passives["striker"] = 1

			usr.AlienRacialActive=Choice
//			if(usr.Special==1||usr.Special==23)
//				usr.AlienRacialPassive="HoneyBadger"
			if(usr.Special==1||usr.Special==2||usr.Special==3||usr.Special==5||usr.Special==8||usr.Special==23)
				usr.AlienRacialPassive="EnhancedSenses"
				usr.EnhancedHearing=1
				usr.SenseReq*=0.75
			else if(usr.Special==4||usr.Special==10)
				usr.AlienRacialPassive="MinorMagicalProwess"
				usr.ManaMax+=50
			else if(usr.Special==9||usr.Special==11)
				usr.AlienRacialPassive="MagicalProwess"
				usr.ManaMax+=100
				if(!locate(/obj/Skills/Attacks/MagiBolt,usr.contents))
					usr.contents+=new/obj/Skills/Attacks/MagiBolt
				else
					usr.RewardPoints+=10
			else if(usr.Special==14||usr.Special==15||usr.Special==19)
				if(usr.Class=="Fighter")
					usr.Intelligence+=0.5
					usr.Enchantment+=0.5
					usr.AlienRacialPassive="Mental Sharpness"
				else if(usr.Class=="Wizard"||usr.Class=="Healer")
					usr.Intelligence+=0.75
					usr.AlienRacialPassive="Technological Affinity"
				else if(usr.Class=="Technologist")
					usr.Enchantment+=0.75
					usr.AlienRacialPassive="Magitechnologist"
/*			else if(usr.Special==2||usr.Special==8||usr.Special==14||usr.Special==19)
				usr.AlienRacialPassive="TemperatureTolerance"
				usr.TemperatureToleranceType="Both"
				usr.TemperatureTolerance=2.5
			else if(usr.Special==3||usr.Special==9||usr.Special==15)
				usr.AlienRacialPassive="IncreasedGravity"
				usr.GravityMod+=1.5
				usr.GravityMastered+=10*/
			//else if(usr.Special==4||usr.Special==10||usr.Special==16||usr.Special==20)
			//	usr.AlienRacialPassive="IncreasedZenkaiMod"
			//	usr.Zenkai_Rate+=2
/*			else if(usr.Special==5||usr.Special==11)
				usr.AlienRacialPassive="InnerPower"
				usr.Potential+=1.5
				usr.OriginalPotential+=1.5*/
			else if(usr.Special==6||usr.Special==12||usr.Special==17||usr.Special==21||usr.Special==24)
				usr.AlienRacialPassive="RedundantLung"
				usr.MaxOxygen+=150
			else if(usr.Special==7||usr.Special==13||usr.Special==18||usr.Special==22||usr.Special==25)
				usr.AlienRacialPassive="EnergyAdept"
				if(!locate(/obj/Skills/Rank/Shield,usr.contents))
					usr.contents+=new/obj/Skills/Rank/Shield
				else
					usr.RewardPoints+=100
				usr.contents+=new/obj/Skills/Attacks/Trishot
			usr.RacialsSelected=1
			for(var/obj/Skills/AlienRacials/A in usr)
				del(A)
	//Vamp
	SendEnergy
		Teachable=0
		Level=100
		desc="Can continually tranfer energy to someone at the cost of your own energy."
		verb/TransferEnergy()
			set category="Skills"
			var/list/who=list("Cancel")
			for(var/mob/Players/M in oview(5,usr))
				who.Add(M)
			if(usr.Transfering)
				usr<<"You stop transfering"
				usr.Transfering=null
				return
//			var/list/who=list("Cancel")
//			for(var/mob/Players/M in oview(5,usr))
//				who.Add(M)
			var/mob/blah=input("Who do you want to transfer energy to?","Energy Transfer")in who
			if(blah=="Cancel")return
			else if(blah!="Cancel")
				usr.Transfering=blah
	VampireAbsorb
		Teachable=0
		Level=100
		desc="While active, for each hit that you land you drain a % of the victims energy. While active it decreases the effiency of physical abilities."
		verb/Vampire_Absorb()
			set category="Skills"
			set name="Vampire Absorb"
			usr.SkillX("VAbsorb",src)
	VampireFrenzy
		Teachable=0
		Level=100
		var/oldicon
		desc="While active it increases speed but decreases general skill."
		verb/Vampire_Frenzy()
			set category="Skills"
			set name="Frenzy"
/*			if(usr.Race=="Dhampir")
				if(usr.Class=="Human Path")
					usr.DFrenzy("DFrenzyH", src)
				else if(usr.Class=="Vampire Path")
					usr.DFrenzy("DFrenzyV", src)
				else
					usr.DFrenzy("Succubus Path", src)
				sleep(10)
				return*/
			if(usr.Class!="Volodarskii"&&usr.Class!="Dio")
				usr.SkillX("VFrenzy",src)
			else
				usr.SkillX("VoloFrenzy",src)
			sleep(10)
	BloodDrain
		Teachable=0
		Level=100
		desc="While active, anyone you have grabbed will be drained of their health, adding it on to your own."
		verb/BloodDrain()
			set category="Skills"
			set name="Blood Drain"
			usr.SkillX("BloodDrain",src)

	LifeDrain
		Teachable=0
		Level=100
		desc="While active, anyone you have grabbed will be drained of their health, adding it on to your own. This version is exclusive to natural Vampires."
		verb/LifeDrain()
			set category="Skills"
			set name="Life Drain"
			usr.SkillX("LifeDrain",src)

	VampireInfect
		Teachable=0
		Level=100
		desc="Infects someone with a vampire's skills."
		verb/Infect()
			set category="Skills"
			set name="Vampire Infect"
			if(usr.Dead)
				usr<<"You're dead!"
				return
			var/list/who=list("Cancel")
			for(var/mob/Players/M in oview(1,usr))
				if(M.Race!="Vampire"&&!M.Dead)
					who.Add(M)
			var/mob/blah=input("Who do you want to bite?","Infect")in who
			if(blah=="Cancel")return
			if(blah)
				if(!blah.KO)
					var/buh=input(blah,"Do you want to let [usr] bite you?")in list("No","Yes")
					if(buh=="No")return
				usr.OMessage(13,"[usr] bites [blah]....","[usr]([usr.key]) bit and killed [usr]([usr.key])")
				if(locate(/obj/Skills/VampireAbsorb,blah.contents)||locate(/obj/Lycan,blah.contents))
					blah.Death(usr)

				else
					if(!(locate(/obj/Skills/VampireAbsorb,blah.contents)))
						blah.contents+=new/obj/Skills/VampireAbsorb
					if(!(locate(/obj/Skills/VampireFrenzy,blah.contents)))
						blah.contents+=new/obj/Skills/VampireFrenzy
					if(!(locate(/obj/Skills/SendEnergy,blah.contents)))
						blah.contents+=new/obj/Skills/SendEnergy
					if(!(locate(/obj/Skills/BloodDrain,blah.contents)))
						blah.contents+=new/obj/Skills/BloodDrain
					if(!(locate(/obj/Skills/Regenerate,blah.contents)))
						blah.contents+=new/obj/Skills/Regenerate
					blah.EnhancedSmell=1
	ManaInfusion
		Teachable=0
		Level=100
		desc="Charges your body with Mana!"
		verb/ManaInfusion()
			set category="Skills"
			set name="Mana Infusion"
			usr.SkillX("ManaInfusion",src)
			sleep(10)
	Pulse
		var/LevelUsed
		Teachable=0
		Level=100
		desc="Consume the Mana around you and charge your body with it."
		verb/Pulse()
			set category="Skills"
			usr.SkillX("Pulse", src)
	Infuse
		Level=0
		desc="Spirit Doll trans."
		verb/Infuse()
			set category="Skills"
			usr.BuffX("Infuse", src)



//quincy stuff here
	SanreiActivate
		Teachable=0
		Level=0
		desc="Using this will give a boost accessible only by Quincy, but disable Anger and ThirdEye."
		verb/SanreiActivate()
			set category="Skills"
			set name="Sanrei Activate"
			usr.Bleach("SanreiActivate",src)
			sleep(10)
	BlutSwitch
		Teachable=0
		Level=0
		desc="Switch between Blut Vene(Defensive) and Blut Artere(Offense) when Blut is not activated."
		verb/BlutSwitch()
			set category="Skills"
			set name="Blut Switch"
			usr.Bleach("BlutSwitch",src)
			sleep(10)

	BlutActivate
		Teachable=0
		Level=0
		desc="Activate Blut...Self explanatory really."
		verb/SanreiActivate()
			set category="Skills"
			set name="Blut Activate"
			usr.Bleach("BlutActivate",src)
			sleep(10)
	Rasontengai
		Teachable=0
		Level=0
		desc="A powerful Quincy spell, allowing the user to fight by controlling their body with their spirit energy, even with crippling physical disabilities."
		verb/Rasontengai()
			set category="Skills"
			set name="Rasontengai"
			usr.Bleach("Rasontengai",src)
			sleep(10)

	LetztStil
		Teachable=0
		Level=0
		desc="Break your Sanrei in one powerful burst, giving you ridiculous power. Sanrei can no longer be worn and your power severely drops."
		verb/SanreiActivate()
			set category="Skills"
			set name="Letzt Stil"
			usr.Bleach("LetztStil",src)
			sleep(10)

mob/proc/Bleach(var/Wut,var/obj/Skills/Z,var/bypass=0)
	if(Z)
		if(!locate(Z) in src)
			return
/*	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
		StaffPower=N.Staff_Power
		Element=N.Element*/
	if(bypass||Z)
		switch(Wut)
				//Quincy Stuff here
			if("SanreiActivate")
				var/blurp=input(src,"A Sanrei Glove is in your hand, put it on?","THIS IS PERMANENT, ANGER IS LOWERED AND THIRD EYE CANNOT BE USED") in list("Put it on","Put it away")
				if(blurp=="Put it on")
					if(src.SanreiActive==1||src.SanreiBreak==1)
						src<<"Yo dawg, I heard you like gloves, so I was gonna put a glove on your glove so you can wear a glove on top of yo glove."
						return
					else
						//based it off TE, lesser stats but greater BP than TE...Not sure if this is still too much. Gave Quincy back anger but made it lower than base human.
						SanreiActive=1
						src.AngerMax/=1.2
						src.Recovery*=1.35
						src.SpeedMod*=1.25
						src.BaseMod*=1.75
						if(src.BodyType=="Small")
							src.StrengthMod*=1.5
							src.EnduranceMod*=1.5
							src.ResistanceMod*=1.5
							src.Strength*=1.5
							src.Endurance*=1.5
							src.Resistance*=1.5
						else if (src.BodyType=="Large")
							src.OffenseMod*=1.5
							src.DefenseMod*=1.5
							src.ForceMod*=1.5
							src.SpeedMod*=1.25
							src.Offense*=1.5
							src.Defense*=1.5
							src.Force*=1.5
						else if (src.BodyType=="Medium")
							src.StrengthMod*=1.2
							src.EnduranceMod*=1.2
							src.ForceMod*=1.2
							src.ResistanceMod*=1.2
							src.OffenseMod*=1.2
							src.DefenseMod*=1.2
							src.Strength*=1.2
							src.Endurance*=1.2
							src.Force*=1.2
							src.Resistance*=1.2
							src.Offense*=1.2
							src.Defense*=1.2
						if(!locate(/obj/Skills/LetztStil,src.contents)&&!HTroll)
							src.contents+=new/obj/Skills/LetztStil
							src<<"Be wary, if you break your Sanrei and Activate Letzt Stil; you cannot wear a Sanrei again."
				else
					return

			if("Rasontengai")
				src<<"Tori is too lazy too finish programming this in the middle of the night while she is half asleep so I'll leave you with this message."
				return
				/*if(src.KO==1&&src.RasontengaiSaysFuckYou==0&&Z.Using==0)
					src<<"You manipulate the energy around you, allowing your body to move as if it was a marionette on the strings of your spirit."
					src.OMessage(20,"[src]'s body becomes wrapped in strings of spirit energy, somehow forcing themselves to their feet!","<font color=red>[src]([src.key]) activated Rasontengai.")
					src.Health=100
					src.Energy=src.EnergyMax
					src.RasontengaiSaysFuckYou=1
					src.WorldImmune=1
					Z.Using=1
				else if(src.RasontengaiSaysFuckYou==1&&Z.Using==1)
					src<<"Your spirit strings collapse from view at your will.."
					src.OMessage(20,"[src]'s willingly released their Rasontengai technique.","<font color=red>[src]([src.key]) deactivated Rasontengai.")
					src.Health=(src.Energy/src.EnergyMax*100)
					src.RasontengaiSaysFuckYou=0
					src.WorldImmune=0
					sleep(36000)
					src<<"Dat hour long Rasontengai Cooldown tho."
					Z.Using=0*/

			if("BlutSwitch")
				if(src.BlutOn==1)
					src<<"You can't switch Bluts while one is active...well you could...But I'm too lazy to code it that way."
					return
				else
					if(src.BlutMode=="Artere")
						src<<"Blut Vene Set."
						src.BlutMode="Vene"
						sleep(10)
						return
					else if(src.BlutMode=="Vene")
						src<<"Blut Artere Set."
						src.BlutMode="Artere"
						sleep(10)
						return
			if("BlutActivate")
				if(src.BlutOn==1)

					if(src.BlutMode=="Artere")
						src.OffenseMultiplier/=1.5
						src.ForceMultiplier/=1.5
						src<<"Blut Artere Deactivated"
						src.BlutOn=0
						//src.ActiveBuffs-=1
					else if(src.BlutMode=="Vene")
						src.EnduranceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src<<"Blut Vene Deactivated"
						src.BlutOn=0
						//src.ActiveBuffs-=1
				else
					if(src.ActiveBuffs>=3)
						src<<"You're using too many buffs!"
						return
					else
						if(src.BlutMode=="Artere")
							src.OffenseMultiplier*=1.5
							src.ForceMultiplier*=1.5
							src<<"Blut Artere Activated"
							src.BlutOn=1
							//src.ActiveBuffs+=1
						if(src.BlutMode=="Vene")
							src.EnduranceMultiplier*=1.5
							src.ResistanceMultiplier*=1.5
							src<<"Blut Vene Activated"
							src.BlutOn=1
							//src.ActiveBuffs+=1


			if("LetztStil")
			//InsertCheck for HighTension/Vollstandig Here, cannot be used with.
				var/blurp=input(src,"You think about using Quincy:Letzt Stil... break your Sanrei Glove?","Your Sanrei effects vanish afterward, and your Base power drops to crippling levels.") in list("Break it!", "Pussy out!")
				if(blurp=="Break it!")
					if(src.SanreiActive==1&&LetztStilOn==0)
						src.OMessage(50,"[src]'s power begins to rapidly shoot upward at an unstable rate; entering the Quincy: Letzt Stil!","<font color=red>[src]([src.key]) activated Letzt Stil.")
						var/icon/E=icon('Effects.dmi',"Shock")
						spawn()for(var/turf/e in range(20,src))
							if(prob(60))continue
							if(prob(5))spawn()new/obj/Effects/Lightning(e)
							if(prob(50))sleep(0.3)
						sleep()
						spawn()Shockwave(E,1)
						Quake(10)
						spawn()Shockwave(E,1)
						Quake(20)
						spawn()Shockwave(E,1.5)
						spawn()Shockwave(E,1.5)
						spawn()Crater(src)
						src.overlays+=image('AurasBig.dmi',"Vollstandig",pixel_x=-32)
						src.LetztStilOn=1
						src.Base*=5
						src.BaseMod*=5
						src.ForceMultiplier*=1.25
						src.SpeedMultiplier*=1.25
					else
						src<<"You are either already in Letzt Stil or do not have a working Sanrei Glove!"
						return
				else
					src<<"Wow what a bitch, scared to lose your Sanrei powers?"
//Hollow stuff here

			if("Devour")
				src<<"Hollows no longer need Devours to ascend, only BP. Please have an admin remove this verb from you."
/*				for(var/mob/Players/P in get_step(src,src.dir))
					if(P.KO)
						if(src.Dead)
							if(P.KeepBody==1)
								P.KeepBody=0
								src.KeepBody=1
							if(P.Dead!=1&&P.Race=="Hollow")
								src.Dead=0
							if(P.Dead!=1&&P.Race!="Hollow")
								if(prob(25))
									src.Dead=0
							P.Death(src)
						if(src.Class=="Basic"&&src.DevourCount<=2)
							if(P.BaseMod>src.BaseMod)
								if(P.Dead==1)
									src.DevourCount+=2
								else
									src.DevourCount+=3
							else
								if(P.Dead==1)
									src.DevourCount+=1
								else
									src.DevourCount+=2
							P.Death(src)
						else if(src.Class=="Gillian"&&src.DevourCount<=5)
							if(P.BaseMod>src.BaseMod)
								if(P.Dead==1)
									src.DevourCount+=2
								else
									src.DevourCount+=3
							else
								if(P.Dead==1)
									src.DevourCount+=1
								else
									src.DevourCount+=2
							P.Death(src)

						else if(src.Class=="Adjuucha"&&src.DevourCount<=10)
							if(P.BaseMod>src.BaseMod)
								if(P.Dead==1)
									src.DevourCount+=2
								else
									src.DevourCount+=3
							else
								if(P.Dead==1)
									src.DevourCount+=1
								else
									src.DevourCount+=2
							P.Death(src)
						else if(src.Class=="Vasto Lorde"&&src.DevourCount<=11)
							if(P.BaseMod>src.BaseMod)
								if(P.Dead==1)
									src.DevourCount+=2
								else
									src.DevourCount+=3
							else
								if(P.Dead==1)
									src.DevourCount+=1
								else
									src.DevourCount+=2
							P.Death(src)
						else if(src.Arrancar==1&&src.DevourCount<=15)
							if(P.BaseMod>src.BaseMod)
								if(P.Dead==1)
									src.DevourCount+=2
								else
									src.DevourCount+=3
							else
								if(P.Dead==1)
									src.DevourCount+=1
								else
									src.DevourCount+=2
							P.Death(src)
							if(src.DevourCount>=15)
								src.DevourCount=15
								//src<<"You feel...something inside change, Your mask fragment cracking."
								//src<<"(Hit [Commas(400000*src.BaseMod*20)] Current in Base Form)"
						else
							src<<"You can no longer Devour at this time."
							return*/
			/*if("BreakMask")
				var/blurp=input(src,"Break your mask and become an Arrancar?","RIP IT BITCH") in list("Yes","No")
				if(blurp=="Yes")
					if(src.Arrancar==1)
						src<<"You cannot become a double arrancar!"
						return
					else
						if(src.Class=="Gillian"&&src.Power>=200000*BaseMod&&src.ActiveBuffs==0)
						//src.Power>=500000&&src.ActiveBuffs=0
							src.Arrancar=1
							src.BaseMod*=1.5
							src.Base*=1.5
							src.Class="Gillian Arrancar"
							src.SetVars()
							src<<"After a painful and soul-changing experience, you have become an Arrancar."
						else if(src.Class=="Adjuucha"&&src.Power>=1000000*BaseMod&&src.ActiveBuffs==0)
							src.Arrancar=1
							src.BaseMod*=1.5
							src.Base*=1.5
							src.Class="Adjuucha Arrancar"
							src.SetVars()
							src<<"After a painful and soul-changing experience, you have become an Arrancar."
						else if(src.Class=="Vasto Lorde"&&src.Power>=2000000*BaseMod&&src.ActiveBuffs==0)
							src.Arrancar=1
							src.BaseMod*=1.5
							src.Base*=1.5
							src.Class="Vasto Arrancar"
							src.SetVars()
							src<<"After a painful and soul-changing experience, you have become an Arrancar."

						else
							src<<"You attempt to break your mask, but doing so causes you extreme pain, forcing you to stop."
							src.Health-=50
							return
				else
					return
			if("ForcedHollowEvolve")
				if(src.KO)return
				var/list/Choices=new
				Choices+="Cancel"
				for(var/mob/Players/P in get_step(src,dir)) Choices+=P
				var/mob/Choice=input(src,"Force the Evolution of who?") in Choices
				if(Choice=="Cancel") return
				if(Choice.Arrancar==0)
					if(Choice.DevourCount<2&&Choice.Base>=1875*Choice.BaseMod)
						Choice.DevourCount=2
					if(Choice.DevourCount<5&&Choice.Base>=9375*Choice.BaseMod)
						Choice.DevourCount=5
					if(Choice.DevourCount<7&&Choice.Base>=18750*Choice.BaseMod)
						Choice.DevourCount=7
					if(Choice.Class=="Basic"&&Choice.Arrancar==0)
						//Choice.contents+=new/obj/Skills/BreakMask
						Choice.BaseMod=2.5
						Choice.Class="Gillian"
						Choice<<"You feel the darkness inside you grow...as your power increase and you become a Gillian Class Menos."
						if(prob(50))
							Choice.contents+=new/obj/Skills/BreakMask
							Choice<<"You have unlocked the ability to break your mask at will, becoming an Arrancar."
					if(Choice.Class=="Gillian"&&Choice.Arrancar==0&&Choice.Base>=12500*Choice.BaseMod)
						Choice.BaseMod=3.75
						Choice.Class="Adjuucha"
						Choice<<"You feel the darkness inside you grow...as your power increase and you become a Adjuucha Class Menos."
						if(prob(75))
							if(!locate(/obj/Skills/BreakMask,Choice.contents))
								Choice.contents+=new/obj/Skills/BreakMask
								Choice<<"You have unlocked the ability to break your mask at will, becoming an Arrancar."
					if(Choice.Class=="Adjuucha"&&Choice.Arrancar==0&&Choice.Base>=25000*Choice.BaseMod)
						Choice.BaseMod=5
						Choice.Class="Vasto Lorde"
						Choice<<"You feel the darkness inside you grow...as your power increase and you become a Vasto Lorde."
						if(!locate(/obj/Skills/BreakMask,Choice.contents))
							Choice.contents+=new/obj/Skills/BreakMask
							Choice<<"You have unlocked the ability to break your mask at will, becoming an Arrancar."
			if("ForcedArrancar")
				if(src.KO)return
				var/list/Choices=new
				Choices+="Cancel"
				for(var/mob/Players/P in get_step(src,dir)) Choices+=P
				var/mob/Choice=input(src,"Force Arrancar who?") in Choices
				if(Choice=="Cancel") return
				if(Choice.Arrancar==0)
					if(Choice.Class=="Gillian")
						Choice.Arrancar=1
						Choice.BaseMod*=1.5
						Choice.Base*=1.5
						Choice.Class="Gillian Arrancar"
						Choice.SetVars()
						Choice<<"After a painful and soul-changing experience, you have become an Arrancar."
					else if(Choice.Class=="Adjuucha")
						Choice.Arrancar=1
						Choice.BaseMod*=1.5
						Choice.Base*=1.5
						Choice.Class="Adjuucha Arrancar"
						Choice.SetVars()
						Choice<<"After a painful and soul-changing experience, you have become an Arrancar."
					else if(Choice.Class=="Vasto Lorde")
						Choice.Arrancar=1
						Choice.BaseMod*=1.5
						Choice.Base*=1.5
						Choice.Class="Vasto Arrancar"
						Choice.SetVars()
						Choice<<"After a painful and soul-changing experience, you have become an Arrancar."*/