mob/proc/BlastX(var/Wut,var/obj/Skills/Z,var/bypass=0)
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.Stunned)
		return
	var/ManaDrain=1
	var/StaffPower=1
	var/Element=0
	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
		StaffPower=N.Staff_Power
		Element=N.Element
	if(bypass||Z)
		switch(Wut)
			if("WetShot")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=25/Z.Efficiency/ManaDrain
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				if(src.ManaAmount<=5) return
				flick("Blast",src)
				if(!src.Manakete)
					src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=1
				spawn((src.Refire/Z.Speed*(0.85/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-16,16)
//				A.pixel_x=rand(-16,16)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=1.5*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)
				A.Elemental="Water"
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
				Z.Cooldown()

			if("FlickeringEmber")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=25/Z.Efficiency/ManaDrain
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				if(src.ManaAmount<=5) return
				flick("Blast",src)
				if(!src.Manakete)
					src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=1
				spawn((src.Refire/Z.Speed*(1.25/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-16,16)
//				A.pixel_x=rand(-16,16)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=0.8*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)
				A.Elemental="Fire"
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
				Z.Cooldown()

			if("StoneThrow")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=25/Z.Efficiency/ManaDrain
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				if(src.ManaAmount<=5) return
				flick("Blast",src)
				if(!src.Manakete)
					src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=1
				spawn((src.Refire/Z.Speed*(0.75/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-16,16)
//				A.pixel_x=rand(-16,16)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=1.75*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)
				A.Elemental="Earth"
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
				Z.Cooldown()



			if("Makosen")
				var/Drain=src.EnergyMax*0.03
				if(Z.Using) return
				if(!src.CanBlast(Drain)) return
				if(src.Attacking)return
				src.Attacking=1
				spawn((src.Refire/Z.Speed*10)+1) src.Attacking=0
				var/Blasts=rand(2*sqrt(Z.Level),5*sqrt(Z.Level))
				Z.Skill_Increase(3)
//				src.Energy*=0.95
				//src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Energy-=src.EnergyMax*0.03
				Z.Using=1
				while(Blasts>1)
					Blasts-=1
					if(!src.CanBlast(Drain)) return
					flick("Blast",src)
					src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
					var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
					A.Distance=Distance
					A.pixel_y=rand(-24,24)
					A.pixel_x=rand(-24,24)
					A.x+=rand(-1,1)
					A.y+=rand(-1,1)
					A.dir=src.dir
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Damage_Multiplier=1.5
					A.Lethality=src.Lethal
					A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill
					spawn if(A) walk(A,A.dir)
				Z.Cooldown()
				src.SkillLeech(Z)

			if("Kienzan")
				if(Z.Using)
					return
				var/Drain=50/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.overlays+=image(icon=Z.sicon,icon_state=Z.sicon_state,pixel_y=28)
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/15)))
				src.overlays-=image(icon=Z.sicon,icon_state=Z.sicon_state,pixel_y=28)
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(5)
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.dir=src.dir
				A.icon=Z.sicon
				A.LimitedHoming=4
				A.Pierce=1
				A.Slicing=1
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=5
				A.Deflectable=0
				A.Dodgeable=1
				if(Element)
					A.Elemental=Element
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()

			if("Charge")
				if(Z.Using)
					return
				var/Drain=25/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/20)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				Create_Projectile(usr,/obj/Projectiles/fevProjectile/Charge,Icon=Z.sicon)
				src.SkillLeech(Z)
				Z.Cooldown()

			if("Fire_Shot")
				if(Z.Using)
					return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix&&!GunKata)
						return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=0.5
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				if(src.ManaAmount<=20) return
				src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				Z.Skill_Increase()
				var/Bullet_Chance=100
				while(round(Bullet_Chance))
					if(prob(Bullet_Chance))
						flick("Blast",src)
						Create_Projectile(usr,/obj/Projectiles/fevProjectile/Bullet,Icon=Z.sicon)//short and sweet procedure to handle projectile creation
						Bullet_Chance*=0.25
						for(var/mob/X in view(10,usr))
							if(X.MusicToggle=="On")
								X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
					else
						Bullet_Chance=0
				if(Z.Level<100)
					Z.Level=100

			if("Fireball")
				if(Z.Using)
					return
				var/Drain=55/Z.Efficiency
				if(src.ManaAmount<=10) return
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/19)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Explosive=1
				A.Knockback=3
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=3*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)*(Skill/10)/2
				A.Elemental="Fire"
//				A.Burning=1
				if(!src.Manakete)
					src.ManaAmount-=(10/ManaDrain)
				spawn if(A) walk(A,A.dir)
				Z.Cooldown()

			if("PoisonBolt")
				if(Z.Using)
					return
				var/Drain=55/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.ManaAmount<2) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/21)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Explosive=1
				A.Knockback=3
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.icon+=rgb(10,150,10)
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=3*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)*(Skill/10)/2
				A.Poisoning=1
				if(!src.Manakete)
					src.ManaAmount-=(10/ManaDrain)
				spawn if(A) walk(A,A.dir)
				Z.Cooldown()

			if("Sokidan")
				if(Z.Using)
					return
				var/Drain=75/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
//				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/10)
				Z.Skill_Increase(1.75)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
				A.Distance=sqrt(Z.Level)*3
				A.dir=src.dir
				A.icon=Z.sicon
				A.Explosive=1
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=5
				A.JechtShot=1
				A.Offense=(src.Offense*src.OffenseMultiplier)*(Skill/50)
				A.Elemental=Element
				src.SkillLeech(Z)
				src.Control=A
				while(A)
					if(!src)break
					step(A,src.dir)
					if(prob(20))src.SkillLeech(Z)
					sleep(10/(sqrt(Z.Level)*sqrt(Z.Level)))
				src.Attacking=0
				src.Beaming=0
				Z.Cooldown()

			if("RotatingBlasts")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				flick("Blast",src)
				src.Energy-=Drain/src.Efficiency*300*(1/Z.Level)
				src.Attacking=1
//				Z.Using=1
				spawn((src.Refire/Z.Speed*(1/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
//				spawn(10) Z.Using=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-10,10)
//				A.pixel_x=rand(-10,10)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=0.5
				A.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				A.Elemental=Element
				var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
				B.Distance=Distance
//				B.pixel_y=rand(-10,10)
//				B.pixel_x=rand(-10,10)
				B.dir=turn(src.dir, 135)
				B.icon=Z.sicon
				B.icon_state=Z.sicon_state
				B.Owner=src
				B.Lethality=src.Lethal
				B.Damage_Multiplier=0.5
				B.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				B.Elemental=Element
				var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
				C.Distance=Distance
//				C.pixel_y=rand(-10,10)
//				C.pixel_x=rand(-10,10)
				C.dir=turn(src.dir, -135)
				C.icon=Z.sicon
				C.icon_state=Z.sicon_state
				C.Owner=src
				C.Lethality=src.Lethal
				C.Damage_Multiplier=0.5
				C.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				C.Elemental=Element
				var/obj/Projectiles/Mystical/D=new(get_step(src,src.dir))
				D.Distance=Distance
//				C.pixel_y=rand(-10,10)
//				C.pixel_x=rand(-10,10)
				D.dir=turn(src.dir, -135)
				D.icon=Z.sicon
				D.icon_state=Z.sicon_state
				D.Owner=src
				D.Lethality=src.Lethal
				D.Damage_Multiplier=0.5
				D.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				D.Elemental=Element
				spawn
					if(B)
						step(B,turn(B.dir,90))
					if(C)
						step(C,turn(C.dir,-90))
						//step(B,A.dir)
						//step(D,A.dir)
					if(A)
						if(Z:Rotation)
							walk(A,turn(A.dir, 45))
							if(B)walk(B,turn(A.dir, -45))
							if(C)walk(C,turn(A.dir, -90))
							if(D)walk(D,turn(A.dir, 90))
							Z:Rotation=0
						else
							walk(A,turn(A.dir, 180))
							if(B)walk(B,turn(A.dir, 90))
							if(C)walk(C,turn(A.dir, -90))
							if(D)walk(D,turn(A.dir, -180))
							Z:Rotation=1

				src.SkillLeech(Z)
				Z.Cooldown()