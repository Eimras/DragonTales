mob
	step_size=6
var
	list/Prevent_Movement=list("Charging","Beaming")
client

	// by default the key_down and key_repeat procs handle
	// movement, but we want to handle movement differently
	// so we override them to make them do nothing.
	key_down()
	key_repeat()

	New()
		..()

		// start the movement loop
		spawn()
			movement_loop()

	proc
		movement_loop()
			// call the move() proc once per tick
			while(1)
				sleep(world.tick_lag)
				move()

		move()
			//mob.layer=(initial(mob.layer)+10)-(0.001*mob.y)-(0.00001*mob.step_y)
			// figure out what direction the client's mob should
			// move in based on what keys they're holding.
			var/d = 0

			if(keys["north"]) d |= NORTH
			if(keys["south"]) d |= SOUTH
			if(keys["east"]) d |= EAST
			if(keys["west"]) d |= WEST

			// move them in that direction

			if(mob.KO)
				d=null
			if(mob.Knockbacked>0)
				d=null
			if(StunCheck(mob))
				d=null
			SlowCheck(mob)
			SpeedCheck(mob)
			Move_Speed(mob)

			step(mob, d)