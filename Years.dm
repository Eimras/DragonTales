var
	Year=0.1
	Year_Speed=1
	Day=0
	Day_Speed=1
	Time="Day"
	MoonsActive=1
	EarthsMoon=1
	VegetasMoon=1
	ArconiasMoons=2
	SanctuarysMoon=1
	TimeSystem="DayNight"
proc/DayNight()
	while(1)
		sleep(144000/Day_Speed) //144000
		spawn()CallDayShit()

proc/CallDayShit()
	set background=1
	if(Time=="Day")
		Time="Night"
		world<<"<font color=#FFFF00>The sun starts to set, slowly darkening the area. It is now nighttime."
		if(global.MoonsActive==1)
			if(EarthsMoon==1&&prob(20))
				for(var/mob/Players/P)
					if(initial(P.Tail)&&P.Age<16&&P.z==1)
						P.Tail(1)
					for(var/obj/Oozaru/O in P)
						var/turf/Q=P.loc
						if(O.Looking&&P.z==1&&!istype(Q.loc,/area/Inside))
							P.Oozaru(1)
					if(P.Race=="Nobody")
						P.LunarRage=1
					if(!P.AlphaLycan && locate(/obj/Lycan,P.contents))
						P.Wolfman(1)
				world<<"<font color=yellow>Earth's pale moon rises..."
			if(VegetasMoon==1&&prob(10))
				for(var/mob/Players/P)
					if(initial(P.Tail)&&P.Age<16&&P.z==3)
						P.Tail(1)
					for(var/obj/Oozaru/O in P)
						if(O.Looking&&P.z==3)
							P.Oozaru(1)
					if(P.Race=="Nobody")
						P.LunarRage=1
					if(!P.AlphaLycan && locate(/obj/Lycan,P.contents))
						P.Wolfman(1)
				world<<"<font color=yellow>Vegeta's large, yellow moon rises..."
			if(ArconiasMoons>0&&prob(15*ArconiasMoons))
				for(var/mob/Players/P)
					if(initial(P.Tail)&&P.Age<16&&P.z==5)
						P.Tail(1)
					for(var/obj/Oozaru/O in P)
						if(O.Looking&&P.z==5)
							P.Oozaru(1)
					if(P.Race=="Nobody")
						P.LunarRage=1
					if(!P.AlphaLycan && locate(/obj/Lycan,P.contents))
						P.Wolfman(1)
				world<<"<font color=yellow>One of Arconia's moons rises..."
			if(SanctuarysMoon==1&&prob(22))
				for(var/mob/Players/P)
					if(initial(P.Tail)&&P.Age<16&&P.z==18)
						P.Tail(1)
					for(var/obj/Oozaru/O in P)
						if(O.Looking&&P.z==18)
							P.Oozaru(1)
					if(P.Race=="Nobody")
						P.LunarRage=1
					if(!P.AlphaLycan && locate(/obj/Lycan,P.contents))
						P.Wolfman(1)
				world<<"<font color=yellow>Sanctuary's green moon rises..."
		for(var/area/Outside/Planet/A in world)
			if(A.WeatherOn==1&&A.WeatherOdds>0)
				A.icon='Sunset.dmi'
				spawn(1100) A.icon='Dark.dmi'
	else if(Time=="Night")
		Time="Day"
		Day++
//		SetNewTierSCap()
		world<<"<font color=#FFFF00>The sun begins to rise, bringing on a new day."
		for(var/area/Outside/Planet/A in world)
			if(A.WeatherOn==1&&A.WeatherOdds>0)
				A.icon='Sunrise.dmi'
				spawn(1100)
					A.icon=null

				if(global.MoonsActive==1)
					if(EarthsMoon==1&&prob(5))
						for(var/mob/Players/P)
							if(initial(P.Tail)&&P.Age<16&&P.z==1)
								P.Tail(1)
							for(var/obj/Oozaru/O in P)
								if(O.Looking&&P.z==1&&!istype(P.loc,/area/Inside))
									P.Oozaru(1)
							if(P.Race=="Nobody")
								P.LunarRage=1
						world<<"<font color=yellow>Earth's moon has blocked out the Sun!"
						spawn(1200)
							A.icon='SuperDarkness.dmi'
					if(VegetasMoon==1&&prob(5))
						for(var/mob/Players/P)
							if(initial(P.Tail)&&P.Age<16&&P.z==3)
								P.Tail(1)
							for(var/obj/Oozaru/O in P)
								if(O.Looking&&P.z==3)
									P.Oozaru(1)
							if(P.Race=="Nobody")
								P.LunarRage=1
						world<<"<font color=yellow>Vegeta's large moon has blocked out the Sun!"
						spawn(1200)
							A.icon='SuperDarkness.dmi'
					if(ArconiasMoons>0&&prob(5*ArconiasMoons))
						for(var/mob/Players/P)
							if(initial(P.Tail)&&P.Age<16&&P.z==5)
								P.Tail(1)
							for(var/obj/Oozaru/O in P)
								if(O.Looking&&P.z==5)
									P.Oozaru(1)
							if(P.Race=="Nobody")
								P.LunarRage=1
						world<<"<font color=yellow>One of Arconia's moons has blocked out the Sun!"
						spawn(1200)
							A.icon='SuperDarkness.dmi'
					if(SanctuarysMoon==1&&prob(5))
						for(var/mob/Players/P)
							if(initial(P.Tail)&&P.Age<16&&P.z==18)
								P.Tail(1)
							for(var/obj/Oozaru/O in P)
								if(O.Looking&&P.z==18)
									P.Oozaru(1)
							if(P.Race=="Nobody")
								P.LunarRage=1
						world<<"<font color=yellow>Sanctuary's green moon blocks out the sun, bathing the planet in dull green light!"
						spawn(1200)
							A.icon='GreenDay.dmi'
proc/DayTimeCheck()
	if(Time=="Day")
		for(var/area/Outside/Planet/A in world)
			if(A.WeatherOn==1&&A.WeatherOdds>0)
				A.icon=null
	else if(Time=="Night")
		for(var/area/Outside/Planet/A in world)
			if(A.WeatherOn==1&&A.WeatherOdds>0)
				A.icon='Dark.dmi'

proc/Years()
	//set background=1
	while(1)
		sleep(36000/Year_Speed)
		spawn Add_Planet_Money()
		Log("Admin","<font color=#FFFF00>Planetary resources have regenerated.")
		Year+=0.1
		var/Month=round(Year-round(Year),0.1)
		for(var/mob/Players/P)
			P.Age_Increase(0.1)
		//Log("Admin","<font color=#FFFF00>It is now month [Month*10] of year [round(Year)]")
		world<<"<font color=#FFFF00>It is now month [Month*10] of year [round(Year)]"
		for(var/mob/Players/P)
			P.MakyoBPUp()
			P.Age_Increase(0.1)
/*			if(prob(20))
				world<<"<small><font color=yellow>The moon comes out..."
				for(var/mob/Players/P)
					if(initial(P.Tail)&&P.Age<16)
						P.Tail(1)
					for(var/obj/Oozaru/O in P)
						if(O.Looking&&P.z!=2)
							P.Oozaru(1)
			if(Year>1)
				if(Year%10==0&&global.StarActive==1)
					MakyoStar=1
					if((Year*10)%100==0)
						world<<"<small><font color=red>The Makyo Star approaches..."
						StarsActivated++
				else
					MakyoStar=0*/
mob/proc/Age_Increase(YearInput)
	if(Dead)
		if(Age<20)
			Age+=YearInput
	if(!Dead) Age+=YearInput
	Log_Year=Year
	//if(Year>=Birth_Year+20) AngerMax=150
	if(Age>(Decline*2))
		if(prob(30))Death(null,"old age")

mob/proc/Age_Update()
	if(Dead&&Age<20)
		Age+=Year-Log_Year
		if(Age>20)
			Age=20
	if(!Dead) Age+=Year-Log_Year
	Log_Year=Year

mob/proc/MakyoBPUp()
	/*if(StarsActivated==1)
		if(Race=="Makyo"&&Birth_Year<=10)
			if(WitnessedStars==0)
				BaseMod=2.25
				Base*=1.6
				WitnessedStars++
	else if(StarsActivated==2)
		if(Race=="Makyo"&&Birth_Year<=20)
			if(WitnessedStars==0)
				BaseMod=2.25
				Base*=1.6
				WitnessedStars++
			else if(WitnessedStars==1)
				BaseMod=3.5
				Base*=1.55
				WitnessedStars++
	else if(StarsActivated==3)
		if(Race=="Makyo"&&Birth_Year<=30)
			if(WitnessedStars==0)
				BaseMod=2.25
				Base*=1.6
				WitnessedStars++
			else if(WitnessedStars==1)
				BaseMod=3.5
				Base*=1.55
				WitnessedStars++
			else if(WitnessedStars==2)
				BaseMod=5
				Base*=1.4
				WitnessedStars++
	else if(StarsActivated==4)
		if(Race=="Makyo"&&Birth_Year<=40)
			if(WitnessedStars==0)
				BaseMod=2.25
				Base*=1.6
				WitnessedStars++
			else if(WitnessedStars==1)
				BaseMod=3.5
				Base*=1.55
				WitnessedStars++
			else if(WitnessedStars==2)
				BaseMod=5
				Base*=1.4
				WitnessedStars++
			else if(WitnessedStars==3)
				BaseMod=6
				Base*=1.2
				WitnessedStars++
	else if(StarsActivated==5)*/
	if(StarsActivated==1)
		if(Race=="Makyo")
			if(BaseMod>=2)
				return
			else
				BaseMod=2
				Base*=1.4
				WitnessedStars++
	else if(StarsActivated==2)
		if(Race=="Makyo")
			if(BaseMod>=3.25)
				return
			else
				BaseMod=3.25
				Base*=1.625
				WitnessedStars++
	else if(StarsActivated==3)
		if(Race=="Makyo")
			if(BaseMod>=4.5)
				return
			else
				BaseMod=4.5
				Base*=1.4
				WitnessedStars++
	else if(StarsActivated==4)
		if(Race=="Makyo")
			if(BaseMod>=6)
				return
			else
				BaseMod=6
				BaseMod*=1.35
				WitnessedStars++
	else if(StarsActivated>=5)
		if(Race=="Makyo")
			if(BaseMod>=7.5)
				return
			else
				BaseMod=7.5
				Base*=1.25
				WitnessedStars++