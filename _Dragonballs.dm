
obj
	Dragon
		icon='DragonE.dmi'
		layer=999999999999999999999
		New()
			spawn()src.SetPixels()
			..()
	Dragonballs
		var/using
		var/active=0
		var/passcode
		var/power
		var/PrevX
		var/PrevY
		var/PrevZ
		Savable=1
		Stealable=1
		Health=1.#INF
		Pickable=0
		Grabbable=1
		icon='Dragonballs.dmi'
		Dragonball_1
			pixel_x=0
			pixel_y=0
		Dragonball_2
			pixel_x=-16
			pixel_y=-10
		Dragonball_3
			pixel_x=-0
			pixel_y=-16
		Dragonball_4
			pixel_x=16
			pixel_y=-10
		Dragonball_5
			pixel_x=-16
			pixel_y=10
		Dragonball_6
			pixel_x=0
			pixel_y=12
		Dragonball_7
			pixel_x=16
			pixel_y=10
		proc/Dragon()
			for(var/mob/Players/M in world)
				if(usr.z==M.z)
					M<<"The sky returns to normal as a sonic boom echos across the atmosphere..."
					for(var/obj/Dragon/L)
						del(L)
			for(var/obj/Dragonballs/Q in usr.loc)
				if(Q!=src)
					Q.icon_state="Ei"
					sleep(10)
					if(Q)del(Q)
			spawn()if(src)del(src)

		Click()
			if(!(usr in range(1,src)))return
			var/hahaz=0
			var/passcoded
			for(var/obj/Dragonballs/Q in usr.loc)
				if(Q.active&&Q.Grabbable)
					if(passcoded)
						if(passcoded!=src.passcode)
							return
					passcoded=src.passcode
					hahaz++
			if(hahaz==7)
				for(var/obj/Dragonballs/Q in usr.loc)
					Q.Grabbable=0
				for(var/mob/Players/M in world)
					if(usr.z==M.z)
						M<<"The sky turns to darkness around the entire planet..."
				var/obj/Dragon/Q=new(usr.loc)
				spawn(6000)
					if(Q)del(Q)
				lolz
				var/optionz=input(usr,"What do you want?")in list("Immortality","Bind Someone","Revive Someone","Power","Reincarnation","Other(Admin Alert)")
				switch(optionz)
					if("Immortality")
						usr.Immortal=1
						usr<<"It is done."
						src.Dragon()
					if("Bind Someone")
						var/list/haha=list("Cancel")
						for(var/mob/Players/M in world)
							haha.Add(M)
						var/bluh=input(usr,"Who do you want to bind?")in haha
						if(bluh)
							if(ismob(bluh))
								var/obj/Curse/x=new
								x.Power=power*Year*20*3
								bluh:contents+=x
								src.Dragon()
								return
						goto lolz

					if("Revive Someone")
						var/list/haha=list("Cancel")
						for(var/mob/Players/M in world)
							if(M.Dead)
								haha.Add(M)
						var/bluh=input(usr,"Who do you want to Revive?")in haha
						if(bluh)
							if(ismob(bluh))
								bluh:Revive()
								bluh:loc=usr.loc
								src.Dragon()
								return
						goto lolz
					if("Power")
						usr.Base+=src.power/10000
						src.Dragon()
						return
					if("Reincarnation")
						var/obj/Reincarnate/x=new
						x.Rein=usr.key
						x.RBase=(usr.Base/usr.BaseMod)*0.8
						x.REnergy=(usr.EnergyMax/usr.EnergyMod)*0.8
						x.loc=locate(1,1,13)
						usr<<"Relog quickly to reincarnate!"
						spawn()del(usr)
						return
					if("Other(Admin Alert)")
						AdminMessage("<big>[ExtractInfo(usr)] is trying to use the Dragon Balls! Teleport to them QUICK!</big>")
						src.Dragon()
						return





