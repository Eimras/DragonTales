mob
	proc
		RRKVars()
			if(src.Ryutsuisen||src.Ryukansen||src.Ryushosen||src.Kuzuryusen||src.Soryusen||src.SixFourPalms||src.HiddenBlade||src.HiddenBlade2||src.CQCRestrain||src.Indomitable)
				return 1
			return 0

		IonioiChant()
			src.OMessage(52,"Energy collects in a swirling mass around [src] suddenly!","[src]([src.key]) started to cast Ionioi Hetairoi!")
			if(src.KingOfConquerors)
				sleep(15)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: To win, but not destroy; to conquer, but not humiliate..."
				sleep(30)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: That is what true conquest is!"
				sleep(5)
				var/icon/W=icon('Effects.dmi',"Shock")
				src.Shockwave(W, 3)
				Quake(10)
				sleep(10)
				src.PrevX=src.x
				src.PrevY=src.y
				src.PrevZ=src.z
				src.loc=locate(150,150,11)
				src.TotalInjury=0
				src.TotalFatigue=0
				src.Health=100
				src.Energy=src.EnergyMax
				src.ManaAmount=src.ManaMax
				src.Frozen=0
				if(!locate(/obj/Skills/Buffs/DivineArmy,src))
					src.contents+=new/obj/Skills/Buffs/DivineArmy
					src << "Those that fought with you in the past... they heed your call!"
				for(var/mob/M in world)
					if(M.IHTarget==1)
						M.PrevX=M.x
						M.PrevY=M.y
						M.PrevZ=M.z
						M.loc=locate(rand(101,199),rand(101,199),11)
						if(src.Target==M)
							src.Target.loc=locate(150,142,11)
						M.TotalInjury=0
						M.TotalFatigue=0
						M.Health=100
						M.Energy=src.EnergyMax
				var/serv=0
				var/servmax=12
				while(serv<servmax)
					serv++
					var/mob/Servant/x=new(locate(min(max(src.x+rand(-10,10),1),500),min(max(src.y+rand(-10,10),1),500),src.z))
					x.Class=pick("Saber","Archer","Caster","Lancer")
					x.Health=rand(10,30)
					if(x.Class=="Saber")
						x.icon='MaleTan.dmi'
						if(src.Race=="Saiyan"||src.Race=="Half-Saiyan")
							x.icon='SaiyanWarrior.dmi'
					if(x.Class=="Archer")
						x.icon='MaleDark.dmi'
						if(src.Race=="Saiyan"||src.Race=="Half-Saiyan")
							x.icon='SaiyanWarrior.dmi'
					if(x.Class=="Caster")
						x.icon='FemaleLight.dmi'
						if(src.Race=="Saiyan"||src.Race=="Half-Saiyan")
							x.icon='SaiyanWarrior.dmi'
					if(x.Class=="Lancer")
						x.icon='MaleLight.dmi'
						if(src.Race=="Saiyan"||src.Race=="Half-Saiyan")
							x.icon='SaiyanWarrior.dmi'
	//				x.overlays=src.overlays
	//				x.underlays=x.underlays
					x.Power=src.Power*0.5
					x.Base=src.Base
					x.Strength=src.Strength
					x.Endurance=src.Endurance
					x.Speed=src.SpeedMod
					x.SpeedMod=src.SpeedMod
					x.Offense=src.Offense
					x.Defense=src.Defense
					x.Force=src.Force
					x.Resistance=src.Resistance
					if(x.Class=="Saber")
						x.Health+=30
					if(x.Class=="Archer")
						x.Strength*=1.5
						x.Endurance*=1.5
					if(x.Class=="Caster")
						x.Offense*=1.5
						x.Resistance*=1.5
					if(x.Class=="Lancer")
						x.Defense*=1.5
						x.Speed*=1.5
					x.Race=src.Race
					x.name="Heroic Spirit"
					x.Owner=src.key
					x.dir=src.dir
					src.ManaAmount-=1
				src.RiderEnd()

		UBWChant()
		{
			src.OMessage(52,"A ring of white fire expands outwards from [src] as they begin to chant!","[src]([src.key]) started to cast Unlimited Blade Works!")
			if(src.CounterGuardian)
				sleep(15)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: I am the bone of my sword."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Steel is my body, and fire is my blood."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: I have created over a thousand blades."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Unknown to death, nor known to life."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Have withstood pain to create many weapons."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: ... Yet, those hands will never hold anything."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: And so, as I pray..."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Unlimited Blade Works."
				sleep(5)
				var/icon/W=icon('Effects.dmi',"Shock")
				src.Shockwave(W, 3)
				Quake(10)
				sleep(10)
				src.PrevX=src.x
				src.PrevY=src.y
				src.PrevZ=src.z
				src.loc=locate(150,150,12)
				src.TotalInjury=0
				src.TotalFatigue=0
				src.Health=100
				src.Energy=src.EnergyMax
				src.Frozen=0
	/*			for(var/turf/T in Turf_Circle(src,52))
					for(var/mob/M in view(0,T))
						src.PrevX=src.x
						src.PrevY=src.y
						src.PrevZ=src.z
						M.PrevX=M.x
						M.PrevY=M.y
						M.PrevZ=M.z
						if(M!=src&&M!=src.Target)
							M.loc=locate(rand(101,199),rand(101,199),12)
						if(src.Target==M)
							src.Target.loc=locate(150,142,12)
						src.loc=locate(150,150,12)
						src.TotalInjury=0
						src.TotalFatigue=0
						src.Health=100
						src.Energy=src.EnergyMax
						M.TotalInjury=0
						M.TotalFatigue=0
						M.Health=100
						M.Energy=src.EnergyMax */
				for(var/mob/M in world)
					if(M.UBWTarget==1)
						M.PrevX=M.x
						M.PrevY=M.y
						M.PrevZ=M.z
						M.loc=locate(rand(101,199),rand(101,199),12)
						if(src.Target==M)
							src.Target.loc=locate(150,142,12)
						M.TotalInjury=0
						M.TotalFatigue=0
						M.Health=100
						M.Energy=src.EnergyMax
				if(locate(/obj/Skills/Buffs/GatesOfBabylon,src.Target))
					src.GilgameshEnd()
				else
					src.ArcherEnd()

/*			if(src.Darlose)
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: I am the bone of my shield."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Justice is my body, and social is my blood."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: I have enabled over a thousand shitlords."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Unknown to reason, nor known to common sense."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Yet, these hands will never make fun events."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: I have no regrets. This is the only path..."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: My adminship was Unlimited Bt76 Works."

				sleep(20)
				src.OMessage(10, "You find yourself on within endless sea filled only with the angst of billions.")
				src.OMessage(10, "Taint desecrates the air, for nothing here is cool.  It is a world of suffering, only good to be a mass grave.")

*/

			if(src.MadeOfSwords)
				sleep(15)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: I am the bone of my sword."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Steel is my body, and fire is my blood."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: I have created over a thousand blades."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Unaware of loss, nor aware of gain."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Have withstood pain to create many weapons."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Waiting for one's arrival, I have no regrets."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: This is the only path, my whole life was..."
				sleep(25)
				for(var/mob/E in hearers(52,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Unlimited Blade Works."
				sleep(5)
				var/icon/W=icon('Effects.dmi',"Shock")
				src.Shockwave(W, 3)
				Quake(10)
				sleep(10)
				src.PrevX=src.x
				src.PrevY=src.y
				src.PrevZ=src.z
				src.loc=locate(150,150,12)
				src.TotalInjury=0
				src.TotalFatigue=0
				src.Health=100
				src.Energy=src.EnergyMax
				src.Frozen=0
	/*			for(var/turf/T in Turf_Circle(src,52))
					for(var/mob/M in view(0,T))
						src.PrevX=src.x
						src.PrevY=src.y
						src.PrevZ=src.z
						M.PrevX=M.x
						M.PrevY=M.y
						M.PrevZ=M.z
						if(M!=src&&M!=src.Target)
							M.loc=locate(rand(101,199),rand(101,199),12)
						if(src.Target==M)
							src.Target.loc=locate(150,142,12)
						src.loc=locate(150,150,12)
						src.TotalInjury=0
						src.TotalFatigue=0
						src.Health=100
						src.Energy=src.EnergyMax
						M.TotalInjury=0
						M.TotalFatigue=0
						M.Health=100
						M.Energy=src.EnergyMax */
				for(var/mob/M in world)
					if(M.UBWTarget==1)
						M.PrevX=M.x
						M.PrevY=M.y
						M.PrevZ=M.z
						M.loc=locate(rand(101,199),rand(101,199),12)
						if(src.Target==M)
							src.Target.loc=locate(150,142,12)
						M.TotalInjury=0
						M.TotalFatigue=0
						M.Health=100
						M.Energy=src.EnergyMax
				if(locate(/obj/Skills/Buffs/GatesOfBabylon,src.Target))
					src.GilgameshEnd()
				else
					src.EmiyaEnd()
		}

		GilgameshEnd()
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: I don't create swords."
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: I create a world that contains infinite swords."
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: This is the only skill allowed for [src]."
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: These are all imitations, all trifling swords."
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: But there is no rule that an imitation cannot defeat the original."
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: If you are the original, I shall surpass every one of your weapons and destroy your existence."
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: Here I come, [Target]."
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: Do you have enough weapons in stock?"
			src.InUBW2=1

		ArcherEnd()
			if(src.CounterGuardian)
				sleep(25)
				src.OMessage(52, "His body is made out of swords.")
				sleep(25)
				src.OMessage(52, "His blood is of iron and his heart of glass.")
				sleep(25)
				src.OMessage(52, "He survived through countless battles.")
				sleep(25)
				src.OMessage(52, "Not even once retreating, not even once being understood.")
				sleep(25)
				src.OMessage(52, "He was always alone, intoxicated with victory on a hill of swords.")
				sleep(25)
				src.OMessage(52, "Thus, his life has no meaning.")
				sleep(25)
				src.OMessage(52, "That body was surely made of swords.")
				sleep(25)
				src.OMessage(52, "<i>You find yourself in a factory for creating steel, filled only with fire and turning cogwheels.</i>")
				sleep(25)
				src.OMessage(52, "<i>A field of ownerless swords covers the horizon, for [src] exists only to create weapons.</i>")
				src.InUBW2=1

		EmiyaEnd()
			if(src.MadeOfSwords)
				sleep(25)
				src.OMessage(52, "His body is made out of swords.")
				sleep(25)
				src.OMessage(52, "His blood is of iron and his heart of glass.")
				sleep(25)
				src.OMessage(52, "He survived through countless battles.")
				sleep(25)
				src.OMessage(52, "Not even once retreating, not even once being victorious.")
				sleep(25)
				src.OMessage(52, "The bearer lies here alone, forging iron in a hill of swords.")
				sleep(25)
				src.OMessage(52, "Thus, his life needs no meaning.")
				sleep(25)
				src.OMessage(52, "That body is surely made of swords.")
				sleep(25)
				src.OMessage(52, "<i>You find yourself on an endless plain filled only with the finest of swords.</i>")
				sleep(25)
				src.OMessage(52, "<i>A bright and unstained sky opens up above you, for [src]'s potential is unlimited!</i>")
				src.InUBW2=1

		RiderEnd()
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: BEHOLD, MY PEERLESS ARMY!"
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: Their bodies may return to ash, but their spirits still hear my call!"
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: These men are my legendary heroes, my loyal followers!"
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: They’re my true friends - breaking the rules of space and time to fight once more at my side!"
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: They are my treasure within treasures; they’re my right to rule! "
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: They make up [src]'s mightiest Noble Phantasm"
			sleep(25)
			for(var/mob/E in hearers(52,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] says: <b>Ionioi Hetairoi!!</b>"
			src.InIH2=1

	/*	TrueUBW(obj/Skills/Attacks/B)
			while(B.Using)
	/*			var/obj/Projectiles/Mystical/A=new(locate(min(max(Target.x+rand(-30,30),1),500),min(max(Target.y+rand(-30,30),1),500),Target.z))
				A.Distance=Distance
				A.Explosive=1
		//		A.Knockback=1
				A.dir=rand(1,8)
				A.icon=B.sicon
				A.icon_state=pick("1","2","3","4","5","6","7","8")
				A.Owner=src
				A.Physical=1
				A.Lethality=src.Lethal
				A.Damage_Multiplier=1.5
				A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*45
		//		A.Elemental=Element
				if(A in view(100,src))
					spawn del(A)
					continue
				spawn(5) if(A) spawn(5)
				if(prob(50))sleep(10)
				else if(prob(20))sleep(1)*/
				if(src.Health<=5||src.Energy<=src.EnergyMax*0.05)
					for(var/turf/T in Turf_Circle(src,150))
						for(var/mob/M in view(0,T))
							src.OMessage(150, "[src]'s reality marble crumbles before your very eyes, returning you to your previous location...", "[src]([src.key]) deactivated Unlimited Blade Works.");
							sleep(30)
							M.loc = locate(M.PrevX, M.PrevY, M.PrevZ)
							src.loc = locate(src.PrevX, src.PrevY, src.PrevZ)
							src.PrevX=null
							src.PrevY=null
							src.PrevZ=null
							M.PrevX=null
							M.PrevY=null
							M.PrevZ=null
							src.InUBW=0
					B.Using=0
				sleep(30)*/
