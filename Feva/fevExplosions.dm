
obj/Effects
	fevExplosion
		icon='fevExplosion.dmi'
		pixel_x=-32
		pixel_y=-32
		layer=EFFECTS_LAYER+0.1
		var
			ExploBoss
			Life=20
			Owner_Immunity=0
		New()
			spawn(1)
				animate(src,alpha=0,time=8)
				spawn(8)
					del src
proc
	ForceDamage(mob/A,mob/P,DamageMulti=1)//Just going to use this for Explosion
		var/Damage=DamageMulti*A.Power*(A.Force*A.ForceMultiplier)
		Damage/=(P.Power*(P.Resistance*P.ResistanceMultiplier)*3)
		P.Health-=Damage
//		if(A.WoundIntent)
		Injure(P,Damage)
		//world<<"[P] took [Damage] EXPLOSION damage! ow!"
		if(A.Lethal && P.Health<=-2)
			P.Death(A,null,Damage)
		if(A.Lethal && !P.MortallyWounded && P.KO)
			if(!P.MortallyWounded)
				A.OMessage(10,"[A] has mortally wounded [P].")
			P.Health=-1
			P.MortallyWounded=1
		if(P.Health<=0 &&!P.KO)
			P.Unconscious(A)

	fevExplosion(atom/movable/Creator,atom/movable/M,Size=1,Power=0.25,Owner_Immunity=0)
		var/obj/Effects/fevExplosion/S=new
		var/icon/X = new(S.icon)
		var
			PixX=0
			PixY=0
		X.Scale(X.Width()*1,X.Height()*1)
		S.icon=X
		if(istype(M,/obj/Projectiles/fevProjectile))
			PixX=M.pixel_x
			PixY=M.pixel_y
		KenShockwave(M,Size=Size,Pixel_X=PixX,Pixel_Y=PixY)
		var/Explo=16+(12*Size*Size)

		for(var/mob/m in bounds(M,round(Explo*0.85)))
			ForceDamage(Creator,m,DamageMulti=Power)
		while(Explo)
			Explo--
			var/obj/Effects/fevExplosion/S2=new


			S2.loc=M.loc
			S2.icon=S.icon
			S2.Owner=Creator
			S2.Owner_Immunity=Owner_Immunity
			S2.pixel_x+=rand(-32,32)*Size +PixX
			S2.pixel_y+=rand(-32,32)*Size +PixY

		////	S2.pixel_x=-(X.Height()/2)+16
			//S2.pixel_y=-(X.Height()/2)+16
