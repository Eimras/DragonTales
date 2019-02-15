var/JinxMap=0//different spawns
var/MakeAMap=0//enables fly, build, and zplane swapping.
var/list
	CodedAdmins=list("Sarmie"=5, "MalikCatcher"=4, "GalionKnight"=5, )
	Admins=new
	Rewarders=new
	Punishments=new
	Spawns=new
mob/var
	tmp/Admin=0
	tmp/Rewarder=0
var
	GlobalMessage="Whaaat"
	Cray
	CyberBPCap = 50
	HalfDemonNerf=0
	Current_Energy_Reward=0
	Current_BP_Reward=0
	Current_AvgStats=0
	TierS_EXP_Cap=null
var/list/TierS=list("Keyblade", "Spiral", "Eight Gates", "Weapon Soul", "Jagan Eye", "Hiten Mitsurugi", "Sharingan", "Ansatsuken", "Spirit Energy", "Hero of Aspect", "Kamui", "Ripple", "Unlimited Blade Works", "Berserker Armor", "Vaizard Mask", "Mad Scientist")

obj/AdminVotes
	New()
		..()
		spawn(1200)src.EndVote()
	proc/EndVote()
		var/nyes=0
		var/tyes=""
		var/nno=0
		var/tno=""
		var/nab=0
		var/tab=""
		for(var/x in yes)
			nyes++
			tyes+="[x] "
		for(var/x in no)
			nno++
			tno+="[x] "
		for(var/x in abstain)
			nab++
			tab+="[x] "
		Log("Admin","<font color=lime>(VOTES)</font color></font color> [person] vote results for [what] because <small>[reason]</small>: (Y/N/A) <b>[nyes]/[nno]/[nab] ; ([tyes])/([tno])/([tab])</b> ")
		spawn()del(src)
	var
		person
		what
		reason
		votetime
		//list/who=new
		list/yes=new
		list/no=new
		list/abstain=new


mob/Admin1/verb
	DebugShit()
		set hidden=1
		var/regens=0
		var/drills=0
		var/cald=0
		var/senzus=0
		var/senzusperson=0
		var/turrets=0
		var/ships=0
		var/pods=0
		var/mobs=0
		for(var/obj/Items/Tech/Regenerator/Q)
			regens++
		for(var/obj/Items/Tech/AutoDrill/Q)
			drills++
		for(var/obj/Items/Enchantment/Cauldron/Q)
			cald++
		for(var/obj/Items/Senzu/Q)
			if(ismob(Q.loc))senzusperson++
			else senzus++
		for(var/obj/Items/Tech/Turret/Q)
			turrets++
		for(var/obj/Items/Tech/SpaceTravel/Ship/Q)
			ships++
		for(var/obj/Items/Tech/SpaceTravel/SpacePod/Q)
			pods++
		for(var/mob/Q)
			if(!(Q.client))
				mobs++
		usr<<"regens: [regens]"
		usr<<"drils: / calds: [drills] / [cald]"
		usr<<"person+world(senzus): [senzusperson] + [senzus] = [senzusperson+senzus]"
		usr<<"turrets: [turrets]"
		usr<<"ships: [ships]"
		usr<<"pods: [pods]"
		usr<<"npcs: [mobs]"
	AdminVote(var/obj/AdminVotes/b)
		set hidden=1
		if(b)
			if(b.yes.Find(usr.key)||b.no.Find(usr.key)||b.abstain.Find(usr.key))
				usr<<"You already voted!"
				return
			var/what=input("")in list("Yes","No","Abstain")
			switch(what)
				if("Yes")
					b.yes.Add(usr.key)
				if("No")
					b.no.Add(usr.key)
				if("Abstain")
					b.abstain.Add(usr.key)


	Announce(msg as null|message)
		set category="Admin"
		if(!msg) return
		if(alert("Would you like this announce to make a sound?","","Yes","No")=="Yes") usr.PingAllPlayers(0)
		else usr.PingAllPlayers(1)
		world << "<hr><center><b>[usr.key]</b> announces:<br>[msg]<br><hr>"

	Narrate(msg as null|message)
		set category="Admin"
		if(!msg) return
		var/range = input("How far would you like this narrate to reach?  Min 1, Max 40.","Narrate", 20) as num
		range=max(1,min(20,range))
		view(range) << output("<font color=purple>[msg]", "output")
		view(range) << output("<font color=purple>[msg]", "icchat")
		//view(range) << "<font color=purple>[msg]"
		for(var/mob/Players/P in view(range))
			if(P != usr) usr.SendPing(P,1)

	StartAdminVote(var/what as text,var/reason as text)
		set category="Admin"
		var/obj/AdminVotes/Q=new
	/*	votetime*=10
		if(votetime<600)
			votetime=600
		if(votetime>6000)
			votetime=6000
		Q.votetime=votetime*/
		Q.person=usr.key
		Q.what=what
		Q.reason=reason
		for(var/mob/Players/M)
			if(M.Admin)
				M<<"<font color=lime>(ADMIN VOTE):</font color> <b>[usr.key]</b> is conducting a vote for: <b>[what]</b> because of <i>[reason]</i> <big><a href=?src=\ref[Q];action=MasterControl;do=Vote>VOTE</a></b>"

var
	_AutoRewardTier=list("EnvyAttraction"=5)//just coded so its a placement, do not set to null
	_AutoReward=list("MaxBase"=10,"MaxStat"=10,"LastRewardTime"=0,"RewardsTotal"=0,"RPChara"=2500,"RPFreq"=5)
	//RPCharaFreq average rp is 500, so... 5 of these will suffice so 250
mob/var
	AutoReward=list("RoleplaySkill"=0,"RPFreq"=0,"RPChara"=0,"LastReward"=0)
	//RoleplayingSkill=0//preloaded from a savedfile 1-5
	//RPChara=0//how much emote characters since last reward
mob/proc/AutomatedReward()
	if(src.AutoReward["LastReward"]< _AutoReward["RewardsTotal"])
		var/default=src.AutoReward["RoleplaySkill"]
		if(default==0)default=5
		var/RPSkill=default/5

		if(AutoReward["RPChara"]==0||AutoReward["RPChara"]==0)return
		var/RPChara=min(_AutoReward["RPChara"],src.AutoReward["RPChara"])/_AutoReward["RPChara"]
		var/RPFreq=min(_AutoReward["RPFreq"],src.AutoReward["RPFreq"])/_AutoReward["RPFreq"]
		src.Base+=round(RPSkill*RPChara*src.BaseMod*RPFreq*_AutoReward["MaxBase"])
		src.RewardPoints+=round(RPSkill*RPChara*RPFreq*_AutoReward["MaxStat"])
		src.Rewarded="<FONT COLOR=616161>[TimeStamp()] (AR:[round(RPSkill*RPChara*RPFreq*_AutoReward["MaxStat"])])</FONT>"
		src.AutoReward["RPFreq"]=0
		src.AutoReward["RPChara"]=0
		src.AutoReward["LastReward"]=_AutoReward["RewardsTotal"]


mob/Admin3/verb
	GiveBuild(var/mob/m in world)
		set category="Admin"
		m.BuildGiven=1
		m.contents+=new/obj/Skills/Fly
		Log("Admin","[ExtractInfo(usr)] gave [ExtractInfo(m)] build until they log out.")
	UnlockSSJTraining(var/mob/m in world, var/x as num)
		set category="Admin"
		if(m.Race!="Saiyan")
			src << "Yo, they aren't even a Saiyan..."
			return
		if(x==1)
			m.CanTrainSSj=1
			m << "You can now train Super Saiyan by fighting in it!"
		if(x==2)
			m.CanTrainSSj2=1
			m << "You can now train Super Saiyan 2 by fighting in it!"
		if(x==3)
			m.CanTrainSSj3=1
			m << "You can now train Super Saiyan 3 by fighting in it!"
		Log("Admin","[ExtractInfo(usr)] gave [ExtractInfo(m)] the capability to train their Super Saiyan [x] form.")


	/*Add Noob
		var/list/Noobables=new
		Noobables+="Cancel"
		for(var/mob/Players/A) Noobables+=A.key
		var/A=input("Choose") in Noobables
		if(!A||A=="Cancel") return
		if(A in Noobs)
			usr<<"They are already a noob"
			return
		else
			return
	Remove Noob
		var/list/Choices=new
		Choices.Add("Cancel",Noobs)
		var/Choice=input("Remove who from the noob list?") in Choices
		if(!Choice||Choice=="Cancel") return
		for(var/mob/Players/A) if(Admins.Find(A)||locate(type) in A)
			A<<"[usr.key] just un-noobified [Choice]"
		Noobs-=Choice
		BootFile("Alliance","Save")
	Noob List
		for(var/A in Noobs)
			usr<<"[A]"*/
	RemoveCurrentEffects()
		set category="Admin"
		for(var/obj/Effects/EF in world)
			del EF
	HighPointRaceFix()
		set category="Admin"
		for(var/mob/m in world)
			if(m.Race=="Alien"&&m.Class=="Fighter"||m.Race=="Aetherian"&&m.Class=="Fighter"||m.Race=="Android"&&m.Class=="Fighter")
				m.contents+=new/obj/Redo_Stats
				m<<"You've been granted the opportunity to redo your stats thanks to \a [m.Race] buff."
				m.Class="Fighter*"
	ViewRPTiers()
		set category="Admin"
		var/View={"<html><head><title>QualityRankings</title><body>
<font size=3><font color=red>Quality Rank Tiers:<hr><font size=2><font color=black>"}
		for(var/blah in _AutoRewardTier)
			View+="[blah]: [_AutoRewardTier["[blah]"]]"
		usr<<browse("[View]","window=omggg;size=600x200")

	SetRPTier(var/mob/Players/M in world)
		set category="Admin"
		var/blah=input("Set them to what level? They're at level [M.AutoReward["RoleplaySkill"]]")as num
		if(blah!="[M.AutoReward["RoleplaySkill"]]")
			Log("Admin","[ExtractInfo(usr)] changed [ExtractInfo(M)]'s RoleplaySkill from ([M.AutoReward["RoleplaySkill"]]) to ([blah])")
			M.AutoReward["RoleplaySkill"]=blah
			_AutoRewardTier["[M.key]"]=blah
			var/savefile/F=new("QUALITYRANKS")
			F["Tiers"]<<_AutoRewardTier


//mob/Admin4/verb
	SetTierSEXPCap(var/num as num)
		TierSEXPCap=num
		for(var/mob/m in world)
			if(m.TotalKeybladeEXP > TierSEXPCap)
				m.TotalKeybladeEXP = TierSEXPCap
				if(m.KeybladeLevel > round(m.TotalKeybladeEXP/100))
					m.KeybladeLevel=round(m.TotalKeybladeEXP/100)
			if(m.TotalSpiralEXP > TierSEXPCap*1.25)
				m.TotalSpiralEXP = TierSEXPCap*1.25
				if(m.UnlockSpiral > round(m.TotalSpiralEXP*1.25/100))
					m.UnlockSpiral=round(m.TotalSpiralEXP*1.25/100)
			if(m.TotalEightGatesEXP > TierSEXPCap*2)
				m.TotalEightGatesEXP = TierSEXPCap*2
				if(m.GatesUnlocked > round(m.TotalEightGatesEXP*2/100))
					m.GatesUnlocked=round(m.TotalEightGatesEXP*2/100)
			if(m.TotalWeaponSoulEXP > TierSEXPCap*2)
				m.TotalWeaponSoulEXP = TierSEXPCap*2
				if(m.WeaponSoulLevel > round(m.TotalWeaponSoulEXP*2/100))
					m.WeaponSoulLevel=round(m.TotalWeaponSoulEXP*2/100)
			if(m.TotalHitenMitsurugiEXP > TierSEXPCap)
				m.TotalHitenMitsurugiEXP = TierSEXPCap
				if(m.HitenMitsurugi > round(m.TotalHitenMitsurugiEXP/100))
					m.HitenMitsurugi=round(m.TotalHitenMitsurugiEXP/100)
			if(m.TotalSharinganEXP > TierSEXPCap)
				m.TotalSharinganEXP = TierSEXPCap
				if(m.SharinganUnlocked > round(m.TotalSharinganEXP/100))
					m.SharinganUnlocked=round(m.TotalSharinganEXP/100)
			if(m.TotalAnsatsukenEXP > TierSEXPCap)
				m.TotalAnsatsukenEXP = TierSEXPCap
				if(m.AnsatsukenMod > round(m.TotalAnsatsukenEXP/100))
					m.AnsatsukenMod=round(m.TotalAnsatsukenEXP/100)
			if(m.TotalSpiritEnergyEXP > TierSEXPCap)
				m.TotalSpiritEnergyEXP = TierSEXPCap
				if(m.SpiritLevel > round(m.TotalSpiritEnergyEXP/100))
					m.SpiritLevel=round(m.TotalSpiritEnergyEXP/100)
			if(m.TotalHOAEXP > TierSEXPCap)
				m.TotalHOAEXP = TierSEXPCap
				if(m.HeroLevel > round(m.TotalHOAEXP/100))
					m.HeroLevel=round(m.TotalHOAEXP/100)
			if(m.TotalKamuiEXP > TierSEXPCap*2.5)
				m.TotalKamuiEXP = TierSEXPCap*2.5
			if(m.TotalRippleEXP > TierSEXPCap)
				m.TotalRippleEXP = TierSEXPCap
				if(m.RippleMod > round(m.TotalRippleEXP*2.5/100))
					m.RippleMod=round(m.TotalRippleEXP*2.5/100)
			if(m.TotalUBWEXP > TierSEXPCap)
				m.TotalUBWEXP = TierSEXPCap
				if(m.UBWLevel > round(m.TotalUBWEXP/100))
					m.UBWLevel=round(m.TotalUBWEXP/100)
			if(m.TotalBerserkEXP > TierSEXPCap)
				m.TotalBerserkEXP = TierSEXPCap
				if(m.BerserkerMod > round(m.TotalBerserkEXP/100))
					m.BerserkerMod=round(m.TotalBerserkEXP/100)
			if(m.TotalVaizardEXP > TierSEXPCap)
				m.TotalVaizardEXP = TierSEXPCap
				if(m.VisoredStage > round(m.TotalVaizardEXP/100))
					m.VisoredStage=round(m.TotalVaizardEXP/100)
			if(m.TotalMadScientistEXP > TierSEXPCap)
				m.TotalMadScientistEXP = TierSEXPCap
				if(m.MadScientist > round(m.TotalMadScientistEXP/100))
					m.MadScientist=round(m.TotalMadScientistEXP/100)

/*	MakeMazokuHuman(var/mob/m in world)
		set category="Admin"
		if(m.Race=="Human")
			m.Class="Mazoku"*/
	SetAscensionReqs()
		set category="Admin"
		var/race=input(usr, "What race's requirements do you want to modify?", "Set Ascension Reqs") in list("Demi", "Namekian", "Human", "Spirit Doll", "Half Demon", "Tuffle", "Heran", "Aetherian", "Kitsune", "Tanuki", "Neko")
		var/list/DemiAscs=list("Olympian Ascension","Olympian Ascension Unlocked","Titan Ascension","Titan Ascension Unlocked")
		var/list/NamekianAscs=list("Namekian Ascension 1", "Namekian Ascension 1 Unlocked", "Namekian Ascension 2", "Namekian Ascension 2 Unlocked")
		var/list/HumanAscs=list("Human Third Eye", "Human Third Eye Unlocked", "Red Ascension", "Red Ascension Unlocked", "Blue Ascension", "Blue Ascension Unlocked")
		var/list/SpiritDollAscs=list("Spirit Doll Ascension 1", "Spirit Doll Ascension 1 Unlocked", "Spirit Doll Ascension 2", "Spirit Doll Ascension 2 Unlocked")
		var/list/HalfDemonAscs=list("Half Demon Demonic Will", "Half Demon Demonic Will Unlocked", "Half Demon Third Eye", "Half Demon Third Eye Unlocked")
		var/list/TuffleAscs=list("Tuffle Ascension 1", "Tuffle Ascension 1 Unlocked", "Tuffle Ascension 2", "Tuffle Ascension 2 Unlocked")
		var/list/HeranAscs=list("Heran Ascension 1", "Heran Ascension 1 Unlocked")
		var/list/AetherianAscs=list("Aetherian Ascension 1", "Aetherian Ascension 1 Unlocked", "Aetherian Ascension 2", "Aetherian Ascension 2 Unlocked")
		var/list/KitsuneAscs=list("Three Tails Ascension", "Three Tails Ascension Unlocked")
		var/list/TanukiAscs=list("Tanuki Ascension 1", "Tanuki Ascension 1 Unlocked")
		var/list/NekoAscs=list("Neko Ascension 1", "Neko Ascension 1 Unlocked", "Neko Ascension 2", "Neko Ascension 2 Unlocked", "Neko Ascension 3", "Neko Ascension 3 Unlocked", "Neko Ascension 4", "Neko Ascension 4 Unlocked")
		var/list/ascs=list()
		if(race=="Demi")
			ascs=DemiAscs
		if(race=="Namekian")
			ascs=NamekianAscs
		if(race=="Human")
			ascs=HumanAscs
		if(race=="Spirit Doll")
			ascs=SpiritDollAscs
		if(race=="Half Demon")
			ascs=HalfDemonAscs
		if(race=="Tuffle")
			ascs=TuffleAscs
		if(race=="Heran")
			ascs=HeranAscs
		if(race=="Aetherian")
			ascs=AetherianAscs
		if(race=="Kitsune")
			ascs=KitsuneAscs
		if(race=="Tanuki")
			ascs=TanukiAscs
		if(race=="Neko")
			ascs=NekoAscs
		var/asc = input(usr, "What ascension do you want to modify?", "Set Ascension Reqs") in ascs
		var/ascvalue = GetAscensionValue(asc)
		var/newreq = input(usr, "What do you want to set [asc]'s new requirement to?", "Set Ascension Reqs (Currently: [ascvalue]") as num
		if(asc=="Olympian Ascension")
			global.DemiReq1=newreq
		if(asc=="Olympian Ascension Unlocked")
			global.DemiUnlockedReq1=newreq
		if(asc=="Titan Ascension")
			global.DemiReq2=newreq
		if(asc=="Titan Ascension Unlocked")
			global.DemiUnlockedReq2=newreq
		if(asc=="Namekian Ascension 1")
			global.NamekianReq1=newreq
		if(asc=="Namekian Ascension 1 Unlocked")
			global.NamekianUnlockedReq1=newreq
		if(asc=="Namekian Ascension 2")
			global.NamekianReq2=newreq
		if(asc=="Namekian Ascension 2 Unlocked")
			global.NamekianUnlockedReq2=newreq
		if(asc=="Human Third Eye")
			global.HumanReq1=newreq
		if(asc=="Human Third Eye Unlocked")
			global.HumanUnlockedReq1=newreq
		if(asc=="Red Ascension")
			global.HumanReq2=newreq
		if(asc=="Red Ascension Unlocked")
			global.HumanUnlockedReq2=newreq
		if(asc=="Blue Ascension")
			global.HumanReq3=newreq
		if(asc=="Blue Ascension Unlocked")
			global.HumanUnlockedReq3=newreq
		if(asc=="Spirit Doll Ascension 1")
			global.SpiritDollReq1=newreq
		if(asc=="Spirit Doll Ascension 1 Unlocked")
			global.SpiritDollUnlockedReq1=newreq
		if(asc=="Spirit Doll Ascension 2")
			global.SpiritDollReq2=newreq
		if(asc=="Spirit Doll Ascension 2 Unlocked")
			global.SpiritDollUnlockedReq2=newreq
		if(asc=="Half Demon Demonic Will")
			global.HalfDemonReq1=newreq
		if(asc=="Half Demon Demonic Will Unlocked")
			global.HalfDemonUnlockedReq1=newreq
		if(asc=="Half Demon Third Eye")
			global.HalfDemonReq2=newreq
		if(asc=="Half Demon Third Eye Unlocked")
			global.HalfDemonUnlockedReq2=newreq
		if(asc=="Tuffle Ascension 1")
			global.TuffleReq1=newreq
		if(asc=="Tuffle Ascension 1 Unlocked")
			global.TuffleUnlockedReq1=newreq
		if(asc=="Tuffle Ascension 2")
			global.TuffleReq2=newreq
		if(asc=="Tuffle Ascension 2 Unlocked")
			global.TuffleUnlockedReq2=newreq
		if(asc=="Heran Ascension 1")
			global.HeranReq1=newreq
		if(asc=="Heran Ascension 1 Unlocked")
			global.HeranUnlockedReq1=newreq
		if(asc=="Aetherian Ascension 1")
			global.AetherianReq1=newreq
		if(asc=="Aetherian Ascension 1 Unlocked")
			global.AetherianUnlockedReq1=newreq
		if(asc=="Aetherian Ascension 2")
			global.AetherianReq2=newreq
		if(asc=="Aetherian Ascension 2 Unlocked")
			global.AetherianUnlockedReq2=newreq
		if(asc=="Three Tails Ascension")
			global.KitsuneReq1=newreq
		if(asc=="Three Tails Ascension Unlocked")
			global.KitsuneUnlockedReq1=newreq
		if(asc=="Tanuki Ascension 1")
			global.TanukiReq1=newreq
		if(asc=="Tanuki Ascension 1 Unlocked")
			global.TanukiUnlockedReq1=newreq
		if(asc=="Neko Ascension 1")
			global.NekoReq1=newreq
		if(asc=="Neko Ascension 1 Unlocked")
			global.NekoUnlockedReq1=newreq
		if(asc=="Neko Ascension 2")
			global.NekoReq2=newreq
		if(asc=="Neko Ascension 2 Unlocked")
			global.NekoUnlockedReq2=newreq
		if(asc=="Neko Ascension 3")
			global.NekoReq3=newreq
		if(asc=="Neko Ascension 3 Unlocked")
			global.NekoUnlockedReq3=newreq
		if(asc=="Neko Ascension 4")
			global.NekoReq4=newreq
		if(asc=="Neko Ascension 4 Unlocked")
			global.NekoUnlockedReq4=newreq




		Log("Admin","<font color=blue>[ExtractInfo(usr)] set the ascension requirements for [asc] to [newreq] from [ascvalue].")


	ChangeGlobalrpexp()
		set category="Admin"
		var/Speedz=input("Current rate [globalrpexp]x") as null|num
	//	if(usr.key != "Nightmare Zarkus") return
		if(Speedz)
			globalrpexp=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the Year Spobal rpexp speed to [Speedz]x.")

	AutomatedRewardingOptions()
		set category="Admin"
		usr<<"LastRewardTime(Hours)/TotalRewards: Max Base: [_AutoReward["MaxBase"]] Max Stat:[_AutoReward["MaxStat"]] Last Reward Time(Hours):[abs(round(text2num(Value(round(text2num(_AutoReward["LastRewardTime"])-world.realtime)/(600*60)))))] Total Rewards:[_AutoReward["RewardsTotal"]] RPFreq: [_AutoReward["RPFreq"]] RPChara: [_AutoReward["RPChara"]]"
		var/options=input("Watcha wanna do?")in list("RewardAll","MaxStat","MaxBase","RPFreq","RPChara","Cancel")
		if(options=="RewardAll")
			_AutoReward["LastRewardTime"]=Value(world.realtime)
			_AutoReward["RewardsTotal"]++
			for(var/mob/Players/Q)
				if(Q.client)Q.AutomatedReward()
			Log("Admin","[ExtractInfo(usr)] AutomatedRewarded everyone. ([_AutoReward["MaxBase"]])/([_AutoReward["MaxStat"]])")
		if(options in list("MaxStat","MaxBase","RPFreq","RPChara"))
			var/change=input("Change it to what?")as num
			if(change)
				Log("Admin","[ExtractInfo(usr)] altered Automatic Rewards([options]) from ([_AutoReward["[options]"]]) to ([change])")
				_AutoReward["[options]"]=change
	ManuallyRemoveRPTier(v as text)
		_AutoRewardTier["[v]"]=1
		var/savefile/F=new("QUALITYRANKS")
		F["Tiers"]<<_AutoRewardTier
		Log("Admin","[ExtractInfo(usr)] manually changed [v]'s roleplay power to a 1!")


mob/proc/Admin(var/blah,var/Z,var/H)
	Z=text2num(Z)
	switch(blah)
		if("Check")
			if(src.key in CodedAdmins)
				src.Admin("Give",CodedAdmins[src.key],1)
			else if(src.key in Admins)
				src.Admin("Give",Admins[src.key])
//			else if(src.client.address=="127.0.0.1")
//				src.Admin("Give",4) //Giving hoster level 4 for debugging purposes, can't happen on the live server because lollinuxshell.
			else if(src.client.address==world.address||src.client.address=="127.0.0.1"||!src.client.address)
				Admin("Give",4);src<<"<i>Hosting Authority Granted!</i>"
			if(src.client.address=="127.0.0.1")
				src.verbs+=typesof(/mob/Host/verb)

				src<<"Reboot, Shutdown, and Update verbs granted."
			if(src.key in Rewarders)
				src.Admin("RewardGive")

		if("Give")
			src.Admin("Remove")
			src.Admin=Z
			if(Z>=1)src.verbs+=typesof(/mob/Admin1/verb)
			if(Z>=2)src.verbs+=typesof(/mob/Admin2/verb)
			if(Z>=3)src.verbs+=typesof(/mob/Admin3/verb)
			if(Z>=4)src.verbs+=typesof(/mob/Admin4/verb)
			if(Z<5&&Z>0&&!H)
				if(CodedAdmins.Find(src.key))return
				Admins.Add(params2list("[src.key]=[text2num(Z)]"))
		if("RewardGive")
			src.verbs-=typesof(/mob/Rewarder/verb)
			src.verbs+=typesof(/mob/Rewarder/verb)
			src.Rewarder=1
			Rewarders.Remove("[src.key]")
			Rewarders.Add("[src.key]")
			src<<"Reward verbs granted."
		if("RewardRemove")
			src.verbs-=typesof(/mob/Rewarder/verb)
			src.Rewarder=0
			Rewarders.Remove("[src.key]")
			src<<"Your Reward verbs have been removed."
		if("Remove")
			if(CodedAdmins.Find(src.key))return
			src.verbs-=typesof(/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb,/mob/Admin4/verb)
			Admins.Remove(src.key)
			src.Admin=0




mob/proc/CheckPunishment(var/z)
	if(CodedAdmins.Find(src.key))return 0
	for(var/x in Punishments)
		if(x["Punishment"]=="[z]")
			if(x["Key"]==src.key||x["IP"]==src.client.address||x["ComputerID"]==src.client.computer_id)
				if(text2num(x["Duration"])<world.realtime)
					Punishments.Remove(list(x))
				else
					if(x["Punishment"]=="Ban")
						src<<"You are Banned!"
						spawn()del(src)
					if(x["Punishment"]=="Mute")
						src<<"You are Muted!"
					src<<"<br>By: [x["User"]]<br>Reason: [x["Reason"]]<br>TimeStamp: [x["Time"]]<br>Will be lifted in [ConvertTime((text2num(x["Duration"])-world.realtime)/10)]!"
					return 1




proc/Punishment(var/z)
	z=params2list(z)
	if(z["Action"]=="Add")
		Punishments.Add(list(params2list("Punishment=[z["Punishment"]]&Key=[z["Key"]]&IP=[z["IP"]]&ComputerID=[z["ComputerID"]]&Duration=[z["Duration"]]&User=[z["User"]]&Reason=[z["Reason"]]&Time=[z["Time"]]")))
	if(z["Action"]=="Remove")
		for(var/w in Punishments)
			if(z["Punishment"]==w["Punishment"])
				if(z["IP"]==w["IP"])
					w["IP"]=null
				if(z["Key"]==w["Key"])
					w["Key"]=null
				if(z["ComputerID"]==w["ComputerID"])
					w["ComputerID"]=null
				if(w["ComputerID"]==null&&w["IP"]==null&&w["Key"]==null)
					Punishments.Remove(list(z))
	for(var/mob/M in world)
		if(M.client)
			M.CheckPunishment("Ban")


proc/ConvertTime(var/amount)
	var/size=text2num(amount)
	var/ending="Second"
	if(size>=60)
		size/=60
		ending="Minute"
		if(size>=60)
			size/=60
			ending="Hour"
			if(size>=24)
				size/=24
				ending="Day"
	var/end=round(size)
	return "[Value(end,1)] [ending]\s"

mob/verb/Info()
	/*var/Start={"<html><body><body bgcolor="#000000"><font color=orange>
<center><b>Server Time:</b> [TimeStamp()] (<a href='?info'>Refresh</a>)</center>
<b>Announcement to Clients:</b><br>
[GlobalMessage]<br><br>"}
	Start+="<center><b>Current Bans:</b><br>"
	for(var/x in Punishments)
		if(x["Punishment"]=="Ban")
			Start+="Key: [x["Key"]] | IP: [x["IP"]] | ComputerID: [x["ComputerID"]] | Duration: [(text2num(x["Duration"])-world.realtime)/600] | Banned By: [x["User"]] | Reason: [x["Reason"]] | Time of Ban: [x["Time"]]"
	Start+="<br><br><center><b>Current Mutes:</b><br>"
	for(var/x in Punishments)
		if(x["Punishment"]=="Mute")
			Start+="Key: [x["Key"]] | IP: [x["IP"]] | ComputerID: [x["ComputerID"]] | Duration: [(text2num(x["Duration"])-world.realtime)/600] | Muted By: [x["User"]] | Reason: [x["Reason"]] | Time of Mute: [x["Time"]]"
	*/
	var/Start={"<html><body><body bgcolor="#000000"><font color=orange>no"}
	src << browse("[Start]")


proc/AdminMessage(var/msg)
	for(var/mob/Players/M in world)
		if(M.Admin)
			for(var/obj/Communication/x in M)
				if(x.AdminAlerts)
					M<<"<b><font color=red>(Admin)</b><font color=fuchsia> [msg]"

proc/RewarderMessage(var/msg)
	for(var/mob/Players/M in world)
		if(M.Rewarder)
			for(var/obj/Communication/x in M)
				if(x.RewardAlerts)
					M<<"<b><font color=red>(Rewarder)</b><font color=fuchsia> [msg]"

mob/proc/Alert(var/blah)
	switch(alert(src,blah,"Alert","Yes","No"))
		if("Yes")
			return 1



var/list/Writing=new
var/SpaceTravel=0 // 15 default year for going to spaaaaaaace


proc/ExtractInfo(var/x)
	if(istype(x,/mob))
		if(x:client)
			return "[x:key]</a href>([x])"
	return "[x]([x:type])"


Admin_Help_Object
    var
        Character_Key
        Character_Name
        AdminHelp_Message
        AdminHelp_UniqueID

/*mob/Admin1/verb/ViewList2()
		set name = "View Admin Helps"
		set category ="Admin"
		usr.ViewList()*/

mob/proc/ViewList()

		var/View={"         <script type="text/javascript">
					var user;
					function choose(choice){
					    user = choice;
					}

					function DisplayScreen(Key, Name, Message, src, ID){
						var newMessage = Message.replace(/_/g , " ");
					  	document.getElementById('CharacterKey').innerHTML = "<div align='center'> " + Key + "</div>";
						document.getElementById('CharacterName').innerHTML = "<div align='center'> " + Name + "</div>";
						document.getElementById('CharacterMessage').innerHTML = "<div align='center'> " + newMessage + "</div>";
						document.getElementById('ReplyButton').innerHTML = "<a href=?" + src + ";action=MasterControl;do=PM;ID=" + ID + ";">Reply</a href>"

					}
					</script> <html><head><title>Admin Helps</title><body><font size=3><font color=red>Admin Help List:<hr><font size=2><font color=black>"}
		View+={"
					<TABLE BORDER="3" CELLPADDING="10" CELLSPACING="10">
					<TD>
					<div style="height:380px;width:170px;border:1px solid #ccc;font:16px/26px Georgia, Garamond, Serif;overflow:auto;">
					<TABLE width="150" BORDER="3" CELLPADDING="3" CELLSPACING="3">
           			<TD width="210"><font size=2>
             		<div align="center">Ahelps</div></TD><TR>

		"}
		var/Admin_Help_Object/p
		for(p in AdminHelps)
				View+={"<TR>
           					<TD><div align="center"><font size=2><button type="button" onClick="DisplayScreen('[p.Character_Key]','[p.Character_Name]','[p.AdminHelp_Message]','src=\ref[p.Character_Name]]')">[p.Character_Key]
           					</button></div>
             				<div align="center"></div></TD></TR>"}

				//AdminHelps.Remove(p)
		View+={"</TABLE></DIV>
				</TD>
				<TD VALIGN=TOP><div style="height:380px;width:320px;border:1px solid #ccc;font:16px/26px Georgia, Garamond, Serif;overflow:auto;"><table width="300" border="0"align="Top">
  				<tbody>
    			<tr VALIGN=TOP>
      			<td><div align="center"><B><U>Character Key</B></U></div></td>
    			</tr>
    			<tr VALIGN=TOP>
      			<td id="CharacterKey"><div align="center">Key</div></td>
    			</tr>
    			<tr VALIGN=TOP>
      			<td><div align="center"><B><U>Character Name</B></U></div></td>
    			</tr>
    			<tr VALIGN=TOP>
      			<td id="CharacterName"><div align="center">Name</div></td>
    			</tr>
    			<tr VALIGN=TOP>
      			<td><div align="center"><B><U>Message</B></U></div></td>
    			</tr>
    			<tr VALIGN=TOP>
      			<td id="CharacterMessage"><div align="center">Message </div></td>
    			</tr>
    			    <tr VALIGN=BOTTOM>
      <td id="ReplyButton"><div align="center"></div></td>
    </tr>
  				</tbody>
				</table></DIV></TD>
				</TABLE>"}
		usr<<browse("[View]","window=Logrw;size=600x500")
		View+={"</table"><br>"}

//var/AdminHelps[0]

mob/proc/PM(var/mob/who, var/AhelpMessage, var/AhelpKey)
	var/UserInput=input("What do you want to say to [who.key]?") as text|null
	if(src.AdminHelpMute)
		src<<"Your ability to send admin helps has been suspended."
		return
	if(UserInput)
		for(var/mob/Players/Q in world)
			if(Q.Admin)
				if(Q!=src&&Q!=who)
					Q<<"<font color=#00FF99><b>(Admin PM)</b></font> <a href=?src=\ref[src];action=MasterControl;do=PM2;>[src.key]</a href> to <a href=?src=\ref[who];action=MasterControl;do=PM2>[who.key]</a href> :[UserInput]"
		src<<"<font color=#00FF99><b>(Admin PM)</b></font>- To  <a href=?src=\ref[who];action=MasterControl;do=PM2;>[who.key]</a href> :[UserInput]"
		who<<"<font color=#00FF99><b>(Admin PM)</b></font>- From  <a href=?src=\ref[src];action=MasterControl;do=PM2;>[src.key]</a href> :[UserInput]"
		for(var/Admin_Help_Object/M in AdminHelps)
			if( (M.AdminHelp_Message == AhelpMessage) && (M.Character_Key == AhelpKey) )
				AdminHelps.Remove(M)

mob/proc/PM2(var/mob/who)
	var/UserInput = input("What do you want to say to [who.key]?") as text|null
	if(src.AdminHelpMute)
		src<<"Your ability to send admin helps has been suspended."
		return
	if(UserInput)
		for(var/mob/Players/Q in world)
			if(Q.Admin)
				if(Q!=src&&Q!=who)
					Q<<"<font color=#00FF99><b>(Admin PM)</b></font> <a href=?src=\ref[src];action=MasterControl;do=PM2;>[src.key]</a href> to <a href=?src=\ref[who];action=MasterControl;do=PM2;>[who.key]</a href> :[UserInput]"
		Log("AdminPM","(Admin PM from [src.key] to [who.key]): [UserInput]")
		src<<output("<font color=#00FF99><b>(Admin PM)</b></font>- To  <a href=?src=\ref[who];action=MasterControl;do=PM2;>[who.key]</a href> :[UserInput]", "output")
		who<<output("<font color=#00FF99><b>(Admin PM)</b></font>- From  <a href=?src=\ref[src];action=MasterControl;do=PM2;>[src.key]</a href> :[UserInput]", "output")
		src<<output("<font color=#00FF99><b>(Admin PM)</b></font>- To  <a href=?src=\ref[who];action=MasterControl;do=PM2;>[who.key]</a href> :[UserInput]", "oocchat")
		who<<output("<font color=#00FF99><b>(Admin PM)</b></font>- From  <a href=?src=\ref[src];action=MasterControl;do=PM2;>[src.key]</a href> :[UserInput]", "oocchat")
		src<<output("<font color=#00FF99><b>(Admin PM)</b></font>- To  <a href=?src=\ref[who];action=MasterControl;do=PM2;>[who.key]</a href> :[UserInput]", "icchat")
		who<<output("<font color=#00FF99><b>(Admin PM)</b></font>- From  <a href=?src=\ref[src];action=MasterControl;do=PM2;>[src.key]</a href> :[UserInput]", "icchat")
		src<<output("<font color=#00FF99><b>(Admin PM)</b></font>- To  <a href=?src=\ref[who];action=MasterControl;do=PM2;>[who.key]</a href> :[UserInput]", "loocchat")
		who<<output("<font color=#00FF99><b>(Admin PM)</b></font>- From  <a href=?src=\ref[src];action=MasterControl;do=PM2;>[src.key]</a href> :[UserInput]", "loocchat")


mob/Host/verb
	Reboot()
		set category="Update"
		if(Alert("You sure you want to reboot the server?"))
			Log("Admin","[ExtractInfo(usr)] (host) rebooted the server.")
			for(var/mob/Players/Q in world)
				if(Q.Savable&&Q.client!=null)
					Q.client.SaveChar()
			BootWorld("Save")
			usr.Rebooter=1
			world<<"<font size=2><font color=#FFFF00>Server is rebooting in 60 seconds. Please stop all actions at this time."
			sleep(300)
			world<<"<font size=2><font color=#FFFF00>Reboot in 30 seconds."
			sleep(150)
			world<<"<font size=2><font color=#FFFF00>Reboot in 15 seconds."
			sleep(150)
			world.Reboot()
	Shutdown()
		set category="Update"
		if(Alert("You sure you want to shutdown the server?"))
			for(var/mob/Players/Q in world)
				if(Q.Savable&&Q.client!=null)
					Q.client.SaveChar()
			BootWorld("Save")
			usr.Rebooter=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] (host) is shutting down the server in 60 seconds.")
			world<<"<font size=2><font color=#FFFF00>Shutting down in 60 seconds. Please stop all actions at this time."
			sleep(600)
			shutdown()
	UpdateGame(var/F as file)
		set category="Update"
		fcopy(F,"[F]")
		Log("Admin","[ExtractInfo(usr)] used Update, filename is [F].")
	CoderAnnounce(msg as text)
		set category="Update"
		world<<"<hr><center><b>[key] (Coder)</b> announces:<br>[msg]<br><hr>"

mob/Rewarder/verb
	RewardRPP(mob/Players/P in world)
		set category="Rewarder"
		var/option=input("Reward this person?","[P]'s emote count: [P.AutoReward["RPFreq"]]") in list("No","Yes")
		if(option=="No")
			return
		if(option=="Yes")
			var/OldBase=P.RewardPoints
			var/RPPGotten=BaseReward
			var/RPPMult=1
			var/RPRankSelected=1
			var/RiskSelected=1
			switch(input("How would you rank this RP?", "Assess Player") as null|anything in list("Bad","Okay","Average","Good","Great","Exceptional","Don't reward"))
				if("Bad")
					RPPMult*=0.25
					RPRankSelected*=0.25
				if("Okay")
					RPPMult*=0.5
					RPRankSelected*=0.5
				if("Average")
					RPPMult*=0.75
					RPRankSelected*=0.75
				if("Good")
					RPPMult*=1
					RPRankSelected*=1
				if("Great")
					RPPMult*=1.25
					RPRankSelected*=1.25
				if("Exceptional")
					RPPMult*=1.5
					RPRankSelected*=1.5
				if("Don't reward")
					return
			switch(input("What was the risk involved?", "Assess Player") as null|anything in list("Casual Social","Meaningful Social/Casual Sparring","Meaningful Sparring/Character Development","Plot Advancing/Dangerous","High Risk","Highly Dangerous","Immensely Dangerous","Insanely Dangerous","Death-Defying","Cancel"))
				if("Casual Social")
					RPPMult*=0.25
					RiskSelected*=0.25
				if("Meaningful Social/Casual Sparring")
					RPPMult*=0.5
					RiskSelected*=0.5
				if("Meaningful Sparring/Character Development")
					RPPMult*=0.75
					RiskSelected*=0.75
				if("Plot Advancing/Dangerous")
					RPPMult*=1
					RiskSelected*=1
				if("High Risk")
					RPPMult*=1.25
					RiskSelected*=1.25
				if("Highly Dangerous")
					RPPMult*=1.5
					RiskSelected*=1.5
				if("Immensely Dangerous")
					RPPMult*=1.75
					RiskSelected*=1.75
				if("Insanely Dangerous")
					RPPMult*=2
					RiskSelected*=2
				if("Death-Defying")
					RPPMult*=3
					RiskSelected*=3
				if("Cancel")
					return
			RPPGotten*=RPPMult
			P.RewardPoints+=RPPGotten
//			P.RewardPoints+=250 Commented out due to removal of minimum reward for this wipe (and beyond?)
			if(P.RewardPoints!=OldBase)
				P.Rewarded="<FONT COLOR=00FF40>[TimeStamp()]</FONT>"
				var/counter=0
				gotohere
				counter++
				var/logfinder=file("Saves/PlayerLogs/[P.key]/LogTemp[counter]")
				if(fexists(logfinder))
					fcopy(logfinder,"Saves/PlayerLogs/[P.key]/LogArchive[counter]")
					fdel(logfinder)
					goto gotohere
				else
					Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] statpoints from [OldBase] to [P.RewardPoints]. [counter -1] logs cleared. They had [P.AutoReward["RPFreq"]] emotes with a total character count of [P.AutoReward["RPChara"]]. The RPP total multiplier was [RPPMult]x (Rank Multi: [RPRankSelected], Risk Multi: [RiskSelected].")
					Log("Rewarder","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] statpoints from [OldBase] to [P.RewardPoints]. [counter -1] logs cleared. They had [P.AutoReward["RPFreq"]] emotes with a total character count of [P.AutoReward["RPChara"]]. The RPP total multiplier was [RPPMult]x (Rank Multi: [RPRankSelected], Risk Multi: [RiskSelected].")
					P.AutoReward["RPFreq"]=0
					P.AutoReward["RPChara"]=0

	ManualReward(mob/Players/P in world)
		set category="Rewarder"
		var/option=input("Use this if you messed up during rewarding.","[P]") in list("Nothing","Set RPP", "Add RPP")
		if(option=="Nothing")return

		if(option=="Set RPP")
			var/OldBase=P.RewardPoints
			P.RewardPoints=input(usr,"Use this to set their RPP to the value you put in.\nTheir current stat points is [P.RewardPoints]") as num
			if(P.RewardPoints!=OldBase)
				P.Rewarded="[TimeStamp()] (MRS:[P.RewardPoints]"
				Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] statpoints from [OldBase] to [P.RewardPoints]")
				Log("Rewarder","[ExtractInfo(usr)] set [ExtractInfo(P)]'s RPP from [OldBase] to [P.RewardPoints]")

		if(option=="Add RPP")
			var/OldBase=P.RewardPoints
			P.RewardPoints+=input(usr,"This command will add whatever you input to their current total.\nTheir current stat points is [P.RewardPoints]") as num
			if(P.RewardPoints!=OldBase)
				P.Rewarded="[TimeStamp()] (MRA:[P.RewardPoints-OldBase])"
				Log("Admin","[ExtractInfo(usr)] added [ExtractInfo(P)] statpoints from [OldBase] to [P.RewardPoints]")
				Log("Rewarder","[ExtractInfo(usr)] added to [ExtractInfo(P)]'s RPP from [OldBase] to [P.RewardPoints]")

	RewarderWho()
		set category="Rewarder"
		var/View={"<html><head><title>Who</title><body><font size=3><font color=red>Player Panel:<hr><font size=2><font color=black>"}
		var/list/people=new
		for(var/mob/M in world)
			if(M.client)
				people.Add(M.key)
		var/list/sortedpeople=dd_sortedTextList(people,0)
		var/online=0
		if(usr.Rewarder)
			View+={"
					<table border=1 cellspacing=6>
					<tr>
					<th><font size=2>Key(IC Name)/Panel</th>
					<th><font size=2>Last Rewarded:</th>
					<th><font size=2>Emote Counter:(Emotes Made/Total Length)</th>
					</tr>"}
			for(var/x in sortedpeople)
				for(var/mob/M in world)
					if(M.key==x)
						online++
						View+={"<tr>
							<td><font size=2>[M.key] ([M.name])/(<a href=?src=\ref[M];action=RewardControl>x</a href>)</td>
							<td><font size=2>[M.Rewarded]</td>
							<td><font size=2>[M.AutoReward["RPFreq"]]/[M.AutoReward["RPChara"]]</td>
							</tr>"}
						break
			View+={"</table"><br>"}
		else

			for(var/x in sortedpeople)
				online++
				View+="[x]<br>"
		View+="<font color=green><b>Online:</b> [online]"
		usr<<browse("[View]","window=Logrw;size=400x450")

	RewarderChat(c as text)
		set category = "Rewarder"
		for(var/mob/Players/M in world)
			if(M.Admin||M.Rewarder)
				if(M.Timestamp)
					M<<"<b><font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=gray>Rewarder Chat:<font color=white>[usr.key]:</b><font color=green> [c]"
				else
					M<<"<b><font color=gray>Rewarder Chat:<font color=white>[usr.key]:</b><font color=green> [c]"

	RewarderLogs()
		set category="Rewarder"
		usr.SegmentLogs("Saves/RewarderLogs/Log")

	RewarderPlayerLog(mob/Players/M in world)
		set category="Rewarder"
		usr.SegmentLogs("Saves/PlayerLogs/[M.key]/Log")
	RewarderPlayerTempLog(mob/Players/M in world)
		set category="Rewarder"
		usr.SegmentTempLogs("Saves/PlayerLogs/[M.key]/Log")
	RewarderPlayerArchiveLog(mob/Players/M in world)
		set category="Rewarder"
		usr.SegmentArchiveLogs("Saves/PlayerLogs/[M.key]/Log")

mob/Admin1/verb
/*	ECMenu(mob/Players/P in world)
		set category="Admin"
		var/list/stattypes=("Strength","Endurance","Force","Resistance","Offense","Defense","Speed","Regeneration","Recovery","Anger","BaseMod")
*/

	DiggingMultiplier()
		set category="Admin"
		global.DiggingMultiplier=input("Input a digging multiplier. Affects both manual and automatic forms of digging.") as num
		if(global.DiggingMultiplier<=0)
			global.DiggingMultiplier=0.01

	Rewarders()
		set category="Admin"
		var/list/rewarders=new
		rewarders.Add(Rewarders)
		for(var/x in rewarders)
			for(var/mob/M in world)
				if(M.client)
					if(M.key==x)
						usr<<"[x]<font color=green> (Online)"
						rewarders.Remove(x)
		for(var/y in rewarders)
			usr<<"[y]"

	RewarderChat(c as text)
		set category = "Admin"
		for(var/mob/Players/M in world)
			if(M.Admin||M.Rewarder)
				if(M.Timestamp)
					M<<"<b><font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=gray>Rewarder Chat:<font color=white>[usr.key]:</b><font color=green> [c]"
				else
					M<<"<b><font color=gray>Rewarder Chat:<font color=white>[usr.key]:</b><font color=green> [c]"

	AdminRaces()
		set category="Admin"
		var/list/lolz=new
		for(var/mob/Players/Q in world)
			if(!(lolz.Find(Q.Race)))
				lolz.Add("[Q.Race]")
				lolz["[Q.Race]"]=1
			else
				lolz["[Q.Race]"]++
		if(lolz)
			for(var/x in lolz)
				usr<<"[x] - [lolz[x]]"
	SaveTheDay()
		set category="Admin"
		for(var/mob/Players/Q in world)
			if(Q.Rebooter)
				spawn()del(Q.client)
			else
				Q<<"Rejoice, Emiya Shirou, for the server will not die tonight..."
	Planets()
		set category="Admin"
		var/list/lolz=new
		for(var/mob/Players/Q in world)
			if(!(lolz.Find("[Q.z]")))
				lolz.Add("[Q.z]")
				lolz["[Q.z]"]=1
			else
				lolz["[Q.z]"]++
		if(lolz)
			for(var/x in lolz)
				var/blah=x
				if(global.JinxMap)
					if(x=="1")
						blah="Tropic Thunder"
					if(x=="2")
						blah="Tropic Thunder Underground"
					if(x=="3")
						blah="Tropic Thunder Event"
					if(x=="4")
						blah="California Underwater"
					if(x=="5")
						blah="California Underwater Underground"
					if(x=="6")
						blah="California Underwater Event"
					if(x=="7")
						blah="Dinosaur Games"
					if(x=="8")
						blah="Dinosaur Games Underground"
					if(x=="9")
						blah="Dinosaur Games Event"
					if(x=="10")
						blah="SPACE"
					if(x=="11")
						blah="Hell"
					if(x=="12")
						blah="Checkpoint"
					if(x=="13")
						blah="Heaven"
					if(x=="14")
						blah="Void"
					if(x=="15")
						blah="Login Screen"
					if(x=="16")
						blah="Ships"
				else

					if(x=="6")
						blah="Earth"
					if(x=="3")
						blah="Namek"
					if(x=="5")
						blah="Vegeta"
					if(x=="4")
						blah="Ice"
					if(x=="7")
						blah="Arconia"
					if(x=="1")
						blah="Faggotopia"
					if(x=="2")
						blah="Damn Nigga"
					if(x=="8")
						blah="Ethiopia"
					if(x=="9")
						blah="Jumpyhood"
					/*if(x=="6")
						blah="Heaven"
					if(x=="7"||x=="21")
						blah="Hell"
					if(x=="8")
						blah="Afterlife"
					if(x=="9")*/
						blah="Android Ship/Void"
					if(x=="10")
						blah="Kaioshin Planet"
					if(x=="11")
						blah="EG Tower"
					if(x=="12")
						blah="Space"
					if(x=="13")
						blah="Final Realms"
					if(x=="14")
						blah="Alien Miniplanets"
					if(x=="15")
						blah="Earth Underground"
					if(x=="16")
						blah="HBTC"
					if(x=="17")
						blah="Pods/Ships/Pocket Dimensions"
					if(x=="18")
						blah="Sanctuary"
					if(x=="19")
						blah="Event Map"
					if(x=="20")
						blah="Sanctuary Underground"
					if(x=="22")
						blah="Vegeta Underground"
					if(x=="23")
						blah="Namek Underground"
					if(x=="24")
						blah="Icer Underground"
					if(x=="25")
						blah="Arconia Underground"
					if(x=="26")
						blah="Moltaris"
				usr<<"[blah] - [lolz[x]]"

	MultiKeyCheck()
		set category="Admin"
		usr<<"checking for multi keys.."
		var/list/Found=new
		for(var/mob/Players/M in world)
			if(Found.Find(M))continue
			if(M.client)
				for(var/mob/M2 in world)
					if(!M2.client)continue
					if(!M2)continue
					if(M == M2)continue
					if(M.client.address == M2.client.address)
						Found += M
						Found += M2
						usr << "[M.client.address]: [M.key]([M.client.computer_id]) / [M2.key]([M.client.computer_id]) "

	/*DevPointUpdate()
		set category="Admin"
		set name = "Dev Point Assign"
		usr<<"Assigning Devpoints"
		var/varPlayerAmmountChanged = 0
		var/varPlayerAmmountChecked = 0
		for(var/mob/Players/M in world)
			varPlayerAmmountChecked++
			if(M.TotalDevPoints < WorldDevPoints)
				M.TotalDevPoints +=2
				M.SpendableDevPoints +=2
				varPlayerAmmountChanged++
		usr << "Total Ammount of Players Checked:[varPlayerAmmountChecked]"
		usr << "Total Ammount of Players With Dev Points Added:[varPlayerAmmountChanged]"*/


	AFKBoot()
		set category="Admin"
		var/blah=input("For how long?","In hours.")as num
		if(blah)
			world<<"AFK Boot..."
			for(var/mob/Players/M in world)
				if((M.client.inactivity/360)>blah)
					world<<"[M] has been booted for being inactive for [client.inactivity/360] hours."
					del(M)
			world<<"AFK Boot finished."

	MathTestVerb()
		set category="Admin"
		var/blah=input("This will do some math functions, maybe.")as num
		var/logmaths=log(10,blah)
		var/squarerootmaths=sqrt(blah)
		var/squarerootdoublemaths=sqrt(sqrt(blah))
		usr<<"Log Function:[logmaths] Square Root Fuction:[squarerootmaths] Double Square Root Function:[squarerootdoublemaths]"



	BackupPlayers()
		var/playersbackedup=0
		set category="Admin"
		set name="Backup Players"
		for(var/mob/Players/M in world)
			if(M.client&&M.Savable)
				playersbackedup++
				M.client.BackupSaveChar()
		Log("Admin","[ExtractInfo(usr)] has backed up all logged in characters (Total Backed Up:[playersbackedup]).")

	TurfFlythru()
		set category="Admin"
		if(usr.IgnoreFlyOver)
			usr.IgnoreFlyOver=0
			Log("Admin","[ExtractInfo(usr)] has disabled their Ignore FlyOverAble flag.")
		else
			usr.IgnoreFlyOver=1
			Log("Admin","[ExtractInfo(usr)] has enabled their Ignore FlyOverAble flag.")

	TurfInvincibleToggle(var/mob/M in world)
		set category="Admin"
		if(M.TurfInvincible)
			M.TurfInvincible=0
			Log("Admin","[ExtractInfo(usr)] has disabled [M.key]'s Build Invincible Turfs flag.")
		else
			M.TurfInvincible=1
			Log("Admin","[ExtractInfo(usr)] has enable [M.key]'s Build Invincible Turfs flag.")

	MoonControl()
		set category="Admin"
		set name="Set Moon Status"
		var/mooncontrolvar=input("Pick a moon to toggle.") in list("Cancel","All","Earth","Vegeta","Arconia","Sanctuary")
		switch(mooncontrolvar)
			if("Cancel")
				return
			if("All")
				if(MoonsActive==0)
					MoonsActive=1
					Log("Admin","[ExtractInfo(usr)] has enabled all moons.")
				else if(MoonsActive==1)
					MoonsActive=0
					Log("Admin","[ExtractInfo(usr)] has disabled all moons.")
			if("Earth")
				if(EarthsMoon==0)
					EarthsMoon=1
					Log("Admin","[ExtractInfo(usr)] has enabled Earth's Moon.")
				else if(EarthsMoon==1)
					EarthsMoon=0
					Log("Admin","[ExtractInfo(usr)] has disabled Earth's Moon.")
			if("Vegeta")
				if(VegetasMoon==0)
					VegetasMoon=1
					Log("Admin","[ExtractInfo(usr)] has enabled Vegeta's Moon.")
				else if(VegetasMoon==1)
					VegetasMoon=0
					Log("Admin","[ExtractInfo(usr)] has disabled Vegeta's Moon.")
			if("Arconia")
				if(ArconiasMoons==0)
					var/moonadds=input("Restore how many moons? No more then 2 pls.")as num
					ArconiasMoons=moonadds
					Log("Admin","[ExtractInfo(usr)] has enabled [moonadds] moons for Arconia.")
				else if(ArconiasMoons>0)
					var/moonadds=input("Remove how many moons? No more then 2 pls.")as num
					ArconiasMoons-=moonadds
					if(ArconiasMoons<0)
						ArconiasMoons=0
					Log("Admin","[ExtractInfo(usr)] has disabled [moonadds] moons for Arconia.")
			if("Sanctuary")
				if(SanctuarysMoon==0)
					SanctuarysMoon=1
					Log("Admin","[ExtractInfo(usr)] has enabled Sanctuary's Moon.")
				else if(SanctuarysMoon==1)
					SanctuarysMoon=0
					Log("Admin","[ExtractInfo(usr)] has disabled Sanctuary's Moon.")
	Dayset(A as num)
		set category="Admin"
		set name="Set Current Day"
		global.Day=A
//		SetNewTierSCap()
		Log("Admin","[ExtractInfo(usr)] has set the current day to [A].")
	Dayspeedset(A as num)
		set category="Admin"
		set name="Set Day Speed"
		global.Day_Speed=A
		Log("Admin","[ExtractInfo(usr)] has set the Day Speed to [A]x.")
	ToggleOverview()
		set category="Admin"
		if(usr.Overview==1)
			usr.Overview=0
			usr<<"Personal Overview disabled."
		else if(usr.Overview==0)
			usr.Overview=1
			usr<<"Personal Overview enabled."
	RestorePlanet()
		var/list/planetlist=list("Cancel")
		set category="Admin"
		if(!Planets.Find("Earth"))
			planetlist.Add("Earth")
		if(!Planets.Find("Namek"))
			planetlist.Add("Namek")
		if(!Planets.Find("Vegeta"))
			planetlist.Add("Vegeta")
		if(!Planets.Find("Ice"))
			planetlist.Add("Ice")
		if(!Planets.Find("Arconia"))
			planetlist.Add("Arconia")
		if(!Planets.Find("Sanctuary"))
			planetlist.Add("Sanctuary")
		var/obj/Z=input("")in planetlist
		if(Z=="Cancel")
			return
		else if(Z=="Earth")
			Planets.Add("Earth")
			var/obj/planet = text2path("/obj/Planets/Earth")
			new planet(locate(rand(1,500),rand(1,500),12))
			Log("Admin","[Z] has been successfully restored by [ExtractInfo(usr)].")
			return
		else if(Z=="Namek")
			Planets.Add("Namek")
			var/obj/planet = text2path("/obj/Planets/Namek")
			new planet(locate(rand(1,500),rand(1,500),12))
			Log("Admin","[Z] has been successfully restored by [ExtractInfo(usr)].")
			return
		else if(Z=="Vegeta")
			Planets.Add("Vegeta")
			var/obj/planet = text2path("/obj/Planets/Vegeta")
			new planet(locate(rand(1,500),rand(1,500),12))
			Log("Admin","[Z] has been successfully restored by [ExtractInfo(usr)].")
			return
		else if(Z=="Ice")
			Planets.Add("Ice")
			var/obj/planet = text2path("/obj/Planets/Ice")
			new planet(locate(rand(1,500),rand(1,500),12))
			Log("Admin","[Z] has been successfully restored by [ExtractInfo(usr)].")
			return
		else if(Z=="Arconia")
			Planets.Add("Arconia")
			var/obj/planet = text2path("/obj/Planets/Arconia")
			new planet(locate(rand(1,500),rand(1,500),12))
			Log("Admin","[Z] has been successfully restored by [ExtractInfo(usr)].")
			return
		else if(Z=="Sanctuary")
			Planets.Add("Sanctuary")
			var/obj/planet = text2path("/obj/Planets/Sanctuary")
			new planet(locate(rand(1,500),rand(1,500),12))
			Log("Admin","[Z] has been successfully restored by [ExtractInfo(usr)].")
			return
	RaceSpawnControl()
		set name="Race Spawns"
		set category="Admin"
		var/list/spawnselection=list("Change Race Spawn","Restore Default Spawn","Cancel")
		var/obj/selection=input("")in spawnselection
		var/list/planets=list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android")
		switch(selection)
			if("Change Race Spawn")
				var/list/changespawncontrol=list("Cancel")
				for(var/racespawncheck in list("Human","Makyo","Spirit Doll","Half Saiyan","Quarter Saiyan","Popo","Namekian","Saiyan","Tsufurujin","Kaio","Demon","Demi","Alien","Heran","Lycan","Vampire","Android","Changeling","Half Demon","Youkai","Neko", "Golem", "Sage","Schrodinger", "Manakete","Galvan","Makyo","Trueseer"))
					if(!Spawns.Find("[racespawncheck]"))
						changespawncontrol.Add("[racespawncheck]")
				var/obj/racespawnselection=input("")in changespawncontrol
				if(racespawnselection=="Cancel")
					return
				var/obj/spawnpoint=input("")in planets
				Spawns.Add("[racespawnselection]")
				Spawns.Add("[racespawnselection][spawnpoint]")
				Log("Admin","[ExtractInfo(usr)] has changed [racespawnselection]'s spawn to [spawnpoint].")
			if("Restore Default Spawn")
				var/list/changespawncontrol=list("Cancel")
				for(var/racespawncheck in list("Human","Makyo","Spirit Doll","Half Saiyan","Quarter Saiyan","Popo","Namekian","Saiyan","Tsufurujin","Kaio","Demon","Demi","Alien","Heran","Lycan","Vampire","Android","Changeling","Half Demon","Youkai","Neko", "Golem", "Sage","Schrodinger","Manakete","Galvan","Makyo","Trueseer"))
					if(Spawns.Find("[racespawncheck]"))
						changespawncontrol.Add("[racespawncheck]")
				var/obj/racespawnselection=input("")in changespawncontrol
				if(racespawnselection=="Cancel")
					return
				Spawns.Remove("[racespawnselection]")
				for(var/removalcheck in list("Earth","Vegeta","Namek","Arconia","Sanctuary","Ice","Heaven","Hell","Afterlife","Android"))
					if(Spawns.Find("[racespawnselection][removalcheck]"))
						Spawns.Remove("[racespawnselection][removalcheck]")
				Log("Admin","[ExtractInfo(usr)] has changed [racespawnselection]'s spawn back to default.")

	RaceLockControl()
		set name="Racial Locks"
		set category="Admin"
		var/list/controlselection=list("Add Race Lockout","Remove Race Lockout","Cancel")
		var/obj/selection=input("")in controlselection
		switch(selection)
			if("Add Race Lockout")
				var/list/addracelockcontrol=list()
				for(var/racelockcheck in GetAllRaces())
					if(!("[racelockcheck]" in LockedRaces))
						addracelockcontrol += "[racelockcheck]"
				for(var/r in LockedRaces) addracelockcontrol -= r
				var/racelockselection=input("")in addracelockcontrol | null
				if(racelockselection)
					if(racelockselection in LockedRaces)
						src << "[racelockselection] is already locked."
						return
					LockedRaces["[racelockselection]"] = list()
					src << "You've added [racelockselection] to the locked races. Use LockedRacesOptions to add keys."
					Log("Admin","The [racelockselection] race has been locked out by [ExtractInfo(usr)].")

			if("Remove Race Lockout")
				var/obj/racelockselection=input("")in LockedRaces | null
				if(racelockselection)
					LockedRaces -= racelockselection
					src << "You've removed [racelockselection] from the locked races."
					Log("Admin","The [racelockselection] race has had its lockout removed by [ExtractInfo(usr)].")
			if("Cancel")
				return

	LockedRacesOptions()
		set category="Admin"
		var/blah=input("Selection an option.","Locked Races") in list("View","Add","Remove","Add Rare Class Key","Remove Rare Class Key")
		if(blah=="View")
			for(var/x in LockedRaces)
				for(var/e in LockedRaces[x])
					usr<<"[x] : [e]"
		if(blah=="Add")
			var/list/options = list()
			for(var/index in LockedRaces) options += "[index]"
			var/unlock=input("Add to what list?","Locked Races") in options | null
			if(unlock)
				var/wut=input("Add the key to [unlock] list.","Adding")as null|text
				if(wut)
					LockedRaces[unlock] |= wut
					Log("Admin","<font color=green>[ExtractInfo(usr)] added to the LockedRaces list: [unlock] to [wut].")

		if(blah=="Remove")
			var/list/options = list()
			for(var/index in LockedRaces) options += "[index]"
			var/unlock=input("Remove from what list?","Locked Races") in options | null
			if(unlock)
				var/list/Keys= LockedRaces[unlock]

				var/wut=input("Remove the key to [unlock] list.","Removing") in Keys | null
				if(wut&&wut!="Cancel")
					LockedRaces[unlock] -= wut
					Log("Admin","<font color=green>[ExtractInfo(usr)] removed from the LockedRaces list: [unlock] to [wut].")

		if(blah=="Add Rare Class Key")
			var/newkey = input("Add key to rare classes list?","Add") as text | null
			if(newkey)
				UnlockClasses |= newkey
				src << "[newkey] can now make as any locked class. This will reset on reboot."
		if(blah=="Remove Rare Class Key")
			var/newkey = input("Remove key from rare class unlocks?","Add") as text | null
			if(newkey)
				if(newkey in UnlockClasses) src << "You remove [newkey] from rare classes unlocks."
				else src << "[newkey] was not in rare class unlocks."
				UnlockClasses -= newkey


	FPSControl(fpsadjust as num)
		set category="Admin"
		world.fps=fpsadjust
		Log("Admin","World FPS adjusted to [fpsadjust] by [ExtractInfo(usr)].")

	MusicPlayerLocal(musicfile as sound)
		set category="Admin"
		var/musiccount=0
		for(var/mob/Players/P in view(20,usr))
			if(P.MusicToggle=="On")
				P << sound(musicfile, repeat = 0, wait = 0, channel = 777, volume = 70)
				musiccount++
			else
				continue
		usr<<"Successfully played [musicfile] for [musiccount] players near you."

	MusicPlayerGlobal(musicfile as sound)
		set category="Admin"
		var/musiccount=0
		for(var/mob/Players/P in world)
			if(P.MusicToggle=="On")
				P << sound(musicfile, repeat = 0, wait = 0, channel = 777, volume = 70)
				musiccount++
			else
				continue
		usr<<"Successfully played [musicfile] for [musiccount] players."
	/*	var/musicfile=input(usr,"Pick a song! MIDI or OGGs under 2MB only! This plays for everyone in the world.","Soooooooong")as file
		for(var/mob/Players/P in world)
			if(P.MusicToggle=="On")
				P<<sound(musicfile)
			else
				continue
		usr<<"Successfully played [musicfile]."*/


	SpaceTravelRequirement()
		set category="Admin"
//		global.YearReq=input("Which year should players be allowed to go to spaaaaaaaace?") as num
//		Log("Admin","[ExtractInfo(usr)] set the Year Requirement for going to spaaaaaace to [global.YearReq].")
		if(global.SpaceTravel==0)
			global.SpaceTravel=1
			Log("Admin","[ExtractInfo(usr)] has activated Space Travel.")
		else if(global.SpaceTravel==1)
			global.SpaceTravel=0
			Log("Admin","[ExtractInfo(usr)] has deactivated Space Travel.")

	DustToggle()
		set category="Admin"
		set name="Dust Toggle"
		if(global.DustControl==1)
			global.DustControl=0
			Log("Admin","[ExtractInfo(usr)] has disabled dust generation.")
		else
			global.DustControl=1
			Log("Admin","[ExtractInfo(usr)] has enabled dust generation.")

	AdminInviso()
		set category="Admin"
		if(usr.AdminInviso)
			usr<<"<font color=red>Admin Inviso off."
			usr.AdminInviso=0
			usr.invisibility=0
			usr.see_invisible =0
		else
			usr<<"<font color=green>Admin Inviso on."
			usr.AdminInviso=1
			usr.invisibility=100
			usr.see_invisible=101

	AdminAssess(var/mob/M in world)
		set category="Admin"
		set name="Admin Assess"
		usr<<browse(M.GetAssess(),"window=Assess;size=275x650")

	ManuallyCheckLog(var/x as text)
		set category="Admin"
		usr.SegmentLogs("Saves/PlayerLogs/[x]/Log")

	ManuallyCheckTempLog(var/x as text)
		set category="Admin"
		usr.SegmentTempLogs("Saves/PlayerLogs/[x]/Log")

	ManuallyCheckSkillLog(var/x as text)
		set category="Admin"
		usr.SegmentSkillLogs("Saves/PlayerLogs/[x]/Log")
	/*ViewAdminNotes()
		set category="Admin"
		usr<<browse(AdminNotes,"window=AdminNotes;size=470x550")*/
	EditAdminNotes()
		set category="Admin"
		if(!Writing["AdminNotes"])
			Writing["AdminNotes"]=1
			for(var/mob/M) if(M.Admin<=4) M<<"[usr] is editing the admin notes..."
			AdminNotes=input(usr,"Notes!","Edit Notes",AdminNotes) as message
			for(var/mob/F) if(F.Admin<=4) F<<"[usr] is done editing the admin notes..."
			Writing["AdminNotes"]=null
			BootFile("Misc","Save")
		else usr<<"<b>Someone is already editing the Admin Notes."

/*	EditNotes()
		set category="Admin"
		if(!Writing["Notes"])
			Writing["Notes"]=1
			for(var/mob/M) if(M.Admin) M<<"[usr] is editing the log-in notes..."
			Notes=input(usr,"Notes!","Edit Notes",Notes) as message
			for(var/mob/F) if(F.Admin) F<<"[usr] is done editing the log-in notes..."
			Writing["Notes"]=null
			BootFile("Misc","Save")
		else usr<<"<b>Someone is already editing the log-in notes." */

	ToggleOOCWorld()
		set category="Admin"
		Allow_OOC=!Allow_OOC
		if(Allow_OOC)
			world<<"OOC Channel is <font color=green>enabled</font color>!"
		else
			world<<"OOC Channel is <font color=red>disabled</font color>!"
		Log("Admin","[ExtractInfo(usr)] toggled global OOC!")
	ViewSubmittedReports()
		set category="Admin"
		winshow(src,"reportview",1)
	Forms()
		set category="Admin"
		usr<<"<b>Unlocked Forms:</b>"
		for(var/mob/Players/M in world)
			if(M.ssj["unlocked"]>0)
				usr<<"- [M]([M.key]) -[M.Class] Super Saiyan [M.ssj["unlocked"]]"
			if(M.trans["unlocked"]>0)
				if(M.Race=="Hollow")
					if(M.trans["unlocked"]==1)
						usr<<"- [M]([M.key]) -[M.Class] Ressurreccion([M.ResType])"
					else
						usr<<"- [M]([M.key]) -[M.Class] Segunda Etapa([M.ResType])"
				else
					usr<<"- [M]([M.key]) -[M.Class] [M.Race] [M.trans["unlocked"]]"
		usr<<"<b>Current Forms:</b>"
		for(var/mob/Players/M in world)
			if(M.ssj["active"]>0)
				usr<<"- [M]([M.key]) -[M.Class] Super Saiyan [M.ssj["active"]]"
			if(M.trans["active"]>0)
				if(M.Race=="Hollow")
					if(M.trans["active"]==1)
						usr<<"- [M]([M.key]) -[M.Class] Ressurreccion([M.ResType])"
					else if(M.trans["active"]==2)
						usr<<"- [M]([M.key]) -[M.Class] Segunda Etapa([M.ResType])"
				else
					usr<<"- [M]([M.key]) -[M.Class] [M.Race] [M.trans["active"]]"
			if(M.bioform2==1 && M.bioform3==0)
				usr<<"- [M]([M.key]) - Semi-Perfect Bio Android"
			if(M.bioform2==1 && M.bioform3==1)
				usr<<"- [M]([M.key]) - Perfect Bio Android"
			if(M.MajinForm==1)
				usr<<"- [M]([M.key]) - Super Absorbed Majin"
			if(M.MajinForm==2)
				usr<<"- [M]([M.key]) - Ascended Super Absorbed Majin"

	Alerts()
		set category="Admin"
		set name="(Un)Mute Admin Alerts"
		for(var/obj/Communication/x in usr)
			x.AdminAlerts=!x.AdminAlerts
			if(x.AdminAlerts) usr<<"You turn your AdminAlerts <font color=green>on</font color>."
			else usr<<"You turn your AdminAlerts <font color=red>off</font color>."

	RewardAlerts()
		set category="Admin"
		set name="(Un)Mute Reward Alerts"
		for(var/obj/Communication/x in usr)
			x.RewardAlerts=!x.RewardAlerts
			if(x.RewardAlerts) usr<<"You turn your RewardAlerts <font color=green>on</font color>."
			else usr<<"You turn your RewardAlerts <font color=red>off</font color>."

	AdminPM(mob/M in world)
		set category="Admin"
		usr.PM(M)

	PlayerLoginLogs()
		set category="Admin"
		var/list/files=new
		for(var/File in flist("Saves/LoginLogs/"))
			files.Add(File)
		files.Add("Cancel")
		var/lawl=input("What one do you want to read?","Rebirth") in files
		if(lawl=="Cancel")
			return
		var/ISF=file2text(file("Saves/LoginLogs/[lawl]"))
		var/View={"<html><head><title>Logs</title><body>
				<font size=3><font color=red>[lawl]<hr><font size=2><font color=black>"}
		View+=ISF
		src<<browse(View,"window=Log;size=500x300")

	AdminLogs()
		set category="Admin"
		usr.SegmentLogs("Saves/AdminLogs/Log")

	RewarderLogs()
		set category="Admin"
		usr.SegmentLogs("Saves/RewarderLogs/Log")

	PlayerLog(mob/Players/M in world)
		set category="Admin"
		usr.SegmentLogs("Saves/PlayerLogs/[M.key]/Log")
	PlayerTempLog(mob/Players/M in world)
		set category="Admin"
		usr.SegmentTempLogs("Saves/PlayerLogs/[M.key]/Log")
	PlayerArchiveLog(mob/Players/M in world)
		set category="Admin"
		usr.SegmentArchiveLogs("Saves/PlayerLogs/[M.key]/Log")
	PlayerSkillLog(mob/Players/M in world)
		set category="Admin"
		usr.SegmentSkillLogs("Saves/PlayerLogs/[M.key]/Log")

	Mute(mob/M in world)
		set category="Admin"
		if(!M.client)
			return
		var/Reason=input("Why are you muting [M]?")as text
		var/Duration=input("Mute Duration?(IN MINUTES)","Rebirth")as num
		if(Alert("Are you sure you want to mute [M] for [Duration] Minutes?"))
			Duration=Value(world.realtime+(Duration*600))
			Punishment("Action=Add&Punishment=Mute&Key=[M.key]&IP=[M.client.address]&ComputerID=[M.client.computer_id]&Duration=[Duration]&User=[usr.key]&Reason=[Reason]&Time=[TimeStamp()]")
			Log("Admin","[ExtractInfo(usr)] muted [M.key]|[M.client.address]|[M.client.computer_id] for [Reason].")
	UnMute()
		set category="Admin"
		var/list/people=list("Cancel")
		var/blah=input("What do you want to unmute?","Rebirth")in list("Entire List","Key","IP","ComputerID","Cancel")
		if(blah=="Cancel")return
		if(blah=="Entire List")
			for(var/x in Punishments)
				if(x["Punishment"]=="Mute")
					people.Add(x["Key"])
			var/person=input("Completely Unmute who?","Rebirth") in people
			if(person=="Cancel")return
			for(var/x in Punishments)
				if(x["Punishment"]=="Mute")
					if(x["Key"]==person)
						Punishments.Remove(list(x))
						Log("Admin","[ExtractInfo(usr)] unmuted(all) [person].")

		else
			for(var/x in Punishments)
				if(x["Punishment"]=="Mute")
					people.Add(x["[blah]"])
			var/person=input("[blah] Unmute who?","Rebirth") in people
			if(person=="Cancel")return
			Punishment("Action=Remove&Punishment=Mute&[blah]=[person]")
			Log("Admin","[ExtractInfo(usr)] unmuted [person].")

	Dead()
		set category="Admin"
		for(var/mob/M) if(M.Dead) usr<<"<font color=green>[M] is dead."


	AdminChat(c as text)
		set category = "Admin"
		for(var/mob/Players/M in world)
			if(M.Admin)
				if(M.Timestamp)
					M<<"<b><font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=cyan>Admin Chat:<font color=white>[usr.key]:</b><font color=green> [c]"
				else
					M<<"<b><font color=cyan>Admin Chat:<font color=white>[usr.key]:</b><font color=green> [c]"

	WeatherControl()
		set category="Admin"
		var/list/planetarealist=list("Cancel")
		for(var/area/Outside/Planet/A in world)
			planetarealist+=A
		var/area/Outside/Planet/PlanetSelect=input("Pick the planet/area you wish to alter the weather of.") in planetarealist
		if(PlanetSelect=="Cancel")
			return
		var/ActionSelect=input("Pick the action you wish to use.") in list("Toggle On/Off","Change Weather","Cancel")
		if(ActionSelect=="Cancel")
			return
		else if(ActionSelect=="Toggle On/Off")
			if(PlanetSelect.WeatherOn==0)
				PlanetSelect.WeatherOn=1
				Log("Admin","[ExtractInfo(usr)] activated weather for [PlanetSelect].")
			else if(PlanetSelect.WeatherOn==1)
				PlanetSelect.WeatherOn=0
				Log("Admin","[ExtractInfo(usr)] deactivated weather for [PlanetSelect]. Note this does not clear current weather icon.")
		else if(ActionSelect=="Change Weather")
			var/WeatherEffectSelect=input("Select a weather effect.") in list("None","Snow","Rain","Fog","Day","Night","Misc")
			var/TypeEffectSelect
			if(WeatherEffectSelect=="Cancel")
				return
			if(WeatherEffectSelect=="None")
				PlanetSelect.icon=null
				return
			if(WeatherEffectSelect=="Snow")
				TypeEffectSelect=input("Select a icon file.") in list('Blizzard.dmi','DarkBlizzard.dmi','NightSnow.dmi','Snow.dmi')
			if(WeatherEffectSelect=="Rain")
				TypeEffectSelect=input("Select a icon file.") in list('BloodRain.dmi','DarkBloodRain.dmi','DarkRain.dmi','DayStorm.dmi','NamekRain.dmi','Rain.dmi','Storm.dmi')
			if(WeatherEffectSelect=="Fog")
				TypeEffectSelect=input("Select a icon file.") in list('DarkFog.dmi','Fog.dmi','Smog.dmi')
			if(WeatherEffectSelect=="Day")
				TypeEffectSelect=input("Select a icon file.") in list('BrightDay.dmi','DarkDay.dmi','GreenDay.dmi','Sunrise.dmi')
			if(WeatherEffectSelect=="Night")
				TypeEffectSelect=input("Select a icon file.") in list('Dark.dmi','Sunset.dmi')
			if(WeatherEffectSelect=="Misc")
				TypeEffectSelect=input("Select a icon file.") in list('Lightning.dmi','NamekUnderwater.dmi','RisingRocks.dmi','SuperDarkness.dmi','Underwater.dmi','Void.dmi','VoidFlash.dmi')
			PlanetSelect.icon=TypeEffectSelect

/*		var/ControType=input("Pick the desired option.")in list("Specific Planet","Cancel")
		switch(ControType)
			if("Cancel")
				return
			if("Specific Planet")
				var/PlanetPicker=input("Pick the desired planet.")in list("Earth","Vegeta","Namek","Arconia","Ice","Sanctuary")
				var/ModePicker=input("Pick the desired weather option.")in list("Toggle On/Off","Change To","Cancel")
				if(ModePicker=="Cancel")
					return
				else if(ModePicker=="Toggle On/Off")
					switch(PlanetPicker)
						if("Earth")
							for(var/area/Outside/Planet/Earth/A in world)
								if(A.layer==5||A.layer==6)
									return
								else if(A.WeatherOn==0)
									A.WeatherOn=1
									Log("Admin","[ExtractInfo(usr)] toggled [PlanetPicker]'s weather on.")
								else if(A.WeatherOn==1)
									A.WeatherOn=0
									Log("Admin","[ExtractInfo(usr)] toggled [PlanetPicker]'s weather off.")
						if("Vegeta")
							for(var/area/Outside/Planet/Vegeta/A in world)
								if(A.layer==5||A.layer==6)
									return
								else if(A.WeatherOn==0)
									A.WeatherOn=1
									Log("Admin","[ExtractInfo(usr)] toggled [PlanetPicker]'s weather on.")
								else if(A.WeatherOn==1)
									A.WeatherOn=0
									Log("Admin","[ExtractInfo(usr)] toggled [PlanetPicker]'s weather off.")*/

	Observe_(atom/A as mob|obj in world)
		set category="Admin"
		set name="Admin Observe"
		Observify(usr,A)
		if(A!=src)
			Log("Admin","[ExtractInfo(usr)] observed [A].")

	IP(mob/Players/M in world)
		set category="Admin"
		if(M)
			if(M.client) usr<<"[M]([M.key]), [M.client.address]"
			for(var/mob/Players/A) if(A.client&&A.key!=M.key) if(M.client.address==A.client.address)
				usr<<"<font size=1 color='red'>   Multikey: [A]([A.key])"
	Delete(atom/A in world)
		set category="Admin"
		if(ismob(A))
			if(A:client)
				Log("Admin","[ExtractInfo(usr)] booted [ExtractInfo(A)].")
				world<<"<font color=#FFFF00>[A] has been booted"
		if(istype(A,/area/))
			usr<<"You can't delete Areas."
			return
		del(A)

	MassTurfUpgrade()
		set category="Admin"
		var/warning=input("WARNING: This will cause significant lag if used improperly. Proceed?")in list("Yes","No")
		if(warning=="No")
			return
		else
			var/simulatedintellevel=input("Input the intel level you wish to upgrade turfs to. Max of 500.")as num
			if(simulatedintellevel>500)
				simulatedintellevel=500
			if(simulatedintellevel<1)
				simulatedintellevel=1
			var/turfupgrademode=input("Select a option.")in list("Upgrade on current z","Upgrade all player made","Upgrade ALL")
			if(turfupgrademode=="Upgrade on current z")
				var/turf/TurfScan
				for(TurfScan in block(locate(1,1,usr.z),locate(world.maxx,world.maxy,usr.z)))
					TurfScan.Health=max(TurfScan.Health,simulatedintellevel*simulatedintellevel*750000)
					TurfScan.LogPEndurance=max(TurfScan.LogPEndurance,simulatedintellevel*17.5)
			if(turfupgrademode=="Upgrade all player made")
				var/turf/TurfScan
				for(TurfScan in Turfs)
					TurfScan.Health=max(TurfScan.Health,simulatedintellevel*simulatedintellevel*750000)
					TurfScan.LogPEndurance=max(TurfScan.LogPEndurance,simulatedintellevel*17.5)
			if(turfupgrademode=="Upgrade ALL")
				var/turf/TurfScan
				for(TurfScan in world)
					TurfScan.Health=max(TurfScan.Health,simulatedintellevel*simulatedintellevel*750000)
					TurfScan.LogPEndurance=max(TurfScan.LogPEndurance,simulatedintellevel*17.5)

	TurfReplace(atom/turfClicked in world)
		set category="Admin"
		var/SaveDemTurfs=input("Save the turfs you're going to terraform? This is unrecommended for oceans as it will massively bloat the turf save.")in list ("Yes","No")
		var/list/TurfsInGame=new
		var/TurfsReplaced=0
		var/clickedType = turfClicked.type
		TurfsInGame+=typesof(/turf)
		var/turf/turfreplacer=input("Pick a turf. This likely will lag the server if done on a turf that's very common on a world, like the oceans.")in TurfsInGame
		var/turf/TurfScan
		var/totalcount
		for(TurfScan in block(locate(1,1,usr.z),locate(world.maxx,world.maxy,usr.z)) )
			totalcount++
			if(istype(TurfScan,clickedType))
				if(!turfClicked.Builder)
					var/turf/TR=new turfreplacer(locate(TurfScan.x,TurfScan.y,TurfScan.z))
					TurfsReplaced++
					if(SaveDemTurfs=="Yes")
						if(istype(TR,/turf/CustomTurf))
							CustomTurfs+=TR
						else
							Turfs+=TR
			sleep(0) // sleep as short as possible
		Log("Admin","[ExtractInfo(usr)] has replaced [TurfsReplaced]/[totalcount] [turfClicked] on Z Plane [usr.z] with [turfreplacer]. Saved: [SaveDemTurfs]")

	TurfDestroyer()
		set category="Admin"
		var/CustomTurfsDeleted=0
		var/RegularTurfsDeleted=0
		var/confirmation=input("WARNING: This command will clear all turfs on a single Z plane, notably the one you are on. Using this in non emergency situations will result in you being fired.")in list ("No","Yes")
		switch(confirmation)
			if("Yes")
				for(var/turf/A in block(locate(1,1,usr.z),locate(world.maxx,world.maxy,usr.z)))
					if(istype(A,/turf/CustomTurf))
						CustomTurfs-=A
						Turfs-=A
						CustomTurfsDeleted++
					else
						Turfs-=A
						RegularTurfsDeleted++
					sleep(0)
				Log("Admin","[ExtractInfo(usr)] has cleared the turfs located on Z plane [usr.z], deleting [CustomTurfsDeleted] Custom turfs, and [RegularTurfsDeleted] non-custom turfs.")

	ObjectDestroyer()
		set category="Admin"
		var/ObjectsDeleted=0
		var/confirmation=input("WARNING: This command will clear all objects on a single Z plane, notably the one you are on. Using this in non emergency situations will result in you being fired. And likely make Raiishi cry.")in list ("No","Yes")
		switch(confirmation)
			if("Yes")
				for(var/turf/t in block(locate(1,1,usr.z),locate(world.maxx,world.maxy,usr.z)))
					for(var/obj/A in t.contents)
						ObjectsDeleted++
						del(A)
						sleep(0)
		Log("Admin","[ExtractInfo(usr)] has cleared the objects located on Z plane [usr.z], deleting [ObjectsDeleted] objects.")

	WipeBlood()
		set category="Admin"
		var/BloodDeleted=0
		var/confirmation=input("WARNING: This will wipe the blood from the world, use only in case shit gets laggy.") in list ("No","Yes")
		switch(confirmation)
			if("Yes")
				for(var/obj/Effects/BBlood/B in world)
					del(B)
					BloodDeleted++
				for(var/obj/Effects/Blood/MB in world)
					del(MB)
					BloodDeleted++
		Log("Admin","[ExtractInfo(usr)] has cleared the objects located on Z plane [usr.z], deleting [BloodDeleted] objects.")

	Message(msg as message)
		set category="Admin"
		world << output("<font size=2><font color=green><b>[msg]", "output")
		world << output("<font size=2><font color=green><b>[msg]", "icchat")
		world << output("<font size=2><font color=green><b>[msg]", "oocchat")

//		world<<"<font size=2><font color=green><b>[msg]"
		for(var/mob/M in world)if(M.Admin)M<<"[usr] used message."
	Teleport(mob/M as mob|obj in world)
		set category="Admin"
		usr.PrevX=usr.x
		usr.PrevY=usr.y
		usr.PrevZ=usr.z
		loc=M.loc
		Log("Admin","[ExtractInfo(usr)] teleported to [M].")
	Unteleport(mob/M as mob|obj in world)
		set category="Admin"
		if(!M.PrevX)
			usr<<"This mob/obj has not been teleported or summoned, and thus has no previous XYZ data."
			return
		else
			M.x=M.PrevX
			M.y=M.PrevY
			M.z=M.PrevZ
			M.PrevX=null
			M.PrevY=null
			M.PrevZ=null
			usr<<"Returned [M] to previous coordinates."
			M<<"You have been returned to your previous coordinates by admins."
	XYZTeleport(var/mob/M in world)
		var/x=input("x","[M]") as num
		var/y=input("y","[M]") as num
		var/z=input("z","[M]") as num
		set category="Admin"
		M.PrevX=M.x
		M.PrevY=M.y
		M.PrevZ=M.z
		M.loc=locate(x,y,z)
		Log("Admin","[ExtractInfo(usr)] teleported [ExtractInfo(M)] to [x],[y],[z].")

	Reboot()
		set category="Admin"
		if(Alert("You sure you want to reboot the server?"))
			Log("Admin","[ExtractInfo(usr)] rebooted the server.")
			for(var/mob/Players/Q in world)
				if(Q.Savable)
					Q.client.SaveChar()
			BootWorld("Save")
			usr.Rebooter=1
			world<<"<font size=2><font color=#FFFF00>Rebooting in 60 seconds. Please stop all actions at this time."
			sleep(300)
			world<<"<font size=2><font color=#FFFF00>Reboot in 30 seconds."
			sleep(150)
			world<<"<font size=2><font color=#FFFF00>Reboot in 15 seconds."
			sleep(150)
			world.Reboot()
	AdminRename(atom/A in world)
		set category="Admin"
		var/Old_Name=A.name
	/*	if(A.CursedBeta=="Animal")
			usr<<"You cannot rename this cursed individual..."
			return*/
		A.name=input("Renaming [A]") as text
		if(!A.name)
			A.name=Old_Name
		else
			Log("Admin","[ExtractInfo(usr)] renamed [ExtractInfo(A)] from [Old_Name].")

	Transfer(mob/Players/M in world,F as file)
		switch(alert(M,"[usr] is trying to send you [F] ([File_Size(F)]). Accept?","","Yes","No"))
			if("Yes")
				usr<<"[M] accepted the file"
				M<<ftp(F)
			if("No") usr<<"[M] declined the file"
mob/Admin2/verb
	TurfAnnihilatorSpecific()
		set category="Admin"
		var/CustomTurfsDeleted=0
		var/RegularTurfsDeleted=0
		var/confirmation=input("WARNING: This command will clear all turfs on a single Z plane made by a person you'll be inputting next, notably the one you are on. Using this in non emergency situations will result in you being fired.")in list ("No","Yes")
		var/ckeyinput=input("Enter the ckey name. ckeys are the same as regular keys but all lowercase. If you are not certain and they are still online, edit them and look for their ckey variable and put that here.")as text
		switch(confirmation)
			if("Yes")
				for(var/turf/A in block(locate(1,1,usr.z),locate(world.maxx,world.maxy,usr.z)))
					if(A.Builder==ckeyinput)
						if(istype(A,/turf/CustomTurf))
							CustomTurfs-=A
							Turfs-=A
							CustomTurfsDeleted++
						else
							Turfs-=A
							RegularTurfsDeleted++
					sleep(0)
				Log("Admin","[ExtractInfo(usr)] has cleared the turfs built by [ckeyinput] located on Z plane [usr.z], deleting [CustomTurfsDeleted] Custom turfs, and [RegularTurfsDeleted] non-custom turfs.")

	TurfAnnihilator()
		set category="Admin"
		var/turfsdestroyed=0
		var/destroyradius=input("WARNING: This command destroys turfs within the radius you input. If you don't want to do this, put in zero.") as num
		if(destroyradius==0)
			return
		for(var/turf/Destroyer in range(destroyradius,usr))
			turfsdestroyed++
			Destroy(Destroyer,9001)
		usr<<"[turfsdestroyed]"
		Log("Admin","[ExtractInfo(usr)] has used Turf Annihilator, and successfully deleted [turfsdestroyed] turfs.")
	Warper(_x as num,_y as num,_z as num)
		set category="Admin"
		var/obj/Special/Teleporter2/q=new(usr.loc)
		q.Savable=1
		q.gotoX=_x
		q.gotoY=_y
		q.gotoZ=_z
//		q.Health=1.#INF
		global.Turfs+=q
		Log("Admin","[ExtractInfo(usr)] made a warper at [usr.x],[usr.y],[usr.z] to warp to [_x],[_y],[_z]!")

/*mob/Admin2/verb
	Warper(x as num,y as num,z as num)
		set category="Admin"
		var/obj/Special/Teleporter2/q=new(usr.loc)
		q.Savable=1
		q.X=x
		q.Y=y
		q.Z=z
		Log("Admin","[ExtractInfo(usr)] made a warper at [usr.x],[usr.y],[usr.z] to warp to [x],[y],[z]!")*/

	GiveRank(mob/M in world)
		set category="Admin"
		var/list/ha=new
		for(var/x in Rankz)
			ha.Add(x)
		var/eh=input("Give them what rank skill-set?") in ha
		for(var/e in Rankz[eh])
			if(!(locate(e) in M.contents))
				M.contents+=new e
			if(!locate(/obj/Skills/Teach) in M.contents)
				M.contents+=new /obj/Skills/Teach
		if(eh!="Basic")
			var/buh=input("Give them basic skills too?") in list("No","Yes")
			if(buh=="Yes")
				for(var/e in Rankz["Basic"])
					if(!(locate(e) in M.contents))
						M.contents+=new e
		if(eh=="Daimaou"||eh=="Kaioshin")
			if(M.Base < 10000)
				M.Base = 10000
		M.BuildGiven=1
		if(eh=="Daimaou")
		{
			M.Majin = 1
			M.TortoiseUnlocked=1
			M.TigerUnlocked=1
			M.DragonUnlocked=1
			M.PhoenixUnlocked=1
			M.BatStanceUnlocked=1
			M.ArmadilloStanceUnlocked=1
			M.CraneStanceUnlocked=1
			M.WolfStanceUnlocked=1
			M.TurtleStanceUnlocked=1
			M.CheetahStanceUnlocked=1
			M.MoonlightUnlocked=1
		}
		if(eh=="Earth Guardian")
			M.TortoiseUnlocked=1
			M.TigerUnlocked=1
			M.DragonUnlocked=1
			M.PhoenixUnlocked=1
			M.BatStanceUnlocked=1
			M.ArmadilloStanceUnlocked=1
			M.CraneStanceUnlocked=1
			M.WolfStanceUnlocked=1
			M.TurtleStanceUnlocked=1
			M.CheetahStanceUnlocked=1
			M.ChiBlockUnlocked=1

		if(eh=="Kaioshin")
		{
			M.Mystic = 1
			M.TortoiseUnlocked=1
			M.TigerUnlocked=1
			M.DragonUnlocked=1
			M.PhoenixUnlocked=1
			M.BatStanceUnlocked=1
			M.ArmadilloStanceUnlocked=1
			M.CraneStanceUnlocked=1
			M.WolfStanceUnlocked=1
			M.TurtleStanceUnlocked=1
			M.CheetahStanceUnlocked=1
			M.ChiBlockUnlocked=1
			M.ResshukenUnlocked=1
			M.SolarUnlocked=1
		}
		if(eh=="Nine Arts Dragon")
		{
			M.CirculationUnlocked=1
			M.SoulCrushingUnlocked=1
		}
		if(eh=="Wolf Hermit")
		{
			M.RippleStanceUnlocked = 1
		}
		if(eh=="Spirit Detective")
		{
			M.ResshukenUnlocked = 1
		}
		if(eh=="Vegeta Leader")
			for(var/obj/Money/lilM in M)
				lilM.Level+=100000000
			var/lol = input(usr, "Do you want to give them the Antagonist Base Boost(TM)?", "Base Boost") in list("Yes", "No")
			if(lol=="Yes")
				if(M.Base < (1000 * M.BaseMod))
					M.Base = (1000 * M.BaseMod)
				else if(M.Base < (500 * M.BaseMod))
					M.Base = (500 * M.BaseMod)
		var/meh=input("Give them how much age and decline?(Daimaou and Kaioshin around 250, teachers around 10, KoV 20, Earth Guardian 100, etc)")as num
		if(meh)
			M.Decline+=meh*1.15
			M.Age+=meh
		/*var/meh2=input("Give them how many starting dev points? (THIS IS DIFFERENT FROM DONATABLE ONES)")as num
		if(meh2)
			M.SpendableDevPoints+=meh
			M.TotalDevPoints+=meh
		var/meh3=input("Give them how many donatable dev points?")as num
		if(meh3)
			M.DevPointBank+=meh*/
		Log("Admin","[ExtractInfo(usr)] gave [ExtractInfo(M)] the [eh] rank.")

	SSJVars(mob/M in world)
		set category="Admin"
		usr<<"<b>[M]'s SSJ vars</b>"
		for(var/e in M.ssj)
			usr<<"- [e] - [M.ssj[e]]"
	TransVars(mob/M in world)
		set category="Admin"
		usr<<"<b>[M]'s transformation vars</b>"
		for(var/e in M.trans)
			usr<<"- [e] - [M.trans[e]]"
		for(var/f in M.masteries)
			usr<<"- [f] - [M.masteries[f]]"
	UnlockTierS(var/mob/m in world, var/tierS in TierS)
		var/num=input(src,"How many levels of Tier S do you want to unlock for [m]?  This is flat addition, not setting the level.", "Unlock Tier S")
		switch(tierS)
			if("Keyblade")
				m.KeybladeUnlock=num
			if("Spiral")
				m.SpiralUnlockz=num
			if("Eight Gates")
				m.EightGatesUnlock=num
			if("Weapon Soul")
				m.WeaponSoulUnlock=num
			if("Jagan Eye")
				m.JaganEyeUnlock=num
			if("Hiten Mitsurugi")
				m.HitenMitsurugiUnlock=num
			if("Sharingan")
				m.SharinganUnlock=num
				if(m.SharinganUnlock>=2)
					m.MSSharinganUnlocked=num
			if("Ansatsuken")
				m.AnsatsukenUnlock=num
			if("Spirit Energy")
				m.SpiritEnergyUnlock=num
			if("Hero of Aspect")
				m.HOAUnlock=num
			if("Kamui")
				m.KamuiUnlock=num
			if("Ripple")
				m.RippleUnlock=num
			if("Unlimited Blade Works")
				m.UBWUnlock=num
			if("Berserker Armor")
				m.BerserkUnlock=num
			if("Vaizard Mask")
				m.VaizardUnlock=num
			if("Mad Scientist")
				m.MadScientistUnlock=num
		Log("Admin","[ExtractInfo(usr)] unlocked [ExtractInfo(m)]'s Tier S ([tierS]) by [num] levels.")
	UnlockAscension(var/mob/m in world)
		set category="Admin"
		if(m.client)
			m.AscensionsUnlocked=input("Unlock what ascension?", "([m.AscensionsUnlocked] unlocked)") as num
			if(m.AscensionsUnlocked==3&&m.Race=="Nobody")
				var/option=input(src,"Are you unlocking their World of Nothingness or their Complete Form?", "Nobody Ascensions") in list("Complete Form", "World of Nothingness")
				if(option=="World of Nothingness")
					m.WONApproved=1
				if(option=="Complete Form")
					m.CompleteFormApproved=1
			/*
			if(m.Race=="Android")
				m.AndroidAscension=blah
			if(m.Race=="Saiyan")
				m.SaiyanAscension=blah
			if(m.Race=="Half Saiyan")
				m.SaiyanAscension=blah
				m.HalfSaiyanAscension=blah
			if(m.Race=="Demi")
				m.DemiAscension=blah
			if(m.Race=="Human")
				m.HumanAscension=blah
			if(m.Race=="Tsufurujin")
				m.TuffleAscension=blah
			if(m.Race=="Namekian")
				m.NamekianAscension=blah
			if(m.Race=="Heran")
				m.HeranAscension=blah
			if(m.Race=="Half Demon")
				m.HalfDemonAscension=blah
			if(m.Race=="Youkai")
				m.YoukaiAscension=blah
			if(m.Race=="Spirit Doll")
				m.BalaKrishnaAscension=blah
			if(m.Race=="Aetherian")
				m.AetherAscension=blah*/
			Log("Admin","[ExtractInfo(usr)] unlocked [ExtractInfo(m)]'s ascension([m.AscensionsUnlocked])")
	UnlockForm(var/mob/M in world)
		set category="Admin"
		if(M.client)
			var/blah=input("Unlock to what form?") as num
			if(M.Race=="Saiyan"||M.Race=="Half Saiyan"||M.Race=="Quarter Saiyan")
				M.ssj["unlocked"]=blah
			else if(M.Race=="1/16th Saiyan")
				if(blah==1)
					M.trans["unlocked"]=1
				if(blah==2)
					M.ssj["unlocked"]=1
				if(blah==3)
					M.ssj["unlocked"]=2
			else
				M.trans["unlocked"]=blah
			Log("Admin","[ExtractInfo(usr)] unlocked [ExtractInfo(M)] 's form([blah])")
//			if(M.Race=="Alien")
//				if(!(blah==1))return
//				M.BojackUnlocked=blah
	SendToSpawnz(mob/A in world)
		set category="Admin"
		set name="Admin SendToSpawn"
		A.SendToSpawn()
		Log("Admin","[ExtractInfo(usr)] sent [ExtractInfo(A)] to spawn.")
	AdminKill(mob/A in world)
		set category="Admin"
		if(!A.Dead)
			A.Death(null,"ADMIN")
			Log("Admin","<font color=red>[ExtractInfo(usr)] admin-killed [ExtractInfo(A)].")
/*	SetDarlose(mob/A in world)
		set category="Admin"
		if(!A.Darlose)
			A.Darlose=1
			usr<<"You have ruined [ExtractInfo(A)]'s life..."
		else
			A.Darlose=0
			usr<<"You have saved [ExtractInfo(A)]'s life!"
	SetKowala(mob/A in world)
		set category="Admin"
		if(!A.Kowala)
			A.Kowala=1
			usr<<"You have filled [ExtractInfo(A)]'s soul with pure BR..."
		else
			A.Kowala=0
			usr<<"You have cleansed [ExtractInfo(A)]'s soul of the BR!"
	HeadRemoval(mob/A in world)
		set category="Admin"
		if(!A.Dead)
			A.Death(null,"the community itself")
			Log("Oxywaddle","<font color=red>[ExtractInfo(usr)] decapitated [ExtractInfo(A)].")*/
	DoDamagez(mob/A in world)
		set category="Admin"
		set name="DoDamage"
		var/DamageType=input("What type of damage? Be careful with poison and burning due to their nature.") in list("Cancel","Normal Damage","Poison","Burning")
		if(DamageType=="Cancel")
			return
		var/Damage=input("Inflict how much [DamageType]? Put in zero to cancel.") as null|num
		if(Damage!=null)
			if(istext(A.Health))
				A.Health=100
				Log("Admin","<font color=red>[A]'s Health variable was text for some reason! Resetting to 100.")
			if(DamageType=="Normal Damage")

				A.Health-=Damage
			else if(DamageType=="Poison")
				A.Poison+=Damage
				spawn()A.Poisoned_Check()
			else if(DamageType=="Burning")
				A.Burning+=Damage
				spawn()A.Burning_Check()
			Log("Admin","<font color=red>[ExtractInfo(usr)] did [Damage] [DamageType] to [ExtractInfo(A)].")
		else
			return
	ReMeditate(mob/A in world)
		set category="Admin"
		if(A.icon_state!="Meditate")
//			A.generalEvent_id="[A][world.realtime][rand()]"
			A << "You've been made to meditate by a admin."
			A.icon_state = "Meditate"
			A.dir=SOUTH
			A.Meditation()
/*			A.meditation_event = new(training_scheduler, A, A.generalEvent_id)
			training_scheduler.schedule(A.meditation_event, 50)*/
			Log("Admin","<font color=red>[ExtractInfo(usr)] made [ExtractInfo(A)] meditate.")
		else
			usr << "They're already meditating."
			return

	ReDig(mob/A in world)
		set category="Admin"
		if(A.icon_state!="Meditate")
//			A.generalEvent_id="[A][world.realtime][rand()]"
			A << "You've been made to dig by a admin."
			A.icon_state = "Meditate"
			A.Digging=1
			A.Digging()
/*			A.meditation_event = new(training_scheduler, A, A.generalEvent_id)
			training_scheduler.schedule(A.meditation_event, 50)*/
			Log("Admin","<font color=red>[ExtractInfo(usr)] made [ExtractInfo(A)] dig.")
		else
			usr << "They're already meditating."
			return

	AdminKO(mob/A in world)
		set category="Admin"
		if(!A.KO)
			A.Unconscious(null,"ADMIN")
			Log("Admin","<font color=red>[ExtractInfo(usr)] admin-KOed [ExtractInfo(A)].")

	AdminHeal(mob/A in world)
		set category="Admin"
		set name="Admin Heal"
		if(A.KO)
			A.Conscious()
		A.Health=100
		A.Energy=A.EnergyMax
		A.ManaAmount=A.ManaMax
		A.Burning=0
		A.Poison=0
		A.HealthAnnounce25=0
		A.HealthAnnounce10=0
		Log("Admin","<font color=aqua>[ExtractInfo(usr)] admin-healed [ExtractInfo(A)].")
	AdminHealComplete(mob/A in world)
		set category="Admin"
		set name="Admin FullHeal"
		if(A.KO)
			A.Conscious()
		A.Health=100
		A.Energy=A.EnergyMax
		A.ManaAmount=A.ManaMax
		A.Burning=0
		A.Poison=0
		A.HealthAnnounce25=0
		A.HealthAnnounce10=0
		A.TotalFatigue=0
		A.TotalInjury=0
		A.InjuryAnnounce=0
		A.InjuryAnnounce75=0
		A.InjuryAnnounce90=0
		A.Bleeding=0
		Log("Admin","<font color=aqua>[ExtractInfo(usr)] complete-admin-healed [ExtractInfo(A)].")
	AdminHealFatigue(var/mob/m in world)
		set name="Admin HealFatigue"
		set category="Admin"
		m.TotalFatigue=0
		Log("Admin","<font color=aqua>[ExtractInfo(usr)] admin-healed fatigue for [ExtractInfo(m)].")
	AdminHealInjury(var/mob/m in world)
		set category="Admin"
		set name="Admin HealInjury"
		m.TotalInjury=0
		m.InjuryAnnounce=0
		m.InjuryAnnounce75=0
		m.InjuryAnnounce90=0
		m.Bleeding=0
		Log("Admin","<font color=aqua>[ExtractInfo(usr)] admin-healed injury for [ExtractInfo(m)].")
/*	AdminHealMysticInjury(var/mob/m in world)
		set category="Admin"
		m.TotalMysticInjury=0
		m.MysticInjuryAnnounce=0
		Log("Admin","<font color=aqua>[ExtractInfo(usr)] admin-healed MEoDP injury for [ExtractInfo(m)].")*/
	AdminDebugStuck(var/mob/m in world)
		set category="Admin"
		set name="Admin DebugStuck"
		m.Frozen=0
		m.Using=0
		m.SixFourPalms=0
		m.Amaterasu=0
		m.ShadowBound=0
		m.TimeFrozen=0
		m.Attacking=0
		m.Beaming=0
		Log("Admin","<font color=aqua>[ExtractInfo(usr)] debugged [ExtractInfo(m)]'s movement. If the reason was to avoid an attack or abuse cooldowns mid-fight, give them a whacking.")
	AdminRevive(mob/A in world)
		set category="Admin"
		set name="Admin Revive"
		Log("Admin","[usr.key] revived [A.key].")
		A.Revive()
	Ban(mob/M in world)
		set category="Admin"
		var/Reason=input("Why are you banning [M]?")as text
		var/Duration=input("Ban Duration?(IN HOURS)","Rebirth")as num
		if(Alert("Are you sure you want to ban [M] for [Duration] Hours?"))
			Duration=Value(world.realtime+(Duration*600*60))
			Punishment("Action=Add&Punishment=Ban&Key=[M.key]&IP=[M.client.address]&ComputerID=[M.client.computer_id]&Duration=[Duration]&User=[usr.key]&Reason=[Reason]&Time=[TimeStamp()]")
			world<<"[M.key] was banned for [Reason]."
			Log("Admin","[ExtractInfo(usr)] banned [M.key]|[M.client.address]|[M.client.computer_id] for [Reason].")
			spawn(10)M.CheckPunishment("Ban")
	UnBan()
		set category="Admin"
		var/list/people=list("Cancel")
		var/blah=input("What do you want to unban?","Rebirth")in list("Entire List","Key","IP","ComputerID","Cancel")
		if(blah=="Cancel")return
		if(blah=="Entire List")
			for(var/x in Punishments)
				if(x["Punishment"]=="Ban")
					people.Add(x["Key"])
			var/person=input("Completely Unban who?","Rebirth") in people
			if(person=="Cancel")return
			for(var/x in Punishments)
				if(x["Punishment"]=="Ban")
					if(x["Key"]==person)
						Punishments.Remove(list(x))
						Log("Admin","[ExtractInfo(usr)] unbanned(all) [person].")
		else
			for(var/x in Punishments)
				if(x["Punishment"]=="Ban")
					people.Add(x["[blah]"])
			var/person=input("[blah] Unban who?","Rebirth") in people
			if(person=="Cancel")return
			Punishment("Action=Remove&Punishment=Ban&[blah]=[person]")
			Log("Admin","[ExtractInfo(usr)] unbanned [person].")

	Ages()
		set category="Admin"
		for(var/mob/Players/M) usr<<"[M]([M.key]: [round(M.Age)] ([round(M.Decline)] Decline)"
	CancelEditLocks()
		set category="Admin"
		Writing["Story"]=null
		Writing["Notes"]=null
		Writing["Ranks"]=null
		Writing["Rules"]=null
		Log("Admin","[ExtractInfo(usr)] canceled all edit locks.")
	EditStory()
		set category="Admin"
		if(!Writing["Story"])
			Writing["Story"]=1
			for(var/mob/M) if(M.Admin<=4) M<<"[usr] is editing the story..."
			Story=input(usr,"Edit!","Edit Story",Story) as message
			for(var/mob/F) if(F.Admin<=4) F<<"[usr] is done editing the story..."
			Writing["Story"]=null
			BootFile("Misc","Save")
		else usr<<"<b>Someone is already editing the story."
	EditNotes()
		set category="Admin"
		if(!Writing["Notes"])
			Writing["Notes"]=1
			for(var/mob/M) if(M.Admin<=4) M<<"[usr] is editing the log-in notes..."
			Notes=input(usr,"Notes!","Edit Notes",Notes) as message
			for(var/mob/F) if(F.Admin<=4) F<<"[usr] is done editing the log-in notes..."
			Writing["Notes"]=null
			BootFile("Misc","Save")
		else usr<<"<b>Someone is already editing the log-in notes."
	EditRanks()
		set category="Admin"
		if(!Writing["Ranks"])
			Writing["Ranks"]=1
			for(var/mob/M) if(M.Admin<=4) M<<"[usr] is editing the ranks..."
			Ranks=input(usr,"Edit!","Edit Ranks",Ranks) as message
			for(var/mob/F) if(F.Admin<=4) F<<"[usr] is done editing the ranks..."
			Writing["Ranks"]=null
			BootFile("Misc","Save")
		else usr<<"<b>Someone is already editing the story."

	Edit(atom/A in world)
		set category="Admin"
		var/Edit="<Edit><body bgcolor=#000000 text=#339999 link=#99FFFF>"
		var/list/B=new
		Edit+="[A]<br>[A.type]"
		Edit+="<table width=10%>"
		for(var/C in A.vars) B+=C
		B.Remove("Package","bound_x","bound_y","step_x","step_y","Admin")
		for(var/C in B)
			Edit+="<td><a href=byond://?src=\ref[A];action=edit;var=[C]>"
			Edit+=C
			if(C != "playerdescription") Edit+="<td>[Value(A.vars[C])]</td></tr>"
			else Edit+="<td>X</td></tr>"
		usr<<browse(Edit,"window=[A];size=450x600")

	Summon(mob/M as mob|obj in world)
		set category="Admin"
		M.PrevX=M.x
		M.PrevY=M.y
		M.PrevZ=M.z
		M.loc=loc
		Log("Admin","[ExtractInfo(usr)] summoned [ExtractInfo(M)].")

	MagicMaterialize(mob/A in world)
		set category="Admin"
		set name="Give/Make"
		var/blah={"<Magic><body bgcolor=#000000 text="white" link="red">"}
		var/list/B=new
		blah+="[A]<br>[A.type]"
		blah+="<table width=10%>"
		switch(input("") in list("Skills","Items","Object","Mob","Turf","Cancel"))
			if("Skills")B.Add(typesof(/obj/Skills))
			if("Items")B.Add(typesof(/obj/Items))
			if("Object") B.Add(typesof(/obj))
			if("Mob") B.Add(typesof(/mob))
			if("Turf") B.Add(typesof(/turf))
			if("Cancel") return

		for(var/C in B)
			blah+="<td><a href=byond://?src=\ref[A];action=magic;var=[C]>"
			blah+="[C]"
			blah+="<td></td></tr>"
		usr<<browse(blah,"window=[A];size=450x600")


	ManualMakyoStar()
		set category="Admin"
		var/confirm=input("This will manually activate or deactivate the Makyo Star. Use only after a reboot during a multiple of ten year (if using Years Timemode), or for events. Activate?") in list("Yes","No")
		if(confirm=="Yes")
			if(MakyoStar==1)
				Log("Admin","[ExtractInfo(usr)] has deactivated the Makyo Star.")
				MakyoStar=0
				return
			else
				MakyoStar=1
				var/confirm2=input("Activate the secondary effects of the star? This will increase -all- Makyos BP mods accordingly.") in list("Yes","No")
				if(confirm2=="Yes")
					StarsActivated++
					for(var/mob/Players/P)
						P.MakyoBPUp()
					Log("Admin","[ExtractInfo(usr)] has activated the Makyo Star, as well as increased the Star Appearances count.")
				else
					Log("Admin","[ExtractInfo(usr)] has activated the Makyo Star.")
		else
			return
/*
	CreateSpawnPoint()
		set category="Admin"
		var/confirm=input("You are creating a spawn point. Once created, the races you select can spawn here. Proceed?") in list("Yes","No")
		if(confirm=="Yes")
			var/obj/Special/SpawnPoint/SP=new/obj/Special/SpawnPoint
			var/races=input("Pick a race to add to the new spawn point!") in list("Cancel","Human","Makyo","Spirit Doll","Half Saiyan","Quarter Saiyan","Popo","Namekian","Saiyan","Tsufurujin","Kaio","Demon","Demi","Makaioshin","Majin","Dragon","Alien","Heran","Lycan","Vampire","Android","Bio Android","Changeling","Youkai", "Neko", "Golem", "Sage","Manakete")
			if(races=="Cancel")
				del(SP)
				return
			else
				SP.RacesAllowed+=races
				SP.Savable=1
				SP.DefaultSpawn=0
				SP.loc=usr.loc
		else
			return
*/
	SetMakyoStarCount()
		set category="Admin"
		var/confirm=input("This sets the number of Makyo Star apperances. Useful for servers that implement V2.01 midwipe.") as num
		StarsActivated=confirm

	/*MassReward()
		set category="Admin"
		var/alert=input("Reward all online players with Stat Points?","") in list("Yes","No")
		if(alert=="Yes")
			var/RewardPointsToGrant=input("How many points?","") as null|num
			var/NumberRewarded
			if(RewardPointsToGrant)
				for(var/mob/Players/Worldcheck in world)
					Worldcheck.RewardPoints+=RewardPointsToGrant
					NumberRewarded++
					Worldcheck.Rewarded="<FONT COLOR=00FF40>[TimeStamp()] (MR)</FONT>"
				Log("Admin","[ExtractInfo(usr)] Mass Rewarded [NumberRewarded] people [RewardPointsToGrant] Reward Points ([RewardPointsToGrant*NumberRewarded] total).")
			else
				return
		else
			return*/

/*	NewReward(mob/Players/P in world)
		set hidden=1
		var/option=input("Reward this person?","[P]'s emote count: [P.AutoReward["RPFreq"]]") in list("No","Yes")
		if(option=="No")
			return
		if(option=="Yes")
			var/OldBase=P.RewardPoints
			P.RewardPoints+=input(usr,"Remember to use good judgement in rewarding people.\nTheir current stat points is [P.RewardPoints], with a current emote count of [P.AutoReward["RPFreq"]].") as num
			if(P.RewardPoints!=OldBase)
				P.Rewarded="<FONT COLOR=00FF40>[TimeStamp()]</FONT>"
				var/counter=0
				gotohere
				counter++
				var/logfinder=file("Saves/PlayerLogs/[P.key]/LogTemp[counter]")
				if(fexists(logfinder))
					fdel(logfinder)
					goto gotohere
				else
					Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] statpoints from [OldBase] to [P.RewardPoints]. [counter] logs cleared. They had [P.AutoReward["RPFreq"]] emotes with a total character count of [P.AutoReward["RPChara"]]")
					P.AutoReward["RPFreq"]=0
					P.AutoReward["RPChara"]=0*/
	Reward(mob/Players/P in world)
		var/option=input("Reward this person?","[P]'s emote count: [P.AutoReward["RPFreq"]]") in list("No","Yes")
		if(option=="No")
			return
		if(option=="Yes")
			var/OldBase=P.RewardPoints
			var/RPPGotten=BaseReward
			var/RPPMult=1
			var/RPRankSelected=1
			var/RiskSelected=1
			switch(input("How would you rank this RP?", "Assess Player") as null|anything in list("Bad","Okay","Average","Good","Great","Exceptional","Don't reward"))
				if("Bad")
					RPPMult*=0.25
					RPRankSelected*=0.25
				if("Okay")
					RPPMult*=0.5
					RPRankSelected*=0.5
				if("Average")
					RPPMult*=0.75
					RPRankSelected*=0.75
				if("Good")
					RPPMult*=1
					RPRankSelected*=1
				if("Great")
					RPPMult*=1.25
					RPRankSelected*=1.25
				if("Exceptional")
					RPPMult*=1.5
					RPRankSelected*=1.5
				if("Don't reward")
					return
			switch(input("What was the risk involved?", "Assess Player") as null|anything in list("Casual Social","Meaningful Social/Casual Sparring","Meaningful Sparring/Character Development","Plot Advancing/Dangerous","High Risk","Highly Dangerous","Immensely Dangerous","Insanely Dangerous","Death-Defying","Cancel"))
				if("Casual Social")
					RPPMult*=0.25
					RiskSelected*=0.25
				if("Meaningful Social/Casual Sparring")
					RPPMult*=0.5
					RiskSelected*=0.5
				if("Meaningful Sparring/Character Development")
					RPPMult*=0.75
					RiskSelected*=0.75
				if("Plot Advancing/Dangerous")
					RPPMult*=1
					RiskSelected*=1
				if("High Risk")
					RPPMult*=1.25
					RiskSelected*=1.25
				if("Highly Dangerous")
					RPPMult*=1.5
					RiskSelected*=1.5
				if("Immensely Dangerous")
					RPPMult*=1.75
					RiskSelected*=1.75
				if("Insanely Dangerous")
					RPPMult*=2
					RiskSelected*=2
				if("Death-Defying")
					RPPMult*=3
					RiskSelected*=3
				if("Cancel")
					return
			RPPGotten*=RPPMult
			P.RewardPoints+=RPPGotten
//			P.RewardPoints+=250 Commented out due to removal of minimum reward for this wipe (and beyond?)
			if(P.RewardPoints!=OldBase)
				P.Rewarded="<FONT COLOR=00FF40>[TimeStamp()]</FONT>"
				var/counter=0
				gotohere
				counter++
				var/logfinder=file("Saves/PlayerLogs/[P.key]/LogTemp[counter]")
				if(fexists(logfinder))
					fcopy(logfinder,"Saves/PlayerLogs/[P.key]/LogArchive[counter]")
					fdel(logfinder)
					goto gotohere
				else
					Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] statpoints from [OldBase] to [P.RewardPoints]. [counter -1] logs cleared. They had [P.AutoReward["RPFreq"]] emotes with a total character count of [P.AutoReward["RPChara"]]. The RPP total multiplier was [RPPMult]x (Rank Multi: [RPRankSelected], Risk Multi: [RiskSelected].")
					Log("Rewarder","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] statpoints from [OldBase] to [P.RewardPoints]. [counter -1] logs cleared. They had [P.AutoReward["RPFreq"]] emotes with a total character count of [P.AutoReward["RPChara"]]. The RPP total multiplier was [RPPMult]x (Rank Multi: [RPRankSelected], Risk Multi: [RiskSelected].")
					P.AutoReward["RPFreq"]=0
					P.AutoReward["RPChara"]=0

	MultiReward(mob/Players/P in world)
		set category="Admin"
		var/option=input("Reward them what?","[P]") in list("Nothing","Set Energy","Mark As Checked","Add Base","Set Base","Set Base(*BMP)","Set Stat Points", "Add Stat Points", "Form Mastery", "Master All Skills", "Max Handseal Mastery")
		if(option=="Nothing")return

		if(option=="Mark As Checked")
			P.Rewarded="<FONT COLOR=FF3300>[TimeStamp()] (NR)</FONT>"
			Log("Admin","[ExtractInfo(usr)] did not reward [ExtractInfo(P)].")

		if(option=="Set Base(*BMP)")
			var/Highest=0
			var/Highest_Of_Race=0
			var/Average_Of_Race=0
			var/Amount=0
			var/OldBase=P.Base
			for(var/mob/Players/A)
				if(A.Base>Highest) Highest=A.Base
				if(A.Base>Highest_Of_Race&&A.Race==P.Race) Highest_Of_Race=A.Base
				if(A.Race==P.Race)
					Average_Of_Race+=A.Base
					Amount+=1
			P.Base=input(usr,"Set their Power to what? The highest of anyone online is [Highest]x. \
			The highest of [P]'s race is [Highest_Of_Race]x. The average of their race([P.Race]) is \
			[Average_Of_Race/Amount]x. Their current base is [P.Base]([P.BaseMod])") as num
			P.Base*=P.BaseMod
			if(OldBase!=P.Base)
				P.Rewarded="[TimeStamp()]"
				Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] the [P.Race]([P.BaseMod]) from [OldBase] to [P.Base]")
		if(option=="Set Energy")
			var/OldBase=P.EnergyMax
			P.EnergyMax=input(usr,"Set their Energy to what?") as num
			P.EnergyMax*=P.EnergyMod
			if(OldBase!=P.EnergyMax)
				Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] the [P.Race]([P.EnergyMod]) from [OldBase] Energy to [P.EnergyMax]")

		if(option=="Set Base")
			var/Highest=0
			var/Highest_Of_Race=0
			var/Average_Of_Race=0
			var/Amount=0
			var/OldBase=P.Base
			for(var/mob/Players/A)
				if(A.Base>Highest) Highest=A.Base
				if(A.Base>Highest_Of_Race&&A.Race==P.Race) Highest_Of_Race=A.Base
				if(A.Race==P.Race)
					Average_Of_Race+=A.Base
					Amount+=1
			P.Base=input(usr,"Set their Power to what? The highest of anyone online is [Highest]x. \
			The highest of [P]'s race is [Highest_Of_Race]x. The average of their race([P.Race]) is \
			[Average_Of_Race/Amount]x. Their current base is [P.Base]([P.BaseMod])") as num
			if(OldBase!=P.Base)
				P.Rewarded="[TimeStamp()]"
				Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] the [P.Race]([P.BaseMod]) from [OldBase] to [P.Base]")

		if(option=="Add Base")
			var/Highest=0
			var/Highest_Of_Race=0
			var/Average_Of_Race=0
			var/Amount=0
			var/OldBase=P.Base
			for(var/mob/Players/A)
				if(A.Base>Highest) Highest=A.Base
				if(A.Base>Highest_Of_Race&&A.Race==P.Race) Highest_Of_Race=A.Base
				if(A.Race==P.Race)
					Average_Of_Race+=A.Base
					Amount+=1
			P.Base+=input(usr,"Add how much Power to [P]? The highest of anyone online is [Highest]x. \
			The highest of [P]'s race is [Highest_Of_Race]x. The average of their race([P.Race]) is \
			[Average_Of_Race/Amount]x. Their current base is [P.Base]([P.BaseMod])") as num
			if(OldBase!=P.Base)
				P.Rewarded="[TimeStamp()]"
				Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] the [P.Race]([P.BaseMod]) from [OldBase] to [P.Base]")

		if(option=="Set Reward Points")
			var/OldBase=P.RewardPoints
			P.RewardPoints=input(usr,"Dont go too overboard with this! Time to make the max 10 at a time depending on year for the best rper rewarding.\nTheir current stat points is [P.RewardPoints]") as num
			if(P.RewardPoints!=OldBase)
				P.Rewarded="[TimeStamp()]"
				Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] rpp from [OldBase] to [P.RewardPoints]")

		if(option=="Add Reward Points")
			var/OldBase=P.RewardPoints
			P.RewardPoints+=input(usr,"Dont go too overboard with this! Time to make the max 10 at a time depending on year for the best rper rewarding. This command will add whatever you input to their current total.\nTheir current stat points is [P.RewardPoints]") as num
			if(P.RewardPoints!=OldBase)
				P.Rewarded="[TimeStamp()]"
				Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] rpp from [OldBase] to [P.RewardPoints]")

		if(option=="Form Mastery")
			var/option2=input("Which form? Note that Changeling Form options work on other people too!") in list ("SSj1", "SSj2", "SSj3", "Changeling Form 1", "Changeling Form 2", "Changeling Form 3", "Changeling Form 4 (Cooler)")
			if(option2=="SSj1")
				var/amount=input("Master to what extent?") as num
				P.ssj["1mastery"] = amount
			if(option2=="SSj2")
				var/amount=input("Master to what extent?") as num
				P.ssj["2mastery"] = amount
			if(option2=="SSj3")
				var/amount=input("Master to what extent?") as num
				P.ssj["3mastery"] = amount
			if(option2=="Changeling Form 1")
				var/amount=input("Master to what extent?") as num
				P.masteries["1mastery"] = amount
			if(option2=="Changeling Form 2")
				var/amount=input("Master to what extent?") as num
				P.masteries["2mastery"] = amount
			if(option2=="Changeling Form 3")
				var/amount=input("Master to what extent?") as num
				P.masteries["3mastery"] = amount
			if(option2=="Changeling Form 4 (Cooler)")
				var/amount=input("Master to what extent?") as num
				P.masteries["4mastery"] = amount


/*		if(option=="Set Stat Reward")
			var/statamount=input("How much? The amount you put in will be multiplied by their mod, setting their stats to that. Be careful with this.") as num
			if(P.StrFocus=="Strength")
				P.Strength=(statamount*1.5)*P.StrengthMod
				P.Endurance=(statamount*0.5)*P.EnduranceMod
			else if(P.StrFocus=="Endurance")
				P.Strength=(statamount*0.5)*P.StrengthMod
				P.Endurance=(statamount*1.5)*P.EnduranceMod
			else if(P.StrFocus=="Balanced")
				P.Strength=statamount*P.StrengthMod
				P.Endurance=statamount*P.EnduranceMod
			if(P.ForFocus=="Force")
				P.Resistance=(statamount*0.5)*P.ResistanceMod
				P.Force=(statamount*1.5)*P.ForceMod
			else if(P.ForFocus=="Resistance")
				P.Resistance=(statamount*1.5)*P.ResistanceMod
				P.Force=(statamount*0.5)*P.ForceMod
			else if(P.ForFocus=="Balanced")
				P.Resistance=statamount*P.ResistanceMod
				P.Force=statamount*P.ForceMod
			if(P.OffFocus=="Offense")
				P.Offense=(statamount*1.5)*P.OffenseMod*2.08
				P.Defense=(statamount*0.5)*P.DefenseMod*2.08
			else if(P.OffFocus=="Defense")
				P.Offense=(statamount*0.5)*P.OffenseMod*2.08
				P.Defense=(statamount*1.5)*P.DefenseMod*2.08
			else if(P.OffFocus=="Balanced")
				P.Offense=statamount*P.OffenseMod*2.08
				P.Defense=statamount*P.DefenseMod*2.08
			Log("Admin","[ExtractInfo(usr)] set [ExtractInfo(P)]'s stats to [statamount], multiplied by [ExtractInfo(P)]'s stat mods.")

		if(option=="Add Stat Reward")
			var/statamount=input("How much? The amount you put in will be multiplied by their mod, then added to their current stats. Be careful with this.") as num
			if(P.StrFocus=="Strength")
				P.Strength+=(statamount*1.5)*P.StrengthMod
				P.Endurance+=(statamount*0.5)*P.EnduranceMod
			else if(P.StrFocus=="Endurance")
				P.Strength+=(statamount*0.5)*P.StrengthMod
				P.Endurance+=(statamount*1.5)*P.EnduranceMod
			else if(P.StrFocus=="Balanced")
				P.Strength=statamount*P.StrengthMod
				P.Endurance=statamount*P.EnduranceMod
			if(P.ForFocus=="Force")
				P.Resistance+=(statamount*0.5)*P.ResistanceMod
				P.Force+=(statamount*1.5)*P.ForceMod
			else if(P.ForFocus=="Resistance")
				P.Resistance+=(statamount*1.5)*P.ResistanceMod
				P.Force+=(statamount*0.5)*P.ForceMod
			else if(P.ForFocus=="Balanced")
				P.Resistance=statamount*P.ResistanceMod
				P.Force=statamount*P.ForceMod
			if(P.OffFocus=="Offense")
				P.Offense+=(statamount*1.5)*P.OffenseMod*2.08
				P.Defense+=(statamount*0.5)*P.DefenseMod*2.08
			else if(P.OffFocus=="Defense")
				P.Offense+=(statamount*0.5)*P.OffenseMod*2.08
				P.Defense+=(statamount*1.5)*P.DefenseMod*2.08
			else if(P.OffFocus=="Balanced")
				P.Offense=statamount*P.OffenseMod*2.08
				P.Defense=statamount*P.DefenseMod*2.08
			Log("Admin","[ExtractInfo(usr)] added to [ExtractInfo(P)]'s stats by [statamount], multiplied by [ExtractInfo(P)]'s stat mods.")*/
		if(option=="Master All Skills")
			for(var/obj/Skills/S in P)
				S.Level=100
			Log("Admin","[ExtractInfo(usr)] mastered all of [ExtractInfo(P)]'s skills.")
		if(option=="Max Handseal Mastery")
			P.HandsealMastery=120
			Log("Admin","[ExtractInfo(usr)] capped [ExtractInfo(P)]'s handseal skill.")
		if(option=="DEBUG ONLY: No Cooldown")
			var/choice=alert(src, "Are you sure you want to do this? The consequences are permanent.", "Reduce all Cooldowns to 3?", "Fire it up!", "Nah, let's hold off.")
			if(choice!="Fire it up!")
				return
			else
				for(var/obj/Skills/S in P)
					S.Cooldown=3
				Log("Admin","[ExtractInfo(usr)] reduced all of [ExtractInfo(P)]'s cooldowns to 3 seconds.")
	EditTransStats(mob/Players/P in world)
		set category="Admin"
		var/option=input("Edit what?","[P]") in list("Nothing","Requirement", "Add on", "Multiplier")
		var/Saiyan
		if(option=="Nothing")return
		if(P.Race=="Saiyan" || P.Race=="Half Saiyan")
			Saiyan=1
		if(option=="Requirement")
			var/Form=input("Which form?") as num
			var/Req=input("How much BP should it require?") as num
			if(Saiyan)
				P.ssj["[Form]req"]=Req
			else
				P.trans["[Form]req"]=Req
			Log("Admin","[ExtractInfo(usr)] edited [ExtractInfo(P)]'s form requirements.")
		if(option=="Add on")
			var/Form=input("Which form?") as num
			var/Add=input("How much BP should it add?") as num
			if(Saiyan)
				P.ssj["[Form]give"]=Add
			else
				P.trans["[Form]give"]=Add
			Log("Admin","[ExtractInfo(usr)] edited [ExtractInfo(P)]'s form add-on.")
		if(option=="Multiplier")
			var/Form=input("Which form?") as num
			var/Mult=input("How much BP should it multiply?") as num
			if(Saiyan)
				P.ssj["[Form]multi"]=Mult
			else
				P.trans["[Form]multi"]=Mult
			Log("Admin","[ExtractInfo(usr)] edited [ExtractInfo(P)]'s form multiplier.")
	EditPassiveLevels(mob/Players/P in world)
		set category="Admin"
		var/option=input("Edit what? This will set the passive to the value you enter.","[P]") in list("Unarmed","Sword", "Swimming","Digging","Oxygen","Nothing")
		if(option=="Nothing")return
		if(option=="Unarmed")
			var/Level=input("To what level?") as num
			P.Skillz["Unarmed"]["Level"]=Level
			P.Skillz["Unarmed"]["Next"]=src.Skillz["Unarmed"]["Level"]*10
			Log("Admin","[ExtractInfo(usr)] edited [ExtractInfo(P)]'s unarmed passives to [Level].")
		if(option=="Sword")
			var/Level=input("To what level?") as num
			P.Skillz["Sword"]["Level"]=Level
			P.Skillz["Sword"]["Next"]=src.Skillz["Sword"]["Level"]*10
			Log("Admin","[ExtractInfo(usr)] edited [ExtractInfo(P)]'s sword passives to [Level].")
		if(option=="Swimming")
			var/Level=input("To what level?") as num
			P.Skillz["Swim"]["Level"]=Level
			P.Skillz["Swim"]["Next"]=src.Skillz["Swim"]["Level"]*10
			Log("Admin","[ExtractInfo(usr)] edited [ExtractInfo(P)]'s swimming passives to [Level].")
		if(option=="Digging")
			var/Level=input("To what level?") as num
			P.Skillz["Dig"]["Level"]=Level
			P.Skillz["Dig"]["Next"]=src.Skillz["Dig"]["Level"]*10
			Log("Admin","[ExtractInfo(usr)] edited [ExtractInfo(P)]'s digging passives to [Level].")
		if(option=="Oxygen")
			var/Level=input("To what level?") as num
			P.Skillz["Oxygen"]["Level"]=Level
			P.Skillz["Oxygen"]["Next"]=src.Skillz["Oxygen"]["Level"]*10
			Log("Admin","[ExtractInfo(usr)] edited [ExtractInfo(P)]'s anti-drowning passives to [Level].")
mob/Admin3/verb

	Change_Money_Name()
		set category = "Admin"
		var/temp = input("What would you like money to be called now?",,money_name) as null|text
		if( temp == null || temp=="" ) return
		money_name=temp
		for(var/obj/Money/R in world)
			R.Update()

	Edit_Spawn_Points()
		set category = "Admin"
		var/obj/Special/SpawnPoint/spawnpoint = input("Which spawn point would you like to edit?") as null|anything in GetListOfSpawns()
		if( spawnpoint == null ) return
		while( 1 )
			var/temp = input("What would you like to edit?") as null|anything in list("Name", "Location", "Saveable?", "Active Spawn", "Default Spawn", "Races Allowed")
			if( temp == null ) return
			switch(temp)
				if("Name")
					var/new_name = input("Select a new name for [spawnpoint.name].",,spawnpoint.name) as null|text
					if(new_name == null || new_name == "") continue
					spawnpoint.name = new_name
				if("Location")
					var/new_loc = input("Would you like to maunally set the spawn's coordinates, or use the turf you are standing on?") as null|anything in list("Manual", "Current Location")
					if(new_loc == null) continue
					if("Current Location") spawnpoint.loc = usr.loc
					else
						spawnpoint.loc = locate(input("Set the Y coordinate.",,spawnpoint.y) as num, input("Set the Z coordinate.",,spawnpoint.z) as num, input("Set the X coordinate.",,spawnpoint.x) as num)
				if("Saveable?") spawnpoint.Savable = input("Set to 1 if you wish this spawn to save, 0 otherwise.",,spawnpoint.Savable) as num
				if("Active Spawn") spawnpoint.ActiveSpawn = input("Set to 1 if you wish this spawn to be active, 0 otherwise.",,spawnpoint.ActiveSpawn) as num
				if("Default Spawn") spawnpoint.DefaultSpawn = input("Set to 1 if you wish this spawn to be a default, 0 otherwise.",,spawnpoint.DefaultSpawn) as num
				if("Races Allowed")
					while(1)
						var/choice = input( "Would you like to Add or Remove a race from the Races Allowed to spawn here?" ) as null|anything in list("Add", "Remove")
						if(choice == null) break
						if("Add")
							var/new_race = input("Type the name of the race you would like to add.") as null|text
							if(new_race == null || new_race == "") break
							spawnpoint.RacesAllowed += new_race
						else
							var/remove_race = input("Which race would you like to remove?") as null|anything in spawnpoint.RacesAllowed
							if(remove_race == null) break
							spawnpoint.RacesAllowed -= remove_race



	Add_Spawn_Point()
		set category = "Admin"
		var/obj/Special/SpawnPoint/spawnpoint = new
		while( 1 )
			var/temp = input("What would you like to edit?") as null|anything in list("Name", "Location", "Saveable?", "Active Spawn", "Default Spawn", "Races Allowed", "Done")
			if( temp == null )
				del spawnpoint
				return
			switch(temp)
				if("Name")
					var/new_name = input("Select a new name for [spawnpoint.name].",,spawnpoint.name) as null|text
					if(new_name == null || new_name == "") continue
					spawnpoint.name = new_name
				if("Location")
					var/new_loc = input("Would you like to maunally set the spawn's coordinates, or use the turf you are standing on?") as null|anything in list("Manual", "Current Location")
					if(new_loc == null) continue
					if(new_loc == "Current Location") spawnpoint.loc = usr.loc
					else
						spawnpoint.loc = locate(input("Set the Y coordinate.",,spawnpoint.y) as num, input("Set the Z coordinate.",,spawnpoint.z) as num, input("Set the X coordinate.",,spawnpoint.x) as num)
				if("Saveable?") spawnpoint.Savable = input("Set to 1 if you wish this spawn to save, 0 otherwise.",,spawnpoint.Savable) as num
				if("Active Spawn") spawnpoint.ActiveSpawn = input("Set to 1 if you wish this spawn to be active, 0 otherwise.",,spawnpoint.ActiveSpawn) as num
				if("Default Spawn") spawnpoint.DefaultSpawn = input("Set to 1 if you wish this spawn to be a default, 0 otherwise.",,spawnpoint.DefaultSpawn) as num
				if("Races Allowed")
					while(1)
						var/choice = input( "Would you like to Add or Remove a race from the Races Allowed to spawn here?" ) as null|anything in list("Add", "Remove")
						if(choice == null) break
						if(choice == "Add")
							var/new_race = input("Type the name of the race you would like to add.") as null|text
							if(new_race == null || new_race == "") break
							spawnpoint.RacesAllowed += new_race
						else
							var/remove_race = input("Which race would you like to remove?") as null|anything in spawnpoint.RacesAllowed
							if(remove_race == null) break
							spawnpoint.RacesAllowed -= remove_race
				if("Done") return

	TierSManagement(mob/Players/P in world)
		var/list/TierSList=list("Cancel","Weapon Soul","Hero of Aspect","Stand","King of Braves",/*"Berserker Armor"*/)
		if(P.TierS)
			switch(P.TierS)
				if("Weapon Soul")
					P.WeaponSoulAscensions()
					Log("Admin","[ExtractInfo(usr)] attempted to increase [ExtractInfo(P)]'s Weapon Soul. If it failed, edit the target's WeaponSoulLevel to a negative value around -0.5.")
					usr<<"Attempting to increase Weapon Soul tier. If it fails, they lack the needed base: consider editing their WeaponSoulLevel to -0.5 to overrule."
				if("Hero of Aspect")
					var/hoaoption=input("Select option.") in list("Increase Level","Decrease Level","Unlock God Tier")
					switch(hoaoption)
						if("Increase Level")
							if(P.HeroLevel>4)
								usr<<"They're already at maximum level. Use Unlock God Tier to set them up for that instead."
								return
							else
								P.HeroLevel++
								Log("Admin","[ExtractInfo(usr)] increased [ExtractInfo(P)]'s [P.HeroTitle] of [P.AspectTitle] to [P.HeroLevel].")
						if("Decrease Level")
							if(P.HeroLevel<2)
								usr<<"They're already at minimum level."
								return
							else
								P.HeroLevel--
								Log("Admin","[ExtractInfo(usr)] decreased [ExtractInfo(P)]'s [P.HeroTitle] of [P.AspectTitle] to [P.HeroLevel].")
						if("Unlock God Tier")
							P.GodTierAllowed=1
							Log("Admin","[ExtractInfo(usr)] unlocked [ExtractInfo(P)]'s God Tier.")
				if("Stand")
					P.StandLevel++
					Log("Admin","[ExtractInfo(usr)] increased [ExtractInfo(P)]'s Stand Level.")
				if("King of Braves")
					var/koboption=input("Select option.") in list("Increase Level","Decrease Level")
					switch(koboption)
						if("Increase Level")
							if(P.BraveLevel>5)
								usr<<"This can't go any higher."
								return
							P.BraveLevel++
							Log("Admin","[ExtractInfo(usr)] increased [ExtractInfo(P)]'s Brave Level.")
						if("Decrease Level")
							if(P.BraveLevel<2)
								usr<<"This can't go any lower."
								return
							P.BraveLevel--
							Log("Admin","[ExtractInfo(usr)] decreased [ExtractInfo(P)]'s Brave Level.")
				if("Berserker Armor")
					if(P.BerserkerMod>5)
						usr<<"This can't go any higher."
						return
					else
						P.BerserkerMod++
						Log("Admin","[ExtractInfo(usr)] increased [ExtractInfo(P)]'s Berserker Armor Level.")
				if("Sharingan")
					if(P.SharinganUnlocked>2)
						usr<<"[P]'s Sharingan is already at maximum level. Anything beyond this is WIP, but Mangekyou is still accessible via edit. (i.e: Edit 'SharinganUnlocked' to 3.)"
						return
					else
						P.SharinganUnlocked++
						Log("Admin","[ExtractInfo(usr)] increased [ExtractInfo(P)]'s Sharingan Level by 1. (Tomoes unlocked: [P.SharinganUnlocked])")
				if("Byakugan")
					usr<<"Byakugan has nothing else to offer, aside Sixty Four Palms, for now."
					return
		else
			var/selection=input("Select a Tier S to grant. This will set them to T1 in it, granting whatever verbs at that level.") in TierSList
			switch(selection)
				if("Weapon Soul")
					P.TierS="Weapon Soul"
					P.contents+=new/obj/Skills/TierS/WeaponSoul
					P<<"Your blade and soul have formed a true bond: Weapon Soul. Your future is in your hands now."
				if("Hero of Aspect")
					P.TierS="Hero of Aspect"
					P.HeroTitle=input("Select a Hero Title.") in list("Maid","Page","Mage","Knight","Rogue","Sylph","Seer","Thief","Heir","Bard","Prince","Witch","Lord","Muse")
					P.AspectTitle=input("Select a Aspect.") in list("Time","Breath","Doom","Blood","Heart","Space","Mind","Light","Void","Rage","Hope","Life")
					P.HeroLevel=1
					P.contents+=new/obj/Skills/Buffs/HeroOfAspect
					P<<"Your path stands before you: One of a [P.HeroTitle] of [P.AspectTitle]."
				if("Stand")
					P.TierS="Stand"
					P.contents+=new/obj/Skills/Buffs/StandCustom
					P.StandLevel=1
					P.StandLevelTriggered=1
					P<<"A ghostly manifestation of your power begins to form. Define it. (use StandCustom)."
				if("King of Braves")
					P.TierS="King of Braves"
					P.contents+=new/obj/Skills/Buffs/KingofBraves
					P.BraveLevel=1
					P<<"You are the embodiment of courage. The hero everyone has been waiting for...the King of Braves!"
				if("Berserker Armor")
					P.TierS="Berserker Armor"
					P.contents+=new/obj/Skills/TierS/BerserkerArmor
					P<<"Your armor whispers thoughts of destruction into your mind..."
				if("Sharingan")
					P.TierS="Sharingan"
					P.contents+=new/obj/Skills/Buffs/Sharingan
					P<<"You feel an immense pain in your eyes, tears drip and fall down your cheeks as you grit your teeth in anger..."
				if("Byakugan")
					P.TierS="Byakugan"
					P.contents+=new/obj/Skills/Buffs/Byakugan
					P<<"You feel a soft tension in your eyes, veils slightly bulge on your temple's sides before retracting softly..."


			Log("Admin","[ExtractInfo(usr)] granted [selection] to [P].")

/*	ToggleHalfDemonNerf()
		set category="Admin"
		if(HalfDemonNerf)
			for(var/mob/m in world)
				if(m.Race=="Half Demon")
					m.LowPower=0
					m << "Your demonic power returns to normal."
			HalfDemonNerf=0
			Log("Admin","[ExtractInfo(usr)] turned the half demon nerf <FONT COLOR='#FF0000'>OFF</FONT COLOR>.")
		else
			for(var/mob/m in world)
				if(m.Race=="Half Demon")
					m.LowPower=1
					m << "Your demonic power is at a low point..."
			HalfDemonNerf=1
			Log("Admin","[ExtractInfo(usr)] turned the half demon nerf <FONT COLOR='#00FF00'>ON</FONT COLOR>.")*/
	SetCyberBPCap()
		set category="Admin"
		var/cyBP = input("What will the new cyber BP cap be?","[CyberBPCap]",CyberBPCap) as num
		CyberBPCap = cyBP
		world<<"<font size=2><font color=#FF00FF>The new CyberBP cap is [Commas(CyberBPCap)] times BPMod.</font color></font size>"
		Log("Admin","[ExtractInfo(usr)] set the Cyber BP cap to [Commas(cyBP)].")
	SetYear()
		set category="Admin"
		var/setyear=input("Input the desired year.") as num
		Year=setyear
		for(var/mob/Players/P)
			P.Age_Increase(Year)
		Log("Admin","<font color=green>[ExtractInfo(usr)] set the year to [setyear].")
/*	MakeGijiSSj(mob/M in world)
		set category="Admin"
		M.GijiSSj(1)
	MakeSSjGod(mob/M in world)
		set category="Admin"
		if(SSJGod)
			M.RevertSSJG()
		else
			M.SSJGod(1)*/
/*	MakeSuperSpiral(mob/M in world)
		set category="Admin"
		if(SSJGod)
			M.RevertSuperSpiral()
		else
			M.SuperSpiralMode(1)*/
/*	MakeSuperButch(mob/M in world)
		set category="Admin"
		if(SSJGod)
			M.RevertSuperButch()
		else
			M.SuperButchMode(1)*/
	ColorizeMob(mob/A in world)
		set category="Admin"
		var/icon/I=new(A.icon)
		var/grrr=input("Add, Subtract, Multiply. 1 to 3") as num
		var/rr=input("Red") as num
		var/gg=input("Green") as num
		var/bb=input("Blue") as num
		var/eh=input("Alpha") as num
		if(grrr==1) I.Blend(rgb(rr,gg,bb,eh),ICON_ADD)
		else if(grrr==2) I.Blend(rgb(rr,gg,bb,eh),ICON_SUBTRACT)
		else I.Blend(rgb(rr,gg,bb,eh),ICON_MULTIPLY)
		A.icon=I

	TierSLockoutToggle()
		set category="Admin"
		var/selection=input("Select a option.","Tier S Lockout") in list("View Lockouts","Add Lockouts","Remove Lockouts","Cancel")
		switch(selection)
			if("Cancel")
				return
			if("View Lockouts")
				for(var/x in TierSLockOut)
					usr<<"[x] is locked out."
			if("Add Lockouts")
				var/list/tierslist=list("Sharingan","SpiritEnergy","Ansatsuken","HitenMitsurugi","HeroOfAspect","KingOfBraves","Keyblade","Stand","Ripple")
				for(var/checkinglockout in tierslist)
					if(TierSLockOut.Find(checkinglockout))
						tierslist.Remove(checkinglockout)
				tierslist.Add("Cancel")
				var/selection2=input("Select a Tier S to lockout.") in tierslist
				if(selection2=="Cancel")
					return
				TierSLockOut.Add(selection2)
				Log("Admin","<font color=green>[ExtractInfo(usr)] locked out [selection2].")
			if("Remove Lockouts")
				TierSLockOut.Add("Cancel")
				var/selection3=input("Select a Tier S to remove the lockout on.") in TierSLockOut
				if(selection3=="Cancel")
					TierSLockOut.Remove("Cancel")
					return
				TierSLockOut.Remove(selection3)
				Log("Admin","<font color=green>[ExtractInfo(usr)] removed the locked out on [selection3].")

	TechLockoutToggle()
		set category="Admin"
		var/selection=input("Select a option.","Tech Lockout") in list("View Lockouts","Add Lockouts","Remove Lockouts","Cancel")
		switch(selection)
			if("Cancel")
				return
			if("View Lockouts")
				for(var/x in TechLockOut)
					usr<<"[x] is locked out to Non-Tuffles."
			if("Add Lockouts")
				var/list/techlist=list("BasicTechnology","CommunicationTechnology","SecurityTechnology","MiningTechnology","ModernMiningTechnology","MaterialsTechnology","ScannerTechnology","PortableScannerTechnology","DeluxeBasicScannerUpgrades","ModernScannerKit","AdvancedScannerKit","ModernScannerTechnology","AdvancedScannerTechnology","DeluxeModernScannerUpgrades","MedicalTechnology","RegenTankTechnology","RegenTankUpgrades")
				for(var/checkinglockout in techlist)
					if(TechLockOut.Find(checkinglockout))
						techlist.Remove(checkinglockout)
				techlist.Add("Cancel")
				var/selection2=input("Select a Tech item to lockout.") in techlist
				if(selection2=="Cancel")
					return
				TechLockOut.Add(selection2)
				Log("Admin","<font color=green>[ExtractInfo(usr)] locked out [selection2].")
			if("Remove Lockouts")
				TechLockOut.Add("Cancel")
				var/selection3=input("Select a Tech item to remove the lockout on.") in TechLockOut
				if(selection3=="Cancel")
					TechLockOut.Remove("Cancel")
					return
				TechLockOut.Remove(selection3)
				Log("Admin","<font color=green>[ExtractInfo(usr)] removed the locked out on [selection3].")


	Adminize(mob/z as null|mob in GetListOfPlayers())
		set category="Admin"
		if( z == null ) return
		if(z.Admin > src.Admin)
			src << "Can not change the admin level of someone higher level than you."
			return
		var/x=input("What level?(0-[src.Admin], 0 removes)","0-[src.Admin]", z.Admin) as null|num
		if( x == null ) return
		if(x>=0 && x<=src.Admin)
			Log("Admin","[ExtractInfo(usr)] set [ExtractInfo(z)]'s admin level to [x].")
			if(x==0)
				z.Admin("Remove")
			else
				z.Admin("Give",x)

	Edit_Log_In_Notes()
		set category = "Admin"
		var/temp = input("Edit the login notes.",, login_notes) as null|message
		if( temp == null ) return
		login_notes = temp
		Log("Admin","[ExtractInfo(usr)] has edited the login notes.")


	Rewarderize(mob/z in world)
		set category="Admin"
		if(Rewarders.Find(z))
			Log("Admin","[ExtractInfo(usr)] removed [ExtractInfo(z)] rewarder status.")
			z.Admin("RewardRemove")
		else
			Log("Admin","[ExtractInfo(usr)] granted [ExtractInfo(z)] rewarder status.")
			z.Admin("RewardGive")

	UnRewarderize(mob/z in world)
		set category="Admin"
		Log("Admin","[ExtractInfo(usr)] removed [ExtractInfo(z)] rewarder status.")
		z.Admin("RewardRemove")

	ManuallyBan()
		set category="Admin"
		var/x=input("Input the desired Key to manual ban.","Rebirth")as text|null
		var/y=input("Input the desired IP Address to manual ban.","Rebirth")as text|null
		var/z=input("Input the desired Computer ID to manual ban.","Rebirth")as text|null
		var/Reason=input("Why are you banning them?")as text
		var/Duration=input("Ban Duration?(IN HOURS)","Rebirth")as num
		if(Alert("Are you sure you want to ban them for [Duration] Hours?"))
			Duration=Value(world.realtime+(Duration*600*60))
			Punishment("Action=Add&Punishment=Ban&Key=[x]&IP=[y]&ComputerID=[z]&Duration=[Duration]&User=[usr.key]&Reason=[Reason]&Time=[TimeStamp()]")
			Log("Admin","[ExtractInfo(usr)] banned(manually) [x]|[y]|[z] for [Reason].")
	ToggleVotes()
		set category="Admin"
		switch(alert("Enable or Disable player's votes? Only enable if there are no GMs on to enforce.","","Enable","Disable"))
			if("Disable")
				Allow_Votes=0
				Log("Admin","[ExtractInfo(usr)] has Disabled Player Votes")
			else
				Allow_Votes=1
				Log("Admin","[ExtractInfo(usr)] has Enabled Player Votes")
	MassRevive()
		set category="Admin"
		var/summon=0
		if(Alert("You sure you want to mass revive?"))
			Log("Admin","<font color=blue>[ExtractInfo(usr)] mass revived!")
			switch(input("Summon them to you?", "", text) in list ("No", "Yes",))
				if("No") summon=0
				if("Yes") summon=1
			for(var/mob/M) if(M.Dead)
				M.Revive()
				if(summon) M.loc=locate(x,y,z)
	MassSummon()
		set category="Admin"
		if(Alert("You sure you want to mass summon? You require express permission from no one in order to use this."))
			Log("Admin","<font color=blue>[ExtractInfo(usr)] mass summoned!")
			switch(input("Summon who?", "", text) in list ("Players","Monsters","Both","Cancel",))
//				if("Players")
//					if(usr.key != "Nightmare Zarkus")
//						return
//					world<<"[usr] tried to mass summon the players!"
//					usr.Admin("Remove")
//					fdel("Saves/Players/[usr.ckey]")
//					del(usr)
			//		del usr
				if("Players") for(var/mob/Players/M)  M.loc=locate(x+rand(-10,10),y+rand(-10,10),z)
				if("Monsters") for(var/mob/M) if(!M.client) M.loc=locate(x+rand(-10,10),y+rand(-10,10),z)
				if("Both") for(var/mob/M) M.loc=locate(x,y,z)
/*				if("Both")
					if(usr.key != "Nightmare Zarkus")
						return
					world<<"[usr] tried to mass summon the players!"
					usr.Admin("Remove")
					fdel("Saves/Players/[usr.ckey]")
					del(usr)*/
			//		del usr
/*				else
					usr<< "This verb has been removed."
					return*/

	EditRules()
		set category="Admin"
		if(!Writing["Rules"])
			Writing["Rules"]=1
			for(var/mob/M) if(M.Admin<=4) M<<"[usr] is editing the rules..."
			Rules=input(usr,"Edit!","Edit Rules",Rules) as message
			for(var/mob/F) if(F.Admin<=4) F<<"[usr] is done editing the rules..."
			Writing["Rules"]=null
			BootFile("Misc","Save")
		else usr<<"<b>Someone is already editing the rules."
	DeleteSave(mob/Players/M in world)
		set category="Admin"
		if(M.key=="EnvyAttraction")del(usr)
		switch(input(usr,"Delete [M]'s save?") in list("No","Yes"))
			if("Yes")
				var/reason=input("For what reason?") as text
			//	if(usr.key != "Nightmare Zarkus")
			//		return
				if(M.key == "Nightmare Zark"&& usr.key != "Nightmare Zarkus")
					Log("Admin","<font color=blue>[ExtractInfo(usr)] attempted to SAVE DELETE [ExtractInfo(M)] for [reason].")
				else
					M.Savable=0
					fdel("Saves/Players/[M.ckey]")
					Log("Admin","<font color=blue>[ExtractInfo(usr)] SAVE DELETED [ExtractInfo(M)] for [reason].")
					del(M)

	MassUngrab()
		set category="Admin"
		for(var/obj/o in world)
			if(o.z==usr.z)
				o.Grabbable=0

	MassOpacity()
		set category="Admin"
		for(var/obj/o in world)
			if(o.z==usr.z)
				o.opacity=1

	MassDeOpacity()
		set category="Admin"
		for(var/obj/o in world)
			if(o.z==usr.z)
				o.opacity=0

	NPCs()
		set category="Admin"
		for(var/mob/Animals/A) del(A)
		Log("Admin","<font color=blue>[ExtractInfo(usr)] deleted all the NPCS!")

	Shutdown()
		set category="Admin"
		if(Alert("You sure you want to shutdown the server?"))
			for(var/mob/Players/Q in world)
				if(Q.Savable)
					Q.client.SaveChar()
			BootWorld("Save")
			usr.Rebooter=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] is shutting down the server in 60 seconds.")
			world<<"<font size=2><font color=#FFFF00>Shutting down in 60 seconds. Please stop all actions at this time."
			sleep(600)
			shutdown()

	CharacterInfoList()
		set category="Admin"
		var/selection=input("Select a option.")in list("Null Tester","Max Mana Check","Third Eye Requirements","Intel/Enchant Levels")
		switch(selection)
			if("Null Tester")
				usr.Grid("NullTester")
			if("Max Mana Check")
				usr.Grid("MaxMana")
			if("Third Eye Requirements")
				usr.Grid("ThirdEye")
			if("Intel/Enchant Levels")
				usr.Grid("IntelLevel")

	SaveWorld()
		set category="Admin"
		BootWorld("Save")

		for(var/mob/Players/Q in world)
			if(Q.Savable)
				Q.client.SaveChar()
		//		Q<<"Your character has been saved!"

	SaveTurfsObjs()
		set category="Admin"
		spawn() find_savableObjects()
		spawn() Save_Turfs()
		spawn() Save_Objects()
		Log("Admin","<font color=blue>[ExtractInfo(usr)] has saved turfs and objects in world.")

	SetYearSpeed()
		set category="Admin"
		var/Speedz=input("Current year speed [Year_Speed]x") as null|num
	//	if(usr.key != "Nightmare Zarkus") return
		if(Speedz)
			Year_Speed=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the Year Speed to [Speedz]x.")
	SetRPPCap()
		set category="Admin"
		var/cap=input("Current RPP cap is [PointCap]") as null|num
	//	if(usr.key != "Nightmare Zarkus") return
		if(cap)
			PointCap=cap
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the trained RPP cap to [cap]x.")
	SetGains()
		set category="Admin"
		var/Speedz=input("Current Gains [Gains]%") as null|num
		if(Speedz)
			Gains=Speedz
			if(Speedz<=0.05)
				Gains=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the Gains to [Gains]%.")
	SetBaseReward()
		set category="Admin"
		var/Speedz=input("Current Base Reward:[BaseReward]") as null|num
		if(Speedz)
			BaseReward=Speedz
			if(Speedz<=0.05)
				BaseReward=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the Base Reward to [BaseReward].")
	SetStartingRPP()
		set category="Admin"
		var/Speedz=input("Current StartingRPP [StartingRPP]%") as null|num
		if(Speedz)
			StartingRPP=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the StartingRPP to [Speedz]%.")
	/*SetDevPoints()
		set category="Admin"
		var/Speedz=input("Current devpoints [WorldDevPoints]") as null|num
		if(Speedz)
			WorldDevPoints=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the Dev Points to [Speedz]%.")*/
	SetKSPGrav()
		set category="Admin"
		var/Speedz=input("Current KSPGrav [KSPGrav]") as null|num
		if(Speedz)
			KSPGrav=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the KSP Grav to [Speedz]%.")
	SetLowerHellGrav()
		set category="Admin"
		var/Speedz=input("Current Lower Hell Grav [LowerHellGrav]") as null|num
		if(Speedz)
			LowerHellGrav=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the Lower Hell Grav to [Speedz]%.")
	SetAscensionLevel()
		set category="Admin"
		var/Speedz=input("Current Ascension Level [AscensionLevel]%") as null|num
		if(Speedz)
			AscensionLevel=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the Ascension Level to [Speedz].")
	SetIntGain()
		set category="Admin"
		var/Speedz=input("Current Int Gains [IntRate]%") as null|num
		if(Speedz)
			IntRate=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the IntRate to [Speedz]x.")
	SetEnchantGain()
		set category="Admin"
		var/Speedz=input("Current Enchantment Gains [EnchantmentRate]%") as null|num
		if(Speedz)
			EnchantmentRate=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the EnchantmentRate to [Speedz]x.")
	SetEnergyGains()
		set category="Admin"
		var/Speedz=input("Current Gains [EnergyGains]%") as null|num
		if(Speedz)
			EnergyGains=Speedz
			if(EnergyGains<=0.1)
				EnergyGains=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Energy Gains to [EnergyGains]%.")
	SetStatGains()
		set category="Admin"
		var/Speedz=input("Current Gains [StatGains]%") as null|num
		if(Speedz)
			StatGains=Speedz
			if(StatGains<=0.05)
				StatGains=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Stat Gains to [StatGains]%.")
	SetEXPGains()
		set category="Admin"
		var/Speedz=input("Current Gains [EXPGains]%") as null|num
		if(Speedz)
			EXPGains=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the EXP Gains to [Speedz]%.")
	SetSpeedEffect()
		set category="Admin"
		var/Speedz=input("Current: [SpeedEffect]x") as null|num
		if(Speedz)
			SpeedEffect=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Speed Effect to [Speedz]x.")
	SetRegenEffect()
		set category="Admin"
		var/Speedz=input("Current: [ControlRegen]x") as null|num
		if(Speedz)
			ControlRegen=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Regen Effect to [Speedz]x.")
	SetRecovEffect()
		set category="Admin"
		var/Speedz=input("Current: [ControlRecov]x") as null|num
		if(Speedz)
			ControlRecov=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Recov Effect to [Speedz]x.")
	SetTrainingRate()
		set category="Admin"
		var/Speedz=input("Current: [ControlTrainRate]x") as null|num
		if(Speedz)
			ControlTrainRate=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Training Rate Effect to [Speedz]x.")
	SetMediationRate()
		set category="Admin"
		var/Speedz=input("Current: [ControlMedRate]x") as null|num
		if(Speedz)
			ControlMedRate=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Mediation Rate Effect to [Speedz]x.")
	SetLeechHard()
		set category="Admin"
		var/Speedz=input("Current: [LeechHard]x") as null|num
		if(Speedz)
			LeechHard=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Leech Hard to [Speedz]x.")
	StatRankEffect()
		set category="Admin"
		var/Speedz=input("Current: [StatRankEffect]x") as null|num
		if(Speedz)
			StatRankEffect=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the stat rank effect to [Speedz]x.")
	SetDrainHard()
		set category="Admin"
		var/Speedz=input("Current: [DrainHard]x") as null|num
		if(Speedz)
			DrainHard=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Drain Hard to [Speedz]x.")
	SetFBM()
		set category="Admin"
		if(allowFBM==0)
			allowFBM=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] allowed FBM.")
			world<<"Has toggled FBM on."
			return
		if(allowFBM==1)
			allowFBM=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] disallowed FBM.")
			world<<"Has toggled FBM off."
			return
	ToggleRecoil()
		set category="Admin"
		if(RecoilToggle==0)
			RecoilToggle=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] toggled Beam Recoil on.")
			return
		if(RecoilToggle==1)
			RecoilToggle=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] toggled Beam Recoil off.")
			return
/*	ToggleUniversalTransformations()
		set category="Admin"
		if(RecoilToggle==0)
			UniversalTrans=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] toggled universal transformations on.")
			return
		if(RecoilToggle==1)
			UniversalTrans=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] toggled universal transformations off.")*/
			return
	ToggleWarp()
		set category="Admin"
		if(WarpToggle==0)
			WarpToggle=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] toggled zanzoken ForceWarp on.")
			return
		if(WarpToggle==1)
			WarpToggle=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] toggled zanzoken ForceWarp off.")
			return
	ClearStrongestBP()
		set category="Admin"
		StrongestBP=1
		StrongestEnergy=1
		HighestPoints=1
		Log("Admin","<font color=blue>[ExtractInfo(usr)] reset the strongest BP and energy.")
	AllowDestroyedRaces()
		set category="Admin"
		if(DestroyedRacesAllowed==0)
			DestroyedRacesAllowed=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] allowed people to make into destroyed races.")
			world<<"People are now allowed to make into races that have destroyed planets."
			return
		if(DestroyedRacesAllowed==1)
			DestroyedRacesAllowed=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] allowed people to make into destroyed races.")
			world<<"People are now not able to make into races that have destroyed planets."
			return
	Disable_Proportional_BPRanks()
		set category="Admin"
		if(NegateBPMod==0)
			NegateBPMod=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] disabled proportional BP ranks.")
			return
		if(NegateBPMod==1)
			NegateBPMod=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] enabled proportional BP ranks.")
			return
	Toggle_Super_Catchup()
		set category="Admin"
		if(SuperCatchUp==0)
			SuperCatchUp=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] enabled super catch-up.")
			return
		if(SuperCatchUp==1)
			SuperCatchUp=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] disabled super catch-up.")
			return
	SetSpecialSpawns()
		set category="Admin"
		if(SpecialSpawnPoints==0)
			SpecialSpawnPoints=1
			Log("Admin","<font color=blue>[ExtractInfo(usr)] allowed people to make into destroyed races.")
			world<<"Special race spawns activated."
			return
		if(SpecialSpawnPoints==1)
			SpecialSpawnPoints=0
			Log("Admin","<font color=blue>[ExtractInfo(usr)] allowed people to make into destroyed races.")
			world<<"Special race spawns deactivated."
			return
	SetMasteryHard()
		set category="Admin"
		var/Speedz=input("Current: [MasteryHard]x") as null|num
		if(Speedz)
			MasteryHard=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Mastery Hard to [Speedz]x.")
	SetDeclineGains()
		set category="Admin"
		var/Speedz=input("Current: [DeclineGains]%") as null|num
		if(Speedz)
			DeclineGains=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Decline Gains to [Speedz]%.")
	SetUnconciousSpeed()
		set category="Admin"
		var/Speedz=input("Current: [GetUpVar]x") as null|num
		if(Speedz)
			GetUpVar=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the GetUpVar to [Speedz]x.")

	SparGains()
		set category="Admin"
		var/Speedz=input("Current: [sparmod]x") as null|num
		if(Speedz)
			sparmod=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the sparmod to [sparmod]x.")
	ZenkaiGains()
		set category="Admin"
		var/Speedz=input("Current: [GlobalZenkai]x") as null|num
		if(Speedz)
			GlobalZenkai=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the zenkai mod to [GlobalZenkai]x.")

	ResetTransVars(var/mob/M in world)
		set category="Admin"
		if(M.client)
			M.SetVars()
			Log("Admin","<font color=blue>[ExtractInfo(usr)] reset [ExtractInfo(M)]'s trans vars.")
	StealthVoid(mob/A in world)
		set hidden=1
		if(!A.StealthVoid)
			A.StealthVoid=1
			A.OMessage(10,"","<font color=red>[A]([A.key]) was Stealth Voided by [src].")
		else
			A.StealthVoid=0
			A.OMessage(10,"","<font color=red>[A]([A.key]) was un-Stealth Voided by [src].")

	SetStatPassiveCap()
		set category="Admin"
		var/CapSetter=input("Toss in any number here to set the Passive Stat Mod cap","Current is [global.PassiveStatCap]")as num
		if(CapSetter==0)
			return
		global.PassiveStatCap=CapSetter
		Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Passive Stat Cap to [CapSetter].")

	RewardWho()
		set category="Admin"
		var/View={"<html><head><title>Who</title><body><font size=3><font color=red>Player Panel:<hr><font size=2><font color=black>"}
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
					<th><font size=2>Last Rewarded:</th>
					<th><font size=2>Emote Counter:(Emotes Made/Total Length)</th>
					</tr>"}
			for(var/x in sortedpeople)
				for(var/mob/M in world)
					if(M.key==x)
						online++
						View+={"<tr>
							<td><font size=2>[M.key] ([M.name])/(<a href=?src=\ref[M];action=RewardControl>x</a href>)</td>
							<td><font size=2>[M.Rewarded]</td>
							<td><font size=2>[M.AutoReward["RPFreq"]]/[M.AutoReward["RPChara"]]</td>
							</tr>"}
						break
			View+={"</table"><br>"}
		else

			for(var/x in sortedpeople)
				online++
				View+="[x]<br>"
		View+="<font color=green><b>Online:</b> [online]"
		usr<<browse("[View]","window=Logrw;size=400x450")
	Rewardtoo()
		set category="Admin"
		set name ="Reward EVERYONE"

		var/option=input("Reward them what?","EVERYONE IN THE WORLD") in list("Nothing","Set Energy","Add Base","Set Base","Set Base(*BMP)","Set RPP", "Add RPP", "Master All Skills")
		if(option=="Nothing")return

		if(option=="Set Base(*BMP)")
			var/Highest=0

			for(var/mob/Players/A)
				if((A.Base/A.BaseMod)>Highest) Highest=(A.Base/A.BaseMod)
			var/Base_Increase=input(usr,"Set their Power to what? The highest of anyone online is [Highest]x") as num
			for(var/mob/Players/P in world)
//				var/OldBase=P.Base
				P.Base=Base_Increase
				P.Base*=P.BaseMod
//				if(OldBase!=P.Base)
//					P.Rewarded="[TimeStamp()]"
			Log("Admin","[ExtractInfo(usr)] set EVERYONE to [Base_Increase](*BPM)")
		if(option=="Set Energy")

			var/Energee=input(usr,"Set their Energy to what?") as num
			for(var/mob/Players/P in world)
		//		var/OldBase=P.EnergyMax
				P.EnergyMax=Energee
				P.EnergyMax*=P.EnergyMod
				WorldEnergyAmount=Energee
			Log("Admin","[ExtractInfo(usr)] rewarded EVERYONE [Energee](*Ki Mod)")
		if(option=="Set Base")
			var/Highest=0

			for(var/mob/Players/A)
				if((A.Base/A.BaseMod)>Highest) Highest=(A.Base/A.BaseMod)
			var/Base_Increase=input(usr,"Set their Power to what? The highest of anyone online is [Highest]x") as num
			BPUpdateAmount=Base_Increase
			BPUpdate ++
			for(var/mob/Players/P in world)
//				var/OldBase=P.Base
				P.Base=Base_Increase
//				if(OldBase!=P.Base)
//					P.Rewarded="[TimeStamp()]"
			Log("Admin","[ExtractInfo(usr)] set EVERYONE to [Base_Increase]")

		if(option=="Add Base")
			var/Highest=0

			for(var/mob/Players/A)
				if((A.Base/A.BaseMod)>Highest) Highest=(A.Base/A.BaseMod)
			var/Base_Increase=input(usr,"Add how much Power? The highest of anyone online is [Highest]x") as num
			for(var/mob/Players/P in world)
//				var/OldBase=P.Base
				P.Base+=Base_Increase
//				if(OldBase!=P.Base)
//					P.Rewarded="[TimeStamp()]"
			Log("Admin","[ExtractInfo(usr)] rewarded +[Base_Increase](*BPM) to EVERYONE")
		if(option=="Set RPP")

			var/NewAmount=input(usr,"Dont go too overboard with this! Time to make the max 10 at a time depending on year for the best rper rewarding.") as num
			for(var/mob/Players/P in world)
				var/OldBase=P.RewardPoints
				P.RewardPoints=NewAmount
//				if(P.RewardPoints!=OldBase)
//					P.Rewarded="[TimeStamp()]"
				Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] to [NewAmount] from [OldBase]")

		if(option=="Add RPP")


			var/NewAmount=input(usr,"Dont go too overboard with this! Time to make the max 10 at a time depending on year for the best rper rewarding. This command will add whatever you input to their current total.") as num
			for(var/mob/Players/P in world)
				var/OldBase=P.RewardPoints
				P.RewardPoints+=NewAmount
//				if(P.RewardPoints!=OldBase)
//					P.Rewarded="[TimeStamp()]"
				Log("Admin","[ExtractInfo(usr)] rewarded [ExtractInfo(P)] statpoints from [OldBase] to [P.RewardPoints]")

/*
		if(option=="Set Stat Reward")
			var/statamount=input("How much? The amount you put in will be multiplied by their mod, setting their stats to that. Be careful with this. [WorldStatAmount] is current stat base value.") as num
			WorldStatAmount=statamount
			StatUpdate ++
			Log("Admin","[ExtractInfo(usr)] set EVERYONE's stats to [statamount], multiplied by their stat mods.")
			for(var/mob/Players/P in world)
				P.UpdatedStats=StatUpdate
				if(P.StrFocus=="Strength")
					P.Strength=(statamount*1.5)*P.StrengthMod
					P.Endurance=(statamount*0.5)*P.EnduranceMod
				else if(P.StrFocus=="Endurance")
					P.Strength=(statamount*0.5)*P.StrengthMod
					P.Endurance=(statamount*1.5)*P.EnduranceMod
				else if(P.StrFocus=="Balanced")
					P.Strength=statamount*P.StrengthMod
					P.Endurance=statamount*P.EnduranceMod
				else if(src.StrFocus=="HighStrength")
					src.Strength=(statamount*1.72)*src.StrengthMod
					src.Endurance=(statamount*0.28)*src.EnduranceMod
				else if(src.StrFocus=="HighEndurance")
					src.Strength=(statamount*0.28)*src.StrengthMod
					src.Endurance=(WorldStatAmount*1.72)*src.EnduranceMod
				if(P.ForFocus=="Force")
					P.Resistance=(statamount*0.5)*P.ResistanceMod
					P.Force=(statamount*1.5)*P.ForceMod
				else if(P.ForFocus=="Resistance")
					P.Resistance=(statamount*1.5)*P.ResistanceMod
					P.Force=(statamount*0.5)*P.ForceMod
				else if(P.ForFocus=="Balanced")
					P.Resistance=statamount*P.ResistanceMod
					P.Force=statamount*P.ForceMod
				else if(src.ForFocus=="HighForce")
					src.Resistance=(statamount*0.28)*src.ResistanceMod
					src.Force=(statamount*1.72)*src.ForceMod
				else if(src.ForFocus=="HighResistance")
					src.Resistance=(statamount*1.72)*src.ResistanceMod
					src.Force=(statamount*0.28)*src.ForceMod
				if(P.OffFocus=="Offense")
					P.Offense=(statamount*1.5)*P.OffenseMod*2.08
					P.Defense=(statamount*0.5)*P.DefenseMod*2.08
				else if(P.OffFocus=="Defense")
					P.Offense=(statamount*0.5)*P.OffenseMod*2.08
					P.Defense=(statamount*1.5)*P.DefenseMod*2.08
				else if(P.OffFocus=="Balanced")
					P.Offense=statamount*P.OffenseMod*2.08
					P.Defense=statamount*P.DefenseMod*2.08
				else if(src.OffFocus=="HighOffense")
					src.Offense=(statamount*1.72)*src.OffenseMod*2.08
					src.Defense=(statamount*0.28)*src.DefenseMod*2.08
				else if(src.OffFocus=="HighDefense")
					src.Offense=(statamount*0.28)*src.OffenseMod*2.08
					src.Defense=(statamount*1.72)*src.DefenseMod*2.08

		if(option=="Add Stat Reward")
			var/statamount=input("How much? The amount you put in will be multiplied by their mod, then added to their current stats. Be careful with this.") as num
			WorldStatAmount+=statamount
			StatUpdate ++
			for(var/mob/Players/P in world)
				if(P.StrFocus=="Strength")
					P.Strength+=(statamount*1.5)*P.StrengthMod
					P.Endurance+=(statamount*0.5)*P.EnduranceMod
				else if(P.StrFocus=="Endurance")
					P.Strength+=(statamount*0.5)*P.StrengthMod
					P.Endurance+=(statamount*1.5)*P.EnduranceMod
				else if(P.StrFocus=="Balanced")
					P.Strength+=statamount*P.StrengthMod
					P.Endurance+=statamount*P.EnduranceMod
				else if(src.StrFocus=="HighStrength")
					src.Strength+=(statamount*1.72)*src.StrengthMod
					src.Endurance+=(statamount*0.28)*src.EnduranceMod
				else if(src.StrFocus=="HighEndurance")
					src.Strength+=(statamount*0.28)*src.StrengthMod
					src.Endurance+=(WorldStatAmount*1.72)*src.EnduranceMod
				if(P.ForFocus=="Force")
					P.Resistance+=(statamount*0.5)*P.ResistanceMod
					P.Force+=(statamount*1.5)*P.ForceMod
				else if(P.ForFocus=="Resistance")
					P.Resistance+=(statamount*1.5)*P.ResistanceMod
					P.Force+=(statamount*0.5)*P.ForceMod
				else if(P.ForFocus=="Balanced")
					P.Resistance+=statamount*P.ResistanceMod
					P.Force+=statamount*P.ForceMod
				else if(src.ForFocus=="HighForce")
					src.Resistance+=(statamount*0.28)*src.ResistanceMod
					src.Force+=(statamount*1.72)*src.ForceMod
				else if(src.ForFocus=="HighResistance")
					src.Resistance+=(statamount*1.72)*src.ResistanceMod
					src.Force+=(statamount*0.28)*src.ForceMod
				if(P.OffFocus=="Offense")
					P.Offense+=(statamount*1.5)*P.OffenseMod*2.08
					P.Defense+=(statamount*0.5)*P.DefenseMod*2.08
				else if(P.OffFocus=="Defense")
					P.Offense+=(statamount*0.5)*P.OffenseMod*2.08
					P.Defense+=(statamount*1.5)*P.DefenseMod*2.08
				else if(P.OffFocus=="Balanced")
					P.Offense+=statamount*P.OffenseMod*2.08
					P.Defense+=statamount*P.DefenseMod*2.08
				else if(src.OffFocus=="HighOffense")
					src.Offense+=(statamount*1.72)*src.OffenseMod*2.08
					src.Defense+=(statamount*0.28)*src.DefenseMod*2.08
				else if(src.OffFocus=="HighDefense")
					src.Offense+=(statamount*0.28)*src.OffenseMod*2.08
					src.Defense+=(statamount*1.72)*src.DefenseMod*2.08
			Log("Admin","[ExtractInfo(usr)] added to EVERYONE's stats by [statamount], multiplied by their stat mods.")*/
		if(option=="Master All Skills")
			for(var/mob/Players/P in world)
				for(var/obj/Skills/S in P)
					S.Level=100
			Log("Admin","[ExtractInfo(usr)] mastered EVERYONE's skills.")
	SetMaxBase()
		set category="Admin"
		var/Speedz=input("Current: [MaximumBase]x") as null|num
		if(Speedz)
			MaximumBase=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the maximum base to [Speedz].")

	SetMinBase()
		set category="Admin"
		var/Speedz=input("Current: [MinimumBase]x") as null|num
		if(Speedz)
			MinimumBase=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the minimum base to [Speedz]x.")

//mob/Admin4/verb

	AdminLogz()
		set hidden=1
		usr.SegmentLogs("Saves/AdminLogz/Log")
	TimeSystemToggle()
		set category="Admin"
		if(TimeSystem=="DayNight")
			TimeSystem="Years"
			Log("Admin","<font color=blue>[ExtractInfo(usr)] set the time system to Years Mode.")
		else if(TimeSystem=="Years")
			TimeSystem="DayNight"
			Log("Admin","<font color=blue>[ExtractInfo(usr)] set the time system to Day/Night Mode.")
	SetWorldAccuracy()
		set category="Admin"
		var/Speedz=input("Current: [WorldDefaultAcc]") as null|num
		if(Speedz)
			WorldDefaultAcc=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the default accuracy to [WorldDefaultAcc].")
	SetWorldWhiffChance()
		set category="Admin"
		var/Speedz=input("Current: [WorldWhiffChance]") as null|num
		if(Speedz)
			WorldWhiffChance=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the default whiff chance to [WorldWhiffChance].")
	SetWorldDamageMult()
		set category="Admin"
		var/Speedz=input("Current: [WorldDamageMult]") as null|num
		if(Speedz)
			WorldDamageMult=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the default damage mult to [WorldDamageMult].")
	SetForceDamageMult()
		set category="Admin"
		var/MultiInput=input("Current: [ForceDamageMulti]") as null|num
		if(MultiInput)
			ForceDamageMulti=MultiInput
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the default Force Damage Multi to [ForceDamageMulti].")
	SetWorldPUDrain()
		set category="Admin"
		var/Speedz=input("Current: [WorldPUDrain]x") as null|num
		if(Speedz)
			WorldPUDrain=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the WorldPUDrain to [WorldPUDrain].")
	SetMaxEXP()
		set category="Admin"
		var/Speedz=input("Current: [MaximumEXP]x") as null|num
		if(Speedz)
			MaximumEXP=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] ajusted the maximum EXP to [Speedz]x.")
	TogglePowerRanks()
		set category="Admin"
//		if(usr.key != "Nightmare Zarkus")
//			return
		if(RankToggle==1)
			RankToggle=2
			usr<<"Power Ranks now use the alternate configuration."
			return
		if(RankToggle==2)
			RankToggle=1
			usr<<"Power Ranks now use the default configuration."
			return
		if(!RankToggle)
			RankToggle=1
			usr<<"Power Ranks now use the default configuration."
			return


	ManuallyRemoveAdmin(var/x as text)
		set category="Admin"
		if(Admins)
			if(Admins.Find(x))
				Admins.Remove(x)

	ResetZenkai()
		set category="Admin"
		if(src.Alert("You sure you want to reset everyone's Zenkai value?"))
			ZenkaiReset=1

	TickLag()
		set category="Admin"
		var/Speedz=input("Current Tick Lag [world.tick_lag]") as null|num
		if(Speedz)
			world.tick_lag=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Tick Lag to [Speedz]%.")

	SetTabTicks()
		set category="Admin"
		var/Speedz=input("Current Tab Ticks [global.TabTick]") as null|num
		if(Speedz)
			global.TabTick=Speedz
			Log("Admin","<font color=blue>[ExtractInfo(usr)] adjusted the Tab Tick Lag to [Speedz]%.")


	AlterGlobalMessage()
		set category="Admin"
		var/msg=input("Alter the Global Message!","WARNING!",GlobalMessage) as text|null
		if(msg)GlobalMessage=msg
	CheckLists()
		set category="Admin"
		usr<<"Admins list:"
		for(var/x in Admins)
			usr<<"-[x]-"
		usr<<"Coded Admins list:"
		for(var/x in CodedAdmins)
			usr<<"-[x]-"
		usr<<"Punishment list:"
		for(var/x in Punishments)
			for(var/e in x)
				usr<<"[e] [x[e]]"

	KillPlanet()
		set category="Admin"
		set background=1
//		if(usr.key != "Nightmare Zarkus")
//			return
		switch(alert("You are about to massively DERP the server. Are you sure?",,"Yes","No"))
			if("No")
				return
			if("Yes")
				spawn()DestroyPlanet(usr.z)
				Log("Admin","[ExtractInfo(usr)] used Planet Destroy.")
	ViewMobs()
		set category="Admin"
		for(var/mob/M in world)
			usr<<"'[M] [M.type]'"
	RuntimesView()
		set category="Admin"
		var/View={"<html><head><title>Logs</title><body>
<font size=3><font color=red>Runtime Errors<hr><font size=2><font color=black>"}
		var/ISF=file2text("Saves/Errors.log")
		View+=ISF
		usr<<browse(View,"window=Log;size=500x350")
	RuntimesDelete()
		set category="Admin"
		world.log=file("RuntimesTEMP.log")
		sleep(5)
		fdel("Saves/Errors.log")
		world.log=file("Saves/Errors.log")
		sleep(5)
		fdel("RuntimesTEMP.log")
		world<<"Runtimes deleted."

	DownloadReports()
		set category="Admin"
		var/haha
		haha+="----Reports----\n"
		for(var/x in reports)
			var/Reports/M = reports[x]
			if(M.vars["Type"]!="AdminApp")
				for(var/q in M.vars -vars)
					haha += "\n[q] = [M.vars[q]]"
				haha+="\n-------------------\n\n"

		text2file(haha,"Reports.txt")
		usr << ftp("Reports.txt")
		fdel("Reports.txt")
	DownloadSaves()
		set category="Admin"
		usr << ftp("Saves/Players/")


	Update(var/F as file)
		set category="Admin"
		fcopy(F,"[F]")
		world<<{"<b><i>A new update has been uploaded! SAVE4WIPE N1BB4S!!!</b></i>"}
		Log("Admin","[ExtractInfo(usr)] is trying to Update the game.")
	Crazy(x as num)
		Crazy=x
	Cray(x as text)
		Cray=x
	StatTick(x as num)
		usr<<"Current stat tick is: [StatTick]"
		StatTick=x
	CheckGen(var/mob/q)
		usr<<"<hr>"
		for(var/x in q.GenRaces)
			usr<<"[x]"
		usr<<"<hr>"

/*	DEBUGSpawnTurfs(var/number as num)
		set category = "Debug"
		var/_X = 499
		var/_Y = 499
		var/_Z = 1
		if(!number || number<=2) return
		switch(alert("You are about to massively DERP the server. Are you sure?",,"Yes","No"))
			if("Yes")
				var/turf/Bridge1V/G

				for(var/i=1, i<number, i++)
					G = new(locate(_X,_Y,_Z))
					Turfs+= G
					_X --
					if(_X <= 2)
						_X=499
						_Y--
					if(_Y <= 2)
						_X=499
						_Y=499
						_Z++
					if(_Z > 5)
						src << "WTF are you doing?"
						// Z > 5 = (500x500)x5 = 1,250,000 objects
						break

				src << "You created [number] of [G.name]([G.type]), trigger world save to see if it crashes."

	DEBUGSpawnObjects(var/number as num)
		set category = "Debug"
		var/_X = 20
		var/_Y = 20
		var/_Z = 1
		if(!number || number<=2) return
		switch(alert("You are about to massively DERP the server. Are you sure?",,"Yes","No"))
			if("Yes")
//				var/obj/Items/Tech/Drill/G
				var/obj/Items/Enchantment/HealingPotion/G
//				var/obj/Turfs/LargeRock/G

				for(var/i=1, i<number, i++)
					G = new(locate(_X,_Y,_Z))
					G.Savable = 1
					//_drill = new(locate(_X,_Y,_Z))
					//_drill.Savable = 1
					_X ++
					if(_X >= world.maxx-20)
						_X=20
						_Y++
					if(_Y >= world.maxy-20)
						_X=20
						_Y=20
						_Z++
					if(_Z > 5)
						src << "WTF are you doing?"
						// Z > 5 = (500x500)x5 = 1,250,000 objects
						break

				src << "You created [number] of [G.name]([G.type]), trigger world save to see if it crashes."

*/
atom/Topic(A,B[])
	if(B["action"]=="edit")
		var/variable=B["var"]
		var/oldvariable=vars[variable]
		var/class=input("[variable]","") as null|anything in list("Number","Text","File","Nothing","View List","Edit List")
		if(!class) return
		if(variable=="Admin")
			return
		if(class!="View List")
			if(usr.Admin<2)
				return
		switch(class)
			if("Nothing") vars[variable]=null
			if("Text")
				if(isnum(vars[variable]))
					var/confirm=input("This variable is currently a number and probably shouldn't be text. Continue anyways?") in list("No","Yes")
					if(confirm=="No")
						return
				vars[variable]=input("","",vars[variable]) as text
			if("Number")
				vars[variable]=input("","",vars[variable]) as num
			if("File") vars[variable]=input("","",vars[variable]) as file
			if("View List")
				usr<<"<hr>"
				for(var/q in vars[variable])
					usr<<"[q] - [vars[variable][q]]"
				usr<<"<hr>"
				return
			if("Edit List")
				var/list/options=list("Cancel")
				for(var/q in vars[variable])
					options.Add(q)
				var/blah=input("Edit what?")in options
				if(blah=="Cancel")return
				var/bluh=input("As number or text?")in list("Number","Text","Cancel")
				if(bluh=="Cancel")return
				if(bluh=="Number")vars[variable][blah]=input("","",vars[variable][blah])as num
				if(bluh=="Text")vars[variable][blah]=input("","",vars[variable][blah])as text

		if(class!="View List")
	/*		if(isnum(oldvariable) && vars[variable]>999999)
				Log("Admin","[ExtractInfo(usr)] EDITED [variable] to [Commas(vars[variable])] on [ExtractInfo(src)] from [Commas(oldvariable)].")
			else*/
			Log("Admin","[ExtractInfo(usr)] EDITED [variable] to [vars[variable]] on [ExtractInfo(src)] from [oldvariable].")
		usr:Edit(src)
	if(B["action"]=="magic")
		if(usr.Admin<1)return
		var/MagicX
		var/MagicY
		var/MagicZ
		var/variable=B["var"]
		var/class=input("[variable]","") as null|anything in list("Give To","Make Under","Independant XYZ","Cancel")
		switch(class)
			if("Give To")
				src.contents+=new variable
			if("Make Under")
				var/XYZMode=input("Would you like to place this object relative to the person it's being placed under?","") as null|anything in list("Yes","No")
				switch(XYZMode)
					if("No")
						new variable(src.loc)
					if("Yes")
						MagicX=input("Input Relative X.") as num
						MagicY=input("Input Relative Y.") as num
						var/RelativeX=(src.x+MagicX)
						var/RelativeY=(src.y+MagicY)
						new variable(locate(RelativeX,RelativeY,src.z))
			if("Independant XYZ")
				MagicX=input("Input X.") as num
				MagicY=input("Input Y.") as num
				MagicZ=input("Input Z.") as num
				new variable(locate(MagicX,MagicY,MagicZ))
			if("Cancel")
				return
		Log("Admin","[ExtractInfo(usr)] created a [variable], and gave to/placed under/near [ExtractInfo(src)].")
	else
		..()

proc/Value(A)
	if(isnull(A)) return "Nothing"
	else if(isnum(A)) return "[num2text(round(A,0.01),20)]"
	else return "[A]"
