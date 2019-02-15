mob/proc/ClassBodyStats()
/*	if(src.BodyType=="Small")
		StrengthMod*=0.5
		EnduranceMod*=0.5
		SpeedMod*=1.4
		ResistanceMod*=0.5
		ForceMod*=1.25
		OffenseMod*=1.4
		DefenseMod*=1.4
		Regeneration*=1.25
		Recovery*=1.25*/
	if(src.BodyType=="Small")
		src.BodyType="Medium"
	/*	if(src.Race!="Changeling")
			StrengthMod*=0.5
			EnduranceMod*=0.5
			SpeedMod*=1.25
			ResistanceMod*=0.5
			ForceMod*=1.25
			OffenseMod*=1.5
			DefenseMod*=1.5*/
	if(src.BodyType=="Large")
		src.BodyType="Medium"
/*		if(src.Race!="Changeling")
			StrengthMod*=1.5
			EnduranceMod*=1.5
			SpeedMod*=0.7
			ResistanceMod*=1.5
			ForceMod*=0.7
			OffenseMod*=0.7
			DefenseMod*=0.7*/
/*	if(src.BodyType=="Large")
		StrengthMod*=1.5
		EnduranceMod*=2
		SpeedMod*=0.75
		ResistanceMod*=1.5
		ForceMod*=0.75
		OffenseMod*=0.75
		DefenseMod*=0.75
		Regeneration*=0.75
		Recovery*=0.75*/
	if(src.Class=="Muscle Wizard")
		StrengthMod*=1.25
		EnduranceMod*=1.25
		ForceMod*=1.25
		ResistanceMod*=0.75
		SpeedMod*=0.75
		OffenseMod*=1.25
		DefenseMod*=0.75
	if(src.Class=="Wizard")
		StrengthMod/=2
		EnduranceMod/=2
		ForceMod*=1.25
		ResistanceMod*=1.25
		OffenseMod/=1.5
		DefenseMod/=1.5
		Recovery*=1.25
		SpeedMod*=1.25
//		Enchantment*=1.5

	if(src.Class=="Healer")
		if(src.Race!="Namekian")
			EnergyMod*=1.5
			StrengthMod/=3
			EnduranceMod/=3
			ForceMod*=1.5
			ResistanceMod*=1.5
			OffenseMod/=1.25
			DefenseMod/=1.25
			Regeneration*=1.25
			Recovery*=1.5
		//SpeedMod/=1.5
//		Enchantment*=1.5
	if(src.Class=="Technologist")
		//Intelligence*=2
		StrengthMod/=2
		EnduranceMod*=1.5
		ForceMod/=1.5
		SpeedMod/=2
		ResistanceMod*=1.5
		OffenseMod/=1.5
		DefenseMod*=1.25
	if(src.Class=="God")
		StrengthMod*=1.5
		EnduranceMod*=3
		SpeedMod*=2
		ResistanceMod*=3
		ForceMod*=1.5
		OffenseMod*=2
		DefenseMod*=3
		Regeneration*=2
		Recovery*=2
		Intelligence*=2



mob/proc/Stats(var/blah)
	if(blah=="Human")//done
		if(src.Class=="Quincy")
			IncrementStat("Energy",2.5)
			IncrementStat("Strength",1.5)
			IncrementStat("Endurance",0.75)
			IncrementStat("Speed",2)
			IncrementStat("Force",2.5)
			IncrementStat("Resistance",2.5)
			IncrementStat("Offense",1.75)
			IncrementStat("Defense",1.75)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",0.2)
		else if(src.Class=="Sage")
		{
			IncrementStat("Energy",3)
			IncrementStat("Strength",2.5)
			IncrementStat("Endurance",1.25)
			IncrementStat("Speed",1.75)
			IncrementStat("Force",2.5)
			IncrementStat("Resistance",1.25)
			IncrementStat("Offense",1.75)
			IncrementStat("Defense",1.75)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",0.25)
		}
		else
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",2.5)
			IncrementStat("Endurance",2.5)
			IncrementStat("Speed",1.25)
			IncrementStat("Force",1.5)
			IncrementStat("Resistance",0.75)
			IncrementStat("Offense",1.75)
			IncrementStat("Defense",1.75)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",0.5)
	else if(blah=="Dhampir")
		IncrementStat("Energy",1.75)
		IncrementStat("Strength",2)
		IncrementStat("Endurance",0.75)
		IncrementStat("Speed",2)
		IncrementStat("Force",1.75)
		IncrementStat("Resistance",0.5)
		IncrementStat("Offense",1.5)
		IncrementStat("Defense",1.5)
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",1.5)
		IncrementStat("Anger",0.75)
	else if(blah=="Neko")
		if(Class=="Kitty" || Class=="Schrodinger")
			IncrementStat("Energy",1)
			IncrementStat("Strength",1.85)
			IncrementStat("Endurance",-0.25)
			IncrementStat("Force",1.75)
			IncrementStat("Resistance",0)
			IncrementStat("Speed",3)
			IncrementStat("Offense",1.25)
			IncrementStat("Defense",1.75)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",0.5)
		if(Class=="Wild")
			IncrementStat("Energy",1.25)
			IncrementStat("Strength",2.25)
			IncrementStat("Endurance",1.75)
			IncrementStat("Force",-0.25)
			IncrementStat("Resistance",1.75)
			IncrementStat("Speed",2)
			IncrementStat("Offense",1.75)
			IncrementStat("Defense",1.25)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",0.75)
/*		IncrementStat("Energy",1)
		IncrementStat("Strength",2.5)
		IncrementStat("Endurance",0)
		IncrementStat("Speed",2)
		IncrementStat("Force",1)
		IncrementStat("Resistance",0)
		IncrementStat("Offense",1.5)
		IncrementStat("Defense",1)
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",2)
		IncrementStat("Anger",0.5)*/
	else if(blah=="Kurama")
		IncrementStat("Energy",1.5)
		IncrementStat("Strength",2.5)
		IncrementStat("Endurance",2.5)
		IncrementStat("Speed",1.25)
		IncrementStat("Force",1.5)
		IncrementStat("Resistance",0.75)
		IncrementStat("Offense",1.75)
		IncrementStat("Defense",1.75)
		IncrementStat("Regeneration",0.5)
		IncrementStat("Recovery",2)
		IncrementStat("Anger",0.5)
	else if(blah=="Nobody")
		IncrementStat("Energy",2)
		IncrementStat("Strength",3)
		IncrementStat("Endurance",2)
		IncrementStat("Speed",1.5)
		IncrementStat("Force",3)
		IncrementStat("Resistance",2)
		IncrementStat("Offense",1.5)
		IncrementStat("Defense",1.5)
		IncrementStat("Regeneration",0.5)
		IncrementStat("Recovery",2)
		IncrementStat("Anger",0.05)
	else if(blah=="Pathless")
		IncrementStat("Energy",0)
		IncrementStat("Strength",0)
		IncrementStat("Endurance",0)
		IncrementStat("Speed",0)
		IncrementStat("Force",0)
		IncrementStat("Resistance",0)
		IncrementStat("Offense",0)
		IncrementStat("Defense",0)
		IncrementStat("Regeneration",0.5)
		IncrementStat("Recovery",0)
		IncrementStat("Anger",0)
	else if(blah=="Pathfinder")
		IncrementStat("Energy",2)
		IncrementStat("Strength",2)
		IncrementStat("Endurance",2)
		IncrementStat("Speed",1.5)
		IncrementStat("Force",2)
		IncrementStat("Resistance",2)
		IncrementStat("Offense",2)
		IncrementStat("Defense",2)
		IncrementStat("Regeneration",2)
		IncrementStat("Recovery",2)
		IncrementStat("Anger",0.5)
	else if(blah=="Human")
		IncrementStat("Energy",2)
		IncrementStat("Strength",2)
		IncrementStat("Endurance",2)
		IncrementStat("Speed",2)
		IncrementStat("Force",1)
		IncrementStat("Resistance",0.75)
		IncrementStat("Offense",1.5)
		IncrementStat("Defense",1.5)
		IncrementStat("Regeneration",2)
		IncrementStat("Recovery",1.5)
		IncrementStat("Anger",0.5)

	else if (blah=="Manakete")
		if(Class=="Dragonborn")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",3.25)
			IncrementStat("Endurance",3.5)
			IncrementStat("Force",1.5)
			IncrementStat("Resistance",3.5)
			IncrementStat("Speed",1.5)
			IncrementStat("Offense",2)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",1.5)
			IncrementStat("Anger",1)
		if(Class=="Maid Dragon")
			IncrementStat("Energy",3)
			IncrementStat("Strength",2.25)
			IncrementStat("Endurance",3)
			IncrementStat("Force",2.75)
			IncrementStat("Resistance",4)
			IncrementStat("Speed",2)
			IncrementStat("Offense",1)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",1.25)
		if(Class=="Hyattr")
			IncrementStat("Energy",2)
			IncrementStat("Strength",3)
			IncrementStat("Endurance",4)
			IncrementStat("Force",3)
			IncrementStat("Resistance",3)
			IncrementStat("Speed",0)
			IncrementStat("Offense",2)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",3)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",2)


	else if(blah == "Golem")
	{
		IncrementStat("Energy",1)
		IncrementStat("Strength",3)
		IncrementStat("Endurance",2.5)
		IncrementStat("Force",1.5)
		IncrementStat("Resistance",2)
		IncrementStat("Speed",0.5)
		IncrementStat("Offense",1.5)
		IncrementStat("Defense",1)
		IncrementStat("Regeneration",-0.5)
		IncrementStat("Recovery",1)
		IncrementStat("Anger",0.25)
	}
	else if(blah=="Youkai")
		if(Class=="Kitsune")
			IncrementStat("Energy",2)
			IncrementStat("Strength",1.5)
			IncrementStat("Endurance",1)
			IncrementStat("Force",3)
			IncrementStat("Resistance",2.5)
			IncrementStat("Speed",1.5)
			IncrementStat("Offense",1.25)
			IncrementStat("Defense",1.75)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",1.5)
			IncrementStat("Anger",0.25)

		if(Class=="Tanuki")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",3)
			IncrementStat("Endurance",5)
			IncrementStat("Force",0)
			IncrementStat("Resistance",5)
			IncrementStat("Speed",-0.5)
			IncrementStat("Offense",1)
			IncrementStat("Defense",0)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",1)
			IncrementStat("Anger",0.25)

		if(Class=="Oni")
			IncrementStat("Energy",0)
			IncrementStat("Strength",7)
			IncrementStat("Endurance",6)
			IncrementStat("Force",-0.75)
			IncrementStat("Resistance",-0.5)
			IncrementStat("Speed",0.5)
			IncrementStat("Offense",1.5)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",3)
			IncrementStat("Recovery",0)
			IncrementStat("Anger",0.75)

		if(Class=="Ookami")
			IncrementStat("Energy",1)
			IncrementStat("Strength",3)
			IncrementStat("Endurance",2)
			IncrementStat("Force",0)
			IncrementStat("Resistance",2)
			IncrementStat("Speed",1.5)
			IncrementStat("Offense",3)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",1.5)
			IncrementStat("Anger",1)

		if(Class=="Hell Raven")
			IncrementStat("Energy",4)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",0)
			IncrementStat("Force",4)
			IncrementStat("Resistance",1)
			IncrementStat("Speed",1)
			IncrementStat("Offense",1.5)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",3)
			IncrementStat("Recovery",0)
			IncrementStat("Anger",1)

	else if(blah=="Half Demon")
		if(Class=="Pride")
			IncrementStat("Energy",1)
			IncrementStat("Strength",3)
			IncrementStat("Endurance",3)
			IncrementStat("Speed",1.25)
			IncrementStat("Force",1)
			IncrementStat("Resistance",1.5)
			IncrementStat("Offense",2)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",0.75)
			IncrementStat("Recovery",0.75)
			IncrementStat("Anger",0.5)
		if(Class=="Sloth")
			IncrementStat("Energy",1)
			IncrementStat("Strength",1)
			IncrementStat("Endurance",2)
			IncrementStat("Speed",2)
			IncrementStat("Force",3)
			IncrementStat("Resistance",2)
			IncrementStat("Offense",1)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",0.75)
			IncrementStat("Recovery",0.75)
			IncrementStat("Anger",0.5)
		if(Class=="Lust")
			IncrementStat("Energy",1)
			IncrementStat("Strength",3)
			IncrementStat("Endurance",0.5)
			IncrementStat("Speed",2)
			IncrementStat("Force",3)
			IncrementStat("Resistance",0.5)
			IncrementStat("Offense",1.5)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",0.75)
			IncrementStat("Recovery",0.75)
			IncrementStat("Anger",0.5)
		if(Class=="Gluttony")
			IncrementStat("Energy",1)
			IncrementStat("Strength",2.5)
			IncrementStat("Endurance",4)
			IncrementStat("Speed",0.75)
			IncrementStat("Force",0.75)
			IncrementStat("Resistance",4)
			IncrementStat("Offense",2)
			IncrementStat("Defense",0.75)
			IncrementStat("Regeneration",1.5)
			IncrementStat("Recovery",0.75)
			IncrementStat("Anger",0.5)
		if(Class=="Wrath")
			IncrementStat("Energy",1)
			IncrementStat("Strength",1.75)
			IncrementStat("Endurance",1.75)
			IncrementStat("Speed",1)
			IncrementStat("Force",1.5)
			IncrementStat("Resistance", 1.75)
			IncrementStat("Offense",0.75)
			IncrementStat("Defense",0.75)
			IncrementStat("Regeneration",0.75)
			IncrementStat("Recovery",0.5)
			IncrementStat("Anger",2)
		if(Class=="Greed")
			IncrementStat("Energy",1)
			IncrementStat("Strength",1.75)
			IncrementStat("Endurance",2.25)
			IncrementStat("Speed",1.1)
			IncrementStat("Force",1.75)
			IncrementStat("Resistance",2.25)
			IncrementStat("Offense",1)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",1)
			IncrementStat("Anger",0.5)
		if(Class=="Envy")
			IncrementStat("Energy",3)
			IncrementStat("Strength",1.75)
			IncrementStat("Endurance",2.25)
			IncrementStat("Speed",1.15)
			IncrementStat("Force",2.25)
			IncrementStat("Resistance",3.5)
			IncrementStat("Offense",1)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",0.75)
			IncrementStat("Anger",0.5)
/*		if(Class=="Demon Hunter")
			IncrementStat("Energy",2)
			IncrementStat("Strength",2.5)
			IncrementStat("Endurance",2)
			IncrementStat("Speed",1.5)
			IncrementStat("Force",0.5)
			IncrementStat("Resistance",2)
			IncrementStat("Offense",2)
			IncrementStat("Defense",2)
			IncrementStat("Regeneration",3)
			IncrementStat("Recovery",1)
			IncrementStat("Anger",2)*/

	else if(blah=="Spirit Doll")
		IncrementStat("Energy",2.2)
		IncrementStat("Strength",0.75)
		IncrementStat("Endurance",0.5)
		IncrementStat("Speed",2)
		IncrementStat("Force",2.5)
		IncrementStat("Resistance",2)
		IncrementStat("Offense",1.25)
		IncrementStat("Defense",1.25)
		IncrementStat("Regeneration",0.5)
		IncrementStat("Recovery",3)
		IncrementStat("Anger",0.35)
	else if(blah=="Namekian")//Done
		if(src.Class=="Ancient")
			IncrementStat("Energy",4)
			IncrementStat("Strength",2.25)
			IncrementStat("Endurance",3.5)
			IncrementStat("Speed",1.25)
			IncrementStat("Force",2.25)
			IncrementStat("Resistance",2.75)
			IncrementStat("Offense",1.25)
			IncrementStat("Defense",2.25)
			IncrementStat("Regeneration",4)
			IncrementStat("Recovery",4)
			IncrementStat("Anger",1)

		/*else if(src.Class=="Healer")
			IncrementStat("Energy",3.5)
			IncrementStat("Strength",0.5)
			IncrementStat("Endurance",0.5)
			IncrementStat("Speed",1.5)
			IncrementStat("Force",2.5)
			IncrementStat("Resistance",0.5)
			IncrementStat("Offense",1)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",0.25)*/
		else
			IncrementStat("Energy",2)
			IncrementStat("Strength",3)
			IncrementStat("Endurance",2)
			IncrementStat("Speed",1.25)
			IncrementStat("Force",2.5)
			IncrementStat("Resistance",2)
			IncrementStat("Offense",2)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",3)
			IncrementStat("Recovery",1.5)
			IncrementStat("Anger",0.25)

	//Rares
	else if(blah=="Majin")//If they don't get passive regeneration.
		IncrementStat("Energy",1.5)
		IncrementStat("Strength",2.75)//2.75 I thought their strength and force was too high tbh.
		IncrementStat("Endurance",2.5)//1.25
		IncrementStat("Speed",1.5)
		IncrementStat("Force",2.5)//2.5
		IncrementStat("Resistance",1.5)//1.5
		IncrementStat("Offense",1.5)
		IncrementStat("Defense",-0.5)//0.5
		IncrementStat("Regeneration",6.5)
		IncrementStat("Recovery",6.5)
		IncrementStat("Anger",0.5)
	else if(blah=="Aetherian")//new
		IncrementStat("Energy",1)
		IncrementStat("Strength",1)//2.75
		IncrementStat("Endurance",1)//1.25
		IncrementStat("Speed",1)//3
		IncrementStat("Force",1)//2.5
		IncrementStat("Resistance",1)//1.5
		IncrementStat("Offense",1)
		IncrementStat("Defense",1)//0.5
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",1)
		IncrementStat("Anger",0.5)
		//IncrementStat("Anger",0)
	else if(blah=="Bio Android")
		IncrementStat("Energy",4)
		IncrementStat("Strength",4)
		IncrementStat("Endurance",3)
		IncrementStat("Speed",1.5)
		IncrementStat("Force",3)
		IncrementStat("Resistance",3)
		IncrementStat("Offense",4)
		IncrementStat("Defense",4)
		IncrementStat("Regeneration",4)
		IncrementStat("Recovery",4)
		IncrementStat("Anger",0.75)
	else if(blah=="Reploid")
		if(Class=="X")
			IncrementStat("Energy",3)
			IncrementStat("Strength",4)
			IncrementStat("Endurance",3)
			IncrementStat("Speed",2)
			IncrementStat("Force",4)
			IncrementStat("Resistance",2)
			IncrementStat("Offense",3)
			IncrementStat("Defense",2)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",4)
			IncrementStat("Anger",1.25)
		if(Class=="Zero")
			IncrementStat("Energy",3)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",2)
			IncrementStat("Speed",3)
			IncrementStat("Force",5)
			IncrementStat("Resistance",4)
			IncrementStat("Offense",4)
			IncrementStat("Defense",4)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",4)
			IncrementStat("Anger",1.25)
		if(Class=="Vile")
			IncrementStat("Energy",3)
			IncrementStat("Strength",4)
			IncrementStat("Endurance",3)
			IncrementStat("Speed",1)
			IncrementStat("Force",4)
			IncrementStat("Resistance",5)
			IncrementStat("Offense",2)
			IncrementStat("Defense",4)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",4)
			IncrementStat("Anger",1.5)
	else if(blah=="Dragon")//Done
		IncrementStat("Energy",2)
		IncrementStat("Strength",2)
		IncrementStat("Endurance",2)
		IncrementStat("Speed",1.2)
		IncrementStat("Force",2)
		IncrementStat("Resistance",2)
		IncrementStat("Offense",1.5)
		IncrementStat("Defense",1.5)
		IncrementStat("Regeneration",2)
		IncrementStat("Recovery",2)
		IncrementStat("Anger",1)
	else if(blah=="God of Destruction")//Needs nerf
		IncrementStat("Energy",2)
		IncrementStat("Strength",6.75)
		IncrementStat("Endurance",2.5)
		IncrementStat("Speed",3)
		IncrementStat("Force",5)
		IncrementStat("Resistance",2.5)
		IncrementStat("Offense",4)
		IncrementStat("Defense",4)
		IncrementStat("Regeneration",4)
		IncrementStat("Recovery",1)
		IncrementStat("Anger",0.01)
	else if(blah=="Anti-Spiral")
		IncrementStat("Energy",2)
		IncrementStat("Strength",3)
		IncrementStat("Endurance",7)
		IncrementStat("Speed",3)
		IncrementStat("Force",9)
		IncrementStat("Resistance",7)
		IncrementStat("Offense",4)
		IncrementStat("Defense",4)
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",0)
		IncrementStat("Anger",0.01)

	else if(blah=="Lamia")
		if(Class=="Echidna")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",4)
			IncrementStat("Endurance",2)
			IncrementStat("Speed",2)
			IncrementStat("Force",0)
			IncrementStat("Resistance",2)
			IncrementStat("Offense",2)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",1)
			IncrementStat("Anger",1)
		if(Class=="Medusa")
			IncrementStat("Energy",3)
			IncrementStat("Strength",0)
			IncrementStat("Endurance",1.25)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",4)
			IncrementStat("Resistance",2.5)
			IncrementStat("Offense",1.75)
			IncrementStat("Defense",2)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",1)
		if(Class=="Gorgon")
			IncrementStat("Energy",4)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",4)
			IncrementStat("Speed",1.5)
			IncrementStat("Force",2)
			IncrementStat("Resistance",4)
			IncrementStat("Offense",1.5)
			IncrementStat("Defense",1.75)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",1)

	else if(blah=="Synchronizer")
		if(Class=="Maid")
			IncrementStat("Energy",3)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",1.5)
			IncrementStat("Speed",2.5)
			IncrementStat("Force",1.2)
			IncrementStat("Resistance",3.5)
			IncrementStat("Offense",4.5)
			IncrementStat("Defense",3.5)
			IncrementStat("Regeneration",3)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",2)
		if(Class=="Meme")
			IncrementStat("Energy",2)
			IncrementStat("Strength",0.25)
			IncrementStat("Endurance",74)
			IncrementStat("Speed",6)
			IncrementStat("Force",0.25)
			IncrementStat("Resistance",74)
			IncrementStat("Offense",74)
			IncrementStat("Defense",74)
			IncrementStat("Regeneration",7)
			IncrementStat("Recovery",0.5)
			IncrementStat("Anger",0.1)
		if(Class=="Mastermind")
			IncrementStat("Energy",4)
			IncrementStat("Strength",0.5)
			IncrementStat("Endurance",4)
			IncrementStat("Speed",2.5)
			IncrementStat("Force",5)
			IncrementStat("Resistance",2)
			IncrementStat("Offense",1)
			IncrementStat("Defense",3)
			IncrementStat("Regeneration",1.5)
			IncrementStat("Recovery",6)
			IncrementStat("Anger",1.1)
		if(Class=="Revolutionary")
			IncrementStat("Energy",1.3)
			IncrementStat("Strength",1.5)
			IncrementStat("Endurance",1.6)
			IncrementStat("Speed",1.4)
			IncrementStat("Force",1.1)
			IncrementStat("Resistance",1.9)
			IncrementStat("Offense",2.3)
			IncrementStat("Defense",2.8)
			IncrementStat("Regeneration",2)
			IncrementStat("Recovery",3)
			IncrementStat("Anger",15)
	else if(blah=="Makaioshin")
		if(Class=="Bibarel")
			IncrementStat("Energy",4)
			IncrementStat("Strength",4)
			IncrementStat("Endurance",4)
			IncrementStat("Speed",2.5)
			IncrementStat("Force",4)
			IncrementStat("Resistance",4)
			IncrementStat("Offense",2)
			IncrementStat("Defense",2)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",1)
			IncrementStat("Anger",1)
		if(Class=="Wisdom")
			IncrementStat("Energy",4)
			IncrementStat("Strength",1.5)
			IncrementStat("Endurance",3)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",2)
			IncrementStat("Resistance",3)
			IncrementStat("Offense",0.5)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",3)
			IncrementStat("Recovery",4)
			IncrementStat("Anger",0.5)
		if(Class=="Courage")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",3)
			IncrementStat("Endurance",3)
			IncrementStat("Speed",1)
			IncrementStat("Force",3)
			IncrementStat("Resistance",3)
			IncrementStat("Offense",3)
			IncrementStat("Defense",3)
			IncrementStat("Regeneration",3)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",0.5)
		if(Class=="Power")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",4)
			IncrementStat("Endurance",2.5)
			IncrementStat("Speed",1.5)
			IncrementStat("Force",3)
			IncrementStat("Resistance",2.5)
			IncrementStat("Offense",2)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",3)
			IncrementStat("Recovery",0.5)
			IncrementStat("Anger",2)
		////////////


	else if(blah=="Saiyan")
		if(Class=="Elite")
			IncrementStat("Energy",1)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",1.5)
			IncrementStat("Speed",1)
			IncrementStat("Force",2)
			IncrementStat("Resistance",1.5)
			IncrementStat("Offense",2)
			IncrementStat("Defense",2)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",0.5)
			IncrementStat("Anger",0.75)
		if(Class=="Savage")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",2.5)
			IncrementStat("Endurance",3)
			IncrementStat("Speed",3)
			IncrementStat("Force",0.25)
			IncrementStat("Resistance",3)
			IncrementStat("Offense",1.5)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",1.5)
			IncrementStat("Recovery",0.5)
			IncrementStat("Anger",0.5)
		if(Class=="Normal")
			IncrementStat("Energy",1)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",2.5)
			IncrementStat("Speed",1)
			IncrementStat("Force",2)
			IncrementStat("Resistance",2.5)
			IncrementStat("Offense",2)
			IncrementStat("Defense",2)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",0.5)
			IncrementStat("Anger",0.75)
		if(Class=="Low-Class")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",3)
			IncrementStat("Speed",1.25)
			IncrementStat("Force",1)
			IncrementStat("Resistance",3)
			IncrementStat("Offense",1.5)
			IncrementStat("Defense",2.5)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",0.5)
			IncrementStat("Anger",1)
		if(Class=="Legendary")
			IncrementStat("Energy",1)
			IncrementStat("Strength",3)
			IncrementStat("Endurance",3)
			IncrementStat("Speed",2)
			IncrementStat("Force",1.75)
			IncrementStat("Resistance",3)
			IncrementStat("Offense",2)
			IncrementStat("Defense",0.25)
			IncrementStat("Recovery",1)
			IncrementStat("Regeneration",1)
			IncrementStat("Anger",2)
		if(Class=="Fire God")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",2.5)
			IncrementStat("Endurance",2.5)
			IncrementStat("Speed",1)
			IncrementStat("Force",2.5)
			IncrementStat("Resistance",2.5)
			IncrementStat("Offense",0.25)
			IncrementStat("Defense",0.25)
			IncrementStat("Recovery",0.5)
			IncrementStat("Regeneration",1)
			IncrementStat("Anger",0.5)
		if(Class=="Hellspawn")
			IncrementStat("Energy",1)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",2)
			IncrementStat("Speed",1.5)
			IncrementStat("Force",2)
			IncrementStat("Resistance",2)
			IncrementStat("Offense",2)
			IncrementStat("Defense",2)
			IncrementStat("Recovery",0.5)
			IncrementStat("Regeneration",1)
			IncrementStat("Anger",1)


	else if(blah=="Half Saiyan")
		if(Class=="Fighter")
			IncrementStat("Energy",1)
			IncrementStat("Strength",1)
			IncrementStat("Endurance",1)
			IncrementStat("Speed",1)
			IncrementStat("Force",1)
			IncrementStat("Resistance",1)
			IncrementStat("Offense",1)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",1.5)
			IncrementStat("Anger",0.5)
		if(Class=="Quarter")
			IncrementStat("Energy",0.8)
			IncrementStat("Strength",0.75)
			IncrementStat("Endurance",1.5)
			IncrementStat("Speed",2.25)
			IncrementStat("Force",0.6)
			IncrementStat("Resistance",1.25)
			IncrementStat("Offense",1.5)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",0)
			IncrementStat("Recovery",1.3)
			IncrementStat("Anger",1.5)

	else if(blah=="Changeling")//Done
		IncrementStat("Regeneration",2)
		IncrementStat("Recovery",0.5)
		IncrementStat("Anger",0.15)
		IncrementStat("Energy",2)
		if(BodyType=="Large")
			IncrementStat("Strength",2.75)
			IncrementStat("Endurance",4.5)
			IncrementStat("Speed",1.1)
			IncrementStat("Force",0.75)
			IncrementStat("Resistance",4.5)
			IncrementStat("Offense",0.25)
			IncrementStat("Defense",0.25)
		if(BodyType=="Medium")
			IncrementStat("Strength",6)
			IncrementStat("Endurance",9)
			IncrementStat("Speed",1.5)
			IncrementStat("Force",7)
			IncrementStat("Resistance",9)
			IncrementStat("Offense",2)
			IncrementStat("Defense",2)
		if(BodyType=="Small")
			IncrementStat("Strength",2)
			IncrementStat("Endurance",0.25)
			IncrementStat("Speed",2)
			IncrementStat("Force",2)
			IncrementStat("Resistance",0.25)
			IncrementStat("Offense",1.25)
			IncrementStat("Defense",1.25)
	else if(blah=="Mazoku Demon")
		IncrementStat("Energy",2)
		IncrementStat("Strength",5)
		IncrementStat("Endurance",3.5)
		IncrementStat("Speed",2)
		IncrementStat("Force",3.5)
		IncrementStat("Resistance",3)
		IncrementStat("Offense",3.75)
		IncrementStat("Defense",3.25)
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",0)
		IncrementStat("Anger",2)
	else if(blah=="Demon")//Done
		//IGNIS SHENRON DOES NOT APPROVE OF THESE DEMONS
		if(Class=="Pride")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",3)//MAKE THIS FROM 3 TO 3.5
			IncrementStat("Endurance",2)//1.25-1.5
			IncrementStat("Speed",1)//WHY ARE YOU SLOW? 1.25
			IncrementStat("Force",1)
			IncrementStat("Resistance",1.5)//1.25-1.5
			IncrementStat("Offense",1.3)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",0)
			IncrementStat("Anger",0.5)
		if(Class=="Sloth")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",1.5)
			IncrementStat("Endurance",1.75)
			IncrementStat("Speed",0.25)
			IncrementStat("Force",2.5)
			IncrementStat("Resistance",2)
			IncrementStat("Offense",1.75)
			IncrementStat("Defense",1.75)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",0)
			IncrementStat("Anger",0.5)
		if(Class=="Lust")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",2.5)// 3, MAKE THIS 3
			IncrementStat("Endurance",0.5)
			IncrementStat("Speed",1)//YOU'RE A GLASS CANNON, YOU NEED TO MOOOOOOOOOOOOOOVE 1.5-2
			IncrementStat("Force",2.5)// PEW PEW NIGGA PEW PEW PEW 2-2.5
			IncrementStat("Resistance",0.5)
			IncrementStat("Offense",1.2)
			IncrementStat("Defense",1.2)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",0)
			IncrementStat("Anger",0.5)
		if(Class=="Gluttony")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",3)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",1.25)
			IncrementStat("Resistance",3)
			IncrementStat("Offense",1)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",0)
			IncrementStat("Anger",0.5)
		if(Class=="Wrath")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",1.75)
			IncrementStat("Endurance",1.75)
			IncrementStat("Speed",1)
			IncrementStat("Force",1.5)
			IncrementStat("Resistance", 1.75)
			IncrementStat("Offense",0.5)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",0)
			IncrementStat("Anger",2)
		if(Class=="Greed")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",1)//NEEDS TO BE 1, FUCK THESE GUYS TECHIES SHOULDN'T FIGHT THIS GOOD
			IncrementStat("Endurance",1.5)//1.5 NIGGA
			IncrementStat("Speed",0.75)
			IncrementStat("Force",1)//1 AGAIN
			IncrementStat("Resistance",1.5)//1.5 BECAUSE I'M RED.
			IncrementStat("Offense",0.5)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",0)
			IncrementStat("Anger",0.25)
		if(Class=="Envy")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",1)//0.75 OR BUST
			IncrementStat("Endurance",1.5)//GET OUT OF HERE WITH YOUR TANKING 1.25
			IncrementStat("Speed",1)
			IncrementStat("Force",1.75)//YOU'RE SUPPOSED TO BE SITTING AT YOUR DESK READING BOOKS AND MAKING POTIONS, BUT I GUESS HAVING 1.5 HERE IS OKAY!
			IncrementStat("Resistance",1.5)//1.25
			IncrementStat("Offense",0.5)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",0)
			IncrementStat("Anger",0.25)
	else if(blah=="Kaio")
		IncrementStat("Energy",4)
		IncrementStat("Strength",1.5)
		IncrementStat("Endurance",1.5)
		IncrementStat("Speed",1.5)
		IncrementStat("Force",1.5)
		IncrementStat("Resistance",1.5)
		IncrementStat("Offense",1.5)//Increased by 2
		IncrementStat("Defense",1.5)//increased by 1.5
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",2)
		IncrementStat("Anger",0.25)
	else if(blah=="Makyo")
		IncrementStat("Energy",2)
		IncrementStat("Strength",3)
		IncrementStat("Endurance",3)
		IncrementStat("Speed",1)
		IncrementStat("Force",1.5)
		IncrementStat("Resistance",3)
		IncrementStat("Offense",1.5)
		IncrementStat("Defense",1.5)
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",1)
		IncrementStat("Anger",0.5)
	else if(blah=="Demi")
		IncrementStat("Energy",1)
		IncrementStat("Strength",2.5)
		IncrementStat("Endurance",2.5)
		IncrementStat("Speed",1)
		IncrementStat("Force",0.5)
		IncrementStat("Resistance",2.5)
		IncrementStat("Offense",1)
		IncrementStat("Defense",1)
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",0.5)
		IncrementStat("Anger",0.5)
	else if(blah=="Tsufurujin")
		IncrementStat("Energy",2)
		IncrementStat("Strength",1.5)
		IncrementStat("Endurance",2.75)
		IncrementStat("Speed",1)
		IncrementStat("Force",2)
		IncrementStat("Resistance",2.5)
		IncrementStat("Offense",1)
		IncrementStat("Defense",1.5)
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",1.5)
		IncrementStat("Anger",0.5)
	else if(blah=="Trueseer")
		if(src.Class=="Fighter")
			IncrementStat("Energy",2.5)
			IncrementStat("Strength",1.5)
			IncrementStat("Endurance",2.5)
			IncrementStat("Speed",1.5)
			IncrementStat("Force",3.0)
			IncrementStat("Resistance",2.5)
			IncrementStat("Offense",2.0)
			IncrementStat("Defense",2.0)
			IncrementStat("Regeneration",0.75)
			IncrementStat("Recovery",2.0)
			IncrementStat("Anger",0.25)
	else if(blah=="Galvan")
		if(src.Class=="Prime")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",-0.5)
			IncrementStat("Endurance",-0.5)
			IncrementStat("Speed",4)
			IncrementStat("Force",-0.75)
			IncrementStat("Resistance",-0.5)
			IncrementStat("Offense",0)
			IncrementStat("Defense",6)
			IncrementStat("Regeneration",1.1)
			IncrementStat("Recovery",4)
			IncrementStat("Anger",-0.25)
		else if(src.Class=="Albedo")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",1.5)
			IncrementStat("Endurance",1.5)
			IncrementStat("Speed",2)
			IncrementStat("Force",0)
			IncrementStat("Resistance",1)
			IncrementStat("Offense",2)
			IncrementStat("Defense",2)
			IncrementStat("Regeneration",1.1)
			IncrementStat("Recovery",4)
			IncrementStat("Anger",0.5)
	else if(blah=="Alien")
		if(src.Class=="Fighter")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",0.5)
			IncrementStat("Endurance",0.5)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",0.5)
			IncrementStat("Resistance",0.5)
			IncrementStat("Offense",0.5)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",2)
			IncrementStat("Anger",0.4)
		if(src.Class=="Healer")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",0.5)
			IncrementStat("Endurance",0.5)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",0.5)
			IncrementStat("Resistance",0.5)
			IncrementStat("Offense",0.5)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",0.3)
			IncrementStat("Anger",0.4)
		if(src.Class=="Technologist")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",0.5)
			IncrementStat("Endurance",0.5)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",0.5)
			IncrementStat("Resistance",0.5)
			IncrementStat("Offense",0.5)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",0.3)
			IncrementStat("Anger",0.4)
		if(src.Class=="Warrior")
			IncrementStat("Energy",0.75)
			IncrementStat("Strength",0.75)
			IncrementStat("Endurance",0.75)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",0.15)
			IncrementStat("Resistance",0.15)
			IncrementStat("Offense",0.75)
			IncrementStat("Defense",0.75)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",0.3)
			IncrementStat("Anger",0.4)
		if(src.Class=="Spiritualist")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",0.15)
			IncrementStat("Endurance",0.15)
			IncrementStat("Speed",0.25)
			IncrementStat("Force",0.75)
			IncrementStat("Resistance",0.75)
			IncrementStat("Offense",0.45)
			IncrementStat("Defense",0.45)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",1)
			IncrementStat("Anger",0.2)
//		if(src.Class=="Freelancer")
/*		if(src.Class=="Blue Mage")
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",0.2)
			IncrementStat("Anger",0.1)*/
	else if(blah=="Vampire")
		IncrementStat("Energy",1.5)
		IncrementStat("Strength",2.5)
		IncrementStat("Endurance",1.25)
		IncrementStat("Speed",2)
		IncrementStat("Force",2)
		IncrementStat("Resistance",1.25)
		IncrementStat("Offense",2.5)
		IncrementStat("Defense",2.5)
		IncrementStat("Regeneration",1.5)
		IncrementStat("Recovery",1)
		IncrementStat("Anger",1)
	else if(blah=="Lycan")
		IncrementStat("Energy",1)
		IncrementStat("Strength",2.5)//2.15
		IncrementStat("Endurance",2.5)//2.15
		IncrementStat("Speed",1.5)//1
		IncrementStat("Force",0.5)//0.75
		IncrementStat("Resistance",2)//1.75
		IncrementStat("Offense",2)//1
		IncrementStat("Defense",1.5)//1
		IncrementStat("Regeneration",1.0)//1
		IncrementStat("Recovery",0.5)//0.5
		IncrementStat("Anger",1)//0.75
	else if(blah=="Heran")
		if(src.Class=="Fighter")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",3)
			IncrementStat("Endurance",2.75)
			IncrementStat("Speed",1)
			IncrementStat("Force",1.5)
			IncrementStat("Resistance",3)
			IncrementStat("Offense",2.25)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",1)
			IncrementStat("Anger",0.75)
		if(src.Class=="Captain")
			IncrementStat("Energy",0.5)
			IncrementStat("Strength",3.5)
			IncrementStat("Endurance",2.5)
			IncrementStat("Speed",1.25)
			IncrementStat("Force",2)
			IncrementStat("Resistance",2.75)
			IncrementStat("Offense",2.5)
			IncrementStat("Defense",2)
			IncrementStat("Regeneration",1)
			IncrementStat("Recovery",1)
			IncrementStat("Anger",0.75)
	else if(blah=="Android")
		if(src.Class=="Fighter")
			IncrementStat("Energy",2)
			IncrementStat("Strength",0.5)
			IncrementStat("Endurance",0.5)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",0.5)
			IncrementStat("Resistance",0.5)
			IncrementStat("Offense",0.5)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",2)
		if(src.Class=="Juggernaut")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",4)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",-0.5)
			IncrementStat("Resistance",2)
			IncrementStat("Offense",0.25)
			IncrementStat("Defense",0.25)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",2)
		if(src.Class=="Hunter")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",2)
			IncrementStat("Endurance",0.5)
			IncrementStat("Speed",1)
			IncrementStat("Force",2)
			IncrementStat("Resistance",0.5)
			IncrementStat("Offense",1.5)
			IncrementStat("Defense",1.5)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",1)
		if(src.Class=="Engineer")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",0)
			IncrementStat("Endurance",1.5)
			IncrementStat("Speed",0.5)
			IncrementStat("Force",0.5)
			IncrementStat("Resistance",3)
			IncrementStat("Offense",0.75)
			IncrementStat("Defense",1)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",1)
		if(src.Class=="Slayer")
			IncrementStat("Energy",1.5)
			IncrementStat("Strength",1)
			IncrementStat("Endurance",0.5)
			IncrementStat("Speed",2)
			IncrementStat("Force",0.5)
			IncrementStat("Resistance",0.5)
			IncrementStat("Offense",2)
			IncrementStat("Defense",0.5)
			IncrementStat("Regeneration",0.5)
			IncrementStat("Recovery",1)
	else if(blah=="Hollow")
		IncrementStat("Energy",1)
		IncrementStat("Strength",1.25)
		IncrementStat("Endurance",1.25)
		IncrementStat("Speed",0.5)
		IncrementStat("Force",1.25)
		IncrementStat("Resistance",1.25)
		IncrementStat("Offense",1.25)
		IncrementStat("Defense",1.25)
		IncrementStat("Regeneration",1)
		IncrementStat("Anger",0.5)
		IncrementStat("Recovery",0.25)
	else if(blah=="Popo")
		IncrementStat("Energy",6.5)
		IncrementStat("Strength",74)
		IncrementStat("Endurance",74)
		IncrementStat("Speed",6.5)
		IncrementStat("Force",74)
		IncrementStat("Resistance",74)
		IncrementStat("Offense",74)
		IncrementStat("Defense",74)
		IncrementStat("Regeneration",6.5)
		IncrementStat("Recovery",6.5)
		IncrementStat("Anger",4)
	else if(blah=="Quarter Saiyan")
		/* pre-rework
		IncrementStat("Energy",1)
		IncrementStat("Strength",2.5)
		IncrementStat("Endurance",2.5)
		IncrementStat("Speed",1.25)
		IncrementStat("Force",1)
		IncrementStat("Resistance",0.75)
		IncrementStat("Offense",2)
		IncrementStat("Defense",2)
		IncrementStat("Regeneration",1)
		IncrementStat("Recovery",1.5)
		IncrementStat("Anger",2)
		*/
		///
		IncrementStat("Energy",1.5)
		IncrementStat("Strength",2.25)
		IncrementStat("Endurance",2.0)
		IncrementStat("Speed",2.75)
		IncrementStat("Force",2.0)
		IncrementStat("Resistance",1.5)
		IncrementStat("Offense",2.0)
		IncrementStat("Defense",2.0)
		IncrementStat("Recovery",1.75)
		IncrementStat("Anger",1.0)
		///
	else if(blah=="1/16th Saiyan")
		IncrementStat("Energy",1.5)
		IncrementStat("Strength",2.5)
		IncrementStat("Endurance",2.5)
		IncrementStat("Speed",1.25)
		IncrementStat("Force",1.5)
		IncrementStat("Resistance",0.75)
		IncrementStat("Offense",1.75)
		IncrementStat("Defense",1.75)
		IncrementStat("Regeneration",0.5)
		IncrementStat("Recovery",1)
		IncrementStat("Anger",0.75)
	else if(blah=="Morphling")
		IncrementStat("Energy",-0.5)
		IncrementStat("Strength",-0.5)
		IncrementStat("Endurance",-0.5)
		IncrementStat("Speed",-0.5)
		IncrementStat("Force",-0.5)
		IncrementStat("Resistance",-0.5)
		IncrementStat("Offense",-0.5)
		IncrementStat("Defense",-0.5)
		IncrementStat("Regeneration",-0.5)
		IncrementStat("Recovery",-0.5)
		IncrementStat("Anger",0)
		//I want to finish these but there are already so many rares.
	//	SetStatPoints(90)
	//else
	//	SetStatPoints(10)








mob/proc/RacialStats(var/blah)
	for(var/obj/SavedStats/Z in src)
		del(Z)
	src.ResetStats()
	src.contents+=new/obj/SavedStats
	if(!length(GenRaces) || (length(GenRaces)))//||usr.Race=="Half Saiyan")
		Stats("[usr.Race]")
		if(Race=="Alien")
			SetStatPoints(75)
			if(BodyType=="Large"||BodyType=="Small")
				SetStatPoints(0)
		/*	if(src.Class=="Lycan")
				IncrementStat("Energy",0.5)
				IncrementStat("Endurance",0.5)
				IncrementStat("Strength",1)
				IncrementStat("Speed",0.5)
				IncrementStat("Force",-0.9)
				IncrementStat("Resistance",1)
				IncrementStat("Offense",1.2)
				IncrementStat("Defense",-0.2)
				IncrementStat("Regeneration",1.5)
				IncrementStat("Recovery",0.5)
				IncrementStat("Anger",0.5)
				SetStatPoints(15)

			else if(src.Class=="Vampire")
				IncrementStat("Energy",1)
				IncrementStat("Endurance",-0.25)
				IncrementStat("Strength",0.75)
				IncrementStat("Speed",1.5)
				IncrementStat("Force",1)
				IncrementStat("Resistance",-0.25)
				IncrementStat("Offense",0.75)
				IncrementStat("Defense",1.5)
				IncrementStat("Regeneration",1.2)
				IncrementStat("Recovery",0.7)
				IncrementStat("Anger",0.6)
				SetStatPoints(15)*/


/*			else if(src.Class=="Bojack")
				SetStatPoints(30)*/

//		else if(Race=="Human")
//			SetStatPoints(15)
//		else if(Race=="Spirit Doll")
//			SetStatPoints(20
		else if(Race=="Android")
			if(Class=="Fighter")
				SetStatPoints(75)
				if(BodyType=="Large"||BodyType=="Small")
					SetStatPoints(0)
			else
				SetStatPoints(25)
		else if(Race=="Aetherian")
			SetStatPoints(75)
			if(BodyType=="Large"||BodyType=="Small")
				SetStatPoints(80)
		else if(Race=="Morphling")
			SetStatPoints(90)
		else if(Race=="Hollow")
			SetStatPoints(30)
		else
			SetStatPoints(25)
			if(BodyType=="Large"||BodyType=="Small")
				SetStatPoints(25)
	else
		var/numba=1
		for(var/Q in src.GenRaces)
			if(numba==0)
				src.Stats("[Q]")
			else
				var/mob/M=new
				M.Stats("[Q]")
				src.EnergyMod+=M.EnergyMod
				src.StrengthMod+=M.StrengthMod
				src.EnduranceMod+=M.EnduranceMod
				src.SpeedMod+=M.SpeedMod
				src.ForceMod+=M.ForceMod
				src.ResistanceMod+=M.ResistanceMod
				src.OffenseMod+=M.OffenseMod
				src.DefenseMod+=M.DefenseMod
				src.Regeneration+=M.Regeneration
				src.Recovery+=M.Recovery
				src.AngerMax+=M.AngerMax
				del(M)
			numba++
		src.EnergyMod/=numba
		src.StrengthMod/=numba
		src.EnduranceMod/=numba
		src.SpeedMod/=numba
		src.ForceMod/=numba
		src.ResistanceMod/=numba
		src.OffenseMod/=numba
		src.DefenseMod/=numba
		src.Regeneration/=numba
		src.Recovery/=numba
		src.AngerMax/=numba
		if(src.BodyType=="Medium")
			SetStatPoints(25)
		else
			SetStatPoints(25)
	src.ClassBodyStats()
	src.GetIncrements()
	//if(client)PerkDisplay()
	//if(client)Show_Stat_Menu()




mob/var/RewardPoints=0
mob/verb/RewardPoints(type as text)
	set name=".StatReward"
	set hidden=1
	var/RecalcedStrength
	var/RecalcedEndurance
//	var/RecalcedSpeed
	var/RecalcedForce
	var/RecalcedResistance
	var/RecalcedOffense
	var/RecalcedDefense
	var/RecalcedEnergy
	if(type in list("Strength","Endurance","Energy","Resistance","Force","Speed","Offense","Defense","Intelligence","Enchantment"))
		if(RewardPoints>0)
			if(type=="Energy")
				src<<"Nope."
				return
		/*		if(EnergyGains*10*(EnergyMod/2)*(PlayerEnergyGains)>5000)
					src.vars["EnergyMax"]+=5000
				else
					src.vars["EnergyMax"]+=EnergyGains*10*(EnergyMod/2)*(PlayerEnergyGains)
				RewardPoints--*/
			else if(type=="Intelligence")
				usr<<"Temporarily removed."
				return
				if(RewardPoints>=40/src.vars["Intelligence"])
					src.vars["IntelligenceLevel"]+=1
					RewardPoints-=40/src.vars["Intelligence"]
					usr.spentrp+=40/src.vars["Intelligence"]
			else if(type=="Enchantment")
				usr<<"Temporarily removed."
				return
				if(RewardPoints>=40/src.vars["Enchantment"])
					src.vars["EnchantmentLevel"]+=1
					usr.spentrp+=40/src.vars["Enchantment"]
					RewardPoints-=40/src.vars["Enchantment"]
			else
				src.vars[type]+=src.vars["[type]Mod"]/(1/src.GetPowerRank(1))
				RewardPoints--
				usr.spentrp++
			RecalcedStrength=src.vars["StrengthMod"]/(1/src.GetPowerRank(1))
			RecalcedEndurance=src.vars["EnduranceMod"]/(1/src.GetPowerRank(1))
//			RecalcedSpeed=src.vars["SpeedMod"]/(1/src.GetPowerRank(1))
			RecalcedForce=src.vars["ForceMod"]/(1/src.GetPowerRank(1))
			RecalcedResistance=src.vars["ResistanceMod"]/(1/src.GetPowerRank(1))
			RecalcedOffense=src.vars["OffenseMod"]/(1/src.GetPowerRank(1))
			RecalcedDefense=src.vars["DefenseMod"]/(1/src.GetPowerRank(1))
			RecalcedEnergy=src.vars["EnergyMod"]/2*10*EnergyGains*(PlayerEnergyGains)
			if(RecalcedEnergy>5000)
				RecalcedEnergy=5000
		winset(src,"RewardPoints","text=[RewardPoints]")
		winset(src,"LabelRewardStrength","text=[RecalcedStrength]")
		winset(src,"LabelRewardEnd","text=[RecalcedEndurance]")
//		winset(src,"LabelRewardSpeed","text=[RecalcedSpeed]")
		winset(src,"LabelRewardForce","text=[RecalcedForce]")
		winset(src,"LabelRewardResistance","text=[RecalcedResistance]")
		winset(src,"LabelRewardOffense","text=[RecalcedOffense]")
		winset(src,"LabelRewardDefense","text=[RecalcedDefense]")
//		winset(src,"LabelRewardEnergy","text=[RecalcedEnergy]")
		winset(src,"LabelRewardEnchant","text=[40/src.vars["Enchantment"]]")
		winset(src,"LabelRewardIntel","text=[40/src.vars["Intelligence"]]")





mob/verb/Skill_Points(type as text,skill as text)
	set name=".Skill_Points"
	set hidden=1
	var/Increase=1
	var/Diminishing=1
	if(!(skill in list("Energy","Strength","Endurance","Force","Resistance","Offense","Defense","Recovery","Speed")))return
	if(type=="-")
		if(Points==Max_Points) return //You cant subtract any more points if points are full
		Increase=-1
	if(type=="+")
		Increase=1//*(Points/100)
		if(Points==0) return //You cant add any more points if you had none left

	if(locate(/obj/SavedStats) in usr)
		for(var/obj/SavedStats/Z in src.contents)
			if(Z.BaseStatsSet == 0)
				Z.EnergyBaseStat = Z.EnergyModGain*10*Diminishing
				Z.StrengthBaseStat = Z.StrengthModGain*10*Diminishing
				Z.EnduranceBaseStat = Z.EnduranceModGain*10*Diminishing
				Z.SpeedBaseStat=	Z.SpeedModGain*10*Diminishing
				Z.ForceBaseStat = Z.ForceModGain*10*Diminishing
				Z.ResistanceBaseStat = Z.ResistanceModGain*10*Diminishing
				Z.OffenseBaseStat = Z.OffenseModGain*10*Diminishing
				Z.DefenseBaseStat = Z.DefenseModGain*10*Diminishing
				Z.RegenerationBaseStat = Z.RegenerationGain*10*Diminishing
				Z.RecoveryBaseStat = Z.RecoveryGain*10*Diminishing
				Z.BaseStatsSet = 1
	//		var/EnergyMin=Z.EnergyModGain*10*Diminishing
			var/StrengthMin=Z.StrengthModGain*10*Diminishing
			var/EnduranceMin=Z.EnduranceModGain*10*Diminishing
			var/SpeedMin=Z.SpeedModGain*10*Diminishing
			var/ForceMin=Z.ForceModGain*10*Diminishing
			var/ResistanceMin=Z.ResistanceModGain*10*Diminishing
			var/OffenseMin=Z.OffenseModGain*10*Diminishing
			var/DefenseMin=Z.DefenseModGain*10*Diminishing
//			var/RegenerationMin=Z.RegenerationGain*10*Diminishing
	//		var/RecoveryMin=Z.RecoveryGain*10*Diminishing
//			var/AngerMin=Z.AngerGain*10
			var/PowerValue=0.124
			if(Race=="Alien"||Race=="Aetherian"||Race=="Android"&&Class=="Fighter")
				PowerValue=0.062
			switch(skill)
				if("Energy")
					return
				/*	if(type=="-")if(EnergyMod<=EnergyMin)return
					Z.EnergyModPoints += Increase
					if(Z.EnergyModPoints == 0)
						EnergyMod = Z.EnergyBaseStat
					else
						EnergyMod =  round(Z.EnergyBaseStat + ( (Z.EnergyBaseStat*0.1) * ( Z.EnergyModPoints * ( 1 / (Z.EnergyModPoints **PowerValue) ) ) ) , 0.01)
					//IncrementStat("Energy",Increase)
					winset(src,"[skill]","text=[EnergyMod]")*/
				if("Strength")
					if(type=="-") if(StrengthMod<=StrengthMin)return
					Z.StrengthModPoints += Increase
					if(Z.StrengthModPoints == 0)
						StrengthMod = Z.StrengthBaseStat
					else
						StrengthMod =  round(Z.StrengthBaseStat + ( (Z.StrengthBaseStat*0.1) * ( Z.StrengthModPoints * ( 1 / (Z.StrengthModPoints **PowerValue) ) ) ) , 0.01)
					//IncrementStat("Strength",Increase)
					winset(src,"[skill]","text=[StrengthMod]")
				if("Endurance")
					if(type=="-") if(EnduranceMod<=EnduranceMin)return
					Z.EnduranceModPoints += Increase
					if(Z.EnduranceModPoints == 0)
						EnduranceMod = Z.EnduranceBaseStat
					else
						EnduranceMod =  round(Z.EnduranceBaseStat + ( (Z.EnduranceBaseStat*0.1) * ( Z.EnduranceModPoints * ( 1 / (Z.EnduranceModPoints **PowerValue) ) ) ) , 0.01)
					//IncrementStat("Endurance",Increase)
					winset(src,"[skill]","text=[EnduranceMod]")
				if("Speed")
					if(type=="-") if(SpeedMod<=SpeedMin)return
					Z.SpeedModPoints += Increase
					if(Z.SpeedModPoints == 0)
						SpeedMod = Z.SpeedBaseStat
					else
						SpeedMod =  round(Z.SpeedBaseStat + ( (Z.SpeedBaseStat*0.05) * ( Z.SpeedModPoints * ( 1 / (Z.SpeedModPoints **PowerValue) ) ) ) , 0.01)
					//IncrementStat("Speed",Increase*0.5)
					winset(src,"[skill]","text=[SpeedMod]")
				if("Force")
					if(type=="-") if(ForceMod<=ForceMin)return
					Z.ForceModPoints += Increase
					if(Z.ForceModPoints == 0)
						ForceMod = Z.ForceBaseStat
					else
						ForceMod =  round(Z.ForceBaseStat + ( (Z.ForceBaseStat*0.1) * ( Z.ForceModPoints * ( 1 / (Z.ForceModPoints **PowerValue) ) ) ) , 0.01)
					//IncrementStat("Force",Increase)
					winset(src,"[skill]","text=[ForceMod]")
				if("Resistance")
					if(type=="-") if(ResistanceMod<=ResistanceMin)return
					Z.ResistanceModPoints += Increase
					if(Z.ResistanceModPoints == 0)
						ResistanceMod = Z.ResistanceBaseStat
					else
						ResistanceMod =  round(Z.ResistanceBaseStat + ( (Z.ResistanceBaseStat*0.1) * ( Z.ResistanceModPoints * ( 1 / (Z.ResistanceModPoints **PowerValue) ) ) ) , 0.01)
					//IncrementStat("Resistance",Increase)
					winset(src,"[skill]","text=[ResistanceMod]")
				if("Offense")
					if(type=="-") if(OffenseMod<=OffenseMin)return
					Z.OffenseModPoints += Increase
					if(Z.OffenseModPoints == 0)
						OffenseMod = Z.OffenseBaseStat
					else
						OffenseMod =  round(Z.OffenseBaseStat + ( (Z.OffenseBaseStat*0.1) * ( Z.OffenseModPoints * ( 1 / (Z.OffenseModPoints **PowerValue) ) ) ) , 0.01)
					//IncrementStat("Offense",Increase)
					winset(src,"[skill]","text=[OffenseMod]")
				if("Defense")
					if(type=="-") if(DefenseMod<=DefenseMin)return
					Z.DefenseModPoints += Increase
					if(Z.DefenseModPoints == 0)
						DefenseMod = Z.DefenseBaseStat
					else
						DefenseMod =  round(Z.DefenseBaseStat + ( (Z.DefenseBaseStat*0.1) * ( Z.DefenseModPoints * ( 1 / (Z.DefenseModPoints **PowerValue) ) ) ) , 0.01)
					//IncrementStat("Defense",Increase)
					winset(src,"[skill]","text=[DefenseMod]")
				if("Regeneration")
					return
				//	if(type=="-") if(Regeneration<=RegenerationMin)return
				//	IncrementStat("Regeneration",Increase)
				//	winset(src,"[skill]","text=[Regeneration]")
				if("Recovery")
					return
		/*			if(type=="-") if(Recovery<=RecoveryMin)return
					Z.RecoveryModPoints += Increase
					if(Z.RecoveryModPoints == 0)
						Recovery = Z.RecoveryBaseStat
					else
						Recovery =  round(Z.RecoveryBaseStat + ( (Z.RecoveryBaseStat*0.1) * ( Z.RecoveryModPoints * ( 1 / (Z.RecoveryModPoints **PowerValue) ) ) ) , 0.01)
					//IncrementStat("Recovery",Increase)
					winset(src,"[skill]","text=[Recovery]")*/
				if("Anger")
					return
				//	if(type=="-") if(AngerMax<=AngerMin)return
				//	IncrementStat("Anger",Increase)
				//	winset(src,"[skill]","text=[AngerMax*100]%")
			Points-=Increase
			winset(src,"Points Remaining","text=[Points]")
	if(prob(5))
		winshow(src,"stuffstuffstuffstuffstuff",1)
		winset(src,"stuffstuffstuffstuffstuff","image=['Stare.png']")
	else
		winshow(src,"stuffstuffstuffstuffstuff",0)

obj/Redo_Stats
	var/Last_Redo=0
	verb/Redo_Stats()
		set category="Other"
	//	if(usr.Redoing_Stats) return
	/*	if(Last_Redo+5>Year)
			usr<<"You can not do this til year [Last_Redo+5]"
			return*/
		usr.BodyType=input("Select body type before the redo process begins.")in list("Small","Medium","Large")
		usr.Redo_Stats()
		Last_Redo=Year
		del src

mob/proc/Redo_Stats()
	set category="Other"
	usr.Redoing_Stats=1//So ngrs can't redo again if they have the verb for some reason.
	usr.ResetAll()
	usr.ResetStats()
	usr.RacialStats()
	usr.UpdateBio()
	var/mob/Creation/C = new
	C.NextStep2(usr)//while(winget(src,"skills","is-visible")=="true") sleep(1)
	del C

mob/proc/ResetAll()
	Strength=Strength/StrengthMod
	Endurance=Endurance/EnduranceMod
	Force=Force/ForceMod
	Resistance=Resistance/ResistanceMod
	Speed=Speed/SpeedMod
	Energy=Energy/EnergyMod
	Offense=Offense/OffenseMod
	Defense=Defense/DefenseMod



mob/proc/ResetStats()
	StrengthMod=1
	EnduranceMod=1
	ForceMod=1
	ResistanceMod=1
	SpeedMod=1
	EnergyMod=1
	OffenseMod=1
	DefenseMod=1
	Regeneration=1
	Recovery=1
	AngerMax=1

mob/proc/PerkDisplay()
	winset(src,"Points Remaining","text=[Points]")
	winset(src,"Race BP","text=\"[BaseMod]x Battle Power\"")
	winset(src,"TrainingRate","text=\"[Training_Rate]x Training\"")
	winset(src,"MeditationRate","text=\"[Meditation_Rate]x Meditation\"")
	winset(src,"ZenkaiRate","text=\"[Zenkai_Rate]x Zenkai\"")
	/*winset(src,"TechRate","text=\"[src.Intelligence]x Intelligence\"")*/
	/*winset(src,"EnchanterRate","text=\"[src.Enchantment]x Enchantment\"")*/
	winset(src,"Energy","text=[EnergyMod]")
	winset(src,"Strength","text=[StrengthMod]")
	winset(src,"Endurance","text=[EnduranceMod]")
	winset(src,"Speed","text=[SpeedMod]")
	winset(src,"Force","text=[ForceMod]")
	winset(src,"Resistance","text=[ResistanceMod]")
	winset(src,"Offense","text=[OffenseMod]")
	winset(src,"Defense","text=[DefenseMod]")
	winset(src,"Regeneration","text=[Regeneration]")
	winset(src,"Recovery","text=[Recovery]")
	winset(src,"Anger","text=[AngerMax*100]%")

mob/proc/SetStatPoints(Amount=0)
	src.Points=Amount//+=
	src.Max_Points=Amount//+=


mob/proc/GetIncrements()
	for(var/obj/SavedStats/Z in src.contents)
		Z.EnergyModGain=EnergyMod/10
		Z.SpeedModGain=SpeedMod/10
		Z.StrengthModGain=StrengthMod/10
		Z.EnduranceModGain=EnduranceMod/10
		Z.ForceModGain=ForceMod/10
		Z.ResistanceModGain=ResistanceMod/10
		Z.OffenseModGain=OffenseMod/10
		Z.DefenseModGain=DefenseMod/10
		Z.RegenerationGain=Regeneration/10
		Z.RecoveryGain=Recovery/10
		Z.AngerGain=AngerMax/10

mob/proc/Show_Stat_Menu()
	PerkDisplay()
	winshow(src,"skills",1)
mob/var/tmp/Redoing_Stats
mob/var/tmp/Points=0
mob/var/tmp/Max_Points=10

obj/SavedStats
	var

		BaseStatsSet = 0
		EnergyBaseStat = 0
		StrengthBaseStat = 0
		EnduranceBaseStat = 0
		ForceBaseStat = 0
		ResistanceBaseStat = 0
		OffenseBaseStat = 0
		SpeedBaseStat = 0
		DefenseBaseStat = 0
		RegenerationBaseStat = 0
		RecoveryBaseStat = 0
		EnergyModPoints = 0
		StrengthModPoints = 0
		EnduranceModPoints = 0
		//Base Stat + ( (BaseStat*0.1) * ( Points Added * ( 1 /(Points Added ^0.124) ) ) )
		ForceModPoints = 0
		ResistanceModPoints = 0
		SpeedModPoints = 0
		OffenseModPoints = 0
		SpeedModStat = 0
		DefenseModPoints = 0
		RegenerationModPoints = 0
		RecoveryModPoints = 0
		EnergyModGain=1
		SpeedModGain=1
		StrengthModGain=1
		EnduranceModGain=1
		ForceModGain=1
		ResistanceModGain=1
		OffenseModGain=1
		DefenseModGain=1
		RegenerationGain=1
		RecoveryGain=1
		AngerGain=1


mob/proc/IncrementStat(Stat,Amount=1)
	for(var/obj/SavedStats/Z in src.contents)
		if(Stat=="Energy")
			EnergyMod+=Z.EnergyModGain*Amount
		if(Stat=="Speed")
			SpeedMod+=Z.SpeedModGain*Amount
		if(Stat=="Strength")
			StrengthMod+=Z.StrengthModGain*Amount
		if(Stat=="Endurance")
			EnduranceMod+=Z.EnduranceModGain*Amount
		if(Stat=="Force")
			ForceMod+=Z.ForceModGain*Amount
		if(Stat=="Resistance")
			ResistanceMod+=Z.ResistanceModGain*Amount
		if(Stat=="Offense")
			OffenseMod+=Z.OffenseModGain*Amount
		if(Stat=="Defense")
			DefenseMod+=Z.DefenseModGain*Amount
		if(Stat=="Regeneration")
			Regeneration+=Z.RegenerationGain*Amount
		if(Stat=="Recovery")
			Recovery+=Z.RecoveryGain*Amount
		if(Stat=="Anger")
			AngerMax+=Z.AngerGain*Amount
		return
	if(Stat=="Energy")
		EnergyMod+=Amount
	if(Stat=="Speed")
		SpeedMod+=Amount
	if(Stat=="Strength")
		StrengthMod+=Amount
	if(Stat=="Endurance")
		EnduranceMod+=Amount
	if(Stat=="Force")
		ForceMod+=Amount
	if(Stat=="Resistance")
		ResistanceMod+=Amount
	if(Stat=="Offense")
		OffenseMod+=Amount
	if(Stat=="Defense")
		DefenseMod+=Amount
	if(Stat=="Regeneration")
		Regeneration+=Amount
	if(Stat=="Recovery")
		Recovery+=Amount
	if(Stat=="Anger")
		AngerMax+=0.5*Amount

mob/verb/Skill_Points_Done()
	set name=".Skill_Points_Done"
	set hidden=1
	if(Points) src<<"You still have points!"
	else
		winshow(src,"Finalize_Screen",0)
		for(var/obj/SavedStats/Z in usr.contents)
			del(Z)
		if(!usr.Savable)
			usr.NewMob()