mob
	proc
		AnyPassiveSpent()
			if(src.StrengthPassive||src.EndurancePassive||src.SpeedPassive||src.ForcePassive||src.ResistancePassive||src.RecoveryPassive||src.OffensePassive||src.DefensePassive)
				return 1
			return 0
/*mob/Players/verb
	rpp500dp()
		set hidden=1
		if((usr.RewardPoints)<500)
			usr<<"You need at least 500 Reward Points to convert into Dev Points."
			return
		/*if((usr.RewardPoints-(usr.TrainedRPP-usr.UsedTrainedRPP))<500)
			usr << "You can't use trained Reward points for Dev points."
			return*/
		if(usr.PurchasedDevPoints+3>21)
			usr << "You can only buy 21 dev points."
			return
		else
			usr.RewardPoints-=500
			usr.SpendableDevPoints+=3
			usr.TotalDevPoints+=3
			usr<<"You exchange 500 RPP for 3 Dev Points."

	rpp400dp()
		set hidden=1
		if((usr.RewardPoints)<400)
			usr<<"You need at least 400 Reward Points to convert into Dev Points."
			return
		/*if((usr.RewardPoints-(usr.TrainedRPP-usr.UsedTrainedRPP))<400)
			usr << "You can't use trained Reward points for Dev points."
			return*/
		if(usr.PurchasedDevPoints+2>21)
			usr << "You can only buy 21 dev points."
			return
		else
			usr.RewardPoints-=400
			usr.SpendableDevPoints+=2
			usr.TotalDevPoints+=2
			usr<<"You exchange 400 RPP for 2 Dev Points."

	rpp200dp()
		set hidden=1
		if((usr.RewardPoints)<200)
			usr<<"You need at least 200 Reward Points to convert into Dev Points."
			return
		/*if((usr.RewardPoints-(usr.TrainedRPP-usr.UsedTrainedRPP))<200)
			usr << "You can't use trained Reward points for Dev points."
			return*/
		if(usr.PurchasedDevPoints+1>21)
			usr << "You can only buy 21 dev points."
			return
		else
			usr.RewardPoints-=200
			usr.SpendableDevPoints+=1
			usr.TotalDevPoints+=1
			usr<<"You exchange 200 RPP for 1 Dev Point."*/


/*	PassiveTree()
		set category="Other"
		usr<<"nah"
		return*/
/*		if(usr.Race=="Saiyan"||(usr.Race=="Demi"&&usr.Class=="Asura")||usr.ForceSensitive)
			usr<<"You cannot use this feature."
			return
		if(usr.TierSPurchased)
			usr<<"hahahaha no"
			return
		winshow(usr,"bonusmods",1)*/
	//passivestatmod(var/statmodtype as text)
	//	set hidden=1 //Best to hide the interface verb. It wouldn't do folks much good to use it directly anyways.
		/*if(usr.ActiveBuffs||usr.SpecialSlot)
			usr<<"Turn off your buffs before using this."
			return*/
	/*	if(usr.TierSPurchased||usr.Race=="Saiyan")
			usr<<"Good job, you found out the interface verb. Your reward is...nothing."
			return
		if(usr.SpendableDevPoints<1) // No dev points, no passive.
			usr<<output("You need one dev point to purchase a Stat Mod Passive.","PassiveInfoLabel")
			return
		if(usr.vars["[statmodtype]Passive"]>=global.PassiveStatCap) //Adjustable caps are fun too.
			usr<<output("[statmodtype] cannot exceed level [global.PassiveStatCap] at this time!","PassiveInfoLabel")
			return
		if(statmodtype=="Strength")
			if(usr.StrengthPassive>usr.EndurancePassive*2||usr.StrengthPassive>usr.SpeedPassive*2)
				usr<<output("Strength cannot be more then one higher then Endurance and Speed.","PassiveInfoLabel")
				return
		if(statmodtype=="Endurance")
			if(usr.EndurancePassive>usr.StrengthPassive*2||usr.EndurancePassive>usr.SpeedPassive*2)
				usr<<output("Endurance cannot be more then one higher then Strength and Speed.","PassiveInfoLabel")
				return
		if(statmodtype=="Speed")
			if(usr.SpeedPassive>usr.EndurancePassive*2||usr.SpeedPassive>usr.StrengthPassive*2)
				usr<<output("Speed cannot be more then one higher then Endurance and Strength.","PassiveInfoLabel")
				return

		if(statmodtype=="Force")
			if(usr.ForcePassive>usr.ResistancePassive*2||usr.ForcePassive>usr.RecoveryPassive*2)
				usr<<output("Force cannot be more then one higher then Resistance and Recovery.","PassiveInfoLabel")
				return
		if(statmodtype=="Resistance")
			if(usr.ResistancePassive>usr.ForcePassive*2||usr.ResistancePassive>usr.RecoveryPassive*2)
				usr<<output("Resistance cannot be more then one higher then Force and Recovery.","PassiveInfoLabel")
				return
		if(statmodtype=="Recovery")
			if(usr.RecoveryPassive>usr.ResistancePassive*2||usr.RecoveryPassive>usr.ForcePassive*2)
				usr<<output("Force cannot be more then one higher then Resistance and Force.","PassiveInfoLabel")
				return

		if(statmodtype=="Offense")
			if(usr.OffensePassive>usr.DefensePassive*2)
				usr<<output("Offense cannot be more then one higher then Defense.","PassiveInfoLabel")
				return
		if(statmodtype=="Defense")
			if(usr.DefensePassive>usr.OffensePassive*2)
				usr<<output("Defense cannot be more then one higher then Offense.","PassiveInfoLabel")
				return
		/*if(usr.vars["[statmodtype]Passive"]>4 && !usr.HighTierPassivesUnlocked)
			usr<<"You cannot buy more passives until you have them unlocked."
			return*/
		usr.vars["[statmodtype]Passive"]+=1
		var/ThresholdStorage
		var/ModStorageVar
		if(usr.vars["[statmodtype]Passive"]>=4&&usr.vars["[statmodtype]Passive"]<=6)
			ThresholdStorage+=0.15
		else if(usr.vars["[statmodtype]Passive"]>6&&usr.vars["[statmodtype]Passive"]<10)
			ThresholdStorage+=0.3
		else if(usr.vars["[statmodtype]Passive"]==10)
			ThresholdStorage+=0.7
		if(statmodtype=="Speed")
			ThresholdStorage/=2
		if(statmodtype=="Recovery")
			ThresholdStorage/=2
		if(statmodtype!="Recovery") //Recovery lacks a 'RecoveryMod' var, so this exception is needed.
			ModStorageVar=usr.vars["[statmodtype]Mod"] //Have to do it this way, or it throws a Bad Index runtime error.
			usr.vars["[statmodtype]"]/=ModStorageVar
			if(ThresholdStorage)
				usr.vars["[statmodtype]Mod"]*=(1.1+ThresholdStorage)
				ModStorageVar*=(1.1+ThresholdStorage)
			else
				usr.vars["[statmodtype]Mod"]*=1.1
				ModStorageVar*=1.1
			usr.vars["[statmodtype]"]*=ModStorageVar
		else if(statmodtype=="Recovery")
			if(ThresholdStorage)
				usr.Recovery*=(1.1+ThresholdStorage)
			else
				usr.Recovery*=1.1
		usr.SpendableDevPoints-=1
		usr<<output("[statmodtype] Passive successfully leveled up to level [usr.vars["[statmodtype]Passive"]]!","PassiveInfoLabel")*/
//		world<<"DEBUG:ThresholdStorage Var:[ThresholdStorage], ModStorageVar:[ModStorageVar]"
