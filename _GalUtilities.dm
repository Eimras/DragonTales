



proc/GetRealDamage(var/damage)


mob/proc/GetTruePower() //Returns a player's true power for calculation's sake.
mob/proc/GetFalsePower() //Returns a visual of a player's power.




mob/var/god_ki = 0 //God Ki currently active.
mob/var/god_ticks = 0 //Potency of a person's God Ki.

mob/var/list/passives = list()
mob/var/tmp/list/tmp_passives = list()


mob/proc/GetPassive(passive)
	return (passives[passive] ? passives[passive] : 0) + (tmp_passives[passive] ? tmp_passives[passive] : 0)
	// "adrenaline" ignores combat slow.
	// "striker" increases attack speed with power up.
mob/proc/GrantTempPassive(passive, value)
	if(tmp_passives[passive]) tmp_passives[passive] += value
	else tmp_passives[passive] = value
mob/proc/GrantPassive(passive, value)
	if(passives[passive]) passives[passive] += value
	else passives[passive] = value





//This shit only works for ayylmaos rn.
mob/var/trans_flavor = list("1active" = "transforms.","1revert" = "reverts.","1hair","1base","1aura","1overlay",\
	"2active" = "transforms.","2revert" = "reverts.","2hair","2base","2aura","2overlay",\
	"3active" = "transforms.","3revert" = "reverts.","3hair","3base","3aura","3overlay",)
mob/var/trans_saved = list("hair","base","aura")

mob/verb/CustomizeFormIcons()
	var customize = input("Which?") in trans_flavor | null
	if(customize)
		if(findtext(customize, "active") || findtext(customize, "revert"))
			trans_flavor[customize] = input("[customize] text","[customize]",trans_flavor[customize])
		else
			var/icon/ico = input("Icon?") as icon | null
			if(!ico) return
			var/state = input("Icon State?") as text | null
			var px = input("Pixel X?") as num
			var py = input("Pixel Y?") as num
			trans_flavor[customize] = image(ico, state, pixel_x = px, pixel_y = py)

mob/proc/CustomizedTrans(var/level,var/restrictions = list())
	Hairz("Remove")
	Hairz("Add")
	Auraz("Remove")
	Auraz("Add")
	overlays -= trans_flavor["1overlay"]
	overlays -= trans_flavor["2overlay"]
	overlays -= trans_flavor["3overlay"]
	switch(level)
		if(1)
			trans_saved["base"] = src.icon
			if(trans_flavor["1base"]) icon = trans_flavor["1base"]
			overlays += trans_flavor["1overlay"]
		if(2)
			if(trans_flavor["2base"]) icon = trans_flavor["2base"]
			overlays += trans_flavor["2overlay"]
		if(3)
			if(trans_flavor["3base"]) icon = trans_flavor["3base"]
			overlays += trans_flavor["3overlay"]

	viewers(src) << "[trans_flavor["[level]active"]]"

mob/proc/CustomizedRevert(var/level,var/restrictions = list())
	Auraz("Remove")
	Auraz("Add")
	Hairz("Remove")
	Hairz("Add")
	overlays -= trans_flavor["1overlay"]
	overlays -= trans_flavor["2overlay"]
	overlays -= trans_flavor["3overlay"]
	switch(level)
		if(1)
			src.icon = trans_saved["base"]
		if(2)
			if(trans_flavor["1base"]) icon = trans_flavor["1base"]
			overlays += trans_flavor["1overlay"]
		if(3)
			if(trans_flavor["2base"]) icon = trans_flavor["2base"]
			overlays += trans_flavor["2overlay"]
	viewers(src) << "[trans_flavor["[level]revert"]]"



obj/Skills/saiyan
	drive //Grants an instant burst of PU. Scales with ascension level.
		Cooldown=25
		verb/Saiyan_Drive()
			set name = "Saiyan Drive"
			set category="Skills"
			usr.SkillGX("SaiyanDrive", src)

	fortitude
		Cooldown=220
		verb/Saiyan_Fortitude()
			set name = "Saiyan Fortitude"
			set category="Skills"
			usr.SkillGX("SaiyanFortitude", src)
	power
		Cooldown=220
		verb/Saiyan_Might()
			set name = "Saiyan Might"
			set category="Skills"



mob/proc/SkillGX(var/Wut,var/obj/Skills/Z,var/bypass=0) //A-I
	if(Z)
		if(!locate(Z) in src)
			return

		if(Z.Using) return
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
			if("SaiyanDrive")
				var level = min(3, 1 * (AscensionsAcquired*0.5)) //Strengthened by zenkai.
				if(100 > ControlPower)
					src << "You must be over 100% power to use this."
					return
				Energy -= (EnergyMax * 0.05)
				ControlPower += 10 * level
				Earthquake(6,-2,2,-2,2)
				src.OMessage(30,"[src] roars as their power rises!","<font color=red>[src]([src.key]) used Saiyan Drive.")

				if(!src.PowerUp) src.SkillX("PowerUp",src)
				Z.Cooldown()
			if("SaiyanFortitude")
				GrantTempPassive("saiyan fortitude", 3 + AscensionsAcquired)
				src.OMessage(30,"[src] fortifies their stance!","<font color=red>[src]([src.key]) used Saiyan Fortitude.")
				spawn(100 + (AscensionsAcquired*10))
					tmp_passives -= "saiyan fortitude"
					viewers(src) << "[src] fortification falls apart."
				Z.Cooldown()
			if("SaiyanMight")
				GrantTempPassive("saiyan might", min(3, 2 + (AscensionsAcquired * 0.25)) )
				src.OMessage(30,"[src] unleashes their overwhelming might!","<font color=red>[src]([src.key]) used Saiyan Might.")

				spawn(100)
					viewers(src) << "[src] relaxes their power."
					tmp_passives -= "saiyan might"
				Z.Cooldown()
			if("Overpower")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Grab) return
				if(src.Meditating) return
				if(src.Digging) return
				if(src.TimeFrozen)return
				if(src.ShadowBound)return
				if(src.Flying) return
				if(src.Clothesline) return
				var/DistanceZ=2
				var/Ready=0

				var using_sword = 0
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						using_sword = 1
						break
				if(src.Energy>EnergyMax/8)
					Z.Cooldown()
					Z.Using=1
					src.Frozen=1

					for(var/mob/S in view(src,12))
						S<<sound('KunaiMod/Sounds/nanayaspecial.ogg')
					src.OMessage(10,"[src] lunges forth, attempting to overpower their opponent!","<font color=red>[src]([src.key]) used Overpower.")
					for(var/mob/S in view(src,12))
						S<<sound('KunaiMod/Sounds/nanayasensou.ogg')
					while(DistanceZ>0)
						AfterImage(src)
						step(src,src.dir)
						DistanceZ-=1
						for(var/mob/P in view(src,1))
							if(P!=src)
								Stun(P,4)
								DistanceZ=0
								Ready=1
						sleep(1.25)
						if(DistanceZ==0&&Ready==1)
							var/Slashes=10
							while(Slashes>0)
								for(var/mob/U in view(src,1))
									if(U!=src)
										Stun(U,1)
										if(using_sword)
											Slash(U)
										else
											HitEffect(U)
										var/Damage=src.StrVsEnd(U,rand(0.5,2))
										DoDamage(U, Damage)
										for(var/mob/S in view(src,12))
											if(using_sword)
												S<<sound('KunaiMod/Sounds/daggerhit.ogg', volume=35)
											else
												if(prob(50))
													S<<sound('KunaiMod/Sounds/hit1.ogg')
												else
													S<<sound('KunaiMod/Sounds/taphit.ogg')

									Slashes-=1
								for(var/mob/S in view(src,12))
									if(using_sword)
										S<<sound('KunaiMod/Sounds/daggerswung.ogg')
									else
										if(prob(50))
											S<<sound('KunaiMod/Sounds/hit1.ogg')
										else
											S<<sound('KunaiMod/Sounds/taphit.ogg')

								sleep(1.75)
								if(DistanceZ<=0&&Slashes<=0)
									src.OMessage(10, "[src] overpowers their opponent with gargantuan might!", "[src]([src.key]) finished Overpower.")
									for(var/mob/YE in view(src,1))
										if(using_sword)
											Slash(YE)
										else
											HitEffect(YE)
										var/Damage=src.StrVsEnd(YE,4)
										if(Health > YE.Health)
											var damage_mult = 1 + (1 - (YE.Health/Health))
											Damage *= damage_mult

							//		spawn()new/obj/Tipper(src)


									for(var/mob/S in view(src,12))
										if(using_sword)
											S<<sound('KunaiMod/Sounds/daggerswing.ogg')
										else
											S<<sound('KunaiMod/Sounds/taphitstrong.ogg')
										S<<sound('KunaiMod/Sounds/impact1.ogg')
									src.Frozen=0
									src.Using=0
						else if(DistanceZ<=0&&Ready==0)
							src.Frozen=0
							src.Using=0
