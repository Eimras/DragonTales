mob/proc/ElementalProc(var/Element,var/ElementalDef)
	if(Element=="Water" && ElementalDef!="Fire")
		if(prob(35))
			src.Chilled=2
			spawn()src.Chilled_Check()
	else if(Element=="Fire" && ElementalDef!="Water")
		if(prob(35))
			src.Burning+=0.015
			spawn()src.Burning_Check()
	else if(Element=="Earth"&& ElementalDef!="Wind")
		if(prob(35))
			src.EndBreak=2
			spawn()src.EnduranceBreak_Check()
	else if(Element=="Wind"&& ElementalDef!="Earth")
		if(prob(15))
			src.ElecShock+=1
			spawn()src.ElecShock_Check()
			if(src.ElecShock>0)
				src.Frozen=1
			if(src.ElecShock>1)
				src.ElecShock=1

mob/proc/HitSounds(var/Damage)
	if(!HitSoundsOn) return
	if(Damage<=9)
		for(var/mob/X in view(10,src))
			if(X.MusicToggle=="On")
				X<<sound('weakpunch.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
	else if(Damage>=10&&Damage<25)
		for(var/mob/X in view(10,src))
			if(X.MusicToggle=="On")
				X<<sound('mediumpunch.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
	else if(Damage>=25)
		for(var/mob/X in view(10,src))
			if(X.MusicToggle=="On")
				X<<sound('strongpunch.wav', repeat = 0, wait = 0, channel = 0, volume = 50)

mob/proc/BuffPotion(var/Type,var/Tier)
	if(src.StrongestFistUnlocked)
		src<<"The effect of the potion fizzles..."
		return
	if(Type=="Strength")
		if(Tier==1)
			src.StrengthMultiplier*=1.25
			src.StrengthPotion=1
			src.BuffPotion=60
		else if(Tier==2)
			usr.StrengthMultiplier*=1.40
			usr.StrengthPotion=2
			usr.BuffPotion=45
		else if(Tier==3)
			usr.StrengthMultiplier*=1.65
			usr.StrengthPotion=3
			usr.BuffPotion=30
	else if(Type=="Endurance")
		if(Tier==1)
			src.EnduranceMultiplier*=1.25
			src.EndurancePotion=1
			src.BuffPotion=60
		else if(Tier==2)
			usr.EnduranceMultiplier*=1.40
			usr.EndurancePotion=2
			usr.BuffPotion=45
	else if(Type=="Force")
		if(Tier==1)
			src.ForceMultiplier*=1.25
			src.ForcePotion=1
			src.BuffPotion=60
		else if(Tier==2)
			usr.ForceMultiplier*=1.40
			usr.ForcePotion=2
			usr.BuffPotion=45
	else if(Type=="Resistance")
		if(Tier==1)
			src.ResistanceMultiplier*=1.25
			src.ResistancePotion=1
			src.BuffPotion=60
		else if(Tier==2)
			usr.ResistanceMultiplier*=1.40
			usr.ResistancePotion=2
			usr.BuffPotion=45
	else if(Type=="Offense")
		if(Tier==1)
			src.OffenseMultiplier*=1.25
			src.OffensePotion=1
			src.BuffPotion=60
		else if(Tier==2)
			usr.OffenseMultiplier*=1.40
			usr.OffensePotion=2
			usr.BuffPotion=45
	else if(Type=="Defense")
		if(Tier==1)
			src.DefenseMultiplier*=1.25
			src.DefensePotion=1
			src.BuffPotion=60
		else if(Tier==2)
			usr.DefenseMultiplier*=1.40
			usr.DefensePotion=2
			usr.BuffPotion=45
	else if(Type=="Wall")
		if(Tier==1)
			usr.EnduranceMultiplier*=1.1
			usr.ResistanceMultiplier*=1.1
			usr.BuffPotion=90
	else if(Type=="Crystal")
		if(Tier==1)
			usr.DefenseMultiplier*=1.1
			usr.OffenseMultiplier*=1.1
			usr.BuffPotion=90
	else if(Type=="Battle")
		if(Tier==1)
			usr.StrengthMultiplier*=1.1
			usr.ForceMultiplier*=1.1
			usr.BuffPotion=90

mob/proc/Drain(var/draint)
	if(src.Race=="Android") return
	if(src.Berserkering) return
	if(src.Dead==1)
		if(src.KeepBody<1 && !src.HeartHero)
			return
	for(var/mob/P in range(1,src)) while(P.Grab==src)
		sleep(10)
		if(!P.client)
			src<< "You have Life Drain active!"
			src.Grab_Release()
			return
		src.Health-=draint
		if(src.Base/src.BaseMod>P.Base/P.BaseMod)
			P.Base+=(src.Base/src.BaseMod/100)*P.BaseMod//basically 10x more effective if your base/mod is lower than the target's base/mod
		if(src.EnergyMax/src.EnergyMod>P.EnergyMax/P.EnergyMod)
			P.EnergyMax+=(src.EnergyMax/src.EnergyMod/100)*P.EnergyMod
		if(src.KO) return
		if(P.Health<=150)
			P.Health+=draint
		if(P.LifeDrain)
			P.Base+=(src.Base/src.BaseMod/1000)*P.BaseMod
			if(src.Base/src.BaseMod>P.Base/P.BaseMod)
				P.Base+=(src.Base/src.BaseMod/100)*P.BaseMod//basically 10x more effective if your base/mod is lower than the target's base/mod
			if(src.EnergyMax/src.EnergyMod>P.EnergyMax/P.EnergyMod)
				P.EnergyMax+=(src.EnergyMax/src.EnergyMod/100)*P.EnergyMod


mob/proc/Succ(var/draint)
	if(src.Race=="Android") return
	if(src.Berserkering) return
	if(src.Dead==1)
		if(src.KeepBody<1 && !src.HeartHero)
			return
	for(var/mob/P in range(1,src)) while(P.Grab==src)
		sleep(10)
		if(!P.client)
			src<< "You have Banquet active!"
			src.Grab_Release()
			return
		src.Health-=draint
		P.TotalEssence+=draint*2
		if(src.Base/src.BaseMod>P.Base/P.BaseMod)
			P.Base+=(src.Base/src.BaseMod/100)*P.BaseMod//basically 10x more effective if your base/mod is lower than the target's base/mod
		if(src.EnergyMax/src.EnergyMod>P.EnergyMax/P.EnergyMod)
			P.EnergyMax+=(src.EnergyMax/src.EnergyMod/100)*P.EnergyMod
		if(src.KO) return
		if(P.Health<=150)
			P.Health+=draint
//			P.TotalEssence+=draint
		if(P.Banquet)
			P.Base+=(src.Base/src.BaseMod/1000)*P.BaseMod
			if(src.Base/src.BaseMod>P.Base/P.BaseMod)
				P.Base+=(src.Base/src.BaseMod/100)*P.BaseMod//basically 10x more effective if your base/mod is lower than the target's base/mod
			if(src.EnergyMax/src.EnergyMod>P.EnergyMax/P.EnergyMod)
				P.EnergyMax+=(src.EnergyMax/src.EnergyMod/100)*P.EnergyMod

/*mob/proc/Strangle(var/draint)
	if(src.Race=="Android") return
	if(src.Berserkering) return
	if(src.Dead==1)
		if(src.KeepBody<1 && !src.HeartHero)
			return
	for(var/mob/P in range(1,src)) while(P.Grab==src)
		sleep(10)
		if(!P.client)
			src<< "You have Strangle active!"
			src.Grab_Release()
			return
		src.Energy-=draint
		if(src.KO) return*/


mob/proc/Fly()
	src.PassiveGain=1
	var/obj/Skills/Fly/fly
	for(var/obj/Skills/Fly/f in src)
		fly = f
		break
	if(fly.delay)
		sleep(5)
		return
	spawn()
		fly.delayTimer()
	while(src.Flying==1)
		EXP+=(EXPGains/100)*0.0002*src.PlayerEXPgains
	//	Energy-=EnergyMax/(FlySkillMod*70+(FlySkill/100))
		EnergyMax+=0.00075*src.EnergyMod*EnergyGains*src.PlayerEnergyGains
		Base+=0.05*GetPowerRank(2)*(Gains/100)*BaseMod*WeightFormula(1)*EXP/1000*0.01/2
		if(src.Race=="Kurama")
			src.trans["1give"]+=0.05*GetPowerRank(2)*(Gains/100)*BaseMod*WeightFormula(1)*EXP/1000*0.01/2*20
		Decline+=0.0000004*(Training_Rate*ControlTrainRate)*(Meditation_Rate*ControlMedRate)*(DeclineGains/100)
		src.FlySkill+=(src.FlySkillMod*3)
		if(Energy<=0)
			Flying=0
			src.PassiveGain=null
		//	src.density=1
			icon_state=""
			src<<"You stop flying due to lack of energy."
		sleep(10)
	if(src.Flying==0)
		src.PassiveGain=null

mob/proc/Digging()
	src.PassiveGain=1
	var/obj/Skills/Dig/dig
	for(var/obj/Skills/Dig/d in src)
		dig = d
		break
	if(dig.delay)
		sleep(5)
		return
	spawn()
		dig.delayTimer()
	while(src.Digging==1)
		var/amounttaken=src.EnergyMax/(50*src.Skillz["Dig"]["Level"])
		if(src.Energy>amounttaken)
//			src.Energy-=amounttaken
			src.SkillUP("Dig",0.5)
			var/Multi=1
			var/DetectEnchant
			for(var/obj/Money/M in src)
				for(var/obj/Items/Tech/EnhanceDigger/E in src)
					if(E.suffix)
						Multi=E.DigMulti
						DetectEnchant=E.EnchantType
						break
				for(var/obj/Items/Enchantment/DigEnhancement/E in src)
					if(E.suffix)
						DetectEnchant=E.EnchantType
						Multi=E.DigMulti
						break
				if(DetectEnchant=="Chaotic")
					M.Level+=rand(10,50)*Multi*rand(0.5,5)/6*global.DiggingMultiplier
				else if(DetectEnchant=="Haste")
					M.Level+=rand(20,30)*(Multi*(rand(1,1.25)))*rand(1.25,3.5)/6*global.DiggingMultiplier
					if(prob(25))
						M.Level+=rand(10,20)*(Multi/2)*rand(1,3)/6*global.DiggingMultiplier
				else if(DetectEnchant=="Sharpness")
					M.Level+=rand(21,32)*(Multi)*rand(1.3,3.6)/6*global.DiggingMultiplier
				else
					M.Level+=rand(20,30)*Multi*rand(1.25,3.5)/6*global.DiggingMultiplier
				if(src.Race=="Galvan")
					src.IntelligenceEXP+=rand(1,10)*(IntRate/100)*src.Meditation_Rate
					if(src.IntelligenceEXP>IntelligenceEXPNeeded)
						src.IntelligenceEXP-=IntelligenceEXPNeeded
						src.IntelligenceLevel+=1
						src.IntelligenceEXPNeeded=(1000*sqrt(IntelligenceLevel)*IntelligenceLevel)/Intelligence
		else
			src.icon_state=""
			src.PassiveGain=null
			src.Digging=0
			src.Frozen=0
			src<<"You are too tired to contine mining."
		sleep(10)
	if(src.Digging==0)
		src.PassiveGain=null

mob/proc/Meditation()
	src.PassiveGain=1
	var/obj/Skills/Meditate/med
	for(var/obj/Skills/Meditate/m in src)
		med = m
		break
	if(med.delay)
		sleep(5)
		return
	spawn()
		med.delayTimer()
	while(src.icon_state=="Meditate")
		src.Decline+=0.0000004*(Meditation_Rate*ControlMedRate)*(DeclineGains/100)
		Base+=0.04*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*(Meditation_Rate*ControlMedRate)*WeightFormula(1)*EXP/1000*0.01/2
		if(src.Race=="Kurama")
			src.trans["1give"]+=0.04*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*(Meditation_Rate*ControlMedRate)*WeightFormula(1)*EXP/1000*0.01/2*20
		EnergyMax+=0.008*src.EnergyMod*0.01*(src.Meditation_Rate*ControlMedRate)*EnergyGains*src.PlayerEnergyGains
		EXP+=(EXPGains/100)*0.0005*src.PlayerEXPgains
		src.PrimeAge-=0.00008*Meditation_Rate*(DeclineGains/100)*4
	//	if(prob(25))LOLWUT()
		Recover("Health",(Meditation_Rate*ControlMedRate))
		Recover("Mana",1)
		Recover("Health",(src.Regeneration*src.RegenerationMultiplier))
		Recover("Injury",(src.Regeneration*src.RegenerationMultiplier))

		for(var/obj/Skills/Buffs/OlympianFury/x in src)
			if(x.Using)
				if(src.Class=="Asura" && src.Anger>1.05)
					src.Anger-=0.005
					if(src.Anger<=1.05)
						src.Anger=1.05

		if(ControlPower<=100&&!Regenerate&&!Swim)
			Recover("Energy",(Meditation_Rate*ControlMedRate))
		if(IntFocus==1)
			if(prob(35))IntGain()
		else if(EnchantmentFocus==1)
			if(prob(35))EnchantmentGain()
		else
			if(ForFocus=="Balanced")
				if(prob(90))
					Force+=0.008*ForceMod*GetPowerRank(1)*(StatGains/100)*sqrt(sqrt(Gravity))
					Resistance+=0.008*ResistanceMod*GetPowerRank(1)*(StatGains/100)*sqrt(sqrt(Gravity))
			else if(ForFocus=="Force")
				if(prob(90)) Force+=0.016*ForceMod*GetPowerRank(1)*(StatGains/100)*sqrt(sqrt(Gravity))
				if(prob(90)) Resistance+=0.004*ResistanceMod*GetPowerRank(1)*(StatGains/100)*sqrt(sqrt(Gravity))
			else if(ForFocus=="Resistance")
				if(prob(90)) Resistance+=0.016*ResistanceMod*GetPowerRank(1)*(StatGains/100)*sqrt(sqrt(Gravity))
				if(prob(90)) Force+=0.004*ForceMod*GetPowerRank(1)*(StatGains/100)*sqrt(sqrt(Gravity))
		sleep(10)
	if(src.icon_state!="Meditate")
		src.PassiveGain=null



mob/proc/Training()
	src.PassiveGain=1
	var/obj/Skills/Train/tra
	for(var/obj/Skills/Train/t in src)
		tra = t
		break
	if(tra.delay)
		sleep(5)
		return
	spawn()
		tra.delayTimer()
	while(src.icon_state=="Train")
		src.Decline+=0.0000004*(Training_Rate*ControlTrainRate)*(DeclineGains/100)
		EXP+=(EXPGains/100)*0.0014*src.PlayerEXPgains
		Base+=0.04*GetPowerRank(2)*(Gains/100)*BaseMod*(Training_Rate*ControlTrainRate)*WeightFormula(1)*EXP/1000*0.01/2*20
		if(src.Race=="Kurama")
			src.trans["1give"]+=0.04*GetPowerRank(2)*(Gains/100)*BaseMod*(Training_Rate*ControlTrainRate)*WeightFormula(1)*EXP/1000*0.01/2
		EnergyMax+=0.008*EnergyMod*0.1*(Training_Rate*ControlTrainRate)*EnergyGains*src.PlayerEnergyGains*src.PlayerEnergyGains
		if(StrFocus=="Balanced")
			if(prob(90))
				Strength+=0.025*StrengthMod*GetPowerRank(1)*(StatGains/100)
				Endurance+=0.025*EnduranceMod*GetPowerRank(1)*(StatGains/100)
		else if(StrFocus=="Strength")
			if(prob(90)) Strength+=0.025*StrengthMod*GetPowerRank(1)*(StatGains/100)
			if(prob(90)) Endurance+=0.0125*EnduranceMod*GetPowerRank(1)*(StatGains/100)
		else if(StrFocus=="Endurance")
			if(prob(90)) Endurance+=0.025*EnduranceMod*GetPowerRank(1)*(StatGains/100)
			if(prob(90)) Strength+=0.0125*StrengthMod*GetPowerRank(1)*(StatGains/100)
		if(prob(80))
			src.Energy-=5*sqrt(sqrt(EnergyMax))/10
			if(src.Energy<5)
				src<<"You stop training due to the lack of energy."
				src.icon_state=""
				src.PassiveGain=null
		sleep(10)
	if(src.icon_state!="Train")
		src.PassiveGain=null


