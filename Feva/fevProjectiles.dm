

obj/Projectiles
	fevProjectile
		Del()
			if(Explosive)
				fevExplosion(Owner,src,Explosive,Damage_Multiplier*Explosion_Damage)
			if(Shadow)
				del Shadow
			..()
		proc
			Damage(mob/P,Damage)
				var/Hit=0
				Damage/=(P.Power*(P.Resistance*P.ResistanceMultiplier)*3)
				if(Dodgeable)
					if(P.UltraInstinct)
						if(prob(10))
							Hit=1
						else
							AfterImage(P)
							P<<"DEBUG: doj"
							view(P)<<"[P] mimbly dodges the attack with nothing but instinctive reflexes?!"
							view(P)<<sound('KunaiMod/Sounds/migattedoge.ogg')
							P.dir=turn(dir,pick(-45,45,-90,90,180))
							walk(P,P.dir,MoveDelay,0)
					else if(P.Preordinance)
						if(prob(Sharingan_Formula(P,100)))
							Hit=1
						else
							AfterImage(P)
							P<<"DEBUG: doj"
							view(P)<<"[P] foresees the attack and nimbly attempts to avoid it!"
							P.dir=turn(dir,pick(-45,45,-90,90,180))
							walk(P,P.dir,MoveDelay,0)
				if(Deflectable)
					if(prob(Accuracy_Formula(Owner,P,100))&&P.Royalguard==0)
						Hit=1
					else
						flick("Attack",P)
						if(P.Royalguard==1)
							view(P)<<sound('KunaiMod/Sounds/shieldblock.ogg')
						dir=turn(dir,pick(-45,45,-90,90,180))
						walk(src,src.dir,MoveDelay,0)
				else
					Hit=1
				if(P.SonicSway)
					Hit=0
				if(Hit)
					if(Knockback)
						//world<<"[P] should get KBd"
						P.Knockback(Knockback,P,Direction=get_dir(src,P))
						//step(P,src.dir)
					if(Diminishing)
						Damage_Multiplier*=Diminishing
					if(P.WildSense)
						WildSense(P,Owner)
					else
						if(Owner:Fatal_Mode)
							Damage*=2
						Damage=BlockDamage(P,Damage)
						P.Health-=Damage
						if(Owner:WoundIntent)
							Injure(P,Damage)
						if(Pierce)
							if(Owner:WoundIntent)
								Injure(P,Damage)
					//	world<<"[P] took [Damage] damage from [Owner]'s [src]!."
						if(Lethality && P.Health<=-2)
							P.Death(Owner,null,Damage)
						if(Lethality && !P.MortallyWounded && P.KO)
							if(!P.MortallyWounded)
								Owner.OMessage(10,"[Owner] has mortally wounded [P].")
							P.Health=-1
							P.MortallyWounded=1
						if(P.Health<=0 &&!P.KO)
							P.Unconscious(Owner)
						if(Piercing)

						else if(initial(MultiHit)>0)
							if(MultiHit>0)
							//world<<MultiHit
								MultiHit--
							else
								del src
						else
							del src
				else
					flick("Attack",P)
					dir=turn(dir,pick(-45,45,-90,90,180))
					walk(src,src.dir,MoveDelay,0)
			Damage_Formula()//Using the preset damage formula
				if(istype(Owner,/mob) && !Mugetsu && !Physical && !Gun && !Physical && !Sekiha)
					return Damage_Multiplier*Owner.Power*(Owner.Force*Owner.ForceMultiplier)
				if(istype(Owner,/mob) && Mugetsu && !Physical && !Gun && !Physical && !Sekiha)
					return Damage_Multiplier*Owner.Power*((Owner.Force*Owner.ForceMultiplier+Owner.Strength*Owner.StrengthMultiplier)/2)
	//			else if(istype(Owner,/mob) && !Gun && !Physical)
	//				return Damage_Multiplier*Owner.Power*(Owner.Force*Owner.ForceMultiplier)
				else if(Gun)
					return Damage_Multiplier*Power*GunBP*1.5
				else if(Physical)
					return Damage_Multiplier*Owner.Power*(Owner.Strength*Owner.StrengthMultiplier)*0.5
				else if(BlackDragon)
					return Damage_Multiplier*Owner.Power*(((Owner.Strength*Owner.StrengthMultiplier)+(Owner.Force*Owner.ForceMultiplier))/2)*0.5
				else if(Sekiha==1)
					return Damage_Multiplier*Owner.Power*(Owner.Strength*Owner.StrengthMultiplier)+(Owner.Force*Owner.ForceMultiplier)*0.5
				else if(Sekiha==2)
					return Damage_Multiplier*Owner.Power*Partner.Power*((Owner.Strength*Owner.StrengthMultiplier)+(Partner.Strength*Partner.StrengthMultiplier))+((Owner.Force*Owner.ForceMultiplier)+(Partner.Force*Partner.ForceMultiplier))*1.5
				else
					return Damage_Multiplier
		Cross(a)
			if(ismob(a))
				if(a:dir==turn(dir,180))
					return 0
				else
					return 1
			if(istype(a,/obj/Projectiles/fevProjectile))
				if(a:Owner==Owner&&a:dir==dir)
					return 1
				else
					var
						DamageA=a:Damage_Formula()
						DamageB=Damage_Formula()
					if(DamageA>DamageB)

						Health-=DamageA*10

						if(Health<=0)
							if(prob(5))
								fevExplosion(a:Owner,src,1,Damage_Multiplier*0.25)
							if(Owner in bounds(src,1))
								Source:Beaming=0
						//		a:Impact(Owner)
								fevExplosion(a:Owner,src,1,Damage_Multiplier*1.3)
							spawn(1)
								del src
							return 1



	//	icon='blas.dmi'
		density=0

		Health=100
		Damage_Multiplier=1

		Knockback=0//Pushes the victim in the same direction upon impact
		Explosive=0//Causes an explosion
		Deflectable=0
		Dodgeable=0 //EYY stuff for Ultra Instinct, Nanaya Mode, Preordinance and Sharingan.
		var/GatheringEnergy=0 //spirit bomb bs
		var
			Target
			Source//'Parent' of projectile
			//Owner = Player
			Offense_Multiplier=1
			Piercing=0 //Passes through targets
			Diminishing=1 //Changes damage done 1 = No change; > 1 = Increased Damage Per Hit, < 1 = Lowered Damage per hit
			Boomerang=0 //Moves x spaces and returns to the user. Can strike same target multiple times
			MultiHit=0 //Can hit the same victim more than once
			LifeTime=24//How long the projectile lasts
			MoveDelay=2
			Homing=0
			Drunk=0
			Explosion_Damage=0.25
		New()
			spawn(1)
				step(src,src.dir,32)
				if(Homing)
					spawn(rand(1,5))
						walk_to(src,Target,0,MoveDelay,0)
				else if(Drunk)
					spawn(rand(1,10))
						for(var/mob/P in oview(30,src))
							if(P!=Owner)
								walk_to(src,P,0,MoveDelay,0)
				else
					walk(src,src.dir,MoveDelay,0)

/*		Butch()
			spawn(rand(1,10))
				for(var/mob/P in oview(30,src))
					if(P!=Owner)
						walk_to(src,P,0,MoveDelay,0)*/

			spawn(LifeTime)
				if(Boomerang==1)
					Boomerang=2
					//world<<"Going home"
					walk_to(src,Owner,0,MoveDelay)
				else
					del src
		Move()
			if(Health<=0)
				del src
			for(var/mob/m in bounds(1,src))
				if(m==Owner&&Boomerang==2)//Removes Boomerangs
					del src
			..()
			Shadow_Chase(src)//Projectiles Need Shadows too <3
		proc
			Impact(mob/a)
				//world<<"TOTAL IMPACT [src]"
				var/Damage=Damage_Formula()
				Damage(a,Damage,Owner)



proc
	Create_Projectile(atom/a,Projectile,Damage=1,Accuracy=1,Icon,Icon_State,SkillSource,Pixel=16,Static=0)//Use this procedure when creating a projectile.
		var/obj/Projectiles/fevProjectile/F=new Projectile
		if(Icon)
			F.icon=Icon
		if(Icon_State)
			F.icon_state=Icon_State
		if(SkillSource)
			F.Source=SkillSource
		F.Owner=a
		F.loc=a.loc
		F.dir=a.dir
		step(F,a.dir)
		F.Target=a:Target
		F.Lethality=a:Lethal
		F.Offense=F:Offense_Multiplier*F:Owner:Offense
		F.Damage_Multiplier*=Damage
		F.Offense*=Accuracy
		F.pixel_z=a.pixel_z
		//world<<"[F.type]"
		if(Static)
			F.pixel_x=Pixel
			F.pixel_y=Pixel
		else
			F.pixel_x=rand(-Pixel,Pixel)
			F.pixel_y=rand(-Pixel,Pixel)
		if(F.pixel_z>0)
			Create_Shadow(F)

