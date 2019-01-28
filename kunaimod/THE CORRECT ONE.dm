mob/proc/ShadowCheck()
	if(src.KageShibari==0)
		for(var/obj/ShadowJutsu/S in world)
			del S

obj
	ShadowJutsu
		Grabbable=0


		name="Shadow"
		icon='KunaiMod/Icons/shibari.dmi'
		icon_state="Body"

		var
			Master
			Target
			list/Shadows=new/list()
			Intent="Bind"
			Max_Steps=10
			Return=0
			Holding
			Initial_Loc

		proc
			SanityCheck2()
				if(Owner:loc==Initial_Loc&&!Owner:KageShibari)
					return 1
			Chase_Target()
				while(Owner:KageShibari)
					spawn(1)
						if(SanityCheck2())
						else
							del src

						if(Target&&Target in get_step(src,src.dir))
							if(Intent=="Bind")
								Max_Steps=1
								walk(src,get_dir(Owner, Target))
								ExtendoGrab()
								Hold()
								if(Target in get_step(Owner,Owner.dir))
									Owner:Grab()
									del src
							else if(Intent=="Harm")
								//world<<"You got hit with [get_dist(Owner,src)] POWER!"
								Max_Steps=0
								walk(src,get_dir(Owner, Target))
								Intent="Retract"
								if(Target in get_step(Owner,Owner.dir))
									spawn(1)
										del src
								Owner:Melee(MeleeTarget=Target,ExtendoAttack=1)

						else
							if(Target)
							else
								walk(src,src.dir,1)
								var/Tag
								for(var/mob/m in get_step(src,src.dir))
									if(m==Master)
									else
										if(Tag)
										else
											Tag=m
								if(Tag)
									Target=Tag

						Max_Steps--
						if(Max_Steps>0)
							Chase_Target()
						else
							GoToMaster()
			ExtendoGrab()
				//Priority="Retract"
				Holding=Target
			Hold()
				Holding:loc=loc

			GoToMaster()
				spawn(1)
					walk(src,0)
					density=0
					Return=1
					density=0
					Hold()
					sleep(2)
					Gogogo2
					spawn(1)
						if(SanityCheck2())
						else
							del src
						flick("Blast",Owner)
						walk_to(src,Owner,0,1)
						if(src in get_step(Master,Master:dir))
							spawn(1)
								del src
							if(Holding)
								Master:Grab()


						else
							goto Gogogo2//GoToMaster()
		Head
			layer=MOB_LAYER-0.1
			density=0
			Del()
				Owner:Beaming=0
				for(var/obj/A in Shadows)
					del A
				..()
			Move()
				var
					NewlyCreated
					Startingloc=loc
				if(Return==0)
					var/obj/ShadowJutsu/A = new
					A.loc=loc
					A.dir=dir
					if(A.loc==Master:loc)
						del A
					else
						Shadows:Add(A)
						NewlyCreated=A
				else
					var/Delete
					for(var/X in Shadows)
						Delete=X
					if(loc==Delete:loc)
						Shadows:Remove(Delete)
						del Delete

				..()
				if(Return==0)
					if(loc==Startingloc)
						Shadows:Remove(NewlyCreated)
						del NewlyCreated
						Max_Steps=0
						walk(src,0)
				dir=Owner:dir
				Hold()