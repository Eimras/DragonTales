atom/proc/SetPixels()
	var/icon/b=new(src.icon)
	if(b.Width()>32)
		src.pixel_x=(b.Width()-32)/-2
	if(b.Height()>32)
		src.pixel_y=(b.Height()-32)/-2
obj
	Tipper
		var
			DamMult=1.5
			SwordMult
		New(var/mob/owner)
			..()
			src.Owner=owner
			src.loc = owner.loc
			src.dir = owner.dir
			src.GetMults()
			src.Life()
		proc
			Life()
				step(src, src.dir)
				src.DamMult=5
				step(src, src.dir)
				del src
			GetMults()
				var/swordfound=0
				for(var/obj/Items/Sword/s in src.Owner)
					if(s.suffix)
						src.SwordMult=s.Damage_Multiplier
						swordfound=1
					else
						if(!swordfound)
							src.SwordMult=1.5
			DoDamage(var/mob/m)
				if(Owner.kiblade)
					src.Owner.DoDamage(m,src.Owner.StrVsEnd(m,src.DamMult*src.SwordMult*0.95))
					src.Owner.DoDamage(m,src.Owner.ForVsRes(m,src.DamMult*src.SwordMult*0.66))
				else
					src.Owner.DoDamage(m,src.Owner.StrVsEnd(m,src.DamMult*src.SwordMult))
				m.Knockback(round(src.DamMult*3.5), src.Owner)
		Bump(var/atom/a)
			if(a.type in typesof(/mob))
				if(a!=src.Owner)
					var/mob/m=a
					src.DoDamage(m)
					del src


	Feedback
		var
			SwordMult
		New(var/mob/owner)
			..()
			src.Owner=owner
			src.loc = owner.loc
			src.dir = owner.dir
			src.GetMults()
			src.Life()
		proc
			Life()
				step(src, src.dir)
				step(src, src.dir)
				del src
			GetMults()
				for(var/obj/Items/Sword/s in src.Owner)
					if(s.suffix)
						src.SwordMult=s.Damage_Multiplier
					else
						src.SwordMult=1.5
			DoDamage(var/mob/m)
				src.Owner.DoDamage(m,src.Owner.StrVsEnd(m,(m.Energy/m.EnergyMax)*20*src.SwordMult))
				m.Knockback(round((m.Energy/m.EnergyMax)*20), src.Owner)
		Bump(var/atom/a)
			if(a.type in typesof(/mob))
				if(a!=src.Owner)
					var/mob/m=a
					src.DoDamage(m)
					del src

obj/Projectiles
	layer=5
	density=0
	//glide_size=2
	var/Knockback
	var/Explosive
	var/Pierce
	var/Big
	var/Paralysis
	var/Deflectable=1
	var/Dodgeable=1
	var/Hadoken
	var/ExHadoken
	var/ShinkuHadoken
	var/GouHadoken
	var/Radius=0
	var/Cutting
	var/DragonFisted
	var/Slicing
	var/Mugetsu
	var/Pushing
	var/Gun
	var/Penetration
	var/RPenetration
	var/GunType
	var/GunBP
	var/Burning
	var/Poisoning
	var/Physical
	var/Goukakyuu
	var/Omega
	var/Holy
	var/Ultima
	var/MegaFlare
	var/Controllable
	var/SlicingW
	var/Divide
	var/Shotgun
	var/ShotgunHit=0
	var/LimitedHoming
	var/JechtShot
	var/SpiritGun
	var/WaterTrail
	var/BlackDragon
	var/Elemental
	var/ElemTriggered
	var/Lethality
	var/SuperExplosive
	var/VoidProj
	var/Sekiha
	var/Gilgamesh
	var/Heaven
	Distance=15 //Tiles before deletion.
	proc/Deflect(mob/P)
		flick("Attack",P)
		src.dir=pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST)
		walk(src,src.dir)
		spawn(80)if(src)del(src)

	Mystical
		Move()
			..()
			if(Gun)
				Offense*=0.97
			AttackDamage()
			if(Sekiha==2)
				var/obj/Effects/Sparkles/a=new
				a.x=src.x
				a.y=src.y
				a.z=src.z
		New()
			if(Big)
				Radius=1
			spawn(200)if(src&&!src.Gilgamesh)del(src)
			spawn src.AttackDamage()
			spawn src.SetPixels()
		Del()
			for(var/obj/Projectiles/P in get_step(src,turn(dir,180))) P.icon_state="struggle"
			..()
		proc/Beam_Graphics() while(src)
			spawn if(src) if(icon_state!="struggle")
				if(!(locate(/obj/Projectiles) in get_step(src,dir))) icon_state="head"
				else if(!(locate(/obj/Projectiles) in get_step(src,turn(dir,180)))) icon_state="end"
				else icon_state="tail"
//			for(var/mob/P in get_step(src,turn(dir,180))) del(src)
			sleep(1)
		proc/AttackDamage()
			if(!Owner)
				del(src)
			for(var/mob/P in view(Radius,src))
				if(P!=Owner)
					spawn()Bump(P)
				//return
			for(var/obj/O in view(Radius,src))
				if(O!=src&&O.Owner!=src.Owner&&src.Owner!=O)
					spawn()Bump(O)
					//return
			for(var/turf/T in view(Radius,src))
				if(T.density)
					spawn()Bump(T)
		proc/Damage(mob/P,Damage)
			if(P.LogiaDefense)
				var/Chance=(src.Owner.WillPower*20)
				if(!prob(Chance))
					//src.Owner.OMessage(10, "[src.Owner]'s attack failed to affect [P]!", "")
					return
			if(Gun)
				if(GunType=="Physical")
					var/PeneCalc=(Penetration/100*(P.Endurance*P.EnduranceMultiplier))
					Damage/=(P.Power*(P.Endurance*P.EnduranceMultiplier-PeneCalc))
				else if(GunType=="Energy")
					var/RPeneCalc=(RPenetration/100*(P.Resistance*P.ResistanceMultiplier))
					Damage/=(P.Power*(P.Resistance*P.ResistanceMultiplier-RPeneCalc))
				else if(GunType=="Ion")
					if(P.Race=="Android")
						var/RPeneCalc=((RPenetration*1.5)/100*(P.Resistance*P.ResistanceMultiplier))
						Damage/=(P.Power*(P.Resistance*P.ResistanceMultiplier-RPeneCalc))
					else
						var/RPeneCalc=(RPenetration/100*(P.Resistance*P.ResistanceMultiplier))
						Damage/=(P.Power*(P.Resistance*P.ResistanceMultiplier-RPeneCalc))
				if(Damage>10)
					Damage=10
			else
				Damage/=(P.Power*(P.Resistance*P.ResistanceMultiplier)*3)
//			Owner<< "You have inflicted [Damage]"
			if(Owner.Class=="Hades")
				Elemental="Fire"
			if(Elemental)
				if(Elemental=="Lightning")
					if(prob(95))
						P.Frozen=1
						P.ElecStunned=1
				else if(Elemental=="IceCoffin")
					P.overlays-='ice aura.dmi'
					P.Frozen=0
					P.IceCoffined=0
				else if(Elemental=="IceEncase")
					P.overlays+='ice aura.dmi'
					P.Frozen=1
					P.IceCoffined=1
				for(var/obj/Items/Armor/I in P)
					if(I.suffix&&I.EnchantType)
						ElemTriggered=1
						if(I.EnchantType=="Fire")//EnchantType is the -defender- here, Elemental is determined by the -attacker-.
							if(Elemental=="Wind")
								Damage*=0.8
							else if(Elemental=="Water")
								Damage*=1.2
								if(prob(35))
									P.Chilled=1.5
									spawn()P.Chilled_Check()
							else
								Damage*=1.0
								if(Elemental=="Fire")
									if(prob(5))
										P.Burning+=0.25
										if(P.Burning>2)
											P.Burning=2
										spawn()P.Burning_Check()
								else if(Elemental=="Earth")
									if(prob(20))
										P.EndBreak=1
										spawn()P.EnduranceBreak_Check()
						else if(I.EnchantType=="Water")
							if(Elemental=="Fire")
								Damage*=0.8
							else if(Elemental=="Earth")
								Damage*=1.2
								if(prob(30))
									P.EndBreak=1.5
									spawn()P.EnduranceBreak_Check()
							else
								Damage*=1.0
								if(Elemental=="Water")
									if(prob(25))
										P.Chilled=1
										spawn()P.Chilled_Check()
								else if(Elemental=="Wind")
									if(prob(1))
										P.ElecShock=1
										P.Frozen=1
										spawn()P.ElecShock_Check()
						else if(I.EnchantType=="Earth")
							if(Elemental=="Water")
								Damage*=0.8
							else if(Elemental=="Wind")
								Damage*=1.2
								if(prob(2))
									P.ElecShock=1
									P.Frozen=1
									spawn()P.ElecShock_Check()
							else
								Damage*=1.0
								if(Elemental=="Earth")
									if(prob(20))
										P.EndBreak=1
										spawn()P.EnduranceBreak_Check()
								else if(Elemental=="Fire")
									if(prob(5))
										P.Burning+=0.25
										spawn()P.Burning_Check()
						else if(I.EnchantType=="Wind")
							if(Elemental=="Earth")
								Damage*=0.8
							else if(Elemental=="Fire")
								Damage*=1.2
								if(prob(10))
									P.Burning+=0.25
									spawn()P.Burning_Check()
							else
								Damage*=1.0
								if(Elemental=="Wind")
									if(prob(1))
										P.ElecShock=1
										P.Frozen=1
										spawn()P.ElecShock_Check()
								else if(Elemental=="Water")
									if(prob(25))
										P.Chilled=1
										spawn()P.Chilled_Check()
						P.debuffactivate()
		/*	if(P.SpiralResistance)
			{
				Damage *= 0.65
			}*/
			if(P.DiplomaticImmunity)
				Damage*=0

			if(Owner.TimeHero)
				Owner.TimeHits++
				if(Owner.TimeHits>(10/(max(1, Owner.HeroLevel/2))))
					Owner.TimeHits=0
					Damage*=2//temporary fix
					//spawn time clone

			if(P.SpaceHero)
				P.SpaceHits++
				P.SpaceDamage+=Damage
				if(P.SpaceHits >= (7 - P.HeroLevel))
					P.Health+=(P.SpaceDamage/2)
					P.SpaceDamage=0
					P.SpaceHits=0
					if(P.Health > 100)
						P.Health=100

			if(Owner.BloodHero)
				if(Owner.BloodSport)
					Owner.Health+=(0.1*Owner.HeroLevel)*3
					Owner.Energy+=(0.1*Owner.EnergyMax*Owner.HeroLevel)*3
					if(Owner.Health > 100)
						Owner.Health = 100
					if(Owner.Energy>Owner.EnergyMax)
						Owner.Energy=Owner.EnergyMax
				else
					Owner.Health+=(0.1*Owner.HeroLevel)
					Owner.Energy+=(0.1*Owner.EnergyMax*Owner.HeroLevel)
					if(Owner.Health > 100)
						Owner.Health = 100
					if(Owner.Energy > Owner.EnergyMax)
						Owner.Energy=Owner.EnergyMax

			if(Owner.LightHero)
				var/roll1 = roll("1d6") * Owner.SpeedMod * Owner.SpeedMultiplier
				var/roll2 = roll("1d6") * P.SpeedMod * P.SpeedMultiplier
				Owner.LightLuck+=(roll1-roll2)*Owner.HeroLevel
				if(Owner.LightLuck > 200)
					Owner.LightLuck=200
				if(Owner.LightLuck < 50)
					Owner.LightLuck=50
			if(P.LightHero)
				var/roll1 = roll("1d6") * P.SpeedMod * P.SpeedMultiplier
				var/roll2 = roll("1d6") * Owner.SpeedMod * Owner.SpeedMultiplier
				P.LightLuck+=(roll1-roll2)*P.HeroLevel
				if(P.LightLuck > 200)
					P.LightLuck=200
				if(P.LightLuck < 50)
					P.LightLuck=50
			if(Owner.LightHero)
				Damage*=(Owner.LightLuck/100)

			if(Owner.VoidHero)
				var/roll1 = roll("1d6") * ((Owner.Endurance * Owner.EnduranceMultiplier)/2) * ((Owner.Resistance * Owner.ResistanceMultiplier)/2)
				var/roll2 = roll("1d6") * ((P.Endurance * P.EnduranceMultiplier)/2) * ((P.Resistance * P.ResistanceMultiplier)/2)
				Owner.VoidPain+=(roll1-roll2)*Owner.HeroLevel
				if(Owner.VoidPain > 200)
					Owner.VoidPain=200
				if(Owner.VoidPain < 50)
					Owner.VoidPain=50
			if(P.VoidHero)
				var/roll1 = roll("1d6") * ((P.Endurance * P.EnduranceMultiplier)/2) * ((P.Resistance * P.ResistanceMultiplier)/2)
				var/roll2 = roll("1d6") * ((Owner.Endurance * Owner.EnduranceMultiplier)/2) * ((Owner.Resistance * Owner.ResistanceMultiplier)/2)
				P.VoidPain+=(roll1-roll2)*P.HeroLevel
				if(P.VoidPain > 200)
					P.VoidPain=200
				if(P.VoidPain < 50)
					P.VoidPain=50
			if(P.VoidHero)
				Damage/=(P.VoidPain/100)

			if(Owner.MindHero)
				Owner.MindHits++

			if(Owner.HopeHero)
				Damage*=1+(((Owner.ControlPower/100)-1)/5*Owner.HeroLevel/3)

			if(Owner.DeathTolls)
				Damage*=3

			if(Owner.HopeHarpoon)
				Owner.ControlPower+=min(Damage*Owner.HeroLevel, 5)
				P.ControlPower-=min(Damage*Owner.HeroLevel, 5)

			if(P.DemonEnergyShield)
				P.Health+=(Damage*1.5)
				if(P.Health > 100)
					P.Health = 100
			if(P.ProtectShade)
				Damage=0
			if(P.RhoAias)
				Damage=0

			if(src.ExHadoken)
				Damage*=rand(2,4)
				if(Owner.AmatsukenAscension=="Chikara no Hado")
					P.Burning+=Damage/10
					if(prob(5))
						Owner.Health+=Damage
				if(Owner.AmatsukenAscension=="Satsui no Hado")
					Damage*=1.25

			if(src.ShinkuHadoken)
				Damage*=rand(3,5)
				if(Owner.AmatsukenAscension=="Chikara no Hado")
					P.Burning+=Damage/10
					if(prob(5))
						Owner.Health+=Damage
				if(Owner.AmatsukenAscension=="Satsui no Hado")
					Damage*=1.25

			if(src.Hadoken)
				if(Owner.AmatsukenPath=="Hadoken")
					Damage*=rand(1,3)
				if(Owner.AmatsukenPath=="Shoryuken")
					Damage*=0.9
				if(Owner.AmatsukenPath=="Tatsumaki")
					Damage*=0.75
				if(Owner.AmatsukenAscension=="Chikara no Hado")
					P.Burning+=Damage/10
					if(prob(5))
						Owner.Health+=Damage
				if(Owner.AmatsukenAscension=="Satsui no Hado")
					Damage*=1.25

			if(P.Health-Damage<=P.AngerThreshold&&!P.Anger&&!P.Mystic)
				P.Anger()
				Damage/=P.AngerMax
			if(P.Tutaminis)
				Damage*=0.9
			var/canHeal
			if(P.Health>20&&!P.WillHealed)
				canHeal=1
			if(P.WillTriggered)
				if(P.Willpower<3)
					Damage*=0.5
				else
					Damage*=0.2
			if(src.Owner.RipplePassive&&!P.Divine)
				if(P.IsEvil())
					Damage*=(src.Owner.RipplePassive+1)

			P.Health-=BlockDamage(P,Damage)

			if(src.Shotgun)
				P.Shotgunned+=1
				if(P.Shotgunned>2)
					Stun(P, 3)
					P.Shotgunned=0
				spawn(50)
					P.Shotgunned=0
			if(P.Willpower==5&&P.Health<=15&&!P.WillGER)
				P.OMessage(10, "[P] is on their last legs, but they're just getting started!", "[P]([P.key]) triggered Willpower 5.");
				P.WillGER=1
				P.GER=1
				spawn(150)
					P.GER=0
			if(P.Willpower>=4&&P.Health<=20)
				var/chance
				if(P.Willpower==4)
					chance=5
				if(P.Willpower==5)
					chance=10
				if(prob(chance))
					P.Comboz(src)
					P.AttackHardness=3
					P.HeavyShot=1
					P.Melee(1,1)
			if(P.Willpower&&!P.WillSpeed)
				if(P.Willpower>=4&&P.Health<=10)
					P.WillSpeed=1
				if(P.Willpower>=2&&P.Health<=5)
					P.WillSpeed=1
			if(P.Willpower&&!P.WillHealed&&canHeal&&P.Health<=20)
				P.WillHealed=1
				P.Health+=P.TotalInjury
			if(P.Willpower&&!P.WillTriggered)
				if(P.Willpower<3)
					P.OMessage(10, "[P] may be barely standing, but they keep pushing forward!", "[P]([P.key]) triggered Willpower.")
					P.WillTriggered=1
					P.Health=7
				else
					P.OMessage(10, "[P] is on their last legs...but they won't go down easily!", "[P]([P.key]) triggered Willpower.")
					P.WillTriggered=1
					P.Health=10

			if(P.MPRage)
				if(P.PowerUp)
					if(P.HasKeyblade("Light", 4)&&P.DiveWeapon=="Staff"||P.HasKeyblade("Semi-Divine", 4)||P.HasKeyblade("Divine", 4))
						if(P.ControlPower < 400)
							P.ControlPower+=Damage/2
						else
							P.HealEnergy(Damage/15*(P.EnergyMax/35))
						if(P.Energy>P.EnergyMax)
							P.Energy=P.EnergyMax
					else
						if(P.ControlPower < 300)
							P.ControlPower+=Damage/2
						else
							P.HealEnergy(Damage/20*(P.EnergyMax/50))
						if(P.Energy>P.EnergyMax)
							P.Energy=P.EnergyMax
				else
					if(P.HasKeyblade("Light", 4)&&P.DiveWeapon=="Staff"||P.HasKeyblade("Semi-Divine", 4)||P.HasKeyblade("Divine", 4))
						P.HealEnergy(Damage/5*(P.EnergyMax/20))
						if(P.Energy>P.EnergyMax)
							P.Energy=P.EnergyMax
					else
						P.HealEnergy(Damage/10*(P.EnergyMax/35))
						if(P.Energy>P.EnergyMax)
							P.Energy=P.EnergyMax

			if(Owner.RageHero)
				if(Owner.Anger>1)
					if(Owner.Anger < Owner.RageMax)
						Owner.Anger+=(0.02*(max(1, Owner.HeroLevel/2)))
						if(Owner.Anger > Owner.RageMax)
							Owner.Anger=Owner.RageMax
			if(P.RageHero)
				if(P.Anger>1)
					if(P.Anger < P.RageMax)
						P.Anger+=(0.02*(max(1, P.HeroLevel/2)))
						if(P.Anger > P.RageMax)
							P.Anger=P.RageMax

			if(P.HeartlessAngel)
				P.HeartlessAngel=0
			if(P.Amaterasu)
				P.Amaterasu=0
			if(P.SharinGen)
				P.SharinGen=0
			if(P.Health<=-1 && !Lethality)
				if(src.Cutting && P.Tail)
					P << "[P] had their tail cut off!"
					P.Tail=0
				if(src.Pierce && P.Tail)
					P << "[P] had their tail cut off!"
					P.Tail=0
			for(var/mob/F in view(1,P) && RecoilToggle)
				Damage/=(F.Power*(F.Resistance*F.ResistanceMultiplier))
				if(F.DiplomaticImmunity)
					Damage*=0
				F.Health-=Damage
				if(F.Health<=-2)
					if(F.KO) F.Death(Owner,null,Damage)
					else F.Unconscious(Owner)
			if(Lethality && P.Health<=-2)
				P.Death(Owner,null,Damage)
			if(Lethality && !P.MortallyWounded && P.KO)
				if(!P.MortallyWounded)
					Owner.OMessage(10,"[Owner] has mortally wounded [P].")
				P.Health=-1
				P.MortallyWounded=1
			if(P.Health<=0 &&!P.KO)
				P.Unconscious(Owner)

	//		else if(Knockback) P.Knockback(Knockback,Owner)
		proc/Damage_Formula()
			if(istype(Owner,/mob) && !Mugetsu && !Physical && !Gun && !Physical && !Sekiha)
				return global.ForceDamageMulti*Damage_Multiplier*Owner.Power*(Owner.Force*Owner.ForceMultiplier)
			else if(istype(Owner,/mob) && Mugetsu && !Physical && !Gun && !Physical && !Sekiha)
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
		Bump(mob/P)
			var/Damage=Damage_Formula()
//			debuglog << "DEBUG: Start Damage: [Damage]"
//			if(!isnum(Damage))world  << "DEBUG: GUN DAMAGE IS NOT A NUMBER> DA FUQ"
			if(ismob(P))
				P.HitBy["Attacked"]++
				Damage*=P.Shielded()
//				debuglog << "DEBUG: Sanity check 2 Damage: [Damage]"
				var/Accuracy=100

				if(Gun)
					var/GunOffense=((GunBP*Offense)/10)
					var/GunDefense=(P.Power*(P.Defense*P.DefenseMultiplier)) * ((P.SpeedMod*P.SpeedMultiplier)/10)
					var/GunTotalAccuracy=50*(GunOffense/max(GunDefense,0.01)) * 2
					if(GunTotalAccuracy>=100)
						GunTotalAccuracy=100
					Owner<< "Your total accuracy is [GunTotalAccuracy]%"
					if(prob(GunTotalAccuracy))
						Damage(P,Damage)
						if(src)del(src)
					else
						Deflect(P)
				else if(prob(Accuracy_Formula(Owner,P,Accuracy))&&!Gun||!Deflectable)
					if(!prob(Accuracy_Formula(Owner,P,10)) && !Big && Radius<1)
						Damage/=5
					if(Explosive)
						Explosion(src,Explosive,Damage*0.2,1)
					if(SuperExplosive)
						SExplosion(src,Explosive,Damage*0.1,1)
//					debuglog << "DEBUG: Sanity check 3 Damage: [Damage]"
					if(DragonFisted)
						P.Frozen=1
						P.DragonFisted=1
						var/YourDamage=(Owner.Power*(Owner.Strength*Owner.StrengthMultiplier)+(Owner.Force*Owner.ForceMultiplier))/2
						var/OpposingDefense=((P.Resistance*P.ResistanceMultiplier)+(P.Endurance*P.EnduranceMultiplier)*P.Power)/2
						P.Health-=(YourDamage/OpposingDefense)//*5
						var/Knock_Distance
					//	P.Fisted=1
					//	Explosion(P,Explosive,Damage*0.002,1)
						Knock_Distance=1
						P.Knockback(Knock_Distance,Owner)
					if(VoidProj)
						if(P.Health<=-50)
							P.client.SaveChar()
							P.Voided=1
							del P
					if(Slicing)
						if(P.type==type)
							del P
					if(Mugetsu)
						for(var/turf/A in Radius)
							Destroy(A,1000)
						//Damage*=(Owner.Strength*Owner.StrengthMultiplier)*1000
					if(Pushing)
						if(prob(25))
							P.Knockback(1,Owner)
					if(Poisoning)
						if(prob(25))
							P.Poison+=0.25
//							spawn(1)
//								P<<"Poison successful?"
//								P.Poisoned_Check()
//						spawn()P.Poisoned_Check()
//						spawn()P<<"Poison check 1 worked"
							P.debuffactivate()
//							P<<"Debuffs activated."
					if(Burning)
						if(prob(55))
							P.Burning+=0.75
//							spawn(1)
//								P<<"Poison successful?"
//								P.Poisoned_Check()
//						spawn()P.Poisoned_Check()
//						spawn()P<<"Poison check 1 worked"
							P.debuffactivate()
//							P<<"Debuffs activated.

					if(Goukakyuu)
						P.Knockback(1,Owner)
						for(var/turf/T in Turf_Circle(src,1))
							Sear(T)
						sleep(30)
						src.Pierce=0
						OExplosion(src,Explosive,Damage*3)

					if(Omega)
						P.Knockback(1,Owner)
						for(var/turf/T in Turf_Circle(src,1))
							Destroy(T,1000)
						sleep(30)
						src.Pierce=0
						OExplosion(src,Explosive,Damage*10)
					if(Ultima)
						for(var/turf/T in Turf_Circle(src,10))
							Destroy(T,1000)
						sleep(30)
						src.Pierce=0
						OExplosion(src,Explosive,Damage*20)
					if(Heaven)
						for(var/turf/T in Turf_Circle(src,3))
							Destroy(T,1000)
						sleep(30)
						src.Pierce=0
						OExplosion(src,Explosive,Damage*5)
					if(Gilgamesh)
						src.Pierce=0

					Damage(P,Damage)
					if(Elemental&&!ElemTriggered)
						if(Elemental=="Fire")
							if(prob(20))
								P.Burning+=0.25
//								spawn()P.Burning_Check()
						else if(Elemental=="Water")
							if(prob(35))
								P.Chilled=1
//								spawn()P.Chilled_Check()
						else if(Elemental=="Wind")
							if(prob(10))
								P.ElecShock=1
								P.Frozen=1
//								spawn()P.ElecShock_Check()
						else if(Elemental=="Earth")
							if(prob(35))
								P.EndBreak=1
//								spawn()P.EnduranceBreak_Check()
						else if(Elemental=="Poison")
							if(prob(20))
								P.Poison+=0.25
//								P<<"Beginning Poison check."
//								spawn(1)
//									P<<"Poison successful?"
//									P.Poisoned_Check()
						P.debuffactivate()
//						P<<"Debuffs activated."
					if(P.IceCoffined)
						var/maxblasts=50//sqrt(Z.Level)*sqrt(Z.Level)
						var/blasts
						while(blasts<maxblasts)
							blasts++
							flick("Blast",src)
							var/obj/Projectiles/Mystical/A=new(locate(min(max(P.x+rand(-3,3),1),500),min(max(P.y+rand(-3,3),1),500),P.z))
							A.Distance=100
							A.dir=rand(1,8)
							A.Explosive=1
							A.icon='IceBurst.dmi'
//							A.icon_state=Z.sicon_state
							A.Owner=Owner
							A.Lethality=Owner.Lethal
							A.Damage_Multiplier=10
							A.Offense=(Owner.Offense*Owner.OffenseMultiplier)*Owner.Skill*9001
							A.Elemental="IceCoffin"
							if(!(A in view(20,src)))
								spawn del(A)
								continue
							spawn(1) Homing(A,P)
						//	spawn(20) if(A) spawn()Homing(A,P)
							if(prob(50))sleep(0.1)
							else if(prob(20))sleep(1)
					if(!src.Pierce)
						if(src)del(src)
				/*	if(src.Pushing)
						sleep(100)
						if(src)del(src)*/
					spawn()P.debuffactivate()
					//spawn()P<<"Debuffs activated."
				else Deflect(P)
			else
				if(P&&src)
					if(P.type==type)
						if(P.dir!=dir)
							Distance=10 //Renew its distance so it doesn't delete mid-struggle.
							if(Owner)
								if(Damage<(P.Damage_Multiplier*P.Owner.Power*(P.Owner.Force*P.Owner.ForceMultiplier)))
									del(src)
							else
								del(src)
					else
						var/delete=0
						if(isobj(P)||isturf(P))
							if(istype(P,/obj/Items/Tech/SpaceTravel))
								if(GunType=="Physical")
									P.Health-=(Damage/(P:Endurance+1))
								else if(GunType=="Energy")
									P.Health-=(Damage/(P:Resistance+1))
								else
									P.Health-=(Damage/P:Resistance+1)
							else
								P.Health-=(Damage/(P.LogPEndurance+1))
							if(!src.Pierce)
								if(P.density)
									delete=1
							if(P.Health<=0)
								if(Explosive&&P.density)
									Explosion(src,Explosive,Damage*0.2)
								if(SuperExplosive&&P.density)
									SExplosion(src,Explosive,Damage*0.4)
//								Destroyer=Owner.ckey
//								if(Owner)
//									global.GlobalTurfDestroyer=Owner.ckey
								Destroy(P,P.Damage_Multiplier)
							//if(P)
							//	if(src)del(src)
							if(delete)
								del(src)

	Move()
		if(Distance<=0) del(src)
		Distance-=1
		if(Divide)
			for(var/turf/M in Turf_Circle(src,1))
				Destroy(M, 9001)
				/*var/TurfDamager=rand(10000000,50000000)
				M.Health-=TurfDamager/(M.LogPEndurance+1)
				if(M.Health<1)
					Destroy(M,9001)*/
		if(LimitedHoming||src.Shotgun)
			if(src.LimitedHoming)
				LimitedHoming--
			if(src.Owner.Target)
				src.dir=get_dir(src, src.Owner.Target)
		if(SpiritGun)
			Damage_Multiplier-=2
		if(JechtShot)
			Damage_Multiplier+=1*(50/Distance)
			if(Distance<=50)
				Radius=1
				SuperExplosive=1
		if(SuperExplosive)
			spawn(50)SExplosion(src,Explosive,Damage_Multiplier/5)
			spawn(50)del(src)
		if(WaterTrail)
			for(var/turf/M in Turf_Circle(src,0))
				ReplaceWater(M)
		..()
mob/proc/UnlimitedJumpyWorks(obj/Skills/Attacks/B,var/mob/Choice)
	while(B.Using)
		if(src.Health<=5||Choice.KO||src.Energy<=src.EnergyMax*0.05)
			Choice.x=Choice.PrevX
			Choice.y=Choice.PrevY
			Choice.z=Choice.PrevZ
			Choice.PrevX=null
			Choice.PrevY=null
			Choice.PrevZ=null
			src.x=src.PrevX
			src.y=src.PrevY
			src.z=src.PrevZ
			src.PrevX=null
			src.PrevY=null
			src.PrevZ=null
			B.Using=0
		sleep(10)

mob/proc/UnlimitedBladeWorks(obj/Skills/Attacks/B,var/mob/Target)
	while(B.Using&&!src.PureRPMode)
		var/obj/Projectiles/Mystical/A=new(locate(min(max(Target.x+rand(-30,30),1),500),min(max(Target.y+rand(-30,30),1),500),Target.z))
		A.Distance=Distance
		A.Explosive=1
//		A.Knockback=1
		A.dir=rand(1,8)
		A.icon=B.sicon
		A.icon_state=pick("1","2","3","4","5","6","7","8")
		A.Owner=src
		A.Physical=1
		A.Lethality=src.Lethal
		A.Damage_Multiplier=1.5
		A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*45
//		A.Elemental=Element
		if(!(A in view(20,src)))
			spawn del(A)
			continue
		spawn(5) if(A) spawn()Homing(A,Target)
		if(prob(50))sleep(10)
		else if(prob(20))sleep(1)
	/*	if(src.Health<=5||Target.KO||src.Energy<=src.EnergyMax*0.05)
			for(var/turf/T in Turf_Circle(src,150))
				for(var/mob/M in view(0,T))
					src.OMessage(150, "[src]'s reality marble crumbles before your very eyes, returning you to your previous location...", "[src]([src.key]) deactivated Unlimited Blade Works.");
					sleep(30)
					src.loc = locate(src.PrevX, src.PrevY, src.PrevZ)
					M.loc = locate(M.PrevX, M.PrevY, M.PrevZ)
					src.PrevX=null
					src.PrevY=null
					src.PrevZ=null
					M.PrevX=null
					M.PrevY=null
					M.PrevZ=null
					src.InUBW=0
			B.Using=0*/
		sleep(10)

mob/proc/Meteor_Shower(obj/Skills/Attacks/A)
	var/ManaDrain=1
	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
	src.Chargez("Add")
	while(A.Using)
		if(src.ManaAmount<=5)
			A.Using=0
			src<<"Your Mana has been mostly depleted, and the spell ends..."
		var/L=100
		if(L>A.Distance)
			L=A.Distance
		if(L<1)
			L=1
		var/Drain=5/A.Efficiency
		Energy-=(Drain)*(A.Charging*A.Power)
		if(prob(50))
			src.ManaAmount-=rand(1,3)/ManaDrain
		var/obj/Projectiles/Mystical/B=new
		B.Explosive=1
		B.Damage_Multiplier=3
		B.Offense=Offense*OffenseMultiplier
		B.Distance=L
		B.Owner=src
		B.icon=A.sicon
		B.icon_state="DB"
		B.pixel_x=A.pixel_x
		B.pixel_y=A.pixel_y
		B.dir=SOUTH
	//	var/M=rand(1,20)
	//	B.loc=//get_step(rand(1,10),SOUTH)
		B.x=src.x+rand(-15,15)
		B.y=src.y+rand(-15,15)
		B.z=src.z
		B.layer+=1
		B.animate_movement=0
		B.Deflectable=0
		B.Dodgeable=1
		B.Radius=1
		walk(B,SOUTH,0.1)
		//spawn if(B) B.Beam_Damage()
		spawn(round(10/A.Speed)) if(B)
			B.layer-=1
			B.Beam_Graphics()
		if(!usr.CanBlast(Drain)) Beam_Stop(A)
		sleep(5)
mob/proc/Beam_Charge(obj/Skills/Attacks/A)
	src.Attacking=1
	A.Charging=0.1
	if(A.GouHadoken)
		spawn()Quake(10)
	src.Chargez("Add")
	var/chargenum=0
	while(A.Charging)
		if(A.Mighty == 1)
			A.Level = 1000
			spawn()DarknessFlash(src)
			spawn()for(var/turf/e in range(20,src))
				if(prob(60))continue
				if(prob(1))spawn()new/obj/Effects/Lightning(e)
		src.Beaming=1
		if(src.UltraInstinct)
			src.Beaming=0
		A.Charging+=A.ChargeRate/50
		if(chargenum<(round(A.Charging)))
			chargenum=round(A.Charging)
			src.NumShow(A.Charging,"Charge")
		sleep(10)


mob/proc/Beam_Go(obj/Skills/Attacks/A,var/Z)
	src.usingfinalflash = 0
	src.Chargez("Remove")
	var/Charged=A.Charging
	var/tgt=src.Target
	A.Charging=0
	Attacking=1
	icon_state="Blast"
	A.BeamUsing=1
	if(1==1)
		while(A.BeamUsing)
			src.Energy -= (src.EnergyMax/1000) / A.Efficiency
			EXP+=(EXPGains/100)*0.00007
			var/L=A.Distance*(A.Level/100)
			if(L>A.Distance)
				L=A.Distance
			if(L<1)
				L=1
			var/Drain=5/A.Efficiency
			if(A.GouHadoken)
				A:LastUse=world.realtime
			if(A.MegaFlare||A.GouHadoken)
				spawn()DarknessFlash(src)
				spawn()for(var/turf/e in range(20,src))
					if(prob(60))continue
					if(prob(0.1))spawn()new/obj/Effects/Lightning(e)
				if(A.GouHadoken)
					spawn()src.Quake(50)
			if(A.BlackDragon)
				if(prob(30))
					Health-=rand(0.1,1)
			if(!A.BlackDragon)
				if(prob(30))
					Energy-=(Drain)*(A.Charging*A.Power)
			if(A.Magic)
				src.ManaAmount-=rand(1,3)
			if(src.UltraInstinct)
				src.dir=ReturnDirection(tgt,src)//to face the enemy
			A.Skill_Increase((1/A.Speed)/3)
			Beaming=1
			var/obj/Projectiles/Mystical/B=new
			if(A.MegaFlare)
				B.MegaFlare=1
			B.DragonFisted=A.DragonFist
			B.Damage_Multiplier=A.Power*Charged
			B.Offense=(Offense*OffenseMultiplier)*(Skill/50)
			B.Distance=L
			B.Owner=src
			B.Lethality=src.Lethal
			B.icon=A.sicon
			B.Pushing=A.Pushing
			B.pixel_x=A.pixel_x
			B.pixel_y=A.pixel_y
			B.density=0
			B.dir=dir
			B.Cutting=A.Pierce
			B.loc=get_step(src,dir)
			B.layer+=1
			B.animate_movement=0
			B.icon_state="origin"
			B.Deflectable=1
			B.Dodgeable=1
			B.Elemental=A.Element
			for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix&&!B.Elemental)
				B.Elemental=N.Element
			if(A.Big)
				B.Radius=1
			walk(B,dir,round(10/A.Speed))
			//spawn if(B) B.Beam_Damage()
			spawn(round(10/A.Speed)) if(B)
				B.layer-=1
				B.Beam_Graphics()
			if(!usr.CanBlast(Drain)) Beam_Stop(A)
			sleep(round(10/A.Speed))
		//	var/mob/M=usr.Target
			if(A.BlackDragon)
				B.BlackDragon=1
			if(A.DragonFist)
				spawn(50)
					src.Beam_Stop(A)
					src.Energy-=src.EnergyMax/2
			if(A.MegaFlare)
				spawn(100)
					src.Beam_Stop(A)
					src.Health=-50
			if(A.GouHadoken)
				spawn(100)
					src.Beam_Stop(A)
mob/proc/Beam_Stop(obj/Skills/Attacks/A)
	A.BeamUsing=0
	Attacking=0
	Beaming=0
	UsingFist=0
	if(A.Big)
		src.TotalFatigue+=10
	if(icon_state=="Blast")
		if(Flying) icon_state="Flight"
		else icon_state=""



proc/Explosion(var/obj/Projectiles/Mystical/Origin,Range,Damage,var/buh=0)
	for(var/turf/A in oview(Origin,Range))
		if(!buh)
			A.Health-=Damage
			if(A.Health<=0) Destroy(A,5)
		for(var/mob/P in A)
	//		if(!Origin)break
			Origin.Damage(P,Damage/2)
		for(var/obj/P in A)
			if(P!=Origin)
				P.Health-=Damage
				if(P.Health<=0) Destroy(P,5)
		A.CreateExplosion()
proc/OExplosion(var/obj/Projectiles/Mystical/Origin,Range,Damage,var/buh=0)
//	var/icon/E=icon('Effects.dmi',"Shock")
	for(var/turf/A in oview(Origin,8))
		if(!buh)
			A.Health-=Damage
			if(A.Health<=0) Destroy(A,5)
		for(var/mob/P in A)
	//		if(!Origin)break
			Origin.Damage(P,Damage/2)
		for(var/obj/P in A)
			if(P!=Origin)
				P.Health-=Damage
				if(P.Health<=0) Destroy(P,5)
		A.CreateExplosion()
		for(var/mob/Players/T in view(200))
			spawn()T.Quake(50)
			LightningFlash(Origin)
proc/SExplosion(var/obj/Projectiles/Mystical/Origin,Range,Damage,var/buh=0)
//	var/icon/E=icon('Effects.dmi',"Shock")
	for(var/turf/A in oview(Origin,2))
		if(!buh)
			A.Health-=Damage
			if(A.Health<=0) Destroy(A,5)
		for(var/mob/P in A)
	//		if(!Origin)break
			Origin.Damage(P,Damage/2)
		for(var/obj/P in A)
			if(P!=Origin)
				P.Health-=Damage
				if(P.Health<=0) Destroy(P,5)
		A.CreateExplosion()
		for(var/mob/Players/T in view(30))
			spawn()T.Quake(10)
			LightningFlash(Origin)