#define REWARDMINIMUM_EMOTES 15
#define REWARDMINIMUM_CHARACTERS 5000
#define DEFAULTCOLOR "yellow"

var/regex/roleplay_say = regex( "\[\"](.*?)\[\"]", "g" )


mob/proc
	SendPing(var/mob/Players/M, var/silent=0)
		winset(M, "mainwindow", "flash=3")
		if(!silent) M << sound('scouter.wav',volume=50)

	PingAllPlayers(var/silent=0)
		for(var/mob/Players/M in GetListOfPlayers())
			src.SendPing(M, silent)

mob/Players/verb

	Ping(var/mob/Players/M as mob)
		if(M == usr) return
		SendPing(M, 0)
		M << "[src] has pinged you."
		usr<<"Your ping is being escorted to [M] by the most elite Messatsu samurai. Do not fret!"

	WoundIntent()
		set category="Other"
		if(usr.WoundIntent)
			usr.WoundIntent=0
			usr<<"You will no longer deal wounds in most cases."
		else
			usr.WoundIntent=1
			usr<<"You will now deal wounds in most cases."

	BaseSelect()
		set category="Other"
		if(usr.CursedBeta=="Animal")
			usr<< "You can't use this verb while cursed ( : "
			return
		if(usr.Race=="Human"||usr.Race=="Kurama"||usr.Race=="Saiyan"||usr.Race=="Tsufurujin"||usr.Race=="Demi"||usr.Race=="Half Saiyan"||usr.Race=="Quarter Saiyan"||usr.Race=="Half Demon"||usr.Race=="Youkai"||usr.Race=="Nobody"||usr.Race=="Neko"||usr.Race=="Manakete"||usr.Race=="Golem")
			usr.Grid("CreationHuman")
		else if(usr.Race=="Namekian")
			usr.Grid("CreationNamekian")
		else if(usr.Race=="Changeling")
			usr.Grid("CreationChangeling")
		else if(usr.Race=="Alien"||usr.Race=="Lycan"||usr.Race=="Vampire"||usr.Race=="Heran"||usr.Race=="Aetherian")
			usr.Grid("CreationAlien")
		else if(usr.Race=="Heran")
			usr.Grid("CreationAlien")
		else if(usr.Race=="Demon")
			usr.Grid("CreationDemon")
		else if(usr.Race=="Makyo")
			usr.Grid("CreationMakyo")
		else if(usr.Race=="Spirit Doll")
			usr.Grid("CreationSD")
		else if(usr.Race=="Kaio"||usr.Race=="Popo")
			usr.Grid("CreationKaio")
		else if(usr.Race=="Android")
			usr.Grid("CreationAndroid")
		else
			if(!usr.icon)
				usr.icon='Alien1.dmi'

/*	TriggerSkillLearn()
		set category="Other"
		set name="Trigger Skill Learn"
		if(usr.SaveDelay)
			usr<< "You can't use this again yet..."
			return
		usr.SaveDelay=1
		usr.LOLWUT()
		usr<< "Skill learn attempts triggered. If you don't learn anything, you don't have the requirements! You can try again in a minute."
		spawn(600)
			usr.SaveDelay=0*/

	CustomTurf()
		set category="Other"
		set name="Custom Turf"
		var/customselect=input("Choose a command.") in list("Cancel","Change Icon","Change Icon State","Change Roof Setting","Change Density","Change Opacity")
		switch(customselect)
			if("Cancel")
				return
			if("Change Icon")
				var/icon/_iconchoose=input(usr,"Choose an icon for your custom build object!","ChangeIcon")as icon
				var/icon/Z= new /icon(_iconchoose)
				if((length(Z) > 102400))
					usr <<"This file exceeds the limit of 100KB. It cannot be used."
					return
				if( Z.Width()!=32 || Z.Height()!=32 )
					usr<<"Custom turfs can only be 32x32."
					return
				usr.CustomTurfIcon=Z
				usr.CustomTurfState=input("Enter the icon's state name here.") as text
			if("Change Icon State")
				usr.CustomTurfState=input("Enter the icon's state name here.") as text
			if("Change Density")
				if(usr.CustomTurfDensity==1)
					usr.CustomTurfDensity=0
					usr<<"Custom Turf density disabled."
				else if(usr.CustomTurfDensity==0)
					usr.CustomTurfDensity=1
					usr<<"Custom Turf density enabled."
			if("Change Opacity")
				if(usr.CustomTurfOpacity==1)
					usr.CustomTurfOpacity=0
					usr<<"Custom turf opacity disabled."
				else if(usr.CustomTurfOpacity==0)
					usr.CustomTurfOpacity=1
					usr<<"Custom Turf opacity enabled."
			if("Change Roof Setting")
				if(usr.CustomTurfRoof==1)
					usr.CustomTurfRoof=0
					usr<<"Custom turf roof disabled."
				else if(usr.CustomTurfRoof==0)
					usr.CustomTurfRoof=1
					usr<<"Custom Turf roof enabled."

	CustomObject()
		set category="Other"
		set name="Custom Object"
		var/customselect=input("Choose a command.") in list("Cancel","Change Icon","Change Icon State","Change X Offset","Change Y Offset","Change Density","Change Opacity","Change Layer")
		switch(customselect)
			if("Cancel")
				return
			if("Change Icon")
				var/Z=input(usr,"Choose an icon for your custom build object!","ChangeIcon")as icon
				if((length(Z) > 102400))
					usr <<"This file exceeds the limit of 100KB. It cannot be used."
					return
				usr.CustomObj1Icon=Z
				usr.CustomObj1State=input("Enter the icon's state name here.") as text
			if("Change Icon State")
				usr.CustomObj1State=input("Enter the icon's state name here.") as text
			if("Change X Offset")
				usr.CustomObj1X=input("Enter the icon's Pixel X offset.") as num
			if("Change Y Offset")
				usr.CustomObj1Y=input("Enter the icon's Pixel Y offset.") as num
			if("Change Density")
				if(usr.CustomObj1Density==1)
					usr.CustomObj1Density=0
					usr<<"Custom object density disabled."
				else if(usr.CustomObj1Density==0)
					usr.CustomObj1Density=1
					usr<<"Custom object density enabled."
			if("Change Opacity")
				if(usr.CustomObj1Opacity==1)
					usr.CustomObj1Opacity=0
					usr<<"Custom object opacity disabled."
				else if(usr.CustomObj1Opacity==0)
					usr.CustomObj1Opacity=1
					usr<<"Custom object opacity enabled."
			if("Change Layer")
				usr.CustomObj1Layer=input("Enter the layer for the object. A higher number will be drawn 'above' objects of a lower layer. Most objects by default are 3. Minimum 2, Maximum 6.") as num
				if(usr.CustomObj1Layer<2)
					usr.CustomObj1Layer=2
				else if(usr.CustomObj1Layer>6)
					usr.CustomObj1Layer=6
	AFKToggle()
		set category="Other"
		set name="AFK Toggle"
		if(usr.AFKTimer>0)
			usr.AFKTimer=1
		else if(usr.AFKTimer==0)
			usr.AFKTimer=usr.AFKTimeLimit
			usr.overlays-=usr.AFKIcon
//			usr.GainLoop()
			spawn()src.callspawns()
	AFKIcon()
		set category="Other"
		set name="AFK Icon"
		if(usr.AFKIcon!='DefaultAFK.dmi')
			usr.AFKIcon='DefaultAFK.dmi'
			usr<<"AFK icon reverted to default."
		else if(usr.AFKIcon=='DefaultAFK.dmi')
			var/Z=input(usr,"Choose an icon for your AFK icon!","ChangeIcon")as icon|null
			if(Z==null)
				return
			if((length(Z) > 102400))
				usr <<"This file exceeds the limit of 100KB. It cannot be used."
				return
			usr.AFKIcon=Z
	AFKLimit()
		set category="Other"
		set name="AFK Time Limit"
		usr.AFKTimeLimit=input(usr,"Enter a time limit in seconds before you'll auto AFK. Minimum of 1000, maximum of 25000.","Timey wimey")as num
		if(usr.AFKTimeLimit<1000)
			usr.AFKTimeLimit=1000
		if(usr.AFKTimeLimit>25000)
			usr.AFKTimeLimit=25000
	ResetMultipliers()
		set category="Other"
		set name="Reset Multipliers"
		if(usr.ActiveBuffs>0)
			usr<<"You must disable -all- buffs before using this command."
			return
		if(src.Race=="Saiyan"&&src.Class=="Elite")
			usr << "You don't need buff slots to kick ass."
			return
		for(var/obj/Items/Enchantment/Rings/S in usr)
			if(S.suffix)
				usr<<"You must remove -all- rings before using this command."
				return
		if(usr.StanceActive==1)
			usr<<"You must turn off your stance before using this command."
			return
		if(usr.Endbroken==1 || usr.SpeedDown==1)
			usr<<"You're under the effects of a debuff! Wait a few seconds!"
			return
		if(usr.trans["active"]>0||usr.ssj["active"]>0)
			usr<<"You cannot do this while transed! Revert first!"
			return
		if(usr.Bojack)
			usr<<"You cannot do this while in Bojack Mode."
			return
		if(usr.Package["Vampire"]==1)
			usr<<"Something something Vampires and strength. No."
			return
		usr<<"Reseting stat and power multipliers."
		usr.Splits=new/list()
		if(usr.ActiveBuffs)
			for(var/obj/Skills/Buffs/Focus/x in usr)
				if(x.BuffUsing)
					usr.SkillX("Focus",x)
			for(var/obj/Skills/ManaInfusion/x in usr)
				if(x.BuffUsing)
					usr.SkillX("ManaInfusion",x)
			for(var/obj/Skills/Buffs/DivineBlessing/x in usr)
				if(x.BuffUsing)
					usr.SkillX("DivineBlessing",x)
			for(var/obj/Skills/Buffs/DemonicWill/x in usr)
				if(x.BuffUsing)
					usr.SkillX("DemonicWill",x)
			for(var/obj/Skills/Buffs/ThirdEye/x in usr)
				if(x.BuffUsing)
					usr.SkillX("ThirdEye",x)
			/*for(var/obj/Skills/Buffs/OlympianFury/x in usr)
				if(x.BuffUsing)
					usr.SkillX("OlympianFury",x)*/
			for(var/obj/Skills/Buffs/BoostingWinds/x in usr)
				if(x.BuffUsing)
					usr.SkillX("BoostingWinds",x)
			for(var/obj/Skills/Buffs/EarthenWall/x in usr)
				if(x.BuffUsing)
					usr.SkillX("EarthenWall",x)
			for(var/obj/Skills/Buffs/Expand/x in usr)
				if(x.BuffUsing)
					usr.SkillX("Expand",x)
			for(var/obj/Skills/Buffs/BlazingWrath/x in usr)
				if(x.BuffUsing)
					usr.SkillX("BlazingWrath",x)
			for(var/obj/Skills/Swords/Bladed_Flurry/x in usr)
				if(x.BuffUsing)
					usr.SkillX("BladedFlurry",x)
			/*for(var/obj/Skills/Swords/WeaponMaster/x in usr)
				if(x.BuffUsing)
					usr.SkillX("WeaponMaster",x)*/

			usr.ActiveBuffs=0
			usr.SpecialSlot=0
		usr.Power_Multiplier=1
		usr.StrengthMultiplier=1
		usr.EnduranceMultiplier=1
		usr.SpeedMultiplier=1
		usr.ForceMultiplier=1
		usr.ResistanceMultiplier=1
		usr.OffenseMultiplier=1
		usr.DefenseMultiplier=1
		usr.RegenerationMultiplier=1
		usr.RecoveryMultiplier=1
		sleep(20)
		usr<<"Stats and power successfully reset to normal."
/*	ListRaces()
		set category="Other"
		var/list/lolz=new
		for(var/mob/Players/Q in world)
			if(!(lolz.Find(Q.Race)))
				lolz.Add("[Q.Race]")
				lolz["[Q.Race]"]=1
			else
				lolz["[Q.Race]"]++
		if(lolz)
			for(var/x in lolz)
				usr<<"Lemming - [lolz[x]]"*/
	ToggleAutoLearn()
		set category="Other"
		set name="Toggle Auto Learn"
		if(usr.AutoChecks==1)
			usr.AutoChecks=0
			usr<<"Automatic learning of skills via energy requirements disabled."
		else if(usr.AutoChecks==0)
			usr.AutoChecks=1
			usr<<"Automatic learning of skills via energy requirements enabled."
	CustomChargeEffect()
		set category="Other"
		set name="Custom Charge Effect"
		var/Z=input(usr,"Choose an icon for your Charge effect, that shows when charging a beam or Charge skill. The icon must have a blank named icon state in the file.","ChangeIcon")as icon
		usr.ChargeIcon=Z
	TimestampToggle()
		set category="Other"
		if(src.Timestamp)
			src.Timestamp=0
			src<< "Timestamps disabled!"
			return
		if(!src.Timestamp)
			src.Timestamp=1
			src<< "Timestamps enabled!"
			return
	UseRewardPoints()
		set category="Other"
		set hidden = 1
		return
		//usr<<"Trainless means no using this verb anymore."
		//return
		if(src.UsingRPP)
			src << "No stackin' UseRewardPoints."
			return
		src.UsingRPP=1
		var/blah=input("How many points do you wish to invest in your BP? The ratio is 1 point per 0.000022 added to your BP multiplier.") as num
		blah=round(blah)
		if(blah>usr.RewardPoints)
			usr<<"You don't have that many RPP."
			src.UsingRPP=0
			return
		if(blah<1)
			usr<<"You need to put whole numbers in here."
			src.UsingRPP=0
			return
		usr<<"Do not log out until the points are finished being spent. It'll take 1 second for every 2 points."
		usr.RewardPoints-=blah
		var/quickmafs= blah * 0.000022
		usr.RPPower+=quickmafs
		if(blah==0)
			usr<<"All of your points have been successfully spent!"
			src.UsingRPP=0
	//	usr<<"[blah]*[PowerRankMult]"//debug msg

/*	UseRewardPoints()
		var/RecalcedStrength=usr.vars["StrengthMod"]/(1/usr.GetPowerRank(1))
		var/RecalcedEndurance=usr.vars["EnduranceMod"]/(1/usr.GetPowerRank(1))
//		var/RecalcedSpeed=usr.vars["SpeedMod"]/(1/usr.GetPowerRank(1))
		var/RecalcedForce=usr.vars["ForceMod"]/(1/usr.GetPowerRank(1))
		var/RecalcedResistance=usr.vars["ResistanceMod"]/(1/usr.GetPowerRank(1))
		var/RecalcedOffense=usr.vars["OffenseMod"]/(1/usr.GetPowerRank(1))
		var/RecalcedDefense=usr.vars["DefenseMod"]/(1/usr.GetPowerRank(1))
		//var/RecalcedEnergy=usr.vars["EnergyMod"]/2*10*EnergyGains*(PlayerEnergyGains)
		set category="Other"
		winshow(usr,"RewardStats",1)
		//if(RecalcedEnergy>5000)
		//	RecalcedEnergy=5000
		spawn()
			winset(usr,"RewardPoints","text=[RewardPoints]")
			winset(src,"LabelRewardStrength","text=[RecalcedStrength]")
			winset(src,"LabelRewardEnd","text=[RecalcedEndurance]")
//			winset(src,"LabelRewardSpeed","text=[RecalcedSpeed]")
			winset(src,"LabelRewardForce","text=[RecalcedForce]")
			winset(src,"LabelRewardResistance","text=[RecalcedResistance]")
			winset(src,"LabelRewardOffense","text=[RecalcedOffense]")
			winset(src,"LabelRewardDefense","text=[RecalcedDefense]")
			//winset(src,"LabelRewardEnergy","text=[RecalcedEnergy]")
			winset(src,"LabelRewardEnchant","text=[40/src.vars["Enchantment"]]")
			winset(src,"LabelRewardIntel","text=[40/src.vars["Intelligence"]]")*/

	SaveVerb()
		set hidden=1
		if(usr.Savable)
			if(!usr.SaveDelay)
				usr.SaveDelay=1
				usr<<"<b>Saving and backing up character...</b>"
				usr.client.SaveChar()
				usr.client.BackupSaveChar()
				usr<<"<b>Character saved! You can save again in 5 minutes!</b>"
				spawn(3000)usr.SaveDelay=null
/*	AdminHelp(var/txt as message)
		set category="Other"
		if(usr.AdminHelpMute)
			usr<<"Your ability to send admin helps has been suspended."
			return
		var/Admin_Help_Object/Ahelp = new()
		Ahelp.Character_Key = usr.key
		Ahelp.Character_Name = usr
		Ahelp.AdminHelp_UniqueID = "ID:[rand(0, 999999)]"
		usr<<"Message sent!"
		txt=html_encode(txt)
		txt=copytext(txt,1,1000)
		//Used for transfer through URL, normal txt is still output to screen
		var/txt2 = dd_replaceText(txt, " ", "_")
		Ahelp.AdminHelp_Message = dd_replaceText(txt2, "&#39;", "")
		AdminHelps.Add(Ahelp)
		for(var/mob/Players/M in world)
			if(M.Admin)
				M << "<font color=red>(ADMIN HELP)</font color> <a href=?src=\ref[usr];action=MasterControl;do=PM;;ShowWindow=False;ID=[Ahelp.AdminHelp_UniqueID];>[usr.key]</a href> : [txt]"

		Log("AdminPM","(Admin Help from [usr.key]): [txt]")
		usr<<"Your message:\n\n[txt]\n\nhas been sent to the admin!"
*/
/*	AdminHelp(var/txt as message)
		set category="Other"
		if(usr.AdminHelpMute)
			usr<<"Your ability to send admin helps has been suspended."
			return
		usr<<"Message sent!"
		txt=html_encode(txt)
		txt=copytext(txt,1,1000)
		for(var/mob/Players/M in world)
			if(M.Admin)
				M<<"<font color=red>(ADMIN HELP)</font color> <a href=?src=\ref[usr];action=MasterControl;do=PM>[usr.key]</a href> [M.Controlz(usr)]: [txt]"
		Log("AdminPM","(Admin Help from [usr.key]): [txt]")
		usr<<"Your message:\n\n[txt]\n\nhas been sent to the admin!"*/
	Examine(var/atom/A as mob|obj in view(usr))
		if(istype(A,/obj))
			if(A.desc)
				src<<A.desc
			if(istype(A,/obj/Items/Tech/SpaceTravel))
				for(var/obj/Items/Tech/SpaceTravelParts/Engines/B in A)
					src<<"There appears to be a [B] Engine installed."
				for(var/obj/Items/Tech/SpaceTravelParts/Misc/C in A)
					src<<"There appears to be a [C] installed."
			if(istype(A,/obj/Items/Tech/Scouter))
				for(var/obj/Items/Tech/ScouterUpgrades/D in A)
					src<<"There appears to be a [D] installed."
		else if(ismob(A))
			var/mob/M = A
			//usr << "This is: [M]"
			usr<<browse("<html><HEAD><META http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><title>\"[M]\"</title></HEAD> [M:playerdescription] </html>","window=CharacterDescription;display=1;size=1200x800;can_minimize=0;titlebar=1")
	LethalityToggle()
		set category= "Other"
		if(src.Lethal)
			src.Lethal=0
			src<< "Your attacks are no longer lethal."
			return
		if(!src.Lethal)
			src<< "Your attacks are now lethal."
			src.Lethal=1
			return
	RemoveRestrains()
		set category= "Other"
		if(!src.Cuffed)
			src<<"Nothing to break free from, goyim! You're a free nigga!"
			return
		if(src.Handcuffed==1)
			src<<"You can't really break those cuffs, man."
			if(src.Class=="Mastermind"||src.Class=="Revolutionary"||src.Race=="Anti-Spiral"||src.Class=="Boss"||src.Stance=="CQC"||src.IgnoreHandcuffs)
				src<<"--But there's nothing against <i>slipping out</i> of them! You remember you can easily remove the restrains as if they never existed!"
				src.Cuffed=0
				src.Handcuffed=0
				src.Cablecuffed=0
				return
			return
		if(src.Cablecuffed==1)
			if(src.Class=="Mastermind"||src.Class=="Revolutionary"||src.Race=="Anti-Spiral"||src.Class=="Boss"||src.Stance=="CQC"||src.IgnoreHandcuffs)
				src<<"Did they really think mere cables would keep you down?"
				sleep(6)
				src<<" PFFH. <b>Denied.</b> You stealthly remove those and pocket them for later use. Don't forget to use 'walk mode' to trick them into believing you're still cuffed."
				src.Cuffed=0
				src.Handcuffed=0
				src.Cablecuffed=0
				src.contents+=new/obj/Items/Cablecuffs
				return
			src<<"You struggle to break the cablecuffs..."
			view(src)<<"[src] struggles on their restrains..."
			src.Frozen=1
			sleep(30)
			if(prob(30))
				src<<"And... voil�, you're free!"
				view(src)<<"[src] breaks free from their restrains!"
				src.Cuffed=0
				src.Cablecuffed=0
				src.Frozen=0
			else
				src<<"You failed... but keep trying!"
				return
	ToggleWalk()
		set category= "Other"
		if(src.Cuffed)return
		if(src.Sneaking)
			src<<"What are you, Solid Snake? No walking and sneaking for you, Big Boss."
			return
		if(src.Walking)
			src.Walking=0
			src<< "You're running."
			return
		if(!src.Walking)
			src<< "You're walking."
			src.Walking=1
			return
/*	ToggleSneak()
		set category= "Other"
		if(src.Cuffed)return
		if(src.Walking)
			src<<"What are you, Solid Snake? No sneaking and walking for you, Big Boss."
			return
		if(src.Sneaking)
			animate(usr,alpha=alpha*2,time=8)
			src.Sneaking=0
			if(src.CQCUnlocked)
				src.overlays-=image('KunaiMod/Icons/cardboardbox.dmi')
			src<< "You're running."
			return
		if(!src.Sneaking)
			animate(usr,alpha=alpha/2,time=8)
			src<< "You're sneaking."
			if(src.CQCUnlocked)
				src.overlays+=image('KunaiMod/Icons/cardboardbox.dmi')
			src.Sneaking=1
			return*/
	ToggleRPMode()
		set category= "Other"
		if(src.TimeFrozen)
			src<<"What did I say about not being a goon? This counts as being a goon! Also, you're probably on RP mode during The World or any time-stopping skills, so chillax."
			return
		if(src.PureRPMode)
			if(src.WoNing)
				for(var/obj/WorldOfNothingness/won in world)
					if(src==won.Owner)
						won.RPModed=0
			src.PureRPMode=0
			RPMode(src,"Off")
			src<< "You have toggled RP mode off. Regeneration and Recovery enabled."
			src.OMessage(10,"[src] has disabled Pure RP Mode! Regen/Recovery reenabled!")
/*			if(src.BerserkerInsanity&&src.Stance=="DrunkenFist")
				spawn(1) src.Pippin()
			else if(src.BerserkerInsanity&&src.BerserkerMod)
				spawn(1) src.Pippin()
			else if(src.BerserkerInsanity&&src.VisoredStage)
				spawn(1) src.Pippin()*/
			if(src.BerserkerInsanity&&src.EarthAndHeaven)
				spawn(1) src.BlackOriginMode()
	/*		if(src.InUBW)
				if(locate(/obj/Skills/Buffs/GatesOfBabylon,src.Target))
					spawn(1) src.UnlimitedBladeWorks(Z,Target)
				else
					spawn(1) src.TrueUBW(Z)*/
			return
		if(!src.PureRPMode)
			if(src.WoNing)
				for(var/obj/WorldOfNothingness/won in world)
					if(src==won.Owner)
						won.RPModed=1
			RPMode(src,"On")
			src<< "You have toggled RP mode on. Regeneration and Recovery disabled."
			src.PureRPMode=1
			src.Attacking=0
			src.OMessage(10,"[src] has enabled Pure RP Mode! Regen/Recovery disabled!")
			return

	CharacterDescription()
		set category="Other"
		var/temp = input("Please input a description for your character.",, usr.playerdescription ) as null|message
		if( temp == null ) return
		usr.playerdescription = temp

	ScreenSize()
		set category="Other"
		var/screenx=input("Enter the width of the screen, max is 31.") as num
		screenx=min(max(1,screenx),31)
		var/screeny=input("Enter the height of the screen, max is 31.") as num
		screeny=min(max(1,screeny),31)
		client.view="[screenx]x[screeny]"
	/*Warp()
		set category="Other"
		src.Warp=!src.Warp
		if(src.Warp) usr<<"You turn your Warp <font color=green>on</font color>."
		else usr<<"You turn your Warp <font color=red>off</font color>."*/
	SetAttackStrength()
		set category="Other"
		if(src.AttackHardness==2)
			if(src.SpiritOfWar)
				usr<<"You cannot hold back your strength right now..."
				return
			else
				usr<<"You turn your Light attack <font color=green>on</font color>."
				src.AttackHardness=1
		else if(src.AttackHardness==1)
			usr<<"You turn your Medium attack <font color=green>on</font color>."
			src.AttackHardness=2
	/*	else if(src.AttackHardness==2)
			usr<<"You turn your Heavy attack <font color=green>on</font color>."
			src.AttackHardness=3*/

	Countdown()
		set category="Other"
		var/time=30*10
		src.OMessage(30,"[src] is counting down! ([time/10] seconds)","<font color=silver>[src]([src.key]) used countdown.")
		spawn(time)	src.OMessage(30,"[src] ended counting down! (0 seconds)","<font color=silver>[src]([src.key]) ended using countdown.")
		spawn(time/2)	src.OMessage(30,"[src] counting down! ([time/2/10] seconds)")

		for(var/obj/Items/Tech/SpaceTravel/Ship/A in view(30,src)) //This for loop detects ships around those that use the say verb.
			for(var/obj/ShipConsole/B in world)
				if(A.Password==B.Password)
					for(var/mob/C in hearers(6,B))
						src.OMessage(30,"[src] is counting down! ([time/10] seconds)","<font color=silver>[src]([src.key]) used countdown.")
						spawn(time)	src.OMessage(30,"[src] ended counting down! (0 seconds)","<font color=silver>[src]([src.key]) ended using countdown.")
						spawn(time/2)	src.OMessage(30,"[src] counting down! ([time/2/10] seconds)")

		for(var/obj/ShipConsole/AA in view(5,src))
			for(var/obj/Items/Tech/SpaceTravel/Ship/BB in world)
				if(AA.Password==BB.Password&&AA.SpeakerToggle==1)
					for(var/mob/C in hearers(12,BB))
						src.OMessage(30,"[src] is counting down! ([time/10] seconds)","<font color=silver>[src]([src.key]) used countdown.")
						spawn(time)	src.OMessage(30,"[src] ended counting down! (0 seconds)","<font color=silver>[src]([src.key]) ended using countdown.")
						spawn(time/2)	src.OMessage(30,"[src] counting down! ([time/2/10] seconds)")

		for(var/obj/Items/Tech/SpaceTravel/SpacePod/A in view(30,src)) //This for loop detects ships around those that use the say verb.
			for(var/obj/PodConsole/B in world)
				if(A.PodID==B.PodID)
					for(var/mob/C in hearers(6,B))
						src.OMessage(30,"[src] is counting down! ([time/10] seconds)","<font color=silver>[src]([src.key]) used countdown.")
						spawn(time)	src.OMessage(30,"[src] ended counting down! (0 seconds)","<font color=silver>[src]([src.key]) ended using countdown.")
						spawn(time/2)	src.OMessage(30,"[src] counting down! ([time/2/10] seconds)")

		for(var/obj/PodConsole/AA in view(5,src))
			for(var/obj/Items/Tech/SpaceTravel/SpacePod/BB in world)
				if(AA.PodID==BB.PodID&&AA.SpeakerToggle==1)
					for(var/mob/C in hearers(12,BB))
						src.OMessage(30,"[src] is counting down! ([time/10] seconds)","<font color=silver>[src]([src.key]) used countdown.")
						spawn(time)	src.OMessage(30,"[src] ended counting down! (0 seconds)","<font color=silver>[src]([src.key]) ended using countdown.")
						spawn(time/2)	src.OMessage(30,"[src] counting down! ([time/2/10] seconds)")

/*	SkillSheet()
		set name="Skill Sheet"
		set category="Other"
		usr.Grid("SkillSheet")*/



	TextColor()
		set category="Other"
		if(locate(/obj/Communication) in usr)
			for(var/obj/Communication/C in usr)
				C.Text_Color=input(usr,"Choose a color for OOC and Say.") as color
/*	VotingControl()
		set category="Other"
		var/blah=input("Choose an option.","Control Panel") in list("Vote Mute","Vote Boot","Cancel")
		switch(blah)
			if("Vote Mute")
				usr.VoteMute()
			if("Vote Boot")
				usr.VoteBoot()*/
	Admins()
		set category="Other"
		var/list/admins=new
		admins.Add(Admins,CodedAdmins)
		for(var/x in admins)
			for(var/mob/M in world)
				if(M.client)
					if(M.key==x)
						usr<<"[x] | [admins[x]]<font color=green> (Online)"
						admins.Remove(x)
		admins.Remove(CodedAdmins)
		for(var/y in admins)
			usr<<"[y] | [admins[y]]"

	CheckOwnLogs()
		set category="Other"
		var/logtype=input("Select log type to read.") in list("Temp/Own Emote","Temp Archive", "Clear Archive", "Cancel")
		switch(logtype)
			if("Temp/Own Emote")
				usr.SegmentTempLogs("Saves/PlayerLogs/[usr.key]/Log")
			if("Temp Archive")
				usr.SegmentArchiveLogs("Saves/PlayerLogs/[usr.key]/Log")
			if("Clear Archive")
				var/confirmation=input("Are you sure you want to clear your Temp Archive? This cannot be undone!") in list("Yes","No")
				if(confirmation=="Yes")
					var/counter=0
					gotohere
					counter++
					var/logfinder=file("Saves/PlayerLogs/[usr.key]/LogArchive[counter]")
					if(fexists(logfinder))
						fdel(logfinder)
						goto gotohere
					else
						return
	Who()
		set category="Other"
		var/View={"<html><head><title>Who</title><body>
<font size=3><font color=red>Player Panel:<hr><font size=2><font color=black>"}
		var/list/people=new
		for(var/mob/M in world)
			if(M.client)
				people.Add(M.key)
		var/list/sortedpeople=dd_sortedTextList(people,0)
		var/online=0
		if(usr.Admin)
			View+={"
					<table border=1 cellspacing=6>
					<tr>
					<th><font size=2>Key(IC Name)/Panel</th>
					<th><font size=2>IP Address(Computer ID)</th>
					<th><font size=2>Race(Class/Size)</th>
					<th><font size=2>Location</th>
					<th><font size=2>Base(BaseMod)/icon_state</th>
					<th><font size=2>Last Rewarded:</th>
					<th><font size=2>Reward Tier:</th>
					<th><font size=2>Reward Points:(Spent, Has, Total, Trained)</th>
					</tr>"}
			for(var/x in sortedpeople)
				for(var/mob/M in world)
					if(M.key==x)
						online++
						View+={"<tr>
							<td><font size=2>[M.key] ([M.name])/(<a href=?src=\ref[M];action=MasterControl>x</a href>)</td>
							<td><font size=2>[M.client.address] ([M.client.computer_id])</td>
							<td><font size=2>[M.Race] ([M.Class]/[M.BodyType])</td>
							<td><font size=2>[M.loc] ([M.x],[M.y],[M.z])</td>
							<td><font size=2>[M.Base]([M.BaseMod])/ [M.icon_state]</td>
							<td><font size=2>[M.Rewarded]</td>
							<td><font size=2>[M.AutoReward["RoleplaySkill"]]</td>
							<td><font size=2>([M.spentrp], [M.RewardPoints], [M.spentrp+M.RewardPoints],[M.TrainedRPP])</td>
							</tr>"}
						break
			View+={"</table"><br>"}
		else

			for(var/x in sortedpeople)
				online++
				View+="[x]<br>"
		View+="<font color=green><b>Online:</b> [online]"
		if(usr.Admin)
			usr<<browse("[View]","window=Logzk;size=900x450")
		else
			usr<<browse("[View]","window=Logzk;size=150x400")

	Overlays()
		set category="Other"
		usr.overlays-=usr.overlays
		usr.underlays-=usr.underlays
		if(usr.Dead)
			if(src.NecroRisen!=1)
				src.overlays+='Halo.dmi'

mob/proc/Controlz(var/mob/M)
	if(src.Admin)
		return "(<a href=?src=\ref[M];action=MasterControl>x</a href>)"

/*mob/proc/Say_Spark()
	var/image/A=image(icon='Say Spark.dmi',pixel_y=6)
	overlays+=A
	spawn(15)
		if(src)
			overlays-=A*/



var/Allow_OOC=1

var/list/V = list(\
"Hm.",
"Hm.",
"Hm.",
"Hm.",
"...",
"...",
"...",
"...",
"...",
"...",
"...",
"...",
"...",
"...",
"...",
"...",
"... Hm.",
"Hmmmm.",
"Hm, hm, hmmm.",
"Hm!",
)

var/list/BR = list(\
"gotta go fast",
"lightning mcqueen: defender of justice",
"big bluuuuuue",
"did we wipe yet",
"hey darwin",
"hey leeroy",
"hey jared",
"hey bobby",
"i'm on 4chan boys",
"that's some bullshit",
"leeroy, give me some roblox",
"you're a cocky bastard",
"i've been on all wipe boys you just haven't seen me",
"i want to order a pizza but i can't let my parents find out...",
"kaioken. TIMES. A THOUSAAAAAAND",
"kaioken times a million!!!",
"this isn't even my final form, boys",
"how many roblox do you got leeroy",
"fisherman boys",
"i'll buy you the game if you type my stand rp leeroy",
"help my parents are mad at me because they found the pizza box",
"are you gay haha",
"can you give me rp points darwin",
"stop yelling at me",
)

var/list/SCREAM = list(\
"AAAAAAAAAAAAAAAAAH!",
"HAHAHAHAHAH!",
"DIE... DIE... DIE!",
"RAAAAAAAAAAAAAAAAH!",
"Gck...",
"AAHAAAAAAAAAAAAA",
"CH... FAAAAAAAAAAAAAAAAAAAAAH!",
"NONONONONONONO!",
"REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE!",
"FAH.... FAAAAAAAAAAAAAAAAAH!",
"BLEED HARDER!",
"DON'T FIGHT BACK!",
"... be... still...",
)

var/list/crazyy=list(\
"YOU FUCKING NOOBS I'LL FUCKING KILL YOU ALL",
"FUCKING RIGHT, DAMN RIGHT, ALL RIGHT!",
"IF YOU DONT MOVE YOUR FUCKING ASS, I WILL FUCKING KILL YOU",
"DAT DRAG0N NUB CANT CODE FOR SHIT",
"WANNA HEAR A JOKE?!!? Archonex.",
"Oh yahhhhhhhhh!",
"Oh baby..that feels so good.....WTF? WHEN DID YOU GET HEERE?",
"AHH FUCKK IM CUMMINNNN",
"CA-CAN I RIDEEE YOUUU?",
"MY BOOBS ARE BOUNCY!",
"DONT FUCK WITH THE FUCKING COCKKK!",
"LEWISSS IS GAAYYYY",
"BEAMED IS A HOMOOOO",
"You coon skinned rainbow .",
"IM NOT WORTHYYYY!",
"Im so depressed guys...get me a razor.",
"WHY WONT YOU LOVE ME?",
"I spread peanutbutter all overmyself this one time...",
"Amelieeee is oohhhh so sexxxi (:",
"CH-CH-CHERRY TIME?!",
"BECAUSE YOU TOUCH YOURSELF",
"Lets fall in loveee~ first one to fall, loses.....",
"GAME OVER!",
"Lilybooooo~",
"Kyle is gay and likes it up the butt.",
"THAT COLD REAPER MOTHER FUCKER CAN SUCK MY FUCKIN LEFT NUT!",
"HELL YEAH HELL YEAH HELL YEAH!",
"i'd lick jumpy's eyelids off",
"That nigga looked me dead in the eyes and said, \"Yes I can romantically rape someone.\"",
"WHO THE FUCK GIJI'D ME",
"THE STAR MADE ME DO IT",
"THAT'S A STUPID FUCKING IDEA YOU STUPID FUCKING CUNT",
"The north sends their regards. And their cocks.",
"I HAVE NO REGRETS. THIS IS THE ONLY PATH: UNLIMITED BONES WORKS",
"FRIEEEEEEEEEEZAAAAAAAAAAAAAAAAAAAA",
"KEEEEEEEEEEEEEEEEELVIIIIIIIIIIIIIIIIN",
"DAAAAAAAARWIIIIIIIIIIIIIIIN",
"Eat dogshit you cumlicker",
"I'd bang it.",
"What's wrong with futa dick?",
"This dick is just getting started baby.",
"Pussies are for pussies. Powergame harder scrub.",
"MY DRILL IS THE DRILL THAT PIERCES HER HEAVENS",
"KING... KITTAN... GIGA... DUUUURIIIIIILL... BREAAAAAAAAAAAKAAAAAAAAAAAAAAAAAAAAAAAAAAA",
"JAJAJAJAJAJAJAJAJAJAJAJAJAJAJA",
"ORAORAORAORAORAORAORAORAORAORAORAORAORA",
"POONTAH! POONTAH! POONTAH!",
"If I ever see your goddamn face again, I'm going to force you into bondage.",
"Show me your dick, gurl.",
"It's all ogre now.",
"AAAAAAAAAAAAAH ITS NENSHOU! CAN I HAVE YOUR AUTOGRAPH?",
"Blue once bent over for me. Let's just say it was a fun six hours.",
"THE FUCK IS THIS CUM ON MY TOAST, DAVE",
"If I had a dime for every time I heard that, I'd be as rich as my nigga hiazi",
"MUST THE KING STAND ALONE!?",
"How many dicks must I suck to become a Captain, senpai?",
"AAAAAAAH HE JUST SAID \"I'M A BITCH AND I KNOW IT\", I CAN'T TAKE IT!",
"Kamui are for skinny bitches like Hellz.",
"NIGGERU O JUTSU: ZA ARUDO PLUS CHECKMATE-O! HIY!",
"How much did I pay you to snort gasoline again?",
"Space Weed. Yeah.",
"UUUUUUUURGH JUST GIVE IT TO ME. FUCK."
)

obj/Communication
	var/Text_Color="green"
	var/ShowOOC=1
	var/LOOCinIC=0
	var/AllTabOOC=1
	var/LOOCinAll=1
	var/AdminAlerts=1
	var/RewardAlerts=1
	var/Telepathy_Enabled=1

/*	verb/SkillEmote()
		set category = "Other"
		set src=usr.contents
		usr.overlays+='Emoting.dmi'
		var/SkillNamer=input("Input a skill name. If this is a additional emote for learning a skill, use the same name as last time.")as text|null
		if(SkillNamer==null)
			usr.overlays-='Emoting.dmi'
			return
		var/T=input("Do the emote for working on learning a skill here.")as message|null
		if(T==null)
			usr.overlays-='Emoting.dmi'
			return
		usr.AutoReward["RPFreq"]++
		usr.AutoReward["RPChara"]+=length(T)
		if(usr.AutoReward["RPFreq"]==100)
			Log("Admin","[usr] has made a hundred emotes holy shit when are rewards happening!?")
		for(var/mob/Players/E in hearers(15,usr))
			if(E.Timestamp)
				E<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>*[usr.name]<font color=[DEFAULTCOLOR]>[E.Controlz(usr)] [html_encode(T)]*"
			else
				E<<"<font color=[Text_Color]>*[usr.name]<font color=[DEFAULTCOLOR]>[E.Controlz(usr)] [html_encode(T)]*"
			if(E==usr)
				spawn()Log(E.ChatLog(),"<font color=#D0BF61>~~Skill Emote:[SkillNamer]~~*[usr]([usr.key]) [html_encode(T)]*")
				spawn()TempLog(E.ChatLog(),"<font color=#D0BF61>~~Skill Emote:[SkillNamer]~~*[usr]([usr.key]) [html_encode(T)]*")
				spawn()SkillLog(E.ChatLog(),"<font color=#D0BF61>~~Skill Emote:[SkillNamer]~~*[usr]([usr.key]) [html_encode(T)]*")
			else
				Log(E.ChatLog(),"<font color=red>*[usr]([usr.key]) [html_encode(T)]*")
			for(var/obj/Items/Enchantment/ArcanicEye/EyeCheck in E) //Checks if anyone within 15 tiles of a emote user has a Arcanic Eye(s).
				if(EyeCheck.suffix) //Checks if equipped. suffix can only be Equipped in this case, so no need to be specific.
					for(var/mob/Players/OrbCheck in world) //Searches the world for players...
						for(var/obj/Items/Enchantment/ArcanicOrb/FinalCheck in OrbCheck) //Checks for Arcanic Orbs.
							if(OrbCheck.client!=null)
								if(OrbCheck.client.eye==E&&FinalCheck.Password==EyeCheck.Password&&FinalCheck.Active) //...Then tries to see if their camera is different then default. but this throws a cannot read null.eye runtime error.
									OrbCheck<<"[FinalCheck](viewing [E]):<font color=[Text_Color]>*[usr.name]<font color=[DEFAULTCOLOR]> [html_encode(T)]*" //Outputs to the Orb owner the emote.
		for(var/obj/Items/Tech/SecurityCamera/F in view(15,usr))
			if(F.Active==1)
				for(var/mob/CC in world)
					for(var/obj/Items/Tech/Scouter/CCS in CC)
						if(F.Points==CCS.Frequency)
							if(CC.Timestamp)
								CC<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits:<font color=[Text_Color]>*[usr.name]<font color=[DEFAULTCOLOR]>[CC.Controlz(usr)] [html_encode(T)]*"
							else
								CC<<"<font color=green>[F.name] transmits:<font color=[Text_Color]>*[usr.name]<font color=[DEFAULTCOLOR]>[CC.Controlz(usr)] [html_encode(T)]*"
				for(var/obj/Items/Tech/SecurityDisplay/G in world)
					if(G.Password==F.Password)
						if(G.Active==1)
							for(var/mob/H in hearers(G.AudioRange,G))
								H<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits:*[usr.name]<font color=[DEFAULTCOLOR]> [html_encode(T)]*"
								Log(H.ChatLog(),"<font color=red>[F.name] transmits:*[usr]([usr.key]) [html_encode(T)]*")
		for(var/obj/Items/Tech/CameraProbe/FF in view(15,usr))
			if(FF.Active==1)
				for(var/obj/Items/Tech/SecurityDisplay/G in world)
					if(G.Password==FF.Password)
						if(G.Active==1)
							for(var/mob/H in hearers(G.AudioRange,G))
								H<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[FF.name] transmits:*[usr.name]<font color=[DEFAULTCOLOR]> [html_encode(T)]*"
								Log(H.ChatLog(),"<font color=red>[FF.name] transmits:*[usr]([usr.key]) [html_encode(T)]*")
		for(var/obj/Items/Tech/SpaceTravel/Ship/A in view(12,usr)) //This for loop detects ships around those that use the say verb.
			for(var/obj/ShipConsole/B in world)
				if(A.Password==B.Password)
					for(var/mob/C in hearers(6,B))
						C<<"<font color=green>([A.name]'s External Camera) *[usr.name]<font color=[DEFAULTCOLOR]> [html_encode(T)]*"
		usr.Say_Spark()
		if(usr.AFKTimer==0)
			usr.overlays-=usr.AFKIcon
			spawn()usr.callspawns()
		usr.AFKTimer=usr.AFKTimeLimit
		usr.overlays-='Emoting.dmi'*/


	verb/OOC(T as text)
		set category = "Other"
		set src=usr.contents
		if(OOC_Check(T))
			if(!usr.Admin) T=copytext(T,1,700)
			if(SpamCheck(usr,T))return
			if(Crazy)T=pick(crazyy)
			if(Cray)T=Cray
			if(usr.Kowala)T=pick(BR)
			var/keyjack=usr.key
			if(usr.DisplayKey)
				keyjack=usr.DisplayKey
			for(var/mob/Players/P)
				for(var/obj/Communication/C in P)
					if(C.ShowOOC)
						if(P.Timestamp)
							if(C.AllTabOOC)
								P << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=lime><b>OOC:</b><font color=[Text_Color]> <b>[keyjack]</b>[P.Controlz(usr)]: <font color=white>[html_encode(T)]", "output")
							P << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=lime><b>OOC:</b><font color=[Text_Color]> <b>[keyjack]</b>[P.Controlz(usr)]: <font color=white>[html_encode(T)]", "oocchat")
						else
//							var/OOCColorStorageVar="<font color=lime>"
//							P << output("<font color=lime><b>OOC:</b><font color=[Text_Color]> <b>[keyjack]</b>:[T]","output")
//							P << output("[T]","oocchat")
							if(C.AllTabOOC)
								P << output("<font color=lime><b>OOC:</b><font color=[Text_Color]> <b>[keyjack]</b>[P.Controlz(usr)]: <font color=white>[html_encode(T)]", "output")
							P << output("<font color=lime><b>OOC:</b><font color=[Text_Color]> <b>[keyjack]</b>[P.Controlz(usr)]: <font color=white>[html_encode(T)]", "oocchat")



/*						if(P.Timestamp)
							P<<({"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=lime><b>OOC:</b><font color="[Text_Color]"> <b>[keyjack]</b>[P.Controlz(usr)]: <font color=white>[html_encode(T)]"})
						else
							P<<({"<font color=lime><b>OOC:</b><font color="[Text_Color]"> <b>[keyjack]</b>[P.Controlz(usr)]: <font color=white>[html_encode(T)]"})
*/
			Cray=null
	verb/TojiTest()
		if(!usr.Toji)
			usr.Toji=1
			usr.overlays+=image('AurasBig.dmi',"Toji",pixel_x=-32)
		else
			usr.Toji=0
			usr.overlays-=image('AurasBig.dmi',"Toji",pixel_x=-32)
	verb/Say(T as text)
		set category="Other"
		set src=usr.contents
		var/LOOCSay=findtext(T,")")
		var/LOOCSay2=findtext(T,"(")
		var/LOOCSay3=findtext(T,"]")
		var/LOOCSay4=findtext(T,"{")
		var/LOOCSay5=findtext(T,"}")
		if(usr.CursedBeta=="Mute")T=pick(V)
		if(usr.BerserkerInsanity&&!usr.PureRPMode)T=pick(SCREAM)
		if(usr.TimeFrozen)
			usr<<"...?!"
			return
		for(var/mob/E in hearers(12,usr))
			if(E.Timestamp)
				if(LOOCSay||LOOCSay2||LOOCSay3||LOOCSay4||LOOCSay5)
					for(var/obj/Communication/C in E)
						E << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "loocchat")
						E << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "oocchat")
						E << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "output")
				else
					E << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "icchat")
					E << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "output")
				Log(E.ChatLog(),"<font color=green>[usr]([usr.key]) says: [html_encode(T)]")
			else
				if(LOOCSay||LOOCSay2||LOOCSay3||LOOCSay4||LOOCSay5)
					for(var/obj/Communication/C in E)
						E << output("<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "loocchat")
						E << output("<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "oocchat")
						E << output("<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "output")
				else
					E << output("<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "icchat")
					E << output("<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]", "output")
				Log(E.ChatLog(),"<font color=green>[usr]([usr.key]) says: [html_encode(T)]")
/*				E<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]"
				Log(E.ChatLog(),"<font color=green>[usr]([usr.key]) says: [html_encode(T)]")
			else
				E<<"<font color=[Text_Color]>[usr][E.Controlz(usr)] says: [html_encode(T)]"
				Log(E.ChatLog(),"<font color=green>[usr]([usr.key]) says: [html_encode(T)]")*/

			for(var/obj/Items/Enchantment/ArcanicEar/EarCheck in E)
				if(EarCheck.suffix) //Checks to make sure the ear(s) are equipped.
					for(var/mob/Players/OrbCheck in world) //Searches the world for players...
						for(var/obj/Items/Enchantment/ArcanicOrb/FinalCheck in OrbCheck) //Checks for Arcanic Orbs.
							if(FinalCheck.Password==EarCheck.Password&&FinalCheck.Active) //Checks if the password on the orb matches the password of the ear(s).
								OrbCheck << output("[FinalCheck](hearing [E]):<font color=[Text_Color]>[usr] says: [html_encode(T)]", "output")
								OrbCheck << output("[FinalCheck](hearing [E]):<font color=[Text_Color]>[usr] says: [html_encode(T)]", "icchat")


//								OrbCheck<<"[FinalCheck](hearing [E]):<font color=[Text_Color]>[usr] says: [html_encode(T)]"
		for(var/obj/Items/Tech/SecurityCamera/F in view(12,usr)) //This for loop detects Security Cameras around those that use the say verb.
			if(F.Active==1)
				for(var/mob/CC in world)
					for(var/obj/Items/Tech/Scouter/CCS in CC)
						if(F.Points==CCS.Frequency)
							if(CC.Timestamp)
								CC << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[F.name] transmits: [usr.name] says: [html_encode(T)]", "output")
								CC << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[F.name] transmits: [usr.name] says: [html_encode(T)]", "icchat")
							else
								CC << output("<font color=[Text_Color]>[F.name] transmits: [usr.name] says: [html_encode(T)]", "output")
								CC << output("<font color=[Text_Color]>[F.name] transmits: [usr.name] says: [html_encode(T)]", "icchat")


/*								CC<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[F.name] transmits: [usr.name] says: [html_encode(T)]"
							else
								CC<<"<font color=[Text_Color]>[F.name] transmits: [usr.name] says: [html_encode(T)]"
*/
				for(var/obj/Items/Tech/Speaker/S in world)
					if(F.Points==S.Frequency)
						if(F.Active==1)
							for(var/mob/H in hearers(F.AudioRange,F))
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits:*[usr.name]<font color=[DEFAULTCOLOR]> [html_encode(T)]*", "output")
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits:*[usr.name]<font color=[DEFAULTCOLOR]> [html_encode(T)]*", "icchat")
//								H<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits:*[usr.name]<font color=[DEFAULTCOLOR]> [html_encode(T)]*"
								Log(H.ChatLog(),"<font color=red>[F.name] transmits:*[usr]([usr.key]) [html_encode(T)]*")

				for(var/obj/Items/Tech/SecurityDisplay/G in world)
					if(G.Password==F.Password)
						if(G.Active==1)
							for(var/mob/H in hearers(G.AudioRange,G))
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits: [usr] says: [html_encode(T)]", "output")
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits: [usr] says: [html_encode(T)]", "icchat")
//								H<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits: [usr] says: [html_encode(T)]"
								Log(H.ChatLog(),"<font color=green>[F.name](Made by [F.CreatorKey]) transmits: [usr] says: [html_encode(T)]")
		for(var/obj/Items/Tech/CameraProbe/FF in view(12,usr))
			if(FF.Active==1)
				for(var/obj/Items/Tech/SecurityDisplay/G in world)
					if(G.Password==FF.Password)
						if(G.Active==1)
							for(var/mob/H in hearers(G.AudioRange,G))
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[FF.name] transmits: [usr] says: [html_encode(T)]", "output")
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[FF.name] transmits: [usr] says: [html_encode(T)]", "icchat")
//								H<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[FF.name] transmits: [usr] says: [html_encode(T)]"
								Log(H.ChatLog(),"<font color=green>[FF.name](Made by [FF.CreatorKey]) transmits: [usr] says: [html_encode(T)]")
		for(var/obj/Items/Tech/Speaker/X in view(6,usr)) //This for loop detects Speakers, then determines if they have the Intercom upgrade.
			for(var/obj/Items/Tech/Speaker/Y in world)
				if(X.Frequency==Y.Frequency&&X.Intercom==1&&Y!=X&&X.Active==1&&Y.Active==1)
					for(var/mob/Z in hearers(Y.AudioRange,Y))
						Z << output("<font color=green><b>([Y.name])</b> [usr.name]: [html_encode(T)]", "output")
						Z << output("<font color=green><b>([Y.name])</b> [usr.name]: [html_encode(T)]", "icchat")
//						Z<<"<font color=green><b>([Y.name])</b> [usr.name]: [html_encode(T)]"
			if(X.Intercom==1)
				for(var/mob/Players/M in world)
					for(var/obj/Items/Tech/Scouter/Q in M)
						if(X.Frequency==Q.Frequency)
							M << output("<font color=green><b>([X.name])</b> [usr.name]: [html_encode(T)]", "output")
							M << output("<font color=green><b>([X.name])</b> [usr.name]: [html_encode(T)]", "icchat")
//							M<<"<font color=green><b>([X.name])</b> [usr.name]: [html_encode(T)]"
							Log(M.ChatLog(),"<font color=green>([X.name])[usr]([usr.key]) says: [html_encode(T)]")
		for(var/obj/Items/Tech/SecurityDisplay/SD in view(6,usr))
			if(SD.Microphone==1)
				for(var/obj/Items/Tech/CameraProbe/CP in world)
					if(CP.Password==SD.Password)
						for(var/mob/PC in hearers(12,CP))
							PC << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[CP.name] transmits: [usr] says: [html_encode(T)]", "output")
							PC << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[CP.name] transmits: [usr] says: [html_encode(T)]", "icchat")
//							PC<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[CP.name] transmits: [usr] says: [html_encode(T)]"
							Log(PC.ChatLog(),"<font color=green>[CP.name](Made by [CP.CreatorKey]) transmits: [usr] says: [html_encode(T)]")

		for(var/obj/Items/Tech/SpaceTravel/Ship/A in view(12,usr)) //This for loop detects ships around those that use the say verb.
			for(var/obj/ShipConsole/B in world)
				if(A.Password==B.Password)
					for(var/mob/C in hearers(6,B))
						C << output("<font color=green><b>([A.name] External Camera)</b> [usr.name]: [html_encode(T)]", "output")
						C << output("<font color=green><b>([A.name] External Camera)</b> [usr.name]: [html_encode(T)]", "icchat")
//						C<<"<font color=green><b>([A.name] External Camera)</b> [usr.name]: [html_encode(T)]"

		for(var/obj/ShipConsole/AA in view(12,usr))
			for(var/obj/Items/Tech/SpaceTravel/Ship/BB in world)
				if(AA.Password==BB.Password&&AA.SpeakerToggle==1)
					for(var/mob/C in hearers(12,BB))
						C << output("<font color=green><b>([BB.name] External Speaker)</b> [usr.name]: [html_encode(T)]", "output")
						C << output("<font color=green><b>([BB.name] External Speaker)</b> [usr.name]: [html_encode(T)]", "icchat")
//						C<<"<font color=green><b>([BB.name] External Speaker)</b> [usr.name]: [html_encode(T)]"

		for(var/obj/Items/Tech/SpaceTravel/SpacePod/A in view(12,usr)) //This for loop detects ships around those that use the say verb.
			for(var/obj/PodConsole/B in world)
				if(A.PodID==B.PodID)
					for(var/mob/C in hearers(6,B))
						C << output("<font color=green><b>([A.name] External Camera)</b> [usr.name]: [html_encode(T)]", "output")
						C << output("<font color=green><b>([A.name] External Camera)</b> [usr.name]: [html_encode(T)]", "icchat")
//						C<<"<font color=green><b>([A.name] External Camera)</b> [usr.name]: [html_encode(T)]"

		for(var/obj/PodConsole/AA in view(12,usr))
			for(var/obj/Items/Tech/SpaceTravel/SpacePod/BB in world)
				if(AA.PodID==BB.PodID&&AA.SpeakerToggle==1)
					for(var/mob/C in hearers(12,BB))
						C << output("<font color=green><b>([BB.name] External Speaker)</b> [usr.name]: [html_encode(T)]", "output")
						C << output("<font color=green><b>([BB.name] External Speaker)</b> [usr.name]: [html_encode(T)]", "icchat")
//						C<<"<font color=green><b>([BB.name] External Speaker)</b> [usr.name]: [html_encode(T)]"
		usr.Say_Spark()
		if(usr.AFKTimer==0)
			usr.overlays-=usr.AFKIcon
//			spawn()usr.GainLoop()
			spawn()usr.callspawns()
		usr.AFKTimer=usr.AFKTimeLimit

	verb/Yell(T as text)
		set category="Other"
		set src=usr.contents
		if(usr.CursedBeta=="Mute")T=pick(V)
		if(usr.TimeFrozen)
			usr<<"...?!!"
			return
		for(var/mob/E in hearers(24,usr))
			if(E.Timestamp)
				E << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][E.Controlz(usr)] yells: <b>[html_encode(T)]</b>", "output")
				E << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][E.Controlz(usr)] yells: <b>[html_encode(T)]</b>", "icchat")
//				E<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][E.Controlz(usr)] yells: <b>[html_encode(T)]</b>"
				Log(E.ChatLog(),"<font color=green>[usr]([usr.key]) yells: <b>[html_encode(T)]</b>")
			else
				E << output("<font color=[Text_Color]>[usr][E.Controlz(usr)] yells: <b>[html_encode(T)]</b>", "output")
				E << output("<font color=[Text_Color]>[usr][E.Controlz(usr)] yells: <b>[html_encode(T)]</b>", "icchat")
//				E<<"<font color=[Text_Color]>[usr][E.Controlz(usr)] yells: <b>[html_encode(T)]</b>"
				Log(E.ChatLog(),"<font color=green>[usr]([usr.key]) yells: <b>[html_encode(T)]</b>")
		for(var/obj/Items/Tech/SecurityCamera/F in view(24,usr))
			if(F.Active==1)
				for(var/mob/CC in world)
					for(var/obj/Items/Tech/Scouter/CCS in CC)
						if(F.Points==CCS.Frequency)
							if(CC.Timestamp)
								CC << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>*[F.name] transmits: [usr.name] yells: [html_encode(T)]", "output")
								CC << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>*[F.name] transmits: [usr.name] yells: [html_encode(T)]", "icchat")
							else
								CC << output("<font color=[Text_Color]>[F.name] transmits: [usr.name] yells: [html_encode(T)]", "output")
								CC << output("<font color=[Text_Color]>[F.name] transmits: [usr.name] yells: [html_encode(T)]", "icchat")
/*								CC<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>*[F.name] transmits: [usr.name] yells: [html_encode(T)]"
							else
								CC<<"<font color=[Text_Color]>[F.name] transmits: [usr.name] yells: [html_encode(T)]"*/
				for(var/obj/Items/Tech/SecurityDisplay/G in world)
					if(G.Password==F.Password)
						if(G.Active==1)
							for(var/mob/H in hearers(G.AudioRange,G))
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits: [usr] yells: [html_encode(T)]", "output")
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits: [usr] yells: [html_encode(T)]", "icchat")
//								H<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits: [usr] yells: [html_encode(T)]"
								Log(H.ChatLog(),"<font color=green>[F.name](Made by [F.CreatorKey]) transmits: [usr] yells: [html_encode(T)]")
		usr.Say_Spark(3)
		if(usr.AFKTimer==0)
			usr.overlays-=usr.AFKIcon
//			spawn()usr.GainLoop()
			spawn()usr.callspawns()
		usr.AFKTimer=usr.AFKTimeLimit

	verb/Whisper(T as text)
		set category="Other"
		set src=usr.contents
		var/list/peepz=new
		if(usr.CursedBeta=="Mute")T=pick(V)
		if(usr.TimeFrozen)
			usr<<"...?"
			return
		for(var/mob/E in hearers(1,usr))
			if(E.EnhancedHearing==0)
				E << output("<i>[E.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=[Text_Color]>[usr][E.Controlz(usr)] whispers: [html_encode(T)]</i>", "output")
				E << output("<i>[E.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=[Text_Color]>[usr][E.Controlz(usr)] whispers: [html_encode(T)]</i>", "icchat")
				Log(E.ChatLog(),"<font color=green>[usr]([usr.key]) WHISPERS: [html_encode(T)]")
				peepz.Add(E)
		for(var/mob/X in hearers(6,usr))
			if(X.EnhancedHearing==1)
				X << output("<i>[X.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=[Text_Color]>[usr][X.Controlz(usr)] whispers: [html_encode(T)]</i>", "output")
				X << output("<i>[X.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=[Text_Color]>[usr][X.Controlz(usr)] whispers: [html_encode(T)]</i>", "icchat")
				Log(X.ChatLog(),"<font color=green>[usr]([usr.key]) WHISPERS: [html_encode(T)]")
				peepz.Add(X)
		for(var/mob/W in hearers(10,usr))
			if(W in peepz)continue
			W << output("<i><font color=[Text_Color]>[usr][W.Controlz(usr)] whispers</i>...", "output")
			W << output("<i><font color=[Text_Color]>[usr][W.Controlz(usr)] whispers</i>...", "icchat")
		if(usr.AFKTimer==0)
			usr.overlays-=usr.AFKIcon
//			spawn()usr.GainLoop()
			spawn()usr.callspawns()
		usr.AFKTimer=usr.AFKTimeLimit

	verb/Think(T as text)
		set category="Other"
		set src=usr.contents
		var/list/peepz=new
		var/msg=""
		if(usr.TimeFrozen)
			usr<<"<i>..?!</i>"
		for(var/mob/E in hearers(12,usr))
			msg="<i>[E.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=[Text_Color]>[usr][E.Controlz(usr)] thinks: <font color=aqua>[html_encode(T)]</i>"
			E << output(msg, "output")
			E << output(msg, "icchat")
			Log(E.ChatLog(),"<font color=green>[usr]([usr.key]) THOUGHT: [html_encode(T)]")
			peepz.Add(E)

		for(var/mob/W in hearers(10,usr))
			if(W in peepz)continue
			W<<"<i><font color=[Text_Color]>[usr][W.Controlz(usr)] whispers</i>..."
		for(var/mob/m in world)
			if(m.Divine)
				if(!(m in peepz))
					msg="<i>[m.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=[Text_Color]>[usr][m.Controlz(usr)] thinks: <font color=aqua>[html_encode(T)]</i>"
					m << output(msg, "output")
					m << output(msg, "icchat")
					Log(m.ChatLog(),"<font color=green>[usr]([usr.key]) THOUGHT: [html_encode(T)]")

		if(usr.AFKTimer==0)
			usr.overlays-=usr.AFKIcon
//			spawn()usr.GainLoop()
			spawn()usr.callspawns()
		usr.AFKTimer=usr.AFKTimeLimit


	verb/Emote()
		set category="Other"
		set src=usr.contents
		usr.overlays+='Emoting.dmi'
		if(usr.TimeFrozen)
			usr<<"You're frozen in time, don't be a goon with your emotes!"
		var/T=input("Type your rp here.  HTML enabled.")as message|null
		if(T==null)
			usr.overlays-='Emoting.dmi'
			return
		usr.AutoReward["RPFreq"]++
		usr.AutoReward["RPChara"]+=length(T)
		if(usr.AutoReward["RPFreq"]>=REWARDMINIMUM_EMOTES && usr.AutoReward["RPChara"]>=REWARDMINIMUM_CHARACTERS)
			RewarderMessage("[usr] has made [usr.AutoReward["RPFreq"]] emotes. With a total of [usr.AutoReward["RPChara"]] characters, reward them.")
		/*if(usr.AutoReward["RPFreq"]==100)
			Log("Admin","[usr] has made a hundred emotes holy shit when are rewards happening!?")
		if(usr.AutoReward["RPFreq"]==200)
			Log("Admin","[usr] has made two hundred emotes why so not reward yet?!")
		if(usr.AutoReward["RPFreq"]==350)
			Log("Admin","[usr] has made tree fiddy emotes wut.")*/
		var/working_text = T
		while( roleplay_say.Find( working_text ) )
			T = replacetext(T,roleplay_say.match,"<font color=[Text_Color]>[roleplay_say.match]<font color=[DEFAULTCOLOR]>")

		var/options = copytext( T, 1, 3 )
		switch( options )
			if( "//" || "||" )
				T = replacetext( T, options, "", 1, 3 )
				working_text = "[html_decode(T)]\n<font color=[Text_Color]>([usr.name])<font color=[DEFAULTCOLOR]>"
			else
				working_text = "[usr.name] <font color=[DEFAULTCOLOR]>[html_decode(T)]"


		for(var/mob/Players/E in hearers(15,usr))
			E << output("[E.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=[DEFAULTCOLOR]>[E.Controlz(usr)]<font color=[Text_Color]>*[working_text]*", "output")
			E << output("[E.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=[DEFAULTCOLOR]>[E.Controlz(usr)]<font color=[Text_Color]>*[working_text]*", "icchat")
			if(E==usr)
				spawn()Log(E.ChatLog(),"<font color=#CC3300>*[usr]([usr.key]) [html_decode(T)]*")
				spawn()TempLog(E.ChatLog(),"<font color=#CC3300>*[usr]([usr.key]) [html_decode(T)]*")
			else
				Log(E.ChatLog(),"<font color=red>*[usr]([usr.key]) [html_decode(T)]*")
			for(var/obj/Items/Enchantment/ArcanicEye/EyeCheck in E) //Checks if anyone within 15 tiles of a emote user has a Arcanic Eye(s).
				if(EyeCheck.suffix) //Checks if equipped. suffix can only be Equipped in this case, so no need to be specific.
					for(var/mob/Players/OrbCheck in world) //Searches the world for players...
						for(var/obj/Items/Enchantment/ArcanicOrb/FinalCheck in OrbCheck) //Checks for Arcanic Orbs.
							if(OrbCheck.client!=null)
								if(OrbCheck.client.eye==E&&FinalCheck.Password==EyeCheck.Password&&FinalCheck.Active) //...Then tries to see if their camera is different then default. but this throws a cannot read null.eye runtime error.
									OrbCheck << output("[FinalCheck](viewing [E]):<font color=[DEFAULTCOLOR]>[E.Controlz(usr)]<font color=[Text_Color]>*[working_text]*", "output")
									OrbCheck << output("[FinalCheck](viewing [E]):<font color=[DEFAULTCOLOR]>[E.Controlz(usr)]<font color=[Text_Color]>*[working_text]*", "icchat") //Outputs to the Orb owner the emote.
//									OrbCheck<<"[FinalCheck](viewing [E]):<font color=[Text_Color]>*[usr.name]<font color=[DEFAULTCOLOR]> [html_decode(T)]*" //Outputs to the Orb owner the emote.

		for(var/obj/Items/Tech/SecurityCamera/F in view(15,usr))
			if(F.Active==1)
				for(var/mob/CC in world)
					for(var/obj/Items/Tech/Scouter/CCS in CC)
						if(F.Points==CCS.Frequency)
							CC << output("[CC.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=green>[F.name] transmits:<font color=[DEFAULTCOLOR]>[CC.Controlz(usr)]<font color=[Text_Color]>*[working_text]*", "output")
							CC << output("[CC.Timestamp ? "<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]" : ""]<font color=green>[F.name] transmits:<font color=[DEFAULTCOLOR]>[CC.Controlz(usr)]<font color=[Text_Color]>*[working_text]*", "icchat")
//							CC<<"<font color=green>[F.name] transmits:<font color=[Text_Color]>*[usr.name]<font color=[DEFAULTCOLOR]>[CC.Controlz(usr)] [html_decode(T)]*"
				for(var/obj/Items/Tech/SecurityDisplay/G in world)
					if(G.Password==F.Password)
						if(G.Active==1)
							for(var/mob/H in hearers(G.AudioRange,G))
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits:*[usr.name] [html_decode(T)]*", "output")
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits:*[usr.name] [html_decode(T)]*", "icchat")
//								H<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[F.name] transmits:*[usr.name]<font color=[DEFAULTCOLOR]> [html_decode(T)]*"
								Log(H.ChatLog(),"<font color=red>[F.name] transmits:*[usr]([usr.key]) [html_decode(T)]*")
		for(var/obj/Items/Tech/CameraProbe/FF in view(15,usr))
			if(FF.Active==1)
				for(var/obj/Items/Tech/SecurityDisplay/G in world)
					if(G.Password==FF.Password)
						if(G.Active==1)
							for(var/mob/H in hearers(G.AudioRange,G))
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[FF.name] transmits:*[usr.name] [html_decode(T)]*", "output")
								H << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[FF.name] transmits:*[usr.name] [html_decode(T)]*", "icchat")
//								H<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=green>[FF.name] transmits:*[usr.name]<font color=[DEFAULTCOLOR]> [html_decode(T)]*"
								Log(H.ChatLog(),"<font color=red>[FF.name] transmits:*[usr]([usr.key]) [html_decode(T)]*")

		for(var/obj/Items/Tech/SpaceTravel/Ship/A in view(12,usr)) //This for loop detects ships around those that use the say verb.
			for(var/obj/ShipConsole/B in world)
				if(A.Password==B.Password)
					for(var/mob/C in hearers(6,B))
						C << output("<font color=green>([A.name]'s External Camera) *[usr.name] [html_decode(T)]*", "output")
						C << output("<font color=green>([A.name]'s External Camera) *[usr.name] [html_decode(T)]*", "icchat")
//						C<<"<font color=green>([A.name]'s External Camera) *[usr.name]<font color=[DEFAULTCOLOR]> [html_decode(T)]*"

		for(var/obj/ShipConsole/AA in view(12,usr))
			for(var/obj/Items/Tech/SpaceTravel/Ship/BB in world)
				if(AA.Password==BB.Password&&AA.SpeakerToggle==1)
					for(var/mob/C in hearers(12,BB))
						C << output("<font color=green>([AA.name]'s Internal Camera) *[usr.name] [html_decode(T)]*", "output")
						C << output("<font color=green>([AA.name]'s Internal Camera) *[usr.name] [html_decode(T)]*", "icchat")
//						C<<"<font color=green>([A.name]'s External Camera) *[usr.name]<font color=[DEFAULTCOLOR]> [html_decode(T)]*"

		for(var/obj/Items/Tech/SpaceTravel/SpacePod/A in view(12,usr)) //This for loop detects ships around those that use the say verb.
			for(var/obj/PodConsole/B in world)
				if(A.PodID==B.PodID)
					for(var/mob/C in hearers(6,B))
						C << output("<font color=green>([A.name]'s External Camera) *[usr.name] [html_decode(T)]*", "output")
						C << output("<font color=green>([A.name]'s External Camera) *[usr.name] [html_decode(T)]*", "icchat")

		for(var/obj/PodConsole/AA in view(12,usr))
			for(var/obj/Items/Tech/SpaceTravel/SpacePod/BB in world)
				if(AA.PodID==BB.PodID&&AA.SpeakerToggle==1)
					for(var/mob/C in hearers(12,BB))
						C << output("<font color=green>([AA.name]'s Internal Camera) *[usr.name] [html_decode(T)]*", "output")
						C << output("<font color=green>([AA.name]'s Internal Camera) *[usr.name] [html_decode(T)]*", "icchat")


		usr.Say_Spark()
		if(usr.AFKTimer==0)
			usr.overlays-=usr.AFKIcon
			spawn()usr.callspawns()
//			spawn()usr.GainLoop()
		usr.AFKTimer=usr.AFKTimeLimit
		usr.overlays-='Emoting.dmi'

/*	verb/LOOC(L as text)
		set category="Other"
		set src=usr.contents
		for(var/mob/LE in hearers(12,usr))
			for(var/obj/Communication/C in LE)
				if(LE.Timestamp)
					LE << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][LE.Controlz(usr)] says LOOCly: [html_encode(L)]", "output")
					LE << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][LE.Controlz(usr)] says LOOCly: [html_encode(L)]", "loocchat")
					if(C.LOOCinIC)
						LE << output("<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[Text_Color]>[usr][LE.Controlz(usr)] says LOOCly: [html_encode(L)]", "icchat")
					Log(LE.ChatLog(),"<font color=green>[usr]([usr.key]) LOOCs: [html_encode(L)]")
				else
					LE << output("<font color=[Text_Color]>[usr][LE.Controlz(usr)] says LOOCly: [html_encode(L)]", "output")
					LE << output("<font color=[Text_Color]>[usr][LE.Controlz(usr)] says LOOCly: [html_encode(L)]", "loocchat")
					if(C.LOOCinIC)
						LE << output("<font color=[Text_Color]>[usr][LE.Controlz(usr)] says LOOCly: [html_encode(L)]", "icchat")
					Log(LE.ChatLog(),"<font color=green>[usr]([usr.key]) LOOCs: [html_encode(L)]")*/

	proc/OOC_Check(T)
		if(!Allow_OOC&&!(CodedAdmins.Find(usr.key)))
			usr<<"OOC is disabled."
			return 0
		if(usr.key in Mutes&&!(CodedAdmins.Find(usr.key)))
			usr<<"You are muted."
			return 0
		return 1

	verb/ChatSystemOptions()
		set category="Other"
		var/selection=input("Select a toggle option.")in list("Toggle All Tab OOC","Toggle IC tab LOOC","Toggle All Tab LOOC")
		switch(selection)
			if("Toggle All Tab OOC")
				for(var/obj/Communication/C in usr)
					if(C.AllTabOOC)
						C.AllTabOOC=0
						usr<<"OOC messages will not display in the All tab."
					else
						C.AllTabOOC=1
						usr<<"OOC messages will display in the All tab."
			if("Toggle IC tab LOOC")
				for(var/obj/Communication/C in usr)
					if(C.LOOCinIC)
						C.LOOCinIC=0
						usr<<"LOOC messages will not display in the IC tab."
					else
						C.LOOCinIC=1
						usr<<"LOOC messages will display in the IC tab."
			if("Toggle All tab LOOC")
				for(var/obj/Communication/C in usr)
					if(C.LOOCinAll)
						C.LOOCinAll=0
						usr<<"LOOC messages will not display in the IC tab."
					else
						C.LOOCinAll=1
						usr<<"LOOC messages will display in the IC tab."


	verb/ToggleOOC()
		set category="Other"
		src.ShowOOC=!src.ShowOOC
		if(src.ShowOOC) usr<<"You turn your OOC <font color=green>on</font color>."
		else usr<<"You turn your OOC <font color=red>off</font color>."


/*	verb/Telepathy_Toggle()
		if(src.Telepathy_Enabled)
			usr<<"<font color=red>Telepathy messages off."
			src.Telepathy_Enabled=0
		else
			usr<<"<font color=green>Telepathy messages on."
			src.Telepathy_Enabled=1*/


mob/proc/OMessage(var/View=10,var/Msg,var/Log)
	for(var/mob/Players/E in hearers(View,src))
		if(Msg)
//			E<<"[Msg]"
			E << output("[Msg]", "loocchat")
			E << output("[Msg]", "oocchat")
			E << output("[Msg]", "output")
			E << output("[Msg]", "icchat")
		if(Log)
			Log(E.ChatLog(),Log)
mob/var/tmp/Spam=0


proc/SpamCheck(var/mob/M,var/T)
	if(M.CheckPunishment("Mute"))
		return 1
	if(!M.Admin)
		M.Spam++
		spawn(20)if(M.Spam>0)M.Spam--
		if(findtext(T,"\n\n\n")||M.Spam>9)
			world<<"[M]([M.key]) was just muted for spamming!(Auto)"
			var/Duration=Value(world.realtime+(5000))
			var/Reason="You fucked up, nigga."
			Punishment("Action=Add&Punishment=Mute&Key=[M.key]&IP=[M.client.address]&ComputerID=[M.client.computer_id]&Duration=[Duration]&User=[M.key]&Reason=[Reason]&Time=[TimeStamp()]")
			Punishment("Action=Add&Punishment=Ban&Key=[M.key]&IP=[M.client.address]&ComputerID=[M.client.computer_id]&Duration=[world.realtime+((10*60*60*24)*7)]&User=Auto&Reason=Spamming&Time=[TimeStamp()]")
		return 0
