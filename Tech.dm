obj/var/Cost
obj/var/TechType
var/list/Technology_List=new
var/list/BasicTechnology_List=new
var/list/SwordTechnology_List=new
var/list/MovingTechnology_List=new
var/list/CommTechnology_List=new
var/list/ModernCommTechnology_List=new
var/list/SecurityTechnology_List=new
var/list/ModernSecurityTechnology_List=new
var/list/MiningTechnology_List=new
var/list/ModernMiningTechnology_List=new
var/list/MaterialsTechnology_List=new
var/list/ScannerTechnology_List=new
var/list/PortableScannerTech_List=new
//var/list/DeluxeBasicUpgrade_List=new
var/list/ModernUpgradeKit_List=new
var/list/AdvancedUpgradeKit_List=new
var/list/ModernScannerUpgrade_List=new
var/list/AdvancedScannerUpgrade_List=new
//var/list/DeluxeModernUpgrade_List=new
var/list/MedicalTechnology_List=new
var/list/RegenTankTechnology_List=new
var/list/RegenTankUpgrade_List=new
var/list/ModernRegenTankUpgrades_List=new
var/list/Enchantments_List=new
var/list/Teleportation_List=new
var/list/Cloaking_List=new
var/list/Pocket_Dimension_List=new
proc/Add_Technology()
	for(var/A in typesof(/obj/Items/Tech))
		var/obj/B=new A
		B.suffix=null
		if(B.Cost) Technology_List+=B
//		else del(B)
		if(B.TechType)
			if(B.TechType=="BasicTechnology")
				BasicTechnology_List+=B
			if(B.TechType=="CommunicationTechnology")
				CommTechnology_List+=B
			if(B.TechType=="MovingTechnology")
				MovingTechnology_List+=B
			if(B.TechType=="ModernCommunicationTechnology")
				ModernCommTechnology_List+=B
			if(B.TechType=="SecurityTechnology")
				SecurityTechnology_List+=B
			if(B.TechType=="ModernSecurityTechnology")
				ModernSecurityTechnology_List+=B
			if(B.TechType=="MiningTechnology")
				MiningTechnology_List+=B
			if(B.TechType=="ModernMiningTechnology")
				ModernMiningTechnology_List+=B
			if(B.TechType=="MaterialsTechnology")
				MaterialsTechnology_List+=B
			if(B.TechType=="ScannerTechnology")
				ScannerTechnology_List+=B
			if(B.TechType=="PortableScannerTechnology")
				PortableScannerTech_List+=B
/*			if(B.TechType=="DeluxeBasicScannerUpgrades")
				DeluxeBasicUpgrade_List+=B*/
			if(B.TechType=="ModernScannerKit")
				ModernUpgradeKit_List+=B
			if(B.TechType=="ModernScannerTechnology")
				ModernScannerUpgrade_List+=B
			if(B.TechType=="AdvancedScannerKit")
				ModernUpgradeKit_List+=B
			if(B.TechType=="AdvancedScannerTechnology")
				ModernScannerUpgrade_List+=B
/*			if(B.TechType=="DeluxeModernScannerUpgrades")
				DeluxeModernUpgrade_List+=B*/
			if(B.TechType=="MedicalTechnology")
				MedicalTechnology_List+=B
			if(B.TechType=="RegenTankTechnology")
				RegenTankTechnology_List+=B
			if(B.TechType=="RegenTankUpgrades")
				RegenTankUpgrade_List+=B
			if(B.TechType=="ModernRegenTankUpgrades")
				ModernRegenTankUpgrades_List+=B
			if(B.TechType=="Teleport")
				Teleportation_List+=B
			if(B.TechType=="Cloak")
				Cloaking_List+=B
			if(B.TechType=="Pocket")
				Pocket_Dimension_List+=B

	for(var/C in typesof(/obj/Items/NGun))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost&&D.type!=/obj/Items/NGun) Technology_List+=D
		else del(D)
	for(var/C in typesof(/obj/Items/Sword))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost)
			BasicTechnology_List+=D
			Technology_List+=D
		else del(D)
	for(var/C in typesof(/obj/Items/Armor))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost) Technology_List+=D
		else del(D)
	for(var/C in typesof(/obj/Items/Shield))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost) Technology_List+=D
		else del(D)
	for(var/C in typesof(/obj/Items/Ammo))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost) Technology_List+=D
		else del(D)

	for(var/C in typesof(/obj/Items/Cablecuffs))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost) Technology_List+=D
		else del(D)

	for(var/C in typesof(/obj/Items/Wirecutters))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost) Technology_List+=D
		else del(D)

	for(var/C in typesof(/obj/Items/Food))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost) Technology_List+=D
		else del(D)

	for(var/C in typesof(/obj/Items/Drink))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost) Technology_List+=D
		else del(D)


proc/Can_Afford_Technology(mob/P,obj/O) for(var/obj/Money/M in P) if(O.Cost/P.Intelligence<=M.Level) return 1
proc/Technology_Price(mob/P,obj/O) return O.Cost/P.Intelligence

obj/Planet_Money
	Level=0
	Grabbable=0
	Health=1.#INF

proc/Add_Planet_Money()
	for(var/area/Outside/Planet/P)
		if(P.Drillable)
			P.Level+=1000000*P.Rate

mob/var/CyberPower=0
obj/Cyberize
	verb
		Cyberize(var/mob/M in view(1))
			set src in usr
			set category="Skills"
			var/obj/Money/Q

			for(var/obj/Money/_moneybag in usr)
				Q=_moneybag
				break
			if(M!=usr&&M.Race!="Android")
				usr<<"You can only perform surgery on yourself and machines!"
			if(M.Dead)
				if(!M.KeepBody)
					usr<<"You are just a soul!"
					return
			if(M.client)
				var/Choice=input("What would you like to incorporate?") in list ("Battle Power","Stat Modules","Special Modules", "Rare Modules", "Nevermind")
				switch(Choice)
					if("Battle Power")
						var/amount=(CyberBPCap * M.BaseMod * M.CyberizeMod)
						var/blah=input("Cyberize [M] to how much BP? (Each BP is [50/usr.Intelligence] resources.)","[Commas(amount)] Max") as num
						if(M.CyberPower>=blah)
							usr<<"They have more cyberized battle power than that already!"
							return
						if(M!=usr)
							usr<<"You can only supplement your own battle power!"
							return
						else
							if(blah <= amount)
							{
								for(Q in usr)
									if(Q.Level>=(blah-M.CyberPower)*40/usr.Intelligence)
										Q.Level-=(blah-M.CyberPower)*40/usr.Intelligence
										M.CyberPower=blah
										oview(10,usr)<<"[usr] has performed surgery on themselves!"
										Log("Admin","[ExtractInfo(usr)] has experimented on themselves for [Commas(blah)].")
									else
										usr<<"You do not have enough resources for that! It would cost you [Commas(blah*(40/usr.Intelligence))]."
										return
									break
							}
				/*if("Internal Scouter")
					for(Q in usr)
						if(Q.Level>=(500000000/=usr.Intelligence)
							Q.Level-=(500000000/=usr.Intelligence)
							M.Internalf=1
							oview(10,usr)<<"[M] has been cyberized by [usr]!"
							Log("Admin","[ExtractInfo(usr)] has given [M] an internal scouter.")
						else
							usr<<"You do not have enough resources for this upgrade!"
							return*/
					if("Stat Modules")
						var/ModuleCheck=0
						var/Select=input("Which module?") in list ("Enhanced Reflexes", "Enhanced Offense","Enhanced Endurance","Enhanced Strength","Enhanced Speed","Enhanced Force","Enhanced Resistance")
						if(M.Class in list("Wizard", "Healer", "Envy", "Kitsune", "Spiritualist"))
							usr<< "You cannot receive stat modules."
							return
						switch(Select)
							if("Enhanced Offense")
				//				if(M.EnhancedReflexes==0&&M.EnhancedEndurance==0&&M.EnhancedStrength==0&&M.EnhancedSpeed==0&&M.EnhancedForce==0&&M.EnhancedResistance==0)
								if(M.StatModules<M.MadScientist)
									ModuleCheck=1
								if(M.Race=="Android"&&M.StatModules<2)
									ModuleCheck=1
								if(M.MachinaMod&&M.StatModules<3)
									ModuleCheck=1
								if(M.EnhancedReflexes==2)
									M<<"You cannot give yourself a third one of these, Mayuri, unless you want cancer."
									return
								if(ModuleCheck==1)
									var/amount=round(50000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("Installing this is permanent, boosting Defense by 30%. It will cost you [Commas(amount)]. Do you wish to continue?","Modules","Yes","No"))
											if("Yes")
												M.Offense*=1.3
												M.OffenseMod*=1.3
												M.EnhancedReflexes+=1
												M.StatModules+=1
												oview(10,usr)<<"[M] has been cyberized by [usr]!"
												Log("Admin","[ExtractInfo(usr)] has given [M] the Enhanced Offense module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] has already has a module installed! You cannot install another!"
									return

							if("Enhanced Reflexes")
				//				if(M.EnhancedReflexes==0&&M.EnhancedEndurance==0&&M.EnhancedStrength==0&&M.EnhancedSpeed==0&&M.EnhancedForce==0&&M.EnhancedResistance==0)
								if(M.StatModules<M.MadScientist)
									ModuleCheck=1
								if(M.Race=="Android"&&M.StatModules<2)
									ModuleCheck=1
								if(M.MachinaMod&&M.StatModules<3)
									ModuleCheck=1
								if(M.EnhancedReflexes==2)
									M<<"You cannot give yourself a third one of these, Mayuri, unless you want cancer."
									return
								if(ModuleCheck==1)
									var/amount=round(50000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("Installing this is permanent, boosting Defense by 30%. It will cost you [Commas(amount)]. Do you wish to continue?","Modules","Yes","No"))
											if("Yes")
												M.Defense*=1.3
												M.DefenseMod*=1.3
												M.EnhancedReflexes+=1
												M.StatModules+=1
												oview(10,usr)<<"[M] has been cyberized by [usr]!"
												Log("Admin","[ExtractInfo(usr)] has given [M] the Enhanced Reflexes module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] has already has a module installed! You cannot install another!"
									return


							if("Enhanced Endurance")
//								if(M.EnhancedReflexes==0&&M.EnhancedEndurance==0&&M.EnhancedStrength==0&&M.EnhancedSpeed==0&&M.EnhancedForce==0&&M.EnhancedResistance==0)
								if(M.StatModules<M.MadScientist)
									ModuleCheck=1
								if(M.Race=="Android"&&M.StatModules<2)
									ModuleCheck=1
								if(M.MachinaMod&&M.StatModules<3)
									ModuleCheck=1
								if(M.EnhancedEndurance==2)
									M<<"You cannot give yourself a third one of these, Mayuri, unless you want cancer."
									return
								if(ModuleCheck==1)
									var/amount=round(50000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("Installing this module is permanent, while boosting Endurance by 30%. It will cost you [Commas(amount)]. Do you wish to continue?","Modules","Yes","No"))
											if("Yes")
												M.Endurance*=1.3
												M.EnduranceMod*=1.3
												M.EnhancedEndurance+=1
												M.StatModules+=1
												Log("Admin","[ExtractInfo(usr)] has given [M] the Enhanced Endurance module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] has already has a module installed! You cannot install another!"
									return

							if("Enhanced Strength")
//								if(M.EnhancedReflexes==0&&M.EnhancedEndurance==0&&M.EnhancedStrength==0&&M.EnhancedSpeed==0&&M.EnhancedForce==0&&M.EnhancedResistance==0)
								if(M.StatModules<M.MadScientist)
									ModuleCheck=1
								if(M.Race=="Android"&&M.StatModules<2)
									ModuleCheck=1
								if(M.MachinaMod&&M.StatModules<3)
									ModuleCheck=1
								if(M.EnhancedStrength==2)
									M<<"You cannot give yourself a third one of these, Mayuri, unless you want cancer."
									return
								if(ModuleCheck==1)
									var/amount=round(50000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("Installing this module is permanent, will increase Strength by 30%. It will cost you [Commas(amount)]. Do you wish to continue?","Modules","Yes","No"))
											if("Yes")
												M.Strength*=1.3
												M.StrengthMod*=1.3
												M.EnhancedStrength+=1
												M.StatModules+=1
												Log("Admin","[ExtractInfo(usr)] has given [M] the Enhanced Strength module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] already has a module installed! You cannot install another!"
									return

							if("Enhanced Speed")
//								if(M.EnhancedReflexes==0&&M.EnhancedEndurance==0&&M.EnhancedStrength==0&&M.EnhancedSpeed==0&&M.EnhancedForce==0&&M.EnhancedResistance==0)
								if(M.StatModules<M.MadScientist)
									ModuleCheck=1
								if(M.Race=="Android"&&M.StatModules<2)
									ModuleCheck=1
								if(M.MachinaMod&&M.StatModules<3)
									ModuleCheck=1
								if(M.EnhancedSpeed==2)
									M<<"You cannot give yourself a third one of these, Mayuri, unless you want cancer."
									return
								if(ModuleCheck==1)
									var/amount=round(50000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("Instaling this module is permanent, will increase Speed by 15%. It will cost you [Commas(amount)]. Would you like to continue?","Modules","Yes","No"))
											if("Yes")
												M.Speed*=1.15
												M.SpeedMod*=1.15
												M.EnhancedSpeed+=1
												M.StatModules+=1
												Log("Admin","[ExtractInfo(usr)] has given [M] the Enhanced Speed module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] already has a module installed! You cannot install another!"
									return

							if("Enhanced Force")
//								if(M.EnhancedReflexes==0&&M.EnhancedEndurance==0&&M.EnhancedStrength==0&&M.EnhancedSpeed==0&&M.EnhancedForce==0&&M.EnhancedResistance==0)
								if(M.StatModules<M.MadScientist)
									ModuleCheck=1
								if(M.Race=="Android"&&M.StatModules<2)
									ModuleCheck=1
								if(M.MachinaMod&&M.StatModules<3)
									ModuleCheck=1
								if(M.EnhancedForce==2)
									M<<"You cannot give yourself a third one of these, Mayuri, unless you want cancer."
									return
								if(ModuleCheck==1)
									var/amount=round(50000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("Installing this module is permanent, will increase Force by 30%. It will cost you [Commas(amount)]. Do you wish to continue?","Modules","Yes","No"))
											if("Yes")
												M.Force*=1.3
												M.ForceMod*=1.3
												M.EnhancedForce+=1
												M.StatModules+=1
												Log("Admin","[ExtractInfo(usr)] has given [M] the Enhanced Force module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] already has a module installed! You cannot install another!"
									return

							if("Enhanced Resistance")
//								if(M.EnhancedReflexes==0&&M.EnhancedEndurance==0&&M.EnhancedStrength==0&&M.EnhancedSpeed==0&&M.EnhancedForce==0&&M.EnhancedResistance==0)
								if(M.StatModules<M.MadScientist)
									ModuleCheck=1
								if(M.Race=="Android"&&M.StatModules<2)
									ModuleCheck=1
								if(M.MachinaMod&&M.StatModules<3)
									ModuleCheck=1
								if(M.EnhancedResistance==2)
									M<<"You cannot give yourself a third one of these, Mayuri, unless you want cancer."
									return
								if(ModuleCheck==1)
									var/amount=round(50000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("Installing this module is permanent, will increase Resistance by 30%. It will cost you [Commas(amount)]. Do you wish to continue?","Modules","Yes","No"))
											if("Yes")
												M.Resistance*=1.3
												M.ResistanceMod*=1.3
												M.EnhancedResistance+=1
												M.StatModules+=1
												Log("Admin","[ExtractInfo(usr)] has given [M] the Enhanced Resistance module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] already has a module installed! You cannot install another!"
									return
					if("Special Modules")
						var/Select=input("Which module?") in list ("Enhanced Intellect","Strong Mind","Steroid Junkie","Overdrive","Prideful Soul", "Increased Muscle Efficiency", "Adderall Nanobots", "Internal Scouter","Internal Communicator","Iron Lung")
						switch(Select)
							if("Enhanced Intellect")
								if(M.Intelligence<3)
									var/amount=round(50000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("Installing this module is permanent. It will increase your intellectual ability. It will cost you [Commas(amount)].","Modules","Yes","No"))
											if("Yes")
												M.Intelligence*=1.25
												M.CyberPower+=1
												if(M.Race=="Human"||M.Race=="Tsufurujin")
													M.BaseMod*=1.25
												Log("Admin","[ExtractInfo(usr)] has given [M] the Enhanced Intellect module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] is already very intelligent, rendering this module useless."
									return
							if("Strong Mind")
								if(M.Class!="Faggot")
									if(M.StrongMind==0)
										var/amount=round(1000000000/usr.Intelligence)
										if(Q.Level>=amount)
											switch(alert("This module will increase your physical attributes in exchange for some of your intellectual ability. It will cost you [Commas(amount)].","Modules","Yes","No"))
												if("Yes")
													M.StrengthMod*=1.3
													M.ForceMod*=1.3
													M.OffenseMod*=1.3
													M.Intelligence/=1.5
													M.CyberPower+=1
													M.StrongMind=1
													Log("Admin","[ExtractInfo(usr)] has given [M] the Strong Mind module!")
													for(Q in usr)
														Q.Level-=amount
														break
												else
													return
										else
											usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
											return
								else
									usr<<"[M] is not of the Technologist class!"
									return
							if("Steroid Junkie")
								if(M.Class!="Faggot")
									if(M.StrongMind==0)
										var/amount=round(1000000000/usr.Intelligence)
										if(Q.Level>=amount)
											switch(alert("This module will influence hormonal changes in exchange for some of your intellectual ability. It will cost you [Commas(amount)].","Modules","Yes","No"))
												if("Yes")
													M.EnduranceMod*=1.3
													M.ResistanceMod*=1.3
													M.DefenseMod*=1.3
													M.Intelligence/=1.5
													M.CyberPower+=1
													M.Steroid=1
													Log("Admin","[ExtractInfo(usr)] has given [M] the Strong Mind module!")
													for(Q in usr)
														Q.Level-=amount
														break
												else
													return
										else
											usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
											return
								else
									usr<<"[M] is not of the Technologist class!"
									return
							if("Internal Scouter")
								if(!M.InternalScouter||M.Race=="Android")
									var/amount=round(50000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("This module replaces your Sense with a permanant Scouter, equal to level 100. It will cost you [Commas(amount)].","Modules","Yes","No"))
											if("Yes")
												Q.Level-=amount
												M.InternalScouter=1
												M.contents+=new/obj/Skills/ToggleInternalScouter
												//M.CyberPower+=1
												oview(10,usr)<<"[M] has been cyberized by [usr]!"
												Log("Admin","[ExtractInfo(usr)] has given [M] an internal scouter.")
											else
												return
									else
										usr<<"You do not have enough resources for this upgrade! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"A Internal Scouter is already installed."
							if("Internal Communicator")
								if(!locate(/obj/Skills/InternalCommunicator,M.contents))
									var/amount=round(25000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("This module adds a communicator to the target. It functions identically to a Scouter's communicator, and can also monitor a second frequency. It will cost you [Commas(amount)].","Modules","Yes","No"))
											if("Yes")
												Q.Level-=amount
												M.contents+=new/obj/Skills/InternalCommunicator
												oview(10,usr)<<"[M] has been cyberized by [usr]!"
												Log("Admin","[ExtractInfo(usr)] has given [M] an Internal Communicator.")
											else
												return
									else
										usr<<"You do not have enough resources for this upgrade! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"A Internal Communicator is already installed."
							if("Overdrive")
								if(!locate(/obj/Skills/Overdrive,M.contents))
									var/amount=round(500000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("This module will grant you the ability to expend all of your cyberization power in one, mighty burst. It will cost you [Commas(amount)].","Modules","Yes","No"))
											if("Yes")
												M.contents+=new/obj/Skills/Overdrive
												M.CyberPower+=1
												Log("Admin","[ExtractInfo(usr)] has given [M] the Overdrive module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] already has this skill!"
									return
							if("Prideful Soul")
								if(M.CyberTrans==0)
									if(M.PridefulSoul)
										M<< "You have already had this module installed... Oh well, huh?"
										return
									var/amount=round(200000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("This module gives the user the ability to transform regardless of their cyberization status, at the cost of some of your physical capabilities. It will cost you [Commas(amount)].","Modules","Yes","No"))
											if("Yes")
												M.CyberTrans=1
												M.Recovery*=0.75
												M.Regeneration*=0.75
												M.PridefulSoul=1
												if(M.Class in list("Technologist","Deus","Greed"))
													M.BaseMod*=1.25

												Log("Admin","[ExtractInfo(usr)] has given [M] the Prideful Soul module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] already has this ability!"
									return

							if("Iron Lung")
								if(!M.IronLung)
									var/amount=round(10000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("This module allows the user to breathe in space. It will cost [Commas(amount)]","Modules","Yes","No"))
											if("Yes")
												M.IronLung=1
												M.MaxOxygen*=5
												Log("Admin","[ExtractInfo(usr)] has given [M] the Iron Lung module!")
												for(Q in usr)
													Q.Level-=amount
													break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return
								else
									usr<<"[M] already has this module!"
									return
							if("Increased Muscle Efficiency")
								var/amount=round(30000000/usr.Intelligence)
								if(Q.Level>=amount)
									switch(alert("Increases one's Training Rate by 50%. It will cost [Commas(amount)]].","Modules","Yes","No"))
										if("Yes")
											if(M.TrainModule==0)
												M.Training_Rate*=1.5
												M.TrainModule=1
												if(M.Training_Rate<1.5)
													M.Training_Rate=1.5
												Log("Admin","[ExtractInfo(usr)] has given [M] the Increased Muscle Efficiency module!")
												for(Q in usr)
													Q.Level-=amount
													break
										else
											return
								else
									usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
									return
							if("Adderall Nanobots")
								var/amount=round(30000000/usr.Intelligence)
								if(Q.Level>=amount)
									switch(alert("Increases one's Meditation Rate by 50%. It will cost [Commas(amount)]","Modules","Yes","No"))
										if("Yes")
											if(M.MeditateModule==0)
												M.Meditation_Rate*=1.5
												M.MeditateModule=1
												if(M.Meditation_Rate<1.5)
													M.Meditation_Rate=1.5
												Log("Admin","[ExtractInfo(usr)] has given [M] the Adderall Nanobots module!")
												for(Q in usr)
													Q.Level-=amount
													break
										else
											return
								else
									usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
									return
				/*			if("A Rare Module")
								if(M.RareModule)
									var/amount=round(1000000000/usr.Intelligence)
									if(Q.Level>=amount)
										for(Q in usr)
											Q.Level-=amount
											break
										switch(alert("Allows the purchase of a single Rare Module.","Modules","Yes","No"))
											if("Yes")
												M.RareModule=1
												Log("Admin","[ExtractInfo(usr)] has given [M] the Inner Power module!")
											else
												return
									else
										usr<<"You do not have enough resources for this!"
										return
								else
									usr<<"[M] already has had this used on them."
									return*/
					if("Rare Modules")
						if(usr.Intelligence<4)
							usr<<"You are not intelligent enough to create such advanced modules."
							return

						else
							usr<< "All Rare Modules disable the usage of transformations and negates Prideful Soul if you already have used it...Be careful!!"
							var/Select=input("Which module?") in list ("Inner Power", "Omniscience","God of Wrath","Super Android")
							switch(Select)
								if("Omniscience")
									if(M.Intelligence<8)
										var/amount=round(2000000000)
										if(Q.Level>=amount)
											switch(alert("It will significantly increase the intelligence of the person you used it on.","Modules","Yes","No"))
												if("Yes")
													if(M.Intelligence<=10)
														M.Intelligence=10
													else
														M.Intelligence*=1.25
													M.CyberPower+=1
													M.CyberTrans=0
													Log("Admin","[ExtractInfo(usr)] has given [M] the Omniscience module!")
													for(Q in usr)
														Q.Level-=amount
														break
												else
													return
										else
											usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
											return
									else
										usr<<"[M] is already very intelligent, rendering this module useless."
										return
								if("Self Destruct Mechanism")
									if(!locate(/obj/Skills/SelfDestruct,M.contents))
										var/amount=round(10000000)
										if(Q.Level>=amount)
											switch(alert("This module will install a self-destruct mechanism in you. It will cost you [Commas(amount)].","Modules","Yes","No"))
												if("Yes")
													M.contents+=new/obj/Skills/SelfDestruct
													M.CyberPower+=1
													M.CyberTrans=0
													Log("Admin","[ExtractInfo(usr)] has given [M] the Self Destruct Mechanism!")
													for(Q in usr)
														Q.Level-=amount
														break
												else
													return
										else
											usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
											return
									else
										usr<<"[M] already has this skill!"
										return
								if("God of War")
									if(M.WarGod==0)
										var/amount=round(1000000000)
										if(Q.Level>=amount)
											switch(alert("The person you install this in will obtain an optimal training rate at the cost of their Zenkai rate and Potential.","Modules","Yes","No"))
												if("Yes")
													M.Meditation_Rate*=2
													M.Training_Rate*=2
													M.SpeedMod*=2
													M.Zenkai_Rate/=4
													M.Potential/=4
													M.CyberPower+=1
													M.CyberTrans=0
													M.WarGod=1
													if(M.Meditation_Rate<3)
														M.Meditation_Rate=3
													if(M.Training_Rate<3)
														M.Training_Rate=3
													Log("Admin","[ExtractInfo(usr)] has given [M] the God of War module!")
													for(Q in usr)
														Q.Level-=amount
														break
												else
													return
										else
											usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
											return
									else
										usr<<"[M] has either had their potential unlocked, negating the cost, or doesn't have enough potential to utilize it."
										return
								if("God of Wrath")
									if(M.AngerMax>=1.1)
										var/amount=round(1000000000)
										if(Q.Level>=amount)
											switch(alert("The person you install this in will have an increased effect from adrenaline, increasing their anger. This comes with the cost of half their Offense and Defense mods.","Modules","Yes","No"))
												if("Yes")
													if(M.WrathGod==0)
														if(M.AngerMax<=4)
															M.AngerMax=4
														else
															M.AngerMax*=1.25
														M.OffenseMod*=0.5
														M.DefenseMod*=0.5
														M.CyberPower+=1
														M.CyberTrans=0
														M.WrathGod=1
														Log("Admin","[ExtractInfo(usr)] has given [M] the God of Wrath module!")
														for(Q in usr)
															Q.Level-=amount
															break
												else
													return
										else
											usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
											return
									else
										usr<<"[M] lacks the anger neccesary to utilize this!"
										return

								if("Inner Power")
									if(M.Potential)
										var/amount=round(750000000/usr.Intelligence)
										if(Q.Level>=amount)
											switch(alert("This module unlocks the potential of the person it's used on, but instead translates it to cyberization power. It will cost [Commas(amount)].","Modules","Yes","No"))
												if("Yes")
													M.CyberPower+=((M.Potential*Year*2000*M.BaseMod)*20)*(Gains/100)
													M.EnergyMax+=M.Potential*Year*1000*M.EnergyMod
													M.Potential=0
													Log("Admin","[ExtractInfo(usr)] has given [M] the Inner Power module!")
													for(Q in usr)
														Q.Level-=amount
														break
												else
													return
										else
											usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
											return
									else
										usr<<"[M] has no potential to unlock!"
										return
							/*	if("Super Android")
									var/amount=round(500000000/usr.Intelligence)
									if(Q.Level>=amount)
										switch(alert("This module temporarily weakens an Android in activating a more powerful Engine. It will cost [Commas(amount)].","Modules","Yes","No"))
											if("Yes")
												if(M.Race!="Android")
													usr<<"This person is not an Android!"
													return
												else if(M.Class!="Fighter")
													usr<<"New Model Androids can't accept this upgrade!"
													return
												else
													M.BaseMod=2
													M.Base/=3
													M.Base*=2
													M.SuperDroidReq+=M.Base*20
													M.SuperDroid=1
													Log("Admin","[ExtractInfo(usr)] has given [M] the Super Android module!")
													for(Q in usr)
														Q.Level-=amount
														break
											else
												return
									else
										usr<<"You do not have enough resources for this! You require [Commas(amount)] to install this module."
										return*/


	/*					if("Longevity")
							var/amount=10000000
							for(Q in usr)
							var/Check= input("Using this will increase [M]'s decline age based on how many resources you use. How many resources would you like to use? It is [amount] per month.") as num
							if(Q.Level>=Check)
								Q.Level-=Check
								var/Add=0.1*(round(Check/0.0000001))
								M.Decline+=Add
								Log("Admin","[ExtractInfo(usr)] has given [M] [Add] years to their Decline.")
							else
								usr<<"You do not have enough resources for that!"

*/

obj/Items/Tech/verb
	Bolt()
		set src in oview(1)
		set category=null
		if(!src.Grabbable)
			usr<<"You cannot unbolt this."
			return
		if(src.Bolt)
			if(istype(src,/obj/Items/Tech/ReinforcedDoor))
				if(usr.key!=src.CreatorKey)
					usr<<"This door doesn't belong to you..."
					return
			if(usr.IntelligenceLevel>=src.Bolt)
				src.Bolt=0
				view(10,usr)<<"[usr] unbolted [src]"
			else
				usr<<"This is too advanced for you to mess with!"
		else
			src.Bolt=usr.IntelligenceLevel
			if(!istype(src,/obj/Items/Tech/SecurityCamera))
				view(10,usr)<<"[usr] bolted [src]"

	Upgrade()
		set src in oview(1)
		set category=null
		if(!(usr.client.mob in range(1,src))) return
		if(istype(src,/obj/Items/Tech/PunchingBag)||istype(src,/obj/Items/Tech/Log))
			var/Amount=input("Reinforce the [src] by how much?","Upgrade") as num
			if(Amount>0)
				for(var/obj/Money/M in usr)
					if(M.Level>=Amount)
						src.icon_state=""
						M.Level-=Amount
						src.Health+=Amount*usr.Intelligence*4*usr.Intelligence*4*usr.Intelligence
						LogPEndurance+=Amount*(usr.Intelligence*0.05)/10
						usr<<"[Commas(Amount*usr.Intelligence*4*usr.Intelligence*4*usr.Intelligence)] Health and [Commas(Amount*(usr.Intelligence*0.05)/10)] Endurance added to [src]"

		if(istype(src,/obj/Items/Tech/Simulator)||/*istype(src,/obj/Items/Tech/SimulatorParts/HolographicEmitter)||*/istype(src,/obj/Items/Tech/CloakControls)||istype(src,/obj/Items/Tech/Regenerator)||istype(src,/obj/Items/Tech/Turret)||istype(src,/obj/Items/Tech/Gravity)||/*istype(src,/obj/Items/Tech/GravityParts/GravitronGenerator)||istype(src,/obj/Items/Tech/GravityParts/GravityEmissor)||*/istype(src,/obj/Items/Tech/Scouter)||istype(src,/obj/Items/Tech/SpaceTravel/SpacePod)||istype(src,/obj/Items/Tech/SpaceTravel/Ship)||istype(src,/obj/Items/Tech/CameraProbe)||istype(src,/obj/Items/Tech/ForceFieldEmitter))
			var/Price
			if(UpgradePrice)
				Price=src.UpgradePrice/usr.Intelligence
			else
				Price=src.Cost/usr.Intelligence
			var/Amount=input("Reinforce the [src] by how much?([Commas(Price)] per upgrade)","([usr.IntelligenceLevel] max)") as num
			Amount=min(Amount,usr.IntelligenceLevel)
			if(Amount<=src.Lvl)
				return
			Price*=(Amount-src.Lvl)
			for(var/obj/Money/M in usr)
				if(M.Level>=Price)
					M.Level-=Price
					src.Lvl=Amount
					src.desc="[src] (Level [Amount])"
					usr<<"[usr] upgraded [src] to level [Amount]."

		if(istype(src,/obj/Items/Tech/SpaceTravel))
			src.Health=max(src.Health,usr.IntelligenceLevel*1000)
			src:Endurance=(2500*usr.IntelligenceLevel)
			src:Resistance=(2500*usr.IntelligenceLevel)
			src.LogPEndurance=(2500*usr.IntelligenceLevel)

		if(istype(src,/obj/Items/Tech/TeleportWatch)||istype(src,/obj/Items/Tech/TeleportPad))

			if(src:Uni!=1)
				var/Price=UpgradePrice/usr.Intelligence
				for(var/obj/Money/M in usr)
					if(M.Level>=Price)
						M.Level-=Price
						src:Uni=1
						usr<<"[usr] upgraded [src] to Universal standards."
					else
						usr<<"To install the Universal Upgrade to this item, you will require [Commas(Price)] resources. You have [Commas(M.Level)]."
						return
		if(istype(src,/obj/Items/Tech/ReinforcedDoor)||istype(src,/obj/Items/Tech/ReinforcedRemote))
			src.Health=max(src.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*1250000)
			src.LogPEndurance=(50*usr.IntelligenceLevel)
			usr<<"Your [src] has been set to [src.Health] Health and [src.LogPEndurance] Endurance."
/*		if(istype(src,/obj/Items/Tech/Frame))
			var/list/Framecontentslist=new
			Framecontentslist+="Cancel"
			Framecontentslist+=src.contents
			var/obj/Selection=input("Select a part contained within the frame to upgrade it.")in Framecontentslist
			if(Selection=="Cancel")
				return
			var/Price
			if(Selection:UpgradePrice)
				Price=Selection:UpgradePrice/usr.Intelligence
			else
				Price=Selection:Cost/usr.Intelligence
			var/Amount=input("Reinforce the [Selection] by how much?([Commas(Price)] per upgrade)","([usr.IntelligenceLevel] max)") as num
			Amount=min(Amount,usr.IntelligenceLevel)
			if(Amount<=Selection:Lvl)
				return
			Price*=(Amount-Selection:Lvl)
			for(var/obj/Money/M in usr)
				if(M.Level>=Price)
					M.Level-=Price
					Selection:Lvl=Amount
					Selection:desc="[Selection] (Level [Amount])"
					src.desc="[src] (Level [Amount])"
					usr<<"[usr] upgraded [Selection] to level [Amount]."*/
//			Selection:Upgrade()
		if(istype(src,/obj/Items/Tech/SpaceMask))
			var/Price
			if(UpgradePrice)
				Price=src.UpgradePrice/usr.Intelligence
			else
				Price=src.Cost/usr.Intelligence
			var/Amount=input("Reinforce the [src] by how much?([Commas(Price)] per upgrade)","([usr.IntelligenceLevel] max)") as num
			Amount=min(Amount,usr.IntelligenceLevel)
			if(Amount<=src.Lvl)
				return
			Price*=(Amount-src.Lvl)
			for(var/obj/Money/M in usr)
				if(M.Level>=Price)
					M.Level-=Price
					src.Lvl=Amount
					var/obj/Items/Tech/SpaceMask/derp=src
					derp.MaxOxygen=(Amount+200)
					src.desc="[src] (Level [Amount])(Max Oxygen:[derp.MaxOxygen]"
					usr<<"[usr] upgraded [src] to level [Amount]."

		for(var/obj/Items/Tech/z in world)
			if(z.CreatorKey==src.CreatorKey&&!istype(src,/obj/Items/Tech/ReinforcedDoor)&&!istype(src,/obj/Items/Tech/SpaceTravel))
				z.Health=max(z.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*100000)
				z.LogPEndurance=(15*usr.IntelligenceLevel)
		for(var/obj/Items/Enchantment/y in world)
			if(y.CreatorKey==src.CreatorKey)
				y.Health=max(y.Health,usr.EnchantmentLevel*usr.EnchantmentLevel*100000)
				y.LogPEndurance=(15*usr.EnchantmentLevel)

proc/ReturnDirection(var/mob/buh,var/mob/M)
	if(M.x > buh.x)
		if(M.y>buh.y)
			return NORTHEAST
		if(M.y<buh.y)
			return SOUTHEAST
		if(M.y==buh.y)
			return EAST
	if(M.x < buh.x)
		if(M.y>buh.y)
			return NORTHWEST
		if(M.y<buh.y)
			return SOUTHWEST
		if(M.y==buh.y)
			return WEST
	if(M.x == buh.x)
		if(M.y>buh.y)
			return NORTH
		if(M.y<buh.y)
			return SOUTH
obj/var/CloakPasscode

obj
	var/Pickable=1

proc/GetPlanetGravity(var/q)
	switch(q)
		if(1)//Earth
			return 1
		if(2)//Namek
			return 1
		if(3)//Vegeta
			return 1
		if(11)//Vegeta Cave
			return 1
		if(4)//Ice
			return 1
		if(5)//Arconia
			return 1
		if(6)//Heaven
			return 1
		if(7)//Hell
			return 1
		if(8)//Afterlife
			return 1
		if(10)
			return KSPGrav
		if(14)//Alien Planets
			return 1
		if(16)//HBTC
			return 1
		if(21)//Lower Hell
			return LowerHellGrav
		if(22)
			return 1
		if(23)
			return 2
		if(24)
			return 10
		if(25)
			return 3
	return 1

/*proc/GetPlanetTemperature(var/q)
	switch(q)
		if(1)//Earth
			var/area/Outside/Planet/Earth/A
			return A.Temperature
		if(2)//Namek
			return 2
		if(3)//Vegeta
			return 5
		if(11)//Vegeta Cave
			return 5
		if(4)//Ice
			return 10
		if(5)//Arconia
			return 3
		if(6)//Heaven
			return 1
		if(7)//Hell
			return 10
		if(8)//Afterlife
			return 1
		if(10)
			return 10000
		if(14)//Alien Planets
			return 1
		if(16)//HBTC
			return 100000000
		if(21)//Lower Hell
			return 16
	return 1*/

obj/HBTCDoor
	icon='Doors.dmi'
	icon_state="Closed1"
	Health=1.#INF
	Grabbable=0
	verb/Open()
		set src in oview(1)
		if(usr.HBTCCounter>=12000)
			usr<<"You have spent the maximum alloted time within and cannot use this door any longer."
			return
		if(usr.z==16)
			usr.x=216
			usr.y=86
			usr.z=11
			Log("Admin","[usr] has exited the HBTC, with [usr.HBTCCounter] seconds used.")
		else if(usr.z==11)
			usr.x=227
			usr.y=258
			usr.z=16
			Log("Admin","[usr] has entered the HBTC. Please investigate if this was unauthorized. They've used the HBTC for [usr.HBTCCounter] seconds.")

obj/BoatEntrance
	icon='Special.dmi'
	icon_state="Special7"
	Health=1.#INF
	Grabbable=0
	verb/Leave()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/Boat/Q in world)
			if(Q.z)
				if(Q.Password==src.Password)
					view(10,usr)<<"[usr] leaves the boat."
					usr.loc=Q.loc
					return
		AdminMessage("[usr]([usr.key]) is trapped on a boat that blew up!(Sent to spawn)(Boat ID was [src.Password])")
		usr.SendToSpawn()
	verb/View()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/Boat/Q in world)
			if(Q.z)
				if(Q.Password==src.Password)
					usr.client.eye=Q

obj/BoatConsole
	var/SpeakerToggle=0
	Health=1.#INF
	Grabbable=0
	icon='Ship Wheel.dmi'
//	icon_state="ShipConsole"
	verb/Muffin_Button()
		set src in oview(1)
		usr<< "What muffin button?"
		return
	verb/BoatSpeakerToggle()
		set src in oview(1)
		if(SpeakerToggle==0)
			SpeakerToggle=1
			usr<<"Boat speakers activated."
		else
			SpeakerToggle=0
			usr<<"Boat speakers deactivated."
	verb/Use()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/Boat/Q in world)
			if(Q.z)
				if(Q.Password==src.Password)
					if(!Q.who)
						usr.Control=Q
						usr.client.eye=Q
						Q.who=usr
					else
						usr<<"Someone else is driving!"
	verb/View()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/Boat/Q in world)
			if(Q.z)
				if(Q.Password==src.Password)
					usr.client.eye=Q

obj/ShipAirlock
	icon='Special.dmi'
	icon_state="Special7"
	Health=1.#INF
	Grabbable=0
	verb/Leave()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/Ship/Q in world)
			if(Q.z)
				if(Q.Password==src.Password)
					view(10,usr)<<"[usr] leaves the ship."
					usr.loc=Q.loc
					return
		AdminMessage("[usr]([usr.key]) is trapped on a ship that blew up!(Sent to spawn)(Ship ID was [src.Password])")
		usr.SendToSpawn()
	verb/View()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/Ship/Q in world)
			if(Q.z)
				if(Q.Password==src.Password)
					usr.client.eye=Q

obj/PodConsole
	var/Launching
	Health=9999999999999999999
	LogPEndurance=999999999999
	var/SpeakerToggle=0
	var/PodID
	Grabbable=0
	icon='Tech.dmi'
	icon_state="ShipConsole"
	verb/ShipSpeakerToggle()
		set src in oview(1)
		if(SpeakerToggle==0)
			SpeakerToggle=1
			usr<<"Ship speakers activated."
		else
			SpeakerToggle=0
			usr<<"Ship speakers deactivated."
	verb/Use()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/SpacePod/Q in world)
			if(Q.z)
				if(Q.PodID==src.PodID)
					if(!Q.who)
						usr.Control=Q
						usr.client.eye=Q
						Q.who=usr
					else
						usr<<"Someone else is driving!"
	verb/Leave()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/SpacePod/Q in world)
			if(Q.z)
				if(Q.PodID==src.PodID)
					view(10,usr)<<"[usr] leaves the pod."
					usr.loc=Q.loc
					Q.Peoples--
					return
		AdminMessage("[usr]([usr.key]) is trapped on a pod that blew up!(Sent to spawn)(Pod ID was [src.Password])")
		usr.SendToSpawn()
	verb/View()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/SpacePod/Q in world)
			if(Q.z)
				if(Q.PodID==src.PodID)
					usr.client.eye=Q
	verb/Launch()
		set src in oview(1)
		if(usr.z==2)return

		if(global.SpaceTravel==0)
			usr<<"You cannot use this at this time!"
			return

		for(var/obj/Items/Tech/SpaceTravel/SpacePod/Q in world)
			if(Q.z)
				if(Q.z==1||Q.z==2||Q.z==3||Q.z==8||Q.z==9||Q.z==10)
					if(Q.PodID==src.PodID)
						if(Q.Bolt)
							usr<<"ERROR: Pod is secured."
							return
						if(src.Launching)return
						src.Launching=1
						if(locate(/obj/Items/Tech/SpaceTravelParts/Misc/EngineBooster,Q.contents))
							usr<<"You will launch in 20 seconds!"
							sleep(200)
						else if(locate(/obj/Items/Tech/SpaceTravelParts/Misc/SubspaceRefractor,Q.contents))
							usr<<"You will launch in 15 seconds!"
							sleep(150)
						else
							usr<<"You will launch in 30 seconds!"
							sleep(300)
						src.Launching=0

/*						if(Q.z==14||Q.z==18||Q.z==6)
							var/turf/B=Q.loc
							if(istype(B.loc,/area/Outside/Planet/AlienRuin))
								for(var/obj/Planets/AlienRuin/x in world)
									Q.loc=x.loc
									return
//							else if(istype(B.loc,/area/Outside/Planet/AlienGrassland))
//								for(var/obj/Planets/AlienGrassland/x in world)
//									Q.loc=x.loc
//									return
							else if(istype(B.loc,/area/Outside/Planet/AlienOcean))
								for(var/obj/Planets/AlienOcean/x in world)
									Q.loc=x.loc
									return
//							else if(istype(B.loc,/area/Outside/Planet/AlienArctic))
//								for(var/obj/Planets/AlienArctic/x in world)
//									Q.loc=x.loc
//									return
							else if(istype(B.loc,/area/Outside/Planet/AlienDesolate))
								for(var/obj/Planets/AlienDesolate/x in world)
									Q.loc=x.loc
									return
							else if(istype(B.loc,/area/Outside/Planet/Sanctuary))
								for(var/obj/Planets/Sanctuary/x in world)
									Q.loc=x.loc
									return
//							else if(Q.z==6)
//								for(var/obj/Planets/PirateColony/x in world)
//									Q.loc=x.loc
//									return
*/

//						else
						for(var/obj/Planets/x in world)
							if(x.Zz==Q.z)
								Q.loc=x.loc
								return
						if(global.JinxMap)
							Q.loc=locate(250, 250, 10)
						else
							Q.loc=locate(250,250,6)
							usr<<"There was a launching error. You've been sent to 250,250,2."

obj/ShipConsole
	var/Launching
	var/SpeakerToggle=0
	Health=1.#INF
	Grabbable=0
	icon='Tech.dmi'
	icon_state="ShipConsole"
	verb/Muffin_Button()
		set src in oview(1)
		usr<< "What muffin button?"
		return
	verb/ShipSpeakerToggle()
		set src in oview(1)
		if(SpeakerToggle==0)
			SpeakerToggle=1
			usr<<"Ship speakers activated."
		else
			SpeakerToggle=0
			usr<<"Ship speakers deactivated."
	verb/Launch()
		set src in oview(1)
		if(usr.z==2)return

		if(global.SpaceTravel==0)
			usr<<"You cannot use this at this time!"
			return

		for(var/obj/Items/Tech/SpaceTravel/Ship/Q in world)
			if(Q.z)
				if(Q.z==1||Q.z==2||Q.z==3||Q.z==8||Q.z==9||Q.z==10)
					if(Q.Password==src.Password)
						if(Q.Bolt)
							usr<<"ERROR: Ship is secured."
						if(src.Launching)return
						src.Launching=1
						if(locate(/obj/Items/Tech/SpaceTravelParts/Misc/EngineBooster,Q.contents))
							usr<<"You will launch in 50 seconds!"
							sleep(500)
						else if(locate(/obj/Items/Tech/SpaceTravelParts/Misc/SubspaceRefractor,Q.contents))
							usr<<"You will launch in 45 seconds!"
							sleep(450)
						else
							usr<<"You will launch in 60 seconds!"
							sleep(600)
						src.Launching=0

/*						if(Q.z==14||Q.z==18||Q.z==6)
							var/turf/B=Q.loc
							if(istype(B.loc,/area/Outside/Planet/AlienRuin))
								for(var/obj/Planets/AlienRuin/x in world)
									Q.loc=x.loc
									return
//							else if(istype(B.loc,/area/Outside/Planet/AlienGrassland))
//								for(var/obj/Planets/AlienGrassland/x in world)
//									Q.loc=x.loc
//									return
							else if(istype(B.loc,/area/Outside/Planet/AlienOcean))
								for(var/obj/Planets/AlienOcean/x in world)
									Q.loc=x.loc
									return
//							else if(istype(B.loc,/area/Outside/Planet/AlienArctic))
//								for(var/obj/Planets/AlienArctic/x in world)
//									Q.loc=x.loc
//									return
							else if(istype(B.loc,/area/Outside/Planet/AlienDesolate))
								for(var/obj/Planets/AlienDesolate/x in world)
									Q.loc=x.loc
									return
							else if(istype(B.loc,/area/Outside/Planet/Sanctuary))
								for(var/obj/Planets/Sanctuary/x in world)
									Q.loc=x.loc
									return
//							else if(Q.z==6)
//								for(var/obj/Planets/PirateColony/x in world)
//									Q.loc=x.loc
//									return
*/

//						else
						for(var/obj/Planets/x in world)
//								if(!istype(x,/obj/Planets/Alien))
							if(x.Zz==Q.z)
								Q.loc=x.loc
								return
						if(global.JinxMap)
							Q.loc=locate(250, 250, 10)
						else
							Q.loc=locate(250,250,6)
							usr<<"There was a launching error. You've been sent to 250,250,2."
	verb/Use()
		set src in oview(1)
/*		if(YearReq)
			if(YearReq>Year)
				usr<<"You cannot use this at this year!"
				return*/
		for(var/obj/Items/Tech/SpaceTravel/Ship/Q in world)
			if(Q.z)
				if(Q.Password==src.Password)
					if(!Q.who)
						usr.Control=Q
						usr.client.eye=Q
						Q.who=usr
					else
						usr<<"Someone else is driving!"
	verb/View()
		set src in oview(1)
		for(var/obj/Items/Tech/SpaceTravel/Ship/Q in world)
			if(Q.z)
				if(Q.Password==src.Password)
					usr.client.eye=Q
	verb/DoorPass()
		set src in oview(1)
		set name="Door Password"
		for(var/obj/Items/Tech/SpaceTravel/Ship/Q in world)
			if(Q.z)
				if(Q.Password==src.Password)
					Q.DoorPass=input("Enter Password 1")as text
					Q.DoorPass2=input("Enter Password 2")as text
					Q.DoorPass3=input("Enter Password 3")as text
					usr<< "You've entered [Q.DoorPass],[Q.DoorPass2], and [Q.DoorPass3] as the passwords. All doors with these passwords will open if the ship is flown near them."

obj/Items/Tech
	var/Lvl=1
	var/UpgradePrice
	var/Bolt
	var/Functional
	var/DrillSpeed=200
	var/BaseDigMulti=25
	var/Points=0
	AutoDrill
		var/InstalledDrill
		var/InstalledDriveshaft
		var/InstalledEngine
		var/DrillSpecial
		var/InstallLock
		var/EnchantType2
		var/EnchantType3
		var/SpecialLock
		Pickable=0
		Grabbable=0
		Level=10
		Lvl=10
		Cost=10000
		UpgradePrice=50000
		Functional=1
		DrillSpeed=500
		BaseDigMulti=50
		New()
			var/image/A=image(icon='ArtificalObj.dmi',icon_state="1",pixel_y=16,pixel_x=-16)
			var/image/Z=image(icon='ArtificalObj.dmi',icon_state="2",pixel_y=16,pixel_x=16)
			var/image/C=image(icon='ArtificalObj.dmi',icon_state="3",pixel_y=-16,pixel_x=-16)
			var/image/D=image(icon='ArtificalObj.dmi',icon_state="4",pixel_y=-16,pixel_x=16)
			overlays.Remove(A,Z,C,D)
			overlays.Add(A,Z,C,D)
			spawn(20) if(src) Drill()
		Click()
			..()
			if(!(usr.client.mob in range(1,src))) return
			usr.OMessage(10,"[usr] withdraws [Commas(Level)] Resources from the [src]","<font color=red>[usr]([usr.key]) withdraws [Commas(Level)] Resources from the [src] made by [src.CreatorKey]")
			for(var/obj/Money/M in usr)
				M.Level+=Level
				Level=0
			if(!Functional)
				view(src)<<"This drill has been locked down and self destructs when you touch it!"
				del src
		proc/Drill()
			set background=1
			while(src)
				sleep(src.DrillSpeed)
				var/ResourcesGained=0
				if(src.loc)
					if(src.loc.loc)
						var/area/P=src.loc.loc
						if(!src.Grabbable)
							if(P.Level>0)
								if(src.EnchantType=="Chaotic")
									var/ChaoticRandomizer=rand(src.Lvl-5,src.Lvl+10)
									ResourcesGained+=src.BaseDigMulti*ChaoticRandomizer*global.DiggingMultiplier

								else if(src.EnchantType=="Haste")
									ResourcesGained+=src.BaseDigMulti*src.Lvl*global.DiggingMultiplier

									if(prob(10))
										ResourcesGained+=src.BaseDigMulti*src.Lvl/2*global.DiggingMultiplier

								else
									ResourcesGained+=src.BaseDigMulti*src.Lvl*global.DiggingMultiplier

								if(src.EnchantType2=="Starlight")
									if(global.Time=="Night")
										ResourcesGained+=src.BaseDigMulti*src.Lvl/5*global.DiggingMultiplier
										ResourcesGained*=1.25
									if(global.Time=="Day")
										ResourcesGained*=0.85
							if(P.Level<0)
								ResourcesGained=P.Level
								P.Level=0
							src.Level+=(ResourcesGained)
							P.Level-=(ResourcesGained)

							if(P.Level<1)
								Level+=2*Lvl*global.DiggingMultiplier
								sleep(50)
		verb/InstallParts()
			set src in oview(1)
			winshow(usr,"DrillCustom",0)
			if(usr.client.mob in range(1,src))
				winshow(usr,"DrillCustom",1)
				usr.Customizing=src
				usr.UpdateDrillWindow(src)
		verb/Relocate()
			set src in oview(1)
			if(src.CreatorKey!=usr.key)
				usr<<"You can't relocate drills you don't own!"
				return
			if(src.Grabbable)
				src.Grabbable=0
				usr<<"The Autodrill has been resecured, and starts up again."
			else if(!src.Grabbable)
				src.Grabbable=1
				usr<<"The Autodrill stops operating as its anchor bolts are pulled. Use this command again to resecure it."


	AutoDrillParts
		icon='ModularDrill.dmi'
		var/Material
		Driveshaft/BronzeDriveShaft
			icon_state="BronzeDS"
			Level=15
			Cost=50000
			Lvl=2.5
			BaseDigMulti=1
			DrillSpeed=10
			Material="Bronze"
		Engine/BronzeEngine
			icon_state="BronzeEngine"
			Level=16
			Cost=60000
			Lvl=2.5
			BaseDigMulti=1
			DrillSpeed=-5
			Material="Bronze"
		Drillhead/BronzeDrillhead
			icon_state="BronzeDH"
			Level=17
			Cost=70000
			Lvl=2.5
			BaseDigMulti=1
			DrillSpeed=10
			Material="Bronze"

		Driveshaft/IronDriveShaft
			icon_state="IronDS"
			Level=19
			Cost=100000
			Lvl=5
			BaseDigMulti=1.5
			DrillSpeed=15
			Material="Iron"
		Engine/IronEngine
			icon_state="IronEngine"
			Level=20
			Cost=125000
			Lvl=5
			BaseDigMulti=1.5
			DrillSpeed=-10
			Material="Iron"
		Drillhead/IronDrillhead
			icon_state="IronDH"
			Level=21
			Cost=150000
			Lvl=5
			BaseDigMulti=1.5
			DrillSpeed=15
			Material="Iron"

		Driveshaft/SteelDriveShaft
			icon_state="SteelDS"
			Level=25
			Cost=200000
			Lvl=10
			BaseDigMulti=2
			DrillSpeed=25
			Material="Steel"
		Engine/SteelEngine
			icon_state="SteelEngine"
			Level=26
			Cost=250000
			Lvl=10
			BaseDigMulti=2
			DrillSpeed=-15
			Material="Steel"
		Drillhead/SteelDrillhead
			icon_state="SteelDH"
			Level=27
			Cost=300000
			Lvl=10
			BaseDigMulti=2
			DrillSpeed=25
			Material="Steel"

		Driveshaft/TitaniumDriveShaft
			icon_state="TitaniumDS"
			Level=40
			Cost=500000
			Lvl=15
			BaseDigMulti=3
			DrillSpeed=30
			Material="Titanium"
		Engine/TitaniumEngine
			icon_state="TitaniumEngine"
			Level=42
			Cost=750000
			Lvl=15
			BaseDigMulti=3
			DrillSpeed=-20
			Material="Titanium"
		Drillhead/TitaniumDrillhead
			icon_state="TitaniumDH"
			Level=44
			Cost=1000000
			Lvl=15
			BaseDigMulti=3
			DrillSpeed=30
			Material="Titanium"

	PunchingBag
		Pickable=0
		Level=1
		Health=10000
		icon='PunchingBag.dmi'
		TechType="BasicTechnology"
		Cost=10000
		density=1
	Log
		Pickable=0
		Level=3
		Health=10000
		icon='Dummy.dmi'
		TechType="BasicTechnology"
		Cost=10000
		density=1
	Simulator
		Pickable=1
		Level=10
		Lvl=10
		Health=10000
		icon='Lab.dmi'
		icon_state="computer"
		Cost=10000
		UpgradePrice=10000
		Click()
			..()
			if(!(usr.client.mob in oview(1,src))) return
			var/mob/Sim/x=new
			x.icon=usr.icon
			x.overlays=usr.overlays
			x.underlays=x.underlays
			x.Energy=Lvl*100*Lvl
			x.EnergyMax=Lvl*100*Lvl
			x.Base=usr.Base
			x.Strength=usr.Strength/4
			x.Endurance=99999999999999999
			x.Speed=usr.SpeedMod*2
			x.SpeedMultiplier=usr.SpeedMultiplier
			x.SpeedMod=usr.SpeedMod*((Lvl*0.05)+1)
			x.Offense=usr.Offense
			x.Defense=1
			x.Force=1
			x.Resistance=1
			x.name="[usr.name] Simulation"
			x.Owner=usr.key
			x.loc=usr.loc
			x.Warp=0
			spawn()step(x,SOUTH)
/*		verb/Use2()
			set src in usr
			set name="Use Simulator"
			var/mob/Sim/x=new
			x.icon=usr.icon
			x.overlays=usr.overlays
			x.underlays=x.underlays
			x.Energy=Lvl*100*Lvl
			x.EnergyMax=Lvl*100*Lvl
			x.Base=usr.Base
			x.Strength=usr.Strength/4
			x.Endurance=99999999999999999
			x.SpeedMod=usr.SpeedMod*2
			x.SpeedMultiplier=usr.SpeedMultiplier
			x.SpeedMod=usr.SpeedMod*((Lvl*0.05)+1)
			x.Offense=usr.Offense
			x.Defense=1
			x.Force=1
			x.Resistance=1
			x.name="[usr.name] Simulation"
			x.Owner=usr.key
			x.loc=usr.loc
			x.Warp=0
			spawn()step(x,SOUTH)*/
	HeatPack
		Level=15
		Cost=50000
		icon='Lab.dmi'
		icon_state="HeatPack"
		desc="This helps reduce damage from being in cold enviroments."
	KelotanePill
		Level=16
		Cost=52000
		icon='Lab.dmi'
		icon_state="KeloPill"
		desc="This helps reduce damage from being in hot enviroments."

	Medkit
		Cost=75000
		Level=15
		TechType="MedicalTechnology"
		icon='Tech.dmi'
		icon_state="Medkit"
		desc="This can help stabilize wounds, but takes a while to use on a target. You'll be frozen in place while using it. If being used on yourself, it takes even longer."
		verb/UseMedkit()
			set src in usr
			var/validkitters=list("Cancel")
			for(var/mob/Players/A in view(1,usr))
				validkitters+=A
			var/mob/selection=input("Select a target to use the Medkit on. If it's yourself, it will take longer.") in validkitters
			if(selection=="Cancel")
				return
			if(selection.Medkitted)
				usr<<"They're already Medkitted."
				return
			selection.Frozen=1
			usr.Frozen=1
			usr<<"Beginning to apply medkit to [selection]!"
			if(usr==selection)
				sleep(150)
			else
				sleep(100)
			selection.Frozen=0
			usr.Frozen=0
			selection.Medkitted=60
			usr<<"Medkit successfully applied!"
			if(usr!=selection)
				selection<<"You've had a medkit applied to you!"
			del(src)

	Regenerator
		TechType="RegenTankTechnology"
		Level=12
		var/HealingEffectiveness=4
		var/EnergyEffectiveness=4
		var/WoundEffectiveness=2
		var/BurnEffectiveness=1
		var/PoisonEffectiveness=1
		var/StableEffectiveness=1
		icon='Lab.dmi'
		icon_state="Tube"
		var/OverlayKiller=0
		density=1
		Cost=1000000
		UpgradePrice=10000
		Pickable=0
		New()
			var/image/A=image(icon='Lab.dmi',icon_state="TubeTop",layer=5,pixel_y=32)
			overlays-=A
			overlays+=A
			spawn()
				if(src)
					Regenerator()
					src.OverlayKiller=0
		proc/Regenerator()
			set background=1
			while(src)
				if(src.icon!='Lab.dmi'&&src.OverlayKiller==0)
					src.overlays-=src.overlays
					src.underlays-=src.underlays
					src.OverlayKiller=1
					src.layer=5
				for(var/mob/A in get_step(src,NORTH))//get_step(src,NORTH))
/*					if(prob(10))
						A.dir=SOUTH
						A.icon_state="Meditate"
						A.generalEvent_id="[A][world.realtime][rand()]"
						A.meditation_event = new(general_scheduler, A, A.generalEvent_id)
						general_scheduler.schedule(A.meditation_event, 10)
					A.Flying=0*/
					if(A.Flying)
						A.Flying=0
//						FlyGains.Remove(A)
						A.icon_state=""
						A<< "You can't fly in a tank..."
					if(A.Swim==1)
						A<< "Your Regeneration tank has sunk underwater, and crushed by water pressure!"
						del src
					if(A.Gravity>=17+(src.Level/10))
						A<< "The regeneration tank has shattered under the high gravity!"
						del src
					if(A.Digging)
						A<< "You dug through the glass and broke the tank, you retard!"
						del src
					if(A.Poison>0)
						A.Poison-=0.01*PoisonEffectiveness
					if(A.Burning>0)
						A.Burning-=0.01*BurnEffectiveness
					if(A.TotalInjury)
						A.Recover("Injury",sqrt(Lvl*1.25*100)*WoundEffectiveness)
					if(A.KO)
						A.ZenkaiGain()
					A.Recover("Health",sqrt(Lvl)*HealingEffectiveness)
					A.Recover("Energy",sqrt(Lvl)*EnergyEffectiveness)
					A.MortallyWounded=0
					A.Conscious()
				sleep(40)
			/*	for(var/obj/Items/Tech/Regenerator/B in
					del(B)*/

	RegenUpgrades
		icon='Tech.dmi'
		var/HealingBoost=0
		var/EnergyBoost=0
		var/WoundBoost=0
		var/BurnBoost=0
		var/PoisonBoost=0
		var/StableBoost=0
		verb/InstallUpgrade()
			set src in usr
			var/list/validinstalls=new("Cancel")
			for(var/obj/Items/Tech/Regenerator/R in view(1,usr))
				validinstalls+=R
			var/obj/Items/Tech/selection=input("Pick a tech item to install the [src] into.") in validinstalls
			if(selection=="Cancel")
				return
			else
				for(var/obj/Items/Tech/RegenUpgrades/BasicUpgrade/BU in selection)
					if(istype(src,/obj/Items/Tech/RegenUpgrades/BasicUpgrade)&&istype(BU,/obj/Items/Tech/RegenUpgrades/BasicUpgrade))
						var/notice=input("You already have a basic upgrade ([BU]) installed! Would you like to replace it with [src]?") in list("Yes","No")
						if(notice=="No")
							return
						else
							if(BU.HealingBoost)
								selection:HealingEffectiveness-=BU.HealingBoost
							if(BU.EnergyBoost)
								selection:EnergyEffectiveness-=BU.EnergyBoost
							if(BU.WoundBoost)
								selection:WoundEffectiveness-=BU.WoundBoost
							if(BU.BurnBoost)
								selection:BurnEffectiveness-=BU.BurnBoost
							if(BU.PoisonBoost)
								selection:PoisonEffectiveness-=BU.PoisonBoost

							if(usr.MaterialTechnology)
								selection.Lvl-=((2*usr.MaterialTechnology)+15)
								if(selection.Lvl<1)
									selection.Lvl=1
							else
								selection.Lvl-=15
								if(selection.Lvl<1)
									selection.Lvl=1
							if(usr.Race=="Tsufurujin")
								selection.Lvl-=2
								if(selection.Lvl<1)
									selection.Lvl=1
							BU.loc=usr
							usr<<"You uninstall the [BU]."

				for(var/obj/Items/Tech/RegenUpgrades/ModernUpgrade/MU in selection)
					if(istype(src,/obj/Items/Tech/RegenUpgrades/ModernUpgrade)&&istype(MU,/obj/Items/Tech/RegenUpgrades/ModernUpgrade))
						var/notice=input("You already have a modern upgrade ([MU]) installed! Would you like to replace it with [src]?") in list("Yes","No")
						if(notice=="No")
							return
						else
							if(MU.HealingBoost)
								selection:HealingEffectiveness-=MU.HealingBoost
							if(MU.EnergyBoost)
								selection:EnergyEffectiveness-=MU.EnergyBoost
							if(MU.WoundBoost)
								selection:WoundEffectiveness-=MU.WoundBoost
							if(MU.BurnBoost)
								selection:BurnEffectiveness-=MU.BurnBoost
							if(MU.PoisonBoost)
								selection:PoisonEffectiveness-=MU.PoisonBoost

							if(usr.MaterialTechnology)
								selection.Lvl-=((2*usr.MaterialTechnology)+15)
								if(selection.Lvl<1)
									selection.Lvl=1
							else
								selection.Lvl-=15
								if(selection.Lvl<1)
									selection.Lvl=1
							if(usr.Race=="Tsufurujin")
								selection.Lvl-=2
								if(selection.Lvl<1)
									selection.Lvl=1
							MU.loc=usr
							usr<<"You uninstall the [MU]."

/*				for(var/obj/Items/Tech/ScouterUpgrades/ModernUpgrade/MU in selection)
					if(istype(src,/obj/Items/Tech/ScouterUpgrades/ModernUpgrade)&&istype(MU,/obj/Items/Tech/ScouterUpgrades/ModernUpgrade))
						var/notice=input("You already have a modern upgrade ([MU]) installed! Would you like to replace it with [src]?") in list("Yes","No")
						if(notice=="No")
							return
						else
							if(MU.RangeBoost)
								selection:Range-=MU.RangeBoost
							if(MU.BPBoost)
								selection:BaseBPScan-=MU.BPBoost
							MU.loc=usr
							usr<<"You uninstall the [MU]."

				for(var/obj/Items/Tech/ScouterUpgrades/AdvancedUpgrade/AU in selection)
					if(istype(src,/obj/Items/Tech/ScouterUpgrades/AdvancedUpgrade)&&istype(AU,/obj/Items/Tech/ScouterUpgrades/AdvancedUpgrade))
						var/notice=input("You already have a modern upgrade ([AU]) installed! Would you like to replace it with [src]?") in list("Yes","No")
						if(notice=="No")
							return
						else
							if(AU.RangeBoost)
								selection:Range-=AU.RangeBoost
							if(AU.BPBoost)
								selection:BaseBPScan-=AU.BPBoost
							AU.loc=usr
							usr<<"You uninstall the [AU]."*/

				if(src.HealingBoost)
					selection:HealingEffectiveness+=src.HealingBoost
				if(src.EnergyBoost)
					selection:EnergyEffectiveness+=src.EnergyBoost
				if(src.WoundBoost)
					selection:WoundEffectiveness+=src.WoundBoost
				if(src.BurnBoost)
					selection:BurnEffectiveness+=src.BurnBoost
				if(src.PoisonBoost)
					selection:PoisonEffectiveness+=src.PoisonBoost

				if(usr.MaterialTechnology)
					selection.Lvl+=((2*usr.MaterialTechnology)+15)
				else
					selection.Lvl+=15
				if(usr.Race=="Tsufurujin")
					selection.Lvl+=2
				src.loc=selection
				usr<<"You install the [src] in the [selection]."
		BasicUpgrade
			BasicHealingBoost
				TechType="RegenTankUpgrades"
				Level=16
				Cost=15000
				HealingBoost=1.5
			BasicWoundsBoost
				TechType="RegenTankUpgrades"
				Level=17
				Cost=20000
				WoundBoost=0.75
			BasicBurnBoost
				TechType="RegenTankUpgrades"
				Level=18
				Cost=10000
				BurnBoost=0.7
			BasicPoisonBoost
				TechType="RegenTankUpgrades"
				Level=19
				Cost=10000
				PoisonBoost=0.7
			BasicOCWoundBoost
				TechType="RegenTankUpgrades"
				Level=20
				Cost=30000
				WoundBoost=1.25
				HealingBoost=-0.2
				PoisonBoost=-0.2
				BurnBoost=-0.2
		ModernUpgrade
			ModernHealingBoost
				TechType="ModernRegenTankUpgrades"
				Level=24
				Cost=50000
				HealingBoost=1.5
			ModernWoundBoost
				TechType="ModernRegenTankUpgrades"
				Level=28
				Cost=75000
				WoundBoost=2.5



	Safe
		Level=23
		Cost=150000
		Pickable=0
		icon='Drill 3.dmi'
		desc="Stores resources and a small number of items."
		var/ItemCount=0
		verb/SetPassword()
			set src in oview(1)
			set name="Set Password"
			if(src.Password)
				var/Passcheck=input(usr,"Input original password.")as text
				if(Passcheck==src.Password)
					Password=input(usr,"Input a password for the safe.")as text
				else
					usr<<"Incorrect password."
			else
				Password=input(usr,"Input a password for the safe.")as text
		verb/WithdrawRes()
			set src in oview(1)
			set name="Withdraw Resources"
			if(src.Password)
				var/Passcheck=input(usr,"Input password.")as text
				if(Passcheck!=src.Password)
					usr<<"This isn't the right password..."
					return
			if(src.Lvl==0)
				usr<<"The safe has no resources in it!"
				return
			var/Withdrawing=input(usr,"How much would you like to withdraw?","[src.Lvl] resources available")as num
			if(Withdrawing==0||Withdrawing==null)
				return
			if(Withdrawing>src.Lvl)
				Withdrawing=src.Lvl
			for(var/obj/Money/M in usr)
				M.Level+=Withdrawing
				src.Lvl-=Withdrawing
				usr.OMessage(3,"[usr] withdraws [Commas(Withdrawing)] from the [src].","<font color=red>[usr]([usr.key]) withdraws [Commas(Withdrawing)] resources from a Safe made by [src.CreatorKey].")
		verb/DepositRes()
			set src in oview(1)
			set name="Deposit Resources"
			if(src.Password)
				var/Passcheck=input(usr,"Input password.")as text
				if(Passcheck!=src.Password)
					usr<<"This isn't the right password..."
					return
			for(var/obj/Money/M in usr)
				if(M.Level==0)
					usr<<"You have no resources to deposit!"
					return
				var/Depositing=input(usr,"How much would you like to deposit?","[src.Lvl] resources available")as num
				if(Depositing==0||Depositing==null)
					return
				if(Depositing>M.Level)
					Depositing=M.Level
				src.Lvl+=Depositing
				M.Level-=Depositing
				usr.OMessage(3,"[usr] deposits [Commas(Depositing)] to the [src].","<font color=red>[usr]([usr.key]) deposits [Commas(Depositing)] resources to a Safe made by [src.CreatorKey].")
		verb/DepositItem()
			set src in oview(1)
			set name="Deposit Item"
			if(src.Password)
				var/Passcheck=input(usr,"Input password.")as text
				if(Passcheck!=src.Password)
					usr<<"This isn't the right password..."
					return
			if(src.ItemCount>9)
				usr<<"You can't store anything more in the Safe!"
				return
			var/list/ItemList=new
			ItemList+="Cancel"
			for(var/obj/Items/A in usr) //Checks player for valid items. Equipped Items are ignored for obvious reasons.
				if(A.suffix!="Equipped")
					ItemList+=A
			var/ItemSelect=input("What item do you wish to deposit?") in ItemList
			if(ItemSelect=="Cancel")
				return
			else
				var/obj/Items/A=ItemSelect
				A.loc=src
				src.ItemCount++
		verb/WithdrawItem()
			set src in oview(1)
			set name="Withdraw Item"
			if(src.Password)
				var/Passcheck=input(usr,"Input password.")as text
				if(Passcheck!=src.Password)
					usr<<"This isn't the right password..."
					return
			var/list/ItemList=new
			ItemList+="Cancel"
			for(var/obj/Items/B in src) //Checks for items within the Safe itself.
				ItemList+=B
			var/ItemSelect=input("What item do you wish to withdraw?") in ItemList
			if(ItemSelect=="Cancel")
				return
			else
				var/obj/Items/B=ItemSelect
				B.loc=usr
				src.ItemCount--

	Communicator
		Level=10
		TechType="CommunicationTechnology"
		icon='Cell Phone.dmi'
		Cost=20000
		var/Frequency=1
		var/Frequency2=2
		var/Enhancements=0
		verb/CommunicatorSpeak(Z as text)
			set src in usr
			var/FrequencySelector
			if(locate(/obj/Items/Tech/EnhancementChips/Communication,src.contents))
				FrequencySelector=input("Would you like to use your first frequency ([src.Frequency]) or your second ([src.Frequency2])?") in list("First","Second")
				if(FrequencySelector=="First")
					FrequencySelector=src.Frequency
				else if(FrequencySelector=="Second")
					FrequencySelector=src.Frequency2
			else
				FrequencySelector=src.Frequency
			for(var/mob/E in hearers(3,usr))
				for(var/obj/Communication/C in usr)
					E<<"<i><font color=[C.Text_Color]>[usr] speaks into a [src]: [html_encode(Z)]</i>"
			for(var/mob/Players/M in world)
				for(var/obj/Items/Tech/Scouter/Q in M)
					if(Q.Frequency==FrequencySelector)
						M<<"<font color=green><b>([src.name])</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>([src.name])[usr]([usr.key]) says: [html_encode(Z)]")
				for(var/obj/Items/Tech/Communicator/Q in M)
					if(Q.Frequency==FrequencySelector)
						M<<"<font color=green><b>([src.name])</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>([src.name])[usr]([usr.key]) says: [html_encode(Z)]")
				for(var/obj/Skills/InternalCommunicator/B in M)
					if(B.ICFrequency==FrequencySelector)
						M<<"<font color=green><b>(Internal Comms (Freq:[B.ICFrequency]))</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>(Internal Comms (Freq: [B.ICFrequency]))[usr]([usr.key]): [html_encode(Z)]")
					if(B.MonitoringFrequency==FrequencySelector)
						M<<"<font color=green><b>(Internal Comms (Monitoring Freq:[B.MonitoringFrequency]))</b> [usr.name]: [html_encode(Z)]"
			for(var/obj/Items/Tech/Speaker/X in world)
				if(X.Frequency==FrequencySelector&&X.Active==1)
					for(var/mob/Y in hearers(X.AudioRange,X))
						Y<<"<font color=green><b>([X.name])</b> [usr.name]: [html_encode(Z)]"
		verb/CommunicatorFrequency()
			set src in usr
			if(locate(/obj/Items/Tech/EnhancementChips/Communication,src.contents))
				var/selection=input("Change frequency one (currently [src.Frequency]) or frequency two (currently [src.Frequency2]?") in list ("Frequency","Frequency2")
				if(selection=="Frequency")
					src.Frequency=input(usr,"Change your Communicator frequency to what?","Frequency",Frequency)as num
				else if(selection=="Frequency2")
					src.Frequency2=input(usr,"Change your Communicator frequency to what?","Frequency2",Frequency2)as num
			else
				Frequency=input(usr,"Change your Communicator frequency to what?","Frequency",Frequency)as num


	iDroid
		Level=50
		TechType="CommunicationTechnology"
		icon='KunaiMod/Icons/pda.dmi'
		desc="This is a hi-tech radiocommunicator that you may want to attach to your webbing. The wiring connects and extends into a single ear piece, in which you'll be using to chat with your comrades. You can also use it to request for supplies."
		Cost=20000000
		Stealable=0
		var/Frequency=1
		var/Frequency2=2
		var/Enhancements=0
		var/GMP=35000
		verb/RadioChat(Z as text)
			set src in usr
			var/FrequencySelector
			if(locate(/obj/Items/Tech/EnhancementChips/Communication,src.contents))
				FrequencySelector=input("Would you like to use your first frequency ([src.Frequency]) or your second ([src.Frequency2])?") in list("First","Second")
				if(FrequencySelector=="First")
					FrequencySelector=src.Frequency
				else if(FrequencySelector=="Second")
					FrequencySelector=src.Frequency2
			else
				FrequencySelector=src.Frequency
			for(var/mob/E in hearers(3,usr))
				for(var/obj/Communication/C in usr)
					E<<"<font color=[C.Text_Color]>[usr] speaks into their [src]: <i>[html_encode(Z)]</i>"
			for(var/mob/Players/M in world)
				for(var/obj/Items/Tech/Scouter/Q in M)
					if(Q.Frequency==FrequencySelector)
						M<<"<font color=green><b>([src.name])</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>([src.name])[usr]([usr.key]) says: [html_encode(Z)]")
				for(var/obj/Items/Tech/Communicator/Q in M)
					if(Q.Frequency==FrequencySelector)
						M<<"<font color=green><b>([src.name])</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>([src.name])[usr]([usr.key]) says: [html_encode(Z)]")
				for(var/obj/Items/Tech/iDroid/Q in M)
					if(Q.Frequency==FrequencySelector)
						M<<"<font color=green><b>([src.name])</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>([src.name])[usr]([usr.key]) says: [html_encode(Z)]")
				for(var/obj/Skills/InternalCommunicator/B in M)
					if(B.ICFrequency==FrequencySelector)
						M<<"<font color=green><b>(Internal Comms (Freq:[B.ICFrequency]))</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>(Internal Comms (Freq: [B.ICFrequency]))[usr]([usr.key]): [html_encode(Z)]")
					if(B.MonitoringFrequency==FrequencySelector)
						M<<"<font color=green><b>(Internal Comms (Monitoring Freq:[B.MonitoringFrequency]))</b> [usr.name]: [html_encode(Z)]"
			for(var/obj/Items/Tech/Speaker/X in world)
				if(X.Frequency==FrequencySelector&&X.Active==1)
					for(var/mob/Y in hearers(X.AudioRange,X))
						Y<<"<font color=green><b>([X.name])</b> [usr.name]: [html_encode(Z)]"
		verb/CommunicatorFrequency()
			set src in usr
			if(locate(/obj/Items/Tech/EnhancementChips/Communication,src.contents))
				var/selection=input("Change frequency one (currently [src.Frequency]) or frequency two (currently [src.Frequency2]?") in list ("Frequency","Frequency2")
				if(selection=="Frequency")
					src.Frequency=input(usr,"Change your Communicator frequency to what?","Frequency",Frequency)as num
				else if(selection=="Frequency2")
					src.Frequency2=input(usr,"Change your Communicator frequency to what?","Frequency2",Frequency2)as num
			else
				Frequency=input(usr,"Change your Communicator frequency to what?","Frequency",Frequency)as num

		verb/iDroidMenu()

			var/list/options=list("Turn Off iDroid")
			options+="\[1500 GMP] Send All Fultons away"
			options+="\[5000 GMP] Request Extraction Fulton"
			options+="\[250 GMP] Request Self-Extraction Fulton"
			options+="\[25000 GMP] Request Fulton Beacon Unit"
			options+="\[2000 GMP] Request Supply Cardboard Box (Expendables)"
			options+="\[2500 GMP] Request Supply Cardboard Box (Sneaking Equipment)"
			options+="\[3000 GMP] Request Supply Cardboard Box (Combat Equipment)"
			options+="\[2500 GMP] Request Supply Cardboard Box (Restraint Equipment)"

			var/mob/clicked=input("Welcome, fellow MSF! Your current amount of GMP is [src.GMP]")in options
			if(clicked=="Turn Off iDroid")return
			if(clicked=="\[1500 GMP] Send All Fultons away")
				if(src.GMP>1500)
					src.GMP-=1500
					var/list/destination=list("Cancel")
					for(var/obj/Items/FultonBeacon/Z in world)
						destination.Add(Z)
					var/mob/Choice=input("Send all Fultons to which Beacon?")in destination
					if(Choice=="Cancel")return
					if(Choice)
						for(var/mob/Y in world)
							if(Y.Fulton==1)
								Y<<"<b>You feel the balloon suddenly expand with hotter air and lift you really high in the sky!! As you're in the middle of the sky, a helicopter passes by and rescues you-- A minute after, you're dropped off by some beacon.</b>"
								sleep(40)
								Y.loc=Choice.loc
								usr<<"[Y] gets successfully fulton'd away to [Choice]!"
								Y.Fulton=0
								Y.Frozen=0
								Y.Using=0
								Y.Flying=0
								Flight(Y)
								Y.icon_state=""
				else
					usr<<"Not enough GMP! Your current score is [src.GMP] GMP."

			if(clicked=="\[5000 GMP] Request Extraction Fulton")
				if(src.GMP>5000)
					usr.contents+=new/obj/Items/FultonBalloon
					src.GMP-=5000
					usr<<"A Fulton balloon has been generated from the bluespace and into your inventory at the cost of 5000 GMP. Have a safe use of it!"
				else
					usr<<"Not enough GMP! Your current score is [src.GMP] GMP."
			if(clicked=="\[250 GMP] Request Self-Extraction Fulton")
				if(src.GMP>250)
					usr.contents+=new/obj/Items/SelfFultonBalloon
					src.GMP-=250
					usr<<"A Self-Extraction Fulton balloon has been generated from the bluespace and into your inventory at the cost of 250 GMP. Have a safe use of it!"
				else
					usr<<"Not enough GMP! Your current score is [src.GMP] GMP."
			if(clicked=="\[25000 GMP] Request Fulton Beacon Unit")
				if(src.GMP>25000)
					usr.contents+=new/obj/Items/FultonBeacon
					src.GMP-=25000
					usr<<"A Fulton beacon has been generated from the bluespace and into your inventory at the cost of 25000 GMP. Have a safe use of it and don't forget to set a tag (rename) it in the acceptable format! (#Codeletter.Number/Location, i.e: ''#X.002/Motherbase'')"
				else
					usr<<"Not enough GMP! Your current score is [src.GMP] GMP."
			if(clicked=="\[2000 GMP] Request Supply Cardboard Box (Expendables)")return
			if(clicked=="\[2500 GMP] Request Supply Cardboard Box (Sneaking Equipment)")return
			if(clicked=="\[3000 GMP] Request Supply Cardboard Box (Combat Equipment)")return
			if(clicked=="\[2500 GMP] Request Supply Cardboard Box (Restraint Equipment)")return

/*		FultonController()
			set src in usr
			var/list/destination=list("Cancel")
			for(var/obj/Items/FultonBeacon/Z in world)
				destination.Add(Z)
			var/mob/Choice=input("Welcome, fellow MSF! Send all Fultons to which Beacon?")in destination
			if(Choice=="Cancel")return
			if(Choice)
				for(var/mob/Y in world)
					if(Y.Fulton==1)
						Y.loc=Choice.loc
						usr<<"[Y] gets fulton'd away to [Choice]!"
						spawn(30)
						Y.overlays-=image('KunaiMod/Icons/fultonrecov.dmi',pixel_y=20)
						Y.Fulton=0
						Y.Frozen=0
						Y.Using=0
						Flight(Y)
						Y.icon_state=""
					else
						return*/



	ScannerStation
		Level=15
		density=1
		TechType="ScannerTechnology"
		icon='Tech.dmi'
		icon_state="ScannerStation"
		Cost=50000
		UpgradePrice=10000
		var/LvlMultiplier=1
		var/Enhancements=0
		var/DetectShip
		var/RaditzMode=0
		var/RaditzModeName
		var/Range=40
		var/BaseBPScan=15000
		desc="The Scanner Station is a immobile device that functions similar to a scouter, but with a higher range and BP scan ability from the start. Simply standing near it is enough to have a scan tab."
		verb/Calibrate(var/mob/M in view(12))
			set src in usr
			src.RaditzModeName=M
			src.RaditzMode=(M.Base*20)
		verb/Decalibrate()
			set src in usr
			var/Choice=input("Set this station to no calibration, or Raditz Calibration?") in list("None","Raditz","Farmer","Cancel")
			switch(Choice)
				if("None")
					src.RaditzMode=0
					src.RaditzModeName=null
				if("Raditz")
					src.RaditzMode=1500
					src.RaditzModeName="Raditz"
				if("Farmer")
					src.RaditzMode=5
					src.RaditzModeName="Farmer"
				if("Cancel")
					return


	Scouter
		Level=25
		TechType="PortableScannerTechnology"
		icon='GreenScouter.dmi'
		Cost=100000
		UpgradePrice=25000
		var/LvlMultiplier=1
		var/Frequency=1
		var/Frequency2=2
		var/Enhancements=0
		var/DetectShip
		var/ScouterIcon
		var/RaditzMode=0
		var/RaditzModeName
		var/Range=25
		var/BaseBPScan=10000
		verb/UninstallUpgrades()
			set src in usr
			var/list/UpgradeInstallList=list("Cancel")
			for(var/obj/Items/Tech/ScouterUpgrades/BasicUpgrade/BU in src)
				UpgradeInstallList+=BU
			for(var/obj/Items/Tech/ScouterUpgrades/ModernUpgrade/MU in src)
				UpgradeInstallList+=MU
			for(var/obj/Items/Tech/ScouterUpgrades/AdvancedUpgrade/AU in src)
				UpgradeInstallList+=AU
			var/obj/Items/Tech/ScouterUpgrades/selection=input("Select a upgrade to uninstall.") in UpgradeInstallList
			if(selection=="Cancel")
				return
			else
				if(selection.RangeBoost)
					src:Range-=selection.RangeBoost
				if(selection.BPBoost)
					src:BaseBPScan-=selection.BPBoost
				if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
					src.LvlMultiplier-=18
					if(src.LvlMultiplier<1)
						src.LvlMultiplier=1
				else
					src.LvlMultiplier-=15
					if(src.LvlMultiplier<1)
						src.LvlMultiplier=1
				if(usr.Race=="Tsufurujin")
					src.LvlMultiplier-=2
					if(src.LvlMultiplier<1)
						src.LvlMultiplier=1
				selection.loc=usr
				usr<<"You uninstall the [selection]."
		verb/ScouterSpeak(Z as text)
			set src in usr
			var/FrequencySelector
			if(locate(/obj/Items/Tech/EnhancementChips/Communication,src.contents))
				FrequencySelector=input("Would you like to use your first frequency ([src.Frequency]) or your second ([src.Frequency2])?") in list("First","Second")
				if(FrequencySelector=="First")
					FrequencySelector=src.Frequency
				else if(FrequencySelector=="Second")
					FrequencySelector=src.Frequency2
			else
				FrequencySelector=src.Frequency
			for(var/mob/E in hearers(12,usr))
				for(var/obj/Communication/C in usr)
					E<<"<font color=[C.Text_Color]>[usr] speaks into a [src]: [html_encode(Z)]"
			for(var/mob/Players/M in world)
				for(var/obj/Items/Tech/Scouter/Q in M)
					if(Q.Frequency==FrequencySelector)
						M<<"<font color=green><b>([src.name])</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>([src.name])[usr]([usr.key]) says: [html_encode(Z)]")
				for(var/obj/Items/Tech/Communicator/Q in M)
					if(Q.Frequency==FrequencySelector)
						M<<"<font color=green><b>([src.name])</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>([src.name])[usr]([usr.key]) says: [html_encode(Z)]")
				for(var/obj/Skills/InternalCommunicator/B in M)
					if(B.ICFrequency==FrequencySelector)
						M<<"<font color=green><b>(Internal Comms (Freq:[B.ICFrequency]))</b> [usr.name]: [html_encode(Z)]"
						Log(M.ChatLog(),"<font color=green>(Internal Comms (Freq: [B.ICFrequency]))[usr]([usr.key]): [html_encode(Z)]")
					if(B.MonitoringFrequency==FrequencySelector)
						M<<"<font color=green><b>(Internal Comms (Monitoring Freq:[B.MonitoringFrequency]))</b> [usr.name]: [html_encode(Z)]"
			for(var/obj/Items/Tech/Speaker/X in world)
				if(X.Frequency==FrequencySelector&&X.Active==1)
					for(var/mob/Y in hearers(X.AudioRange,X))
						Y<<"<font color=green><b>([X.name])</b> [usr.name]: [html_encode(Z)]"
		verb/ScouterFrequency()
			set src in usr
			if(locate(/obj/Items/Tech/EnhancementChips/Communication,src.contents))
				var/selection=input("Change frequency one (currently [src.Frequency]) or frequency two (currently [src.Frequency2]?") in list ("Frequency","Frequency2")
				if(selection=="Frequency")
					src.Frequency=input(usr,"Change your Scouter frequency to what?","Frequency",Frequency)as num
				else if(selection=="Frequency2")
					src.Frequency2=input(usr,"Change your Scouter frequency to what?","Frequency2",Frequency2)as num
			else
				Frequency=input(usr,"Change your Scouter frequency to what?","Frequency",Frequency)as num
		verb/Detect()
			set src in usr
			DetectShip=input(usr,"Allow scouters to detect ships and pocket generators? 1 for ships, 2 for pocket generators, 0 for neither.","Which frequency do you wish to detect?",DetectShip)as num
		verb/Calibrate(var/mob/M in view(12))
			set src in usr
			src.RaditzModeName=M
			src.RaditzMode=(M.Base*20)
/*			var/list/playernearby=list("Cancel")
			for(var/mob/A in view(12,usr))
				A+=playernearby
			var/mob/Selection=input("Pick who to calibrate the scouter to.")in playernearby
			if(Selection=="Cancel")
				src.RaditzModeName=null
				src.RaditzMode=0
			else
				src.RaditzModeName=Selection
				src.RaditzMode=Selection.Base
				src.RaditzMode*=20*/
		verb/Decalibrate()
			set src in usr
			var/Choice=input("Set this scouter to no calibration, or Raditz Calibration?") in list("None","Raditz","Farmer","Cancel")
			switch(Choice)
				if("None")
					src.RaditzMode=0
					src.RaditzModeName=null
				if("Raditz")
					src.RaditzMode=1500
					src.RaditzModeName="Raditz"
				if("Farmer")
					src.RaditzMode=5
					src.RaditzModeName="Farmer"
				if("Cancel")
					return

/*		verb/InstallEnhancement()
			set src in usr
			var/list/enhancementchips=new("Cancel")
			for(var/obj/Items/Tech/EnhancementChips/A in usr)
				enhancementchips+=A
			var/obj/Items/Tech/EnhancementChips/selection=input("Select a chip. You'll be limited based on your intel level.")in enhancementchips
			if(selection=="Cancel")
				return
			else
				selection.loc=src*/

	ScouterUpgrades
		var/RangeBoost=0
		var/BPBoost=0
		var/ToleranceBoost=0
		icon='Tech.dmi'
		verb/InstallUpgrade()
			set src in usr
			var/list/validinstalls=new("Cancel")
			for(var/obj/Items/Tech/Scouter/S in usr)
				validinstalls+=S
			for(var/obj/Items/Tech/Scouter/S in view(1,usr))
				validinstalls+=S
			for(var/obj/Items/Tech/ScannerStation/C in usr)
				validinstalls+=C
			for(var/obj/Items/Tech/ScannerStation/C in view(1,usr))
				validinstalls+=C
			var/obj/Items/Tech/Scouter/selection=input("Pick a tech item to install the [src] into.") in validinstalls
			if(selection=="Cancel")
				return
			else
				if(istype(src,/obj/Items/Tech/ScouterUpgrades/UpgradeKits/ModernUpgradeKit))
					for(var/obj/Items/Tech/ScouterUpgrades/UpgradeKits/ModernUpgradeKit/MK in selection)
						usr<<"You can't install another Modern Kit."
						return
				if(istype(src,/obj/Items/Tech/ScouterUpgrades/UpgradeKits/AdvancedUpgradeKit))
					for(var/obj/Items/Tech/ScouterUpgrades/UpgradeKits/AdvancedUpgradeKit/AK in selection)
						usr<<"You can't install another Advanced Kit."
						return
				for(var/obj/Items/Tech/ScouterUpgrades/BasicUpgrade/BU in selection)
					if(istype(src,/obj/Items/Tech/ScouterUpgrades/BasicUpgrade)&&istype(BU,/obj/Items/Tech/ScouterUpgrades/BasicUpgrade))
						var/notice=input("You already have a basic upgrade ([BU]) installed! Would you like to replace it with [src]?") in list("Yes","No")
						if(notice=="No")
							return
						else
							if(BU.RangeBoost)
								selection:Range-=BU.RangeBoost
							if(BU.BPBoost)
								selection:BaseBPScan-=BU.BPBoost
							if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
								selection.LvlMultiplier-=18
								if(selection.LvlMultiplier<1)
									selection.LvlMultiplier=1
							else
								selection.LvlMultiplier-=15
								if(selection.LvlMultiplier<1)
									selection.LvlMultiplier=1
							if(usr.Race=="Tsufurujin")
								selection.LvlMultiplier-=2
								if(selection.LvlMultiplier<1)
									selection.LvlMultiplier=1
							BU.loc=usr
							usr<<"You uninstall the [BU]."

				for(var/obj/Items/Tech/ScouterUpgrades/ModernUpgrade/MU in selection)
					if(istype(src,/obj/Items/Tech/ScouterUpgrades/ModernUpgrade)&&istype(MU,/obj/Items/Tech/ScouterUpgrades/ModernUpgrade))
						var/notice=input("You already have a modern upgrade ([MU]) installed! Would you like to replace it with [src]?") in list("Yes","No")
						if(notice=="No")
							return
						else
							if(MU.RangeBoost)
								selection:Range-=MU.RangeBoost
							if(MU.BPBoost)
								selection:BaseBPScan-=MU.BPBoost
							if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
								selection.LvlMultiplier-=18
								if(selection.LvlMultiplier<1)
									selection.LvlMultiplier=1
							else
								selection.LvlMultiplier-=15
								if(selection.LvlMultiplier<1)
									selection.LvlMultiplier=1
							if(usr.Race=="Tsufurujin")
								selection.LvlMultiplier-=2
								if(selection.LvlMultiplier<1)
									selection.LvlMultiplier=1
							MU.loc=usr
							usr<<"You uninstall the [MU]."

				for(var/obj/Items/Tech/ScouterUpgrades/AdvancedUpgrade/AU in selection)
					if(istype(src,/obj/Items/Tech/ScouterUpgrades/AdvancedUpgrade)&&istype(AU,/obj/Items/Tech/ScouterUpgrades/AdvancedUpgrade))
						var/notice=input("You already have a modern upgrade ([AU]) installed! Would you like to replace it with [src]?") in list("Yes","No")
						if(notice=="No")
							return
						else
							if(AU.RangeBoost)
								selection:Range-=AU.RangeBoost
							if(AU.BPBoost)
								selection:BaseBPScan-=AU.BPBoost
							if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
								selection.LvlMultiplier-=18
								if(selection.LvlMultiplier<1)
									selection.LvlMultiplier=1
							else
								selection.LvlMultiplier-=15
								if(selection.LvlMultiplier<1)
									selection.LvlMultiplier=1
							if(usr.Race=="Tsufurujin")
								selection.LvlMultiplier-=2
								if(selection.LvlMultiplier<1)
									selection.LvlMultiplier=1
							AU.loc=usr
							usr<<"You uninstall the [AU]."

				if(src.RangeBoost)
					selection:Range+=src.RangeBoost
				if(src.BPBoost)
					selection:BaseBPScan+=src.BPBoost
				if(src.ToleranceBoost)
					usr<<"Surge Protectors don't work yet, not sure how you got one..."
					return
				if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
					selection.LvlMultiplier+=18
				else
					selection.LvlMultiplier+=15
				if(usr.Race=="Tsufurujin")
					selection.LvlMultiplier+=2
				src.loc=selection
				usr<<"You install the [src] in the [selection]."

		UpgradeKits
			ModernUpgradeKit
				icon_state="ModernKit"
				TechType="ModernScannerKit"
				Level=40
				Cost=150000
				RangeBoost=5
				BPBoost=5000
			AdvancedUpgradeKit
				icon_state="AdvancedKit"
				TechType="AdvancedScannerKit"
				Cost=1000000
				Level=55
				RangeBoost=25
				BPBoost=10000

		BasicUpgrade
			BasicRangeBooster
				icon_state="RangeBooster"
				Level=18
				TechType="ScannerTechnology"
				Cost=50000
				RangeBoost=10
				desc="This Basic Range booster increases Scanner/Scouter Range by 10 tiles."
			BasicBPRangeBooster
				icon_state="BPBooster"
				Level=21
				TechType="PortableScannerTechnology"
				Cost=50000
				BPBoost=2500
			BasicSurgeProtector
				icon_state="SurgeProtector"
				Level=9001
				Cost=50000
				ToleranceBoost=25
			BasicDeluxeRangebooster
				icon_state="DeluxeRangeBooster"
				Level=24
				TechType="PortableScannerTechnology"
				Cost=75000
				RangeBoost=15
				BPBoost=-1500
			BasicDeluxeBPRangeBooster
				icon_state="DeluxeBPBooster"
				Level=26
				TechType="PortableScannerTechnology"
				Cost=75000
				RangeBoost=-10
				BPBoost=4500

		ModernUpgrade
			ModernRangeBooster
				icon_state="ModernRangeBooster"
				Level=29
				TechType="ModernScannerTechnology"
				Cost=150000
				RangeBoost=25
				desc="This Modern Range booster increases Scanner/Scouter Range by 25 tiles."
			ModernBPRangeBooster
				icon_state="BPBooster"
				Level=32
				TechType="ModernScannerTechnology"
				Cost=150000
				BPBoost=7500
				desc="This Modern BP Range Booster increases the cap on how high a Scouter can scan by 7500."
			ModernSurgeProtector
				icon_state="SurgeProtector"
				Level=9001
				Cost=150000
				ToleranceBoost=50
			ModernDeluxeRangebooster
				icon_state="DeluxeModernRangeBooster"
				Level=36
				TechType="ModernScannerTechnology"
				Cost=200000
				RangeBoost=35
				BPBoost=-2500
				desc="The Deluxe Modern Range Booster increases range by 35, but BP range suffers and is reduced by 2500."
			ModernDeluxeBPRangeBooster
				icon_state="DeluxeModernBPBooster"
				Level=39
				TechType="ModernScannerTechnology"
				Cost=200000
				RangeBoost=-20
				BPBoost=10000
				desc="The Deluxe Modern BP Range Booster increases BP Range by 10,000, but Range suffers and is reduced by 20."
			ModernRangeCalculator
				icon_state="ModernRangeCalculator"
				Level=31
				TechType="ModernScannerTechnology"
				Cost=175000
				RangeBoost=10
				BPBoost=-500
				desc="The Modern Range Calculator reveals distance to those on the scouter relative to you. It also provides a small range boost, but a small hit to the cap on BP that can be detected."

		AdvancedUpgrade
			AdvancedRangeBooster
				icon_state="AdvancedRangeBooster"
				Level=42
				TechType="AdvancedScannerTechnology"
				Cost=500000
				RangeBoost=40
				desc="This Advanced Range booster increases Scanner/Scouter Range by 50 tiles."
			AdvancedBPRangeBooster
				icon_state="AdvancedBPBooster"
				Level=46
				TechType="AdvancedScannerTechnology"
				Cost=500000
				BPBoost=15000
				desc="This Advanced BP Range Booster increases the cap on how high a Scouter can scan by 15,000."
			AdvancedSurgeProtector
				icon_state="SurgeProtector"
				Level=9001
				Cost=500000
				ToleranceBoost=125

	EnhancementChips
		icon='Tech.dmi'
		var/ChipType
		verb/InstallChip()
			set src in usr
			var/list/validinstalls=new("Cancel")
			if(src.ChipType=="CommChip")
				for(var/obj/Items/Tech/Scouter/S in usr)
					validinstalls+=S
				for(var/obj/Items/Tech/Scouter/S in view(1,usr))
					validinstalls+=S
				for(var/obj/Items/Tech/Communicator/C in usr)
					validinstalls+=C
				for(var/obj/Items/Tech/Communicator/C in view(1,usr))
					validinstalls+=C
				for(var/obj/Items/Tech/ReinforcedDoor/RD in view(1,usr))
					validinstalls+=RD
				for(var/obj/Items/Tech/SecurityCamera/SC in view(1,usr))
					validinstalls+=SC
				for(var/obj/Items/Tech/DisplayConsole/DC in view(1,usr))
					validinstalls+=DC
				var/obj/Items/Tech/selection=input("Pick a tech item to install the [src] into.") in validinstalls
				if(selection=="Cancel")
					return
				if(selection:Enhancements==1&&usr.IntelligenceLevel<50)
					usr<<"You are not intelligent enough to install a second Enhancement Chip."
					return
				if(selection:Enhancements==2)
					usr<<"Only two chips can be installed at most."
					return
				if(istype(selection,/obj/Items/Tech/ReinforcedDoor)||istype(selection,/obj/Items/Tech/SecurityCamera))
					selection.Points=input("Input a frequency for the chip.")as num
				if(istype(selection,/obj/Items/Tech/DisplayConsole))
					src:Frequency=input("Input a frequency for the chip and console. Terminals will use the one on the chip.")as num
					selection:Frequency=src:Frequency
					var/Choice=input("Is this console going to be a Mainframe, or a Terminal? A Mainframe holds the code a Terminal accesses.") in list("Mainframe","Terminal")
					if(Choice=="Mainframe")
						src.ChipType="Mainframe"
					if(Choice=="Terminal")
						src.ChipType="Terminal"
				src.loc=selection
				selection:Enhancements++

			if(src.ChipType=="ScanChip")
				for(var/obj/Items/Tech/Scouter/S in usr)
					validinstalls+=S
				for(var/obj/Items/Tech/Scouter/S in view(1,usr))
					validinstalls+=S
				var/obj/Items/Tech/selection=input("Pick a tech item to install the [src] into.") in validinstalls
				if(selection=="Cancel")
					return
				if(selection:Enhancements==1&&usr.IntelligenceLevel<50)
					usr<<"You are not intelligent enough to install a second Enhancement Chip."
					return
				if(selection:Enhancements==2)
					usr<<"Only two chips can be installed at most."
					return
				src.loc=selection
				selection:Enhancements++
				selection:Range+=15

			if(src.ChipType=="SecChip")
				for(var/obj/Items/Tech/Scouter/S in usr)
					validinstalls+=S
				for(var/obj/Items/Tech/Scouter/S in view(1,usr))
					validinstalls+=S
				for(var/obj/Items/Tech/Communicator/C in usr)
					validinstalls+=C
				for(var/obj/Items/Tech/Communicator/C in view(1,usr))
					validinstalls+=C
				var/obj/Items/Tech/selection=input("Pick a tech item to install the [src] into.") in validinstalls
				if(selection=="Cancel")
					return
				if(selection:Enhancements==1&&usr.IntelligenceLevel<50)
					usr<<"You are not intelligent enough to install a second Enhancement Chip."
					return
				if(selection:Enhancements==2)
					usr<<"Only two chips can be installed at most."
					return
				src.loc=selection
				selection:Enhancements++

			if(src.ChipType=="CoinChip")
				for(var/obj/Items/Tech/DisplayConsole/DC in view(1,usr))
					validinstalls+=DC
				for(var/obj/Items/Tech/Gravity/G in view(1,usr))
					validinstalls+=G
				for(var/obj/Items/Tech/Gravity/G in usr)
					validinstalls+=G
				var/obj/Items/Tech/selection=input("Pick a tech item to install the [src] into.") in validinstalls
				if(selection=="Cancel")
					return
				if(selection:Enhancements==1&&usr.IntelligenceLevel<50)
					usr<<"You are not intelligent enough to install a second Enhancement Chip."
					return
				if(selection:Enhancements==2)
					usr<<"Only two chips can be installed at most."
					return
				if(istype(selection,/obj/Items/Tech/DisplayConsole)||istype(selection,/obj/Items/Tech/Gravity))
					selection.Points=input("Input the amount of resources this object will need to activate.")as num
					if(selection.Points==0)
						return
				src.loc=selection
				selection:Enhancements++


		Communication
			Level=30
			TechType="CommunicationTechnology"
			ChipType="CommChip"
			icon_state="CommChip"
			var/Frequency=0
			desc="This chip can add communication oriented functions to devices."
			Cost=75000
		Security
			Level=33
			TechType="SecurityTechnology"
			ChipType="SecChip"
			icon_state="SecChip"
			desc="This chip can add security oriented functions to devices."
			Cost=75000
		Scanner
			Level=36
			ChipType="ScanChip"
			icon_state="ScanChip"
			desc="This chip can add scanning oriented functions to devices. Only really useful in scouters at the moment."
			Cost=150000
		ResourceSlot
			Level=39
			ChipType="CoinChip"
			icon_state="CoinChip"
			desc="This chip can add currency oriented functions to devices."
			Cost=200000


	Doorbell
		Level=10
		TechType="CommunicationTechnology"
		Cost=20000
		icon='Tech.dmi'
		icon_state="DoorBell"
		var/Frequency=1
		var/DoorBellMessage="Ding Dong!"
		verb/Press()
			set src in oview(1)
			if(src.icon_state=="DoorBellOn")
				usr<<"Don't spam ring the doorbell. You might annoy someone!"
				return
			src.icon_state="DoorBellOn"
			spawn(30)
				src.icon_state="DoorBell"
			for(var/mob/Players/M in world)
				for(var/obj/Items/Tech/Scouter/Q in M)
					if(Q.Frequency==src.Frequency)
						M<<"<font color=cyan><b>([src.name])</b>: [html_encode(DoorBellMessage)]"
			for(var/mob/E in hearers(6,usr))
				E<<"<font color=cyan><b>([src.name])</b>: [html_encode(DoorBellMessage)]"
			for(var/obj/Items/Tech/Speaker/X in world)
				if(X.Frequency==src.Frequency&&X.Active==1)
					for(var/mob/Y in hearers(X.AudioRange,X))
						Y<<"<font color=cyan><b>([X.name]) </b>: [html_encode(DoorBellMessage)]"
		verb/DoorbellFrequency()
			set src in oview(1)
			Frequency=input(usr,"Change your doorbell frequency to what?","Frequency",Frequency)as num
		verb/ChangeDoorBellMessage(T as text)
			src.DoorBellMessage=T

	Speaker
		Level=10
		TechType="CommunicationTechnology"
		Cost=20000
		icon='Lab.dmi'
		icon_state="speaker"
		var/Frequency=1
		var/Intercom=0
		var/Active=1
		var/AudioRange=6
		verb/SpeakerFrequency()
			set src in oview(1)
			Frequency=input(usr,"Change your Speaker frequency to what?","Frequency",Frequency)as num
		verb/InputPassword()
			set src in view(1)
			if(Password)
				usr<<"This [src.name] already has a password. Disengaging interface."
			else
				Password=input("Enter the desired password.") as text
		verb/IntercomUpgrade()
			set src in oview(1)
/*			if(usr.IntelligenceLevel<20)
				usr<<"You're not intelligent enough to upgrade this into a Intercom."
				return*/
			if(Intercom==1)
				usr<<"This is already a Intercom!"
				return
			else
				src.Intercom=1
				usr<<"You have upgraded [src.name] into a Intercom."
				src.name="Intercom"
				src.icon_state="com"
		verb/ToggleIntercom()
			set src in view(1)
			set name="Toggle Intercom"
			var/PassCheck=input("Enter Password.") as text
			if(PassCheck==src.Password)
				if(src.Active==1)
					src.Active=0
					usr<<"[src.name] Deactivated."
				else if(src.Active==0)
					src.Active=1
					usr<<"[src.name] Activated."
		verb/AdjustRange()
			set src in view(1)
			var/PassCheck=input("Enter the display's password to adjust range.") as text
			if(PassCheck==src.Password)
				src.AudioRange=input("Enter audio transmission range.") as num
				if(src.AudioRange>=12)
					src.AudioRange=12
				if(src.AudioRange<=3)
					src.AudioRange=3
			else
				usr<<"Incorrect password. Disengaging interface."

	SpaceMask
		Level=10
		Cost=50000
		UpgradePrice=10000
		icon='AirMask.dmi'
		var/MaxOxygen=200
		var/Oxygen=200
		desc="A mask that helps one breathe in enviroments that have low or no oxygen. Has a limited oxygen supply, but it can be replenished and enhanced."
		verb/RestoreOxygen()
			var/FuelTotal=src.MaxOxygen-src.Oxygen
			var/RefuelConfirm=input("Would you like to reoxygenate? It'll cost [20/usr.Intelligence] per Oxygen point, for a total of [Commas(FuelTotal*(20/usr.Intelligence))].") in list("Yes","No")
			switch(RefuelConfirm)
				if("Yes")
					for(var/obj/Money/Q in usr)
						if(Q.Level<FuelTotal*(200000/usr.Intelligence))
							usr<<"You don't have enough resources."
							return
						else
							Q.Level-=FuelTotal*(200000/usr.Intelligence)
							src.Oxygen=src.MaxOxygen
							usr<<"Reoxygenization successful!"
				if("No")
					return

	NaniteIntelligenceBooster
		Level=4000
		Cost=50000000
		icon='Tech.dmi'
		icon_state="NIB"
		proc/NIB_Drink()
			if(src)
				if(usr.Intelligence>=5)
					usr<<"You're too intelligent for this to work."
					return
				if(usr.Elixer==0)
					view(usr)<<"[usr] injects themselves with a mysterious injection..."
					usr<<"The nanites flow though your body, making adjustments...but can your body survive the rapid changes?"
					usr.Intelligence=(usr.Intelligence*1.25)
					usr.Poison=10
					spawn()usr.Poisoned_Check()
					usr.Elixer=1
					del(src)
				else
					usr<<"You can't use this, you've either already used one, or have used the Elixer of Knowledge."
					return

	CloningTank
		Level=100
		Cost=100000000
		icon='Tech.dmi'
		icon_state="CloneBottom"
		var/Revive
		New()
			var/image/A=image(icon='Tech.dmi',icon_state="CloneTop",pixel_y=32)
			overlays.Remove(A)
			overlays.Add(A)
		verb/Use()
			if(Revive==usr.key)
				usr<<"This machine is already set to clone you!"
				return
			else
				Revive=usr.key
				usr<<"This machine is now set to clone you!"



	EnhanceDigger
		icon='Tech.dmi'
		var/DigMulti=1
		Shovel
			icon_state="Shovel"
			TechType="BasicTechnology"
			Level=1
			Cost=10000
			DigMulti=5
/*		HandDrill
			icon_state="HandDrill"
			Level=5
			Cost=100000
			DigMulti=10*/
/*		EnhancedHandDrill
			icon='Drill Hand 3.dmi'
			Level=20
			Cost=1250000
			DigMulti=50*/
		ModularDrillCasing
			TechType="MiningTechnology"
			var/Drillhead
			var/InstallLock=0
			icon='ModularDrill.dmi'
			icon_state="ModularDrillCasing"
			Level=10
			Cost=500000
			DigMulti=0
			verb/InstallDrillhead()
				set name="Install Drillhead"
				set src in usr
				if(Drillhead)
					usr<<"This Modular Drill already has a Drillhead installed."
					return
				else if(InstallLock==1)
					usr<<"You're already trying to install a drillhead."
					return
				else
					src.InstallLock=1
					if(!locate(/obj/Items/Tech/Drillbits,usr.contents)&&!locate(/obj/Items/Enchantment/Drillbits,usr.contents))
						usr<<"You lack a suitable drillhead to install."
						src.InstallLock=0
						return
					else
						var/list/drilllist=list("Cancel")
						for(var/obj/Items/Tech/Drillbits/A in usr)
							drilllist+=A
						for(var/obj/Items/Enchantment/Drillbits/B in usr)
							drilllist+=B
						var/obj/headselect=input("")in drilllist
						if(headselect=="Cancel")
							src.InstallLock=0
							return
						src.DigMulti+=headselect:DigMulti
						src.icon_state="Modular[headselect:Material]"
						src.Drillhead="[headselect.name]"
						src.name="Modular Drill ([headselect.name])"
						if(istype(headselect,/obj/Items/Enchantment/Drillbits/Crystal) || istype(headselect,/obj/Items/Tech/Drillbits/Diamond))
							if(headselect:EnchantType)
								src.EnchantType=headselect:EnchantType
						headselect.loc=src
						usr<<"You've successfully installed a [headselect]."

			verb/EjectDrillbit()
				set name="Eject Drillbit"
				set src in usr
				if(!Drillhead)
					usr<<"This casing lacks a drillbit."
					return
				else
					src.icon_state="ModularDrillCasing"
					for(var/obj/Items/Tech/Drillbits/A in src)
						A.loc=usr
					for(var/obj/Items/Enchantment/Drillbits/B in src)
						B.loc=usr
					src.name="Modular Drill Casing"
					src.InstallLock=0
					src.DigMulti=0
					src.Drillhead=0
					src.EnchantType=null


	Drillbits
		icon='ModularDrill.dmi'
		var/DigMulti=0
		var/Material
		Bronze
			TechType="MiningTechnology"
			icon_state="BronzeDrillbit"
			name="Bronze Drillbit"
			Level=10
			DigMulti=20
			Cost=25000
			Material="Bronze"
		Iron
			TechType="ModernMiningTechnology"
			icon_state="IronDrillbit"
			name="Iron Drillbit"
			Level=20
			DigMulti=30
			Cost=50000
			Material="Iron"
		Steel
			TechType="MaterialsTechnology"
			icon_state="SteelDrillbit"
			name="Steel Drillbit"
			Level=30
			DigMulti=40
			Cost=300000
			Material="Steel"
		Titanium
			TechType="AdvancedMiningTechnology"
			icon_state="TitaniumDrillbit"
			name="Titanium Drillbit"
			Level=45
			DigMulti=45
			Cost=600000
			Material="Titanium"
		Diamond
			icon_state="DiamondDrillbit"
			name="Diamond Drillbit"
			Level=60
			DigMulti=50
			Cost=1000000
			Material="Diamond"
			var/EnchantLock
			verb/Enchant()
				set src in oview(1)
				set name="Enchant Drillbit"
				if(usr.EnchantmentLevel<29)
					usr<<"You need at least level 30 Enchantment to enchant a drillbit of this design."
					return
				if(src.EnchantType)
					usr<<"This Drillbit is already enchanted."
					return
				if(src.EnchantLock==1)
					usr<<"You can't enchant while enchanting. Either cancel, or select a enchantment."
					return
				src.EnchantLock=1
				var/enchantselect=input("Select the enchantment type for the drillbit. This cannot be undone.") in list ("Sharpness","Chaotic","Haste","Cancel")
				switch(enchantselect)
					if("Sharpness")
						var/confirmation=input("This enchantment sharpens the tip of the drill, increasing dig multiplier by 10.")in list("Yes","No")
						if(confirmation=="Yes")
							src.DigMulti+=10
							src.EnchantType="Sharpness"
							usr<<"The drillbit seems sharper, able to cut though harder rocks..."
							return
						else
							src.EnchantLock=0
							return
					if("Chaotic")
						var/confirmation=input("This enchantment distorts the drillbit, randomizing the results from it. It may be worthwhile..")in list("Yes","No")
						if(confirmation=="Yes")
							src.EnchantType="Chaotic"
							usr<<"The drillbit seems to shift and appear somewhat differently each time you look at it..."
						else
							src.EnchantLock=0
							return
					if("Haste")
						var/confirmation=input("This enchantment reshapes the crystal to be faster. You have a small chance of gaining bonus resources!") in list ("Yes","No")
						if(confirmation=="Yes")
							src.EnchantType="Haste"
							usr<<"The drillbit seems to have changed shape to faciliate speed..."
						else
							src.EnchantLock=0
							return
					if("Destructive")
						src.EnchantType="Destructive"
						usr<<"The drillbit emits energy...caution is advised in using this!"
						src.DigMulti+=20
					if("Cancel")
						src.EnchantLock=0

	DoorPass
		Level=4
		TechType="BasicTechnology"
		Cost=1000
		desc="Holds a password for a door."
		icon='Tech.dmi'
		icon_state="DoorPass"
		Click()
			..()
			if(!(usr.client.mob in view(1,src))) return
			if(!Password)
				Password=input("What passcode?")as text
			else usr<<"Already programmed!"

	DigitalKey
		Level=20
		Cost=10000
		var/Password2
		var/Password3
		desc="Holds three passwords instead of one."
		icon='Tech.dmi'
		icon_state="DigitalKey"
		Click()
			..()
			if(!(usr.client.mob in view(1,src))) return
			if(!Password)
				Password=input("What passcode?")as text|null
			if(!Password2)
				Password2=input("Enter second password.")as text|null
			if(!Password3)
				Password3=input("Enter third password.")as text|null
			else if(Password&&Password2&&Password3)
				var/PasswordCheck=input("Enter the -first- password if you'd like to reset the Digital Key completely. Useful if you made a mistake.")as text|null
				if(PasswordCheck==null)
					return
				else if(PasswordCheck==Password)
					Password=null
					Password2=null
					Password3=null
					usr<<"All passwords reset."
				else
					usr<<"Incorrect password."

	PDA
		Level=7
		TechType="BasicTechnology"
		Cost=40000
		var/htmlq={"<html><head><title>PDA Title!</title></head><body><body bgcolor=black text=white><h1>Heading!</h1><p>Paragraph!</body></html>"}
		icon='Tech.dmi'
		icon_state="PDA"
		verb/EditPDA()
			set src in usr
			if(Password)
				var/passcheck=input("Enter the edit password.") as text
				if(passcheck==Password)
					htmlq=input(usr,"Edit!","Edit Notes",htmlq) as message
				else
					usr<<"This console is password protected. Access denied."
			else
				htmlq=input(usr,"Edit!","Edit Notes",htmlq) as message
		verb/InputPassword()
			set src in view(1)
			if(Password)
				usr<<"This console already has a password. Disengaging interface."
			else
				Password=input("Enter the desired password.") as text
		verb/View()
			set src in view(1)
			usr<<browse(htmlq,"window=PDA;size=400x400")

	DisplayConsole
		Level=8
		TechType="BasicTechnology"
		Cost=38000
		Pickable=0
		var/Enhancements=0
		var/Frequency=0
		density=1
		var/htmlq={"<html><head><title>Rebirth OS!</title></head><body><body bgcolor=black text=white><h1>Heading!</h1><p>Paragraph!</body></html>"}
		icon='techz.dmi'
		icon_state="compdown"
		verb/ConsoleModifier()
			set src in view(1)
			for(var/obj/Items/Tech/EnhancementChips/Communication/ECC in src)
				if(ECC.ChipType=="Terminal")
					usr<<"This is a Terminal Console, it cannot be edited."
					return
			if(Password)
				var/passcheck=input("Enter the edit password.") as text
				if(passcheck==Password)
					htmlq=input(usr,"Edit!","Edit Notes",htmlq) as message
				else
					usr<<"This console is password protected. Access denied."
			else
				htmlq=input(usr,"Edit!","Edit Notes",htmlq) as message
		verb/InputPassword()
			set src in view(1)
			if(Password)
				usr<<"This console already has a password. Disengaging interface."
			else
				Password=input("Enter the desired password.") as text
		Click()
			..()
			if(src.Enhancements)
				for(var/obj/Items/Tech/EnhancementChips/ResourceSlot/RSC in src)
					if(usr.key==src.CreatorKey)
						var/Choice=input("There's [Commas(src.BaseDigMulti)] resources in this! Want to take them out?") in list("Yes","No")
						if(Choice=="Yes")
							for(var/obj/Money/M in usr)
								M.Level+=src.BaseDigMulti
								src.BaseDigMulti=0
								usr<<"You withdraw the resources from the [src]!"
						if(!locate(/obj/Items/Tech/EnhancementChips/Communication,src.contents))
							usr<<browse(htmlq,"window=Console;size=400x400")
					else
						var/Choice=input("There's a slot for resources. Want to put in [Commas(src.Points)] resources to activate this?") in list("Yes","No")
						if(Choice=="No")
							return
						else if(Choice=="Yes")
							for(var/obj/Money/M in usr)
								if(M.Level<src.Points)
									usr<<"You need [src.Points] resources to activate this console."
									return
								else
									M.Level-=src.Points
									src.BaseDigMulti+=src.Points
									if(!locate(/obj/Items/Tech/EnhancementChips/Communication,src.contents))
										usr<<browse(htmlq,"window=Console;size=400x400")

				for(var/obj/Items/Tech/EnhancementChips/Communication/ECC in src)
					if(ECC.ChipType=="Terminal")
						var/MainframeFound=0
						for(var/obj/Items/Tech/DisplayConsole/DC in world)
							if(ECC.Frequency==DC.Frequency)
								for(var/obj/Items/Tech/EnhancementChips/Communication/MFC in DC)
									if(MFC.ChipType=="Mainframe")
										MainframeFound=1
										usr<<browse(DC.htmlq,"window=Console;size=400x400")
										break
						if(MainframeFound==0)
							usr<<"ERROR: No Mainframe located."
							return
					else
						usr<<browse(htmlq,"window=Console;size=400x400")
			else
				usr<<browse(htmlq,"window=Console;size=400x400")

	SecurityCamera
		Level=15
		TechType="SecurityTechnology"
		Cost=100000
		var/Enhancements=0
		Pickable=0
		var/Active=1
		var/AudioRange=6
		icon='security.dmi'
		icon_state="camera"
		verb/InputPassword()
			set src in view(1)
			if(Password)
				usr<<"This camera already has a password. Disengaging interface."
			else
				Password=input("Enter the desired password.") as text
		verb/ToggleCamera()
			set src in view(1)
			set name="Toggle Camera"
			var/PassCheck=input("Enter Password.") as text
			if(PassCheck==src.Password)
				if(src.Active==1)
					src.Active=0
					usr<<"[src.name] Deactivated."
				else if(src.Active==0)
					src.Active=1
					usr<<"[src.name] Activated."
		verb/ChangeFace()
			set src in view(1)
			set name="Change Facing"
			var/Select=input("Which way?") in list("North","North2","East","East2","South","South2","West","West2")
			switch(Select)
				if("North")
					src.dir=NORTH
				if("North2")
					src.dir=SOUTHWEST
				if("East")
					src.dir=EAST
				if("East2")
					src.dir=NORTHEAST
				if("South")
					src.dir=SOUTH
				if("South2")
					src.dir=SOUTHEAST
				if("West")
					src.dir=WEST
				if("West2")
					src.dir=NORTHWEST
		Click()
			..()
			usr.client.eye=usr

	CameraProbe
		Level=45
		Cost=5000000
		UpgradePrice=50000
		Pickable=0
		TechType="ModernSecurityTechnology"
		var/Active=1
		var/AudioRange=6
		var/who
		icon='CameraDrone.dmi'
		Del()
			if(src.who)
				var/mob/M=src.who
				if(M in world)
					src.who=null
					M.Control=null
					M.client.eye=M
			..()
		verb/InputPassword()
			set src in view(1)
			if(Password)
				usr<<"This drone already has a password. Disengaging interface."
			else
				Password=input("Enter the desired password.") as text
		verb/ToggleDrone()
			set src in view(1)
			set name="Toggle Camera"
			var/PassCheck=input("Enter Password.") as text
			if(PassCheck==src.Password)
				if(src.Active==1)
					src.Active=0
					usr<<"[src.name] Deactivated."
				else if(src.Active==0)
					src.Active=1
					usr<<"[src.name] Activated."

		Click()
			..()
			usr.client.eye=usr
			usr.Control=null
			src.who=null

	SecurityDisplay
		Level=15
		TechType="SecurityTechnology"
		Cost=150000
		Pickable=0
		var/Active=1
		var/Microphone=0
		icon='security.dmi'
		icon_state="display"
		var/AudioRange=6
		verb/InputPassword()
			set src in view(1)
			if(Password)
				usr<<"This console already has a password. Disengaging interface."
			else
				Password=input("Enter the desired password.") as text
		verb/AdjustRange()
			set src in view(1)
			var/PassCheck=input("Enter the display's password to adjust range. Range only effects audio.") as text
			if(PassCheck==src.Password)
				src.AudioRange=input("Enter audio transmission range.") as num
				if(src.AudioRange>=12)
					src.AudioRange=12
				if(src.AudioRange<=3)
					src.AudioRange=3
			else
				usr<<"Incorrect password. Disengaging interface."
		verb/ToggleMicrophone()
			set src in view(1)
			set name="Toggle Microphone"
			if(src.Microphone==1)
				src.Microphone=0
				usr<<"Microphone disabled."
			else if(src.Microphone==0)
				src.Microphone=1
				usr<<"Microphone enabled."
		verb/ViewCamera()
			set src in view(1)
			set name="View Cameras"
			var/list/availablecameras=list("Cancel")
			for(var/obj/Items/Tech/SecurityCamera/F in world)
				if(F.Password==src.Password)
					availablecameras.Add(F)
			var/obj/pickcamera=input("")in availablecameras
			if(pickcamera=="Cancel")
				usr.client.eye=usr
			else
				usr.client.eye=pickcamera
		verb/ViewDrone()
			set src in view(1)
			set name="View Drones"
			var/list/availablecameras=list("Cancel")
			for(var/obj/Items/Tech/CameraProbe/F in world)
				if(F.Password==src.Password)
					availablecameras.Add(F)
			var/obj/Items/Tech/CameraProbe/pickcamera=input("")in availablecameras
			if(pickcamera=="Cancel")
				usr.client.eye=usr
			else
				if(pickcamera.who)
					usr<<"Someone already has control of [pickcamera]!"
					return
				usr.client.eye=pickcamera
				usr.Control=pickcamera
				pickcamera.who=usr
		verb/ToggleCamera()
			set src in view(1)
			set name="Toggle Display"
			var/PassCheck=input("Enter Password.") as text
			if(PassCheck==src.Password)
				if(src.Active==1)
					src.Active=0
					usr<<"[src.name] Deactivated."
				else if(src.Active==0)
					src.Active=1
					usr<<"[src.name] Activated."

	ReinforcedDoor
		Level=50
		Cost=5000000
		icon='Vaultdoor.dmi'
		icon_state="Closed"
		var/Enhancements=0
		desc="A extremely strong and hardened door. Far more resilant to damage, but can only be opened remotely."
		density=1
		opacity=1
		New()
			if(src.name=="ReinforcedDoor")
				var/Randomnumber=rand(1,10000)
				src.name="ReinforcedDoor[Randomnumber]"
		verb/EncodePassword()
			set src in view(1)
			set name="Encode Password"
			if(src.Password)
				usr<<"This Blast Door already has a password encoded."
				return
			else
				src.Password=input("Input desired password.") as text
				if(src.Password==null)
					return
				else
					usr<<"Password set! Password is [src.Password]."
		proc/Open()
			src.density=0
			src.opacity=0
			flick("Opening",src)
			src.icon_state="Open"
			for(var/obj/Items/Tech/EnhancementChips/Communication/ECC in src)
				for(var/mob/Players/M in world)
					for(var/obj/Items/Tech/Scouter/Q in M)
						if(Q.Frequency==src.Points)
							M<<"<font color=green><b>([src.name])</b> is opening!"
//							Log(M.ChatLog(),"<font color=green>([src.name])[usr]([usr.key]) says: [html_encode(Z)]")
					for(var/obj/Items/Tech/Communicator/Q in M)
						if(Q.Frequency==src.Points)
							M<<"<font color=green><b>([src.name])</b> is opening!"
//							Log(M.ChatLog(),"<font color=green>([src.name])[usr]([usr.key]) says: [html_encode(Z)]")
					for(var/obj/Skills/InternalCommunicator/B in M)
						if(B.ICFrequency==src.Points)
							M<<"<font color=green><b>(Internal Comms) [src.name]</b> is opening!"
//							Log(M.ChatLog(),"<font color=green>(Internal Comms (Freq: [B.ICFrequency]))[usr]([usr.key]): [html_encode(Z)]")
						if(B.MonitoringFrequency==src.Points)
							M<<"<font color=green><b>(Internal Comms) [src.name]</b> is opening!"
				for(var/obj/Items/Tech/Speaker/X in world)
					if(X.Frequency==src.Points&&X.Active==1)
						for(var/mob/Y in hearers(X.AudioRange,X))
							Y<<"<font color=green><b>([src.name])</b> is opening!"
		proc/Close()
			src.density=1
			src.opacity=1
			flick("Closing",src)
			src.icon_state="Closed"


	ReinforcedRemote
		Level=50
		Cost=1000000
		icon='Vaultdoor.dmi'
		icon_state="Remote"
		desc="Opens Reinforced Doors. Can only be used while secured properly."
		verb/EncodePassword()
			set src in view(1)
			set name="Encode Password"
			if(src.Password)
				var/Passcheck=input("Input current password to reset this device.") as text
				if(src.Password!=Passcheck)
					usr<<"Incorrect password."
					return
				else
					src.Password=input("Input new password. This will be stored in the remote and sent when you use Send Password") as text
					if(src.Password==null)
						return
					else
						usr<<"Password set! Password is [src.Password]."
			else
				src.Password=input("Input password.") as text
				if(src.Password==null)
					return
				else
					usr<<"Password set! Password is [src.Password]."
		verb/OpenDoor()
			set name="Send Door Password"
			set src in view(1)
			var/list/Doorlist=list("Cancel")
			var/KeyCheck
			if(!src.Bolt)
				usr<<"The controls must be bolted!"
				return
			if(src.Password)
				for(var/obj/Items/Tech/ReinforcedDoor/A in world)
					if(A.Password==src.Password)
						Doorlist.Add(A)
				var/BlanketOpener=input("Open/close all doors with this password?") in list("Yes","No")
				if(BlanketOpener=="Yes")
					src.BlanketOpener(Doorlist)
				else if(BlanketOpener=="No")
					var/obj/PickDoor=input("") in Doorlist
					var/obj/Items/Tech/ReinforcedDoor/selecteddoor=PickDoor
					if(PickDoor=="Cancel")
						return
					else
						if(PickDoor.density==0)
							selecteddoor.Close()
						else if(PickDoor.density==1)
							selecteddoor.Open()
			else
				for(var/obj/Items/Tech/DigitalKey/X in src)
					KeyCheck=1
					for(var/obj/Items/Tech/ReinforcedDoor/A in world)
						if(A.Password==X.Password||A.Password==X.Password2||A.Password==X.Password3)
							Doorlist.Add(A)
					var/BlanketOpener=input("Open/close all doors with this password?") in list("Yes","No")
					if(BlanketOpener=="Yes")
						src.BlanketOpener(Doorlist)
					else if(BlanketOpener=="No")
						var/obj/PickDoor=input(usr,"") in Doorlist
						var/obj/Items/Tech/ReinforcedDoor/selecteddoor=PickDoor
						if(PickDoor=="Cancel")
							return
						else
							if(PickDoor.density==0)
								selecteddoor.Close()
							else if(PickDoor.density==1)
								selecteddoor.Open()
					if(KeyCheck==1)
						return
				var/Passcheck=input(usr,"Enter the password to the Blast Door(s) you wish to access.") as text
				for(var/obj/Items/Tech/ReinforcedDoor/A in world)
					if(A.Password==Passcheck)
						Doorlist.Add(A)
				var/BlanketOpener=input("Open/close all doors with this password?") in list("Yes","No")
				if(BlanketOpener=="Yes")
					src.BlanketOpener(Doorlist)
				else if(BlanketOpener=="No")
					var/obj/PickDoor=input(usr,"") in Doorlist
					var/obj/Items/Tech/ReinforcedDoor/selecteddoor=PickDoor
					if(PickDoor=="Cancel")
						return
					else
						if(PickDoor.density==0)
							selecteddoor.Close()
						else if(PickDoor.density==1)
							selecteddoor.Open()
		verb/InsertKey()
			set name="Insert Digital Key"
			set src in view(1)
			var/list/KeyList=list("Cancel")
			for(var/obj/Items/Tech/DigitalKey/B in src)
				usr<<"You must remove your key first!"
			for(var/obj/Items/Tech/DigitalKey/A in usr)
				KeyList+=A
			var/obj/PickKey=input("Select a key to insert.") in KeyList
			if(PickKey=="Cancel")
				return
			else
				var/obj/Items/Tech/DigitalKey/C=PickKey
				C.loc=src
				usr<<"You insert a [C] into the Remote."
				src.icon_state="Remote+Key"
				return
		verb/RemoveKey()
			set name="Remove Digital Key"
			set src in view(1)
			var/list/KeyList=list("Cancel")
//			for(var/obj/Items/Tech/ReinforcedRemote/A in usr)
			for(var/obj/Items/Tech/DigitalKey/B in src)
				KeyList+=B
			var/obj/PickKey=input("Select a key to Remove.") in KeyList
			if(PickKey=="Cancel")
				return
			else
				var/obj/Items/Tech/DigitalKey/C=PickKey
				C.loc=usr
				usr<<"You removed a [C] from the Remote."
				src.icon_state="Remote"
				return
		proc/BlanketOpener(var/list/Doorlist)
			var/DoorsOpened=0
			var/DoorsClosed=0
			for(var/obj/Items/Tech/ReinforcedDoor/B in Doorlist)
				if(B.density==0)
					B.Close()
					DoorsClosed++
				else if(B.density==1)
					B.Open()
					DoorsOpened++
			usr<<"Blanket Open/Close operation completed. [DoorsClosed] doors closed, [DoorsOpened] doors opened."


	Turret
		var/OffenseMultiplier=4
		var/SpeedMultiplier=4
		var/Lethal=0
		var/PointsAssigned=0
		var/key
		var/ckey="TurretCKey"
		var/Strength=500 //This is used if the gun is a Projectile Shooter.
		var/StrengthMod=3 //100xMod Strength is added to the gun's Strength per point spent.
		var/Penetration=1 //Penetration ignores a percentage of Endurance.
		var/PenetrationMod=2 //0.2xMod Penetration is added to the gun's Penetration per point spent.
		var/Force=0 //This is used if the gun is a Energy Shooter.
		var/ForceMod=3 //100xMod Force is added to the gun's Force per point spent.
		var/RPenetration=0 //RPenetration ignores a percentage of Resistance.
		var/RPenetrationMod=0 //0.2xMod RPenetration is added per point spent.
		var/Accuracy=1000 //The Offense of the gun.
		var/AccuracyMod=1.5 //1000xMod Accuracy is added per point spent.
		var/Delay=20 //This effects how often the gun can be fired.
		var/Range=10 //How far a projectile can travel in tiles. Unused currently.
		var/ProjectileSpeed=1.5 //How fast a projectile travels.
		var/Explodes=0 //If the projectile explodes on hit.
		var/Spread=0 //Spread mode uses more bullets but causes a Barrage like bullet formation.
		var/Knockbacks=0 //This will knock a victim back if a bullet connects.
		var/Elemental=0 //This will make the projectiles elementally aligned, and subject to Elemental Rules.
		var/Deviation=4 //This will cause the pixelx/y of a projectile to shift accordingly.
	//	var/Gun=1 //Tells Mystical that this is a Gun.
		var/GunType="Physical" //Tells Mystical what type of gun this is. Valid types: Physical, Energy, Ion
		var/Bullet_Icon='Bullet.dmi'
		var/Bullet_State
		Level=2300
		Cost=500000
		UpgradePrice=25000
		icon='Tech.dmi'
		icon_state="TurretBase"
		density=1
		Grabbable=0
		Pickable=0
		var/On=0
		New()
			if(src)spawn() Guard()
		Click()
			..()
			if(!(usr.client.mob in range(1,src))) return
			if(src.CreatorKey==usr.key)
				if(src.On)
					src.icon_state="TurretBase"
					src.On=0
				else
					if(!Password)
						usr<<"Set a passcode before setting the turret on!"
						return
					src.icon_state="Turret"
					src.On=1
					src.Guard()
			else
				usr<<"Only the creator can turn this on or off!"
		proc/Fire(var/mob/M)
			var/obj/Projectiles/Mystical/A=new
			A.Owner=src
			A.Gun=1
			A.GunType=GunType
			A.Damage_Multiplier=1
			A.Offense=Accuracy
			A.Power=(Strength+Force)
			A.GunBP=Lvl*Lvl*Lvl*15
			A.Penetration=Penetration
			A.RPenetration=RPenetration
			A.Knockback=Knockbacks
			A.Explosive=Explodes
			A.icon='Bullet.dmi'
			A.pixel_x=rand(-16,16)
			A.pixel_y=rand(-16,16)
			A.dir=src.dir
			A.loc=get_step(src,turn(src.dir,90))
			spawn(0.5)if(A)step_towards(A,M)
			spawn(0.6)if(A)walk(A,A.dir,ProjectileSpeed)
			spawn(0.7)if(A)step_towards(A,M)
			spawn(0.8)if(A)walk(A,A.dir,ProjectileSpeed)
			if(A)walk(A,A.dir,ProjectileSpeed)
			if(Spread)
				spawn(2) if(src)
					var/obj/Projectiles/Mystical/B=new
					B.Owner=src
					B.Gun=1
					B.GunType=GunType
					B.Damage_Multiplier=1
					B.Offense=Accuracy
					B.Power=(Strength+Force)
					B.GunBP=Lvl*Lvl*Lvl*15
					B.Penetration=Penetration
					B.RPenetration=RPenetration
					B.Knockback=Knockbacks
					B.Explosive=Explodes
					B.icon='Bullet.dmi'
					B.pixel_x=rand(-16,16)
					B.pixel_y=rand(-16,16)
					B.dir=src.dir
					B.loc=get_step(src,turn(src.dir,90))
					spawn(0.5)if(B)step_towards(B,M)
					spawn(0.6)if(B)walk(B,B.dir,ProjectileSpeed)
					spawn(0.7)if(B)step_towards(B,M)
					spawn(0.8)if(B)walk(B,B.dir,ProjectileSpeed)
					if(B)walk(B,B.dir,ProjectileSpeed)
				spawn(4) if(src)
					var/obj/Projectiles/Mystical/C=new
					C.Owner=src
					C.Gun=1
					C.GunType=GunType
					C.Damage_Multiplier=1
					C.Offense=Accuracy
					C.Power=(Strength+Force)
					C.GunBP=Lvl*Lvl*Lvl*15
					C.Penetration=Penetration
					C.RPenetration=RPenetration
					C.Knockback=Knockbacks
					C.Explosive=Explodes
					C.icon='Bullet.dmi'
					C.pixel_x=rand(-16,16)
					C.pixel_y=rand(-16,16)
					C.dir=src.dir
					C.loc=get_step(src,turn(src.dir,-90))
					spawn(0.5)if(C)step_towards(C,M)
					spawn(0.6)if(C)walk(C,C.dir,ProjectileSpeed)
					spawn(0.7)if(C)step_towards(C,M)
					spawn(0.8)if(C)walk(C,C.dir,ProjectileSpeed)
					if(C)walk(C,C.dir,ProjectileSpeed)


		proc/Guard()
			set background=1
			while(src.On)
				sleep(Delay)
				var/passcheck=0
				for(var/mob/Players/P in oview(10,src))
					passcheck=0
					for(var/obj/Items/Tech/DoorPass/Q in P)
						if(src.Password==Q.Password)
							passcheck=1
					if(passcheck==0)
						src.dir=ReturnDirection(src,P)
						spawn()flick("TurretFiring",src)
						spawn()Fire(P)
						sleep(10)
/*					else if(passcheck==1||!src.On)
						sleep(30)*/

/*		proc/Guard()
			set background=1
			while(src)
				if(On)
					src.Offense=Lvl*Lvl*100*Lvl*Lvl
					var/yes
					for(var/mob/P in oview(10,src))
						for(var/obj/Items/Tech/DoorPass/Q in P)
							if(P.Password!=Q.Password)
								continue
							else
								yes=1
								break
						if(yes)
							continue
						src.dir=ReturnDirection(src,P)
						spawn()flick("TurretFiring",src)
						spawn()Fire(P)
						sleep(rand(10,20))
						continue
					if(!yes)sleep(rand(50,70))
				else
					sleep(rand(80,100))*/

		verb/Customize_Turret()
			set src in oview(1)
			winshow(usr,"TurretCustom",0)
			winshow(usr,"TurretCustom",1)
			if(src.PointsAssigned==0)
				Points=usr.IntelligenceLevel
				src.PointsAssigned=1
			usr.Customizing=src
			usr.UpdateTurretWindow(src)

		verb/SetPassword()
			set src in oview(1)
			if(Password)
				usr<<"Password already set!"
				return
			else
				Password=input("Set a password.")as text
				ckey="[usr.key]Turret"

		verb/ResetTurret()
			set src in oview(1)
			var/Passcheck=input("Input the turret's password.")as text
			if(Passcheck==src.Password)
				src.Strength=500 //This is used if the gun is a Projectile Shooter.
				src.Penetration=1 //Penetration ignores a percentage of Endurance.
				src.Force=0 //This is used if the gun is a Energy Shooter.
				src.RPenetration=0 //RPenetration ignores a percentage of Resistance.
				src.Accuracy=1000 //The Offense of the gun.
				src.AccuracyMod=1.5
				src.Delay=20 //This effects how often the gun can be fired.
				src.Range=10 //How far a projectile can travel in tiles. Unused currently.
				src.ProjectileSpeed=1.5 //How fast a projectile travels.
				src.Explodes=0 //If the projectile explodes on hit.
				src.Spread=0 //Spread mode uses more bullets but causes a Barrage like bullet formation.
				src.Knockbacks=0 //This will knock a victim back if a bullet connects.
				src.OffenseMultiplier=4
				src.SpeedMultiplier=4
				src.PointsAssigned=0
	TurretRemote
		Level=2300
		Cost=50000
		Pickable=1
		var/Active=1
		icon='Tech.dmi'
		icon_state="SPR"
		verb/InputPassword()
			set src in usr
			Password=input("Enter the desired password.") as text

		verb/ToggleTurret()
			set src in usr
			set name="Toggle Turret"
			var/list/availableturrets=list("Cancel")
			for(var/obj/Items/Tech/Turret/G in world)
				if(G.Password==src.Password)
					availableturrets.Add(G)
			var/obj/pickturret=input("")in availableturrets
			if(pickturret=="Cancel")
				return
			else
				var/obj/Items/Tech/Turret/turretstuff=pickturret
				if(turretstuff.On==0)
					turretstuff.On=1
					turretstuff.Guard()
					turretstuff.icon_state="Turret"
				else
					turretstuff.On=0
					turretstuff.icon_state="TurretBase"

	ConveyorBelt
		Level=30
		Cost=50000
		icon='Belts.dmi'
		icon_state="conveyoroff"
		TechType="MovingTechnology"
		var/MovementSpeed=30
//		var/Direction="North"
		var/DensityOverride
		var/Active=0
		var/Remoting=0
		desc="Conveyor Belts move most objects and people placed upon them. They can be activated manually, or triggered remotely."
		verb/ToggleBelt()
			set src in view(1)
			src.BeltActivation()
/*			if(src.Active==0)
				src.Active=1
				src.Grabbable=0
				src.icon_state="conveyoron"
				usr<<"Belt activated!"
			else if(src.Active==1)
				src.Active=2
				src.Grabbable=0
				src.icon_state="conveyorreverse"
				usr<<"Belt reversed!"
			else
				src.Active=0
				src.Grabbable=1
				src.icon_state="conveyoroff"
				usr<<"Belt deactivated!"*/
		verb/SetPassword()
			set src in view(1)
			if(src.Password)
				usr<<"This belt already has a password."
				return
			src.Password=input("Input a password for this belt for remote activation.")as text|null
		verb/Direction()
			set src in view(1)
			var/Directional=input("Pick a direction.")in list("North","East","South","West")
			switch(Directional)
				if("North")
					src.dir=NORTH
				if("East")
					src.dir=EAST
				if("South")
					src.dir=SOUTH
				if("West")
					src.dir=WEST
		verb/SpeedControl()
			set src in view(1)
			var/SpeedSelect=input("Input a number. Speed is measured in BYOND ticks, so 10 is one second, 20 is two, and so on. Minimum of 20 ticks, maximum of 100")as num|null
			if(SpeedSelect==null)
				return
			src.MovementSpeed=max(20,SpeedSelect)
			src.MovementSpeed=min(src.MovementSpeed,100)
			usr<<"[src] speed set to [src.MovementSpeed]"
		New()
			spawn()
				if(src)
					src.BeltMovement()

		proc/BeltMovement()
			while(src&&src.z)
				sleep(src.MovementSpeed)
				if(src.Active==1)
					for(var/mob/M in view(0,src))
						step(M,src.dir)
					for(var/obj/M in view(0,src))
						var/BoltCheck=0
						var/obj/Items/Tech/X=M
						if(istype(M,/obj/Items/Tech))
							if(X.Bolt)
								BoltCheck=1
						if(M.Grabbable)
							BoltCheck=1
						if(M!=src&&!BoltCheck&&!istype(M,/obj/Turfs/Door))
							if(!M.density)
								M.density=1
								src.DensityOverride=1
							step(M,src.dir)
							if(src.DensityOverride)
								M.density=0
								src.DensityOverride=0
				else if(src.Active==2)
					for(var/mob/M in view(0,src))
						step(M,turn(src.dir,180))
					for(var/obj/M in view(0,src))
						var/BoltCheck=0
						var/obj/Items/Tech/X=M
						if(istype(M,/obj/Items/Tech))
							if(X.Bolt)
								BoltCheck=1
						if(M!=src&&!BoltCheck&&!istype(M,/obj/Turfs/Door))
							if(!M.density)
								M.density=1
								src.DensityOverride=1
							step(M,turn(src.dir,180))
							if(src.DensityOverride)
								M.density=0
								src.DensityOverride=0

		proc/BeltActivation()
			if(src.Active==0)
				src.Active=1
				src.Grabbable=0
				src.icon_state="conveyoron"
				if(!src.Remoting)
					usr<<"Belt activated!"
			else if(src.Active==1)
				src.Active=2
				src.Grabbable=0
				src.icon_state="conveyorreverse"
				if(!src.Remoting)
					usr<<"Belt reversed!"
			else
				src.Active=0
				src.Grabbable=1
				src.icon_state="conveyoroff"
				if(!src.Remoting)
					usr<<"Belt deactivated!"


	ConveyorControl
		Level=30
		Cost=150000
		desc="This is used to remotely toggle Conveyor Belts. It can selectively activate and deactivate them, or broadly activate many with the same password."
		verb/SetPassword()
			src.Password=input("Input a password.")as text
		verb/ToggleBelts()
			var/BeltsOn=0
			var/BeltsReverse=0
			var/BeltsOff=0
			var/Selection=input("Select a Toggle Mode.")in list("Toggle Default Sequence","Toggle only Off","Toggle only On","Toggle only Reverse")
			switch(Selection)
				if("Toggle Default Sequence")
					for(var/obj/Items/Tech/ConveyorBelt/A in world)
						if(A.Password==src.Password)
							if(A.Active==0)
								BeltsOn++
							else if(A.Active==1)
								BeltsReverse++
							else if(A.Active==2)
								BeltsOff++
							A.Remoting=1
							A.BeltActivation()
							A.Remoting=0
					usr<<"Default Sequence activated. Belts Turned On:[BeltsOn]. Belts Reversed:[BeltsReverse]. Belts Turned Off:[BeltsOff]."
				if("Toggle only Off")
					for(var/obj/Items/Tech/ConveyorBelt/A in world)
						if(A.Password==src.Password&&A.Active==0)
							BeltsOn++
							A.Remoting=1
							A.BeltActivation()
							A.Remoting=0
					usr<<"Off belts have been activated! Belts turned on:[BeltsOn]"
				if("Toggle only On")
					for(var/obj/Items/Tech/ConveyorBelt/A in world)
						if(A.Password==src.Password&&A.Active==1)
							BeltsReverse++
							A.Remoting=1
							A.BeltActivation()
							A.Remoting=0
					usr<<"On belts have been reversed! Belts reversed:[BeltsReverse]"
				if("Toggle only Reverse")
					for(var/obj/Items/Tech/ConveyorBelt/A in world)
						if(A.Password==src.Password&&A.Active==2)
							BeltsOff++
							A.Remoting=1
							A.BeltActivation()
							A.Remoting=0
					usr<<"Reversing Belts have been turned off! Belts turned of:[BeltsOff]"



	ForceFieldEmitter
		Level=45
		Cost=2000000
		UpgradePrice=500000
		TechType="ModernSecurityTechnology"
		var/Range=3
		var/Direction="North"
		var/FieldPassword
		var/FieldColor=rgb(0,0,0)
		var/Protection=0
		var/Active=0
		desc="A force field emitter. You can adjust the direction it will project a force field in a straight line, as well as the range, based on its level. You can also password lock them with two passwords: One as a broad password, and one as a specific to that field password."
		name="Force Field Emitter"
		icon='Tech.dmi'
		icon_state="FFE"
		Del()
			src.FFOff("Specific")
			..()
		verb/FFColor()
			set src in oview(1)
			set name="Field Color"
			var/rred=input("How much red?") as num
			var/ggreen=input("How much green?") as num
			var/bblue=input("How much blue?") as num
			src.FieldColor=rgb(rred,ggreen,bblue)
		verb/SetPasswords()
			set src in oview(1)
			var/Choice=alert(usr,"Choose Option","","Broad Password","Field Password","Cancel")
			switch(Choice)
				if("Broad Password")
					if(src.Password)
						var/Passcheck=input("Input password to reset.")as text|null
						if(Passcheck==null||Passcheck!=src.Password)
							usr<<"Incorrect password."
							return
						else
							src.Password=null
							usr<<"Broad Password reset!"
					else
						src.Password=input("Input password.")as text|null
						if(src.Password!=null)
							usr<<"Password accepted. Broad Password is [src.Password]"
				if("Field Password")
					if(src.FieldPassword)
						var/Passcheck=input("Input emitter password to reset.")as text|null
						if(Passcheck==null||Passcheck!=src.FieldPassword)
							usr<<"Incorrect password."
							return
						else
							src.FieldPassword=null
							usr<<"Field Password reset!"
					else
						var/FieldPasswordCheck=input("Input emitter password.")as text|null
						if(FieldPasswordCheck!=null)
/*							for(var/obj/Items/Tech/ForceFieldEmitter/X in world)
								if(X.FieldPassword==FieldPasswordCheck)
									usr<<"This password is already in use by another emitter. Field Passwords must be unique."
									return*/
							src.FieldPassword=FieldPasswordCheck
							usr<<"Password accepted. Emitter Password is [src.FieldPassword]"
		verb/Toggle()
			set src in oview(1)
			if(src.FieldPassword==null)
				usr<<"You must set a Field Password at minimum."
				return
			var/Choice=alert(usr,"Choose Option","","Broad Password","Field Password","Cancel")
			switch(Choice)
				if("Broad Password")
					var/Passcheck=input("Input the activation password.")
					if(Passcheck==src.Password)
						if(src.Active==0)
							src.FFOn()
							src.Active=1
						else if(src.Active==1)
							src.FFOff("Broad")
							src.Active=0
				if("Field Password")
					var/Passcheck=input("Input the specific field password.")
					if(Passcheck==src.FieldPassword)
						if(src.Active==0)
							src.FFOn()
							src.Active=1
						else if(src.Active==1)
							src.FFOff("Specific")
							src.Active=0
		verb/Settings()
			set src in oview(1)
			if(src.Password)
				var/Passcheck=input("Input the password to adjust settings.")
				if(Passcheck==src.Password)
					src.FFSettings()
			else if(src.FieldPassword)
				var/Passcheck=input("Input the specific field password to adjust settings.")
				if(Passcheck==src.FieldPassword)
					src.FFSettings()
			else
				src.FFSettings()

		proc/FFSettings()
			var/Choice=alert(usr,"Choose Option","","Range","Direction","Protection")
			switch(Choice)
				if("Range")
//					var/RangeCalc=round((src.Lvl/10)+3)
					var/RangeCalc=8
					if(RangeCalc>8)
						RangeCalc=8
					src.Range=input("Input a range. Minimum 3, max [RangeCalc].")as num|null
					if(src.Range==null||src.Range<3)
						src.Range=3
					if(src.Range>=RangeCalc)
						src.Range=RangeCalc
				if("Direction")
					src.Direction=input("Pick Direction.") in list("North", "South", "East", "West")
				if("Protection")
					if(src.Protection==0)
						src.Protection=1
						usr<<"Emitter will surround itself in force fields."
					else if(src.Protection==1)
						src.Protection=0
						usr<<"Emitter will not surround itself in force fields."

		proc/FFOn()
/*			var/HealthCalc=src.Lvl*src.Lvl*1000000
			var/EnduranceCalc=src.Lvl*20*/
			var/HealthCalc=50*50*1000000*Year
			var/EnduranceCalc=50*20*Year
			if(src.Protection==1)
				var/obj/Effects/ForceField/p1=new
				p1.x=src.x
				p1.y=src.y+1
				p1.z=src.z
				p1.Password=src.Password
				p1.FieldPassword=src.FieldPassword
				p1.icon+=src.FieldColor
				p1.Health=HealthCalc
				p1.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/p2=new
				p2.x=src.x+1
				p2.y=src.y+1
				p2.z=src.z
				p2.Password=src.Password
				p2.FieldPassword=src.FieldPassword
				p2.icon+=src.FieldColor
				p2.Health=HealthCalc
				p2.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/p3=new
				p3.x=src.x+1
				p3.y=src.y
				p3.z=src.z
				p3.Password=src.Password
				p3.FieldPassword=src.FieldPassword
				p3.icon+=src.FieldColor
				p3.Health=HealthCalc
				p3.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/p4=new
				p4.x=src.x+1
				p4.y=src.y-1
				p4.z=src.z
				p4.Password=src.Password
				p4.FieldPassword=src.FieldPassword
				p4.icon+=src.FieldColor
				p4.Health=HealthCalc
				p4.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/p5=new
				p5.x=src.x
				p5.y=src.y-1
				p5.z=src.z
				p5.Password=src.Password
				p5.FieldPassword=src.FieldPassword
				p5.icon+=src.FieldColor
				p5.Health=HealthCalc
				p5.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/p6=new
				p6.x=src.x-1
				p6.y=src.y-1
				p6.z=src.z
				p6.Password=src.Password
				p6.FieldPassword=src.FieldPassword
				p6.icon+=src.FieldColor
				p6.Health=HealthCalc
				p6.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/p7=new
				p7.x=src.x-1
				p7.y=src.y
				p7.z=src.z
				p7.Password=src.Password
				p7.FieldPassword=src.FieldPassword
				p7.icon+=src.FieldColor
				p7.Health=HealthCalc
				p7.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/p8=new
				p8.x=src.x-1
				p8.y=src.y+1
				p8.z=src.z
				p8.Password=src.Password
				p8.FieldPassword=src.FieldPassword
				p8.icon+=src.FieldColor
				p8.Health=HealthCalc
				p8.LogPEndurance=EnduranceCalc
			if(src.Direction=="North")
				if(src.Protection==0)
					var/obj/Effects/ForceField/n1=new
					n1.x=src.x
					n1.y=src.y+1
					n1.z=src.z
					n1.Password=src.Password
					n1.FieldPassword=src.FieldPassword
					n1.icon+=src.FieldColor
					n1.Health=HealthCalc
					n1.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/n2=new
				n2.x=src.x
				n2.y=src.y+2
				n2.z=src.z
				n2.Password=src.Password
				n2.FieldPassword=src.FieldPassword
				n2.icon+=src.FieldColor
				n2.Health=HealthCalc
				n2.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/n3=new
				n3.x=src.x
				n3.y=src.y+3
				n3.z=src.z
				n3.Password=src.Password
				n3.FieldPassword=src.FieldPassword
				n3.icon+=src.FieldColor
				n3.Health=HealthCalc
				n3.LogPEndurance=EnduranceCalc
				if(src.Range>=4)
					var/obj/Effects/ForceField/n4=new
					n4.x=src.x
					n4.y=src.y+4
					n4.z=src.z
					n4.Password=src.Password
					n4.FieldPassword=src.FieldPassword
					n4.icon+=src.FieldColor
					n4.Health=HealthCalc
					n4.LogPEndurance=EnduranceCalc
				if(src.Range>=5)
					var/obj/Effects/ForceField/n5=new
					n5.x=src.x
					n5.y=src.y+5
					n5.z=src.z
					n5.Password=src.Password
					n5.FieldPassword=src.FieldPassword
					n5.icon+=src.FieldColor
					n5.Health=HealthCalc
					n5.LogPEndurance=EnduranceCalc
				if(src.Range>=6)
					var/obj/Effects/ForceField/n6=new
					n6.x=src.x
					n6.y=src.y+6
					n6.z=src.z
					n6.Password=src.Password
					n6.FieldPassword=src.FieldPassword
					n6.icon+=src.FieldColor
					n6.Health=HealthCalc
					n6.LogPEndurance=EnduranceCalc
				if(src.Range>=7)
					var/obj/Effects/ForceField/n7=new
					n7.x=src.x
					n7.y=src.y+7
					n7.z=src.z
					n7.Password=src.Password
					n7.FieldPassword=src.FieldPassword
					n7.icon+=src.FieldColor
					n7.Health=HealthCalc
					n7.LogPEndurance=EnduranceCalc
				if(src.Range>=8)
					var/obj/Effects/ForceField/n8=new
					n8.x=src.x
					n8.y=src.y+8
					n8.z=src.z
					n8.Password=src.Password
					n8.FieldPassword=src.FieldPassword
					n8.icon+=src.FieldColor
					n8.Health=HealthCalc
					n8.LogPEndurance=EnduranceCalc

			if(src.Direction=="East")
				if(src.Protection==0)
					var/obj/Effects/ForceField/e1=new
					e1.x=src.x+1
					e1.y=src.y
					e1.z=src.z
					e1.Password=src.Password
					e1.FieldPassword=src.FieldPassword
					e1.icon+=src.FieldColor
					e1.Health=HealthCalc
					e1.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/e2=new
				e2.x=src.x+2
				e2.y=src.y
				e2.z=src.z
				e2.Password=src.Password
				e2.FieldPassword=src.FieldPassword
				e2.icon+=src.FieldColor
				e2.Health=HealthCalc
				e2.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/e3=new
				e3.x=src.x+3
				e3.y=src.y
				e3.z=src.z
				e3.Password=src.Password
				e3.FieldPassword=src.FieldPassword
				e3.icon+=src.FieldColor
				e3.Health=HealthCalc
				e3.LogPEndurance=EnduranceCalc
				if(src.Range>=4)
					var/obj/Effects/ForceField/e4=new
					e4.x=src.x+4
					e4.y=src.y
					e4.z=src.z
					e4.Password=src.Password
					e4.FieldPassword=src.FieldPassword
					e4.icon+=src.FieldColor
					e4.Health=HealthCalc
					e4.LogPEndurance=EnduranceCalc
				if(src.Range>=5)
					var/obj/Effects/ForceField/e5=new
					e5.x=src.x+5
					e5.y=src.y
					e5.z=src.z
					e5.Password=src.Password
					e5.FieldPassword=src.FieldPassword
					e5.icon+=src.FieldColor
					e5.Health=HealthCalc
					e5.LogPEndurance=EnduranceCalc
				if(src.Range>=6)
					var/obj/Effects/ForceField/e6=new
					e6.x=src.x+6
					e6.y=src.y
					e6.z=src.z
					e6.Password=src.Password
					e6.FieldPassword=src.FieldPassword
					e6.icon+=src.FieldColor
					e6.Health=HealthCalc
					e6.LogPEndurance=EnduranceCalc
				if(src.Range>=7)
					var/obj/Effects/ForceField/e7=new
					e7.x=src.x+7
					e7.y=src.y
					e7.z=src.z
					e7.Password=src.Password
					e7.FieldPassword=src.FieldPassword
					e7.icon+=src.FieldColor
					e7.Health=HealthCalc
					e7.LogPEndurance=EnduranceCalc
				if(src.Range>=8)
					var/obj/Effects/ForceField/e8=new
					e8.x=src.x+8
					e8.y=src.y
					e8.z=src.z
					e8.Password=src.Password
					e8.FieldPassword=src.FieldPassword
					e8.icon+=src.FieldColor
					e8.Health=HealthCalc
					e8.LogPEndurance=EnduranceCalc

			if(src.Direction=="South")
				if(src.Protection==0)
					var/obj/Effects/ForceField/s1=new
					s1.x=src.x
					s1.y=src.y-1
					s1.z=src.z
					s1.Password=src.Password
					s1.FieldPassword=src.FieldPassword
					s1.icon+=src.FieldColor
					s1.Health=HealthCalc
					s1.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/s2=new
				s2.x=src.x
				s2.y=src.y-2
				s2.z=src.z
				s2.Password=src.Password
				s2.FieldPassword=src.FieldPassword
				s2.icon+=src.FieldColor
				s2.Health=HealthCalc
				s2.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/s3=new
				s3.x=src.x
				s3.y=src.y-3
				s3.z=src.z
				s3.Password=src.Password
				s3.FieldPassword=src.FieldPassword
				s3.icon+=src.FieldColor
				s3.Health=HealthCalc
				s3.LogPEndurance=EnduranceCalc
				if(src.Range>=4)
					var/obj/Effects/ForceField/s4=new
					s4.x=src.x
					s4.y=src.y-4
					s4.z=src.z
					s4.Password=src.Password
					s4.FieldPassword=src.FieldPassword
					s4.icon+=src.FieldColor
					s4.Health=HealthCalc
					s4.LogPEndurance=EnduranceCalc
				if(src.Range>=5)
					var/obj/Effects/ForceField/s5=new
					s5.x=src.x
					s5.y=src.y-5
					s5.z=src.z
					s5.Password=src.Password
					s5.FieldPassword=src.FieldPassword
					s5.icon+=src.FieldColor
					s5.Health=HealthCalc
					s5.LogPEndurance=EnduranceCalc
				if(src.Range>=6)
					var/obj/Effects/ForceField/s6=new
					s6.x=src.x
					s6.y=src.y-6
					s6.z=src.z
					s6.Password=src.Password
					s6.FieldPassword=src.FieldPassword
					s6.icon+=src.FieldColor
					s6.Health=HealthCalc
					s6.LogPEndurance=EnduranceCalc
				if(src.Range>=7)
					var/obj/Effects/ForceField/s7=new
					s7.x=src.x
					s7.y=src.y-7
					s7.z=src.z
					s7.Password=src.Password
					s7.FieldPassword=src.FieldPassword
					s7.icon+=src.FieldColor
					s7.Health=HealthCalc
					s7.LogPEndurance=EnduranceCalc
				if(src.Range>=8)
					var/obj/Effects/ForceField/s8=new
					s8.x=src.x
					s8.y=src.y-8
					s8.z=src.z
					s8.Password=src.Password
					s8.FieldPassword=src.FieldPassword
					s8.icon+=src.FieldColor
					s8.Health=HealthCalc
					s8.LogPEndurance=EnduranceCalc

			if(src.Direction=="West")
				if(src.Protection==0)
					var/obj/Effects/ForceField/w1=new
					w1.x=src.x-1
					w1.y=src.y
					w1.z=src.z
					w1.Password=src.Password
					w1.FieldPassword=src.FieldPassword
					w1.icon+=src.FieldColor
					w1.Health=HealthCalc
					w1.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/w2=new
				w2.x=src.x-2
				w2.y=src.y
				w2.z=src.z
				w2.Password=src.Password
				w2.FieldPassword=src.FieldPassword
				w2.icon+=src.FieldColor
				w2.Health=HealthCalc
				w2.LogPEndurance=EnduranceCalc
				var/obj/Effects/ForceField/w3=new
				w3.x=src.x-3
				w3.y=src.y
				w3.z=src.z
				w3.Password=src.Password
				w3.FieldPassword=src.FieldPassword
				w3.icon+=src.FieldColor
				w3.Health=HealthCalc
				w3.LogPEndurance=EnduranceCalc
				if(src.Range>=4)
					var/obj/Effects/ForceField/w4=new
					w4.x=src.x-4
					w4.y=src.y
					w4.z=src.z
					w4.Password=src.Password
					w4.FieldPassword=src.FieldPassword
					w4.icon+=src.FieldColor
					w4.Health=HealthCalc
					w4.LogPEndurance=EnduranceCalc
				if(src.Range>=5)
					var/obj/Effects/ForceField/w5=new
					w5.x=src.x-5
					w5.y=src.y
					w5.z=src.z
					w5.Password=src.Password
					w5.FieldPassword=src.FieldPassword
					w5.icon+=src.FieldColor
					w5.Health=HealthCalc
					w5.LogPEndurance=EnduranceCalc
				if(src.Range>=6)
					var/obj/Effects/ForceField/w6=new
					w6.x=src.x-6
					w6.y=src.y
					w6.z=src.z
					w6.Password=src.Password
					w6.FieldPassword=src.FieldPassword
					w6.icon+=src.FieldColor
					w6.Health=HealthCalc
					w6.LogPEndurance=EnduranceCalc
				if(src.Range>=7)
					var/obj/Effects/ForceField/w7=new
					w7.x=src.x-7
					w7.y=src.y
					w7.z=src.z
					w7.Password=src.Password
					w7.FieldPassword=src.FieldPassword
					w7.icon+=src.FieldColor
					w7.Health=HealthCalc
					w7.LogPEndurance=EnduranceCalc
				if(src.Range>=8)
					var/obj/Effects/ForceField/w8=new
					w8.x=src.x-8
					w8.y=src.y
					w8.z=src.z
					w8.Password=src.Password
					w8.FieldPassword=src.FieldPassword
					w8.icon+=src.FieldColor
					w8.Health=HealthCalc
					w8.LogPEndurance=EnduranceCalc

		proc/FFOff(var/ShutdownType)
			for(var/obj/Effects/ForceField/A in world)
				if(ShutdownType=="Broad")
					if(A.Password==src.Password)
						del(A)
				else if(ShutdownType=="Specific")
					if(A.FieldPassword==src.FieldPassword)
						del(A)

	ForceFieldRemote
		icon='Tech.dmi'
		icon_state="FFRemote"
		TechType="ModernSecurityTechnology"
		Level=45
		Cost=500000
		desc="Used to toggle Force Fields. You can input broad or specific passwords."
		verb/ToggleSeperate()
//			var/Choice=alert(usr,"Choose password type.","","Broad","Specific","Cancel")
//			switch(Choice)
			var/Passcheck=input("Input specific password.")as text
			for(var/obj/Items/Tech/ForceFieldEmitter/X in world)
				if(X.FieldPassword==Passcheck)
					if(X.Active)
						for(var/obj/Effects/ForceField/A in world)
							if(A.FieldPassword==Passcheck)
								del(A)
						X.Active=0
					else
						X.FFOn("Specific")
						X.Active=1
		verb/ToggleBroad()
			var/Passcheck=input("Input broad password.")as text
			for(var/obj/Items/Tech/ForceFieldEmitter/X in world)
				if(X.Password==Passcheck)
					if(X.Active)
						for(var/obj/Effects/ForceField/A in world)
							if(A.Password==Passcheck)
								del(A)
						X.Active=0
					else
						X.FFOn("Broad")
						X.Active=1



	Cloak
		icon='Tech.dmi'
		icon_state="Cloak"
		Level=70
		TechType="Cloak"
		Cost=10000000
		verb/SetPasscode()
			set src in usr
			if(Password)
				usr<<"Password already set!"
				return
			else
				Password=input("Set a password.")as text
		verb/Use()
			set src in usr
			if(!Password)
				usr<<"Set a passcode first!"
				return
			for(var/obj/P in get_step(usr,usr.dir))
				P.CloakPasscode=src.Password
				oview(10)<<"[usr] installed the [src] onto the [P]."
				del(src)
				break

	CloakControls
		icon='Tech.dmi'
		icon_state="CloakControls"
		Level=70
		TechType="Cloak"
		Cost=100000000
		UpgradePrice=10000000
		verb/CloakSelf()
			set src in usr
			if(usr.invisibility)
				usr.invisibility=0
				usr.see_invisible=0
				usr<<"You render yourself visible!"
			else
				usr.invisibility=max(min(round(Lvl/2),99),1)
				usr.see_invisible=max(min(round(Lvl/2),99),1)
				usr<<"You render yourself into [max(min(round(Lvl/2),99),1)] level(s) of invisibility."
		verb/SetPasscode()
			set src in usr
			Password=input("Set a password.")as text
		verb/CloakObjects()
			set src in usr
			for(var/obj/Q in world)
				if(Q.CloakPasscode)
					if(Q.CloakPasscode==Password)
						Q.invisibility=min(round(Lvl/2),99)
						usr<<"[Q] cloaked!"

		verb/UnCloakObjects()
			set src in usr
			for(var/obj/Q in world)
				if(Q.CloakPasscode)
					if(Q.CloakPasscode==Password)
						Q.invisibility=0
						usr<<"[Q] un-cloaked!"
		verb/Uninstall()
			set src in usr
			for(var/obj/P in get_step(src,dir))
				if(P.CloakPasscode)
					P.invisibility=0
					var/obj/Items/Tech/e=new /obj/Items/Tech/Cloak(usr.contents)
					e.Password=P.CloakPasscode
					P.CloakPasscode=null
					oview(10)<<"[usr] uninstalled the [src] from the [P]."

/*	Frame
		Level=10
		Cost=50000
		var/Finalized=0
		var/MachineType
		var/FieldColor=rgb(255,0,0,110)
		var/FieldIconState="CustomGrav"
		var/Active=0
		var/Radius=0
		var/GravStrength=0
		layer=6
		density=1
		icon='Tech.dmi'
		icon_state="Frame"
		desc="This is a metal frame. It is used to hold parts for either a Gravity Machine, or a Simulator."
		Del()
			..()
			if(src.Active)
				src.GravOff()
		proc/GravOn(var/e)
			if(e>GetPlanetGravity(src.z))
				var/FieldColorization='Tech.dmi'
				FieldColorization+=FieldColor
				for(var/turf/z in view(src,src.Radius))
					z.overlays-=image(FieldColorization,"[FieldIconState]",layer=4)
					z.overlays+=image(FieldColorization,"[FieldIconState]",layer=4)
					z.Gravity=e
					src.Active=1
		proc/GravOff()
			var/FieldColorization='Tech.dmi'
			FieldColorization+=FieldColor
			for(var/turf/e in view(src,src.Radius))
				e.overlays-=image(FieldColorization,"[FieldIconState]",layer=4)
				e.overlays-=image(FieldColorization,"[FieldIconState]",layer=4)
				e.Gravity=null
				src.Active=0
		Click()
			..()
			if(!(usr.client.mob in oview(1,src))) return
			if(src.MachineType=="Gravity")
				var/GravitySelect=input("Select a option.")in list("Field Strength","Field Radius","Field Color","Toggle On/Off","Cancel")
				switch(GravitySelect)
					if("Field Strength")
						for(var/obj/Items/Tech/GravityParts/GravitronGenerator/A in src)
							var/FieldStrengthLimit=(A.Lvl/1.5)+10
							if(A.Lvl>=25)
								FieldStrengthLimit+=2.5
							if(A.Lvl>=50)
								FieldStrengthLimit+=2.5
							if(A.Lvl>=75)
								FieldStrengthLimit+=5
							if(A.Lvl>=100)
								FieldStrengthLimit+=5
							var/GravStrengthInput=input("Input a field strength. [FieldStrengthLimit] max.")as num
							src.GravStrength=min(GravStrengthInput,FieldStrengthLimit)
					if("Field Radius")
						if(src.Active==1)
							usr<<"You can only adjust settings while it's off."
							return
						for(var/obj/Items/Tech/GravityParts/GravityEmissor/B in src)
							var/FieldRadiusLimit=round(B.Lvl/10)+2
							var/FieldRadiusInput=input("Input a field radius. [FieldRadiusLimit] max.")as num
							src.Radius=min(FieldRadiusInput,FieldRadiusLimit)
					if("Field Color")
						if(src.Active==1)
							usr<<"You can only adjust settings while it's off."
							return
						var/RED=input("Input red amount.")as num
						var/GREEN=input("Input green amount.")as num
						var/BLUE=input("Input blue amount.")as num
						var/ALPHA=input("Input transparency. Lower numbers are more transparent, higher is more solid. Limits of 80 to 180:")as num
						if(ALPHA>180)
							ALPHA=180
						if(ALPHA<80)
							ALPHA=80
						src.FieldColor=rgb(RED,GREEN,BLUE,ALPHA)
					if("Toggle On/Off")
						if(src.Active==0)
							if(!src.GravStrength)
								for(var/obj/Items/Tech/GravityParts/GravitronGenerator/A in src)
									var/FieldStrengthLimit=(A.Lvl/1.75)+10
									if(A.Lvl>=25)
										FieldStrengthLimit+=2.5
									if(A.Lvl>=50)
										FieldStrengthLimit+=2.5
									if(A.Lvl>=75)
										FieldStrengthLimit+=5
									var/GravStrengthInput=input("Input a field strength. [FieldStrengthLimit] max.")as num
									src.GravStrength=min(GravStrengthInput,FieldStrengthLimit)
									src.GravOn(src.GravStrength)
							else
								src.GravOn(src.GravStrength)
							usr<<"Gravity activated with a field strength of [src.GravStrength] and a radius of [src.Radius]."
						else if(src.Active==1)
							for(var/turf/gt in view(src,0))
								if(gt.Gravity!=src.GravStrength&&src.GravStrength!=0)
									src.GravOff()
									src.GravOn(src.GravStrength)
									usr<<"Gravity field strength changed to [src.GravStrength]."
								else
									src.GravOff()
									usr<<"Gravity deactivated."
			else if(src.MachineType=="Simulator")
				for(var/obj/Items/Tech/SimulatorParts/HolographicEmitter/HE in src)
					var/mob/Sim/x=new
					x.icon=usr.icon
					x.overlays=usr.overlays
					x.underlays=x.underlays
					x.Energy=HE.Lvl*100*HE.Lvl
					x.EnergyMax=HE.Lvl*100*HE.Lvl
					x.Base=usr.Base
					x.Strength=usr.Strength/4
					x.Endurance=99999999999999999
					x.Speed=usr.SpeedMod*2
					x.SpeedMultiplier=usr.SpeedMultiplier
					x.SpeedMod=usr.SpeedMod*((HE.Lvl*0.05)+1)
					x.Offense=usr.Offense
					x.Defense=1
					x.Force=1
					x.Resistance=1
					x.name="[usr.name] Simulation"
					x.Owner=usr.key
					x.loc=usr.loc
					x.Warp=0
					spawn()step(x,SOUTH)
			else if(src.MachineType=="LightBox")
				if(src.Active==0)
					src.Radius=input("Input a radius, max 10.")as num
					var/RED=input("Input red amount.")as num
					var/GREEN=input("Input green amount.")as num
					var/BLUE=input("Input blue amount.")as num
					var/ALPHA=input("Input transparency. Lower numbers are more transparent, higher is more solid. Limits of 80 to 180:")as num
					if(ALPHA>180)
						ALPHA=180
					if(ALPHA<80)
						ALPHA=80
					src.FieldColor=rgb(RED,GREEN,BLUE,ALPHA)
					if(src.Radius>10)
						src.Radius=10
					src.GravOn(GetPlanetGravity(src.z)+0.1)
				else if(src.Active==1)
					src.GravOff()
		verb/InstallParts()
			if(src.Finalized)
				usr<<"This machine is finalized; you'll have to disassemble it first."
				return
			var/PartTypeSelect=input("Select a part type.")in list("Gravitron Generator","Gravity Emissor","Holographic Emitter")
			switch(PartTypeSelect)
				if("Gravitron Generator")
					var/GravitronList=list("Cancel")
					for(var/obj/Items/Tech/GravityParts/GravitronGenerator/A in src)
						usr<<"This Frame already has a Gravitron Generator installed."
						return
					for(var/obj/Items/Tech/SimulatorParts/HolographicEmitter/B in src)
						usr<<"This Frame already has a Holograhpic Emitter installed, thus, a Gravity Generator cannot be installed."
						return
					for(var/obj/Items/Tech/GravityParts/GravitronGenerator/C in usr)
						GravitronList+=C
					var/obj/Items/Tech/GravityParts/GravitronGenerator/GravitronSelect=input("Pick the Gravitron Part.")in GravitronList
					if(GravitronSelect=="Cancel")
						return
					else
						GravitronSelect.loc=src
				if("Gravity Emissor")
					var/EmissorList=list("Cancel")
					for(var/obj/Items/Tech/GravityParts/GravityEmissor/A in src)
						usr<<"This Frame already has a Gravitron Emissor installed."
						return
					for(var/obj/Items/Tech/GravityParts/GravityEmissor/C in usr)
						EmissorList+=C
					var/obj/Items/Tech/GravityParts/GravityEmissor/EmissorSelect=input("Pick the Emissor Part.")in EmissorList
					if(EmissorSelect=="Cancel")
						return
					else
						EmissorSelect.loc=src
				if("Holographic Emitter")
					var/HolographList=list("Cancel")
					for(var/obj/Items/Tech/GravityParts/GravitronGenerator/A in src)
						usr<<"This Frame already has a Gravitron Generator installed. You cannot install this part alongside it."
						return
					for(var/obj/Items/Tech/SimulatorParts/HolographicEmitter/C in usr)
						HolographList+=C
					var/obj/Items/Tech/SimulatorParts/HolographicEmitter/HolographSelect=input("Pick the Emitter Part.")in HolographList
					if(HolographSelect=="Cancel")
						return
					else
						HolographSelect.loc=src
		verb/UninstallParts()
			if(src.Finalized)
				usr<<"This machine is finalized; you'll have to disassemble it first."
				return
			if(src.Bolt)
				usr<<"This machine is bolted, you can't remove parts from it."
				return
			var/PartTypeSelect=input("Select a part type.")in list("Gravitron Generator","Gravity Emissor","Holographic Emitter")
			switch(PartTypeSelect)
				if("Gravitron Generator")
					var/GravitronCheck=0
					for(var/obj/Items/Tech/GravityParts/GravitronGenerator/A in src)
						GravitronCheck=1
						A.loc=usr
					if(GravitronCheck==0)
						usr<<"There must be a Gravitron Generator installed to actually remove it."
						return
				if("Gravity Emissor")
					var/EmissorCheck=0
					for(var/obj/Items/Tech/GravityParts/GravityEmissor/A in src)
						EmissorCheck=1
						A.loc=usr
					if(EmissorCheck==0)
						usr<<"There must be a Gravity Emissor installed to actually remove it."
						return
				if("Holographic Emitter")
					var/HoloCheck=0
					for(var/obj/Items/Tech/SimulatorParts/HolographicEmitter/A in src)
						HoloCheck=1
						A.loc=usr
					if(HoloCheck==0)
						usr<<"There must be a Holographic Emitter installed to actually remove it."
						return
		verb/FinalizeMachine()
			if(src.Finalized==1)
				usr<<"This machine is already finalized, use the Disassemble verb to undo it."
				return
			var/FinalizeConfirm=input("Finalize the machine? It'll fail (but won't cost you anything) if the correct parts aren't installed.")in list("Finalize","Cancel")
			switch(FinalizeConfirm)
				if("Finalize")
					var/PartConfirming=0
					for(var/obj/Items/Tech/GravityParts/GravitronGenerator/A in src)
						usr<<"Gravitron Generator found. Searching for Emissor."
						PartConfirming++
						for(var/obj/Items/Tech/GravityParts/GravityEmissor/B in src)
							usr<<"Gravity Emissor found. Finalizing creation of Gravity Machine."
							PartConfirming++
							src.MachineType="Gravity"
							src.Finalized=1
							src.icon='Tech.dmi'
							src.icon_state="Gravity"
							src.name="Gravity Machine (Level [A.Lvl])"
							usr<<"Gravity Machine set up succcessfully! Controls are accessed via clicking on it."
							src.desc="This is a gravity machine. Click to access controls."
							return
						if(PartConfirming==1)
							usr<<"Gravity Emissor not found!"
							return
					for(var/obj/Items/Tech/SimulatorParts/HolographicEmitter/C in src)
						usr<<"Holographic Emitter found. Searching for optional Emissor."
						PartConfirming++
						for(var/obj/Items/Tech/GravityParts/GravityEmissor/D in src)
							usr<<"Gravity Emissor found. Finalizing creation of Light Box."
							PartConfirming++
							src.MachineType="LightBox"
							src.Finalized=1
							src.icon='Tech.dmi'
							src.icon_state="LightBox"
							src.name="Light Box"
							usr<<"Light Box set up successfully! Controls are accessed via clicking on it."
							src.desc="This is a Light Box."
							return
						if(PartConfirming==1)
							usr<<"No Emissor found. Finalizing creation of Simulator."
							src.MachineType="Simulator"
							src.Finalized=1
							src.icon='Lab.dmi'
							src.icon_state="computer"
							src.name="Simulator (Level [C.Lvl])"
							usr<<"Simulator set up successfully! Controls are accessed via clicking on it."
							src.desc="This is a Simulator. Click to access controls."
							return
					if(PartConfirming==0)
						usr<<"Key parts for machine setup missing!"
						return
				if("Cancel")
					return
		verb/Disassemble()
			if(src.Active==1)
				usr<<"You have to turn it off first."
				return
			if(src.Bolt)
				usr<<"You have to unbolt it first."
				return
			var/DisassembleConfirm=input("Really disassemble? This will unfinalize the machine.")in list("Confirm","Cancel")
			switch(DisassembleConfirm)
				if("Confirm")
					src.Finalized=0
					src.name="Frame"
					src.MachineType=null
					src.icon='Tech.dmi'
					src.icon_state="Frame"
					usr<<"Machine reverted into frame! You may uninstall parts now."
					src.desc="This is a metal frame. It is used to hold parts for either a Gravity Machine, or a Simulator."
				if("Cancel")
					return


	SimulatorParts
		HolographicEmitter
			Level=10
			Cost=25000
			UpgradePrice=25000
			icon='Tech.dmi'
			icon_state="HoloEmitter"
			desc="This is a Holograhpic Emitter, a key part in a Simulator."

	GravityParts
		GravitronGenerator
			Level=40
			Cost=25000000
			UpgradePrice=600000
			icon='Tech.dmi'
			icon_state="GravGenerator"
			desc="This is a Gravitron Generator, a key part in a Gravity Machine that controls the strength of a Gravity Field. Install this into a frame along with a Gravity Emissor."

		GravityEmissor
			Level=40
			Cost=10000000
			UpgradePrice=250000
			icon='Tech.dmi'
			icon_state="Emissor"
			desc="This is a Gravity Emissor, a key part in a Gravity Machine that controls the radius of a Gravity Field. Install this into a Frame along with a Gravitron Generator."
*/
	Gravity
		Del()
			src.GravOff()
			..()
		icon='Tech.dmi'
		icon_state="Gravity"
		layer=5
		density=1
		Level=4000
		Cost=25000000
		UpgradePrice=500000
		var/FieldColor=rgb(255,0,0,110)
		var/FieldIconState="CustomGrav"
		var/Active=0
		var/Radius=0
		var/GravStrength=0
		var/Enhancements=0
		proc/GravOn(var/e)
			if(e>GetPlanetGravity(src.z))
				var/FieldColorization='Tech.dmi'
				FieldColorization+=FieldColor
				for(var/turf/z in view(src,src.Radius))
					z.overlays-=image(FieldColorization,"[FieldIconState]",layer=4)
					z.overlays+=image(FieldColorization,"[FieldIconState]",layer=4)
					z.Gravity=e
					src.Active=1
		proc/GravOff()
			var/FieldColorization='Tech.dmi'
			FieldColorization+=FieldColor
			for(var/turf/e in view(src,src.Radius))
				e.overlays-=image(FieldColorization,"[FieldIconState]",layer=4)
				e.overlays-=image(FieldColorization,"[FieldIconState]",layer=4)
				e.Gravity=null
				src.Active=0
		Click()
			..()
			if(!(usr.client.mob in oview(1,src))) return
			var/GravitySelect=input("Select a option.")in list("Field Strength","Field Radius","Field Color","Toggle On/Off","Cancel")
			switch(GravitySelect)
				if("Field Strength")
					var/FieldStrengthLimit=(src.Lvl/1.75)+10
					if(src.Lvl>=25)
						FieldStrengthLimit+=2.5
					if(src.Lvl>=50)
						FieldStrengthLimit+=2.5
					if(src.Lvl>=75)
						FieldStrengthLimit+=5
					if(src.Lvl>=100)
						FieldStrengthLimit+=5
					var/GravStrengthInput=input("Input a field strength. [FieldStrengthLimit] max.")as num
					src.GravStrength=min(GravStrengthInput,FieldStrengthLimit)
				if("Field Radius")
					if(src.Active==1)
						usr<<"You can only adjust settings while it's off."
						return
					var/FieldRadiusLimit=round(src.Lvl/10)+2
					var/FieldRadiusInput=input("Input a field radius. [FieldRadiusLimit] max.")as num
					src.Radius=min(FieldRadiusInput,FieldRadiusLimit)
				if("Field Color")
					if(src.Active==1)
						usr<<"You can only adjust settings while it's off."
						return
					var/RED=input("Input red amount.")as num
					var/GREEN=input("Input green amount.")as num
					var/BLUE=input("Input blue amount.")as num
					var/ALPHA=input("Input transparency. Lower numbers are more transparent, higher is more solid. Limits of 90 to 180:")as num
					if(ALPHA>180)
						ALPHA=180
					if(ALPHA<90)
						ALPHA=90
					src.FieldColor=rgb(RED,GREEN,BLUE,ALPHA)
				if("Toggle On/Off")
					if(!src.z)
						usr<<"You can't turn this on while it's in your pocket."
						return
					if(src.Active==0)
						for(var/obj/Items/Tech/EnhancementChips/ResourceSlot/RSC in src)
							if(usr.key==src.CreatorKey)
								var/Choice=input("There's [Commas(src.BaseDigMulti)] resources in this! Want to take them out?") in list("Yes","No")
								if(Choice=="Yes")
									for(var/obj/Money/M in usr)
										M.Level+=src.BaseDigMulti
										src.BaseDigMulti=0
										usr<<"You withdraw the resources from the [src]!"
							else
								var/Choice=input("There's a slot for resources. The display on the [src] requests [src.Points] resources to be inserted to activate it.") in list("Yes","No")
								if(Choice=="No")
									return
								else if(Choice=="Yes")
									for(var/obj/Money/M in usr)
										if(M.Level<src.Points)
											usr<<"You need [src.Points] resources to activate this console."
											return
										else
											M.Level-=src.Points
											src.BaseDigMulti+=src.Points

						if(!src.GravStrength)
							var/FieldStrengthLimit=(src.Lvl/1.75)+10
							if(src.Lvl>=25)
								FieldStrengthLimit+=2.5
							if(src.Lvl>=50)
								FieldStrengthLimit+=2.5
							if(src.Lvl>=75)
								FieldStrengthLimit+=5
							var/GravStrengthInput=input("Input a field strength. [FieldStrengthLimit] max.")as num
							src.GravStrength=min(GravStrengthInput,FieldStrengthLimit)
							src.GravOn(src.GravStrength)
						else
							src.GravOn(src.GravStrength)
						usr<<"Gravity activated with a field strength of [src.GravStrength] and a radius of [src.Radius]."
					else if(src.Active==1)
						for(var/turf/gt in view(src,0))
							if(gt.Gravity!=src.GravStrength&&src.GravStrength!=0)
								src.GravOff()
								src.GravOn(src.GravStrength)
								usr<<"Gravity field strength changed to [src.GravStrength]."
							else
								src.GravOff()
								usr<<"Gravity deactivated."

	Moon
		Level=33
		Cost=2500000
		icon='Moon.dmi'
		verb/Use()
			set src in oview(1)
			var/obj/ProjectionMoon/Q=new(src.loc)
			Q.Skill=15000/4
			del(src)
	Emitter
		name="EMITTER?!"
		Level=125
		Cost=400000000
		icon='Moon.dmi'
		verb/Use()
			set src in oview(1)
			var/obj/Emitter/Q=new(src.loc)
			Q.Skill=15000/4
			del(src)


	TeleportPad
		var/Uni
		icon='Tech.dmi'
		icon_state="TeleportPad"
		Level=50
		TechType="Teleport"
		Cost=2000000
		UpgradePrice=20000000
		verb/SetPasscode()
			set src in oview(1)
			if(Password)
				usr<<"This is already programmed!"
				return
			else
				Password=input("Input a passcode for this specific pad.")as text
		verb/Use()
			set src in oview(1)
			var/list/blah=list("Nevermind")
			for(var/obj/Items/Tech/TeleportPad/E in world)
				if(E.Password==src.Password&&E.z)
					if(E.z!=src.z&&!src.Uni)continue
					blah.Add(E)
			var/obj/e=input("")in blah
			if(e=="Nevermind")
				usr.loc=usr.loc
			else
				usr.loc=e.loc

	TeleportWatch
		var/Uni
		icon='Tech.dmi'
		icon_state="TeleportWatch"
		Level=50
		TechType="Teleport"
		Cost=50000000
		UpgradePrice=20000000
		verb/SetPasscode()
			set src in usr
			Password=input("Input a password for this watch to link up with other teleporter pads")as text
		verb/Use()
			set src in usr
			var/list/blah=list("Nevermind")
			for(var/obj/Items/Tech/TeleportPad/E in world)
				if(E.Password==src.Password&&E.z)
					if(E.z!=usr.z&&!src.Uni)continue
					blah.Add(E)
			var/obj/e=input("")in blah
			if(e=="Nevermind")
				usr.loc=usr.loc
				return
			else
//				if(src.Lvl<5000)
//					usr<<"Not enough power in the watch to teleport safely!"
//					return
				sleep(50)
				if(!usr.KO)
					usr<< "You have successfully teleported!"
					usr.loc=e.loc
//					src.Lvl-=5000
				else
					usr<< "Your teleport device has malfunctioned!"
					usr.loc=usr.loc
/*		verb/ChargeWatch()
			var/Price
			var/Amount=input("Charge the watch's battery? It costs [50/usr.Intelligence] per battery point.") as num
			Price=(Amount*(50/usr.Intelligence))
			for(var/obj/Money/M in usr)
				if(M.Level>=Price)
					M.Level-=Price
					src.Lvl=Amount
					src.suffix="[Commas(src.Lvl)] Battery"
					usr<<"[usr] charged [src]'s battery to [Amount]."
				else
					usr<<"You don't have enough resources for that."
					return*/

	SpacePodRemote
		icon='Tech.dmi'
		icon_state="SPR"
		Level=2000
		Cost=10000000
		var/LastTime
		verb/SetPassword()
			set src in usr
			Password=input("Set a password.")as text

		verb/ProgramPod()
			set src in usr
			for(var/obj/Items/Tech/SpaceTravel/SpacePod/P in get_step(usr,usr.dir))
				if(!P.Password)
					P.Password=input(usr,"What passcode?")as text
					view(10)<<"[usr] programmed the spacepod."
				else
					usr<<"This pod is already programmed!"
		verb/Use()
			set src in usr
			usr<<"DISABLED"
			return
			if(src.LastTime)
				if(src.LastTime>world.realtime+300)
					usr<<"You must wait 30 seconds before using this again!"
					return
			if(!src.Password)
				usr<<"You have to set a passcode first!"
				return
			src.LastTime=world.realtime
			for(var/obj/Items/Tech/SpaceTravel/SpacePod/Q in world)
				if(Q.Password==src.Password)
					if(Q.Remoting)
						usr<<"[Q] is already being called!"
						continue
					if(Q.z!=usr.z)
						usr<<"...[Q] is not on this planet."
						break
					if(Q.x==usr.x)
						if(Q.y==usr.y-1)
							usr<<"[Q] is already here!"
							break
					usr<<"Attemping to call: [Q]....this will only work if there is open space between you and the pod."
					Q.Remoting=1
					Q.density=0
					var/turf/destination = locate(usr.x,usr.y-1,usr.z)
					if(destination)
						Q.move_to(destination, 3)
					else
						usr<<"Your signal has failed! Go outside or somewhere where your pod can reach you!"
				Q.Remoting = null
				Q.density=1

	SpacePodRemoteControl
		icon='Tech.dmi'
		icon_state="SPR"
		Level=45
		Cost=10000000
		desc="Lets you remote control a pod."
		verb/SetPassword()
			set src in usr
			Password=input("Set a password.")as text

		verb/ProgramPod()
			set src in usr
			for(var/obj/Items/Tech/SpaceTravel/SpacePod/P in get_step(usr,usr.dir))
				if(!P.Password)
					P.Password=input(usr,"What passcode?")as text
					view(10)<<"[usr] programmed the spacepod."
				else
					usr<<"This pod is already programmed!"

		verb/ControlPod()
			set src in usr
			for(var/obj/Items/Tech/SpaceTravel/SpacePod/P in world)
				if(src.Password==P.Password)
					if(!P.who)
						usr<<"No one is driving the pod. Patching into control systems."
						usr.Control=P
//						usr<<"DEBUG: User Control variable set to [usr.Control]"
						usr.client.eye=P
//						usr<<"DEBUG: Setting client eye to [P]"
						P.who=usr
//						usr<<"DEBUG: Setting pod who variable to [P.who]"
					else
						usr<<"Someone is actively driving. Unable to patch into controls."
						return

		verb/OverrideBolts()
			set src in usr
			for(var/obj/Items/Tech/SpaceTravel/SpacePod/P in world)
				if(src.Password==P.Password&&P.Bolt)
					usr<<"Releasing bolts on [P]."
					P.Bolt=0

		verb/RemoteLaunch()
			set src in usr
			for(var/obj/Items/Tech/SpaceTravel/SpacePod/P in world)
				if(src.Password==P.Password)
					if(P.Bolt)
						usr<<"Pod is bolted."
						return
					else
						if(P.z==2)return

						if(global.SpaceTravel==0)
							usr<<"You cannot use this at this time!"
							return

						if(P.z==1||P.z==2||P.z==3||P.z==4||P.z==5||P.z==6||P.z==7||P.z==8||P.z==9||P.z==14||P.z==18)
							if(P.Launching)
								return
							P.Launching=1
							if(locate(/obj/Items/Tech/SpaceTravelParts/Misc/EngineBooster,P.contents))
								usr<<"[P] will launch in 20 seconds!"
								sleep(200)
							else if(locate(/obj/Items/Tech/SpaceTravelParts/Misc/SubspaceRefractor,P.contents))
								usr<<"[P] will launch in 15 seconds!"
								sleep(150)
							else
								usr<<"[P] will launch in 30 seconds!"
								sleep(300)
							P.Launching=0
							for(var/obj/Planets/x in world)
								if(x.Zz==P.z)
									P.loc=x.loc
									return
							P.loc=locate(250,250,2)
							usr<<"There was a launching error. [P] was sent to 250,250,2."

	PodWatcher
		icon='Lampost and chairs.dmi'
		icon_state="Tv"
		Level=25
		Cost=500000
		desc="Can tap into the camera systems of any pod linked to it."
		verb/Configure()
			set src in oview(1)
			if(src.Password)
				var/passcheck=input("Input the password to configure the Pod Watcher.")as text
				if(passcheck==src.Password)
					usr<<"Password correct."
					src.Password=input("Input the new password, this will be what is used to determine which pods are watchable.")as text
			else
				src.Password=input("Input the password, this will be what is used to determine which pods are watchable.")as text
		verb/WatchPod()
			set src in oview(1)
			var/list/ValidPods=list("Cancel")
			for(var/obj/Items/Tech/SpaceTravel/ST in world)
				if(ST.Password==src.Password)
					ValidPods+=ST
			var/selection=input("Select the pod you wish to view.")in ValidPods
			if(selection=="Cancel")
				return
			else
				usr.client.eye=selection

	Beacon
		icon='Tech.dmi'
		icon_state="beaconon"
		Level=35
		TechType="ModernCommunicationTechnology"
		Cost=250000
		var/BeaconState="On"
		verb/ToggleBeacon()
			set src in oview(1)
			if(src.BeaconState=="On")
				src.BeaconState="Off"
				src.icon_state="beaconoff"
				usr<<"You've turned off the Beacon."
				return
			else
				src.BeaconState="On"
				src.icon_state="beaconon"
				usr<<"You've turned on the Beacon."
				return



	SpaceTravel
		Bump(mob/A)
			..()
			PlanetEnterBump(A,src)
			TeleporterBump(A,src)



		var/Navigation=0
		var/Airship=0
		var/Launching=0
		var/DoorPass
		var/DoorPass2
		var/DoorPass3
		var/mob/who
		var/Fuel=10
		var/MaxFuel=500
		var/FuelUsage=1
		var/MaxSpeed=2
		var/Moving=0
		var/FireLock=0
		var/MiscLimit=1
		var/Range=50
		var/BaseBPScan=20000
		var/Strength=4000
		var/Endurance=2500
		var/Force=4000
		var/Resistance=2500
		var/Penetration=1
		var/RPenetration=1
		Offense=2500
		var/Defense=2500
		Speed=1
		proc/WeaponSystem()
			if(src.FireLock)
				return
			if(locate(/obj/Items/Tech/SpaceTravelParts/Weapons,src.contents))
				for(var/obj/Items/Tech/SpaceTravelParts/Weapons/W in src)
					var/obj/Projectiles/Mystical/A=new
					A.Owner=src
					A.Lethality=usr.Lethal
					if(W.DamageType=="Physical")
						A.Power=(src.Strength)
					if(W.DamageType=="Energy")
						A.Power=(src.Force)
					A.Penetration=Penetration
					A.RPenetration=RPenetration
					A.Damage_Multiplier=W.DamageMultiplier
					A.Offense=(usr.Offense)
					A.Knockback=0
					A.Explosive=0
					A.Gun=1
					A.GunBP=src.Lvl*1.1
					A.GunType=W.DamageType
					A.Deflectable=1
					A.Dodgeable=1
					A.icon=W.icon
					A.icon_state=W.icon_state
	//				A.icon_state=8
					A.pixel_x=rand(-3,3)
					A.pixel_y=rand(-3,3)
					A.loc=get_step(src,src.dir)
					A.dir=src.dir
//					A.loc=src.loc
					walk(A,A.dir,20/W.FireSpeed)
					src.FireLock=1
					spawn(50/W.FireRate)
						src.FireLock=0
			else
				return
			sleep(1)


		Click()
			..()
			if(who==usr)
				if(locate(/obj/Items/Tech/SpaceTravelParts/Misc/WormholeGenerator,src.contents))
					var/Selection=input("Do you want to release control, or engage the Wormhole Generator? The Generator can only be used in space.")in list("Release Control","Wormhole Generator")
					switch(Selection)
						if("Release Control")
							usr.Control=null
							usr.client.eye=usr
							src.who=null
						if("Wormhole Generator")
							if(global.JinxMap)
								if(src.z!=10)
									usr<<"You can't engage this in atmosphere."
									return
							else
								if(src.z!=2)
									usr<<"You can't engage this in atmosphere."
									return
							if(src.Fuel<1500)
								usr<<"You don't have enough fuel."
								return
							var/Confirm=input("Are you sure? This will drain a significant portion of your fuel, regardless of destination or distance.") in list("Yes","No")
							switch(Confirm)
								if("Yes")
									var/list/planetlist=list("Cancel")
									for(var/obj/Planets/A in world)
										planetlist+=A
									var/obj/Planets/PlanetSelect=input("Select a planet.")in planetlist
									usr<<"Engaging Wormhole Generator. Destination: [PlanetSelect]."
									sleep(10)
									src.loc=PlanetSelect
									src.Fuel-=1500
								if("No")
									return
				else
					usr.Control=null
					usr.client.eye=usr
					src.who=null
			if(usr.client.eye==src&&who!=usr)
				usr.client.eye=usr
		Del()
			if(src.who)
				var/mob/M=src.who
				if(M in world)
					M.loc=src.loc
					src.who=null
					M.Control=null
					M.client.eye=M
			..()
		Move()
			var/turf/Former_Location=src.loc
			if(Bolt)
				return
			if(Moving)
				return
			if(Fuel<=0)
				Fuel=0
				if(!locate(/obj/Items/Tech/SpaceTravelParts/Misc/EmergencySail,src.contents))
					return
			else
				..()
			if(src.type in typesof(/obj/Items/Tech/SpaceTravel/Boat))
				if(!(src.loc.type in typesof(/turf/Waters))&&!(src.loc.type in typesof(/turf/Special)))
					if(!src.Airship)
						src.loc=Former_Location
						return

			Moving=1
			if(locate(/obj/Items/Enchantment/SpaceTravelParts/Engines/CrystalManaDriver,src.contents))
				var/obj/Effects/Sparkles/a=new
				a.x=src.x
				a.y=src.y
				a.z=src.z
			if(locate(/obj/Items/Tech/SpaceTravelParts/Engines/Nuclear,src.contents))
				if(src.z!=2||src.z!=3)
					Fuel-=(FuelUsage/0.5)
					spawn(17/(src.MaxSpeed/2))
						Moving=0
				else
					Fuel-=(FuelUsage)
					spawn(17/src.MaxSpeed)
						Moving=0
			else if(locate(/obj/Items/Tech/SpaceTravelParts/Engines/Jet,src.contents))
				if(src.z==2||src.z==3)
					Fuel-=(FuelUsage/0.5)
					spawn(17/(src.MaxSpeed/2))
						Moving=0
				else
					Fuel-=(FuelUsage)
					spawn(17/src.MaxSpeed)
						Moving=0
			else
				Fuel-=(FuelUsage)
				if(src.Fuel>0)
					spawn(17/src.MaxSpeed)
						Moving=0
				else if(locate(/obj/Items/Tech/SpaceTravelParts/Misc/EmergencySail,src.contents))
					spawn(100/src.MaxSpeed)
						Moving=0
		verb/InstallParts()
			set src in oview(1)
			var/PartTypeSelect=input("Pick part type.") in list("Weapon", "Engine", "Misc", "Cancel")
			switch(PartTypeSelect)
				if("Weapon")
					var/list/WeaponList=list("Cancel")
					for(var/obj/Items/Tech/SpaceTravelParts/Weapons/Z in src)
						usr<<"You must remove the currently installed Engine first."
						return
					for(var/obj/Items/Tech/SpaceTravelParts/Weapons/A in usr)
						WeaponList.Add(A)
					var/obj/Items/Tech/SpaceTravelParts/Weapons/pickpart=input("")in WeaponList
					if(pickpart=="Cancel")
						return
					else
						src.MaxSpeed*=pickpart.SpeedModification
						src.FuelUsage*=pickpart.FuelUsageModification
						src.MaxFuel+=pickpart.MaxFuelModification
						pickpart.loc=src
						usr<<"You have successfully installed a [pickpart] (Weapon) into the [src]."
				if("Engine")
					var/list/EngineList=list("Cancel")
					for(var/obj/Items/Tech/SpaceTravelParts/Engines/Z in src)
						usr<<"You must remove the currently installed Engine first."
						return
					for(var/obj/Items/Tech/SpaceTravelParts/Engines/A in usr)
						EngineList.Add(A)
					for(var/obj/Items/Enchantment/SpaceTravelParts/Engines/B in usr)
						EngineList.Add(B)
					var/obj/Items/Tech/SpaceTravelParts/Engines/pickpart=input("")in EngineList
					if(pickpart=="Cancel")
						return
					else
						src.MaxSpeed*=pickpart.SpeedModification
						src.FuelUsage*=pickpart.FuelUsageModification
						src.MaxFuel+=pickpart.MaxFuelModification
						pickpart.loc=src
						usr<<"You have successfully installed a [pickpart] (Engine) into the [src]."
				if("Misc")
					var/MiscCounter=0
					var/list/MiscList=list("Cancel")
					for(var/obj/Items/Tech/SpaceTravelParts/Misc/Z in src)
						MiscCounter++
					if(MiscCounter>=src.MiscLimit)
						usr<<"This vessel cannot hold more parts!"
						return
					for(var/obj/Items/Tech/SpaceTravelParts/Misc/A in usr)
						MiscList.Add(A)
					for(var/obj/Items/Enchantment/SpaceTravelParts/Misc/B in usr)
						MiscList.Add(B)
					var/obj/Items/Tech/SpaceTravelParts/Misc/pickpart=input("")in MiscList
					if(pickpart=="Cancel")
						return
					else
						if(istype(pickpart,/obj/Items/Enchantment/SpaceTravelParts/Misc))
							var/obj/Items/Enchantment/SpaceTravelParts/Misc/enchantpartoverride=pickpart
							src.MaxSpeed*=enchantpartoverride.SpeedModification
							src.FuelUsage*=enchantpartoverride.FuelUsageModification
							src.MaxFuel+=enchantpartoverride.MaxFuelModification
						else
							src.MaxSpeed*=pickpart.SpeedModification
							src.FuelUsage*=pickpart.FuelUsageModification
							src.MaxFuel+=pickpart.MaxFuelModification
						pickpart.loc=src
						usr<<"You have successfully installed a [pickpart] (Misc) into the [src]."
		verb/UninstalParts()
			set src in oview(1)
			var/PartTypeSelect=input("Pick part type.") in list("Weapon","Engine", "Misc", "Cancel")
			switch(PartTypeSelect)
				if("Weapon")
					var/WeaponCheck=0
					for(var/obj/Items/Tech/SpaceTravelParts/Weapons/Z in src)
						WeaponCheck=1
						src.MaxSpeed/=Z.SpeedModification
						src.FuelUsage/=Z.FuelUsageModification
						src.MaxFuel-=Z.MaxFuelModification
						Z.loc=usr
						usr<<"You have successfully uninstalled a [Z] (Weapon) from the [src]."
					if(WeaponCheck==0)
						usr<<"You must actually have a weapon installed in the [src] before you can remove one."
						return
				if("Engine")
					var/EngineCheck=0
					for(var/obj/Items/Tech/SpaceTravelParts/Engines/Z in src)
						EngineCheck=1
						src.MaxSpeed/=Z.SpeedModification
						src.FuelUsage/=Z.FuelUsageModification
						src.MaxFuel-=Z.MaxFuelModification
						Z.loc=usr
						usr<<"You have successfully uninstalled a [Z] (Engine) from the [src]."
					if(EngineCheck==0)
						usr<<"You must actually have a engine installed in the [src] before you can remove one."
						return
				if("Misc")
					var/MiscCheck=0
					for(var/obj/Items/Tech/SpaceTravelParts/Misc/Z in src)
						MiscCheck=1
						src.MaxSpeed/=Z.SpeedModification
						src.FuelUsage/=Z.FuelUsageModification
						src.MaxFuel-=Z.MaxFuelModification
						Z.loc=usr
						usr<<"You have successfully uninstalled a [Z] (Misc) from the [src]."
					for(var/obj/Items/Enchantment/SpaceTravelParts/Misc/Y in src)
						MiscCheck=1
						src.MaxSpeed/=Y.SpeedModification
						src.FuelUsage/=Y.FuelUsageModification
						src.MaxFuel-=Y.MaxFuelModification
						Y.loc=usr
						usr<<"You have successfully uninstalled a [Y] (Misc) from the [src]."
					if(MiscCheck==0)
						usr<<"You must actually have a misc part installed in the [src] before you can remove one."
						return
		verb/Refuel()
			set src in oview(1)
			var/MagitechCheck=0
			var/FuelTotal=src.MaxFuel-src.Fuel
			for(var/obj/Items/Enchantment/SpaceTravelParts/Misc/CrystalFuelConverter/Z in src)
				MagitechCheck=1
			if(MagitechCheck==1)
				var/RefuelConfirm=input("Would you like to refuel? It'll cost [25/usr.Enchantment] per Fuel point, for a total of [FuelTotal*(100/usr.Enchantment)].") in list("Yes","No")
				switch(RefuelConfirm)
					if("Yes")
						for(var/obj/Money/Q in usr)
							if(Q.Level<FuelTotal*(25/usr.Enchantment))
								usr<<"You don't have enough resources."
								return
							else
								Q.Level-=FuelTotal*(25/usr.Enchantment)
								src.Fuel=src.MaxFuel
								usr<<"Refuel successful!"
					if("No")
						return
			if(istype(src,/obj/Items/Tech/SpaceTravel/Boat))
				var/RefuelConfirm=input("Would you like to refuel? It'll cost [25] per Fuel point, for a total of [Commas(FuelTotal*(2500))].") in list("Yes","No")
				switch(RefuelConfirm)
					if("Yes")
						var/refuelamount=input("How much fuel would you like to add? Remember, it's [25] per point. The ship can hold [FuelTotal] units.") as num
						if(refuelamount>FuelTotal)
							refuelamount=FuelTotal
						for(var/obj/Money/Q in usr)
							if(Q.Level<refuelamount*(25))
								usr<<"You don't have enough resources."
								return
							else
								Q.Level-=refuelamount*(25)
								src.Fuel+=refuelamount
								usr<<"Refuel successful!"
					if("No")
						return
			else
				var/RefuelConfirm=input("Would you like to refuel? It'll cost [100/usr.Intelligence] per Fuel point, for a total of [Commas(FuelTotal*(100/usr.Intelligence))].") in list("Yes","No")
				switch(RefuelConfirm)
					if("Yes")
						for(var/obj/Money/Q in usr)
							if(Q.Level<FuelTotal*(100/usr.Intelligence))
								usr<<"You don't have enough resources."
								return
							else
								Q.Level-=FuelTotal*(100/usr.Intelligence)
								src.Fuel=src.MaxFuel
								usr<<"Refuel successful!"
					if("No")
						return

		Boat
			Health=999999999999999999999
			LogPEndurance=9999999999999
			icon='Romek.dmi'
			pixel_y=-76
			pixel_x=-76
			density=1
			Grabbable=0
			Small
				MiscLimit=1
				Level=5
				MaxFuel=500
				Fuel=500
				MaxSpeed=13
				Password="Small"
			Medium
				MiscLimit=2
				Level=5
				MaxFuel=1500
				Fuel=1500
				MaxSpeed=10
				Password="Medium"
			Large
				MiscLimit=3
				Level=5
				MaxFuel=4500
				Fuel=4500
				MaxSpeed=7.5
				Password="Large"
			Skycarver
				MiscLimit=4
				Level=5
				MaxFuel=3500
				Fuel=3500
				MaxSpeed=5
				Password="Kaioshin"
			Terra_Geode
				MiscLimit=4
				Level=10
				MaxFuel=1000000000000
				Fuel=1000000000000
				MaxSpeed=1000
				Password="FuckLava"
		Ship
			Health=999999999
			density=1
			icon='Shipz.dmi'
			Grabbable=0
			pixel_y=-32
			pixel_x=-48
			Cost=500000000
			UpgradePrice=1000000
			Level=75
			MaxFuel=15000
			Fuel=15000
			MaxSpeed=10
			MiscLimit=2
			Oxywaffle
				Health=100000000000000000000000000000
				Level=0
				Lvl=1000
				Cost=0
				Password="Oxy"
				icon='ChanglingShip.dmi'
				pixel_y=-50
				pixel_x=-113
				MaxFuel=1000000000000
				Fuel=1000000000000
				MaxSpeed=100000
			Starfox
				Health=100000000000000000000000000000
				Level=0
				Lvl=1000
				Cost=0
				pixel_y=0
				pixel_x=0
				Password="Yip"
				icon='Tech.dmi'
				icon_state="PodRegular"
				MaxFuel=1000000000000
				Fuel=1000000000000
				MaxSpeed=100000
			Starwolf
				Health=100000000000000000000000000000
				Level=0
				Lvl=1000
				Cost=0
				pixel_y=0
				pixel_x=0
				Password="Bark"
				icon='Tech.dmi'
				icon_state="PodRegular"
				MaxFuel=1000000000000
				Fuel=1000000000000
				MaxSpeed=100000
			Starcat
				Health=100000000000000000000000000000
				Level=0
				Lvl=1000
				Cost=0
				pixel_y=0
				pixel_x=0
				Password="Meow"
				icon='Tech.dmi'
				icon_state="PodRegular"
				MaxFuel=1000000000000
				Fuel=1000000000000
				MaxSpeed=100000
			AndroidShip
				Health=1.#INF
				Level=0
				Lvl=1000
				Cost=0
				Password="Androidz"
				icon='AndroidShip.dmi'
				pixel_x=-32
				pixel_y=-32
				MaxFuel=17000
				Fuel=17000
				MaxSpeed=12
				//icon=''
			ChangelingShip
				Health=999999999999999999999
				Level=0
				Cost=0
				Lvl=1000
				icon='ChanglingShip.dmi'
				pixel_y=-50
				pixel_x=-113
				Password="Changelingz"
				MaxFuel=15000
				Fuel=15000
				MaxSpeed=15
			Ardent
				Health=39820482903489023234
				Level=0
				Cost=0
				Lvl=1000
				icon='Shipz.dmi'
				pixel_y=-32
				pixel_x=-48
				Password="Ardent"
				MaxFuel=20000
				Fuel=20000
				MaxSpeed=8

/*			Click()
				..()
				if(who==usr)
					usr.Control=null
					usr.client.eye=usr
					src.who=null
				if(usr.client.eye==src)
					usr.client.eye=usr*/

		SpacePod
			Pickable=0
			UpgradePrice=250000
			icon='Tech.dmi'
			icon_state="PodRegular"
			Level=40
			Cost=10000000
			var/Remoting=0
			var/PodIcon=0 //This prevents the pod icon assignment code from being a derp.
			var/PodID //This is the pod's unique ID code. 1-25 is valid.
			var/Peoples=0 //This tracks people in a pod, a maximum of 2 is permitted.
			Fuel=5000
			MaxFuel=5000
			MaxSpeed=25
			density=1

			verb/DoorPass()
				set src in oview(1)
				set name="Door Passwords"
				src.DoorPass=input("Enter Password 1")as text
				src.DoorPass2=input("Enter Password 2")as text
				src.DoorPass3=input("Enter Password 3")as text
				usr<< "You've entered [src.DoorPass],[src.DoorPass2], and [src.DoorPass3] as the passwords. All doors with these passwords will open if the pod is flown near them."

			verb/EnterPod()
				set src in view(1)
				if(!src.PodID)
					var/list/already=new
					usr<<"Assigning Pod ID..."
					for(var/obj/Items/Tech/SpaceTravel/SpacePod/W in world)
						already.Add(W.PodID)
					for(var/i=1, i<40, i++)
						if(already.Find(i))
							continue
						else
							src.PodID=i
							usr<<"ID assigned! ID is [i]."
							break
/*				if(usr.Grab)
					usr<<"You cannot use this while grabbing something!"
					return*/
				if(usr.Grab==src)
					usr<<"You can't enter a pod while grabbing it! That would be silly!"
					return
				if(Peoples<1)
					for(var/obj/PodConsole/Q in world)
						if(Q.PodID==src.PodID)
							usr.loc=locate(Q.x,Q.y-1,Q.z)
							return
					src.Peoples++
				else
					usr<<"There is too many people in the pod!"


	SpaceTravelParts
		var/SpeedModification=1
		var/FuelUsageModification=1
		var/MaxFuelModification=0
		var/FireRate=0
		var/FireSpeed=0
		var/DamageMultiplier=0
		var/DamageType=0
		Weapons
			Railgun
				icon='Bullet.dmi'
				Level=40
				SpeedModification=0.98
				FuelUsageModification=1.01
				FireRate=5
				FireSpeed=5
				DamageMultiplier=2
				DamageType="Physical"
				Cost=250000
				desc="A weapon system that magnetically projects metal rods at high speed. Primative compared to lasers, but extremely cheap and common."
			RailgunMK2
				icon='Bullet.dmi'
				Level=50
				SpeedModification=0.96
				FuelUsageModification=1.03
				FireRate=7
				FireSpeed=6
				DamageMultiplier=4
				DamageType="Physical"
				Cost=5000000
				desc="A weapon system that magnetically projects metal rods at high speed. Modern machining techniques have resulted in a faster firing weapon with heavier, more damaging projectiles."
			RailgunMK3
				icon='Bullet.dmi'
				Level=60
				SpeedModification=0.92
				FuelUsageModification=1.1
				FireRate=10
				FireSpeed=10
				DamageMultiplier=6
				DamageType="Physical"
				Cost=25000000
				desc="A weapon system that magnetically projects metal rods at high speed. Advancements to the basic Railgun have resulted in a very powerful, though heavy, weapon."

			Laser
				icon='Blasts.dmi'
				icon_state="26"
				Level=45
				SpeedModification=0.98
				FuelUsageModification=1.01
				FireRate=5
				FireSpeed=10
				DamageMultiplier=1.5
				DamageType="Energy"
				Cost=400000
				desc="A weapon system that fires focused beams of light. Weak, but fast."
			LaserMK2
				icon='Blasts.dmi'
				icon_state="26"
				Level=55
				SpeedModification=0.96
				FuelUsageModification=1.03
				FireRate=7
				FireSpeed=12
				DamageMultiplier=3
				DamageType="Energy"
				Cost=7000000
				desc="A weapon system that fires focused beams of light. Additional focusing lenses increase the speed (lol) and power."
			LaserMK3
				icon='Blasts.dmi'
				icon_state="26"
				Level=65
				SpeedModification=0.92
				FuelUsageModification=1.1
				FireRate=10
				FireSpeed=17
				DamageMultiplier=5
				DamageType="Energy"
				Cost=35000000
				desc="A weapon system that fires focused beams of light. Specialized lenses make the weapon as strong as it can be."


		Engines
			Ionic
				SpeedModification=0.5
				FuelUsageModification=0.25
				icon='SpaceParts.dmi'
				icon_state="Ionic"
				Level=55
				Cost=2000000
				desc="A engine that uses very little fuel, but is extremely slow."
			Plasma
				SpeedModification=1.5
				FuelUsageModification=1.25
				icon='SpaceParts.dmi'
				icon_state="Plasma"
				Level=65
				Cost=5000000
				desc="A engine that is moderately faster then the default, but consumes more fuel."
			Chemical
				SpeedModification=2.5
				FuelUsageModification=2
				icon='SpaceParts.dmi'
				icon_state="Chemical"
				Level=45
				Cost=1500000
				desc="Chemical rockets are very fast, but consume the most fuel."
			Jet
				SpeedModification=2
				FuelUsageModification=0.5
				icon='SpaceParts.dmi'
				icon_state="Jet"
				Level=400
				Cost=1000000
				desc="Jet engines are fast, and do not use much fuel, but cannot be used in space and will automatically deactivate, defaulting the ship to normal movement and fuel usage."
			Nuclear
				SpeedModification=2
				FuelUsageModification=0.5
				icon='SpaceParts.dmi'
				icon_state="Nuclear"
				Level=500
				Cost=1750000
				desc="Nuclear engines are moderately fast and do not use much fuel, however, they will automatically deactivate in atmosphere, forcing the craft to use the built in thrusters."
			Hyper
				SpeedModification=5
				FuelUsageModification=1.5
				icon='SpaceParts.dmi'
				icon_state="Hyper"
				Level=125
				Cost=50000000
				desc="Extremely advanced engine. Uses slightly more fuel then average, but its speed cannot be beat."
			Omega
				SpeedModification=10
				FuelUsageModification=0.5
				Level=200
				icon='SpaceParts.dmi'
				icon_state="Omega"
				Cost=100000000
				desc="Ultimate engine. If you have this, you're either a Galvan, or the wipe's gone on awhile..."
		Misc
			EmergencySail
				SpeedModification=0.85
				Level=40
				Cost=100000
				desc="If your boat is out of fuel, these will activate. Much, much slower then usual, though."
			ScannerBooster
				SpeedModification=0.9
				icon='SpaceParts.dmi'
				icon_state="SBooster"
				Level=45
				Cost=2500000
				desc="Improves scanners, showing distance to detected lifeforms and beacons."
			FuelCanister
				SpeedModification=0.9
				MaxFuelModification=1000
				icon='SpaceParts.dmi'
				icon_state="FuelCanister"
				Level=50
				Cost=10000000
				desc="A spare canister of fuel. Slows down the vessel slightly, but for smaller vessels like Pods, doubles the distance they can go before needing refueling."
			CompressedFuel
				SpeedModification=0.85
				MaxFuelModification=2000
				icon='SpaceParts.dmi'
				icon_state="CompressedFuel"
				Level=68
				Cost=25000000
				desc="A highly compressed tank of fuel. Increases max fuel dramatically, but slows the vessel down."
			RadarArray
				icon='SpaceParts.dmi'
				icon_state="Radar"
				SpeedModification=0.95
				Level=60
				Cost=5000000
				desc="Allows the vessel this is installed on to detect other ships and pods."
			RadarJammer
				icon='SpaceParts.dmi'
				icon_state="Jammer"
				SpeedModification=0.85
				Level=63
				Cost=5500000
				desc="This jams any attempt to detect the ship with radar or scouters, but it's quite heavy and thus slows the vessel down slightly."
			EngineBooster
				icon='SpaceParts.dmi'
				icon_state="EBooster"
				SpeedModification=1.25
				FuelUsageModification=1.1
				Level=65
				Cost=6000000
				desc="Improves engine speed at the cost of slightly more fuel usage. Also decreases launch time by 10 seconds."
			NavigationBooster
				SpeedModification=0.95
				FuelUsageModification=0.95
				icon='SpaceParts.dmi'
				icon_state="NBooster"
				Level=70
				Cost=7500000
				desc="Improves Navigation systems, showing distance to planets. Also reduces fuel use slightly."
			FusionReactor
				SpeedModification=0.8
				FuelUsageModification=0.75
				Level=75
				Cost=8000000
				icon='SpaceParts.dmi'
				icon_state="FusionReactor"
				desc="A nuclear fusion reactor. Cuts down fuel usage, but the equipment for it is very heavy."
			SubspaceRefractor
				SpeedModification=1.5
				FuelUsageModification=1.5
				icon='SpaceParts.dmi'
				icon_state="SRefractor"
				Level=80
				Cost=9500000
				desc="Improves engine speed more so then the Engine Booster, but consumes far more fuel."
			ScannerSuite
				SpeedModification=0.8
				FuelUsageModification=0.95
				icon='SpaceParts.dmi'
				icon_state="SSuite"
				Level=85
				Cost=10000000
				desc="Combines the functions of the Scanner Booster, Radar Array, and Navigation Booster into one unit."
			WormholeGenerator
				SpeedModification=0.75
				FuelUsageModification=1.25
				icon='SpaceParts.dmi'
				icon_state="WGenerator"
				Level=100
				Cost=10000000
				desc="Opens a wormhole to predetermined locations. Drains virtually all fuel to use, and the weight of the equipment dramatically slows your vessel for normal movement. Cannot be used in atmosphere."

obj/Items/ShipAccessories
	Alarm
		icon='shipalarm.dmi'
		icon_state="booting"
		var/active=1
		New()
			spawn()src.EnviromentScan()
		proc/EnviromentScan()
			while(src.active)
				for(var/obj/Items/Tech/SpaceTravel/Ship/b in world)
					if(b.Password==src.Password)
						if(b.z==2)
							src.icon_state="bad"
						else if(b.z!=12)
							var/turf/Q=b.loc
							var/area/Outside/Planet/T=Q.loc
							if(T.Temperature==0)
								src.icon_state="good"
							else
								src.icon_state="warn"
				sleep(100)
		verb/ToggleAlarm()
			set src in view(1)
			if(src.active)
				src.icon_state="off"
				usr<<"You've toggled off the enviroment alarm."
				src.active=0
			else
				src.icon_state="booting"
				usr<<"You've toggled on the enviroment alarm. It's now powering up."
				sleep(50)
				src.active=1
				src.EnviromentScan()

	PodLauncher
		density=1
		icon='Tech.dmi'
		icon_state="PodLauncher"



