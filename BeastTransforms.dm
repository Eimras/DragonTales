mob/proc/Tail(Add_Tail=1)
	if(Add_Tail) Tail(0)
	var/image/T=image(icon='Tail.dmi')
	if(Hair_Color) T.icon+=Hair_Color
	else T.icon+=rgb(40,0,10)
	if(Add_Tail)
		Tail=1
		overlays+=T
	else
		Tail=0
		overlays-=T
		Oozaru(0)
mob/proc/GoldenOozaru(Go_Golden_Oozaru=1,var/revert)
	for(var/obj/Oozaru/O in src)
		var/Body=image(icon='Oozarus.dmi', icon_state="Golden")
	/*	var/image/Head=image(icon='Oozaru, Head.dmi',pixel_y=32)
		var/image/Body=image(icon='Oozaru, Body.dmi')*/
		if(Go_Golden_Oozaru)
			var/icon/E=icon('Effects.dmi',"Shock")
			if(!src.Tail)return
			if(src.Dead)return
			if(src.ssj["Active"]>0)return
			GoldenOozaru(0)
			LightningFlash(src)
			spawn()Shockwave(E,1)
			O.icon=icon
			O.overlays=overlays
		//	icon=Body
			src.overlays-=src.overlays
			src.overlays+=Body
			Anger()
			src.Golden=1
			src.BaseMod*=8
			src.Base*=8
			if(src.Class=="Savage")
				src.Power_Multiplier+=2
			if(revert)
				spawn(revert)GoldenOozaru(0)
			else
				spawn(rand(3000,5000))GoldenOozaru(0)
			spawn(rand(0,100)) for(var/mob/P in view(20,src)) P<<sound('Roar.wav', repeat = 0, wait = 0, channel = 0, volume = 70)
		else if(O.icon)
			icon=O.icon
			overlays=O.overlays
			O.icon=null
			src.Golden=0
			O.overlays=null
			src.BaseMod/=8
			src.Base/=8
			if(src.Class=="Savage")
				src.Power_Multiplier-=2
			if(src.Emitter && src.Base>=1500000)
				src.SSJ4Unlocked=1
				src.Emitter=0
				return
			if(src.Base>=3000000)
				src.SSJ4Unlocked=1
			/*	var/e = /obj/Skills/Super_Saiyan_4
				if(!(locate(e) in src.contents))
					src.contents+=new e*/

mob/proc/Wolfman(Go_Wolfman=1,var/revert)
	for(var/obj/Lycan/O in src)
		var/image/Body=image(icon='Lycan.dmi',pixel_x=-20,pixel_y=-12)
		if(Go_Wolfman)
			if(src.Dead) return
			if(src.ssj["active"]>0) return
			Wolfman(0)
			O.icon=icon
			O.overlays=overlays
			icon=Body
			src.overlays-=src.overlays
			Anger()
			usr.Power_Multiplier+=0.5
			usr.RecoveryMultiplier*=0.25
			usr.SpeedMultiplier*=1.5
			usr.DefenseMultiplier*=0.25
			usr.OffenseMultiplier*=0.25
			usr.ResistanceMultiplier*=1.5
			usr.EnduranceMultiplier*=1.5
			usr.StrengthMultiplier*=2
			usr.ForceMultiplier*=0.25
			if(revert)
				spawn(revert)Wolfman(0)
			else
				spawn(rand(3000,5000))Wolfman(0)
			spawn(rand(0,100)) for(var/mob/P in view(20,src)) P<<sound('Roar.wav', repeat = 0, wait = 0, channel = 0, volume = 70)

mob/proc/Oozaru(Go_Oozaru=1,var/revert)
	for(var/obj/Oozaru/O in src)
		var/image/Body=image(icon='OozaruReg.dmi')
		if(Hair_Color)
			Body.icon+=Hair_Color
		if(Go_Oozaru)
			if(!src.Tail)return
			if(src.Dead)return
			if(src.ssj["Active"]>0)return
			Oozaru(0)
			src.Oozaru=1
			O.icon=icon
			O.overlays=overlays
			icon=Body
			src.overlays-=src.overlays
			Anger()
			if(src.Class!="Savage")
				Efficiency*=0.5
				DefenseMultiplier*=0.1
				OffenseMultiplier*=0.1
			if(src.Class=="Savage"&&src.AscensionsAcquired==2)
				src.Power_Multiplier+=1
			if(src.Class=="Savage"&&src.AscensionsAcquired==3)
				src.Power_Multiplier+=2
			if(src.Class=="Savage"&&src.AscensionsAcquired==4)
				src.Power_Multiplier+=5
			src.Power_Multiplier+=5
			src.SaiyanAnger=6
			var/BonusAnger
			BonusAnger+=0.15*src.SaiyanAngerAscensions
			if(BonusAnger==0.45)
				BonusAnger=0.5

			if(Class=="Elite")
				Anger=2.25+BonusAnger
			if(Class=="Normal")
				Anger=2.25+BonusAnger
			if(Class=="Low-Class")
				Anger=2.5+BonusAnger

			if(revert)
				spawn(revert)Oozaru(0)
			else
				spawn(rand(3000,5000))Oozaru(0)
			spawn(rand(0,100)) for(var/mob/P in view(20,src)) P<<sound('Roar.wav', repeat = 0, wait = 0, channel = 0, volume = 70)


		else if(O.icon)
			if(Golden)
				src.GoldenOozaru(0)
				return
			if(src.Class!="Savage")
				Efficiency*=2
				DefenseMultiplier/=0.1
				OffenseMultiplier/=0.1
			if(src.Class=="Savage"&&src.AscensionsAcquired==2)
				src.Power_Multiplier-=1
			if(src.Class=="Savage"&&src.AscensionsAcquired==3)
				src.Power_Multiplier-=2
			if(src.Class=="Savage"&&src.AscensionsAcquired==4)
				src.Power_Multiplier-=5
			src.Power_Multiplier-=5
			src.Oozaru=0
			animate(src, transform = matrix()*2)
			icon=O.icon
			overlays=O.overlays
			O.icon=null
			O.overlays=null
			animate(src, transform = matrix(), time = 10)
		/*	if(src.Base>=600000000)
				var/e = /obj/Skills/Super_Saiyan_4
				if(!(locate(e) in src.contents))
					src.contents+=new e*/
obj/Oozaru
	var/Looking=1
	var/list/Haha=new
	verb/Oozaru()
		set category="Other"
		if(!usr.Tail)
			if(usr.Class=="Savage")
				usr<<"You forcefully grow your tail back!"
				usr.Tail=1
				usr.Tail(1)
		Looking=!Looking
		if(Looking)
			usr<<"You will look at the moon"
			if(usr.Tail)
				usr.Tail(0)
				usr.Tail(1)
		else
			usr<<"You will not look at the moon"
			if(usr.Golden)
				usr.GoldenOozaru(0)
			else if(!usr.Golden)
				usr.Oozaru(0)
			if(usr.Tail)
				usr.Tail(0)
				usr.Tail=1
obj/Manakete
	var/Transed=0
	var/list/Haha=new

	var/tmp
		Delay

	verb
		Dragonstone()
			set category="Skills"
			for(var/obj/Manakete/Q in usr)
				var/image/Manakete
				if(usr.trans["unlocked"]==0||usr.trans["unlocked"]==null)
					Manakete = image(icon='DragonRed.dmi', pixel_x=-32)
				else
					Manakete = image(icon='DragonWhite.dmi', pixel_x=-32)
				if(!Q.Transed)
					if(usr.trans["active"])
						if(usr.trans["active"]>0)
							usr<<"You cannot transform while you're transformed."
							return

					var/icon/E=icon('Effects.dmi',"Shock")

					spawn()for(var/turf/e in range(1,usr))
					spawn()usr.Shockwave(E,1)
					usr.Power_Multiplier+=0.25
					usr.DefenseMultiplier*=1.5
					usr.OffenseMultiplier*=1.5
					usr.ForceMultiplier*=1.5
					Q.Transed=1

					Q.icon+=usr.icon
					Q.overlays+=usr.overlays
					usr.icon=null
					usr.overlays+=Manakete
					src.overlays-=src.overlays
					usr.Manakete=1
				else
					usr.Power_Multiplier-=0.25
					usr.DefenseMultiplier/=1.5
					usr.OffenseMultiplier/=1.5
					usr.ForceMultiplier/=1.5

					Q.Transed=0
					usr.overlays-=usr.overlays
					usr.icon=Q.icon
					Q.icon=null
					spawn()usr.overlays=Q.overlays
					Q.overlays=null
					usr.Manakete=0


obj/Lycan
	var/Transed=0
	var/list/Haha=new

	var/tmp
		Delay
		HowlDelay

	Master
		verb/Bite()
			set category="Skills"
			if(!usr.AlphaLycan)
				usr<<"Hell no, nigga."
				return
			if(usr.Dead)
				usr<<"You're dead!"
				return
			var/list/who=list("Cancel")
			for(var/mob/Players/M in oview(1,usr))
				if(!M.Dead)
					who.Add(M)
			var/mob/blah=input("Who do you want to bite?","Infect")in who
			if(blah=="Cancel")return
			if(blah)
				if(!blah.KO)
					var/buh=input(blah,"Do you want to let [usr] bite you?")in list("No","Yes")
					if(buh=="No")return
				usr.OMessage(13,"[usr] bites [blah]....","[usr]([usr.key]) bit and killed [usr]([usr.key])")
				if(locate(/obj/Skills/VampireAbsorb,blah.contents)||locate(/obj/Lycan,blah.contents))
					blah.Death(usr)
				else
					blah.contents+=new/obj/Lycan
					blah.contents+=new/obj/Skills/Regenerate
					blah.EnhancedSmell=1



	verb
		Shred()
			set category="Skills"
			if(!src.Transed)
				usr<<"You cannot use this in your normal form!"
				return
			if(src.Delay||usr.Attacking)return
			var/image/LOL=image('Effects.dmi',"Shred")
			src.Delay=1
			spawn(300)
				if(usr)
					src.Delay=0
					usr<<"Delay finished."
			usr.Melee(5,0.5,LOL)
		Howl()
			set category="Skills"
			if(!src.Transed&&!usr.AlphaLycan)
				usr<<"You cannot use this in your normal form!"
				return
			if(src.Delay||usr.Attacking||src.HowlDelay)return
			src.HowlDelay=1
			spawn(1200)
				if(usr)
					src.HowlDelay=0
					usr<<"You can howl again!"
			var/icon/E=icon('Effects.dmi',"Howl")
			spawn()usr.Shockwave(E,0.5)
			for(var/mob/Players/M in oview(4,usr))
				if(!(locate(/obj/Lycan) in M.contents))
					M.Shocked++
					spawn(600)M.Shocked--
					view(10,M)<<"[M] is affected by [usr]'s howl!"
			for(var/mob/Players/M in oview(20,usr))
				if(!(locate(/obj/Lycan) in M.contents))
					if(usr.AlphaLycan)
						M.Wolfman(1)

		Leap()
			set category="Skills"
			if(!usr.Target||usr.Target==usr)return
			if(src.Delay||usr.Attacking)return
			var/image/LOL=image('Effects.dmi',"Leap")
			src.Delay=1
			view(10,usr.Target)<<"[usr] leaps to [usr.Target]!"
			spawn(450)
				if(usr)
					src.Delay=0
					usr<<"Delay finished."
			usr.Melee(2,0.5,LOL,usr.Target)



		WolfForm()
			set category="Skills"
			for(var/obj/Lycan/Q in usr)
				if(!usr.AlphaLycan)
					usr<<"You are not able to voluntarily trigger the shift at the moment."
					return
				if(!Q.Transed)
					if(usr.ssj["active"])
						if(usr.ssj["active"]>0)
							usr<<"You cannot transform while you're transformed so you gain BP while you gain BP."
							return
					if(usr.trans["active"])
						if(usr.trans["active"]>0)
							usr<<"You cannot transform while you're transformed so you gain BP while you gain BP."
							return
					for(var/obj/Oozaru/O in usr)
						if(O.icon)
							usr<<"You cannot transform while in oozaru!"
							return
					if(usr.Race!="Lycan")
						if(usr.trans["active"])
							if(usr.trans["active"]>0)
								usr<<"You cannot turn into a beast while in a transformed state."
								return
					var/image/Lycan=image('Lycan.dmi',pixel_x=-20,pixel_y=-12)
					var/icon/E=icon('Effects.dmi',"Shock")

					spawn()for(var/turf/e in range(1,usr))
					spawn()usr.Shockwave(E,1)
					spawn()Crater(usr)
					if(usr.Race=="Lycan")
						usr.Base*=1.5
						usr.BaseMod*=1.5
					else
						usr.Power_Multiplier+=0.5
					usr.RecoveryMultiplier*=0.75
					//usr.RegenerationMultiplier*=0.75
					usr.SpeedMultiplier*=1.5
					usr.DefenseMultiplier*=0.75
					usr.OffenseMultiplier*=0.75
					usr.ResistanceMultiplier*=1.5
					usr.EnduranceMultiplier*=1.5
					usr.StrengthMultiplier*=1.5
					usr.ForceMultiplier*=0.5

/*					if(usr.BodyType=="Medium")
						usr.StrengthMultiplier*=1.5
						usr.SpeedMultiplier*=1.5
						usr.ForceMultiplier*=0.5
						usr.DefenseMultiplier*=0.5
						usr.OffenseMultiplier*=0.75
						usr.ResistanceMultiplier*=1.25
						usr.EnduranceMultiplier*=1.25

					if(usr.BodyType=="Large")
						usr.StrengthMultiplier*=1.25
						usr.SpeedMultiplier*=2
						usr.ForceMultiplier*=0.5
						usr.DefenseMultiplier*=0.75
						usr.OffenseMultiplier*=0.75
						usr.ResistanceMultiplier*=1.15
						usr.EnduranceMultiplier*=1.15

					if(usr.BodyType=="Small")
						usr.StrengthMultiplier*=3
						usr.SpeedMultiplier*=1.25
						usr.ForceMultiplier*=0.45
						usr.DefenseMultiplier*=0.5
						usr.OffenseMultiplier*=0.5
						usr.ResistanceMultiplier*=1.75
						usr.EnduranceMultiplier*=1.75*/

					Q.Transed=1

					Q.icon=usr.icon
					Q.overlays=usr.overlays
					usr.icon=null
					usr.overlays+=Lycan
					src.overlays-=src.overlays
					usr.Anger()

				else
					if(usr.Race=="Lycan")
						usr.Base/=1.5
						usr.BaseMod/=1.5
					else
						usr.Power_Multiplier-=0.5
					usr.RecoveryMultiplier/=0.75
					//usr.RegenerationMultiplier*=0.75
					usr.SpeedMultiplier/=1.5
					usr.DefenseMultiplier/=0.75
					usr.OffenseMultiplier/=0.75
					usr.ResistanceMultiplier/=1.5
					usr.EnduranceMultiplier/=1.5
					usr.StrengthMultiplier/=1.5
					usr.ForceMultiplier/=0.5
					usr.Anger=0
//					usr.ActiveBuffs-=1


/*					if(usr.BodyType=="Medium")
						usr.StrengthMultiplier/=1.5
						usr.SpeedMultiplier/=1.5
						usr.ForceMultiplier/=0.5
						usr.DefenseMultiplier/=0.5
						usr.OffenseMultiplier/=0.75
						usr.ResistanceMultiplier/=1.25
						usr.EnduranceMultiplier/=1.25

					if(usr.BodyType=="Large")
						usr.StrengthMultiplier/=1.25
						usr.SpeedMultiplier/=2
						usr.ForceMultiplier/=0.5
						usr.DefenseMultiplier/=0.75
						usr.OffenseMultiplier/=0.75
						usr.ResistanceMultiplier/=1.15
						usr.EnduranceMultiplier/=1.15

					if(usr.BodyType=="Small")
						usr.StrengthMultiplier/=3
						usr.SpeedMultiplier/=1.25
						usr.ForceMultiplier/=0.45
						usr.DefenseMultiplier/=0.5
						usr.OffenseMultiplier/=0.5
						usr.ResistanceMultiplier/=1.75
						usr.EnduranceMultiplier/=1.75*/

					Q.Transed=0
					usr.icon=Q.icon
					Q.icon=0
					usr.overlays-=usr.overlays
					spawn()usr.overlays=Q.overlays

obj/ProjectionMoon
	icon='Moon.dmi'
	New()
		spawn() src.Project()
	proc/Project()
		spawn(100)if(src)del(src)
		src.icon_state="Other On"
		step(src,NORTH,10)
		sleep(10)
		step(src,NORTH,10)
		sleep(10)
		step(src,NORTH,10)
		sleep(10)
		step(src,NORTH,10)
		sleep(10)
		src.icon_state="On"
		sleep(20)
		view(10,src)<<"<font color=red><small>The moon emits an odd glow.."
		if(src)
			for(var/mob/Players/P in view(10))
				if(src.Skill>1)
					P.Oozaru(1,src.Skill)
				else
					P.Oozaru(1)

obj/Emitter
	icon='Moon.dmi'
	New()
		spawn() src.Project()
	proc/Project()
		spawn(100)if(src)del(src)
		src.icon_state="Other On"
		step(src,NORTH,10)
		sleep(10)
		step(src,NORTH,10)
		sleep(10)
		step(src,NORTH,10)
		sleep(10)
		step(src,NORTH,10)
		sleep(10)
		src.icon_state="On"
		sleep(20)
		view(10,src)<<"<font color=red><small>The moon emits an odd glow.."
		if(src)
			for(var/mob/Players/P in view(10))
				if(P.Race=="Saiyan" || P.Race=="Half Saiyan")
					P.Tail=1
				if(P.Base>=1000000)
					if(src.Skill>1)
						P.GoldenOozaru(1,src.Skill)
						P.Emitter=1
						return
					else
						P.GoldenOozaru(1)
						P.Emitter=1
						return
				else if(P.Base<=1000000)
					if(src.Skill>1)
						P.Oozaru(1,src.Skill)
					else
						P.Oozaru(1)