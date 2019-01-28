var/list/TechTreeList=list("BasicTechnology"=list(),"SwordTechnology"=list(),"MovingTechnology"=list(),"CommunicationTechnology"=list(),"ModernCommunicationTechnology"=list(),"SecurityTechnology"=list(),"ModernSecurityTechnology"=list(),"MiningTechnology"=list(),"ModernMiningTechnology"=list(),"MaterialsTechnology"=list(),"MaterialsTechnology2"=list(),"MaterialsTechnology3"=list(),"ScannerTechnology"=list(),"MaterialsTechnology4"=list(),"MaterialsTechnology5"=list(),"PortableScannerTechnology"=list(),"DeluxeBasicScannerUpgrades"=list(),"ModernScannerKit"=list(),"AdvancedScannerKit"=list(),"ModernScannerTechnology"=list(),"AdvancedScannerTechnology"=list(),"DeluxeModernScannerUpgrades"=list(),"MedicalTechnology"=list(),"RegenTankTechnology"=list(),"RegenTankUpgrades"=list(),"ModernRegenTankUpgrades"=list())
proc/MakeTechTreeList()
	for(var/x in TechTree)
		for(var/i in TechTree[x])
			var/obj/TechTreeObj/B=new
			B.cost=TechTree[x][i]
			var/namez=i
			if(copytext("[i]",1,2)=="/")
				var/path=text2path("[i]")
				var/obj/nameref=new path
				namez=nameref.name
				spawn(3)del(nameref)
			B.path=i
			B.name="[namez] ([B.cost])"
			TechTreeList[x]+=B

var/TechTree=list(\
"BasicTechnology"=list("BasicTechnology"=20),\
"SwordTechnology"=list("SwordTechnology"=50),\
"MovingTechnology"=list("MovingTechnology"=25),\
"CommunicationTechnology"=list("CommunicationTechnology"=25),\
"ModernCommunicationTechnology"=list("ModernCommunicationTechnology"=35),\
"SecurityTechnology"=list("SecurityTechnology"=50),\
"ModernSecurityTechnology"=list("ModernSecurityTechnology"=50),\
"MiningTechnology"=list("MiningTechnology"=75),\
"ModernMiningTechnology"=list("ModernMiningTechnology"=100),\
"MaterialsTechnology"=list("MaterialsTechnology"=25),\
"MaterialsTechnology2"=list("MaterialsTechnology2"=50),\
"MaterialsTechnology3"=list("MaterialsTechnology3"=75),\
"MaterialsTechnology4"=list("MaterialsTechnology4"=100),\
"MaterialsTechnology5"=list("MaterialsTechnology5"=125),\
"ScannerTechnology"=list("ScannerTechnology"=50),\
"PortableScannerTechnology"=list("PortableScannerTechnology"=75),\
"DeluxeBasicScannerUpgrades"=list("DeluxeBasicScannerUpgrades"=75),\
"ModernScannerKit"=list("ModernScannerKit"=100),\
"AdvancedScannerKit"=list("AdvancedScannerKit"=125),\
"ModernScannerTechnology"=list("ModernScannerTechnology"=75),\
"AdvancedScannerTechnology"=list("AdvancedScannerTechnology"=100),\
"DeluxeModernScannerUpgrades"=list("DeluxeModernScannerUpgrades"=100),\
"MedicalTechnology"=list("MedicalTechnology"=50),\
"RegenTankTechnology"=list("RegenTankTechnology"=50),\
"RegenTankUpgrades"=list("RegenTankUpgrades"=75),\
"ModernRegenTankUpgrades"=list("ModernRegenTankUpgrades"=100)
)

obj/TechTreeObj
	var/path
	var/cost
	icon='skilltree.dmi'
	layer=9999
	Click()
		usr<<"DISABLED."
		return
		if(copytext("[src.path]",1,2)!="/")
			if(src.path=="BasicTechnology")
				if(usr.MaterialTechnology<1)
					usr<<"You need Material Technology I to unlock this."
					return
				if(TechLockOut.Find("BasicTechnology")&&usr.Race!="Tsufurujin")
					usr<<"For some odd reason, the first branch in the tech tree is locked out. Straaaaaange."
					return
				if(usr.TechnologyUnlocks.Find("BasicTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("BasicTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Basic Technology."

			if(src.path=="SwordTechnology")
				if(usr.MaterialTechnology<1)
					usr<<"You need Material Technology I to unlock this."
					return
				if(TechLockOut.Find("SwordTechnology")&&usr.Race!="Tsufurujin")
					usr<<"You can't make pointy sharp sticks today."
					return
				if(usr.TechnologyUnlocks.Find("SwordTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("SwordTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Sword Technology."

			if(src.path=="CommunicationTechnology")
				if(usr.MaterialTechnology<1)
					usr<<"You need Material Technology I to unlock this."
					return
				if(TechLockOut.Find("CommunicationTechnology")&&usr.Race!="Tsufurujin")
					usr<<"Apparently Speakers are too advanced for most of the universe right now. Huh."
					return
				if(usr.TechnologyUnlocks.Find("CommunicationTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("CommunicationTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Communication Technology."

			if(src.path=="ModernCommunicationTechnology")
				if(usr.MaterialTechnology<2)
					usr<<"You need Material Technology II to unlock this."
					return
				if(TechLockOut.Find("ModernCommunicationTechnology")&&usr.Race!="Tsufurujin")
					usr<<"Apparently Speakers are too advanced for most of the universe right now. Huh."
					return
				if(usr.TechnologyUnlocks.Find("ModernCommunicationTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("ModernCommunicationTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Modern Communication Technology."

			if(src.path=="SecurityTechnology")
				if(usr.MaterialTechnology<1)
					usr<<"You need Material Technology I to unlock this."
					return
				if(TechLockOut.Find("SecurityTechnology")&&usr.Race!="Tsufurujin")
					usr<<"Remote controlled cameras are beyond most people in the universe at the moment."
					return
				if(usr.TechnologyUnlocks.Find("SecurityTechnology"))
					usr<<"You already have this unlocked."
					return
/*				if(!usr.TechnologyUnlocks.Find("BasicTechnology"))
					usr<<"You need Basic Technology first to buy this."
					return*/
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("SecurityTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Security Technology."

			if(src.path=="ModernSecurityTechnology")
				if(usr.MaterialTechnology<3)
					usr<<"You need Material Technology III to unlock this."
					return
				if(TechLockOut.Find("SecurityTechnology")&&usr.Race!="Tsufurujin")
					usr<<"Remote controlled cameras are beyond most people in the universe at the moment."
					return
				if(usr.TechnologyUnlocks.Find("ModernSecurityTechnology"))
					usr<<"You already have this unlocked."
					return
/*				if(!usr.TechnologyUnlocks.Find("BasicTechnology"))
					usr<<"You need Basic Technology first to buy this."
					return*/
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("ModernSecurityTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Modern Security Technology."

			if(src.path=="MiningTechnology")
				if(usr.MaterialTechnology<2)
					usr<<"You need Material Technology II to unlock this."
					return
				if(TechLockOut.Find("MiningTechnology")&&usr.Race!="Tsufurujin")
					usr<<"For some reason only Tuffles are allowed drills right now."
					return
				if(usr.TechnologyUnlocks.Find("MiningTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("MiningTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Mining Technology."

			if(src.path=="ModernMiningTechnology")
				if(usr.MaterialTechnology<3)
					usr<<"You need Material Technology III to unlock this."
					return
				if(TechLockOut.Find("ModernMiningTechnology")&&usr.Race!="Tsufurujin")
					usr<<"For some reason only Tuffles are allowed iron drills right now."
					return
				if(usr.TechnologyUnlocks.Find("ModernMiningTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("ModernMiningTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Modern Mining Technology."

			if(src.path=="MovingTechnology")
				if(usr.MaterialTechnology<2)
					usr<<"You need Material Technology II to unlock this."
					return
				if(TechLockOut.Find("MovingTechnology")&&usr.Race!="Tsufurujin")
					usr<<"No detecting energy at a large station for you."
					return
				if(usr.TechnologyUnlocks.Find("MovingTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("MovingTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Moving Technology."

			if(src.path=="MaterialsTechnology")
				if(TechLockOut.Find("MaterialsTechnology")&&usr.Race!="Tsufurujin")
					usr<<"Only Tuffles can learn about Steel."
					return
				if(usr.MaterialTechnology>0)
					usr<<"You already have this, or a higher form of it."
					return
/*				if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
					usr<<"You already have this unlocked."
					return
				if(!usr.TechnologyUnlocks.Find("MiningTechnology"))
					usr<<"You need Mining Technology first to buy this."
					return*/
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
//					usr.TechnologyUnlocks.Add("MaterialsTechnology")
					usr.MaterialTechnology++
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Materials Technology I."

			if(src.path=="MaterialsTechnology2")
				if(usr.MaterialTechnology<1)
					usr<<"You need Material Technology I to unlock this."
					return
				if(TechLockOut.Find("MaterialsTechnology2")&&usr.Race!="Tsufurujin")
					usr<<"Only Tuffles can learn about Steel and how it can't be melted by jet fuel."
					return
				if(usr.MaterialTechnology>1)
					usr<<"You already have this, or a higher form of it."
					return
/*				if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
					usr<<"You already have this unlocked."
					return
				if(!usr.TechnologyUnlocks.Find("MiningTechnology"))
					usr<<"You need Mining Technology first to buy this."
					return*/
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
//					usr.TechnologyUnlocks.Add("MaterialsTechnology")
					usr.MaterialTechnology++
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Materials Technology II."

			if(src.path=="MaterialsTechnology3")
				if(usr.MaterialTechnology<2)
					usr<<"You need Material Technology II to unlock this."
					return
				if(TechLockOut.Find("MaterialsTechnology3")&&usr.Race!="Tsufurujin")
					usr<<"Only Tuffles can learn about Steel."
					return
				if(usr.MaterialTechnology>2)
					usr<<"You already have this, or a higher form of it."
					return
/*				if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
					usr<<"You already have this unlocked."
					return
				if(!usr.TechnologyUnlocks.Find("MiningTechnology"))
					usr<<"You need Mining Technology first to buy this."
					return*/
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
//					usr.TechnologyUnlocks.Add("MaterialsTechnology")
					usr.MaterialTechnology++
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Materials Technology III."

			if(src.path=="MaterialsTechnology4")
				if(usr.MaterialTechnology<3)
					usr<<"You need Material Technology III to unlock this."
					return
				if(TechLockOut.Find("MaterialsTechnology4")&&usr.Race!="Tsufurujin")
					usr<<"Only Tuffles can learn about Steel."
					return
				if(usr.MaterialTechnology>3)
					usr<<"You already have this, or a higher form of it."
					return
/*				if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
					usr<<"You already have this unlocked."
					return
				if(!usr.TechnologyUnlocks.Find("MiningTechnology"))
					usr<<"You need Mining Technology first to buy this."
					return*/
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
//					usr.TechnologyUnlocks.Add("MaterialsTechnology")
					usr.MaterialTechnology++
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Materials Technology IV."

			if(src.path=="MaterialsTechnology5")
				if(usr.MaterialTechnology<4)
					usr<<"You need Material Technology IV to unlock this."
					return
				if(TechLockOut.Find("MaterialsTechnology5")&&usr.Race!="Tsufurujin")
					usr<<"Only Tuffles can learn about Steel."
					return
				if(usr.MaterialTechnology>4)
					usr<<"You already have this, or a higher form of it."
					return
/*				if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
					usr<<"You already have this unlocked."
					return
				if(!usr.TechnologyUnlocks.Find("MiningTechnology"))
					usr<<"You need Mining Technology first to buy this."
					return*/
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
//					usr.TechnologyUnlocks.Add("MaterialsTechnology")
					usr.MaterialTechnology++
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Materials Technology V."

			if(src.path=="ScannerTechnology")
				if(usr.MaterialTechnology<2)
					usr<<"You need Material Technology II to unlock this."
					return
				if(TechLockOut.Find("ScannerTechnology")&&usr.Race!="Tsufurujin")
					usr<<"No detecting energy at a large station for you."
					return
				if(usr.TechnologyUnlocks.Find("ScannerTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("ScannerTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Scanner Technology."

			if(src.path=="PortableScannerTechnology")
				if(usr.MaterialTechnology<3)
					usr<<"You need Material Technology III to unlock this."
					return
				if(TechLockOut.Find("PortableScannerTechnology")&&usr.Race!="Tsufurujin")
					usr<<"No detecting energy with a fancy gizmo for you."
					return
				if(usr.TechnologyUnlocks.Find("PortableScannerTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("PortableScannerTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Scouter Technology."

			if(src.path=="DeluxeBasicScannerTechnology")
				usr<<"DISABLED."
				return
				if(TechLockOut.Find("DeluxeBasicScannerTechnology")&&usr.Race!="Tsufurujin")
					usr<<"No high end upgrades for nonTuffles."
					return
				if(usr.TechnologyUnlocks.Find("DeluxeBasicScannerTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("DeluxeBasicScannerTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Deluxe Basic Upgrade Technology."

			if(src.path=="ModernScannerKit")
				if(usr.MaterialTechnology<4)
					usr<<"You need Material Technology IV to unlock this."
					return
				if(TechLockOut.Find("ModernScannerKit")&&usr.Race!="Tsufurujin")
					usr<<"No high end upgrades for nonTuffles."
					return
				if(usr.TechnologyUnlocks.Find("ModernScannerKit"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("ModernScannerKit")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked the Modern Upgrade Kit Technology."

			if(src.path=="AdvancedScannerKit")
				if(usr.MaterialTechnology<5)
					usr<<"You need Material Technology V to unlock this."
					return
				if(TechLockOut.Find("AdvancedScannerKit")&&usr.Race!="Tsufurujin")
					usr<<"No high end upgrades for nonTuffles."
					return
				if(usr.TechnologyUnlocks.Find("AdvancedScannerKit"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("AdvancedScannerKit")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked the Advanced Upgrade Kit Technology."

			if(src.path=="ModernScannerTechnology")
				if(usr.MaterialTechnology<4)
					usr<<"You need Material Technology IV to unlock this."
					return
				if(TechLockOut.Find("ModernScannerTechnology")&&usr.Race!="Tsufurujin")
					usr<<"No high end upgrades for nonTuffles."
					return
				if(usr.TechnologyUnlocks.Find("ModernScannerTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("ModernScannerTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked the Scouter Modern Upgrade Technology."

			if(src.path=="AdvancedScannerTechnology")
				if(usr.MaterialTechnology<5)
					usr<<"You need Material Technology V to unlock this."
					return
				if(TechLockOut.Find("AdvancedScannerTechnology")&&usr.Race!="Tsufurujin")
					usr<<"No high end upgrades for nonTuffles."
					return
				if(usr.TechnologyUnlocks.Find("AdvancedScannerTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("AdvancedScannerTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked the Scouter Advanced Upgrade Technology."

			if(src.path=="DeluxeModernScannerUpgrades")
				usr<<"DISABLED"
				return
				if(TechLockOut.Find("DeluxeModernScannerUpgrades")&&usr.Race!="Tsufurujin")
					usr<<"No high end upgrades for nonTuffles."
					return
				if(usr.TechnologyUnlocks.Find("DeluxeModernScannerUpgrades"))
					usr<<"You already have this unlocked."
					return
				if(!usr.TechnologyUnlocks.Find("ModernScannerTechnology"))
					usr<<"You need Modern Scouter Technology first to buy this."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("DeluxeModernScannerUpgrades")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked the Deluxe Modern Upgrade Technology."

			if(src.path=="MedicalTechnology")
				if(usr.MaterialTechnology<1)
					usr<<"You need Material Technology I to unlock this."
					return
				if(TechLockOut.Find("MedicalTechnology")&&usr.Race!="Tsufurujin")
					usr<<"Can't even make a medkit as a nonTuffle..."
					return
				if(usr.TechnologyUnlocks.Find("MedicalTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("MedicalTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Medical Technology."

			if(src.path=="RegenTankTechnology")
				if(usr.MaterialTechnology<2)
					usr<<"You need Material Technology II to unlock this."
					return
				if(TechLockOut.Find("RegenTankTechnology")&&usr.Race!="Tsufurujin")
					usr<<"Can't even make a medkit as a nonTuffle..."
					return
				if(usr.TechnologyUnlocks.Find("RegenTankTechnology"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("RegenTankTechnology")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Regen Tank Technology."

			if(src.path=="RegenTankUpgrades")
				if(usr.MaterialTechnology<3)
					usr<<"You need Material Technology III to unlock this."
					return
				if(TechLockOut.Find("RegenTankUpgrades")&&usr.Race!="Tsufurujin")
					usr<<"Can't even make a medkit as a nonTuffle..."
					return
				if(usr.TechnologyUnlocks.Find("RegenTankUpgrades"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("RegenTankUpgrades")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Regen Tank Upgrades."

			if(src.path=="ModernRegenTankUpgrades")
				if(usr.MaterialTechnology<4)
					usr<<"You need Material Technology IV to unlock this."
					return
				if(TechLockOut.Find("ModernRegenTankUpgrades")&&usr.Race!="Tsufurujin")
					usr<<"Can't even make a medkit as a nonTuffle..."
					return
				if(usr.TechnologyUnlocks.Find("ModernRegenTankUpgrades"))
					usr<<"You already have this unlocked."
					return
				if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.TechnologyUnlocks.Add("ModernRegenTankUpgrades")
					usr.RewardPoints-=src.cost
					usr<<"You have unlocked Modern Regen Tank Upgrades."

		else
			var/path=text2path("[src.path]")
			var/obj/s=new path

			if(locate(s,usr.contents))
				usr<< "You already know this skill!"
				del(s)
				return
			//if(usr.SpendableDevPoints<src.cost)
			//	usr<<"You don't have enough Dev Points to purchase this skill!"
			//	del(s)
			//	return
			//if(usr.SpendableDevPoints>=src.cost)
			//	usr.contents+=s
			//	usr.SpendableDevPoints-=src.cost
			//	usr<<"You bought [s] for [src.cost] Dev Points!"
		..()


mob/Players/verb
/*	TechTree()
		set category="Other"
		winshow(usr,"techtree",1)
	techtreez(var/z as text)
		set hidden=1//interface verb doesnt needa be found out
		winset(usr,"techtreegrid","cells=0x0")//clears grid
		usr<<output("Tech Tree (RPP: [usr.RewardPoints])","TechTreeRewardPoints")
		sleep(1)
		var/p=1//used as a positioning locator for rows/columns
		for(var/obj/TechTreeObj/x in TechTreeList[z])
			if(TechLockOut.Find(z)&&usr.Race!="Tsufurujin")
				x.icon_state="NotAvailable"
			else if(!TechLockOut.Find(z))
				x.icon_state="Available"
			else
				x.icon_state="Unknown"
			//p++
			usr<<output(x,"techtreegrid:1,[p]")
			if(z=="BasicTechnology")
				usr<<output("Basic general items. Unlocks the ability to build PDAs, Display Consoles, Shovels, Training Bags, Logs and Door Passes.","techinfolabel")
			if(z=="SwordTechnology")
				usr<<output("Techniques to create the tools needed to forge blades of all kinds. While some may argue this isn't very technologically advanced, the sheer effort required to create a high quality blade may eclipse more advanced forms of technology.","techinfolabel")
			if(z=="MovingTechnology")
				usr<<output("Conveyor Belts. Stop asking about them now.","techinfolabel")
			if(z=="CommunicationTechnology")
				usr<<output("Technology revolving around communication. Unlocks Communicators, Speakers, Doorbells, and the Communication Chip for Display Consoles, allowing one to link them together.","techinfolabel")
			if(z=="SecurityTechnology")
				usr<<output("Security Technology involves devices revolving around keeping a eye on different areas, via the Security Camera and the Security Console.","techinfolabel")
			if(z=="ModernSecurityTechnology")
				usr<<output("Modern Security Technology allows you to build Force Field Emitters and remotes, as well as unlocks the Camera Probe.","techinfolabel")
			if(z=="MiningTechnology")
				usr<<output("Mining Technology allows you to get resources faster, and more effectively, then before. Unlocks the Drill Casing, and the Bronze Drillbit for it. Unlocks the Modern Mining Technology and Material Technology Branches.","techinfolabel")
			if(z=="ModernMiningTechnology")
				usr<<output("These advancements allow you to craft a more advanced drillbit for the Drill Casing. Unlocks Iron Drillbits.","techinfolabel")
			if(z=="MaterialsTechnology")
				usr<<output("The basis of Technology lies within the materials you use. These basic materials unlock Basic Technology, Sword Technology, Security Technology, and Communication Technology.","techinfolabel")
			if(z=="MaterialsTechnology2")
				usr<<output("Basic alloys allow you to unlock Medical Technology, Mining Technology, and Scanner Technology.","techinfolabel")
			if(z=="MaterialsTechnology3")
				usr<<output("Specialized materials and related alloys allow you to unlock Regeneration Tank Technology, Modern Mining Technology, and Scouter Technology.","techinfolabel")
			if(z=="MaterialsTechnology4")
				usr<<output("Advanced alloying techniques allow you to unlock Regeneration Tank Upgrades, Modern Scanner Upgrades and the Modern Scanner Upgrade Kit.","techinfolabel")
			if(z=="MaterialsTechnology5")
				usr<<output("Futuristic materials allow you to unlock Advanced Scanner Upgrades and Advanced Scanner Upgrade Kit.","techinfolabel")
			if(z=="ScannerTechnology")
				usr<<output("Scanner Technology allows you to create items that can detect other beings, and measure their power in a easy to read format. Unlocks the Scanner Station, and the Basic Range Upgrade.","techinfolabel")
			if(z=="PortableScannerTechnology")
				usr<<output("A far more portable verison of the Scanner Station, the Scouter, is unlocked with this technology, along with the Basic BP Range Booster upgrade.","techinfolabel")
			if(z=="DeluxeBasicScannerUpgrades")
				usr<<output("These upgrades are enhanced versions of the Basic Range Booster and Basic BP Range Booster. However, while they are more powerful at what they do, they do carry downsides.","techinfolabel")
			if(z=="ModernScannerKit")
				usr<<output("This specialized kit will fine tune your scouter to a more modern standard. It takes up no upgrade slot either.","techinfolabel")
			if(z=="AdvancedScannerKit")
				usr<<output("This specialized kit will fine tune your scouter to a more advanced standard. It takes up no upgrade slot either.","techinfolabel")
			if(z=="ModernScannerTechnology")
				usr<<output("These modernized parts are enhanced versions of the Basic Range and Basic BP Range Upgrades. You may use them at the same time as the Basic Upgrades if you wish.","techinfolabel")
			if(z=="AdvancedScannerTechnology")
				usr<<output("These Advanced parts are enhanced versions of the Modern Range and Basic BP Range Upgrades. You may use them at the same time as the Basic and Modern Upgrades if you wish.","techinfolabel")
			if(z=="DeluxeModernScannerUpgrades")
				usr<<output("Much like the Deluxe Basic Upgrades, these parts are far more powerful then their normal Modern counterparts, but carry downsides.","techinfolabel")
			if(z=="MedicalTechnology")
				usr<<output("Medical Technology unlocks the Medkit, a item that takes ten seconds to use. Once used, the person it is used on will receive improved Wound recovery for 60 seconds, as well as very minor improvements to surviving mortal wounds.","techinfolabel")
			if(z=="RegenTankTechnology")
				usr<<output("This technology, using the latest in medical advances, is used to create a Regeneration Tank. By remaining in it, all health recovery operations are enhanced.","techinfolabel")
			if(z=="RegenTankUpgrades")
				usr<<output("These are a series of upgrade parts for a regen tank to improve their abilities.","techinfolabel")
			if(z=="ModernRegenTankUpgrades")
				usr<<output("These parts are improvements upon the basic upgrade parts previously unlocked.","techinfolabel")
			p++*/