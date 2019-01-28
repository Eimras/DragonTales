atom/var/Fatal_Mode=0
obj/Skills/Feva

	EventHorizon
		Cooldown=90
		var/Uses=0
		verb
			EventHorizon()
				set category="Skills"
				if(usr.KO||usr.Blocking)return
				if(Using) return
				if(!usr.Target)return
				if(usr.Beaming)return
				if(usr.TimeFrozen)return
				if(usr.ShadowBound)return
				if(usr.Knockbacked)return
				if(Uses<=0)
					Uses=5
					usr.OMessage(10,"[usr] surges with light!","<font color=red>[usr]([usr.key]) used  Event Horizon.")
					usr<<"You have 5 uses (or 10 seconds) before this goes on cooldown."
					spawn(100)
						if(Uses>0)
							Uses=0
							if(!Using==1)
								Cooldown()
				else
					if(Uses>0)
						Uses--
						usr<<"You have [Uses] uses of [src] left."
						var/Distance=25
						if(usr.Energy>usr.EnergyMax/8)

							usr.Frozen=1
							Using=2
							while(Using==2&&Distance>0)
								flick("Flight",usr)
								if(usr.Target:Knockbacked)
									walk_to(usr,get_step(usr.Target,usr:Target:Knockbacked))
									if(usr.loc==get_step(usr:Target,usr:Target:Knockbacked))
										usr:Target:Knockbacked=0
										usr.dir=get_dir(usr,usr.Target)

										Distance=0
								else
									walk_to(usr,usr.Target)

									if(get_dist(usr,usr.Target)==1)

										Distance=0


								/*
								step(usr,usr.dir)
								usr.dir=get_dir(usr,usr.Target)*/


								Distance-=1
								sleep(1)
							usr.Frozen=0
							walk(usr,0)
							if(Distance<=0)
								usr.Attacking=0
								usr.AttackHardness=2
								usr.HeavyShot=1
								usr.Melee(1,1,0,0)
							if(Using==2)
								Using=0
						if(Uses<=0)
							Cooldown()
	DarkAura
		Cooldown=90
		var/Uses=0
		verb
			EventHorizon()
				set name ="Dark Aura"
				set category="Skills"
				if(usr.KO||usr.Blocking)return
				if(Using) return
				if(!usr.Target)return
				if(usr.Beaming)return
				if(usr.TimeFrozen)return
				if(usr.ShadowBound)return
				if(usr.Knockbacked)return
				if(Uses<=0)
					Uses=5
					usr.OMessage(10,"[usr] becomes cloaked in darkness...","<font color=red>[usr]([usr.key]) used  Dark Aura.")
					usr<<"You have 5 uses (or 10 seconds) before this goes on cooldown."
					spawn(100)
						if(Uses>0)
							Uses=0
							if(!Using==1)
								Cooldown()
				else
					if(Uses>0)
						Uses--
						usr<<"You have [Uses] uses of [src] left."
						var/Distance=25
						if(usr.Energy>usr.EnergyMax/8)

							usr.Frozen=1
							Using=2
							while(Using==2&&Distance>0)
								flick("Flight",usr)
								if(usr.Target:Knockbacked)
									walk_to(usr,get_step(usr.Target,usr:Target:Knockbacked))
									if(usr.loc==get_step(usr:Target,usr:Target:Knockbacked))
										usr:Target:Knockbacked=0
										usr.dir=get_dir(usr,usr.Target)

										Distance=0
								else
									walk_to(usr,usr.Target)

									if(get_dist(usr,usr.Target)==1)

										Distance=0


								/*
								step(usr,usr.dir)
								usr.dir=get_dir(usr,usr.Target)*/


								Distance-=1
								sleep(1)
							usr.Frozen=0
							walk(usr,0)
							if(Distance<=0)
								usr.Attacking=0
								usr.AttackHardness=2
								usr.HeavyShot=1
								usr.Melee(2,1,0,0)
							if(Using==2)
								Using=0
						if(Uses<=0)
							Cooldown()
	Fatal_Mode
		Cooldown=120
		verb/Fatal_Mode()
			set category="Skills"
			if(usr.KO||usr.Blocking)return
			if(Using) return
			if(!usr.Target)return
			if(usr.Beaming)return
			if(usr.TimeFrozen)return
			if(usr.ShadowBound)return
			if(usr.Knockbacked)return
			Using=1
			usr.Fatal_Mode=1
			usr<<"Fatal Mode Active: You'll deal double damage for 10 seconds."
			spawn(90)
				var/matrix/State1=matrix()
				State1.Scale(0.85,0.425)
				animate(usr,pixel_z=75,time=5)
				Create_Shadow(usr)
				animate(usr:Shadow,transform=State1,alpha=190)
				usr.OMessage(10,"[usr] leaps into the air...","<font color=red>[usr]([usr.key]) used  Fatal Mode.")
			spawn(95)
				animate(usr,pixel_z=0,time=5)
			spawn(100)
				usr.Fatal_Mode=0
				Crater(usr)
				KenShockwave(usr,Size=5)
				RemoveShadow(usr)
				for(var/mob/P in oview(4,usr))
					var/Damage=(usr.Power*(usr.Strength*usr.StrengthMultiplier))/(P.Power*(P.Endurance*P.EnduranceMultiplier))*2.5
					Damage=BlockDamage(P,Damage)
					P.Health-=Damage
					Injure(P,Damage)
				//	P.Unconscious(usr)
			Cooldown()

	Dark_Break
		Cooldown=60
		var/Uses=0
		verb/Dark_Break()
			set name ="Dark Break"
			set category="Skills"
			if(usr.KO||usr.Blocking)return
			if(Using) return
			if(!usr.Target)return
			if(usr.Beaming)return
			if(usr.TimeFrozen)return
			if(usr.ShadowBound)return
			if(usr.Knockbacked)return
			if(Uses<=0)
				Uses=3
				usr<<"You have 3 uses (or 10 seconds) before this goes on cooldown."
				spawn(100)
					if(Uses>0)
						Uses=0
						if(!Using==1)
							Cooldown()
			else
				if(Uses>0)
					Uses--
					if(usr.Target in oview(usr))
						var/matrix/State1=matrix()
						State1.Scale(0.85,0.425)
						animate(usr,pixel_z=75)
						Create_Shadow(usr)
						animate(usr:Shadow,transform=State1,alpha=190)
						Stun(usr.Target,0.6)
						if(usr.Target:Knockbacked)
							var/KBdir=usr.Target:Knockbacked
							usr.Target:Knockbacked=0
							AfterImage(usr)
							usr.Move(get_step(usr.Target,KBdir))
							usr.dir=get_dir(usr,usr.Target)

						else
							usr.Move(get_step(usr.Target,turn(usr.Target:dir,180)))
							usr.dir=get_dir(usr,usr.Target)
						animate(usr,pixel_z=0,time=5)
						spawn(5)
							Crater(usr)
							usr.Attacking=0
							usr.AttackHardness=2
					//		usr.HeavyShot=1
							RemoveShadow(usr)
							usr.Melee(1.5,1,0,0)