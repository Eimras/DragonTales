mob/var/tmp/Swim=0
//mob/var/tmp/Diving=0


mob/var/list
	Skillz=list(\
	"Unarmed"=list("Level"=1,"Next"=10,"Current"=0),
	"Sword"=list("Level"=1,"Next"=10,"Current"=0),
	"Swim"=list("Level"=1,"Next"=10,"Current"=0),
	"Warp"=list("Level"=1,"Next"=10,"Current"=0),
	"Dig"=list("Level"=1,"Next"=10,"Current"=0),
	"Smashing"=list("Level"=1,"Next"=10,"Current"=0),
	"Oxygen"=list("Level"=1,"Next"=10,"Current"=0)
	)

mob/proc/SkillUP(var/param,var/amount)
//	debuglog << "[__FILE__]:[__LINE__] SkillUp() was called by src: [src ? src : "null"] Usr: [usr ? usr : "null"]"
//	debuglog << "[__FILE__]:[__LINE__] SkillUp() Params were [list2params(args)]"
	if(!src) return
	if(!client)return
	if(isnum(src.Skillz["[param]"]["Current"]))
		src.Skillz[param]["Current"]+=amount
		if(src.Skillz[param]["Current"]>=src.Skillz[param]["Next"])
			src.Skillz[param]["Level"]++
			src.Skillz[param]["Current"]=0
			src.Skillz[param]["Next"]=src.Skillz[param]["Level"]*10

// Tempnote: 11 instances of this thing being called (Gainloop ftl)
obj
	Dive
		var/tmp/delay
		verb/Dive()
			set category="Skills"
			set src in usr
			if(src.delay)
				usr<<"Cooldown!"
				return
			else
				var/turf/W1=locate(usr.x,usr.y,usr.z)
				var/turf/W2
				var/targetloc
				if(usr.z==2)
					targetloc=4
					W2=locate(usr.x,usr.y,4)
				else if(usr.z==4)
					targetloc=2
					W2=locate(usr.x,usr.y,2)
				else if(usr.z==3)
					targetloc=5
					W2=locate(usr.x,usr.y,5)
				else if(usr.z==5)
					targetloc=3
					W2=locate(usr.x,usr.y,3)
				else if(usr.z==3)
					targetloc=22
					W2=locate(usr.x,usr.y,22)
				else if(usr.z==22)
					targetloc=3
					W2=locate(usr.x,usr.y,3)
				else if(usr.z==2)
					targetloc=23
					W2=locate(usr.x,usr.y,23)
				else if(usr.z==23)
					targetloc=2
					W2=locate(usr.x,usr.y,2)
				else if(usr.z==4)
					targetloc=24
					W2=locate(usr.x,usr.y,24)
				else if(usr.z==24)
					targetloc=4
					W2=locate(usr.x,usr.y,4)
				else if(usr.z==5)
					targetloc=25
					W2=locate(usr.x,usr.y,25)
				else if(usr.z==25)
					targetloc=5
					W2=locate(usr.x,usr.y,5)
				else
					usr<<"The map you are on is incompatible with this skill."
					return
				if(usr.Swim==0&&usr.Diving==0)
					usr<<"You have to be swimming or already underwater to use this!"
					return
				if(!W1.density&&!W2.density&&!W2.Builder)
					usr.z=targetloc
					if(usr.Diving==0)
						usr.Diving=1
					else if(usr.Diving==1)
						usr.Diving=0
				else if(W1.density==1||W2.density==1||W2.Builder)
					usr<<"You can't dive into or out of solid objects! That wouldn't end well."
					return
				src.delay=1
				spawn(15)src.delay=null
	DigDeeper
		var/tmp/delay
		verb/DigDeeper()
			set name="Dig Deeper"
			set category="Skills"
			set src in usr
			if(src.delay)
				usr<<"Cooldown!"
				return
			else
//				var/turf/W1=locate(usr.x,usr.y,usr.z)
				var/turf/W2
				var/targetloc
				if(usr.z==1)
					targetloc=15
					W2=locate(usr.x,usr.y,15)
				else if(usr.z==15)
					targetloc=1
					W2=locate(usr.x,usr.y,1)
				else if(usr.z==18)
					targetloc=20
					W2=locate(usr.x,usr.y,20)
				else if(usr.z==20)
					targetloc=18
					W2=locate(usr.x,usr.y,18)
				else if(usr.z==3)
					targetloc=22
					W2=locate(usr.x,usr.y,22)
				else if(usr.z==22)
					targetloc=3
					W2=locate(usr.x,usr.y,3)
				else if(usr.z==2)
					targetloc=23
					W2=locate(usr.x,usr.y,23)
				else if(usr.z==23)
					targetloc=2
					W2=locate(usr.x,usr.y,2)
				else if(usr.z==4)
					targetloc=24
					W2=locate(usr.x,usr.y,24)
				else if(usr.z==24)
					targetloc=4
					W2=locate(usr.x,usr.y,4)
				else if(usr.z==5)
					targetloc=25
					W2=locate(usr.x,usr.y,25)
				else if(usr.z==25)
					targetloc=5
					W2=locate(usr.x,usr.y,5)
				else
					usr<<"The map you are on is incompatible with this skill."
					return
				if(usr.Oxygen<100)
					usr<<"You're either underwater, or was just underwater. Catch your breath first."
					return
				if(usr.Flying==1)
					usr<<"You cannot be flying to use this ability."
					return
				if(usr.Swim==1)
					usr<<"You have to be on stable ground or already underground to use this!"
					return
				if(!W2.Builder)
					usr.z=targetloc
					if(usr.Diving==0)
						usr.Diving=1
					else if(usr.Diving==1)
						usr.Diving=0
				else if(W2.Builder)
					usr<<"You can't dig into or out of solid objects! That wouldn't end well."
					return
				src.delay=1
				spawn(15)src.delay=null

/*obj
	Dive
		var/tmp/delay
		verb/Dive()
			set category="Skills"
			set src in usr
			if(src.delay)
				usr<<"Cooldown!"
				return
			else
				var/turf/W1=locate(usr.x,usr.y,usr.z)
				var/turf/W2=locate(usr.x,(usr.y+100),usr.z)
				var/area/currentloc = W1.loc
//				var/area/targetloc = W2.loc
				if(usr.Swim==0&&usr.Diving==0&&usr.z!=14)
					usr<<"You have to be swimming and on the correct map to use this!"
					return
				if(istype(currentloc,/area/Outside/Planet/AlienOcean/AOUnderwater))
					usr.y-=100
					usr.Diving=0
				else if(istype(currentloc,/area/Outside/Planet/AlienOcean)&&!W1.density&&!W2.density)
					usr.y+=100
					usr.Diving=1
				src.delay=1
				spawn(15)src.delay=null
	DigDeeper
		var/tmp/delay
		verb/DigDeeper()
			set name="Dig Deeper"
			set category="Skills"
			set src in usr
			if(src.delay)
				usr<<"Cooldown!"
				return
			else
				var/turf/W1=locate(usr.x,usr.y,usr.z)
//				var/turf/W2=locate(usr.x,(usr.y+100),14)
//				var/turf/W3=locate(usr.x,(usr.y-100),14)
				var/area/currentloc = W1.loc
//				var/area/targetloc = W2.loc
				if(usr.Swim==1&&usr.z!=14)
					usr<<"You must be on stable ground and the correct map to use this."
					return
				if(istype(currentloc,/area/Outside/Planet/AlienOcean/AOUnderground)||istype(currentloc,/area/Outside/Planet/AlienArctic/AAUnderground)||istype(currentloc,/area/Outside/Planet/AlienDesolate/ADUnderground)||istype(currentloc,/area/Outside/Planet/AlienGrassland/AGUnderground)||istype(currentloc,/area/Outside/Planet/AlienRuin/ARUnderground))
					usr.y-=100
					usr.Diving=0
				else if(istype(currentloc,/area/Outside/Planet/AlienOcean)||istype(currentloc,/area/Outside/Planet/AlienArctic)||istype(currentloc,/area/Outside/Planet/AlienDesolate)||istype(currentloc,/area/Outside/Planet/AlienGrassland)||istype(currentloc,/area/Outside/Planet/AlienRuin))
					usr.y+=100
					usr.Diving=1
				src.delay=1
				spawn(15)src.delay=null*/

/*	Dive
		var/tmp/delay
		verb/Dive()
			set category="Skills"
			set src in usr
			if(src.delay)
				usr<<"Cooldown!"
				return
			else
				var/turf/W1=locate(usr.x,usr.y,15)
				var/turf/W2=locate(usr.x,usr.y,1)
				var/area/blah = W1.loc
				var/area/blahz = W2.loc
				if(!istype(blahz,/area/Outside/Planet/Earth)||!istype(blah,/area/Outside/Planet/Earth)||W1.density||W2.density)
					usr<<"You cannot dive here!"
					return
				src.delay=1
				spawn(15)src.delay=null
				if(usr.z==15)
					usr.loc=W2
				else
					usr.loc=W1*/

