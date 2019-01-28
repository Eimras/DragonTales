mob/proc/AI()
	set background =1
	spawn()src.Available_Power()
	while(src)
		var/mob/Players/P
		if(src.Health<=0&&!src.KO) Unconscious(null,"?!?!")
		if(!src.KO)
			if(istype(src,/mob/Animals/Predators)||Health<=80)
				for(P in oview(Sight_Range,src))
					break
			var/atom/O //Potential Obstacles
			for(O in get_step(src,dir))
				if(O.density&&!ismob(O))
					break
			if(!src.Knockbacked)
				if(P&&!O) step_towards(src,P)
				else step_rand(src)
		if(P) sleep(1)
		else sleep(rand(20,40))

mob/Animals
	icon='Animals.dmi'
	var/HostileNPC
	var/NPCBaseMod
	var/BossNPC
	var/SoldierNPC
	var/LethalNPC
	var/Dumb
	Boss=0
	New()
		if(src.HostileNPC)
			spawn if(src)Ai_Start()
			return
		spawn if(src) AI()
	proc
		Ai_Start()
			spawn()
				while(src)
					Power=NPCBaseMod*MaximumBase
					Strength=WorldStatAmount
					Endurance=WorldStatAmount
					SpeedMod=3
					Force=WorldStatAmount
					Resistance=WorldStatAmount
					Offense=WorldStatAmount
					if(BossNPC)
						Defense=WorldStatAmount
					if(z==15)
						SoldierNPC=0
						LethalNPC=1
					else if(!BossNPC)
						Defense=1
					if(KO||StunCheck(src))
						walk(src,0)
					else
						if(!Target)
							Target_Search()
						if(Target&&Dumb)
							Chase_Target()
							Rinse_Repeat()
						else if(Target)
							Chase_Target()
							Attack_Target()
							Rinse_Repeat()
					sleep(10)

		Target_Search()
			if(Target) return
			if(HostileNPC&&!SoldierNPC)
				for(var/mob/Players/P in ohearers())
					if(!Target)
						if(!P.NPCImmune)
							Target=P
			if(HostileNPC&&SoldierNPC)
				for(var/mob/Players/P in ohearers())
					if(!Target)
						if(SoldierNPC&&!P.SoldierMember)
							Target=P
		Chase_Target()

			if(Target&&!Attacking)
				if(Target:KO)
					if(LethalNPC)
						Target:Death(src,null)
						Target=null
					if(SoldierNPC&&!LethalNPC)
						Target:loc=locate(211,190,11)
						Target<<"You have been arrested and sent to prison!"
						return
					else
						Target=null
				for(var/obj/Skills/Rank/WildSense/P in contents)
					if(!P.Using)
						src.BuffX("Wild Sense",P)
				for(var/obj/Skills/Rank/AfterImageStrike/P in contents)
					if(!P.Using)
						src.BuffX("After Image Strike",P)
				walk_to(src,Target,1,1)
		Attack_Target()
			var
				Attacked=0


			if(!Attacked)
				if(Target in get_step(src,src.dir))
				/*	var/HShot=1
					if(!locate(/obj/Skills/MartialArts/HeavyShot in contents)&&BossNPC)
						src.contents+=new/obj/Skills/MartialArts/HeavyShot
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
						spawn(50) src.HeavyShot=0*/
					Melee()


		Rinse_Repeat()
			if(src.Health<=5)
				src.loc = null
				spawn(3000)
					src.loc = initial(src.loc)
					src.Health=100
			if(Knockbacked)return
			if(Target&&Attacking)
				if(prob(5))
					step_away(src,Target)
			/*	else if(prob(25))
					step_rand(src,Target)*/
				else
					step_towards(src,Target)

	ExtremelyHostileNPC
		HostileNPC=1
		AttackTiger
			NPCBaseMod=5
			icon='Tiger.dmi'
		WeakShinraSoldier
			NPCBaseMod=5
			SoldierNPC=1
			icon='NPC_ShinraSoldier.dmi'
		NormalShinraSoldier
			NPCBaseMod=15
			SoldierNPC=1
			icon='NPC_ShinraSoldier.dmi'
		StrongShinraSoldier
			NPCBaseMod=25
			SoldierNPC=1
			icon='NPC_ShinraSoldier.dmi'
		BossShinraSoldier
			NPCBaseMod=50
			SoldierNPC=1
			Boss=1
			icon='NPC_ShinraSoldier.dmi'
	Peaceful

		Bump(mob/A)
			if(Health<100||isturf(A)) Melee()
		Frog
			icon='Frog.dmi'
		Dino_Bird
			icon_state="DinoBird"
		Cat
			icon='Cat.dmi'
		Bat
			icon='Bat.dmi'
		Cow
			icon='Cow.dmi'
		Turtle
			icon='Turtle.dmi'
		Horse
			icon='Horse.dmi'
		Sheep
			icon='Sheep.dmi'
		Dog
			icon_state="Dog"
		Fly
			icon_state="Fly"
		HumanMale
			icon='MaleLight.dmi'

	Dumb
		Bump(mob/A)
			if(Health<100||isturf(A)) Melee()
		MemeBot
			icon='KunaiMod/Icons/memebot.dmi'
			Dumb=1
			Health=10000000000000000000
			Endurance=10000000000000000000
			Resistance=10000000000000000000

	Special
		icon='Special.dmi'
		Skill=1000
		Bump(mob/A)Melee()

		DragonKing
			icon='SpecialBig.dmi'
			icon_state="King"
			pixel_x=-110
			pixel_y=-35
		DragonQueen
			icon='SpecialBig.dmi'
			icon_state="Queen"
			pixel_x=-110
			pixel_y=-35
		DragonLord
			icon='SpecialBig.dmi'
			icon_state="Lord"
			pixel_x=-110
			pixel_y=-35

		Owl//nonhostile
			icon='SpecialBig.dmi'
			icon_state="Owl"
			pixel_x=-40
			pixel_y=-16
		TigerSeel//nonhostile
			icon='SpecialBig.dmi'
			icon_state="Tig"
			pixel_x=-40
			pixel_y=-30
		EleSeel//nonhostile?
			icon='SpecialBig.dmi'
			icon_state="Ele"
			pixel_x=-70
			pixel_y=-30
		SuperBat
			icon='SpecialBig.dmi'
			icon_state="Bat"
			pixel_x=-50
			pixel_y=-50
		LionWhite
			icon='SpecialBig.dmi'
			icon_state="WhiteL"
			pixel_x=-66
			pixel_y=-20
		LionYellow
			icon='SpecialBig.dmi'
			icon_state="YellowL"
			pixel_x=-66
			pixel_y=-20



	Predators
		Skill=100
		Bump(mob/A) Melee()


		Dino_Munky
			icon_state="OozaruDino"
		Robot
			icon_state="Bot1"
		Big_Robot
			icon_state="Bot2"
		Hover_Robot
			icon_state="Bot3"
		Gremlin
			icon_state="Gremlin"
		Evil_Entity
			icon_state="EvilMan"
		Bandit
			icon_state="Bandit"
		Tiger_Bandit
			icon='Tiger.dmi'
		Wolf
			icon='Wolf.dmi'
		John_The_Wolf
			icon='Wolf.dmi'
			Endurance=9999999999999999999999999999999999999999999999999999999999
		Giant_Robot
			icon_state="Robot"
		Ice_Dragon
			icon_state="IceDragon"
		Ice_Flame
			icon_state="IceFlame"
		Saibaman
			icon_state="Saibaman"
		Small_Saibaman
			icon_state="SaibamanSmall"
		Black_Saibaman
			icon_state="SaibamanBlack"
		Mutated_Saibaman
			icon_state="SaibamanGreen"
