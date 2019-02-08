var
	DemiUnlockedReq1=1000000000000000000
	DemiReq1=1000000000000000000
	DemiUnlockedReq2=1000000000000000000
	DemiReq2=1000000000000000000


	NamekianUnlockedReq1=1000000000000000000
	NamekianReq1=25000
	NamekianUnlockedReq2=1000000000000000000
	NamekianReq2=1000000000000000000
	NamekianUnlockedReq3=1000000000000000000
	NamekianReq3=1000000000000000000

	HumanUnlockedReq1=1000000000000000000
	HumanReq1=10000
	HumanUnlockedReq2=1000000000000000000
	HumanReq2=1000000000000000000
	HumanUnlockedReq3=1000000000000000000
	HumanReq3=1000000000000000000

	SpiritDollUnlockedReq1=1000000000000000000
	SpiritDollReq1=10000
	SpiritDollUnlockedReq2=1000000000000000000
	SpiritDollReq2=1000000000000000000

	HalfDemonUnlockedReq1=1000000000000000000
	HalfDemonReq1=1000000000000000000
	HalfDemonUnlockedReq2=1000000000000000000
	HalfDemonReq2=1000000000000000000

	TuffleUnlockedReq1=1000000000000000000
	TuffleReq1=5000
	TuffleUnlockedReq2=1000000000000000000
	TuffleReq2=1000000000000000000
	TuffleUnlockedReq3=1000000000000000000
	TuffleReq3=1000000000000000000
	TuffleUnlockedReq4=1000000000000000000
	TuffleReq4=1000000000000000000

	HeranUnlockedReq1=1000000000000000000
	HeranReq1=1000000000000000000

	AetherianUnlockedReq1=1000000000000000000
	AetherianReq1=1000000000000000000
	AetherianUnlockedReq2=1000000000000000000
	AetherianReq2=1000000000000000000

	TanukiUnlockedReq1=1000000000000000000
	TanukiReq1=1000000000000000000

	KitsuneUnlockedReq1=1000000000000000000
	KitsuneReq1=1000000000000000000

	GrimlakinUnlockedReq1=10000000000000000
	GrimlakinReq1=10000000000000000

	FelidaeUnlockedReq1=10000000000000000
	FelidaeReq1=1000000000000000000


	NekoUnlockedReq1=1000000000000000000
	NekoReq1=10000
	NekoUnlockedReq2=1000000000000000000
	NekoReq2=1000000000000000000
	NekoUnlockedReq3=1000000000000000000
	NekoReq3=1000000000000000000
	NekoUnlockedReq4=1000000000000000000
	NekoReq4=1000000000000000000



mob
	proc
		DetermineDefaultAscension()
			var/NewAsc
			if(global.AscensionLevel>0)
				if(global.AscensionLevel>=1)
					if(src.Race=="Demi")
						NewAsc=1
					if(src.Race=="Namekian")
						NewAsc=2
					if(src.Race=="Half Demon")
						NewAsc=1
					if(src.Race=="Youkai")
						NewAsc=1
					if(src.Race=="Kaio")
						NewAsc=1
					if(src.Race=="Tsufurujin")
						NewAsc=2
				if(global.AscensionLevel>=2)
					if(src.Race=="Human"&&src.Class!="Sage"&&src.Class!="Shifter")
						NewAsc=2
					if(src.Race=="Neko")
						NewAsc=2
					if(src.Race=="Heran")
						NewAsc=1
				if(global.AscensionLevel>=3)
					if(src.Race=="Youkai")
						if(src.Class=="Kitsune")
							NewAsc=2
					if(src.Class=="Shifter")
						NewAsc=1
				if(global.AscensionLevel>=4)
					if(src.Race=="Human"&&src.Class!="Sage"&&src.Class!="Shifter")
						NewAsc=3
					if(src.Race=="Tsufurujin")
						NewAsc=3
					if(src.Race=="Spirit Doll")
						NewAsc=2
					if(src.Race=="Neko")
						NewAsc=3
				if(global.AscensionLevel>=5)
					if(src.Race=="Youkai")
						if(src.Class=="Kitsune")
							NewAsc=3
						if(src.Class=="Felidae")
							NewAsc=3
						if(src.Class=="Grimlakin")
							NewAsc=3
						if(src.Class=="Tanuki")
							NewAsc=2
					if(src.Race=="Kaio")
						NewAsc=2
					if(src.Race=="Heran")
						NewAsc=2
				if(global.AscensionLevel>=6)
					if(src.Race=="Tsufurujin")
						NewAsc=4
					if(src.Race=="Namekian")
						NewAsc=3
				if(src.AscensionsAcquired < NewAsc)
					src.AscensionsUnlocked=NewAsc
		AscAvailable(var/race)
			src.DetermineDefaultAscension()
			if(race=="Demi")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked>=1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						return 2
				return 0
			if(race=="Alien")
				if(src.Training_Rate==1.5)
					src.Training_Rate=2.25
			if(race=="Namekian")
				if(src.EnhancedHearing!=1)
					src.EnhancedHearing=1
				if(src.Class != "Ancient")
					if(src.AscensionsAcquired < 1)
						if(src.AscensionsUnlocked >=1)
							return 1
						else
							if(src.GetBPM() >= global.NamekianReq1)
								return 1
					if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
						if(src.AscensionsUnlocked >=2)
							return 2
					if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
						if(src.AscensionsUnlocked >=3)
							return 3
				return 0
			if(race=="Saiyan")
				if(src.Class=="Elite"||src.Class=="Legendary"||src.Class=="Savage")
					if(src.AscensionsUnlocked < 1)
						src.AscensionsUnlocked = 1

				//Anger Ascensions
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						return 2
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >= 3)
						return 3
				return 0
			if(race=="Human")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
					else
						if(src.GetBPM() >= global.HumanReq1 && src.Class!="Sage" && src.Class!="Shifter")
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2 && src.Class!="Sage"&& src.Class!="Shifter")
						return 2
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >= 3 && src.Class!="Sage"&& src.Class!="Shifter")
						return 3
				return 0
			if(race=="Nobody")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
				if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
					if(src.AscensionsUnlocked >= 2)
						return 2
				if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
					if(src.AscensionsUnlocked >= 3)
						if(src.WONApproved||src.CompleteFormApproved)
							return 3
						else
							src << "Make sure that an admin has approved World of Nothingness or Complete form!"
							return 0
				return 0
			if(race=="1/16th Saiyan")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
					else
						if(src.GetBPM() >= global.HumanReq1)
							return 1
				return 0
			if(race=="Half Saiyan")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
				//NO.
				/*if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
					if(src.AscensionsUnlocked >= 2)
						return 2*/
				return 0
			if(race=="Spirit Doll")
				if(src.ManaMax < 300)
					src.ManaMax = 300
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
					else
						if(src.GetBPM() >= global.SpiritDollReq1)
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						return 2
				return 0
			if(race=="Half Demon")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
				return 0
			if(race=="Tsufurujin")
				if(src.Intelligence<4)
					src.Intelligence=4
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
					else
						if(src.GetBPM() >= global.TuffleReq1)
							return 1
				if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
					if(src.AscensionsUnlocked >= 2)
						return 2
				if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
					if(src.AscensionsUnlocked >= 3)
						return 3
				if(src.AscensionsAcquired < 4&&src.AscensionsAcquired==3)
					if(src.AscensionsUnlocked >= 4)
						return 4
				return 0
			if(race=="Heran")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
				if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
					if(src.AscensionsUnlocked >= 2)
						return 2
				return 0
			if(race=="Aetherian")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
				if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
					if(src.AscensionsUnlocked >= 2)
						return 2
				if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
					if(src.AscensionsUnlocked >= 3)
						return 3
				if(src.AscensionsAcquired < 4&&src.AscensionsAcquired==3)
					if(src.AscensionsUnlocked >= 4)
						return 4
				return 0
			if(race=="Youkai")
				if(!src.EnhancedHearing)
					src.EnhancedHearing=1
				if(src.Class=="Kitsune")
					if(src.AscensionsAcquired < 1)
						if(src.AscensionsUnlocked >= 1)
							return 1
					if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
						if(src.AscensionsUnlocked >= 2)
							return 2
					if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
						if(src.AscensionsUnlocked >= 3)
							return 3
					return 0
				if(src.Class=="Tanuki")
					if(src.AscensionsAcquired < 1)
						if(src.AscensionsUnlocked >= 1)
							return 1
					if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
						if(src.AscensionsUnlocked >= 2)
							return 2
					return 0
				if(src.Class=="Hell Raven")
					if(src.AscensionsAcquired < 1)
						if(src.AscensionsUnlocked>=1)
							return 1
					if(src.AscensionsAcquired < 2)
						if(src.AscensionsUnlocked >= 2)
							return 2
					if(src.AscensionsAcquired < 3)
						if(src.AscensionsUnlocked >= 3)
							return 3
					return 0
			if(race=="Android")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						return 2
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >= 3)
						return 3
				return 0
			if(race=="Neko")
				if(!src.EnhancedHearing)
					src.EnhancedHearing=1
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
					else
						if(src.GetBPM() >= global.NekoReq1)
							return 1
				if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
					if(src.AscensionsUnlocked >= 2)
						return 2
				if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
					if(src.AscensionsUnlocked >= 3)
						return 3
				return 0
			if(race=="Dhampir")
				if(!src.EnhancedSmell)
					src.EnhancedSmell=1
				if(!src.EnhancedHearing)
					src.EnhancedHearing=1
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked>=1)
						return 1
				return 0
			if(race=="Makyo")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked>=1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked>=2&&src.AscensionsAcquired==1)
						return 2
				if(src.AscensionsAcquired <3)
					if(src.AscensionsUnlocked>=3&&src.AscensionsAcquired==2)
						return 3
				return 0
			if(race=="Kaio")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked>=1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked>=2&&src.AscensionsAcquired==1)
						return 2
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked>=3&&src.AscensionsAcquired==2)
						return 3
				if(src.AscensionsAcquired < 4)
					if(src.AscensionsUnlocked>=4&&src.AscensionsAcquired==3)
						return 4
				return 0
			if(race=="Synchronizer")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked>=1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked>=2&&src.AscensionsAcquired==1)
						return 2
				if(src.AscensionsAcquired <3)
					if(src.AscensionsUnlocked>=3&&src.AscensionsAcquired==2)
						return 3
				return 0
			if(race=="Lamia")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked>=1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked>=2&&src.AscensionsAcquired==1)
						return 2
				if(src.AscensionsAcquired <3)
					if(src.AscensionsUnlocked>=3&&src.AscensionsAcquired==2)
						return 3
				return 0
			if(race=="Alien")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked>=1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked>=2&&src.AscensionsAcquired==1)
						return 2

		Ascension(var/race, var/num)
			if(num!="Fury")
				src.AscensionsAcquired=num
			if(race=="Demi")
				if(num==1)
					var/choice
					while(!choice)
						choice=input(src,"Choose what kind of god you'd like to inherit your destiny from.", "Olympian Ascension") in list("Heracles", "Poseidon", "Hades", "Zeus")
						var/confirm
						switch(choice)
							if("Heracles")
								confirm=alert(src,"Heracles Demigods borrow more heavily from humans.  They gain exceptional stat growths, but do not gain much BP until later. Do you want to inherit Heracles' destiny?", "Olympian Ascension", "Yes", "No")
							if("Poseidon")
								confirm=alert(src,"Poseidon Demigods gain in all stats, as well as BP.  Furthermore, they hold dominion over water and recover more easily in it.  Do you want to inherit Poseidon's destiny?", "Olympian Ascension", "Yes", "No")
							if("Hades")
								confirm=alert(src,"Hades Demigods gain tremendous endurance and resistance.  They reign over fire. Do you want to inherit Hades' destiny?", "Olympian Ascension", "Yes", "No")
							if("Zeus")
								confirm=alert(src,"Zeus Demigods gain enormous force and energy manipulation abilities. Do you want to inherit Zeus' destiny?", "Olympian Ascension", "Yes", "No")
							if("Chin Chin")
								confirm=alert(src,"Chin Chin Demigods possess the power of the great dark lyrca god, enabling them to control the many realms of the universe. Will you join us, boss?", "Olympian Ascension", "Yes", "No")
						if(confirm=="No")
							choice=null
					src.Class=choice
					switch(src.Class)
						if("Heracles")
							src.Ascend(4)
							src.StrMult(2)
							src.EndMult(1.2)
							src.ResMult(1.2)
							src.SpdMult(1.5)
							src.OffMult(1.4)
							src.DefMult(1.4)
						if("Poseidon")
							src.Ascend(4)
							src.EnergyMult(1.75)
							src.StrMult(1.15)
							src.EndMult(1.15)
							src.SpdMult(1.5)
							src.ForMult(1.75)
							src.ResMult(1.25)
							src.OffMult(1.5)
							src.DefMult(1.5)
							src.RecovMult(2)
						if("Hades")
							src.Ascend(4)
							src.EndMult(2)
							src.ResMult(2)
							src.SpdMult(1.75)
							src.NewAnger(2)
						if("Zeus")
							src.Ascend(4)
							src.ForMult(2.5)
							src.EnergyMult(2.5)
							src.RecovMult(3)
							src.SpdMult(1.5)
						if("Chin Chin")
							if(!src.Kowala)
								src<<"You're not allowed to make this choice, boss..."
								return
							src.Ascend(4)
							src.AllMult(1.25)
							src.Kowala=0
							src.ChinChin=1
					src.SetVars()
				if(num==2)
					var/choices=list("Cronus", "Oceanus", "Hyperion")
					var/choice
					var/confirm=0
					while(confirm!="Yes")
						choice=input(src, "You've ascended beyond godhood, drawing in the power of the Titans themselves.  Which Titan's strength do you draw upon?", "Titan Ascension") in choices
						if(choice=="Cronus")
							confirm=alert(src, "Cronus was the leader of the Titans.  Godlings who draw in his power are offered a surge of power higher than every other Titan, and they typically wear the mantle of leadership.  Do you want to draw in this Titan's power?", "Titan Ascension", "Yes", "No")
						if(choice=="Oceanus")
							confirm=alert(src, "Oceanus embodies all the lively seas.  Godlings who draw in his power walk a moderate path.  While their power is not the highest, it can endure for the longest. They are compassionate for the sake of others, though this compassion may not always manifest as one expects. Do you want to draw in this Titan's power?", "Titan Ascension", "Yes", "No")
						if(choice=="Hyperion")
							confirm=alert(src, "Hyperion was the wisest of all Titans.  Godlings who draw in his power are offered wisdom and understanding rather than brute force.  They are a patient breed, but utterly fearsome when committed to a battle.  Do you want to draw in this Titan's power?", "Titan Ascension", "Yes", "No")
					src.Class=choice
					src << "Your godhood is infused with [choice]'s energy, and you become an avatar of that diety's power!"
					src.SetVars()
/*				if(num==3)
					if(src.trans["active"])
						src << "Turn off Godmode, then meditate again."
						return
					var/list/ZeusClasses = list("Uranus", "Thalassa", "Aether")
					var/list/PoseidonClasses = list("Hemera", "Pontus", "Nyx")
					var/list/HeraclesClasses = list("Shukra", "Raktavija", "Vritra")
					var/list/HadesClasses = list("Erebus", "Hydros", "Chaos")
					var/list/ChinChinClasses = list("Red Dick", "Pink Guy", "Filthy Frank")
					if(src.Class in ZeusClasses)
						src << "You are infused with the primordial powers of light!"
						src.Ascend(10)
						src.Class="Prime Zeus"
					if(src.Class in PoseidonClasses)
						src << "You are infused with the primordial powers of the sea!"
						src.Ascend(12.5)
						src.Class="Prime Poseidon"
					if(src.Class in HeraclesClasses)
						src << "You are infused with the primordial powers of evolution!"
						src.Ascend(17.5)
						src.Class="Prime Heracles"
					if(src.Class in HadesClasses)
						src << "You are infused with the primordial powers of night!"
						src.Ascend(20)
						src.Class="Prime Hades"
					if(src.Class in ChinChinClasses)
						src << "You are infused with the primordial powers of pussy!"
						src.Ascend(15)
						src.Class="Prime Boss"
					src.SetVars()*/

/*			if(race=="Synchronizer")
					if(num==1)
						src<<"Your meme power increase exponentially..."
						src.Ascend(2.5)
						src.StrMult(1.5)
						src.EndMult(1.5)
						src.SpdMult(1.5)
						src.ForMult(1.5)
						src.ResMult(1.5)
						src.OffMult(1.5)
						src.DefMult(1.5)
					if(num==2)
						src<<"You take two Ls and turn into a W..."
						src.Ascend(2.5)
						src.StrMult(1.5)
						src.EndMult(1.5)
						src.SpdMult(1.5)
						src.ForMult(1.5)
						src.ResMult(1.5)
						src.OffMult(1.5)
						src.DefMult(1.5)
					if(num==3)
						src<<"You reach the prime of your meme powers!"
						src.Ascend(10)
						src.StrMult(2)
						src.EndMult(2)
						src.SpdMult(2)
						src.ForMult(2)
						src.ResMult(2)
						src.OffMult(2)
						src.DefMult(2)*/

			if(race=="Namekian")
				if(src.Class != "Ancient")
					if(num==1)
						src.Ascend(3)
						src.NewAnger(1.5)
						src.RecovMult(1.3)
					if(num==2)
						src.Ascend(5)
						src.EnergyMult(1.25)
						src.RecovMult(1.25)
					if(num==3)
						src.Ascend(15)
						src.Class="Ascendant"
						src.SetVars()
			if(race=="Saiyan")
				if(src.Class!="Elite")
					src << "Your primal rage grows..."
					if(num==1)
						src.SaiyanAngerAscensions=1
					if(num==2)
						src.SaiyanAngerAscensions=2
					if(num==3)
						src.SaiyanAngerAscensions=3
				else
					if(num==1)
						src.Ascend(7)
						src.RecovMult(2)
					if(num==2)
						src.Ascend(11)
						src.RecovMult(2)
						//src.NewAnger(2)

			if(race=="Human")
				if(num==1)
					src.Ascend(1.25)
					src.SpdMult(1.25)
					src.RecovMult(1.25)
					if(BodyType=="Small")
						src.StrMult(2.15)
						src.EndMult(2.15)
						src.ResMult(2.15)
					if(BodyType=="Medium")
						src.StrMult(1.25)
						src.EndMult(1.25)
						src.ForMult(1.25)
						src.ResMult(1.25)
//						src.SpdMult(1.15)
						src.OffMult(1.25)
						src.DefMult(1.25)
					if(BodyType=="Large")
						src.OffMult(1.75)
						src.DefMult(1.75)
						src.ForMult(1.75)
						src.SpdMult(1.25)
				if(num==2)
					src.Ascend(1.5)
					src.StrMult(1.25)
					src.EndMult(1.25)
					src.ForMult(1.25)
					src.ResMult(1.25)
					src.OffMult(1.25)
					src.DefMult(1.25)
					src.NewAnger(1.75)
				if(num==3)
					src.Ascend(2.5)
					src.StrMult(1.35)
					src.EndMult(1.35)
					src.SpdMult(1.35)
					src.ForMult(1.35)
					src.ResMult(1.35)
					src.OffMult(1.35)
					src.DefMult(1.35)
			if(race=="Nobody")
				if(num==1)
					var/list/choices=list("Berserker", "Assassin", "Sorcerer")
					var/choice
					var/confirm="No"
					while(confirm=="No")
						choice=input(src,"What prototype of Nobody do you want to model yourself after?", "Nobody Ascension") in choices
						if(choice=="Berserker")
							confirm=alert(src,"Berserker Nobodies are physically powerful with enough accuracy to ensure that they maul what they want to maul.  Do you want to be a Berserker?", "Nobody Ascension", "Yes", "No")
						if(choice=="Assassin")
							confirm=alert(src,"Assassin Nobodies are spry and dangerous. They have good hit ratios, decent dodge ratios, and enough strength to bring the pain.  Do you want to be an Assassin?", "Nobody Ascension", "Yes", "No")
						if(choice=="Sorcerer")
							confirm=alert(src,"Sorcerer Nobodies are talented with the manipulation of energy.  They can use it stronger, faster, and more frequently than others.  Do you want to be a Sorcerer?", "Nobody Ascension", "Yes", "No")
					if(choice=="Berserker")
						src.StrMult(1.3)
						src.EndMult(1.2)
						src.ResMult(1.2)
						src.OffMult(1.2)
					if(choice=="Assassin")
						src.StrMult(1.2)
						src.SpdMult(1.2)
						src.OffMult(1.3)
					if(choice=="Sorcerer")
						src.ForMult(1.5)
						src.EndMult(1.2)
						src.ResMult(1.2)
						src.EnergyMult(1.33)
						src.RecovMult(1.25)
					src.Ascend(3.5)
					src << "You are now a [choice]-class Nobody."
				if(num==2)
					var/list/choices=list("Dragon", "Lunatic", "Renegade")
					var/choice
					var/confirm="No"
					while(confirm=="No")
						choice=input(src,"You've nearly mastered your non-existence as a Nobody.  What kind of Nobody have you become?", "Nobody Ascension") in choices
						if(choice=="Dragon")
							confirm=alert(src,"Dragons are those Nobodies which have embraced their new existence.  Whether good or evil, they have no regrets about their lack of emotions.  Do you want to become a Dragon?", "Nobody Ascension", "Yes", "No")
						if(choice=="Lunatic")
							confirm=alert(src,"Lunatics are Nobodies which have abandoned any sense of self in pursuit of their ideals -- whether these are new ideals that they formed as a Nobody or residual ideals from their past life is up to the player.  Do you want to become a Lunatic?", "Nobody Ascension", "Yes", "No")
						if(choice=="Renegade")
							confirm=alert(src,"Renegades are Nobodies which have rejected their lack of heart and constantly pursue a new one.  Either through rememberance of times long since passed or through creating a new one, they are dissatisfied with their lack of emotions and seek to break free.  Do you want to become a Renegade?", "Nobody Ascension", "Yes", "No")
					if(choice=="Dragon")
						src.Ascend(7)
						src.Class="Dragon"
						src.SetVars()
					if(choice=="Lunatic")
						src.contents+=new/obj/Skills/Buffs/LunarWrath
						src << "You learn to draw on the fury of the moon.  Just as the moon waxes and wanes, this powerful technique is unreliable..."
					if(choice=="Renegade")
						src.Ascend(5)
						src.StrMult(1.2)
						src.EndMult(1.2)
						src.SpdMult(1.2)
						src.ForMult(1.2)
						src.ResMult(1.2)
						src.OffMult(1.2)
						src.DefMult(1.2)
						src.Class="Renegade"
						src.SetVars()
					src << "You are now a [choice]-class Nobody."
			if(num==3&&src.WONApproved)
				src.Ascend(src.BaseMod*3)
				src.contents+=new/obj/Skills/NuWorldOfNothingness
				src << "You develop the means of consuming a planet with the void to bolster your own strength..."
			if(num==3&&src.CompleteFormApproved)
				src.Ascend(src.BaseMod*1.5)
				src.RecovMult(1.25)
				src.NewAnger(1.5)
			if(race=="1/16th Saiyan")
				if(num==1)
					src.Ascend(1.25)
					src.StrMult(1.3)
					src.EndMult(1.3)
					src.SpdMult(1.25)
					src.ForMult(1.3)
					src.ResMult(1.3)
					src.OffMult(1.25)
					src.DefMult(1.25)
					src.NewAnger(2.25)
			if(race=="Half Saiyan")
				if(num==1)
					var/choices=list("Goten", "Trunks", "Gohan")
					var/choice
					var/confirm
					while(confirm!="Yes")
						choice=input(src, "Which half saiyan will you borrow characteristics from?", "Choose Half Saiyan Ascension") in choices
						if(choice=="Goten")
							confirm=alert(src, "Goten half saiyans rely on ki attacks and evasive maneuvers to grasp victory.  Do you want to be a Goten half saiyan?", "Choose Half Saiyan Ascension", "Yes", "No")
						if(choice=="Trunks")
							confirm=alert(src, "Trunks half saiyans rely on physical power and precision strikes to win.  Do you want to be a Trunks half saiyan?", "Choose Half Saiyan Ascension", "Yes", "No")
						if(choice=="Gohan")
							confirm=alert(src, "Gohan half saiyans are well rounded with the highest potential power of all half saiyans.  Do you want to be a Gohan half saiyan?", "Choose Half Saiyan Ascension", "Yes", "No")
					src.Class=choice
					if(src.Class=="Trunks")
						src.Ascend(2)
						src.StrMult(2)
						src.OffMult(1.75)
						src.EndMult(1.5)
						src.ResMult(1.5)
						src.ForMult(1.5)
						src.SpdMult(1.25)
						src.DefMult(1.25)
					if(src.Class=="Goten")
						src.Ascend(1.75)
						src.ForMult(1.75)
						src.EndMult(1.75)
						src.SpdMult(1.5)
						src.DefMult(1.5)
						src.StrMult(1.25)
						src.ResMult(1.25)
						src.OffMult(1.25)
						src.NewAnger(1.75)
					if(src.Class=="Gohan")
						src.StrMult(1.5)
						src.EndMult(1.5)
						src.OffMult(1.5)
						src.DefMult(1.5)
						src.SpdMult(1.25)
						src.ForMult(1.25)
						src.ResMult(1.25)
						src.NewAnger(2.5)
				if(num==2)
					src.EnergyMult(1.25)
					src.RecovMult(1.25)
					if(src.Class=="Trunks")
						src.NewAnger(src.AngerMax+0.25)
						src.Ascend(src.BaseMod*1.25)
					if(src.Class=="Goten")
						src.NewAnger(src.AngerMax+0.25)
						src.Ascend(src.BaseMod*1.25)
					if(src.Class=="Gohan")
						src.NewAnger(src.AngerMax+0.5)
			if(race=="Spirit Doll")
				if(num==1)
					src.Ascend(1.35)
					src.EnergyMult(1.25)
					src.StrMult(1.2)
					src.EndMult(1.2)
					src.SpdMult(1.2)
					src.ForMult(1.2)
					src.ResMult(1.2)
					src.OffMult(1.2)
					src.DefMult(1.2)
					src.RecovMult(1.25)
				if(num==2)
					src.Ascend(2.5)
					src.EnergyMult(1.25)
					src.SpdMult(1.25)
					src.StrMult(1.2)
					src.EndMult(1.2)
					src.ForMult(1.2)
					src.ResMult(1.2)
					src.OffMult(1.2)
					src.DefMult(1.2)
			if(race=="Half Demon")
				if(num==1)
					src.Ascend(0.25)
					src.contents+=new/obj/Skills/Buffs/DemonicWill
					src<<"You learn to interpret the whispers of Hell..."
				if(num==2)
					src.Ascend(3)
					src.AllMult(1.4)
					src.RecovMult(1.25)
			if(race=="Synchronizer")
				if(num==1)
					src.Ascend(1.5)
					src.Genius=1
					src.RecovMult(1.25)
					src<<"Your intellect becomes more well-defined, as well as your meme powers..."
				if(num==2)
					src.Ascend(3.5)
					src.AllMult(1.4)
					src<<"Your meme powers increased exponentially..."
				if(num==3)
					src.Ascend(15)
					src.AllMult(5)
					src.RecovMult(5)
					src<<"You achieve meme godhood!!"
			if(race=="Lamia")
				if(num==1)
					src.Ascend(1.45)
					src.EnergyMult(1.5)
					src.RecovMult(1.5)
					src.RegenMult(3)
					src<<"Your lower body sheds into a newer, your hair feels renewed, your human skin feels soft to the touch... You feel extremely robust as you finally flip a new page of your serpentine life!"
				if(num==2)
					src.Ascend(7)
					src.AllMult(1.2)
					src.RegenMult(6)
					src<<"Your powers increase a lot?! Just who did you eat right now? You feel extremely capable, as your body as a whole is further blessed by your snakescales."
				if(num==3)
					src.Ascend(12)
					src.AllMult(2)
					src.RegenMult(12)
					src<<"Your powers increase immensely as you finally reach your final destination... as the serpent deity!"
			if(race=="Tsufurujin")
				if(num==1)
					src.Ascend(2)
					src.NewAnger(2)
				if(num==2)
					src.Ascend(3)
					src.AllMult(1.25)
					src.RecovMult(1.5)
				if(num==3)
					src.Ascend(7.5)
				if(num==4)
					src.Ascend(15)
					src.EnergyMult(3)
			if(race=="Heran")
				if(src.Class=="Fighter")
					if(num==1)
						src.Ascend(5)
						if(!locate(/obj/Skills/Bojack, src))
							src.contents+=new/obj/Skills/Bojack
					if(num==2)
						src.Ascend(12)
				if(src.Class=="Captain")
					if(num==1)
						src.Ascend(6)
					if(num==2)
						src.Ascend(13.5)
			if(race=="Aetherian")
				if(num==1)
					src.Ascend(2)
					src.AllMult(1.15)
					src.RegenMult(1.5)
					src.RecovMult(1.5)
				if(num==2)
					src.Ascend(4.5)
					src.EnergyMult(1.5)
				if(num==3)
					src.Ascend(7.5)
					src.AllMult(1.3)
				if(num==4)
					src.Ascend(20)
			if(race=="Youkai")
				if(src.Class=="Kitsune")
					if(num==1)
						src<<"You twitch your ears and suddenly... Huh? Three tails? Sweet!"
						src.Ascend(3)
						src.EnergyMult(1.5)
						src.RecovMult(1.5)
						src.contents+=new/obj/Skills/GlobalTelepathy
						var/obj/Items/Wearables/tails = new/obj/Items/Wearables(src);
						tails.icon = 'Fox Tail3.dmi';
						tails.name = "3-Tails Fox";
					if(num==2)
						src<<"You feel the urge to lick your thumb, do so and suddenly... Huh? Six tails? Sweet!"
						src.Ascend(6)
						src.AllMult(1.25)
						src.RegenMult(1.25)
						src.contents+=new/obj/Skills/Rank/ShunkanIdo
						var/obj/Items/Wearables/tails = new/obj/Items/Wearables(src);
						tails.icon = 'Fox Tail6.dmi';
						tails.name = "6-Tails Fox";
					if(num==3)
						src<<"You finally reach the end of your spiritual journey... Nine tails wooshing behind you, infinite power, knowledge and immortality in your fingertips! But as soon as the sensation fades, you ponder... There's still a lot of life ahead of you. Now with your newfound godhood..."
						var/list/choices=list("Enlightened", "Corrupted")
						var/choice
						var/confirm="No"
						while(confirm=="No")
							choice=input(src,"It was a journey to reach this point... But how do you feel after your experiences? After transcending your mortality?", "Kitsune Final Ascension") in choices
							if(choice=="Enlightened")
								confirm=alert(src,"You feel 'Enlightened'. Your path was indeed a journey, one that you've did by yourself. You've aimed to do good, bring happiness and help everybody, sacrificing your own for it.","Kitsune Final Ascension", "Yes", "No")
							if(choice=="Corrupted")
								confirm=alert(src,"You feel 'Corrupted'. Your path was drenched in blood, tears, suffering and endless screams. Carved by the sacrifices of many others, while you were the only one who benefited from it.", "Kitsune Final Ascension", "Yes", "No")
							if(choice=="Enlightened"&&confirm=="Yes")
								src.contents+=new/obj/Skills/Buffs/Mystic
								src<<"Your pure energy emanates and overflows, empowering you..."
							if(choice=="Corrupted"&&confirm=="Yes")
								src.contents+=new/obj/Skills/Buffs/Majin
								src<<"Your tainted energy emanates and overflows, empowering you..."
						src.Ascend(9)
						src.AllMult(1.25)
						src.NewAnger(1.5)
						var/obj/Items/Wearables/tails = new/obj/Items/Wearables(src);
						tails.icon = 'Fox Tail9.dmi';
						tails.name = "Kyuubi Tails";
				if(src.Class=="Tanuki")
					if(num==1)
						src.Ascend(5)
					if(num==2)
						src.Ascend(15)
				if(src.Class=="Hell Raven")
					if(num==1)
						src.Ascend(2.5)
						src.EnergyMult(1.2)
						src.RecovMult(2)
					if(num==2)
						src.Ascend(3)
						src.EnergyMult(1.25)
						src.RecovMult(1.5)
					if(num==3)
						src.Ascend(5)
						src.EnergyMult(1.33)
						src.RecovMult(1.5)

				if(src.Class=="Oni")
					if(num==1)
						src.Ascend(1.5)
						src.EnergyMult(1.25)
						src.StrMult(1.25)
						src.EndMult(1.25)
						src<<"You feel your muscles dense up and bulge slightly... And also a latent thirst for alcohol."
					if(num==2)
						src.Ascend(3)
						src.EnergyMult(1.25)
						src.OffMult(1.5)
						src.ResMult(5.5)
						src<<"You feel a surge of spiritual energy course through you... Was it something you drank? You feel warded."
					if(num==3)
						src.Ascend(6)
						src.EnergyMult(1.25)
						src.StrMult(3)
						src.EndMult(3)
						src.OffMult(3)
						src<<"You finally reach the pinnacle of your spiritual power, with strikes that can easily move mountains apart, and cause natural disasters at your own whim."

				if(src.Class=="Ookami")
					if(num==1)
						src.Ascend(1.25)
						src.EndMult(1.25)
						src.StrMult(1.2)
						src.OffMult(1.2)
						src.NewAnger(2.5)
						src<<"You feel a surge of power course through you..."
					if(num==2)
						src.Ascend(2)
						src.ResMult(1.5)
						src.StrMult(1.5)
						src.OffMult(1.5)
						src.NewAnger(5)
						src<<"You feel a small surge of primal rage..."
					if(num==3)
						src.Ascend(4)
						src.EndMult(1.8)
						src.ResMult(1.8)
						src.StrMult(1.8)
						src.OffMult(2)
						src.NewAnger(15)
						src<<"You reach the pinnacle of your spiritual capacity, with rage-driven power that is enough to wipe cities apart!"
			if(race=="Android")
				src << "Your nano machines have advanced."
				if(num==1)
					src.Ascend(5)
				if(num==2)
					src.Ascend(7.5)
				if(num==3)
					src.Ascend(15)
			if(race=="Neko")
				if(num==1)
					src.NewAnger(1.75)
					src.Ascend(1)
				if(num==2)
					src.NewAnger(2)
					src.Ascend(1.25)
				if(num==3)
					src.NewAnger(2.5)
					src.Ascend(1.5)
			if(race=="Dhampir")
				if(num==1)
					var/choice
					var/confirm
					while(confirm!="Yes")
						choice=input(src, "The time has come to choose which pathway of blood you wish to follow.  What bloodline will you obey?", "Dhampir Ascension") in list("Human", "Vampire", "Both")
						if(choice=="Human")
							confirm=alert(src, "If you reject vampyrism, you will be able to use your supernatural talents to a greater extent.  However, you will always have your darker urges and they won't be as powerful as your more indulgent cousins. Do you wish to follow this bloodline?", "Dhampir Ascension", "Yes", "No")
						if(choice=="Vampire")
							confirm=alert(src, "If you accept vampyrism, submitting to your darkest nature will yield exceptional results, putting you on par with the strongest of your blackhearted kin.  However, it will become exceedingly difficult to act as anything but a monster.  Do you wish to follow this bloodline?", "Dhampir Ascension", "Yes", "No")
						if(choice=="Both")
							confirm=alert(src, "If you seek to embrace your status as a dhampir, you will become more naturally gifted and your inner beast will not change significantly.  It will remain a struggle to ride the line, yet you will never feel comfortable if you indulge your monsterous side either.  Do you wish to follow this bloodline?", "Dhampir Ascension", "Yes", "No")
					if(choice=="Human")
						src.Ascend(2.5)
						src.StrMult(1.3)
						src.EndMult(1.15)
						src.SpdMult(1.3)
						src.ForMult(1.3)
						src.ResMult(1.15)
						src.OffMult(1.3)
						src.DefMult(1.15)
						src.Class="Human Path"
						src << "You embrace your humanity and reject the path of a monster... Your potential grows immensely, your fangs retract slowly, your body becomes warmer, as the vampiric corruption is sealed away forever in a cursed tattoo on your neck!"
					if(choice=="Vampire")
						src.Class="Vampire Path"
						src << "You embrace the path of a vampiric monster and reject your humanity... Your latent potential rots away in exhange of an immense power... Although, you feel the sunlight sear your skin and an immense thirst for blood."
						src.contents+=new/obj/Skills/Extra/Silvermists
//						src.contents+=new/obj/Skills/Extra/HuntingLeap
//						src.contents+=new/obj/Skills/Extra/LunarLunatism
						src.EssenceMax=100
						src.contents+=new/obj/Skills/BurstRegenerate
						src.contents+=new/obj/Skills/Regenerate
					if(choice=="Succubus")
						src.Class="Succubus Path"
						src.Ascend(2)
						src.EndMult(1.3)
						src.SpdMult(1)
						src.ForMult(1.8)
						src.ResMult(2)
						src.DefMult(1.6)
//						src.contents+=new/obj/Skills/Extra/Charm
//						src.contents+=new/obj/Skills/Extra/Terrorize
//						src.contents+=new/obj/Skills/Extra/Manipulate
						src.contents+=new/obj/Skills/Buffs/DemonicWill
						src << "You embrace the path of a lustful demon and reject your vampirism and humanity... Your latent potential rots away in exhange of an immense power... Although, you feel an immense lust cloud and corrupt your soul."
					src.SetVars()
			if(race=="Makyo")
				if(num==1)
					src.Ascend(5)
					src.EnergyMult(1.2)
					src.contents+=new/obj/Skills/Rank/SummonMakyoStar
					src << "You learn how to summon the Makyo Star!"
				if(num==2)
					src.Ascend(10)
					src.NewAnger(2)
				if(num==3)
					src.Ascend(25)
					src.EnergyMult(1.25)
			if(race=="Alien")
				if(num==1)
					src.Ascend(5)

				if(num==2)
					src.Ascend(10)


			if(race=="Dragon")
				if(num==1) //Elemental Class
					src.Ascend(5)
					src.AllMult(1.25)
					while(!src.Class)
						src.Class = input("Which elemental class of dragon do you wish to become?") in list("Fire","Water","Earth","Wind","Poison","Time","Space","Gold")
						var alertmsg
						switch(Class)
							if("Fire") alertmsg = "A dragon of fire is guided by their emotions, which is an especially potent blend, making them the most destructive of all types."
							if("Water") alertmsg = "A dragon of water is one who reflects the ocean tides. Their calm is absolute, as is their destructive fury."
							if("Earth") alertmsg = "A dragon of earth has a resolve solidified like stone. Their will is as unbreakable as their bodies."
							if("Wind") alertmsg = "A dragon of wind rides the airstreams that is life with a natural flow. They have a carefree lifestyle."
							if("Poison") alertmsg = "A dragon of poison is one who embodies the most manipulative, and antagonistic nature of all. They all have forked tounges, and a nature that seems to corrode life itself."
							if("Time") alertmsg = "A dragon of time perceives the world from the flow of time. From the passage of seasons, to birth and death. History, and the Future. Their wisdom is grand."
							if("Space") alertmsg = "A dragon of space perceives the vastness of the Universe. That all things are, and eventually will not be. The dragon of space sees it all."
							if("Gold") alertmsg = "A dragon of gold sees the wealth in all things, material possession and mind alike."
						if(alert("[alertmsg]"))
							break

					switch(Class)
						if("Fire")
							NewAnger(2.5)
						if("Water")
							StrMult(1.3)
							ForMult(1.6)
							DefMult(1.6)
						if("Earth")
							EndMult(1.7)
							ResMult(1.7)
						if("Wind")
							SpdMult(1.5)
							OffMult(1.3)
							DefMult(1.3)
						if("Poison")
							EnergyMult(1.3)
							RecovMult(1.3)
							ForMult(1.3)
							EndMult(1.3)
							OffMult(1.2)
						if("Time")
							SpdMult(2.5)
						if("Space")
							AllMult(1.3)
						if("Gold")
							StrMult(1.4)
							ForMult(1.4)
							OffMult(1.4)
							DefMult(1.4)
				if(num==2) //Divinity
					src.Ascend(10)
					src.Divine = 1
					AllMult(1.1)
					src << "You have awoken your innate divinity."

				if(num==3) //
					src.Ascend(25)
					AllMult(1.1)
				if(num==4) //God
					src.Ascend(50)
					AllMult(1.1)
			if(race=="Kaio")
				if(num==1)
					src.Ascend(5)
					src.contents += new/obj/Skills/Materialization
					src.contents += new/obj/Skills/DonateRPP
					src << "No longer are you a mere Shinjin. The majority of your kind never even reaches this point. But you have."
					switch(input("Your developments lead to this moment. The choice to remain true to your blood, or to give into the seeds of chaos.") in list("Kaio","Makaio"))
						if("Kaio")
							src.contents += new/obj/Skills/Buffs/Mystic
							src.Class = "Kaio"
							src<<"You remain true to your blood. Your energy becomes pure, flowing through you with graceful might."

							src<<"To those around you, you're a pyre. Perhaps a hopeful beacon, maybe one of teaching, or perhaps something sinister. It is ultimately what you make of yourself."

							src<<"You've attained the power of healing. It comes at the expense of your own lifeforce however."
							src.contents+=new/obj/Skills/Heal
							src.contents += new/obj/Skills/Rank/GivePower
							src.EnergyMult(1.2)
						if("Makaio")
							src.contents += new/obj/Skills/Buffs/Majin
							src.Class = "Makaio"
							src<<"You open yourself to the sinister influences. Potent, yet terrible energies flow through you, empowering you and your emotions."
							src.NewAnger(2)
							src<<"You are destined to become a tyrant of this world."
					switch(input("Each Shinjin represents a quadrant of the Universe in being. Which do you?") in list("North","South","East","West"))
						if("North")
							src.contents += new/obj/Skills/Rank/Kaioken
							src.contents += new/obj/Skills/Attacks/SpiritBomb
							src.KaiokenMastery = 3
							src.EndMult(1.5)
							src.ResMult(1.5)
							src.StrMult(0.8)
							src.ForMult(0.8)
							src<<"You recall that great focus allows for even greater, though extremely straining power. Through this pain, your body becomes a beacon to whatever you stand for, utilizing power spread across many bodies to unleash an attack of extreme purity.."
							src<<"You learn to use Kaioken and Spirit Bomb."

						if("South")
							src.contents += new/obj/Skills/Rank/BurningShot //I need to rework this. Maybe ramp up damages, offense, and SPEED. Burning Shot gotta go fass.
							src.contents += new/obj/Skills/Attacks/HyperTornado
							src.SpdMult(1.3)
							src.StrMult(1.2)
							src.ForMult(1.2)
							src<<"You recall the ability to ignite your lifeforce to become an unstoppable force. You learn to quick your beat into a terrifying whirlwind of power."
							src<<"You learn to use Burning Shot and Hyper Tornado."
						if("East")
							src.contents += new/obj/Skills/Rank/SpiritBurst //Rework too?? Everything is kinda weak compared to kaioken tbh...
							src.contents += new/obj/Skills/Attacks/Beams/SuperDragonFist
							src.StrMult(1.15)
							src.ForMult(1.15)
							src.EndMult(1.15)
							src.ResMult(1.15)
							src<<"You recall that control is key. In control, you can use your energy to its maximum potential. When it's time, you can unleash all of it until a terrifying wave of power."
							src<<"You learn to use Spirit Burst and Super Dragon Fist."
						if("West")
							src.contents += new/obj/Skills/LimitBreaker
							src.contents += new/obj/Skills/Attacks/HomingFinisher
							src.StrMult(1.2)
							src.SpdMult(1.3)
							src.ForMult(1.2)
							src<<"You recall a means to overcome the natural limiters of your body. Like your rival quadrant, a straining move. Simply overcoming is not enough. You learn how to restrict your opponents movements, to deliver your greatest finisher."
							src<<"You learn to use Limit Breaker and Homing Finisher."


					//PASSIVES.

				if(num==2) //SSj2 God Ki awakening
					src.Ascend(10)
					src.EnergyMult(1.2)
					src.RecovMult(1.2)
					src.contents += new/obj/Skills/Rank/GodKi
					src.god_ticks = 1 //2x power.
				//	switch(Class)
				//		if("Kaio")
				//			src
				//		if("Makaio")
				//			src.
				if(num==3) //Kaioshin / Makaioshin. Obtained in Late SSj2 / Early SSj3 Era
					src.god_ticks = 2
					src.contents += new/obj/Skills/Rank/UnlockPotential
					switch(Class)
						if("Kaio")
							src.contents += new/obj/Skills/Rank/Mysticize
						if("Makaio")
							src.contents += new/obj/Skills/Rank/Majinize

				if(num==4) //God Era
					src.Ascend(20)
					src.god_ticks = 3


/*		TierSUp()
			if(src.KeybladeLevel)
				src.KeybladeAscensions()
				src.GetKeybladeEXP()
			if(locate(/obj/Skills/Buffs/SpiralEnergy,src)||locate(/obj/Skills/Buffs/SpiralNemesis,src))
				src.GetSpiralEXP()
			if(locate(/obj/Skills/MartialArts/Eight_Gates,src))
				src.GetEightGatesEXP()
			if(locate(/obj/Skills/TierS/WeaponSoul,src))
				src.WeaponSoulAscensions()
				src.GetWeaponSoulEXP()
			/*if(jaganeye)
				src.GetJaganEyeEXP()*/
			if(src.HitenMitsurugi)
				src.GetHitenMitsurugiEXP()
			if(locate(/obj/Skills/Buffs/Sharingan, src))
				src.GetSharinganEXP()
			if(src.AnsatsukenMod)
				src.GetAnsatsukenEXP()
			if(src.SpiritLevel)
				src.GetSpiritEnergyEXP()
			if(src.HeroLevel)
				src.GetHOAEXP()
			if(src.SexyMod)
				src.GetKamuiEXP()
			if(src.RippleMod)
				src.GetRippleEXP()
			if(src.UBWLevel)
				src.GetUBWEXP()
			if(src.BerserkerMod)
				src.GetBerserkEXP()
			if(src.VisoredStage)
				src.GetVaizardEXP()
			if(src.MadScientist)
				src.GetMadScientistEXP()*/
		DoDamage(var/mob/m, var/val)
/*			if(src.HasTierS())
				if(src.Lethal)
					src.LethalDone+=val
					m.LethalTaken+=val
				src.DamageDone+=val
				m.DamageTaken+=val*/
			m.Health-=val
			if(src.Race=="Saiyan")
				if(src.ssj["active"]==1)
					if(src.CanTrainSSj)
						src.ssj["1mastery"]+=val/10
						if(src.ssj["1mastery"]>100)
							src.ssj["1mastery"]=100
				if(src.ssj["active"]==2)
					if(src.CanTrainSSj2)
						src.ssj["2mastery"]+=val/20
						if(src.ssj["2mastery"]>100)
							src.ssj["2mastery"]=100
				if(src.ssj["active"]==3)
					if(src.CanTrainSSj3)
						src.ssj["3mastery"]+=val/30
						if(src.ssj["3mastery"]>100)
							src.ssj["3mastery"]=100
			if(m.Health<=0)
				m.Unconscious(src)
			if(src.WoundIntent)
				src.DoWounds(m, val/10)
//			if(src.MysticEyes||src.TrueMysticEyes)
//				src.DoMysticWounds(m, val/10)
		DoWounds(var/mob/m, var/val)
/*			if(src.HasTierS())
				src.WoundsDone+=val
			if(m.HasTierS())
				m.WoundsTaken+=val*/
			m.TotalInjury+=val
			m.MaxHealth()
/*		DoMysticWounds(var/mob/m, var/val)
			m.TotalMysticInjury+=val
			m.MaxHealth()*/
		LoseEssence(var/val)
			src.TotalEssence-=val
			if(src.TotalEssence < 0)
				src.TotalEssence=0
			src.DoWounds(val/10)
		LoseEnergy(var/val)
/*			if(src.HasTierS())
				src.EnergyUsed+=val*/
			src.Energy-=val
			if(src.Energy < 0)
				src.Energy=0
			src.LoseFatigue(val/10)
		LoseFatigue(var/val)
			src.TotalFatigue+=val
/*			if(src.HasTierS())
				src.FatigueUsed+=val*/
			src.MaxEnergy()
		GetEnergyPercent()
			return (src.Energy/src.EnergyMax)*100
		GetEnergyPercentVal(var/val)
			return (val*src.EnergyMax)/100
		HealHealth(var/val)
/*			if(src.HasTierS())
				src.DamageHealed+=val*/
			src.Health+=val
			if(src.Race=="Saiyan")
				if(src.ssj["active"]==1)
					if(src.CanTrainSSj)
						src.ssj["1mastery"]+=val/10
						if(src.ssj["1mastery"]>100)
							src.ssj["1mastery"]=100
				if(src.ssj["active"]==2)
					if(src.CanTrainSSj2)
						src.ssj["2mastery"]+=val/20
						if(src.ssj["2mastery"]>100)
							src.ssj["2mastery"]=100
				if(src.ssj["active"]==3)
					if(src.CanTrainSSj3)
						src.ssj["3mastery"]+=val/30
						if(src.ssj["3mastery"]>100)
							src.ssj["3mastery"]=100
			src.MaxHealth()
		HealEnergy(var/val)
/*			if(src.HasTierS())
				src.EnergyHealed+=val*/
			src.Energy+=val
			src.MaxEnergy()
		HealWounds(var/val)
/*			if(src.HasTierS())
				src.WoundsHealed+=val*/
			src.TotalInjury-=val
			if(src.TotalInjury < 0)
				src.TotalInjury=0
			src.MaxHealth()
/*		HealMysticWounds(var/val)
			if(src.HasTierS())
				src.WoundsHealed+=val*/
/*			src.TotalMysticInjury-=val
			if(src.TotalMysticInjury < 0)
				src.TotalMysticInjury=0
			src.MaxHealth()*/
		HealFatigue(var/val)
/*			if(src.HasTierS())
				src.FatigueHealed+=val*/
			src.TotalFatigue-=val
			if(src.TotalFatigue < 0)
				src.TotalFatigue=0
			src.MaxEnergy()
		MaxHealth()
			if(src.Health > 100 - src.TotalInjury)
				src.Health=100-src.TotalInjury
/*			if(src.Health > 100 - src.TotalMysticInjury)
				src.Health=100-src.TotalMysticInjury*/
		MaxEnergy()
			if(src.GetEnergyPercent() > (100 - src.TotalFatigue))
				src.Energy=GetEnergyPercentVal(100-src.TotalFatigue)
		//todo: make specific procs for the various tier s
		StrVsEnd(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetStr())/(defender.Power*defender.GetEnd())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		StrVsRes(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetStr())/(defender.Power*defender.GetRes())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		ForVsEnd(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetFor())/(defender.Power*defender.GetEnd())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		ForVsRes(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetFor())/(defender.Power*defender.GetRes())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		ResVsFor(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetRes())/(defender.Power*defender.GetFor())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		GetStr(var/mult=1)
			return src.Strength*src.StrengthMultiplier*mult
		GetEnd(var/mult=1)
			return src.Endurance*src.EnduranceMultiplier*mult
		GetSpd(var/mult=1)
			return src.SpeedMod*src.SpeedMultiplier*mult
		GetFor(var/mult=1)
			return src.Force*src.ForceMultiplier*mult
		GetRes(var/mult=1)
			return src.Resistance*src.ResistanceMultiplier*mult
		GetOff(var/mult=1)
			return src.Offense*src.OffenseMultiplier*mult
		GetDef(var/mult=1)
			return src.Defense*src.DefenseMultiplier*mult
		GetRegen(var/mult=1)
			return src.Regeneration*src.RegenerationMultiplier*mult
		GetRecov(var/mult=1)
			return src.Recovery*src.RecoveryMultiplier*mult
		Ascend(var/num)
			src.Base/=src.BaseMod
			src.BaseMod=num
			src.Base*=src.BaseMod
		NewAnger(var/num)
			if(src.AngerMax < num)
				src.AngerMax = num
		AllMult(var/num)
			src.StrMult(num)
			src.EndMult(num)
			src.EXSpdMult(num)
			src.ForMult(num)
			src.ResMult(num)
			src.OffMult(num)
			src.DefMult(num)
		StrMult(var/num)
			src.Strength*=num
			src.StrengthMod*=num
		EndMult(var/num)
			src.Endurance*=num
			src.EnduranceMod*=num
		SpdMult(var/num)
			src.SpeedMod*=num
		EXSpdMult(var/num)
			var/good = num-1
			good/=2
			good+=1
			src.SpeedMod*=good
		ForMult(var/num)
			src.Force*=num
			src.ForceMod*=num
		ResMult(var/num)
			src.Resistance*=num
			src.ResistanceMod*=num
		OffMult(var/num)
			src.Offense*=num
			src.OffenseMod*=num
		DefMult(var/num)
			src.Defense*=num
			src.DefenseMod*=num
		RegenMult(var/num)
			src.Regeneration*=num
		RecovMult(var/num)
			src.Recovery*=num
		EnergyMult(var/num)
			src.EnergyMod*=num
			src.EnergyMax*=num
			src.Energy*=num
		GetBPM()
			return (src.Base/src.BaseMod)
		BPMult(var/num)
			src.BaseMod*=num
			src.Base*=num
		BPDiv(var/num)
			src.BaseMod/=num
			src.Base/=num
		GetSSjMastery(var/num)
			return src.ssj["[num]mastery"]
		GetSSjUnlocked()
			return src.ssj["unlocked"]
		GetTransMastery(var/num)
			return src.trans["[num]mastery"]
		GetTransUnlocked()
			return src.trans["unlocked"]
		GetAscensionValue(var/asc)
			if(asc=="Olympian Ascension")
				return global.DemiReq1
			if(asc=="Olympian Ascension Unlocked")
				return global.DemiUnlockedReq1
			if(asc=="Titan Ascension")
				return global.DemiReq2
			if(asc=="Titan AscensionUnlocked")
				return global.DemiUnlockedReq2
			if(asc=="Namekian Ascension 1")
				return global.NamekianReq1
			if(asc=="Namekian Ascension 1 Unlocked")
				return global.NamekianUnlockedReq1
			if(asc=="Namekian Ascension 2")
				return global.NamekianReq2
			if(asc=="Namekian Ascension 2 Unlocked")
				return global.NamekianUnlockedReq2
			if(asc=="Human Third Eye")
				return global.HumanReq1
			if(asc=="Human Third Eye Unlocked")
				return global.HumanUnlockedReq1
			if(asc=="Red Ascension")
				return global.HumanReq2
			if(asc=="Red Ascension Unlocked")
				return global.HumanUnlockedReq2
			if(asc=="Blue Ascension")
				return global.HumanReq3
			if(asc=="Blue Ascension Unlocked")
				return global.HumanUnlockedReq3
			if(asc=="Spirit Doll Ascension 1")
				return global.SpiritDollReq1
			if(asc=="Spirit Doll Ascension 1 Unlocked")
				return global.SpiritDollUnlockedReq1
			if(asc=="Spirit Doll Ascension 2")
				return global.SpiritDollReq2
			if(asc=="Spirit Doll Ascension 2 Unlocked")
				return global.SpiritDollUnlockedReq2
			if(asc=="Half Demon Demonic Will")
				return global.HalfDemonReq1
			if(asc=="Half Demon Demonic Will Unlocked")
				return global.HalfDemonUnlockedReq1
			if(asc=="Half Demon Third Eye")
				return global.HalfDemonReq2
			if(asc=="Half Demon Third Eye Unlocked")
				return global.HalfDemonUnlockedReq2
			if(asc=="Tuffle Ascension 1")
				return global.TuffleReq1
			if(asc=="Tuffle Ascension 1 Unlocked")
				return global.TuffleUnlockedReq1
			if(asc=="Tuffle Ascension 2")
				return global.TuffleReq2
			if(asc=="Tuffle Ascension 2 Unlocked")
				return global.TuffleUnlockedReq2
			if(asc=="Heran Ascension 1")
				return global.HeranReq1
			if(asc=="Heran Ascension 1 Unlocked")
				return global.HeranUnlockedReq1
			if(asc=="Aetherian Ascension 1")
				return global.AetherianReq1
			if(asc=="Aetherian Ascension 1 Unlocked")
				return global.AetherianUnlockedReq1
			if(asc=="Aetherian Ascension 2")
				return global.AetherianReq2
			if(asc=="Aetherian Ascension 2 Unlocked")
				return global.AetherianUnlockedReq2
			if(asc=="Tanuki Ascension 1")
				return global.TanukiReq1
			if(asc=="Tanuki Ascension 1 Unlocked")
				return global.TanukiUnlockedReq1
			if(asc=="Three Tails Ascension")
				return global.KitsuneReq1
			if(asc=="Three Tails Ascension Unlocked")
				return global.KitsuneUnlockedReq1
			if(asc=="Neko Ascension 1")
				return global.NekoReq1
			if(asc=="Neko Ascension 1 Unlocked")
				return global.NekoUnlockedReq1
			if(asc=="Neko Ascension 2")
				return global.NekoReq2
			if(asc=="Neko Ascension 2 Unlocked")
				return global.NekoUnlockedReq2
			if(asc=="Neko Ascension 3")
				return global.NekoReq3
			if(asc=="Neko Ascension 3 Unlocked")
				return global.NekoUnlockedReq3
			if(asc=="Neko Ascension 4")
				return global.NekoReq4
			if(asc=="Neko Ascension 4 Unlocked")
				return global.NekoUnlockedReq4
		HasKeyblade(var/element, var/level)
			if((src.KeybladeElement==element&&src.KeybladeLevel>=level)||(src.SecondKeybladeElement==element&&src.SecondKeybladeLevel>=level))
				return 1
			return 0
		NoDarkMode()
			if((src.KeybladeElement=="Darkness"&&src.KeybladeLevel>=4)||(src.SecondKeybladeElement=="Darkness"&&src.SecondKeybladeLevel >=4))
				return 0
			if(src.DarkMode)
				return 0
			return 1
		UnmasteredDarkKeyblade()
			if((src.KeybladeElement=="Darkness"&&src.KeybladeLevel<=3)||(src.SecondKeybladeElement=="Darkness"&&src.SecondKeybladeLevel<=3))
				return 1
			return 0
		GetDarkKeybladeLevel()
			if(src.KeybladeElement=="Darkness")
				return src.KeybladeLevel
			if(src.SecondKeybladeElement=="Darkness")
				return src.SecondKeybladeLevel
		GetLightKeybladeLevel()
			if(src.KeybladeElement=="Light")
				return src.KeybladeLevel
			if(src.SecondKeybladeElement=="Light")
				return src.SecondKeybladeLevel
		GetNothingnessKeybladeLevel()
			if(src.KeybladeElement=="Nothingness")
				return src.KeybladeLevel
			if(src.SecondKeybladeElement=="Nothingness")
				return src.SecondKeybladeLevel
		LoseDriveForms()
			if(src.KeybladeElement!="Nothingness")
				if(!src.SecondKeyblade&&!src.SecondKeybladeElement&&!src.SecondKeybladeLevel)
					for(var/obj/Skills/TierS/DriveForm/df, src)
						src << "You lose the capability to use Drive Forms without a second keyblade."
						del df
		GainDriveForms()
			if(src.KeybladeElement=="Nothingness"||src.SecondKeybladeElement=="Nothingness"||(src.SecondKeyblade&&src.SecondKeybladeElement&&src.SecondKeybladeLevel))
				if(!locate(/obj/Skills/TierS/DriveForm,src))
					src.contents+=new/obj/Skills/TierS/DriveForm
					src << "You gain the capability to use Drive Forms due to having two keyblades."

		EquippedStaff()
			var/obj/Items/BambooStaff/staffy
			for(var/obj/Items/BambooStaff/s in src)
				if(s.suffix)
					staffy=s
					break
			if(staffy)
				return staffy
			else
				return 0
		StaffOverlays(var/obj/Items/BambooStaff/s, var/type)
			if(type=="Remove")
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<sound('KunaiMod/Sounds/throw.ogg')
						src<<sound('KunaiMod/Sounds/throw.ogg')
				src.overlays-=image(icon=s.icon,icon_state=s.icon_state,pixel_x=s.pixel_x,pixel_y=s.pixel_y)
			if(type=="Add")
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<sound('KunaiMod/Sounds/throw.ogg')
						src<<sound('KunaiMod/Sounds/throw.ogg')
				src.overlays+=image(icon=s.icon,icon_state=s.icon_state,pixel_x=s.pixel_x,pixel_y=s.pixel_y)
		MakeStaff(var/obj/Items/BambooStaff/s, var/damage, var/acc, var/delay, var/icon/i=null, var/icons=null)
			s.Damage_Multiplier=damage
			s.Accuracy_Multiplier=acc
			s.Delay_Multiplier=delay
			s.Points=0
			s.PointsAssigned=1
			s.EnchantType=null
			s.Enchanted=1
			s.Homing=1
			src.StaffOverlays(s, "Remove")

		EquippedDagger()
			var/obj/Items/Dagger/daggy
			for(var/obj/Items/Dagger/d in src)
				if(d.suffix)
					daggy=d
					break
			if(daggy)
				return daggy
			else
				return 0
		DaggerOverlays(var/obj/Items/Dagger/d, var/type)
			if(type=="Remove")
				for(var/mob/E in view(12,usr))
					for(var/obj/Communication/C in src)
						E<<sound('KunaiMod/Sounds/throw.ogg')
						src<<sound('KunaiMod/Sounds/throw.ogg')
				src.overlays-=image(icon=d.icon,icon_state=d.icon_state,pixel_x=d.pixel_x,pixel_y=d.pixel_y)
			if(type=="Add")
				for(var/mob/E in view(12,usr))
					for(var/obj/Communication/C in src)
						E<<sound('KunaiMod/Sounds/throw.ogg')
						src<<sound('KunaiMod/Sounds/throw.ogg')
				src.overlays+=image(icon=d.icon,icon_state=d.icon_state,pixel_x=d.pixel_x,pixel_y=d.pixel_y)
		MakeDagger(var/obj/Items/Dagger/d, var/damage, var/acc, var/delay, var/icon/i=null, var/icons=null)
			d.Damage_Multiplier=damage
			d.Accuracy_Multiplier=acc
			d.Delay_Multiplier=delay
			d.Points=0
			d.PointsAssigned=1
			d.EnchantType=null
			d.Enchanted=1
			d.Homing=1
			src.DaggerOverlays(d, "Remove")


		EquippedSword()
			var/obj/Items/Sword/sord
			for(var/obj/Items/Sword/s in src)
				if(s.suffix)
					sord=s
					break
			if(sord)
				return sord
			else
				return 0
		SwordOverlays(var/obj/Items/Sword/s, var/type)
			if(type=="Remove")
				src.overlays-=image(icon=s.icon,icon_state=s.icon_state,pixel_x=s.pixel_x,pixel_y=s.pixel_y)
			if(type=="Add")
				src.overlays+=image(icon=s.icon,icon_state=s.icon_state,pixel_x=s.pixel_x,pixel_y=s.pixel_y)
		MakeSword(var/obj/Items/Sword/s, var/damage, var/acc, var/delay, var/icon/i=null, var/icons=null)
			s.Damage_Multiplier=damage
			s.Accuracy_Multiplier=acc
			s.Delay_Multiplier=delay
			s.Points=0
			s.PointsAssigned=1
			s.EnchantType=null
			s.Enchanted=1
			src.SwordOverlays(s, "Remove")
			if(i)
				s.icon=i
				s.icon_state=icons
				s.pixel_x=0
				s.pixel_y=0
			src.SwordOverlays(s, "Add")
		MakeDualWield(var/obj/Items/Sword/s)
			src.MakeSword(s, 1, 0.8, 2, icon('SwordDualKatana.dmi'), "")
		MakeKusanagi(var/obj/Items/Sword/s)
			src.MakeSword(s, 1.5, 1, 4)//get an icon
			s.name="Kusanagi"
		MakeDurendal(var/obj/Items/Sword/s)
			src.MakeSword(s, 4, 1.5, 0.25)//get an icon
			s.name="Durendal"
		MakeMasamune(var/obj/Items/Sword/s)
			src.MakeSword(s, 0.75, 2, 2)//get an icon
			s.name="Masamune"
		MakeTripleWield(var/obj/Items/Sword/s)
			src.MakeSword(s, 1.5, 1, 3)//get an icon
		MakeSoulCalibur(var/obj/Items/Sword/s)
			src.MakeSword(s, 2, 1, 2)//get an icon
			s.name="Soul Calibur"
		MakeSoulEdge(var/obj/Items/Sword/s)
			src.MakeSword(s, 3, 0.75, 1)//get an icon
			s.name="Soul Edge"
		MakeMuramasa(var/obj/Items/Sword/s)
			src.MakeSword(s, 2.5, 1, 2)//get an icon
			s.name="Muramasa"
		IsEvil()
			var/list/races=list("Changeling", "Majin", "Dragon", "Vampire", "Lycan", "Demon", "Half Demon", "Makaioshin", "Popo", "God of Destruction")
			if(src.Race in races)
				return 1
			if(src.NecroLevel)
				return 1
			if(src.HasEvilSword())
				return 1
			if(src.Majin)
				return 1
			if(locate(/obj/Regenerate,src))
				return 1
			if(locate(/obj/Skills/Rank/Necromancy,src))
				return 1
			if(locate(/obj/Skills/VampireFrenzy,src))
				return 1
			if(locate(/obj/Lycan,src))
				return 1
			return 0
		HasEvilSword()
			if(src.WeaponSoul=="Corrupt"||src.WeaponSoul=="Calibur"||src.WeaponSoul=="Edge"||src.WeaponSoul=="Muramasa")
				return 1
			if(src.HasKeyblade("Darkness", 1))
				return 1
			return 0
		SoulCaliburChecks(var/dmg)
			if(src.SoulCalibur==1)
				if(prob(10))
					src.HealHealth(dmg)
					dmg=0
				if(dmg)
					if(prob(33))
						dmg*=0.5
					else
						dmg*=0.85
				return dmg
			if(src.SoulCalibur==2)
				if(prob(20))
					src.HealHealth(dmg)
					dmg=0
				if(dmg)
					if(prob(50))
						dmg*=0.5
					else
						dmg*=0.75
				return dmg
		LunarWrathFail()
			for(var/obj/Skills/Buffs/LunarWrath/lw in src)
				if(lw.BuffUsing)
					src.BuffX("MoonBerserker", lw)
			src << "Your Lunar Wrath has failed!"
			src.LunarWrathCD=1
			spawn(3000)
				src.LunarWrathCD=0
		StartWoN()
			src << "NO THIS IS INCOMPLETE DON'T USE IT YOU'LL CRASH THE SERVER"
			return
			src << "Don't log out while using this."
			src.WoNing=1
			src.MakeWoNObject()
		MakeWoNObject()
			var/health=src.Power*(src.GetStr()*src.GetFor()/2)*200
			var/obj/WorldOfNothingness/won = new/obj/WorldOfNothingness(locate(src.x, src.y, src.z))
			won.Health=health
			won.Owner=src
			won.Timer=10*(60*10)//10 minutes
			spawn()won.Life()
obj
	WorldOfNothingness
		var/Timer
		var/RPModed
		icon='BlackHole.dmi'
		Grabbable=0
		proc
			Life()
				if(!RPModed)
					src.Timer--
					if(src.Timer <= 0)
						src.EndOfTheWorld()
				sleep(1)
				src.Life()
			EndOfTheWorld()
				for(var/mob/m in world)
					if(m.z==src.z)
						m << "[src.Owner] has devoured the world..."
						m.loc=locate(250, 250, 12)
				src.Owner.Ascend(src.Owner.BaseMod+20)
				src.Owner.WoNing=0

