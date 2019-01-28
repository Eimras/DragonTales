proc
	SonicSway(mob/A,mob/B)
		var
			BaseX=A.pixel_x
			BaseY=A.pixel_y
			Dodges=7
		BlockStop(A)
		while(Dodges>0)
			A.SonicSway=0.1
			A.Frozen=1
			Stun(B,1)
			A.dir=get_dir(A,B)
			B.dir=get_dir(B,A)
			Dodges--
			animate(A,pixel_x=BaseX+rand(-8,8),pixel_y=BaseY+rand(-8,8),time=1)
			flick('Dodge.dmi',A)
			flick("Attack",B)
			sleep(2)
			AfterImage(A)
			animate(A,pixel_x=BaseX,pixel_y=BaseY,time=1)
			flick('Dodge.dmi',A)
		A.SonicSway=0
		B.Stunned=1
		StunCheck(B)
		A.Frozen=0
		B.Energy-=B.EnergyMax*0.05

		A.AttackHardness=2
		A.HeavyShot=1
		A.Melee()