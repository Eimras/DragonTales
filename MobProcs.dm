mob/proc
	UpdateTechnologyWindow()
		for(var/obj/Money/M in usr)
			src<<output(M,"GridX:1,1")
			src<<output("[Commas(M.Level)]","GridX:2,1")

/*	UniverseWindowRefresher()
		var/planetfinder
		var/Row=0
		while(usr.UniverseSense==1)
			sleep(20)
			winset(src,"GridX","cells=0x0")
			Row=0
			for(var/mob/Players/M in world)
				if(!M.AdminInviso)
					if(M.Race!="Android" || M.Race=="Android" && M.PowerSense)
						if(M.Power>(10*Day))
							if(M.z==1||M.z==15)
								planetfinder="Earth"
							else if(M.z==2||M.z==23)
								planetfinder="Namek"
							else if(M.z==3||M.z==22)
								planetfinder="Vegeta"
							else if(M.z==4||M.z==24)
								planetfinder="Ice"
							else if(M.z==5||M.z==25)
								planetfinder="Arconia"
							else if(M.z==6)
								planetfinder="Heaven"
							else if(M.z==7)
								planetfinder="Hell"
							else if(M.z==8)
								planetfinder="Checkpoint"
							else if(M.z==12)
								planetfinder="Space"
							else if(M.z==18||M.z==20)
								planetfinder="Sanctuary"
							else
								planetfinder="Unknown Location"
							Row++
							src<<output("[M]:","GridX:1,[Row]")
							src<<output("[Commas(usr.Get_Sense_Reading(M))]% your power,[planetfinder]","GridX:2,[Row]")*/

mob/proc
	UpdateDrillWindow(var/obj/Items/Tech/AutoDrill/I)
		if(I)
			if(istype(I,/obj/Items/Tech/AutoDrill))
				var/list/changes=list("LabelDrillhead","LabelDriveshaft","LabelEngine","LabelDigRate","LabelDrillSpecial","LabelDrillheadEnchant","LabelDriveshaftEnchant","LabelEngineEnchant")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelDrillhead")
							if(I.InstalledDrill)
								blah="[I.InstalledDrill]"
							else
								blah="Basic"
						if("LabelDriveshaft")
							if(I.InstalledDriveshaft)
								blah="[I.InstalledDriveshaft]"
							else
								blah="Basic"
						if("LabelEngine")
							if(I.InstalledEngine)
								blah="[I.InstalledEngine]"
							else
								blah="Basic"
						if("LabelDigRate")
							var/digratecalc=I.Lvl*I.BaseDigMulti
							var/digratetimer=I.DrillSpeed/10
							blah="[digratecalc]/[digratetimer]"
						if("LabelDrillSpecial")
							if(I.DrillSpecial)
								blah="[I.DrillSpecial]"
							else
								blah="None"
						if("LabelDrillheadEnchant")
							if(I.EnchantType)
								blah="[I.EnchantType]"
							else
								blah="None"
						if("LabelDriveshaftEnchant")
							if(I.EnchantType2)
								blah="[I.EnchantType2]"
							else
								blah="None"
						if("LabelEngineEnchant")
							if(I.EnchantType3)
								blah="[I.EnchantType3]"
							else
								blah="None"
					winset(usr,x,"text=[blah]")

mob/Players/verb/CustomizeDrill(type as text)
	set name=".AutoDrillCustom"
	set hidden=1
	var/obj/Items/Tech/AutoDrill/Q=usr.Customizing
	if(Q)
		if(istype(Q,/obj/Items/Tech/AutoDrill))
			if(type in list("Drillhead","Driveshaft","Engine","Eject","Special"))
				if(Q.InstallLock)
					usr<<"You're already trying to install parts!"
					return

				if(type == "Drillhead")
					Q.InstallLock=1
					if(Q.InstalledDrill)
						usr<<"There's already a drill installed!"
						Q.InstallLock=0
						return
					else
						if(!locate(/obj/Items/Tech/AutoDrillParts/Drillhead,usr.contents)&&!locate(/obj/Items/Enchantment/AutoDrillParts/Drillhead,usr.contents))
							usr<<"You lack a suitable drillhead to install."
							Q.InstallLock=0
							return
						else
							var/list/drilllist=list("Cancel")
							for(var/obj/Items/Tech/AutoDrillParts/Drillhead/A in usr)
								drilllist+=A
							for(var/obj/Items/Enchantment/AutoDrillParts/Drillhead/B in usr)
								drilllist+=B
							var/obj/headselect=input("")in drilllist
							Q.Lvl+=headselect:Lvl
							Q.DrillSpeed+=headselect:DrillSpeed
							Q.BaseDigMulti+=headselect:BaseDigMulti
							Q.InstalledDrill=headselect:Material
							if(headselect:Material=="Crystal")
								if(headselect:EnchantType)
									Q.EnchantType=headselect:EnchantType
							headselect.loc=Q

				if(type == "Driveshaft")
					Q.InstallLock=1
					if(Q.InstalledDriveshaft)
						usr<<"There's already a driveshaft installed!"
						Q.InstallLock=0
						return
					else
						if(!locate(/obj/Items/Tech/AutoDrillParts/Driveshaft,usr.contents)&&!locate(/obj/Items/Enchantment/AutoDrillParts/Driveshaft,usr.contents))
							usr<<"You lack a suitable driveshaft to install."
							Q.InstallLock=0
							return
						else
							var/list/drilllist=list("Cancel")
							for(var/obj/Items/Tech/AutoDrillParts/Driveshaft/A in usr)
								drilllist+=A
							for(var/obj/Items/Enchantment/AutoDrillParts/Driveshaft/B in usr)
								drilllist+=B
							var/obj/headselect=input("")in drilllist
							Q.Lvl+=headselect:Lvl
							Q.DrillSpeed+=headselect:DrillSpeed
							Q.BaseDigMulti+=headselect:BaseDigMulti
							Q.InstalledDriveshaft=headselect:Material
							if(headselect:Material=="Crystal")
								if(headselect:EnchantType)
									Q.EnchantType2=headselect:EnchantType
							headselect.loc=Q

				if(type == "Engine")
					Q.InstallLock=1
					if(Q.InstalledEngine)
						usr<<"There's already a engine installed!"
						Q.InstallLock=0
						return
					else
						if(!locate(/obj/Items/Tech/AutoDrillParts/Engine,usr.contents)&&!locate(/obj/Items/Enchantment/AutoDrillParts/Engine,usr.contents))
							usr<<"You lack a suitable engine to install."
							Q.InstallLock=0
							return
						else
							var/list/drilllist=list("Cancel")
							for(var/obj/Items/Tech/AutoDrillParts/Engine/A in usr)
								drilllist+=A
							for(var/obj/Items/Enchantment/AutoDrillParts/Engine/B in usr)
								drilllist+=B
							var/obj/headselect=input("")in drilllist
							Q.Lvl+=headselect:Lvl
							Q.DrillSpeed+=headselect:DrillSpeed
							Q.BaseDigMulti+=headselect:BaseDigMulti
							Q.InstalledEngine=headselect:Material
							if(headselect:Material=="Crystal")
								if(headselect:EnchantType)
									Q.EnchantType3=headselect:EnchantType
							headselect.loc=Q

				if(type == "Eject")
					if(Q.CreatorKey!=usr.key)
						usr<<"You are not the creator of this Auto Drill and thus may not extract parts."
						return
					else
						if(Q.InstalledDrill)
							for(var/obj/Items/Tech/AutoDrillParts/Drillhead/A in Q)
								A.loc=usr
								Q.InstalledDrill=null
								usr<<"Uninstalled the [A]."
							for(var/obj/Items/Enchantment/AutoDrillParts/Drillhead/A in Q)
								A.loc=usr
								Q.InstalledDrill=null
								usr<<"Uninstalled the [A]."
						if(Q.InstalledDriveshaft)
							for(var/obj/Items/Tech/AutoDrillParts/Driveshaft/A in Q)
								A.loc=usr
								Q.InstalledDriveshaft=null
								usr<<"Uninstalled the [A]."
							for(var/obj/Items/Enchantment/AutoDrillParts/Driveshaft/A in Q)
								A.loc=usr
								Q.InstalledDriveshaft=null
								usr<<"Uninstalled the [A]."
						if(Q.InstalledEngine)
							for(var/obj/Items/Tech/AutoDrillParts/Engine/A in Q)
								A.loc=usr
								Q.InstalledEngine=null
								usr<<"Uninstalled the [A]."
							for(var/obj/Items/Enchantment/AutoDrillParts/Engine/A in Q)
								A.loc=usr
								Q.InstalledEngine=null
								usr<<"Uninstalled the [A]."

						Q.BaseDigMulti=50
						Q.Lvl=10
						Q.DrillSpeed=200
						Q.EnchantType=null
						Q.EnchantType2=null
						Q.EnchantType3=null
						Q.DrillSpecial=null
						Q.SpecialLock=null

				if(type == "Special")
					if(Q.SpecialLock)
						usr<<"You cannot activate special twice."
						return
					if(!Q.InstalledDrill||!Q.InstalledDriveshaft||!Q.InstalledEngine)
						usr<<"You must have three parts installed to use this feature."
						return
					else
						if(Q.InstalledDrill=="Bronze"&&Q.InstalledDriveshaft=="Bronze"&&Q.InstalledEngine=="Bronze"||Q.InstalledDrill=="Iron"&&Q.InstalledDriveshaft=="Iron"&&Q.InstalledEngine=="Iron"||Q.InstalledDrill=="Steel"&&Q.InstalledDriveshaft=="Steel"&&Q.InstalledEngine=="Steel"||Q.InstalledDrill=="Titanium"&&Q.InstalledDriveshaft=="Titanium"&&Q.InstalledEngine=="Titanium"||Q.InstalledDrill=="Crystal"&&Q.InstalledDriveshaft=="Crystal"&&Q.InstalledEngine=="Crystal")
							Q.DrillSpecial="Material"
							Q.BaseDigMulti*=1.1
							Q.Lvl*=1.1
							Q.DrillSpeed/=1.05
							Q.SpecialLock=1
							usr<<"You have activated the Material Special!"
						else if(Q.InstalledDrill=="Bronze"&&Q.InstalledDriveshaft=="Iron"&&Q.InstalledEngine=="Steel")
							Q.DrillSpecial="Progression"
							Q.DrillSpeed/=1.25
							Q.Lvl+=10
							Q.SpecialLock=1
							usr<<"You have activated the Progression Special!"
						else if(Q.InstalledDrill=="Bronze"&&Q.InstalledDriveshaft=="Crystal"&&Q.InstalledEngine=="Titanium")
							Q.DrillSpecial="Worst 2 Best"
							Q.DrillSpeed/=1.75
							Q.Lvl+=20
							Q.BaseDigMulti*=1.25
							Q.SpecialLock=1
							usr<<"You have activated the Worst 2 Best Special!"
						else if(Q.InstalledDrill=="Titanium"&&Q.InstalledDriveshaft=="Crystal"&&Q.InstalledEngine=="Titanium")
							Q.DrillSpecial="Magitech Spin"
							Q.DrillSpeed/=1.5
							Q.Lvl+=15
							Q.BaseDigMulti*=1.2
							usr<<"You have activated the Magitech Spin Special!"
						else if(Q.InstalledDrill=="Crystal"&&Q.InstalledDriveshaft=="Titanium"&&Q.InstalledEngine=="Titanium")
							Q.DrillSpecial="Magitech Pierce"
							Q.DrillSpeed/=1.3
							Q.Lvl+=17
							Q.BaseDigMulti*=1.1
							usr<<"You have activated the Magitech Pierce Special!"
						else
							usr<<"This set of parts does not have a Special Attribute."
			else
				usr<<"There was a problem. Contact admins."
				return
			UpdateDrillWindow(Q)
			Q.InstallLock=0
			sleep(1)

mob/proc
	UpdateCauldronWindow(var/obj/Items/Enchantment/Cauldron/I)
		if(I)
			if(istype(I,/obj/Items/Enchantment/Cauldron))
				var/list/changes=list("LabelCoin","LabelArcane","LabelFeather","LabelCauldronDigRate","LabelCauldronEnchant")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelCoin")
							if(I.InstalledCoin)
								blah="[I.InstalledCoin]"
							else
								blah="Nothing"
						if("LabelArcane")
							if(I.InstalledArcane)
								blah="[I.InstalledArcane]"
							else
								blah="Nothing"
						if("LabelFeather")
							if(I.InstalledFeather)
								blah="[I.InstalledFeather]"
							else
								blah="Nothing"
						if("LabelCauldronDigRate")
							var/digratecalc=I.Lvl*I.BaseDigMulti/2
							var/digratetimer=I.DrillSpeed/10
							blah="[digratecalc]/[digratetimer]"
						if("LabelCauldronEnchant")
							if(I.EnchantType)
								blah="[I.EnchantType]"
							else
								blah="None"
					winset(usr,x,"text=[blah]")

mob/Players/verb/CustomizeCauldron(type as text)
	set name=".CauldronCustom"
	set hidden=1
	var/obj/Items/Enchantment/Cauldron/Q=usr.Customizing
	if(Q)
		if(istype(Q,/obj/Items/Enchantment/Cauldron))
			if(type in list("Coin","Arcane","Feather","Eject"))
				if(Q.InstallLock)
					usr<<"You're already trying to add to the mix!"
					return
				if(type == "Coin")
					Q.InstallLock=1
					if(Q.InstalledCoin)
						usr<<"There's already a coin in the cauldron!"
						Q.InstallLock=0
						return
					else
						if(!locate(/obj/Items/Enchantment/CauldronParts/Coin,usr.contents))
							usr<<"You lack a suitable Coin to install."
							Q.InstallLock=0
							return
						else
							var/list/drilllist=list("Cancel")
							for(var/obj/Items/Enchantment/CauldronParts/Coin/A in usr)
								drilllist+=A
							var/obj/Items/Enchantment/CauldronParts/Coin/headselect=input("")in drilllist
							Q.Lvl+=headselect.Lvl
							Q.DrillSpeed+=headselect.DrillSpeed
							Q.BaseDigMulti+=headselect.BaseDigMulti
							Q.InstalledCoin=headselect.Material
							headselect.loc=Q

				if(type == "Arcane")
					Q.InstallLock=1
					if(Q.InstalledArcane)
						usr<<"There's already a arcane ingredient in the mix!"
						Q.InstallLock=0
						return
					else
						if(!locate(/obj/Items/Enchantment/CauldronParts/Arcane,usr.contents))
							usr<<"You lack a suitable arcane ingrediant to add to the cauldron."
							Q.InstallLock=0
							return
						else
							var/list/drilllist=list("Cancel")
							for(var/obj/Items/Enchantment/CauldronParts/Arcane/A in usr)
								drilllist+=A
							var/obj/Items/Enchantment/CauldronParts/headselect=input("")in drilllist
							Q.Lvl+=headselect.Lvl
							Q.DrillSpeed+=headselect.DrillSpeed
							Q.BaseDigMulti+=headselect.BaseDigMulti
							Q.InstalledArcane=headselect.Material
							headselect.loc=Q

				if(type == "Feather")
					Q.InstallLock=1
					if(Q.InstalledFeather)
						usr<<"There's already a Feather in the mix!"
						Q.InstallLock=0
						return
					else
						if(!locate(/obj/Items/Enchantment/CauldronParts/Feather,usr.contents))
							usr<<"You lack a suitable Feather to add to the mix."
							Q.InstallLock=0
							return
						else
							var/list/drilllist=list("Cancel")
							for(var/obj/Items/Enchantment/CauldronParts/Feather/A in usr)
								drilllist+=A
							var/obj/Items/Enchantment/CauldronParts/Feather/headselect=input("")in drilllist
							Q.Lvl+=headselect.Lvl
							Q.DrillSpeed+=headselect.DrillSpeed
							Q.InstalledFeather=headselect.Material
							Q.BaseDigMulti+=headselect.BaseDigMulti
							headselect.loc=Q

				if(type == "Eject")
					if(Q.CreatorKey!=usr.key)
						usr<<"You are not the creator of this Cauldron and thus may not empty its contents."
						return
					else
						if(Q.InstalledCoin)
							for(var/obj/Items/Enchantment/CauldronParts/Coin/A in Q)
								A.loc=usr
								Q.InstalledCoin=null
								Q.BaseDigMulti-=A.BaseDigMulti
								Q.Lvl-=A.Lvl
								Q.DrillSpeed-=A.DrillSpeed
								usr<<"Retrieved the [A]."
						if(Q.InstalledArcane)
							for(var/obj/Items/Enchantment/CauldronParts/Arcane/A in Q)
								A.loc=usr
								Q.InstalledArcane=null
								Q.BaseDigMulti-=A.BaseDigMulti
								Q.Lvl-=A.Lvl
								Q.DrillSpeed-=A.DrillSpeed
								usr<<"Retrieved the [A]."
						if(Q.InstalledFeather)
							for(var/obj/Items/Enchantment/CauldronParts/Feather/A in Q)
								A.loc=usr
								Q.InstalledFeather=null
								Q.BaseDigMulti-=A.BaseDigMulti
								Q.Lvl-=A.Lvl
								Q.DrillSpeed-=A.DrillSpeed
								usr<<"Retrieved the [A]."
//						Q.BaseDigMulti=50
//						Q.Lvl=10
//						Q.DrillSpeed=200
						Q.EnchantType=null
						Q.InstalledCoin=null
						Q.InstalledArcane=null
						Q.InstalledFeather=null
			else
				usr<<"There was a problem. Contact admins."
				return
			UpdateCauldronWindow(Q)
			Q.InstallLock=0
			sleep(1)

mob/proc
	UpdateTurretWindow(var/obj/Items/Tech/Turret/I)
		if(I)
			if(istype(I,/obj/Items/Tech/Turret))
				winset(usr,"TurretPoints","text=[I.Points]")
				var/list/changes=list("LabelTurretStrength","LabelTurretForce","LabelTurretPenetration","LabelTurretRPenetration","LabelTurretAccuracy","LabelTurretExplosive","LabelTurretSpread","LabelTurretKnockbacks","LabelTurretFiringRate","LabelTurretProjectileSpeed")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelTurretStrength")blah="[Commas(round(I.Strength))]"
						if("LabelTurretForce")blah="[Commas(round(I.Force))]"
						if("LabelTurretPenetration")blah="[I.Penetration]%"
						if("LabelTurretRPenetration")blah="[I.RPenetration]%"
						if("LabelTurretAccuracy")blah="[Commas(I.Accuracy)]"
						if("LabelTurretExplosive")blah="[I.Explodes]"
						if("LabelTurretSpread")blah="[I.Spread]"
						if("LabelTurretKnockbacks")blah="[I.Knockbacks]"
						if("LabelTurretFiringRate")blah="[I.Delay]"
						if("LabelTurretProjectileSpeed")blah="[I.ProjectileSpeed]"
					winset(usr,x,"text=[blah]")

mob/Players/verb/CustomizeTurret(type as text)
	set name=".TurretCustom"
	set hidden=1
	var/obj/Items/Tech/Turret/Q=usr.Customizing
	if(Q)
		if(istype(Q,/obj/Items/Tech/Turret))
			if(Q.Points>0)
				if(type in list("Strength","Force","Penetration","RPenetration","Accuracy","Help"))
					if(type in list("Help"))
						alert("Strength:Physical Damage. Force:Energy Damage. Penetration:Ignores a percentage of Endurance on hit. Res Penetration: Ignores a percentage of Resistance on hit. Accuracy: The Offense of the gun. Firing Delay: How often you can fire the gun. Projectile Speed: How fast each projectile moves. Explosive: Shots will release a explosive effect. Spread: Uses more ammo, but more bullets are shot at once. Knockback: Causes the target to be knocked back on hit.")
						return
					else if(type == "Penetration" && Q.Penetration>=20)
						return
					else if(type == "RPenetration" && Q.RPenetration>=20)
						return
					else if(type in list("Strength","Force","Penetration","RPenetration") && Q.vars["[type]"]==0)
						return
					else
						if(type in list("Strength"))
							Q.vars["[type]"]+=(200*Q.StrengthMod+(Q.Strength*0.05))
						else if(type in list("Force"))
							Q.vars["[type]"]+=(200*Q.ForceMod+(Q.Force*0.05))
						else if(type in list("Accuracy"))
							Q.vars["[type]"]+=(1000*Q.AccuracyMod)
						else if(type in list("Penetration"))
							Q.vars["[type]"]+=(0.25*Q.PenetrationMod)
						else if(type in list("RPenetration"))
							Q.vars["[type]"]+=(0.25*Q.RPenetrationMod)
						Q.Points--
				else if(type in list("Explodes","Spread","Knockbacks"))
					if(Q.Points>=5)
						if(!Q.vars["[type]"])
							Q.vars["[type]"]=1
							Q.Points-=5
				else
					if(type in list("Delay","ProjectileSpeed"))
						if(type == "Delay" && Q.Delay<=10)
							return
						else if(type == "ProjectileSpeed" && Q.ProjectileSpeed<=0.5)
							return
						Q.vars["[type]"]-=0.25
						Q.Points--
				UpdateTurretWindow(Q)
				sleep(1)

mob/proc
	UpdateBuffItemWindow(var/obj/Items/BuffItem/I)
		if(I)
			if(istype(I,/obj/Items/BuffItem))
				var/list/changes=list("LabelBuffItemStrength","LabelBuffItemEndurance","LabelBuffItemSpeed","LabelBuffItemForce","LabelBuffItemResistance","LabelBuffItemOffense","LabelBuffItemDefense","LabelBuffItemRecovery","LabelBuffItemRegeneration","LabelBuffItemAngerMulti","LabelBuffItemAngerPlus","LabelBuffItemPowerMulti","LabelBuffItemPowerPlus","LabelBuffItemMaxManaMulti","LabelBuffItemMaxManaPlus")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelBuffItemStrength")blah="[I.StrengthMulti]"
						if("LabelBuffItemEndurance")blah="[I.EnduranceMulti]"
						if("LabelBuffItemSpeed")blah="[I.SpeedMulti]"
						if("LabelBuffItemForce")blah="[I.ForceMulti]"
						if("LabelBuffItemResistance")blah="[I.ResistanceMulti]"
						if("LabelBuffItemOffense")blah="[I.OffenseMulti]"
						if("LabelBuffItemDefense")blah="[I.DefenseMulti]"
						if("LabelBuffItemRecovery")blah="[I.RecoveryMulti]"
						if("LabelBuffItemRegeneration")blah="[I.RegenerationMulti]"
						if("LabelBuffItemAngerMulti")blah="[I.AngerMulti]"
						if("LabelBuffItemPowerMulti")blah="[I.PowerMulti]"
						if("LabelBuffItemMaxManaMulti")blah="[I.MaxManaMulti]"
						if("LabelBuffItemAngerPlus")blah="[I.AngerPlus]"
						if("LabelBuffItemPowerPlus")blah="[I.PowerPlus]"
						if("LabelBuffItemMaxManaPlus")blah="[I.MaxManaPlus]"

					winset(usr,x,"text=[blah]")

mob/proc
	UpdateBerserkWindow(var/obj/Skills/Buffs/Berserk/I)
		if(I)
			if(istype(I,/obj/Skills/Buffs/Berserk))
				winset(usr,"BerserkPoints","text=[I.FormPoints]")
				var/list/changes=list("LabelBerserkStr","LabelBerserkEnd","LabelBerserkFor","LabelBerserkRes","LabelBerserkOff","LabelBerserkDef")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelBerserkStr")blah="[I.FormStr]"
						if("LabelBerserkEnd")blah="[I.FormEnd]"
						if("LabelBerserkFor")blah="[I.FormFor]"
						if("LabelBerserkRes")blah="[I.FormRes]"
						if("LabelBerserkOff")blah="[I.FormOff]"
						if("LabelBerserkDef")blah="[I.FormDef]"
					winset(usr,x,"text=[blah]")

mob/Players/verb/CustomizeBerserk(type as text)
	set name=".BerserkCustom"
	set hidden=1
	var/obj/Skills/Buffs/Berserk/Q=usr.Customizing
	if(Q)
		if(istype(Q,/obj/Skills/Buffs/Berserk))
			if(Q.FormPoints>0)
				if(Q.Using)
					usr<<"I'm not sure -how- you got this far in cheating the system, but no. Amatsu has grown wise in his sanity checks."
					return
				if(type in list("Str","End","For","Res","Off","Def"))
					if(Q.vars["Form[type]"]>=1.5&&usr.trans["unlocked"]<2)
						return
					else if(Q.vars["Form[type]"]>=2)
						return
					else
						Q.vars["Form[type]"]+=0.1
					Q.FormPoints--
				UpdateBerserkWindow(Q)
				sleep(1)


mob/Players/verb/CustomizeBuffItem(type as text)
	set name=".BuffItemCustom"
	set hidden=1
	var/obj/Items/BuffItem/Q=usr.Customizing
	var/numbercontrol
	if(usr.Admin==0)
		usr<<"GO AWAY."
		return
	if(Q)
		if(istype(Q,/obj/Items/BuffItem))
			numbercontrol=input(usr,"Input a number.")as num
			if(type in list("StrengthMulti","EnduranceMulti","SpeedMulti","ForceMulti","ResistanceMulti","OffenseMulti","DefenseMulti","RecoveryMulti","RegenerationMulti","PowerMulti","MaxManaMulti","AngerMulti","PowerPlus","MaxManaPlus","AngerPlus"))
				Q.vars["[type]"]=numbercontrol
				UpdateBuffItemWindow(Q)
				sleep(1)

mob/proc/Poisoned_Check()
	if(!src.client) return // No client, no poison.
	if(src.Poisoned) return
	src.Poisoned=1
	while(src.Poison>0) // Always run loop regardless of RPmode being on/off
		sleep(10)
		if(src.SpiralResistance2||src.CuratoSalva)
			src.Poison=0
			src.Poisoned=0
		if(!src.PureRPMode&&!src.SpiralResistance2&&!src.CuratoSalva) // NOT pureRPMode? So poison applies in Pure RP mode? // No. In pureRPmode, most things stop to give people time to RP
			if(prob(50))
				src.Poison-=0.01
			if(src.Poison<=0)
				src.Poison=0
				src.Antidote=0
			if(src.Antidote>src.Poison)
				src.Antidote=src.Poison
			if(prob(50))
				if(src.AlienRacialPassive!="HoneyBadger"&&!src.SpiralResistance2)
					src.Health-=(src.Poison-src.Antidote)
				else if(src.Race=="Lamia")
					src.Health+=(src.Poison-src.Antidote)
				else
					src.Poison=0
					src.Antidote=0
			if(src.Antidote)
				src.Poison-=0.1
			if(src.KO && src.Poison>0.25 && src.Health<=-2)
				src.Death(null, "being poisoned!")
			if(prob(0.01*src.Regeneration*src.RegenerationMultiplier))
				src.Poison=0
				src<< "You have naturally recovered from being poisoned."
	src.Poison = 0 // Sanity
	src.Poisoned = 0

mob/proc/Burning_Check()
	if(!src.client) return // No client no being on fire
	if(src.Burned) return
	src.Burned=1
	while(src.Burning>0||src.BurningShot||src.BlazingWrath) // Always run loop regardless of RPmode being on/off
		sleep(10)
		if(!src.PureRPMode) // Only if RP mode is off will it damage
			if(src.Burning>1)
				src.Burning-=0.20
			if(prob(75))
				src.Burning-=0.01
			if(src.Burning<=0)
				src.Burning=0
			if(prob(50)&&(src.AlienRacialPassive!="HoneyBadger"&&!src.SpiralResistance2&&!src.FirstOF=="Hades")||src.BlazingWrath||src.BurningShot)
				src.Health-=(src.Burning)
			else
				src.Health-=(src.Burning/2)
			if(src.KO && src.Burning>1 && src.Health<=-2)
				src.Death(null, "being roasted!")
			if(prob(0.05*src.Regeneration*src.RegenerationMultiplier))
				src.Burning=0
				src<< "You manage to put out the flames!"
			if(src.BurningShot)
				if(prob(85))
					src.Burning+=0.025*src.BurningShot
			if(src.BlazingWrath)
				if(prob(50))
					src.Burning+=0.025*src.BlazingWrath
			if(src.BlazingWrath>1)
				for(var/mob/Player/P in Turf_Circle(src,2))
					if(prob(90))
						P.Burning+=0.015
						P.Burning_Check()
	src.Burning=0 // It doesnt hurt to be safe I guess.
	src.Burned=0

mob/proc/EnduranceBreak_Check()
	if(!src.client) return // No client no endurance breaking
	if(src.Endbroken) return
	while(src.EndBreak>0)
		sleep(10)
		if(!src.PureRPMode)
			if(prob(50))
				src.EndBreak-=0.10
				if(src.EndBreak>0&&src.Endbroken==0)
					src.EnduranceMultiplier/=1.2
					src.Endbroken=1
				else if(src.EndBreak<=0&&src.Endbroken==1)
					src.EnduranceMultiplier*=1.2
					src.Endbroken=0
					src.EndBreak=0
//	src.Endbroken=0
//	src.EndBreak=0

mob/proc/Chilled_Check()
	if(!src.client) return
	if(src.SpeedDown) return
	while(src.Chilled>0)
		if(prob(50))
			src.Chilled-=0.10
			if(src.Chilled>0&&src.SpeedDown==0)
				src.SpeedMultiplier/=1.2
				src.SpeedDown=1
			else if(src.Chilled<=0&&src.SpeedDown==1)
				src.SpeedMultiplier*=1.2
				src.SpeedDown=0
				src.Chilled=0

mob/proc/ElecShock_Check()
	if(!src.client) return
	if(src.ElecStunned) return
	src.ElecStunned=1
	while(src.ElecShock>0)
		if(prob(75))
			src.ElecShock-=0.2
			if(prob(25))
				src.ElecShock-=5
			if(src.ElecShock<=0)
				src.ElecShock=0
				src.Frozen=0
				src.ElecStunned=0

mob/proc/BuffPotionTimer()
	if(!src.client) return
	while(src.BuffPotion>0)
		sleep(10)
		if(!src.PureRPMode)
			src.BuffPotion--
			if(src.BuffPotion==0)
				if(src.StrengthPotion==1)
					src.StrengthMultiplier/=1.25
					src.StrengthPotion=0
				else if(src.StrengthPotion==2)
					src.StrengthMultiplier/=1.40
					src.StrengthPotion=0
				else if(src.ForcePotion==1)
					src.ForceMultiplier/=1.25
					src.ForcePotion=0
				else if(src.ForcePotion==2)
					src.ForceMultiplier/=1.40
					src.ForcePotion=0
				else if(src.EndurancePotion==1)
					src.EnduranceMultiplier/=1.25
					src.EndurancePotion=0
				else if(src.EndurancePotion==2)
					src.EnduranceMultiplier/=1.40
					src.EndurancePotion=0
				else if(src.ResistancePotion==1)
					src.ResistanceMultiplier/=1.25
					src.ResistancePotion=0
				else if(src.ResistancePotion==2)
					src.ResistanceMultiplier/=1.40
					src.ResistancePotion=0
				else if(src.OffensePotion==1)
					src.OffenseMultiplier/=1.25
					src.OffensePotion=0
				else if(src.OffensePotion==2)
					src.OffenseMultiplier/=1.40
					src.OffensePotion=0
				else if(src.DefensePotion==1)
					src.DefenseMultiplier/=1.25
					src.DefensePotion=0
				else if(src.DefensePotion==2)
					src.DefenseMultiplier/=1.40
					src.DefensePotion=0


/*mob/proc/burningShot_loop(var/obj/Skills/Rank/BurningShot/_burningshot)
	while(_burningshot.Using==1)
		if(src.Burning>0)
			if(prob(85)) //
				src.Burning+=0.025*src.BurningShot
		else
			src.Burning+=0.025*src.BurningShot
		sleep(10) // because no sleep is bad
		*/