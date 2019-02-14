mob/proc/PoH_Heal(Amount)
	var/Time=10
	var/Effect=Amount
	while(Time)
		Time-=1
		Recover("Health",Effect)
		sleep(10)

mob/proc/PoE_Heal(Amount)
	var/Time=10
	var/Effect=Amount
	while(Time)
		Time-=1
		Recover("Energy",Effect)
		sleep(10)

mob/proc/PoM_Heal(Amount)
	var/Time=10
	var/Effect=Amount
	while(Time)
		Time-=1
		ManaAmount+=rand(Effect,10+Effect)
		if(ManaAmount>=ManaMax)
			ManaAmount=ManaMax
		sleep(10)

mob/proc/EnchantmentGain(var/Multiplier=0.2)
	src.EnchantmentEXP+=rand(10,100)*(EnchantmentRate/100)*src.Meditation_Rate*Multiplier
	if(Multiplier>1)
		src.EnchantmentEXP+=(src.EnchantmentEXPNeeded*0.01)*(EnchantmentRate/50)*src.Meditation_Rate*Multiplier
	if(src.EnchantmentEXP>EnchantmentEXPNeeded)
		src.EnchantmentEXP-=EnchantmentEXPNeeded
		src.EnchantmentLevel+=1
		src.EnchantmentEXPNeeded=(1000*sqrt(EnchantmentLevel)*EnchantmentLevel)/Enchantment

mob/proc/EnchantmentGainofHitting(Amount)
	src.EnchantmentEXP+=rand(2.5,25)*(EnchantmentRate/100)*Amount*src.Meditation_Rate*Training_Rate
	Base+=0.02*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*WeightFormula(1)*EXP/1000*Amount/2
	EnergyMax+=0.008*EnergyMod*Amount*EnergyGains*src.Meditation_Rate
	EXP+=(EXPGains/100)*0.0015*src.PlayerEXPgains*src.PlayerEXPgains*Amount
	src.Decline+=0.000004*Training_Rate*(DeclineGains/100)
	src.PrimeAge-=0.000016*Training_Rate*(DeclineGains/100)
	if(src.EnchantmentEXP>EnchantmentEXPNeeded)
		src.EnchantmentEXP-=EnchantmentEXPNeeded
		src.EnchantmentLevel+=1
		src.EnchantmentEXPNeeded=(1000*sqrt(EnchantmentLevel)*EnchantmentLevel)/Enchantment

obj/Items/Enchantment
	var/Infusions=0
	Cauldron
		icon='enchantmenticons.dmi'
		icon_state="Cauldron"
		var/InstalledCoin
		var/InstalledArcane
		var/InstalledFeather
		var/InstallLock
		var/Lvl=10
		Pickable=0
		Grabbable=0
		Level=10
		Cost=10000
		var/DrillSpeed=200
		var/BaseDigMulti=50
		New()
			spawn(20) if(src) Drill()
		Click()
			..()
			if(!(usr.client.mob in range(1,src))) return
			usr.OMessage(10,"[usr] withdraws [Commas(Level)] Resources from the [src]","<font color=red>[usr]([usr.key]) withdraws [Commas(Level)] Resources from the [src] made by [src.CreatorKey]")
			for(var/obj/Money/M in usr)
				M.Level+=Level
				Level=0
		proc/Drill()
			set background=1
			while(src)
				sleep(src.DrillSpeed)
				if(src.loc)
					if(src.loc.loc)
						var/area/P=src.loc.loc
						if(!src.Grabbable)
							if(P.Level>0)
								if(src.EnchantType=="Chaotic")
									var/ChaoticRandomizer=rand(src.Lvl-3,src.Lvl+11)
									Level+=src.BaseDigMulti*ChaoticRandomizer/2/24*global.DiggingMultiplier
									P.Level-=src.BaseDigMulti*ChaoticRandomizer/2/24*global.DiggingMultiplier
								else if(src.EnchantType=="Haste")
									Level+=src.BaseDigMulti*Lvl/2/24*global.DiggingMultiplier
									P.Level-=src.BaseDigMulti*Lvl/2/24*global.DiggingMultiplier
									if(prob(10))
										Level+=src.BaseDigMulti*Lvl/1.5/2/24*global.DiggingMultiplier
										P.Level-=src.BaseDigMulti*Lvl/1.5/2/24*global.DiggingMultiplier
								else
									Level+=src.BaseDigMulti*Lvl/2/24*global.DiggingMultiplier
									P.Level-=src.BaseDigMulti*Lvl/2/24*global.DiggingMultiplier
								if(P.Level<0)
									Level+=P.Level
									P.Level=0
							else if(P.Level<1)
								Level+=2*Lvl*global.DiggingMultiplier
								sleep(50)
		verb/PlaceIngredients()
			set src in oview(1)
			winshow(usr,"CauldronCustom",0)
			if(usr.client.mob in range(1,src))
				winshow(usr,"CauldronCustom",1)
				usr.Customizing=src
				usr.UpdateCauldronWindow(src)
		verb/Relocate()
			set src in oview(1)
			if(src.CreatorKey!=usr.key)
				usr<<"You can't relocate cauldrons you don't own!"
				return
			if(src.Grabbable)
				src.Grabbable=0
				usr<<"The cauldron is in place, and filled with water once more. It begin to boil..."
			else if(!src.Grabbable)
				src.Grabbable=1
				usr<<"The water is removed from the Cauldron, allowing it to be moved safely."
		verb/Infusion()
			set src in oview(1)
			if(src.Infusions==3)
				usr<<"A Cauldron can only handle three infusions."
				return
			var/warning=input("Infusions cannot be undone. It'll consume a Infusion Crystal of your choice from your inventory. Proceed?")in list("Yes","No")
			if(warning=="Yes")
				var/list/crystals=list("Cancel")
				for(var/obj/Items/Enchantment/InfusionCrystal/A in usr)
					crystals+=A
				var/obj/Items/Enchantment/InfusionCrystal/selectcrystal=input("Select a crystal.")in crystals
				if(selectcrystal=="Cancel")
					return
				if(selectcrystal.EnchantType=="Bolster")
					usr<<"The cauldron glows red for a few moments, before the crystal crumbles into useless dust. A runic symbol appears to have been etched into the side of the cauldron, boosting it's production rates."
					src.Lvl+=10
					src.DrillSpeed+=3
				else if(selectcrystal.EnchantType=="Cleave")
					usr<<"The cauldron glows blue for a few moments, before the crystal crumbles into useless dust. A runic symbol appears to have been etched into the side of the cauldron, boosting it's abilities further."
					src.BaseDigMulti+=2.5
					src.DrillSpeed+=3
				src.Infusions++
				if(src.Infusions==3)
					usr<<"It looks like the Cauldron can't support any more infusions now."
				del(selectcrystal)

	CauldronParts
		icon='enchantmenticons.dmi'
		var/Lvl
		var/BaseDigMulti
		var/DrillSpeed
		var/Material
		Arcane/DrownedToad
			icon_state="DrownedToad"
			Level=15
			Cost=40000
			Lvl=5
			BaseDigMulti=1.25
			DrillSpeed=7
			Material="Toad"
		Feather/QuailFeather
			icon_state="QuailFeather"
			Level=15
			Cost=45000
			Lvl=5
			BaseDigMulti=1.25
			DrillSpeed=-7
			Material="Quail"
		Coin/BronzeCoin
			icon_state="BronzeCoin"
			Level=15
			Cost=50000
			Lvl=5
			BaseDigMulti=1.25
			DrillSpeed=7
			Material="Bronze"

		Arcane/Witheroot
			icon_state="Witheroot"
			Level=25
			Cost=80000
			Lvl=10
			BaseDigMulti=1.75
			DrillSpeed=12
			Material="Witheroot"
			desc="Witheroot is used in many potions and is a excellent regent for Cauldrons."
		Feather/DoveFeather
			icon_state="DoveFeather"
			Level=25
			Cost=90000
			Lvl=10
			BaseDigMulti=1.75
			DrillSpeed=-12
			Material="Dove"
			desc="A white feather from a dove."
		Coin/SilverCoin
			icon_state="SilverCoin"
			Level=25
			Cost=100000
			Lvl=10
			BaseDigMulti=1.75
			DrillSpeed=12
			Material="Silver"
			desc="A silver coin. While not as conductive to magic as gold, it is receptive enough."

		Arcane/BareSkull
			icon_state="BareSkull"
			Level=40
			Cost=120000
			Lvl=20
			BaseDigMulti=2.5
			DrillSpeed=20
			Material="Bare Skull"
			desc="Not a human skull, at least. It's some sort of animal."
		Feather/PhoenixFeather
			icon_state="PhoenixFeather"
			Level=40
			Cost=135000
			Lvl=20
			BaseDigMulti=2.5
			DrillSpeed=-20
			Material="Phoenix"
			desc="A feather from a Phoenix, the bird of rebirth."
		Coin/GoldCoin
			icon_state="GoldCoin"
			Level=40
			Cost=150000
			Lvl=20
			BaseDigMulti=2.5
			DrillSpeed=20
			Material="Gold"
			desc="A golden coin. Gold is well known as a magical conductor."

		Arcane/DragonScale
			icon_state="DragonScale"
			Level=60
			Cost=500000
			Lvl=35
			BaseDigMulti=3
			DrillSpeed=30
			Material="Dragon"
			desc="A dragonscale, lightly magical just by itself."
		Feather/AngelFeather
			icon_state="AngelFeather"
			Level=60
			Cost=500000
			Lvl=35
			BaseDigMulti=3
			DrillSpeed=-30
			Material="Angel"
			desc="Supposedly a feather from a angel. It naturally is magical."
		Coin/MithrilCoin
			icon_state="MithrilCoin"
			Level=60
			Cost=500000
			Lvl=35
			BaseDigMulti=3
			DrillSpeed=30
			Material="Mithril"
			desc="A magical coin, made out of Mithril."

	InfusionCrystal
		Level=20
		Cost=200000
		icon='enchantmenticons.dmi'
		icon_state="InfusionCrystal"
		desc="This crystal is used to upgrade various Enchantment items. Most items can only accept one Infusion."
		verb/Enchant()
			set src in usr
			var/notice=input("A crystal can only be Enchanted once. Proceed?") in list ("Yes","No")
			if(notice=="Yes")
				var/selection=input("Pick a Enchantment from the list. The enchantments may have differing effects, depending on the item they are used on.") in list("Bolster","Cleave")
				switch(selection)
					if("Bolster")
						usr<<"The crystal crackles with magical energy, turning red."
						src.icon+=rgb(150,0,0)
						src.EnchantType="Bolster"
						src.name="Infusion Crystal (Bolster)"
					if("Cleave")
						usr<<"The crystal glows with magical energy, becoming sharper and turning blue."
						src.icon+=rgb(0,0,150)
						src.EnchantType="Cleave"
						src.name="Infusion Crystal (Cleave)"
		verb/Infuse()
			set src in usr
			var/notice=input("This crystal will be destroyed once you use it. Proceed?") in list ("Yes","No")
			if(notice=="Yes")
				var/list/infusionlist=list("Cancel")
				for(var/obj/Items/Enchantment/DigEnhancement/CrystalShovel/A in usr)
					if(!A.Infusions)
						infusionlist+=A
				for(var/obj/Items/Enchantment/CauldronParts/Coin/B in usr)
					if(!B.Infusions)
						infusionlist+=B

				var/obj/infusionselect=input("Select the object you wish to infuse with energies.")in infusionlist
				if(istype(infusionselect,/obj/Items/Enchantment/DigEnhancement/CrystalShovel))
					if(infusionselect:Infusions)
						usr<<"No trying to put 9001 crystals onto one shovel. :|"
						return
					infusionselect:DigMulti+=20
					infusionselect:Infusions++
					infusionselect.icon_state="CS+"
					usr<<"The shovel glows, and the Infusion Crystal crumbles into useless dust. It seems far more potent then before."
					del(src)
				if(istype(infusionselect,/obj/Items/Enchantment/CauldronParts/Coin))
					if(infusionselect:Infusions)
						usr<<"No trying to put 9001 crystals onto one coin. :|"
						return
					if(src.EnchantType=="Bolster")
						infusionselect:Lvl+=10
						infusionselect:DrillSpeed+=2.5
						infusionselect:Infusions++
						usr<<"The coin glows red for a moment, and the crystal crumbles into useless dust. A red runic mark has been etched into the coin."
						del(src)
					else if(src.EnchantType=="Cleave")
						infusionselect:BaseDigMulti+=3
						infusionselect:DrillSpeed+=2.5
						infusionselect:Infusions++
						usr<<"The coin glows blue for a moment, and the crystal crumbles into useless dust. A blue runic mark has been etched into the coin."
						del(src)


	Portal
		Level=50
		Cost=2000000
		Savable=1
		Grabbable=0
		Destructable=0
		density=1
		icon='BlackHole.dmi'
		desc="This portal allows transport to another portal linked to it. Portals can only be linked in pairs."
		verb/SetPassword()
			set src in oview(1)
			var/PasswordCheck
			if(src.Password)
				usr<<"This portal is already configured."
				return
			PasswordCheck=input("Input the desired password. This won't work if two portals already share the same password!")as text
			var/PortalChecker=0
			for(var/obj/Items/Enchantment/Portal/A in world)
				if(A.Password==PasswordCheck)
					PortalChecker++
			if(PortalChecker>=2)
				usr<<"Sorry, but this password is in use by two portals already..."
				src.Password=null
				return
			else if(PortalChecker==1)
				usr<<"The portal shimmers as it links with the other one set to this magical frequency. It can no longer be moved."
				src.Password=PasswordCheck
				src.Grabbable=0
				return
			else
				usr<<"The portal is ready to be linked to another. It can no longer be moved."
				src.Password=PasswordCheck
				src.Grabbable=0
				return
	LinkingBook
		Level=55
		Cost=5000000
		desc="This book lets you travel to a portal with the same magical frequency (password) as the book itself. If you have two portals with the same, you can choose. The book is highly malible magic wise, and the password may be changed at will."
		verb/SetPassword()
			set src in usr
			set name="Infuse Magical Signature"
			src.Password=input("Input a password.",src.Password)as text
			usr<<"The book has been aligned with a magical frequency ([src.Password])."
		verb/GoToPortal()
			if(src.Password==null)
				usr<<"Configure a password first!"
				return
			var/PortalChecker=0
			var/list/PortalsFound=list("Cancel")
			for(var/obj/Items/Enchantment/Portal/A in world)
				if(A.Password==src.Password)
					PortalChecker++
					PortalsFound.Add(A)
			if(PortalChecker==0)
				usr<<"There's no portals to go to!"
				return
			else
				var/obj/selection=input("")in PortalsFound
				if(selection=="Cancel")
					return
				else
					usr.OMessage(15,"[usr] flips open a book, magical energies beginning to flow!","[usr]([usr.key]) is using a Linking Book.")
					sleep(20)
					usr.loc=locate(selection.x,selection.y,selection.z)
	ArcanicOrb
		Level=25
		Cost=750000
		icon='enchantmenticons.dmi'
		icon_state="ArcanOrb"
		desc="Used to view though Arcanic Eyes. Only works on people on the same planet (z plane) as the user."
		var/Active=1
		verb/Toggle()
			set src in usr
			set name="Toggle On/Off"
			if(src.Active)
				src.Active=0
				usr<<"Orb toggled off."
			else
				src.Active=1
				usr<<"Orb toggled off."
		verb/SetPassword()
			set src in usr
			set name="Calibrate Magical Signature"
			if(src.Password)
				var/Passcheck=input("This already has a signature. Enter it to reset it.")as text
				if(Passcheck!=src.Password)
					usr<<"Incorrect signature."
					return
				else
					src.Password=null
					usr<<"The signature has been reset. Use this verb again to set a new password."
					return
			else
				src.Password=input("Enter the desired signature.")as text
				usr<<"The orb glows as you calibrate it to a magical frequency."
		verb/ViewEye()
			set src in usr
			set name="View though Eye"
			var/list/ValidEyes=list("Cancel")
			for(var/mob/Players/A in world)
				if(A.z==usr.z||src.EnchantLock==1)
					for(var/obj/Items/Enchantment/ArcanicEye/B in A)
						if(B.Password==src.Password&&B.suffix)
							ValidEyes+=A
			var/obj/pickeye=input("")in ValidEyes
			if(pickeye=="Cancel")
				usr.client.eye=usr
			else
				usr.client.eye=pickeye
		verb/ImproveEye()
			set src in usr
			set name="Enchant Orb"
			if(usr.EnchantmentLevel<34)
				usr<<"You require 35 Enchantment to enchant the Arcanic Orb to have greater range."
				return
			if(src.EnchantLock)
				usr<<"This already has been enchanted."
				return
			src.EnchantLock=1
			usr<<"The Orb can now see attuned Eyes from a greater distance."
		verb/SpeakEye()
			set src in usr
			set name="Speak Though Tongue"
			var/TextColor
			for(var/obj/Communication/X in usr)
				TextColor=X.Text_Color
			var/list/ValidTongues=list("Cancel")
			for(var/mob/Players/A in world)
				for(var/obj/Items/Enchantment/ArcanicTongue/B in A)
					if(B.Password==src.Password&&B.suffix)
						ValidTongues+=A
			var/mob/picktongue=input("")in ValidTongues
			if(picktongue!="Cancel")
				var/voiceselect=input("Use your voice, or the holder of the tongue's?")in list("Your Voice","Tongue Holder")
				var/texttosay=input("Say stuffs.")as text|null
				if(texttosay==null)
					return
				if(voiceselect=="Your Voice")
					for(var/mob/E in hearers(12,picktongue))
						if(E.Timestamp)
							E<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[TextColor]>[picktongue][E.Controlz(picktongue)] says with the voice of [usr]: [html_encode(texttosay)]"
							Log(E.ChatLog(),"<font color=green>[picktongue]([picktongue.key]) says with the voice of [usr]: [html_encode(texttosay)]")
						else
							E<<"<font color=[TextColor]>[picktongue][E.Controlz(picktongue)] says with the voice of [usr]: [html_encode(texttosay)]"
							Log(E.ChatLog(),"<font color=green>[picktongue]([picktongue.key]) says with the voice of [usr]: [html_encode(texttosay)]")
				else
					for(var/obj/Communication/X in picktongue)
						TextColor=X.Text_Color
					for(var/mob/E in hearers(12,picktongue))
						if(E.Timestamp)
							E<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=[TextColor]>[picktongue][E.Controlz(picktongue)] says: [html_encode(texttosay)]"
							Log(E.ChatLog(),"<font color=green>[picktongue]([picktongue.key]) says: [html_encode(texttosay)]")
						else
							E<<"<font color=[TextColor]>[picktongue][E.Controlz(picktongue)] says: [html_encode(texttosay)]"
							Log(E.ChatLog(),"<font color=green>[picktongue]([picktongue.key]) says: [html_encode(texttosay)]")

	ArcanicEye
		Level=25
		Cost=500000
		icon='ArcanicEyes.dmi'
		icon_state="ArcanEye"
		desc="Replaces one of a person's eyes with an arcanicly creted one. The maker can see though it at will if the person has it equipped, but cannot interact with the person installed with it remotely."
		verb/SetPassword()
			set src in oview(1)
			set name="Infuse Magical Signature"
			if(src.Password)
				usr<<"This Arcanic Eye are already infused with a magical signature."
				return
			else
				src.Password=input("Enter the desired magical frequency.")as text
				usr<<"The runic symbols on the eye glow briefly, indicating it is ready."

	ArcanicEar
		Level=40
		Cost=750000
		icon='enchantmenticons.dmi'
		icon_state="ArcanEar"
		desc="Allows someone with a Arcanic Orb to hear though it."
		verb/SetPassword()
			set src in oview(1)
			set name="Infuse Magical Signature"
			if(src.Password)
				usr<<"This Arcanic Ear are already infused with a magical signature."
				return
			else
				src.Password=input("Enter the desired magical frequency.")as text
				usr<<"The runic symbols on the ear glow briefly, indicating it is ready."

	ArcanicTongue
		Level=60
		Cost=1000000
		icon='enchantmenticons.dmi'
		desc="Allows someone with a Arcanic Orb to speak though it, in either your voice or the user of the orb."
		verb/SetPassword()
			set src in oview(1)
			set name="Infuse Magical Signature"
			if(src.Password)
				usr<<"This Arcanic Tongue is already infused with a magical signature."
				return
			else
				src.Password=input("Enter the desired magical frequency.")as text
				usr<<"The runic symbols on the tongue glow briefly, indicating it is ready."



obj/Items/Enchantment/Staff
	Level=10
	Cost=35000
	icon='MageStaff.dmi'
	var/Points=0
	var/PointsAssigned=0
	var/Staff_Power=0.1
	var/Mana_Drain=0.1
	var/Mana_Recov=0
	var/Element=0
	var/Homing=0
	var/Cursed=0
	var/StaffIconSelected=0
	desc="Staffs alter the effects of fighting with Spells."
	New()
		..()
		spawn()src.Update_Description()
	proc/Update_Description()
		desc="[src]<br>\
		Staff Power: [Staff_Power]<br>\
		Mana Drain Multiplier: [Mana_Drain]<br>\
		Element:[Element]<br>\
		"
	verb/Customize_Staff()
		set src in usr
		winshow(usr,"StaffCustomization",0)
		if(src in usr.contents)
			if(PointsAssigned==0)
				Points=30
				PointsAssigned=1
			winshow(usr,"StaffCustomization",1)
			usr.Customizing=src
			usr.UpdateStaffWindow(src)

mob/proc
	UpdateStaffWindow(var/obj/Items/Enchantment/Staff/I)
		if(I)
			if(istype(I,/obj/Items/Enchantment/Staff))
				winset(usr,"StaffPoints","text=[I.Points]")
				var/list/changes=list("LabelStaffPower","LabelManaDrain","LabelManaRecov","LabelStaffElement")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelStaffPower")blah="[I.Staff_Power]"
						if("LabelManaDrain")blah="[I.Mana_Drain]"
						if("LabelManaRecov")blah="[I.Mana_Recov]"
						if("LabelStaffElement")blah="[I.Element]"
					winset(usr,x,"text=[blah]")


//mob/var/tmp/Customizing
mob/Players/verb/CustomizeStaff(type as text)
	set name=".StaffCustomization"
	set hidden=1
	var/obj/Items/Enchantment/Staff/Q=usr.Customizing
	if(Q)
		if(istype(Q,/obj/Items/Enchantment/Staff))
			if(Q.Points>0)
				if(type in list("Staff_Power","Mana_Drain"))
					Q.vars["[type]"]+=0.1
					Q.Points--
					UpdateStaffWindow(Q)
				else
					if(Q.Points>=10)
						if(type in list("Mana_Recov"))
							if(!Q.vars["[type]"])
								Q.vars["[type]"]=1
								Q.Points-=10
								UpdateStaffWindow(Q)
						else if(type in list("Elemental"))
							if(Q.Element)
								usr<<"This staff already has been imbued with a Element. It would damage the staff to try to replace it."
								return
							var/Choice2=input("Select a Element. You may only have one.") in list ("Fire","Wind","Earth","Water")
							if(Q.Points<10)return
							switch(Choice2)
								if("Fire")
									Q.Element="Fire"
								if("Wind")
									Q.Element="Wind"
								if("Earth")
									Q.Element="Earth"
								if("Water")
									Q.Element="Water"
							Q.Points-=10
							UpdateStaffWindow(Q)
				Q.Update_Description()
				sleep(1)

obj/Items/Enchantment/SpaceTravelParts/Misc
	var/SpeedModification=1
	var/FuelUsageModification=1
	var/MaxFuelModification=0
	CrystalFuelConverter
		icon='SpaceParts.dmi'
		icon_state="CrystalFC"
		FuelUsageModification=0.95
		SpeedModification=0.95
		Level=55
		Cost=5000000
		desc="This part, when installed in a Pod or Ship, allows one to reduce fuel costs with their Enchantment Mod instead of Intelligence. Slightly improves fuel usage as well."

obj/Items/Enchantment/SpaceTravelParts/Engines
	var/SpeedModification=1
	var/FuelUsageModification=1
	var/MaxFuelModification=0
	CrystalManaDriver
		icon='SpaceParts.dmi'
		icon_state="CMDriver"
		FuelUsageModification=0.95
		SpeedModification=1.25
		Level=60
		Cost=6000000
		desc="While not as fast as some engines, this device, created out of enchantable crystal, has great fuel usage. It leaves sparkles behind the craft, however."

obj/Items/Enchantment
	var/EnchantLock=0
	AutoDrillParts
		icon='ModularDrill.dmi'
		var/DrillSpeed
		var/Lvl
		var/BaseDigMulti
		var/Material="Crystal"
		Driveshaft/CrystalDriveShaft
			icon_state="CrystalDS"
			desc="A driveshaft made out of pure crystal. It is highly enchantable."
			Level=26
			Cost=220000
			Lvl=9
			BaseDigMulti=1.75
			DrillSpeed=30
			verb/Enchant()
				set src in oview(1)
				set name="Enchant Driveshaft"
				if(src.EnchantType)
					usr<<"This Driveshaft is already enchanted."
					return
				if(src.EnchantLock==1)
					usr<<"You can't enchant while enchanting. Either cancel, or select a enchantment."
					return
				src.EnchantLock=1
				var/enchantselect=input("Select the enchantment type for the driveshaft. This cannot be undone.") in list ("Rotational","Pressure","Power","Higher Tier Enchants","Cancel")
				switch(enchantselect)
					if("Rotational")
						var/confirmation=input("This enchantment reinforces the crystal, reducing the dig time by 1.5 seconds.") in list("Yes","No")
						if(confirmation=="Yes")
							src.EnchantType="Rotational"
							src.DrillSpeed+=-15
							usr<<"The driveshaft seems able to withstand faster rotations..."
							return
						else
							src.EnchantLock=0
							return
					if("Pressure")
						var/confirmation=input("This enchant lets the driveshaft exert more pressure on the drillhead, increasing the base dig rate multiplier by 0.35.") in list("Yes","No")
						if(confirmation=="Yes")
							src.EnchantType="Pressure"
							src.BaseDigMulti+=0.35
							usr<<"The driveshaft seems to exert more pressure on the drillhead..."
						else
							src.EnchantLock=0
							return
					if("Power")
						var/confirmation=input("This enchant charges the driveshaft with energy, enhancing its Level, or Base Dig Rate, by 6.")
						if(confirmation=="Yes")
							src.EnchantType="Power"
							src.Lvl+=6
							usr<<"The driveshaft glows with energy..."
						else
							src.EnchantLock=0
							return
					if("Higher Tier Enchants")
						if(usr.EnchantmentLevel<29)
							usr<<"You need at least level 30 enchantment to use the higher tier Enchants."
							return
						var/highenchantselect=input("Select the enchantment type for the driveshaft.") in list ("Starlight","Cancel")
						switch(highenchantselect)
							if("Starlight")
								var/confirmation=input("This enchant, in addition to reducing drill speed by 0.5 seconds, increasing the Base Dig Multiplier by 0.2, and increasing Base Dig Rate by 2, functions somewhat poorly during the day, but dramatically improves during the night.") in list("Yes","No")
								if(confirmation=="Yes")
									src.EnchantType="Starlight"
									src.DrillSpeed+=-5
									src.BaseDigMulti+=0.2
									src.Lvl+=2
									usr<<"The driveshaft sparkles with starlight."
								else
									src.EnchantLock=0
									return
					if("Cancel")
						src.EnchantLock=0
		Engine/CrystalEngine
			icon_state="CrystalEngine"
			Level=27
			Cost=260000
			Lvl=9
			BaseDigMulti=1.75
			DrillSpeed=-15
			verb/Enchant()
				set src in oview(1)
				set name="Enchant Engine"
				if(src.EnchantType)
					usr<<"This engine is already enchanted."
					return
				if(src.EnchantLock==1)
					usr<<"You can't enchant while enchanting. Either cancel, or select a enchantment."
					return
				src.EnchantLock=1
				var/enchantselect=input("Select the enchantment type for the engine. This cannot be undone.") in list ("Rotational","Pressure","Power","Cancel")
				switch(enchantselect)
					if("Rotational")
						var/confirmation=input("This enchantment reinforces the crystal, reducing the dig time by 1.5 seconds.") in list("Yes","No")
						if(confirmation=="Yes")
							src.EnchantType="Rotational"
							src.DrillSpeed+=-15
							usr<<"The engine seems to be able to spin the Driveshaft faster now..."
							return
						else
							src.EnchantLock=0
							return
					if("Pressure")
						var/confirmation=input("This enchant lets the engine exert more pressure on the drillhead, increasing the base dig rate multiplier by 0.35.") in list("Yes","No")
						if(confirmation=="Yes")
							src.EnchantType="Pressure"
							src.BaseDigMulti+=0.35
							usr<<"The engine seems to exert more pressure on the drillhead..."
						else
							src.EnchantLock=0
							return
					if("Power")
						var/confirmation=input("This enchant charges the engine with energy, enhancing its Level, or Base Dig Rate, by 6.")
						if(confirmation=="Yes")
							src.EnchantType="Power"
							src.Lvl+=6
							usr<<"The engine glows with energy..."
						else
							src.EnchantLock=0
							return
					if("Cancel")
						src.EnchantLock=0
		Drillhead/CrystalDrillhead
			icon_state="CrystalDH"
			Level=28
			Cost=300000
			Lvl=9
			BaseDigMulti=1.75
			DrillSpeed=30
			verb/Enchant()
				set src in oview(1)
				set name="Enchant Drillhead"
				if(src.EnchantType)
					usr<<"This drillhead is already enchanted."
					return
				if(src.EnchantLock==1)
					usr<<"You can't enchant while enchanting. Either cancel, or select a enchantment."
					return
				src.EnchantLock=1
				var/enchantselect=input("Select the enchantment type for the drillhead. This cannot be undone.") in list ("Sharpness","Chaotic","Haste","Cancel")
				switch(enchantselect)
					if("Sharpness")
						var/confirmation=input("This enchant sharpens the tip of the drillhead, reducing dig time by 0.5 seconds, increasing Dig Multiplier by 0.25, and increasing the base dig rate by 4.") in list("Yes","No")
						if(confirmation=="Yes")
							src.EnchantType="Sharpness"
							src.DrillSpeed=-5
							src.BaseDigMulti+=0.25
							src.Lvl+=4
							usr<<"The drillhead seems sharper..."
							return
						else
							src.EnchantLock=0
							return
					if("Chaotic")
						var/confirmation=input("This enchant warps the drillhead, increasing dig time by 1 seconds, and Base Dig Rate by 1. Its special features are unpredictable, however.") in list ("Yes","No")
						if(confirmation=="Yes")
							src.EnchantType="Chaotic"
							src.DrillSpeed+=10
							src.Lvl+=1
							usr<<"The drillhead seems to shift and appear somewhat differently each time you look at it..."
						else
							src.EnchantLock=0
							return
					if("Haste")
						var/confirmation=input("This enchant makes the drillhead even faster, reducing dig time by 3 seconds. There is a small chance each dig cycle that the increased speed grants bonus resources!") in list ("Yes","No")
						if(confirmation=="Yes")
							src.EnchantType="Haste"
							src.DrillSpeed=-30
							usr<<"The drillhead seems to have changed shape to faciliate speed..."
						else
							src.EnchantLock=0
							return
					if("Cancel")
						src.EnchantLock=0

	Drillbits
		icon='ModularDrill.dmi'
		var/DigMulti=0
//		var/EnchantType
		var/Material
		Crystal
			icon_state="CrystalDrillbit"
			name="Crystal Drillbit"
			Level=20
			DigMulti=35
			Cost=250000
			Material="Crystal"
			desc="A drillbit crafted out of highly enchantable crystal. It is compatible with a item made with Technology."
			verb/Enchant()
				set src in oview(1)
				set name="Enchant Drillbit"
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
					if("Cancel")
						src.EnchantLock=0

obj/Items/Enchantment/DigEnhancement
	var/DigMulti=1
	CrystalShovel
		icon='enchantmenticons.dmi'
		icon_state="CS"
		Level=10
		Cost=12500
		DigMulti=15
		desc="A shovel made out of highly enchantable crystal."
		verb/Color()
			set src in oview(1)
			set name="Set Crystal Color"
			var/cc=input("Select the color for the shovel.") in list ("Blue","Red","Green","Yellow","Black","White")
			switch(cc)
				if("Blue")
					src.icon_state="CS"
				if("Red")
					src.icon_state="CSR"
				if("Green")
					src.icon_state="CSG"
				if("Yellow")
					src.icon_state="CSY"
				if("Black")
					src.icon_state="CSB"
				if("White")
					src.icon_state="CSW"
		verb/Enchant()
			set src in oview(1)
			set name="Enchant Shovel"
			if(src.EnchantType)
				usr<<"This shovel is already enchanted."
				return
			if(src.EnchantLock==1)
				usr<<"You can't enchant while enchanting. Either cancel, or select a enchantment."
				return
			src.EnchantLock=1
			var/enchantselect=input("Select the enchantment type for the shovel. This cannot be undone.") in list ("Sharpness","Chaotic","Haste","Cancel")
			switch(enchantselect)
				if("Sharpness")
					src.DigMulti+=10
					src.EnchantType="Sharpness"
					usr<<"The shovel seems sharper, able to cut though harder rocks..."
					return
				if("Chaotic")
					src.EnchantType="Chaotic"
					usr<<"The shovel seems to shift and appear somewhat differently each time you look at it..."
				if("Haste")
					src.EnchantType="Haste"
					usr<<"The shovel seems to make you slightly faster at digging as you hold it..."
				if("Cancel")
					src.EnchantLock=0

obj/Items/Enchantment/Potions
	var/PotionsRemaining=1
	New()
		suffix="[PotionsRemaining]"
	Antidote
		Level=2
		Cost=15000
		icon='enchantmenticons.dmi'
		icon_state="ADP1"
		desc="This potion counters poisons."
		proc/Anti_Drink()
			if(src)
				view(usr)<<"[usr] drinks an [src]"
				usr.Antidote+=0.05
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)

	HealingPotion
		Level=2
		Cost=15000
		icon='enchantmenticons.dmi'
		icon_state="PoH2"
		desc="This potion heals the body of injuries for 10 seconds, activating non-meditation regeneration."
		proc/PoH_Drink()
			if(src)
				usr.OMessage(12,"[usr] drinks a [src]","<font color=red>[usr]([usr.key]) drank a [src].")
				usr.PoH_Heal(5)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)

	EnergyPotion
		Level=3
		Cost=15000
		icon='enchantmenticons.dmi'
		icon_state="PoE2"
		desc="This potion restores lost energy for 10 seconds."
		proc/PoE_Drink()
			if(src)
				usr.OMessage(12,"[usr] drinks a [src]","<font color=red>[usr]([usr.key]) drank a [src].")
				usr.PoE_Heal(5)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)

	ManaPotion
		Level=4
		Cost=15000
		icon='enchantmenticons.dmi'
		icon_state="PoM2"
		desc="This potion restores Mana for 10 seconds."
		proc/PoM_Drink()
			if(src)
				usr.OMessage(12,"[usr] drinks a [src]","<font color=red>[usr]([usr.key]) drank a [src].")
				usr.PoM_Heal(5)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)

	HiPotion
		Level=12
		Cost=45000
		icon='enchantmenticons.dmi'
		icon_state="PoH1"
		desc="A more powerful healing potion, this one heals for 10 seconds and for a far stronger effect."
		proc/PoH_Drink()
			if(src)
				usr.OMessage(12,"[usr] drinks a [src]","<font color=red>[usr]([usr.key]) drank a [src].")
				usr.PoH_Heal(10)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)

	Ether
		Level=13
		Cost=45000
		icon='enchantmenticons.dmi'
		icon_state="PoE1"
		desc="A more powerful means of energy restoration."
		proc/PoE_Drink()
			if(src)
				usr.OMessage(12,"[usr] drinks a [src]","<font color=red>[usr]([usr.key]) drank a [src].")
				usr.PoE_Heal(10)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)

	Elixer
		Level=15
		Cost=60000
		icon='enchantmenticons.dmi'
		icon_state="PoM1"
		desc="This potion heals both health and energy for ten seconds."
		proc/PoM_Drink()
			if(src)
				usr.OMessage(12,"[usr] drinks a [src]","<font color=red>[usr]([usr.key]) drank a [src].")
				usr.PoH_Heal(7.5)
				usr.PoE_Heal(7.5)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)

	FrostPotion
		Level=15
		Cost=50000
		icon='enchantmenticons.dmi'
		icon_state="FP"
		desc="This helps reduce damage from being in hot enviroments."

	FlamePotion
		Level=16
		Cost=52000
		icon='enchantmenticons.dmi'
		icon_state="FLP"
		desc="This helps reduce damage from being in cold enviroments."

obj/Items/Enchantment/Book_of_Hitting
	Pickable=0
	Level=1000
	Health=10000
	icon='HittingBook.dmi'
	Cost=10000
	density=1
	verb/Upgrade()
		set src in oview(1)
		set category=null
		if(!(usr.client.mob in range(1,src))) return
		if(istype(src,/obj/Items/Enchantment/Book_of_Hitting))
			var/Amount=input("Reinforce the [src] by how much?","Upgrade") as num
			if(Amount>0)
				for(var/obj/Money/M in usr)
					if(M.Level>=Amount)
						src.icon_state=""
						M.Level-=Amount
						src.Health+=Amount*usr.Enchantment*4*usr.Enchantment*4*usr.Enchantment
						LogPEndurance+=Amount*(usr.Enchantment*0.05)/10
						usr<<"[Commas(Amount*usr.Enchantment*4*usr.Enchantment*4*usr.Enchantment)] Health and [Commas(Amount*(usr.Enchantment*0.05)/10)] Endurance added to [src]"


/*
//BUFF POTIONS
//I just had an idea for these so I figured you know, I might as well list them here.
//Super and Perm Buff potions would be Wizard-related classes only.
*/
//FIRST TIER(1.25x?)

obj/Items/Enchantment/PotionBrewingStand
	Level=20
	Cost=500000
	name="Potion Brewing Stand"
	icon='enchantmenticons.dmi'
	icon_state="PBS"
	desc="This is used while in your inventory to remove the need to be near your Cauldrons to make Potions. You may make your potions as normal as long as this is in your inventory. It will also work if you have it out in the world for whatever reason."

obj/Items/Enchantment/BuffPotions
	var/PotionsRemaining=1
	var/PotionType
	New()
		suffix="1"
	StrengthPotion
		Level=15
		Cost=50000
		name="Strength Potion"
		PotionType="Strength"
		icon='enchantmenticons.dmi'
		icon_state="BPSTR"
		desc="This potion increases Strength for 90 seconds by a small amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Strength Potion.")
				usr.BuffPotion("Strength",1)
/*				usr.StrengthMultiplier*=1.25
				usr.StrengthPotion=1
				usr.BuffPotion=90*/
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	StrengthPotion2
		Level=35
		Cost=125000
		name="Strength Potion+"
		PotionType="Strength"
		icon='enchantmenticons.dmi'
		icon_state="BPSTR+"
		desc="This potion increases Strength for 90 seconds by a decent amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Strength Potion+.")
				usr.BuffPotion("Strength",2)
/*				usr.StrengthMultiplier*=1.25
				usr.StrengthPotion=1
				usr.BuffPotion=90*/
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	ForcePotion
		Level=15
		Cost=50000
		name="Force Potion"
		PotionType="Force"
		icon='enchantmenticons.dmi'
		icon_state="BPFOR"
		desc="This potion increases Force for 90 seconds by a small amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Force Potion.")
/*				usr.ForceMultiplier*=1.25
				usr.ForcePotion=1
				usr.BuffPotion=90*/
				usr.BuffPotion("Force",1)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	ForcePotion2
		Level=35
		Cost=125000
		name="Force Potion+"
		PotionType="Force"
		icon='enchantmenticons.dmi'
		icon_state="BPFOR+"
		desc="This potion increases Force for 90 seconds by a decent amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Force Potion+.")
/*				usr.ForceMultiplier*=1.25
				usr.ForcePotion=1
				usr.BuffPotion=90*/
				usr.BuffPotion("Force",2)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	ResistancePotion
		Level=15
		Cost=50000
		name="Resistance Potion"
		PotionType="Resistance"
		icon='enchantmenticons.dmi'
		icon_state="BPRES"
		desc="This potion increases Resistance for 90 seconds by a small amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Resistance Potion.")
				usr.BuffPotion("Resistance",1)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	ResistancePotion2
		Level=35
		Cost=125000
		name="Resistance Potion+"
		PotionType="Resistance"
		icon='enchantmenticons.dmi'
		icon_state="BPRES+"
		desc="This potion increases Resistance for 90 seconds by a decent amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Resistance Potion+.")
				usr.BuffPotion("Resistance",2)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	EndurancePotion
		Level=15
		Cost=50000
		name="Endurance Potion"
		PotionType="Endurance"
		icon='enchantmenticons.dmi'
		icon_state="BPEND"
		desc="This potion increases Endurance for 90 seconds by a small amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Endurance Potion.")
				usr.BuffPotion("Endurance",1)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	EndurancePotion2
		Level=35
		Cost=125000
		name="Endurance Potion+"
		PotionType="Endurance"
		icon='enchantmenticons.dmi'
		icon_state="BPEND+"
		desc="This potion increases Endurance for 90 seconds by a decent amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Endurance Potion+.")
				usr.BuffPotion("Endurance",2)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	OffensePotion
		Level=15
		Cost=50000
		name="Offense Potion"
		PotionType="Offense"
		icon='enchantmenticons.dmi'
		icon_state="BPOFF"
		desc="This potion increases Offense for 90 seconds by a small amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Offense Potion.")
				usr.BuffPotion("Offense",1)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	OffensePotion2
		Level=35
		Cost=125000
		name="Offense Potion+"
		PotionType="Offense"
		icon='enchantmenticons.dmi'
		icon_state="BPOFF+"
		desc="This potion increases Offense for 90 seconds by a decent amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Offense Potion+.")
				usr.BuffPotion("Offense",2)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	DefensePotion
		Level=15
		Cost=50000
		name="Defense Potion"
		PotionType="Defense"
		icon='enchantmenticons.dmi'
		icon_state="BPDEF"
		desc="This potion increases Defense for 90 seconds by a small amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Defense Potion.")
				usr.BuffPotion("Defense",1)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)
	DefensePotion2
		Level=35
		Cost=125000
		name="Defense Potion+"
		PotionType="Defense"
		icon='enchantmenticons.dmi'
		icon_state="BPDEF+"
		desc="This potion increases Defense for 90 seconds by a small amount."
		proc/Buff_Drink()
			if(src)
				usr.OMessage(12,"[usr] uses a [src]!","<font color=red>[usr]([usr.key]) drank a Defense Potion+.")
				usr.BuffPotion("Defense",2)
				src.PotionsRemaining--
				src.suffix="[Commas(src.PotionsRemaining)]"
				if(src.PotionsRemaining<=0)
					del(src)

//SECOND TIER, HIGH (1.5x?)
/*obj/Items/Enchantment/BuffPotions/HiStrengthPotion
	Level=30
	Cost=250000
	icon='enchantmenticons.dmi'
	icon_state="Buff"
	desc="This potion increases Strength for a minute by a good amount."
	proc/Buff_Drink()
		if(src)
			usr.OMessage(12,"[usr] drinks a potion!","<font color=red>[usr]([usr.key]) drank a [src].")
			if(Level>=100)
				Level=100
			usr.HiBuffStrength(1)
			del(src)

//THIRD TIER, SUPER(2x?)
obj/Items/Enchantment/BuffPotions/StrengthPotion
	Level=60
	Cost=1250000
	icon='enchantmenticons.dmi'
	icon_state="Buff"
	desc="This potion increases Strength for a minute by a large amount."
	proc/Buff_Drink()
		if(src)
			usr.OMessage(12,"[usr] drinks a potion!","<font color=red>[usr]([usr.key]) drank a [src].")
			if(Level>=100)
				Level=100
			usr.SuperBuffStrength
			del(src)
*/

/*
//An item to boost ManaMax, anyone?
obj/Items/Enchantment/ManaCapacityElixer
	Level=50
	Cost=5000000
	icon='enchantmenticons.dmi'
	icon_state="PoMM+"
	desc="This Permanently increases your Maximum Mana. You can only use at most, five of these potions."
	if(usr.MaxPotions>4)
		usr<<"You have use too many of these potions already!
		return
	else
		if(usr.Race=="Spirit Doll")
			if(usr.Class=="Wizard")
				usr.ManaMax+=50
				MaxPotions+=1
			else
				usr.ManaMax+25
				MaxPotions+=1
		else
			if(usr.Class=="Wizard"||usr.Class=="Healer||usr.Class=="Envy")
				usr.ManaMax+=20
				MaxPotions+=1
			else
				usr.ManaMax+=10
				MaxPotions+=1
*/
obj/Items/Enchantment/ButchDrink
	Level=9000
	Cost=50000000
	icon='enchantmenticons.dmi'
	icon_state="EoK"
	desc="Don't drink this you crazy ass nigga."
	proc/Butch_Drink()
		if(src)
			view(usr)<<"[usr] drinks a mysterious, bubbling, highly acidic beverage..."
			usr<<"You feel your knowledge expand dramatically, as the almost toxic potion courses though your veins! No, wait. That's not knowledge."
			if(usr.Class=="Butch")
				usr.ResistanceMod*=1.00000001
				usr<<"You feel slightly inebriated."
			else
				usr.Poison+=100
				usr.Poisoned=1
				spawn(1)usr.Poisoned_Check()
				usr<<"Your insides start melting."
				usr.ResistanceMod*=1.005
			del(src)
obj/Items/Enchantment/ElixerOfKnowledge
	Level=3500
	Cost=50000000
	icon='enchantmenticons.dmi'
	icon_state="EoK"
	desc="A potent, but dangerous potion. Increases your Enchantment Mod by 25%, but poisons you severely!"
	proc/EoK_Drink()
		if(src)
			if(usr.Elixer==0)
				view(usr)<<"[usr] drinks a mysterious potion..."
				usr<<"You feel your knowledge expand dramatically, as the almost toxic potion courses though your veins!"
				usr.Enchantment=(usr.Enchantment*1.25)
				usr.Poison=10
				spawn()usr.Poisoned_Check()
				usr.Elixer=1
				del(src)
			else
				usr<<"You can't use this, you've either already used one, or have used the Nanite Intelligence Booster."
				return
obj/Items/Enchantment/ElixerOfYouth
	Level=1000
	Cost=500000000
	icon='enchantmenticons.dmi'
	icon_state="EoK"
	desc="Trade your potential for near-immortality."
	proc/EoY_Drink()
		if(src)
			if(usr.ElixerY==0)
				view(usr)<<"[usr] drinks a mysterious potion..."
				usr<<"You feel your knowledge expand dramatically, as the almost toxic potion courses though your veins!"
				usr.contents+=new/obj/Regenerate
				for(var/obj/Regenerate/x in usr)
					x.Level=usr.Potential
				usr.Potential=0
				usr.ElixerY=1
				del(src)
			else
				usr<<"You can't use this."
				return

obj/Items/Enchantment/Devil_Fruit
	var/FruitType
	Level=9001
	Cost=1
	icon='enchantmenticons.dmi'
	icon_state="FoM"
	Password="Yo"
	proc/Devil_Raping()
		if(usr.FruitEaten)
			usr<<"You fucked up, bitch."
			usr.Death(null, "eating a second Devil Fruit!")
			usr.FruitEaten=0
			usr.DevilFruitType="Ex"
			usr.LogiaDefense=0
			del(src)
		else if(src.FruitType=="Paramecia")
			usr<<"You feel strange..."
			usr.SpdMult(1.3)
			usr.OffMult(1.25)
			usr.DefMult(1.25)
			usr.EnergyMult(1.25)
			usr.DevilFruitType=src.FruitType
			usr.FruitEaten=1
			del(src)
		else if(src.FruitType=="Zoan")
			usr<<"You feel strange..."
			usr.StrMult(1.35)
			usr.EndMult(1.35)
			usr.ResMult(1.35)
			usr.RegenMult(2)
			usr.EnhancedSmell=1
			usr.EnhancedHearing=1
			usr.DevilFruitType=src.FruitType
			usr.FruitEaten=1
			del(src)
		else if(src.FruitType=="Logia")
			usr<<"You feel strange..."
			usr.ForMult(1.5)
			usr.SpdMult(1.15)
			usr.RecovMult(1.25)
			usr.DevilFruitType=src.FruitType
			usr.FruitEaten=1
			usr.LogiaDefense=1
			del(src)
		else
			usr<<"An admin needs to edit this fruit, nigga."
			return

obj/Items/Enchantment/Might_Fruit
	Level=9001
	Cost=1
	icon='enchantmenticons.dmi'
	icon_state="FoM"
	proc/Might_Nomming()
		if(usr.MightConsumption==0)
			view(usr)<<"[usr] eats a strange orange coloured fruit."
			usr<<"Power inundates your being as you consume the fruit, your power swells significantly."
			usr.Base*=1.5
			usr.EnergyMax*=1.5
			usr.EnergyMod*=1.5
			usr.BaseMod*=1.5
			usr.Strength*=1.2
			usr.Endurance*=1.2
			usr.Speed*=1.2
			usr.Offense*=1.2
			usr.Defense*=1.2
			usr.Resistance*=1.2
			usr.Speed*=1.2
			usr.Force*=1.2
			usr.MightConsumption=4
			del(src)
		else
			usr<<"You eat the fruit but don't notice any effects."
			del(src)
			return

obj/Items/Enchantment/Half_Might_Fruit
	Level=9001
	Cost=1
	icon='enchantmenticons.dmi'
	icon_state="HFoM"
	proc/Half_Might_Nomming()
		if(usr.MightConsumption==3)
			usr<<"Maths stop you from eating this. Go find a quarter piece or something."
			return
		if(usr.MightConsumption<=2)
			view(usr)<<"[usr] eats half of a strange orange coloured fruit."
			usr<<"You eat the half section of fruit, a sudden burst of energy surges through your veins as your power increases."
			usr.Base*=1.22
			usr.EnergyMax*=1.22
			usr.EnergyMod*=1.22
			usr.BaseMod*=1.22
			usr.Strength*=1.095
			usr.Endurance*=1.095
			usr.Speed*=1.095
			usr.Offense*=1.095
			usr.Defense*=1.095
			usr.Resistance*=1.095
			usr.Speed*=1.095
			usr.Force*=1.095
			usr.MightConsumption+=2
			del(src)
			//Was trying to make an else if statement here, that if their Consumption==3
			//Then the game wouldn't let them eat the fruit and it wouldn't use it. I Couldn't get it to work though. I'm new at this. Meow. - Asari
		else
			usr<<"You eat the fruit but don't notice any effects."
			del(src)
			return

obj/Items/Enchantment/Quarter_Might_Fruit
	Level=9001
	Cost=1
	icon='enchantmenticons.dmi'
	icon_state="QFoM"
	proc/Quarter_Might_Nomming()
		if(usr.MightConsumption<=4)
			view(usr)<<"[usr] eats a small slice of a strange orange coloured fruit."
			usr<<"You eat the small slice of the orange fruit, a trickle of energy makes its way through you as your power increases a little."
			usr.Base*=1.105
			usr.EnergyMax*=1.105
			usr.Strength*=1.0445
			usr.Endurance*=1.0445
			usr.Speed*=1.0445
			usr.Offense*=1.0445
			usr.Defense*=1.0445
			usr.Resistance*=1.0445
			usr.Speed*=1.0445
			usr.Force*=1.0445
			usr.MightConsumption+=1
			del(src)
		else
			usr<<"You eat the fruit but don't notice any effects."
			del(src)
			return

obj/Items/Enchantment/PocketDimensionGenerator
	var/DimensionType
	var/PortalStatus="Off"
	density=1
	Pickable=0
	icon='enchantmenticons.dmi'
	icon_state="PDG"
	desc="This magical device can create a small dimension just outside the boundries of the dimension its in. It doesn't work in other pocket dimensions."
	Level=300
	Cost=15000000
	Health=100000000000000000000000000000
	LogPEndurance=50000
	verb/SetPassword()
		set src in oview(1)
		set name="Set Password"
		if(src.Password)
			usr<<"This already has a password..."
		else
			src.Password=input("Enter the desired password.") as text
			usr<<"Password accepted. Your password is [src.Password]."
	verb/TogglePortal()
		set src in oview(1)
		set name="Toggle Portal"
		if(!src.DimensionType)
			usr<<"You must link the generator to a dimensional type first."
			return
		else
			if(src.Password)
				var/passcheck=input("Enter the edit password.") as text
				if(passcheck==src.Password)
					if(src.PortalStatus=="Off")
						new/obj/Effects/PocketPortal(locate(src.x,src.y+2,src.z))
						src.PortalStatus="On"
						usr<<"Successfully opened portal!"
						src.Grabbable=0
						for(var/obj/Effects/PocketPortal/C)
							if(!C.Password)
								C.Password=src.DimensionType
								return
					else if(src.PortalStatus=="On")
		//				var/obj/Items/Enchantment/PocketDimensionGenerator/LOL
						for(var/obj/Effects/PocketPortal/B)
							if(src.DimensionType==B.Password)
								del(B)
								usr<<"Successfully closed portal!"
								src.PortalStatus="Off"
								src.Grabbable=1
								return
						usr<<"Error: Unable to close portal. Overriding portal on/off state."
						src.PortalStatus="Off"
						src.Grabbable=1
				else
					usr<<"Incorrect password. Unable to toggle portal settings."
					return
			else
				if(src.PortalStatus=="Off")
					new/obj/Effects/PocketPortal(locate(src.x,src.y+2,src.z))
					src.PortalStatus="On"
					usr<<"Successfully opened portal!"
					src.Grabbable=0
					for(var/obj/Effects/PocketPortal/C)
						if(!C.Password)
							C.Password=src.DimensionType
							return
				else if(src.PortalStatus=="On")
	//				var/obj/Items/Enchantment/PocketDimensionGenerator/LOL
					for(var/obj/Effects/PocketPortal/B)
						if(src.DimensionType==B.Password)
							del(B)
							usr<<"Successfully closed portal!"
							src.PortalStatus="Off"
							src.Grabbable=1
							return
					usr<<"Error: Unable to close portal. Overriding portal on/off state."
					src.PortalStatus="Off"
					src.Grabbable=1
	verb/SetDimension()
		set src in oview(1)
		set name="Set Dimension"
		if(src.DimensionType)
			usr<<"This generator is already set, and cannot be changed."
			return
		else
			var/heh
			var/list/already=new
			for(var/obj/Items/Enchantment/PocketDimensionGenerator/W in world)
				already.Add(W.DimensionType)
			for(var/i=1, i<24, i++)
				if(already.Find(i))
					continue
				else
					heh=i
					usr<<"Dimension link complete. Dimension ID: [heh]."
					src.DimensionType=heh
					break
				if(!heh)
					usr<<"There are too many dimensions..."
					return

/*obj/Items/Enchantment/Books
	TomeOfTheEarth
		Level=18
		Cost=5000000
		icon='enchantmenticons.dmi'
		icon_state="BoEW"
		verb/Learn()
			if(!usr.ElementType)
				usr.ElementType="Earth"
				usr<<"You've learned the basics of Earth Magic..."
				del(src)
			else if(!usr.SecondElementType&&usr.ElementType!="Earth")
				usr.SecondElementType="Earth"
				usr<< "You have selected Earth as your second element."
				del(src)
			else
				usr<<"You can learn nothing from this book..."

	TomeOfTheFlames
		Level=18
		Cost=5000000
		icon='enchantmenticons.dmi'
		icon_state="BoFB"
		verb/Learn()
			if(!usr.ElementType)
				usr.ElementType="Fire"
				usr<<"You've learned the basics of Fire Magic..."
				del(src)
			else if(!usr.SecondElementType&&usr.ElementType!="Fire")
				usr.SecondElementType="Fire"
				usr<< "You have selected Fire as your second element."
				del(src)
			else
				usr<<"You can learn nothing from this book..."

	TomeOfTheWinds
		Level=18
		Cost=5000000
		icon='enchantmenticons.dmi'
		icon_state="BoTW"
		verb/Learn()
			if(!usr.ElementType)
				usr.ElementType="Wind"
				usr<<"You've learned the basics of Wind Magic..."
				del(src)
			else if(!usr.SecondElementType&&usr.ElementType!="Wind")
				usr.SecondElementType="Wind"
				usr<< "You have selected Wind as your second element."
				del(src)
			else
				usr<<"You can learn nothing from this book..."

	TomeOfTheTides
		Level=18
		Cost=5000000
		icon='enchantmenticons.dmi'
		icon_state="BoTT"
		verb/Learn()
			if(!usr.ElementType)
				usr.ElementType="Water"
				usr<<"You've learned the basics of Water Magic..."
				del(src)
			else if(!usr.SecondElementType&&usr.ElementType!="Water")
				usr.SecondElementType="Water"
				usr<< "You have selected Water as your second element."
				del(src)
			else
				usr<<"You can learn nothing from this book..."

	TomeOfTheStorms
		Level=40
		Cost=10000000000
		icon='enchantmenticons.dmi'
		icon_state="BoTS"
		desc="Knowledge of powerful Lightning magic is within this tome. You can use this even if you have two elements already."
		verb/Learn()
			if(!usr.AdvancedElement)
				usr.AdvancedElement="Lightning"
				usr<<"You've learned the basics of Lightning Magic..."
				del(src)
			else
				usr<<"You already have a Advanced Element."
				return

	TomeOfGravity
		Level=9001
		Cost=6000000
		icon='enchantmenticons.dmi'
		icon_state="BoG"
		verb/Learn()
			if(!locate(/obj/Skills/Magic/Gravity,usr.contents))
				usr.contents+=new/obj/Skills/Magic/Gravity
				usr<<"<i>Studying the tome has allowed you to learn the Gravity Spell!</i>"
				del(src)
			else
				usr<<"You can learn nothing from this book..."
	TomeOfKuroHitsugi
		Level=1000
		Cost=500000000
		icon='enchantmenticons.dmi'
		icon_state="BoG"
		verb/Learn()
			if(!locate(/obj/Skills/Attacks/KuroHitsugi,usr.contents))
				usr.contents+=new/obj/Skills/Attacks/KuroHitsugi
				usr<<"<i>Studying the tome has allowed you to learn Kuro Hitsugi!</i>"
				del(src)
			else
				usr<<"You can learn nothing from this book..."*/

obj/Items/Enchantment/Rings
	var/Points=0
	var/PointsAssigned=0
	var/EquipType="Ring"
	var/Active=0
	var/StrengthMulti=1
	var/EnduranceMulti=1
	var/SpeedMulti=1
	var/ForceMulti=1
	var/ResistanceMulti=1
	var/OffenseMulti=1
	var/DefenseMulti=1
	var/RegenerationMulti=1
	var/RecoveryMulti=1

	BraceletOfStrength
		Level=1200
		Cost=250000
		icon='enchantmenticons.dmi'
		icon_state="BoS"
		Points=0
		PointsAssigned=0
		EquipType="Ring"
		Active=0
		StrengthMulti=1.1
		EnduranceMulti=1.05
		SpeedMulti=0.95
		ForceMulti=1
		ResistanceMulti=1
		OffenseMulti=0.95
		DefenseMulti=1
		RegenerationMulti=1
		RecoveryMulti=1
		desc="A bracelet of strength, designed to bolster ones Strength by 10% and Endurance by 5%. However, it reduces your speed and offensive abilities by 5%."

	BraceletOfForce
		Level=1000
		Cost=250000
		icon='enchantmenticons.dmi'
		icon_state="BoS"
		Points=0
		PointsAssigned=0
		EquipType="Ring"
		Active=0
		StrengthMulti=0.90
		EnduranceMulti=0.95
		SpeedMulti=1
		ForceMulti=1.1
		ResistanceMulti=1.05
		OffenseMulti=1
		DefenseMulti=1
		RegenerationMulti=1
		RecoveryMulti=1
		desc="A bracelet of energy, designed to bolster ones Force by 10% and Resistance by 5%. However, it reduces your strength by 10%, and your endurance by 5%."

	MirrorWallBracelet
		Level=1100
		Cost=250000
		icon='enchantmenticons.dmi'
		icon_state="BoS"
		Points=0
		PointsAssigned=0
		EquipType="Ring"
		Active=0
		StrengthMulti=0.8
		EnduranceMulti=1.2
		SpeedMulti=0.95
		ForceMulti=0.8
		ResistanceMulti=1.2
		OffenseMulti=1
		DefenseMulti=1
		RegenerationMulti=1
		RecoveryMulti=1
		desc="A bracelet of defense, designed to increases Endurance and Resistance by 20%, but lowers your Strength and Force by 20% and speed by 5%."

	ImpactRing
		Level=1400
		Cost=250000
		icon='enchantmenticons.dmi'
		icon_state="RoR"
		Points=0
		PointsAssigned=0
		EquipType="Ring"
		Active=0
		StrengthMulti=1.1
		EnduranceMulti=0.9
		SpeedMulti=1
		ForceMulti=1.1
		ResistanceMulti=0.9
		OffenseMulti=1
		DefenseMulti=0.95
		RegenerationMulti=1
		RecoveryMulti=1
		desc="A ring that increases your Strength and Force by 10%, but lowers Endurance and Resistance by 10%, and Defense by 5%."


	RingofSorcery
		Level=2400
		Cost=600000
		icon='enchantmenticons.dmi'
		icon_state="RoS"
		Points=0
		PointsAssigned=0
		var/Reductions=0
		EquipType="Ring"
		Active=0
		StrengthMulti=1
		EnduranceMulti=1
		SpeedMulti=1
		ForceMulti=1
		ResistanceMulti=1
		OffenseMulti=1
		DefenseMulti=1
		RegenerationMulti=1
		RecoveryMulti=1
		desc="A ring of power, designed for your everyday Sorcerer. Those skilled in the art of Enchantment can improve it further."
		verb/Enchant()
			set src in usr
			winshow(usr,"RingofPower",0)
			if(src in usr.contents)
				if(PointsAssigned==0)
					Points=-1+round((usr.EnchantmentLevel/8))
					Reductions=1+round((usr.EnchantmentLevel/10))
					if(Points>=6)
						Points=6
					PointsAssigned=1
				winshow(usr,"RingofPower",1)
				usr.CustomizingEnchant=src
				usr.UpdateSorcererRingWindow(src)


mob/proc
	UpdateSorcererRingWindow(var/obj/Items/Enchantment/Rings/RingofSorcery/I)
		if(I)
			if(istype(I,/obj/Items/Enchantment/Rings/RingofSorcery))
				winset(usr,"EnchantPoints","text=[I.Points]")
				winset(usr,"LabelReductions","text=[I.Reductions]")
				var/list/changes=list("LabelStrengthMulti","LabelEnduranceMulti","LabelSpeedMulti","LabelForceMulti","LabelResistanceMulti","LabelOffenseMulti","LabelDefenseMulti","LabelRecoveryMulti")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelStrengthMulti")
							blah="[I.StrengthMulti]"
						if("LabelEnduranceMulti")
							blah="[I.EnduranceMulti]"
						if("LabelSpeedMulti")
							blah="[I.SpeedMulti]"
						if("LabelForceMulti")
							blah="[I.ForceMulti]"
						if("LabelResistanceMulti")
							blah="[I.ResistanceMulti]"
						if("LabelOffenseMulti")
							blah="[I.OffenseMulti]"
						if("LabelDefenseMulti")
							blah="[I.DefenseMulti]"
//						if("LabelRegenerationMulti")
//							blah="[I.RegenerationMulti]"
						if("LabelRecoveryMulti")
							blah="[I.RecoveryMulti]"
					winset(usr,x,"text=[blah]")

obj/proc/SorceryEquip(mob/A,var/show=1)
	var/obj/Items/Enchantment/Rings/RingofSorcery/_RingofSorcery
	if(istype(src,/obj/Items/Enchantment/Rings)){_RingofSorcery = src}
	else return
	if(_RingofSorcery.suffix&&_RingofSorcery.Active==1)
		_RingofSorcery.suffix=null
		_RingofSorcery.Active=0
		A.overlays-=_RingofSorcery.icon
		usr.StrengthMultiplier/=_RingofSorcery.StrengthMulti
		usr.EnduranceMultiplier/=_RingofSorcery.EnduranceMulti
		usr.SpeedMultiplier/=_RingofSorcery.SpeedMulti
		usr.ForceMultiplier/=_RingofSorcery.ForceMulti
		usr.ResistanceMultiplier/=_RingofSorcery.ResistanceMulti
		usr.OffenseMultiplier/=_RingofSorcery.OffenseMulti
		usr.DefenseMultiplier/=_RingofSorcery.DefenseMulti
		usr.RegenerationMultiplier/=_RingofSorcery.RegenerationMulti
		usr.RecoveryMultiplier/=_RingofSorcery.RecoveryMulti
	else
		_RingofSorcery.suffix="Equipped"
		_RingofSorcery.Active=1
		usr.StrengthMultiplier*=_RingofSorcery.StrengthMulti
		usr.EnduranceMultiplier*=_RingofSorcery.EnduranceMulti
		usr.SpeedMultiplier*=_RingofSorcery.SpeedMulti
		usr.ForceMultiplier*=_RingofSorcery.ForceMulti
		usr.ResistanceMultiplier*=_RingofSorcery.ResistanceMulti
		usr.OffenseMultiplier*=_RingofSorcery.OffenseMulti
		usr.DefenseMultiplier*=_RingofSorcery.DefenseMulti
		usr.RegenerationMultiplier*=_RingofSorcery.RegenerationMulti
		usr.RecoveryMultiplier*=_RingofSorcery.RecoveryMulti
		if(show)
			A.overlays+=_RingofSorcery.icon

mob/var/tmp/CustomizingEnchant
mob/Players/verb/Enchant(type as text)
	set name=".RingofPower"
	set hidden=1
	var/obj/Items/Enchantment/Rings/RingofSorcery/Q=usr.CustomizingEnchant
	if(Q)
		if(istype(Q,/obj/Items/Enchantment/Rings/RingofSorcery))
			if(Q.Points>0)
				if(type in list("Strength","Endurance","Speed","Force","Resistance","Offense","Defense","Regeneration","Recovery"))
					if(type == "Recovery")
						if(Q.RecoveryMulti>=1.15)
							return
						else if(Q.RecoveryMulti==1.13)
							Q.vars["RecoveryMulti"]+=0.02
						else if(Q.RecoveryMulti==1.1)
							Q.vars["RecoveryMulti"]+=0.03
						else if(Q.RecoveryMulti==1.05)
							Q.vars["RecoveryMulti"]+=0.05
						else if(Q.RecoveryMulti==1.02)
							Q.vars["RecoveryMulti"]+=0.03
						else if(Q.RecoveryMulti==1)
							Q.vars["RecoveryMulti"]+=0.02
						else
							Q.vars["RecoveryMulti"]+=0.05
					if(type == "Regeneration")
						if(Q.RegenerationMulti==1.3)
							return
						else if(Q.RegenerationMulti==1.28)
							Q.vars["RegenerationMulti"]+=0.02
						else if(Q.RegenerationMulti==1.24)
							Q.vars["RegenerationMulti"]+=0.04
						else if(Q.RegenerationMulti==1.18)
							Q.vars["RegenerationMulti"]+=0.06
						else if(Q.RegenerationMulti==1.1)
							Q.vars["RegenerationMulti"]+=0.08
						else if(Q.RegenerationMulti==1)
							Q.vars["RegenerationMulti"]+=0.1
						else
							Q.vars["RegenerationMulti"]+=0.05
					if(type == "Strength")
						if(Q.StrengthMulti==1.3)
							return
						else if(Q.StrengthMulti==1.28)
							Q.vars["StrengthMulti"]+=0.02
						else if(Q.StrengthMulti==1.24)
							Q.vars["StrengthMulti"]+=0.04
						else if(Q.StrengthMulti==1.18)
							Q.vars["StrengthMulti"]+=0.06
						else if(Q.StrengthMulti==1.1)
							Q.vars["StrengthMulti"]+=0.08
						else if(Q.StrengthMulti==1)
							Q.vars["StrengthMulti"]+=0.1
						else
							Q.vars["StrengthMulti"]+=0.05
					if(type == "Endurance")
						if(Q.EnduranceMulti==1.3)
							return
						else if(Q.EnduranceMulti==1.28)
							Q.vars["EnduranceMulti"]+=0.02
						else if(Q.EnduranceMulti==1.24)
							Q.vars["EnduranceMulti"]+=0.04
						else if(Q.EnduranceMulti==1.18)
							Q.vars["EnduranceMulti"]+=0.06
						else if(Q.EnduranceMulti==1.1)
							Q.vars["EnduranceMulti"]+=0.08
						else if(Q.EnduranceMulti==1)
							Q.vars["EnduranceMulti"]+=0.1
						else
							Q.vars["EnduranceMulti"]+=0.05
					if(type == "Speed")
						if(Q.SpeedMulti>=1.15)
							return
						else if(Q.SpeedMulti==1.13)
							Q.vars["SpeedMulti"]+=0.02
						else if(Q.SpeedMulti==1.1)
							Q.vars["SpeedMulti"]+=0.03
						else if(Q.SpeedMulti==1.05)
							Q.vars["SpeedMulti"]+=0.05
						else if(Q.SpeedMulti==1.02)
							Q.vars["SpeedMulti"]+=0.03
						else if(Q.SpeedMulti==1)
							Q.vars["SpeedMulti"]+=0.02
						else
							Q.vars["SpeedMulti"]+=0.05
					if(type == "Force")
						if(Q.ForceMulti==1.3)
							return
						else if(Q.ForceMulti==1.28)
							Q.vars["ForceMulti"]+=0.02
						else if(Q.ForceMulti==1.24)
							Q.vars["ForceMulti"]+=0.04
						else if(Q.ForceMulti==1.18)
							Q.vars["ForceMulti"]+=0.06
						else if(Q.ForceMulti==1.1)
							Q.vars["ForceMulti"]+=0.08
						else if(Q.ForceMulti==1)
							Q.vars["ForceMulti"]+=0.1
						else
							Q.vars["ForceMulti"]+=0.05
					if(type == "Resistance")
						if(Q.ResistanceMulti==1.3)
							return
						else if(Q.ResistanceMulti==1.28)
							Q.vars["ResistanceMulti"]+=0.02
						else if(Q.ResistanceMulti==1.24)
							Q.vars["ResistanceMulti"]+=0.04
						else if(Q.ResistanceMulti==1.18)
							Q.vars["ResistanceMulti"]+=0.06
						else if(Q.ResistanceMulti==1.1)
							Q.vars["ResistanceMulti"]+=0.08
						else if(Q.ResistanceMulti==1)
							Q.vars["ResistanceMulti"]+=0.1
						else
							Q.vars["ResistanceMulti"]+=0.05

					if(type == "Offense")
						if(Q.OffenseMulti==1.3)
							return
						else if(Q.OffenseMulti==1.28)
							Q.vars["OffenseMulti"]+=0.02
						else if(Q.OffenseMulti==1.24)
							Q.vars["OffenseMulti"]+=0.04
						else if(Q.OffenseMulti==1.18)
							Q.vars["OffenseMulti"]+=0.06
						else if(Q.OffenseMulti==1.1)
							Q.vars["OffenseMulti"]+=0.08
						else if(Q.OffenseMulti==1)
							Q.vars["OffenseMulti"]+=0.1
						else
							Q.vars["OffenseMulti"]+=0.05

					if(type == "Defense")
						if(Q.DefenseMulti==1.3)
							return
						else if(Q.DefenseMulti==1.28)
							Q.vars["DefenseMulti"]+=0.02
						else if(Q.DefenseMulti==1.24)
							Q.vars["DefenseMulti"]+=0.04
						else if(Q.DefenseMulti==1.18)
							Q.vars["DefenseMulti"]+=0.06
						else if(Q.DefenseMulti==1.1)
							Q.vars["DefenseMulti"]+=0.08
						else if(Q.DefenseMulti==1)
							Q.vars["DefenseMulti"]+=0.1
						else
							Q.vars["DefenseMulti"]+=0.05
					Q.Points--
			else if(Q.Reductions>0)
				if(type in list("StrengthDown","EnduranceDown","SpeedDown","ForceDown","ResistanceDown","OffenseDown","DefenseDown","RegenerationDown","RecoveryDown"))
					if(type == "StrengthDown")
						if(Q.StrengthMulti<=0.70)
							return
						else
							Q.vars["StrengthMulti"]-=0.1
							Q.Reductions--
							Q.Points++
					if(type == "EnduranceDown")
						if(Q.EnduranceMulti<=0.70)
							return
						else
							Q.vars["EnduranceMulti"]-=0.1
							Q.Reductions--
							Q.Points++
					if(type == "SpeedDown")
						if(Q.SpeedMulti<=0.70)
							return
						else
							Q.vars["SpeedMulti"]-=0.1
							Q.Reductions--
							Q.Points++
					if(type == "ForceDown")
						if(Q.ForceMulti<=0.70)
							return
						else
							Q.vars["ForceMulti"]-=0.1
							Q.Reductions--
							Q.Points++
					if(type == "ResistanceDown")
						if(Q.ResistanceMulti<=0.70)
							return
						else
							Q.vars["ResistanceMulti"]-=0.1
							Q.Reductions--
							Q.Points++
					if(type == "OffenseDown")
						if(Q.OffenseMulti<=0.70)
							return
						else
							Q.vars["OffenseMulti"]-=0.1
							Q.Reductions--
							Q.Points++
					if(type == "DefenseDown")
						if(Q.DefenseMulti<=0.70)
							return
						else
							Q.vars["DefenseMulti"]-=0.1
							Q.Reductions--
							Q.Points++
					if(type == "RegenerationDown")
						if(Q.RegenerationMulti<=0.70)
							return
						else
							Q.vars["RegenerationMulti"]-=0.1
							Q.Reductions--
							Q.Points++
					if(type == "RecoveryDown")
						if(Q.RecoveryMulti<=0.70)
							return
						else
							Q.vars["RecoveryMulti"]-=0.1
							Q.Reductions--
							Q.Points++
			UpdateSorcererRingWindow(Q)
			sleep(1)

var/list/Enchantment_List=new
proc/Add_Enchantments()
	for(var/A in typesof(/obj/Items/Enchantment))
		//if(!(A in list(/obj/Items/Gun)))
		var/obj/B=new A
		B.suffix=null
		if(B.Cost) Enchantments_List+=B
		else del(B)
/*	for(var/C in typesof(/obj/Items/Enchantment/RingofSorcery))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost&&D.type!=/obj/Items/Enchantment/RingofSorcery) Enchantments_List+=D
		else del(D)
	for(var/C in typesof(/obj/Items/Enchantment/RingofSorcery))
		var/obj/D=new C
		D.suffix=null
		if(D.Cost) Enchantments_List+=D
		else del(D)
		*/

proc/Can_Afford_Enchantment(mob/P,obj/O) for(var/obj/Money/M in P) if(O.Cost/P.Enchantment<=M.Level) return 1
proc/Enchantment_Price(mob/P,obj/O) return O.Cost/P.Enchantment
