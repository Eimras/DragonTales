mob/Players
	Savable=0
	Write(savefile/A)
		..()
		A["x"]<<x
		A["y"]<<y
		A["z"]<<z
	Read(savefile/A)
		..()
		loc=locate(A["x"],A["y"],A["z"])

	Bump(mob/A)
		if(istype(A,/obj/Special/Teleporter2)&&!(istype(A, /obj/Special/Teleporter2/SpecialTele)))
			var/obj/Special/Teleporter2/_tp=A
			src.loc=locate(_tp.gotoX,_tp.gotoY,_tp.gotoZ)
		if(istype(A,/obj/Special/Teleporter2/SpecialTele))
			var/obj/Special/Teleporter2/tele=A
			var/newz
			if(tele.type==/obj/Special/Teleporter2/SpecialTele/GoAbove)
				newz=tele.z-1
			if(tele.type==/obj/Special/Teleporter2/SpecialTele/GoBelow)
				newz=tele.z+1
			if(tele.type==/obj/Special/Teleporter2/SpecialTele/GoDeep)
				newz=tele.z+2
			if(tele.type==/obj/Special/Teleporter2/SpecialTele/GoHigh)
				newz=tele.z-2
			src.loc=locate(tele.x, tele.y, newz)

		if(istype(A,/obj/Effects/PocketPortal))
			var/obj/Effects/PocketPortal/LOL=A
			for(var/obj/Effects/PocketExit/Q)
				if(Q.Password==LOL.Password)
					src.loc=locate(Q.x,Q.y-1,Q.z)
					break

		if(istype(A,/obj/Effects/PocketExit))
			var/obj/Effects/PocketExit/LOL=A
			for(var/obj/Effects/PocketPortal/Q)
				if(Q.Password==LOL.Password)
					src.loc=locate(Q.x,Q.y-1,Q.z)
					break
				src<<"Unable to travel to portal...attempting portal to generator..."
				for(var/obj/Items/Enchantment/PocketDimensionGenerator/B)
					if(B.DimensionType==LOL.Password)
						src.loc=locate(B.x,B.y-1,B.z)
						break
				src<<"Unable to exit dimension! Contact admins."

		if(istype(A,/obj/Turfs/RoofGlass))
			return

		if(istype(A,/obj/Items/Enchantment/Portal))
			var/obj/Items/Enchantment/Portal/PortalScan=A
			if(PortalScan.Password==null)
				return
			for(var/obj/Items/Enchantment/Portal/B in world)
				if(B.Password==PortalScan.Password&&B!=PortalScan&&B.z)
					src.loc=locate(B.x,B.y,B.z)
					break

		if(istype(A,/obj/Items/Tech/SpaceTravel/Ship))
			var/obj/Items/Tech/SpaceTravel/Ship/LOL=A
			for(var/obj/ShipAirlock/Q)
				if(Q.Password==LOL.Password)
					src.loc=locate(Q.x,Q.y-1,Q.z)
					return
			AdminMessage("[usr]([usr.key]) tried entering a broken ship!")
			src<<"This ship is broken! Admins have been alerted."

		if(istype(A,/obj/Items/Tech/SpaceTravel/Boat))
			var/obj/Items/Tech/SpaceTravel/Boat/LOL=A
			for(var/obj/BoatEntrance/Q)
				if(Q.Password==LOL.Password)
					src.loc=locate(Q.x,Q.y-1,Q.z)
					return
			AdminMessage("[usr]([usr.key]) tried entering a broken boat!")
			src<<"This boat is broken! Admins have been alerted."

		PlanetEnterBump(A,src)

