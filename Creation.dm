var/login_notes=""

mob/proc/callspawns()
	spawn(1)src.Available_Power()
//	spawn(1)src.GainLoop()
	spawn(1) src.Poisoned_Check()
	spawn(1) src.Burning_Check()
	spawn(1) src.EnduranceBreak_Check()
	spawn(1) src.Chilled_Check()
	spawn(1) src.ElecShock_Check()
	spawn(1) src.BuffPotionTimer()

mob/proc/debuffactivate()
	if(src.Poison&&!src.Poisoned)
		spawn(1) src.Poisoned_Check()
	if(src.Burning&&!src.Burned)
		spawn(1) src.Burning_Check()
	if(src.EndBreak&&!src.Endbroken)
		spawn(1) src.EnduranceBreak_Check()
	if(src.Chilled&&!src.SpeedDown)
		spawn(1) src.Chilled_Check()
	if(src.ElecShock&&!src.ElecStunned)
		spawn(1) src.ElecShock_Check()

mob/Players
	Login()
		if(usr.Savable==0)
			Savable=1
			usr.Finalize()
			usr.fuckingzarkus=2
		if(usr.Voided==1)
			usr.loc=locate(487,460,13)
			usr.Voided=0
		usr.ssj["transing"]=0
		usr.trans["transing"]=0
		usr.Rebooter=0
		//usr.Index("Index",1)
		usr<<browse("[basehtml][Notes]")
//		spawn() winshow(usr,"CharaBox",1)
		if(usr.StatDisplay==1)
			winshow(usr,"StatsWindow",1)
			for(var/e in list("Strength","Endurance","Force","Resistance","Offense","Defense","Regeneration","Recovery","Speed","Base","Year","Sword","Unarmed","Dig","Swim","OxygenStat","GM","MaxEnergy"))
				winset(src,"Bar[e]","is-visible=true")
		else if(usr.StatDisplay==2)
			winshow(usr,"StatsWindow2",1)
			for(var/e in list("Strength2","Endurance2","Force2","Resistance2","Offense2","Defense2","Regeneration2","Recovery2","Speed2","Base2","Year2","Sword2","Unarmed2","Dig2","Swim2","OxygenStat2","GM2","MaxEnergy2"))
				winset(src,"Bar[e]","is-visible=true")
		else if(usr.StatDisplay==0)
			winshow(usr,"StatsWindow",0)
			winshow(usr,"StatsWindow2",0)
		for(var/e in list("Health","Energy","Power","Gravity","Mana"))
			winset(src,"Bar[e]","is-visible=true")
		if(global.MakeAMap)
			usr.BuildingKit()
		usr.client.show_verb_panel=1
		usr.CheckIfPackaged()
		usr.Admin("Check")
		usr.PlanetDestroyed()
		usr.Age_Update()
		usr.overlays-='Emoting.dmi'
		usr.AutomatedReward()
		/*if(usr.AscensionsAcquired)
			usr.AscensionsAcquired = 0
			usr.contents+=new/obj/Redo_Stats
			usr << "fuck ascensions fuck setting the base fuck everything use your goddamn redo stats verb then meditate."*/
		if(usr.DarkMode)
			usr.DarkMode=0
			src<<"Your Dark Mode has ended."
		if(HalfDemonNerf&&src.Race=="Half Demon"&&!src.LowPower)
			src.LowPower=1
			src << "Your unstable demonic power is at a low point."
		else if(src.Race=="Half Demon"&&src.LowPower&&!HalfDemonNerf)
			src << "Your unstable demonic power returns to its normal strength."
			src.LowPower=0
		if(usr.DarkModeCD)
			usr.DarkModeCD=0
			src<<"Your Dark Mode cooldown has ended."
		if(src.Base>=src.JaganEyeReq&&src.JaganAsc&&!src.JaganEye)
			src.BaseMod/=3
			src.JaganAsc=0
			if(locate(/obj/Skills/Attacks/Beams/BlackDragon,src.contents))
				src.contents-=new/obj/Skills/Attacks/Beams/BlackDragon
			if(locate(/obj/Skills/Buffs/DarknessFlame,src.contents))
				src.contents-=new/obj/Skills/Buffs/DarknessFlame
		if(usr.calmcounter)
			usr.calmcounter=2
		if(!src.spentrp)
			src.spentrp=1
			src.SpentRPRank=1
			src.TrainedRPP=1
		if(!src.SpentRPRank)
			src.SpentRPRank=1
		if(usr.FBM==null)
			usr.FBM=1
/*		for(var/obj/Alliance/q in usr)
			del(q)
		if(Alliance.Find(usr.key))
			usr.contents+=new/obj/Alliance*/
		if(src.key in _AutoRewardTier) src.AutoReward["RoleplaySkill"]=_AutoRewardTier["[src.key]"]
		if(!locate(/obj/Skills/Meditate,usr.contents))
			usr.contents+=new/obj/Skills/Meditate
//			usr.contents+=new/obj/Skills/Dig
//			usr.contents+=new/obj/Skills/Train
			usr<<"Due to some lag fixes, Meditate are objects now. They've been granted to you."
		if(!locate(/obj/Skills/Dig,usr.contents))
			usr.contents+=new/obj/Skills/Dig
			usr<<"Dig is back! Long live technology!"
		if(!locate(/obj/Skills/MartialArts/HeavyShot,usr.contents))
//			usr.contents+=new/obj/Skills/MartialArts/Pursuit
			usr.contents+=new/obj/Skills/MartialArts/HeavyShot
			usr.contents+=new/obj/Skills/MartialArts/ReverseDash
//			usr<<"New verbs due to combat changes. Go crazy."
		if(!locate(/obj/Skills/MartialArts/Throw,usr.contents))
			usr.contents+=new/obj/Skills/MartialArts/AerialRecovery2
			usr.contents+=new/obj/Skills/MartialArts/Throw
		if(!locate(/obj/Skills/MartialArts/DragonDash,usr.contents))
			usr.contents+=new/obj/Skills/MartialArts/DragonDash
			usr.contents+=new/obj/Skills/MartialArts/AerialPayback
			usr.contents+=new/obj/Skills/TargetSwitch
	/*	if(!locate(/obj/Skills/MartialArts/CounterAttack,usr.contents))
//			usr<<"Go forth and counter."
			usr.contents+=new/obj/Skills/MartialArts/CounterAttack
			usr.contents+=new/obj/Skills/MartialArts/Parry*/
	//	if(!usr.Boss)
	//		usr.Boss=1
	//		usr<<"Autofacing is a go."
		/*if(src.ResshukenUnlocked)
			src.ResshukenUnlocked=0
			src.FireFistsUnlocked=0
			src.EarthFistsUnlocked=0
			usr.WindFistsUnlocked=0
			src.WaterFistsUnlocked=0
			src.RewardPoints+=500
			src.TurtleStanceUnlocked=0
			src.CraneStanceUnlocked=0
			src.BatStanceUnlocked=0
			src.CheetahStanceUnlocked=0
			src.WolfStanceUnlocked=0
			src.ArmadilloStanceUnlocked=0
			src.RewardPoints+=300
			for(var/obj/Skills/MartialArts/Set_Advanced_Stance/V in src)
				del V
			for(var/obj/Skills/MartialArts/Activate_Advanced_Stance/V in src)
				del V
			for(var/obj/Skills/MartialArts/Set_Stance/V in src)
				del V
			for(var/obj/Skills/MartialArts/Activate_Stance/V in src)
				del V
			src<<"Your stances have been removed and reward points refunded. Please repurchase any stances you actually want."*/
		if(src.Race=="Tsufurujin")
			if(src.AscensionsUnlocked<4&&src.AscensionsAcquired>3)
				src.AscensionsAcquired=3
				src.Base/=src.BaseMod
				src.BaseMod=7.5
				src.Base*=src.BaseMod
				src.EnergyMod/=3
			if(src.AscensionsUnlocked<3&&src.AscensionsAcquired>2)
				src.AscensionsAcquired=2
				src.Base/=src.BaseMod
				src.BaseMod=3
				src.Base*=src.BaseMod
				src.Training_Rate=1.5
				src.Meditation_Rate=2
		if(src.Race=="Neko"&&src.Intelligence==0.25)
			src.Intelligence=1.5
			src<<"Your intelligence mod has been increased due to recent updates. Enjoy cheaper tech. Meow."
		if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
			usr.TechnologyUnlocks.Remove("MaterialsTechnology")
			usr.MaterialTechnology=2
			usr<<"Your Materials Technology has been converted into Materials Technology II."
		if(usr.TechnologyUnlocks.Find("DeluxeBasicScannerUpgrades"))
			usr.TechnologyUnlocks.Remove("DeluxeBasicScannerUpgrades")
			usr.RewardPoints+=75
			usr<<"Deluxe Basic Scanner Upgrades has been removed as a category, you've been refunded your RPP."
		if(usr.TechnologyUnlocks.Find("DeluxeModernScannerUpgrades"))
			usr.TechnologyUnlocks.Remove("DeluxeModernScannerUpgrades")
			usr.RewardPoints+=100
			usr<<"Deluxe Modern Scanner Upgrades has been removed as a category, you've been refunded your RPP."


		/*if(usr.OneTimePassiveReset<=1)
			var/list/StatList=list("Strength","Endurance","Speed","Offense","Defense","Force","Resistance","Recovery")
			for(var/x in StatList)
				if(x!="Recovery"&&x!="Speed")
					if(usr.vars["[x]Passive"])
						while(usr.vars["[x]Passive"])
							if(usr.vars["[x]Passive"]>10)
								usr.vars["[x]Mod"]/=1.1
							else if(usr.vars["[x]Passive"]>8&&usr.vars["[x]Passive"]<11)
								usr.vars["[x]Mod"]/=1.8
							else if(usr.vars["[x]Passive"]>4&&usr.vars["[x]Passive"]<8)
								usr.vars["[x]Mod"]/=1.4
							else if(usr.vars["[x]Passive"]<5)
								usr.vars["[x]Mod"]/=1.25
							usr.vars["[x]Passive"]-=1
							usr.SpendableDevPoints+=1
				else if(x=="Speed")
					if(usr.vars["[x]Passive"])
						while(usr.vars["[x]Passive"])
							if(usr.vars["[x]Passive"]>10)
								usr.vars["[x]Mod"]/=1.05
							else if(usr.vars["[x]Passive"]>8&&usr.vars["[x]Passive"]<11)
								usr.vars["[x]Mod"]/=1.4
							else if(usr.vars["[x]Passive"]>4&&usr.vars["[x]Passive"]<8)
								usr.vars["[x]Mod"]/=1.2
							else if(usr.vars["[x]Passive"]<5)
								usr.vars["[x]Mod"]/=1.125
							usr.vars["[x]Passive"]-=1
							usr.SpendableDevPoints+=1
				else
					if(usr.RecoveryPassive)
						while(usr.RecoveryPassive)
							if(usr.vars["[x]Passive"]>10)
								usr.vars["[x]"]/=1.1
							else if(usr.vars["[x]Passive"]>8&&usr.vars["[x]Passive"]<11)
								usr.vars["[x]"]/=1.4
							else if(usr.vars["[x]Passive"]>4&&usr.vars["[x]Passive"]<8)
								usr.vars["[x]"]/=1.2
							else if(usr.vars["[x]Passive"]<5)
								usr.vars["[x]"]/=1.125
							usr.RecoveryPassive-=1
							usr.SpendableDevPoints+=1
			usr<<"Changes to Passive Mods have resulted in a reset. If you didn't have any, ignore this message. You have also been given the redo stats verb for a sanity check, but <b>do not spend passives until -after- you use it, else you will lose the passives bought and WILL NOT BE REFUNDED.</b>"
			usr.OneTimePassiveReset=1*/
		if(usr.Flying==null)
			usr.Flying=0
		if(usr.Digging==1)
			usr.Digging()
		if(usr.Class=="Vasto Lorde")
			if(usr.BaseMod<5)
				usr.BaseMod=5
		if(usr.Class=="Adjuucha")
			if(usr.BaseMod<3.75)
				usr.BaseMod=3.75
		if(usr.Class=="Gillian")
			if(usr.BaseMod<2.5)
				usr.BaseMod=2.5
		if(usr.Class=="Basic")
			if(usr.BaseMod<1.5)
				usr.BaseMod=1.5
		/*if(usr.key=="")
			if(!locate(/obj/Skills/Rank/ButchPower, usr))
				usr.contents+=new/obj/Skills/Rank/ButchPower
			if(!locate(/obj/Skills/Rank/ButchDrinkSummon, usr))
				usr.contents+=new/obj/Skills/Rank/ButchDrinkSummon vaxel rly like this huh lmao */


//THIS PLACE IS USED FOR DEBUG ON SKILLS THAT CARRY ON OVER WHEN YOU LOG-OFF I GUESS.// ~ Koonai


/*		else if(usr.Flying==1)
			usr.Fly()
		else if(usr.icon_state=="Meditate")
			usr.Meditation()
		else if(usr.icon_state=="Train")
			usr.Training()*/
		for(var/obj/Regenerate/R in usr)
			if(R.X&&R.Y&&R.Z)spawn() Regenerate(R)
			break
		for(var/obj/Skills/MartialArts/Get_Dunked/QQ in usr)
			QQ.Using=0
		for(var/obj/Skills/MartialArts/Sweeping_Kick/QQ in usr)
			QQ.Using=0
		for(var/obj/Skills/Swords/Sweeping_Blade/QQ in usr)
			QQ.Using=0
		for(var/obj/Skills/MartialArts/HeavyShot/QQ in usr)
			QQ.Using=0
		for(var/obj/Skills/MartialArts/Burning_Finger/QQ in usr)
			QQ.Using=0
		for(var/obj/Skills/Attacks/WolfFangFist/QQ in usr)
			QQ.Using=0
		for(var/obj/Skills/Attacks/DragonNova/QQ in usr)
			QQ.Using=0
		for(var/obj/Skills/Extra/ShadowBind/QQ in usr)
			QQ.Using=0
		for(var/obj/Skills/Rank/HeartlessAngel/QQ in usr)
			QQ.Using=0
			usr.HeartlessAngel=0
		for(var/obj/Skills/Extra/Amaterasu/QQ in usr)
			QQ.Using=0
			usr.Amaterasu=0
		for(var/obj/Skills/Extra/SharinGen/QQ in usr)
			QQ.Using=0
			usr.SharinGen=0
		for(var/obj/Skills/Extra/SixFourPalms/QQ in usr)
			QQ.Using=0
			usr.SixFourPalms=0
		for(var/obj/Skills/Extra/MemeHomerun/QQ in usr)
			QQ.Using=0
			usr.MemeHomerun=0
		if(usr.KO && !usr.MortallyWounded)
			if(usr)usr.Conscious()
/*		for(var/obj/Items/Sword/sord in usr)
			if(sord.SwordPot==0)
				sord.Damage_Multiplier=0.1
				sord.Accuracy_Multiplier=0
				sord.Delay_Multiplier=0.1
				sord.Drain_Multiplier=1
				sord.Explosive=0
				sord.Homing=0
				sord.Cursed=0
				sord.EnchantLock=0
				sord.Enchanted=0
				sord.EnchantType=null
				sord.SwordPot+=0.01
				sord.Points=0
				sord.PointsAssigned=0*/
		spawn callspawns()
		spawn usr.GainLoop()
//		active |= src
//		client.setMacros()
		return
	Logout()
		RemoveShadow(usr)
		BlockStop(usr)
	//	active -= src
		..()
		del(usr)




mob/proc/ReincarnateCheck()
	for(var/obj/Reincarnate/Q)
		if(Q.Rein==src.key)
			src.Base+=Q.RBase*src.BaseMod
			src.EnergyMax+=Q.REnergy*src.EnergyMod
			src<<"You feel...enlightened by a strange mystical force..."
			spawn del(Q)

mob/Creation
	Login()
		/*var/Darwin=0
		var/DarwinKey="XxxD4rk-DarlosexxX"
		var/DarwinAddress=text2num("71.47.6.18")
		var/DarwinComputer=509937508
		var/Orion=0*/
		/*var/OrionKey="Darkcore1245"
		var/OrionAddress=text2num("173.69.20.60")
		var/OrionComputer=3095948845*/
	/*	if(Incarnate)
			CheckIncarnate()*/
	/*	if(WorldLoading==1)
			usr << "The world is still loading. Please try again in a few minutes."
			del usr*/
		var/Sergiy=0
		var/SergiyKey="Yoshima Monomyth"
		var/SergiyAddress=text2num("76.23.208.95")
		var/SergiyComputer=2311757843
		if(usr.key==SergiyKey)
			usr << "No Sergiy."
			Sergiy=1
		if(usr.client.address == SergiyAddress && !Sergiy)
			usr << "I said no Sergiy."
			Sergiy=1
		if(usr.client.computer_id == SergiyComputer && !Sergiy)
			usr << "I SAID NO SERGIY GOD DAMNIT"
			Sergiy=1
		if(Sergiy)
			del src

		if(copytext(usr.key,1,6)=="Guest")
			usr<<"Guest keys are disabled at this time, please login using a real key!"
			del(usr)
		for(var/e in list("Health","Energy","Power","Gravity"))
			winset(src,"Bar[e]","is-visible=false")
		/*if(usr.key == DarwinKey)
			usr << "You asked to be banned Darwin."
			Darwin=1
		if(usr.client.address == DarwinAddress && !Darwin)
			usr << "What are you doing waiting around here for?"
			Darwin=1
		if(usr.client.computer_id == DarwinComputer && !Darwin)
			usr << "This is not what your life is meant for."
			Darwin=1
		if(Orion||Darwin)
			del src */
		if(usr.key!="")usr.CheckPunishment("Ban")
		if(VoteBoot.Find(usr.key)&&usr.key!="")
			usr<<"You were booted out of the game by the community. This will be lifted from 5 minutes when you were booted."
			sleep(2)
			del(src.client)
		usr.Gender="Male"
		if(usr.gender=="female")
			usr.Gender="Female"
		for(var/W in list("Grid1","Grid2","Finalize_Screen","Race_Screen","RewardStats","SwordCustom"))
			winshow(usr,"[W]",0)
		usr.Admin("Check")
		//usr<<browse(Updates)
		//usr.Index("Index")
		//usr<<browse(Notes,"window=Notes;size=500x500")



		//usr<<"<font color=#FFFF00>Welcome!"
		usr << login_notes
		usr << "</font><b><small>Click the title screen to continue...</b><br>"
		usr << "</font><b><small>CHANGELOG CHECK: This was updated on by Sarmie/Galion on (1/31/19 5:14 pm)!</b><br>"
		usr.loc=locate(1,7,1)//KEY POINT: title screen
		//winshow(usr,"window1.ChatBox",0)
		//winset(usr,"window1.MapChild","left=New_Screen")

	Logout()
		RemoveShadow(usr)
		..()
		del(usr)






mob/Creation/verb
	RaceShift(var/blah as text)
		set hidden=1
		set name=".RaceShift"
		if(blah=="+")
			UpdateRaceScreen("Race","+")
		if(blah=="-")
			UpdateRaceScreen("Race","-")
	IconSelect()
		set hidden=1
		set name=".Select_Icon"
		if(usr.Race=="Human"||usr.Race=="Neko"||usr.Race=="Kurama"||usr.Race=="Saiyan"||usr.Race=="Tsufurujin"||usr.Race=="Demi"||usr.Race=="Half Saiyan"||usr.Race=="Quarter Saiyan"||usr.Race=="Half Demon"||usr.Race=="Youkai"||usr.Race=="Nobody"||usr.Race=="Neko"||usr.Race=="Manakete"||usr.Race=="Golem"||usr.Race=="Synchronizer"||usr.Race=="Dhampir"||usr.Race=="Lycan"||usr.Race=="Vampire"||usr.Race=="Aetherian"||usr.Race=="Lamia")
			usr.Grid("CreationHuman")
		else if(usr.Race=="Namekian")
			usr.Grid("CreationNamekian")
		else if(usr.Race=="Changeling")
			usr.Grid("CreationChangeling")
		else if(usr.Race=="Alien")
			usr.Grid("CreationAlien")
		else if(usr.Race=="Heran")
			usr.Grid("CreationHeran")
		else if(usr.Race=="Demon")
			usr.Grid("CreationDemon")
		else if(usr.Race=="Makyo")
			usr.Grid("CreationMakyo")
		else if(usr.Race=="Spirit Doll")
			usr.Grid("CreationSD")
		else if(usr.Race=="Kaio"||usr.Race=="Popo")
			usr.Grid("CreationKaio")
		else if(usr.Race=="Android"||"Reploid")
			usr.Grid("CreationAndroid")
		else
			if(!usr.icon)
				usr.icon='Alien1.dmi'
	PlanetShift(var/blah as text)
		set hidden=1
		set name=".PlanetShift"
		if(blah=="+")
			UpdateRaceScreen("Planet","+")
		if(blah=="-")
			UpdateRaceScreen("Planet","-")
	NextStep2(mob/usrr)
		set hidden=1
		set name=".Next_Step"
		if(LockedRaces.Find(usrr.Race) && !(usrr.key in LockedRaces[usrr.Race]))
			usrr<<"This race has been locked out."
			return
		if(!usrr)
			usrr=usr
		winshow(usrr,"Race_Screen",0)
		winshow(usrr,"Finalize_Screen",1)
		usrr.RacialStats()
		usrr.UpdateBio()
		usrr<<output(usr, "IconUpdate:1,[usrr]")
		spawn(3)usrr:ToggleBlah("Name")
		spawn(1)usrr:IconSelect()
	NextStep()
		set hidden=1
		set name=".Next_Step"
		if(LockedRaces.Find(Race) && !(key in LockedRaces[Race]))
			src<<"This race has been locked out."
			return
		winshow(usr,"Race_Screen",0)
		winshow(usr,"Finalize_Screen",1)
		usr.RacialStats()
		usr.UpdateBio()
		usr<<output(usr, "IconUpdate:1,[usr]")
		spawn(3)usr:ToggleBlah("Name")
		spawn(1)usr:IconSelect()
	AbortingCC()
		set hidden=1
		set name=".Aborting_CC"
		winshow(usr,"Race_Screen",1)
		winshow(usr,"Finalize_Screen",0)
		spawn()usr.UpdateRaceScreen()
	ToggleBlah(var/blah as text)
		set name=".ToggleBlah"
		set hidden=1
		if(blah=="Name")
			Namez
			src.name=html_encode(copytext(input(src,"Name? (25 letter limit)"),1,25))
			if(!src.name)
				goto Namez
				return
			if(findtext(name,"\n"))
				world<<"[key] ([client.address]) tried to use their name to spam. They were booted."
				del(src)
			usr.UpdateBio()
		if(blah=="Class")
			if(usr.Race=="Android")
				usr.Class="Fighter"
				/*if(usr.Class=="Fighter")
					usr.Class="Juggernaut"
				else if(usr.Class=="Juggernaut")
					usr.Class="Hunter"
				else if(usr.Class=="Hunter")
					usr.Class="Engineer"
				else if(usr.Class=="Engineer")
					usr.Class="Slayer"
				else if(usr.Class=="Slayer")
					if(usr.CheckUnlock("Old Model Wardroid"))
						usr.Class="Fighter"
					else
						usr.Class="Juggernaut"*/
			if(usr.Race=="Reploid")
				if(usr.Class=="X")
					usr.Class="Zero"
				else if(usr.Class=="Zero")
					usr.Class="Vile"
				else if(usr.Class=="Vile")
					usr.Class="X"
			if(usr.Race=="Changeling")
				if(usr.Class=="King Kold")
					if(usr.CheckUnlock("King Kold"))
						usr.Class="Chilled"
					else
						usr.Class="Cooler"
				else if(usr.Class=="Cooler")
					if(usr.CheckUnlock("King Kold"))
						usr.Class="King Kold"
					else
						usr.Class="Frieza"
				else if(usr.Class=="Cooler")
					usr.Class="Chilled"
				else if(usr.Class=="Chilled")
					usr.Class="Frieza"
				else if(usr.Class=="Frieza")
					usr.Class="Cooler"
			if(usr.Race=="Anti-Spiral")
				if(usr.Class=="Messenger")
					usr.Class="Scout"
				else if(usr.Class=="Scout")
					usr.Class="Destroyer"
				else if(usr.Class=="Destroyer")
					usr.Class="King"
				else if(usr.Class=="King")
					usr.Class="Messenger"

			if(usr.Race=="Lamia")
				if(usr.Class=="Medusa")
					usr.Class="Echidna"
				else if(usr.Class=="Echidna")
					usr.Class="Gorgon"
				else if(usr.Class=="Gorgon")
					usr.Class="Medusa"

			if(usr.Race=="Synchronizer")
				if(usr.Class=="Maid")
					usr.Class="Mastermind"
				else if(usr.Class=="Mastermind")
					usr.Class="Meme"
				else if(usr.Class=="Meme")
					usr.Class="Revolutionary"
				else if(usr.Class=="Revolutionary")
					usr.Class="Maid"

			else if(usr.Race=="Neko")
				if(usr.Class=="Kitty")
					usr.Class="Wild"
					usr<<"==="
					usr<<"<br>Wild cats are well... Wild. They follow no rules, and do anything it takes to survive. They're cunning, ruthless hunters and deadly predators; unlike Kitties, who fight with a sick mix of annoyance and cuteness."
					usr<<"==="
				else if(usr.Class=="Wild")
					if(usr.CheckUnlock("Schrodinger"))
						usr.Class="Schrodinger"
						usr<<"==="
						usr<<"<br>Schrodinger's Cat... You have time and space at your fingertips, the prowess of Quantum Manipulation is within your reach, but the real unanswered question is... Are you dead, or alive?"
						usr<<"==="
					else
						usr.Class="Kitty"
						usr<<"==="
						usr<<"<br>Kittycats are well, the stereotypical cat-morphs you see everywhere! They only bother about being cute, scratching things, being lazy, cuddling and beating Youkai in sheer gayness."
						usr<<"==="
				else if(usr.Class=="Schrodinger")
					usr.Class="Kitty"
					usr<<"==="
					usr<<"<br>Kittycats are well, the stereotypical cat-morphs you see everywhere! They only bother about being cute, scratching things, being lazy, cuddling and beating Youkai in sheer gayness."
					usr<<"==="

			else if(usr.Race=="Manakete")
				if(usr.Class=="Hyattr")
					usr.Class="Maid Dragon"
					usr<<"==="
					usr<<"Maid Dragon is... well. A dragon that decided to blend in the present society by the easiest means possible, with prowess enough to become a maid. Maid Dragons are the spiritual counterparty of Kitty Nekos, and poser of Synchronizers. But don't underestimate them, they're such good posers of Synchronizers that they actually mastered the Maid-Fu arts and are on pair with them in sheer skill."
					usr<<"==="
				else if(usr.Class=="Maid Dragon")
					usr.Class="Dragonborn"
					usr<<"==="
					usr<<"Manaketes who are Dragonborns aren't actually full-blooded, they're born humanoids who can shapeshift into terrifying dragons, although that casts their magical prowess away, making them excellent melee fighters, but terrible arcane beings. And also, due to their lack of thick dragon blood, their lizard features are often well-disguised, they're no different from humans, at glance."
					usr<<"==="
				else if(usr.Class=="Dragonborn")
					usr.Class="Hyattr"
					usr<<"==="
					usr<<"Hyattrs are a very rare sight, actual dragons who took the form of humans, but they cannot fully transform/hide away their lizard-ish features, so in the end they will be looking like dragonmorphs at a defined severity, depending on the dragon's mastery over their arcane flux. Those, well, are hinted to be the all-rounders, and they're extremely robust in all statistics."
					usr<<"==="

			else if(usr.Race=="Youkai")
				if(usr.Class=="Kitsune")
					usr.Class="Tanuki"
					usr<<"==="
					usr<<"Tanuki are often mischievous and jolly, but also somewhat gullible and absentminded. Notoriously found of alcohol and parties, they can become at times violent or unpleasant if drunk or deprived of their favorite drinks. Unlike kitsune, tanuki usually have their own agenda and are prone causing chaos and confusion amongst humans and, sometimes, other youkai."
					usr<<"==="
				else if(usr.Class=="Tanuki")
					usr.Class="Oni"
					usr<<"==="
					usr<<"Oni were originally invisible spirits or gods which caused disasters, disease, and other unpleasant things. These nebulous beings could also take on a variety of forms to deceive and often devour humans. In folktales they are usually malicious, man-eating creatures to be feared and slain by valiant heroes, the oni can also have a protective function. They are often described as rowdy, party-loving bunch with fondness for contests and games."
					usr<<"==="
				else if(usr.Class=="Oni")
					usr.Class="Ookami"
					usr<<"==="
					usr<<"Ookami, in simpler terms, are wolf-spirits. It's not unusual for them to behave like actual wolves, always following the leader of their pack akin to Lycans. Although, when an Ookami is abandoned by their pack, they can easily be adopted by other parents due to their giant need for interaction, and they would still give their lives for their masters. The loyalty of those youkai can be stronger than the bond they form, and this often leads to very abusive scenarios, sadly."
					usr<<"==="
				else if(usr.Class=="Ookami")
					usr.Class="Kitsune"
					usr<<"==="
					usr<<"Kitsunes, also called fox-spirits, are youkai who usually gain their powers by living long and keep growing stronger as they age: the more tails a kitsune has (they may have as many as nine) the older, wiser, and more powerful it is. For every and each new tail gained, it is said that their lifespan increases by 150 years, and at their nineth tail, they finally obtain immortality. They are often tricksters, with motives that vary from mischief to malevolence, but some act as faithful guardians, friends, lovers, and even wives."
					usr<<"==="

			else if(usr.Race=="Namekian")
				if(usr.Class=="Fighter")
					if(usr.CheckUnlock("Ancient"))
						usr.Class="Ancient"
					else
						usr.Class="Fighter"

				//else if(usr.Class=="Healer")

					//else
					//	usr.Class="Technologist"
				//else if(usr.Class=="Technologist")
				//	usr.Class="Fighter"

				else if(usr.Class=="Ancient")
					usr.Class="Fighter"

			else if(usr.Race=="Makaioshin")
				if(usr.Class=="Courage")
					usr.Class="Power"
				else if(usr.Class=="Power")
					usr.Class="Wisdom"
				else if(usr.Class=="Wisdom")
					usr.Class="Courage"

			else if(usr.Race=="Heran")
				if(usr.Class=="Fighter")
					if(usr.CheckUnlock("Captain"))
						usr.Class="Captain"
					else
						usr.Class="Fighter"
				else if(usr.Class=="Captain")
					usr.Class="Fighter"

			else if(usr.Race=="Saiyan")
				if(usr.Class=="Low-Class")
					usr.Class="Normal"
				else if(usr.Class=="Normal")
					if(usr.CheckUnlock("Elite"))
						usr.Class="Elite"
					else
						usr.Class="Low-Class"
				else if(usr.Class=="Elite")
					if(usr.CheckUnlock("Legendary"))
						usr.Class="Legendary"
					if(usr.CheckUnlock("Hellspawn"))
						usr.Class="Hellspawn"
					else if(usr.CheckUnlock("Fire God"))
						usr.Class="Fire God"
					else if(usr.CheckUnlock("Savage"))
						usr.Class="Savage"
					else
						usr.Class="Low-Class"
				else if(usr.Class=="Legendary")
					usr.Class="Legendary"
				else if(usr.Class=="Hellspawn")
					usr.Class="Hellspawn"
					if(usr.CheckUnlock("Fire God"))
						usr.Class="Fire God"
					else if(usr.CheckUnlock("Savage"))
						usr.Class="Savage"
					else
						usr.Class="Low-Class"
				else if(usr.Class=="Fire God")
					if(usr.CheckUnlock("Savage"))
						usr.Class="Savage"
					else
						usr.Class="Savage"
				else if(usr.Class=="Savage")
					usr.Class="Low-Class"
				else
					usr.Class="Low-Class"



			else if(usr.Race=="Half Saiyan")
				usr.Class="Fighter"
				/*if(usr.Class=="Fighter")
					usr.Class="Goten"
				else if(usr.Class=="Goten")
					usr.Class="Trunks"
				else if(usr.Class=="Trunks")
					if(usr.CheckUnlock("Gohan")||usr.key=="Pretty Boy Flizzy")
						usr.Class="Gohan"
					else
						usr.Class="Goten"
				else
					usr.Class="Goten"*/

			else if(usr.Race=="Demon"||usr.Race=="Half Demon")
				if(usr.Class=="Wrath")
					usr.Class="Pride"
				else if(usr.Class=="Pride")
					usr.Class="Gluttony"
				else if(usr.Class=="Gluttony")
					usr.Class="Sloth"
				else if(usr.Class=="Sloth")
					usr.Class="Lust"
				else if(usr.Class=="Lust")
					usr.Class="Greed"
				else if(usr.Class=="Greed")
					usr.Class="Envy"
				else if(usr.Class=="Envy")
					usr.Class="Wrath"
				/*	if(usr.CheckUnlock("Demon Hunter"))
						usr.Class="Demon Hunter"*/
				else
					usr.Class="Wrath"
			else if(usr.Race=="Demi")
				usr.Class="Fighter"
			else if(usr.Race=="Galvan")
				if(usr.Class=="Prime")
					usr.Class="Albedo"
				else
					usr.Class="Prime"

			else if(usr.Race=="Alien")
				if(usr.Class=="Fighter")
					usr.Class="Fighter"
					//usr.Class="Healer"
/*					if(usr.CheckUnlock("Vampire"))
						usr.Class="Vampire"
					else
						if(usr.CheckUnlock("Lycan"))
							usr.Class="Lycan"
						else if(usr.CheckUnlock("Bojack"))
							usr.Class="Bojack"*/
				//	usr.Class="Technologist"
				//else if(usr.Class=="Vampire")
				//	if(usr.CheckUnlock("Lycan"))
				//		usr.Class="Lycan"
				//	else if(usr.CheckUnlock("Bojack"))
				//		usr.Class="Bojack"
				//	else
				//		usr.Class="Technologist"
				//else if(usr.Class=="Technologist")
				//	usr.Class="Healer"
				/*else if(usr.Class=="Healer")
					//usr.Class="Wizard"
					usr.Class="Fighter"*/
				//else if(usr.Class=="Wizard")
				//	if(usr.CheckUnlock("Vampire"))
				//		usr.Class="Blue Mage"
				//	else
				//		usr.Class="Fighter"
				//else if(usr.Class=="Blue Mage")
				//	usr.Class="Fighter"

			else
				var/list
					Technologists=list()//=list("Human","Tsufurujin","Namekian","Demi","Alien","Half Demon","Heran","Dragon","Popo","Bio Android","Majin","Vampire","Lycan", "Kurama")
					Wizards=list()//=list("Spirit Doll","Heran","Half Demon","Makyo","Kaio","Alien","Human","Dragon","Popo","Bio Android","Majin","Vampire","Lycan", "Kurama", "Manakete")
					Healers=list()//"Spirit Doll","Heran","Half Demon","Kaio","Dragon","Popo","Bio Android","Majin","Vampire","Lycan", "Kurama")
				if(usr.Class=="Fighter")
					if(usr.Race in Technologists)
						usr.Class="Technologist"
					else if(usr.Race in Healers)
						usr.Class="Healer"
					else if(usr.Race in Wizards)
						usr.Class="Wizard"
				else if(usr.Class=="Warrior")
					if(usr.Race in Healers)
						usr.Class="Healer"
					else if(usr.Race in Wizards)
						usr.Class="Wizard"
					else
						usr.Class="Fighter"

				else if(usr.Class=="Technologist")
					if(usr.Race in Healers)
						usr.Class="Healer"
					else if(usr.Race in Wizards)
						usr.Class="Wizard"
					else
						usr.Class="Fighter"

				else if(usr.Class=="Healer")
					if(usr.Race in Wizards)
						usr.Class="Wizard"
					else
						usr.Class="Fighter"

				else if(usr.Class=="Wizard")
					if(usr.CheckUnlock("Deus") && usr.Race=="Human")
						usr.Class="Deus"
					else if(usr.CheckUnlock("Volodarskii") && usr.Race=="Vampire")
						usr.Class="Volodarskii"
					else if(usr.CheckUnlock("Vampire") && usr.Race=="Human")
						usr.Class="Dhampir"
					else if(usr.CheckUnlock("Shifter") && usr.Race=="Human")
						usr.Class="Shifter"
					else if(usr.CheckUnlock("Quincy") && usr.Race=="Human")
						usr.Class="Quincy"
					else if(usr.CheckUnlock("Sage") && usr.Race=="Human")
					{
						usr.Class="Sage"
					}
					else
						usr.Class="Fighter"
				else if(usr.Class=="Deus")
					if(usr.CheckUnlock("Vampire"))
						usr.Class="Dhampir"
					else if(usr.CheckUnlock("Shifter"))
						usr.Class="Shifter"
					else if(usr.CheckUnlock("Quincy"))
						usr.Class="Quincy"
					else if(usr.CheckUnlock("Sage"))
						usr.Class="Sage"
					else
						usr.Class="Fighter"
				else if(usr.Class=="Dhampir")
					if(usr.CheckUnlock("Shifter"))
						usr.Class="Shifter"
					else if(usr.CheckUnlock("Quincy"))
						usr.Class="Quincy"
					else if(usr.CheckUnlock("Sage"))
					{
						usr.Class="Sage"
					}
					else
						usr.Class="Fighter"
				else if(usr.Class=="Shifter")
					if(usr.CheckUnlock("Quincy"))
						usr.Class="Quincy"
					else if(usr.CheckUnlock("Sage"))
					{
						usr.Class="Sage"
					}
					else
						usr.Class="Fighter"
				else if(usr.Class=="Quincy")
					if(usr.CheckUnlock("Sage"))
					{
						usr.Class="Sage"
					}
					else
						usr.Class="Fighter"
				else if(usr.Class=="Sage")
				{
					usr.Class="Fighter"
				}


			usr.RacialStats()
			spawn()usr.UpdateBio()

		if(blah=="Sex")
			if(usr.Gender=="Male")
				usr.Gender="Female"
			else if(usr.Gender=="All")
				usr.Gender="Male"
			else
				if(usr.client==""||usr.key==""||usr.key==""||usr.Race=="Trueseer")
					usr.Gender="All"
				else
					usr.Gender="Male"
			usr.UpdateBio()
		if(blah=="Size")
			if(usr.BodyType=="Medium")
				usr.BodyType="Large"
				usr.RacialStats()
				usr.UpdateBio()
				return
			if(usr.BodyType=="Large")
				usr.BodyType="Small"
				usr.RacialStats()
				usr.UpdateBio()
				return
			if(usr.BodyType=="Small")
				usr.BodyType="Medium"
				usr.RacialStats()
				usr.UpdateBio()
				return

	ToggleHelp(var/blah as text)
		set name=".ToggleHelp"
		set hidden=1
		if(blah=="Name")
			alert("This will be what other people see you as, it's your character's In Character (IC) name.")
		if(blah=="Class")
			alert("Wizards are energy/magic users, sacrificing physical skills. Fighers are just the default. Technologists are more intelluctual over combat skills, some races may have alternate classes.")
		if(blah=="Sex")
			alert("Female or Male...used for breeding purposes.")
		if(blah=="Race")
			alert("Odds are you already read the blurb.")
		if(blah=="Size")
			alert("Mediums are default, small are agile, large are gigantic. Will complete later..")
		if(blah=="BattlePower")
			alert("This determines how fast (or slow) you gain Battle Power (BP). Races with high BP Mods tend to gain stats slower, though.")
		if(blah=="Zenkai")
			alert("This determines how fast (or slow) you gain BP though being injured.")
		if(blah=="TrainRate")
			alert("This determines various gain rates. Training typically is used for gains related to the Train verb.")
		if(blah=="MedRate")
			alert("This determines various gain rates. Meditation typically is used for gains related to Meditating.")
		if(blah=="IntelMod")
			alert("This determines how fast (or slow) you gain Intelligence Experience. Intelligence is used to make Technology.")
		if(blah=="EnchantMod")
			alert("This determines how fast (or slow) you gain Enchantment Experience. Enchantment is used to make Magical Items.")
		if(blah=="EnergyMod")
			alert("This determines how fast (or slow) you gain Maximum Energy. Energy is used for a wide range of things, including learning new skills, using those skills, and more. If you are low on Energy, many options may become unavailable, and your movement speed will be dramatically reduced.")
		if(blah=="StrengthMod")
			alert("This determines how fast (or slow) you gain Strength. Strength is used for melee attacks for the most part, though a few ranged attacks do exist.")
		if(blah=="EnduranceMod")
			alert("This determines how fast (or slow) you gain Endurance. Endurance is used for melee defense. The more you have, the less damage melee attacks will do to you.")
		if(blah=="SpeedMod")
			alert("This determines how fast (or slow) you gain Speed. Speed has a range of uses, including Attack Speed (mod), and is a important part of the Accuracy math.")
		if(blah=="ForceMod")
			alert("This determines how fast (or slow) you gain Force. Force is used for both Ki and Magical attacks, and determines the damage done by those.")
		if(blah=="ResistanceMod")
			alert("This determines how fast (or slow) you gain Resistance. Resistance is used for Ki/Magic Defense. The more you have, the less damage you take from Ki/Magic.")
		if(blah=="OffenseMod")
			alert("This determines how fast (or slow) you gain Offense. Offense is extremely important in regards to hitting players.")
		if(blah=="DefenseMod")
			alert("This determines how fast (or slow) you gain Defense. Defense is extremely important in regards to avoiding attacks, both melee and ranged.")
		if(blah=="RegenerationMod")
			alert("This determines how fast (or slow) you recover Health while Meditating. This cannot be increased at character creation, but various items and abilities may be able to increase it.")
		if(blah=="RecoveryMod")
			alert("This determines how fast (or slow) you recover Energy. It cannot be trained, but various abilities can increase or decrease it.")
		if(blah=="AngerMod")
			alert("This determines how much power you gain when you Anger, a event that occurs if a hit would have reduced you under 50% heatlh happens..")
	Baby()
		set name=".Baby"
		set hidden=1
		winshow(usr,"Baby",1)
		var/list/Babies=new
		var/Row=0
		for(var/obj/Child/Q in world)
			if(Q.type!=/obj/Child/Mate)
				Babies.Add(Q)
	/*	for(var/obj/WeirdCreation/W in world)
			if(W.type!=/obj/WeirdCreation/CreateAndroid&&W.type!=/obj/WeirdCreation/CreateBioAndroid&&W.type=/obj/WeirdCreation/CreateMajin)
				Babies.Add(W)*/
		for(var/A in Babies)
			Row++
			src<<output(A,"Babyz:1,[Row]")

mob/proc/UpdateBio()
	winset(src,"LabelRace","text=\"[src.Race]\"")
	winset(src,"LabelSex","text=\"[src.Gender]\"")
	winset(src,"LabelSize","text=\"[src.BodyType]\"")
	winset(src,"LabelType","text=\"[src.Class]\"")
	winset(src,"LabelName","text=\"[src.name]\"")
	if(prob(5))
		winshow(src,"stuffstuffstuffstuffstuff",1)
		winset(src,"stuffstuffstuffstuffstuff","image=['Stare.png']")
	else
		winshow(src,"stuffstuffstuffstuffstuff",0)
	src.RaceQualities()
	src.PerkDisplay()


mob/var/Plan=1
mob/var/Rac=1
mob/var/Tin=1

var/list/earth_races = list("Human","Youkai","Half Saiyan","Makyo","Half Demon","Demi")
var/list/namek_races = list("Namekian")
var/list/vegeta_races = list("Saiyan","Tsufurujin")
var/list/afterlife_races = list("Kaio","Demon","Majin","Dragon")
var/list/arconia_races = list("Alien","Heran","Aetherian")
var/list/android_races = list("Android","Bio")
var/list/ice_races = list("Changeling")

proc/GetAllRaces()
	. = earth_races + namek_races + vegeta_races + afterlife_races + arconia_races + android_races + ice_races

var/list/Planets=list("Earth","Namek","Vegeta","Ice","Arconia","Sanctuary","AlienRuin","AlienGrassland","AlienOcean","AlienArctic","AlienDesolate","???")
var/list/TierSLockOut=list()
var/list/TechLockOut=list()

mob/proc/CheckIfDestroyed(var/blah,var/lulz)
	if(Planets.Find(blah)||blah=="Afterlife"||blah=="Android")
		winset(src,"PlanetName","text=\"[blah]\"")
		return 1
	else if(DestroyedRacesAllowed)
		winset(src,"PlanetName","text=\"[blah]\"")
		src<<"<font color=red><b>[blah]</b> is destroyed! You must consult an admin upon creation so you can get summoned to another planet."
		return 1
	else
		src<<"<font color=red><b>[blah]</b> is destroyed!"
		UpdateRaceScreen("Planet",lulz)

mob/proc/UpdateRaceScreen(var/wut,var/amountz)
	winshow(usr,"BabyButton",0)
	for(var/obj/Child/x)if(x.type!=/obj/Child/Mate)
		winshow(usr,"BabyButton",1)
		break
	if(amountz)
		if(wut)
			switch(wut)
				if("Planet")
					switch(amountz)
						if("+")
							src.Plan++
						if("-")
							src.Plan--
					if(Plan>7&&(src.CheckUnlock("Anti-Spiral")!=1))
						Plan=1
					if(Plan>7)
						Plan=1
					if(Plan<1)
						Plan=7

				if("Race")
					switch(amountz)
						if("+")
							Rac++
						if("-")
							Rac--

	else
		amountz="+"
	src.Hairz("Remove")
	src.Class="Fighter"


	var/list/available_races = list()
	switch(Plan)
		if(1) if(src.CheckIfDestroyed("Earth",amountz)) available_races = earth_races.Copy()
		if(2) if(src.CheckIfDestroyed("Namek",amountz)) available_races = namek_races.Copy()
		if(3) if(src.CheckIfDestroyed("Vegeta",amountz)) available_races = vegeta_races.Copy()
		if(4) if(src.CheckIfDestroyed("Afterlife",amountz)) available_races = afterlife_races.Copy()
		if(5) if(src.CheckIfDestroyed("Arconia",amountz)) available_races = arconia_races.Copy()
		if(6) if(src.CheckIfDestroyed("Android",amountz)) available_races = android_races.Copy()
		if(7) if(src.CheckIfDestroyed("Ice",amountz)) available_races = ice_races.Copy()


	for(var/v in available_races)
		if(LockedRaces.Find(v) && !(key in LockedRaces[v]))
			world << "OOF [v]"
			available_races -= v


	if(Rac > available_races.len) Rac = 1
	else if(0 >= Rac) Rac = available_races.len

	var/race_check = available_races[Rac]

	switch(race_check)
		if("Human")
			Race="Human"
			if(src.gender=="female")
				src.icon='FemaleLight.dmi'
			else
				src.icon='MaleLight.dmi'
		if("Half Saiyan")
			Race="Half Saiyan"
			src.icon='MaleLight.dmi'
			src.Class="Fighter"
		if("Makyo")
			Race="Makyo"
			src.icon='Makyo1.dmi'
		if("Half Demon")
			src.Race="Half Demon"
			src.icon='MaleLight.dmi'
			src.Class="Pride"
		if("Demi")
			src.Race="Demi"
			if(src.gender=="female")
				src.icon='FemaleLight.dmi'
			else
				src.icon='MaleLight.dmi'

		if("Namekian")
			Race="Namekian"
			src.icon='Namek1.dmi'

		if("Saiyan")
			Race="Saiyan"
			src.Class="Normal"
			if(src.gender=="female")
				src.icon='FemaleLight.dmi'
			else
				src.icon='MaleLight.dmi'
		if("Tsufurujin")
			Race="Tsufurujin"
			if(src.gender=="female")
				src.icon='FemaleLight.dmi'
			else
				src.icon='MaleLight.dmi'


		if("Kaio")
			src.Race="Kaio"
			if(src.gender=="female")
				src.icon='CustomFemale.dmi'
			else
				src.icon='CustomMale.dmi'

		if("Demon")
			src.Race="Demon"
			src.icon='Demon1.dmi'
			src.Class="Pride"

			//Rares
		if("Majin")
			src.Race="Majin"
			src.icon='Majin.dmi'

				//src.icon='
		if("Dragon")
			src.Race="Dragon"
			src.icon='Dragon1.dmi'

		if("Alien")
			src.Race="Alien"
			src.icon='Alien1.dmi'

		if("Heran")
			src.Race="Heran"
			src.icon='HeranBase.dmi'
		if("Lycan")
			src.Race="Lycan"
			src.icon='Alien1.dmi'
		if("Vampire")
			src.Race="Vampire"
			src.icon='Alien1.dmi'
		if("Aetherian")
			src.Race="Aetherian"
			src.icon='Alien1.dmi'
		if("Youkai")
			src.Race="Youkai"
			src.icon='MaleLight.dmi'
			src.Class="Kitsune"

		if("Android")
			src.Race="Android"
			src.icon='Android1.dmi'
			src.Class="Fighter"

		if("Bio")
			src.Race="Bio Android"
			src.icon='BioAndroid1.dmi'

		if("Changeling")
			src.Race="Changeling"
			src.icon='Frieza1.dmi'
			src.Class="Frieza"

	winset(src,"RaceName","text=\"[src.Race]\"")
	if(src.Race=="Human")
		winset(usr,"Iconz","image=['i_Human.png']")
		src<<output("Humans are a humanoid race with no truly exceptional abilities, but able to adapt to many situations. And through unmatching willpower, they were the ones to raise their empires with their own hands, since the dark ages.","raceblurb")
	if(src.Race=="Dhampir")
		winset(usr,"Iconz","image=['i_Dhampir.png']")
		src<<output("Dhampirs are crossbred humans and vampires which borrow traits from both.  They walk a fine line, but in time, they must choose a bloodline to follow...","raceblurb")
	else if(src.Race=="Throwback")
		winset(usr,"Iconz","image=['i_Throwback.gif']")
		src<<output("Often refered to as relics of a day long past, Humans of a type thought long gone. They're just your run-up-the-hill human beings with no special qualities, not even with redeeming factors such as an incredible adaptability.","raceblurb")
	else if(src.Race=="Saiyan")
		winset(usr,"Iconz","image=['i_Saiyans.gif']")
		src<<output("Saiyans are a proud, mighty warrior race. They are not very good with Technology or Magic, but make up for it with their brute strength and power. Saiyans are divided into three types: Low Class, who typically are foot soldiers, Normal Class, who are a bit stronger, and Elite, who typically lead their people with their considerable power.","raceblurb")
	else if(src.Race=="Trueseer")
		winset(usr,"Iconz","image=['i_Trueseer.png']")
		src<<output("Trueseers are a mysterious race, granted with the ability to minorly predict the future.","raceblurb")
	else if(src.Race=="Changeling")
		winset(usr,"Iconz","image=['i_Changling.gif']")
		src<<output("Changelings are a morphic species, able to change shape to release more of their power. They are among the strongest known race, and can withstand immense amounts of punishment. They have three types available, that determine how many forms they have: Frieza, Cooler, Chilled, and King Kold.","raceblurb")
	else if(src.Race=="Demon")
		winset(usr,"Iconz","image=['i_Demon.png']")
		src<<output("Demons are a typically evil race, dominaing their 'homeland' of Hell.  Their classes revolve around the Seven Sins, each having a specialization.","raceblurb")
	else if(src.Race=="Mazoku Demon")
		winset(usr,"Iconz","image=['i_ThreeKings.gif']")
		src<<output("These are a primordial class of demons from which all descend, and formed the Kings and Queens of Hell in generations past. They are far and away the most powerful pureblooded beings that have ever existed in the Afterlife, and possess no real weaknesses aside from their mortality.","raceblurb")
	else if(src.Race=="Kaio")
		winset(usr,"Iconz","image=['i_Kais.gif']")
		src<<output("Kaios did not originate in the Afterlife, but instead were born from a tree on a hidden planet. It is said a golden fruit is a sign of a Kaioshin, a Kaio destined for great things.","raceblurb")
	else if(src.Race=="Makyo")
		winset(usr,"Iconz","image=['i_Makyo-Jin.gif']")
		src<<output("{RARE} Makyos are believed not to be natives to Earth, but rather aliens from a place called the Makyo Star. They are physically mighty, but to underestimate their abilities with magic would be foolish.","raceblurb")
	else if(src.Race=="Alien")
		winset(usr,"Iconz","image=['i_Alien.gif']")
		src<<output("A catch call term for a broad range of races, Aliens are extremely diverse. It is said no two Aliens are the same.","raceblurb")
	else if(src.Race=="Galvan")
		winset(usr,"Iconz","image=['i_Galvan.png']")
		src<<output("(RARE RACE) A hyperintelligent race from a distant planet, the Galvans are a short, frog like species. They are physically fragile, and have trouble using energy, but compensate for this with advanced technology that is superior to even Tsufurujin tech.","raceblurb")
	else if(src.Race=="Heran")
		winset(usr,"Iconz","image=['i_Heran.gif']")
		src<<output("Herans hail from the planet of Hera, which was destroyed long ago. A small number of them survived, however, and have resettled on Arconia. They are physically mighty, perhaps even more so then Changelings, and can withstand considerable punishment.","raceblurb")
	else if(src.Race=="Namekian")
		winset(usr,"Iconz","image=['i_Namekian.gif']")
		src<<output("Namekians are green skined humanoids who live on Namek. They survive almost purely on water and photosynthis, and are a peaceful race. But just because they are peaceful does not mean they cannot fight.","raceblurb")
	else if(src.Race=="Tsufurujin")
		winset(usr,"Iconz","image=['i-tsu.png']")
		src<<output("Tsufurujins are a near-human race. They are not adept fighters typically, but instead rely on their technology and knowledge to get them though the day. Their average IQ is 300, and only grows with age. It's also hinted that their intelligence has no limits.","raceblurb")
	else if(src.Race=="Demi")
		winset(usr,"Iconz","image=['i-Demi.png']")
		src<<output("Demi-Gods are born from divinity and mortality, giving them unique powers. Their half god nature tends to manifest as massive physical strength. They're also bastardized by 'God', and should never be able to reach Heaven, unless they prove their divinity.","raceblurb")
	else if(src.Race=="Spirit Doll")
		winset(usr,"Iconz","image=['i_SD.png']")
		src<<output("Dolls or Puppets possessed by a soul, with more of a focus on energy than physical prowess. They're very magically proficient and have great control over their own energy in general.","raceblurb")
	else if(src.Race=="Android")
		winset(usr,"Iconz","image=['i_Android1.png']")
		src<<output("Androids are artifical lifeforms, created by skilled Technologists. Recent developments have created a new generation of Androids, however, old battle Androids from a previous era still linger...","raceblurb")
	else if(src.Race=="Bio Android")
		winset(usr,"Iconz","image=['i_Bio.gif']")
		src<<output("(RARE RACE) Bio Androids are lifeforms created to have the attributes of other races. They can transform if they can abosrb Androids or Cyborgs, becoming even more powerful and dangerous.","raceblurb")
	else if(src.Race=="Reploid")
		winset(usr,"Iconz","image=['i_Zero.png']")
		src<<output("Reploids can be thought of as the next evolutionary step of the robots from the classic series. For all intents and purposes, Reploids are the same as humans on a mental level; they think and feel, giving them the ability to make their own decisions and develop unique personalities.","raceblurb")
	else if(src.Race=="Dragon")
		winset(usr,"Iconz","image=['i_Dragon.gif']")
		src<<output("(RARE RACE) Dragons are born when Dragonballs are abused typically. They repersent the negative aspects of a wish created, and are extremely powerful and dangerous. To defeat one would require immense talent and ability.","raceblurb")
	else if(src.Race=="Majin")
		winset(usr,"Iconz","image=['i_Majin.png']")
		src<<output("(RARE RACE) Majins are created from dark, evil magics added to raw evil Karma energy. Their bodies can shapeshift at will, and they can also absorb others, adding their abilities to its own. They're also hinted to love sugar.","raceblurb")
	else if(src.Race=="Makaioshin")
		winset(usr,"Iconz","image=['i_Makaio.gif']")
		src<<output("(RARE) Makaioshins are Kaio and Demon half-breeds. They often are banished to Hell for being sacriledges and if a Kaio was the parent, they're immediately annihilated from existence, as for 'God' will always look down upon imperfections like them.","raceblurb")
	else if(src.Race=="Popo")
		winset(usr,"Iconz","image=['i_Popoh.png']")
		src<<output("(OH GOD) Here's the pecking order, maggots. It's you, the dirt, the worms inside of the dirt, Popo's stool, Kami, then Popo. Any questions?","raceblurb")
	else if(src.Race=="Quarter Saiyan")
		winset(usr,"Iconz","image=['i_Quarter.gif']")
		src<<output("(SEMI RARE) Quarter Saiyans happen when a Half-Saiyan falls in love with a Human. They're not as rare in places like Earth.","raceblurb")
	else if(src.Race=="1/16th Saiyan")
		winset(usr,"Iconz","image=['i-16.png']")
		src<<output("(SEMI RARE) 1/16th Saiyans are technically Humans who possess just enough Saiyan blood to inherit their power. They're only rare for the fact the Saiyan blood is a declining power. As they grow older, they may end up losing their Saiyan powers.","raceblurb")
	else if(src.Race=="Half Saiyan")
		winset(usr,"Iconz","image=['i_Halfie.png']")
		src<<output("(SEMI RARE) Half Saiyans are born when a Saiyan and a Human fall in love. They have the raw power of their Saiyan parent, and also the strong emotions of their Human parent, creating a powerful halfbreed that's often bastardized.","raceblurb")
	else if(src.Race=="Vampire")
		winset(usr,"Iconz","image=['i_Vampiro.png']")
		src<<output("(SEMI RARE) Undead beings, Vampires survive off the blood of others, and dislike being in the sun. It'll give them a bad tan. Also have a tendency of yelling ''WRRYYYYYY!'', which specialists can never tell why exactly.","raceblurb")
	else if(src.Race=="Lycan")
		winset(usr,"Iconz","image=['i-Lycan.png']")
		src<<output("(SEMI RARE) Powerful beings that transform into massive, wolf like forms. They're quite the rare sight, and often told to be just legends, but Lycan Hunters say otherwise...","raceblurb")
	else if(src.Race=="Manakete")
		winset(usr,"Iconz","image=['i-Manak.png']")
		src<<output("Powerful beings that can transform into dragons at will, but some say they could also be dragons transformed into humanoids. They're often mistrusted when they reveal their true faces, but can blend in well on society.","raceblurb")
	else if(src.Race=="Hollow")
		winset(usr,"Iconz","image=['i_Hollow.gif']")
		src<<output("A race created from uncleansed negative souls. They gain more power by devouring others.","raceblurb")

	else if(src.Race=="Youkai")
		winset(usr,"Iconz","image=['i_yokai.png']")
		src<<output("Spiritual creatures that have learned to take on a humanoid shape, Youkai are a strange breed. With alien desires and a hunger for knowledge, they hunt across the galaxy in search of answers and power.","raceblurb")
	else if(src.Race=="Golem")
	{
		winset(usr,"Iconz","image=['i_Golem.png']")
		src<<output("A golem is an animated being, created entirely from inanimate matter, generally stone, clay, or crystal. The strength and durability of these creatures, as well as their inherant magical talent, make them a force to be wreckoned with.","raceblurb")
	}
	else if(src.Race=="Neko")
	{
		winset(usr,"Iconz","image=['i_Neko.gif']")
		src<<output("(Cringeworthy) Somewthing is nya~t right with you if you're ever picking this race! It will paw~ssibly end in a cat~astrophe...","raceblurb")
	}
	else if(src.Race=="Half Demon")
		winset(usr,"Iconz","image=['i_HalfDemon.png']")
		src<<output("Child of Mortal and Demon. Half Demons have the supernatural power of their Demonic parent, as well as a chaotic nature, however they are not driven to evil, and have mortal emotions and feelings. NOTE: Most Half Demons won't ever be as badass as 'the' guy in the pic.","raceblurb")
	else if(src.Race=="God of Destruction")
		winset(usr,"Iconz","image=['i_GodDed.png']")
		src<<output("(RARE) They hold such overwhelming power that mortals cannot hope to comprehend it.","raceblurb")
	else if(src.Race=="Lamia")
		winset(usr,"Iconz","image=['i_Lamia.png']")
		src<<output("Top snek.","raceblurb")
	else if(src.Race=="Nobody")
		winset(usr,"Iconz","image=['NEW.png']")
		src<<output("(RARE) A powerful race that holds truly exceptional attributes in most fields. However, they lack a heart and soul, causing them to lack true emotions and imagination. This results in them being unable to become truly angry, and incapable of performing magic.","raceblurb")
	else if(src.Race=="Aetherian")
		winset(usr,"Iconz","image=['i_Aet.png']")
		src<<output("(RARE)Aetherians are a race of humanoids who are unique in their ability to wield Aether, known as the 'Divine Element'. They are known to be fine warriors with exceptional reflexes further enhanced by their ability to use Aether to predict and redirect the attacks of their opponents.","raceblurb")
	else if(src.Race=="Great Old Admin")
		winset(usr,"Iconz","image=null")
		src<<output("(RARE)An elusive being said to hibernate for months on end at the slightest provocation, these beings, also known as 'The Skeletal Ones,' are best known by the 3 tenents they live by. First, is that those who live by the sword shall die by it- should the blade be the main method of fighting in the universe, it is said that He will hunt down all those who wield it and exterminate them. The second is that He will not permit a sorcerer to live, as He sees magic as an unbalancing force in the universe. The final one is his eternal struggle with the one known as Xerif, the sacker of cities, destroyer of worlds, and patron diety of rectal ravaging. Dare not awaken Him, else the world will be subjected to 40 days and 40 nights of his wrath, ranging from mild irritation to the complete eradication of all that there is.","raceblurb")
	else if(src.Race=="Anti-Spiral")
		winset(usr,"Iconz","image=['i_AS.png']")
		src<<output("(RARE) Beings who sealed off their evolution to prevent something much worse from happening. They possess power rivaling the Gods of this world.","raceblurb")
	else if(src.Race=="Pathfinder")
		src<<output("(RARE) God damn it Jumpy.","raceblurb")
	else if(src.Race=="Pathless")
		src<<output("(RARE) God dammit Jinx.", "raceblurb")
	else if(src.Race=="Kurama")
		src<<output("(RARE) A waste of time custom for a guy who didn't even play the wipe with it.  Don't pick this race because I can't be bothered to maintain it.", "raceblurb")
	else if(src.Race=="Synchronizer")
		winset(usr,"Iconz","image=['i_Mememaid.png']")
		src<<output("(MEME Rarity) Synchronizers are the epitome of intelligent and magical entities who naturally hold a greater tendency to waste their potential with useless actions, such as being great housemaids. Their role in the universe is to cause revolutions, tied to their special quirk.", "raceblurb")


//	var/list/L = list("Planet1"=1,"Planet2"=2,"Planet3"=3,"Planet4"=4,"Planet5"=5,"Planet6"=6,"Planet7"=7)
	var/list/L = list("Planet1"=1)
	for(var/x in L)
		L[x]+=Plan-1
		if(L[x]>8)
			L[x]-=8
		if(L[x]==1)
			winset(src,"[x]","image=['i_Earth.png']")
			src<<output("Earth is a young planet with a diverse range of ecosystems and enviroments. Humans often are the primary race here, with small numbers of Spirit Doll and Makyojins.","planetblurb")
		if(L[x]==2)
			winset(src,"[x]","image=['i_Namek.png']")
			src<<output("Namek is a ancient world, orbiting three stars. This assures the planet never truly gets dark. It is perhaps as alien as planets get, with a green ocean and blue grass. Namekians are the sole race here...usually.","planetblurb")
		if(L[x]==3)
			winset(src,"[x]","image=['i_Vegeta.png']")
			src<<output("Vegeta is a desolate world, nearly ruined by decades of conflict. It's gravity is far greater then many planets, allowing its races, the Saiyans and the Tsufurujins, to be quite tough and hardened.","planetblurb")
		if(L[x]==4)
			winset(src,"[x]","image=['i_Afterlife.png']")
			src<<output("The Afterlife is where people tend to go upon death. It consists of three realms, Heaven, Hell, and the Checkpoint which exists between them. Dispite it being a realm of the dead, the Kaios, Demons, and Demi-Gods all call this place home.","planetblurb")
		if(L[x]==5)
			winset(src,"[x]","image=['i_Arconia.png']")
			src<<output("A near-Earth like planet, Arconia has more surface water, it's one contient seperated by rivers and bridges. Many races live here, collectively called 'Aliens' by other races.","planetblurb")
		if(L[x]==6)
			winset(src,"[x]","image=['i_Android.png']")
			src<<output("A massive starship, created by unknown means and a unknown entity. It is fully AI controled, and able to assemble robots called Androids for a wide range of purposes.","planetblurb")
		if(L[x]==7)
			winset(src,"[x]","image=['i_Ice.png']")
			src<<output("Ice is a truly ancient world, orbiting a white dwarf star. It is unbearably cold here, with planet wide blizzards and freezing temperatures. The Changelings, able to adapt to this, are the sole residents here.","planetblurb")
		if(L[x]==8)
			winset(src,"[x]","image=['i_AntiSpiral.png']")
			src<<output("Who knows what resides here.","planetblurb")
		if(L[x]==9)
			winset(src,"[x]","image=['i_Earth.png']")
			src<<output("Sanctuary is a legendary planet that comes and goes. Legend claims that it is the graveyard of all true heroes and villians, and has been the site of countless battles that determined the fate of each era they've occured in.","planetblurb")

obj/Login
	name="Dragon Tales"
	Screenz
		layer=555
		mouse_opacity = 0
		icon='dragontales.png'
		density=1
	Newz
		icon='ArtificalObj.dmi'
		icon_state="Misc"
		layer=999
		Click()
			if(WorldLoading)
				usr<<"Please wait until the world is done loading..."
				return
			if(usr.Race)return
			if(fexists("Saves/Players/[usr.ckey]"))
				switch(alert("WARNING: You already have a character save on this key! If you make a new character, it is likely your current one will be lost!","Oh snaps!","Yes","No"))
					if("Yes")
						winshow(usr,"Race_Screen",1)
						spawn()usr.UpdateRaceScreen()
					if("No")
						return
			else
				winshow(usr,"Race_Screen",1)
				spawn()usr.UpdateRaceScreen()
	Loadz
		icon='ArtificalObj.dmi'
		icon_state="Misc"
		layer=999
		Click()
			if(WorldLoading)
				usr<<"Please wait until the world is done loading..."
				return
			if(usr.Race)return
			if(fexists("Saves/Players/[usr.ckey]"))
				usr.client.LoadChar()
			else
				usr<<"<font color=yellow><b>Attention:</b>Savefile for [usr.key] not found!"





//New Login ^^




mob/var
	tmp/Clicked
	tmp/ChooseStats

mob
	proc
		EmergencySave()
			if(src.Savable)
				var/savefile/F=new("Saves/Players/[src.ckey]")
				F["mob"] << src
				F["Last_Used"]<<world.realtime
				F["SuperSaiyan"]<<md5("[src.EXP][src.BaseMod][src.Base][src.Strength][src.StrengthMod][src.Endurance][src.EnduranceMod][src.Speed][src.SpeedMod][src.Force][src.ForceMod][src.Resistance][src.ResistanceMod][src.Offense][src.OffenseMod][src.Defense][src.DefenseMod][src.Regeneration][src.Recovery][src.ZenkaiAmount][src.Race]")

client
	proc
		LoadChar()
			//screen=null
			if(fexists("Saves/Players/[src.ckey]"))
				var/savefile/F=new("Saves/Players/[src.ckey]")
				F["mob"] >> src.mob
				/*if(F["SuperSaiyan"])
					if(F["SuperSaiyan"]!=md5("[src.mob.EXP][src.mob.BaseMod][src.mob.Base][src.mob.Strength][src.mob.StrengthMod][src.mob.Endurance][src.mob.EnduranceMod][src.mob.Speed][src.mob.SpeedMod][src.mob.Force][src.mob.ForceMod][src.mob.Resistance][src.mob.ResistanceMod][src.mob.Offense][src.mob.OffenseMod][src.mob.Defense][src.mob.DefenseMod][src.mob.Regeneration][src.mob.Recovery][src.mob.ZenkaiAmount][src.mob.Race]"))
						world<<"[src.key]'s save has corrupted, causing them to be locked out of it to preserve remaining data."
						return
						src.mob.Savable=0
						del(src)
						if(fexists("Saves/Players/[src.ckey].lk"))
							fdel("Saves/Players/[src.ckey].lk")*/

		BackupSaveChar()
			if(src.mob.Savable)
				var/savefilefound=file("Saves/Players/[src.ckey]")
				fcopy(savefilefound,"SaveBackups/Players/[src.ckey]")
/*				F["mob"] << src.mob
				F["Last_Used"]<<world.realtime
				F["SuperSaiyan"]<<md5("[src.mob.EXP][src.mob.BaseMod][src.mob.Base][src.mob.Strength][src.mob.StrengthMod][src.mob.Endurance][src.mob.EnduranceMod][src.mob.Speed][src.mob.SpeedMod][src.mob.Force][src.mob.ForceMod][src.mob.Resistance][src.mob.ResistanceMod][src.mob.Offense][src.mob.OffenseMod][src.mob.Defense][src.mob.DefenseMod][src.mob.Regeneration][src.mob.Recovery][src.mob.ZenkaiAmount][src.mob.Race]")
*/

		SaveChar()
			if(src.mob.Savable)
				var/savefile/F=new("Saves/Players/[src.ckey]")
				F["mob"] << src.mob
				F["Last_Used"]<<world.realtime
				F["SuperSaiyan"]<<md5("[src.mob.EXP][src.mob.BaseMod][src.mob.Base][src.mob.Strength][src.mob.StrengthMod][src.mob.Endurance][src.mob.EnduranceMod][src.mob.Speed][src.mob.SpeedMod][src.mob.Force][src.mob.ForceMod][src.mob.Resistance][src.mob.ResistanceMod][src.mob.Offense][src.mob.OffenseMod][src.mob.Defense][src.mob.DefenseMod][src.mob.Regeneration][src.mob.Recovery][src.mob.ZenkaiAmount][src.mob.Race]")
mob/proc
	RaceQualities()
		switch(src.Race)
			if("Human")
				src.Race="Human"
				src.BaseMod=1
				src.Meditation_Rate=1.75
				src.Zenkai_Rate=0.5
				src.Training_Rate=1.75
				src.Intelligence=2
				src.Enchantment=2
				if(src.Class=="Quincy")
					src.Meditation_Rate=2.25
					src.Training_Rate=2.25
				if(src.Class=="Sage")
				{
					src.Zenkai_Rate = 0.5
					src.Meditation_Rate = 2
					src.Training_Rate = 2
					src.Intelligence = 3
					src.Enchantment = 2
				}
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Earth"
				if(Spawns.Find("Human"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Human[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("Dhampir")
				src.Race="Dhampir"
				src.BaseMod=1.5
				src.Meditation_Rate=1.75
				src.Zenkai_Rate=0.5
				src.Training_Rate=1.75
				src.Intelligence=2
				src.Enchantment=2
				src.TemperatureTolerance=2
				src.TemperatureToleranceType="Cold"
				if(Spawns.Find("Human"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Human[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
			if("Neko")
				src.Race="Neko"
				src.BaseMod=0.75
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=2
				src.Enchantment=2
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Earth"
				if(Spawns.Find("Neko"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Neko[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("Throwback")
				src.Race="Throwback"
				src.BaseMod=1
				src.Meditation_Rate=1.75
				src.Zenkai_Rate=0.5
				src.Training_Rate=1.75
				src.Intelligence=2
				src.Enchantment=2
				if(src.Class=="Quincy")
					src.Meditation_Rate=2.25
					src.Training_Rate=2.25
				if(src.Class=="Sage")
				{
					src.Zenkai_Rate = 0.5
					src.Meditation_Rate = 2
					src.Training_Rate = 2
					src.Intelligence = 3
					src.Enchantment = 2
				}
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Earth"
				if(Spawns.Find("Human"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Human[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			/*if("Neko")
			{
				src.Race = "Neko"
				src.BaseMod = 1
				src.Meditation_Rate = 2;
				src.Zenkai_Rate=0.5
				src.Training_Rate=1
				src.Intelligence=1.5
				src.Enchantment=4
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.GravityMod=0.25
				src.GravityMastered=1
				src.Spawn="Arconia"
				if(src.Class=="Schrodinger")
					src.Enchantment=0.25
					src.Intelligence=4
				if(Spawns.Find("Neko"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Neko[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Namek"||src.Spawn=="Arconia")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			}*/
			if("Manakete")
			{
				src.Race = "Manakete"
				src.BaseMod = 3
				src.Meditation_Rate = 2
				src.Zenkai_Rate= 0.5
				src.Training_Rate = 1.5
				src.Intelligence = 1.5
				src.Enchantment = 4
				src.TemperatureTolerance = 0
				src.TemperatureToleranceType = "None"
				src.GravityMod = 2
				src.GravityMastered = 1
				src.Spawn = "Arconia"
				if(Spawns.Find("Manakete"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Manakete[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered = 5
				if(src.Spawn=="Namek"||src.Spawn=="Arconia")
					src.GravityMastered = 3
				if(src.Spawn=="Ice")
					src.GravityMastered = 10
					src.TemperatureTolerance = 1.5
					src.TemperatureToleranceType = "Cold"
			}
			if("Golem")
				src.Race="Golem"
				src.BaseMod=1.5
				src.Meditation_Rate=2.25
				src.Zenkai_Rate=0.1
				src.Training_Rate=2.25
				src.Intelligence=0.5
				src.Enchantment=2
				src.TemperatureTolerance=3
				src.TemperatureToleranceType="Both"
				src.GravityMod=1
				src.GravityMastered=3
				src.Spawn="Arconia"
				if(Spawns.Find("Golem"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Golem[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
			if("Lamia")
				src.Race="Lamia"
				src.BaseMod=1
				src.Meditation_Rate=2.5
				src.Zenkai_Rate=0.25
				src.Training_Rate=0.5
				src.Intelligence=0.5
				src.Enchantment=1.75
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.GravityMod=1
				src.GravityMastered=2
				src.Spawn="Earth"
				if(Spawns.Find("Lamia"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Lamia[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Namek"||"Arconia")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("Youkai")
				src.Race="Youkai"
				src.BaseMod=1
				src.Meditation_Rate=2.5
				src.Zenkai_Rate=0.5
				src.Training_Rate=1.25
				src.Intelligence=2
				src.Enchantment=2
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.GravityMod=1.25
				src.GravityMastered=3
				src.Spawn="Earth"
				if(Spawns.Find("Youkai"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Youkai[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Namek"||"Arconia")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"

				if(src.Class=="Kitsune")
					src.Meditation_Rate=2.5
					src.Training_Rate=1.25
					src.Intelligence=1
					src.Enchantment=4
					src.BaseMod=1
				if(src.Class=="Tanuki")
					src.Meditation_Rate=1.25
					src.Training_Rate=2.5
					src.Intelligence=2
					src.Enchantment=2
					src.BaseMod=2
				if(src.Class=="Hell Raven")
					src.Meditation_Rate=1
					src.Training_Rate=3.5
					src.Intelligence=0.25
					src.Enchantment=0.25
					src.BaseMod=2
			if("Quarter Saiyan")
				src.Race="Quarter Saiyan"
				/* old mods
				src.BaseMod=5
				src.Meditation_Rate=1.75
				src.Zenkai_Rate=0.5
				src.Training_Rate=1.75
				src.Intelligence=1.5
				src.Enchantment=1
				src.GravityMod=1.25
				*/
				///
				src.BaseMod=1.25
				src.Meditation_Rate=2
				src.Zenkai_Rate=1
				src.Training_Rate=2
				src.Intelligence=2
				src.Enchantment=2
				src.GravityMod=1
				///
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Earth"
				if(Spawns.Find("Quarter Saiyan"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Quarter Saiyan[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("1/16th Saiyans")
				src.Race="1/16th Saiyans"
				src.BaseMod=1
				src.Meditation_Rate=1.75
				src.Zenkai_Rate=0.5
				src.Training_Rate=1.75
				src.Intelligence=1.75
				src.Enchantment=1
				src.GravityMod=1.25
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Earth"
				if(Spawns.Find("Quarter Saiyan"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Quarter Saiyan[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("Popo")
				src.Race="Popo"
				src.BaseMod=0.25
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=4
				src.Enchantment=4
				src.GravityMod=10
				src.TemperatureTolerance=5
				src.TemperatureToleranceType="Both"
				src.Spawn="Earth"
				if(Spawns.Find("Popo"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Popo[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
				for(var/obj/Regenerate/x in src)
					x.Level=2.5
			if("Nobody")
				src.Race="Nobody"
				src.BaseMod=3
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=4
				src.Enchantment=0.25
				src.GravityMod=10
				src.TemperatureTolerance=5
				src.TemperatureToleranceType="Both"
				src.Spawn="Earth"
				if(Spawns.Find("Nobody"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Nobody[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
			if("Spirit Doll")
				src.Race="Spirit Doll"
				src.BaseMod=1
				src.ManaMax=250
				src.Meditation_Rate=2.25
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=1.25
				src.Enchantment=2.5
				src.GravityMod=0.8
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Earth"
				if(Spawns.Find("Spirit Doll"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Spirit Doll[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("Tsufurujin")
				src.Race="Tsufurujin"
				src.BaseMod=1.5
				src.Zenkai_Rate=0.5
				src.Training_Rate=1.5
				src.Meditation_Rate=2
				src.Intelligence=2.25
				src.Enchantment=1.25
				src.GravityMastered=5
				src.GravityMod=2
				src.CyberizeMod = 2
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Vegeta"
				if(Spawns.Find("Tsufurujin"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Tsufurujin[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("Makyo")
				src.Race="Makyo"
				src.BaseMod=2.5
				src.Meditation_Rate=1.75
				src.Zenkai_Rate=0.5
				src.Training_Rate=2.5
				src.Intelligence=1.25
				src.Enchantment=1.5
				src.GravityMod=5
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Earth"
				if(Spawns.Find("Makyo"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Makyo[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Arconia"||src.Spawn=="Namek")
					src.GravityMastered=3
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("Namekian")
				src.Race="Namekian"
				src.BaseMod=1.8
				src.Meditation_Rate=2.25
				src.Zenkai_Rate=0.5
				src.Training_Rate=1
				src.GravityMod=0.5
				src.GravityMastered=10
				src.Intelligence=1.5
				src.Enchantment=2
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Earth"
				if(Spawns.Find("Namekian"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Namekian[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
				if(src.Class=="Ancient")
					src.BaseMod=10
					src.Training_Rate=2.5
					src.GravityMod=5
					src.Intelligence=4
					src.Enchantment=2.5
			if("Saiyan")
				src.Race="Saiyan"
				src.BaseMod=2
				src.Meditation_Rate=1.5
				src.Zenkai_Rate=6
				src.Training_Rate=2
				src.Intelligence=1
				src.Enchantment=1
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Vegeta"
				if(Spawns.Find("Saiyan"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Saiyan[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
				switch(src.Class)
					if("Legendary")
						src.Class="Legendary"
						src.BaseMod=5
						src.GravityMod=3.5
						src.GravityMastered=10
						src.Zenkai_Rate=15
						src.Training_Rate=2.5
						src.Meditation_Rate=0.75
					if("Elite")
						src.Class="Elite"
						src.BaseMod=5
						src.GravityMod=3
						src.GravityMastered=10
						src.Meditation_Rate=2
						src.Zenkai_Rate=10
						src.SaiyanAscension=1
						src.ActiveBuffs=3
						src.SpecialSlot=1
					/*if("Savage")
						src.Class="Savage"
						src.BaseMod=4
						src.GravityMod=3
						src.GravityMastered=25
						src.Meditation_Rate=1
						src.Training_Rate=3
						src.Zenkai_Rate=30*/
					if("Normal")
						src.Class="Normal"
						src.BaseMod=2.5
						src.GravityMod=2.5
						src.GravityMastered=10
						src.Zenkai_Rate=15
						src.Training_Rate=3
					if("Low-Class")
						src.Class="Low-Class"
						src.BaseMod=2
						src.GravityMod=2
						src.GravityMastered=10
						src.Zenkai_Rate=20
						src.Training_Rate=2
						src.Enchantment=1.25
					if("Hellspawn")
						src.Class="Hellspawn"
						src.BaseMod=5
						src.GravityMod=5
						src.GravityMastered=10
						src.Zenkai_Rate=30
						src.Spawn="Hell"
					/*if("Fire God")
						src.Class="Fire God"
						src.BaseMod=5
						src.GravityMod=10
						src.GravityMastered=10
						src.Zenkai_Rate=30*/
			if("Half Saiyan")
				src.Race="Half Saiyan"
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Intelligence=2
				src.Enchantment=1.5
				src.Spawn="Vegeta"
				switch(src.Class)
					if("Trunks")
				//		src.Class="Elite"
						src.BaseMod=2
						src.Meditation_Rate=1.5
						src.Zenkai_Rate=15
						src.Training_Rate=1.5
						src.GravityMod=2
						src.GravityMastered=5
						src.Spawn="Vegeta"
					if("Goten")
				//		src.Class="Normal"
						src.BaseMod=1.75
						src.Meditation_Rate=1.75
						src.Zenkai_Rate=10
						src.Training_Rate=1.75
						src.GravityMod=1.75
						src.GravityMastered=5
						src.Spawn="Vegeta"
					if("Gohan")
				//		src.Class="Low-Class"
						src.BaseMod=1.5
						src.Meditation_Rate=1.75
						src.Zenkai_Rate=10
						src.Training_Rate=1.75
						src.GravityMod=1.5
						src.GravityMastered=5
						src.Spawn="Vegeta"
					if("Quarter")
						src.BaseMod=1.4
						src.Meditation_Rate=1.75
						src.Zenkai_Rate=4.5
						src.Training_Rate=1.75
						src.Intelligence=4
						src.Enchantment=3
						src.GravityMod=3
						src.GravityMastered=10
						src.Spawn="Earth"
				if(Spawns.Find("Half Saiyan"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Half Saiyan[spawncheck]"))
							src.Spawn="[spawncheck]"
					if(src.Spawn=="Ice")
						src.GravityMastered=10
						src.TemperatureTolerance=1.5
						src.TemperatureToleranceType="Cold"

			if("Changeling")
				src.Race="Changeling"
				/*
				if(src.icon=='Frieza1.dmi')
					src.Class="Frieza"
				if(src.icon=='Cooler1.dmi')
					src.Class="Cooler"
				if(src.icon=='KingKold1.dmi')
					src.Class="King Kold"
				*/
				src.Zenkai_Rate=0.5
				src.GravityMod=5
				src.TemperatureTolerance=10
				src.TemperatureToleranceType="Cold"
				if(src.Class=="Frieza")
					src.BaseMod=2.5
					src.Meditation_Rate=1.75
					src.Training_Rate=1.75
				if(src.Class=="Cooler")
					src.BaseMod=8
					src.Meditation_Rate=1.75
					src.Training_Rate=1.75
				if(src.Class=="Chilled")
					src.BaseMod=3
					src.Meditation_Rate=2.25
					src.Training_Rate=2.25
				if(src.Class=="King Kold")
					src.BaseMod=5
					src.Meditation_Rate=2
					src.Training_Rate=2
				src.Enchantment=1
				src.Intelligence=1.25
				src.GravityMastered=20
				src.Spawn="Ice"
				if(Spawns.Find("Changeling"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Changeling[spawncheck]"))
							src.Spawn="[spawncheck]"
			if("Vampire")
				src.Race="Vampire"
				src.BaseMod=2
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=2
				src.Enchantment=2
				src.GravityMastered=3
				src.TemperatureTolerance=1
				src.TemperatureToleranceType="Cold"
				src.Spawn="Arconia"
				src.GravityMod=3
				if(src.Class=="Volodarskii")
					src.BaseMod=3
					src.Intelligence=3
				if(Spawns.Find("Vampire"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Vampire[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=2
					src.TemperatureToleranceType="Cold"
			if("Lycan")
				src.Race="Lycan"
				src.BaseMod=3
				src.Meditation_Rate=1
				src.Zenkai_Rate=0.5
				src.Training_Rate=1.75
				src.Intelligence=1.5
				src.Enchantment=1.5
				src.GravityMastered=3
				src.TemperatureTolerance=1.5
				src.TemperatureToleranceType="Cold"
				src.Spawn="Arconia"
				src.GravityMod=3
				src.AlphaLycan=1
				if(Spawns.Find("Lycan"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Lycan[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=2.5
					src.TemperatureToleranceType="Cold"
			if("Alien")
				src.Race="Alien"
				src.BaseMod=2
				src.Meditation_Rate=1.5
				src.Zenkai_Rate=0.5
				src.Training_Rate=2.25
				src.Intelligence=2
				src.Enchantment=2
				src.GravityMastered=3
				src.TemperatureTolerance=1
				src.TemperatureToleranceType="Cold"
				src.Spawn="Vegeta"
				if(Spawns.Find("Alien"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Alien[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
				src.GravityMod=pick(1.25,1.5,1.75,2,2.25,2.5,2.75,3)
			/*	if(src.Class=="Vampire")
					src.Intelligence=2.5
					src.Enchantment=2.5
					src.GravityMod=3
					src.Training_Rate=1.75
					src.Meditation_Rate=1.75

				if(src.Class=="Lycan")
					src.Intelligence=1.5
					src.Enchantment=0.75
					src.GravityMod=3
					src.Training_Rate=2*/
				if(src.Class=="Blue Mage")
					src.Intelligence=4
					src.Enchantment=4
					src.GravityMod=3
					src.Training_Rate=2
					src.Meditation_Rate=2
					src.Zenkai_Rate=0.5
/*				if(src.Class=="Bojack")
					src.BaseMod=2.2
					src.Zenkai_Rate=2
					src.Training_Rate=1.75
					src.Intelligence=1
					src.Enchantment=0.5*/

			if("Trueseer")
				src.Race="Trueseer"
				src.BaseMod=2.5
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2.5
				src.Intelligence=2
				src.Enchantment=4
				src.GravityMastered=5
				src.Spawn="Vegeta"
				if(Spawns.Find("Alien"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Alien[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
				src.GravityMod=2

			if("Galvan")
				src.Race="Galvan"
				if(src.Class=="Prime")
					src.BaseMod=0.25
					src.Meditation_Rate=2
					src.Zenkai_Rate=0.5
					src.Training_Rate=0.5
					src.Intelligence=6
					src.Enchantment=0.25
					src.TemperatureTolerance=0.25
					src.TemperatureToleranceType="Heat"
					src.GravityMod=0.75
					src.GravityMastered=3
				if(src.Class=="Albedo")
					src.BaseMod=1
					src.Meditation_Rate=2
					src.Zenkai_Rate=0.5
					src.Training_Rate=2
					src.Intelligence=4
					src.Enchantment=0.25
					src.TemperatureTolerance=0.25
					src.TemperatureToleranceType="Heat"
					src.GravityMod=1.5
					src.GravityMastered=3
				src.Spawn="Arconia"
				if(Spawns.Find("Galvan"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Galvan[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Vegeta")
					src.GravityMastered=5
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"

			if("Heran")
				src.Race="Heran"
				src.Fishman=1
				src.MaxOxygen=300
				if(src.Class=="Fighter")
					src.BaseMod=2.5
					src.Meditation_Rate=1.75
					src.Zenkai_Rate=0.5
					src.Training_Rate=3
					src.Intelligence=1
					src.Enchantment=1
					src.GravityMastered=5
					src.GravityMod=3.5
					src.TemperatureTolerance=0
					src.TemperatureToleranceType="None"
				if(src.Class=="Captain")
					src.BaseMod=3
					src.Meditation_Rate=1.75
					src.Zenkai_Rate=0.5
					src.Training_Rate=3
					src.Intelligence=1
					src.Enchantment=1
					src.GravityMastered=5
					src.GravityMod=3.5
					src.TemperatureTolerance=0
					src.TemperatureToleranceType="None"
				src.Spawn="Vegeta"
				if(Spawns.Find("Heran"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Heran[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.GravityMastered=10
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("Kaio")
				src.Race="Kaio"
				src.BaseMod=3.5
				src.GravityMod=1.65
				if(src.Class=="Fighter")
					src.Training_Rate=2.75
					src.Meditation_Rate=1.75
				if(src.Class=="Wizard")
					src.Meditation_Rate=2.75
					src.Training_Rate=1.75
				src.Zenkai_Rate=0.5
				src.Intelligence=1.5
				src.Enchantment=2.5
				src.GravityMastered=10
				src.TemperatureTolerance=2
				src.TemperatureToleranceType="Cold"
				src.Spawn="Heaven"
				if(Spawns.Find("Kaio"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Kaio[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.TemperatureTolerance=3
					src.TemperatureToleranceType="Cold"
			if("Demon")
				src.Race="Demon"
				src.BaseMod=5
				src.Meditation_Rate=1.5
				src.Zenkai_Rate=0.5
				src.Training_Rate=2.25
				src.Intelligence=1
				src.Enchantment=1.25
				src.GravityMastered=10
				src.GravityMod=5
				src.TemperatureTolerance=3
				src.TemperatureToleranceType="Heat"
				src.Spawn="Vegeta"
				if(Spawns.Find("Demon"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Demon[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.TemperatureTolerance=3
					src.TemperatureToleranceType="Both"
			if("Hollow")
				src.Race="Hollow"
				src.Class="Basic"
				src.BaseMod=1.5
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=1.5
				src.Enchantment=1.5
				src.GravityMastered=10
				src.GravityMod=2.5
				src.TemperatureTolerance=3
				src.TemperatureToleranceType="Both"
				src.Spawn="Hell"
				if(Spawns.Find("Hollow"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Hollow[spawncheck]"))
							src.Spawn="[spawncheck]"
			if("Mazoku Demon")
				src.Race="Mazoku Demon"
				src.BaseMod=15
				src.Meditation_Rate=1.5
				src.Zenkai_Rate=0.5
				src.Training_Rate=2.25
				src.Intelligence=4
				src.Enchantment=4
				src.GravityMastered=10
				src.GravityMod=5
				src.TemperatureTolerance=3
				src.TemperatureToleranceType="Heat"
				src.Spawn="Hell"
				if(Spawns.Find("Demon"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Demon[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.TemperatureTolerance=3
					src.TemperatureToleranceType="Both"

			if("Half Demon")
				src.Race="Half Demon"
				src.BaseMod=2
				src.Meditation_Rate=1.75
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=1.5
				src.Enchantment=1.5
				src.GravityMastered=10
				src.GravityMod=3
				src.TemperatureTolerance=1.5
				src.TemperatureToleranceType="Heat"
				src.Spawn="Earth"
				if(Spawns.Find("Half Demon"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Half Demon[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Both"
			//Rares
			if("Dragon")
				src.Race="Dragon"
				src.BaseMod=3
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=2
				src.Enchantment=2
				src.GravityMastered=10
				src.GravityMod=10
				src.TemperatureTolerance=3
				src.TemperatureToleranceType="Both"
				src.Spawn="Special"
			if("Aetherian")
				src.Race="Aetherian"
				src.BaseMod=1.5
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=3
				src.Intelligence=1
				src.Enchantment=4
				src.GravityMastered=10
				src.GravityMod=10
				src.TemperatureTolerance=1
				src.TemperatureToleranceType="Cold"
				src.Spawn="Vegeta"
			if("God of Destruction")
				src.Race="God of Destruction"
				src.BaseMod=100
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=4
				src.Enchantment=4
				src.GravityMastered=10
				src.GravityMod=10
				src.TemperatureTolerance=3
				src.TemperatureToleranceType="Both"
				src.Spawn="Special"
				src.FatigueImmune=1
				src.InjuryImmune=1
			if("Anti-Spiral")
				src.Race="Anti-Spiral"
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=4
				src.Enchantment=4
				src.GravityMastered=10
				src.GravityMod=10
				src.TemperatureTolerance=3
				src.TemperatureToleranceType="Both"
				src.Spawn="Sanctuary"
				if(src.Class=="Messenger")
					src.BaseMod=10
				if(src.Class=="Scout")
					src.BaseMod=30
				if(src.Class=="Destroyer")
					src.BaseMod=75
				if(src.Class=="King")
					src.BaseMod=150
			if("Synchronizer")
				src.Race="Synchronizer"
				src.Meditation_Rate=2
				src.Zenkai_Rate=2
				src.Training_Rate=4
				src.Intelligence=4
				src.Enchantment=4
				src.GravityMastered=20
				src.GravityMod=20
				src.TemperatureTolerance=3
				src.TemperatureToleranceType="Both"
				src.Spawn="Earth"
				if(Spawns.Find("Synchronizer"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Synchronizer[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Class=="Maid")
					src.BaseMod=1
				if(src.Class=="Mastermind")
					src.BaseMod=0.5
					src.Intelligence=9
					src.Enchantment=9
				if(src.Class=="Meme")
					src.BaseMod=0.2
				if(src.Class=="Revolutionary")
					src.BaseMod=2
					src.Intelligence=125
					src.Enchantment=125
			if("Bio Android")
				src.Race="Bio Android"
				src.BaseMod=10
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=2
				src.Enchantment=1
				src.GravityMastered=10
				src.GravityMod=10
				src.TemperatureTolerance=2
				src.TemperatureToleranceType="Both"
				src.Spawn="Special"
			if("Majin")
				src.Race="Majin"
				src.BaseMod=5
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=1
				src.Enchantment=1
				src.GravityMastered=10
				src.GravityMod=10
				src.TemperatureTolerance=2
				src.TemperatureToleranceType="Both"
				src.Spawn="Special"
			if("Makaioshin")
				src.Race="Makaioshin"
				src.TemperatureTolerance=2.5
				src.TemperatureToleranceType="Both"
				src.Spawn="Special"
				switch(src.Class)
					if("Wisdom")
						src.BaseMod=4
						src.Zenkai_Rate=0.5
						src.Meditation_Rate=3
						src.Training_Rate=2
						src.Intelligence=4
						src.Enchantment=4
						src.GravityMod=1.65
						src.GravityMastered=10
					if("Courage")
						src.BaseMod=3
						src.Zenkai_Rate=0.5
						src.Meditation_Rate=2.5
						src.Training_Rate=2.5
						src.Intelligence=4
						src.Enchantment=4
						src.GravityMod=1
						src.GravityMastered=10
					if("Power")
						src.BaseMod=5
						src.Zenkai_Rate=0.5
						src.Meditation_Rate=2
						src.Training_Rate=3
						src.Intelligence=4
						src.Enchantment=4
						src.GravityMod=3
						src.GravityMastered=10

			if("Demi")
				src.Race="Demi"
				src.BaseMod=2
				src.Meditation_Rate=1.25
				src.Zenkai_Rate=0.5
				src.Training_Rate=3
				src.Intelligence=2
				src.Enchantment=1.25
				src.GravityMastered=10
				src.GravityMod=1.75
				src.TemperatureTolerance=0.5
				src.TemperatureToleranceType="Both"
				src.Spawn="Earth"
				if(Spawns.Find("Demi"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Demi[spawncheck]"))
							src.Spawn="[spawncheck]"
				if(src.Spawn=="Ice")
					src.TemperatureTolerance=1.5
					src.TemperatureToleranceType="Cold"
			if("Android") //Adjusted to 'new' model Android design.
				src.Race="Android"
				if(src.Class=="Fighter")
					src.BaseMod=3 //Old model Androids will be set to 3, but they're rares.
					src.Meditation_Rate=1.75 //Old model Androids are 1.75, new varies.
					src.Zenkai_Rate=0.1
					src.Training_Rate=1.75 //Old model Androids are 1.75, new varies.
					src.Intelligence=1.75 // Old model Androids are 1.75, new varies.
				if(src.Class=="Juggernaut"||src.Class=="Hunter"||src.Class=="Slayer")
					src.BaseMod=3.5
					src.Meditation_Rate=1
					src.Zenkai_Rate=0.1
					src.Training_Rate=2.5
					src.Intelligence=2
				if(src.Class=="Engineer")
					src.BaseMod=3.5
					src.Meditation_Rate=2.5
					src.Zenkai_Rate=0.1
					src.Training_Rate=1
					src.Intelligence=4
				src.Enchantment=0.5
				src.GravityMastered=10
				src.GravityMod=2.5
				src.TemperatureTolerance=10
				src.TemperatureToleranceType="Both"
				src.Spawn="Android"
				if(Spawns.Find("Android"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Android[spawncheck]"))
							src.Spawn="[spawncheck]"
			if("Reploid") .
				src.Race="Reploid"
				if(src.Class=="X")
					src.BaseMod=3.5
					src.Meditation_Rate=1.75
					src.Zenkai_Rate=0.1
					src.Training_Rate=1.75
					src.Intelligence=1.75
				if(src.Class=="Zero")
					src.BaseMod=3.5
					src.Meditation_Rate=1
					src.Zenkai_Rate=0.1
					src.Training_Rate=2.5
					src.Intelligence=2
				if(src.Class=="Vile")
					src.BaseMod=3.5
					src.Meditation_Rate=2.5
					src.Zenkai_Rate=0.1
					src.Training_Rate=1
					src.Intelligence=4
				src.Enchantment=0.5
				src.GravityMastered=10
				src.GravityMod=2.5
				src.TemperatureTolerance=10
				src.TemperatureToleranceType="Both"
				src.Spawn="Android"
				if(Spawns.Find("Reploid"))
					for(var/spawncheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
						if(Spawns.Find("Reploid[spawncheck]"))
							src.Spawn="[spawncheck]"
			if("Pathless")
				src.Race="Pathless"
				src.BaseMod=0.5
				src.Meditation_Rate=5
				src.Training_Rate=5
				src.Zenkai_Rate=0.5
				src.Intelligence=5
				src.Enchantment=5
				src.GravityMastered=10
				src.GravityMod=10
				src.Gender="Jinx"
				src.TemperatureTolerance=3
				src.TemperatureToleranceType="Both"
				src.Spawn="Earth"
			if("Kurama")
				src.Race="Kurama"
				src.BaseMod=3
				src.Meditation_Rate=1.75
				src.Zenkai_Rate=0.5
				src.Training_Rate=1.75
				src.Intelligence=2
				src.Enchantment=2
				src.GravityMastered=10
				src.GravityMod=1
				src.Gender="Furry"
				src.TemperatureTolerance=0
				src.TemperatureToleranceType="None"
				src.Spawn="Arconia"
			if("Pathfinder")
				src.Race="Pathfinder"
				src.BaseMod=3
				src.Meditation_Rate=2
				src.Zenkai_Rate=0.5
				src.Training_Rate=2
				src.Intelligence=2
				src.Enchantment=2
				src.GravityMastered=10
				src.GravityMod=10
				src.TemperatureTolerance=2
				src.TemperatureToleranceType="Both"
				src.Spawn="Special"
		if(src.Class=="Technologist")
			src.Intelligence=4
			src.Meditation_Rate=2
		if(src.Class=="Wizard")
			src.Enchantment=4
		if(src.Class=="Healer")
			src.Enchantment=4
		if(src.Class=="Spiritualist")
			src.Enchantment=4
		if(src.Class=="Deus")
			src.Intelligence*=2
			src.Enchantment*=2
		if(src.Class=="God")
			src.Intelligence*=2
			src.Enchantment*=2
		if(src.Class=="Greed")
			src.Intelligence=4
			src.Enchantment=1.5
		if(src.Class=="Envy")
			src.Intelligence=1.5
			src.Enchantment=4

	NewMob()
		var/mob/LOL=new/mob/Players/
		/*for(var/x in src.vars)
			LOL.vars[x]=src.x*/
		LOL.name=src.name
		LOL.Race=src.Race
		LOL.loc=src.loc
		LOL.Class=src.Class
		LOL.icon=src.icon
		LOL.BaseMod=src.BaseMod
		LOL.Base=src.Base
		LOL.EnergyMax=src.EnergyMax
		LOL.Parents=src.Parents
		LOL.Gender=src.Gender
		LOL.EnergyMod=src.EnergyMod
		LOL.StrengthMod=src.StrengthMod
		LOL.EnduranceMod=src.EnduranceMod
		LOL.SpeedMod=src.SpeedMod
		LOL.ForceMod=src.ForceMod
		LOL.ResistanceMod=src.ResistanceMod
		LOL.OffenseMod=src.OffenseMod
		LOL.DefenseMod=src.DefenseMod
		LOL.Regeneration=src.Regeneration
		LOL.Recovery=src.Recovery
		LOL.AngerMax=src.AngerMax
		LOL.GravityMod=src.GravityMod
		LOL.GravityMastered=src.GravityMastered
		LOL.Meditation_Rate=src.Meditation_Rate
		LOL.Zenkai_Rate=src.Zenkai_Rate
		LOL.Training_Rate=src.Training_Rate
		LOL.Spawn=src.Spawn
		LOL.Hair_Base=src.Hair_Base
		LOL.Hair_Color=src.Hair_Color
		LOL.Tail=src.Tail
		LOL.Intelligence=src.Intelligence
		if(LOL.Race=="Galvan"&&LOL.Class=="Prime")
			LOL.Intelligence+=rand(0,4)
		LOL.Enchantment=src.Enchantment
		LOL.TemperatureTolerance=src.TemperatureTolerance
		LOL.TemperatureToleranceType=src.TemperatureToleranceType
		LOL.BodyType=src.BodyType
		LOL.Gender=src.Gender
		LOL.Baby=src.Baby
		LOL.GenRaces=src.GenRaces
		LOL.ExpandIcon=LOL.icon
		src.client.mob=LOL
		del(src)
	Finalize()
		src.Birth_Year=Year
		src.Log_Year=Year
		src.Hair_Forms()
		src.Hairz("Add")
		if(src.Tail)src.Tail(1)
		//src.Aura='Aura1.dmi'
		//src.Aura+=rgb(100,200,250)
		src.ChargeIcon=image('BlastCharges.dmi',"[rand(1,9)]")
		var/obj/Communication/C=new(src)
		//C.Text_Color="#[rand(2,9)][rand(2,9)][rand(2,9)][rand(2,9)][rand(2,9)][rand(2,9)]"
		C.Text_Color=pick("#00FF00","#FFFF00","#FF00FF","#0000FF","#FF0000","#00FFFF")
		src.contents+=new/obj/Money
		//src.TotalDevPoints+=WorldDevPoints
		//src.SpendableDevPoints+=WorldDevPoints
		src.RewardPoints+=StartingRPP
		src.AutoReward["LastReward"]=_AutoReward["RewardsTotal"]
		//if(src.RewardPoints<=15)
		//	src.RewardPoints=15
		if(Year>=10)
			src.EXP+=StrongestEXP/2
		if(src.EXP>=5000)
			src.EXP=5000
		if(src.Race=="Human")
			if(src.Base<10)src.Base=1
			src.Decline=50
			src.Decline_Rate=1
			src.SenseReq=1.5
			///src.ThirdEyeReq=200000
			src.PrimeAge=16
			src.Potential=4
			src.Special=rand(1,25)
	/*		if(prob(3*(ThirdEyeReq/100000)) || findtextEx(src.name, "Molosi"))
				src.HTroll=1*/
			if(src.Class=="Sage")
			{
				src.contents+=new/obj/Skills/Buffs/Rinnegan
				src.ChiBlockUnlocked=1
				src.Potential = 2.5
			}
		if(src.Race=="Throwback")
			if(src.Base<10)src.Base=1
			src.Decline=50
			src.Decline_Rate=1
			src.SenseReq=1.5
			///src.ThirdEyeReq=pick(1;100,rand(100000,999999))
			src.PrimeAge=16
			src.Potential=4
			src.Special=rand(1,25)
	/*		if(prob(3*(ThirdEyeReq/100000)) || findtextEx(src.name, "Molosi"))
				src.HTroll=1*/

		if(src.Race=="Neko")
		{
			if(src.Base<10)src.Base=1
			src.Decline=40
			src.Decline_Rate=1
			src.SenseReq=1
			src.PrimeAge=2
			src.Potential="Meow meow meow."
			src.Special=rand(1,25);
			if(src.Class=="Schrodinger")
				src.contents+=new/obj/Skills/RiftTeleport
				src.contents+=new/obj/Skills/Rank/ShunkanIdo
				src.contents+=new/obj/Skills/Rank/KaioTeleport
		}
		if(src.Race=="Manakete")
		{
			if(src.Base<10)src.Base=1
			src.Decline = 110
			src.Decline_Rate = 0.1
			src.SenseReq = 1
			src.PrimeAge = 2
			src.Potential = "Rawr!"
			src.Special=rand(1,25)
			src.contents+=new/obj/Skills/Attacks/Fireball
			src.contents+=new/obj/Skills/Attacks/PoisonBolt
			src.contents+=new/obj/Skills/Attacks/MagiBolt

		}
		if(src.Race=="Golem")
		{
			if(src.Base<10)src.Base=1
			src.Decline=5500
			src.Decline_Rate=0.1
			src.SenseReq=0.5
			src.PrimeAge=0.1
			src.Potential=1
			src.Special=rand(1,25)
			/*src.contents += new/obj/Skills/Buffs/SpiritOfEarth
			src.contents += new/obj/Skills/Buffs/SpiritOfWisdom
			src.contents += new/obj/Skills/Buffs/FuryOfNature*/
		}
		if(src.Race=="Lamia")
			if(src.Base<10)src.Base=1
			src.Decline=150
			src.Decline_Rate=0.1
			src.SenseReq=1
			src.PrimeAge=11
			src.Potential=1
			src.Special=rand(1,25)
			src.contents+=new/obj/Skills/Namekian/InjuryRecovery
			//src.contents+=new/obj/Skills/Extra/SnakeHug //dash forth and 'hug' the first target you collide with
			//src.contents+=new/obj/Skills/Extra/SnakeAbsorb
				//new idea for above: sucks poison out of the selected enemy, since their racial passive is poison = HP recovery

			//src.contents+=new/obj/Skills/Extra/SnakeStrangle //for gorgon, same as Chokehold, wreck someone's fatigue + minor wounds
			//src.contents+=new/obj/Skills/Extra/SnakeBite //unique for echidna, inflicts crippling poison on someone you're holding
			//src.contents+=new/obj/Skills/Extra/SnakeFreeze //unique for medusa, stone gaze slows down an enemy and eventually stuns

			var/obj/Items/Wearables/tail = new/obj/Items/Wearables(src);
			tail.icon='KunaiMod/Icons/snektail.dmi';
			tail.name="Snake Tail";
			tail.Stealable=0

		if(src.Race=="Youkai")
			if(src.Base<10)src.Base=1
			src.Decline=150
			src.Decline_Rate=1
			src.SenseReq=1.25
			src.PrimeAge=8
			src.Potential=4
			src.Special=rand(1,25)
			src.contents+=new/obj/Skills/Rank/Imitation
			if(src.Class=="Kitsune")
			{
				var/obj/Items/Wearables/ears = new/obj/Items/Wearables(src);
				ears.icon = 'Fox Ears.dmi';
				ears.name = "Fox Ears";
				ears.Stealable=0 //pls world why even
				var/obj/Items/Wearables/tail = new/obj/Items/Wearables(src);
				tail.icon = 'Fox Tail.dmi';
				tail.name = "Fox Tail";
				tail.Stealable=0
			}
			if(src.Class=="Tanuki")
			{
				var/obj/Items/Wearables/ears = new/obj/Items/Wearables(src);
				ears.icon = 'Tanuki Ears.dmi';
				ears.name = "Tanuki Ears"
				ears.Stealable=0
				var/obj/Items/Wearables/tail = new/obj/Items/Wearables(src);
				tail.icon = 'Tanuki Tail.dmi';
				tail.name = "Tanuki Tail";
				tail.Stealable=0
				var/obj/Items/Wearables/leaf = new/obj/Items/Wearables(src);
				leaf.icon = 'Tanuki Leaf.dmi';
				leaf.name = "Tanuki Leaf";
				leaf.Stealable=0
			}
			if(src.Class=="Hell Raven")
			{
				src.contents+=new/obj/Skills/Attacks/GigaFlare
				//src.contents+=new/obj/Skills/Buffs/NuclearFusion
				//src.contents+=new/obj/Skills/Buffs/NuclearFission
				src.contents+=new/obj/Skills/BurstRegenerate
				//src.contents+=new/obj/Skills/Absorb
			}

		if(src.Race=="Nobody")
			if(src.Base<10)src.Base=1
			src.Decline=75
			src.Decline_Rate=1
			src.SenseReq=0.5
			src.PrimeAge=1
			src.Potential=0.5
			src.Special=rand(1,25)
			src.contents+=new/obj/Skills/Buffs/WillOfNothingness
		if(src.Race=="Dhampir") //racialsshit
			src.BaseMod=1.25
			src.Decline=55
			src.Decline_Rate=1
			src.PrimeAge=13
/*			src.contents+=new/obj/Skills/VampireAbsorb
			src.contents+=new/obj/Skills/VampireFrenzy
			src.contents+=new/obj/Skills/SendEnergy
			src.contents+=new/obj/Skills/LifeDrain
			src.contents+=new/obj/Skills/BurstRegenerate*/
			src.contents+=new/obj/Skills/Extra/Banquet
			src.contents+=new/obj/Skills/Extra/Silvermists
			src.contents+=new/obj/Skills/Extra/MinorCharm
		if(src.Class=="Deus")
			src.Base=1
		//	src.EnergyMax*=2
			///src.ThirdEyeReq=100
			src.contents+=new/obj/Skills/Attacks/Beams/Ray
			src.contents+=new/obj/Skills/Attacks/DeathBall
			src.contents+=new/obj/Skills/Rank/Splitclone
			//src.contents+=new/obj/Cyberize
		if(src.Class=="Shifter")
			src.Base=1
			src.EnergyMax*=2
//			src.Regeneration=3
//			src.Recovery=1
			///src.ThirdEyeReq=99999999999
			src.contents+=new/obj/Skills/Regenerate
			src.contents+=new/obj/Skills/Buffs/TitanForm
		if(src.Class=="Captain")
			src.contents+=new/obj/Skills/Bojack
		if(src.Race=="Spirit Doll")
			if(src.Base<10)src.Base=1
			src.Decline=50
			src.Decline_Rate=1.5
			src.SenseReq=0.5
			src.PrimeAge=10
			src.Potential=4
			src.Special=rand(1,5)
			src.contents+=new/obj/Skills/Fly
		if(src.Race=="Popo")
			if(src.Base<10)src.Base=1
			src.Decline=9999999
			src.Decline_Rate=0
			src.SenseReq=0.1
			src.PrimeAge=-38
			src.Potential="Hiiiiiiiiiiiiiii"
			src.Special=rand(1,25)
			//src.contents+=new/obj/Cyberize
		if(src.Race=="Tsufurujin")
			if(src.Base<10)src.Base=1
			src.Decline=50
			src.Decline_Rate=1
			src.SenseReq=1.5
			src.Potential=2.5
			src.PrimeAge=15
			src.Special=rand(1,25)
		if(src.Race=="Makyo")
			if(src.Base<10)src.Base=1
			src.Decline=65
			src.Decline_Rate=1
			src.PrimeAge=10
			src.Potential=1.75
			src.SenseReq=1.25
			src.Special=rand(1,25)
		if(src.Race=="Namekian")
			src.asexual=1
			if(src.Base<10)src.Base=1
			src.Decline=80
			src.Decline_Rate=0.5
			src.SenseReq=0.5
			src.PrimeAge=5
			src.contents+=new/obj/Skills/BurstRegenerate
			src.contents+=new/obj/Skills/Namekian/ExtendAttack
			src.contents+=new/obj/Skills/Namekian/ExtendGrab
			src.contents+=new/obj/Skills/Namekian/InjuryRecovery
			src.Potential=2
			src.Special=rand(1,25)
			if(src.Class=="Healer")
				src.contents+=new/obj/Skills/Heal
			if(src.Class=="Ancient")
				src.PrimeAge=1
				src.Base*=100
				if(src.EnergyMax<500)src.EnergyMax=rand(1000,5000)*src.EnergyMod
				src.Potential=0.5

		if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
			src.Decline=50
			src.Decline_Rate=1.5
			src.PrimeAge=16
			src.SenseReq=2
			src.Special=rand(1,25)
			if(src.Class!="Quarter")
				src.Tail(1)
				src.contents+=new/obj/Oozaru
			if(src.Class=="Legendary")
				src.Potential=0.25
				if(src.Base<10)src.Base=1
				src.Special=rand(1,5)
			if(src.Class=="Elite")
				src.Potential=0.75
				src.Special=rand(4,5)
				if(src.Base<10)src.Base=1
				src.ActiveBuffs=3
				src.SpecialSlot=1
			if(src.Class=="Normal")
				src.Potential=1
				if(src.Base<10)src.Base=1
			if(src.Class=="Low-Class")
				src.Potential=1.5
				src.Special=rand(1,10)
				if(src.Base<10)src.Base=1
			if(src.Class=="Gohan")
				src.Potential=3.35
				src.Special=rand(1,30)
				if(src.Base<10)src.Base=1
			if(src.Class=="Goten")
				src.Potential=2.85
				if(src.Base<10)src.Base=1
			if(src.Class=="Trunks")
				src.Potential=2.5
				src.Special=rand(3,5)
				if(src.Base<10)src.Base=1
			if(src.Class=="Quarter")
				src.Potential=5
				src.Base=1
			if(src.Class=="Savage")
				src.Special=5
				src.Base=1
				src.Potential=0.5
			if(src.Class=="Hellspawn")
				src.Potential=1
				if(src.Base<10)src.Base=1
				src.contents+=new/obj/Skills/Absorb
				src.contents+=new/obj/Skills/Buffs/Majin
				src.Special=rand(1,5)
			if(src.Class=="Fire God")
				src.Potential=0.1
				if(src.Base<10)src.Base=1
				src.Special=rand(1,5)
			if(src.Race=="Half Saiyan")
				PrimeAge/=2
		if(src.Race=="Changeling")
			src.asexual=1
			src.Decline=80
			src.Decline_Rate=1
			src.SenseReq=3
			src.PrimeAge=2
			src.Potential=0.25
			src.Special=rand(1,25)
			if(src.Class=="Frieza")
				if(src.Base<10)src.Base=1
				src.Potential=0.4
			if(src.Class=="Cooler")
				if(src.Base<10)src.Base=1
				src.Potential=0.5
			if(src.Class=="Chilled")
				if(src.Base<10)src.Base=1
				src.Potential=0.35
			if(src.Class=="King Kold")
				if(src.Base<10)src.Base=1
				src.Potential=0.2

		if(src.Race=="Aetherian")
			src.contents+=new/obj/Skills/Attacks/DragonNova
			src.Base=1
			src.PrimeAge=5
			src.Potential=1
			src.Decline=100
			src.SenseReq=1
			src.PrimeAge=5

		if(src.Race=="Alien")
			if(src.Base<10)src.Base=1
			src.Decline=rand(50,90)
			src.Decline_Rate=1
			src.SenseReq=pick(1,1.5,2,2.5)
			src.PrimeAge=rand(5,20)
			src.Potential=4
			src.contents+=new/obj/Skills/Buffs/Berserk
			src.Special=rand(1,25)
			if(src.Class=="Blue Mage")
				src.Decline*=2
				src.EnergyMax=rand(100,1000)
				src.PrimeAge/=4

		if(src.Race=="Trueseer")
			if(src.Base<10)src.Base=1
			src.Decline=rand(50,90)
			src.Decline_Rate=1
			src.SenseReq=0.75
			src.PrimeAge=rand(5,20)
			src.Potential=4
			src.Special=rand(1,25)

		if(src.Race=="Galvan")
			if(src.Base<10)src.Base=1
			src.Decline=rand(50,90)
			src.Decline_Rate=1
			src.SenseReq=2
			src.PrimeAge=rand(5,20)
			src.Potential=2
			src.Special=rand(1,25)
			//src.contents+=new/obj/Cyberize

		if(src.Race=="Vampire")
			src.Decline=200
			if(src.Base<500)src.Base=1
			src.EnergyMax=rand(500,1000)
			src.PrimeAge=8
			src.Special=rand(1,25)
			src.Potential=1.25
			src.SenseReq=2
			src.contents+=new/obj/Skills/VampireAbsorb
			src.contents+=new/obj/Skills/VampireFrenzy
			src.contents+=new/obj/Skills/SendEnergy
			src.contents+=new/obj/Skills/VampireInfect
			src.contents+=new/obj/Skills/Regenerate
			src.contents+=new/obj/Skills/LifeDrain
			src.contents+=new/obj/Regenerate
/*			src.contents+=new/obj/Skills/Extra/Banquet
			src.contents+=new/obj/Skills/Extra/Silvermists
			src.contents+=new/obj/Skills/Extra/MinorCharm*/
			if(src.Class=="Volodarskii")
				src.contents+=new/obj/Skills/Attacks/Checkmate
				src.contents+=new/obj/Skills/Rank/TheWorld
			for(var/obj/Regenerate/x in src)
				x.Level=1
				if(src.Class=="Volodarskii")
					x.Level=2
		if(src.Race=="Lycan")
			src.Decline=200
			if(src.Base<500)src.Base=1
			if(!src.Baby)
				src.EnergyMax=rand(500,1000)
			src.PrimeAge=5
			src.Potential=1
			src.Special=rand(1,25)
			src.SenseReq=2
			src.contents+=new/obj/Regenerate
			for(var/obj/Regenerate/x in src)
				x.Level=1
			src.contents+=new/obj/Lycan/Master
			src.contents+=new/obj/Skills/Regenerate
//			src.contents+=new/obj/Skills/Buffs/Berserk
		if(src.Race=="Heran")
			if(src.Base<10)src.Base=1
			src.Decline=50
			src.Decline_Rate=1
			src.SenseReq=1.5
			src.PrimeAge=15
			src.Potential=1
			src.Special=rand(1,25)
			if(src.Class=="Captain")
				src.contents+=new/obj/Skills/Bojack
		if(src.Race=="Kaio")
			if(src.Base<500)src.Base=1
			src.Decline=999
			src.Decline_Rate=3
			src.SenseReq=0.1
			src.PrimeAge=5
			src.Potential=3
			src.Special=rand(1,25)
		if(src.Race=="Demon")
			if(src.Base<10)src.Base=1
			src.Decline=100
			src.Decline_Rate=2.5
			src.PrimeAge=5
			src.Potential=0.5
			src.Special=rand(1,25)
		if(src.Race=="Hollow")
			if(src.Base<10)src.Base=1
			src.Decline=100
			src.Decline_Rate=2.5
			src.Class="Basic"
			src.PrimeAge=5
			src.Potential=2
			src.Special=rand(1,25)
			src.contents+=new/obj/Skills/Rank/Invisibility
		if(src.Race=="Mazoku Demon")
			if(src.Base<10)src.Base=1
			src.Race="Demon"
			src.Class="Mazoku"
			src.Decline=100
			src.Decline_Rate=2.5
			src.contents+=new/obj/Skills/Absorb
			src.PrimeAge=5
			src.Potential=0.5
			src.Special=rand(1,25)

		if(src.Race=="Half Demon")
			if(src.Base<10)src.Base=1
			src.Decline=75
			src.Decline_Rate=2.5
			src.PrimeAge=10
			src.Potential=2.5
			src.Special=rand(1,25)
			///if(prob(1))
				///src.ThirdEyeReq=100
			if(src.Class=="Gluttony")
				src.contents+=new/obj/Skills/Absorb

		//Rares
		if(src.Race=="Dragon")
			if(src.Base<10)src.Base=1
			src.Decline=150
			src.Decline_Rate=2.5
			src.EnergyMax=src.EnergyMod*5000
			src.contents+=new/obj/Skills/Absorb
			src.PrimeAge=0.5
			src.contents+=new/obj/Regenerate
			for(var/obj/Regenerate/x in src)
				x.Level=1.5
			src.Potential=0.1
			src.Special=rand(1,25)
		if(src.Race=="God of Destruction")
			if(src.Base<10)src.Base=1
			src.Decline=150
			src.Decline_Rate=2.5
			src.EnergyMax=src.EnergyMod*50000
			src.PrimeAge=0.5
			src.Potential=0.1
			src.Divine=1
			src.Special=rand(1,25)
		if(src.Race=="Anti-Spiral")
			if(src.Base<10)src.Base=1
			src.Decline=150
			src.Decline_Rate=2.5
			src.EnergyMax=src.EnergyMod*50000
			src.PrimeAge=0.5
			src.Potential=0.1
			src.Special=rand(1,25)
		if(src.Race=="Synchronizer")
			if(src.Base<10)src.Base=1
			src.Decline=150
			src.Decline_Rate=0.5
			src.EnergyMax=src.EnergyMod*5000
			src.PrimeAge=16
			src.Potential=1
			src.Special=rand(1,25)
			if(src.Class=="Maid")
				src.contents+=new/obj/Skills/Extra/MakeFood
				src.contents+=new/obj/Skills/Extra/Sidewhack
				src.contents+=new/obj/Skills/Extra/SweepingBroom
				src.contents+=new/obj/Skills/Extra/HiddenBlade
				src.contents+=new/obj/Skills/Extra/HiddenBlade2
				src.contents+=new/obj/Skills/Extra/MemeHomerun
				src.contents+=new/obj/Skills/Extra/MakeStaff
//			if(src.Class=="Mastermind")
//				src.contents+=new/obj/Skills/Feva/MassSplitform
//				src.contents+=new/obj/Skills/Rank/SuperGhostKamikaze
//			if(src.Class=="Meme")
			if(src.Class=="Revolutionary")
				src.contents+=new/obj/Skills/RiftTeleport
		if(src.Race=="Pathless")
			src.Decline=1000
			src.Base=1
			src.PrimeAge=0.001
			src.Special=rand(1,25)
			src.Potential=20
			src.SenseReq=0.001
		if(src.Race=="Kurama")
			src.Decline=5000
			if(src.Base < 750)
				src.Base=1
			src.EnergyMax=1000
			src.PrimeAge=0.1
			src.Potential=4
			src.SenseReq=0.01
		if(src.Race=="Pathfinder")
			src.Decline=200
			if(src.Base<500)src.Base=1
			src.EnergyMax=rand(500,1000)
			src.PrimeAge=5
			src.Special=rand(1,25)
			src.Potential=2
			src.SenseReq=2
			/*src.contents+=new/obj/Skills/Buffs/PathFind
			src.contents+=new/obj/Skills/Buffs/EmbarkOnPath
			src.contents+=new/obj/Skills/Buffs/Duel*/
		if(src.Race=="Bio Android")
			if(src.Base<10)src.Base=1
			src.Decline=50
			src.Decline_Rate=2.5
			src.EnergyMax=src.EnergyMod*1000
			src.contents+=new/obj/Skills/Absorb
			src.contents+=new/obj/Skills/Regenerate
			src.contents+=new/obj/Regenerate
			for(var/obj/Regenerate/x in src)
				x.Level=2
			src.PrimeAge=1
			src.Potential=0.25
			src.Special=rand(1,25)
		if(src.Race=="Majin")
			if(src.Base<10)src.Base=1
			src.Decline=50
			src.Decline_Rate=2.5
			src.EnergyMax=src.EnergyMod*500
			src.contents+=new/obj/Skills/Absorb
			src.contents+=new/obj/Skills/Regenerate
			src.contents+=new/obj/Regenerate
			for(var/obj/Regenerate/x in src)
				x.Level=3
			src.PrimeAge=2
			src.Potential=1
			src.Special=rand(1,25)
		if(src.Race=="Makaioshin")
			if(src.Base<10)src.Base=1
			src.Decline=150
			src.Decline_Rate=2.5
			src.SenseReq=0.75
			src.contents+=new/obj/Skills/Absorb
			src.contents+=new/obj/Skills/Observe
			src.contents+=new/obj/Skills/Telepathy
			//src.contents+=new/obj/Cyberize
			src.contents+=new/obj/Skills/Buffs/Mystic
			src.contents+=new/obj/Skills/Buffs/Majin
			src.contents+=new/obj/Skills/BurstRegenerate
			if(src.Class=="Courage")
				src.Potential=2.25
			if(src.Class=="Wisdom")
				src.Potential=1.75
			if(src.Class=="Power")
				src.Potential=1.5
			src.PrimeAge=5
			src.Special=rand(1,25)
		if(src.Race=="Demi")
			if(src.Base<10)src.Base=1
			src.Decline=70
			src.Decline_Rate=1.5
			src.Potential=1.75
			src.PrimeAge=16
			src.Special=rand(1,25)
		if(src.Race=="Android")
			if(src.Base<10)src.Base=1
			src.Decline=999
			src.PrimeAge=0.1
			src.asexual=1
			src.contents+=new/obj/Skills/InternalCommunicator
			if(src.Class=="Juggernaut")
				src.contents+=new/obj/Skills/NMAndroids/JuggernautMode
				src.contents+=new/obj/Skills/NMAndroids/HeavyDrain
			if(src.Class=="Hunter")
				src.contents+=new/obj/Skills/NMAndroids/TacticalCloak
				src.contents+=new/obj/Skills/NMAndroids/HunterMode
			if(src.Class=="Engineer")
				src.EnhancedSensors=1
			if(src.Class=="Slayer")
				src.contents+=new/obj/Skills/NMAndroids/SwordsmanServomotors
			src.Potential=0.1
			src.Special=rand(1,5)
			//var/obj/x=new/obj/Skills/Regenerate(src.contents)
			//x.Level=0.25
		if(src.Race=="Reploid")
			if(src.Base<10)src.Base=1
			src.Decline=999
			src.PrimeAge=0.1
			src.asexual=1
			src.contents+=new/obj/Skills/InternalCommunicator
//			if(src.Class=="X")
//				src.contents+=new/obj/Skills/NMAndroids/JuggernautMode
//				src.contents+=new/obj/Skills/NMAndroids/HeavyDrain
//			if(src.Class=="Zero")
//				src.contents+=new/obj/Skills/NMAndroids/TacticalCloak
//				src.contents+=new/obj/Skills/NMAndroids/HunterMode
//			if(src.Class=="Vile")
//				src.contents+=new/obj/Skills/NMAndroids/SwordsmanServomotors
			src.Potential=0.1
			src.Special=rand(1,5)
		if(src.Race=="Quarter Saiyan")
			if(src.Base<10)src.Base=1
			src.Decline=50
			src.Decline_Rate=1
			src.SenseReq=1.5
			src.PrimeAge=4
			//src.Potential=1 //old potential
			src.Potential=4
			src.Special=rand(1,25)
		if(src.Race=="1/16th Saiyan")
			if(src.Base<10)src.Base=1
			src.Decline=50
			src.Decline_Rate=1
			src.SenseReq=1
			src.PrimeAge=4
			src.Potential=5
			src.Special=rand(1,25)
			///src.ThirdEyeReq=pick(1;100,rand(100000,999999))
		src.OriginalPotential=src.Potential
		if(src.Race == "Neko")
		{
			src.OriginalPotential=1
		}
		if(src.Race == "Pathless")
			src.OriginalPotential=20
			src.Potential="Limitless"
		src.OriginalSpeedMod=src.SpeedMod
		src.OriginalBaseMod=src.BaseMod
		if(src.Race=="Popo")
			src.OriginalPotential=10
		src.SetVars()
		src.contents+=new/obj/Skills/MartialArts/Pursuit
		if(src.Race=="Alien"||src.Race=="Spirit Doll"||src.Race=="Makyo"||src.Race=="Demon")
			var/blurp=input(src,"Would you like to be asexual?","EGGS HERE!") in list("Asexual","Sexual")
			if(blurp=="Asexual")
				src.asexual=1
			else
				src.asexual=0
		if(src.Baby==0)
			var/AgeSelect=input("How old do you wish to start out as? No younger than 0.1 but no older than [src.Decline]. Your prime age is [src.PrimeAge].") as num
			AgeSelect=round(AgeSelect)
			if(AgeSelect>=src.Decline)
				src.Age=src.Decline
				src<<"Your age is set to [usr.Age]! Wow you're old."
				src.Decline_Rate*=0.75
			else if(AgeSelect<0.1)
				src.Age=0.1
				src<<"Your age is set to [usr.Age]! You can't be have negative age!"
			else if(AgeSelect<src.Decline&&AgeSelect>=0.1)
				src.Age=AgeSelect
				src<<"Your age is set to [usr.Age]!"
			src.SendToSpawn()
		else
			src.Age=0
		src.Birth_Year=Year-src.Age
		spawn()src.ReincarnateCheck()
		for(var/q in src.Parents)
			src.EnergyMax*=src.EnergyMod
			src.Base*=src.BaseMod
			break
		for(var/x in src.Parents)
			for(var/mob/Players/M in world)
				if(x==M.key&&M.asexual==0)
					src.loc=M.loc
					break
		src.EnergyMax=100
mob/proc
	BuildingKit()
		if(global.MakeAMap)
			src.BuildGiven=1
			src.MaterialTechnology=5
			src.contents+=new/obj/Items/Tech/Scouter
			if(!locate(/obj/Skills/Fly, src))
				src.contents+=new/obj/Skills/Fly
			if(!locate(/obj/Skills/ZPlaneWarp, src))
				src.contents+=new/obj/Skills/ZPlaneWarp
			src << "You've been granted fly, build, zplane warp, and a scouter to note coordinates."
			src << "Have fun creating the world!"
			src << "Note: You can't actually make warpers, so if you want to make environments on two Z planes, please remember your coordinates."
		else
			src.BuildGiven=0
			if(locate(/obj/Skills/Fly, src))
				for(var/obj/Skills/Fly/f in src)
					del f
			if(locate(/obj/Skills/ZPlaneWarp, src))
				for(var/obj/Skills/ZPlaneWarp/zp in src)
					del zp

mob/proc
	SpawnPointCheck() //Ran to check for SpawnPoint objects. If none are found for a race, it'll default them to coordinate based spawning.
		var/list/SpawnPointList=list()
		var/SpawnCounter=0
		for(var/obj/Special/SpawnPoint/SP in world)
			if(SP.ActiveSpawn)
				if(SP.RacesAllowed.Find("[src.Race]")||SP.RacesAllowed.Find("All"))
					SpawnCounter++
					SpawnPointList+=SP


		if(SpawnCounter)
			var/obj/Special/Selection=input("Pick a spawn point! The name should give a idea of where it is...") in SpawnPointList
			src.loc=Selection.loc
			return 1
		else
			return 0

	IsTropicThunderRace()
		if(src.Race=="Saiyan"||src.Race=="Half Saiyan"||src.Race=="Demon"||src.Race=="Android"||src.Race=="Reploid"||src.Race=="Vampire"||src.Race=="Heran"||src.Race=="Lycan")
			return 1
		return 0
	IsCaliforniaUnderwaterRace()
		if(src.Race=="Human"||src.Race=="Spirit Doll"||(src.Race=="Youkai"&&src.Class!="Hell Raven")||src.Race=="Neko"||src.Race=="Demigod"||src.Race=="1/16th Saiyan")
			return 1
		return 0
	IsAfterlifeRace()//everyone else lmao
		return 1
	IsExceptional()
		if(!(src.IsEarthRace())&&!(src.IsArconiaRace()))
			return 1
		return 0
	IsEarthRace()
		if(src.Race in list("Human", "Spirit Doll", "Namekian", "Youkai", "Neko", "Half Demon", "Demi"))
			return 1
		return 0
	IsArconiaRace()
		if(src.Race in list("Saiyan", "Tsufurujin", "Alien", "Heran", "Demon", "Android","Reploid"))
			return 1
		return 0


mob/proc/SendToSpawn()

	if(!src.SpawnPointCheck())
		src<<"No spawn points found for [src.Race]. Looking up default planetary coordinates. You should also consider poking Amatsu because they forgot a race..."
		src.loc=locate(178,40,1)
/*		if(src.Spawn=="Earth")
			src.loc=locate(232,132,1)
		else if(src.Spawn=="Namek")
			src.loc=locate(90,455,2)
		else if(src.Spawn=="Vegeta")
			var/selection=input("Spawn with the Tuffles, or with the Saiyans?")in list("Tuffles","Saiyans")
			if(selection=="Tuffles")
				src.loc=locate(400,280,3)
			if(selection=="Saiyans")
				src.loc=locate(120,300,3)
		else if(src.Spawn=="Icer")
			src.loc=locate(236,245,4)
		else if(src.Spawn=="Arconia")
			src.loc=locate(220,175,5)
		else if(src.Spawn=="Sanctuary")
			src.loc=locate(245,130,18)
		else if(src.Spawn=="Heaven")
			src.loc=locate(80,380,6)
		else if(src.Spawn=="Hell")
			src.loc=locate(110,240,7)
		else if(src.Spawn=="Afterlife")
			src.loc=locate(237,228,8)
		else if(src.Spawn=="Android")
			src.loc=locate(258,466,9)
		else
			src<<"Unable to find default planetary coordinates. Contact admins."
			src.loc=locate(250,200,9)*/
		return


/*	if(global.JinxMap)
		if(src.IsTropicThunderRace())
			src.loc=locate(250, 250, 1)
			return
		if(src.IsCaliforniaUnderwaterRace())
			src.loc=locate(261, 312, 4)
			return
		if(src.Race=="Tsufurujin")
			src.loc=locate(326, 148, 1)
		if(src.IsAfterlifeRace())
			src.loc=locate(250, 250, 12)
			return

	if(!global.JinxMap)
		if(src.IsExceptional())
			src.loc=locate(250,250,9)
			return
		if(src.IsEarthRace())
			if(src.Race in list("Human", "Spirit Doll"))
				src.loc=locate(241, 171, 1)
			if(src.Race in list("Youkai", "Neko"))
				src.loc=locate(368, 253, 1)
			if(src.Race in list("Demi", "Half Demon"))
				src.loc=locate(163, 292, 1)
			return
		if(src.IsArconiaRace())
			if(src.Race in list("Saiyan", "Half Saiyan", "Quarter Saiyan", "1/16th Saiyan"))
				src.loc = locate(181, 153, 5)
			else
				src.loc = locate(224, 395, 5)
			return
		return
/*	if(src.Race=="Human"||src.Race=="Spirit Doll"||src.Race=="Half Saiyan")
		src.loc=locate(87,331,1)
	else if(src.Race=="Namekian")
		src.loc=locate(57,452,1)
	else if(src.Race=="Saiyan"||src.Race=="Makyo"||src.Race=="Half Demon")
		src.loc=locate(260,125,1)
	else if(src.Race=="Demon")
		src.loc=locate(450,450,1)
		src<<"You're a case by case situtation where you spawn. contact admins."
	else if(src.Race=="Youkai")
		src.loc=locate(90,435,1)
	else
		src.loc=locate(115,326,1)*/

	if(SpecialSpawnPoints)
//		if(src.Spawn=="Earth")
//			src.loc=locate(87,331,1)
//		if(src.Spawn=="Namek")
//			src.loc=locate(137,322,1)
//		if(src.Spawn=="Vegeta")
//			if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
//				src.loc=locate(166,400,22)
//			else
//				src.loc=locate(425,315,3)
//		if(src.Spawn=="Arconia")
//			src.loc=locate(217,177,5)
//		if(src.Spawn=="Ice")
//			src.loc=locate(217,177,5)
		if(src.Race=="Human"||src.Race=="Tsufurujin"||src.Race=="Spirit Doll"||src.Race=="Half Demon"||src.Race=="Demi"||src.Race=="Demon"||src.Race=="Aetherian"||src.Race=="Kaio"||src.Race=="Pathfinder"||src.Race=="Throwback"||src.Race=="1/16th Saiyan"||src.Race=="Neko")
			src.loc=locate(361,50,6)
		if(src.Race=="Namekian"||src.Race=="Alien"||src.Race=="Heran"||src.Race=="Youkai"||src.Race=="Makyo"||src.Race=="Saiyan"||src.Race=="Half Saiyan"||src.Race=="Quarter Saiyan")
			src.loc=locate(389,50,5)
		if(src.Race=="Popo"||src.Race=="Nobody"||src.Race=="Half Demon"||src.Race=="Majin"||src.Race=="Dragon"||src.Race=="Makaioshin"||src.Race=="God of Destruction"||src.Race=="Mazoku Human"||src.Race=="Lycan"||src.Race=="Vampire"||src.Race=="Golem"||src.Race=="Manakete"||src.Race=="Android"||src.Race=="Bio Android"||src.Race=="Changeling"||src.Race=="Anti-Spiral"||src.Race=="Pathless"||src.Race=="Kurama")
			src.loc=locate(230,215,4)

	else
		if(src.Race=="Human"||src.Race=="Half Demon"||src.Race=="Youkai"||src.Race=="Spirit Doll"||src.Race=="Demi"||src.Race=="Throwback"||src.Race=="1/16th Saiyan"||src.Race=="Neko")
			src.loc=locate(361,50,6)
		else if(src.Race=="Namekian")
			src.loc=locate(366,75,6)
		else if(src.Race=="Saiyan"||src.Race=="Half Saiyan"||src.Race=="Quarter Saiyan")
			src.loc=locate(389,50,5)
		else if(src.Race=="Tsufurujin"||src.Race=="Demon")
			src.loc=locate(370,115,5)
		else if(src.Race=="Alien"||src.Race=="Aetherian"||src.Race=="Heran")
			src.loc=locate(250,250,3)
		else if(src.Race=="Popo"||src.Race=="Nobody"||src.Race=="Half Demon"||src.Race=="Majin"||src.Race=="Dragon"||src.Race=="Makaioshin"||src.Race=="God of Destruction"||src.Race=="Mazoku Human"||src.Race=="Lycan"||src.Race=="Vampire"||src.Race=="Golem"||src.Race=="Manakete"||src.Race=="Android"||src.Race=="Bio Android"||src.Race=="Changeling"||src.Race=="Anti-Spiral"||src.Race=="Pathless"||src.Race=="Kurama")
			src.loc=locate(230,215,4)
		else
			src.loc=locate(230,215,4)
			src<<"Okay, either Amatsu forgot a common race somehow (oops), or you're a rare he also forgot about. Poke admins."
//		if(src.Spawn=="Earth")
//			if(src.Race=="Human")
//				src.loc=locate(241,162,1)
//			else if(src.Race=="Spirit Doll")
//				src.loc=locate(241,162,1)
//			else if(src.Race=="Makyo")
//				src.loc=locate(196,318,15)
//			else if(src.Race=="Youkai")
//				src.loc=locate(359,200,1)
//			else
//				src.loc=locate(245,132,1)
//		if(src.Spawn=="Namek")
//			src.loc=locate(180,330,2)
//		if(src.Spawn=="Vegeta")
//			if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
//				src.loc=locate(95,200,3)
//			else
//				src.loc=locate(390,353,3)
//		if(src.Spawn=="Ice")
//			src.loc=locate(246,226,4)
//		if(src.Spawn=="Arconia")
//			src.loc=locate(217,177,5)
//	if(src.Spawn=="Sanctuary")
//		src.loc=locate(245,132,18)
//	if(src.Spawn=="Heaven")
//		src.loc=locate(164,382,6)
//	if(src.Spawn=="Hell")
//		src.loc=locate(106,354,21)
//	if(src.Spawn=="Afterlife")
//		src.loc=locate(200,270,8)
//	if(src.Spawn=="Special")
//		src.loc=locate(80,490,10)
//	if(src.Spawn=="Android")
//		src.loc=locate(236,465,9)
//	if(src.Spawn=="Sanctuary")
//		src.loc=locate(235,132,18)
//	if(!src.Spawn)
//		src.loc=locate(137,322,1)
*/
