var/list/CachedIcons=list() //semi credit given to falacy


obj
	var/list/temp
	Supplemental
		Health=1.#INF
		DamageNum
			icon='EnvyNums.dmi'
			density=0
			name=""
			layer=99999
			New(var/r,var/g,var/b)
				spawn(10) del src
				for(var/v in CachedIcons)	if(v=="Damage[r][g][b]")
					src.icon=CachedIcons[v];return
				src.icon+=rgb(r,g,b)
				CachedIcons+="Damage[r][g][b]"
				CachedIcons["Damage[r][g][b]"]=src.icon


mob/proc/NumShow(var/damage,var/type)
	var/randx=rand(1,10)
	var/randy=rand(1,10)
	if(istext(damage))
		var/obj/O=new/obj/Supplemental/DamageNum
		O.loc=locate(src:x,src:y,src:z)
		O.icon_state=damage
		return
	damage=num2text(min(999,round(damage)))
	var/spot=0
	if(type=="Charge")
		var/obj/Supplemental/DamageNum/Q=new(250,250,10)
		Q.pixel_x=0
		Q.pixel_y=-6
		Q.loc=locate(src:x,src:y,src:z)
		Q.icon_state="x"
		Q.alpha=150
		//animate(Q,pixel_z=20,time=5)
	for(var/i=0, i<length(damage), i++)
		spot+=1
		var/obj/Supplemental/DamageNum/O
		if(type=="Charge")
			O=new(250,250,0)
			O.pixel_y=-6
			O.pixel_x=9*i+9
		else
			O=new(150,0,0)
			O.pixel_x=9*i
			O.pixel_x+=randx
			O.pixel_y+=randy
		O.loc=locate(src:x,src:y,src:z)
		O.icon_state=copytext(damage,spot,spot+1)
		O.alpha=150
		//animate(O,pixel_z=-8,pixel_x=-4,time=5)




mob/Click()
	if(usr.Conjure && usr!=src)
		if(src.Race=="Demon"||src.Race=="Half Demon"||src.Race=="Makaioshin")
			if(usr!=src)
				var/Choice=input("What action would you like to do?") in list ("Negotiate Contract","Conjure","Break Contract","Cancel")
				switch(Choice)
					if("Cancel")
						return
					if("Negotiate Contract")
						usr.TwoWayTelepath(src)
						return
					if("Conjure")
						if(src.Conjured) return
						var/Choice2=input(src,"Do you wish to allow [usr] to summon you to the living realm?") in list("Yes","No")
						if(Choice2=="Yes")
							src.Conjured=1
							src.loc=usr.loc
						if(Choice2=="No")
							usr<<"Your contract has been denied."
							return
					if("Break Contract")
						if(!src.Conjured)
							usr<<"You don't have [src] under a conjuration contract."
							return
						else if(src.Conjured)
							if(usr.Alert("You sure you want to break [src]'s conjuration contract?"))
								src<<"You have been banished back to Hell."
								src.Conjured=0
								src.loc=locate(100,100,7)
	else if(usr.Necromancy && src.Dead)

		var/Choice=input("What action would you like to do?") in list ("Negotiate Contract","Revive","Break Contract","Cancel")
		switch(Choice)
			if("Cancel")
				return
			if("Negotiate Contract")
				usr.TwoWayTelepath(src)
				return
			if("Revive")
				if(src.NecroRisen) return
				var/blah=input(src,"[usr] wants to summon you to the Living Realm!","Do you accept their terms?") in list("Yes","No")
				if(blah=="Yes")
					src.NecroRisen=1
					src.overlays-='Halo.dmi'
					src.loc=usr.loc
					if(!src.KeepBody)
						src.KeepBody=1
				if(blah=="No")
					usr<<"Your contract has been denied."
					return
			if("Break Contract")
				if(!src.NecroRisen)
					usr<<"You don't have [src] under a conjuration contract."
					return
				else if(src.NecroRisen)
					if(usr.Alert("You sure you want to break [src]'s conjuration contract?"))
						src<<"You have been banished back to Hell."
						src.NecroRisen=0
						if(src.NecroLevel>=3)
							src.Recovery/=2
						src.NecroLevel=0
	else//if(!usr.Conjure || !usr.Necromancy)// || usr.Conjure&&src.Race!="Demon"||usr.Necromancy&&!src.Dead)
		if(usr.Target!=src)
			usr.Target=src
			usr<<"<font color=green>Now targeting [src]!"
		else
			usr.Target=null
			usr<<"<font color=red>Targeting disabled."

	..()


mob/proc/TwoWayTelepath(var/mob/who)
	var/blah=input("What do you want to say to [who]?") as text|null
	if(blah)
		/*for(var/mob/Players/Q in world)
			if(Q.Admin)
				if(Q!=src&&Q!=who)
					Q<<"<font color=#00FF99><b>(Admin PM)</b></font> <a href=?src=\ref[src];action=MasterControl;do=PM>[src]</a href> to <a href=?src=\ref[who];action=MasterControl;do=PM>[who.key]</a href> :[blah]"
		*/
		Log(who.ChatLog(),"(Telepath from [src] to [who]): [blah]")
		Log(src.ChatLog(),"(Telepath from [src] to [who]): [blah]")
//		Log("Telepath","(Telepath from [src] to [who]): [blah]")
		src<< output("<font color=#99FF99><b>(Telepath)</b></font>- To  <a href=?src=\ref[who];action=MasterControl;do=TPM>[who]</a href> :[blah]", "output")
		src<< output("<font color=#99FF99><b>(Telepath)</b></font>- To  <a href=?src=\ref[who];action=MasterControl;do=TPM>[who]</a href> :[blah]", "icchat")

//		src<<"<font color=#99FF99><b>(Telepath)</b></font>- To  <a href=?src=\ref[who];action=MasterControl;do=TPM>[who]</a href> :[blah]"
		who<< output("<font color=#99FF99><b>(Telepath)</b></font>- From  <a href=?src=\ref[src];action=MasterControl;do=TPM>[src]</a href> :[blah]", "output")
		who<< output("<font color=#99FF99><b>(Telepath)</b></font>- From  <a href=?src=\ref[src];action=MasterControl;do=TPM>[src]</a href> :[blah]", "icchat")

//		who<<"<font color=#99FF99><b>(Telepath)</b></font>- From  <a href=?src=\ref[src];action=MasterControl;do=TPM>[src]</a href> :[blah]"

mob/proc/CHAOSTwoWayTelepath(var/mob/who)
	var/blah=input("What do you want to say to...someone?") as text|null
	if(blah)
		/*for(var/mob/Players/Q in world)
			if(Q.Admin)
				if(Q!=src&&Q!=who)
					Q<<"<font color=#00FF99><b>(Admin PM)</b></font> <a href=?src=\ref[src];action=MasterControl;do=PM>[src]</a href> to <a href=?src=\ref[who];action=MasterControl;do=PM>[who.key]</a href> :[blah]"
		*/
		Log("Telepath","(CHAOS Telepath from [src] to [who]): [blah]")
		src<<"<font color=#00FF99><b>(Telepath)</b></font>- To  <a href=?src=\ref[who];action=MasterControl;do=CTPM>A stranger</a href> :[blah]"
		who<<"<font color=#00FF99><b>(Telepath)</b></font>- From  <a href=?src=\ref[src];action=MasterControl;do=CTPM>A stranger</a href> :[blah]"


proc/Observify(mob/P,atom/A) if(A) P.client.eye=A
mob/proc/Percent(A)
	//return "[round(100*(A/(Strength+Endurance+Force+Resistance+Speed+Offense+Defense+Regeneration+Recovery)),0.1)]%"
	return "[round(100*(A/(Strength+Endurance+Force+Resistance+Offense+Defense+Speed)),0.1)]%"
proc/Crater(atom/A)
	for(var/obj/Effects/Crater/C in view(0))
		C.scale+=0.5
		var/matrix/m = matrix()
		m.Scale(C.scale,C.scale)
		C.appearance_flags = KEEP_TOGETHER
		animate(C, transform=m,time=2)
		return
	var/obj/Effects/Crater/C=new
	C.loc=A.loc


proc/Purge_Old_Saves() for(var/File in flist("Saves/"))
	var/savefile/F=new("Saves/Players/[File]")
	if(F["Last_Used"]<=world.realtime-864000*7) fdel("Saves/Players/[File]")
proc/Players_In_Range(atom/A,Range)
	var/Start_X=A.x-Range
	var/Start_Y=A.y-Range
	var/End_X=A.x+Range
	var/End_Y=A.y+Range
	if(Start_X<1) Start_X=1
	if(Start_Y<1) Start_Y=1
	if(End_X>world.maxx) Start_X=world.maxx
	if(End_Y>world.maxy) Start_Y=world.maxy
	var/list/Mobs=new
	for(var/mob/Players/P) if(P.z==A.z&&P.x>=Start_X&&P.x<=End_X&&P.y>=Start_Y&&P.y<=End_Y) Mobs+=P
	return Mobs
proc/Turf_Range(atom/A,Distance)
	var/list/Turfs=new
	var/Start=locate(A.x-Distance,A.y-Distance,A.z)
	var/End=locate(A.x+Distance,A.y+Distance,A.z)
	for(var/turf/Turf in block(Start,End)) Turfs+=Turf
	return Turfs
proc/Turf_Circle(turf/center,radius)
	. = list()
	while(center&&!isturf(center)) center=center.loc
	if(!center) return list()
	var/x=center.x,y=center.y,z=center.z
	var/dx,dy,rsq
	var/x1,x2,y1,y2
	rsq=radius*(radius+1)
	for(dy=0,dy<=radius,++dy)
		dx=round(sqrt(rsq-dy*dy))
		y1=y-dy
		y2=y+dy
		x1=max(x-dx,1)
		x2=min(x+dx,world.maxx)
		if(x1>x2) continue  // this should never happen, but just in case...
		if(y1>0)
			. +=block(locate(x1,y1,z),locate(x2,y1,z))
		if(y2 <= world.maxy)
			. +=block(locate(x1,y2,z),locate(x2,y2,z))
mob/proc/File_Size(file)
	var/size=length(file)
	if(!size||!isnum(size)) return
	var/ending="Byte"
	if(size>=1024)
		size/=1024
		ending="KB"
		if(size>=1024)
			size/=1024
			ending="MB"
			if(size>=1024)
				size/=1024
				ending="GB"
	var/end=round(size)
	return "[Commas(end)] [ending]\s"
proc/Commas(A)
	var/Number=num2text(round(A,1),20)
	for(var/i=lentext(Number)-2,i>1,i-=3) Number="[copytext(Number,1,i)]'[copytext(Number,i)]"
	return Number
proc/Direction(A)
	switch(A)
		if(1) return "North"
		if(2) return "South"
		if(4) return "East"
		if(5) return "Northeast"
		if(6) return "Southeast"
		if(8) return "West"
		if(9) return "Northwest"
		if(10) return "Southwest"
		if("North") return 1
		if("South") return 2
		if("East") return 4
		if("Northeast") return 5
		if("Southeast") return 6
		if("West") return 8
		if("Northwest") return 9
		if("Southwest") return 10