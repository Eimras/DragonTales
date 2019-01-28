mob/proc/LearnTreeSkill(var/SkillType,var/SkillID)
	var/path = ""
	switch(SkillType)
		if("General") path=text2path("/obj/Skills/Attacks/[SkillID]")
		if("Buffs") path=text2path("/obj/Skills/Buffs/[SkillID]")
		if("Sword") path=text2path("/obj/Skills/Swords/[SkillID]")
		if("Magic") path=text2path("/obj/Skills/Magic/[SkillID]")
		if("Basic") path=text2path("/obj/Skills/[SkillID]")
		if("Beam") path=text2path("/obj/Skills/Attacks/Beams/[SkillID]")
		if("Rank") path=text2path("/obj/Skills/Rank/[SkillID]")
		//if("Stance") path=text2path("/obj/Skills/[SkillID]")
		var/obj/Skills/A = new path
		A.SkillCost = max(A.SkillCost, 1) //set the minimum cost to 1
		//if you have an object of type A in src (the user), then return since they have already learned this skill
		if(locate(A) in src.contents)
			src<< "You already know this skill!"
			return
		//return if they do not have enough points to buy this skill
		if(src.RewardPoints<A.SkillCost)
			src<<"You don't have enough Reward Points to purchase this skill!"
			return
		//spend the points and give the user the skill
		src.RewardPoints>=A.SkillCost
			src.contents+=A
			src.RewardPoints-=A.SkillCost

obj/SkillTree
	verb
		SkillTreeMenu()
			set src in usr
			set category="Skills"
			if(usr.UsingTree!=1)
				var/Choice=input("What skill type would you like to buy?") in list ("Basic","Unarmed","Magic","Sword", "Stance","Special","Nevermind")
				switch(Choice)
					if("Basic")
						var/Choice2=input("Select the skill you wish to purchase. The cost is in parenthesis.") in list ("Blast(5)","Beam(5)", "Zanzoken(5)", "Power Control(5)","Fly(5)","Charge(5)","Nevermind")
						switch(Choice2)
							if("Blast(5)")
								usr.LearnTreeSkill("General","Blast")
							if("Beam(5)")
								usr.LearnTreeSkill("Beam","Beam")
							if("Zanzoken(5)")
								usr.LearnTreeSkill("Rank","Zanzoken")
							if("Power Control(5)")
								usr.LearnTreeSkill("Basic","PowerControl")
							if("Fly(5)")
								usr.LearnTreeSkill("Basic","Fly")
							if("Charge(5)")
								usr.LearnTreeSkill("General","Charge")
					if("Unarmed")
						if(usr.Class in list("Wizard", "Healer", "Envy"))
							usr<<"You cannot learn Unarmed skills."
							return
						var/Choice2=input("Select the skill you wish to purchase. The cost is in parenthesis.") in list ("Axe Kick(50)","Heavy Shot(50)","Sweeping Kick(100)", "Burning Finger(100)", "GET DUNKED(300)","CAST FIST(300)","Clothesline(1000)","Nevermind")
						switch(Choice2)
							if("Axe Kick(50)")
								usr.LearnTreeSkill("Unarmed","AxeKick")
							if("Heavy Shot(50)")
								usr.LearnTreeSkill("Unarmed","HeavyShot")
							if("Sweeping Kick(100)")
								usr.LearnTreeSkill("Unarmed","Sweeping_Kick")
							if("Burning Finger(100)")
								usr.LearnTreeSkill("Unarmed","Burning_Finger")
							if("GET DUNKED(300)")
								usr.LearnTreeSkill("Unarmed","Get_Dunked")
							if("CAST FIST(300)")
								usr.LearnTreeSkill("Unarmed","CAST_FIST")
							if("Clothesline(1000)")
								usr.LearnTreeSkill("Unarmed","Clothesline")
					if("Magic") ///Fuck me we have a lot of magic.
						if(!usr.Class in list("Wizard", "Healer", "Envy", "Blue Mage", "Deus", "Ancient","Power","Wisdom","Courage"))
							usr<< "You cannot learn magical skills."
							return
					if("Sword")
					if("Stance")
						var/Choice2=input("Select the Stance you wish to purchase. The cost is in parenthesis.") in list ("Turtle(50)","Armadillo(50)", "Weapon Breaker(50)", "Bat(50)","Cheetah(50)","Wolf(50)","Nevermind")
						switch(Choice2)
							if("Turtle(50)")
								if(usr.TurtleStanceUnlocked)
									usr<<"You already have this stance!"
									return
								else if(usr.RewardPoints<50)
									usr<<"You don't have enough points to buy this!"
									return
								else
									usr.RewardPoints-=50
									usr.TurtleStanceUnlocked=1
							if("Armadillo(50)")
								if(usr.ArmadilloStanceUnlocked)
									usr<<"You already have this stance!"
									return
								else if(usr.RewardPoints<50)
									usr<<"You don't have enough points to buy this!"
									return
								else
									usr.RewardPoints-=50
									usr.ArmadilloStanceUnlocked=1
							if("Bat(50)")
								if(usr.BatStanceUnlocked)
									usr<<"You already have this stance!"
									return
								else if(usr.RewardPoints<50)
									usr<<"You don't have enough points to buy this!"
									return
								else
									usr.RewardPoints-=50
									usr.BatStanceUnlocked=1
							if("Wolf(50)")
								if(usr.WolfStanceUnlocked)
									usr<<"You already have this stance!"
									return
								else if(usr.RewardPoints<50)
									usr<<"You don't have enough points to buy this!"
									return
								else
									usr.RewardPoints-=50
									usr.WolfStanceUnlocked=1
							if("Cheetah(50)")
								if(usr.CheetahStanceUnlocked)
									usr<<"You already have this stance!"
									return
								else if(usr.RewardPoints<50)
									usr<<"You don't have enough points to buy this!"
									return
								else
									usr.RewardPoints-=50
									usr.CheetahStanceUnlocked=1
							if("Weapon Breaker(50)")
								if(usr.WeaponBreakerUnlocked)
									usr<<"You already have this stance!"
									return
								else if(usr.RewardPoints<50)
									usr<<"You don't have enough points to buy this!"
									return
								else
									usr.RewardPoints-=50
									usr.WeaponBreakerUnlocked=1

					if("Special")