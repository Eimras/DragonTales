/*proc/SenseDetect(atom/A,Range)
	var/list/Mobs=new
	for(var/mob/P in world)
		if(P.client)
			if(P.z==A.z)
				var/t=abs(A.x-P.x)+abs(A.y-P.y)
				if(t<10)
					Mobs+=P
//					continue
				else
					if(t<Range*P.ControlPower)
						Mobs+=P
	return Mobs*/

proc/SenseDetect(atom/A,Range)
	var/list/Mobs=new
	for(var/mob/P in world)
		if(P.client)
			if(P.z==A.z)
				var/t=abs(A.x-P.x)+abs(A.y-P.y)
				if(t<Range*A.SenseAbility)
					Mobs+=P
	return Mobs

mob/var/list/Tabz=list("Science"="Hide","Build"="Hide","Enchantment"="Hide","Inventory"="Show")
mob/var/EzPowerControl=0
mob/Players/verb/ArrangeTabs()
	set category="Other"
	var/list/tabz=list("Inventory","Cancel")
	var/blah=input("Toggle which tab?")in tabz
	if(blah=="Cancel")return
	if(usr.Tabz["[blah]"]=="Show")
		usr.Tabz["[blah]"]="Hide"
		usr<<"[blah] tab hidden!"
	else
		usr.Tabz["[blah]"]="Show"
		usr<<"[blah] tab showing! Turn this off when you're not using it."
		usr.TabCount=1200

/*mob/proc/SenseRange()
	var/blah=src.EnergyMax/25
	if(blah>1000)
		blah=1000
	return blah*/

mob/proc/SenseRange()
	var/blah=src.SenseRange
	if(blah>1000)
		blah=1000
	return blah

mob/var/StatTick=15

mob/Players/Stat()
	set background=1
	if(Allow_Votes)
		for(var/obj/Vote/V in world)
			statpanel("Vote")
			if(statpanel("Vote"))
				stat(V)
				stat("Vote starter:","[V.VoterN]{[V.Voter]}")
				stat("Vote target:","[V.VotedN]{[V.Voted]}")
				stat("Vote reason:","[V.reason]")
				stat("Votes (Y/N):","[V.yes]/[V.no]")
				stat("Time left:","[V.time] seconds")
				stat("-----------")
	for(var/obj/Child/E in contents)
		if(E.type!=/obj/Child/Mate)
			statpanel("Offspring")
			if(statpanel("Offspring"))
				stat(E)
				stat("Race:","[E.Race]")
				stat("-----------")

	if(Target && usr.AFKTimer)
		if(istype(Target,/mob))
			if(Target.KO||istype(Target,/mob/Body))
				if(Target!=src)
					if(!src.KO)
						if(Target in view(1))
							statpanel("Loot")
							if(statpanel("Loot"))
								stat(Target)
								for(var/obj/A in Target) if(A.Stealable) stat(A)
	if(client.show_verb_panel&&!Tabs)
		if(Race=="Saiyan")
			SaiyanAnger()
		if(istext(Health))
			Health=100
			usr<<"Your health was somehow a text variable and reset to 100. o.o"

		if(Health<=AngerThreshold&&!src.DarkModeCD&&!src.Enlightenment)
			Anger()
			if(Health<=0)
				if(!KO)
					if(Health<0&&!KO) Unconscious(null,"low health!")
		if(Health<=25&&!src.DarkModeCD)
			for(var/obj/Items/Sword/S in src) if(S.suffix&&S.Keyblade)
				if(src.HasKeyblade("Darkness", 1))
					if(src.NoDarkMode())
						src.DarkMode=3000
						src.DarkModeCD=1
						spawn(3000) src.DarkModeCD=0
		if(Energy<0) Energy=0
//		if(TotalInjury<0) TotalInjury=0
//		if(TotalFatigue<0) TotalFatigue=0
//		if(TotalEssence<0) TotalEssence=0
		if(usr.StatDisplay==0)
			statpanel("Statistics")
			StunCheck(src)
			StunImmuneCheck(src)
			if(statpanel("Statistics"))
				if(round(TotalInjury))
					stat("Health","[round(Health)] (Injury: [round(TotalInjury)]%)")
				else
					stat("Health","[round(Health)]")
				if(round(TotalFatigue))
					stat("Energy","[Commas(round(Energy))] (Fatigue: [round(TotalFatigue)]%)")
				else
					stat("Energy","[Commas(round(Energy))]")
				if(usr.IsVamp==1)
					if(round(TotalEssence))
						stat("Essence","[round(TotalEssence)]%")
				stat("Strength","[Commas(round(Strength))]")
				stat("Endurance","[Commas(round(Endurance))]")
				stat("Force","[Commas(round(Force))]")
				stat("Resistance","[Commas(round(Resistance))]")
				stat("Offense","[Commas(round(Offense))]")
				stat("Defense","[Commas(round(Defense))]")
				stat("Speed","[Commas(round(SpeedMod))]")
				stat("Regeneration","[Regeneration]")
				stat("Recovery","[Recovery]")
				stat("Base BP","[Commas(round(src.Base))]")
				stat("Combat Experience","[round(EXP)]")
				stat("RPP Multiplier","[round(RPPower)]")
				//stat("Power Rank","[GetPowerRank(2)]")
				stat("----","----")
				stat("Passive Skills:")
				stat("Unarmed:","[Skillz["Unarmed"]["Level"]] ([Skillz["Unarmed"]["Current"]]/[Skillz["Unarmed"]["Next"]])")
				stat("Sword:","[Skillz["Sword"]["Level"]] ([Skillz["Sword"]["Current"]]/[Skillz["Sword"]["Next"]])")
				//stat("Combo:","[Skillz["Warp"]["Level"]] ([Skillz["Warp"]["Current"]] /[Skillz["Warp"]["Next"]])")
				stat("Swimming:","[Skillz["Swim"]["Level"]] ([Skillz["Swim"]["Current"]] /[Skillz["Swim"]["Next"]])")
				stat("Dig:","[Skillz["Dig"]["Level"]] ([Skillz["Dig"]["Current"]] /[Skillz["Dig"]["Next"]])")
				if(!(Race in list("Android","Bio Android","Changeling","Majin","Dragon")))stat("Oxygen Conserve:","[Skillz["Oxygen"]["Level"]] ([Skillz["Oxygen"]["Current"]] /[Skillz["Oxygen"]["Next"]])")
				stat("----","----")
				stat("Misc Data:")
				stat("Physical Age: [Age]","(Decline:[Decline])")
				stat("Current Year:","[Year]")
				if(usr.Inside==0)
					stat("Build Mode: Outdoor")
				else if(usr.Inside==1)
					stat("Build Mode: Indoor")
				stat("Intel Level (EXP/EXP Needed):","[usr.IntelligenceLevel]([usr.IntelligenceEXP]/[usr.IntelligenceEXPNeeded])")
				stat("Enchant Level (EXP/EXP Needed):","[usr.EnchantmentLevel]([usr.EnchantmentEXP]/[usr.EnchantmentEXPNeeded])")
				stat("Reward Points:","[usr.RewardPoints]")
				stat("Buff Slots Open: ","[MAXBUFFS-usr.ActiveBuffs]")
				stat("Special Slots Open:","[1-usr.SpecialSlot]")
				stat("Time of Day","[Time]")
				stat("Active Buffs","------")
				for(var/obj/Skills/Buffs/B in usr.BuffList)
					stat(B)


		if(Admin&&usr.Overview==1 && usr.AFKTimer)
			statpanel("Overview")
			if(statpanel("Overview"))
				stat("Coordinates","[usr.x],[usr.y],[usr.z]")
				stat("CPU","[world.cpu]")
				stat("Power Gains","[Gains]%")
				stat("EXP Gains","[EXPGains]%")
				stat("Stat Gains","[StatGains]%")
				stat("Energy Gains","[EnergyGains]%")
				stat("Intellect Gains","[IntRate]%")
				stat("Enchanting Gains","[EnchantmentRate]%")
				stat("Decline Gains","[DeclineGains]%")
				stat("Training RPP","[PointCap]")
				stat("Speed Effect","[SpeedEffect]x")
				stat("Control Regen/Recov","[ControlRegen]/[ControlRecov]")
				stat("Control Training/Meditation Rate","[ControlTrainRate]/[ControlMedRate]")
				stat("Punch Drain","[DrainHard]x")
				stat("Leech Hardness","[LeechHard]x")
				stat("Mastery Hardness","[MasteryHard]x")
				stat("Year/Speed","[Year]/[Year_Speed]x")
				stat("Day/Speed","[Day] ([Time])/[Day_Speed]x")
				stat("Unconscious Speed","[GetUpVar]x")
				stat("Global Zenkai","[GlobalZenkai]")
				stat("Global SkillTree","[global.skilltree_locked ? "Locked" : "Unlocked"]")
				for(var/mob/Players/P)
					stat("[Commas(round(P.Power))]([round(P.Health)]%/[round(P.Energy/P.EnergyMax*100)]%)",P)
		if(Conjure && usr.AFKTimer)
			statpanel("Conjure")
			if(statpanel("Conjure"))
				for(var/mob/Players/P)
					if(P.Race=="Demon"||P.Race=="Half Demon"||P.Race=="Makaioshin")
						stat("[Commas(round(P.Power))]([round(P.Health)]%/[round(P.Energy/P.EnergyMax*100)]%)",P)
		if(Necromancy && usr.AFKTimer)
			statpanel("Necromancy")
			if(statpanel("Necromancy"))
				for(var/mob/Players/P)
					if(P.Dead||P.NecroRisen)
						stat("[Commas(round(P.Power))]([round(P.Health)]%/[round(P.Energy/P.EnergyMax*100)]%)",P)
		if(SageBunshin && usr.AFKTimer)
			statpanel("Sage Splitforms")
			if(statpanel("Sage Splitforms"))
				for(var/mob/SageSplit/P)
					if(P.SageSplit && P.Owner==src.key)
						stat("[Commas(round(P.Power))]([round(P.Health)]%/[round(P.Energy/P.EnergyMax*100)]%)",P)
		if(InIH2 && usr.AFKTimer)
			statpanel("My Dear Comrades")
			if(statpanel("My Dear Comrades"))
				for(var/mob/Servant/P)
					if(P.Owner==src.key)
						stat("[Commas(round(P.Power))]([round(P.Health)]%/[round(P.Energy/P.EnergyMax*100)]%)",P)
		if(AizenClone && usr.AFKTimer)
			statpanel("Hallucinations")
			if(statpanel("Hallucinations"))
				for(var/mob/AizenSplit/P)
					if(P.AizenSplit && P.Owner==src.key)
						stat("[Commas(round(P.Power))]([round(P.Health)]%/[round(P.Energy/P.EnergyMax*100)]%)",P)
		if(JohnTheWolf && usr.AFKTimer)
			statpanel("Wolf Pack")
			if(statpanel("Wolf Pack"))
				for(var/mob/JohnWolf/P)
					if(P.JohnWolf && P.Owner==src.key)
						stat("[Commas(round(P.Power))]([round(P.Health)]%/[round(P.Energy/P.EnergyMax*100)]%)",P)
		if(usr.Tabz["Inventory"]=="Show" && usr.AFKTimer)
			statpanel("Inventory")
			if(statpanel("Inventory"))
				for(var/obj/Money/M in usr)
					stat(M)
				for(var/obj/Items/A in usr)
					stat(A)

		var/Scouterz=0
		if(usr.Control)
			Scouterz=1
			var/obj/Items/Tech/SpaceTravel/N=usr.Control
			var/obj/Items/Tech/CameraProbe/CP=usr.Control
			if(istype(N,/obj/Items/Tech/SpaceTravel))
				if(N in world)
					statpanel("Vessel Stats")
					if(statpanel("Vessel Stats"))
						stat("Coordinates","[N.x],[N.y],[N.z]")
						stat("Fuel/Max Fuel:[N.Fuel]/[N.MaxFuel]")
						stat("Fuel Usage:[N.FuelUsage]")
						stat("Speed:[N.MaxSpeed]")
					if(N.Lvl>=20)
						statpanel("Ship Scanners")
						if(statpanel("Ship Scanners"))
							stat("Coordinates","[N.x],[N.y],[N.z]")
							var/SBCheck=0
							for(var/obj/Items/Tech/SpaceTravelParts/Misc/ScannerBooster/SB in N)
								SBCheck=1
							for(var/obj/Items/Tech/SpaceTravelParts/Misc/ScannerSuite/SS in N)
								SBCheck=1
							for(var/mob/Players/M in world)
								if(!M.AdminInviso)
									if(M.z==N.z&&M.Power>(5*Day))
										if(M in SenseDetect(N,N.Range)||M.Power>1000000)
											if(SBCheck==1)
												var/distancecalc=abs(M.x-N.x)+abs(M.y-N.y)
												if(M.Power<=N.Lvl*N.Lvl*20000)
													stat("[Commas(Get_Scouter_Reading(M))] [N.CheckDirection(M)], [distancecalc] tiles away")
												else
													stat("ERROR [N.CheckDirection(M)], [distancecalc] tiles away")
											else
												if(M.Power<=N.Lvl*N.Lvl*20000)
													stat("[Commas(Get_Scouter_Reading(M))] [N.CheckDirection(M)]")
												else
													stat("ERROR [N.CheckDirection(M)]",M)
							if(locate(/obj/Items/Tech/SpaceTravelParts/Misc/RadarArray,N.contents)||locate(/obj/Items/Tech/SpaceTravelParts/Misc/ScannerSuite,N.contents))
//							for(var/obj/Items/Tech/SpaceTravelParts/Misc/RadarArray/RA in N)
								for(var/obj/Items/Tech/SpaceTravel/ST in world)
									if(ST.z==N.z)
										if(!locate(/obj/Items/Tech/SpaceTravelParts/Misc/RadarJammer,ST.contents))
											stat("[N.CheckDirection(ST)]",ST)
					if(N.Lvl>=35)
						statpanel("Navigation")
						if(statpanel("Navigation"))
							stat("Coordinates","[N.x],[N.y],[N.z]")
							for(var/obj/Planets/Z in world)
								if(istype(Z,/obj/Planets/Sanctuary))
									continue
								if(Z.z==N.z)
									var/NBCheck=0
									for(var/obj/Items/Tech/SpaceTravelParts/Misc/NavigationBooster/NB in N)
										NBCheck=1
									for(var/obj/Items/Tech/SpaceTravelParts/Misc/ScannerSuite/SS in N)
										NBCheck=1
									if(NBCheck==1)
										var/distancecalc=abs(Z.x-N.x)+abs(Z.y-N.y)
										stat("[N.CheckDirection(Z)],[distancecalc] tiles away",Z)
									else
										stat("[N.CheckDirection(Z)]",Z)
							for(var/obj/Items/Tech/Beacon/Y in world)
								if(Y.BeaconState=="On"&&Y.z==N.z)
									stat("[N.CheckDirection(Y)]",Y)
			if(istype(CP,/obj/Items/Tech/CameraProbe))
				if(CP in world)
					if(N.Lvl>=20)
						statpanel("Camera Scan")
						if(statpanel("Camera Scan"))
							stat("Coordinates","[CP.x],[CP.y],[CP.z]")
							for(var/mob/Players/M in world)
								if(!M.AdminInviso)
									if(M.z==CP.z&&M.Power>(5*Day))
										if(M in SenseDetect(CP,usr.SenseRange())||M.Power>1000000)
											if(M.Power<=CP.Lvl*CP.Lvl*15000)
												stat("[Commas(Get_Scouter_Reading(M))] [CP.CheckDirection(M)]")
											else
												stat("ERROR [CP.CheckDirection(M)]")

		var/EquippedScouter=0
		var/ScouterLevel=0
		var/ShipDetection=0
		var/EnhanceCheck=0
		var/ScouterName
		var/RaditzCheck
		var/RaditzName
		var/ScouterRange=50
		var/BPRange=20000

		for(var/obj/Items/Tech/ScannerStation/SS in oview(usr,1))
			ScouterName=SS.name
			ScouterLevel=SS.Lvl+SS.LvlMultiplier
			ShipDetection=SS.DetectShip
			RaditzCheck=SS.RaditzMode
			RaditzName=SS.RaditzModeName
			ScouterRange=SS.Range
			BPRange=SS.BaseBPScan
			statpanel("ScannerStation")
			if(statpanel("ScannerStation"))
				stat("Coordinates","[usr.x],[usr.y],[usr.z]")
				stat("Scanner Station Readings")
				for(var/mob/Players/M in world)
					if(!M.AdminInviso)
						if(M.z==usr.z&&M.Power>(5*Day))
							if(M in SenseDetect(usr,ScouterRange)||M.Power>1000000)
								var/distancecalc=abs(M.x-usr.x)+abs(M.y-usr.y)
								if(M.Power<=ScouterLevel*ScouterLevel*BPRange)
									if(RaditzCheck)
										var/RaditzCalc=Get_Scouter_Reading(M)/RaditzCheck
										if(EnhanceCheck)
											if(distancecalc<=10)
												stat("[Commas(RaditzCalc)] [RaditzName] [CheckDirection(M)], [distancecalc] tiles away",M)
											else
												stat("[Commas(RaditzCalc)] [RaditzName] [CheckDirection(M)], [distancecalc] tiles away")
										else
											if(distancecalc<=10)
												stat("[Commas(RaditzCalc)] [RaditzName] [CheckDirection(M)]",M)
											else
												stat("[Commas(RaditzCalc)] [RaditzName] [CheckDirection(M)]")
									else
										if(EnhanceCheck)
//												distancecalc=abs(M.x-usr.x)+abs(M.y-usr.y)
											if(distancecalc<=10)
												stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)], [distancecalc] tiles away",M)
											else
												stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)], [distancecalc] tiles away")
										else
											if(distancecalc<=10)
												stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)]",M)
											else
												stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)]")
								else
									if(distancecalc<=10)
										stat("ERROR [CheckDirection(M)]",M)
									else
										stat("ERROR [CheckDirection(M)]")


		for(var/obj/Items/Tech/Scouter/L in usr.contents)
			if(L.suffix)
				EquippedScouter=1
				ScouterName=L.name
				ScouterLevel=L.Lvl+L.LvlMultiplier
				ShipDetection=L.DetectShip
				RaditzCheck=L.RaditzMode
				RaditzName=L.RaditzModeName
				ScouterRange=L.Range
				BPRange=L.BaseBPScan
				if(locate(/obj/Items/Tech/ScouterUpgrades/ModernUpgrade/ModernRangeCalculator,L.contents))
					EnhanceCheck=1
				break
		if(usr.Race=="Android" && usr.AFKTimer||usr.InternalScouter==1 && usr.AFKTimer||EquippedScouter==1 && usr.AFKTimer&& usr.AFKTimer)
			Scouterz=1
			statpanel("Scouter")
			if(statpanel("Scouter"))
				stat("Coordinates","[usr.x],[usr.y],[usr.z]")
				if(EquippedScouter==1)
					stat("[ScouterName] Readings")
				else
					stat("Internal Scouter Readings")
				for(var/mob/Players/M in world)
					if(!M.AdminInviso)
						if(M.z==usr.z&&M.Power>(5*Day))
							if(M in SenseDetect(usr,ScouterRange)||M.Power>1000000)
								var/distancecalc=abs(M.x-usr.x)+abs(M.y-usr.y)
								if(EquippedScouter==1)
									if(M.Power<=ScouterLevel*ScouterLevel*BPRange)
										if(RaditzCheck)
											var/RaditzCalc=Get_Scouter_Reading(M)/RaditzCheck
											if(EnhanceCheck)
//												var/distancecalc=abs(M.x-usr.x)+abs(M.y-usr.y)
												if(distancecalc<=10)
													stat("[Commas(RaditzCalc)] [RaditzName] [CheckDirection(M)], [distancecalc] tiles away",M)
												else
													stat("[Commas(RaditzCalc)] [RaditzName] [CheckDirection(M)], [distancecalc] tiles away")
											else
												if(distancecalc<=10)
													stat(M,"[Commas(RaditzCalc)] [RaditzName] [CheckDirection(M)]")
												else
													stat("[Commas(RaditzCalc)] [RaditzName] [CheckDirection(M)]")
										else
											if(EnhanceCheck)
//												distancecalc=abs(M.x-usr.x)+abs(M.y-usr.y)
												if(distancecalc<=10)
													stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)], [distancecalc] tiles away",M)
												else
													stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)], [distancecalc] tiles away")
											else
												if(distancecalc<=10)
													stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)]",M)
												else
													stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)]")
									else
										if(distancecalc<=10)
											stat("ERROR [CheckDirection(M)]",M)
										else
											stat("ERROR [CheckDirection(M)]")
								else
									if(M.Power<=usr.IntelligenceLevel*usr.EnchantmentLevel*100*BPRange*Year)
//										distancecalc=abs(M.x-usr.x)+abs(M.y-usr.y)
										stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)], [distancecalc] tiles away",M)
									else
										stat("ERROR [CheckDirection(M)]",M)
						if(usr.EnhancedSensors==1)
							if(usr.z==1&&M.z==15)
								if(M.Power<=usr.IntelligenceLevel*usr.EnchantmentLevel*100*15000*Year)
									var/distancecalc=abs(M.x-usr.x)+abs(M.y-usr.y)
									stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)], [distancecalc] tiles away, underground")
								else
									stat("ERROR [CheckDirection(M)]")
				if(EquippedScouter==0)
					for(var/obj/Items/Tech/Beacon/B in world)
						if(B.BeaconState=="On"&&usr.z==B.z)
							stat("[CheckDirection(B)]",B)
				if(EquippedScouter==1)
					for(var/obj/Items/Tech/Beacon/B in world)
						if(B.BeaconState=="On"&&usr.z==B.z&&ScouterLevel>=14)
							stat("[CheckDirection(B)]",B)
					if(ShipDetection==1)
						for(var/obj/Items/Tech/SpaceTravel/V in world)
							if(usr.z==V.z&&ScouterLevel>=34 && ShipDetection==1)
								if(!locate(/obj/Items/Tech/SpaceTravelParts/Misc/RadarJammer,V.contents))
									stat("[CheckDirection(V)]",V)
					else if(ShipDetection==0)
						for(var/obj/Items/Enchantment/PocketDimensionGenerator/W in world)
							if(usr.z==W.z&&ScouterLevel>=34 && ShipDetection==2)
								stat("[CheckDirection(W)]",W)
			if(usr.Target)
				if(ismob(usr.Target))
					if(100<EnergyMax||usr.Admin)
						statpanel("Targeted Scan")
						if(statpanel("Targeted Scan"))
							stat("Focused:",Target)
							if(Target.StanceActive)
								stat("Stance Detected: [Target.Stance] stance.")
							stat("Direction","[CheckDirection(Target)]")
							stat("Power;","[Commas(Get_Scouter_Reading(Target))]")
							stat("Health","[Target.Health]%")
							stat("Energy","[(Target.Energy/Target.EnergyMax)*100]%")
				/*			if(usr.Admin)//1000<EnergyMax)
								stat("Strength","[Commas(((Target.Strength*Target.StrengthMultiplier)/(Strength*StrengthMultiplier))*100)]% yours")
								stat("Endurance","[Commas(((Target.Endurance*Target.EnduranceMultiplier)/(Endurance*EnduranceMultiplier))*100)]% yours")
								stat("Speed","[Commas(((Target.SpeedMod*Target.SpeedMultiplier)/(SpeedMod*SpeedMultiplier))*100)]% yours")
								stat("Force","[Commas(((Target.Force*Target.ForceMultiplier)/(Force*ForceMultiplier))*100)]% yours")
								stat("Resistance","[Commas(((Target.Resistance*Target.ResistanceMultiplier)/(Resistance*ResistanceMultiplier))*100)]% yours")
								stat("Offense","[Commas(((Target.Offense*Target.OffenseMultiplier)/(Offense*OffenseMultiplier))*100)]% yours")
								stat("Defense","[Commas(((Target.Defense*Target.DefenseMultiplier)/(Defense*DefenseMultiplier))*100)]% yours")*/
							if(usr.Admin)
								for(var/obj/Z in Target.contents)
									if(!Z.AdminInviso)
										stat(Z)
/*		for(var/obj/Items/Tech/Scouter/L in usr.contents)
			if(L.suffix)
				Scouterz=1
				statpanel("Scouter")
				if(statpanel("Scouter"))
					stat("Coordinates","[usr.x],[usr.y],[usr.z]")
					for(var/mob/Players/M in world)
						if(!M.AdminInviso)
							if(M.z==usr.z&&M.Power>(5*(Year/5)))
								if(M in SenseDetect(usr,usr.SenseRange())||M.Power>1000000)
									if(M.Power<=L.Lvl*L.Lvl*10000)
										stat("[Commas(Get_Scouter_Reading(M))] [CheckDirection(M)]",M)
									else
										stat("??? [CheckDirection(M)]",M)
					for(var/obj/Items/Tech/Beacon/B in world)
						if(B.BeaconState=="On"&&usr.z==B.z&&L.Lvl>=34)
							stat("[CheckDirection(B)]",B)
					for(var/obj/Items/Tech/SpaceTravel/Ship/V in world)
						if(usr.z==V.z&&L.Lvl>=34 && L.DetectShip==1)
							stat("[CheckDirection(V)]",V)
					//obj/Items/Enchantment/PocketDimensionGenerator
					for(var/obj/Items/Enchantment/PocketDimensionGenerator/W in world)
						if(usr.z==W.z&&L.Lvl>=34 && L.DetectShip==2)
							stat("[CheckDirection(W)]",W)
			if(usr.Target && L.suffix)
				if(ismob(usr.Target))
					if(SenseReq*500<EnergyMax||usr.Admin)
						statpanel("Current Target")
						if(statpanel("Current Target"))
							stat("Focused:",Target)
							stat("Direction","[CheckDirection(Target)]")
							stat("Power;","[Commas(Get_Sense_Reading(Target))]% yours")
							stat("Health","[Target.Health]%")
							stat("Energy","[(Target.Energy/Target.EnergyMax)*100]%")
							if(SenseReq*1000<EnergyMax)
								stat("Strength","[Commas(((Target.Strength*Target.StrengthMultiplier)/(Strength*StrengthMultiplier))*100)]% yours")
								stat("Endurance","[Commas(((Target.Endurance*Target.EnduranceMultiplier)/(Endurance*EnduranceMultiplier))*100)]% yours")
								stat("Speed","[Commas(((Target.Speed*Target.SpeedMultiplier)/(Speed*SpeedMultiplier))*100)]% yours")
								stat("Force","[Commas(((Target.Force*Target.ForceMultiplier)/(Force*ForceMultiplier))*100)]% yours")
								stat("Resistance","[Commas(((Target.Resistance*Target.ResistanceMultiplier)/(Resistance*ResistanceMultiplier))*100)]% yours")
								stat("Offense","[Commas(((Target.Offense*Target.OffenseMultiplier)/(Offense*OffenseMultiplier))*100)]% yours")
								stat("Defense","[Commas(((Target.Defense*Target.DefenseMultiplier)/(Defense*DefenseMultiplier))*100)]% yours")
							if(usr.Admin)
								for(var/obj/Z in Target.contents)
									if(!Z.AdminInviso)
										stat(Z)*/
//				break
		if(EnhancedSmell==1 && usr.AFKTimer)
			statpanel("Smell")
			if(statpanel("Smell"))
				for(var/mob/Players/M in view(250))
					if(!M.AdminInviso)
						var/show="Clean"
						if(M.Race=="Android"||M.MachinaMod)
							show="Metallic"
						else if(M.MazokuAscend||M.Berserkering)
							show="Ominous"
						else if(M.NecroLevel>0)
							show="Undead"
						else if(M.Darlose||M.Kowala)
							show="Nigger"
						else if(M.Class=="Spiral")
							show="Old Spice"
						else if(M.SexyMod>0)
							show="Lady Gaga"
						else if(M.Race=="Hollow")
							show="Angst Incarnate"
						else if(M.Race=="Popo")
							show="Pecking Order"
						else if(M.Race=="Changeling")
							show="Lizard"
						else if(M.Race=="Synchronizer"&&M.Class=="Maid")
							show="Dust, mold... and hint of Dank Memes"
						else if(M.Race=="Synchronizer"&&M.Class=="Revolutionary")
							show="Dust, mold... and hint of REVOLUTION?"
						else if(M.Race=="Synchronizer"&&M.Class=="Meme")
							show="SUPREME MEMES... and a hint of Pecking Order"
						else if(M.Race=="Reploid")
							show="Machine and... Will?"
						else if(M.Race=="Neko")
							show="Kitty Litter"
						else if(M.Race=="Youkai")
							show="Japanese Folklore"
						else if(M.Race=="Manakete")
							show="Magic, Lemons and... Red Dragon Peppers?"
						else if(M.Race=="Trueseer")
							show="Truthful"
						else if(M.CursedAlpha||M.CursedBeta)
							show="Damned"
						else
							if(locate(/obj/Lycan) in M)
								show="Lycan"
							if(locate(/obj/Skills/VampireAbsorb) in M)
								if(show=="Lycan")
									show="Half Breed"
								else show="Vampire"
							if(M.Race=="Kaio")
								show="Holy"
							if(M.Race in list("Demon", "Half Demon", "Majin", "Dragon"))
								if(show=="Holy")
									show="Ominous"
								else show="Demonic"
							if(locate(/obj/Skills/Buffs/Mystic) in M)
								show="Pure"
							if(locate(/obj/Skills/Buffs/Majin) in M)
								if(show=="Pure")
									show="Ominous"
								else show="Corrupt"

						stat("[show] [CheckDirection(M)]",M)

		if(Scouterz==0 && usr.AFKTimer)
			if(usr.ForceSensitive)
				statpanel("Force Sense")
				if(statpanel("Force Sense"))
					for(var/mob/Players/m in world)
						if(!m.AdminInviso)
							if(m.z==usr.z)
								if(m in SenseDetect(usr, (usr.ForceLevel*10)))
									var/sensitive = m.ForceSensitive
									var/alignment = m.ForceAlignment
									var/stealthed = m.ForceStealth
									var/stealthsense = m.StealthSensitive
									var/stealthalign = m.StealthAlignment

									if(!sensitive)
										stat("[m]", "[CheckDirection(m)] - Not Sensitive")
									if(sensitive)
										if(!stealthed)
											stat("[m]", ", [CheckDirection(m)] - Force Sensitive ([alignment])")
										else
											if(usr.ForceLevel>=m.ForceLevel)
												stat("[m]", "[CheckDirection(m)] - Force Sensitive ([alignment])")
											else
												if(!stealthsense)
													stat("[m]", "[CheckDirection(m)] - Not Sensitive")
												else
													stat("[m]","[CheckDirection(m)] - Force Sensitive([stealthalign])")
//			if(usr.SenseReq*250<EnergyMax||usr.Admin)
			if(usr.SenseActive)
				statpanel("Sense")
				if(statpanel("Sense"))
					for(var/mob/Players/M in world)
						if(!M.AdminInviso)
							if(!M.AltusSopor&&M.Race!="Android")
//								if((M.z==usr.z&&M.Power>(5*Day))||M.Power>1000000000)
								if(M.z==usr.z)
									if(M in SenseDetect(usr,usr.SenseRange()))
//										var/add="<font color=white>"
//										var/SenseSanityCheck=0
/*										if(3*M.Power<=usr.Power)
											SenseSanityCheck=1
											add="<font color=blue>"
										else if(M.Power>=usr.Power&&M.Power<=usr.Power*3)
											SenseSanityCheck=1
											add="<font color=yellow>"
										else if(M.Power<=usr.Power&&3*M.Power>=usr.Power)
											SenseSanityCheck=1
											add="<font color=green>"
										else if(M.Power>=usr.Power*3&&M.Power<=usr.Power*10)
											SenseSanityCheck=1
											add="<font color=red>"*/
										/*else if(M.Power>=usr.Power*10)
//											SenseSanityCheck=1
											add="<font color=purple>"*/
										if(SenseActive>=4)
											stat("[Get_Exact_Sense_Reading(M)]%, [CheckDirection(M)]",M)
										else
											var/distancecalc=abs(M.x-usr.x)+abs(M.y-usr.y)
											if(distancecalc<=10)
												stat("[Get_Sense_Reading(M, 1)], [CheckDirection(M)] - ",M)
											else
												stat("[M.name] - [Get_Sense_Reading(M, 1)], [CheckDirection(M)]")

			if(usr.Target)
				if(ismob(usr.Target))
					if(!usr.SenseActive)
						statpanel("Current Target")
						if(statpanel("Current Target"))
							stat("Focused:",Target.name)
							if(Target.StanceActive)
								stat("They seem to be in a [Target.Stance] stance.")
							if(usr.Target in SenseDetect(usr,usr.SenseRange()))
								stat("Direction","[CheckDirection(Target)]")
							if(Target.WoundIntent)
								stat("<font color=red>Wound Intent</font>","Active")
					if(usr.SenseActive>1||usr.Admin)
						statpanel("Enhanced Sense")
						if(statpanel("Enhanced Sense"))
							if(usr.SenseActive>=4)
								stat("Focused:",Target)
							else
								stat("Focused:",Target.name)
							if(Target.StanceActive)
								stat("They seem to be in a [Target.Stance] stance.")

							if(usr.SenseActive>1)
								stat("Direction:","[CheckDirection(Target)]")
								if(usr.SenseActive>2)
									if(usr.SenseActive>=4)
										stat("Power:", "[Get_Exact_Sense_Reading(Target)]% of you")
										stat("Repression:", "[Get_Exact_Sense_Repression(Target)]")
									else
										if(Target.AltusSopor)
											stat("Power:"," Unknown")
											stat("Repression:", " Unknown")
										else
											stat("Power:","[Get_Sense_Reading(Target)]")
											stat("Repression:", "[Get_Sense_Repression(Target)]")
								stat("Health:","[Target.Health]%")
								stat("Energy:","[(Target.Energy/Target.EnergyMax)*100]%")
							if(Target.WoundIntent)
								stat("<font color=red>Wound</font> intent active.")
				/*			if(src.Admin)//SenseReq*1000<EnergyMax)
								stat("Strength","[Commas(((Target.Strength*Target.StrengthMultiplier)/(Strength*StrengthMultiplier))*100)]% yours")
								stat("Endurance","[Commas(((Target.Endurance*Target.EnduranceMultiplier)/(Endurance*EnduranceMultiplier))*100)]% yours")
								stat("Speed","[Commas(((Target.SpeedMod*Target.SpeedMultiplier)/(SpeedMod*SpeedMultiplier))*100)]% yours")
								stat("Force","[Commas(((Target.Force*Target.ForceMultiplier)/(Force*ForceMultiplier))*100)]% yours")
								stat("Resistance","[Commas(((Target.Resistance*Target.ResistanceMultiplier)/(Resistance*ResistanceMultiplier))*100)]% yours")
								stat("Offense","[Commas(((Target.Offense*Target.OffenseMultiplier)/(Offense*OffenseMultiplier))*100)]% yours")
								stat("Defense","[Commas(((Target.Defense*Target.DefenseMultiplier)/(Defense*DefenseMultiplier))*100)]% yours")*/
							if(usr.Admin)
								for(var/obj/Z in Target.contents)
									if(!Z.AdminInviso)
										stat(Z)
				/*			if(Target.Power<25*Day)
								if(prob(25))
									usr.Target=null*/
	//sleep(global.TabTick)

/*mob/proc/ScienceTab()
	while(src.Tabz["Science"]=="Show")
		if(src.Intelligence>0)
			statpanel("Science")
			if(statpanel("Science"))
				stat("Level:","[src.IntelligenceLevel]")
				stat("EXP:","[src.IntelligenceEXP]/[src.IntelligenceEXPNeeded]")
				for(var/obj/Money/M in src)
					stat(M)
				for(var/obj/O in Technology_List)
					if(usr.IntelligenceLevel>=O.Level)
						stat("[Commas(Technology_Price(src,O))]",O)
	sleep(StatTick)*/



/*
	else if(Tabs=="Appearance")
		statpanel("Hair")
		if(statpanel("Hair"))
			stat(Done)
			stat(Hair_List)
		statpanel("Clothes")
		if(statpanel("Clothes"))
			stat(Done)
			stat(Clothes_List)
		statpanel("Aura")
		if(statpanel("Aura"))
			stat(Done)
			stat(Aura_List)
		for(var/obj/Skills/Attacks/A in src)
			statpanel("Blasts")
			if(statpanel("Blasts"))
				stat(Done)
				stat(Blast_List)
			break*/

/*	else if(Tabs=="Customize Stats")
		statpanel("Customize Stats")
		stat("Strength","[Strength]x")
		stat("Endurance","[Endurance]x")
		stat("Force","[Force]x")
		stat("Resistance","[Resistance]x")
		stat("Speed","[Speed]x")
		stat("Efficiency","[Efficiency]x")
		stat("Regeneration","[Regeneration]x")
		stat("Recovery","[Recovery]x")
		stat("Offense","[Offense]x")
		stat("Defense","[Defense]x")*/

atom/proc/CheckDirection(var/mob/M)
	if(M)
		if(M.z==src.z)
			if(M.x > src.x)
				if(M.y>src.y)
					return "North East"
				if(M.y<src.y)
					return "South East"
				if(M.y==src.y)
					return "East"
			if(M.x < src.x)
				if(M.y>src.y)
					return "North West"
				if(M.y<src.y)
					return "South West"
				if(M.y==src.y)
					return "West"
			if(M.x == src.x)
				if(M.y>src.y)
					return "North"
				if(M.y<src.y)
					return "South"
				if(M.y==src.y)
					return "-"
		else
			return "???"









mob/proc/GetPowerUpRatio()
	//var/Ratio=1+(Charged_Power*0.025)
	var/Ratio=round(ControlPower)/100
	if(Ratio<=0)
		Ratio=0.00001
	return Ratio

mob/proc/Recover(var/blah,Amount=1)
	if(PureRPMode) return
	switch(blah)
		if("Health")
			if(Health<100+ChangieMaxHealth&&!KO&&!Transfering&&icon_state!="KB")
				if(PureRPMode) return
				if(Oxygen<1) return
			//	if(HealingDelay!=0) return
			//	if(Health<=10) Amount/=20
				src.HealHealth((0.334*Amount*ControlRegen*(Regeneration*RegenerationMultiplier))*(Health/100)*src.PermanentWounds) //5 minutes if 1 regeneration
//				if(Health<1)
//					Health=1
				if(TotalInjury>0&&!src.Defiance)
					if(Health>(100+ChangieMaxHealth-TotalInjury))
						Health=100+ChangieMaxHealth-TotalInjury
				if(Health>10&&src.HealthAnnounce25)
					src.HealthAnnounce10=0
				if(Health>25&&src.HealthAnnounce10)
					src.HealthAnnounce25=0

		if("Block")
			if(PureRPMode) return
			if(BlockShield=="Breaking")return
			BlockShield+=initial(BlockShield)/2000
			if(BlockShield>initial(BlockShield))
				BlockShield=initial(BlockShield)
			BlockHealth(src)
		if("DragonDash")
			if(PureRPMode) return
			var/CurrentDD=DragonDashes
			if(src.SuperKaioken)
				DragonDashes=3
			if(DragonDashes<3)
				DragonDashes+=0.005
				if(round(DragonDashes)==DragonDashes)
					if(!CurrentDD==DragonDashes)
						src<<"You have [DragonDashes] charges of Dragon Dash."
				if(DragonDashes>3)
					DragonDashes=3
		if("AerialRecov")
			if(PureRPMode) return
			var/CurrentAR=AerialRecoveries
			if(AerialRecoveries<3)
				AerialRecoveries+=0.05
				if(round(AerialRecoveries)==AerialRecoveries)
					if(!CurrentAR==AerialRecoveries)
						src<<"You have [AerialRecoveries] charges of Aerial Recovery."
				if(AerialRecoveries>3)
					AerialRecoveries=3
		if("Zanzoken")
			if(PureRPMode) return
			var/CurrentAR=Zanzos
			if(Zanzos<3)
				Zanzos+=0.05
				if(round(Zanzos)==Zanzos)
					if(!CurrentAR==Zanzos)
						src<<"You have [Zanzos] charges of Zanzoken."
				if(Zanzos>3)
					Zanzos=3
		if("Energy")
			if(LetztStilOn==1 && Energy<EnergyMax*3&&!Charged_Power&&icon_state!="Train"&&!Transfering&&icon_state!="Attack"&&icon_state!="Blast")
				if(src.GateNumber) return
				if(PureRPMode) return
				if(src.LastBreath)return
				if(Oxygen<1) return
				if(src.SenseActive&&src.SenseActive<3) return
			//	if(HealingDelay!=0) return
			//	if(Energy<=EnergyMax/10) Amount/=10
				src.HealEnergy((0.334*(EnergyMax*0.01)*(Recovery*RecoveryMultiplier)*Amount*ControlRecov)*(Health/100)) //5 minutes if 1 regeneration
				if(Energy>EnergyMax*3) Energy=EnergyMax*3
			else if(LetztStilOn==0&&Energy<(EnergyMax*((100-TotalFatigue)/100))&&!Charged_Power&&icon_state!="Train"&&!Transfering&&icon_state!="Attack"&&icon_state!="Blast")
				if(src.GateNumber) return
			//	if(src.Mystic) return
				if(src.PowerRecovery==1&&src.Frozen)
					Amount*=10
					if(src.AfterImageStrike>0)
						src.AfterImageStrike=0
						for(var/obj/Skills/Rank/AfterImageStrike/AIS in src.contents)
							AIS.Cooldown()
					if(src.WildSense)
						src.WildSense=0
						for(var/obj/Skills/Rank/WildSense/WS in src.contents)
							WS.Cooldown()
				if(src.Stance=="Ripple"&&src.StanceActive==1)
					Amount*=300/src.Health
				if(PureRPMode) return
				if(src.LastBreath)return
				if(Oxygen<1) return
				if(src.SenseActive&&src.SenseActive<3) return
				for(var/obj/Items/Sword/S in src) if(S.suffix)
					if(S.EnchantType=="Ultima")
						Amount/=3
					if(S.EnchantType=="Ultima-Holy")
						Amount*=3
					if(S.EnchantType=="Ultima-Darkness")
						Amount*=3
			//	if(HealingDelay!=0) return
			//	if(Energy<=EnergyMax/10) Amount/=10
				src.HealEnergy((0.334*(EnergyMax*0.01)*(Recovery*RecoveryMultiplier)*Amount*ControlRecov)*(Health/100)) //5 minutes if 1 regeneration
				if(Energy>(EnergyMax*((100-src.TotalFatigue)/100)))
					Energy=EnergyMax*((100-src.TotalFatigue)/100)

		if("Injury")
			if(PureRPMode) return
			if(TotalInjury>99)
				TotalInjury=99
			if(TotalInjury>0)
				var/InjuryRecov=(((0.000334*(Regeneration*RegenerationMultiplier))*Amount)+(0.00334*Amount)*src.PermanentWounds)
				InjuryRecov*=((100 - TotalInjury) / 100)
				if(Swim&&Class=="Poseidon")
					InjuryRecov*=2
//				if(src.Race=="Saiyan")
//					src.SaiyanEXP+=InjuryRecov
//					if(src.SaiyanEXP>=100)
//						if(src.AscensionsUnlocked < 4)
//							if(src.GetBPM()>=10000*(src.AscensionsUnlocked+1))
//								src.AscensionsUnlocked++
//								src.SaiyanEXP=0
				src.HealWounds(InjuryRecov)//Injuries last longer for good reason
				/*if(src.SexyMod)
					src.LifeFiberEXP+=InjuryRecov
					if(src.LifeFiberEXP >= 100)
						src.LifeFiberEXP=0
						if(src.LifeFiberFusion < 10)
							src.LifeFiberFusion++*/
				if(TotalInjury<0) TotalInjury=0
			if(TotalInjury<50&&src.InjuryAnnounce)
				src.InjuryAnnounce=0
			if(TotalInjury<75&&src.InjuryAnnounce75)
				src.InjuryAnnounce75=0
			if(TotalInjury<90&&src.InjuryAnnounce90)
				src.InjuryAnnounce90=0
		if("Fatigue")
			if(PureRPMode) return
			if(TotalFatigue>0)

				var/FatigueRecov=((0.0400*(Recovery*RecoveryMultiplier))*Amount)*((100 - TotalInjury) / 50)//Fatigue doesn't last as long as injuries.
				if(Swim&&Class=="Poseidon")
					FatigueRecov*=2
				src.HealFatigue(FatigueRecov)
				if(TotalFatigue<0) TotalFatigue=0
		if("Mana")
			if(Oxygen<1) return
			if(ManaAmount<ManaMax&&!KO&&!Transfering&&icon_state!="KB")
				if(PureRPMode) return
				ManaAmount+=0.334*Amount*1.1*((Recovery*RecoveryMultiplier)+(Regeneration*RegenerationMultiplier)/2*Meditation_Rate) //5 minutes if 1 regeneration
				if(ManaAmount>ManaMax)
					ManaAmount=ManaMax
		if("Essence")
			if(PureRPMode) return
			if(TotalEssence>100)
				TotalEssence=100
			if(TotalEssence>0)
				if(TotalEssence<0) TotalEssence=0
			if(TotalEssence>50&&src.EssenceAnnounce)
				src.EssenceAnnounce=0
			if(TotalEssence>25&&src.EssenceAnnounce2)
				src.EssenceAnnounce2=0
			if(TotalEssence>10&&src.EssenceAnnounce3)
				src.EssenceAnnounce3=0


mob/var/tmp/ap_looping //Available Power Loop
mob/proc/Available_Power()
	while(src.AFKTimer)
		sleep(10)
		var/ManaRecovery=0
		var/KeybladeMult=1
		var/SecondKeybladeMult=0
		var/HopeMult=1
		for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix&&!src.ManaInfusing)
			ManaRecovery=N.Mana_Recov
		if(src.HopeOverload)
			HopeMult=1.25
			if(src.Health < 80)
				HopeMult=1.5
			if(src.Health < 60)
				HopeMult=1.75
			if(src.Health < 40)
				HopeMult=2
			if(src.Health < 20)
				HopeMult=2.5
		for(var/obj/Items/Sword/S in src) if(S.suffix&&S.Keyblade)
			if(src.KeybladeElement=="Semi-Divine") //broken x-blade
				KeybladeMult=3
			if(src.KeybladeElement=="Divine") //complete x-blade
				KeybladeMult=5
			if(src.KeybladeElement=="Light")
				KeybladeMult=1.5+(0.25*src.KeybladeLevel)
			if(src.KeybladeElement=="Darkness")
				if(!src.DarkMode&&src.KeybladeLevel<4)
					KeybladeMult=1.25
				if(src.DarkMode||src.KeybladeLevel>=4)
					KeybladeMult=2.5
			if(src.KeybladeElement=="Nothingness")
				KeybladeMult=1.25+(0.1875*src.KeybladeLevel)
			if(src.SecondKeyblade)
				if(src.SecondKeybladeElement=="Light")
					SecondKeybladeMult+=0.25+(0.1125*src.SecondKeybladeLevel)
				if(src.SecondKeybladeElement=="Darkness")
					if(!src.DarkMode&&src.SecondKeybladeLevel<4)
						SecondKeybladeMult+=0.1125
					if(src.DarkMode&&src.SecondKeybladeLevel>=4)
						SecondKeybladeMult+=1.25
				if(src.SecondKeybladeElement=="Nothingness")
					SecondKeybladeMult+=0.0125+(0.09375*src.SecondKeybladeLevel)
				KeybladeMult+=SecondKeybladeMult
		//Avaliable Power
		var/Ratio=Base*20*Body*Power_Multiplier

		var ratio_mult = 1
		if(src.SuperKamuiAscension)
			ratio_mult+=3
		if(src.FruitEaten)
			ratio_mult+=1.25
		if(src.GatesNerfPerc)
			Ratio/=src.GatesNerfPerc
		if(src.MachinaMod)
			src.CyberPower = CyberBPCap * src.BaseMod * src.CyberizeMod * 2
			if(src.MachinaMod>=2)
				Ratio=Base*20*Power_Multiplier+(Power_Multiplier*src.CyberPower)

		//Health
		if(src.Race!="Android"&&!src.MachinaMod&&!src.Resolve&&!src.Berserkering)
			if(!src.Anger&&src.BraveType!="Defense"&&src.BraveLevel<2&&src.BraveType!="Both"&&!src.Enlightenment)
			//	Ratio*=max(sqrt(max(Health/100,0.01)),0.01)
				Ratio*= 1 - (TotalInjury*0.75)/100
		//
		//Energy
		if(src.Race!="Android"&&!src.Berserkering&&src.BraveType!="Defense"&&src.BraveLevel<2&&src.BraveType!="Both"&&!src.MachinaMod&&!src.Resolve&&!src.WarriorLevel>2&&!src.Enlightenment)
		//	Ratio*=max(sqrt(max(Energy/EnergyMax,0.01)),0.01)
			Ratio*= 1 - (TotalFatigue*0.25)/100

		//
//		if(Anger) Ratio*=Anger
		if(BurningShotBP) Ratio+=BurningShotBP
	//	if(PlusPower) Ratio+=PlusPower
		if(AbsorbPower)Ratio+=AbsorbPower
		if(RPPower) ratio_mult+=RPPower
		if(CyberPower&&!src.MachinaMod)Ratio+=CyberPower
		if(src.KeybladeLevel)ratio_mult+=KeybladeMult
		if(src.HopeOverload)ratio_mult+=HopeMult
		if(CounterGuardian)ratio_mult+=1.5
		if(MadeOfSwords)ratio_mult+=1.2
		if(CursedBeta=="Power")Ratio*=0.5
		if(InUBW2)ratio_mult+=2
		if(InIH2)ratio_mult+=2

		if(god_ki) ratio_mult+= god_ki
		Ratio *= ratio_mult
		var/weights=0
		for(var/obj/Items/Weights/W in src)
			if(W.suffix)
				weights+=W.Level

		if(weights)
			weights=min(0.50/(weights/WeightFormula(2)),1)

		//

		Power=Ratio*GetPowerUpRatio()
		if(Anger)Power*=Anger
		if(weights)Power*=weights


		Recover("Block",1)
		Recover("DragonDash",1)
		Recover("AerialRecov",1)
		Recover("Zanzoken",1)
		//Power=GetPower("Available")*GetPowerUpRatio()
		if(prob(99))//Health/Energy Recovery
			if(NecroLevel>=1&&PureRPMode==0)
				if(Health<100)
					Health+=0.01*src.Regeneration*src.RegenerationMultiplier*src.NecroLevel*(Health/100)
			if(src.MaskType&&src.VisoredStage==4&&PureRPMode==0&&src.Berserkering)
				if(Health<75)
					Health+=0.01*src.Regeneration*src.RegenerationMultiplier*src.trans["active"]*(Health/100)
			if(src.PathType=="Rejuvenation" && !PureRPMode)
				var/gain
				gain=(src.Regeneration*src.RegenerationMultiplier)/100*5
				if(src.Health > 20)
					gain=(src.Regeneration*src.RegenerationMultiplier)/100*4
				if(src.Health > 40)
					gain=(src.Regeneration*src.RegenerationMultiplier)/100*3
				if(src.Health > 60)
					gain=(src.Regeneration*src.RegenerationMultiplier)/100*2
				if(src.Health > 80)
					gain=(src.Regeneration*src.RegenerationMultiplier)/100
				if(src.Health < 100)
					src.Health += gain
				if(!src.SageActive && src.ManaAmount < src.ManaMax)
					src.ManaAmount+=(src.ManaMax/100)*2
			if(src.Race=="Pathless" && src.BlueAscension && !PureRPMode && src.Health < 100)
				src.Health+=src.Regeneration*src.RegenerationMultiplier/100
			if(src.Race=="Pathless" && src.IndigoAscension && !PureRPMode)
				if(src.Energy < src.EnergyMax)
					src.Energy += src.Recovery*src.RecoveryMultiplier/100

			if(icon_state=="Meditate")
				if(src.Health<100)
					Recover("Health",(src.Regeneration*src.RegenerationMultiplier))
					Recover("Health",(src.Meditation_Rate*ControlMedRate))
					Recover("Injury",(src.Regeneration*src.RegenerationMultiplier))

				if(ManaAmount<ManaMax)
					Recover("Mana",0.5)
			if(Race=="Majin")
				Recover("Health",(src.Regeneration*src.RegenerationMultiplier/10))
			if(Avalon)
				Recover("Health",(src.Regeneration*src.RegenerationMultiplier))
				Recover("Injury",(src.Regeneration*src.RegenerationMultiplier*200))
			if(FallenMystic)
				Recover("Health",(src.Regeneration*src.RegenerationMultiplier/4))
		//	if(src.SpiritWave)
		//		Recover("Health",(src.Regeneration*src.RegenerationMultiplier/50))
			if(ControlPower<=100&&!Regenerate&&!Swim&&!Attacking||ControlPower<=100&&!Regenerate&&Class=="Poseidon"&&!Attacking)
				Recover("Energy",(sqrt(src.Recovery)*src.RecoveryMultiplier))
				Recover("Fatigue",(sqrt(src.Recovery)*src.RecoveryMultiplier))
			if(ManaAmount<ManaMax&&ManaRecovery)
				Recover("Mana",3)
				Health-=0.117
			if(src.Race=="Android"&&!Swim&&!Attacking&&ControlPower>100)
				Recover("Energy",(src.Recovery*src.RecoveryMultiplier))
			if(ManaAmount<=ManaMax&&!ManaInfusing&&Class in list("Wizard", "Kitsune" , "Healer", "Envy", "Blue Mage", "Deus", "Ancient", "Kitty", "Wild", "Schrodinger" , /*"Demon Hunter"*/))
				Recover("Mana",1)
			if(ManaAmount<=0)
				ManaAmount=1
			if(src.InjuryImmune)
				src.TotalInjury=0
			if(src.FallenMystic&&src.Energy<=src.EnergyMax/20)
				src.PowerUp=0
				src.Auraz("Remove")
				src<<"Your body caves from stress!"
				src.PowerUp=0
				if(Race=="Saiyan"|Race=="Half-Saiyan") Revert()//src.Revert()
				for(var/obj/Skills/Buffs/FallenMystic/x in src)
					src.SkillX("FallenMystic",x)
				src.ControlPower=100
				src.Energy=1
				src.Health=-1
				src.Unconscious()
			if(Regenerate)
				if(Energy<EnergyMax/10)
					src<<"You stop Regenerating."
					src.Regenerate=0
				if(Health>=100)
					src<<"You stop Regenerating."
					src.Regenerate=0
				if(Regenerate)
					var/gain=0.5
					var/mult=min(4,max(1,src.Regeneration*src.RegenerationMultiplier/5))
					mult*=5//for darwin
					Recover("Health",gain*mult/(100/src.Health))
					src.LoseEnergy(EnergyMax/50)

			if(Energy>(EnergyMax*1.1)&&!PowerUp) Energy*=0.995
			if(Health>100+ChangieMaxHealth)
				if(!src.Defiance)
					Health*=0.995
		if(prob(100))//PC System
//			if(src.ChiBlockTimer>0)
//				if(prob(75))
//					src.ChiBlockTimer-=1
//					if(src.ChiBlockTimer<=0)
//						src.ChiBlockTimer=0
			if(src.SpiritOfWar)
				if(prob(75))
					src.SpiritCounter-=1
					if(prob(50))
						src.SpiritCounter-=1
					if(src.SpiritCounter<=10)
						src.SpiritCounter=10
			if(src.EarthAndHell>=11&&!src.BerserkerInsanityLock&&!src.PureRPMode)
				if(prob(50))
					src.EarthAndHell-=1
					if(prob(25))
						src.EarthAndHell-=5
			if(src.EarthAndHell<=10&&src.EarthAndHeaven)
				src.BerserkerInsanityLock=1
				src.Berserkering=1

			if(src.GatesNerf&&src.GatesNerfPerc&&!src.PureRPMode)
				if(prob(75))
					src.GatesNerf-=3
					if(prob(10))
						src.GatesNerf-=10
					else if(src.GatesNerf<=20)
						src.GatesNerfPerc=0
						src.GatesNerf=0
						src << "You have recovered from the internal injuries aquired from The Eight Gates technique!"

			if(src.SuperHumanDrugTimer>0)
				if(prob(20))
					src.SuperHumanDrugTimer-=1
					if(src.SuperHumanDrugTimer<=0)
						src.SuperHumanDrugTimer=0
			if(src.PowerUp==1 && !PureRPMode)
				var/PUGain=1
				if(src.Race=="Android"||src.Berserkering)
					PUGain=Recovery*RecoveryMultiplier
				else
					PUGain=(Recovery*RecoveryMultiplier)/(ControlPower/100)
				if(src.Race=="Pathless" && src.GreenAscension)
					PUGain*=1.35
				if(src.SpiralEndless)
				{
					PUGain *= 2.5
				}
				if(src.MachinaMod == 4)
					PUGain*=2
		/*		if(PUGain<1)
					PUGain=1*/
				if(PUGain>70)
					PUGain=70
				if(CyberPower)
					if(!src.Class in list("Schrodinger","Deus","Technologist","Spiral"))
						if(!src.MachinaMod)
							PUGain*=0.75
				if(src.ZeusPUNerf)
					PUGain*=0.5
				if(src.Stance=="Circulation"&&src.StanceActive)
					PUGain*=2
				//if(src.Race=="Saiyan"&&src.ssj["active"]>0)
				//	PUGain*=src.SaiyanPUNerf
				//restored because minor overheat restored
				if(src.Race=="Kaio")
					PUGain+=0.5
				for(var/obj/Skills/Buffs/Mystic/A in src)
					if(A.BuffUsing)
						PUGain+=0.5


				if(src.DjinnActive)
					PUGain+=0.5
				if(src.FullDjinnActive)
					PUGain+=0.5
				if(src.DjinnMagic=="Life")
					PUGain+=0.5
				if(src.ExplosionExpert)
					PUGain/=1.5
//				if(src.ChiBlockTimer)
//					PUGain/=1.5
				if(src.CursedBeta=="Irreverence")
					PUGain=0
				if(src.ChiBlock||src.Byakugan)
					PUGain=0
				if(src.SpiritCounter)
					PUGain/=2
				if(src.SusanooActive)
					PUGain=0
				if(src.ssj4active)
					PUGain=0
				if(src.LightningArmor||src.BloodArmor||src.MagmaArmor||src.StormArmor||src.IceArmor)
					PUGain=0
				if(src.Berserkering)
					PUGain=0

				//Power Control Diminshing.
				var addpu = PUGain
				if(src.ControlPower >= 300)
					addpu *= 0.20
				else if(src.ControlPower >= 250)
					addpu *= 0.35
				else if(src.ControlPower >= 200)
					addpu *= 0.5
				else if(src.ControlPower >= 150)
					addpu *= 0.75

				src.ControlPower+=PUGain


				if(src.ControlPower>100)
					src.EzPowerControl=1

				if(src.Energy<=src.EnergyMax/10)
					src.PowerUp=0
					src.Auraz("Remove")
					src<<"You are too tired to power up."
					src.PowerUp=0
					if(Race=="Saiyan"|Race=="Half-Saiyan") Revert()//src.Revert()
					src.ControlPower=100
					src.Energy=1
			if(src.PowerDown&&!src.PowerUp&&ControlPower>0.01&&!KO)
				if(prob(75))
					src.ControlPower-=src.Recovery*src.RecoveryMultiplier*2
					if(src.ControlPower<100&&src.EzPowerControl)
						src.ControlPower=100
						src.PowerDown=0
						src.EzPowerControl=0
						src.Auraz("Remove")
					if(src.ControlPower<=0)
						src.ControlPower=0.01
			//	Increase_Powerup()
			//	Increase_Powerup()
			//	Increase_Powerup()
			//Beyond 100% Drain
			if(!KO&&ControlPower>100 && !src.PureRPMode)
				if(src.Energy<=src.EnergyMax/10)
					src.PowerUp=0
					src.Auraz("Remove")
					src<<"You are too tired to power up."
					src.PowerUp=0
					if(Race=="Saiyan"|Race=="Half-Saiyan") Revert()//src.Revert()
					src.ControlPower=100
					src.Energy=1
				if(src.icon_state=="Meditate"&&src.ControlPower>100)
					src.ControlPower-=(src.Recovery*src.RecoveryMultiplier)
					if(src.ControlPower<100)
						src.ControlPower=100
				if(src.Race=="Android" && ControlPower>=150 && src.AscensionsAcquired < 1 &&!src.Overdrive)
					src.ControlPower=150
				if(src.Race=="Android" && ControlPower>=200 && src.AscensionsAcquired == 1 &&!src.Overdrive)
					src.ControlPower=200
				if(src.Race=="Android" && ControlPower>=250 && src.AscensionsAcquired == 2 &&!src.Overdrive)
					src.ControlPower=250
				if(src.Race=="Android" && ControlPower>=300 && src.AscensionsAcquired == 3 &&!src.Overdrive)
					src.ControlPower=300
				var/PowerDrain=1
				var/PUdrain=(src.Recovery*src.RecoveryMultiplier)
				if(PUdrain>=10)
					PUdrain=10
				if(src.Race=="Android")
				/*	if(src.ControlPower>=200)
						PowerDrain=0.25
					else
						PowerDrain=0*/
					PowerDrain=0
				if(src.Class=="Kitsune" && src.ControlPower<=200)
					PowerDrain=0
				if(src.SageActive)
					PowerDrain=0
				if(src.FatigueImmune)
					PowerDrain=0
				if(src.Berserkering)
					PowerDrain*=2
				if(src.SageActive&&!PureRPMode)
					src.ManaAmount-=(src.ControlPower-100)/50
				if(src.SageActive&&src.ManaAmount<=5)
					src.ControlPower=100
				for(var/obj/Skills/Buffs/Mystic/A in src)
					if(A.BuffUsing)
						PowerDrain*=0.5
				if(src.BraveType=="Offense"&&src.BraveLevel>=2||src.BraveType=="Both")
					PowerDrain*=(src.Health/100)
				if(src.PerfectSyncKamui)
					PowerDrain*=0.25
				if(src.Stance=="Ripple"&&src.StanceActive==1)
					PowerDrain*=37.5/src.Health
				if(!PureRPMode)//derp
					src.Energy-=0.1*(src.ControlPower-100)*PowerDrain/PUdrain*WorldPUDrain//((0.040*(src.ControlPower-100)*(src.ControlPower-100)*(1/PUdrain)))*PowerDrain
					src.TotalFatigue+=0.01*(src.ControlPower-100)*PowerDrain/PUdrain/5//(((0.0025*(src.ControlPower-100)*((src.ControlPower-100)/2)*(1/PUdrain)))*PowerDrain)/(sqrt(src.EnergyMax))

				if(src.TotalFatigue>99)
					src.TotalFatigue=99
				if(src.TotalInjury>99)
					src.TotalInjury=99
			/*	else
					src.Energy=1
					src.ControlPower=100
					src.PowerUp=0
					//if(Race=="Saiyan"|Race=="Half-Saiyan") Revert()
					src.Auraz("Remove")
					src<<"You are too tired to hold the energy you gathered, your energy levels return to normal."
					src.TotalFatigue+=10*/



mob/proc/Update_Stat_Labels()
/*	if(!src.ha)
		if(src)
			src<<output("Gravity: [round(Gravity)]x","GravityT")
			src<<output("Poison: [Poison]%","PoisonT")
			src<<output("Burning: [Burning]%","BurningT")
			src<<output("Health: [round(Health)]%", "Health")
			src<<output("Energy: [round((Energy/EnergyMax)*100)]%","EnergyZ")

			winset(src, "HealthBar", "value=\"[round(Health)]\"")
			winset(src, "EnergyBar", "value=\"[round((Energy/EnergyMax)*100)]\"")

			var/blah=GetPowerUpRatio()*100
			if(blah!=100)
				winset(src, "PowerBar", "value=\"[round(((Body)*Energy/EnergyMax)*Health)*GetPowerUpRatio()]\"")
				if(blah<100)
					src<<output("Power: [round(((Body)*Energy/EnergyMax)*Health)*GetPowerUpRatio()]%(-[100-blah]%)","Power")
				else
					src<<output("Power: [round(((Body)*Energy/EnergyMax)*Health)*GetPowerUpRatio()]%(+[blah-100]%)","Power")
			else
				winset(src, "PowerBar", "value=\"[round(((Body)*Energy/EnergyMax)*Health)]\"")
				src<<output("Power: [round(((Body)*Energy/EnergyMax)*Health)]%","Power")*/

	if(!src.ha)
		if(src)
			src<<output("Gravity: [round(Gravity)]x","BarGravity")
			if(round(TotalInjury))
				src<<output("Health: [round(Health)] (Wounds:[round(TotalInjury)]%)", "BarHealth")
			else
				src<<output("Health: [round(Health)]%", "BarHealth")
			if(round(TotalFatigue))
				src<<output("Energy: [round((Energy/EnergyMax)*100)] (Fatigue:[round(TotalFatigue)]%)","BarEnergy")
			else
				src<<output("Energy: [round((Energy/EnergyMax)*100)]%","BarEnergy")
			if(src.MachinaMod)
				var/list/p = list()
				p["text-color"]=rgb(0, 150, 255)
				var/params = list2params(p)
				winset(src, "mainwindow.BarMana", params)
				src<<output("Battery: [round(ManaAmount)]/[ManaMax]","BarMana")
			else
				src<<output("Mana: [round(ManaAmount)]/[ManaMax]","BarMana")
			if(src.StatDisplay==1)
				src<<output("Strength: [Commas(round(Strength))]","BarStrength")
				src<<output("Endurance: [Commas(round(Endurance))]","BarEndurance")
				src<<output("Force: [Commas(round(Force))]","BarForce")
				src<<output("Resistance: [Commas(round(Resistance))]","BarResistance")
				src<<output("Offense: [Commas(round(Offense))]","BarOffense")
				src<<output("Defense: [Commas(round(Defense))]","BarDefense")
				src<<output("Speed: [Commas(round(SpeedMod))]","BarSpeed")
				src<<output("Base: [Commas(round(src.Base))]","BarBase")
				src<<output("Energy: [Commas(round(src.EnergyMax))]","BarMaxEnergy")
				src<<output("Regeneration: [Regeneration]","BarRegeneration")
				src<<output("Recovery: [Recovery]","BarRecovery")
				src<<output("Time: [Time]","BarYear")
				src<<output("Sword: [Skillz["Sword"]["Level"]] ([Skillz["Sword"]["Current"]]/[Skillz["Sword"]["Next"]])","BarSword")
				src<<output("Unarmed: [Skillz["Unarmed"]["Level"]] ([Skillz["Unarmed"]["Current"]]/[Skillz["Unarmed"]["Next"]])","BarUnarmed")
				src<<output("Dig: [Skillz["Dig"]["Level"]] ([Skillz["Dig"]["Current"]] /[Skillz["Dig"]["Next"]])","BarDig")
				src<<output("Swim: [Skillz["Swim"]["Level"]] ([Skillz["Swim"]["Current"]] /[Skillz["Swim"]["Next"]])","BarSwim")
				src<<output("GM: [round(EXP)]","BarGM")
			if(src.StatDisplay==2)
				src<<output("Strength: [Commas(round(Strength))]","BarStrength2")
				src<<output("Endurance: [Commas(round(Endurance))]","BarEndurance2")
				src<<output("Force: [Commas(round(Force))]","BarForce2")
				src<<output("Resistance: [Commas(round(Resistance))]","BarResistance2")
				src<<output("Offense: [Commas(round(Offense))]","BarOffense2")
				src<<output("Defense: [Commas(round(Defense))]","BarDefense2")
				src<<output("Speed: [Commas(round(SpeedMod))]","BarSpeed2")
				src<<output("Base: [Commas(round(src.Base))]","BarBase2")
				src<<output("Energy: [Commas(round(src.EnergyMax))]","BarMaxEnergy2")
				src<<output("Regeneration: [Regeneration]","BarRegeneration2")
				src<<output("Recovery: [Recovery]","BarRecovery2")
				src<<output("Time: [Time]","BarYear2")
				src<<output("Sword: [Skillz["Sword"]["Level"]] ([Skillz["Sword"]["Current"]]/[Skillz["Sword"]["Next"]])","BarSword2")
				src<<output("Unarmed: [Skillz["Unarmed"]["Level"]] ([Skillz["Unarmed"]["Current"]]/[Skillz["Unarmed"]["Next"]])","BarUnarmed2")
				src<<output("Dig: [Skillz["Dig"]["Level"]] ([Skillz["Dig"]["Current"]] /[Skillz["Dig"]["Next"]])","BarDig2")
				src<<output("Swim: [Skillz["Swim"]["Level"]] ([Skillz["Swim"]["Current"]] /[Skillz["Swim"]["Next"]])","BarSwim2")
				src<<output("GM: [round(EXP)]","BarGM2")
				if(src.Intelligence||src.Enchantment)
					winshow(src,"BarIntel2",1)
					winshow(src,"BarEnchant2",1)
					src<<output("IntelLvl: [IntelligenceLevel]","BarIntel2")
					src<<output("EnchantLvl: [EnchantmentLevel]","BarEnchant2")
			var/blah=GetPowerUpRatio()*100
			if(blah!=100)
				if(blah<100)
					src<<output("Power: [round(((Body)*Energy/EnergyMax)*Health)*round(GetPowerUpRatio())]%(-[100-blah]%)","BarPower")
				else
					src<<output("Power: [round(((Body)*Energy/EnergyMax)*Health)*round(GetPowerUpRatio())]%(+[blah-100]%)","BarPower")
			else
				src<<output("Power: [round(((Body)*Energy/EnergyMax)*Health)]%","BarPower")
			if(src.Poison>0)
				winshow(src, "BarPoison",1)
				src<<output("Poison: [Poison]%","BarPoison")
			else
				winshow(src, "BarPoison",0)
			if(src.Burning>0)
				winshow(src, "BarBurning",1)
				src<<output("Burning: [Burning]%","BarBurning")
			else
				winshow(src, "BarBurning",0)
			if(src.EndBreak>0)
				winshow(src, "BarBreak",1)
				src<<output("End Down","BarBreak")
			else
				winshow(src, "BarBreak",0)
			if(src.ElecShock>0)
				winshow(src, "BarShock",1)
				src<<output("Shocked","BarShock")
			else
				winshow(src, "BarShock",0)
			if(src.Chilled>0)
				winshow(src, "BarChill",1)
				src<<output("Chilled","BarChill")
			else
				winshow(src, "BarChill",0)
			if(src.PotionCD>0)
				winshow(src, "BarPotion",1)
				src<<output("Potion CD: [PotionCD]","BarPotion")
			else if(src.BuffPotion>0)
				winshow(src, "BarPotion",1)
				src<<output("BuffPot:[BuffPotion]","BarPotion")
			else
				winshow(src, "BarPotion",0)
			if(src.Temperature)
				winshow(src, "BarTemperature",1)
				src<<output("TEMPDMG","BarTemperature")
			else
				winshow(src,"BarTemperature",0)
			if(src.TemperatureReducer>0)
				winshow(src, "BarTempReduce",1)
				src<<output("Temp Protect:[src.TemperatureReducer]","BarTempReduce")
			else
				winshow(src, "BarTempReduce",0)
			if(src.TemperatureReducerCD>0)
				winshow(src, "BarTempCD",1)
				src<<output("Temp CD:[src.TemperatureReducerCD]","BarTempCD")
			else
				winshow(src, "BarTempCD",0)
			if(src.WoundIntent)
				winshow(src, "WoundLabel",1)
			else
				winshow(src,"WoundLabel",0)
			if(src.Lethal==1)
				winshow(src, "BarLethal",1)
				src<<output("LETHAL ON","BarLethal")
			else if(src.PureRPMode==1)
				winshow(src, "BarLethal",1)
				src<<output("RP Mode On","BarLethal")
			else
				winshow(src, "BarLethal",0)
			if(src.StanceActive)
				winshow(src, "StanceLabel",1)
				src<<output("Stance:[src.Stance]","StanceLabel")
			else
				winshow(src, "StanceLabel",0)
	if(!(src.Race in list("Android","Bio Android","Changeling","Majin","Dragon")))
		if(src.Oxygen<src.MaxOxygen)
			winshow(src, "BarOxygen",1)
			src<<output("Oxygen: [round(Oxygen)]","BarOxygen")
		else
			winshow(src, "BarOxygen",0)
		if(src.StatDisplay==1)
			src<<output("Oxygen: [Skillz["Oxygen"]["Level"]] ([Skillz["Oxygen"]["Current"]] /[Skillz["Oxygen"]["Next"]])","BarOxygenStat")
		if(src.StatDisplay==2)
			src<<output("Oxygen: [Skillz["Oxygen"]["Level"]] ([Skillz["Oxygen"]["Current"]] /[Skillz["Oxygen"]["Next"]])","BarOxygenStat2")
/*		if(src.Poison>0)
			winshow(src, "BarPoison",1)
			src<<output("Poison: [Poison]%","BarPoison")
		else
			winshow(src, "BarPoison",0)*/

mob/var/tmp/ha=0

mob/verb/SwitchShit()
	set hidden=1
	usr.ha=0
	for(var/e in list("Health","Energy","Power"))
		winset(src,"Bar[e]","is-visible=true")

mob/Players/verb/ToggleStatDisplay()
	set category="Other"
	if(usr.StatDisplay==0)
		usr.StatDisplay=1
		spawn() winshow(usr,"StatsWindow",1)
		for(var/e in list("Strength","Endurance","Force","Resistance","Offense","Defense","Regeneration","Recovery","Speed","Base","Year","Sword","Unarmed","Dig","Swim","OxygenStat","GM","MaxEnergy"))
			winset(src,"Bar[e]","is-visible=true")
	else if(usr.StatDisplay==1)
		usr.StatDisplay=2
		spawn() winshow(usr,"StatsWindow",0)
		spawn() winshow(usr,"StatsWindow2",1)
		for(var/e in list("Strength","Endurance","Force","Resistance","Offense","Defense","Regeneration","Recovery","Speed","Base","Year","Sword","Unarmed","Dig","Swim","OxygenStat","GM","MaxEnergy"))
			winset(src,"Bar[e]","is-visible=false")
		for(var/e in list("Strength2","Endurance2","Force2","Resistance2","Offense2","Defense2","Regeneration2","Recovery2","Speed2","Base2","Year2","Sword2","Unarmed2","Dig2","Swim2","OxygenStat2","GM2","MaxEnergy2"))
			winset(src,"Bar[e]","is-visible=true")
	else if(usr.StatDisplay==2)
		usr.StatDisplay=0
		spawn() winshow(usr,"StatsWindow2",0)
		for(var/e in list("Strength2","Endurance2","Force2","Resistance2","Offense2","Defense2","Regeneration2","Recovery2","Speed2","Base2","Year2","Sword2","Unarmed2","Dig2","Swim2","OxygenStat2","GM2","MaxEnergy2"))
			winset(src,"Bar[e]","is-visible=false")



mob/proc/Get_Sense_Repression(var/mob/m)
	if(m.ControlPower >= 100)
		return "[m] is using their true power."
	if(m.ControlPower < 10)
		return "[m] is using none of their true power."
	if(m.ControlPower < 25)
		return "[m] is barely using any power at all."
	if(m.ControlPower < 50)
		return "[m] is hiding most of their power."
	if(m.ControlPower < 100)
		return "[m] is not using their full power."



mob/proc/Get_Exact_Sense_Repression(var/mob/m)
	if(m.ControlPower < 100)
		return "[m] is using [m.ControlPower]% of their power."
	else
		return "[m] is using 100% of their power."
mob/proc/Get_Sense_Reading(mob/A, var/isShort=0)
	var/One=Get_Scouter_Reading(A)
	var/Two=Get_Scouter_Reading(src)
	if(One<1)
		One=1
	if(Two<1)
		Two=1
	var/Power=100*(One/Two)
	var/SenseDebugger=Power
	if(A.KO) Power*=0.05
	Power=round(Power)
	if(src.SenseActive<3)
		if(Power<50)
			Power="Much weaker than you"
			if(isShort)
				Power="Much Weaker"
		else if(Power>=50&&Power<100)
			Power="Weaker than you"
			if(isShort)
				Power="Weaker"
		else if(Power>=100&&Power<120)
			Power="About equal to you"
			if(isShort)
				Power="Equal"
		else if(Power>=120&&Power<150)
			Power="Not much stronger than you"
			if(isShort)
				Power="Stronger"
		else if(Power>=150&&Power<200)
			Power="Stronger than you"
			if(isShort)
				Power="Stronger"
		else if(Power>=200)
			Power="Much stronger than you"
			if(isShort)
				Power="Much Stronger"
		else
			Power="It's derping! Power %[SenseDebugger]"
	else
		Power="[Power]% of you"
//	if(Power>5000) Power=5000
	if(A.Divine && !src.Divine) Power="???"
//	if(A.SpiralEnergyEnabled && !src.SpiralEnergyEnabled) Power="Infinity"
//	if(A.SpiralEnergyEnabled && src.SpiralEnergyEnabled) Power="Worthy"
	return Power
mob/proc/Get_Exact_Sense_Reading(mob/A)
	var/One=Get_Scouter_Reading(A)
	var/Two=Get_Scouter_Reading(src)
	if(One<1)
		One=1
	if(Two<1)
		Two=1
	var/Power=100*(One/Two)
	if(A.KO) Power*=0.05
	Power=round(Power)
//	if(Power>5000) Power=5000
	if(A.Divine && !src.Divine) Power="???"
//	if(A.SpiralEnergyEnabled && !src.SpiralEnergyEnabled) Power="Infinity"
//	if(A.SpiralEnergyEnabled && src.SpiralEnergyEnabled) Power="Worthy"
	return Power
mob/proc/Get_Scouter_Reading(mob/B)
	var/Power=(B.Power-(B.CyberPower*B.ControlPower/100))
	if(B.KO) Power*=0.05
	if(Power<1)
		Power=1
	if(B.Divine && !src.Divine) Power="???"
//	if(B.SpiralEnergyEnabled && src.SpiralEnergyEnabled) Power="Infinity"
//	if(B.SpiralEnergyEnabled && src.SpiralEnergyEnabled) Power="Worthy"
	return round(Power)


mob/verb/Maximize_Button()
	set name=".Maximize_Button"
	set hidden=1
	if(winget(usr,"mainwindow","is-maximized")=="true") winset(src,"mainwindow","is-maximized=false")
	else winset(src,"mainwindow","is-maximized=true")