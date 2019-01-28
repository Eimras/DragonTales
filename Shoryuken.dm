obj
	Effects
		ShoryukenEffect
			pixel_x=-32
			icon='UppercutEffect.dmi'

obj/Skills/Feva
	Hadoken
	ExShoryuken
		Cooldown=120
		verb
			ExShoryuken()
				set category="Skills"
				if(usr.Frozen||usr.Stunned||Using||usr.KO||usr.Knockbacked)
					return
				var/found=0
				for(var/obj/Items/Sword/s in src.loc)
					if(s.suffix)
						found=1
						break
				if(found)
					src.loc << "YOU CAN'T UPPERCUT WITH A SWORD!"
					return
				var
					ShoryukenHits=rand(7,12)

					DashDash=3
					mob/ShorTarget
					LockedDir=usr.dir
				Cooldown()
				while(DashDash>0)
					sleep(1)
					DashDash--
					step(usr,LockedDir)
					for(var/mob/P in get_step(usr,usr.dir))
						if(ShorTarget)
						else
							ShorTarget=P
							DashDash=0
				if(ShorTarget)
					var/Damage=0.80*(usr.Power*(usr.Strength*usr.StrengthMultiplier)*rand(5,30)/10)/(ShorTarget.Power*(ShorTarget.Endurance*ShorTarget.EnduranceMultiplier))

					Create_Shadow(usr)
					Create_Shadow(ShorTarget)
					var/matrix/State1=matrix()
					State1.Scale(0.85,0.425)
					animate(ShorTarget:Shadow,transform=State1,alpha=190)
					animate(usr:Shadow,transform=State1,alpha=190)
					var

						TargetZ=ShorTarget:pixel_z

						NewZ=TargetZ
					if(TargetZ>usr.pixel_z)
						usr.Frozen=1
						ShorTarget.Frozen=1
						usr.pixel_z=TargetZ-1
					var
						HitNum=1
						ShoryuDelay=1.5
					//Stun(usr,0.8)
					//Stun(ShorTarget,0.8)
				/*	for(var/mob/E in hearers(12,usr))
						for(var/obj/Communication/C in usr)
							E<<"<font color=[C.Text_Color]>[usr] yells: <b>SHO-</b>"*/
					usr:Quake(8)
					KenShockwave(ShorTarget,Size=2)
				/*	for(var/mob/E in hearers(12,usr))
						for(var/obj/Communication/C in usr)
							E<<"<font color=[C.Text_Color]>[usr] yells: <b>-RYUKEN!!!</b>"*/

					KenShockwave(ShorTarget,Size=2)
					var/obj/Effects/ShoryukenEffect/SE=new
					SE.loc=usr.loc
					animate(SE,alpha=0)
					animate(SE,alpha=255,time=1.5)
					flick("Appear",SE)
					while(ShoryukenHits>0)

						Damage=BlockDamage(ShorTarget,Damage)
						ShorTarget.Health-=Damage
						Injure(ShorTarget,Damage)
						animate(ShorTarget:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)
						animate(usr:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)

						animate(ShorTarget,pixel_z=NewZ+15,ShoryuDelay)
						animate(usr,pixel_z=NewZ+13,ShoryuDelay)
						animate(SE,pixel_z=NewZ,ShoryuDelay)
						//Stun(usr,1)
						//Stun(ShorTarget,2)
						HitEffect(ShorTarget)
						KenShockwave(ShorTarget,Size=0.5)
						sleep(ShoryuDelay)
						usr.dir=turn(usr.dir,90)
						NewZ=ShorTarget:pixel_z
						ShoryukenHits--
						HitNum++
					flick("Vanish",SE)
					animate(SE,alpha=0,time=1.5)
					spawn(1.5)
						del SE
					if(ShorTarget.Health<=0&&!ShorTarget.KO) ShorTarget.Unconscious(usr)
					animate(ShorTarget,pixel_z=NewZ+4,time=4)
					animate(usr,pixel_z=NewZ+2,time=4)
					sleep(4)
					animate(ShorTarget,pixel_z=1,time=7.5)
					animate(usr,pixel_z=1,time=5.5)
					spawn(2.5)
						usr.Frozen=0
						usr.Flying=0
						ShorTarget:Flying=0
						RemoveShadow(ShorTarget)
						RemoveShadow(usr)
obj/Skills/Feva
	Shoryuken
		Cooldown=60
		verb
			Shoryuken()
				set category="Skills"
				if(usr.Frozen||usr.Stunned||Using||usr.KO||usr.Knockbacked)
					return
				var/found=0
				for(var/obj/Items/Sword/s in src.loc)
					if(s.suffix)
						found=1
						break
				if(found)
					src.loc << "YOU CAN'T UPPERCUT WITH A SWORD!"
					return
				var
					ShoryukenHits=rand(5,7)

					DashDash=3
					mob/ShorTarget
					LockedDir=usr.dir
				Cooldown()
				while(DashDash>0)
					sleep(1)
					DashDash--
					step(usr,LockedDir)
					for(var/mob/P in get_step(usr,usr.dir))
						if(ShorTarget)
						else
							ShorTarget=P
							DashDash=0
				if(ShorTarget)
					var/Damage=0.75*(usr.Power*(usr.Strength*usr.StrengthMultiplier)*rand(5,30)/10)/(ShorTarget.Power*(ShorTarget.Endurance*ShorTarget.EnduranceMultiplier))

					Create_Shadow(usr)
					Create_Shadow(ShorTarget)
					var/matrix/State1=matrix()
					State1.Scale(0.85,0.425)
					animate(ShorTarget:Shadow,transform=State1,alpha=190)
					animate(usr:Shadow,transform=State1,alpha=190)
					var

						TargetZ=ShorTarget:pixel_z

						NewZ=TargetZ
					if(TargetZ>usr.pixel_z)
						usr.pixel_z=TargetZ-1
					var
						HitNum=1
						ShoryuDelay=1.5
					//Stun(usr,0.8)
					//Stun(ShorTarget,0.8)
					usr:Quake(8)
					/*for(var/mob/E in hearers(12,usr))
						for(var/obj/Communication/C in usr)
							E<<"<font color=[C.Text_Color]>[usr] yells: <b>SHORYUKEN!</b>"*/
					var/obj/Effects/ShoryukenEffect/SE=new
					SE.loc=usr.loc
					animate(SE,alpha=0)
					animate(SE,alpha=255,time=1.5)
					flick("Appear",SE)
					while(ShoryukenHits>0)

						Damage=BlockDamage(ShorTarget,Damage)
						ShorTarget.Health-=Damage
						Injure(ShorTarget,Damage)
						animate(ShorTarget:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)
						animate(usr:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)

						animate(ShorTarget,pixel_z=NewZ+15,ShoryuDelay)
						animate(usr,pixel_z=NewZ+13,ShoryuDelay)
						animate(SE,pixel_z=NewZ,ShoryuDelay)
						//Stun(usr,1)
						//Stun(ShorTarget,1.5)
						HitEffect(ShorTarget)
						KenShockwave(ShorTarget,size=0.25)
						sleep(ShoryuDelay)
						usr.dir=turn(usr.dir,90)
						NewZ=ShorTarget:pixel_z
						ShoryukenHits--
						HitNum++
					flick("Vanish",SE)
					animate(SE,alpha=0,time=1.5)
					spawn(1.5)
						del SE
					if(ShorTarget.Health<=0&&!ShorTarget.KO) ShorTarget.Unconscious(usr)
					animate(ShorTarget,pixel_z=NewZ+4,time=4)
					animate(usr,pixel_z=NewZ+2,time=4)
					sleep(4)
					animate(ShorTarget,pixel_z=1,time=7.5)
					animate(usr,pixel_z=1,time=5.5)
					spawn(2.5)
						usr.Frozen=0
						usr.Flying=0

						ShorTarget:Frozen=0
						ShorTarget:Flying=0
						RemoveShadow(ShorTarget)
						RemoveShadow(usr)



obj/Skills/Feva
	NanayaKick
		Cooldown=10
		verb
			NanayaKick()
				set category="Skills"
				set name="Sensou: Blinding Sky"
				if(usr.TimeFrozen)return
				if(usr.ShadowBound)return
				if(usr.Frozen||usr.Stunned||Using||usr.KO||usr.Knockbacked)
					return
				usr.Frozen=1
				var/found=0
				for(var/obj/Items/Sword/s in src.loc)
					if(s.suffix)
						found=1
						break
				if(found)
					src.loc << "You can't use Nanaya skills with a long blade!"
					return

				var/foundB=0
				for(var/obj/Items/BambooStaff/b in src.loc)
					if(b.suffix)
						foundB=1
						break
				if(foundB)
					src.loc << "You can't use Nanaya skills with a staff!"
					return
				var
					ShoryukenHits=rand(5,7)

					DashDash=3
					mob/ShorTarget
					LockedDir=usr.dir
				Cooldown()
				while(DashDash>0)
					sleep(1)
					DashDash--
					usr.TotalFatigue+=3
					step(usr,LockedDir)
					for(var/mob/P in get_step(usr,usr.dir))
						if(ShorTarget)
						else
							ShorTarget=P
							DashDash=0
				if(ShorTarget)
					var/Damage=0.75*(usr.Power*(usr.Strength*usr.StrengthMultiplier)*rand(5,30)/10)/(ShorTarget.Power*(ShorTarget.Endurance*ShorTarget.EnduranceMultiplier))

					Create_Shadow(usr)
					Create_Shadow(ShorTarget)
					var/matrix/State1=matrix()
					State1.Scale(0.85,0.425)
					animate(ShorTarget:Shadow,transform=State1,alpha=190)
					animate(usr:Shadow,transform=State1,alpha=190)
					var

						TargetZ=ShorTarget:pixel_z

						NewZ=TargetZ
					if(TargetZ>usr.pixel_z)
						usr.pixel_z=TargetZ-1
					var
						HitNum=1
						ShoryuDelay=1.5
					Stun(ShorTarget,0.8)
					for(var/mob/E in hearers(12,usr))
						for(var/obj/Communication/C in usr)
							E<<"<font color=[C.Text_Color]>[usr] yells: <b>Sensou: Hikutou!</b>"
					var/obj/Effects/ShoryukenEffect/SE=new
					SE.loc=usr.loc
					animate(SE,alpha=0)
					animate(SE,alpha=255,time=1.5)
					flick("Appear",SE)
					while(ShoryukenHits>0)
						Damage=BlockDamage(ShorTarget,Damage)
						ShorTarget.Health-=Damage
						Injure(ShorTarget,Damage)
						animate(ShorTarget:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)
						animate(usr:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)
						animate(ShorTarget,pixel_z=NewZ+15,ShoryuDelay)
						animate(usr,pixel_z=NewZ+13,ShoryuDelay)
						animate(SE,pixel_z=NewZ,ShoryuDelay)
						Stun(ShorTarget,4)
						HitEffect(ShorTarget)
						KenShockwave(ShorTarget,size=0.25)
						sleep(ShoryuDelay)
						NewZ=ShorTarget:pixel_z
						ShoryukenHits--
						HitNum++
					flick("Vanish",SE)
					animate(SE,alpha=0,time=1.5)
					spawn(1.5)
						del SE
					if(ShorTarget.Health<=0&&!ShorTarget.KO) ShorTarget.Unconscious(usr)
					animate(ShorTarget,pixel_z=NewZ+4,time=4)
					animate(usr,pixel_z=NewZ+2,time=4)
					sleep(4)
					animate(ShorTarget,pixel_z=1,time=7.5)
					animate(usr,pixel_z=1,time=5.5)
					spawn(2.5)
						usr.Frozen=0
						usr.Flying=0
						ShorTarget:Frozen=0
						ShorTarget:Flying=0
						RemoveShadow(ShorTarget)
						RemoveShadow(usr)
					usr.Frozen=0


obj/Skills/Feva/Extra
	RisingTide
		Cooldown=15
		verb
			DHKick()
				set category="Skills"
				set name="Swordmaster: Rising Tide"
				set desc="Hack n' slash the enemy infront of you airborne, leaving them vulnerable for some sick smokin' style!"

				if(usr.TimeFrozen)return
				if(usr.ShadowBound)return
				if(usr.Frozen||usr.Stunned||Using||usr.KO||usr.Knockbacked)
					return
				usr.Frozen=1
				var
					ShoryukenHits=rand(5,7)
					DashDash=3
					mob/ShorTarget
					LockedDir=usr.dir
				if(usr.Swordmaster==0)
					usr.Swordmaster=1
					usr.Gunslinger=0
					usr.Royalguard=0
					usr.Trickster=0
					for(var/mob/S in view(usr,12))
						for(var/obj/Communication/C in usr)
							S<<"<font color=red>[usr] yells: <b>Swordmaster!</b>"
					view(src)<<"[usr] rushes forth and spins their blade like a sick helicopter's helix!"
				Cooldown()
				while(DashDash>0)
					sleep(1)
					DashDash--
					usr.TotalFatigue+=3
					step(usr,LockedDir)
					for(var/mob/P in get_step(usr,usr.dir))
						if(ShorTarget)
						else
							ShorTarget=P
							DashDash=0
				if(ShorTarget)
					var/Damage=0.75*(usr.Power*(usr.Strength*usr.StrengthMultiplier)*rand(5,30)/10)/(ShorTarget.Power*(ShorTarget.Endurance*ShorTarget.EnduranceMultiplier))
					Create_Shadow(ShorTarget)
					var/matrix/State1=matrix()
					State1.Scale(0.85,0.425)
					animate(ShorTarget:Shadow,transform=State1,alpha=190)
					var
						TargetZ=ShorTarget:pixel_z
						NewZ=TargetZ
					if(TargetZ>usr.pixel_z)
						usr.pixel_z=TargetZ-1
					var
						HitNum=1
						ShoryuDelay=1.5
					Stun(ShorTarget,0.8)
					for(var/mob/E in hearers(12,usr))
						for(var/obj/Communication/C in usr)
							E<<"<font color=[C.Text_Color]>[usr] yells: <b>--Blast off!</b>"
					var/obj/Effects/ShoryukenEffect/SE=new
					SE.loc=usr.loc
					animate(SE,alpha=0)
					animate(SE,alpha=255,time=1.5)
					flick("Appear",SE)
					while(ShoryukenHits>0)
						Damage=BlockDamage(ShorTarget,Damage)
						ShorTarget.Health-=Damage
						Injure(ShorTarget,Damage)
						animate(ShorTarget:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)
						animate(ShorTarget,pixel_z=NewZ+15,ShoryuDelay)
						animate(SE,pixel_z=NewZ,ShoryuDelay)
						Stun(ShorTarget,4)
						Slash(ShorTarget)
						KenShockwave(ShorTarget,size=0.25)
						sleep(ShoryuDelay)
						NewZ=ShorTarget:pixel_z
						ShoryukenHits--
						HitNum++
					flick("Vanish",SE)
					animate(SE,alpha=0,time=1.5)
					spawn(1.5)
						del SE
					if(ShorTarget.Health<=0&&!ShorTarget.KO) ShorTarget.Unconscious(usr)
					animate(ShorTarget,pixel_z=NewZ+4,time=4)
					sleep(4)
					animate(ShorTarget,pixel_z=1,time=7.5)
					spawn(2.5)
						usr.Frozen=0
						usr.Flying=0
						ShorTarget:Frozen=0
						ShorTarget:Flying=0
						RemoveShadow(ShorTarget)
					usr.Frozen=0
				else
					usr.Frozen=0