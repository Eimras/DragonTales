mob
	var

		griddisplay="stats"




mob/proc
	GridStat()
		if(!src.client)return
		var/list/lol=list("butt1","butt2","butt3","butt4")
		for(var/x in lol)
			winshow(src,x,1)

		while(src)
			if(!src.client)return

			switch(src.griddisplay)
				if("Inventory")
					var/Stats = 0
					Stats++
					src.GridStatPlacement("-Inventory-",null,Stats)
					for(var/obj/x in usr.contents)
						Stats++

						winset(src,"gridstatx","current-cell=1x[Stats]")
						src << output(x,"gridstatx")
						winset(src,"gridstatx","current-cell=2x[Stats]")
						src << output(x.suffix,"gridstatx")
						//src.GridStatPlacement(x],"[x.suffix]",Stats)

					winset(src,"gridstatx","cells=2x[Stats]")

				if("Stats")
					var/Stats = 0
					Stats++
					src.GridStatPlacement("-Statistics-",null,Stats)
					Stats++
					src.GridStatPlacement("Race:","[src.Race]",Stats)
					Stats++
					src.GridStatPlacement("Birth:","[src.Spawn]",Stats)
					Stats++
					src.GridStatPlacement("Current Power:","[src.Power]",Stats)
					Stats++
					src.GridStatPlacement("Potential Power:","[src.Base]([src.BaseMod])",Stats)


/*				stat("Energy","[Commas(round(Energy))]")
				stat("Strength","[Commas(round(Strength*StrengthMultiplier))]")
				stat("Endurance","[Commas(round(Endurance*EnduranceMultiplier))]")
				stat("Force","[Commas(round(Force*ForceMultiplier))]")
				stat("Resistance","[Commas(round(Resistance*ResistanceMultiplier))]")
				stat("Offense","[Commas(round(Offense*OffenseMultiplier))]")
				stat("Defense","[Commas(round(Defense*DefenseMultiplier))]")
				stat("Speed","[Commas(round(SpeedMod*SpeedMultiplier))]")
				stat("Regeneration","[Regeneration*RegenerationMultiplier]")
				stat("Recovery","[Recovery*RecoveryMultiplier]")
				stat("Base BP","[Commas(round(src.Base))]")
				stat("Gain Multiplier","[Commas(round(src.EXP))]")
				stat("----","----")
				stat("Passive Skills:")
				stat("Unarmed:","[Skillz["Unarmed"]["Level"]] ([Skillz["Unarmed"]["Current"]]/[Skillz["Unarmed"]["Next"]])")
				stat("Sword:","[Skillz["Sword"]["Level"]] ([Skillz["Sword"]["Current"]]/[Skillz["Sword"]["Next"]])")
				//stat("Combo:","[Skillz["Warp"]["Level"]] ([Skillz["Warp"]["Current"]] /[Skillz["Warp"]["Next"]])")
				stat("Swimming:","[Skillz["Swim"]["Level"]] ([Skillz["Swim"]["Current"]] /[Skillz["Swim"]["Next"]])")
				stat("Dig:","[Skillz["Dig"]["Level"]] ([Skillz["Dig"]["Current"]] /[Skillz["Dig"]["Next"]])")
				if(!(Race in list("Android","Bio Android","Changeling","Majin","Dragon")))stat("Oxygen Conserve:","[Skillz["Oxygen"]["Level"]] ([Skillz["Oxygen"]["Current"]] /[Skillz["Oxygen"]["Next"]])")
				stat("----","----")
				stat("Misc Data:")
//				stat("Year","[Year]")
				stat("Buff Slots Open","[3-usr.ActiveBuffs]")
				stat("Time of Day","[Time]")
				stat("Enchantment Level:","[usr.EnchantmentLevel]")
				stat("Enchantment EXP:","[usr.EnchantmentEXP]/[usr.EnchantmentEXPNeeded]")
				stat("Science Level:","[usr.IntelligenceLevel]")
				stat("Science EXP:","[usr.IntelligenceEXP]/[usr.IntelligenceEXPNeeded]")*/

					//winset(src,"gridstatx","cells=2x[Stats]")

					if(src.Admin)
						Stats++
						src.GridStatPlacement("-Admin-",null,Stats)
						Stats++
						src.GridStatPlacement("CPU","[world.cpu]%",Stats)
						Stats++
						src.GridStatPlacement("Cords","[usr.x],[usr.y],[usr.z]",Stats)




			sleep(10)




mob/proc/GridStatPlacement(var/Lulz,var/Omg,var/Wut,var/Lol="gridstatx")
	winset(src,Lol,"current-cell=1x[Wut]")
	src << output("[Lulz]",Lol)
	winset(src,Lol,"current-cell=2x[Wut]")
	src << output("[Omg]",Lol)


mob/Players/verb
	togglegrid(var/blah as text)
		set hidden=1
		set name=".togglegrid"
		winset(usr,,"rpanewindow.left=gridwindow")
		if(blah in list("Stats","Inventory"))
			usr.griddisplay=blah


var/welcome="<center>Welcome to Dragonball Rebirth!"

var/basehtml=({"			<html>
	<style type="text/css">
	<!--
	body {
	     color:#449999;
	     background-color:black;
	     font-size:12;
	     face:cambria;
	//-->
	</style>"})





mob/Players/verb/browsertoggle(var/blah as text)
	set name=".togglebrowser"
	if(blah=="Story")
		usr<<browse({"[basehtml][Story]"})
	if(blah=="Rules")
		usr<<browse("[basehtml][Rules]")
	if(blah=="Ranks")
		usr<<browse("[basehtml][Ranks]")
	if(blah=="Updates")
		usr<<browse("[basehtml][Updates]")
	if(blah=="Guide")
		usr<<browse("[basehtml][Guide]")
	if(blah=="Credits")
		usr<<browse("[basehtml][Credits]")
	if(blah=="TransTiers")
		usr<<browse("[basehtml][TransTiers]")
	if(blah=="AdminNotes")
		if(!usr.Admin)return
		usr<<browse("[basehtml][AdminNotes]")


