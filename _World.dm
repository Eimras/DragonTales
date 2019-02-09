var/MakyoStar=0
var/Crazy=0
//var/debuglog = file("debuglog.log")
//MAKE NPC SPAWNS(did some on earth already)...or just place them on the map for now o.o they dont save
//add the cooler npcs lol()> note; done with SpecialBig.dmi, start/finish Special.dmi
//dont fuking release till that shit is done dumbfuck.
//WORRY ABOUT SHIT MORE.
//ADD NPC DROPS!!!!!!@@!@@!@
//#define DEBUG
client
	fps = 40
world
	name="Dragon Tales"
	status=":yuh:"
	turf=/turf/Special/Blank
	area=/area/Outside
	mob= /mob/Creation
	hub="Sarmie.DragonTales"
	hub_password="DTUltimaPassword"
	tick_lag=0.5
	fps=20
	//step_size=16//32
	cache_lifespan=2
	loop_checks=0
	view=8

	OpenPort()
		..()
		world<<"World Link: byond://[address]:[port]."
	New()
		//..()

		LOGscheduler.start() // kick off the scheduler for logging at the start of the world
//		debuglog << "Preparing to load world."
		WorldLoading=1
//		debuglog << "Worldloading set to 1."
		spawn(100)GlobalSave()
//		debuglog << "spawn(100)GlobalSave() ran successfully."
		Stars()
//		debuglog << "Stars() ran successfully."
		//spawn(100)Check()
		log=file("Saves/Errors.log")
		spawn(10)BootWorld("Load")
//		spawn(10)SuperLoop()
//		debuglog << "\n\nSERVER STARTED AT: [time2text(world.timeofday, "hh:mm.ss")]\n\n"
		..()
	Del()
		//BootWorld("Save")
//		debuglog << "\n\nSERVER STOPPED AT: [time2text(world.timeofday, "hh:mm.ss")]\n\n"
		..()

world/proc/UpdateHub()
	var/ssdis=""
	ssdis += "<b>Dragon Tales</b> &#8212; "
	ssdis += "<b>Roleplay</b>";
	ssdis += " ("
	ssdis += "<a href=\"https://discord.gg/AsUhakr\">" //Link for clicky, set to the discord
	ssdis += "Discord"
	ssdis += "</a>"
	ssdis += ")"
	ssdis += "<br>The best RP this side of Universe 4 - NEW WIPE<br>"
	src.status = ssdis

world
	UpdateHub()

proc/SpawnMaterial()
	var/num=0
	for(var/obj/Items/Tech/SpaceTravel/Ship/AndroidShip/Q in world)
		num++
	if(num==0)
		world<<"<small>Server: Spawning Android Ship."
		var/obj/q=new/obj/Items/Tech/SpaceTravel/Ship/AndroidShip
		q.loc=locate(rand(1,500),rand(1,500),12)
	var/list/buh=list("Earth"=1,"Namek"=2,"Vegeta"=3,"Ice"=4,"Arconia"=5,"Sanctuary"=6,"AlienRuin"=7,"AlienGrassland"=8,"AlienOcean"=9,"AlienArctic"=10,"AlienDesolate"=11,"PirateColony"=12)
	for(var/x in buh)
		if(Planets.Find(x))
			var/numz=0
			for(var/obj/Planets/Q in world)
				if(Q.Zz==buh[x])
					numz++
			if(numz==0)
				world<<"<small>Server: Spawning [x]"
				var/obj/planet = text2path("/obj/Planets/[x]")
				new planet(locate(rand(1,500),rand(1,500),12))
	num=0

/*	var/amount=5
	while(amount>0)
		for(var/obj/Planets/Alien/Q in world)
			if(Q.Zz==amount)
				num=1
		if(num==0)
			world<<"<small>Server: Spawning Random Alien Planets."
			var/obj/q=new/obj/Planets/Alien
			q.loc=locate(rand(1,500),rand(1,500),12)
			q:Zz=amount
			var/randy=1
			var/randx=amount
			while(randx>5)
				randx-=5
				randy++
			world<<"<small>Server: Spawning Conquer Flag on Random Alien Planet."
			var/obj/A=new/obj/PlanetFlag/Pole
			A.loc=locate(rand(randx*100-99,randx*100-1),rand(randy*100-99,randy*100-1),14)
			A:Zz=amount
			switch(amount)
				if(5)
					q.icon-=rgb(100,100,100)
				if(4)
					q.icon+=rgb(-30,-40,50)
				if(3)
					q.icon+=rgb(-30,48,-50)
				if(2)
					q.icon+=rgb(-44,44,50)
				if(1)
					q.icon+=rgb(-70,40,-56)
		amount--*/


//var/numberz=0

proc/GlobalSave()
	set background=1
//	while(1)
//	numberz++
	sleep(108000)
	world<< "<b><HTML><FONT COLOR=#FF0000>T</FONT><FONT COLOR=#FF2900>h</FONT><FONT COLOR=#FF5200>e</FONT><FONT COLOR=#FF7B00> </FONT><FONT COLOR=#FFA400>w</FONT><FONT COLOR=#FFCD00>o</FONT><FONT COLOR=#FFF600>r</FONT><FONT COLOR=#FFff00>l</FONT><FONT COLOR=#D6ff00>d</FONT><FONT COLOR=#ADff00> </FONT><FONT COLOR=#84ff00>i</FONT><FONT COLOR=#5Bff00>s</FONT><FONT COLOR=#32ff00> </FONT><FONT COLOR=#09ff00>s</FONT><FONT COLOR=#00ff00>a</FONT><FONT COLOR=#00ff29>v</FONT><FONT COLOR=#00ff52>i</FONT><FONT COLOR=#00ff7B>n</FONT><FONT COLOR=#00ffA4>g</FONT><FONT COLOR=#00ffCD>.</FONT><FONT COLOR=#00ffF6> </FONT><FONT COLOR=#00ffff>P</FONT><FONT COLOR=#00F6ff>r</FONT><FONT COLOR=#00CDff>e</FONT><FONT COLOR=#00A4ff>p</FONT><FONT COLOR=#007Bff>a</FONT><FONT COLOR=#0052ff>r</FONT><FONT COLOR=#0029ff>e</FONT><FONT COLOR=#0000ff> </FONT><FONT COLOR=#0900ff>y</FONT><FONT COLOR=#3200ff>o</FONT><FONT COLOR=#5B00ff>u</FONT><FONT COLOR=#8400ff>r</FONT><FONT COLOR=#AD00ff>s</FONT><FONT COLOR=#D600ff>e</FONT><FONT COLOR=#FF00ff>l</FONT><FONT COLOR=#FF00F6>f</FONT><FONT COLOR=#FF00CD>!</FONT></HTML></b>"
	for(var/mob/Players/Q)
		if(Q.Savable&&Q.client!=null)
			Q.client.SaveChar()
	BootWorld("Save")
	.()

	//	if(numberz>5)
	//		numberz=0
	//		world<<"Server is rebooting in 30 seconds! Prepare!"
	//		spawn(300)world.Reboot()


var/Updates={"
<i>|Version MM/DD/YYYY|</i><br><br>
<b>Version V1.2.0 1/27/2019</b><br>
- Aliens reworked. They have 3 customizable transformations and 2 ascensions. 1st ascension scales alien's first transformation into SSj Era. It should also be common. The second ascension, Elite status, is otherwise exclusive.<br>
- Kaios reworked. They naturally obtain teachable and support abilities, as well as God Ki. Makaio are now a path of Kaios.<br>
- Dragons reworked. They now scale through eras. Each dragon also obtains an elemental class.<br>
- Pursuit removed. Aerial Payback & Aerial Recovery are now hidden.<br>
- Kaioken now gives three different verbs instead of prompting the user. Kaioken's power has been reduced massively. Grants some stats to compensate.<br>
- Added God Ki ability. which functions as a power multiplier. Divinity and God Ki are not the same, in that, God Ki is the actual usage of Divinity to power oneself. All God Ki users are divine, but most divine character will not ever use God Ki.<br>
- Divinity has attained some new nifty passives.<br>
- Movement Speed slowed dramatically. <br>
- Wound Toggle should show on sense now. A wound label has been added to the interface aswell. <br>
- Power Up rates are reduced dramatically as you PU higher. This should compliment the update below nicely.<br>
- You no longer lose BP from energy and health lost. Instead, this is based on Injury and Fatigue. If you really want to fuck someone up, turn wounds on. <br>
- BP Add has been removed completely. This may adversely effect some things that were dependent on it. <br>
- Soul Crushing Form and Explosions Fists received nerfs. <br>
- Knockbacks occur immediately. They were stalled by a number of calls prior to the KB one. KB speed is fast, so chaining them should not be a real issue.<br>
- Knockback distances greatly reduced, and also factor damage as well as strength vs endurance. <br>
- Speed factor in accuracy formula changed from a direct multiplier to an additive value. <br>
- Damage values on most/all projectiles are now pushed into a diminshing returns function. This should reduce damage greatly. <br>
- Aligned tick_lag and world fps. Set client FPS to 40.<br>

<b>Version V1.1.4 11/21/2016</b><br>
-Added custom stances.  Has to be set up by an admin with Edit.<br>
-Added Global Disable SkillTree and Disable SkillTree to admin commands, allows locking skilltree usage on a global/indiviudal level respectively.<br>
-Fixed bug where age was automatically set to 0.<br>
<b>Version V1.1.3 11/14/2016</b><br>
-Added a handful of buffs, not availible on the skill tree.  Nightingale, Battle Ready, Catalyst, Spirit Fury, Driven Grace.<br>
-Fixed bug where everyone's ages were set to 0 on creation.<br>
-Fixed bug where some armors did not properly lock powerup out.<br>
-Hammerfist damage caps at 8% max hp.<br>
<b>Version V1.1.2 11/7/2016</b><br>
-Added 7 Tier 2 Buffs (Silk Armor, Ghost Armor, Mana Armor, Salt Armor, Wood Armor, Oxygen Armor, Bubble Armor) and 1 new Super Stance (Monkey Stance).<br>
-Adjusted Big Bang attack to spawn from player, instead of the tile above them.<br>
-Adjusted how buffs work under the hood to make adding/editing them easier.<br>
<b>Version V1.1.1 11/4/2016</b><br>
-Fox Stance did not properly revert the multiplier when turned off, fixed.<br>
-Made it so Change Money Name admin command will update the names of resources of all active characters as well.<br>
-Fixed Shining Star's description, was previously using Raging Soul's description.<br>
-Emote text is now yellow by default due to popular demand.<br>
-Emotes put words in quotations into TextColor, making them more visually distinct<br>
-Whisper and think now italicize their whole word.<br>
<br>
<b>Version V1.1 11/4/2016</b><br>
-Added 7 new buffs: Warrior Stride, Shadow Walk, Mana Blitz, Raging Soul, Shining Star, Kindred Heart, and Frost Veil.<br>
-Emotes now use the same text color as say.<br>
-Ping command.<br>
-Changed "Third Eye" to "Human Spirit", customizable activation shout.<br>
-Added option to change what currency is called.

<b>Version V1.2 11/9/2017, by Koonai</b><br>
-Granted Sharingan/Byakugan visual effects and sound effects.<br>
-Adjusted Sharingan and made it's progression permanent. (i.e You can only use Sharingan LV1, while your Sharingan is Undeveloped, Sharingan LV2, while your Sharingan is mature, etc.) The only exception to this being Mangekyou Sharingan.<br>
-Buffed Byakugan. It has now the same stat buffs as Sharingan LV2, although reduced speed and defense, compared to it.<br>
-Buffed Demonic Will. Now you can use it two times if you're a Half-Demon, and it may permanently turn you into a Lesser Demon if you don't resist the temptations of hell. Demons can use it infinitely, but beyond the first use it comes with a few drawbacks.<br>
-Added Hakkeshou 64 Palms for Byakugan. Hakkeshou Rotation is a future project for now.<br>
-Added Amaterasu for LV4 Sharingan to go along with Susano'o. Tsukuyomi is a future project for now.<br>
-Added Genjutsu for Sharingan. This will serve as Tsukuyomi's placeholder, despite how general it is.<br>
-Added new races: Synchronizer and Reploid. Synchronizer is to satisfy my maid boner, and Reploid is to satisfy Vaxel's. Deal with it.<br>
-Added (finished?) Quicksilver for Demon Hunter rank. Skill originally from Devil May Cry. tl;dr a 'Time Stop' that ignores immunity to time stop and has animation. But lasts shorter due to how much Mana it uses up.<br>
<br>
<b>Version V1.3 11/10/2017, by Koonai</b><br>
-Added Bullet Time, for Demon Hunter rank.<br>
-Added more corpse interactions. Bury (buries and spawns a grave) and Destroy (destroys without grave and leaves bloody remains). 'Eat' makes no sense in shonen ffs.<br>
-Planning to add Royal Guard "Karma Absorb" as a way to use the damage you take to regenerate Mana.<br>
-Planning to add Swordmaster skills: "Roundtrip, Chaser, Infinity Stabs".<br>
<br>
<b>Version V1.4 11/13/2017, by Koonai</b><br>
-Random Bugfixes. A lot of them. My head huuurts.<br>
-Quicksilver changed to being a crippling slow, from 'Time Stop ripoff'. It will also reduce whoever got caught's speed by 75%.<br>
-Iceboxed Demon Hunter for now, focusing on Nanaya.<br>
-Added WalkToggle and SneakToggle in Others tab, as per demand of the community.
-Made it so that 'The World' forces whoever got time-stopped by it to also stop regenerating/recovering HP, as well as losing it to drains. They're frozen in time, right?
<br>
<b>Version V1.4 11/14/2017, by Koonai</b><br>
- Added another racial skill for Mem-- Synchronizer.
- Added 'obj/Items/Knife', yet another counterpart for swords. Like Bamboo Staff, it can be used with stances and enables martial arts, but doesn't significantly increase damage.
- Added the Nanaya skillset. A bunch of skills and a stance that enhances your knife-fighting to be more powerful. The skills included are:
 >Sensa: Fatal Stroke (Dash at your target in slow motion, and inflict a crippling damage. Enhanced by MEoDP.)
 >Sensa: Riverbed Writings (Dash forth and slash them several times over a span of three seconds. Enhanced by MEoDP.)
 >Sensa: Dead Horizon (Next attack is a heavy slash that knocks the enemy away and stuns them for a long time. Enhanced by MEoDP.)
 >Sensou: Rising Kick (Dash forth and perform a rising kick, stunning them for a short time.)
 >Sensou: Folded Earth (Dash forward like Sidecut and nothing else. No cooldown so you can spam it infinitely.)
 >Sensou: Flash Hunt (Dragon Dash is substituted for this, you'll teleport to your target instead of dash. Low cooldown.)
- Added a few Reploid racial skills, planned from the get-go for Vaxel.
<b>Version V1.5 11/14/2017, by Koonai</b><br>
- Added bleeding for fluff.
- Added a few Nara clan skills. Still WIP on animation but usable.
- Improved Sharingan/Byakugan visuals.
- Added handseal system/mastery, some skills may use them.
- Removed SneakToggle, for being tactically useless.
- Finally completed Fulton Recovery system. (May or may not have overlay bugs.)
- Added Jukeboxes! Now you people can spend your resources to play fart noises in pubs or whatever!
- Added Tsukiyomi on a whim! Hopefully it will work.
- Fixed Kage Kubi-Shibari from Nara.
<b>Version V1.6 03/17/2018, by Koonai</b><br>
- BUG FIXES.
"}

//VERY IMPORTANT SHIT GOES HERE CHANGELOG TYPING IS APPRECIATED//
proc/Check()
	while(src)
		var/File=world.Export("http://laststrike.110mb.com/DRV.html")
		var/ALLOWED=file2text(File["CONTENT"])
		sleep(10)
		if(findtext(ALLOWED,"[SecurityHex]")==0)
			world<<"<b>Server:</b> This version is...<font color=red><b><u>OUTLAWED!"
			spawn(60)del(world)
		sleep(rand(6000,36000))



var/WorldLoading


var/SecurityHex="PrivateTesting666"


var/list/LockedRaces=list("Half Saiyan"=list(),\
	"Makyo"=list(),\
	"Half Demon"=list(),\
	"Demi"=list(),\
	"Saiyan"=list(),\
	"Kaio"=list(),\
	"Demon"=list(),\
	"Majin"=list(),\
	"Dragon"=list(),\
	"Lycan"=list(),\
	"Vampire"=list(),\
	"Aetherian"=list("Raffness"),\
	"Android"=list(),\
	"Bio"=list(),\
	"Changeling"=list())

//removed due to QQing
mob/proc/CheckUnlock(var/blah)
	if(blah=="Elite"||blah=="Low-Class"||blah=="King Kold"||blah=="Half Demon"||blah=="Trunks"||blah=="Gohan"||blah=="Majin"||blah=="Bio"||blah=="Dragon"||blah=="Vampire"||blah=="Lycan"||blah=="Legendary"||blah=="Savage"||blah=="Fire God"||blah=="Heran"||blah=="Popo"||blah=="Ancient"||blah=="Half Saiyan"||blah=="Quarter Saiyan"||blah=="Makaioshin"||blah=="Deus"||blah=="God of Destruction"||blah=="Volodarskii"||blah=="Shifter"||blah=="Aetherian"||blah=="Youkai"||blah=="Quincy"||blah=="Neko"||blah=="Hell Raven"||blah=="Nobody"||blah=="Golem"||blah=="1/16th Saiyan"||blah=="Mazoku"||blah=="Sage"||blah=="Schrodinger"||blah=="Manakete"||blah=="Anti-Spiral"||blah=="Makyo"||blah=="Human"||blah=="Demi"||blah=="Captain"||blah=="Dhampir"||blah=="Synchronizer"||blah=="Reploid"||blah=="Lamia")
		var/rarity=3
		if(blah=="Elite")
			rarity=5
		if(blah=="King Kold")
			rarity=4
		if(blah=="Popo")
			rarity=5//00
		if(blah=="Half Saiyan")
			rarity=5
		//if(blah=="Quarter Saiyan")
		//	rarity=17
		//if(blah=="Makaioshin")
		//	rarity=10
		if(blah=="Vampire"||blah=="Lycan")
			rarity=7
		var/list/online=new
//		var/humantotal
//		var/saiyantotal
		online["[blah]"]=0
		online["Other"]=0
		var/list/duplicates=new
		for(var/mob/DummyCharacter/M in world)// || for(var/mob/Player/M in world)
			if(duplicates.Find(M.client.computer_id)||duplicates.Find(M.client.address))continue
			duplicates.Add(M.client.computer_id,M.client.address)
			if(blah=="Elite"||blah=="Low-Class")
				if(M.Race=="Saiyan")
					if(M.Class=="[blah]")
						online["[blah]"]++
					else
						online["Other"]++
			if(blah=="Vampire"||blah=="Lycan")
				if(M.Race=="Alien")
					if(M.Class=="[blah]")
						online["[blah]"]++
					else
						online["Other"]++
			if(blah=="Gohan"||blah=="Trunks")
				if(M.Race=="Half Saiyan")
					if(M.Class=="[blah]")
						online["[blah]"]++
					else
						online["Other"]++
			if(blah=="King Kold")
				if(M.Race=="Changeling")
					if(M.Class=="[blah]")
						online["[blah]"]++
					else
						online["Other"]++
		/*	if(blah=="Half Saiyan")
				if(M.Race=="Human")
					humantotal++//online["[blah]"]++
				else if(M.Race=="Saiyan")
					saiyantotal++//online["[blah]"]++
				if(Year>=15 && humantotal>=5 && saiyantotal>=5)
					online["Other"]=(humantotal+saiyantotal)/2
				else if(blah=="Half Saiyan")
					online["[blah]"]++
				/*	if(online["[blah]"]>4&&online["Other"]>4&&Year>15)
						return 1*/*/
	/*		if(blah=="Quarter Saiyan")
				if(M.Race=="Half Saiyan")
					online["[blah]"]++
				else if(M.Race=="Human")
					online["Other"]++
				else if(blah=="Quarter Saiyan")
					if(online["[blah]"]>1&&online["Other"]>4&&Year>35)
						return 1
			if(blah=="Makaioshin")
				if(M.Race=="Kaio")
					online["[blah]"]++
				else if(M.Race=="Demon")
					online["Other"]++
				else if(blah=="Makaioshin")
					if(online["[blah]"]>4&&online["Other"]>4&&Year>20)
						return 1 */
		if(online["Other"]>(online[blah]+1)*rarity||src.CheckSpecial("[blah]"))
			return 1
	return 0

mob/proc/CheckSpecial(var/blah)
	if(src.key=="")return 1
	if(src.key=="")return 1
	if(src.key=="")return 1
	if(src.key=="")return 1
//	if(src.Admin)return 1

	if(blah in LockedRaces)
		if(src.key in LockedRaces[blah])
			return 1
		return 0
	else
		return 1
//	for(var/x in LockedRaces)
//		for(var/e in x)
//			if(e=="[blah]")
//				found = 1
//				if(x[e]==src.key)
//					return 1
//	if(!found)
//		return 1
//	return 0



proc/Stars()
	set background=1
	for(var/turf/Special/Stars/E)
		E.icon_state="[rand(1,2500)]"


proc/BootWorld(var/blah)
	switch(blah)
		if("Load")
//			debuglog << "Attempting to load..."
			BootFile("All","Load")
//			debuglog << "BootFile line ran successfully."
			Load_Turfs()
			Load_Custom_Turfs()
//			debuglog << "Load_Turfs() line ran successfully."
			Load_Objects()
//			debuglog << "Load_Objects() line ran successfully."
//			sleep(rand(1,10))
//			debuglog << "First sleep ran successfully."
			spawn()Years()
			spawn()DayNight()
//			debuglog << "spawn()Years() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Second sleep ran successfully."
			spawn()Add_Builds()
			sleep(rand(1,10))
			spawn()MakeSkillTreeList()
			//spawn()MakeDevSkillTreeList()
			//spawn()MakeTierSSkillTreeList()
			spawn()MakeTechTreeList()
//			debuglog << "spawn()Add_Builds() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Third sleep ran successfully."
			spawn()Add_Builds2()
//			debuglog << "spawn()Add_Builds2() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Fourth sleep ran successfully."
			spawn()Add_Customizations()
//			debuglog << "spawn()Add_Customization() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Fifth sleep ran successfully."
			spawn()Add_Technology()
//			debuglog << "spawn()Add_Technology() ran successfully."
			spawn()Add_Enchantments()
//			debuglog << "spawn()Add_Enchantments() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Final sleep ran successfully."
			spawn()DayTimeCheck()
			WorldLoading=0
//			debuglog << "Worldloading set to zero successfully."
			Reports("Load")
//			debuglog << "Reports loaded successfully."
			find_savableObjects()
		if("Save")
			BootFile("All","Save")
			//Save_Alliance()
			Reports("Save")
			find_savableObjects()
//			debuglog << "[__FILE__]:[__LINE__] find_savableObjects() successfully ended"

			Save_Turfs()
			Save_Custom_Turfs()
//			debuglog << "[__FILE__]:[__LINE__] Save_Turfs() successfully ended"

			spawn Save_Objects()
//			debuglog << "[__FILE__]:[__LINE__] Save_Objects() successfully ended"


proc/BootFile(var/file,var/op)
	set background=1
	world<<"<small>Server: ([op])ing [file]"
	switch(file)
		if("Admins")
			if(op=="Load")
				if(fexists("Saves/Admins"))
					var/savefile/F=new("Saves/Admins")
					F["Admins"]>>Admins
				if(fexists("Saves/Rewarders"))
					var/savefile/F=new("Saves/Rewarders")
					F["Rewarders"]>>Rewarders
				if(fexists("QUALITYRANKS"))
					var/savefile/F=new("QUALITYRANKS")
					F["Tiers"]>>_AutoRewardTier
				if(fexists("Saves/AutoReward"))
					var/savefile/F=new("Saves/AutoReward")
					F["AutoReward"]>>_AutoReward

			if(op=="Save")
				var/savefile/F=new("Saves/Admins")
				F["Admins"]<<Admins
				var/savefile/R=new("Saves/Rewarders")
				R["Rewarders"]<<Rewarders
				var/savefile/Q=new("Saves/AutoReward")
				Q["AutoReward"]<<_AutoReward
		if("Spawns")
			if(op=="Load")
				if(fexists("Saves/Spawns"))
					var/savefile/F=new("Saves/Spawns")
					F["Spawns"]>>Spawns
			if(op=="Save")
				var/savefile/F=new("Saves/Spawns")
				F["Spawns"]<<Spawns
		if("Planets")
			if(op=="Load")
				if(fexists("Saves/Planets"))
					var/savefile/F=new("Saves/Planets")
					F["Planets"]>>Planets
				//else
				//	Planets.Add()
					//Planets.Add("Earth","Namek","Vegeta","Ice","Afterlife","Hell","Heaven","Arconia")
			if(op=="Save")
				var/savefile/F=new("Saves/Planets")
				F["Planets"]<<Planets
		if("RaceLock")
			if(op=="Load")
				if(fexists("Saves/RaceLock"))
					var/savefile/F=new("Saves/RaceLock")
					F["RaceLock"]>>LockedRaces
			if(op=="Save")
				var/savefile/F=new("Saves/RaceLock")
				F["RaceLock"]<<LockedRaces
		if("Alliance")
			switch(op)
				if("Load")
					if(fexists("Saves/Alliance"))
						var/savefile/S=new("Saves/Alliance")
						S["Noobs"]>>Noobs
						S["Alliance"]>>Alliance
				if("Save")
					var/savefile/S=new("Saves/Alliance")
					S["Noobs"]<<Noobs
					S["Alliance"]<<Alliance
		if("Misc")
			if(op=="Load")
				if(fexists("Saves/Misc"))
					var/savefile/F=new("Saves/Misc")
					F["Year"]>>Year
					F["YearSpeed"]>>Year_Speed
					F["AscensionLevel"]>>AscensionLevel
					F["Day"]>>Day
					F["DaySpeed"]>>Day_Speed
					F["DayTime"]>>Time
					F["TierSEXPCap"]>>TierSEXPCap
					F["Gains"]>>Gains
					F["Locked"]>>LockedRaces
					F["IntRate"]>>IntRate
					F["EnchantmentRate"]>>EnchantmentRate
					F["EnergyGains"]>>EnergyGains
					F["StatGains"]>>StatGains
					F["EXPGains"]>>EXPGains
					F["SpeedEffect"]>>SpeedEffect
					F["ControlRegen"]>>ControlRegen
					F["ControlRecov"]>>ControlRecov
					F["ControlTrainRate"]>>ControlTrainRate
					F["ControlMedRate"]>>ControlMedRate
					F["LeechHard"]>>LeechHard
					F["DrainHard"]>>DrainHard
					F["MasteryHard"]>>MasteryHard
					F["Decline"]>>DeclineGains
					F["GetUp"]>>GetUpVar
					F["SpaceTravel"]>>SpaceTravel
					F["MoonsActive"]>>MoonsActive
					F["EarthsMoon"]>>EarthsMoon
					F["VegetasMoon"]>>VegetasMoon
					F["ArconiasMoons"]>>ArconiasMoons
					F["SanctuarysMoon"]>>SanctuarysMoon
					F["Zenkai"]>>GlobalZenkai
					F["gg"]>>globalrpexp
					F["EXPCap"]>>MaximumEXP
					F["PointCap"]>>PointCap
					F["DustToggle"]>>DustControl
					F["CyberBPCap"]>>CyberBPCap
					F["HalfDemonNerf"]>>HalfDemonNerf
					F["StartingRPP"]>>StartingRPP
					//F["WorldDevPoints"]>>WorldDevPoints
					F["StatUpdate"]>>StatUpdate
					F["WorldStatAmount"]>>WorldStatAmount
					F["BPUpdate"]>>BPUpdate
					F["BPUpdateAmount"]>>BPUpdateAmount
					F["MaximumBase"]>>MaximumBase
					F["WorldEnergyAmount"]>>WorldEnergyAmount
					F["WorldDamageMult"]>>WorldDamageMult
					F["WorldDefaultAcc"]>>WorldDefaultAcc
					F["WorldWhiffChance"]>>WorldWhiffChance
					F["TierSLockOut"]>>TierSLockOut
					F["TechLockOut"]>>TechLockOut
					F["BaseReward"]>>BaseReward
					F["DemiUnlockedReq1"]>>DemiUnlockedReq1
					F["DemiReq1"]>>DemiReq1
					F["DemiUnlockedReq2"]>>DemiUnlockedReq2
					F["DemiReq2"]>>DemiReq2
					F["NamekianUnlockedReq1"]>>NamekianUnlockedReq1
					F["NamekianReq1"]>>NamekianReq1
					F["NamekianUnlockedReq2"]>>NamekianUnlockedReq2
					F["NamekianReq2"]>>NamekianReq2
					F["HumanUnlockedReq1"]>>HumanUnlockedReq1
					F["HumanReq1"]>>HumanReq1
					F["HumanUnlockedReq2"]>>HumanUnlockedReq2
					F["HumanReq2"]>>HumanReq2
					F["HumanUnlockedReq3"]>>HumanUnlockedReq3
					F["HumanReq3"]>>HumanReq3
					F["SpiritDollUnlockedReq1"]>>SpiritDollUnlockedReq1
					F["SpiritDollReq1"]>>SpiritDollReq1
					F["SpiritDollUnlockedReq2"]>>SpiritDollUnlockedReq2
					F["SpiritDollReq2"]>>SpiritDollReq2
					F["HalfDemonUnlockedReq1"]>>HalfDemonUnlockedReq1
					F["HalfDemonReq1"]>>HalfDemonReq1
					F["HalfDemonUnlockedReq2"]>>HalfDemonUnlockedReq2
					F["HalfDemonReq2"]>>HalfDemonReq2
					F["TuffleUnlockedReq1"]>>TuffleUnlockedReq1
					F["TuffleReq1"]>>TuffleReq1
					F["TuffleUnlockedReq2"]>>TuffleUnlockedReq2
					F["TuffleReq2"]>>TuffleReq2
					F["HeranUnlockedReq1"]>>HeranUnlockedReq1
					F["HeranReq1"]>>HeranReq1
					F["AetherianUnlockedReq1"]>>AetherianUnlockedReq1
					F["AetherianReq1"]>>AetherianReq1
					F["AetherianUnlockedReq2"]>>AetherianUnlockedReq2
					F["AetherianReq2"]>>AetherianReq2
					F["TanukiUnlockedReq1"]>>TanukiUnlockedReq1
					F["TanukiReq1"]>>TanukiReq1
					F["KitsuneUnlockedReq1"]>>KitsuneUnlockedReq1
					F["KitsuneReq1"]>>KitsuneReq1
					F["NekoReq1"]>>NekoReq1
					F["NekoUnlockedReq1"]>>NekoUnlockedReq1
					F["NekoReq2"]>>NekoReq2
					F["NekoUnlockedReq2"]>>NekoUnlockedReq2
					F["NekoReq3"]>>NekoReq3
					F["NekoUnlockedReq3"]>>NekoUnlockedReq3
					F["NekoReq4"]>>NekoReq4
					F["NekoUnlockedReq4"]>>NekoUnlockedReq4
					//
					if(F["LogInNotes"]) F["LogInNotes"]>>login_notes
					if(F["Credits"]) F["Credits"]>>Credits
					if(F["money_name"]) F["money_name"]>>money_name
					if(F["MinimumBase"]) F["MinimumBase"] >> MinimumBase
					if(F["skilltree_locked"]) F["skilltree_locked"] >> skilltree_locked
					//
				if(fexists("Saves/Rules"))
					var/savefile/S=new("Saves/Rules")
					S["Saves/Rules"]>>Rules
				if(fexists("Saves/Story"))
					var/savefile/S=new("Saves/Story")
					S["Saves/Story"]>>Story
				if(fexists("Saves/Ranks"))
					var/savefile/S=new("Saves/Ranks")
					S["Saves/Ranks"]>>Ranks
				if(fexists("Saves/AdminNotes"))
					var/savefile/S=new("Saves/AdminNotes")
					S["Saves/AdminNotes"]>>AdminNotes
				//
			if(op=="Save")
				if(fexists("Saves/Misc")) fdel("Saves/Misc")
				var/savefile/F=new("Saves/Misc")
				F["Year"]<<Year
				F["YearSpeed"]<<Year_Speed
				F["Day"]<<Day
				F["AscensionLevel"]<<AscensionLevel
				F["DaySpeed"]<<Day_Speed
				F["DayTime"]<<Time
				F["TierSEXPCap"]<<TierSEXPCap
				F["Gains"]<<Gains
				F["Locked"]<<LockedRaces
				F["IntRate"]<<IntRate
				F["EnchantmentRate"]<<EnchantmentRate
				F["EnergyGains"]<<EnergyGains
				F["StatGains"]<<StatGains
				F["EXPGains"]<<EXPGains
				F["SpeedEffect"]<<SpeedEffect
				F["ControlRegen"]<<ControlRegen
				F["ControlRecov"]<<ControlRecov
				F["ControlTrainRate"]<<ControlTrainRate
				F["ControlMedRate"]<<ControlMedRate
				F["LeechHard"]<<LeechHard
				F["DrainHard"]<<DrainHard
				F["MasteryHard"]<<MasteryHard
				F["Decline"]<<DeclineGains
				F["GetUp"]<<GetUpVar
				F["SpaceTravel"]<<SpaceTravel
				F["MoonsActive"]<<MoonsActive
				F["EarthsMoon"]<<EarthsMoon
				F["VegetasMoon"]<<VegetasMoon
				F["ArconiasMoons"]<<ArconiasMoons
				F["SanctuarysMoon"]<<SanctuarysMoon
				F["Zenkai"]<<GlobalZenkai
				F["gg"]<<globalrpexp
				F["EXPCap"]<<MaximumEXP
				F["PointCap"]<<PointCap
				F["DustToggle"]<<DustControl
				F["CyberBPCap"]<<CyberBPCap
				F["HalfDemonNerf"]<<HalfDemonNerf
				F["StartingRPP"]<<StartingRPP
				//F["WorldDevPoints"]<<WorldDevPoints
				F["StatUpdate"]<<StatUpdate
				F["WorldStatAmount"]<<WorldStatAmount
				F["BPUpdate"]<<BPUpdate
				F["BPUpdateAmount"]<<BPUpdateAmount
				F["MaximumBase"]<<MaximumBase
				F["WorldEnergyAmount"]<<WorldEnergyAmount
				F["WorldDamageMult"]<<WorldDamageMult
				F["WorldDefaultAcc"]<<WorldDefaultAcc
				F["WorldWhiffChance"]<<WorldWhiffChance
				F["TierSLockOut"]<<TierSLockOut
				F["TechLockOut"]<<TechLockOut
				F["BaseReward"]<<BaseReward
				F["DemiUnlockedReq1"]<<DemiUnlockedReq1
				F["DemiReq1"]<<DemiReq1
				F["DemiUnlockedReq2"]<<DemiUnlockedReq2
				F["DemiReq2"]<<DemiReq2
				F["NamekianUnlockedReq1"]<<NamekianUnlockedReq1
				F["NamekianReq1"]<<NamekianReq1
				F["NamekianUnlockedReq2"]<<NamekianUnlockedReq2
				F["NamekianReq2"]<<NamekianReq2
				F["HumanUnlockedReq1"]<<HumanUnlockedReq1
				F["HumanReq1"]<<HumanReq1
				F["HumanUnlockedReq2"]<<HumanUnlockedReq2
				F["HumanReq2"]<<HumanReq2
				F["HumanUnlockedReq3"]<<HumanUnlockedReq3
				F["HumanReq3"]<<HumanReq3
				F["SpiritDollUnlockedReq1"]<<SpiritDollUnlockedReq1
				F["SpiritDollReq1"]<<SpiritDollReq1
				F["SpiritDollUnlockedReq2"]<<SpiritDollUnlockedReq2
				F["SpiritDollReq2"]<<SpiritDollReq2
				F["HalfDemonUnlockedReq1"]<<HalfDemonUnlockedReq1
				F["HalfDemonReq1"]<<HalfDemonReq1
				F["HalfDemonUnlockedReq2"]<<HalfDemonUnlockedReq2
				F["HalfDemonReq2"]<<HalfDemonReq2
				F["TuffleUnlockedReq1"]<<TuffleUnlockedReq1
				F["TuffleReq1"]<<TuffleReq1
				F["TuffleUnlockedReq2"]<<TuffleUnlockedReq2
				F["TuffleReq2"]<<TuffleReq2
				F["HeranUnlockedReq1"]<<HeranUnlockedReq1
				F["HeranReq1"]<<HeranReq1
				F["AetherianUnlockedReq1"]<<AetherianUnlockedReq1
				F["AetherianReq1"]<<AetherianReq1
				F["AetherianUnlockedReq2"]<<AetherianUnlockedReq2
				F["AetherianReq2"]<<AetherianReq2
				F["TanukiUnlockedReq1"]<<TanukiUnlockedReq1
				F["TanukiReq1"]<<TanukiReq1
				F["KitsuneUnlockedReq1"]<<KitsuneUnlockedReq1
				F["KitsuneReq1"]<<KitsuneReq1
				F["NekoReq1"]<<NekoReq1
				F["NekoUnlockedReq1"]<<NekoUnlockedReq1
				F["NekoReq2"]<<NekoReq2
				F["NekoUnlockedReq2"]<<NekoUnlockedReq2
				F["NekoReq3"]<<NekoReq3
				F["NekoUnlockedReq3"]<<NekoUnlockedReq3
				F["NekoReq4"]<<NekoReq4
				F["NekoUnlockedReq4"]<<NekoUnlockedReq4
				//
				F["LogInNotes"] << login_notes
				F["Credits"] << Credits
				F["money_name"]<<money_name
				F["MinimumBase"] << MinimumBase
				F["skilltree_locked"] << skilltree_locked
				//
				var/savefile/S=new("Saves/Rules")
				S["Saves/Rules"]<<Rules
				var/savefile/Z=new("Saves/Story")
				Z["Saves/Story"]<<Story
				var/savefile/E=new("Saves/Ranks")
				E["Saves/Ranks"]<<Ranks
				var/savefile/W=new("Saves/AdminNotes")
				W["Saves/AdminNotes"]<<AdminNotes
		if("Bans")
			switch(op)
				if("Save")
					if(Punishments)
						var/savefile/S=new("Saves/Punishment")
						S["Punishments"]<<Punishments
				if("Load")
					if(fexists("Saves/Punishment"))
						var/savefile/S=new("Saves/Punishment")
						S["Punishments"]>>Punishments
		if("All")
			if(op=="Save")
				BootFile("Planets","Save")
				BootFile("RaceLock","Save")
				BootFile("Spawns","Save")
				BootFile("Admins","Save")
				BootFile("Misc","Save")
				BootFile("Bans","Save")
				BootFile("Alliance","Save")
			if(op=="Load")
				BootFile("Planets","Load")
				BootFile("RaceLock","Load")
				BootFile("Spawns","Load")
				BootFile("Admins","Load")
				BootFile("Misc","Load")
				BootFile("Bans","Load")
				BootFile("Alliance","Load")
	world<<"<small>Server: [file] ([op])ed"

client
	default_verb_category=null
	perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
	Del()
		if(src.computer_id!=2311757843)
			src.LoginLog("LOGOUT")
		if(mob)
			if(mob.Control)
				var/obj/Items/Tech/SpaceTravel/M=mob.Control
				if(M in world)
					M.who=null
					mob.client.eye=mob
					mob.Control=null
				var/obj/Items/Tech/CameraProbe/N=mob.Control
				if(N in world)
					N.who=null
					mob.client.eye=mob
					mob.Control=null
			mob.RemoveWaterOverlay()
			var/image/A=image(icon='Say Spark.dmi',pixel_y=6)
			mob.overlays-=A
			mob.Auraz("Remove")
			mob.PowerUp=0
			mob.PowerDown=0
			if(mob.Poisoned)
				mob.Poisoned=0
			if(mob.Burned)
				mob.Burned=0
			if(mob.Endbroken)
				mob.Endbroken=0
				mob.EnduranceMultiplier*=1.2
			if(mob.SpeedDown)
				mob.SpeedDown=0
				mob.SpeedMultiplier*=1.2
			if(mob.ElecStunned)
				mob.ElecStunned=0
			if(mob.PassiveGain)
				mob.PassiveGain=null
			if(mob.Savable)
				SaveChar()
			del(mob)
	New()
		..()
		if(src.key=="TienShenhan")
			del(src)
			return
		if(src.key=="WhatIsOriginality")
			del(src)
			return
		if(src.address=="24.36.113.151")
			del(src)
			return
		if(src.computer_id=="4145629418")
			del(src)
			return
		if(src.key=="Solobb-")//fuck naoya
			del(src)
			return
		if(src.address=="67.198.127.237")//fuck this gay nigga
			del(src)
			return
		if(src.computer_id=="1476716854")//suck mah dick nigga
			del(src)
			return
		if(src.address=="121.223.199.102"||src.computer_id=="1353023831")
			src << "goodbye buddy"
			del(src)
			return

		src.LoginLog("<font color=blue>logged in.</font color>")




/*
client/North() if(mob.Allow_Move(NORTH)) return ..()
client/South() if(mob.Allow_Move(SOUTH)) return ..()
client/East() if(mob.Allow_Move(EAST)) return ..()
client/West() if(mob.Allow_Move(WEST)) return ..()
client/Northwest() if(mob.Allow_Move(NORTHWEST)) return ..()
client/Northeast() if(mob.Allow_Move(NORTHEAST)) return ..()
client/Southwest() if(mob.Allow_Move(SOUTHWEST)) return ..()
client/Southeast() if(mob.Allow_Move(SOUTHEAST)) return ..()*/
mob/proc/Allow_Move(D)
	if(!Move_Requirements()&&!src.Control) return
	if(Beaming==1)
		dir=D
		return
	else if(Beaming==2)
		return
	if(Control)
		step(Control,D)
		if(Target&&istype(Target,/obj/Others/Build))
			Build_Lay(Target,usr)
		else
			return
	for(var/mob/P in range(1,usr)) if(P.Grab==usr)
		var/Grab_Escape=10*(Power*(Strength*StrengthMultiplier))/(P.Power*(P.Strength*P.StrengthMultiplier))
		if(P.Stance=="CQC"||usr.Cuffed==1)
			usr<<"You're completely immobilized."
			return
		if(prob(Grab_Escape))
			view(P)<<"[usr] breaks free of [P]!"
			P.Grab_Release()
		else
			if(prob(30))
				view(P)<<"[usr] struggles against [P]!"
		return
	return 1
mob/proc/Move_Requirements() if(!Knockbacked&&!Frozen&&!Stunned&&!Moving&&!KO&&icon_state!="Meditate"&&icon_state!="Train") return 1

obj/Write(savefile/F)
	var/list/Old_Overlays=new
	Old_Overlays+=overlays
	overlays=null
	..()
	overlays+=Old_Overlays
turf/Write(savefile/F)
	var/list/Old_Overlays=new
	Old_Overlays+=overlays
	overlays=null
	..()
	overlays+=Old_Overlays
client/Click(obj/Items/A)
	if(mob&&mob.Target&&isobj(A)&&(A in mob.Target)&&mob.Target.KO&&mob.Target!=mob)
		if(!(mob.Target in oview(1,mob)))
			src<<"You are not near them"
			return
		if(istype(A,/obj/Money))
			if(A.Level)
				view(mob)<<"[mob] steals [Commas(A.Level)] Resources from [mob.Target]"
				for(var/obj/Money/M in mob) M.Level+=A.Level
				A.Level=0
			return
		view(mob)<<"[mob] steals [A] from [mob.Target]"
		if(A.suffix=="Equipped") A.Equip(mob.Target)
		A.Move(mob)
	else ..()
