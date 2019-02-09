/*
mob/Move()
	if(!client&&!Knockbacked&&!Move_Requirements()) return
	var/Former_Location=loc
	Moving=1
	var/Delay=MovementSpeed()
/*	if(Control)
		var/obj/Items/Tech/SpaceTravel/X=Control
		Delay=20/X.MaxSpeed
	Decimals+=Delay-round(Delay)
	if(round(Decimals)>1)
		Delay+=round(Decimals)
		Decimals-=round(Decimals)*/
	if(Knockbacked) Delay=0
	spawn(Delay) Moving=0
	..()
	//AutoFace()
	Blok(src)
	density=1
	Edge_Check(Former_Location)
	if(!Knockbacked&&Target&&istype(Target,/obj/Others/Build)) Build_Lay(Target,src)
	if(Grab) Grab_Update()
	if(AFKTimer==0)
		overlays-=AFKIcon
//		spawn()src.GainLoop()
		spawn()src.callspawns()

	AFKTimer=AFKTimeLimit
*/

mob/var/tmp/list/keys_pressed
mob/verb
	KeyDown(key_press as text)
		set instant = 1
		set hidden = 1
		set waitfor=0
		if(!keys_pressed) keys_pressed = list()
		if(keys_pressed[key_press]) return
		keys_pressed[key_press] = 1


		if(key_press in list("NORTH","SOUTH","EAST","WEST"))
			move_direction = 0
			if(keys_pressed["NORTH"]) move_direction |= NORTH
			else if(keys_pressed["SOUTH"]) move_direction |= SOUTH
			if(keys_pressed["EAST"]) move_direction |= EAST
			else if(keys_pressed["WEST"]) move_direction |= WEST


		if(key_press in list("NORTH","SOUTH","EAST","WEST")) movementLoop()

	KeyUp(key_release as text)
		set instant = 1
		set hidden = 1
		set waitfor=0
		if(!keys_pressed) keys_pressed = list()
		if(!keys_pressed[key_release]) return
		keys_pressed -= key_release

		if(key_release in list("NORTH","SOUTH","EAST","WEST"))
			move_direction = 0
			if(keys_pressed["NORTH"]) move_direction |= NORTH
			else if(keys_pressed["SOUTH"]) move_direction |= SOUTH
			if(keys_pressed["EAST"]) move_direction |= EAST
			else if(keys_pressed["WEST"]) move_direction |= WEST


client/North()
client/South()
client/East()
client/West()
client/Northwest()
client/Southwest()
client/Northeast()
client/Southeast()

mob/var/tmp/next_move = 0
mob/var/tmp/movement_loop = 0
mob/var/tmp/move_direction = 0
mob/proc/movementLoop()
	//set instant = 1
	set waitfor = 0
	if(movement_loop) return
	movement_loop=1
	while(movement_loop)
		if(!client)
			movement_loop=0
			break
		if(!client&&!Knockbacked&&!Move_Requirements())
			sleep(1)
			continue
		if(Knockbacked)
			sleep(1)
			continue

		var/Former_Location=loc
		var/Delay=MovementSpeed()

		if(keys_pressed && Delay>0 && Move_Requirements())

			if(move_direction&&Allow_Move(move_direction))
				step(src,move_direction)
				next_move = world.time + Delay
			/*	if(src.Target&&src.AutoTarget)
					if(src.Target in view(src))
						src.dir=get_dir(src,src.Target)*/
				Blok(src)
				density=1
				Edge_Check(Former_Location)
			//	if(!Knockbacked&&Target&&istype(Target,/obj/Others/Build)) Build_Lay(Target,src)
				if(Grab) Grab_Update()
				if(AFKTimer==0)
					overlays-=AFKIcon
					spawn()src.callspawns()
				AFKTimer=AFKTimeLimit

			else if(!move_direction)
				movement_loop = 0

		sleep(world.tick_lag)