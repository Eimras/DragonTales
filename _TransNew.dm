mob/var/list/ssj=list(\
"1req"=0,"1mastery"=0,"1give"=0,"1multi"=1,
"2req"=0,"2mastery"=5,"2give"=0,"2multi"=1,
"3req"=0,"3mastery"=10,"3give"=0,"3multi"=1,
//"4req"=1000000000, "4mastery"=10, "4give"= 0, "4multi" = 5,
"active"=0,"unlocked"=0,"transing"=0)
/*
mob/var/list/scl=list(\
"active"=0,"unlocked"=0,"transing"=0)
mob/var/list/snj=list(\
"active"=0,"unlocked"=0,"transing"=0)
mob/var/list/sdj=list(\
"active"=0,"unlocked"=0,"transing"=0)
mob/var/list/shj=list(\
"active"=0,"unlocked"=0,"transing"=0)*/
mob/var/list/trans=list(\
"active"=0,"unlocked"=0,"transing"=0)
mob/var/list/masteries=list(\
"1mastery"=60,"2mastery"=1,"3mastery"=60,"4mastery"=50)





mob/proc/SetVars()
	if(src.Race=="Nobody")
		src.trans["1req"]=100
		src.trans["1give"]=10000000
		src.trans["1multi"]=3

	if(src.Race== "Heran")
		if(src.Class=="Fighter")
			src.trans["1req"] = 200
			src.trans["1give"] = 15000000
			src.trans["1multi"]=1.5

			src.trans["2multi"]=2
			src.trans["2req"] = 25000000
			src.trans["2give"] = 85000000
		if(src.Class=="Captain")
			src.trans["1req"] = 200
			src.trans["1give"] = 35000000
			src.trans["1multi"]=2

			src.trans["2multi"]=2
			src.trans["2req"] = 25000000
			src.trans["2give"] = 175000000

		/*src.trans["3multi"]=2
		src.trans["3req"] = 55000000
		src.trans["3give"] = 50000000*/
	if(src.Race== "Lycan")
		src.trans["1req"] = 2500000
		src.trans["1give"] = 15000000
		src.trans["1multi"]=3

		//I decided to throw this in here for shits and giggles even though it might be too OP
		src.trans["2multi"]=2
		src.trans["2req"] = 60000000
		src.trans["2give"] = 45000000
	if(src.Race== "Manakete")
		src.trans["1req"] = 2500000
		src.trans["1give"] = 15000000
		src.trans["1multi"]=3

		//I decided to throw this in here for shits and giggles even though it might be too OP
		src.trans["2multi"]=2
		src.trans["2req"] = 60000000
		src.trans["2give"] = 45000000


	if(src.Race == "Alien")
		src.trans["1multi"] = 3
		src.trans["2multi"] = 2
		src.trans["3multi"] = 2

	if(src.Race== "Namekian")
		if(src.Class == "Fighter")
			src.trans["1req"] = 2500000
			src.trans["1give"] = 25000000
			src.trans["1multi"] = 1.5
		/*if(src.Class == "Ascendant")
			src.trans["1req"] = 200
			src.trans["1give"] = 125000000
			src.trans["1multi"] = 1.5
		if(src.Class == "Healer")
			src.trans["1req"] = 200
			src.trans["1give"] = 50000000
			src.trans["1multi"] = 1.25*/
		if(src.Class == "Ancient")
			src.trans["1req"] = 100
			src.trans["1give"] = 100000000
			src.trans["1multi"] = 3
	if(src.Race== "Youkai")
		/*if(src.Class == "Kitsune")
			src.trans["1req"] = 0
			src.trans["1give"] = 0
			src.trans["1multi"] = 1*/
		if(src.Class == "Hell Raven")
			src.trans["1req"] = 1000
			src.trans["1give"] = 10000000
			src.trans["1multi"] = 1.5

			src.trans["2req"] = 1000
			src.trans["2give"] = 50000000
			src.trans["2multi"] = 2

			src.trans["3req"] = 1000
			src.trans["3give"] = 100000000
			src.trans["3multi"] = 2

		/*if(src.Class == "Tanuki")
			src.trans["1req"] = 20000000
			src.trans["1give"] = 15000000
			src.trans["1multi"] = 2

			src.trans["2req"] = 150000000
			src.trans["2give"] = 70000000
			src.trans["2multi"] = 2.5*/
/*	if(src.Race == "Kaio")
		src.trans["1req"] = 2500000
		src.trans["1give"] = 7500000
		src.trans["1multi"] = 1.5

		src.trans["2req"] = 45000000
		src.trans["2give"] = 15000000
		src.trans["2multi"] = 2*/
	if(src.Race=="Hollow")
		if(src.Class == "Gillian Arrancar")
			src.trans["1req"] = 3750000
			src.trans["1give"] = 10000000
			src.trans["1multi"] = 2

			src.trans["2req"] = 50000000
			src.trans["2give"] = 100000000
			src.trans["2multi"] = 2
		if(src.Class == "Adjuucha Arrancar")
			src.trans["1req"] = 5625000
			src.trans["1give"] = 7500000
			src.trans["1multi"] = 1.5

			src.trans["2req"] = 50000000
			src.trans["2give"] = 75000000
			src.trans["2multi"] = 2
		if(src.Class == "Vasto Arrancar")
			src.trans["1req"] = 7500000
			src.trans["1give"] = 7500000
			src.trans["1multi"] = 1.25

			src.trans["2req"] = 50000000
			src.trans["2give"] = 75000000
			src.trans["2multi"] = 2
		if(src.Class == "Ascended Arrancar")//Hidden SSj4 Equal.
			src.trans["1req"] = 1
			src.trans["1give"] = 50000000
			src.trans["1multi"] = 1.5

			src.trans["2req"] = 100000000
			src.trans["2give"] = 150000000
			src.trans["2multi"] = 2
		if(src.Class == "Transcended Arrancar")//Hidden SSjG Equal.
			src.trans["1req"] = 1
			src.trans["1give"] = 50000000
			src.trans["1multi"] = 1.5

			src.trans["2req"] = 100000000
			src.trans["2give"] = 150000000
			src.trans["2multi"] = 2

	if(src.Race== "Demi")
		var/list/GodModeClasses = list("Hercules","Hades","Zeus","Poseidon")
		var/list/CronusClasses = list("Uranus","Hemera","Shukra","Erebus","Red Dick")
		var/list/OceanusClasses = list("Thalassa","Pontus","Raktavija","Hydros","Pink Guy")
		var/list/HyperionClasses = list("Aether","Nyx","Vritra","Chaos","Filthy Frank")


		if(src.Class in GodModeClasses)
			src.trans["1req"] = 3000000
			src.trans["1give"] = 10000000
			src.trans["1multi"] = 1.25
		if(src.Class in CronusClasses)
			src.trans["1req"] = 3000000
			src.trans["1give"] = 60000000
			src.trans["1multi"] = 1.5
		if(src.Class in OceanusClasses)
			src.trans["1req"] = 3000000
			src.trans["1give"] = 45000000
			src.trans["1multi"] = 2
		if(src.Class in HyperionClasses)
			src.trans["1req"] = 3000000
			src.trans["1give"] = 30000000
			src.trans["1multi"] = 2.5
		src.trans["2req"] = 150000000 // Mantra/Form 2
		src.trans["2give"] = 50000000
		src.trans["2multi"] = 1

		if(src.Class == "Prime Zeus")
			src.trans["1req"] = 3000000
			src.trans["1give"] = 100000000
			src.trans["1multi"] = 1
		if(src.Class == "Prime Poseidon")
			src.trans["1req"] = 3000000
			src.trans["1give"] = 200000000
			src.trans["1multi"] = 1
		if(src.Class == "Prime Hades")
			src.trans["1req"] = 3000000
			src.trans["1give"] = 450000000
			src.trans["1multi"] = 1
		if(src.Class == "Prime Heracles")
			src.trans["1req"] = 3000000
			src.trans["1give"] = 350000000
			src.trans["1multi"] = 1

		if(src.Class == "Asura")
			src.trans["1req"] = 30000000
			src.trans["1give"] = 50000000
			src.trans["1multi"] = 2
		if(src.Class == "Mantra")
			src.trans["1req"] = 30000000
			src.trans["1give"] = 50000000
			src.trans["1multi"] = 2
	if(src.Race== "Demon")
		if(src.Class == "Mazoku")
			src.trans["1req"] = 5000000
			src.trans["1give"] = 4000000
			src.trans["1multi"] = 1.1

			src.trans["2req"] = 60000000
			src.trans["2give"] =25000000
			src.trans["2multi"] = 3
		else if(src.Class == "Wrath")
			src.trans["1req"] = 5000000
			src.trans["1give"] = 4000000
			src.trans["1multi"] = 1.5

			src.trans["2req"] = 60000000
			src.trans["2give"] = 25000000
			src.trans["2multi"] = 2
		else if(src.Class != "Wrath"&&src.Class!="Mazoku")
			src.trans["1req"] = 5000000
			src.trans["1give"] = 13000000
			src.trans["1multi"] = 2

			src.trans["2req"] = 45000000
			src.trans["2give"] = 80000000
			src.trans["2multi"] = 2.5


	if(src.Race== "Half Demon")
		if(src.Class != "Wrath")
		{
			src.trans["1req"] = 1500000
			src.trans["1give"] = 10000000
			src.trans["1multi"] = 1.5

			src.trans["2req"] = 45000000
			src.trans["2give"] = 45000000
			src.trans["2multi"] = 2

			src.trans["3req"] = 45000000
			src.trans["3give"] = 95000000
			src.trans["3multi"] = 2.5
		}
		else
		{
			src.trans["1req"] = 2000000
			src.trans["1give"] = 5000000
			src.trans["1multi"] = 1.25

			src.trans["2req"] = 90000000
			src.trans["2give"] = 25000000
			src.trans["2multi"] = 1.75

			src.trans["3req"] = 45000000
			src.trans["3give"] = 55000000
			src.trans["3multi"] = 2
		}

	if(src.Race=="Saiyan")
		if(src.Class=="Divine")
			src.ssj["1req"]=2000000
			src.ssj["1give"]=12000000
			src.ssj["1multi"]=1.25

			src.ssj["2req"]=45000000
			src.ssj["2give"]=30000000
			src.ssj["2multi"]=1.25

			src.ssj["3req"]=300000000
			src.ssj["3give"]=125000000
			src.ssj["3multi"]=2

		if(src.Class=="Normal")
			src.ssj["1req"]=3500000
			src.ssj["1give"]=17500000
			src.ssj["1multi"]=1.5
			if(src.ssj["1mastery"]>=100)
				src.ssj["1give"]=26250000
				src.ssj["1multi"]=1.5


			src.ssj["2req"]=45000000
			src.ssj["2give"]=50000000
			src.ssj["2multi"]=2
			if(src.ssj["2mastery"]>=100)
				src.ssj["2give"]=75000000
				src.ssj["2multi"]=2


			src.ssj["3req"]=300000000
			src.ssj["3give"]=150000000
			src.ssj["3multi"]=2.5
			if(src.ssj["3mastery"]>=100)
				src.ssj["3give"]=225000000
				src.ssj["3multi"]=2.5

		if(src.Class=="Low-Class")
			src.ssj["1req"]=3000000
			src.ssj["1give"]=15000000
			src.ssj["1multi"]=1.5
			if(src.ssj["1mastery"]>=100)
				src.ssj["1give"]=22500000
				src.ssj["1multi"]=1.5

			src.ssj["2req"]=45000000
			src.ssj["2give"]=40000000
			src.ssj["2multi"]=2
			if(src.ssj["2mastery"]>=100)
				src.ssj["2give"]=60000000
				src.ssj["2multi"]=2

			src.ssj["3req"]=300000000
			src.ssj["3give"]=100000000
			src.ssj["3multi"]=2.5
			if(src.ssj["3mastery"]>=100)
				src.ssj["3give"]=150000000
				src.ssj["3multi"]=2.5

		else if(src.Class=="Elite")
			src.ssj["1req"]=6500000
			src.ssj["1give"]=20000000
			src.ssj["1multi"]=1.5
			if(src.ssj["1mastery"]>=100)
				src.ssj["1give"]=30000000
				src.ssj["1multi"]=1.5

			src.ssj["2req"]=45000000
			src.ssj["2give"]=60000000
			src.ssj["2multi"]=2
			if(src.ssj["2mastery"]>=100)
				src.ssj["2give"]=90000000
				src.ssj["2multi"]=2

			src.ssj["3req"]=300000000
			src.ssj["3give"]=200000000
			src.ssj["3multi"]=2.5
			if(src.ssj["3mastery"]>=100)
				src.ssj["3give"]=300000000
				src.ssj["3multi"]=2.5

		else if(src.Class=="Legendary")
			src.ssj["1req"]=200000
			src.ssj["1give"]=0//15000000
			src.ssj["1multi"]=5
			if(src.ssj["1mastery"]>=50)
				src.ssj["1give"]=20000000
			if(src.ssj["1mastery"]>=100)
				src.ssj["1give"]=50000000


			src.ssj["2req"]=25000000
			src.ssj["2give"]=70000000
			src.ssj["2multi"]=1.5

			src.ssj["3req"]=500000000
			src.ssj["3give"]=2000000000
			src.ssj["3multi"]=3

		else if(src.Class== "Hellspawn")
			src.ssj["1req"]=5000000
			src.ssj["1give"]=5000000
			src.ssj["1multi"]=5
		else if(src.Class== "Fire God")
			src.ssj["1req"]=5000000
			src.ssj["1give"]=20000000
			src.ssj["1multi"]=2

			src.ssj["2req"]=45000000
			src.ssj["2give"]=55000000
			src.ssj["2multi"]=2.5

			src.ssj["3req"]=300000000
			src.ssj["3give"]=100000000
			src.ssj["3multi"]=2

		else if(src.Class=="Vegito")
			src.ssj["1req"]=5000000
			src.ssj["1give"]=25500000
			src.ssj["1multi"]=1.5

			src.ssj["2req"]=90000000
			src.ssj["2give"]=75000000
			src.ssj["2multi"]=2.15

			src.ssj["3req"]=300000000
			src.ssj["3give"]=234000000
			src.ssj["3multi"]=2.5

	else if(src.Race=="Half Saiyan")
		if(src.Class=="Gohan")
			src.ssj["1req"]=6500000
			src.ssj["1give"]=20000000
			src.ssj["1multi"]=1.5
			if(src.ssj["1mastery"]>=100)
				src.ssj["1give"]=30000000
				src.ssj["1multi"]=1

			src.ssj["2req"]=45000000
			src.ssj["2give"]=80000000
			src.ssj["2multi"]=2.5
			if(src.ssj["2mastery"]>=100)
				src.ssj["2give"]=120000000
				src.ssj["2multi"]=1

			src.ssj["3req"]=300000000
			src.ssj["3give"]=160000000
			src.ssj["3multi"]=2.5
			if(src.ssj["3mastery"]>=100)
				src.ssj["3give"]=240000000
				src.ssj["3multi"]=1

		else if(src.Class=="Trunks")
			src.ssj["1req"]=6500000
			src.ssj["1give"]=40000000
			src.ssj["1multi"]=1.5
			if(src.ssj["1mastery"]>=100)
				src.ssj["1give"]=60000000
				src.ssj["1multi"]=1

			src.ssj["2req"]=45000000
			src.ssj["2give"]=100000000
			src.ssj["2multi"]=2.5
			if(src.ssj["2mastery"]>=100)
				src.ssj["2give"]=150000000
				src.ssj["2multi"]=1

			src.ssj["3req"]=300000000
			src.ssj["3give"]=200000000
			src.ssj["3multi"]=2
			if(src.ssj["3mastery"]>=100)
				src.ssj["3give"]=300000000
				src.ssj["3multi"]=1

		else if(src.Class=="Goten")
			src.ssj["1req"]=3500000
			src.ssj["1give"]=30000000
			src.ssj["1multi"]=1.5
			if(src.ssj["1mastery"]>=100)
				src.ssj["1give"]=45000000
				src.ssj["1multi"]=1


			src.ssj["2req"]=45000000
			src.ssj["2give"]=90000000
			src.ssj["2multi"]=2.5
			if(src.ssj["2mastery"]>=100)
				src.ssj["2give"]=125000000
				src.ssj["2multi"]=1


			src.ssj["3req"]=300000000
			src.ssj["3give"]=180000000
			src.ssj["3multi"]=2
			if(src.ssj["3mastery"]>=100)
				src.ssj["3give"]=270000000
				src.ssj["3multi"]=1
		else if(src.Class=="Spiral")
			if(src.AngerMax==1.25)
				src.ssj["1req"]=3350000
				src.ssj["1give"]=20000000
				src.ssj["1multi"]=2.45

				src.ssj["2req"]=45000000
				src.ssj["2give"]=50000000
				src.ssj["2multi"]=2.25

				src.ssj["3req"]=300000000
				src.ssj["3give"]=150000000
				src.ssj["3multi"]=2.5
			else if(src.AngerMax==1.75)
				src.ssj["1req"]=2800000
				src.ssj["1give"]=6000000
				src.ssj["1multi"]=1.75

				src.ssj["2req"]=45000000
				src.ssj["2give"]=20000000
				src.ssj["2multi"]=2

				src.ssj["3req"]=300000000
				src.ssj["3give"]=100000000
				src.ssj["3multi"]=2
			else if(src.AngerMax==3)
				src.ssj["1req"]=1700000
				src.ssj["1give"]=6000000
				src.ssj["1multi"]=2

				src.ssj["2req"]=50000000
				src.ssj["2give"]=20000000
				src.ssj["2multi"]=2

				src.ssj["3req"]=300000000
				src.ssj["3give"]=100000000
				src.ssj["3multi"]=1.5
	if(src.Race=="Human")
	/*	if(src.Class=="Quincy")
			src.trans["1req"]=25000000
			src.trans["1give"]=60000000
			src.trans["1multi"]=5
			Volstandig, not sure if this was approved or not.*/


		src.trans["1req"]=75000
		src.trans["1give"]=3500000
		src.trans["1multi"]=2

		src.trans["2req"]=75000000
		src.trans["2give"]=46500000
		src.trans["2multi"]=2
		if(src.Class=="Mazoku" && src.MazokuAscend==1)
			src.trans["1req"] = 7500000
			src.trans["1give"] = 10000000
			src.trans["1multi"] = 2

			src.trans["2req"] = 45000000
			src.trans["2give"] = 50000000
			src.trans["2multi"] = 2

	if(src.Race=="Neko")
		src.trans["1req"]=1000000
		src.trans["1give"]=50000
		src.trans["1multi"]=1.25

		src.trans["2req"]=1000000
		src.trans["2give"]=4950000
		src.trans["2multi"]=2

		src.trans["3req"]=1000000
		src.trans["3give"]=50000000
		src.trans["3multi"]=2


//SuperFrenzy Rework, this only applies to regular Vampires. Fuck you turned niggas. INCOMPLETE, DO NOT UNLOCK
	if(src.Race=="Vampire")
		src.trans["1give"]=15000000
		src.trans["1multi"]=1.5

		src.trans["2give"]=35000000
		src.trans["2multi"]=1.5

		src.trans["3give"]=50000000
		src.trans["3multi"]=2


	if(src.Race=="Throwback") //formerly "Throwback"
		if(src.Class=="Shifter")
			src.trans["1req"]=0
			src.trans["1give"]=4500000
			src.trans["1multi"]=1.15

			src.trans["2req"]=0
			src.trans["2give"]=5500000
			src.trans["2multi"]=1.15

			src.trans["3req"]=0
			src.trans["3give"]=10000000
			src.trans["3multi"]=1.15

			src.trans["4req"]=0
			src.trans["4give"]=20000000
			src.trans["4multi"]=1.15
		if(src.Class=="Fighter")
			src.trans["1req"]=1000000
			src.trans["1give"]=1000000
			src.trans["1multi"]=1.15

			src.trans["2req"]=5000000
			src.trans["2give"]=11000000
			src.trans["2multi"]=1.15

			src.trans["3req"]=30000000
			src.trans["3give"]=35000000
			src.trans["3multi"]=1.15

			src.trans["4req"]=100000000
			src.trans["4give"]=70000000
			src.trans["4multi"]=1.15
		if(src.Class=="Technologist")
			src.trans["1req"]=1250000
			src.trans["1give"]=3000000
			src.trans["1multi"]=1.45

			src.trans["2req"]=10000000
			src.trans["2give"]=3000000
			src.trans["2multi"]=1.45

			src.trans["3req"]=15000000
			src.trans["3give"]=7500000
			src.trans["3multi"]=1.45

			src.trans["4req"]=25000000
			src.trans["4give"]=7500000
			src.trans["4multi"]=1.45
		if(src.Class=="Wizard")
			src.trans["1req"]=1250000
			src.trans["1give"]=4500000
			src.trans["1multi"]=1.15

			src.trans["2req"]=10000000
			src.trans["2give"]=5500000
			src.trans["2multi"]=1.15

			src.trans["3req"]=15000000
			src.trans["3give"]=10000000
			src.trans["3multi"]=1.15

			src.trans["4req"]=25000000
			src.trans["4give"]=30000000
			src.trans["4multi"]=1.15
		if(src.Class=="Deus")
			src.trans["1req"]=1250000
			src.trans["1give"]=2500000
			src.trans["1multi"]=1.15

			src.trans["2req"]=10000000
			src.trans["2give"]=2500000
			src.trans["2multi"]=1.15

			src.trans["3req"]=15000000
			src.trans["3give"]=5000000
			src.trans["3multi"]=1.15

			src.trans["4req"]=25000000
			src.trans["4give"]=25000000
			src.trans["4multi"]=1.15
		if(src.Race=="Dhampir")
			if(src.Class=="Human Path")
				src.trans["1req"]=100
				src.trans["1give"]=5000000
				src.trans["1multi"]=2

				src.trans["2req"]=100
				src.trans["2give"]=45000000
				src.trans["2multi"]=2
			if(src.Class=="Vampire Path")
				src.trans["1req"]=100
				src.trans["1give"]=15000000
				src.trans["1multi"]=1.5

				src.trans["2req"]=100
				src.trans["2give"]=60000000
				src.trans["2multi"]=1.5
			if(src.Class=="Succubus Path")
				src.trans["1req"]=100
				src.trans["1give"]=10000000
				src.trans["1multi"]=1.75

				src.trans["2req"]=100
				src.trans["2give"]=52500000
				src.trans["2multi"]=1.75
/*	if(src.Race== "Quarter Saiyan")
		src.ssj["1req"]=20000000
		src.ssj["1give"]=50000000
		src.ssj["1multi"]=5*/
///
	if(src.Race== "Quarter Saiyan")
		src.ssj["1req"]=6000000
		src.ssj["1give"]=50000000
		src.ssj["1multi"]=2.25
		src.ssj["2req"]=22500000
		src.ssj["2give"]=80000000
		src.ssj["2multi"]=5
///
	if(src.Race=="1/16th Saiyan")
		src.trans["1req"]=1000
		src.trans["1give"]=5000000
		src.trans["1multi"]=2.25

		src.ssj["1req"]=5000
		src.ssj["1give"]=20000000
		src.ssj["1multi"]=3

		src.ssj["2req"]=45000
		src.ssj["2give"]=80000000
		src.ssj["2multi"]=2.25
	else if(src.Race=="Changeling")
		if(src.Class=="Frieza")//HOW TO BUFF CHANGELINGS TO RARE TIER...ALSO FUCK FRIEZA EXPAND GIVING BASE MULTI THIS MAKES IT HARD TO NOT HAVE AN OCD ATTACK
			src.SCLForm_1='ChangelingFrieza.dmi'
			src.SCLForm_2='ChangelingFriezaForm2.dmi'
			src.SCLForm_3='ChangelingFriezaForm3.dmi'
			src.SCLForm_4='ChangelingFriezaForm4.dmi'
			src.icon=src.SCLForm_1
			src.trans["1req"]=100000
			src.trans["1give"]=500000
			src.trans["1multi"]=1.5
			src.trans["2req"]=1000000
			src.trans["2give"]=4000000
			src.trans["2multi"]=1.5
			src.trans["3req"]=7500000
			src.trans["3give"]=10000000
			src.trans["3multi"]=1.5
		if(src.Class=="Ascended Frieza")
			src.SCLForm_1='ChangelingFrieza.dmi'
			src.SCLForm_2='ChangelingFriezaForm3.dmi'
			src.SCLForm_3='ChangelingFriezaForm4.dmi'
			src.icon=src.SCLForm_1
			src.trans["1req"]=100000
			src.trans["1give"]=5000000
			src.trans["1multi"]=1.5
			src.trans["2req"]=1000000
			src.trans["2give"]=15000000
			src.trans["2multi"]=1.5
			src.trans["3req"]=7500000
			src.trans["3give"]=50000000
			src.trans["3multi"]=1.5
		else if(src.Class=="Cooler")//Cooler becomes viable with first trans and the rest strike FEAR this sets them up at 25
			src.SCLForm_1='Cooler1.dmi'
			SCLForm_2='Cooler2.dmi'
			SCLForm_3='Cooler3.dmi'
			SCLForm_4='Cooler4.dmi'
			SCLForm_5='Cooler5.dmi'
			src.icon=src.SCLForm_1
			src.trans["1req"]=1
			src.trans["1give"]=1000000
			src.trans["1multi"]=1.25//1.5625
			src.trans["2req"]=1
			src.trans["2give"]=5000000
			src.trans["2multi"]=1.2//2
			src.trans["3req"]=1
			src.trans["3give"]=15000000
			src.trans["3multi"]=1.35//2
			src.trans["4req"]=15000000
			src.trans["4give"]=100000000
			src.trans["4multi"]=1.56//2
		else if(src.Class=="Ascended Cooler")//sets up ascended cooler to have 50 total
			src.SCLForm_1='Cooler1.dmi'
			SCLForm_2='Cooler2.dmi'
			SCLForm_3='Cooler3.dmi'
			SCLForm_4='Cooler4.dmi'
			SCLForm_5='Cooler5.dmi'
			src.icon=src.SCLForm_1
			src.trans["1req"]=50000
			src.trans["1give"]=1000000
			src.trans["1multi"]=1.5//2.5
			src.trans["2req"]=500000
			src.trans["2give"]=9000000
			src.trans["2multi"]=1.5//2
			src.trans["3req"]=5000000
			src.trans["3give"]=25000000
			src.trans["3multi"]=1.5//2
			src.trans["4req"]=15000000
			src.trans["4give"]=70000000
			src.trans["4multi"]=1.75//2.5
		else if(src.Class=="King Kold")
			SCLForm_1='KingKold1.dmi'
			SCLForm_2='KingKold2.dmi'
			src.icon=src.SCLForm_1
			src.trans["1req"]=3000000
			src.trans["1give"]=35000000
			src.trans["1multi"]=1.85//5
		else if(src.Class=="Ascended King Kold")
			SCLForm_1='KingKold1.dmi'
			SCLForm_2='KingKold2.dmi'
			src.icon=src.SCLForm_1
			src.trans["1req"]=3000000
			src.trans["1give"]=100000000
			src.trans["1multi"]=3//10
		else if(src.Class=="Chilled")//buffing base form to 4 with these numbers will hit a solid 25
			SCLForm_1='Chilled.dmi'
			SCLForm_2='Chilled2.dmi'
			SCLForm_3='Chilled3.dmi'
			src.icon=src.SCLForm_1
			src.trans["1req"]=350000
			src.trans["1give"]=7500000
			src.trans["1multi"]=1.5//3.125
			src.trans["2req"]=12500000
			src.trans["2give"]=22500000
			src.trans["2multi"]=2
		else if(src.Class=="Ascended Chilled")//solid 50
			SCLForm_1='Chilled.dmi'
			SCLForm_2='Chilled2.dmi'
			SCLForm_3='Chilled3.dmi'
			src.icon=src.SCLForm_1
			src.trans["1req"]=350000
			src.trans["1give"]=17500000
			src.trans["1multi"]=1.5//5
			src.trans["2req"]=12500000
			src.trans["2give"]=62500000
			src.trans["2multi"]=3//2.5
	src.trans["1req"] = 10
	src.trans["2req"] = 10
	src.trans["3req"] = 10
	src.ssj["1req"] = 10
	src.ssj["2req"] = 10
	src.ssj["3req"] = 10

mob/var/PlusPower=0


proc/DarknessFlash(var/mob/Z)
	set background=1
	for(var/area/L in view(0,Z))
		var/blah=L.icon_state
		if(blah!="Super Darkness")
			L.icon_state="Super Darkness"
			spawn(rand(600,3000))L.icon_state=blah

mob/proc/UltraInstinct()
	if(src.InstinctTrans) return
	src.InstinctTrans=1
	var/icon/E=icon('Effects.dmi',"Shock")
	spawn()for(var/turf/e in range(20,src))
		if(prob(60))continue
		if(prob(50))sleep(0.3)
	sleep()
	spawn()Shockwave(E,1)
	Quake(10)
	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Shockwave(E,1.5)
	spawn()Shockwave(E,1.5)
	spawn()Crater(src)
	src.overlays-=image(icon='Auras.dmi',icon_state="Mystic")
	if(src.PlusPower)
		src.PlusPower*=(src.OriginalPotential+1)
	else
		src.PlusPower+=50*src.OriginalPotential*src.Base
mob/proc/RevertInstinct()
	src.InstinctTrans=0
	src.PlusPower=0

mob/proc/SuperMystic()
	if(src.MysticTrans) return
	src.MysticTrans=1
	var/icon/E=icon('Effects.dmi',"Shock")
	spawn()for(var/turf/e in range(20,src))
		if(prob(60))continue
		if(prob(5))spawn()new/obj/Effects/Lightning(e)
		if(prob(50))sleep(0.3)
	sleep()
	spawn()Shockwave(E,1)
	Quake(10)
	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Shockwave(E,1.5)
	spawn()Shockwave(E,1.5)
	spawn()Crater(src)
	src.overlays-=image(icon='Auras.dmi',icon_state="Mystic")
	if(src.PlusPower)
		src.PlusPower*=(src.OriginalPotential+1)
	else
		src.PlusPower+=50*src.OriginalPotential*src.Base
mob/proc/RevertMystic()
	src.MysticTrans=0
	src.PlusPower=0

mob/proc/DevilTrigger()
	if(src.MajinTrans) return
	src.MajinTrans=1
	var/icon/E=icon('Effects.dmi',"Shock")
	spawn()Shockwave(E,1)
	spawn()LightningFlash(src)
	src.overlays-=image(icon='Auras.dmi',icon_state="Majin")
	src.overlays+=image('Aura Red.dmi',pixel_x=-32)
	src.BaseMod*=5
	src.Base*=5
	src.RegenerationMultiplier/=2
//	if(MajinTransUnlocked>=2)

mob/proc/RevertDT()
	src.MajinTrans=0
	src.BaseMod/=5
	src.Base/=5
	src.RegenerationMultiplier*=2
	src.overlays-=image('Aura Red.dmi',pixel_x=-32)


mob/proc/NuclearRaven(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return

	var/icon/E=icon('Effects.dmi',"Shock")//'Effect.dmi')
	if(x==1)
		E.Blend(rgb(50,50,-10),ICON_ADD)
	if(x==2)
		E.Blend(rgb(-10,-10,50),ICON_ADD)
	if(x==3)
		E.Blend(rgb(-10,50,40),ICON_ADD)

	var/mastery=trans["[x]mastery"]
	if(x==1)
		if(mastery==100)
			..()
		else if(mastery>80)
			sleep()
			spawn()Shockwave(E,1)
			spawn()Crater(src)

		else if(mastery>50)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			spawn()Crater(src)
		else if(mastery>20)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			spawn()Crater(src)

		else if(mastery>=1)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(30)
			spawn()Crater(src)


		else
			spawn()for(var/i=200, i>0, i--)
				new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
				if(prob(50))sleep(1)
			spawn()DarknessFlash(src)
			spawn()for(var/turf/e in range(20,src))
				if(prob(60))continue
				if(prob(5))spawn()new/obj/Effects/Lightning(e)
				if(prob(50))sleep(0.3)
			sleep()
			spawn()Shockwave(E,1)
			spawn()LightningFlash(src)
			Quake(10)
			sleep(20)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			sleep(30)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(30)
			sleep(10)
			spawn()LightningFlash(src)
			spawn()Shockwave(E,2)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			spawn()Crater(src)
			Quake(80)
			spawn()LightningFlash(src)
	if(x==2)
		src.overlays-=image('NuclearRaven.dmi',icon_state="One",pixel_x=-32)
		src.overlays+=image('NuclearRaven.dmi',icon_state="Two",,pixel_x=-32)
		spawn()for(var/i=200, i>0, i--)
			new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
			if(prob(50))sleep(1)
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(50)
		Quake(20)
		spawn()Crater(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(10)
		spawn()Shockwave(E,1)
		LightningFlash(src)
		sleep(10)
		spawn()Shockwave(E,1)
		sleep(10)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(10)
		LightningFlash(src)
		src.overlays-=image('NuclearRaven.dmi',icon_state="One",pixel_x=-32)
		src.overlays-=image('NuclearRaven.dmi',icon_state="Two",pixel_x=-32)
		src.overlays+=image('NuclearRavenSparks.dmi',icon_state="Two")
	if(x==3)
		src.overlays-=image('NuclearRaven.dmi',icon_state="Two",pixel_x=-32)
		src.overlays-=image('NuclearRavenSparks.dmi',icon_state="Two")
		LightningFlash(src)
		spawn()Shockwave(E,1)
		..()
		for(var/turf/T in Turf_Circle(src,8))
			if(prob(1)) sleep(0.005)
			spawn(rand(4,8)) Destroy(T)
		src.overlays+=image('NuclearRaven.dmi',icon_state="Three",pixel_x=-32)
	if(trans["[x]mastery"]<25)
		trans["[x]mastery"]=25
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	//src.SaiyanPUNerf-=0.8
	src.StrengthMultiplier*=1.25
	src.ForceMultiplier*=1.25
	src.OffenseMultiplier*=1.25
	src.trans["active"]=x
	src.Auraz("Add")

mob/proc/FriskyNeko(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return

	var/icon/E=icon('Effects.dmi',"Shock")//'Effect.dmi')
	if(x==1)
		E.Blend(rgb(50,50,-10),ICON_ADD)
	if(x==2)
		E.Blend(rgb(-10,-10,50),ICON_ADD)
	if(x==3)
		E.Blend(rgb(-10,50,40),ICON_ADD)

	var/mastery=trans["[x]mastery"]
	if(x==1)
		if(mastery==100)
			..()
		else if(mastery>80)
			sleep()
			spawn()Shockwave(E,1)
			spawn()Crater(src)

		else if(mastery>50)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			spawn()Crater(src)
		else if(mastery>20)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			spawn()Crater(src)

		else if(mastery>=1)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(30)
			spawn()Crater(src)


		else
			spawn()for(var/i=200, i>0, i--)
				new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
				if(prob(50))sleep(1)
			spawn()DarknessFlash(src)
			spawn()for(var/turf/e in range(20,src))
				if(prob(60))continue
				if(prob(5))spawn()new/obj/Effects/Lightning(e)
				if(prob(50))sleep(0.3)
			sleep()
			spawn()Shockwave(E,1)
			spawn()LightningFlash(src)
			Quake(10)
			sleep(20)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			sleep(30)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(30)
			sleep(10)
			spawn()LightningFlash(src)
			spawn()Shockwave(E,2)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			spawn()Crater(src)
			Quake(80)
			spawn()LightningFlash(src)
	if(x==2)
		src.overlays-=image('FriskyNekoOne.dmi',pixel_x=-32)
		src.overlays+=image('FriskyNekoTwo.dmi',pixel_x=-32)
		spawn()for(var/i=200, i>0, i--)
			new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
			if(prob(50))sleep(1)
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(50)
		Quake(20)
		spawn()Crater(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(10)
		spawn()Shockwave(E,1)
		LightningFlash(src)
		sleep(10)
		spawn()Shockwave(E,1)
		sleep(10)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(10)
		LightningFlash(src)
		src.overlays-=image('FriskyNekoOne.dmi',pixel_x=-32)
		src.overlays-=image('FriskyNekoTwo.dmi',pixel_x=-32)
		src.overlays+=image('FriskyNekoSparks.dmi')
	if(x==3)
		src.overlays-=image('FriskyNekoTwo.dmi',pixel_x=-32)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		..()
		for(var/turf/T in Turf_Circle(src,8))
			if(prob(1)) sleep(0.005)
			spawn(rand(4,8)) Destroy(T)
			for(var/mob/M in view(0,T))
				if(M!=src)
					M.Health-=(((usr.Strength*usr.StrengthMultiplier)*usr.Power)/((M.Resistance*M.ResistanceMultiplier)*M.Power))*30


		src.overlays+=image('FriskyNekoThree.dmi',pixel_x=-32)
	if(trans["[x]mastery"]<25)
		trans["[x]mastery"]=25
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	if(x>=2)
		src.RecoveryMultiplier*=0.75
	src.StrengthMultiplier*=1.25
	src.SpeedMultiplier*=1.25
	src.OffenseMultiplier*=1.25
	src.trans["active"]=x
	src.Auraz("Add")

mob/proc/DhampirTension(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	trans["active"]=x
	src << "You raise your tension!"
	src.Auraz("Add")
	src.PlusPower+=trans["[x]give"]
	src.Ascend(src.BaseMod*trans["[x]multi"])
	spawn()
		DarknessFlash(src)
	spawn()
		for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/RedLightning(e)
			if(prob(50))sleep(0.3)
	if(src.Class=="Human Path")
		src.StrengthMultiplier*=1.3
		src.EnduranceMultiplier*=1.3
		src.ForceMultiplier*=1.3
		src.ResistanceMultiplier*=1.3
		src.OffenseMultiplier*=1.3
		src.DefenseMultiplier*=1.3
		src.RecoveryMultiplier*=0.8
	if(src.Class=="Vampire Path")
		src.StrengthMultiplier*=1.2
		src.EnduranceMultiplier*=0.8
		src.SpeedMultiplier*=1.2
		src.ForceMultiplier*=1.2
		src.ResistanceMultiplier*=0.8
		src.OffenseMultiplier*=0.9
		src.DefenseMultiplier*=0.9
		src.RecoveryMultiplier*=0.7
	if(src.Class=="Succubus Path")
		src.StrengthMultiplier*=1.35
		src.SpeedMultiplier*=1.35
		src.ForceMultiplier*=1.35
		src.OffenseMultiplier*=1.35
		src.RecoveryMultiplier*=0.75

mob/proc/SHROLL(var/x)
	if((src.Dead==1&&src.KeepBody==0&&!src.HeartHero))
		return
	trans["active"]=x
	src<<"You raise your tension!"
	//spawn()Shockwave(E,1)
	src.Auraz("Add")
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	if(x==1)
		src.StrengthMultiplier*=1.3
		src.EnduranceMultiplier*=1.3
		src.ForceMultiplier*=1.3
		src.ResistanceMultiplier*=1.3
		src.OffenseMultiplier*=1.3
		src.DefenseMultiplier*=1.3
		if(src.Race=="1/16th Saiyan")
			src.StrengthMultiplier*=1.2
			src.EnduranceMultiplier*=1.2
			src.ForceMultiplier*=1.2
			src.ResistanceMultiplier*=1.2
			src.OffenseMultiplier*=1.2
			src.DefenseMultiplier*=1.2
	if(x==2)
		src.StrengthMultiplier*=1.35
		src.EnduranceMultiplier*=1.35
		src.ForceMultiplier*=1.35
		src.ResistanceMultiplier*=1.35
		src.OffenseMultiplier*=1.35
		src.DefenseMultiplier*=1.35
	if(x==1)
		if(src.Class=="Dhampir")
			spawn()DarknessFlash(src)
			spawn()for(var/turf/e in range(20,src))
				if(prob(60))continue
				if(prob(5))spawn()new/obj/Effects/RedLightning(e)
				if(prob(50))sleep(0.3)
	if(x==2||src.Race=="1/16th Saiyan")
		src.Hairz("Add")
	src.RecoveryMultiplier*=0.8
	if(src.trans["active"]>1)
		if(src.Class!="Quincy" && src.Class!="Dhampir" && src.Class!= "Spiral" && !src.Toji)
			src.overlays+=image('Auras.dmi',"HT2")
mob/proc/PathFinder(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
//	var/icon/E=icon('Effects.dmi',"Shock")
	trans["active"]=x
	src<<"This is a filler message!"
	src.Hairz("Add")
	src.Auraz("Add")
	src.RecoveryMultiplier*=0.8
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]

mob/proc/MaximumOverYiff(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Shock")
	trans["active"]=x
	spawn()for(var/turf/e in range(20,src))
		if(prob(60))
			continue
		if(prob(5))
			spawn()new/obj/Effects/Lightning(e)
		if(prob(50))
			sleep(0.3)
	sleep()
	spawn()Shockwave(E,1)
	Quake(10)
	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Shockwave(E,1.5)
	spawn()Shockwave(E,1.5)
	spawn()Crater(src)
	trans["[x]mastery"]=100
	src.Hairz("Add")
	src.Auraz("Add")
	src.PlusPower+=(trans["[x]give"] * (src.KuramaAscension * 4))
	src.Base*=(src.KuramaAscension/2)
	src.BaseMod*=(src.KuramaAscension/2)
mob/proc/TwilightSpectre(var/x)
	var/icon/E=icon('Effects.dmi',"Shock")
	trans["active"]=x
	if(src.trans["[x]mastery"]<100)
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		sleep()
		spawn()Shockwave(E,1)
		Quake(10)
		spawn()Shockwave(E,1)
		Quake(20)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.5)
		spawn()Crater(src)
		trans["[x]mastery"]=100
	else
		Quake(20)
		spawn()Shockwave(E,1.5)
		spawn()Crater(src)
	src.Auraz("Add")
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	if(src.Class=="Dragon")
		src.overlays+=image(icon='Auras.dmi',icon_state="HT4")
	if(src.Class=="Renegade")
		src.overlays+=image(icon='Auras.dmi',icon_state="HT3")

mob/proc/SHJ(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Shock")
	trans["active"]=x
	if(trans["active"]>2)
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		sleep()
		spawn()Shockwave(E,1)
		Quake(10)
		spawn()Shockwave(E,1)
		Quake(20)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.5)
		spawn()Crater(src)
		trans["[x]mastery"]=100
	src<<"You raise your tension!"
	src.Hairz("Add")
	src.Auraz("Add")
	src.RecoveryMultiplier*=0.9
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	src.StrengthMultiplier*=1.25
	src.EnduranceMultiplier*=1.25
	src.SpeedMultiplier*=1.25
	src.ForceMultiplier*=1.25
	src.ResistanceMultiplier*=1.25
	src.OffenseMultiplier*=1.25
	src.DefenseMultiplier*=1.25
	if(src.trans["active"]>1)
		src.overlays+=image('Auras.dmi',"HT2")
	if(src.trans["active"]>2)
		src.overlays-=image('Auras.dmi',"HT2")
		src.overlays+=image('Auras.dmi',"HT3")
	if(src.trans["active"]>3)
		src.overlays-=image('Auras.dmi',"HT3")
		src.overlays+=image('Auras.dmi',"HT2")
		src.overlays+=image('Auras.dmi',"HT4")
/*
mob/proc/SuperYoukai(var/x)
	if(src.Dead==1&&src.KeepBody==0)
		return
	var/icon/E=icon('Effects.dmi',"Shock")
	E.Blend(rgb(rand(50,200),rand(50,200),rand(50,200)),ICON_ADD)
	var/mastery=masteries["[x]mastery"]
	if(mastery<(5*x))
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		sleep()
		spawn()Shockwave(E,1)
		Quake(10)
		spawn()Shockwave(E,1)
		Quake(20)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.5)
		spawn()Crater(src)
//		trans["[x]mastery"]=1
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	trans["active"]=x
	src.Auraz("Add")
//	if(src.Class=="Tanuki")//I'LL FILL THIS SHIT IN LATER
	if(src.Class=="Hell Raven")
		src.StrengthMultiplier*=1.25
		src.ForceMultiplier*=1.25
		src.OffenseMultiplier*=1.15
	if(src.Class=="King Kold")
		if(src.trans["active"]>0)
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi', "Changeling",pixel_x=-32)
	if(src.Class=="Cooler")
		if(src.trans["active"]>0)
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>1)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>2)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
		if(src.trans["active"]>3)
			src.overlays-=image('AurasBig.dmi',"Changeling",pixel_x=-32)
			src.overlays-=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
	if(src.Class=="Frieza")
		if(src.trans["active"]>0)
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>1)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>2)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
	if(src.Class=="Chilled")
		if(src.trans["active"]>0)
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>1)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
*/
mob/proc/SCL(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Shock")
	E.Blend(rgb(rand(50,200),rand(50,200),rand(50,200)),ICON_ADD)
	var/mastery=masteries["[x]mastery"]
	if(mastery<(5*x))
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		sleep()
		spawn()Shockwave(E,1)
		Quake(10)
		spawn()Shockwave(E,1)
		Quake(20)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.5)
		spawn()Crater(src)
//		trans["[x]mastery"]=1
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	src.Auraz("Add")
	if(!src.FormMastery)
		if(src.Class=="King Kold")
			src.RegenerationMultiplier*=0.5625
			src.RecoveryMultiplier*=0.5625
		if(src.Class=="Chilled")
			src.RegenerationMultiplier*=0.75
			src.RecoveryMultiplier*=0.75
		if(src.Class=="Frieza")
			src.RegenerationMultiplier*=0.825
			src.RecoveryMultiplier*=0.825
		if(src.Class=="Cooler")
			src.RegenerationMultiplier*=0.865
			src.RecoveryMultiplier*=0.865
	trans["active"]=x
	if(trans["active"]==1)
		src.ChangieMaxHealth+=50
	if(trans["active"]==2)
		src.ChangieMaxHealth+=50
	if(trans["active"]==3)
		src.ChangieMaxHealth+=150
	if(trans["active"]==4)
		src.ChangieMaxHealth+=150
	src.Health=100+src.ChangieMaxHealth
	if(src.Class=="King Kold")
		if(src.trans["active"]>0)
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi', "Changeling",pixel_x=-32)
	if(src.Class=="Cooler")
		if(src.trans["active"]>0)
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>1)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>2)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
		if(src.trans["active"]>3)
			src.overlays-=image('AurasBig.dmi',"Changeling",pixel_x=-32)
			src.overlays-=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
	if(src.Class=="Frieza")
		if(src.trans["active"]>0)
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>1)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>2)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
	if(src.Class=="Chilled")
		if(src.trans["active"]>0)
			src.overlays+=image('Auras.dmi',"WaveSpark")
		if(src.trans["active"]>1)
			src.overlays-=image('Auras.dmi',"WaveSpark")
			src.overlays+=image('Auras.dmi',"PurpleSpark")
			src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
	if(x==1&&src.SCLForm_2)src.icon=src.SCLForm_2
	if(x==2&&src.SCLForm_3)src.icon=src.SCLForm_3
	if(x==3&&src.SCLForm_4)src.icon=src.SCLForm_4
	if(x==4&&src.SCLForm_5)src.icon=src.SCLForm_5
mob/proc/SNJ(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Shock")

	spawn()Shockwave(E,1)
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	trans["active"]=x
	src.RecoveryMultiplier*=1.25
	src.overlays+=image('Auras.dmi',"SNj")
	src.trans["[x]Mastery"]=100
	src.Auraz("Add")
	if(src.Class=="Ancient")
		src.overlays+=image('Amazing Super Namekian Aura.dmi', pixel_x=-32)
	else
		src.overlays+=image('AurasBig.dmi',"Namekian",pixel_x=-32)
/* mob/proc/SuperKaio(var/x)
	if(src.Dead==1&&src.KeepBody==0)
		return
	var/icon/E=icon('Effects.dmi',"Shock")

	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Crater(src)
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	trans["active"]=x
	src.RecoveryMultiplier*=0.75
	src.ElementalKaio=1
	src.Auraz("Add")
	if(x==2)
		src.overlays+=image('AuraElectricR.dmi')*/
	//Insert transformation icon changes and overlays, here
mob/proc/AlphaLycanTrans(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Shock")

	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Crater(src)
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	trans["active"]=x
	src.RecoveryMultiplier*=0.7
	//src.RegenerationMultiplier*=0.7
	src.StrengthMultiplier*=1.25
	src.EnduranceMultiplier*=1.25
	src.ResistanceMultiplier*=1.25
	//src.ForceMultiplier*=1.25
	if(trans["active"]==1)
		if(src.Gender=="Male")
			src.icon='Manwolf.dmi'
			src.icon+=src.Hair_Color
			var/image/Lycan=image('Lycan.dmi',pixel_x=-20,pixel_y=-12)
			src.overlays-=Lycan
		else
			src.icon='Womanwolf.dmi'
			src.icon+=src.Hair_Color
			var/image/Lycan=image('Lycan.dmi',pixel_x=-20,pixel_y=-12)
			src.overlays-=Lycan

mob/proc/DragonTrans(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Shock")

	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Shockwave(E,1)
	Quake(20)
	spawn()Crater(src)
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	trans["active"]=x
	if(trans["active"]==1)
		src.ForceMultiplier*=1.5
		src.OffenseMultiplier*=1.5
		src.DefenseMultiplier*=1.5
	if(trans["active"]==2)
		src.ForceMultiplier*=2
		src.OffenseMultiplier*=2
		src.DefenseMultiplier*=1.2

mob/proc/SDJ(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Shock")
	//if(src.Class=="Abyssal")
	src.RecoveryMultiplier*=0.75
	src.RegenerationMultiplier*=2
	/*else
		src.Recovery/=2*/
	src.SuperDemon=1
	spawn()Shockwave(E,1)
	spawn()LightningFlash(src)
	spawn()Crater(src)
	src.overlays+=image('AurasBig.dmi',"Demon",pixel_x=-32)
	trans["active"]=x
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	for(var/obj/Skills/Buffs/DemonicWill/dw in src)
		src.SuperDemonStats=1
		del dw
	if(src.SuperDemonStats&&x==1)
		src.StrengthMultiplier*=1.75
		src.ForceMultiplier*=1.75
		src.OffenseMultiplier*=1.75
		src.SpeedMultiplier*=1.25
	if(src.Race=="Half Demon")

		src.SpeedMultiplier*=1.25
		if(!locate(/obj/Skills/Namekian/InjuryRecovery, src) && x==1)
			src.contents+=new/obj/Skills/Namekian/InjuryRecovery
		if(!locate(/obj/Skills/BurstRegenerate, src) && x==2)
			src.contents+=new/obj/Skills/BurstRegenerate
		if(!locate(/obj/Skills/Regenerate, src) && x==3)
			src.contents+=new/obj/Skills/Regenerate

	src.Hairz("Add")
	src.Auraz("Add")
	/*if(src.Class!="Abyssal")
		if(src.Health<=100)
			src.Health=100*/
	if(x==1)
		src.NormalIcon=src.icon
		if(src.SuperDemonBody)
			src.icon=src.SuperDemonBody
		//else
		//	src.icon=src.NormalIcon
	else if(x==2)
		src.overlays+=image('Auras.dmi',"SDj")
		if(src.SuperDemonBody2)
			src.icon=src.SuperDemonBody2
		//else
		//	src.icon=src.NormalIcon

	else if(x==3)
		src.StrengthMultiplier*=1.35
		src.EnduranceMultiplier*=1.35
		src.ForceMultiplier*=1.35
		src.ResistanceMultiplier*=1.35
		src.OffenseMultiplier*=1.35
		src.DefenseMultiplier*=1.35
mob/proc/Resurreccion(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Shock")

	src.RecoveryMultiplier*=0.75
	spawn()Shockwave(E,1)
	spawn()LightningFlash(src)
	spawn()Crater(src)
	if(src.Class=="Vasto Arrancar")
		src.overlays+=image('Demonic Aura.dmi',"Vastocar",pixel_x=-32)
	else if(src.Class=="Ascended Arrancar")
		src.overlays+=image('Demonic Aura.dmi',"Ascended",pixel_x=-32)
	else
		src.overlays+=image('Demonic Aura.dmi',pixel_x=-32)
	trans["active"]=x
	src.PlusPower+=trans["[x]give"]
	src.Base*=trans["[x]multi"]
	src.BaseMod*=trans["[x]multi"]
	src.Hairz("Add")
	src.Auraz("Add")
	if(src.Health<=100)
		src.Health=100
	if(x==1)
		src.NormalIcon=src.icon
		if(src.SuperDemonBody)
			src.icon=src.SuperDemonBody
		if(src.ResType=="Grimmjow")
			src.StrengthMultiplier*=1.5
			src.SpeedMultiplier*=1.25
		else if(src.ResType=="Starrk")
			src.DefenseMultiplier*=1.5
			src.ForceMultiplier*=1.25
		else if(src.ResType=="Ulquiorra")
			src.StrengthMultiplier*=1.15
			src.EnduranceMultiplier*=1.15
			src.ForceMultiplier*=1.15
			src.ResistanceMultiplier*=1.15
			src.OffenseMultiplier*=1.15
			src.DefenseMultiplier*=1.15
		else if(src.ResType=="Nnoitra")//Probably spelled this faggots name wrong
			src.EnduranceMultiplier*=1.5
			src.ResistanceMultiplier*=1.25
		else if(src.ResType=="Harribel")
			src.OffenseMultiplier*=1.25
			src.ForceMultiplier*=1.5

		//else
		//	src.icon=src.NormalIcon
	else if(x==2)
		if(src.Class=="Vasto Arrancar")
			src.overlays+=image('ArrancarAuras.dmi',"Vastocar")
		else if(src.Class=="Ascended Arrancar")
			src.overlays+=image('ArrancarAuras.dmi',"Ascended")
		else
			src.overlays+=image('ArrancarAuras.dmi')
		if(src.SuperDemonBody2)
			src.icon=src.SuperDemonBody2
		//else
		//	src.icon=src.NormalIcon

mob/proc/SuperDemi(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Shock")
	spawn()Shockwave(E,1)
	spawn()LightningFlash(src)
	spawn()Crater(src)
	src.overlays+=image('AurasBig.dmi',"Demi",pixel_x=-32)
	if(x==1)
		trans["active"]=1
		src.PlusPower+=trans["1give"]
		src.Base*=trans["1multi"]
		src.BaseMod*=trans["1multi"]
		src.Auraz("Add")
	if(x==2)
		trans["active"]=2
		src.PlusPower+=trans["2give"]
		src.Base*=trans["2multi"]
		src.BaseMod*=trans["2multi"]
		src.Auraz("Add")
		src.AngerMax*=2
		src.Anger=src.AngerMax

mob/proc/SuperAgoro(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	var/icon/E=icon('Effects.dmi',"Agoro")
	spawn()Shockwave(E,1)
	spawn()LightningFlash(src)
	spawn()Crater(src)
	src.overlays+=image('AurasBig.dmi',"Agoro",pixel_x=-32)
	trans["active"]=1
	src.PlusPower+=trans["1give"]
	src.Base*=trans["1multi"]
	src.BaseMod*=trans["1multi"]
	src.Auraz("Add")
	src.RecoveryMultiplier*=1.5

mob/proc/PureSSj(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	for(var/obj/Oozaru/O in src)
		if(O.icon)
			src<<"You cannot transform while in oozaru!"
			return
	for(var/obj/Lycan/O in src)
		if(O.icon)
			src<<"You cannot transform while in Lycan!"
			return

	var/icon/E=icon('Effects.dmi',"Shock")//'Effect.dmi')
	if(x==1)
		E.Blend(rgb(50,50,-10),ICON_ADD)
	if(x==2)
		E.Blend(rgb(-10,-10,50),ICON_ADD)
	if(x==3)
		E.Blend(rgb(-10,50,40),ICON_ADD)

	var/mastery=ssj["[x]mastery"]
	if(mastery < 100)
		Log("Admin","[ExtractInfo(src)] has activated Super Saiyan [x].")
	if(x==1)
		if(mastery==100)
			..()
		else if(mastery>80)
			sleep()
			spawn()Shockwave(E,1)
			spawn()Crater(src)

		else if(mastery>50)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			spawn()Crater(src)
		else if(mastery>20)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			spawn()Crater(src)

		else if(mastery>=1)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(30)
			spawn()Crater(src)


		else
			spawn()for(var/i=200, i>0, i--)
				new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
				if(prob(50))sleep(1)
			spawn()DarknessFlash(src)
			spawn()for(var/turf/e in range(20,src))
				if(prob(60))continue
				if(prob(5))spawn()new/obj/Effects/Lightning(e)
				if(prob(50))sleep(0.3)
			sleep()
			spawn()Shockwave(E,1)
			spawn()LightningFlash(src)
			if(src.Class=="Legendary")
				src.overlays+=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
			if(src.Class=="Hellspawn")
				src.overlays+=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
			Quake(10)
			sleep(20)
			if(src.Class=="Legendary")
				src.overlays-=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
			if(src.Class=="Hellspawn")
				src.overlays-=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			sleep(30)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			if(src.Class=="Legendary")
				src.overlays+=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
			if(src.Class=="Hellspawn")
				src.overlays+=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
			Quake(30)
			sleep(10)
			if(src.Class=="Legendary")
				src.overlays-=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
			if(src.Class=="Hellspawn")
				src.overlays-=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
			spawn()LightningFlash(src)
			spawn()Shockwave(E,2)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			spawn()Crater(src)
			Quake(80)
			spawn()LightningFlash(src)
	//if(x==1)
	if(x==2 && src.Class!= "Legendary")
		spawn()Shockwave(E,1)
		spawn()LightningFlash(src)
		Quake(10)
		sleep(20)
	if(x==3)
		//if(src.FirstSSj3)
		//	src << "TRANS!"
		//else
		src.overlays+=image('Aurasbig.dmi',"SSJ",pixel_x=-32)
		src.ssj["3req"]=100000000
		if(src.Class=="Vegito")
			src.ssj["3req"]=200000000
		spawn()for(var/i=200, i>0, i--)
			new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
			if(prob(50))sleep(1)
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
	//	EX_EffectHandler(/obj/Effects/Tornado,500,100,100,1,50,1,50,src,50,1,null)
		sleep(50)
		Quake(20)
		spawn()Crater(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(10)
		spawn()Shockwave(E,1)
		LightningFlash(src)
		sleep(10)
		spawn()Shockwave(E,1)
		sleep(10)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		//spawn()SSJ3(src)
		sleep(10)
		LightningFlash(src)
		src.overlays-=image('Auras.dmi',"SSJ2")
		src.overlays-=image('Aurasbig.dmi',"SSJ",pixel_x=-32)
	//if(x==3)
	if(ssj["1mastery"]>=99&&!src.SSJ1Ascended&&src.Class!="Legendary")
		src.BaseMod*=1.5
		src.SSJ1Ascended=1
		src.SetVars()
	if(ssj["2mastery"]>=99&&!src.SSJ2Ascended&&src.Class!="Legendary")
		src.BaseMod*=2
		src.SSJ2Ascended=1
		src.SetVars()
	if(ssj["3mastery"]>=99&&!src.SSJ3Ascended&&src.Class!="Legendary")
		src.BaseMod*=4
		src.SSJ3Ascended=1
		src.SetVars()
	if(ssj["[x]mastery"]<25)
		ssj["[x]mastery"]=25
	if(src.FirstSSj)
		src.BaseMod*=50
		src.Base*=50
		src.RecoveryMultiplier*=0.85
	else
		src.Base*=ssj["[x]multi"]
		src.BaseMod*=ssj["[x]multi"]
		src.PlusPower+=src.ssj["[x]give"]
		src.RecoveryMultiplier*=0.85
	ssj["active"]=x
	src.Hairz("Add")
	src.Auraz("Add")
	if(x==2 && src.Class=="Legendary")
		src.overlays+=image('Auras.dmi',"LSSJ2")
	//if(src.ssj["active"]==1)
		//src.SpecialSlot=1
	//	src.ActiveBuffs+=1
	if(ssj["[x]mastery"]<25)
		ssj["[x]mastery"]=25

	/*
	//START NEW SSJ CODE HERE
	if(x==1)
		if(src.ssj["1mastery"]==100 && !src.SSjAscension&&src.Class!="Legendary")
			src.SSjAscension=1
	if(x==2)
		if(src.ssj["2mastery"]==100 && !src.SSjAscension2&&src.Class!="Legendary")
			src.SSjAscension2=1
	if(x==3)
		if(src.ssj["3mastery"]==100 && !src.SSjAscension3&&src.Class!="Legendary")
			src.SSjAscension3=1*/

	src.overlays-=image('AurasBig.dmi',"SSJ",pixel_x=-32)
	src.overlays+=image('AurasBig.dmi',"SSJ",pixel_x=-32)
	if(x==2 && src.Class!="Legendary")
		src.overlays-=image('Auras.dmi',"SSJ2")
		src.overlays+=image('Auras.dmi',"SSJ2")
	else if(x==3 && src.Class=="Legendary")
		src.overlays-=image('AurasBig.dmi', "LSSJ", pixel_x=-32)
		src.overlays-=image('Amazing LSSj Aura.dmi', pixel_x=-32)
		src.overlays+=image('Amazing LSSj Aura.dmi', pixel_x=-32)
	else if(x==3 && src.Class!= "Legendary")
		src.overlays-=image('AurasBig.dmi', "SSJ", pixel_x=-32)
		src.overlays-=image('Amazing SSj Aura.dmi', pixel_x=-32)
		src.overlays+=image('Amazing SSj Aura.dmi', pixel_x=-32)

mob/proc/SuperAlien(var/level)
	SetVars()
	spawn()Crater(src)
	Earthquake(level*4,-2*level,2*level,-2*level,2*level)
	src.Base*=trans["[level]multi"]
	src.BaseMod*=trans["[level]multi"]

	if(level == 1)
		if(!trans["alientrans"])
			var transtype
			while(!transtype)
				transtype = input("Select a focus for your transformation.") in list("Power","Potency","Fury","Protection","Spirit")
				var alertmessage
				switch(transtype)
					if("Power") alertmessage = "Your physical might and durability are extraordinary, allowing you to sustain heavy attacks and deliver even heavier ones."
					if("Potency") alertmessage = "Your assault is focused using the combined forces of your spiritual and physical might."
					if("Fury") alertmessage = "Your power sways with the intensity of your emotions."
					if("Protection") alertmessage = "Your body is hard as iron, and impenetrable wall."
					if("Spirit") alertmessage = "Your spiritual might overflows with the intensity of your power."
				if(alert("[alertmessage]"))
					trans["alientrans"] = transtype
					if(transtype == "Fury") NewAnger(1.8)
				else transtype = null

		switch(trans["alientrans"])
			if("Power")
				StrengthMultiplier *= 1.4
				EnduranceMultiplier *= 1.4
			if("Potency")
				StrengthMultiplier *= 1.4
				ForceMultiplier *= 1.4
			if("Protection")
				EnduranceMultiplier *= 1.4
				ResistanceMultiplier *= 1.4
			if("Spirit")
				ForceMultiplier *= 1.4
				ResistanceMultiplier *= 1.4

	src.RecoveryMultiplier*=0.85
	src.trans["active"] = level
	src.CustomizedTrans(level)

	if(level == 3)	KenShockwave(src, Size=5)  //M is the person that makes t


mob/proc/SSj(var/x)
	if(src.Dead==1&&src.KeepBody==0&&!src.HeartHero)
		return
	for(var/obj/Oozaru/O in src)
		if(O.icon)
			src<<"You cannot transform while in oozaru!"
			return
	for(var/obj/Lycan/O in src)
		if(O.icon)
			src<<"You cannot transform while in Lycan!"
			return
/*	if((src.ActiveBuffs||src.SpecialSlot)&&x==1)
		src << "can't use ssj with buffs i think."
		return
	if(x==1)
		src.ActiveBuffs=3
		src.SpecialSlot=1*/
	var/icon/E=icon('Effects.dmi',"Shock")//'Effect.dmi')
	if(x==1)
		E.Blend(rgb(50,50,-10),ICON_ADD)
	if(x==2)
		E.Blend(rgb(-10,-10,50),ICON_ADD)
	if(x==3)
		E.Blend(rgb(-10,50,40),ICON_ADD)

	var/mastery=ssj["[x]mastery"]
	if(x==1)
	/*	if(src.BaseMod<50)
			src.BaseMod*=75
			src.Regeneration*=1.2
			src.Recovery*=1.2
			src.FBM=75*/
		if(mastery==100)
			..()
		else if(mastery>80)
			sleep()
			spawn()Shockwave(E,1)
			spawn()Crater(src)

		else if(mastery>50)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			spawn()Crater(src)
		else if(mastery>20)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			spawn()Crater(src)

		else if(mastery>=1)
			sleep()
			spawn()Shockwave(E,1)
			Quake(10)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(30)
			spawn()Crater(src)


		else
			spawn()for(var/i=200, i>0, i--)
				new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
				if(prob(50))sleep(1)
			spawn()DarknessFlash(src)
			spawn()for(var/turf/e in range(20,src))
				if(prob(60))continue
				if(prob(5))spawn()new/obj/Effects/Lightning(e)
				if(prob(50))sleep(0.3)
			sleep()
			spawn()Shockwave(E,1)
			spawn()LightningFlash(src)
			if(src.Class=="Legendary")
				src.overlays+=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
			if(src.Class=="Hellspawn")
				src.overlays+=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
			Quake(10)
			sleep(20)
			if(src.Class=="Legendary")
				src.overlays-=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
			if(src.Class=="Hellspawn")
				src.overlays-=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			Quake(20)
			sleep(30)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			if(src.Class=="Legendary")
				src.overlays+=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
			if(src.Class=="Hellspawn")
				src.overlays+=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
			Quake(30)
			sleep(10)
			if(src.Class=="Legendary")
				src.overlays-=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
			if(src.Class=="Hellspawn")
				src.overlays-=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
			spawn()LightningFlash(src)
			spawn()Shockwave(E,2)
			spawn()Shockwave(E,1.5)
			spawn()Shockwave(E,1.2)
			spawn()Shockwave(E,1)
			spawn()Crater(src)
			Quake(80)
			spawn()LightningFlash(src)
	//if(x==1)
	if(x==2 && src.Class!= "Legendary")
		spawn()Shockwave(E,1)
		spawn()LightningFlash(src)
		Quake(10)
		sleep(20)
	if(x==2 && src.Class=="Legendary")
		src.overlays+=image('Auras.dmi',"LSSJ2")
	if(x==2)
		var/obj/x1=new/obj/Taiyoken
		for(var/mob/Players/T in view(18))
			spawn()T.Quake(50)
		for(var/turf/T in Turf_Circle(src,8))
			if(prob(1)) sleep(0.005)
			x1.layer=MOB_LAYER+1
			x1.icon_state=pick("1","2","3","4","5","6","7")
			T.overlays+=x1
			spawn(rand(1,2))T.overlays+=x1
			spawn(rand(2,3))T.overlays+=x1
			spawn(rand(3,4))T.overlays+=x1
			spawn(rand(1,2))T.overlays-=x1
			spawn(rand(2,3))T.overlays-=x1
			spawn(rand(3,4))T.overlays-=x1
			spawn(rand(1,2))T.overlays-=x1
			spawn(rand(3,4))T.overlays-=x1
			spawn(rand(4,8)) new/turf/Dirt1(locate(T.x,T.y,T.z))
			spawn(rand(4,8)) Destroy(T)
	if(x==3)
		sleep()
		spawn()Shockwave(E,1)
		src.overlays+=image('SSJGodTrans.dmi',pixel_x=-32, pixel_y=-32)
		sleep(30)
		spawn()Shockwave(E,1.2)
		spawn()Shockwave(E,1)
		sleep(25)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.2)
		spawn()Shockwave(E,1)
		spawn()Shockwave(E,2)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.2)
		spawn()Shockwave(E,1)
		Quake(80)
		spawn()LightningFlash(src)
		src.overlays-=image('SSJGodTrans.dmi',pixel_x=-32, pixel_y=-32)
		src.overlays+=image('Aurasbig.dmi',"SSJ",pixel_x=-32)
		src.ssj["3req"]=100000000
		if(src.Class=="Vegito")
			src.ssj["3req"]=200000000
		spawn()for(var/i=200, i>0, i--)
			new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
			if(prob(50))sleep(1)
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
	//	EX_EffectHandler(/obj/Effects/Tornado,500,100,100,1,50,1,50,src,50,1,null)
		sleep(50)
		Quake(20)
		spawn()Crater(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(10)
		spawn()Shockwave(E,1)
		LightningFlash(src)
		sleep(10)
		spawn()Shockwave(E,1)
		sleep(10)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		//spawn()SSJ3(src)
		sleep(10)
		LightningFlash(src)
		src.overlays-=image('Auras.dmi',"SSJ2")
		src.overlays-=image('Aurasbig.dmi',"SSJ",pixel_x=-32)
	//if(x==3)
	if(ssj["[x]mastery"]<25)
		ssj["[x]mastery"]=25
	if(src.Race!="Saiyan")
		src.ssj["[x]mastery"]=100
	src.PlusPower+=ssj["[x]give"]
	src.Base*=ssj["[x]multi"]
	src.BaseMod*=ssj["[x]multi"]



	ssj["active"]=x
	if(src.ssj["[src.ssj["active"]]mastery"]<100)
		src.RecoveryMultiplier*=0.9
	src.Hairz("Add")
	src.Auraz("Add")
	/*if(x==1 && src.AscendedSSj2)
		src.PlusPower+=ssj["2give"]
		src.Base*=ssj["2multi"]
		src.BaseMod*=ssj["2multi"]
//		src.RecoveryMultiplier*=0.85
		src.AscendedSSj2Active=1
	if(x==1 && src.AscendedSSj3)
		src.PlusPower+=ssj["3give"]
		src.Base*=ssj["3multi"]
		src.BaseMod*=ssj["3multi"]
//		src.RecoveryMultiplier*=0.85
		src.AscendedSSj3Active=1
	if(x==2 && src.AscendedSSj2Active==1)
		src.PlusPower-=ssj["2give"]
		src.Base/=ssj["2multi"]
		src.BaseMod/=ssj["2multi"]
//		src.RecoveryMultiplier/=0.85
		src.AscendedSSj2Active=0
	if(x==3 && src.AscendedSSj3Active==1)
		src.PlusPower-=ssj["3give"]
		src.Base/=ssj["3multi"]
		src.BaseMod/=ssj["3multi"]
//		src.RecoveryMultiplier/=0.85
		src.AscendedSSj3Active=0*/
	if(src.Race=="1/16th Saiyan")
		src.RecoveryMultiplier*=0.9
	if(src.Race=="1/16th Saiyan" && x==1)
		src.StrengthMultiplier*=1.75
		src.EnduranceMultiplier*=1.75
		src.ForceMultiplier*=1.75
		src.ResistanceMultiplier*=1.75
		src.OffenseMultiplier*=1.75
		src.DefenseMultiplier*=1.75
	if(src.Race=="1/16th Saiyan" && x==2)
		src.StrengthMultiplier*=1.4
		src.EnduranceMultiplier*=1.4
		src.ForceMultiplier*=1.4
		src.ResistanceMultiplier*=1.4
		src.OffenseMultiplier*=1.4
		src.DefenseMultiplier*=1.4
	if(ssj["[x]mastery"]<25)
		ssj["[x]mastery"]=25

	src.overlays-=image('AurasBig.dmi',"SSJ",pixel_x=-32)
	if(src.Race!="1/16th Saiyan"&&src.Class!="Hope of the Future")
		src.overlays+=image('AurasBig.dmi',"SSJ",pixel_x=-32)
	if(x==2 && src.Class!="Legendary")
		src.overlays-=image('Auras.dmi',"SSJ2")
		src.overlays+=image('Auras.dmi',"SSJ2")
		if(src.Race=="1/16th Saiyan")
			src.overlays-=image('Auras.dmi',"SSJ2")
			src.overlays+=image('Auras.dmi',"HT2")
	else if(x==3 && src.Class=="Legendary")
		src.overlays-=image('AurasBig.dmi', "LSSJ", pixel_x=-32)
		src.overlays-=image('Amazing LSSj Aura.dmi', pixel_x=-32)
		src.overlays+=image('Amazing LSSj Aura.dmi', pixel_x=-32)
	else if(x==3 && src.Class!= "Legendary")
		src.overlays-=image('AurasBig.dmi', "SSJ", pixel_x=-32)
		src.overlays-=image('Amazing SSj Aura.dmi', pixel_x=-32)
		src.overlays+=image('Amazing SSj Aura.dmi', pixel_x=-32)
mob/proc/SSJGod(var/x)
	for(var/obj/Oozaru/O in src)
		if(O.icon)
			src<<"You cannot transform while in oozaru!"
			return
	for(var/obj/Lycan/O in src)
		if(O.icon)
			src<<"You cannot transform while in Lycan!"
			return

	var/icon/E=icon('Effects.dmi',"Shock")//'Effect.dmi')

	src.Health=100
	src.Energy=EnergyMax
	src.OMessage(15,"[src] is fully revitalized, as their entire body is surrounded by a gentle aura.","<font color=red>[src]([src.key]) unlocked Giji SSj.")
	if(x==1)
		E.Blend(rgb(50,50,-10),ICON_ADD)
	if(x==1)
		sleep()
		spawn()Shockwave(E,1)
		src.overlays+=image('SSJGodTrans.dmi',pixel_x=-32, pixel_y=-32)
		sleep(30)
		spawn()Shockwave(E,1.2)
		spawn()Shockwave(E,1)
		sleep(25)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.2)
		spawn()Shockwave(E,1)
		spawn()Shockwave(E,2)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.2)
		spawn()Shockwave(E,1)
		Quake(80)
		spawn()LightningFlash(src)
		src.overlays-=image('SSJGodTrans.dmi',pixel_x=-32, pixel_y=-32)
	src.PlusPower+=src.Base*2000
	src.SSJGod=1
	ssj["active"]=1
	src.Hairz("Add")
	src.Auraz("Add")
	src.overlays-=image('AurasBig.dmi',"SSJ",pixel_x=-32)
	src.overlays+=image('AurasBig.dmi',"SSJ",pixel_x=-32)
	src.overlays+=image(icon='Auras.dmi',icon_state="Mystic")
	ssj["active"]=1
	src.Divine=1
mob/proc/RevertSSJG()
	src.PlusPower=0
	src.SSJGod=0
	if(src.Class!="Divine")
		src.BaseMod*=20
		src.Class="Divine"
	src.Hairz("Remove")
	src.Auraz("Remove")
	src.overlays-=image(icon='Auras.dmi',icon_state="Mystic")
	ssj["active"]=0
mob/proc/SuperSpiralMode(var/x)

	var/icon/E=icon('Effects.dmi',"Shock")//'Effect.dmi')
	var/icon/G=icon('MaleLight.dmi')
	var/icon/B=icon('FemaleLight.dmi')
	var/icon/C=icon('Namek1.dmi')
	var/icon/D=icon('FemaleLight.dmi')
	var/icon/F=icon('Alien1.dmi')
	var/icon/H=icon('Alien2.dmi')
	var/icon/I=icon('Alien3.dmi')
	var/icon/J=icon('Alien4.dmi')
	var/icon/K=icon('Alien5.dmi')
	var/icon/L=icon('Alien6.dmi')
	var/icon/M=icon('Alien7.dmi')
	var/icon/N=icon('CustomMale.dmi')
	var/icon/O=icon('CustomFemale.dmi')
	spawn()Shockwave(E,1.5)
	spawn()Shockwave(E,1.2)
	src.OMessage(15,"[src] began to evolve beyond the person they were a minute before!","<font color=red>[src]([src.key]) unlocked SuperSpiralMode.")
	spawn()Shockwave(E,1.2)
	sleep(40)
	src.OMessage(15,"Little by little, they advanced a bit forward with each turn!","<font color=red>[src]([src.key]) unlocked SuperSpiralMode.")
	sleep(40)
	spawn()Shockwave(E,1.2)
	sleep(20)
	src.OMessage(15,"<b>The dreams of those who have fallen, the hopes of those who will follow...</b>","<font color=red>[src]([src.key]) unlocked SuperSpiralMode.")
	src.overlays+=image('SpiralTrans.dmi',pixel_x=-32, pixel_y=-32)
	spawn()Shockwave(E,1.5)
	sleep(10)
	spawn()Shockwave(E,1.2)
	sleep(10)
	spawn()Shockwave(E,1)
	sleep(10)
	spawn()Shockwave(E,2)
	sleep(10)
	src.OMessage(15,"<b>...converged upon [src], weaving together into a double helix!</b>","<font color=red>[src]([src.key]) unlocked SuperSpiralMode.")
	var/maxblasts=128
	var/blasts=0
	while(blasts<maxblasts)
		blasts++
		flick("Blast",src)
		var/obj/Projectiles/Mystical/A=new(locate(min(max(src.x+rand(-10,10),1),500),min(max(src.y+rand(-10,10),1),500),src.z))
		A.Distance=Distance
		A.Explosive=0
		A.Knockback=0
		A.dir=rand(1,8)
		A.icon=pick(G,B,C,D,F,H,I,J,K,L,M,N,O)
		A.alpha=80
		A.Owner=src
		A.Physical=1
		A.Lethality=src.Lethal
		A.Damage_Multiplier=0
		A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*4500000
		if(!(A in view(20,src)))
			spawn del(A)
			continue
		spawn(30) if(A) spawn()Homing(A,src)
		if(prob(50))sleep(0.1)
		else if(prob(20))sleep(1)
		spawn(50) del(A)
	Quake(55)
	src.overlays-=image('SpiralTrans.dmi',pixel_x=-32, pixel_y=-32)
	if(!src.SpiralAscension)
		if(src.Race!="Saiyan")
			src.Base*=20
			src.BaseMod*=20
			src.Class="Ultimate Spiral"
		if(src.Race=="Saiyan" && src.Class!="Divine")
			src.Base*=20
			src.BaseMod*=20
			src.Class="Divine"
			src.Divine=1
		else
			src<<"Filler message."
	src.SuperSpiralMode=1
	var/lolol=2*4*4+64
	if(!src.SuperSpiralIcon)
		var/icon/Heh=new(src.icon)
		Heh.Blend('KaminaCape.dmi',ICON_OVERLAY)
		if(src.Hair)Heh.Blend(Hair,ICON_OVERLAY)
		Heh.Scale(lolol,lolol)
		var/icon/Heh2=new(Heh)
		Heh2.Blend(rgb(0,0,0,80),ICON_ADD)
		src.SuperSpiralIcon=Heh2
	if(!src.SuperSpiralAura)
		var/icon/Heh3 = new('SpiralAura.dmi')
		var/lolol2=2*4*4+192
		Heh3.Scale(lolol2,lolol2)
		src.SuperSpiralAura=Heh3
	src.overlays+=image(src.SuperSpiralIcon,pixel_x=-(lolol-32)/2)
	src.overlays+=image(src.SuperSpiralAura,pixel_x=-(lolol+96)/2)
	for(var/mob/A in world)
		if(src.Race!="Anti-Spiral")
			A << output ("<font color='#00FF00'><B>The whole universe shook, as [src] drilled a path to tomorrow!!</B></font color>")

mob/proc/RevertSuperSpiral()
	src.SpiralAscension=1
	src.SuperSpiralMode=0
	src.overlays-=src.SuperSpiralIcon
	src.overlays-=src.SuperSpiralAura
	src.overlays-=image(icon='Auras.dmi',icon_state="Mystic")
mob/proc/SuperButchMode(var/x)

	var/icon/E=icon('Effects.dmi',"Shock")//'Effect.dmi')
	var/icon/G=icon('MaleLight.dmi')
	var/icon/B=icon('Clothes51.dmi')
	var/icon/C=icon('Hair14.dmi')
/*	var/icon/B=icon('FemaleLight.dmi')
	var/icon/C=icon('Namek1.dmi')
	var/icon/D=icon('FemaleLight.dmi')
	var/icon/F=icon('Alien1.dmi')
	var/icon/H=icon('Alien2.dmi')
	var/icon/I=icon('Alien3.dmi')
	var/icon/J=icon('Alien4.dmi')
	var/icon/K=icon('Alien5.dmi')
	var/icon/L=icon('Alien6.dmi')
	var/icon/M=icon('Alien7.dmi')
	var/icon/N=icon('CustomMale.dmi')
	var/icon/O=icon('CustomFemale.dmi')*/
	spawn()Shockwave(E,1.5)
	spawn()Shockwave(E,1.2)
	src.OMessage(15,"[src] began to grow intoxicated beyond what they were a minute before!","<font color=red>[src]([src.key]) unlocked SuperSpiralMode.")
	spawn()Shockwave(E,1.2)
	sleep(40)
	src.OMessage(15,"Little by little, they got a bit more drunk with each sip!","<font color=red>[src]([src.key]) unlocked SuperSpiralMode.")
	sleep(40)
	spawn()Shockwave(E,1.2)
	sleep(20)
	src.OMessage(15,"<b>The blood alcohol content of those who have fallen, the alcoholism of those who will follow...</b>","<font color=red>[src]([src.key]) unlocked SuperSpiralMode.")
	src.overlays+=image('SpiralTrans.dmi',pixel_x=-32, pixel_y=-32)
	spawn()Shockwave(E,1.5)
	sleep(10)
	spawn()Shockwave(E,1.2)
	sleep(10)
	spawn()Shockwave(E,1)
	sleep(10)
	spawn()Shockwave(E,2)
	sleep(10)
	src.OMessage(15,"<b>...converged upon [src], weaving together into a double bottle!</b>","<font color=red>[src]([src.key]) unlocked SuperSpiralMode.")
	var/maxblasts=128
	var/blasts=0
	while(blasts<maxblasts)
		blasts++
		flick("Blast",src)
		var/obj/Projectiles/Mystical/A=new(locate(min(max(src.x+rand(-10,10),1),500),min(max(src.y+rand(-10,10),1),500),src.z))
		A.Distance=Distance
		A.Explosive=0
		A.Knockback=0
		A.dir=rand(1,8)
		A.icon=pick(G,B,C)
		A.overlays+=B
		A.overlays+=C
		A.alpha=80
		A.Owner=src
		A.Physical=1
		A.Lethality=src.Lethal
		A.Damage_Multiplier=0
		A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*4500000
		if(!(A in view(20,src)))
			spawn del(A)
			continue
		spawn(30) if(A) spawn()Homing(A,src)
		if(prob(50))sleep(0.1)
		else if(prob(20))sleep(1)
		spawn(50) del(A)
	Quake(55)
	src.overlays-=image('SpiralTrans.dmi',pixel_x=-32, pixel_y=-32)

	src.SSJGod=1
	var/lolol=2*4*4+64
	if(!src.SuperSpiralIcon)
		var/icon/Heh=new(src.icon)
		Heh.Blend('Clothes51.dmi',ICON_OVERLAY)
		Heh.Blend('KaminaCape.dmi',ICON_OVERLAY)
		//if(src.Hair)
		Heh.Blend(C,ICON_OVERLAY)
		Heh.Scale(lolol,lolol)
		var/icon/Heh2=new(Heh)
		Heh2.Blend(rgb(0,0,0,80),ICON_ADD)
		src.SuperSpiralIcon=Heh2
	if(!src.SuperSpiralAura)
		var/icon/Heh3 = new('SpiralAura.dmi')
		var/lolol2=2*4*4+192
		Heh3.Scale(lolol2,lolol2)
		src.SuperSpiralAura=Heh3
	src.overlays+=image(src.SuperSpiralIcon,pixel_x=-(lolol-32)/2)
	src.overlays+=image(src.SuperSpiralAura,pixel_x=-(lolol+96)/2)
	src.RPPower*=10000
	for(var/mob/A in world)
		if(src.Race!="Anti-Spiral")
			A << output ("<font color='#00FF00'><B>The whole universe shook, as Butch Butchenson, Man Amongst men, drank a path to tomorrow!!</B></font color>")

mob/proc/RevertSuperButch()
	src.SSJGod=0
	src.RPPower/=10000
	src.overlays-=src.SuperSpiralIcon
	src.overlays-=src.SuperSpiralAura
	src.overlays-=image(icon='Auras.dmi',icon_state="Mystic")

mob/proc/GijiSSj(var/x)
	for(var/obj/Oozaru/O in src)
		if(O.icon)
			src<<"You cannot transform while in oozaru!"
			return
	for(var/obj/Lycan/O in src)
		if(O.icon)
			src<<"You cannot transform while in Lycan!"
			return
	if(src.GijiTrigger)
		return

	var/icon/E=icon('Effects.dmi',"Shock")//'Effect.dmi')

	src.KO=0
	src.Anger=0
	src.Health=100
	src.Energy=EnergyMax
	src.OMessage(15,"[src] forces themself to their feet, as they begin to overflow with power!","<font color=red>[src]([src.key]) unlocked Giji SSj.")
	if(x==1)
		E.Blend(rgb(50,50,-10),ICON_ADD)
	if(x==1)
		spawn()for(var/i=200, i>0, i--)
			new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
			if(prob(50))sleep(1)
		spawn()DarknessFlash(src)
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		sleep()
		spawn()Shockwave(E,1)
		spawn()LightningFlash(src)
		if(src.Class=="Legendary")
			src.overlays+=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
		if(src.Class=="Hellspawn")
			src.overlays+=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
		else
			src.overlays+=image('AurasBig.dmi',"SSJ",pixel_x=-32)
		Quake(10)
		sleep(20)
		if(src.Class=="Legendary")
			src.overlays-=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
		if(src.Class=="Hellspawn")
			src.overlays-=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
		else
			src.overlays-=image('AurasBig.dmi',"SSJ",pixel_x=-32)
		spawn()Shockwave(E,1.2)
		spawn()Shockwave(E,1)
		Quake(20)
		sleep(30)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.2)
		spawn()Shockwave(E,1)
		if(src.Class=="Legendary")
			src.overlays+=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
		if(src.Class=="Hellspawn")
			src.overlays+=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
		else
			src.overlays+=image('AurasBig.dmi',"SSJ",pixel_x=-32)
		Quake(30)
		sleep(10)
		if(src.Class=="Legendary")
			src.overlays-=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
		if(src.Class=="Hellspawn")
			src.overlays-=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
		else
			src.overlays-=image('AurasBig.dmi',"SSJ",pixel_x=-32)
		spawn()LightningFlash(src)
		spawn()Shockwave(E,2)
		spawn()Shockwave(E,1.5)
		spawn()Shockwave(E,1.2)
		spawn()Shockwave(E,1)
		spawn()Crater(src)
		Quake(80)
		spawn()LightningFlash(src)
	src.PlusPower+=(ssj["[x]give"]/4)
	src.Anger=AngerMax
	src.InGiji=1
	src.GijiTrigger=1
	src.overlays+=image('AurasBig.dmi',"SSJ",pixel_x=-32)
mob/proc/RevertGiji()
	src.PlusPower=0//(ssj["[x]give"]/2)*AngerMax
/*	if(src.PlusPower=0)
		src.PlusPower=0*/
	src.InGiji=0
	src.overlays-=image('AurasBig.dmi',"SSJ",pixel_x=-32)
/*mob/proc/AmaterasuForm()
	for(var/obj/Lycan/Q in src)
//		var/image/Lycan=image('Lycan.dmi',pixel_x=-20,pixel_y=-12)
		if(Q.Transed)
			spawn()src.Shockwave(Q,1)
			spawn()Crater(usr)
			for(var/mob/O in range(50))
				O << output ("<b>[src] let out a triumphant howl, causing the sun to shine brightly!</b>")
			Q.Transed=2
			src.icon=Q.icon
			Q.icon=0
			src.overlays=Q.overlays
			src.OffenseMultiplier*=1.5
			src.DefenseMultiplier*=1.5
			src.StrengthMultiplier*=1.5
			src.ForceMultiplier*=1.5
			src.BaseMod*=6
			src.Base*=6
			src.PlusPower+=100000000
			src.SunForm=1*/
/*proc/SSJ3(var/mob/Z)
	LightningFlash(Z)
	spawn(50) EX_EffectHandler(/obj/Effects/Tornado,500,100,100,1,50,1,50,Z,50,1,null)
	spawn(10)for(var/area/L in world)
		if(L.z==Z)
			L.icon_state="Rising Rocks"
			L.WeatherOn=0
		sleep(1)
	spawn(600)
		for(var/obj/Items/T in world)if(T.z==Z)del(T)
		LightningFlash(Z)*/
mob/proc/WorldOfNothingness()
	if(src.Transforming==1)
		return
	if(src.ssj4active==1)
		src.revertWON()
	else
		src.Transforming=1
		if(src.beenssj4 == 0)
			for(var/mob/Players/Q in world)
				if(Q.z == usr.z)
					usr<<"The planet begins to fade from existence, everything being replaced by naught but static."
			for(var/turf/T in Turf_Circle(src,8))
				if(prob(1)) sleep(0.005)
				spawn(rand(4,8)) VoidDestroy(T,5)
				for(var/mob/M in view(0,T))
					if(M!=src)
						M.Health-=(((usr.Force*usr.ForceMultiplier)*usr.Power)/((M.Resistance*M.ResistanceMultiplier)*M.Power))*30
			for(var/turf/T in Turf_Circle(src,30))
				if(prob(1)) sleep(0.005)
				spawn(rand(4,8)) VoidDestroy(T,5)
			src.Energy=src.EnergyMax
			sleep(15)
		else if(beenssj4== 1)
			LightningFlash(src)
			spawn()Shockwave(src,1)
			..()
		src.PlusPower+=src.Base*500
		src.ssj4active=1
		src.overlays+=image('Auras.dmi',"SSJ2")
		src.overlays+=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
		src.Transforming=0
mob/proc/revertWON()
	src.PlusPower=0
	src.ssj4active=0
	src.overlays-=image('Auras.dmi',"SSJ2")
	src.overlays-=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
mob/proc/HeartOfDarkness()
	if(src.Transforming==1)
		return
	if(src.ssj4active==1)
		src.revertHOD()
	else
		src.Transforming=1
		if(src.beenssj4 == 0)
			spawn()for(var/i=200, i>0, i--)
				new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
				if(prob(50))sleep(1)
			var/icon/E=icon('Effects.dmi',"Shock")
			spawn()DarknessFlash(src)
			spawn()for(var/turf/e in range(20,src))
				if(prob(60))continue
			/*	if(prob(50))
					e.overlays+=image('Weather.dmi',"Rising Rocks")*/
				if(prob(40))spawn()new/obj/Effects/Lightning(e)
				if(prob(50))sleep(0.3)
				if(prob(45))
					e.overlays+=image('SSj Lightning.dmi')
					sleep(25)
					e.overlays-=image('SSj Lightning.dmi')
			for(var/mob/O in range(8))
				O << output ("<b>[src.name] begins exerting an incredible amount of power as clouds form in the sky!")
			sleep(10)
			spawn for(var/turf/T in view(200))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
			sleep(2)
			spawn for(var/turf/T in view(300))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays-=W
			sleep(2)
			spawn for(var/turf/T in view(200))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
			sleep(2)
			spawn for(var/turf/T in view(300))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays-=W
			sleep(2)
			spawn for(var/turf/T in view(200))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
			sleep(2)
			spawn for(var/turf/T in view(300))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays-=W
			sleep(10)
			spawn for(var/turf/T in view(300))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays-=W
			src.overlays-= 'SSj lightning.dmi'
			sleep(15)
			for(var/mob/O in range(8))
				O << output ("<b>The ground suddenly begins quaking from the massive outpour of energy!")
			src.overlays+= 'SSj lightning.dmi'
//			sleep(10)
			spawn for(var/turf/T in view(200))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
			for(var/mob/D in view(100, src))
				Quake(5)
//			sleep(5)
			spawn for(var/turf/T in view(300))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays-=W
			for(var/mob/D in view(100, src))
				Quake(5)
//			sleep(5)
			spawn for(var/turf/T in view(200))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
			for(var/mob/D in view(100, src))
				Quake(5)
	//		sleep(3)
			spawn for(var/turf/T in view(300))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays-=W
			src.overlays-= 'SSj lightning.dmi'
			for(var/mob/D in view(100, src))
				Quake(5)
	//		sleep(3)
			spawn for(var/turf/T in view(200))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
			for(var/mob/D in view(100, src))
				Quake(5)
	//		sleep(3)
			src.overlays-= 'SSj lightning.dmi'
			spawn for(var/turf/T in view(300))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays-=W
			for(var/mob/D in view(100, src))
				Quake(5)
			LightningFlash(src)
			spawn()Shockwave(E,1)
			spawn for(var/turf/T in view(300))
				var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
			for(var/turf/T in Turf_Circle(src,8))
				if(prob(1)) sleep(0.005)
				//spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
				spawn(rand(4,8)) Destroy(T)
				//		if(prob(10))sleep(0.1)
				for(var/mob/M in view(0,T))
					if(M!=src)
						if(M.Resolve==1)
							M.Health-=(((usr.Force*usr.ForceMultiplier)*usr.Power)/((M.Resistance*M.ResistanceMultiplier)*M.Power))*30
			src.Energy=src.EnergyMax
			sleep(15)
			for(var/mob/A in world)
				A << output ("<B>Your heart fills with dread as a suffocating dark miasma fills the air.</B>")
		else if(beenssj4== 1)
			LightningFlash(src)
			spawn()Shockwave(src,1)
			..()
		src.PlusPower+=src.Base*500
		src.StrengthMultiplier*=2.4
		src.EnduranceMultiplier*=2.4
		src.ForceMultiplier*=2.4
		src.ResistanceMultiplier*=2.4
		src.OffenseMultiplier*=2.4
		src.DefenseMultiplier*=2.4
		src.ssj4active=1
		src.overlays+=image('Auras.dmi',"SSJ2")
		src.overlays+=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
		spawn for(var/turf/T in view(300))
			var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
			T.overlays-=W
//		src.Efficiency*=100
		src.Transforming=0
mob/proc/revertHOD()
	src.StrengthMultiplier/=2.4
	src.EnduranceMultiplier/=2.4
	src.ForceMultiplier/=2.4
	src.ResistanceMultiplier/=2.4
	src.OffenseMultiplier/=2.4
	src.DefenseMultiplier/=2.4
	src.PlusPower=0
	src.ssj4active=0
	src.overlays-=image('Auras.dmi',"SSJ2")
	src.overlays-=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
mob/proc/revertFHOD()
	src.StrengthMultiplier/=1.3
	src.EnduranceMultiplier/=1.3
	src.ForceMultiplier/=1.3
	src.ResistanceMultiplier/=1.3
	src.OffenseMultiplier/=1.3
	src.DefenseMultiplier/=1.3
	src.PlusPower-=50000000
	src.ssj4active=0
	src.overlays-=image('Auras.dmi',"SSJ2")
	src.overlays-=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
mob/proc/FakeHOD()
	if(src.ssj4active==1)
		src.revertFHOD()
	else
		src.StrengthMultiplier*=1.3
		src.EnduranceMultiplier*=1.3
		src.ForceMultiplier*=1.3
		src.ResistanceMultiplier*=1.3
		src.OffenseMultiplier*=1.3
		src.DefenseMultiplier*=1.3
		src.ssj4active=1
		src.PlusPower+=50000000
		LightningFlash(src)
		var/icon/E=icon('Effects.dmi',"Shock")
		spawn()Shockwave(E,1)
		..()
		for(var/turf/T in Turf_Circle(src,8))
			if(prob(1)) sleep(0.005)
			//spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
			spawn(rand(4,8)) Destroy(T)
			//		if(prob(10))sleep(0.1)
			for(var/mob/M in view(0,T))
				if(M!=src)
					M.Health-=(((usr.Force*usr.ForceMultiplier)*usr.Power)/((M.Resistance*M.ResistanceMultiplier)*M.Power))*30


		src.overlays+=image('Auras.dmi',"SSJ2")
		src.overlays+=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
mob/proc/GoSavageSSJ4()
	if(Dead==1&&KeepBody==0&&!src.HeartHero)
		return
	if(src.Transforming==1)
		return
	if(src.ssj["active"]>=1)
		return
	if(!src.Tail)return
/*	if(src.ssj4active==1)
		src.revertSSJ4()*/
	else
		LightningFlash(src)
		spawn()Shockwave(src,1)
		..()
		src.PlusPower+=20000000
		src.Base*=2.5
		src.BaseMod*=2.5
		src.StrengthMultiplier*=2.5
		src.SpeedMultiplier*=1.5
		src.EnduranceMultiplier*=5
		src.ResistanceMultiplier*=5
		src.RegenerationMultiplier/=1.5
		src.RecoveryMultiplier/=1.5
		src.ssj4active=1
		src.overlays+='SSj4Overlay.dmi'
		src.Efficiency*=100
		src.Transforming=0
		src.Anger=src.AngerMax
//		src.overlays+=image('Amazing SSj4 Aura.dmi',pixel_x=-32)
mob/proc/revertSavageSSJ4()
	src.Base/=2.5
	src.BaseMod/=2.5
	src.StrengthMultiplier/=2.5
	src.SpeedMultiplier/=1.5
	src.EnduranceMultiplier/=5
	src.ResistanceMultiplier/=5
	src.PlusPower-=20000000
	src.RegenerationMultiplier*=1.5
	src.RecoveryMultiplier*=1.5
	src.ssj4active=0
	src.overlays-='SSj4Overlay.dmi'
	src.Efficiency/=100
mob/proc/GoSSJ4()
	if(Dead==1&&KeepBody==0&&!src.HeartHero)
		return
	if(src.Transforming==1)
		return
	if(src.ssj["active"]>=1)
		return
	if(!src.Tail)return
/*	if(src.ssj4active==1)
		src.revertSSJ4()*/
	else
		LightningFlash(src)
		spawn()Shockwave(src,1)
		..()

		//src.PlusPower+=ssj["4give"]
		if(src.Class!="Savage")
			src.Ascend(src.BaseMod*10)
			src.PlusPower+=src.GetBPM()*1000
		/*else if(src.Class=="Savage")
			src.Base*=2
			src.BaseMod*=2
			src.StrengthMultiplier*=1.5
			src.PlusPower+=20000000*/
		src.SpeedMultiplier*=1.5
		src.EnduranceMultiplier*=1.5
		src.ResistanceMultiplier*=1.5
		if(src.Class== "Hellspawn")
			src.StrengthMultiplier*=1.5
			src.ForceMultiplier*=1.5
			src.OffenseMultiplier*=1.5
			src.DefenseMultiplier*=1.5
		src.ssj4active=1
		src.overlays+='SSj4Overlay.dmi'
		/*if(src.Class == "Fire God")
			src.Base*=1.4
			src.BaseMod*=1.4
			src.PlusPower+=500000000
			src.overlays += src.Hair_SSJ3
			src.overlays -= Hair*/
		src.Efficiency*=100
		src.Transforming=0
//		src.overlays+=image('Amazing SSj4 Aura.dmi',pixel_x=-32)
mob/proc/revertSSJ4()
	src.SpeedMultiplier/=1.5
	src.EnduranceMultiplier/=1.5
	src.ResistanceMultiplier/=1.5
	if(src.Class!="Savage")
		src.Ascend(src.BaseMod/10)
		src.PlusPower-=src.GetBPM()*1000
	/*if(src.Class == "Fire God")
		src.Base/=1.4
		src.BaseMod/=1.4
		src.PlusPower-=500000000
		src.overlays -= src.Hair_SSJ3
		src.overlays += Hair*
	if(src.Class=="Savage")
		src.Base/=2
		src.BaseMod/=2
		src.StrengthMultiplier/=1.5
		src.PlusPower-=20000000*/
	if(src.Class== "Hellspawn")
		src.StrengthMultiplier/=1.5
		src.ForceMultiplier/=1.5
		src.OffenseMultiplier/=1.5
		src.DefenseMultiplier/=1.5
	/*src.RegenerationMultiplier*=3
	src.RecoveryMultiplier*=3*/
	src.ssj4active=0
	src.overlays-='SSj4Overlay.dmi'
	src.Efficiency/=100
//	src.overlays-=image('Amazing SSj4 Aura.dmi',pixel_x=-32)
mob/proc/GoBojack()
	if(Dead==1&&KeepBody==0&&!src.HeartHero)
		return
	if(src.InBojack>=1)
		src.UnBojack()
		return
	else
		Quake(10)
		spawn()DarknessFlash(src)
		sleep(10)
		src.Hairz("Add")
		src.InBojack=1
		if(!locate(/obj/Skills/Bojack, src))
			src.contents+=new/obj/Skills/Bojack
		src.Base*=1.5
		src.BaseMod*=1.5
		src.PlusPower+=3000000

mob/proc/UnBojack()
	if(InBojack==2)
		src.Base/=2
		src.BaseMod/=2
		src.RecoveryMultiplier*=2
		src.overlays-=image('Aurasbig.dmi',"LSSJ",pixel_x=-32)
	src.InBojack=0
	src.Base/=1.5
	src.BaseMod/=1.5
	src.PlusPower=0//-=3000000
	src.Hairz("Add")
mob/proc/Bojack2()
	if(Dead==1&&KeepBody==0&&!src.HeartHero)
		return
	var/PowerAdd=src.Age*1000000
	var/icon/E=icon('Effects.dmi',"Shock")
	if(PowerAdd>=50000000)
		PowerAdd=50000000
	if(PowerAdd>=45000000)
		src.overlays+=image('Aurasbig.dmi',"SSJ",pixel_x=-32)
		spawn()for(var/i=200, i>0, i--)
			new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
			if(prob(50))sleep(1)
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
	//	EX_EffectHandler(/obj/Effects/Tornado,500,100,100,1,50,1,50,src,50,1,null)
		sleep(50)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(10)
		spawn()Shockwave(E,1)
		LightningFlash(src)
		sleep(10)
		spawn()Shockwave(E,1)
		sleep(10)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		//spawn()SSJ3(src)
		sleep(10)
		LightningFlash(src)
		src.overlays-=image('Auras.dmi',"SSJ2")
		src.overlays-=image('Aurasbig.dmi',"SSJ",pixel_x=-32)
	Quake(10)
	spawn()DarknessFlash(src)
	sleep(10)
	src.Hairz("Add")
	src.InBojack=2
	src.Base*=2
	src.BaseMod*=2
	src.RecoveryMultiplier/=2
	src.overlays+=image('Aurasbig.dmi',"Heran",pixel_x=-32)
	src.PlusPower+=PowerAdd


mob/proc/SuperHeran(var/x)
	var/icon/E=icon('Effects.dmi',"Shock")
	if(x > 1)
		x=1
	if(x==2)
		src.overlays+=image('Aurasbig.dmi',"SSJ",pixel_x=-32)
		spawn()for(var/i=200, i>0, i--)
			new/obj/Effects/Lightning(locate(rand(1,500),rand(1,500),src.z))
			if(prob(50))sleep(1)
		spawn()for(var/turf/e in range(20,src))
			if(prob(60))continue
			if(prob(5))spawn()new/obj/Effects/Lightning(e)
			if(prob(50))sleep(0.3)
		LightningFlash(src)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
	//	EX_EffectHandler(/obj/Effects/Tornado,500,100,100,1,50,1,50,src,50,1,null)
		sleep(50)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(10)
		spawn()Shockwave(E,1)
		sleep(10)
		spawn()Shockwave(E,1)
		sleep(10)
		spawn()Shockwave(E,1)
		spawn()Quake(50)
		sleep(10)
		LightningFlash(src)
		src.overlays-=image('Auras.dmi',"SSJ2")
		src.overlays-=image('Aurasbig.dmi',"SSJ",pixel_x=-32)
	Quake(10)
	spawn()DarknessFlash(src)
	sleep(10)
	src.Hairz("Add")
	src.PlusPower+=src.BaseMod*10000000
	src.Ascend(src.BaseMod*1.5)
	src.SpeedMultiplier*=1.25
	if(!locate(/obj/Skills/Bojack,src))
		src.contents+=new/obj/Skills/Bojack
	trans["active"]=x
	if(src.trans["active"]>0)
		src.overlays+=image('AurasBig.dmi',"Heran",pixel_x=-32)


mob/proc/Transform()
	if(src.SSJGod)
		return
	if(Dead==1&&KeepBody==0&&!src.HeartHero)
		return
	if(src.TotalFatigue>src.EnergyMax/1.5)
		src<<"You are too tired to transform!"
		return
	if(src.TransLock)
		return
	for(var/obj/Skills/Extra/UltraInstinct/UI in src)
		if(UI.BuffUsing && !src.InstinctTrans)
			src.UltraInstinct()
			return
	for(var/obj/Skills/Buffs/Majin/N in src)
		if(N.BuffUsing && src.MajinTransUnlocked && !src.MajinTrans)
			src.DevilTrigger()
			return
	for(var/obj/Skills/Buffs/Mystic/Z in src)
		if(Z.BuffUsing && src.MysticTransUnlocked && !src.MysticTrans)
			src.SuperMystic()
			return
	if(src.BijuuActive&&!src.KyuubiControlledMode)
		if(src.JinchLevel >= 2)
			if(!src.JinVersionOne)
				src.JinVersionOneTrans()
				return
			else
				if(src.JinchLevel >= 3)
					if(!src.JinVersionTwo)
						src.JinVersionTwoTrans()
						return
					else
						if(src.JinchLevel >= 5)
							if(!src.JinFullTrans)
								src.JinFullTrans()
								return
	for(var/obj/Oozaru/O in src)
		if(O.icon)
			if(src.Base>=1000000 && !src.Golden)
				Oozaru(0)
				sleep(1)
				GoldenOozaru(1)
				return
			else
				return
	if(src.Class=="Deus" && trans["Unlocked"]>1 && src.Void)
		src.HeartOfDarkness()
		return
	if(CyberPower)
		if(!CyberTrans)
			return
		if(!MachinaMod)
			return
	if(allowFBM&&!(src.Race in list("Saiyan","Half Saiyan","Quarter Saiyan","Namekian","Changeling")))
		return
	if(src.ssj["transing"]==1||src.trans["transing"]==1)return
	if(src.Race=="Youkai"&&src.Class=="Hell Raven")
		if(src.trans["unlocked"]>=1)
			if(src.trans["active"]<1)
				src.trans["transing"]=1
				src.NuclearRaven(1)
				src.trans["transing"]=0
				return
		if(src.trans["unlocked"]>=2)
			if(src.trans["active"]<2)
				src.trans["transing"]=1
				src.NuclearRaven(2)
				src.trans["transing"]=0
				return
		if(src.trans["unlocked"]>=3)
			if(src.trans["active"]<3)
				src.trans["transing"]=1
				src.NuclearRaven(3)
				src.trans["transing"]=0
				return

	if(src.Race=="Nobody")
		if(src.trans["unlocked"]>=1)
			if(src.trans["active"]==1)return
			src.trans["transing"]=1
			src.TwilightSpectre(1)
			src.trans["transing"]=0
			return
	if(src.Race=="1/16th Saiyan")
		if(src.trans["unlocked"]==1 && src.ssj["unlocked"]<1)
			if(src.trans["active"]==1) return
			src.trans["transing"]=1
			src.SHROLL(1)
			src.trans["transing"]=0
			return
		else if(src.ssj["unlocked"]>=1&&src.ssj["active"]==0)
			src.ssj["transing"]=1
			src.SSj(1)
			src.ssj["transing"]=0
			return
		else if(ssj["active"]==1)
			if(ssj["1mastery"]<99)return
			if(ssj["unlocked"]>1)
				if(ssj["2req"]<=src.Power)
					ssj["transing"]=1
					src.SSj(2)
					ssj["transing"]=0
					return
	if(src.Race=="Saiyan")
		if(src.SSjGrade2 &&src.ssj["active"]==1||src.SSjGrade3 &&src.ssj["active"]==1)
			return
		for(var/obj/Oozaru/O in src)
			if(O.Looking)
				if(src.SSJ4Unlocked &&!src.ssj4active)
					src.GoSSJ4()
					return
		if(src.ssj4active) return
		if(ssj["active"]==0||ssj["active"]==null)
			if(ssj["unlocked"]>0)
				if(ssj["1req"]<=src.Power)
					ssj["transing"]=1
					src.PureSSj(1)
					ssj["transing"]=0
		else if(ssj["active"]==1)
			if(ssj["1mastery"]<99)return
			if(ssj["unlocked"]>1)
				if(ssj["2req"]<=src.Power)
					ssj["transing"]=1
					src.PureSSj(2)
					ssj["transing"]=0
		else if(ssj["active"]==2)
			if(ssj["2mastery"]<99)return
			if(ssj["unlocked"]>2)
				if(ssj["3req"]<=src.Power)
					ssj["transing"]=1
					src.PureSSj(3)
					ssj["transing"]=0
	if(src.Race=="Half Saiyan"||src.Race=="Quarter Saiyan")
		if(src.SSjGrade2 &&src.ssj["active"]==1||src.SSjGrade3 &&src.ssj["active"]==1)
			return
		for(var/obj/Oozaru/O in src)
			if(O.Looking)
				if(src.SSJ4Unlocked &&!src.ssj4active)
					src.GoSSJ4()
					return
		if(src.ssj4active) return
		if(ssj["active"]==0||ssj["active"]==null)
			if(ssj["unlocked"]>0)
				if(ssj["1req"]<=src.Power)
					ssj["transing"]=1
					src.SSj(1)
					ssj["transing"]=0
		else if(ssj["active"]==1)
			if(ssj["1mastery"]<99)return
			if(ssj["unlocked"]>1)
				if(ssj["2req"]<=src.Power)
					ssj["transing"]=1
					src.SSj(2)
					ssj["transing"]=0
		else if(ssj["active"]==2)
			if(ssj["2mastery"]<99)return
			if(ssj["unlocked"]>2)
				if(ssj["3req"]<=src.Power)
					ssj["transing"]=1
					src.SSj(3)
					ssj["transing"]=0
	if(src.Race=="Heran")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.SuperHeran(1)
					trans["transing"]=0
		/*else if(trans["active"]==1)
			if(trans["2req"]<=src.Power)
				trans["transing"]=1
				src.SuperHeran(2)
				trans["transing"]=0*/
	if(src.Race=="Namekian")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.SNJ(1)
					trans["transing"]=0
	if(src.Race=="Demi")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.SuperDemi(1)
					trans["transing"]=0
		if(trans["active"]==1)
			if(trans["unlocked"]>1)
				if(trans["2req"]<=src.Power)
					trans["transing"]=1
					src.SuperDemi(2)
					trans["transing"]=0

	/*if(src.Race=="Aetherian")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.SuperAgoro(1)
					trans["transing"]=0*/
	if(src.Race=="Pathfinder")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.PathFinder(1)
					trans["transing"]=0
	if(src.Race=="Lycan")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.AlphaLycanTrans(1)
					trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				if(trans["2req"]<=src.Power)
					trans["transing"]=1
					src.AlphaLycanTrans(2)
					trans["transing"]=0
	if(src.Race=="Manakete")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.DragonTrans(1)
					trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				if(trans["2req"]<=src.Power)
					trans["transing"]=1
					src.DragonTrans(2)
					trans["transing"]=0
	if(src.Race=="Demon"||src.Race=="Half Demon"||src.MazokuAscend)
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(!(trans["1req"]))return
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.SDJ(1)
					trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				if(masteries["1mastery"]<99)return
				if(!(trans["2req"]))return
				if(trans["2req"]<=src.Power)
					trans["transing"]=1
					src.SDJ(2)
					trans["transing"]=0
		else if(trans["active"]==2)
			if(trans["unlocked"]>2)
				if(masteries["2mastery"]<99)return
				if(!(trans["3req"]))return
				if(trans["3req"]<=src.Power)
					trans["transing"]=1
					src.SDJ(3)
					trans["transing"]=0
	if(src.Race=="Alien")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				trans["transing"]=1
				src.SuperAlien(1)
				trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				trans["transing"]=1
				src.SuperAlien(2)
				trans["transing"]=0

		else if(trans["active"]==2)
			if(trans["unlocked"]>2)
				trans["transing"]=1
				src.SuperAlien(3)
				trans["transing"]=0

	if(src.Race=="Hollow")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(!(trans["1req"]))return
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.Resurreccion(1)
					trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				if(masteries["1mastery"]<99)return
				if(!(trans["2req"]))return
				if(trans["2req"]<=src.Power)
					trans["transing"]=1
					src.Resurreccion(2)
					trans["transing"]=0
/*	if(src.Race=="Kaio")
		if(trans["transing"]==1)return
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(!(trans["1req"]))return
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.SuperKaio(1)
					trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				if(masteries["1mastery"]<99)return
				if(!(trans["2req"]))return
				if(trans["2req"]<=src.Power)
					trans["transing"]=1
					src.SuperKaio(2)
					trans["transing"]=0*/
	if(src.Race=="Changeling")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(!(trans["1req"]))return
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.SCL(1)
					trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				if(masteries["1mastery"]<100)return
				if(!(trans["2req"]))return
				if(trans["2req"]<=src.Power)
					trans["transing"]=1
					src.SCL(2)
					trans["transing"]=0
		else if(trans["active"]==2)
			if(trans["unlocked"]>2)
				if(!(trans["3req"]))return
				if(masteries["2mastery"]<100)return
				if(trans["3req"]<=src.Power)
					trans["transing"]=1
					src.SCL(3)
					trans["transing"]=0
		else if(trans["active"]==3)
			if(trans["unlocked"]>3)
				if(!(trans["4req"]))return
				if(masteries["3mastery"]<100)return
				if(trans["4req"]<=src.Power)
					trans["transing"]=1
					src.SCL(4)
					trans["transing"]=0
/*	if(src.Race=="Youkai")
	{
		if(src.Class=="Hell Raven")
		{
			if(trans["active"]==0||trans["active"]==null)
			{
				if(trans["unlocked"]>0)
				{
					if(trans["1req"]<=src.Power)
					{
						trans["transing"]=1;
						src.SuperYoukai(1);
						trans["transing"]=0;
					}
				}
			}
			else if(trans["active"]==1)
			{
				if(trans["unlocked"]>1)
				{
					if(trans["2req"]<=src.Power)
					{
						trans["transing"]=1;
						src.SuperYoukai(2);
						trans["transing"]=0;
					}
				}
			}
			else if(trans["active"]==2)
			{
				if(trans["unlocked"]>2)
				{
					if(trans["3req"]<=src.Power)
					{
						trans["transing"]=1;
						src.SuperYoukai(3);
						trans["transing"]=0;
					}
				}
			}
		}
	}
	*/
	if(src.Race=="Kurama")
		if(!trans["active"])
			if(trans["unlocked"]>0)
				trans["transing"]=1
				src.MaximumOverYiff(1)
				trans["transing"]=0
	if(src.Race=="Neko")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]<1)
				return
			if(trans["1req"]<=src.Power)
				trans["transing"]=1
				src.FriskyNeko(1)
				trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]<2)
				return
			if(trans["2req"]<=src.Power)
				trans["transing"]=1
				src.FriskyNeko(2)
				trans["transing"]=0
		else if(trans["active"]==2)
			if(trans["unlocked"]<3)
				return
			if(trans["3req"]<=src.Power)
				trans["transing"]=1
				src.FriskyNeko(3)
				trans["transing"]=0
	if(src.Race=="Dhampir")
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				trans["transing"]=1
				src.DhampirTension(1)
				trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				trans["transing"]=1
				src.DhampirTension(2)
				trans["transing"]=0
	if(src.Race=="Human"&&!src.MazokuAscend)
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(!(trans["1req"]))return
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.SHROLL(1)
					trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				if(!(trans["2req"]))return
				if(trans["2req"]<=src.Power)
					trans["transing"]=1
					src.SHROLL(2)
					trans["transing"]=0
		else if(trans["active"]==2)
			if(trans["unlocked"]>2)
				if(!(trans["3req"]))return
				if(masteries["2mastery"]<99)return
				if(trans["3req"]<=src.Power)
					trans["transing"]=1
					src.SHJ(3)
					trans["transing"]=0
		else if(trans["active"]==3)
			if(trans["unlocked"]>3)
				if(!(trans["4req"]))return
				if(masteries["3mastery"]<99)return
				if(trans["4req"]<=src.Power)
					trans["transing"]=1
					src.SHJ(4)
					trans["transing"]=0
	if(src.Race=="Throwback") //formerly "Throwback"
		if(trans["active"]==0||trans["active"]==null)
			if(trans["unlocked"]>0)
				if(!(trans["1req"]))return
				if(trans["1req"]<=src.Power)
					trans["transing"]=1
					src.SHJ(1)
					trans["transing"]=0
		else if(trans["active"]==1)
			if(trans["unlocked"]>1)
				if(!(trans["2req"]))return
				if(masteries["1mastery"]<99)return
				if(trans["2req"]<=src.Power)
					trans["transing"]=1
					src.SHJ(2)
					trans["transing"]=0
		else if(trans["active"]==2)
			if(trans["unlocked"]>2)
				if(!(trans["3req"]))return
				if(masteries["2mastery"]<99)return
				if(trans["3req"]<=src.Power)
					trans["transing"]=1
					src.SHJ(3)
					trans["transing"]=0
		else if(trans["active"]==3)
			if(trans["unlocked"]>3)
				if(!(trans["4req"]))return
				if(masteries["3mastery"]<99)return
				if(trans["4req"]<=src.Power)
					trans["transing"]=1
					src.SHJ(4)
					trans["transing"]=0

mob/proc/Revert()
	if(src.SSJGod)
		src.RevertSSJG()
	if(src.Toji)
		if(src.trans["active"]==1)
			src.overlays-=image('FriskyNekoOne.dmi', pixel_x=-32)
		if(src.trans["active"]==2)
			src.overlays-=image('FriskyNekoTwo.dmi', pixel_x=-32)
		if(src.trans["active"]==3)
			src.overlays-=image('FriskyNekoThree.dmi', pixel_x=-32)
	if(src.EmblemTrans) return
	for(var/obj/Skills/Extra/UltraInstinct/Z in src)
		if(Z.BuffUsing && src.InstinctTrans)
			src.RevertInstinct()
			return
	for(var/obj/Skills/Buffs/Mystic/Z in src)
		if(Z.BuffUsing && src.MysticTrans)
			src.RevertMystic()
			return
	for(var/obj/Skills/Buffs/Majin/N in src)
		if(N.BuffUsing && src.MajinTrans)
			src.RevertDT()
			return
	if(src.BijuuActive)
		if(src.JinFullTrans)
			src.RevertJinFullTrans()
			return
		if(src.JinVersionTwo)
			src.RevertJinVersionTwoTrans()
			return
		if(src.JinVersionOne)
			src.RevertJinVersionOneTrans()
			return
	if(src.trans["transing"]==1||src.ssj["transing"]==1)return


	if(src.Race=="Youkai"&&src.Class=="Hell Raven")
		src.overlays-=image(icon='NuclearRaven.dmi',icon_state="One",pixel_x=-32)
		src.overlays-=image(icon='NuclearRaven.dmi',icon_state="Two",pixel_x=-32)
		src.overlays-=image(icon='NuclearRaven.dmi',icon_state="Three",pixel_x=-32)
		src.overlays-=image(icon='NuclearRavenSparks.dmi',icon_state="Two")
		src.overlays-=image(icon='NuclearRavenSparks.dmi',icon_state="Three")
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			//src.SaiyanPUNerf+=0.2
			src.StrengthMultiplier/=1.25
			src.ForceMultiplier/=1.25
			src.OffenseMultiplier/=1.25
			src.trans["active"]--
		src.Auraz("Remove")
	if(src.Race=="Nobody")
		src.overlays-=image(icon='TwilightSpectre.dmi', pixel_x=-32)
		src.overlays-=image(icon='TwilightSpectre.dmi', icon_state="WoN", pixel_x=-32)
		src.overlays-=image(icon='Auras.dmi', icon_state="HT3")
		src.overlays-=image(icon='Auras.dmi', icon_state="HT4")
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.trans["active"]--
	if(src.Race=="1/16th Saiyan"&&trans["active"]==1)
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('AurasBig.dmi',"HT1",pixel_x=-32)
		src.overlays-=image('AurasBig.dmi',"HT2",pixel_x=-32)
		src.overlays-=image('Amazing High Tension3 Aura.dmi',pixel_x=-32)
		src.overlays-=image('Auras.dmi',"HT3")
		src.overlays-=image('Auras.dmi',"HT2")
		src.overlays-=image('Auras.dmi',"HT4")
		src.overlays-=image('Amazing High Tension4 Aura.dmi',pixel_x=-32)
		src.overlays-=image('AurasBig.dmi',"Demon")
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.StrengthMultiplier/=1.3
			src.EnduranceMultiplier/=1.3
			src.ForceMultiplier/=1.3
			src.ResistanceMultiplier/=1.3
			src.OffenseMultiplier/=1.3
			src.DefenseMultiplier/=1.3
			src.StrengthMultiplier/=1.2
			src.EnduranceMultiplier/=1.2
			src.ForceMultiplier/=1.2
			src.ResistanceMultiplier/=1.2
			src.OffenseMultiplier/=1.2
			src.DefenseMultiplier/=1.2
			src.RecoveryMultiplier/=0.8

			trans["active"]--
	if(src.Race=="1/16th Saiyan"&&ssj["active"]>=1)
		if(ssj["active"]==0||ssj["active"]==null)return
		src.overlays-=image('Auras.dmi',"SSJ2")
		src.overlays-=image('Amazing SSj Aura.dmi',pixel_x=-32)
		src.overlays-=image('Amazing SSj4 Aura.dmi',pixel_x=-32)
		src.overlays-=image('Amazing LSSj Aura.dmi',pixel_x=-32)
		src.overlays-=image('Auras.dmi',"LSSJ2")
		src.overlays-=image('Auras.dmi',"HT2")
		if(x==2 && src.Class=="Legendary")
			src.overlays-=image('Auras.dmi',"LSSJ2")
		while(ssj["active"]>0)
			src.PlusPower-=ssj["[ssj["active"]]give"]
			src.Base/=ssj["[ssj["active"]]multi"]
			src.BaseMod/=ssj["[ssj["active"]]multi"]
			src.RecoveryMultiplier/=0.9
			if(ssj["active"]==1)
				src.StrengthMultiplier/=1.75
				src.EnduranceMultiplier/=1.75
				src.ForceMultiplier/=1.75
				src.ResistanceMultiplier/=1.75
				src.OffenseMultiplier/=1.75
				src.DefenseMultiplier/=1.75
			if(ssj["active"]==2)
				src.StrengthMultiplier/=1.4
				src.EnduranceMultiplier/=1.4
				src.ForceMultiplier/=1.4
				src.ResistanceMultiplier/=1.4
				src.OffenseMultiplier/=1.4
				src.DefenseMultiplier/=1.4
			ssj["active"]--
		src.Hairz("Add")
	if(src.Race=="Saiyan"&&src.ssj4active)
		src.revertSSJ4()
		return
	if(src.Race=="Saiyan"&&src.ssj["active"]>=1)
/*		if(ssj["active"]==1)
			src.ActiveBuffs=0
			src.SpecialSlot=0*/
		if(src.FirstSSj&&src.ssj["active"]==1)
			src.BaseMod/=50
			src.Base/=50
			src.ssj["1mastery"]=25
			src.FirstSSj=0
			src.overlays-=image('AurasBig.dmi',"SSJ",pixel_x=-32)
			src.ssj["active"]--
			src.Hairz("Add")
		else
			while(src.ssj["active"]>=1)
				src.PlusPower-=src.ssj["[src.ssj["active"]]give"]
				src.Ascend(src.BaseMod/src.ssj["[src.ssj["active"]]multi"])
				/*if(src.ssj["active"]==1 && src.Class!="Hellspawn")
					src.overlays-=image('AurasBig.dmi',"SSJ",pixel_x=-32)
				else if(src.ssj["active"]==1 && src.Class=="Hellspawn")
					src.overlays-=image('Aurasbig.dmi',"Kaioken",pixel_x=-32)
				if(src.ssj["active"]==2 && src.Class!="Legendary")
					src.overlays-=image('Auras.dmi',"LSSJ2")
				else if(src.ssj["active"]==3 && src.Class=="Legendary")
					src.overlays-=image('AurasBig.dmi', "LSSJ", pixel_x=-32)
					src.overlays-=image('Amazing LSSj Aura.dmi', pixel_x=-32)
				else if(src.ssj["active"]==3 && src.Class!= "Legendary")
					src.overlays-=image('AurasBig.dmi', "SSJ", pixel_x=-32)
					src.overlays-=image('Amazing SSj Aura.dmi', pixel_x=-32)*/
				if(src.ssj["[src.ssj["active"]]mastery"]<100)
					src.RecoveryMultiplier/=0.9
				src.ssj["active"]--
			//src.SaiyanPUNerf=1
			src.Hairz("Add")

	if(src.Race=="Alien")
		src.Base/=trans["[trans["active"]]multi"]
		src.BaseMod/=trans["[trans["active"]]multi"]
		src.RecoveryMultiplier/=0.85
		CustomizedRevert(src.trans["active"])
		if(src.trans["active"]==1)
			switch(trans["alientrans"])
				if("Power")
					StrengthMultiplier /= 1.4
					EnduranceMultiplier /= 1.4
				if("Potency")
					StrengthMultiplier /= 1.4
					ForceMultiplier /= 1.4
				if("Protection")
					EnduranceMultiplier /= 1.4
					ResistanceMultiplier /= 1.4
				if("Spirit")
					ForceMultiplier /= 1.4
					ResistanceMultiplier /= 1.4
		src.trans["active"]--

	if(src.Race=="Half Saiyan"||src.Race=="Quarter Saiyan")
		if(src.ssj4active)
			src.revertSSJ4()
			return
/*		if(ssj["active"]==1)
			src.ActiveBuffs=0
			src.SpecialSlot=0*/
		if(ssj["active"]==0||ssj["active"]==null)return
		src.overlays-=image('Auras.dmi',"SSJ2")
		src.overlays-=image('Amazing SSj Aura.dmi',pixel_x=-32)
		src.overlays-=image('Amazing SSj4 Aura.dmi',pixel_x=-32)
		src.overlays-=image('Amazing LSSj Aura.dmi',pixel_x=-32)
		src.overlays-=image('Auras.dmi',"LSSJ2")
		if(x==2 && src.Class=="Legendary")
			src.overlays-=image('Auras.dmi',"LSSJ2")
		while(ssj["active"]>0)
			src.PlusPower-=ssj["[ssj["active"]]give"]
			src.Base/=ssj["[ssj["active"]]multi"]
			src.BaseMod/=ssj["[ssj["active"]]multi"]
			src.RecoveryMultiplier/=0.85
			if(src.AscendedSSj2Active==1)
				src.PlusPower-=ssj["2give"]
				src.Base/=ssj["2multi"]
				src.BaseMod/=ssj["2multi"]
				src.RecoveryMultiplier/=0.85
				src.AscendedSSj2Active=0
			if(src.AscendedSSj3Active==1)
				src.PlusPower-=ssj["3give"]
				src.Base/=ssj["3multi"]
				src.BaseMod/=ssj["3multi"]
				src.RecoveryMultiplier/=0.85
				src.AscendedSSj3Active=0
			if(ssj["active"]==2 && src.Class=="Legendary")
				src.SetVars()
			ssj["active"]--
		src.Hairz("Add")
	if(src.Race=="Namekian")
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('Auras.dmi',"SNj")
		src.overlays-=image('Amazing Super Namekian Aura.dmi',pixel_x=-32)
		src.overlays-=image('AurasBig.dmi',"Namekian",pixel_x=-32)
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.RecoveryMultiplier/=1.25
			trans["active"]--
/*	if(src.Race=="Kaio")
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('AurasBig.dmi',"Rainbow",pixel_x=-32)
		src.overlays-=image('AuraElectricR.dmi')

		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.RecoveryMultiplier/=0.75
			src.ElementalKaio=0
			trans["active"]--*/
	if(src.Race=="Heran")
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('AurasBig.dmi',"Heran")
		src.overlays-=image('Amazing Ascended Heran Aura.dmi',pixel_x=-32)
		src.overlays-=image('Auras.dmi',"LSSJ2")
		while(trans["active"]>0)
//			if(src.AscensionsAcquired==1)
//				src.PlusPower-=20000000
//			if(src.AscensionsAcquired==2)
//				src.PlusPower-=35000000
//			if(src.AscensionsAcquired==3)
//				src.PlusPower-=80000000
			src.Ascend(src.BaseMod/1.5)
			src.PlusPower-=src.BaseMod*10000000
			src.SpeedMultiplier/=1.25
			trans["active"]--
	if(src.Race=="Pathfinder")
		if(trans["active"]==0||trans["active"]==null)return
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.RecoveryMultiplier/=0.8
			trans["active"]--
	if(src.Race=="Demon"||src.Race=="Half Demon"||src.MazokuAscend)
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('AurasBig.dmi',"Demon")
		src.overlays-=image('Auras.dmi',"SDj")
		src.overlays-=image('Auras.dmi',"SDj")
		src.icon=src.NormalIcon
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.RegenerationMultiplier/=2
			src.RecoveryMultiplier/=0.75
			if(src.SuperDemonStats&&trans["active"]==1)
				src.StrengthMultiplier/=1.75
				src.ForceMultiplier/=1.75
				src.OffenseMultiplier/=1.75
				src.SpeedMultiplier/=1.25
			if(src.Race=="Half Demon")
				src.SpeedMultiplier/=1.25
			if(trans["active"]==3)
				src.StrengthMultiplier/=1.35
				src.EnduranceMultiplier/=1.35
				src.ForceMultiplier/=1.35
				src.ResistanceMultiplier/=1.35
				src.OffenseMultiplier/=1.35
				src.DefenseMultiplier/=1.35
			trans["active"]--
			src.Hairz("Add")
	if(src.Race=="Hollow")
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('Demonic Aura.dmi')
		src.overlays-=image('Demonic Aura.dmi',"Vastocar")
		src.overlays-=image('Demonic Aura.dmi',"Ascended")
		src.overlays-=image('ArrancarAuras.dmi',"Vastocar")
		src.overlays-=image('ArrancarAuras.dmi',"Ascended")
		src.overlays-=image('ArrancarAuras.dmi')
		src.icon=src.NormalIcon
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.RecoveryMultiplier/=0.75
			if(trans["active"]==1||2)
				if(src.ResType=="Grimmjow")
					src.StrengthMultiplier/=1.5
					src.SpeedMultiplier/=1.25
				else if(src.ResType=="Starrk")
					src.DefenseMultiplier/=1.5
					src.ForceMultiplier/=1.25
				else if(src.ResType=="Ulquiorra")
					src.StrengthMultiplier/=1.15
					src.EnduranceMultiplier/=1.15
					src.ForceMultiplier/=1.15
					src.ResistanceMultiplier/=1.15
					src.OffenseMultiplier/=1.15
					src.DefenseMultiplier/=1.15
				else if(src.ResType=="Nnoitra")//Probably spelled this faggots name wrong
					src.EnduranceMultiplier/=1.5
					src.ResistanceMultiplier/=1.25
				else if(src.ResType=="Harribel")
					src.OffenseMultiplier/=1.25
					src.ForceMultiplier/=1.5


			trans["active"]--
			src.Hairz("Add")
	if(src.Race=="Demi")
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('Auras.dmi',"Demi")
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.overlays-=image('AurasBig.dmi',"Demi",pixel_x=-32)
//			src.RecoveryMultiplier*=2
//			src.RegenerationMultiplier/=2
			if(trans["active"]==2)
				src.AngerMax/=2
				src.Anger/=2
			trans["active"]--
	/*if(src.Race=="Aetherian")
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('Auras.dmi',"Agoro")
		while(trans["active"]>0)
			src.PlusPower-=trans["1give"]
			src.Base/=trans["1multi"]
			src.BaseMod/=trans["1multi"]
			src.RecoveryMultiplier/=1.5
//			src.RegenerationMultiplier/=2
			trans["active"]--*/
	if(src.Race=="Lycan")
		if(trans["active"]==0||trans["active"]==null)return
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.RecoveryMultiplier/=0.7
			//src.RegenerationMultiplier/=0.7
			src.StrengthMultiplier/=1.25
			src.EnduranceMultiplier/=1.25
			src.ResistanceMultiplier/=1.25
			//src.ForceMultiplier/=1.25
			src.icon=src.NormalIcon
			trans["active"]--

	if(src.Race=="Manakete")
		if(trans["active"]==0||trans["active"]==null)return
		while(trans["active"]>0)
			src.ForceMultiplier/=1.5
			src.OffenseMultiplier/=1.5
			src.DefenseMultiplier/=1.5
			src.icon=src.NormalIcon
			trans["active"]--

	if(src.Race=="Changeling")
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('AurasBig.dmi',"Changeling",pixel_x=-32)
		src.overlays-=image('Amazing Super Changeling Aura.dmi',pixel_x=-32)
		src.overlays-=image('Auras.dmi',"PurpleSpark")
		src.overlays-=image('Auras.dmi',"WaveSpark")
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			if(trans["active"]==1)
				src.ChangieMaxHealth+=50
			if(trans["active"]==2)
				src.ChangieMaxHealth+=50
			if(trans["active"]==3)
				src.ChangieMaxHealth+=150
			if(trans["active"]==4)
				src.ChangieMaxHealth+=150
			trans["active"]--
		if(src.SCLForm_1)src.icon=src.SCLForm_1
		if(src.Base>=(100000*src.BaseMod) && !src.FormMastery)
			if(src.trans["1mastery"]>=100&&src.Class=="King Kold")
				src.FormMastery=1
				src<< "You have obtained complete mastery over your forms, negating any consequence from using them."
				src.Class="Ascended King Kold"
				src.SetVars()
			if(src.trans["2mastery"]>=100&&src.Class=="Chilled")
				src.FormMastery=1
				src<< "You have obtained complete mastery over your forms, negating any consequence from using them."
				src.Class="Ascended Chilled"
				src.SetVars()
			if(src.trans["3mastery"]>=100&&src.Class=="Frieza")
				src.FormMastery=1
				src<< "You have obtained complete mastery over your forms, negating any consequence from using them."
				src.Class="Ascended Frieza"
				src.SetVars()
			if(src.trans["4mastery"]>=100&&src.Class=="Cooler")
				src.FormMastery=1
				src<< "You have obtained complete mastery over your forms, negating any consequence from using them."
				src.Class="Ascended Cooler"
				src.SetVars()
/*	if(src.Race=="Youkai")
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('AurasBig.dmi',"Changeling",pixel_x=-32)
		src.overlays-=image('Amazing Super Changeling Aura.dmi',pixel_x=-32)
		src.overlays-=image('Auras.dmi',"PurpleSpark")
		src.overlays-=image('Auras.dmi',"WaveSpark")
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			trans["active"]--
			if(src.Class=="Hell Raven")
				src.StrengthMultiplier/=1.25
				src.ForceMultiplier/=1.25
				src.OffenseMultiplier/=1.15*/

	if(src.Race=="Kurama")
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('AuraMystic.dmi',pixel_x=-32)
		src.PlusPower-=(trans["[trans["active"]]give"] * src.KuramaAscension)
		src.trans["1give"] = 0
		src.Base/=(src.KuramaAscension/2)
		src.BaseMod/=(src.KuramaAscension/2)
		trans["active"]--
		src.Hairz("Add")
	if(src.Race=="Dhampir")
		if(trans["active"]==0||trans["active"]==null)
			return
		src.overlays-=image('AurasBig.dmi',"Demon",pixel_x=-32)
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			if(src.Class=="Human Path")
				src.StrengthMultiplier/=1.3
				src.EnduranceMultiplier/=1.3
				src.ForceMultiplier/=1.3
				src.ResistanceMultiplier/=1.3
				src.OffenseMultiplier/=1.3
				src.DefenseMultiplier/=1.3
				src.RecoveryMultiplier/=0.8
			if(src.Class=="Vampire Path")
				src.StrengthMultiplier/=1.2
				src.EnduranceMultiplier/=0.8
				src.SpeedMultiplier/=1.2
				src.ForceMultiplier/=1.2
				src.ResistanceMultiplier/=0.8
				src.OffenseMultiplier/=0.9
				src.DefenseMultiplier/=0.9
				src.RecoveryMultiplier/=0.7
			if(src.Class=="Succubus Path")
				src.StrengthMultiplier/=1.35
				src.SpeedMultiplier/=1.35
				src.ForceMultiplier/=1.35
				src.OffenseMultiplier/=1.35
				src.RecoveryMultiplier/=0.75
			src.trans["active"]--
		src.Hairz("Add")
	if(src.Race=="Neko")
		if(trans["active"]==0||trans["active"]==null)
			return
		src.overlays-=image('FriskyNekoOne.dmi', pixel_x=-32)
		src.overlays-=image('FriskyNekoTwo.dmi', pixel_x=-32)
		src.overlays-=image('FriskyNekoThree.dmi', pixel_x=-32)
		src.overlays-=image('FriskyNekoSparks.dmi')
		while(trans["active"]>0)
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			if(trans["active"]!=1)
				src.RecoveryMultiplier/=0.75
			src.StrengthMultiplier/=1.25
			src.SpeedMultiplier/=1.25
			src.OffenseMultiplier/=1.25
			src.trans["active"]--
		src.Hairz("Add")
	if(src.Race=="Human" &&!src.MazokuAscend)
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('FriskyNekoOne.dmi', pixel_x=-32)
		src.overlays-=image('FriskyNekoTwo.dmi', pixel_x=-32)
		src.overlays-=image('FriskyNekoThree.dmi', pixel_x=-32)
		src.overlays-=image('AurasBig.dmi',"HT1",pixel_x=-32)
		src.overlays-=image('AurasBig.dmi',"HT2",pixel_x=-32)
		src.overlays-=image('Amazing High Tension3 Aura.dmi',pixel_x=-32)
		src.overlays-=image('Auras.dmi',"HT3")
		src.overlays-=image('Auras.dmi',"HT2")
		src.overlays-=image('Auras.dmi',"HT4")
		src.overlays-=image('Amazing High Tension4 Aura.dmi',pixel_x=-32)
		src.overlays-=image('AurasBig.dmi',"Demon")
		if(HTroll)
			while(trans["active"]>0)
				src.PlusPower-=trans["[trans["active"]]give"]
				src.Base/=trans["[trans["active"]]multi"]
				src.BaseMod/=trans["[trans["active"]]multi"]
				if(src.BodyType=="Small")
					src.StrengthMultiplier/=1.35
					src.EnduranceMultiplier/=1.35
					src.ResistanceMultiplier/=1.35
				else if (src.BodyType=="Large")
					src.OffenseMultiplier/=1.25
					src.DefenseMultiplier/=1.25
					src.ForceMultiplier/=1.5
					src.SpeedMultiplier/=1.25
				else if (src.BodyType=="Medium")
					src.StrengthMultiplier/=1.15
					src.EnduranceMultiplier/=1.15
					src.ForceMultiplier/=1.1
					src.ResistanceMultiplier/=1.15
					src.OffenseMultiplier/=1.1
					src.DefenseMultiplier/=1.1
				src.RecoveryMultiplier/=0.7
				trans["active"]--
		else
			while(trans["active"]>0)
				src.RecoveryMultiplier/=0.8
				src.PlusPower-=trans["[trans["active"]]give"]
				src.Base/=trans["[trans["active"]]multi"]
				src.BaseMod/=trans["[trans["active"]]multi"]
				if(trans["active"]==1)
					src.StrengthMultiplier/=1.3
					src.EnduranceMultiplier/=1.3
					src.ForceMultiplier/=1.3
					src.ResistanceMultiplier/=1.3
					src.OffenseMultiplier/=1.3
					src.DefenseMultiplier/=1.3
				if(trans["active"]==2)
					src.StrengthMultiplier/=1.35
					src.EnduranceMultiplier/=1.35
					src.ForceMultiplier/=1.35
					src.ResistanceMultiplier/=1.35
					src.OffenseMultiplier/=1.35
					src.DefenseMultiplier/=1.35
				trans["active"]--
		src.Hairz("Add")
	if(src.Race=="Throwback")//formerly "Throwback"
		if(trans["active"]==0||trans["active"]==null)return
		src.overlays-=image('AurasBig.dmi',"HT1",pixel_x=-32)
		src.overlays-=image('AurasBig.dmi',"HT2",pixel_x=-32)
		src.overlays-=image('Amazing High Tension3 Aura.dmi',pixel_x=-32)
		src.overlays-=image('Auras.dmi',"HT3")
		src.overlays-=image('Auras.dmi',"HT2")
		src.overlays-=image('Auras.dmi',"HT4")
		src.overlays-=image('Amazing High Tension4 Aura.dmi',pixel_x=-32)
		src.overlays-=image('AurasBig.dmi',"Demon")
		while(trans["active"]>0)
			src.RecoveryMultiplier/=0.9
			src.PlusPower-=trans["[trans["active"]]give"]
			src.Base/=trans["[trans["active"]]multi"]
			src.BaseMod/=trans["[trans["active"]]multi"]
			src.StrengthMultiplier/=1.25
			src.EnduranceMultiplier/=1.25
			src.SpeedMultiplier/=1.25
			src.ForceMultiplier/=1.25
			src.ResistanceMultiplier/=1.25
			src.OffenseMultiplier/=1.25
			src.DefenseMultiplier/=1.25
			trans["active"]--
		src.Hairz("Add")

	if(src.PlusPower<0)
		src.PlusPower=0

mob/proc/Shockwave(var/icon/E,var/Q=1)
	set background=1
	//b.Scale(96,96)
	var/y1=0
	var/x1=0
	//if(E.Width()>32)
	//	y1=(E.Width()-32)/64
	//if(E.Height()>32)
	//	x1=(E.Height()-32)/64
	spawn()new/shockwave(\
	locate(src.x-x1,src.y-y1,src.z),
	E,
	Ticks=10*sqrt(Q),
	Speed=20*Q,
	Amount=20*Q,
	StopAtObj=1,
	Source=src)