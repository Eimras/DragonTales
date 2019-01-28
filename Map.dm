var/list/Turfs=new
var/list/CustomTurfs=new
turf/var/InitialType
turf/var/Destroyer
turf/var/PrimaryTurfType
turf/var/SecondaryTurfType

///
//turf/var/Exploding=0
//how this works is that it checks if the turf is exploding (a boolean)
//if it isn't, it will make an explosion object and mark that the turf is exploding
//this prevents any new explosions from generating
//after a second, new explosions can be created
turf/proc/CreateExplosion(var/probability=50) //Proc for creating an explosion, replaces all instances of new/obj/Effects/Explosion(A)
	if(prob(probability)) spawn flick('Explosion.dmi', src)
///

turf/Del()
	var/Type=type
	if(InitialType) Type=InitialType
	spawn InitialType=Type
	Builder=null
	if(!istype(src,/turf/CustomTurf))
		Turfs-=src
	else
		CustomTurfs-=src
	..()

var/image/Glare=image(icon='ArtificalObj.dmi',icon_state="Glare",layer=5)
var/list/nonDestroyable_turfs = list("/turf/Special/Blank",
								"/turf/Special/Sky1",
								"/turf/Special/Sky2",
								"/turf/Special/Stars")

proc/VoidDestroy(turf/A)
	if(isturf(A)) if(A.type!=/turf/Dirt1&&A.Destructable)
		new/turf/Special/Static(locate(A.x,A.y,A.z))
	else if(isobj(A))
		new/turf/Special/Static(locate(A.x,A.y,A.z))
		del(A)
	else if(ismob(A)) del(A)
proc/Destroy(turf/A,var/DestroyDamageMulti)
	if(isturf(A))
		if(!nonDestroyable_turfs.Find("[A.type]") && A.Destructable)
			if(usr==0)
				new/turf/Dirt1(locate(A.x,A.y,A.z))
				A.Destroyer=global.GlobalTurfDestroyer
			else
				A.Health-=(((usr.Force+1)*(usr.Power+1))/(A.LogPEndurance+1))*DestroyDamageMulti
				if(A.Health<0||DestroyDamageMulti==9001)
					A.Health=0
					new/turf/Dirt1(locate(A.x,A.y,A.z))
					A.Destroyer=usr.ckey
	else if(isobj(A))
		if(A.Destructable)
			new/obj/Effects/Crater(locate(A.x,A.y,A.z))
			del(A)
	else if(ismob(A)) del(A)
proc/ReplaceLava(turf/A)
	if(isturf(A))
		if(!nonDestroyable_turfs.Find("[A.type]") && A.Destructable)
			if(usr==0)
				new/turf/Waters/Water7(locate(A.x,A.y,A.z))
				A.Destroyer=usr.ckey
			else
				A.Health-=(((usr.Force+1)*(usr.Power+1))/(A.LogPEndurance+1))*50
			if(A.Health<0)
				A.Health=0
				new/turf/Waters/Water7(locate(A.x,A.y,A.z))
				A.Destroyer=usr.ckey
	else if(isobj(A))
		new/obj/Effects/Crater(locate(A.x,A.y,A.z))
		del(A)
	else if(ismob(A)) del(A)
proc/ReplaceWater(turf/A)
	if(isturf(A))
		if(!nonDestroyable_turfs.Find("[A.type]") && A.Destructable)
			if(usr==0)
				new/turf/Waters/WaterReal(locate(A.x,A.y,A.z))
				A.Destroyer=usr.ckey
			else
				A.Health-=(((usr.Force+1)*(usr.Power+1))/(A.LogPEndurance+1))*50
			if(A.Health<0)
				A.Health=0
				new/turf/Waters/WaterReal(locate(A.x,A.y,A.z))
				A.Destroyer=usr.ckey
	else if(isobj(A))
		new/obj/Effects/Crater(locate(A.x,A.y,A.z))
		del(A)
	else if(ismob(A)) del(A)
proc/Sear(turf/A)
	if(isturf(A))
		if(!nonDestroyable_turfs.Find("[A.type]") && A.Destructable)
			if(usr==0)
				new/obj/Effects/Cinders(locate(A.x,A.y,A.z))
	else if(ismob(A)) del(A)
proc/ReplaceWall(turf/A)
	if(isturf(A))
		if(!nonDestroyable_turfs.Find("[A.type]") && A.Destructable)
			if(usr==0)
				new/turf/Waters/Water7(locate(A.x,A.y,A.z))
			else
				A.Health-=(((usr.Force+1)*(usr.Power+1))/(A.LogPEndurance+1))*50
			A.Health=0
			new/turf/Waters/Water7(locate(A.x,A.y,A.z))
	else if(isobj(A))
		new/obj/Effects/Crater(locate(A.x,A.y,A.z))
		del(A)
	else if(ismob(A)) del(A)
mob/proc/Densify(var/Type)
	for(var/turf/q in Turf_Circle(4,src)) if(Type==1)
		if(istype(q,/turf/Waters))
			q.FlyOverAble=0
			q.density=1
			q.Health=src.Power*(src.Endurance+usr.Resistance)/2//max(q.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*1000000*usr.EnchantmentLevel*usr.EnchantmentLevel)
			q.LogPEndurance=src.Endurance+src.Resistance
			q.Builder=src
//		else
//			return
	for(var/turf/q in Turf_Circle(4,src)) if(Type==2)
		if(!istype(q,/turf/Waters))
			q.FlyOverAble=0
			q.density=1
			q.Health=src.Power*src.Force//max(q.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*1000000*usr.EnchantmentLevel*usr.EnchantmentLevel)
			q.LogPEndurance=src.Force
			q.Builder=src
//		else
//			return

obj
	var/Destructable=1
turf/var
	Destructable=1
	FlyOverAble=1
	Water
	Shallow=0
	Plant=0
	Lava=0
obj/Turfs
	Health=100
	LogPEndurance=50000
	Savable=0
	Destructable=1
	Spawn_Timer=3000
	var/FlyOverAble
	var/Glass=0
obj/Turfs/Edges/Grabbable=0
obj/Turfs/Surf/Grabbable=0


mob/var/ate
obj/SpecialTrees
	Savable=0
	Grabbable=0
	Health=1.#INF

	verb/EatFruit()
		set src in oview(1)
		name="Eat Fruit"
		if(usr.ate)
			alert(usr,"Your body cannot handle the power of another magical fruit!")
			return
		else
			usr<<"You eat the [src.name] fruit!"
			usr.ate=1
			if(istype(src,/obj/SpecialTrees/Power))
				usr.RPPower+=0.5
			if(istype(src,/obj/SpecialTrees/Energy))
				usr.EnergyMod*=3
				usr.EnergyMax*=3
			if(istype(src,/obj/SpecialTrees/Technical))
				usr.SpeedMod*=1.5
				usr.OffenseMod*=1.5
				usr.DefenseMod*=1.5
			if(istype(src,/obj/SpecialTrees/Technology))
				usr.Intelligence*=2
			if(istype(src,/obj/SpecialTrees/Enchant))
				usr.Enchantment*=2
			if(istype(src,/obj/SpecialTrees/Skills))
				usr.RewardPoints+=2000
			if(istype(src,/obj/SpecialTrees/Hero))
				usr.SpiralResistance=1
				usr.Zenkai_Rate=50
				usr.StealthVoid=1
			if(istype(src,/obj/SpecialTrees/Training))
				usr.Training_Rate=5
				usr.EnergyMod*=2
				usr.EnergyMax*=2
			if(istype(src,/obj/SpecialTrees/Enlightenment))
				usr.Meditation_Rate=5
				usr.EnergyMod*=2
				usr.EnergyMax*=2
			if(istype(src,/obj/SpecialTrees/Life))
				usr.contents+=new/obj/Regenerate
				for(var/obj/Regenerate/x in usr)
					x.Level=5
				usr.Dead=0
	Power

	Energy

	Technical

	Technology

	Enchant

	Skills

	Hero

	Training

	Enlightenment

	Life
obj/Planets
	Health=1.#INF
	proc/Orbit()
		while(src)
			if(istype(src,/obj/Planets/Sanctuary))
				animate(src,alpha=rand(0,50),time=15)
			step_rand(src)
			/*for(var/obj/Planets/Sanctuary/A)
				for(var/obj/Planets/AlienRuin/B)
					B.x=A.x+5
					B.y=A.y+1
					B.z=A.z*/
			sleep(1500)
	New()
		..()
		var/icon/b=new(src.icon)
		if(b.Width()>32)
			src.pixel_x=(b.Width()-32)/-2
		if(b.Height()>32)
			src.pixel_y=(b.Height()-32)/-2
//		spawn()src.Orbit()
	Del()
		icon_state="boom"
		sleep(10)
		..()


	var/Zz
	Buildable=0
	Savable=1
	Grabbable=0
	density=1
	icon='Planets.dmi'
/*	Ra
		icon='SpaceStations.dmi'
		icon_state="Ra"
		Zz=5
	Slifer
		icon='SpaceStations.dmi'
		icon_state="Slifer"
		Zz=3
	Obelisk
		icon='SpaceStations.dmi'
		icon_state="Obelisk"
		Zz=4*/
	AlienRuin
		Zz=8
	AlienOcean
		Zz=10
	AlienDesolate
		Zz=9
	Sanctuary
		icon_state="Sanctuary"
		Zz=18

	Earth
		icon_state="Earth"
		Zz=2
/*	CaliforniaUnderwater
		icon_state="Earth"
		Zz=4
	Namek
		icon_state="Namek"
		Zz=2*/
/*	Vegeta
		icon_state="Vegeta"
		Zz=3*/
/*	TropicThunder
		icon_state="Vegeta"
		Zz=1*/
	Arconia
		icon_state="Arconia"
		Zz=3
/*	DinosaurGames
		icon_state="Arconia"
		Zz=7
	Ice
		icon_state="Ice"
		Zz=4
	Sanctuary
		icon_state="Sanctuary"
		Zz=6*/
	AlienRuin
		icon_state="Alien"
		Zz=8
	AlienGrassland
		icon_state="Alien"
		Zz=8
	AlienOcean
		icon_state="Alien"
		Zz=10
	AlienArctic
		icon_state="Alien"
		Zz=10
	AlienDesolate
		icon_state="Alien"
		Zz=9
	PirateColony
		icon_state="Asteroid"
		Zz=12
	Alien
		icon_state="Alien"


mob/var/tmp/UpgradeTime=0

turf/verb/Upgrade()
	set src in oview(1)
	set category=null
	//set background=1
/*	if(usr.UpgradeTime)
		usr<<"You cannot upgrade your walls again at this time, please wait!"
		return*/
	if(!(usr.client.mob in range(1,src))) return
	if(src.Builder)
		usr.UpgradeTime=1
		var/buh
		if(src.Builder==usr.ckey)
			buh=input("Do you want to make your roofs flyoverable?")in list("Yes","No")
		spawn(1500)usr.UpgradeTime=0

		//for(var/turf/q in world) // Looping through world is BAD

		for(var/turf/q in Turfs) // Turfs exists as a global list which contains all things placed via BUILD. Skips all non-player stuff =D
			if(q.Builder==src.Builder)
				if(buh)
					if(buh=="Yes")
						q.FlyOverAble=1
					if(buh=="No")
						q.FlyOverAble=0
/*				if(usr.MaterialTechnology)
					q.Health=max(q.Health,usr.MaterialTechnology*20*20*750000)
					q.LogPEndurance=0
					q.LogPEndurance=max(q.LogPEndurance,usr.MaterialTechnology*20*20*40)
				else
					q.Health=max(q.Health,20*20*500000)
					q.LogPEndurance=0
					q.LogPEndurance=max(q.LogPEndurance,20*20*25)*/
				if(usr.IntelligenceLevel>=usr.EnchantmentLevel)
					if(usr.IntelligenceLevel<80)
						q.Health=max(q.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*750000)
						q.LogPEndurance=max(q.LogPEndurance,usr.IntelligenceLevel*17.5)
					else if(usr.IntelligenceLevel>79)
						q.Health=max(q.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*usr.IntelligenceLevel*750000)
						q.LogPEndurance=max(q.LogPEndurance,usr.IntelligenceLevel*22.5)
				else if(usr.EnchantmentLevel>usr.IntelligenceLevel)
					if(usr.EnchantmentLevel<80)
						q.Health=max(q.Health,usr.EnchantmentLevel*usr.EnchantmentLevel*750000)
						q.LogPEndurance=max(q.LogPEndurance,usr.EnchantmentLevel*17.5)
					else if(usr.EnchantmentLevel>79)
						q.Health=max(q.Health,usr.EnchantmentLevel*usr.EnchantmentLevel*usr.EnchantmentLevel*750000)
						q.LogPEndurance=max(q.LogPEndurance,usr.EnchantmentLevel*22.5)
		for(var/turf/CustomTurf/q in CustomTurfs) // Turfs exists as a global list which contains all things placed via BUILD. Skips all non-player stuff =D
			if(q.Builder==src.Builder)
				if(buh)
					if(buh=="Yes")
						q.FlyOverAble=1
					if(buh=="No")
						q.FlyOverAble=0
/*				if(usr.MaterialTechnology)
					q.Health=max(q.Health,usr.MaterialTechnology*20*20*750000)
					q.LogPEndurance=0
					q.LogPEndurance=max(q.LogPEndurance,usr.MaterialTechnology*20*20*40)
				else
					q.Health=max(q.Health,20*20*500000)
					q.LogPEndurance=0
					q.LogPEndurance=max(q.LogPEndurance,20*20*25)*/
				if(usr.IntelligenceLevel>=usr.EnchantmentLevel)
					if(usr.IntelligenceLevel<80)
						q.Health=max(q.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*750000)
						q.LogPEndurance=max(q.LogPEndurance,usr.IntelligenceLevel*17.5)
					else if(usr.IntelligenceLevel>79)
						q.Health=max(q.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*usr.IntelligenceLevel*750000)
						q.LogPEndurance=max(q.LogPEndurance,usr.IntelligenceLevel*22.5)
				else if(usr.EnchantmentLevel>usr.IntelligenceLevel)
					if(usr.EnchantmentLevel<80)
						q.Health=max(q.Health,usr.EnchantmentLevel*usr.EnchantmentLevel*750000)
						q.LogPEndurance=max(q.LogPEndurance,usr.EnchantmentLevel*17.5)
					else if(usr.EnchantmentLevel>79)
						q.Health=max(q.Health,usr.EnchantmentLevel*usr.EnchantmentLevel*usr.EnchantmentLevel*750000)
						q.LogPEndurance=max(q.LogPEndurance,usr.EnchantmentLevel*22.5)
		//for(var/obj/q in world)
		for(var/obj/q in worldObjectList)
			if(q.Builder==src.Builder)
				if(isnum(q.Health))
					if(usr.MaterialTechnology)
						q.Health=max(q.Health,usr.MaterialTechnology*20*20*750000)
						q.LogPEndurance=0
						q.LogPEndurance=max(q.LogPEndurance,usr.MaterialTechnology*20*20*40)
					else
						q.Health=max(q.Health,20*20*500000)
						q.LogPEndurance=0
						q.LogPEndurance=max(q.LogPEndurance,20*20*25)
		if(usr.MaterialTechnology)
			usr.OMessage(10,"[usr] upgraded the structure to Material Technology [usr.MaterialTechnology].")
		else
			usr.OMessage(10,"[usr] upgraded the structure.")
/*					if(usr.IntelligenceLevel>=usr.EnchantmentLevel)
						if(usr.IntelligenceLevel<80)
							q.Health=max(q.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*700000)
							q.LogPEndurance=max(q.LogPEndurance,usr.IntelligenceLevel*15)
						else if(usr.IntelligenceLevel>79)
							q.Health=max(q.Health,usr.IntelligenceLevel*usr.IntelligenceLevel*usr.IntelligenceLevel*700000)
							q.LogPEndurance=max(q.LogPEndurance,usr.IntelligenceLevel*20)
					else if(usr.EnchantmentLevel>usr.IntelligenceLevel)
						if(usr.EnchantmentLevel<80)
							q.Health=max(q.Health,usr.EnchantmentLevel*usr.EnchantmentLevel*700000)
							q.LogPEndurance=max(q.LogPEndurance,usr.EnchantmentLevel*15)
						else if(usr.EnchantmentLevel>79)
							q.Health=max(q.Health,usr.EnchantmentLevel*usr.EnchantmentLevel*usr.EnchantmentLevel*700000)
							q.LogPEndurance=max(q.LogPEndurance,usr.EnchantmentLevel*20)
		if(usr.IntelligenceLevel>=usr.EnchantmentLevel)
			usr.OMessage(10,"[usr] upgraded the structure to level [usr.IntelligenceLevel] Intelligence.")
		else if(usr.EnchantmentLevel>usr.IntelligenceLevel)
			usr.OMessage(10,"[usr] imbued the structure to level [usr.EnchantmentLevel] Enchantment.")*/

turf
	Health=9001
	LogPEndurance=50000
	IconsX
		icon='NewTurfs.dmi'
		Icon1
			icon_state="1"
		Icon2
			icon_state="2"
		Icon3
			icon_state="3"
		Icon4
			icon_state="4"
		Icon5
			icon_state="5"
		Icon6
			icon_state="6"
		Icon7
			icon_state="7"
		Icon8
			icon_state="8"
			density=1
		Icon9
			icon_state="9"
		Icon10
			icon_state="10"
		Icon11
			icon_state="11"
		Icon12
			icon_state="12"
		Icon13
			icon_state="13"
		Icon14
			icon_state="14"
		Icon15
			icon_state="15"
		Icon16
			icon_state="16"
		Icon17
			icon_state="17"
		Icon18
			icon_state="18"
		Icon19
			icon_state="19"
		Icon20
			icon_state="20"
		Icon21
			icon_state="21"
		Icon22
			icon_state="22"
		Icon23
			icon_state="23"
		Icon24
			icon_state="24"
		Icon25
			icon_state="25"
		Icon26
			icon_state="26"
		Icon27
			icon_state="27"
		Icon28
			icon_state="28"
		Icon29
			icon_state="29"
		Icon30
			icon_state="30"
		Icon31
			icon_state="31"
		Icon32
			icon_state="32"
		Icon33
			icon_state="33"
		Icon34
			icon_state="34"
		Icon35
			icon_state="35"
		Icon36
			icon_state="36"
		Icon37
			icon_state="37"
		Icon38
			icon_state="38"
		Icon39
			icon_state="39"
		Icon40
			icon_state="40"
		Icon41
			icon_state="41"
		Icon42
			icon_state="42"
		Icon43
			icon_state="43"
		Icon44
			icon_state="44"
		Icon45
			icon_state="45"
		Icon46
			icon_state="46"
		Icon47
			icon_state="47"
		Icon48
			icon_state="48"
		Icon49
			icon_state="49"
		Icon50
			icon_state="50"
		Icon51
			icon_state="51"
		Icon52
			icon_state="52"
		Icon53
			icon_state="53"
		Icon54
			icon_state="54"
		Icon55
			icon_state="55"
		Icon56
			icon_state="56"
			density=1
		Icon57
			icon_state="57"
		Icon58
			icon_state="58"
		Icon59
			Enter(mob/M)
				if(istype(M,/mob))
					if(!M.Flying&&M.z==8)
						if(prob(50))usr.loc=locate(usr.x,usr.y,7)
				return ..()
			icon_state="59"
/*		Icon59
			Enter(mob/M)
				if(ismob(M))
					if(src.Builder)
						return ..()
					else
						if(!M.Flying)
							if(prob(50))usr.loc=locate(usr.x,usr.y,7)
				else
					return ..()
			icon_state="59"*/
		Icon60
			icon_state="60"
		Icon61
			icon_state="61"
		Icon62
			icon_state="62"
		Icon63
			icon_state="63"
		Icon64
			icon_state="64"
		Icon65
			icon_state="65"
		Icon66
			icon_state="66"
		Icon67
			icon_state="67"

//Dirt turfs
	Dirt1
		icon='Dirt.dmi'
		icon_state="Dirt1"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt2
		icon='Dirt.dmi'
		icon_state="Dirt2"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt3
		icon='Dirt.dmi'
		icon_state="Dirt3"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt4
		icon='Dirt.dmi'
		icon_state="Dirt4"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt4R
		icon='Dirt.dmi'
		icon_state="Dirt4Rock"
		density=1
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt4C
		icon='Dirt.dmi'
		icon_state="Dirt4Crack"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt5
		icon='Dirt.dmi'
		icon_state="Dirt5"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt6
		icon='Dirt.dmi'
		icon_state="Dirt6"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt7
		icon='Dirt.dmi'
		icon_state="Dirt7"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt8
		icon='Dirt.dmi'
		icon_state="Dirt8"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt9
		icon='Dirt.dmi'
		icon_state="Dirt9"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt10
		icon='Dirt.dmi'
		icon_state="Dirt10"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt11
		icon='Dirt.dmi'
		icon_state="Dirt11"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt12
		icon='Dirt.dmi'
		icon_state="Dirt12"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt13
		icon='Dirt.dmi'
		icon_state="Dirt13"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt14
		icon='Dirt.dmi'
		icon_state="Dirt14"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
	Dirt99
		icon='Dirt.dmi'
		icon_state="Dirt99"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Dirt"
//Sand turfs
	Sand1
		icon='Dirt.dmi'
		icon_state="Sand1"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand2
		icon='Dirt.dmi'
		icon_state="Sand2"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand3
		icon='Dirt.dmi'
		icon_state="Sand3"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand4
		icon='Dirt.dmi'
		icon_state="Sand4"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand5
		icon='Dirt.dmi'
		icon_state="Sand5"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand6
		icon='Dirt.dmi'
		icon_state="Sand6"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand7
		icon='Dirt.dmi'
		icon_state="Sand7"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand8
		icon='Dirt.dmi'
		icon_state="Sand8"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand9
		icon='Dirt.dmi'
		icon_state="Sand9"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand10
		icon='Dirt.dmi'
		icon_state="Sand10"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand11
		icon='Dirt.dmi'
		icon_state="Sand11"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand12
		icon='Dirt.dmi'
		icon_state="Sand12"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand13
		icon='Dirt.dmi'
		icon_state="Sand13"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand14
		icon='Dirt.dmi'
		icon_state="Sand14"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand15
		icon='Dirt.dmi'
		icon_state="Sand15"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand16
		icon='Dirt.dmi'
		icon_state="Sand16"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand17
		icon='Dirt.dmi'
		icon_state="Sand17"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand18
		icon='Dirt.dmi'
		icon_state="Sand18"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
	Sand19
		icon='Dirt.dmi'
		icon_state="Sand19"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Sand"
//Grass turfs
	Grass1
		icon='Grass.dmi'
		icon_state="Grass1"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass2
		icon='Grass.dmi'
		icon_state="Grass2"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass3
		icon='Grass.dmi'
		icon_state="Grass3"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass4
		icon='Grass.dmi'
		icon_state="Grass4"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass5
		icon='Grass.dmi'
		icon_state="Grass5"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass6
		icon='Grass.dmi'
		icon_state="Grass6"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass7
		icon='Grass.dmi'
		icon_state="Grass7"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass8
		icon='Grass.dmi'
		icon_state="Grass8"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass9
		icon='Grass.dmi'
		icon_state="Grass9"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass10
		icon='Grass.dmi'
		icon_state="Grass10"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass11
		icon='Grass.dmi'
		icon_state="Grass11"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass12
		icon='Grass.dmi'
		icon_state="Grass12"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass13
		icon='Grass.dmi'
		icon_state="Grass13"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass14
		icon='Grass.dmi'
		icon_state="Grass14"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass15
		icon='Grass.dmi'
		icon_state="Grass15"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass16
		icon='Grass.dmi'
		icon_state="Grass16"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass17
		icon='Grass.dmi'
		icon_state="Grass17"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass18
		icon='Grass.dmi'
		icon_state="Grass18"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass19
		icon='Grass.dmi'
		icon_state="Grass19"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass20
		icon='Grass.dmi'
		icon_state="Grass20"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass21
		icon='Grass.dmi'
		icon_state="Grass21"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass22
		icon='Grass.dmi'
		icon_state="Grass22"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass23
		icon='Grass.dmi'
		icon_state="Grass23"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
	Grass24
		icon='Grass.dmi'
		icon_state="Grass24"
		PrimaryTurfType="Floor"
		SecondaryTurfType="Grass"
//Natural turfs
	Ice1
		icon='Natural.dmi'
		icon_state="Ice1"
	Ice2
		icon='Natural.dmi'
		icon_state="Ice2"
	Ice3
		icon='Natural.dmi'
		icon_state="Ice3"
	Stone1
		icon='Natural.dmi'
		icon_state="Stone1"
	Stone2
		icon='Natural.dmi'
		icon_state="Stone2"
	Stone3
		icon='Natural.dmi'
		icon_state="Stone3"
	Stone4
		icon='Natural.dmi'
		icon_state="Stone4"
	Stone5
		icon='Natural.dmi'
		icon_state="Stone5"
	Stone6
		icon='Natural.dmi'
		icon_state="Stone6"
	Stone7
		icon='Natural.dmi'
		icon_state="Stone7"
	Stone8
		icon='Natural.dmi'
		icon_state="Stone8"
	Stone9
		icon='Natural.dmi'
		icon_state="Stone9"
	Stone10
		icon='Natural.dmi'
		icon_state="Stone10"
	Stone11
		icon='Natural.dmi'
		icon_state="Stone11"
	Stone12
		icon='Natural.dmi'
		icon_state="Stone12"
	Stone13
		icon='Natural.dmi'
		icon_state="Stone13"
	Stone14
		icon='Natural.dmi'
		icon_state="Stone14"
	Stone15
		icon='Natural.dmi'
		icon_state="Stone15"
	Stone16
		icon='Natural.dmi'
		icon_state="Stone16"
	Stone17
		icon='Natural.dmi'
		icon_state="Stone17"
	Wood1
		icon='Natural.dmi'
		icon_state="Wood1"
	Wood2
		icon='Natural.dmi'
		icon_state="Wood2"
	Wood3
		icon='Natural.dmi'
		icon_state="Wood3"
	Wood4
		icon='Natural.dmi'
		icon_state="Wood4"
	Wood5
		icon='Natural.dmi'
		icon_state="Wood5"
	Wood6
		icon='Natural.dmi'
		icon_state="Wood6"
	Wood7
		icon='Natural.dmi'
		icon_state="Wood7"
	Wood8
		icon='Natural.dmi'
		icon_state="Wood8"
	Wood9
		icon='Natural.dmi'
		icon_state="Wood9"
	Wood10
		icon='Natural.dmi'
		icon_state="Wood10"
	Wood11
		icon='Natural.dmi'
		icon_state="Wood11"
	Wood12
		icon='Natural.dmi'
		icon_state="Wood12"
	Wood13
		icon='Natural.dmi'
		icon_state="Wood13"
	Wood14
		icon='Natural.dmi'
		icon_state="Wood14"
	Wood15
		icon='Natural.dmi'
		icon_state="Wood15"
	Wood16
		icon='Natural.dmi'
		icon_state="Wood16"
	Wood17
		icon='Natural.dmi'
		icon_state="Wood17"
//Technology turfs
	Tech1
		icon='Technology.dmi'
		icon_state="Tech1"
	Tech2
		icon='Technology.dmi'
		icon_state="Tech2"
	Tech3
		icon='Technology.dmi'
		icon_state="Tech3"
	Tech4
		icon='Technology.dmi'
		icon_state="Tech4"
	Tech5
		icon='Technology.dmi'
		icon_state="Tech5"
	Tech5B
		icon='Technology.dmi'
		icon_state="Tech5B"
	Tech6
		icon='Technology.dmi'
		icon_state="Tech6"
	Tech7
		icon='Technology.dmi'
		icon_state="Tech7"
	Tech8
		icon='Technology.dmi'
		icon_state="Tech8"
	Tech9
		icon='Technology.dmi'
		icon_state="Tech9"
	Tech10
		icon='Technology.dmi'
		icon_state="Tech10"
	Tech11
		icon='Technology.dmi'
		icon_state="Tech11"
	Tech12
		icon='Technology.dmi'
		icon_state="Tech12"
	Tech13
		icon='Technology.dmi'
		icon_state="Tech13"
	Tech14
		icon='Technology.dmi'
		icon_state="Tech14"
	Tech15
		icon='Technology.dmi'
		icon_state="Tech15"
	Tech16
		icon='Technology.dmi'
		icon_state="Tech16"
	Tech17
		icon='Technology.dmi'
		icon_state="Tech17"
//Tiles and Carpets turfs
	Tile1
		icon='Tiles.dmi'
		icon_state="Tile1"
	Tile2
		icon='Tiles.dmi'
		icon_state="Tile2"
	Tile3
		icon='Tiles.dmi'
		icon_state="Tile3"
	Tile4
		icon='Tiles.dmi'
		icon_state="Tile4"
	Tile5
		icon='Tiles.dmi'
		icon_state="Tile5"
	Tile6
		icon='Tiles.dmi'
		icon_state="Tile6"
	Tile7
		icon='Tiles.dmi'
		icon_state="Tile7"
	Tile8
		icon='Tiles.dmi'
		icon_state="Tile8"
	Tile9
		icon='Tiles.dmi'
		icon_state="Tile9"
	Tile10
		icon='Tiles.dmi'
		icon_state="Tile10"
	Tile11
		icon='Tiles.dmi'
		icon_state="Tile11"
	Tile12
		icon='Tiles.dmi'
		icon_state="Tile12"
	Tile13
		icon='Tiles.dmi'
		icon_state="Tile13"
	Tile14
		icon='Tiles.dmi'
		icon_state="Tile14"
	Tile15
		icon='Tiles.dmi'
		icon_state="Tile15"
	Tile16
		icon='Tiles.dmi'
		icon_state="Tile16"
	Tile17
		icon='Tiles.dmi'
		icon_state="Tile17"
	Tile18
		icon='Tiles.dmi'
		icon_state="Tile18"
	Tile19
		icon='Tiles.dmi'
		icon_state="Tile19"
	Tile20
		icon='Tiles.dmi'
		icon_state="Tile20"
	Tile21
		icon='Tiles.dmi'
		icon_state="Tile21"
	Tile22
		icon='Tiles.dmi'
		icon_state="Tile22"
	Tile23
		icon='Tiles.dmi'
		icon_state="Tile23"
	Tile24
		icon='Tiles.dmi'
		icon_state="Tile24"
	Tile25
		icon='Tiles.dmi'
		icon_state="Tile25"
	Tile26
		icon='Tiles.dmi'
		icon_state="Tile26"
	Tile27
		icon='Tiles.dmi'
		icon_state="Tile27"
	Tile28
		icon='Tiles.dmi'
		icon_state="Tile28"
	Tile29
		icon='Tiles.dmi'
		icon_state="Tile29"
	Tile30
		icon='Tiles.dmi'
		icon_state="Tile30"
	Tile31
		icon='Tiles.dmi'
		icon_state="Tile31"
	Tile32
		icon='Tiles.dmi'
		icon_state="Tile32"
	Tile33
		icon='Tiles.dmi'
		icon_state="Tile33"
	Tile34
		icon='Tiles.dmi'
		icon_state="Tile34"
	Tile35
		icon='Tiles.dmi'
		icon_state="Tile35"
	Tile36
		icon='Tiles.dmi'
		icon_state="Tile36"
	Tile37
		icon='Tiles.dmi'
		icon_state="Tile37"
	Tile38
		icon='Tiles.dmi'
		icon_state="Tile38"
	Tile39
		icon='Tiles.dmi'
		icon_state="Tile39"
	Tile40
		icon='Tiles.dmi'
		icon_state="Tile40"
	Tile41
		icon='Tiles.dmi'
		icon_state="Tile41"
	Tile42
		icon='Tiles.dmi'
		icon_state="Tile42"
	Tile43
		icon='Tiles.dmi'
		icon_state="Tile43"
	Tile44
		icon='Tiles.dmi'
		icon_state="Tile44"
	Carpet1
		icon='Tiles.dmi'
		icon_state="Carpet1"
	Carpet2
		icon='Tiles.dmi'
		icon_state="Carpet2"
	Carpet3
		icon='Tiles.dmi'
		icon_state="Carpet3"
	Carpet4
		icon='Tiles.dmi'
		icon_state="Carpet4"
	Carpet5
		icon='Tiles.dmi'
		icon_state="Carpet5"
	Carpet6
		icon='Tiles.dmi'
		icon_state="Carpet6"
	Carpet7
		icon='Tiles.dmi'
		icon_state="Carpet7"
	Carpet8
		icon='Tiles.dmi'
		icon_state="Carpet8"
//Misc turfs
	Misc1
		icon='Misc.dmi'
		icon_state="Misc1"
	Misc2
		icon='Misc.dmi'
		icon_state="Misc2"
	Misc3
		icon='Misc.dmi'
		icon_state="Misc3"
	Misc4
		icon='Misc.dmi'
		icon_state="Misc4"
	Misc5
		icon='Misc.dmi'
		icon_state="Misc5"
	Misc6
		icon='Misc.dmi'
		icon_state="Misc6"
	Misc7
		icon='Misc.dmi'
		icon_state="Misc7"
	Misc8
		icon='Misc.dmi'
		icon_state="Misc8"
	Misc9
		icon='Misc.dmi'
		icon_state="Misc9"
	Misc10
		icon='Misc.dmi'
		icon_state="Misc10"
	Misc11
		icon='Misc.dmi'
		icon_state="Misc11"
	Misc12
		icon='Misc.dmi'
		icon_state="Misc12"
	Misc13
		icon='Misc.dmi'
		icon_state="Misc13"
	Misc14
		icon='Misc.dmi'
		icon_state="Misc14"
	Misc15
		icon='Misc.dmi'
		icon_state="Misc15"
	Misc16
		icon='Misc.dmi'
		icon_state="Misc16"
	Misc17
		icon='Misc.dmi'
		icon_state="Misc15"
	Misc18
		icon='Misc.dmi'
		icon_state="Misc16"
//Wall turfs
	Wall1
		icon='Walls.dmi'
		icon_state="Wall1"
		density=1
	Wall2
		icon='Walls.dmi'
		icon_state="Wall2"
		density=1
	Wall3
		icon='Walls.dmi'
		icon_state="Wall3"
		density=1
	Wall4
		icon='Walls.dmi'
		icon_state="Wall4"
		density=1
	Wall5
		icon='Walls.dmi'
		icon_state="Wall5"
		density=1
	Wall6
		Health=10000000000
		icon='Walls.dmi'
		icon_state="Wall6"
		density=1
	Wall6R
		icon='Walls.dmi'
		icon_state="Wall6R"
		density=1
	Wall6G
		icon='Walls.dmi'
		icon_state="Wall6G"
		density=1
	Wall6B
		icon='Walls.dmi'
		icon_state="Wall6B"
		density=1
	Wall6Y
		icon='Walls.dmi'
		icon_state="Wall6Y"
		density=1
	Wall6W
		icon='Walls.dmi'
		icon_state="Wall6W"
		density=1
	Wall7
		Health=100000000000000
		icon='Walls.dmi'
		icon_state="Wall7"
		density=1
	Wall8
		icon='Walls.dmi'
		icon_state="Wall8"
		density=1
	Wall9
		icon='Walls.dmi'
		icon_state="Wall9"
		density=1
	Wall10
		icon='Walls.dmi'
		icon_state="Wall10"
		density=1
	Wall11
		icon='Walls.dmi'
		icon_state="Wall11"
		density=1
	Wall12
		icon='Walls.dmi'
		icon_state="Wall12"
		density=1
	Wall13
		icon='Walls.dmi'
		icon_state="Wall13"
		density=1
	Wall14
		icon='Walls.dmi'
		icon_state="Wall14"
		density=1
	Wall15
		icon='Walls.dmi'
		icon_state="Wall15"
		density=1
	Wall16
		icon='Walls.dmi'
		icon_state="Wall16"
		density=1
	Wall17
		icon='Walls.dmi'
		icon_state="Wall17"
		density=1
	Wall18
		icon='Walls.dmi'
		icon_state="Wall18"
		density=1
	Wall19
		icon='Walls.dmi'
		icon_state="Wall19"
		density=1
	Wall20
		icon='Walls.dmi'
		icon_state="Wall20"
		density=1
	Wall21
		icon='Walls.dmi'
		icon_state="Wall21"
		density=1
	Wall22
		icon='Walls.dmi'
		icon_state="Wall22"
		density=1
	Wall23
		icon='Walls.dmi'
		icon_state="Wall23"
		density=1
	Wall24
		icon='Walls.dmi'
		icon_state="Wall24"
		density=1
	Wall25
		icon='Walls.dmi'
		icon_state="Wall25"
		density=1
	Wall26
		icon='Walls.dmi'
		icon_state="Wall26"
		density=1
	Wall27
		icon='Walls.dmi'
		icon_state="Wall27"
		density=1
	Wall28
		icon='Walls.dmi'
		icon_state="Wall28"
		density=1
	Wall29
		icon='Walls.dmi'
		icon_state="Wall29"
		density=1
	Wall30
		icon='Walls.dmi'
		icon_state="Wall30"
		density=1
	Wall31
		Health=100000000000000
		icon='Walls.dmi'
		icon_state="Wall31"
		density=1
	Wall32
		icon='Walls.dmi'
		icon_state="Wall32"
		density=1
	Wall33
		icon='Walls.dmi'
		icon_state="Wall33"
		density=1
	Wall34
		icon='Walls.dmi'
		icon_state="Wall34"
		density=1
	Wall35
		icon='Walls.dmi'
		icon_state="Wall35"
		density=1
	Wall36
		icon='Walls.dmi'
		icon_state="Wall36"
		density=1
	Wall37
		icon='Walls.dmi'
		icon_state="Wall37"
		density=1
	Wall38
		icon='Walls.dmi'
		Health=100000000000000
		icon_state="Wall38"
		density=1
	Wall39
		icon='Walls.dmi'
		icon_state="Wall39"
		density=1
	Wall40
		icon='Walls.dmi'
		icon_state="Wall40"
		density=1
	Wall41
		icon='Walls.dmi'
		icon_state="Wall41"
		density=1
	Wall42
		icon='Walls.dmi'
		icon_state="Wall42"
		density=1
	Wall43
		icon='Walls.dmi'
		icon_state="Wall43"
		density=1
	Wall44
		icon='Walls.dmi'
		icon_state="Wall44"
		density=1
	Wall45
		icon='Walls.dmi'
		icon_state="Wall45"
		density=1
	Wall46
		icon='Walls.dmi'
		icon_state="Wall46"
		density=1
	Wall47
		icon='Walls.dmi'
		icon_state="Wall47"
		density=1
	Wall48
		icon='Walls.dmi'
		icon_state="Wall48"
		density=1
	Wall49
		icon='Walls.dmi'
		icon_state="Wall49"
		density=1
	Wall50
		icon='Walls.dmi'
		icon_state="Wall50"
		density=1
	Wall51
		icon='Walls.dmi'
		icon_state="Wall51"
		density=1
	Wall52
		icon='Walls.dmi'
		icon_state="Wall52"
		density=1
	Wall53
		icon='Walls.dmi'
		icon_state="Wall53"
		density=1
	Wall54
		icon='Walls.dmi'
		icon_state="Wall54"
		density=1
	Wall55
		icon='Walls.dmi'
		icon_state="Wall55"
		density=1
	Wall56
		icon='Walls.dmi'
		icon_state="Wall56"
		density=1
	Wall57
		icon='Walls.dmi'
		icon_state="Wall57"
		density=1
	Wall99
		icon='Walls.dmi'
		icon_state="Wall99"
		density=1
//Roof turfs
	Roof1
		icon='Roofs.dmi'
		icon_state="Roof1"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble) return ..()
			else return
	Roof1C
		icon='Roofs.dmi'
		icon_state="Roof1C"
		density=1
		opacity=1
		FlyOverAble=0
		Enter(atom/A)
			if(FlyOverAble) return ..()
			else return
	Roof2
		icon='Roofs.dmi'
		icon_state="Roof2"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble) return ..()
			else return
	Roof3
		icon='Roofs.dmi'
		icon_state="Roof3"
		density=1
		opacity=1
		FlyOverAble=0
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof4
		icon='Roofs.dmi'
		icon_state="Roof4"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof4C
		icon='Roofs.dmi'
		icon_state="Roof4C"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof5
		icon='Roofs.dmi'
		icon_state="Roof5"
		density=1
		opacity=1
		FlyOverAble=0
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof5C
		icon='Roofs.dmi'
		icon_state="Roof5C"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof6
		icon='Roofs.dmi'
		icon_state="Roof6"
		density=1
		opacity=1
		FlyOverAble=0
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof6R
		icon='Roofs.dmi'
		icon_state="Roof6R"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof6G
		icon='Roofs.dmi'
		icon_state="Roof6G"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof6B
		icon='Roofs.dmi'
		icon_state="Roof6B"
		FlyOverAble=0
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof6Y
		icon='Roofs.dmi'
		icon_state="Roof6Y"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof6W
		icon='Roofs.dmi'
		icon_state="Roof6W"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof7
		icon='Roofs.dmi'
		icon_state="Roof7"
		density=1
		FlyOverAble=0
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof8
		icon='Roofs.dmi'
		icon_state="Roof8"
		density=1
		FlyOverAble=0
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof9
		icon='Roofs.dmi'
		icon_state="Roof9"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof10
		icon='Roofs.dmi'
		icon_state="Roof10"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof11
		icon='Roofs.dmi'
		icon_state="Roof11"
		FlyOverAble=0
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof12
		icon='Roofs.dmi'
		icon_state="Roof12"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof13
		icon='Roofs.dmi'
		icon_state="Roof13"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof14
		icon='Roofs.dmi'
		icon_state="Roof14"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof15
		icon='Roofs.dmi'
		icon_state="Roof15"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof16
		icon='Roofs.dmi'
		icon_state="Roof16"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof17
		icon='Roofs.dmi'
		icon_state="Roof17"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof18
		icon='Roofs.dmi'
		icon_state="Roof18"
		density=1
		opacity=1
		FlyOverAble=0
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof19
		icon='Roofs.dmi'
		icon_state="Roof19"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof20
		icon='Roofs.dmi'
		icon_state="Roof20"
		FlyOverAble=0
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof21
		icon='Roofs.dmi'
		icon_state="Roof21"
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return
	Roof22
		icon='Roofs.dmi'
		icon_state="Roof22"
		FlyOverAble=0
		density=1
		opacity=1
		Enter(atom/A)
			if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
			else return

//Midgar Tiles
	MidgarTiles
		MidgarRoofEast
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofEast"
			FlyOverAble=0
			layer=3
			density=1
			opacity=1
			Enter(atom/A)
				if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
				else return
			Destructable=0
		MidgarRoofWest
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofWest"
			FlyOverAble=0
			layer=3
			density=1
			opacity=1
			Enter(atom/A)
				if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
				else return
			Destructable=0
		MidgarRoofNorth
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofNorth"
			FlyOverAble=0
			layer=3
			density=1
			opacity=1
			Enter(atom/A)
				if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
				else return
			Destructable=0
		MidgarRoofSouth
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofSouth"
			FlyOverAble=0
			layer=3
			density=1
			opacity=1
			Enter(atom/A)
				if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
				else return
			Destructable=0
		MidgarRoofNE
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofNorthToEast"
			FlyOverAble=0
			layer=3
			density=1
			opacity=1
			Enter(atom/A)
				if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
				else return
			Destructable=0
		MidgarRoofSE
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofSouthToEast"
			FlyOverAble=0
			layer=3
			density=1
			opacity=1
			Enter(atom/A)
				if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
				else return
			Destructable=0
		MidgarRoofSW
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofSouthToWest"
			FlyOverAble=0
			layer=3
			density=1
			opacity=1
			Enter(atom/A)
				if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
				else return
			Destructable=0
		MidgarRoofNW
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofNorthToWest"
			FlyOverAble=0
			layer=3
			density=1
			opacity=1
			Enter(atom/A)
				if(FlyOverAble||A:IgnoreFlyOver==1) return ..()
				else return
			Destructable=0
		MidgarTile1
			icon='Midgar Tiles.dmi'
			icon_state="IndusTile1"
			Destructable=0
		MidgarTile2
			icon='Midgar Tiles.dmi'
			icon_state="IndusTileWarning"
			Destructable=0
		MidgarTile3
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofGrateLeft"
			Destructable=0
		MidgarTile4
			icon='Midgar Tiles.dmi'
			icon_state="IndusRoofGrateRight"
			Destructable=0
		MidgarStairs
			icon='Midgar Tiles.dmi'
			icon_state="IndusStairs"
			Destructable=0
		MidgarLadder
			icon='Midgar Tiles.dmi'
			icon_state="IndusLadder1"
			Destructable=0
		MidgarLadder2
			icon='Midgar Tiles.dmi'
			icon_state="IndusLadder2"
			Destructable=0
		MidgarLadder3
			icon='Midgar Tiles.dmi'
			icon_state="IndusLadder3"
			Destructable=0
		MidgarSlime
			icon='Midgar Tiles.dmi'
			icon_state="IndusSlime1"
			Destructable=0
		MidgarSlime2
			icon='Midgar Tiles.dmi'
			icon_state="IndusSlime2"
			Destructable=0
		MidgarSlime3
			icon='Midgar Tiles.dmi'
			icon_state="IndusSlime3"
			Destructable=0
		MidgarSlime4
			icon='Midgar Tiles.dmi'
			icon_state="IndusSlime4"
			Destructable=0
		MidgarSlime5
			icon='Midgar Tiles.dmi'
			icon_state="IndusSlime5"
			Destructable=0
		MidgarWall1
			icon='Midgar Tiles.dmi'
			icon_state="Induswall1"
			density=1
			Destructable=0
		MidgarWall2
			icon='Midgar Tiles.dmi'
			icon_state="Induswall3"
			density=1
			Destructable=0
		MidgarWall3
			icon='Midgar Tiles.dmi'
			icon_state="Induswall2"
			density=1
			Destructable=0
		MidgarWall4
			icon='Midgar Tiles.dmi'
			icon_state="Induswall4"
			density=1
			Destructable=0
		Midgarwall5
			icon='Midgar Tiles.dmi'
			icon_state="Induswall5"
			density=1
			Destructable=0
		MidgarBelt
			icon='Midgar Tiles.dmi'
			icon_state="IndusConveyer"
			Destructable=0
		MidgarRapeWindow
			icon='Midgar Tiles.dmi'
			icon_state="Indusrapewindow"
			Destructable=0
			density=1
		MidgarGrate
			icon='Midgar Tiles.dmi'
			icon_state="Grate"
			Destructable=0
		MidgarGrate2
			icon='Midgar Tiles.dmi'
			icon_state="Grate2"
			Destructable=0
		MidgarGrate3
			icon='Midgar Tiles.dmi'
			icon_state="Grate3"
			Destructable=0
			layer=4
		MidgarLightWall
			icon='Midgar Tiles.dmi'
			icon_state="IndusSwitchoff"
			Destructable=0
			density=1
		MidgarLightWall2
			icon='Midgar Tiles.dmi'
			icon_state="IndusSwitchoff"
			Destructable=0
			density=1
		MidgarLightWall3
			icon='Midgar Tiles.dmi'
			icon_state="Induswalllights"
			Destructable=0
			density=1

//Stair turfs
	Stairs1
		icon='Stairs.dmi'
		icon_state="Stairs1"
	Stairs2
		icon='Stairs.dmi'
		icon_state="Stairs2"
	Stairs3
		icon='Stairs.dmi'
		icon_state="Stairs3"
	Stairs4
		icon='Stairs.dmi'
		icon_state="Stairs4"
	Stairs5
		icon='Stairs.dmi'
		icon_state="Stairs5"
	Stairs6
		icon='Stairs.dmi'
		icon_state="Stairs6"
	Stairs7
		icon='Stairs.dmi'
		icon_state="Stairs7"
	Stairs8
		icon='Stairs.dmi'
		icon_state="Stairs8"
	Stairs8L
		icon='Stairs.dmi'
		icon_state="Stairs8L"
	Stairs8R
		icon='Stairs.dmi'
		icon_state="Stairs8R"
//Custom Turf
	CustomTurf
		var/Roof=0
		icon='ArtificalObj.dmi'
		icon_state="QuestionMark"
		Enter(atom/A)
			if(Roof==1)
				if(FlyOverAble||A:IgnoreFlyOver==1)
					return ..()
				else
					return
			else
				return ..()


turf/Waters
	Health=10000000000
	LogPEndurance=1000000000
	icon='Waters.dmi'
	WaterReal
		icon_state="4"
		Water=1
	Water5
		icon_state="5"
		Water=1
	WaterFall
		icon_state="waterfall"
		density=1
		layer=MOB_LAYER+1
		Water=1
	Water6
		icon_state="6"
		Water=1
	Water3
		icon_state="3"
		Water=1
	Water8
		icon_state="8"
		Water=1
	Water1
		icon_state="1"
		Water=1
	Water11
		icon_state="11"
		Water=1
	Water7
		icon_state="7"
		density=0
		Lava=1
	Water2
		icon_state="2"
		Water=1
	Water12
		icon_state="12"
		Water=1
	Water9
		icon_state="9"
		Water=1
	Water10
		icon_state="10"
		Water=1
	Water13
		icon_state="13"
		Water=1
	WaterD
		icon_state="14"
		Water=1
	Water15
		icon_state="15"
		Water=1

turf/Edges
	Grass16NW
		icon='Grass.dmi'
		icon_state="Grass16NW"
	Grass16NE
		icon='Grass.dmi'
		icon_state="Grass16NE"
	Grass16SW
		icon='Grass.dmi'
		icon_state="Grass16SW"
	Grass16SE
		icon='Grass.dmi'
		icon_state="Grass16SE"
	Sand3NW
		icon='Dirt.dmi'
		icon_state="Sand3NW"
	Sand3NE
		icon='Dirt.dmi'
		icon_state="Sand3NE"
	Sand3SW
		icon='Dirt.dmi'
		icon_state="Sand3SW"
	Sand3SE
		icon='Dirt.dmi'
		icon_state="Sand3SE"
	Grass24NW
		icon='Grass.dmi'
		icon_state="Grass24NW"
	Grass24NE
		icon='Grass.dmi'
		icon_state="Grass24NE"
	Grass24SW
		icon='Grass.dmi'
		icon_state="Grass24SW"
	Grass24SE
		icon='Grass.dmi'
		icon_state="Grass24SE"
	Grass23NW
		icon='Grass.dmi'
		icon_state="Grass23NW"
	Grass23NE
		icon='Grass.dmi'
		icon_state="Grass23NE"
	Grass23SW
		icon='Grass.dmi'
		icon_state="Grass23SW"
	Grass23SE
		icon='Grass.dmi'
		icon_state="Grass23SE"
	Grass23EdgeN
		icon='Grass.dmi'
		icon_state="Grass23EdgeN"
	Grass23EdgeS
		icon='Grass.dmi'
		icon_state="Grass23EdgeS"
	Grass23EdgeE
		icon='Grass.dmi'
		icon_state="Grass23EdgeE"
	Grass23EdgeW
		icon='Grass.dmi'
		icon_state="Grass23EdgeW"
	Sand3EdgeN
		icon='Dirt.dmi'
		icon_state="Sand3EdgeN"
	Sand3EdgeS
		icon='Dirt.dmi'
		icon_state="Sand3EdgeS"
	Sand3EdgeE
		icon='Dirt.dmi'
		icon_state="Sand3EdgeE"
	Sand3EdgeW
		icon='Dirt.dmi'
		icon_state="Sand3EdgeW"
	Grass7NW
		icon='Grass.dmi'
		icon_state="Grass7NW"
	Grass7NE
		icon='Grass.dmi'
		icon_state="Grass7NE"
	Grass7SW
		icon='Grass.dmi'
		icon_state="Grass7SW"
	Grass7SE
		icon='Grass.dmi'
		icon_state="Grass7SE"
	Grass7EdgeN
		icon='Grass.dmi'
		icon_state="Grass7EdgeN"
	Grass7EdgeS
		icon='Grass.dmi'
		icon_state="Grass7EdgeS"
	Grass7EdgeE
		icon='Grass.dmi'
		icon_state="Grass7EdgeE"
	Grass7EdgeW
		icon='Grass.dmi'
		icon_state="Grass7EdgeW"
	Dirt3NW
		icon='Dirt.dmi'
		icon_state="Dirt3NW"
	Dirt3NE
		icon='Dirt.dmi'
		icon_state="Dirt3NE"
	Dirt3SW
		icon='Dirt.dmi'
		icon_state="Dirt3SW"
	Dirt3SE
		icon='Dirt.dmi'
		icon_state="Dirt3SE"
	Sand19NW
		icon='Dirt.dmi'
		icon_state="Sand19NW"
	Sand19NE
		icon='Dirt.dmi'
		icon_state="Sand19NE"
	Sand19SW
		icon='Dirt.dmi'
		icon_state="Sand19SW"
	Sand19SE
		icon='Dirt.dmi'
		icon_state="Sand19SE"
	Sand19EdgeN
		icon='Dirt.dmi'
		icon_state="Sand19EdgeN"
	Sand19EdgeS
		icon='Dirt.dmi'
		icon_state="Sand19EdgeS"
	Sand19EdgeE
		icon='Dirt.dmi'
		icon_state="Sand19EdgeE"
	Sand19EdgeW
		icon='Dirt.dmi'
		icon_state="Sand19EdgeW"
	Grass16EdgeN
		icon='Grass.dmi'
		icon_state="Grass16EdgeN"
	Grass16EdgeS
		icon='Grass.dmi'
		icon_state="Grass16EdgeS"
	Grass16EdgeE
		icon='Grass.dmi'
		icon_state="Grass16EdgeE"
	Grass16EdgeW
		icon='Grass.dmi'
		icon_state="Grass16EdgeW"


obj/Turfs
	IconsXLBig
		icon='NewOther.dmi'
		Icon1
			icon_state="1"
		Icon2
			icon_state="2"
		Icon3
			icon_state="3"
		Icon4
			icon_state="4"
		Icon5
			icon_state="5"
		Icon6
			icon_state="6"
		Icon7
			icon_state="7"
		Icon8
			icon_state="8"
		Icon9
			icon_state="9"
		Icon10
			icon_state="10"
		Icon11
			icon_state="11"
		Icon12
			icon_state="12"
		Icon13
			icon_state="13"
		Icon14
			icon_state="14"
		Icon15
			icon_state="15"
		Icon16
			icon_state="16"
		Icon17
			icon_state="17"
		Icon18
			icon_state="18"
		Icon19
			icon_state="19"
		Icon20
			icon_state="20"
		Icon21
			icon_state="21"
		Icon22
			icon_state="22"
		Icon23
			icon_state="23"
		Icon24
			icon_state="24"
		Icon25
			icon_state="25"
		Icon26
			icon_state="26"
		Icon27
			icon_state="27"
		Icon28
			icon_state="28"
		Icon29
			icon_state="29"
		Icon30
			icon_state="30"
		Icon31
			icon_state="31"
		Icon32
			icon_state="32"
		Icon33
			icon_state="33"
		Icon34
			icon_state="34"
		Icon35
			icon_state="35"
		Icon36
			icon_state="36"
		Icon37
			icon_state="37"
		Icon38
			icon_state="38"
		Icon39
			icon_state="39"
		Icon40
			icon_state="40"
		Icon41
			icon_state="41"
		Icon42
			icon_state="42"
		Icon43
			icon_state="43"
		Icon44
			icon_state="44"
		Icon45
			icon_state="45"
		Icon46
			icon_state="46"
		Icon47
			icon_state="47"
		Icon48
			icon_state="48"
		Icon49
			icon_state="49"
		Icon50
			icon_state="50"
		Icon51
			icon_state="51"
		Icon52
			icon_state="52"
		Icon53
			icon_state="53"
		Icon54
			icon_state="54"
		Icon55
			icon_state="55"
		Icon56
			icon_state="56"
		Icon57
			icon_state="57"
		Icon58
			icon_state="58"
		Icon59
			icon_state="59"
		Icon60
			icon_state="60"
		Icon61
			icon_state="61"
		Icon62
			icon_state="62"
		Icon63
			icon_state="63"
		Icon64
			icon_state="64"
		Icon65
			icon_state="65"
		Icon66
			icon_state="66"
		Icon67
			icon_state="67"
		Icon68
			icon_state="68"
		Icon69
			icon_state="69"
		Icon70
			icon_state="70"
		Icon71
			icon_state="71"
		Icon72
			icon_state="72"
		Icon73
			icon_state="73"
			layer = MOB_LAYER+1
			density=1
		Icon74
			icon_state="74"
			layer = MOB_LAYER+1
			density=1
		Icon75
			icon_state="75"
			layer = MOB_LAYER+1
			density=1

	IconsX
		icon='NewObjects.dmi'
		Icon1
			icon_state="1"
			density=1
		Icon2
			icon_state="2"
			density=1
		Icon3
			icon_state="3"
			density=1
		Icon4
			icon_state="4"
			density=1
		Icon5
			icon_state="5"
			density=1
		Icon6
			icon_state="6"
			density=1
		Icon7
			icon_state="7"
			density=1
		Icon8
			icon_state="8"
		Icon9
			icon_state="9"
		Icon10
			icon_state="10"
		Icon11
			icon_state="11"
			density=1
		Icon12
			icon_state="12"
			density=1
		Icon13
			icon_state="13"
			density=1
		Icon14
			icon_state="14"
			density=1
		Icon15
			icon_state="15"
			density=1
		Icon16
			icon_state="16"
			density=1
		Icon17
			icon_state="17"
			density=1
		Icon18
			icon_state="18"
			density=1
		Icon19
			icon_state="19"
			density=1
		Icon20
			icon_state="20"
		Icon21
			icon_state="21"
		Icon22
			icon_state="22"
		Icon23
			icon_state="23"
		Icon24
			icon_state="24"
		Icon25
			icon_state="25"
			density=1
		Icon26
			icon_state="26"
			density=1
		Icon27
			icon_state="27"
		Icon28
			icon_state="28"
			density=1
			layer = MOB_LAYER+1
		Icon29
			icon_state="29"
			density=1
		Icon30
			icon_state="30"
			density=1
		Icon31
			icon_state="31"
			density=1
		Icon32
			icon_state="32"
			density=1
		Icon33
			icon_state="33"
			density=1
		Icon34
			icon_state="34"
			density=1
		Icon35
			icon_state="35"
			density=1
		Icon36
			icon_state="36"
			density=1
		Icon37
			icon_state="37"
			density=1
		Icon38
			icon_state="38"
		Icon39
			icon_state="39"
		Icon40
			icon_state="40"
		Icon41
			icon_state="41"
		Icon42
			icon_state="42"
			density=1
		Icon43
			icon_state="43"
			density=1
		Icon44
			icon_state="44"
			density=1
		Icon45
			icon_state="45"
			density=1
		Icon46
			icon_state="46"
			density=1
		Icon47
			icon_state="47"
			density=1
		Icon48
			icon_state="48"
			density=1
		Icon49
			icon_state="49"
			density=1
		Icon50
			icon_state="50"
			density=1
		Icon51
			icon_state="51"
			density=1
		Icon52
			icon_state="52"
			density=1
		Icon53
			icon_state="53"
			density=1
		Icon54
			icon_state="54"
			density=1
		Icon55
			icon_state="55"
			density=1
		Icon56
			icon_state="56"
		Icon57
			icon_state="57"
		Icon58
			icon_state="58"
		Icon59
			icon_state="59"
		Icon60
			icon_state="60"
		Icon61
			icon_state="61"
		Icon62
			icon_state="62"
		Icon63
			icon_state="63"
		Icon64
			icon_state="64"
		Icon65
			icon_state="65"
		Icon66
			icon_state="66"
		Icon67
			icon_state="67"
		Icon68
			icon_state="68"
		Icon69
			icon_state="69"
		Icon70
			icon_state="70"
		Icon71
			icon_state="71"
		Icon72
			icon_state="72"
		Icon73
			icon_state="73"
		Icon74
			icon_state="74"
		Icon75
			icon_state="75"
		Icon76
			icon_state="76"
		Icon77
			icon_state="77"
		Icon78
			icon_state="78"
			density=1
		Icon79
			icon_state="79"
		Icon80
			icon_state="80"
		Icon81
			icon_state="81"
		Icon82
			icon_state="82"
		Icon83
			icon_state="83"
			density=1
		Icon84
			icon_state="84"
			density=1
		Icon85
			icon_state="85"
			density=1
		Icon86
			icon_state="86"
			density=1
		Icon87
			icon_state="87"
		Icon88
			icon_state="88"
		Icon89
			icon_state="89"
		Icon90
			icon_state="90"
		Icon91
			icon_state="91"
			density=1
		Icon92
			icon_state="92"
		Icon93
			icon_state="93"
			density=1
		Icon94
			icon_state="94"
			density=1
		Icon95
			icon_state="95"
		Icon96
			icon_state="96"
		Icon97
			icon_state="97"
		Icon98
			icon_state="98"
			density=1
		Icon99
			icon_state="99"
		Icon100
			icon_state="100"
		Icon101
			icon_state="101"
			density=1
		Icon102
			icon_state="102"
			density=1
		Icon103
			icon_state="103"
		Icon104
			icon_state="104"
		Icon105
			icon_state="105"
		Icon106
			icon_state="106"
		Icon107
			icon_state="107"
		Icon108
			icon_state="108"
		Icon109
			icon_state="109"
		Icon110
			icon_state="110"
		Icon111
			icon_state="111"
		Icon112
			icon_state="112"
			density=1
		Icon113
			icon_state="113"
			density=1
		Icon114
			icon_state="114"
			density=1
		Icon115
			icon_state="115"
			density=1
		Icon116
			icon_state="116"
		Icon117
			icon_state="117"
		Icon118
			icon_state="118"
		Icon119
			icon_state="119"
		Icon120
			icon_state="120"
		Icon121
			icon_state="121"
			density=1
		Icon122
			icon_state="122"
			density=1
		Icon123
			icon_state="123"
		Icon124
			icon_state="124"
		Icon125
			icon_state="125"
			density=1
		Icon126
			icon_state="126"
		Icon127
			icon_state="127"
			density=1
		Icon128
			icon_state="128"
			density=1
		Icon129
			icon_state="129"
			density=1
		Icon130
			icon_state="130"
			density=1
		Icon131
			icon_state="131"
			density=1
		Icon132
			icon_state="132"
			layer = MOB_LAYER-1
		Icon133
			icon_state="133"
		Icon134
			icon_state="134"
		Icon135
			icon_state="135"
		Icon136
			icon_state="136"
		Icon137
			icon_state="137"
		Icon138
			icon_state="138"
		Icon139
			icon_state="139"
		Icon140
			icon_state="140"
		Icon141
			icon_state="141"
			density=1
		Icon142
			icon_state="142"
		Icon143
			icon_state="143"
			density=1
		Icon144
			icon_state="144"
		Icon145
			icon_state="145"
			density=1
		Icon146
			icon_state="146"
			density=1
		Icon147
			icon_state="147"
			density=1
		Icon148
			icon_state="148"
		Icon149
			icon_state="149"
		Icon150
			icon_state="150"
		Icon151
			icon_state="151"
		Icon152
			icon_state="152"
			density=1
		Icon153
			icon_state="153"
			density=1
		Icon154
			icon_state="154"
		Icon155
			icon_state="155"
			density=1
		Icon156
			icon_state="156"
			density=1
		Icon157
			icon_state="157"
			density=1
		Icon158
			icon_state="158"
		Icon159
			icon_state="159"
			density=1
		Icon160
			icon_state="160"
			density=1
		Icon161
			icon_state="161"
			density=1
		Icon162
			icon_state="162"
		Icon163
			icon_state="163"
		Icon164
			icon_state="164"
		Icon165
			icon_state="165"
		Icon166
			icon_state="166"
		Icon167
			icon_state="167"
		Icon168
			icon_state="168"
		Icon169
			icon_state="169"
		Icon170
			icon_state="170"
		Icon171
			icon_state="171"
		Icon172
			icon_state="172"
		Icon173
			icon_state="173"
		Icon174
			icon_state="174"
		Icon175
			icon_state="175"
		Icon176
			icon_state="176"

	MidgarObj
		MidgarBarrel
			icon='Midgar Tiles.dmi'
			icon_state="IndusBarrel"
			density=1
		MidgarCrane
			icon='Midgar Tiles.dmi'
			icon_state="Induscrane"
			layer= 5
		MidgarLaser
			icon='Midgar Tiles.dmi'
			icon_state="Induslaz1"
		MidgarLaser2
			icon='Midgar Tiles.dmi'
			icon_state="Induslaz11"
		MidgarLaser3
			icon='Midgar Tiles.dmi'
			icon_state="Induslaz2"
		MidgarLaser4
			icon='Midgar Tiles.dmi'
			icon_state="Induslaz22"
		MidgarLaser5
			icon='Midgar Tiles.dmi'
			icon_state="Induslaz"
		Midgarchest
			icon='Midgar Tiles.dmi'
			icon_state="IndusChest"
			density=1
		StreetLamp
			icon='Stret Laump.dmi'
			Destructable=0
			density=1
			layer=5
		Lampost
			icon='Lampost and chairs.dmi'
			icon_state="Lampost"
			Destructable=0
			density=1
		Stool
			icon='Lampost and chairs.dmi'
			icon_state="Stool"
			Destructable=0
			layer=4
		TV
			icon='Lampost and chairs.dmi'
			icon_state="Tv"
			Destructable=0
			density=1
		Widescreen
			icon='Lampost and chairs.dmi'
			icon_state="Widescreen"
			Destructable=0
			density=1
		SmallChairE
			icon='Lampost and chairs.dmi'
			icon_state="Small chairE"
			Destructable=0
		SmallChairW
			icon='Lampost and chairs.dmi'
			icon_state="Small chairW"
			Destructable=0
		BenchW
			icon='Lampost and chairs.dmi'
			icon_state="BenchW"
			Destructable=0
		BenchE
			icon='Lampost and chairs.dmi'
			icon_state="BenchE"
			Destructable=0
		Steelstool
			icon='Lampost and chairs.dmi'
			icon_state="Steel Stool"
			Destructable=0
			layer=4
		PlushChair
			icon='Lampost and chairs.dmi'
			icon_state="Chair"
			Destructable=0

	Door/Door2
		icon='Doors.dmi'
		icon_state="Closed2"
		density=1
	Door/TransparentDoor
		icon='Doors.dmi'
		icon_state="Closed3"
		density=1
		opacity=0
		Glass=1
	Door/LazerDoor
		LaserDoor3Wide
			icon='Lazerdoor.dmi'
			icon_state="Closed"
			density=1
			opacity=0
			Glass=1
			bound_width=96
		LazerDoorLeft
			icon='LazerdoorLeft.dmi'
			icon_state="Closed"
			density=1
			opacity=0
			Glass=1
		LazerDoorRight
			icon='LazerdoorRight.dmi'
			icon_state="Closed"
			density=1
			opacity=0
			Glass=1
		LazerDoorMiddle
			icon='LazerdoorMiddle.dmi'
			icon_state="Closed"
			density=1
			opacity=0
			Glass=1
	Door
		Destructable=0
		var/DoorID=0 //For LazerDoors.
		var/typee
		var/antispam
		density=1
		Glass=1
		Grabbable=0
		icon='Doors.dmi'
		icon_state="Closed1"
		New()
			Open()
			src.antispam=null
			..()
		Click()
			..()
			if(usr in oview(1,src))
				if(!src.antispam)
					if(istype(src,/obj/Turfs/Door/LazerDoor))
						oview(10,src)<<"<font color=red><small>The Lazer made a loud buzzing sound!"
						usr.Burning+=0.20
						spawn()usr.Burning_Check()
					else
						oview(10,src)<<"<font color=yellow><small>There is a knock on the door!"
					src.antispam=1
					spawn(30)
						src.antispam=null

		proc/Open()
			density=0
			opacity=0
			if(istype(src,/obj/Turfs/Door/Door2))
				typee=2
			else if(istype(src,/obj/Turfs/Door/TransparentDoor))
				typee=3
			else
				typee=1
			if(icon=='Doors.dmi')
				flick("Opening[typee]",src)
				icon_state="Open[typee]"
			else
				flick("Opening",src)
				icon_state="Open"
			spawn(50) Close()
		proc/Close()
			density=1
			if(!istype(src,/obj/Turfs/Door/TransparentDoor)&&!istype(src,/obj/Turfs/Door/LazerDoor))
				opacity=1
			if(icon=='Doors.dmi')
				flick("Closing[typee]",src)
				icon_state="Closed[typee]"
			else
				flick("Closing",src)
				icon_state="Closed"

	Sign
		icon='Objects.dmi'
		icon_state="Sign"
		density=1
		Click() if(desc) usr<<desc
		Information_Panel
			icon='Objects.dmi'
			icon_state="Sign2"
		Sign3
			icon='Objects.dmi'
			icon_state="Sign3"
		Sign4
			icon='Objects.dmi'
			icon_state="Sign4"
		Sign5
			icon='Objects.dmi'
			icon_state="Sign5"
		Sign6
			icon='Objects.dmi'
			icon_state="Sign6"
		SignGrave1
			icon='NewObjects.dmi'
			icon_state="129"
	CustomObj1
		icon='ArtificalObj.dmi'
		icon_state="QuestionMark"
	Rock
		icon='Gardening.dmi'
		icon_state="Rock1"
	LargeRock
		density=1
		icon='Gardening.dmi'
		icon_state="Rock2"
	SignTech1
		icon='Lab2.dmi'
		icon_state="WallDisplayA"
	SignTech2
		icon='Lab2.dmi'
		icon_state="WallDisplayB"
	VineWallOL1
		icon='TurfOverlays.dmi'
		icon_state="vinewall1"
	VineWallOL2
		icon='TurfOverlays.dmi'
		icon_state="vinewall2"
	VineWallOL3
		icon='Gardening.dmi'
		icon_state="Natural5"
	VineWallOL4
		icon='Gardening.dmi'
		icon_state="Natural6"
	VineWallOL5
		icon='Gardening.dmi'
		icon_state="Natural7"
	WallCrackOL1
		icon='TurfOverlays.dmi'
		icon_state="crack1"
	WallCrackOL2
		icon='TurfOverlays.dmi'
		icon_state="crack2"
	WallCrackOL3
		icon='TurfOverlays.dmi'
		icon_state="crack3"
	firewood
		icon='Gardening.dmi'
		icon_state="Firewood"
		density=1
	WaterRock
		density=1
		icon='Gardening.dmi'
		icon_state="Rock4"
	HellRock
		density=1
		icon='Gardening.dmi'
		icon_state="Hellrock1"
	HellRock2
		density=1
		icon='Gardening.dmi'
		icon_state="Hellrock2"
	HellRock3
		density=1
		icon='Gardening.dmi'
		icon_state="Hellrock3"
	LargeRock2
		density=1
		icon='Gardening.dmi'
		icon_state="Rock3"
	Rock1
		icon='Gardening.dmi'
		icon_state="Rock5"
		density=1
	Rock2
		icon='Gardening.dmi'
		icon_state="Rock6"
		density=1
	Stalagmite
		density=1
		icon='Gardening.dmi'
		icon_state="Stalagmite"
	Fence
		density=1
		icon='Gardening.dmi'
		icon_state="Fence"
	Rock3
		icon='Gardening.dmi'
		icon_state="Rock6"
		density=1
	Rock4
		icon='Gardening.dmi'
		icon_state="Rock7"
		density=1
	Flowers
		icon='Gardening.dmi'
		icon_state="FlowerBed"
	Rock6
		icon='Gardening.dmi'
		icon_state="Rock8"
		density=1
	Bush1
		icon='Gardening.dmi'
		icon_state="Bush1"
		density=1
	Bush2
		icon='Gardening.dmi'
		icon_state="Bush2"
		density=1
	Bush3
		icon='Gardening.dmi'
		icon_state="Bush3"
		density=1
	Bush4
		icon='Gardening.dmi'
		icon_state="Bush4"
		density=1
	Bush5
		icon='Gardening.dmi'
		icon_state="Bush5"
		density=1
	SnowBush
		icon='Gardening.dmi'
		icon_state="Bush6"
		density=1
	Plant12
		icon='Gardening.dmi'
		icon_state="Plant1"
		density=1
	Plant11
		icon='Gardening.dmi'
		icon_state="Plant2"
		density=1
	Plant10
		icon='Gardening.dmi'
		icon_state="Plant3"
		density=1
	Plant16
		icon='Gardening.dmi'
		icon_state="Flowers1"
	Plant15
		icon='Gardening.dmi'
		icon_state="Flowers2"
	Plant21
		icon='Gardening.dmi'
		icon_state="Natural3"
	Plant2
		icon='Gardening.dmi'
		icon_state="Plant4"
		density=1
	Plant3
		icon='Gardening.dmi'
		icon_state="Plant5"
	Plant4
		icon='Gardening.dmi'
		icon_state="Plant6"
	Plant5
		icon='Gardening.dmi'
		icon_state="Plant7"
	Plant13
		icon='Gardening.dmi'
		icon_state="Bush7"
	Plant14
		icon='Gardening.dmi'
		icon_state="Tree1"
		density=1
	Plant18
		icon='Gardening.dmi'
		icon_state="Tree2"
		density=1
	Plant6
		icon='Gardening.dmi'
		icon_state="Hellrock4"
		density=1
	Plant20
		icon='Gardening.dmi'
		icon_state="Hellrock5"
		density=1
	Plant19
		icon='Gardening.dmi'
		icon_state="Hellrock6"
		density=1
	Plant7
		icon='Gardening.dmi'
		icon_state="Tree3"
		density=1
	Plant8
		icon='Gardening.dmi'
		icon_state="Tree4"
		density=1
	Plant9
		icon='Gardening.dmi'
		icon_state="Tree5"
		density=1
	Console1
		icon='Technology32x64.dmi'
		icon_state="Console1"
		density=1
		bound_height=64
	Console2
		icon='Technology64x64.dmi'
		icon_state="LargeConsole1"
		density=1
		bound_width=64
		layer=3
		pixel_y=-20
	Console3
		icon='Technology64x64.dmi'
		icon_state="LargeConsole2"
		density=1
		bound_width=64
		layer=2
		pixel_y=-20
	Console4
		icon='Lab.dmi'
		icon_state="Lab1"
		density=1
	Console5
		icon='Lab.dmi'
		icon_state="Lab2"
		density=1
	Console6L
		icon='Lab.dmi'
		icon_state="PanelL"
		density=1
	Console6R
		icon='Lab.dmi'
		icon_state="PanelR"
		density=1
	Console6R2
		icon='Lab.dmi'
		icon_state="PanelR2"
		density=1
	Console6Top
		icon='Lab.dmi'
		icon_state="PanelTop"
		layer=4
	PipeNS
		icon='Lab.dmi'
		icon_state="pipes"
		dir=NORTH
	PipeWE
		icon='Lab.dmi'
		icon_state="pipes"
		dir=EAST
	TechObject1
		icon='ArtificalObj.dmi'
		icon_state="Fan"
		density=1
	TechObject2
		icon='ArtificalObj.dmi'
		icon_state="Vent"
		density=1
	FishTank1
		icon='Technology32x64.dmi'
		icon_state="FishTank1"
		density=1
		bound_height=64
	FishTank2
		icon='Technology64x64.dmi'
		icon_state="FishTank2"
		density=1
		bound_width=64
		layer=5
	Table7
		icon='Objects.dmi'
		icon_state="Table1"
		density=1
	Table8
		icon='Objects.dmi'
		icon_state="Table2"
		density=1
	Table9
		icon='Objects.dmi'
		icon_state="Table3"
		density=1
	Whirlpool
		icon='Gardening.dmi'
		icon_state="Natural1"
	bridgeN
		icon='Edges.dmi'
		icon_state="N"
		density=1
	bridgeS
		icon='Edges.dmi'
		icon_state="S"
		density=1
	bridgeE
		icon='Edges.dmi'
		icon_state="E"
		density=1
	bridgeW
		icon='Edges.dmi'
		icon_state="W"
		density=1
	Chest
		icon='Objects.dmi'
		icon_state="Chest"
	HellPot
		icon='Objects.dmi'
		icon_state="Pot1"
		density=1
		New()
			var/image/A=image(icon='Objects.dmi',icon_state="Pot2",pixel_y=32)
			overlays.Remove(A)
			overlays.Add(A)
			..()
/*	RugLarge
		New()
			var/image/A=image(icon='Objects.dmi',icon_state="Rug1",pixel_x=-16,pixel_y=16,layer=MOB_LAYER-1)
			var/image/B=image(icon='Objects.dmi',icon_state="Rug2",pixel_x=16,pixel_y=16,layer=MOB_LAYER-1)
			var/image/C=image(icon='Objects.dmi',icon_state="Rug3",pixel_x=-16,pixel_y=-16,layer=MOB_LAYER-1)
			var/image/D=image(icon='Objects.dmi',icon_state="Rug4",pixel_x=16,pixel_y=-16,layer=MOB_LAYER-1)
			overlays.Remove(A,B,C,D)
			overlays.Add(A,B,C,D)
			..()*/
	Apples
		icon='Objects.dmi'
		icon_state="Apples"
	Book
		icon='Objects.dmi'
		icon_state="Book"
	Light
		icon='Objects.dmi'
		icon_state="Light"
		density=1
	Glass
		icon='Objects.dmi'
		icon_state="Glass"
		density=1
		layer=MOB_LAYER+1
	RoofGlass
		icon='Objects.dmi'
		icon_state="Glass"
		density=1
		opacity=0
		Grabbable=0
		FlyOverAble=0
		Glass=1
		Bump(atom/A)
			if(FlyOverAble) return ..()
			else return
	Table6
		icon='Objects.dmi'
		icon_state="Table4"
		density=1
		layer=4
	Table5
		icon='Objects.dmi'
		icon_state="TableL"
		density=1
	Table3
		icon='Objects.dmi'
		icon_state="TableR"
		density=1
	Table4
		icon='Objects.dmi'
		icon_state="TableM"
		density=1
	Log
		density=1
		New()
			var/image/A=image(icon='Objects.dmi',icon_state="Log1",pixel_x=-16)
			var/image/B=image(icon='Objects.dmi',icon_state="Log2",pixel_x=16)
			overlays.Remove(A,B)
			overlays.Add(A,B)
			..()
	FancyCouch
		New()
			var/image/A=image(icon='Objects.dmi',icon_state="CouchL",pixel_x=-16)
			var/image/B=image(icon='Objects.dmi',icon_state="CouchR",pixel_x=16)
			overlays.Remove(A,B)
			overlays.Add(A,B)
			..()

	Jugs
		icon='Objects.dmi'
		icon_state="Jugs"
		density=1
	Hay
		icon='Objects.dmi'
		icon_state="Hay"
		density=1
	Clock
		icon='Objects.dmi'
		icon_state="Clock"
		density=1

	Waterpot
		icon='Objects.dmi'
		icon_state="PotWater"
		density=1

	Stove
		icon='Objects.dmi'
		icon_state="Stove"
		density=1
	Drawer
		icon='Objects.dmi'
		icon_state="Drawers"
		density=1
		New()
			var/image/A=image(icon='Objects.dmi',icon_state="DrawersT",pixel_y=32)
			overlays.Remove(A)
			overlays.Add(A)
			..()
	Bed
		icon='Objects.dmi'
		icon_state="BedT"
		New()
			var/image/A=image(icon='Objects.dmi',icon_state="Bed",pixel_y=-32)
			overlays.Remove(A)
			overlays.Add(A)
			..()
	LargeBed
		icon='LargeBed.dmi'
	Torch1
		icon='Objects.dmi'
		icon_state="Torch1"
		density=1
	Torch2
		icon='Objects.dmi'
		icon_state="Torch2"
		density=1
	Torch3
		icon='Objects.dmi'
		icon_state="Torch3"
		density=1
	Fire
		icon='Objects.dmi'
		icon_state="Fire"
		density=1
	barrel
		icon='Objects.dmi'
		icon_state="Barrel"
		density=1
	chair
		icon='Objects.dmi'
		icon_state="Chair"
	Stool
		icon='ArtificalObj.dmi'
		icon_state="Stool"
	box2
		icon='Objects.dmi'
		icon_state="Box"
		density=1

obj/Turfs/Trees
	SmallPine
		icon='Trees.dmi'
		icon_state="P2"
		density=1
		New()
			var/image/A=image(icon='Trees.dmi',icon_state="P5",pixel_y=0,pixel_x=32,layer=5)
			var/image/E=image(icon='Trees.dmi',icon_state="P1",pixel_y=0,pixel_x=-32,layer=5)
			var/image/B=image(icon='Trees.dmi',icon_state="P0",pixel_y=-32,pixel_x=0,layer=5)
			var/image/C=image(icon='Trees.dmi',icon_state="P3",pixel_y=32,pixel_x=-32,layer=5)
			var/image/D=image(icon='Trees.dmi',icon_state="P4",pixel_y=32,pixel_x=0,layer=5)
			overlays.Remove(A,B,C,D,E)
			overlays.Add(A,B,C,D,E)
			..()
	RedTree
		density=1
		New()
			var/image/A=image(icon='Trees.dmi',icon_state="R1",pixel_y=32,pixel_x=-32,layer=5)
			var/image/B=image(icon='Trees.dmi',icon_state="R2",pixel_y=0,pixel_x=0,layer=5)
			var/image/C=image(icon='Trees.dmi',icon_state="R3",pixel_y=32,pixel_x=32,layer=5)
			var/image/D=image(icon='Trees.dmi',icon_state="R4",pixel_y=0,pixel_x=-32,layer=5)
			var/image/E=image(icon='Trees.dmi',icon_state="R5",pixel_y=32,pixel_x=0,layer=5)
			var/image/F=image(icon='Trees.dmi',icon_state="R6",pixel_y=0,pixel_x=32,layer=5)
			overlays.Remove(A,B,C,D,E,F)
			overlays.Add(A,B,C,D,E,F)
			..()
	BigHousePlant
		density=1
		icon='Gardening.dmi'
		icon_state="Plant"
		New()
			var/image/A=image(icon='Gardening.dmi',icon_state="PlantT",pixel_y=32,pixel_x=0,layer=5)
			overlays.Remove(A)
			overlays.Add(A)
			..()
	Oak
		density=1
		New()
			var/image/A=image(icon='Trees.dmi',icon_state="Z1",pixel_y=0,pixel_x=-16,layer=5)
			var/image/B=image(icon='Trees.dmi',icon_state="Z2",pixel_y=0,pixel_x=16,layer=5)
			var/image/C=image(icon='Trees.dmi',icon_state="Z3",pixel_y=32,pixel_x=-16,layer=5)
			var/image/D=image(icon='Trees.dmi',icon_state="Z4",pixel_y=32,pixel_x=16,layer=5)
			var/image/E=image(icon='Trees.dmi',icon_state="Z5",pixel_y=64,pixel_x=-16,layer=5)
			var/image/F=image(icon='Trees.dmi',icon_state="Z6",pixel_y=64,pixel_x=16,layer=5)
			overlays.Remove(A,B,C,D,E,F)
			overlays.Add(A,B,C,D,E,F)
			..()
	RoundTree
		density=1
		New()
			var/image/A=image(icon='Trees.dmi',icon_state="01",pixel_y=0,pixel_x=-16,layer=5)
			var/image/B=image(icon='Trees.dmi',icon_state="02",pixel_y=0,pixel_x=16,layer=5)
			var/image/C=image(icon='Trees.dmi',icon_state="03",pixel_y=32,pixel_x=-16,layer=5)
			var/image/D=image(icon='Trees.dmi',icon_state="04",pixel_y=32,pixel_x=16,layer=5)
			overlays.Remove(A,B,C,D)
			overlays.Add(A,B,C,D)
			..()
	Tree
		density=1
		icon='Trees.dmi'
		icon_state="Bottom"
		New()
			var/image/B=image(icon='Trees.dmi',icon_state="Middle",pixel_y=32,pixel_x=0,layer=5)
			var/image/C=image(icon='Trees.dmi',icon_state="Top",pixel_y=64,pixel_x=0,layer=5)
			overlays.Remove(B,C)
			overlays.Add(B,C)
			..()
	Palm
		density=1
		New()
			var/image/A=image(icon='Trees.dmi',icon_state="A1",pixel_y=0,pixel_x=-16,layer=5)
			var/image/B=image(icon='Trees.dmi',icon_state="A2",pixel_y=0,pixel_x=16,layer=5)
			var/image/C=image(icon='Trees.dmi',icon_state="A3",pixel_y=32,pixel_x=-16,layer=5)
			var/image/D=image(icon='Trees.dmi',icon_state="A4",pixel_y=32,pixel_x=16,layer=5)
			var/image/E=image(icon='Trees.dmi',icon_state="A5",pixel_y=64,pixel_x=-16,layer=5)
			var/image/F=image(icon='Trees.dmi',icon_state="A6",pixel_y=64,pixel_x=16,layer=5)
			var/image/G=image(icon='Trees.dmi',icon_state="A7",pixel_y=96,pixel_x=-16,layer=5)
			var/image/H=image(icon='Trees.dmi',icon_state="A8",pixel_y=96,pixel_x=16,layer=5)
			overlays.Remove(A,B,C,D,E,F,G,H)
			overlays.Add(A,B,C,D,E,F,G,H)
			..()
	LargePine
		density=1
		New()
			var/image/A=image(icon='Trees.dmi',icon_state="X1",pixel_y=0,pixel_x=-16,layer=5)
			var/image/B=image(icon='Trees.dmi',icon_state="X2",pixel_y=0,pixel_x=16,layer=5)
			var/image/C=image(icon='Trees.dmi',icon_state="X3",pixel_y=32,pixel_x=-16,layer=5)
			var/image/D=image(icon='Trees.dmi',icon_state="X4",pixel_y=32,pixel_x=16,layer=5)
			var/image/E=image(icon='Trees.dmi',icon_state="X5",pixel_y=64,pixel_x=-16,layer=5)
			var/image/F=image(icon='Trees.dmi',icon_state="X6",pixel_y=64,pixel_x=16,layer=5)
			overlays.Remove(A,B,C,D,E,F)
			overlays.Add(A,B,C,D,E,F)
			..()
	LargePineSnow
		density=1
		New()
			var/image/A=image(icon='Trees.dmi',icon_state="S1",pixel_y=0,pixel_x=-16,layer=5)
			var/image/B=image(icon='Trees.dmi',icon_state="S2",pixel_y=0,pixel_x=16,layer=5)
			var/image/C=image(icon='Trees.dmi',icon_state="S3",pixel_y=32,pixel_x=-16,layer=5)
			var/image/D=image(icon='Trees.dmi',icon_state="S4",pixel_y=32,pixel_x=16,layer=5)
			var/image/E=image(icon='Trees.dmi',icon_state="S5",pixel_y=64,pixel_x=-16,layer=5)
			var/image/F=image(icon='Trees.dmi',icon_state="S6",pixel_y=64,pixel_x=16,layer=5)
			overlays.Remove(A,B,C,D,E,F)
			overlays.Add(A,B,C,D,E,F)
			..()
	RedPine
		density=1
		New()
			var/image/A=image(icon='Trees.dmi',icon_state="A1",pixel_y=0,pixel_x=-16,layer=5)
			var/image/B=image(icon='Trees.dmi',icon_state="A2",pixel_y=0,pixel_x=16,layer=5)
			var/image/C=image(icon='Trees.dmi',icon_state="A3",pixel_y=32,pixel_x=-16,layer=5)
			var/image/D=image(icon='Trees.dmi',icon_state="A4",pixel_y=32,pixel_x=16,layer=5)
			var/image/E=image(icon='Trees.dmi',icon_state="A5",pixel_y=64,pixel_x=-16,layer=5)
			var/image/F=image(icon='Trees.dmi',icon_state="A6",pixel_y=64,pixel_x=16,layer=5)
			overlays.Remove(A,B,C,D,E,F)
			overlays.Add(A,B,C,D,E,F)
			..()

	NamekTree
		density=1
		New()
			overlays=null
			switch(pick(1,2,3,4))
				if(1)
					var/image/A=image(icon='Trees.dmi',icon_state="NT2",pixel_y=32,layer=5)
					var/image/B=image(icon='Trees.dmi',icon_state="NT1")
					overlays.Add(A,B)
				if(2)
					var/image/A=image(icon='Trees.dmi',icon_state="Bottom1")
					var/image/B=image(icon='Trees.dmi',icon_state="Middle1",pixel_y=32)
					var/image/C=image(icon='Trees.dmi',icon_state="Top1",pixel_y=64)
					overlays.Add(A,B,C)
				if(3)
					var/image/A=image(icon='Trees.dmi',icon_state="T0")
					var/image/B=image(icon='Trees.dmi',icon_state="T1",pixel_y=32)
					var/image/C=image(icon='Trees.dmi',icon_state="T2",pixel_y=64)
					var/image/D=image(icon='Trees.dmi',icon_state="T3",pixel_y=64,pixel_x=32)
					overlays.Add(A,B,C,D)
				if(4)
					var/image/A=image(icon='Trees.dmi',icon_state="N1")
					var/image/B=image(icon='Trees.dmi',icon_state="N2",pixel_y=32)
					var/image/C=image(icon='Trees.dmi',icon_state="N3",pixel_y=64)
					var/image/D=image(icon='Trees.dmi',icon_state="N4",pixel_y=32,pixel_x=32)
					var/image/E=image(icon='Trees.dmi',icon_state="N5",pixel_y=64,pixel_x=32)
					overlays.Add(A,B,C,D,E)
			..()

turf/Special
	Buildable=0
	Blank
		opacity=1
		Enter(mob/A)
			if(ismob(A))
				if(A.Admin>0)
					return ..()
				else
					return
			else return //why was this del(A)
	Black
	CaveEntrance
		icon='Special.dmi'
		icon_state="Special4"
	PDTurf
		icon='PDTurf.dmi'
		icon_state="1"
	Static
		icon='Special.dmi'
		icon_state="Special5"

	Stars
		icon = 'StarPixel.dmi'
		icon_state="2"
		Health=1345345345345345345345345
	EventStars
		icon='StarPixel.dmi'
		icon_state="3"
		Health=100000000000
		LogPEndurance=1000000000000

	DemonWorldPortal
		icon='Demon World Test.dmi'
		Health=1000000000
		LogPEndurance=1000000000

	Tech5T
		icon='Special.dmi'
		icon_state="Tech5T"
	Tech5TB
		icon='Special.dmi'
		icon_state="Tech5TB"

	DiveSword
		var/typee
		var/antispam
		density=1
		icon='Doors.dmi'
		icon_state="Closed1"
/*		New()
			Open()
			src.antispam=null
			..()*/
		Click()
			..()
			if(usr.DiveLock)
				usr<<"Finish picking or giving up before clicking another one."
				return
			if(!usr.DiveWeapon)
				if(usr in oview(1,src))
					usr.DiveLock=1
					if(usr.Alert("Are you sure you want to pick the sword?"))
						usr.DiveWeapon="Sword"
						usr.ComboPlus=1
						usr << "Your path is set."
						usr << "Now...what will you give up in exchange?"
						usr.StrengthMod*=1.25
						usr.Strength*=1.25
						usr.ForceMod*=1.25
						usr.Force*=1.25
						usr.OffenseMod*=1.25
						usr.Offense*=1.25
						usr.DiveLock=0
						return
					usr.DiveLock=0
			else if(usr.DiveWeapon)
				if(usr.DiveWeapon=="Sword")
					usr << "Can't let you give up what you've got, Riku."
					return
				if(usr.Alert("Are you sure you want to give up the sword?"))
					usr.DiveAbandon="Sword"
					usr << "Your journey begins in the dead of night."
					usr << "Your road won't be easy, but a rising sun awaits you at the end."
					usr.StrengthMod/=1.25
					usr.Strength/=1.25
					usr.ForceMod/=1.25
					usr.Force/=1.25
					usr.OffenseMod/=1.25
					usr.Offense/=1.25
					usr.loc = locate(usr.PrevX, usr.PrevY, usr.PrevZ)
					/*usr.contents+=new/obj/Skills/Keyblade/CallKeyblade
					usr.contents+=new/obj/Skills/Keyblade/BestowKeyblade*/
	DiveShield
		var/typee
		var/antispam
		density=1
		icon='Doors.dmi'
		icon_state="Closed1"
/*		New()
			Open()
			src.antispam=null
			..()*/
		Click()
			..()
			if(usr.DiveLock)
				usr<<"Finish picking or giving up before clicking another one."
				return
			if(!usr.DiveWeapon)
				if(usr in oview(1,src))
					usr.DiveLock=1
					if(usr.Alert("Are you sure you want to pick the shield?"))
						usr.DiveWeapon="Shield"
						usr.SecondChance=1
						usr << "Your path is set."
						usr << "Now...what will you give up in exchange?"
						usr.EnduranceMod*=1.15
						usr.Endurance*=1.15
						usr.ResistanceMod*=1.15
						usr.Resistance*=1.15
						usr.DefenseMod*=1.15
						usr.Defense*=1.15
						usr.DiveLock=0
						return
					usr.DiveLock=0
			else if(usr.DiveWeapon)
				if(usr.DiveWeapon=="Shield")
					usr << "Can't let you give up what you've got, Kairi."
					return
				if(usr.Alert("Are you sure you want to give up the shield?"))
					usr.DiveAbandon="Shield"
					usr << "Your journey begins at dawn."
					usr << "As long as the sun is shining, your journey should be a pleasant one."
					usr.EnduranceMod/=1.15
					usr.Endurance/=1.15
					usr.ResistanceMod/=1.15
					usr.Resistance/=1.15
					usr.DefenseMod/=1.15
					usr.Defense/=1.15
					usr.loc = locate(usr.PrevX, usr.PrevY, usr.PrevZ)
					/*usr.contents+=new/obj/Skills/Keyblade/CallKeyblade
					usr.contents+=new/obj/Skills/Keyblade/BestowKeyblade*/
	DiveStaff
		var/typee
		var/antispam
		density=1
		icon='Doors.dmi'
		icon_state="Closed1"
/*		New()
			Open()
			src.antispam=null
			..()*/
		Click()
			..()
			if(usr.DiveLock)
				usr<<"Finish picking or giving up before clicking another one."
				return
			if(!usr.DiveWeapon)
				if(usr in oview(1,src))
					usr.DiveLock=1
					if(usr.Alert("Are you sure you wish to choose the staff?"))
						usr.DiveWeapon="Staff"
						usr.MPRage=1
						usr << "Your path is set."
						usr << "Now...what will you give up in exchange?"
						usr.Recovery*=1.25
						usr.EnergyMod*=1.5
						usr.EnergyMax*=1.5
						usr.Energy*=1.5
						usr.DiveLock=0
						return
					usr.DiveLock=0
			else if(usr.DiveWeapon)
				if(usr.DiveWeapon=="Staff")
					usr << "Can't let you give up what you've got, Sora."
					return
				if(usr.Alert("Are you sure you want to give up the staff?"))
					usr.DiveAbandon="Staff"
					if(usr.Alert("Are you sure you wish to abandon the staff?"))
						usr.DiveAbandon="Staff"
						usr << "Your journey begins at midday."
						usr << "Keep a steady pace, and you'll come through fine."
						usr.Recovery/=1.25
						usr.EnergyMod/=1.5
						usr.EnergyMax/=1.5
						usr.Energy/=1.5
						usr.loc = locate(usr.PrevX, usr.PrevY, usr.PrevZ)
						/*usr.contents+=new/obj/Skills/Keyblade/CallKeyblade
						usr.contents+=new/obj/Skills/Keyblade/BestowKeyblade*/

	Orb
		icon='Special.dmi'
		icon_state="Special8"
		density=0
	Ladder
		icon='Special.dmi'
		icon_state="Special3"
		density=0
	Sky1
		icon='Special.dmi'
		icon_state="Special2"
	/*	Enter(mob/M)
			if(!Builder&&ismob(M)&&prob(20)&&(!M.Flying||M.density)) M.z=5
			M.Health-=20
			M<< "You fell from the sky...!?"
			return ..()*/
	Sky2
		icon='Special.dmi'
		icon_state="Special1"
		Enter(mob/M)
			if(!Builder&&ismob(M)&&prob(20)&&(!M.Flying||M.density)) M.z=6
			M.Health-=20
			M<< "You fell from the sky...!?"
			return ..()
	Teleporter
		var/X
		var/Y
		var/Z
		Enter(mob/A)
			if(istype(A,/mob))
				A.loc=locate(X,Y,Z)
			else
				del(A)
	Ichor_Water
		icon='Ichor Turf.dmi'
		icon_state="water"
		density=0
		Destructable=0
	Midgar_Ichor
		icon='Ichor Turf.dmi'
		icon_state="ground"
		Destructable=0
	Midgar_IchorWall
		icon='Ichor Turf.dmi'
		icon_state="wall"
		density=1
		Destructable=0
	MidgarIchorW
		icon='Ichor Turf.dmi'
		icon_state="edgeW"
		density=0
	MidgarIchorS
		icon='Ichor Turf.dmi'
		icon_state="edgeS"
		density=0
	MidgarIchorE
		icon='Ichor Turf.dmi'
		icon_state="edgeE"
		density=0
	MidgarIchorN
		icon='Ichor Turf.dmi'
		icon_state="edgeN"
		density=0
		Destructable=0
	BigTrainEngineR
		icon='Train Large.dmi'
		icon_state="EngineR"
		density=1
		layer=4
		Destructable=0
	BigTrainEngineL
		icon='Train Large.dmi'
		icon_state="EngineL"
		density=1
		layer=4
		Destructable=0
	BigTrainCarrageR
		icon='Train Large.dmi'
		icon_state="CarrageR"
		density=1
		layer=4
		Destructable=0
	BigTrainCarrageL
		icon='Train Large.dmi'
		icon_state="CarrageL"
		density=1
		layer=4
		Destructable=0
	midgarTrainFloor
		icon='TrainInterior.dmi'
		icon_state="trainFloorAnim"
		density=0
		layer=1
		Destructable=0
	midgarTrainGrate
		icon='TrainInterior.dmi'
		icon_state="trainFloorGrateAnim"
		density=0
		Destructable=0
	midgarTrainPole
		icon='TrainInterior.dmi'
		icon_state="tPoleBotAnim"
		density=1
		Destructable=0
	midgarTrainPoleTop
		icon='TrainInterior.dmi'
		icon_state="tPoleTopAnim"
		density=0
		layer=5
		Destructable=0
	midgarTrainBenchTop
		icon='TrainInterior.dmi'
		icon_state="tBenchAnim"
		density=0
		layer=1
		Destructable=0
	midgarTrainBenchBottom
		icon='TrainInterior.dmi'
		icon_state="rTBenchAnim"
		density=0
		layer=5
		Destructable=0
	midgarBench
		icon='TrainInterior.dmi'
		icon_state="bench"
		density=0
		layer=4
		Destructable=0
	MidgarTrackAnim
		icon='trackanim.dmi'
		icon_state="Animation"
		density=0
		Destructable=0
	MidgarTrackAnim2
		icon='trackanim.dmi'
		icon_state="Animation2"
		density=0
		Destructable=0


// JENOVA STUFF//
	jenovaReactorBLeft
		icon='Jenova stuff.dmi'
		icon_state="bLeft"
		density=0
		Destructable=0

	jenovaReactorBRight
		icon='Jenova stuff.dmi'
		icon_state="bRight"
		density=0
		Destructable=0

	jenovaReactorCLeft
		icon='Jenova stuff.dmi'
		icon_state="mLeft"
		density=0
		Destructable=0

	jenovaReactorCRight
		icon='Jenova stuff.dmi'
		icon_state="mRight"
		density=0
		Destructable=0

	jenovaReactorTLeft
		icon='Jenova stuff.dmi'
		icon_state="tLeft"
		density=0
		Destructable=0

	jenovaReactorTRight
		icon='Jenova stuff.dmi'
		icon_state="tRight"
		density=0
		Destructable=0

	jenovaReactorBRight
		icon='Jenova stuff.dmi'
		icon_state="bRight"
		density=0
		Destructable=0

	jenovaReactorBLeft
		icon='Jenova stuff.dmi'
		icon_state="bLeft"
		density=0
		Destructable=0

	jenovaTankB
		icon='Jenova stuff.dmi'
		icon_state="tankBottom"
		density=0
		layer=4
		Destructable=0

	jenovaTankC
		icon='Jenova stuff.dmi'
		icon_state="tankMiddle"
		density=0
		layer=4
		Destructable=0

	jenovaTankT
		icon='Jenova stuff.dmi'
		icon_state="tankTop"
		density=0
		layer=4
		Destructable=0

	jenovaBG
		icon='KelvinReactor.dmi'
		icon_state="Jenova BG"
		density=0
		Destructable=0


obj/Special
	Teleporter2
		density=1
		Grabbable=0
		invisibility=98
		var/gotoX
		var/gotoY
		var/gotoZ
		Health=9999999999999999999999999999999999999999999999
		LogPEndurance=1000000000000
		SpecialTele
			GoAbove
			GoBelow
			GoDeep
			GoHigh
//		icon='lightsandshadows.dmi'
/*		Bump(/obj/Items/Tech/SpaceTravel/A)
			if(istype(A,/obj/Items/Tech/SpaceTravel))
				A.loc=locate(gotoX,gotoY,gotoZ)
			else
				return*/
//	PlanetLooper
//		density=1
//		Health=9999999999999999999999999999999999999999999999
//		LogPEndurance=10000000000000000000

	PermaBarrier
		Grabbable=0
		Savable=0
		density=1
		var/Glass=1
		icon='enchantmenticons.dmi'
		icon_state="Barrier"
		Health=420420420420420420420420
		LogPEndurance=420420420420420420420

	SpawnPoint
		Grabbable=0
		invisibility=98
		var/list/RacesAllowed=list()
		var/ActiveSpawn=1
		var/DefaultSpawn=1
		Savable=0
		Health=9001900190019001900190019001
		LogPEndurance=420420420420420420
/*		New()
			if(src.z==1)
				if(!Planets.Find("Earth"))
					del(src)
			if(src.z==2)
				if(!Planets.Find("Namek"))
					del(src)
			if(src.z==3)
				if(!Planets.Find("Vegeta"))
					del(src)
			if(src.z==4)
				if(!Planets.Find("Icer"))
					del(src)
			if(src.z==5)
				if(!Planets.Find("Arconia"))
					del(src)*/


	StaticSurf
		icon='Special.dmi'
		icon_state="Special5S"

	PlanetLooperNS //The North/South Planet Looper Object. These should be placed ideally at 1X/1Y and 1X/500Y respectively.
		density=1
		Health=6957830578348905734057340
		LogPEndurance=95802349583490
		bound_width=32*500

	PlanetLooperEW //The East/West Planet Looper Object. These should be placed ideally at 1X/1Y and 500X/1Y respectively.
		density=1
		Health=5345345345345345345
		LogPEndurance=6456363636
		bound_height=32*500

	midgarTrainWallBottom
		icon='TrainInterior.dmi'
		icon_state="tWallBotAnim"
		density=1
		layer=3
		Grabbable=0
		Health=6957830578348905734057340
		LogPEndurance=95802349583490
		Destructable=0

	shinraLogo
		icon='Shinra.png'
		density=0
		layer=3
		Grabbable=0
		Health=6957830578348905734057340
		LogPEndurance=95802349583490
		Destructable=0

	JENOVA
		icon='Jenova stuff.dmi'
		icon_state="JENOVA"
		density=0
		layer=3
		Destructable=0

	Taxi1
		icon='tcab.dmi'
		icon_state="taxiR"
		density=1
		layer=3
		Destructable=0

	Taxi2
		icon='tcab.dmi'
		icon_state="taxiL"
		density=1
		layer=3
		Destructable=0

	soldierLogo
		icon='soldierlogo.png'
		density=0
		layer=3
		Grabbable=0
		Health=6957830578348905734057340
		LogPEndurance=95802349583490
		Destructable=0

	//Luna attempting to make a special Object you cannot fly over.//
	midgarTrainWallTop
		var/FlyOverAble
		icon='TrainInterior.dmi'
		icon_state="tWallTopAnim"
		density=1
		opacity=0
		Grabbable=0
		FlyOverAble=0
		layer=3
		Health=6957830578348905734057340
		LogPEndurance=95802349583490
		Destructable=0

obj/Turfs/Edges
	RockEdgeN
		icon='Edges.dmi'
		icon_state="1"
		dir=NORTH
	RockEdgeS
		icon='Edges.dmi'
		icon_state="1"
		dir=SOUTH
	RockEdgeW
		icon='Edges.dmi'
		icon_state="1"
		dir=WEST
	RockEdgeE
		icon='Edges.dmi'
		icon_state="1"
		dir=EAST
	RockEdge2N
		icon='Edges.dmi'
		icon_state="2"
		dir=NORTH
	RockEdge2S
		icon='Edges.dmi'
		icon_state="2"
		dir=SOUTH
	RockEdge2W
		icon='Edges.dmi'
		icon_state="2"
		dir=WEST
	RockEdge2E
		icon='Edges.dmi'
		icon_state="2"
		dir=EAST
	Edge3N
		icon='Edges.dmi'
		icon_state="3"
		dir=NORTH
	Edge3S
		icon='Edges.dmi'
		icon_state="3"
		dir=SOUTH
	Edge3W
		icon='Edges.dmi'
		icon_state="3"
		dir=WEST
	Edge3E
		icon='Edges.dmi'
		icon_state="3"
		dir=EAST
	Edge4N
		icon='Edges.dmi'
		icon_state="4"
		dir=NORTH
	Edge4S
		icon='Edges.dmi'
		icon_state="4"
		dir=SOUTH
	Edge4W
		icon='Edges.dmi'
		icon_state="4"
		dir=WEST
	Edge4E
		icon='Edges.dmi'
		icon_state="4"
		dir=EAST
	Edge5N
		icon='Edges.dmi'
		icon_state="5"
		dir=NORTH
	Edge5S
		icon='Edges.dmi'
		icon_state="5"
		dir=SOUTH
	Edge5W
		icon='Edges.dmi'
		icon_state="5"
		dir=WEST
	Edge5E
		icon='Edges.dmi'
		icon_state="5"
		dir=EAST
	Edge6N
		icon='Edges.dmi'
		icon_state="6"
		dir=NORTH
	Edge6S
		icon='Edges.dmi'
		icon_state="6"
		dir=SOUTH
	Edge6W
		icon='Edges.dmi'
		icon_state="6"
		dir=WEST
	Edge6E
		icon='Edges.dmi'
		icon_state="6"
		dir=EAST
	MetalEdgeN
		icon='Edges.dmi'
		icon_state="N2"
		dir=NORTH
	MetalEdgeS
		icon='Edges.dmi'
		icon_state="S2"
		dir=SOUTH
	MetalEdgeE
		icon='Edges.dmi'
		icon_state="E2"
		dir=EAST
	MetalEdgeW
		icon='Edges.dmi'
		icon_state="W2"
		dir=WEST
	DarkEdgeN
		icon='Edges.dmi'
		icon_state="N3"
		dir=NORTH
	DarkEdgeS
		icon='Edges.dmi'
		icon_state="S3"
		dir=SOUTH
	DarkEdgeE
		icon='Edges.dmi'
		icon_state="E3"
		dir=EAST
	DarkEdgeW
		icon='Edges.dmi'
		icon_state="W3"
		dir=WEST
	GrayEdgeN
		icon='Edges.dmi'
		icon_state="7"
		dir=NORTH
	GrayEdgeS
		icon='Edges.dmi'
		icon_state="7"
		dir=SOUTH
	GrayEdgeE
		icon='Edges.dmi'
		icon_state="7"
		dir=EAST
	GrayEdgeWest
		icon='Edges.dmi'
		icon_state="7"
		dir=WEST


obj/Turfs/Surf
	icon='Surf.dmi'
	FireSurf
		icon_state="8"
	Water10Surf
		icon_state="1"
	Water10Surf2
		icon_state="1N"
	Water9Surf
		icon_state="6"
	Water9Surf2
		icon_state="6N"
	Water2Surf
		icon_state="2"
	Water2Surf2
		icon_state="2N"
	Water8Surf
		icon_state="4"
	Water8Surf2
		icon_state="4N"
	Water3Surf
		icon_state="3"
	Water3Surf2
		icon_state="3N"
	Water5Surf
		icon_state="5"
	Water5Surf2
		icon_state="5N"
	Water1Surf
		icon_state="7"
	Water1Surf2
		icon_state="7N"
	Water9Surf
		icon_state="9"
	Water9Surf2
		icon_state="9N"
	Water99
		icon_state="99"

obj/Effects
	var/Glass=0
	Health=1.#INF
	Explosion
		icon='Explosion.dmi'
		layer=MOB_LAYER+1
		New()
			pixel_x=rand(-8,8)
			pixel_y=rand(-8,8)
			spawn(rand(4,6)) if(src) del(src)
//			..()
	Crater
		layer=TURF_LAYER+0.01
		density=0
		icon='Crater.dmi'
		Grabbable=0
		Savable=0
		New()
			pixel_x=-32
			pixel_y=-32
			animate(src,transform=matrix()*0.1)
			animate(src,transform=matrix(),time=5)
			spawn(100) if(src) del(src)
	Lightning
		icon='LightningStrike.dmi'
		icon_state="Front"
		Grabbable=0
		Savable=0
		New()
			//for(var/obj/Effects/Lightning/A in view(2,src)) if(A!=src) del(src)
			var/image/A=image(icon='LightningStrike.dmi',icon_state="End",pixel_y=64)
			var/image/B=image(icon='LightningStrike.dmi',icon_state="Middle",pixel_y=32)
			overlays.Add(A,B)
			walk(src,SOUTH,1)
			spawn(50) if(src) del(src)
	RedLightning
		icon='LightningStrikeRed.dmi'
		icon_state="Front"
		Grabbable=0
		Savable=0
		New()
			//for(var/obj/Effects/Lightning/A in view(2,src)) if(A!=src) del(src)
			var/image/A=image(icon='LightningStrikeRed.dmi',icon_state="End",pixel_y=64)
			var/image/B=image(icon='LightningStrikeRed.dmi',icon_state="Middle",pixel_y=32)
			overlays.Add(A,B)
			walk(src,SOUTH,1)
			spawn(50) if(src) del(src)
	PDEffect
		Grabbable=0
		Savable=0
		density=1

	Tornado
		icon='Effects.dmi'
		icon_state="Tornado"
		Grabbable=0
		Savable=0
		New()
			var/image/A=image(icon='Effects.dmi',icon_state="Tornado",pixel_y=64)
			var/image/B=image(icon='Effects.dmi',icon_state="Tornado",pixel_y=32)
			overlays.Add(A,B)
			walk_rand(src,4)
			spawn(75) if(src) del(src)
	DeadZone
		Grabbable=0
		Savable=0
		icon='Portal.dmi'
		icon_state="center"
		New()
			var/image/A=image(icon='Portal.dmi',icon_state="n")
			var/image/B=image(icon='Portal.dmi',icon_state="e")
			var/image/C=image(icon='Portal.dmi',icon_state="s")
			var/image/D=image(icon='Portal.dmi',icon_state="w")
			var/image/E=image(icon='Portal.dmi',icon_state="ne")
			var/image/F=image(icon='Portal.dmi',icon_state="nw")
			var/image/G=image(icon='Portal.dmi',icon_state="sw")
			var/image/H=image(icon='Portal.dmi',icon_state="se")
			A.pixel_y+=32
			B.pixel_x+=32
			C.pixel_y-=32
			D.pixel_x-=32
			E.pixel_y+=32
			E.pixel_x+=32
			F.pixel_y+=32
			F.pixel_x-=32
			G.pixel_y-=32
			G.pixel_x-=32
			H.pixel_y-=32
			H.pixel_x+=32
			overlays+=A
			overlays+=B
			overlays+=C
			overlays+=D
			overlays+=E
			overlays+=F
			overlays+=G
			overlays+=H
			spawn while(src)
				sleep(1)
				for(var/mob/M in oview(12,src)) if(prob(20))
					//M.move=1
					step_towards(M,src)
				for(var/mob/M in view(0,src))
				/*	if(src.Race!="Human" && src.z!=6)
						view(12,src)<<"The portal flickers, as if something about it changed the moment [M] entered it!"
						M.loc=locate(rand(100,400),rand(100,400),6)*/
					if(src.z==21)
						view(12,src)<<"[M] is sent back into the mortal plane!"
						M.loc=locate(450,100,5)
					else
						view(12,src)<<"[M] is damned to the depths of Hell!"
						M.loc=locate(113,255,21)
				if(prob(0.5)) del(src)

	Blackhole
		Grabbable=0
		Savable=0
		icon='Portal.dmi'
		icon_state="center"
		New()
			var/image/A=image(icon='Portal.dmi',icon_state="n")
			var/image/B=image(icon='Portal.dmi',icon_state="e")
			var/image/C=image(icon='Portal.dmi',icon_state="s")
			var/image/D=image(icon='Portal.dmi',icon_state="w")
			var/image/E=image(icon='Portal.dmi',icon_state="ne")
			var/image/F=image(icon='Portal.dmi',icon_state="nw")
			var/image/G=image(icon='Portal.dmi',icon_state="sw")
			var/image/H=image(icon='Portal.dmi',icon_state="se")
			A.pixel_y+=32
			B.pixel_x+=32
			C.pixel_y-=32
			D.pixel_x-=32
			E.pixel_y+=32
			E.pixel_x+=32
			F.pixel_y+=32
			F.pixel_x-=32
			G.pixel_y-=32
			G.pixel_x-=32
			H.pixel_y-=32
			H.pixel_x+=32
			overlays+=A
			overlays+=B
			overlays+=C
			overlays+=D
			overlays+=E
			overlays+=F
			overlays+=G
			overlays+=H
			spawn while(src)
				sleep(1)
				for(var/mob/M in oview(20,src))
					if(prob(50)&&M!=Owner)
					//M.move=1
						step_towards(src,M)
						if(prob(50))
							step_towards(M,src)
				for(var/mob/M in view(1,src))
				/*	if(src.Race!="Human" && src.z!=6)
						view(12,src)<<"The portal flickers, as if something about it changed the moment [M] entered it!"
						M.loc=locate(rand(100,400),rand(100,400),6)*/
					if(M.Divine)
						view(20,src)<<"[M]'s body is rejected by the black hole!"
						M.loc=locate(rand(25,250),rand(25,250),M.z)
					else
						view(20,src)<<"[M] disappears into the flurry..!"
						M.loc=locate(rand(25,250),rand(25,250),rand(1,8))
				if(prob(1))
					view(20,src)<<"The Black Hole dissipates..."
					del(src)


	DividingField
		Grabbable=0
		Savable=0
		density=1

	FusionCamera
		Grabbable=0
		Savable=0
		density=1
		verb/RelockCameraToPartner()
			set src in view(1)
			if(usr.Fusee)
				for(var/mob/M in world)
					if(M.key==usr.FusionTarget)
						usr.client.eye=M

	PocketPortal
		Grabbable=0
		Savable=0
		density=1
		icon='BlackHole.dmi'

	PocketExit
		Grabbable=0
		Savable=0
		density=1
		icon='BlackHole.dmi'

	Barrier
		Grabbable=0
		Savable=0
		density=1
		Glass=1
		icon='enchantmenticons.dmi'
		icon_state="Barrier"
		New()
			..()
			spawn(1200)
				del(src)

	ForceField
		Grabbable=0
		Savable=1
		density=1
		Glass=1
		var/FieldPassword
		icon='Tech.dmi'
		icon_state="ForceField"

	Sparkles
		Grabbable=0
		Savable=0
		density=0
		icon='Special.dmi'
		icon_state="Special8"
		New()
			..()
			spawn(50)
				del(src)

	PoisonGas
		Grabbable=0
		Savable=0
		density=0
		icon='Dust.dmi'
		icon_state="dust1"
		pixel_x=-16
		pixel_y=-16

		New()
			..()
			icon+=rgb(0,100,0,125)
			spawn()
				while(src)
					sleep(5)
					for(var/mob/M in view(2,src))
						if(M==src.Owner)
							return
						else
							M.Poison+=0.25
							M<<"You inhale from the smaller poisonous cloud by accident and cough!"
							view(M)<<"[M] gags and coughs!"
							spawn()M.Poisoned_Check()
					step_rand(src)
					spawn(150)
						del(src)

	BigPoisonGas
		Grabbable=0
		Savable=0
		density=0
		icon='KunaiMod/Icons/fart.dmi'
		pixel_x=-32
		pixel_y=-32
		New()
			..()
			spawn()
				while(src)
					for(var/mob/M in view(4,src))
						if(M==src.Owner||M.Poison>0)
							return
						else
							if(M.Race=="Synchronizer"||M.Race=="Anti-Spiral")
								view(src)<<"[M] backhands the poison cloud. No cheap tricks!"
								del(src)
								return
							else
								M.Poison+=0.75
								M<<"You inhale from the poisonous cloud and cough instantly!"
								view(M)<<"[M] gags and coughs!"
								spawn()M.Poisoned_Check()
					spawn(50)
						del(src)

	Cinders
		Grabbable=0
		Savable=0
		density=0
		icon='KunaiMod/Icons/sear.dmi'
		New()
			..()
			spawn()
				while(src)
					for(var/mob/M in view(2,src))
						if(M==src.Owner||M.Burning>0)
							return
						else
							if(M.Race=="Synchronizer"||M.Race=="Anti-Spiral")
								view(src)<<"[M] backhands the fire. No cheap tricks!"
								del(src)
								return
							else
								M.Burning+=0.75
								M<<"You light up on fire as the flames lick and burn you!"
								view(M)<<"[M] is on fire!"
								spawn()M.Burning_Check()
					spawn(150)
						del(src)

	Dust
		name = ""
		mouse_opacity = 0
		layer = 5
		icon = 'Dust.dmi'
		icon_state = "dust1"
		pixel_x = -16
		pixel_y = -16
		var/disperse_speed=3

		New()
			..()
			icon+=rgb(0,0,0,100)
			icon_state = "dust[rand(1, 2)]"
			dir = pick(NORTH, WEST, EAST, SOUTH, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)
			pixel_x += rand(-8, 8)
			pixel_y += rand(-8, 8)
			disperse_speed=rand(1,5)

			disperse()

			spawn(rand(30, 60))
				del(src)

		proc/disperse()
			switch(dir)
				if(NORTH)
					pixel_y++
				if(SOUTH)
					pixel_y--
				if(WEST)
					pixel_x--
				if(EAST)
					pixel_x++
				if(NORTHEAST)
					pixel_y++
					pixel_x++
				if(SOUTHEAST)
					pixel_y--
					pixel_x++
				if(NORTHWEST)
					pixel_y++
					pixel_x--
				if(SOUTHWEST)
					pixel_y--
					pixel_x--
			spawn(disperse_speed) .()