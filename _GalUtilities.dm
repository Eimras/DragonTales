



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



obj/Skills/saiyan
	drive
	fortitude
	power


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
