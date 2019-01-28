obj/Effects
	layer=EFFECTS_LAYER
	Grabbable=0
	Stun
		icon='Stun.dmi'
	fevLightningStrike
		icon='Lightning2.dmi'
		pixel_x=-16
		proc
			Strike()
				flick("Strike",src)
				spawn(3)
					KenShockwave(src,Size=0.5)
				spawn(5)
					KenShockwave(src,Size=3)
				spawn(5.5)
					del src

proc
	LightningStrike(mob/m)
		m.Quake(10)
		var/obj/Effects/fevLightningStrike/S = new
		S.loc=m.loc
		sleep(1)
		S.Strike()