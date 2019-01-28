
obj/Skills/Feva
	Beam
		var
			State="IDLE"

			Charge=1
			Charge_Speed=1
			Projectile
			Beam_Time=50
			Can_Charge=1
			Immediate_Firing=0
			Amount=1
			Full_Salvo=0//If set to 1, fires every projectile at once
			WindUp=0

		verb
			BeamSettings()
				set category="Other"
				if(Can_Charge)
					var/X=input(usr,"Do you want your beams to fire instantly?") in list("Yes","No")
					if(X=="Yes")
						Immediate_Firing=1
					else
						Immediate_Firing=0

		NormalBeam
			Cooldown=30
			Charge_Speed=1
			Projectile=/obj/Projectiles/fevProjectile/Beam
			verb/fNormalBeam()
				set name="Beam"
				set category="Skills"
				Beam(usr)

		DeathBeam
			Cooldown=45
			Can_Charge=0
			Projectile=/obj/Projectiles/fevProjectile/Beam/DeathBeam
			Immediate_Firing=1
			Charge=1
			Amount=1
			Beam_Time=1
			WindUp=5
			sicon='Beam8.dmi'
			verb/fPiercer()
				set name="DeathBeam"
				set category="Skills"
				Beam(usr)
		DeathBeamBarrage
			Cooldown=120
			Can_Charge=0
			Projectile=/obj/Projectiles/fevProjectile/Beam/DeathBeam
			Immediate_Firing=1
			Charge=1
			Amount=7
			Beam_Time=1
			WindUp=5
			sicon='Beam8.dmi'
			verb/fPiercer()
				set name="DeathBeamBarrage"
				set category="Skills"
				Beam(usr)
		BusterBarrage
			Cooldown=120
			Can_Charge=0
			Projectile=/obj/Projectiles/fevProjectile/BusterBarrage
			Immediate_Firing=1
			Charge=1
			Amount=14
			Beam_Time=1
			WindUp=5
			sicon='fevMakosen.dmi'
			verb/fPiercer()
				set name="Buster Barrage"
				set category="Skills"
				Beam(usr)
		Hadouken
			Cooldown=120
			Can_Charge=0
			Projectile=/obj/Projectiles/fevProjectile/Hadouken
			Immediate_Firing=1
			Charge=1
			Amount=14
			Beam_Time=1
			WindUp=5
			sicon='fevMakosen.dmi'
			verb/fPiercer()
				set name="Makosen"
				set category="Skills"
				Beam(usr)
		HellzoneGrenade
			Cooldown=120
			Can_Charge=0
			Projectile=/obj/Projectiles/fevProjectile/HellzoneGrenade
			Immediate_Firing=1
			Charge=1
			Amount=16
			Beam_Time=1
			WindUp=5
			Full_Salvo=1
			sicon='fevHomingFinisher.dmi'
			verb/fPiercer()
				set name="Hellzone Grenade"
				set category="Skills"
				if(!usr.Target)return
				Beam(usr)








		proc/Beam(mob/m)//All Beams call this procedure
			if(m.KO)return
			if(src.Using)
				return
			var/Drain=5/src.Efficiency
			if(!m.CanBlast(Drain)) return

			if(State=="IDLE"&&!m.Beaming&&Immediate_Firing==0&&Can_Charge)
				State="Charging"
				//world<<"Chagin ma lazr"
				Charge=1
				m.Beaming=1
				m.Chargez("Add")
				while(State=="Charging")
					sleep(1)
					Charge=round(Charge,0.01)
					//world<<"[m] chargin [Charge]"
					if(Charge==round(Charge))
						m.NumShow(Charge,"Charge")

					Charge+=0.01*Charge_Speed
			else if(State=="Charging"&&m.Beaming==1||State=="IDLE"&&!m.Beaming&&Immediate_Firing==1)
				m.Chargez("Remove")
				//world<<"Gonna beam"
				if(WindUp)
				//	world<<"Winding up"
					m.Beaming=1
					m.Chargez("Add")
					sleep(WindUp)
					m.Chargez("Remove")
					Amount=initial(Amount)
				State="Beaming"
				m.Beaming=2
				BeamStart
				var/Pix=0
				if(Amount>1)
					Pix=rand(-16,16)
				else
					Pix=0
				Beam_Time=initial(Beam_Time)
				if(Full_Salvo)
					while(Beam_Time>0&&State=="Beaming"&&m.Beaming)
						flick("Blast",m)
						Beam_Time--
						Create_Projectile(m,Projectile,Damage=(Charge),Icon=sicon,SkillSource=src,Pixel=Pix,Static=1)
					if(Amount)
						Amount--
						goto BeamStart
				else
					while(Beam_Time>0&&State=="Beaming"&&m.Beaming)
						sleep(1)
						flick("Blast",m)
						Beam_Time--
						Create_Projectile(m,Projectile,Damage=(Charge),Icon=sicon,SkillSource=src,Pixel=Pix,Static=1)
					if(Amount)
						Amount--
						goto BeamStart
				State="IDLE"
				m.Beaming=0
				src.Cooldown();
			else if(m.Beaming==2&&State=="Beaming")
				m.Beaming=0
				State="IDLE"