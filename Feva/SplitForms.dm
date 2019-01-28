mob/Player
	FevaSplits
		var
			OneHitWonder=0
			Creator
			PowerCheck=0.75
			HostileNPC
	//	Boss=1
		Del()
			animate(src,alpha=0,time=5)
			Creator:Splits:Remove(src)
			spawn(5)
				..()
		proc
			Ai_Start()
				spawn()
					while(src)
						Power=Creator:Power*PowerCheck
						if(KO||StunCheck(src))
							walk(src,0)
						else
							if(!Target)
								Target_Search()
							if(Target)
								Chase_Target()
								Attack_Target()
								Rinse_Repeat()
							if(src.Target in ohearers(src))
								src.dir=get_dir(src,src.Target)
						sleep(1)


			Target_Search()
				if(Target)
					return
				if(!Target)
					for(var/mob/Players/P in ohearers())
						if(P.Target==Creator)
							Target=P
			Chase_Target()
				if(get_dist(src, src.Target) >= 12)
					Target=null
				if(Knockbacked)
					if(prob(45))
						for(var/obj/Skills/MartialArts/AerialRecovery2/P in contents)
							if(!P.Using)
								src.Skill1X("AerialRecovery",P)
					else
						return
				if(Target&&!Attacking)
					if(Target:KO)
						Target=null
					walk_to(src,Target,1,1)
			Attack_Target()
				var
//					Sword
					Attacked=0
/*				if(Target in ohearers(1, src))
					for(var/obj/Items/Sword/S in contents)
						if(S.suffix)
							Sword=1
					if(Sword)
						for(var/obj/Skills/Swords/Sweeping_Blade/MA in contents)
							if(MA.Using==1)
							else if(prob(55))
								Attacked=1
								src.SkillX("SweepingBlade",MA)
					else
						for(var/obj/Skills/MartialArts/Sweeping_Kick/MA in contents)
							if(MA.Using==1)
							else if(prob(55))
								Attacked=1
								src.SkillX("SweepingKick",MA)*/

				if(!Attacked)
					if(Target in get_step(src,src.dir))
				/*		var/HShot=1
						for(var/obj/Skills/MartialArts/HeavyShot/MA in contents)
							if(MA.Using||prob(95))
								HShot=0
							else
								HShot=1
								MA.Cooldown()

						if(HShot)
							src.AttackHardness=2
							src.HeavyShot=1
							src.Melee(1,1,0,0)
							spawn(50) src.HeavyShot=0
						else*/
						Melee()
						if(OneHitWonder)
							del src


			Rinse_Repeat()
				if(Knockbacked)return
				if(Health<=5)
					del src
				if(Target&&Attacking)
					if(prob(45))
						step_away(src,Target)
					else if(prob(25))
						step_rand(src,Target)
					else
						step_towards(src,Target)
mob/Player
	FevaSplitsGhost
		Boss=1
		Del()
			animate(src,alpha=0,time=5)
			Creator:Splits:Remove(src)
			spawn(5)
				..()
		var
			OneHitWonder=0
			Creator
			PowerCheck=0.75
		proc
			Ai_Start()
			//	set background =1
				spawn()
					while(src)
						Power=Creator:Power*PowerCheck
						if(KO||StunCheck(src))
							walk(src,0)
						else
							Target_Search()
							Chase_Target()
							Attack_Target()
							Rinse_Repeat()
						sleep(1)

			Target_Search()
				if(!Target)
					for(var/mob/M in oview())
						if(M.Target==Creator)
							Target=M
				else
					return
			Chase_Target()
			//	set background =1
				if(Knockbacked)
					if(prob(45))
						for(var/obj/Skills/MartialArts/AerialRecovery2/P in contents)
							if(!P.Using)
								src.Skill1X("AerialRecovery",P)
					else
						return
				if(Target&&!Attacking)
					if(Target:KO)
						Target=null
					for(var/obj/Skills/Rank/WildSense/P in contents)
						if(!P.Using)
							src.BuffX("Wild Sense",P)
					for(var/obj/Skills/Rank/AfterImageStrike/P in contents)
						if(!P.Using)
							src.BuffX("After Image Strike",P)
					walk_to(src,Target)
				else
					return
			Attack_Target()
				var
		//			Sword
					Attacked=0
				if(Target in oview(1,src))
					if(prob(50))
						var/turf/A = Target.loc
						A.CreateExplosion()
					for(var/mob/M in view(0,Target))
						if(M!=src.Owner)
							M.Health-=(((src.Force*usr.ForceMultiplier)*src.Power)/((M.Resistance*M.ResistanceMultiplier)*M.Power))*2.5

				if(!Attacked)
					if(Target in get_step(src,src.dir))
						var/HShot=1
						for(var/obj/Skills/MartialArts/HeavyShot/MA in contents)
							if(MA.Using||prob(65))
								HShot=0
							else
								HShot=1
								MA.Cooldown()

						if(HShot)
							src.AttackHardness=2
							src.HeavyShot=1
					//		src.Melee(1,1,0,0)
							spawn(50) src.HeavyShot=0
					//	else
					//		Melee()
						if(OneHitWonder)
							del src


			Rinse_Repeat()
				if(Knockbacked)return
				if(Target&&Attacking)
					if(prob(45))
						step_away(src,Target)
					else if(prob(25))
						step_rand(src,Target)
					else
						step_towards(src,Target)
atom
	var
		list/Splits=list()
proc
	CopySword(mob/A,mob/B)
		for(var/obj/Items/Sword/D in B.contents)
			if(D.suffix)
				var/obj/Items/Sword/S = new
				A.contents+=S
				S.suffix=D.suffix
				S.Damage_Multiplier=D.Damage_Multiplier
				S.Accuracy_Multiplier=D.Accuracy_Multiplier
				S.Delay_Multiplier=D.Delay_Multiplier
obj/Skills/Feva
	Splitform
		Cooldown=120

		verb/SplitForm()
			set category="Skills"
			if(usr.KO||Blocking)return
			if(src.Using)
				return
			var/Splits=2
			Cooldown()
			usr.Power_Multiplier-=0.25
			usr.Energy*=0.9
			spawn(200)
				usr.Power_Multiplier+=0.25
			while(Splits>0)
				Splits--
				var/mob/Player/FevaSplits/FS = new
				FS.Creator=usr
				FS.loc=usr.loc
				FS.dir=usr.dir
				step_away(FS,usr)
				FS.name=usr.name
				FS.icon=usr.icon
				FS.overlays=usr.overlays
				FS.Attacking=0

				FS.EnergyMax=usr.EnergyMax
				FS.Energy=usr.EnergyMax

				FS.Strength=usr.Strength/2
				FS.StrengthMultiplier=1//usr.StrengthMultiplier

				FS.Endurance=usr.Endurance/2
				FS.EnduranceMultiplier=1//usr.EnduranceMultiplier

				FS.SpeedMod=usr.SpeedMod
				FS.SpeedMultiplier=1//usr.SpeedMultiplier

				FS.kiblade=usr.kiblade
				FS.SpiritSword=usr.SpiritSword

				FS.Force=usr.Force/2
				FS.ForceMultiplier=1//usr.ForceMultiplier

				FS.Resistance=usr.Resistance/2
				FS.ResistanceMultiplier=1//usr.ResistanceMultiplier

				FS.Offense=usr.Offense/2
				FS.OffenseMultiplier=1//usr.OffenseMultiplier

				FS.Defense=usr.Defense/2
				FS.DefenseMultiplier=1//usr.DefenseMultiplier

				FS.Power=usr.Power

				FS.Target=usr.Target
				CopySword(FS,usr)
				usr.Splits:Add(FS)
				for(var/obj/Skills/S in usr.contents)
					var/X = new S.type
					//usr<<"[FS] Split was given [X]."
					FS.contents+=X
				spawn(1)
					FS.Ai_Start()
				spawn(400)
					del FS

obj/Skills/Feva
	MassSplitform
		Cooldown=240

		verb/MassSplitForm()
			set category="Skills"
			if(usr.KO||Blocking)return
			if(src.Using)
				return
			var/Splits=10
			Cooldown()
			usr.Power_Multiplier-=0.45
			usr.Energy*=0.9
			spawn(200)
				usr.Power_Multiplier+=0.45
			while(Splits>0)
				sleep(1)
				Splits--
				var/mob/Player/FevaSplits/FS = new
				FS.PowerCheck=0.1
				//FS.OneHitWonder=1
				FS.Creator=usr

				FS.loc=usr.loc
				FS.dir=usr.dir
				step_away(FS,usr)
				FS.name=usr.name
				FS.icon=usr.icon
				FS.overlays=usr.overlays
				FS.Attacking=0

				FS.EnergyMax=usr.EnergyMax
				FS.Energy=usr.EnergyMax

				FS.Strength=usr.Strength
				FS.StrengthMultiplier=1//usr.StrengthMultiplier

				FS.Endurance=usr.Endurance*0.01
				FS.EnduranceMultiplier=1//usr.EnduranceMultiplier

				FS.SpeedMod=usr.SpeedMod
				FS.SpeedMultiplier=1//usr.SpeedMultiplier

				FS.kiblade=usr.kiblade
				FS.SpiritSword=usr.SpiritSword

				FS.Force=usr.Force
				FS.ForceMultiplier=1//usr.ForceMultiplier

				FS.Resistance=usr.Resistance
				FS.ResistanceMultiplier=1//usr.ResistanceMultiplier

				FS.Offense=usr.Offense*0.5
				FS.OffenseMultiplier=1//usr.OffenseMultiplier

				FS.Defense=usr.Defense*0.01
				FS.DefenseMultiplier=1//usr.DefenseMultiplier

				FS.Power=usr.Power

				FS.Target=usr.Target
				CopySword(FS,usr)
				usr.Splits:Add(FS)
				for(var/obj/Skills/S in usr.contents)
					var/X = new S.type
					//usr<<"[FS] Split was given [X]."
					FS.contents+=X
				spawn(1)
					FS.Ai_Start()
				spawn(200)
					del FS

obj/Skills/Extra
	TajuuKageBunshin
		Cooldown=15

		verb/TajuuKageBunshin()
			set src in usr
			set category="Skills"
			set name="Multi Shadow Clone Jutsu"
			if(usr.KO||Blocking)return
			if(src.Using)
				return
			var/Splits=6
			view(usr)<<sound('KunaiMod/Sounds/kagebunshin.ogg')
			for(var/mob/E in hearers(12,src))
				for(var/obj/Communication/C in src)
					E<<"<font color=[C.Text_Color]>[src] yells: <b>Shadow Clone Jutsu!</b>"
			sleep(25)
			Cooldown()
			usr.Power_Multiplier-=0.45
			usr.Energy*=0.9
			spawn(200)
				usr.Power_Multiplier+=0.45
			while(Splits>0)
				sleep(1)
				Splits--
				var/mob/Player/FevaSplits/FS = new
				FS.PowerCheck=0.1
				//FS.OneHitWonder=1
				FS.Creator=usr

				FS.loc=usr.loc
				FS.dir=usr.dir
				step_away(FS,usr)
				FS.name=usr.name
				FS.icon=usr.icon
				FS.Health=25
				FS.overlays=usr.overlays
				FS.Attacking=0

				FS.EnergyMax=usr.EnergyMax
				FS.Energy=usr.EnergyMax

				FS.Strength=usr.Strength
				FS.StrengthMultiplier=1//usr.StrengthMultiplier

				FS.Endurance=usr.Endurance*0.01
				FS.EnduranceMultiplier=1//usr.EnduranceMultiplier

				FS.SpeedMod=1.5
				FS.SpeedMultiplier=1//usr.SpeedMultiplier

				FS.kiblade=usr.kiblade
				FS.SpiritSword=usr.SpiritSword

				FS.Force=usr.Force
				FS.ForceMultiplier=1//usr.ForceMultiplier

				FS.Resistance=usr.Resistance
				FS.ResistanceMultiplier=1//usr.ResistanceMultiplier

				FS.Offense=usr.Offense*1
				FS.OffenseMultiplier=1//usr.OffenseMultiplier

				FS.Defense=usr.Defense*0.01
				FS.DefenseMultiplier=1//usr.DefenseMultiplier

				FS.Power=usr.Power

				FS.Target=usr.Target
				CopySword(FS,usr)
				usr.Splits:Add(FS)
				spawn(1)
					FS.Ai_Start()
				spawn(60)
				if(FS.Health<24)
					var/obj/Effects/Dust/SE=new
					SE.loc=FS.loc
					var/obj/Effects/Dust/SE2=new
					SE2.loc=FS.loc
					var/obj/Effects/Dust/SE3=new
					SE3.loc=FS.loc
					del FS
				spawn(200)
					var/obj/Effects/Dust/SE=new
					SE.loc=FS.loc
					var/obj/Effects/Dust/SE2=new
					SE2.loc=FS.loc
					var/obj/Effects/Dust/SE3=new
					SE3.loc=FS.loc
					del FS

obj/Skills/Feva
	SuperMassSplitform
		Cooldown=240

		verb/SuperMassSplitForm()
			set category="Skills"
			if(usr.KO||Blocking)return
			if(src.Using)
				return
			var/Splits=30
			Cooldown()
			usr.Power_Multiplier-=0.45
			usr.Energy*=0.7
			spawn(200)
				usr.Power_Multiplier+=0.45
			while(Splits>0)
				sleep(1)
				Splits--
				var/mob/Player/FevaSplits/FS = new
				FS.PowerCheck=0.1
				//FS.OneHitWonder=1
				FS.Creator=usr

				FS.loc=usr.loc
				FS.dir=usr.dir
				step_away(FS,usr)
				FS.name=usr.name
				FS.icon=usr.icon
				FS.overlays=usr.overlays
				FS.Attacking=0

				FS.EnergyMax=usr.EnergyMax
				FS.Energy=usr.EnergyMax

				FS.Strength=usr.Strength
				FS.StrengthMultiplier=1//usr.StrengthMultiplier

				FS.Endurance=usr.Endurance*0.01
				FS.EnduranceMultiplier=1//usr.EnduranceMultiplier

				FS.SpeedMod=usr.SpeedMod
				FS.SpeedMultiplier=1//usr.SpeedMultiplier

				FS.kiblade=usr.kiblade
				FS.SpiritSword=usr.SpiritSword

				FS.Force=usr.Force
				FS.ForceMultiplier=1//usr.ForceMultiplier

				FS.Resistance=usr.Resistance
				FS.ResistanceMultiplier=1//usr.ResistanceMultiplier

				FS.Offense=usr.Offense*0.5
				FS.OffenseMultiplier=1//usr.OffenseMultiplier

				FS.Defense=usr.Defense*0.01
				FS.DefenseMultiplier=1//usr.DefenseMultiplier

				FS.Power=usr.Power

				FS.Target=usr.Target
				CopySword(FS,usr)
				usr.Splits:Add(FS)
				for(var/obj/Skills/S in usr.contents)
					var/X = new S.type
					//usr<<"[FS] Split was given [X]."
					FS.contents+=X
				spawn(1)
					FS.Ai_Start()
				spawn(300)
					del FS

obj/Skills/Feva
	ShinraSummon
		Cooldown=240

		verb/ShinraSummon()
			set category="Skills"
			if(usr.KO||Blocking)return
			if(src.Using)
				return
			var/Splits=rand(3,5)
			Cooldown()
			while(Splits>0)
				sleep(1)
				Splits--
				var/mob/Player/FevaSplits/FS = new
			//	FS.PowerCheck=0.1
				//FS.OneHitWonder=1
				FS.Creator=usr

				FS.loc=usr.loc
				FS.dir=usr.dir
				step_away(FS,usr)
				FS.name="Shinra Soldier"
				FS.icon='NPC_ShinraSoldier.dmi'
				FS.Attacking=0

				FS.EnergyMax=usr.EnergyMax
				FS.Energy=usr.EnergyMax

				FS.Strength=WorldStatAmount
				FS.StrengthMultiplier=1//usr.StrengthMultiplier

				FS.Endurance=WorldStatAmount*0.5
				FS.EnduranceMultiplier=1//usr.EnduranceMultiplier

				FS.SpeedMod=3
				FS.SpeedMultiplier=1//usr.SpeedMultiplier


				FS.Force=WorldStatAmount
				FS.ForceMultiplier=1//usr.ForceMultiplier

				FS.Resistance=WorldStatAmount
				FS.ResistanceMultiplier=1//usr.ResistanceMultiplier

				FS.Offense=WorldStatAmount
				FS.OffenseMultiplier=1//usr.OffenseMultiplier

				FS.Defense=usr.Defense*0.01
				FS.DefenseMultiplier=1//usr.DefenseMultiplier

				FS.Power=MaximumBase*10

				FS.Target=usr.Target
				usr.Splits:Add(FS)
	/*			for(var/obj/Skills/S in usr.contents)
					var/X = new S.type
					//usr<<"[FS] Split was given [X]."
					FS.contents+=X*/
				spawn(1)
					FS.Ai_Start()
obj/Skills/Feva
	MassShinraSummon
		Cooldown=10

		verb/MassShinraSummon()
			set category="Skills"
			if(usr.KO||Blocking)return
			if(src.Using)
				return
			var/Splits=20
			Cooldown()
			while(Splits>0)
				sleep(1)
				Splits--
				var/mob/Player/FevaSplits/FS = new
			//	FS.PowerCheck=0.1
				//FS.OneHitWonder=1
				FS.Creator=usr

				FS.loc=usr.loc
				FS.dir=usr.dir
				step_away(FS,usr)
				FS.name="Shinra Soldier"
				FS.icon='NPC_ShinraSoldier.dmi'
				FS.Attacking=0

				FS.EnergyMax=usr.EnergyMax
				FS.Energy=usr.EnergyMax

				FS.Strength=WorldStatAmount
				FS.StrengthMultiplier=1//usr.StrengthMultiplier

				FS.Endurance=WorldStatAmount*0.5
				FS.EnduranceMultiplier=1//usr.EnduranceMultiplier

				FS.SpeedMod=3
				FS.SpeedMultiplier=1//usr.SpeedMultiplier


				FS.Force=WorldStatAmount
				FS.ForceMultiplier=1//usr.ForceMultiplier

				FS.Resistance=WorldStatAmount
				FS.ResistanceMultiplier=1//usr.ResistanceMultiplier

				FS.Offense=WorldStatAmount
				FS.OffenseMultiplier=1//usr.OffenseMultiplier

				FS.Defense=usr.Defense*0.01
				FS.DefenseMultiplier=1//usr.DefenseMultiplier

				FS.Power=MaximumBase*10

				FS.Target=usr.Target
				usr.Splits:Add(FS)
			/*	for(var/obj/Skills/S in usr.contents)
					var/X = new S.type
					//usr<<"[FS] Split was given [X]."
					FS.contents+=X*/
				spawn(1)
					FS.Ai_Start()
