
obj/Child
	Click()
		if(istype(usr,/mob/Creation))
			winshow(usr,"Baby",0)
			usr.Race=src.Race
			usr.EnergyMax=src.EnergyMax
			usr.Base=src.Base
			usr.icon=src.icon
			usr.Parents=src.Parents
			usr.GenRaces=src.GenRaces
			usr.Baby=src.Baby
			if(usr.Race=="Saiyan")
				usr.Class="Normal"
			if(usr.Race=="Half Saiyan")
				usr.Class="Gohan"
			if(usr.Race=="Makaioshin")
				usr.Class="Courage"
			if(usr.Race=="Changeling")
				usr.Class="Frieza"
			if(usr.Race=="Android")
				usr.Class="Juggernaut"
			usr:NextStep()
			usr.loc=src.loc
			if(usr.asexual==1)
				for(var/mob/E in hearers(12,src))
					E<<"[src.name]'s egg is hatching! (Key: [usr.ckey])"
				Log("Admin","[usr.ckey] is hatching from the [src.name] egg at [src.x],[src.y],[src.z].")
			else
				for(var/mob/E in hearers(12,usr))
					E<<"[src.name] is being born! (Key: [usr.ckey])"
				Log("Admin","[src.name] is being born. (Key: [usr.ckey])")
			spawn del(src)
	icon='Baby.dmi'
	var
		Race
		Baby=1
		list/Parents=new
		EnergyMax
		Base
		list/GenRaces=new

	Mate
		var/Last
		verb/Mate(mob/M)
			set category="Other"
			for(var/obj/Child/Mate/Q in M)
				if(usr.asexual)
					if(src.Last)
						if(usr.Race=="Namekian"&&usr.Age>50)
							if(abs(Year-src.Last)<0.2)return
						else
							if(abs(Year-src.Last)<1)return
					src.Last=Year
					var/obj/Child/E=new /obj/Child(usr.loc)
					E.Race=usr.Race
					E.EnergyMax=usr.EnergyMax/usr.EnergyMod
					E.Base=usr.Base/usr.BaseMod
					E.Parents.Add(usr.key)
					E.name="Egg([usr]|[usr.Race])"
//					usr.contents+=E
					E.icon='Egg.dmi'
					E.Savable=1
					Q.Last=Year
					src.Last=Year
					Log("Admin","[ExtractInfo(usr)] has laid a egg at [usr.x],[usr.y],[usr.z].")
				else
					if(!M in oview(1)) return
					if(M.Gender=="Jinx" && usr.Gender=="Male"||usr.Gender=="Jinx"&&M.Gender=="Female"||usr.Gender=="Female"&&M.Gender=="Jinx"||usr.Gender=="Male"&&M.Gender=="Jinx"||usr.Gender=="All"&&M.Gender=="Jinx"||usr.Gender=="Jinx"&&M.Gender=="All")
						if(src.Last)
							if(abs(Year-src.Last)<1)return
						if(Q.Last)
							if(abs(Year-Q.Last)<1)return
						var/blah=input(M,"[usr] wants to mate with you!","Sex?") in list("CQC the Goon/Thot","Deny","Consent")
						if(blah=="CQC the Goon/Thot")
							M.Frozen=1
							usr.Frozen=1
							M.ComboX(usr)
							for(var/mob/E in hearers(12,src))
								E<<sound('KunaiMod/Sounds/cqc2slap.ogg')
							usr.Knockback(1,M)
							for(var/mob/Players/T in view(12))
								spawn()T.Quake(20)
							usr.Frozen=0
							Stun(usr,amount=60)
							sleep(10)
							if(usr.Gender=="Male")
								view(M)<<"<b>[M] kicks [usr] in the groin and fucking dunks them on the ground, head first?!</b>"
							else if(usr.Gender=="Female")
								view(M)<<"<b>[M] kicks [usr] in the tits and fucking dunks them on the ground, head first?!</b>"
							else
								view(M)<<"<b>[M] kicks [usr] in the shin and fucking dunks them on the ground, head first?!</b>"
							usr.Using=0
							for(var/mob/E in hearers(12,src))
								E<<sound('KunaiMod/Sounds/cqcslam.ogg', volume=50)
							M.Frozen=0
							usr.icon_state="KO"
							spawn(600)
							usr.icon_state=""
						if(blah=="Consent"||usr.GoddamnitJumpy)
							if(M&&Q)
								if(src.Last)
									if(abs(Year-src.Last)<1)return
								if(Q.Last)
									if(abs(Year-Q.Last)<1)return
								var/obj/Child/E=new /obj/Child
								var/Racee=pick(M.Race,usr.Race)

								var/list/heh=new
								heh.Add(usr.Race,M.Race)
								for(var/x in usr.GenRaces)
									heh.Add(x)
								for(var/w in Q.GenRaces)
									heh.Add(w)
								for(var/m in heh)
									E.GenRaces.Add(m)

								Racee=pick("Human","Saiyan","Namekian", "Changeling", "Spirit Doll", "Makyojin", "Demon", "Kaio", "Demigod", "Tsufurujin", "Alien")

								E.Race=Racee
								E.EnergyMax=((M.EnergyMax/M.EnergyMod)+(usr.EnergyMax/usr.EnergyMod))/2
								E.Base=((M.Base/M.BaseMod)+(usr.Base/usr.BaseMod))/2
								E.Parents.Add(M.key,usr.key)
								E.name="Baby([usr]&[M]|[E.Race])"
								if(usr.GoddamnitJumpy&&usr.Gender=="Male")
									usr<<"Your dick is the one that pierces the heavens!"
									M<<"You've been romantically raped!"
									M.contents+=E
								else if(usr.Gender=="Female")
									M<<"Mission success!"
									usr<<"You're pregnant!"
									usr.contents+=E
								else if(usr.Gender=="Male")
									usr<<"Misson success!"
									M<<"You're pregnant!"
									M.contents+=E
								else if(usr.Gender=="All"||usr.Gender=="Jinx")
									if(M.Gender=="Female")
										usr<<"Misson success!"
										M<<"You're pregnant!"
										M.contents+=E
									else if(M.Gender=="Male")
										M<<"Mission success!"
										usr<<"You're pregnant!"
										usr.contents+=E
									else if(M.Gender=="All"||M.Gender=="Jinx")
										M<<"And this is how babies are born!"
										usr<<"And this is how babies are born!"
										usr.contents+=E
										M.contents+=E

								Log("Admin","[ExtractInfo(usr)] has mated [ExtractInfo(M)]. (User Race/Gender: [usr.Race]/[usr.Gender] Partner Race/Gender: [M.Race]/[M.Gender].")
								Q.Last=Year
								src.Last=Year
						break
					else if(M.Gender=="Female"&&usr.Gender=="Male"||M.Gender=="Male"&&usr.Gender=="Female"||M.Gender=="All"&&usr.Gender=="Male"||M.Gender=="All"&&usr.Gender=="Female"||M.Gender=="Male"&&usr.Gender=="All"||M.Gender=="Female"&&usr.Gender=="All"||usr.Gender=="All"&&M.Gender=="All")
						if(src.Last)
							if(abs(Year-src.Last)<1)return
						if(Q.Last)
							if(abs(Year-Q.Last)<1)return
						var/blah=input(M,"[usr] wants to mate with you!","Sex?") in list("Deny","Consent")
						if(blah=="Consent")
							if(M&&Q)
								if(src.Last)
									if(abs(Year-src.Last)<1)return
								if(Q.Last)
									if(abs(Year-Q.Last)<1)return
								var/obj/Child/E=new /obj/Child
								var/Racee=pick(M.Race,usr.Race)

								var/list/heh=new
								heh.Add(usr.Race,M.Race)
								for(var/x in usr.GenRaces)
									heh.Add(x)
								for(var/w in Q.GenRaces)
									heh.Add(w)
								for(var/m in heh)
									E.GenRaces.Add(m)
							/*	if(usr.Race=="Saiyan"&&M.Race=="Human"||Q.Race=="Human"&&usr.Race=="Saiyan")
									Racee="Half Saiyan"
								if(usr.Race=="Half Saiyan"&&M.Race=="Human"||Q.Race=="Human"&&usr.Race=="Half Saiyan")
									Racee="Quarter Saiyan"
								if(usr.Race=="Kaio"&&M.Race=="Demon"||Q.Race=="Demon"&&usr.Race=="Kaio")
									Racee="Makaioshin"
								if(usr.Race=="Human"&&M.Race=="Demon"||Q.Race=="Demon"&&usr.Race=="Human")
									Racee="Half Demon"  */

								if(usr.Race=="Saiyan")
									if(M.Race=="Saiyan")
										Racee="Saiyan"
									else if(M.Race=="Demon")
										Racee="Half Demon"
									else
										Racee="Half Saiyan"
								if(M.Race=="Saiyan")
									if(usr.Race=="Saiyan")
										Racee="Saiyan"
									else if(usr.Race=="Demon")
										Racee="Half Demon"
									else
										Racee="Half Saiyan"
								if(usr.Race=="Demon")
									if(M.Race=="Demon")
										Racee="Demon"
									else if(M.Race=="Kaio")
										Racee="Makaioshin"
									else
										Racee="Half Demon"
								if(M.Race=="Demon")
									if(usr.Race=="Demon")
										Racee="Demon"
									else if(usr.Race=="Kaio")
										Racee="Makaioshin"
									else
										Racee="Half Demon"
								if(usr.Race=="Kaio")
									if(M.Race=="Demon")
										Racee="Makaioshin"
								if(usr.Race=="Half Saiyan")
									if(!M.Race=="Saiyan"&&!M.Race=="Half Saiyan")
										Racee="Quarter Saiyan"

								E.Race=Racee
								E.EnergyMax=((M.EnergyMax/M.EnergyMod)+(usr.EnergyMax/usr.EnergyMod))/2
								E.Base=((M.Base/M.BaseMod)+(usr.Base/usr.BaseMod))/2
								E.Parents.Add(M.key,usr.key)
								E.name="Baby([usr]&[M]|[E.Race])"
								if(usr.Gender=="Female")
									M<<"Mission success!"
									usr<<"You're pregnant!"
									usr.contents+=E
								else if(usr.Gender=="Male")
									usr<<"Misson success!"
									M<<"You're pregnant!"
									M.contents+=E
								else if(usr.Gender=="All")
									if(M.Gender=="Female")
										usr<<"Misson success!"
										M<<"You're pregnant!"
										M.contents+=E
									else if(M.Gender=="Male")
										M<<"Mission success!"
										usr<<"You're pregnant!"
										usr.contents+=E
									else if(M.Gender=="All")
										M<<"And this is how babies are born!"
										usr<<"And this is how babies are born!"
										usr.contents+=E
										M.contents+=E

								Log("Admin","[ExtractInfo(usr)] has mated [ExtractInfo(M)]. (User Race/Gender: [usr.Race]/[usr.Gender] Partner Race/Gender: [M.Race]/[M.Gender].")
								Q.Last=Year
								src.Last=Year
					break

obj/WeirdCreation
	CreateBioAndroid
		verb/CreateBioAndroid()
			set category="Other"
			set name="Create Bio Android"

			var/blurp=input(usr,"Would you like to create a Bio Android?","Note creating these are expensive!") in list("Yes","No")
			if(blurp=="Yes")
				var/amount=round(1500000000/usr.Intelligence)
				for(var/obj/Money/Q in usr)
					if(Q.Level>=amount)
						var/obj/Child/E=new /obj/Child(usr.loc)
						E.Race="Bio Android"
						E.EnergyMax=usr.IntelligenceLevel*250
						E.Base=usr.IntelligenceLevel^2
						E.Parents.Add(usr.key)
						E.name="TestTubeBaby([usr])"
						E.icon='Egg.dmi'
						E.Savable=1
						Q.Level-=amount
						Log("Admin","[ExtractInfo(usr)] had created a Bio Android at [usr.x],[usr.y],[usr.z].")
					else
						usr<<"You need [Commas(1500000000/usr.Intelligence)] resources."
						return

	CreateAndroid
		verb/CreateAndroid()
			set category="Other"
			set name="Create Android"

			var/blurp=input(usr,"Would you like to create an Android? It'll cost [Commas(500000000/usr.Intelligence)]","Note creating these are expensive!") in list("Yes","No")
			if(blurp=="Yes")
				var/amount=round(475000000/usr.Intelligence)
				for(var/obj/Money/Q in usr)
					if(Q.Level>=amount)
						var/obj/Child/E=new /obj/Child(usr.loc)
						E.Race="Android"
						E.EnergyMax=usr.IntelligenceLevel*150
						E.Base=usr.IntelligenceLevel^2
						E.Parents.Add(usr.key)
						E.name="Inactive Android([usr])"
						E.icon='Android1.dmi'
						E.Savable=1
						Q.Level-=amount
						Log("Admin","[ExtractInfo(usr)] had created an Android at [usr.x],[usr.y],[usr.z].")
					else
						usr<<"You need [Commas(500000000/usr.Intelligence)] resources"
						return
	CreateMajin
		verb/CreateMajin()
			set category="Other"
			set name="Create Majin"

			var/blurp=input(usr,"Would you like to create a Majin?","Note creating these are expensive!") in list("Yes","No")
			if(blurp=="Yes")
				var/amount=round(1500000000/usr.Enchantment)
				for(var/obj/Money/Q in usr)
					if(Q.Level>=amount)
						var/obj/Child/E=new /obj/Child(usr.loc)
						E.Race="Majin"
						E.EnergyMax=usr.EnchantmentLevel*250
						E.Base=usr.EnchantmentLevel^2
						E.Parents.Add(usr.key)
						E.name="Blob([usr])"
						E.icon='Egg.dmi'
						E.Savable=1
						Q.Level-=amount
						Log("Admin","[ExtractInfo(usr)] had created a Majin at [usr.x],[usr.y],[usr.z].")
					else
						usr<<"You need [Commas(1500000000/usr.Enchantment)]"
						return