client
	verb
		FaceNorth()
			set hidden = 1
			mob.dir = NORTH
		FaceEast()
			set hidden = 1
			mob.dir = EAST
		FaceSouth()
			set hidden = 1
			mob.dir = SOUTH
		FaceWest()
			set hidden = 1
			mob.dir = WEST

mob/Admin3/verb
	RevertAscension(var/mob/src in world)
		set category="Admin"
//		set hidden=1
		var/num=input(usr, "Which of this person's ascensions do you want to undo?", "Revert Ascension") in list(0,1,2,3,4,5,6)
		if(num==0)
			return
		src.AscensionsUnlocked-=1
		src.AscensionsAcquired-=1
		if(src.Race=="Namekian")
			if(src.Class != "Ancient")
				if(num==1)
					src.RevertBase(1.8)
					src.RevertAnger(1.25)
					src.RecovDv(1.5)
				if(num==2)
					src.RevertBase(2.5)
					src.EnergyDv(1.25)
					src.RecovDv(1.25)
				if(num==3)
					src.RevertBase(5)
					src.Class="Fighter"
					src.SetVars()
		if(src.Race=="Saiyan")
			if(num==1)
				if(src.Class=="Low-Class")
					src.RevertBase(2)
					src.EnergyDv(2)
					src.RecovDv(1.25)
				if(src.Class=="Normal")
					src.RevertBase(2.5)
					src.RecovDv(1.5)
					src.EnergyDv(1.5)
				if(src.Class=="Elite")
					src << ":3c"
			if(num==2)
				if(src.Class=="Low-Class")
					src.RevertBase(4)
					src.SpdDv(1.5)
					src.RevertAnger(2)
				if(src.Class=="Normal")
					src.RevertBase(5)
					src.OffDv(1.25)
					src.DefDv(1.25)
					src.SpdDv(1.25)
					src.RevertAnger(1.75)
				if(src.Class=="Elite")
					src.RevertBase(5)
					src.SpdDv(1.25)
					src.RecovDv(2)
			if(num==3)
				if(src.Class=="Low-Class")
					src.RevertBase(5)
					src.RevertAnger(2.5)
					src.AllDv(1.25)
				if(src.Class=="Normal")
					src.RevertBase(6)
					src.RevertAnger(2)
					src.AllDv(1.25)
				if(src.Class=="Elite")
					src.RevertBase(6.5)
					src.RevertAnger(1.5)
					src.AllDv(1.25)
			if(num==4)
				if(src.Class=="Low-Class")
					src.RevertBase(6)
					src.AllDv(1.3)
				if(src.Class=="Normal")
					src.RevertBase(7)
					src.AllDv(1.3)
				if(src.Class=="Elite")
					src.RevertBase(8.5)
					src.RevertAnger(1.75)
					src.AllDv(1.3)
		if(src.Race=="Human")
			if(num==1)
				src.RevertBase(1)
				src.StrDv(1.3)
				src.EndDv(1.3)
				src.SpdDv(1.25)
				src.ForDv(1.3)
				src.ResDv(1.3)
				src.OffDv(1.25)
				src.DefDv(1.25)
				src.RecovDv(1.25)
			if(num==2)
				src.RevertBase(1.25)
				src.StrDv(1.2)
				src.EndDv(1.2)
				src.ForDv(1.2)
				src.ResDv(1.2)
				src.OffDv(1.2)
				src.DefDv(1.2)
				src.RevertAnger(1.5)
			if(num==3)
				src.RevertBase(1.5)
				src.StrDv(1.25)
				src.EndDv(1.25)
				src.SpdDv(1.25)
				src.ForDv(1.25)
				src.ResDv(1.25)
				src.OffDv(1.25)
				src.DefDv(1.25)
		if(src.Race=="1/16th Saiyan")
			if(num==1)
				src.RevertBase(1)
				src.StrDv(1.3)
				src.EndDv(1.3)
				src.SpdDv(1.25)
				src.ForDv(1.3)
				src.ResDv(1.3)
				src.OffDv(1.25)
				src.DefDv(1.25)
				src.RevertAnger(2)
		if(src.Race=="Half Saiyan")
			if(num==1)
				if(src.Class=="Trunks")
					src.RevertBase(2.5)
					src.StrDv(1.25)
					src.EndDv(1.2)
					src.SpdDv(1.25)
					src.ForDv(1.5)
					src.ResDv(1.2)
					src.OffDv(1.5)
					src.DefDv(1.2)
					src.RevertAnger(1.25)
				if(src.Class=="Goten")
					src.RevertBase(2.25)
					src.StrDv(1.25)
					src.EndDv(1.5)
					src.SpdDv(1.25)
					src.ForDv(1.2)
					src.ResDv(1.2)
					src.OffDv(1.2)
					src.DefDv(1.5)
					src.RevertAnger(1.5)
				if(src.Class=="Gohan")
					src.RevertBase(2)
					src.StrDv(1.25)
					src.EndDv(1.25)
					src.SpdDv(1.2)
					src.ForDv(1.2)
					src.ResDv(1.2)
					src.OffDv(1.5)
					src.DefDv(1.5)
					src.RevertAnger(3)
			if(num==2)
				if(src.Class=="Trunks")
					src.RevertBase(2)
					src.EnergyDv(1.5)
					src.StrDv(1.2)
					src.EndDv(1.5)
					src.ForDv(1.2)
					src.ResDv(1.2)
					src.OffDv(1.2)
					src.DefDv(1.2)
					src.RecovDv(1.6)
					src.RevertAnger(1.5)
				if(src.Class=="Goten")
					src.RevertBase(1.75)
					src.EnergyDv(1.5)
					src.StrDv(1.2)
					src.EndDv(1.2)
					src.SpdDv(1.2)
					src.ForDv(1.5)
					src.ResDv(1.2)
					src.OffDv(1.2)
					src.DefDv(1.2)
					src.RecovDv(1.5)
					src.RevertAnger(2)
				if(src.Class=="Gohan")
					src.RevertBase(1.5)
					src.EnergyDv(1.5)
					src.StrDv(1.2)
					src.EndDv(1.2)
					src.SpdDv(1.25)
					src.ForDv(1.25)
					src.ResDv(1.25)
					src.OffDv(1.2)
					src.DefDv(1.2)
					src.RecovDv(1.4)
					src.RevertAnger(3.5)
		if(src.Race=="Spirit Doll")
			if(num==1)
				src.RevertBase(1)
				src.EnergyDv(1.25)
				src.StrDv(1.2)
				src.EndDv(1.2)
				src.ForDv(1.2)
				src.ResDv(1.2)
				src.OffDv(1.2)
				src.DefDv(1.2)
				src.RecovDv(1.25)
				src.Training_Rate/=1.5
				src.Meditation_Rate/=1.5
			if(num==2)
				src.RevertBase(1.35)
				src.EnergyDv(1.25)
				src.StrDv(1.3)
				src.EndDv(1.3)
				src.SpdDv(1.25)
				src.ForDv(1.3)
				src.ResDv(1.3)
				src.OffDv(1.3)
				src.DefDv(1.3)
				src.RecovDv(1.35)
		if(src.Race=="Half Demon")
			if(num==1)
				return
			if(num==2)
				src.RevertBase(2)
				src.AllDv(1.4)
				src.RecovDv(1.25)
		if(src.Race=="Tsufurujin")
			if(num==1)
				src.RevertBase(1.5)
				src.RevertAnger(1.5)
				src.RegenDv(1.5)
			if(num==2)
				src.RevertBase(2)
				src.AllDv(1.25)
				src.RecovDv(1.5)
			if(num==3)
				src.RevertBase(3)
				src.Training_Rate=2
				src.Meditation_Rate=2
			if(num==4)
				src.RevertBase(7.5)
				src.EnergyDv(3)
		if(src.Race=="Heran")
			if(src.Class=="Fighter")
				if(num==1)
					src.RevertBase(2.5)
				if(num==2)
					src.RevertBase(5)
			if(src.Class=="Captain")
				if(num==1)
					src.RevertBase(5)
		if(src.Race=="Aetherian")
			if(num==1)
				src.RevertBase(1.5)
				src.AllDv(1.15)
				src.RegenDv(1.5)
				src.RecovDv(1.5)
			if(num==2)
				src.RevertBase(2)
				src.EnergyDv(1.5)
			if(num==3)
				src.RevertBase(4.5)
				src.AllDv(1.3)
			if(num==4)
				src.RevertBase(7.5)
		if(src.Race=="Youkai")
			if(src.Class=="Kitsune")
				if(num==1)
					src.RevertBase(1)
					src.EnergyDv(1.5)
					src.RecovDv(1.5)
					var/obj/Items/Wearables/tails = new/obj/Items/Wearables(src);
					tails.icon = 'Fox Tail3.dmi';
					tails.name = "3-Tails Fox";
				if(num==2)
					src.RevertBase(3)
					src.AllDv(1.25)
					src.RegenDv(1.25)
				if(num==3)
					src.RevertBase(6)
			if(src.Class=="Tanuki")
				if(num==1)
					src.RevertBase(2)
				if(num==2)
					src.RevertBase(5)
		if(src.Race=="Android")
			if(num==1)
				src.RevertBase(3)
			if(num==2)
				src.RevertBase(5)
			if(num==3)
				src.RevertBase(7.5)
		if(src.Race=="Neko")
			src.RevertAnger(src.AngerMax-0.25)
			src.RevertBase(src.BaseMod-0.25)
			if(num==1)
				src.EnergyDv(1.5)
				src.SpdDv(1.25)
				src.DefDv(1.25)
			if(num==2)
				src.EnergyDv(1.33)
				src.EndDv(1.25)
				src.ResDv(1.25)
			if(num==3)
				src.EnergyDv(1.25)
				src.StrDv(1.25)
				src.ForDv(2)
			if(num==4)
				src.EnergyDv(1.2)
				src.SpdDv(1.25)
				src.OffDv(1.25)
			if(num==5)
				src.EnergyDv(1.33)
				src.StrDv(1.25)
				src.ForDv(1.25)
				src.OffDv(1.25)
			if(num==6)
				src.EnergyDv(1.25)
				src.EndDv(1.5)
				src.ResDv(1.5)
				src.DefDv(1.5)

mob
	proc
		RevertBase(var/num)
			src.Base/=src.BaseMod
			src.BaseMod=num
			src.Base*=src.BaseMod
		RevertAnger(var/num)
			src.AngerMax = num
		AllDv(var/num)
			src.StrDv(num)
			src.EndDv(num)
			src.EXSpdDv(num)
			src.ForDv(num)
			src.ResDv(num)
			src.OffDv(num)
			src.DefDv(num)
		StrDv(var/num)
			src.Strength/=num
			src.StrengthMod/=num
		EndDv(var/num)
			src.Endurance/=num
			src.EnduranceMod/=num
		SpdDv(var/num)
			src.SpeedMod/=num
		EXSpdDv(var/num)
			var/good = num-1
			good/=2
			good+=1
			src.SpeedMod/=good
		ForDv(var/num)
			src.Force/=num
			src.ForceMod/=num
		ResDv(var/num)
			src.Resistance/=num
			src.ResistanceMod/=num
		OffDv(var/num)
			src.Offense/=num
			src.OffenseMod/=num
		DefDv(var/num)
			src.Defense/=num
			src.DefenseMod/=num
		RegenDv(var/num)
			src.Regeneration/=num
		RecovDv(var/num)
			src.Recovery/=num
		EnergyDv(var/num)
			src.EnergyMod/=num
			src.EnergyMax/=num
			src.Energy/=num

