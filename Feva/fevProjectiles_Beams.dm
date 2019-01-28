/*This is where all of the beam instances will be added
Offense_Multiplier=1 (This gets multiplied by the user's offense at some point)
Piercing=0 Passes through targets
Diminishing=1 //Changes damage done 1 = No change; > 1 = Increased Damage Per Hit, < 1 = Lowered Damage per hit
Boomerang=0 //Moves x spaces and returns to the user. Can strike same target multiple times
MultiHit=0 //Can hit the same victim more than once
LifeTime=16//How long the projectile lasts
MoveDelay=2

Each new beam should have "obj/Projectiles/fevProjectile/Beam" as it's parent so that all of it's procedures are handled properly

Final Flash = "obj/Projectiles/fevProjectile/Beam/Final_Flash" for example
*/

obj/Projectiles/fevProjectile
	Beam
		icon='Beam1.dmi'
		Knockback=0
		Damage_Multiplier=3.5
		Deflectable=1
		Dodgeable=1
		Move()
			..()
			Beam_Graphics()

		proc
			Struggle()
				if(istype(src,/obj/Projectiles/fevProjectile/Beam))
					if(Source)
						Source:Beam_Time++
				if(src)
					icon_state="struggle"
					layer=0.1
					var
						Initial_Pixelx=pixel_x
					if(src)
						animate(src,pixel_x=Initial_Pixelx+rand(-1,1),time=2)
						spawn(2)
							if(src)
								animate(src,pixel_x=Initial_Pixelx)
			Beam_Graphics()
				spawn if(src) if(icon_state!="struggle")
					if(!(locate(/obj/Projectiles/fevProjectile/Beam) in get_step(src,dir))) icon_state="head"
					else if(!(locate(/obj/Projectiles/fevProjectile/Beam) in get_step(src,turn(dir,180)))) icon_state="end"
					else icon_state="tail"
		DeathBeam
			icon='Beam8.dmi'
			Knockback=0
			Piercing=1
			Damage_Multiplier=5
			MoveDelay=0
			Move()
				if(dir in list(NORTH,SOUTH))
					var/matrix/M=matrix()
					M.Scale(0.5,1.5)
					animate(src,transform=matrix()*M)
				else if(dir in list(EAST,WEST))
					var/matrix/M=matrix()
					M.Scale(1.5,0.5)
					animate(src,transform=matrix()*M)
				..()