proc
	GoCrand(var/x, var/y)
	{
		x *= 10;
		y *= 10;
		var/z = rand(x, y);
		z /= 10;
		return z;
	}

mob/proc/LOLWUT()
	if(src.Race=="Saiyan"&&src.Class=="Elite")
		src.ActiveBuffs=3
		src.SpecialSlot=1
	if(src.ForceSensitive)
		src.DeleteNonForceSkills()

	if(src.InUBW2)
		if(src.Health<=10||src.Energy<=src.EnergyMax*0.05)
	/*		for(var/turf/T in Turf_Circle(src,150))
				for(var/mob/M in view(0,T))
					src.OMessage(100, "[src]'s reality marble crumbles before your very eyes, returning you to your previous location...", "[src]([src.key]) deactivated Unlimited Blade Works.")*/
			for(var/mob/M in world)
				if(M.UBWTarget==1)
					M << "[src]'s reality marble crumbles before your very eyes...!?"
					sleep(10)
					M.loc = locate(M.PrevX, M.PrevY, M.PrevZ)
					M.PrevX=null
					M.PrevY=null
					M.PrevZ=null
					M.UBWTarget=0
			src << "Unlimited Blade Works cracks apart...!?"
			sleep(10)
			src.loc = locate(src.PrevX, src.PrevY, src.PrevZ)
			src.PrevX=null
			src.PrevY=null
			src.PrevZ=null
			src.InUBW=0
			src.InUBW2=0

	if(src.InIH2)
		if(src.Health<=10||src.Energy<=src.EnergyMax*0.05)
			src << "You feel your hold on your dreams loosen..."
			for(var/mob/M in world)
				if(M.IHTarget==1)
					M << "[src]'s reality marble crumbles before your very eyes...!?"
					sleep(10)
					M.loc = locate(M.PrevX, M.PrevY, M.PrevZ)
					M.PrevX=null
					M.PrevY=null
					M.PrevZ=null
					M.IHTarget=0
			src << "Ionioi Hetairoi cracks apart...!?"
			sleep(10)
			src.loc = locate(src.PrevX, src.PrevY, src.PrevZ)
			src.PrevX=null
			src.PrevY=null
			src.PrevZ=null
			if(locate(/obj/Skills/Buffs/DivineArmy,src))
				src.contents-=new/obj/Skills/Buffs/DivineArmy
				src << "Your friends of old depart..."
			for(var/mob/Servant/A in world)
				if(A.Owner==src.key)
					A.OMessage(15, "[A]'s body fades into the sand...")
					sleep(10)
					del(A)
			src.InIH=0
			src.InIH2=0

	if(src.Skillz["Swim"]["Level"]>5&&!src.Fishman)
		if(src.FruitEaten)
			src.Skillz["Swim"]["Level"]=0.5
			src.Skillz["Swim"]["Next"]=src.Skillz["Swim"]["Level"]*10000
			return
/*		else
			src.Skillz["Swim"]["Level"]=5
			src.Skillz["Swim"]["Next"]=src.Skillz["Swim"]["Level"]*100
			return*/

	var/asc = src.AscAvailable(src.Race)
	if(asc)
		spawn()src.Ascension(src.Race, asc)

//	spawn()src.TierSUp()

	if(locate(/obj/Skills/TierS/KamuiNu, src))
		if(src.SexyMod==2)
			if(src.GetBPM() >= 1)
				src.SexyMod=3
				src << "You've grown so accustomed to your Kamui that it practically feels like a second skin to you!"

	if(src.Base>=src.JaganEyeReq&&!src.JaganAsc&&src.JaganEye)
		src.RPPower*=3
		src.JaganAsc=1
		src<<"The power you have lost from the Jagan Eye has returned to you."
		if(!locate(/obj/Skills/Attacks/Beams/BlackDragon,src.contents))
			src.contents+=new/obj/Skills/Attacks/Beams/BlackDragon
		if(!locate(/obj/Skills/Buffs/DarknessFlame,src.contents))
			src.contents+=new/obj/Skills/Buffs/DarknessFlame

	if(src.Race=="Alien"&&src.RacialsSelected==0)
		if(!locate(/obj/Skills/AlienRacials,src.contents))
			src.contents+=new/obj/Skills/AlienRacials
			src<<"You've been granted a chance to pick a Alien Racial ability! Check your Other tab!"

	if(src.Race=="Lycan"||src.Race=="Vampire"||src.Class=="Dhampir")
		src.EnhancedSmell=1
		src.EnhancedHearing=1

	if(src.Race=="Vampire"||src.Race=="Dhampir"||src.Class=="Vampire")//Life Drain
//		if(src.EnergyMax>10000)
		if(!locate(/obj/Skills/Extra/Banquet,src.contents))
			src.contents+=new/obj/Skills/Extra/Banquet
			src<<"<i>You thirst for fresh blood...</i>"
/*			if(!locate(/obj/Skills/LifeDrain,src.contents))
				src.contents+=new/obj/Skills/LifeDrain
				src<<"<i>You learn how to better drain the life essence of living beings.</i>"
			if(locate(/obj/Skills/BloodDrain,src.contents))
				src.contents-=/obj/Skills/BloodDrain*/

/*
	if(src.Race=="Human"&&src.Class!="Dhampir")
		if((src.Base/src.BaseMod>=7500&&src.AscensionsUnlocked>=1&&src.AscensionsAcquired<1)||\
		   (src.Base/src.BaseMod>=10000&&src.AscensionsAcquired<1))
			src.AscensionsAcquired=1
			src.contents+=new/obj/Skills/Buffs/ThirdEye
			src<<"You unlocked the ability to use the legendary Third Eye technique!"
*/
	if(src.Race=="Kaio")
		if((src.Base/src.BaseMod>=28125&&src.AscensionsUnlocked>=1&&src.AscensionsAcquired<1)||\
		   (src.Base/src.BaseMod>=37500&&src.AscensionsAcquired<1))
			src.AscensionsAcquired=1
			src.BaseMod=10
			if(src.AngerMax<1.5)
				src.AngerMax=1.5
		if((src.Base/src.BaseMod>=150000&&src.AscensionsUnlocked>=2&&src.AscensionsAcquired<2)||\
		   (src.Base/src.BaseMod>=200000&&src.AscensionsAcquired<2))
			src.AscensionsAcquired=2
			src.BaseMod=20
			if(src.AngerMax<2)
				src.AngerMax=2
		if((src.Base/src.BaseMod>=1125000&&src.AscensionsUnlocked>=3&&src.AscensionsAcquired<3)||\
		   (src.Base/src.BaseMod>=1500000&&src.AscensionsAcquired<3))
			src.AscensionsAcquired=3
			src.BaseMod=40
			src.Divine=1

	if(locate(/obj/Skills/Buffs/Rinnegan, src.contents))
	{
		if(src.Base>=2500 * src.BaseMod && 0 == src.CountRinneganAscensions())
		{
			src.TriggerRinneganAscension()
		}
		if(src.Base>=10000 * src.BaseMod && 1 == src.CountRinneganAscensions())
		{
			src.TriggerRinneganAscension()
		}
		if(src.Base>=15000 * src.BaseMod && 2 == src.CountRinneganAscensions())
		{
			src.TriggerRinneganAscension()
		}
		if(src.Base>=50000 * src.BaseMod && 3 == src.CountRinneganAscensions())
		{
			src.TriggerRinneganAscension()
		}
		if(src.Base>=100000 * src.BaseMod && 4 == src.CountRinneganAscensions())
		{
			src.TriggerRinneganAscension()
		}
		if(src.Base>=200000 * src.BaseMod && 5 == src.CountRinneganAscensions())
		{
			src.TriggerRinneganAscension()
		}
	}

	if(src.Race=="Makyo")
		if(src.AscensionsUnlocked>=1&&src.AscensionsAcquired<1)
			src.AscensionsAcquired=1
			src.BaseMod=10
			src<<"You absorb the power of the Makyo Star into your body."
		if(src.AscensionsUnlocked>=2&&src.AscensionsAcquired<1)
			src.AscensionsAcquired=2
			src.BaseMod=20
			src<<"You absorb the power of the Makyo Star into your body."

	if(src.Base>=(BaseMod*1000000)&&OriginalBaseMod*5.5>BaseMod && allowFBM)
		if(Race=="Human")
			FBM=22
			BaseMod*=22
		else if(Race=="Spirit Doll")
			FBM=22
			BaseMod*=22
		else if(Race=="Android")
			FBM=10
			BaseMod*=10
		else if(Race=="Majin")
			FBM=10
			BaseMod*=10
		else if(Race=="Makyo")
			FBM=15
			BaseMod*=15
		else if(Race=="Saiyan"||Race=="Half Saiyan")
			FBM=7.5
			BaseMod*=7.5
		else if(Race=="Tsufurujin")
			FBM=22
			BaseMod*=22
		else if(Race=="Namekian")
			FBM=13
			BaseMod*=13
		else if(Race=="Changeling")
			FBM=7.5
			BaseMod*=7.5
		else if(Race=="Demi")
			FBM=5
			BaseMod*=5
		else if(Race=="Demon")
			FBM=10
			BaseMod*=10
		else if(Race=="Kaio")
			FBM=10
			BaseMod*=10
		else if(Race=="Alien")
			FBM=15
			BaseMod*=15
		else if(Race=="Heran")
			FBM=10
			BaseMod*=10
		else if(Race=="Makaioshin")
			FBM=10
			BaseMod*=10
		else
			FBM=5.5
			BaseMod*=5.5
		Regeneration*=1.2
		Recovery*=1.2
//	if(src.Race in list("Demi","Makyo","Human", "Saiyan","Alien", "Demon", "Popo", "Lycan","Vampire","Heran"))
/*	if(src.Class in list("Wizard", "Healer", "Envy", "Blue Mage", "Deus", "Ancient","Power","Wisdom","Courage","Kitsune"))
		if(src.ElementType=="Earth"||src.SecondElementType=="Earth"||src.AvatarUnique==1)
			if(src.EnergyMax>10000 && src.FinalEarth==0)
				if(!locate(/obj/Skills/Buffs/EarthenWall,src.contents))
					src.contents+=new/obj/Skills/Buffs/EarthenWall
					src<< "Your control over your energy has allowed you to advance your knowledge of Earth magic, granting you Earthen Wall!"
				if(src.EnergyMax>12000)
					if(!locate(/obj/Skills/Attacks/PoisonBolt,src.contents))
						src.contents+=new/obj/Skills/Attacks/PoisonBolt
						src<<"Your control over your energy has allowed you to advance your knowledge of Earth magic, granting you the ability to launch a basic bolt of poison!"
					if(src.EnergyMax>35000)
						if(!locate(/obj/Skills/Magic/Barrier,src.contents))
							src.contents+=new/obj/Skills/Magic/Barrier
							src<<"Your control over your energy has allowed you to advance your knowledge of Earth magic, granting you Barrier!"
				if(src.EnergyMax>15000&&src.Class=="Wizard")
					if(!locate(/obj/Skills/Magic/Stoneskin,src.contents))
						src.contents+=new/obj/Skills/Magic/Stoneskin
						src<<"Your natural abilities with magic along with your knowledge of Earth Magic has allowed you to learn Stoneskin!"
		if(src.ElementType=="Fire"||src.SecondElementType=="Fire"||src.AvatarUnique==1)
			if(src.EnergyMax>5000&&src.FinalFire==0)
				if(!locate(/obj/Skills/Attacks/Fireball,src.contents))
					src.contents+=new/obj/Skills/Attacks/Fireball
					src<<"Your control over your energy has allowed you to advance your knowledge of Fire magic, granting you the ability to launch a basic ball of fire!"
				if(src.EnergyMax>30000)
					if(!locate(/obj/Skills/Buffs/BlazingWrath,src.contents))
						src.contents+=new/obj/Skills/Buffs/BlazingWrath
						src<<"Your control over your energy has allowed you to advance your knowledge of Fire magic, granting you Blazing Wrath!"
				if(src.EnergyMax>45000)
					if(!locate(/obj/Skills/Flare,src.contents))
						src.contents+=new/obj/Skills/Flare
						src<<"Your control over your energy has allowed yo uto advance your knowledge of Fire magic, granting you Flare!"
					if(src.EnergyMax>70000)
						if(!locate(/obj/Skills/Nova,src.contents))
							src.contents+=new/obj/Skills/Nova
							src<<"Your control over your energy has allowed you to advance your knowledge of Fire magic, granting you the ability to fire lava out in every direction!"
						if(src.EnergyMax>100000)
							src.FinalFire=1
							if(!locate(/obj/Skills/Attacks/Meteor,src.contents))
								src.contents+=new/obj/Skills/Attacks/Meteor
								src<<"Your control over your energy has allowed you to advance your knowledge of Fire magic, granting you the ability to cause meteors to rain from the sky!"
		if(src.ElementType=="Wind"||src.SecondElementType=="Wind"||src.AvatarUnique==1)
			if(src.EnergyMax>10000&&src.FinalWind==0)
				if(!locate(/obj/Skills/Buffs/BoostingWinds,src.contents))
					src.contents+=new/obj/Skills/Buffs/BoostingWinds
					src<<"Your control over your energy has allowed you to advance your knowledge of Wind magic, granting you Boosting Winds!"
				if(src.EnergyMax>25000&&src.FinalWind==0)
					if(!locate(/obj/Skills/Attacks/Beams/TyphoonCannon,src.contents))
						src.contents+=new/obj/Skills/Attacks/Beams/TyphoonCannon
						src<<"Your control over your energy has allowed you to knock people the fuck back with a Tornado beam."
					if(src.EnergyMax>40000)
						if(!locate(/obj/Skills/Hurricane,src.contents))
							src.contents+=new/obj/Skills/Hurricane
							src<<"Your control over your energy has allowed you to advance your knowledge of Wind magic, granting you the ability to cause a wind storm!"
						if(src.EnergyMax>70000)
							src.FinalWind=1
							if(!locate(/obj/Skills/Attacks/SlicingWind,src.contents))
								src.contents+=new/obj/Skills/Attacks/SlicingWind
								src<<"Your control over your energy has allowed you to advance your knowledge of Wind magic, granting you Slicing Wind!"
		if(src.ElementType=="Water"||src.SecondElementType=="Water"||AvatarUnique==1)
			if(src.EnergyMax>10000&&src.FinalWater==0)
				if(!locate(/obj/Skills/Buffs/MistVeil,src.contents))
					src.contents+=new/obj/Skills/Buffs/MistVeil
					src<<"Your control over your energy has allowed you to advance your knowledge of Water magic, granting you Mist Veil!"
				if(src.EnergyMax>20000)
					if(!locate(/obj/Skills/Magic/AquaRing,src.contents))
						src.contents+=new/obj/Skills/Magic/AquaRing
						src<<"Your control over your energy has allowed you to advance your knowledge of Water magic, granting you Aqua Ring!"
					if(src.EnergyMax>50000)
						if(!locate(/obj/Skills/Magic/Blizzard,src.contents))
							src.contents+=new/obj/Skills/Magic/Blizzard
							src<<"Your control over your energy has allowed you to advance your knowledge of Water magic, granting you Blizzard!"
						if(src.EnergyMax>90000)
							src.FinalWater=1
							if(!locate(/obj/Skills/Attacks/WaterCoffin,src.contents))
								src.contents+=new/obj/Skills/Attacks/WaterCoffin
								src<<"Your control over your energy has allowed you to advance your knowledge of Water magic, granting you Water Coffin!"
	/*				if(src.EnergyMax>25000&&src.Class=="Wizard")
						if(!locate(/obj/Skills/Magic/DireWinter,src.contents))
							src.contents+=new/obj/Skills/Magic/DireWinter
							src<<"Your natural abilities with magic along with your knowledge of Water Magic has allowed you to learn Dire Winter!"*/
		if(src.AdvancedElement=="Lightning")
			if(src.EnergyMax>10000)//&&src.FinalWater==0)
				if(!locate(/obj/Skills/Buffs/LightningAura,src.contents))
					src.contents+=new/obj/Skills/Buffs/LightningAura
					src<<"Your control over your energy has allowed you to advance your knowledge of Lightning magic, granting you Lightning Aura!"
				if(src.EnergyMax>20000)
					if(!locate(/obj/Skills/Attacks/Beams/LightningBlast,src.contents))
						src.contents+=new/obj/Skills/Attacks/Beams/LightningBlast
						src<<"Your control over your energy has allowed you to advance your knowledge of Lightning magic, granting you Lightning Blast!"
					if(src.EnergyMax>50000)
						if(!locate(/obj/Skills/Magic/GrandThunderStorm,src.contents))
							src.contents+=new/obj/Skills/Magic/GrandThunderStorm
							src<<"Your control over your energy has allowed you to advance your knowledge of Lightning magic, granting you the ability to call forth a thunder storm!"
						if(src.EnergyMax>70000)
							if(!locate(/obj/Skills/Magic/LanzaDelRelampago,src.contents))
								src.contents+=new/obj/Skills/Magic/LanzaDelRelampago
								src<<"Your control over your energy has allowed you to advance your knowledge of Lightning magic, granting you the ability to call forth a thunder storm!"
		if(src.AdvancedElement=="Gravity")
			if(src.EnergyMax>10000 && src.IntelligenceLevel>=20)//&&src.FinalWater==0)
				if(!locate(/obj/Skills/Magic/Gravity,src.contents))
					src.contents+=new/obj/Skills/Magic/Gravity
					src<<"Your intelligence has allowed you to advance your knowledge of Gravity magic, granting you the basic Gravity spell!"
				if(src.EnergyMax>20000 && src.IntelligenceLevel>=30)
					if(!locate(/obj/Skills/Attacks/Beams/LightningBlast,src.contents))
						src.contents+=new/obj/Skills/Attacks/Beams/LightningBlast
						src<<"Your control over your energy has allowed you to advance your knowledge of Lightning magic, granting you Lightning Blast!"
					if(src.EnergyMax>50000 && src.IntelligenceLevel>=50)
						if(!locate(/obj/Skills/Magic/GrandThunderStorm,src.contents))
							src.contents+=new/obj/Skills/Magic/GrandThunderStorm
							src<<"Your control over your energy has allowed you to advance your knowledge of Lightning magic, granting you the ability to call forth a thunder storm!"
						if(src.EnergyMax>70000 && src.IntelligenceLevel>=60)
							if(!locate(/obj/Skills/Magic/TerraGraviton,src.contents))
								src.contents+=new/obj/Skills/Magic/TerraGraviton
								src<<"Your intelligence has allowed you to advance your knowledge of Gravity magic, granting you the ultimate Gravity Spell!"
*/
	if(src.Skillz["Swim"]["Level"]>5000)
		if(!locate(/obj/Dive,src.contents))
			src.contents+=new/obj/Dive
			src<<"You can dive underwater on select maps now!"
/*	if(src.Skillz["Dig"]["Level"]>15)
		if(!locate(/obj/DigDeeper,src.contents))
			src.contents+=new/obj/DigDeeper
			src<<"You can drill underground on select maps now!"*/
/*	if(src.Skillz["Unarmed"]["Level"]>34)
		if(!src.FireFistsUnlocked)
			if(src.ElementType=="Fire"||src.SecondElementType=="Fire")
				src.FireFistsUnlocked=1
				src<<"Your unarmed skills combined with your command over Fire have allowed you to use the Fire Fists Advanced Stance!"
				if(!locate(/obj/Skills/MartialArts/Activate_Advanced_Stance,src.contents))
					src.contents+=new/obj/Skills/MartialArts/Activate_Advanced_Stance
					src.contents+=new/obj/Skills/MartialArts/Set_Advanced_Stance
		if(!src.WaterFistsUnlocked)
			if(src.ElementType=="Water"||src.SecondElementType=="Water")
				src.WaterFistsUnlocked=1
				src<<"Your unarmed skills combined with your command over Water have allowed you to use the Water Fists Advanced Stance!"
				if(!locate(/obj/Skills/MartialArts/Activate_Advanced_Stance,src.contents))
					src.contents+=new/obj/Skills/MartialArts/Activate_Advanced_Stance
					src.contents+=new/obj/Skills/MartialArts/Set_Advanced_Stance
		if(!src.EarthFistsUnlocked)
			if(src.ElementType=="Earth"||src.SecondElementType=="Earth")
				src.EarthFistsUnlocked=1
				src<<"Your unarmed skills combined with your command over Earth have allowed you to use the Earth Fists Advanced Stance!"
				if(!locate(/obj/Skills/MartialArts/Activate_Advanced_Stance,src.contents))
					src.contents+=new/obj/Skills/MartialArts/Activate_Advanced_Stance
					src.contents+=new/obj/Skills/MartialArts/Set_Advanced_Stance
		if(!src.WindFistsUnlocked)
			if(src.ElementType=="Wind"||src.SecondElementType=="Wind")
				src.WindFistsUnlocked=1
				src<<"Your unarmed skills combined with your command over Wind have allowed you to use the Wind Fists Advanced Stance!"
				if(!locate(/obj/Skills/MartialArts/Activate_Advanced_Stance,src.contents))
					src.contents+=new/obj/Skills/MartialArts/Activate_Advanced_Stance
					src.contents+=new/obj/Skills/MartialArts/Set_Advanced_Stance
	if(src.Skillz["Unarmed"]["Level"]>54)
		if(src.IntelligenceLevel>=35&&!src.ChiBlockUnlocked)
			src.ChiBlockUnlocked=1
			src<<"Your unarmed skills and high intelligence have allowed you to use the Chi Block Advanced Stance!"
			if(!locate(/obj/Skills/MartialArts/Activate_Advanced_Stance,src.contents))
				src.contents+=new/obj/Skills/MartialArts/Activate_Advanced_Stance
				src.contents+=new/obj/Skills/MartialArts/Set_Advanced_Stance
	if(src.Skillz["Unarmed"]["Level"]>49)
		if(src.EnchantmentLevel>29&&!src.MoonSolarUnlocked)
			src.MoonSolarUnlocked=1
			src<<"Your unarmed skills and magical talents have allowed you to use the Moonlight and Solar Stances!"
			if(!locate(/obj/Skills/MartialArts/Activate_Advanced_Stance,src.contents))
				src.contents+=new/obj/Skills/MartialArts/Activate_Advanced_Stance
				src.contents+=new/obj/Skills/MartialArts/Set_Advanced_Stance
*/
	if(src.Skillz["Unarmed"]["Level"]>0)
		if(src.TrainingStanceUnlocked==0)
			src.contents+=new/obj/Skills/MartialArts/Set_Stance
			src.contents+=new/obj/Skills/MartialArts/Activate_Stance
			src.TrainingStanceUnlocked=1
/*
		if(src.Class!="Wizard"&&src.Class!="Healer"&&src.Class!="Envy"&&src.Class!="Kitsune"||src.Race=="Majin"||src.Race=="Vampire"||src.Race=="Bio Android"||src.Race=="Lycan")
			if(src.Skillz["Unarmed"]["Level"]>9 && src.EnergyMax>5000 && src.FinalUnarmed==0)
				if(src.TurtleStanceUnlocked==0)
					src.TurtleStanceUnlocked=1
					src<<"Further improvements to your unarmed skills have resulted in the development of the Turtle Stance!"
				if(src.Skillz["Unarmed"]["Level"]>11 && src.EnergyMax>7500)
					if(src.BatStanceUnlocked==0)
						src.BatStanceUnlocked=1
						src<<"Further improvements to your unarmed skills have resulted in the development of the Bat Stance!"
					if(src.Skillz["Unarmed"]["Level"]>14 && src.EnergyMax>10000)
						if(src.CraneStanceUnlocked==0)
							src.CraneStanceUnlocked=1
							src<<"Further improvements to your unarmed skills have resulted in the development of the Crane Stance!"
						if(src.Skillz["Unarmed"]["Level"]>16 && src.EnergyMax>10000)
							if(!locate(/obj/Skills/MartialArts/AxeKick,src.contents))
								src.contents+=new/obj/Skills/MartialArts/AxeKick
								src<<"You can now use the powerful Axe Kick attack!"
							if(src.Skillz["Unarmed"]["Level"]>19 && src.EnergyMax>12500)
								if(src.WolfStanceUnlocked==0)
									src.WolfStanceUnlocked=1
									src<<"Further improvements to your unarmed skills have resulted in the development of the Wolf Stance!"
								if(src.Skillz["Unarmed"]["Level"]>21&& src.EnergyMax>15000)
									if(src.ArmadilloStanceUnlocked==0)
										src.ArmadilloStanceUnlocked=1
										src<<"Further improvements to your unarmed skills have resulted in the development of the Armadillo Stance!"
									if(src.Skillz["Unarmed"]["Level"]>24 && src.EnergyMax>15000)
										if(src.WeaponBreakerUnlocked==0)
											src.WeaponBreakerUnlocked=1
											src<<"Further improvements to your unarmed skills have resulted in the development of the Weapon Breaker stance!"
										if(src.Skillz["Unarmed"]["Level"]>29 && src.EnergyMax>17500)
											if(src.CheetahStanceUnlocked==0)
												src.CheetahStanceUnlocked=1
												src<<"Further improvements to your unarmed skills have resulted in the development of the Cheetah Stance! Nyan."
											if(src.Skillz["Unarmed"]["Level"]>34 && src.EnergyMax>30000)
												src.FinalUnarmed=1
												if(!locate(/obj/Skills/MartialArts/Burning_Finger,src.contents))
													src.contents+=new/obj/Skills/MartialArts/Burning_Finger
													src<<"Your skill with unarmed combat has reached the point where you can utilize the signature move of the King of Hearts."
													src.FinalUnarmed=1

			if(src.Skillz["Unarmed"]["Level"]>15 && src.EnergyMax>5000 && src.NewUnarmed==0)
				if(!locate(/obj/Skills/MartialArts/Sweeping_Kick,src.contents))
					src.contents+=new/obj/Skills/MartialArts/Sweeping_Kick
					src<<"Further improvements to your unarmed skills have resulted in the development of Sweeping Kick!"
				if(src.Skillz["Unarmed"]["Level"]>25 && src.EnergyMax>10000)
					if(!locate(/obj/Skills/MartialArts/HeavyShot,src.contents))
						src.contents+=new/obj/Skills/MartialArts/HeavyShot
						src<<"Further improvements to your unarmed skills have resulted in the development of Heavy Shot!"
					if(src.Skillz["Unarmed"]["Level"]>40 && src.EnergyMax>20000)
						if(!locate(/obj/Skills/MartialArts/Get_Dunked,src.contents))
							src.contents+=new/obj/Skills/MartialArts/Get_Dunked
							src<<"Further improvements to your unarmed skills have resulted you gaining the ability to take people to the hoop!"
						if(src.Skillz["Unarmed"]["Level"]>49 && src.EnergyMax>20000 && src.EnchantmentLevel>=30)
							if(!locate(/obj/Skills/MartialArts/CAST_FIST,src.contents))
								src.contents+=new/obj/Skills/MartialArts/CAST_FIST
								src<<"Further improvements to your unarmed skills, as well as your knowledge of enchantment, have allowed you to punch with the force of your Mana!"

	if(src.Skillz["Sword"]["Level"]>4 && src.EnergyMax>5000 && src.FinalSword==0)
		if(!locate(/obj/Skills/Swords/AirRender,src.contents))
			src.contents+=new/obj/Skills/Swords/AirRender
			src<<"Your skill with a weapon has allowed you to cut through space."
		if(src.Skillz["Sword"]["Level"]>14)
			if(!locate(/obj/Skills/Swords/Bladed_Flurry,src.contents))
				src.contents+=new/obj/Skills/Swords/Bladed_Flurry
				src<<"Your skill with a weapon has allowed you to develop the Bladed Flurry skill."
			if(src.Skillz["Sword"]["Level"]>19 && src.EnergyMax>10000*src.EnergyMod)
				if(!locate(/obj/Skills/Swords/Sweeping_Blade,src.contents))
					src.contents+=new/obj/Skills/Swords/Sweeping_Blade
					src<<"Your skill with a weapon has allowed you to develop the Sweeping Blade skill."
				if(src.Skillz["Sword"]["Level"]>29 && src.EnergyMax>20000*src.EnergyMod)
					if(!locate(/obj/Skills/Swords/ScarringBreeze,src.contents))
						src.contents+=new/obj/Skills/Swords/ScarringBreeze
						src<<"Your skill with a weapon has allowed you to ravage all in your path with one mighty swing."
					if(src.Skillz["Sword"]["Level"]>39 && src.EnergyMax>30000*src.EnergyMod)
						src.FinalSword=1
						if(!locate(/obj/Skills/Swords/WeaponMaster,src.contents))
							src.contents+=new/obj/Skills/Swords/WeaponMaster
							src<<"Your mastery of the sword is true, allowing you to show the fury of a Weapon Master."*/

	if(src.Age>=src.PrimeAge)//Mate
		if(!(src.Race in list("Android","Dragon","God of Destruction","Popo")))
			if(!locate(/obj/Child/Mate,src.contents))
				src.contents+=new/obj/Child/Mate
				src<<"You can have babies now!"

	if(src.IntelligenceLevel>=30&&src.Intelligence>=3)
		//if(!locate(/obj/Cyberize,src.contents))
		//	src.contents+=new/obj/Cyberize
		//	src<<"You learned how to cyberize others!"
		if(src.IntelligenceLevel>=50)
			if(!locate(/obj/WeirdCreation/CreateAndroid,src.contents))
				src.contents+=new/obj/WeirdCreation/CreateAndroid
				src<<"You can now create an Android!"
			if(src.IntelligenceLevel>=150)
				if(!locate(/obj/WeirdCreation/CreateBioAndroid,src.contents))
					src.contents+=new/obj/WeirdCreation/CreateBioAndroid
					src<<"You can now create a Bio Android!"
	if(src.EnchantmentLevel>=150&&src.Class in list("Wizard","Deus","Envy","Blue Mage"))
		if(!locate(/obj/WeirdCreation/CreateMajin,src.contents))
			src.contents+=new/obj/WeirdCreation/CreateMajin
			src<<"You can now create a Majin!"

	if(src.IntelligenceLevel>=100 && src.IntelligenceLevel<=150)
		src.UsedTanks+=1
	else if(src.IntelligenceLevel>=150)
		src.UsedTanks+=1

	//if(src.Race=="Tsufurujin"&&src.IntelligenceLevel>=30)
		//if(!locate(/obj/Cyberize,src.contents))
		//	src.contents+=new/obj/Cyberize
		//	src<<"You learned how to cyberize others!"

/*	if(src.Race in list("Demi","Makyo","Human", "Saiyan","Alien", "Demon", "Popo", "Lycan","Vampire","Heran"))//Expand
		if(src.EnergyMax>5000)
			if(!locate(/obj/Skills/Buffs/Expand,src.contents))
				src.contents+=new/obj/Skills/Buffs/Expand
				src<<"<i>Due to your immense energy...you learn Expand on your own.</i>"

	if(src.Body==1)
		if(src.EnergyMax>100000)//Super Kamehameha and Super Final Flash
			if(!locate(/obj/Skills/Attacks/Beams/SuperKamehameha,src.contents))
				if(locate(/obj/Skills/Attacks/Beams/Kamehameha,src.contents))
					src.contents+=new/obj/Skills/Attacks/Beams/SuperKamehameha
					src<<"<i>Due to your immense energy and mastery of Kamehameha...you create a more powerful verison!.</i>"
			if(!locate(/obj/Skills/Attacks/Beams/SuperFinal_Flash,src.contents))
				if(locate(/obj/Skills/Attacks/Beams/FinalFlash,src.contents))
					src.contents+=new/obj/Skills/Attacks/Beams/SuperFinal_Flash
					src<<"<i>Due to your immense energy and mastery of Final Flash...you create a more powerful verison!.</i>"
			if(src.EnergyMax>150000)//Final Kamehameha and Dodohameha
				if(locate(/obj/Skills/Attacks/Beams/SuperKamehameha,src.contents))
					if(locate(/obj/Skills/Attacks/Beams/Dodompa,src.contents))
						if(!locate(/obj/Skills/Attacks/Beams/Dodohameha,src.contents))
							src.contents+=new/obj/Skills/Attacks/Beams/Dodohameha
							src<<"<i>Due to your immense energy, mastery of Kamehameha and Dodompa... you create Dodohameha!</i>"
					else if(locate(/obj/Skills/Attacks/Beams/SuperFinal_Flash,src.contents))
						if(!locate(/obj/Skills/Attacks/Beams/FinalKamehameha,src.contents))
							src.contents+=new/obj/Skills/Attacks/Beams/FinalKamehameha
							src<<"<i>Due to your immense energy, mastery of Kamehameha and Final Flash...you create the ultimate beam, Final Kamehameha!</i>"

	if(src.Race in list("Human","Namekian", "Spirit Doll", "Alien", "Kaio", "Popo","Lycan","Vampire"))//Focus
		if(src.EnergyMax>5000)
			if(!locate(/obj/Skills/Buffs/Focus,src.contents))
				src.contents+=new/obj/Skills/Buffs/Focus
				src<<"<i>Due to your immense energy...you learn Focus on your own.</i>"*/

	if(src.Class=="Healer")//Heal
		if(!locate(/obj/Skills/Heal,src.contents))
			src.contents+=new/obj/Skills/Heal
			src<<"As a healer, you are well versed in the healing arts...your Heal skill does not drain your health to use."

/*	if(src.EnergyMax>1000&&src.FinalBasic==0)
		if(!locate(/obj/Skills/Attacks/Blast,src.contents))
			src.contents+=new/obj/Skills/Attacks/Blast
			src<<"<i>Due to your immense energy...you learn Blast on your own.</i>"
		if(src.EnergyMax>1500)
			if(!locate(/obj/Skills/Attacks/Beams/Beam,src.contents))
				src.contents+=new/obj/Skills/Attacks/Beams/Beam
				src<<"<i>Due to your immense energy...you learn Beam on your own.</i>"
			if(src.EnergyMax>2000)
				if(!locate(/obj/Skills/Fly,src.contents))
					src.contents+=new/obj/Skills/Fly
					src<<"<i>Due to your immense energy...you learn Fly on your own.</i>"
				if(src.EnergyMax>2500)
					if(!locate(/obj/Skills/Attacks/Charge,src.contents))
						src.contents+=new/obj/Skills/Attacks/Charge
						src<<"<i>Due to your immense energy...you learn Charge on your own.</i>"
					if(src.EnergyMax>5000)
						if(!locate(/obj/Skills/PowerControl,src.contents))
							src.contents+=new/obj/Skills/PowerControl
							src<<"<i>Due to your immense energy...you learn how to fluxate your power on your own.</i>"
						if(!locate(/obj/Skills/Buffs/KiBlade,src.contents))
							src.contents+=new/obj/Skills/Buffs/KiBlade
							src<<"<i>Due to your immense energy...you learn how to form a blade of energy around your hands!</i>"
						if(!locate(/obj/Skills/Rank/Shield,src.contents))
							if(src.AlienRacialPassive=="EnergyAdept")
								src.contents+=new/obj/Skills/Rank/Shield
								src<<"<i>Due to your natural energy control, you have learned Shield!</i>"
						if(src.EnergyMax>10000)
							if(!locate(/obj/Skills/Rank/Zanzoken,src.contents))
								src.contents+=new/obj/Skills/Rank/Zanzoken
								src<<"<i>Due to your immense energy...you learn how to accelerate matter into high velocities.</i>"
							if(src.AlienRacialPassive=="EnergyAdept")
								if(!locate(/obj/Skills/Attacks/Trishot,src.contents))
									src.contents+=new/obj/Skills/Attacks/Trishot
									src<<"<i>Due to your natural energy control, you have learned Trishot!</i>"
							if(src.EnergyMax>30000)
								if(!locate(/obj/Skills/Materialization,src.contents))
									src.contents+=new/obj/Skills/Materialization
									src<<"<i>Due to your immense energy...you learn how to materalize weights!</i>"
								if(src.EnergyMax>30000)
									src.FinalBasic=1
									if(!locate(/obj/Skills/Attacks/Beams/CustomBeam,src.contents))
										src.contents+=new/obj/Skills/Attacks/Beams/CustomBeam
										src<<"<i>Due to your immense energy...you learn how to design your own energy beams!</i>"
	if(src.EnergyMax>100000*src.SenseReq)
		if(!locate(/obj/Skills/UniverseSense,src.contents))
			src.contents+=new/obj/Skills/UniverseSense
			src<<"<i>Due to your energy, you can now sense anyone in the entire universe!</i>"*/

var/globalrpexp=0.05
mob/var/RPEXP=0
mob/proc/Melee_Gain(Amount,var/Solo)
	var/SpiritCuffMult=1
	var/SuperCatchUpBP=1
	var/SuperCatchUpStat=1
	if(src.ReallyBehindStat==1&&!src.UsingRPP)
		SuperCatchUpStat=10
	if(src.ReallyBehindStat==2&&!src.UsingRPP)
		SuperCatchUpStat=100
	if(src.ReallyBehindBP==1&&!src.UsingRPP)
		SuperCatchUpBP=10
	if(src.ReallyBehindBP==2&&!src.UsingRPP)
		SuperCatchUpBP=100
	if(!SuperCatchUp)
		SuperCatchUpStat=1
		SuperCatchUpBP=1
	if(src.SpiritCuffs)
		SpiritCuffMult=0.1
//	var/Delay=SpeedDelay()
//	var/PlayerEXPgains
	src.ZanzokenSkill+=1*Amount*rand(1,10)
	/*if(src.Warp==1)
		Amount/=10*/
//	src << "[Amount]"
	if(prob(65)||src.UsingRPP)
		if(src.UsingRPP)
			Gravity=1
		var/gain=0.04*GetPowerRank(2)*(Gains/100)*BaseMod*(Training_Rate*ControlTrainRate)*WeightFormula(1)*EXP/1000*Amount/2*SpiritCuffMult*SuperCatchUpBP
		src.Base+=gain
		if(src.Base/src.BaseMod>MaximumBase)
			MaximumBase=src.GetBPM()
			//MinimumBase=src.GetBPM()*0.75
		if(src.Race=="Kurama")
			src.trans["1give"]+=0.04*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*(Training_Rate*ControlTrainRate)*WeightFormula(1)*EXP/1000*Amount/2*SpiritCuffMult
		RPEXP+=globalrpexp*((SpentRPRank*2)-1)/sqrt(src.SpeedMod)
		if(src.SpiritCuffs)
			src.SpiritCuffsBP+=0.04*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*(Training_Rate*ControlTrainRate)*WeightFormula(1)*EXP/1000*Amount/2
		if(RPEXP>=100&&src.TrainedRPP<=PointCap)
			RewardPoints+=1
			TrainedRPP+=1
			RPEXP=0
		if(!src.UsingRPP||src.UsingRPP&&src.Energy<StrongestEnergy*0.85)
			EnergyMax+=0.008*EnergyMod*Amount*EnergyGains*src.PlayerEnergyGains
		if(src.UsingRPP&&src.Energy>=StrongestEnergy*0.85)
			EnergyMax+=0.008*EnergyMod*EnergyGains*src.PlayerEnergyGains
		if(Solo)
			EXP+=(EXPGains/100)*0.0015*(src.PlayerEXPgains*src.PlayerEXPgains*src.PlayerEXPgains)*Amount
		else
			EXP+=(EXPGains/100)*0.0015*Amount*src.PlayerEXPgains
	//	src << "[src.EXP]"
		src.Decline+=0.000004*Training_Rate*(DeclineGains/100)
		src.PrimeAge-=0.00016*Training_Rate*(DeclineGains/100)
		if(StrFocus=="Balanced")
			if(prob(60)||src.UsingRPP)
				Strength+=0.025*StrengthMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
			if(prob(60)||src.UsingRPP)
				Endurance+=0.025*EnduranceMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
		else if(StrFocus=="Strength")
			if(prob(60)||src.UsingRPP)
				Strength+=0.036*StrengthMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
			if(prob(60)||src.UsingRPP)
				Endurance+=0.012*EnduranceMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
		else if(StrFocus=="Endurance")
			if(prob(60)||src.UsingRPP)
				Endurance+=0.036*EnduranceMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
			if(prob(60)||src.UsingRPP)
				Strength+=0.012*StrengthMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
		if(ForFocus=="Balanced")
			if(prob(60)||src.UsingRPP)
				Force+=0.025*ForceMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
			if(prob(60)||src.UsingRPP)
				Resistance+=0.025*ResistanceMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
		else if(ForFocus=="Force")
			if(prob(60)||src.UsingRPP)
				Force+=0.036*ForceMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
			if(prob(60)||src.UsingRPP)
				Resistance+=0.012*ResistanceMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
		else if(ForFocus=="Resistance")
			if(prob(60)||src.UsingRPP)
				Resistance+=0.036*ResistanceMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
			if(prob(60)||src.UsingRPP)
				Force+=0.012*ForceMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
		if(OffFocus=="Balanced")
			if(prob(65)||src.UsingRPP)
				Offense+=0.05*OffenseMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
			if(prob(65)||src.UsingRPP)
				Defense+=0.05*DefenseMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
		else if(OffFocus=="Offense")
			if(prob(65)||src.UsingRPP)
				Offense+=0.075*OffenseMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
			if(prob(65)||src.UsingRPP)
				Defense+=0.025*DefenseMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
		else if(OffFocus=="Defense")
			if(prob(65)||src.UsingRPP)
				Defense+=0.075*DefenseMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat
			if(prob(65)||src.UsingRPP)
				Offense+=0.025*OffenseMod*GetPowerRank(1)*(StatGains/100)*Amount*SuperCatchUpStat

/*
mob/proc
	GetPowerRank(var/Rank)
		var/PeopleOnline=0
		for(var/mob/K) if(K.client)
			PeopleOnline+=1
	/*	if(PeopleOnline<=30)
			PeopleOnline=30*/
		if(Rank==1)
			var/StrongerStats=1
			var/YourStats=(Strength/StrengthMod)+(Endurance/EnduranceMod)+(Speed/SpeedMod)+(Resistance/ResistanceMod)+(Force/ForceMod)+(Offense/OffenseMod)+(Defense/DefenseMod)
			for(var/mob/A) if(A.client)
				var/TheirStats=(A.Strength/A.StrengthMod)+(A.Endurance/A.EnduranceMod)+(A.Speed/A.SpeedMod)+(A.Resistance/A.ResistanceMod)+(A.Force/A.ForceMod)+(A.Offense/A.OffenseMod)+(A.Defense/A.DefenseMod)
				if(TheirStats>YourStats) StrongerStats+=1
			if(StrongerStats<=5)
				StrongerStats/=4
			if(StrongerStats>=20)
				StrongerStats*=2
			return (100/PeopleOnline*StrongerStats)+0.5
		if(Rank==2)
			var/StrongerBPs=1
			for(var/mob/A) if(A.client)
				if(A.Base/(A.BaseMod/A.FBM)>Base/(BaseMod/FBM)) StrongerBPs+=1
			if(StrongerBPs<=5)
				StrongerBPs/=4
			if(StrongerBPs>=20)
				StrongerBPs*=2
			return (100/PeopleOnline*StrongerBPs)+0.5*/
mob/var
	getpowerrankupdate1=50
	getpowerrankupdate2=50
	getpowerrank1
	getpowerrank2

mob/proc
	GetPowerRank(var/Rank)
		var/PeopleOnline=0
		for(var/mob/K) if(K.client)
			PeopleOnline+=1
		if(Rank==1)
			if(src.getpowerrankupdate1<1||!src.getpowerrank1)
				src.getpowerrankupdate1=50
				if(RankToggle==2)
					var/StrongerStats=1
					var/StrongerEnergy=1
					var/StrongerPoints=1
					var/YourMods=((StrengthMod)+(EnduranceMod)+(ResistanceMod)+(ForceMod)+(OffenseMod)+(DefenseMod))/7
					var/YourStats=((Strength)+(Endurance)+(Resistance)+(Force)+(Offense)+(Defense))/7
					for(var/mob/Players/A) if(A.client)
						var/TheirStats=((A.Strength)+(A.Endurance)+(A.Resistance)+(A.Force)+(A.Offense)+(A.Defense))/7
						var/TheirMods=((A.StrengthMod)+(A.EnduranceMod)+(A.ResistanceMod)+(A.ForceMod)+(A.OffenseMod)+(A.DefenseMod))/7
					/*	if(!TheirStats)
							TheirStats=1*/
						if(TheirStats/TheirMods>YourStats/YourMods) StrongerStats+=1
						if(A.EnergyMax/A.EnergyMod>EnergyMax/EnergyMod) StrongerEnergy+=1
						if(A.spentrp>src.spentrp) StrongerPoints+=1
				//		if(StrongestStats>YourStats/YourMods) StrongerStats+=1
					if(StrongerStats==1)
						StrongestStats=YourStats
						if(StrongestStats>=10000000)
							StrongestStats=10000000
					if(StrongerEnergy==1)
						StrongestEnergy=EnergyMax/EnergyMod
						if(StrongestEnergy>=100000)
							StrongestEnergy=100000
					if(StrongerPoints==1)
						HighestPoints=spentrp
					//return round(100/PeopleOnline*StrongerStats)
					src.getpowerrank1=round(100/PeopleOnline*StrongerStats)+1
					if(src.getpowerrank1>=25 && src.getpowerrank1<60&&SuperCatchUp)
						src.ReallyBehindStat=1
					if(src.getpowerrank1>=60&&SuperCatchUp)
						src.ReallyBehindStat=2
				else if(RankToggle==1)
					var/StrongerStats=1
					var/StrongerEnergy=1
					var/StrongerPoints=1
					var/YourStats=(Strength/StrengthMod)+(Endurance/EnduranceMod)+(Resistance/ResistanceMod)+(Force/ForceMod)+(Offense/OffenseMod)+(Defense/DefenseMod)
					for(var/mob/Players/A) if(A.client)
						var/TheirStats=(A.Strength/A.StrengthMod)+(A.Endurance/A.EnduranceMod)+(A.Resistance/A.ResistanceMod)+(A.Force/A.ForceMod)+(A.Offense/A.OffenseMod)+(A.Defense/A.DefenseMod)
						if(TheirStats>YourStats) StrongerStats+=1
						if(A.EnergyMax/A.EnergyMod>EnergyMax/EnergyMod) StrongerEnergy+=1
						if(A.spentrp>src.spentrp) StrongerPoints+=1
					if(StrongerEnergy==1)
						StrongestEnergy=EnergyMax/EnergyMod
						if(StrongestEnergy>=100000)
							StrongestEnergy=100000
					src.getpowerrank1=round(100/PeopleOnline*StrongerStats)+1
					if(StrongerPoints==1)
						HighestPoints=spentrp
					if(src.getpowerrank1>=25 && src.getpowerrank1<60&&SuperCatchUp)
						src.ReallyBehindStat=1
					if(src.getpowerrank1>=60&&SuperCatchUp)
						src.ReallyBehindStat=2
					//return round(100/PeopleOnline*StrongerStats)
			src.getpowerrankupdate1--
			return getpowerrank1
		else if(Rank==2)
			if(src.getpowerrankupdate2<1||!src.getpowerrank2)
				getpowerrankupdate2=50
				var/StrongerBPs=1
				var/StrongerEXPs=1
				var/StrongerBPmodifier=1
				for(var/mob/Players/A) if(A.client)
					if(A.Base/(A.BaseMod/A.FBM)>Base/(BaseMod/FBM)) StrongerBPs+=1
					if(A.EXP>EXP) StrongerEXPs+=1
				if(StrongerEXPs==1)
					StrongestEXP=EXP
				if(StrongerBPs==1)
					StrongestBP=(Base/(BaseMod/FBM))
				StrongerBPmodifier=(StrongestBP/(Base/BaseMod)*StatRankEffect)
				if(NegateBPMod)
					StrongerBPmodifier=1
				if(StrongerBPmodifier<1)
					StrongerBPmodifier=1
				if(StrongerBPmodifier>10)
					StrongerBPmodifier=10
				src.getpowerrank2=round(StrongerBPmodifier*round(100/PeopleOnline*StrongerBPs))
			src.getpowerrankupdate2--
			if(src.getpowerrank2<25&&SuperCatchUp)
				src.ReallyBehindBP=0
			if(src.getpowerrank2>=25 && src.getpowerrank2<60&&SuperCatchUp)
				src.ReallyBehindBP=1
			if(src.getpowerrank2>=60&&SuperCatchUp)
				src.ReallyBehindBP=2
			return src.getpowerrank2 //round((StrongerBPmodifier*round(100/PeopleOnline*StrongerBPs)))//return round((StrongestBP/(Base/BaseMod*StatRankEffect)*round(100/PeopleOnline*StrongerBPs))/4)+1//PowerRankTotal//round((StrongestBP/(Base/BaseMod*StatRankEffect)*round(100/PeopleOnline*StrongerBPs))/4)+1




mob/Players/verb
	StatFocus()
		set category="Other"
		if(world.realtime < usr.StatFocusLastUse+(600*60*24))
			src << "You can only use this once per day."
			return
/*		var/Choice=input(usr,"Choose Str/End Option") in list("High Strength","Strength","Balanced","Endurance","High Endurance")
		switch(Choice)
			if("High Strength") usr.StrFocus="HighStrength"
			if("Strength") usr.StrFocus="Strength"
			if("High Endurance") usr.StrFocus="HighEndurance"
			if("Endurance") usr.StrFocus="Endurance"
			if("Balanced") usr.StrFocus="Balanced"
		var/Choice2=input(usr,"Choose Force/Res Option") in list("High Force","Force","Balanced","Resistance", "High Resistance")
		switch(Choice2)
			if("High Force") usr.ForFocus="HighForce"
			if("Force") usr.ForFocus="Force"
			if("High Resistance") usr.ForFocus="HighResistance"
			if("Resistance") usr.ForFocus="Resistance"
			if("Balanced") usr.ForFocus="Balanced"
		var/Choice3=input(usr,"Choose Off/Def Option") in list("High Offense","Offense","Balanced","Defense","High Defense")
		switch(Choice3)
			if("High Offense") usr.OffFocus="HighOffense"
			if("Offense") usr.OffFocus="Offense"
			if("High Defense") usr.OffFocus="HighDefense"
			if("Defense") usr.OffFocus="Defense"
			if("Balanced") usr.OffFocus="Balanced"
		usr.UpdatedStats=0
		usr.StatFocusLastUse=world.realtime*/
		var/Choice4=alert(usr,"Focus on Intelligence, Enchantments, or none?","","Intelligence","Enchantment","None")
		switch(Choice4)
			if("None")
				usr.IntFocus=0
				usr.EnchantmentFocus=0
			if("Intelligence")
				usr.IntFocus=1
				usr.EnchantmentFocus=0
			if("Enchantment")
				usr.EnchantmentFocus=1
				usr.IntFocus=0

mob/proc/IntGain(var/Multiplier=1)
	src.IntelligenceEXP+=rand(10,100)*(IntRate/100)*src.Meditation_Rate*Multiplier
	if(Multiplier>1)
		src.IntelligenceEXP+=(src.IntelligenceEXPNeeded*0.01)*(IntRate/50)*src.Meditation_Rate*Multiplier
	if(src.IntelligenceEXP>IntelligenceEXPNeeded)
		src.IntelligenceEXP-=IntelligenceEXPNeeded
		src.IntelligenceLevel+=1
		src.IntelligenceEXPNeeded=(1000*sqrt(IntelligenceLevel)*IntelligenceLevel)/Intelligence
//		src.client.SaveChar()

mob/proc/IntGainofHitting(Amount)
	src.IntelligenceEXP+=rand(2.5,25)*(IntRate/100)*Amount*src.Meditation_Rate*Training_Rate
	Base+=0.02*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*WeightFormula(1)*EXP/1000*Amount/2*src.Meditation_Rate
	EnergyMax+=0.008*EnergyMod*Amount*EnergyGains*src.Meditation_Rate
	EXP+=(EXPGains/100)*0.0015*src.PlayerEXPgains*src.PlayerEXPgains*Amount
	src.Decline+=0.000004*Training_Rate*(DeclineGains/100)
	src.PrimeAge-=0.00016*Training_Rate*(DeclineGains/100)
	if(src.IntelligenceEXP>IntelligenceEXPNeeded)
		src.IntelligenceEXP-=IntelligenceEXPNeeded
		src.IntelligenceLevel+=1
		src.IntelligenceEXPNeeded=(1000*sqrt(IntelligenceLevel)*IntelligenceLevel)/Intelligence
//		src.client.SaveChar()
mob/proc
	ZenkaiGain()
		return
		if(ZenkaiAmount<(Base-ZenkaiAmount)*(Zenkai_Rate/10)||prob(1))
			if(Base/3>ZenkaiAmount)
				var/Gain=1*sqrt(sqrt(Gravity))*(Gains/100)*BaseMod*Zenkai_Rate*WeightFormula(1)*(EXP/1000)/(2*Regeneration)*GlobalZenkai
				if(ZenkaiMatch>(ZenkaiAmount+Gain)*1.5)
					Gain*=1.2
				if(ZenkaiMatch>(ZenkaiAmount+Gain)*2)
					Gain*=1.2
				if(ZenkaiMatch>(ZenkaiAmount+Gain)*3)
					Gain*=1.2
				if(ZenkaiMatch>(ZenkaiAmount+Gain)*4)
					Gain*=1.2
				if(ZenkaiMatch>(ZenkaiAmount+Gain)*5)
					Gain*=1.2
				if(text2num(Last_Zenkai)<Value(world.realtime+(5000*600)))
					Gain*=1.2
				if(text2num(Last_Zenkai)<Value(world.realtime+(1000*600)))
					Gain*=1.2
				if(text2num(Last_Zenkai)<Value(world.realtime+(100*600)))
					Gain*=1.2
				else if(text2num(Last_Zenkai)<Value(world.realtime+(10*600)))
					Gain*=0.2
				if(ZenkaiMatch<src.Base)
					Gain*=0.2
				Base+=Gain
				if(src.Race=="Kurama")
					src.trans["1give"]+=Gain
				ZenkaiAmount+=Gain

mob/proc/RemoveWaterOverlay()
	var/list/meh=list("1","2","3","4","5","6","7","8","9","10","11","12","13","waterfall","14","15")
	for(var/x in meh)
		src.overlays-=image('WaterOverlay.dmi',"[x]")
mob/var/calmcounter=10




var/gainlooptick=10

mob/Admin4/verb
	gainlooptick(var/q as num)
		gainlooptick=q

	Edit_Credits()
		set category = "Admin"
		var/temp = input("Edit the Credits.",, Credits) as null|message
		if( temp == null ) return
		Credits = temp
		Log("Admin","[ExtractInfo(usr)] has edited the Credits.")

/*mob/proc/Pippin()
	while(src.BerserkerInsanity&&!src.PureRPMode&&!src.KO)
		//if(Health<=0&&!KO) Unconscious(null,"?!?!")
		sleep(2.5)
//		var/list/orihime=list
		for(var/mob/P in oview(20,src))
//			orihime.Add(P)
			if(P!=src&&!src.Knockbacked&&!src.Beaming)
				if(!src.Target)
					step_towards(src,P)
				else
					step_towards(src,src.Target)
					if(prob(0.25))
						src.Orihime()
			if(P in get_step(src,src.dir))
				src.Melee(1,1)
				sleep(3/src.SpeedMod)
		//		if(prob(0.2))
		//			src.Melee(2,2)
*/

mob/proc/BlackOriginMode()
	while(src.BerserkerInsanity&&!src.PureRPMode&&!src.KO)
		//if(Health<=0&&!KO) Unconscious(null,"?!?!")
		sleep(2.5)
//		var/list/orihime=list
		for(var/mob/P in oview(30,src))
//			orihime.Add(P)
			if(P!=src&&!src.Knockbacked&&!src.Beaming)
				if(!src.Target)
					src.Orihime()
					sleep(10)
				else
					step_towards(src,src.Target)
			if(P in get_step(src,src.dir))
				src.Melee(1,1)
				sleep(3/src.SpeedMod)
	//			if(prob(0.5))
	//				src.Melee(2,2)

mob/proc/Orihime()
	set category="Skills"
	var
		NewTarget
		NewTgtDist=25
	for(var/mob/P in oview(18,usr))
		if(P!=src.Target&&!P.KO)
			if(get_dist(usr,P)<NewTgtDist)
				NewTgtDist=get_dist(src,P)
				NewTarget=P
	src.Target=NewTarget
	src<<"You chase after [src.Target] now!"

mob/proc/GainLoop()
	spawn src.GridStat()
	while(src)
		if(!src.client)
//			src.EmergencySave()
//			world<<"Emergency saved [src]"
//			del(src)
			return // If mob has no client, its nawt a playa
		sleep(gainlooptick)
		if(src.Health < 25 && !src.HealthAnnounce25)
			src.OMessage(10, "[src] looks exhausted!", "[src]([src.key]) has 25% health left.")
			src.HealthAnnounce25=1
		if(src.Health < 10 && !src.HealthAnnounce10)
			src.OMessage(10, "[src] is barely standing up!", "[src]([src.key]) has 10% health left.")
			src.HealthAnnounce10=1
		if(src.TotalInjury > 50 && !src.InjuryAnnounce)
			src.OMessage(10, "<font color=red>[src] looks beaten half to death, they limp for a second bit due to their wounds!", "[src]([src.key]) has 50% injury.")
			SpawnBBlood(src)
			src.InjuryAnnounce=1
		if(src.TotalInjury > 75 && !src.InjuryAnnounce75)
			src.OMessage(10, "<font color=red>[src] harshly coughs up blood due to the crippling wounds all over their body!", "[src]([src.key]) has 75% injury.")
			SpawnBlood(src)
			SpawnBlood(src)
			SpawnBBlood(src)
			src.InjuryAnnounce75=1
		if(src.TotalInjury > 90 && !src.InjuryAnnounce90)
			src.OMessage(10, "<font color=red>[src] seizes up, barely managing to stand with their utterly trashed mess of a body... They're struggling to breath and may fall limp anytime now...!", "[src]([src.key]) has 90% injury.")
			SpawnBBlood(src)
			LowHPBleed(src)
			src.InjuryAnnounce90=1
/*		if(src.TotalMysticInjury > 50 && !src.MysticInjuryAnnounce)
			src.OMessage(10, "[src] is lacerated all over by wounds that are like death itself!", "[src]([src.key]) has 50% MEoDP injury.")
			src.MysticInjuryAnnounce=1*/
		if(src.Health>=75&&src.icon_state=="Meditate"&&src.Anger>1&&!src.PureRPMode)
			calmcounter-=1
		else
			calmcounter=10
		if(calmcounter<=0)
			calmcounter=10

			var/InMajin
			for(var/obj/Skills/Buffs/Majin/V in src) if(V.BuffUsing)
				InMajin=1
			for(var/obj/Skills/Buffs/Sharingan/S in src) if(S.BuffUsing)
				InMajin=1
			if(src.RageHero)
				InMajin=1
			var/InFrenzy
			for(var/obj/Skills/VampireFrenzy/F in src) if(F.BuffUsing)
				InFrenzy=1
			var/InWolf
			for(var/obj/Lycan/Q in src) if(Q.Transed)
				InWolf=1
			if(Anger>0 && !src.PureRPMode && !InMajin && !InFrenzy && !InWolf && src.Health>=50)
				src.OMessage(10,"<font color=white><i>[src] becomes calm.","<font color=silver>[src]([src.key]) becomes calm.")
				src.Anger=0
				if(src.InGiji)
					src.RevertGiji()
		if(src.Grab)src.Grab_Update()
		if(prob(5))src.SparGuy=null
		if(prob(10))
			src.AbsorbPower=min(src.AbsorbPower,src.Base*20)
			src.PlayerEXPgains=(StrongestEXP/src.EXP)*(StrongestEXP/src.EXP)*(StrongestEXP/src.EXP)
			src.PlayerEnergyGains=(StrongestEnergy/(src.EnergyMax/src.EnergyMod))
			src.SpentRPRank=HighestPoints/src.spentrp
			if(src.SpentRPRank>5)
				src.SpentRPRank=5
			if(src.SpentRPRank<1)
				src.SpentRPRank=1
			if(!src.PlayerEXPgains)
				src.PlayerEXPgains=1
			if(src.PlayerEXPgains>=30)
				src.PlayerEXPgains=30
			if(!src.PlayerEnergyGains)
				src.PlayerEnergyGains=1
			if(src.PlayerEnergyGains>=100)
				src.PlayerEnergyGains=100
			if(src.PlayerEnergyGains<=1)
				src.PlayerEnergyGains=1
			if(src.EXP>=MaximumEXP)
				src.EXP=MaximumEXP
			if(ZenkaiReset && !src.ZenkaiAdjusted)
				src.Base-=ZenkaiAmount
				src.ZenkaiAmount=0
				src.ZenkaiAdjusted=1
			if(src.EnergyMax!=1000*src.EnergyMod)
				src.EnergyMax=1000*src.EnergyMod
			if(src.GetBPM()>MaximumBase)
				MaximumBase=src.GetBPM()
				//MinimumBase=(src.GetBPM()*0.75)
			if(src.GetBPM()<MinimumBase)
				src.Base=MinimumBase*src.BaseMod
			/*if(src.Base<BPUpdateAmount*src.BaseMod)
				src.Base=BPUpdateAmount
				src.Base*=src.BaseMod*/
			if(StatUpdate>src.UpdatedStats)
				src.UpdatedStats=StatUpdate
				if(src.StrFocus=="Strength")
					src.Strength=(10000*1.5)*src.StrengthMod
					src.Endurance=(10000*0.5)*src.EnduranceMod
				else if(src.StrFocus=="Endurance")
					src.Strength=(10000*0.5)*src.StrengthMod
					src.Endurance=(10000*1.5)*src.EnduranceMod
				else if(src.StrFocus=="Balanced")
					src.Strength=10000*src.StrengthMod
					src.Endurance=10000*src.EnduranceMod
				else if(src.StrFocus=="HighStrength")
					src.Strength=(10000*1.72)*src.StrengthMod
					src.Endurance=(10000*0.28)*src.EnduranceMod
				else if(src.StrFocus=="HighEndurance")
					src.Strength=(10000*0.28)*src.StrengthMod
					src.Endurance=(10000*1.72)*src.EnduranceMod
				if(src.ForFocus=="Force")
					src.Resistance=(10000*0.5)*src.ResistanceMod
					src.Force=(10000*1.5)*src.ForceMod
				else if(src.ForFocus=="Resistance")
					src.Resistance=(10000*1.5)*src.ResistanceMod
					src.Force=(10000*0.5)*src.ForceMod
				else if(src.ForFocus=="HighForce")
					src.Resistance=(10000*0.28)*src.ResistanceMod
					src.Force=(10000*1.72)*src.ForceMod
				else if(src.ForFocus=="HighResistance")
					src.Resistance=(10000*1.72)*src.ResistanceMod
					src.Force=(10000*0.28)*src.ForceMod
				else if(src.ForFocus=="Balanced")
					src.Resistance=10000*src.ResistanceMod
					src.Force=10000*src.ForceMod
				if(src.OffFocus=="Offense")
					src.Offense=(10000*1.5)*src.OffenseMod*2.08
					src.Defense=(10000*0.5)*src.DefenseMod*2.08
				else if(src.OffFocus=="Defense")
					src.Offense=(10000*0.5)*src.OffenseMod*2.08
					src.Defense=(10000*1.5)*src.DefenseMod*2.08
				else if(src.OffFocus=="HighOffense")
					src.Offense=(10000*1.72)*src.OffenseMod*2.08
					src.Defense=(10000*0.28)*src.DefenseMod*2.08
				else if(src.OffFocus=="HighDefense")
					src.Offense=(10000*0.28)*src.OffenseMod*2.08
					src.Defense=(10000*1.72)*src.DefenseMod*2.08
				else if(src.OffFocus=="Balanced")
					src.Offense=10000*src.OffenseMod*2.08
					src.Defense=10000*src.DefenseMod*2.08
			if(src.UnarmedReset==1 && src.Skillz["Unarmed"]["Level"]>30)
				src.Skillz["Unarmed"]["Level"]=35
				src.UnarmedReset=2
			if(src.Skillz["Unarmed"]["Level"]<0)
				src.Skillz["Unarmed"]["Level"]=35


			if(src.EnergyMax>=10000000)
				src.EnergyMax=10000000
			src.AngerFail=0

		spawn()if(client)Update_Stat_Labels()

		if(prob(75) && src.AgonyField)
			for(var/mob/M in view(5,src))
				if(M!=src)
					if(M.Race!="Demon"||M.Race!="Half-Demon"||M.Race!="Makaioshin")
						M.Health-=0.5
		src.MaxHealth()
		src.MaxEnergy()
		/*if(src.Energy > (src.EnergyMax*((100-src.TotalFatigue)/100)))
			src.Energy=src.EnergyMax*((100-src.TotalFatigue)/100)*/
		if(src.CantZanzo && prob(45))
			src.CantZanzo-=3
		if(src.ElecStunned)
			if(prob(25))
				src.Frozen=0
				src.ElecStunned=0
		if(src.TranceForm&&!src.PureRPMode)
			if(src.TranceCounter>=1)
				src.TranceCounter-=1
			if(src.TranceForm && src.TranceCounter<=0)
				src.TranceForm=0
				src.TranceCounter=0
				for(var/obj/Skills/Buffs/TranceForm/x in src)
					if(x.BuffUsing)
						src.BuffX("TranceForm",x)
		if(src.Avalon&&!src.PureRPMode)
			if(src.ManaAmount>=2)
				src.ManaAmount-=1
			if(src.Avalon && src.ManaAmount<=1)
				src << "You ran out of mana...!"
				src.Avalon=0
		if(src.DelayedKB&&!src.BladeSlow)
			src.Knockback(DelayedKB, DelayedKBCatalyst)
			src.DelayedKB=0
			src.DelayedKBCatalyst=null
		if(src.DelayedDamage)
			src.Health-=src.DelayedDamage
			src.Frozen=0
			src.DragonFisted=0
			LightningFlash(src)
			for(var/turf/T in Turf_Circle(src,8))
				if(prob(1)) sleep(0.005)
				spawn(rand(4,8)) new/turf/Dirt1(locate(T.x,T.y,T.z))
				spawn(rand(4,8)) Destroy(T)
			if(src.Health<=-1)
				src.Death(null,"exploding!",src.DelayedDamage)
			src.DelayedDamage=0
/*		if(prob(10)) //Speed Mod adjust
			SpeedMod=(Speed/(10000*(StatGains/100)))+OriginalSpeedMod*/
	/*	if(src.Health<=-35 && !src.MortallyWounded)
			src<< "The damage you have taken is too great. Your injuries gradually begin to kill you."
			src.MortallyWounded=1*/
		if(src.MortallyWounded)
			if(prob(30))Health-=1
			if(prob(0.5))
				Health=0
				MortallyWounded=0
				src.Conscious()
			if(prob(0.5))
				Health-=10
			if(Health<-100)
				if(prob(50))src.Death(null,"internal injuries!")
		if(src.SusanooActive&&src.EternalSusanoo!=1&&!src.PureRPMode)
			if(prob(30))
				Health-=rand(0.25,1)
		if(src.SharinganActive&&!src.PureRPMode)
			src.SharinganTime+=1
			if(prob(30))
				src.Energy*=(0.995)
		if(src.SharinganActive&&src.SharinganLevel==4&&src.SharinganUnlocked>=5&&src.SharinganStrain&&!src.PureRPMode)
			src<<"<i>You regain your sight, at a cost that may haunt you forever...</i>"
			animate(src.client, color = null, time = 10)
/*			src.OffenseMod/=0.95
			src.Offense/=0.95
			src.DefenseMod/=0.95
			src.Defense/=0.95*/
			src.SharinganStrain-=1
		if(src.SharinganActive&&src.SharinganLevel==4&&src.SharinganUnlocked<=4&&!src.PureRPMode)
			if(prob(30))
				Health-=rand(0.25,1)
			if(prob(0.5)) //&& SharinganAbuser
				src<<"<i>Your eyes feel extremely painful, as you lose some of your sight forever...</i>"
/*				src.OffenseMod*=0.95
				src.Offense*=0.95
				src.DefenseMod*=0.95
				src.Defense*=0.95*/
				animate(src.client, color = list(1.438,-0.062,-0.062, 0.122,1.378,-0.122,0.016,-0.016,1.483,-0.03,0.05,-0.02), time = 20)
				src.SharinganStrain+=1
		if(src.Berserkering&&!src.PureRPMode&&!src.KO)
			if(src.EarthAndHeaven)
				if(!src.BerserkerInsanity)
					if(prob(50))
						src.OMessage(20,"[src] suddenly charges forward with a roar!?", "[src]([src.key]) went insane.")
						src.BerserkerInsanity=1
						src.ControlPower=100
						spawn(1) src.BlackOriginMode()
						if(!src.EarthAndHell&&!src.BerserkerInsanityLock)
							src.EarthAndHell=rand(400,600)
				if(src.BerserkerInsanity&&!src.BerserkerInsanityLock)
					if(prob(0.25))
						src.OMessage(20,"[src] stops moving abruptly...?", "[src]([src.key]) lapsed back into sanity.")
						src.BerserkerInsanity=0
/*			if(src.BerserkerMod==1)
				if(!src.BerserkerInsanity)
					if(prob(30))
						src.OMessage(20,"[src] suddenly begins to move wildly!?", "[src]([src.key]) went insane.")
						src.BerserkerInsanity=1
						src.ControlPower=100
						spawn(1) src.Pippin()
				if(!src.BerserkerInsanityLock)
					if(prob(15))
						src.BerserkerInsanityLock=1
				if(src.BerserkerInsanity&&src.BerserkerInsanityLock)
					if(prob(3))
						src.OMessage(20,"[src] stops moving abruptly...?", "[src]([src.key]) lapsed back into sanity.")
						src.BerserkerInsanity=0
						src.BerserkerInsanityLock=0
			if(src.BerserkerMod==2)
				if(!src.BerserkerInsanity)
					if(prob(40))
						src.OMessage(20,"[src] suddenly begins to move wildly!?", "[src]([src.key]) went insane.")
						src.BerserkerInsanity=1
						src.ControlPower=100
						spawn(1) src.Pippin()
				if(!src.BerserkerInsanityLock)
					if(prob(20))
						src.BerserkerInsanityLock=1
				if(src.BerserkerInsanity&&src.BerserkerInsanityLock)
					if(prob(0.5))
						src.OMessage(20,"[src] stops moving abruptly...?", "[src]([src.key]) lapsed back into sanity.")
						src.BerserkerInsanity=0
						src.BerserkerInsanityLock=0
			if(src.BerserkerMod==3)
				if(!src.BerserkerInsanity)
					if(prob(60))
						src.OMessage(20,"[src] suddenly begins to move wildly!?", "[src]([src.key]) went insane.")
						src.BerserkerInsanity=1
						src.ControlPower=100
						spawn(1) src.Pippin()
				if(!src.BerserkerInsanityLock)
					if(prob(30))
						src.BerserkerInsanityLock=1
				if(src.BerserkerInsanity&&src.BerserkerInsanityLock)
					if(prob(0.1))
						src.OMessage(20,"[src] stops moving abruptly...?", "[src]([src.key]) lapsed back into sanity.")
						src.BerserkerInsanity=0
						src.BerserkerInsanityLock=0
			if(src.BerserkerMod==4)
				if(!src.BerserkerInsanity)
					if(prob(90))
						src.OMessage(20,"[src] suddenly begins to move wildly!?", "[src]([src.key]) went insane.")
						src.BerserkerInsanity=1
						src.ControlPower=100
						spawn(1) src.Pippin()
				if(!src.BerserkerInsanityLock)
					if(prob(45))
						src.BerserkerInsanityLock=1*/
			/*	if(src.BerserkerInsanity&&src.BerserkerInsanityLock)
					if(prob(0.0025))
						src.OMessage(20,"[src] stops moving abruptly...?", "[src]([src.key]) lapsed back into sanity.")
						src.BerserkerInsanity=0
						src.BerserkerInsanityLock=0*/
			if(src.VisoredStage==1)
				if(!src.BerserkerInsanity)
					if(prob(50))
						src.OMessage(20,"[src] suddenly begins to move wildly!?", "[src]([src.key]) went insane.")
						src.BerserkerInsanity=1
						src.ControlPower=100
//						spawn(1) src.Pippin()
				if(!src.BerserkerInsanityLock)
					if(prob(50))
						src.BerserkerInsanityLock=1
				if(src.BerserkerInsanity&&src.BerserkerInsanityLock)
					if(prob(3))
						src.OMessage(20,"[src] stops moving abruptly...?", "[src]([src.key]) lapsed back into sanity.")
						src.BerserkerInsanity=0
						src.BerserkerInsanityLock=0
			if(src.VisoredStage==2)
				if(!src.BerserkerInsanity)
					if(prob(3))
						src.OMessage(20,"[src] suddenly begins to move wildly!?", "[src]([src.key]) went insane.")
						src.BerserkerInsanity=1
						src.ControlPower=100
//						spawn(1) src.Pippin()
				if(!src.BerserkerInsanityLock)
					if(prob(20))
						src.BerserkerInsanityLock=1
				if(src.BerserkerInsanity&&src.BerserkerInsanityLock)
					if(prob(30))
						src.OMessage(20,"[src] stops moving abruptly...?", "[src]([src.key]) lapsed back into sanity.")
						src.BerserkerInsanity=0
						src.BerserkerInsanityLock=0
		/*	if(src.VisoredStage==3)
				if(!src.BerserkerInsanity)
					if(prob(0.05))
						src.OMessage(20,"[src] suddenly begins to move wildly!?", "[src]([src.key]) went insane.")
						src.BerserkerInsanity=1
						spawn(1) src.Pippin()
				if(!src.BerserkerInsanityLock)
					if(prob(10))
						src.BerserkerInsanityLock=1
				if(src.BerserkerInsanity&&src.BerserkerInsanityLock)
					if(prob(75))
						src.OMessage(20,"[src] stops moving abruptly...?", "[src]([src.key]) lapsed back into sanity.")
						src.BerserkerInsanity=0
						src.BerserkerInsanityLock=0*/
			if(src.VisoredStage==4)
				if(!src.BerserkerInsanity)
					if(prob(75))
						src.OMessage(20,"[src] suddenly begins to move wildly!?", "[src]([src.key]) went insane.")
						src.BerserkerInsanity=1
						src.ControlPower=100
//						spawn(1) src.Pippin()
				if(!src.BerserkerInsanityLock)
					if(prob(50))
						src.BerserkerInsanityLock=1
			/*	if(src.BerserkerInsanity&&src.BerserkerInsanityLock)
					if(prob(0.025))
						src.OMessage(20,"[src] stops moving abruptly...?", "[src]([src.key]) lapsed back into sanity.")
						src.BerserkerInsanity=0
						src.BerserkerInsanityLock=0*/

		/*if(src.Berserkering&&!src.PureRPMode)
			if(src.BerserkerInsanity==1)
				if(src.BerserkerMod>=0)

				if(src.BerserkerMod>=1)

				if(src.BerserkerMod>=2)

				if(src.BerserkerMod>=3)*/
		/*for(var/obj/Skills/Buffs/OlympianFury/x in src)
			if(x.Using)
				if(src.Class=="Asura" && src.Anger>1.05)
					src.Anger-=0.005
					if(src.Anger<=1.05)
						src.Anger=1.05*/
		if(src.SenseActive<3)
			if(prob(75))
				if(src.SenseActive==1)
					src.Energy*=0.992
				if(src.SenseActive==2)
					src.Energy*=0.999

		if(src.KO)
			//if(prob(90)) src.ZenkaiGain()
			src.ZenkaiGain()

			if(prob(50) && src.MortallyWounded && !locate(/obj/Regenerate,src.contents))
				if(ZenkaiAmount<(Base-ZenkaiAmount)*(((sqrt(Zenkai_Rate)*2)/5)))
					var/Gain=15*sqrt(sqrt(Gravity))*(Gains/100)*BaseMod*Zenkai_Rate*WeightFormula(1)*(EXP/1000)
					Base+=Gain
					if(src.Race=="Kurama")
						src.trans["1give"]+=Gain
					ZenkaiAmount+=Gain
			if(prob(50))
				if(ZenkaiAmount<(Base-ZenkaiAmount)*(((sqrt(Zenkai_Rate)*2)/30)))
					var/Gain=0.15*sqrt(sqrt(Gravity))*(Gains/100)*BaseMod*Zenkai_Rate*WeightFormula(1)*(EXP/1000)*GetPowerRank(2)
					Base+=Gain
					if(src.Race=="Kurama")
						src.trans["1give"]+=Gain
					ZenkaiAmount+=Gain


/*		if(!src.PassiveGain)
			if(src.Digging)
				src.Digging()
			else if(src.icon_state=="Meditate")
				src.Meditation()
			else if(src.Flying)
				src.Fly()
			else if(src.icon_state=="Train")
				src.Training()*/
//Okay, stuff past here may be sources of lag. This is just a comment to note this.
		var/gravityy
		var/temperatures=0
		var/temperaturestype
		var/turf/Q=src.loc
		var/area/Outside/Planet/T=Q.loc
		if(!src.loc||!T)
			src<<"Bro your gains have stopped cuz you went into the void, relog"
			return
		if(Q.Gravity)
			gravityy=Q.Gravity
		temperatures=T.Temperature
		temperaturestype=T.TemperatureType
		if(!src.OlympianReq)
			src.OlympianReq=rand(20000,1000000)
			if(prob(1))
				src.OlympianReq=1000
		if(!src.VoidHero&&!(src.Race in list("Nobody","God of Destruction","Hollow")))
			if(istype(Q,/turf/Special/Static))
				src.Health-=1
			if(istype(Q,/turf/Dirt99))
				src.Health-=2.5
		/*		if(src.KO)
					src.Voided=1
					src.loc=locate(487,460,13)
					src.Voided=0
					src.client.SaveChar()
					del src*/
		if(!src.MachinaMod && !(src.Race in list("Android","Bio Android","Changeling","Majin","Dragon","Popo"))) //These races do not need Oxygen and thus this prevents Oxygen code from running.
			if(istype(Q,/turf/Special/Stars)||istype(Q.loc,/area/Outside/Planet/Earth/Underwater)||istype(Q.loc,/area/Outside/Planet/AlienOcean/AOUnderwater)||istype(Q.loc,/area/Outside/Planet/Vegeta/VegetaUnderwater)||istype(Q.loc,/area/Outside/Planet/Namek/NamekUnderwater)||istype(Q.loc,/area/Outside/Planet/Sanctuary/SanctuaryUnderwater)||istype(Q.loc,/area/Outside/Planet/Ice/IceUnderwater)||istype(Q.loc,/area/Outside/Planet/Arconia/ArconiaUnderwater))
				var/eqip=0
				src.Diving=1
				for(var/obj/Items/Tech/SpaceMask/SM in src)
					if(SM.suffix)
						eqip=1
/*						if(prob(50))
							SM.Oxygen-=sqrt(40/src.Skillz["Oxygen"]["Level"])
							if(prob(50))
								src.SkillUP("Oxygen",0.25)
							if(prob(25))
								src.SkillUP("Oxygen",0.5)
						if(SM.Oxygen<=0)
							SM.Equip(src)
							src<<"[SM] is out of oxygen!"*/

				for(var/obj/Skills/Rank/Shield/SM in src)
					if(SM.BuffUsing)
						eqip=1
				if(eqip==0)
					src.SkillUP("Oxygen",0.15)
					if(prob(1))
						src.SkillUP("Swim",1)
						src.SkillUP("Oxygen",1.5)
					if(prob(10))src.SkillUP("Swim",0.15)
					if(prob(10))src.SkillUP("Oxygen",1)
					Base+=0.375*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*WeightFormula(1)*EXP/1000*0.01
					if(src.Race=="Kurama")
						src.trans["1give"]+=0.375*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*WeightFormula(1)*EXP/1000*0.01
					EnergyMax+=0.00525*EnergyMod*EnergyGains*src.PlayerEnergyGains
					if(prob(25))src.SkillUP("Oxygen",0.5)
					if(src.SpiralResistance!=2)
						src.Oxygen-=sqrt(80/src.Skillz["Oxygen"]["Level"])
					if(src.Oxygen<1)
						src.Health-=5/(src.Skillz["Oxygen"]["Level"]/3)
						src.Energy*=0.95
						src.ManaAmount-=5
						if(src.Health<0)
							src.Death(null,"lacking proper oxygen!")
				else if(eqip==1)
					if(prob(1))src.SkillUP("Swim",2)
					if(prob(10))src.SkillUP("Swim",0.5)

					if(!src.KO&&src.Oxygen<src.MaxOxygen)
						src.Oxygen=min(src.Oxygen+(rand(4,10)),src.MaxOxygen)

			else
				src.Diving=0
				if(!src.KO&&src.Oxygen<src.MaxOxygen)
					src.Oxygen=min(src.Oxygen+(rand(5,10)),src.MaxOxygen)
		else
			if(istype(Q.loc,/area/Outside/Planet/Earth/Underwater)||istype(Q.loc,/area/Outside/Planet/AlienOcean/AOUnderwater)||istype(Q.loc,/area/Outside/Planet/Vegeta/VegetaUnderwater)||istype(Q.loc,/area/Outside/Planet/Namek/NamekUnderwater)||istype(Q.loc,/area/Outside/Planet/Sanctuary/SanctuaryUnderwater)||istype(Q.loc,/area/Outside/Planet/Ice/IceUnderwater)||istype(Q.loc,/area/Outside/Planet/Arconia/ArconiaUnderwater))
				src.Diving=1


		if(!Flying)
			var/hahalol
			for(var/mob/P in range(1,src))
				if(P.Grab==src)
					hahalol=1
			if(src.Stance=="Ripple"&&src.StanceActive==1)
				hahalol=1
			if(src.GateNumber>=6)
				hahalol=1
			if(src.Berserkering&&src.BerserkerMod>=0)
				hahalol=1
			if(!hahalol)
				if(istype(Q,/turf/Waters)||istype(Q,/turf/Special/Ichor_Water)||istype(Q,/turf/Special/Midgar_Ichor))
					if(istype(Q,/turf/Waters/Water7) && !src.FireShield)
						if(global.JinxMap)
							if(src.Race!="Demon"||src.Race!="Android"||src.Race!="Changeling"||src.Race!="Nobody")
								if(src.Race=="Half Demon")
									src.Health-=0.25
								else
									src.Health-=0.5
						else
							if(src.Race!="Demon"||src.DevilFruitType!="Ex")
								if(src.Spawn=="Hell")
									src.Burning+=0.02
								else
									src.Burning+=0.05
								spawn()src.Burning_Check()
					if(istype(Q,/turf/Special/Ichor_Water) && !src.FireShield)
						src.Poison+=0.05
						spawn()src.Poisoned_Check()
					if(istype(Q,/turf/Waters/WaterD) && !src.FireShield)
						src.Poison+=0.15
						spawn()src.Poisoned_Check()
					if(istype(Q,/turf/Special/Midgar_Ichor) && !src.FireShield)
						src.Poison+=0.05
						spawn()src.Poisoned_Check()
					if(istype(Q,/turf/Special/Midgar_IchorWall) && !src.FireShield)
						src.Poison+=0.05
						spawn()src.Poisoned_Check()
					if(istype(Q,/turf/Special/MidgarIchorW) && !src.FireShield)
						src.Poison+=0.05
						spawn()src.Poisoned_Check()
					if(istype(Q,/turf/Special/MidgarIchorE) && !src.FireShield)
						src.Poison+=0.05
						spawn()src.Poisoned_Check()
					if(istype(Q,/turf/Special/MidgarIchorN) && !src.FireShield)
						src.Poison+=0.05
						spawn()src.Poisoned_Check()
					if(istype(Q,/turf/Special/MidgarIchorS) && !src.FireShield)
						src.Poison+=0.05
						spawn()src.Poisoned_Check()
					if(Swim==0)

						src.RemoveWaterOverlay()
						spawn()src.overlays+=image('WaterOverlay.dmi',"[Q.icon_state]")
					Swim=1
					src.LOLWUT()
					if(!src.KO)
						if(src.FruitEaten&&src.Energy < (src.EnergyMax/2))
							src.Unconscious(null,"fatigue due to coming into contact with a body of water! They will drown if not rescued!")
						else
							var/amounttaken=src.EnergyMax/(35*src.Skillz["Swim"]["Level"])
							if(src.Energy>amounttaken)
								if(Q.Shallow==1)
									amounttaken=0
								if(Class=="Poseidon"||Class=="Hemera"||Class=="Pontus"||Class=="Nyx"||src.Fishman)
									amounttaken=0
								src.Energy-=amounttaken
								if(Q.Shallow==0)
									src.SkillUP("Swim",0.1)
									if(prob(3))src.SkillUP("Swim",0.05)
//									if(prob(10))src.SkillUP("Swim",3)
									if(prob(15))
										src.SkillUP("Oxygen",0.15)
										src.SkillUP("Swim",0.15)
									if(prob(15))src.SkillUP("Oxygen",0.25)
									Base+=0.075*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*WeightFormula(1)*EXP/1000*0.01
									if(src.Race=="Kurama")
										src.trans["1give"]+=0.075*sqrt(sqrt(Gravity))*GetPowerRank(2)*(Gains/100)*BaseMod*WeightFormula(1)*EXP/1000*0.01*20
									EnergyMax+=0.00105*EnergyMod*EnergyGains*src.PlayerEnergyGains
								//	EnergyMax+=0.00075*EnergyMod*EnergyGains
								else if(Q.Shallow==1)
									src.SkillUP("Swim",0.001)
//									if(prob(1))src.SkillUP("Swim",0.1)
//									if(prob(10))src.SkillUP("Swim",0.5)
									//Base+=0.02*sqrt(sqrt(sqrt(Gravity)))*GetPowerRank(2)*(Gains/100)*BaseMod*WeightFormula(1)*EXP/1000*0.01
							else
								src.Unconscious(null,"fatigue due to swimming! They will drown if not rescued!")
			//						src.Health=99
					else
						if(!src.MachinaMod && !(src.Race in list("Android","Bio Android","Changeling","Majin","Dragon")))

		//						if(src.IronLung==1)
		//							return
							if(prob(50))
								Oxygen-=sqrt(90/src.Skillz["Oxygen"]["Level"])
								src.SkillUP("Oxygen",0.25)
							if(Oxygen<-100)
								if(prob(50))src.Death(null,"drowning!")
				else
					if(Swim==1)
						src.RemoveWaterOverlay()
					Swim=0
		else
			if(Swim==1)
				src.RemoveWaterOverlay()
				Swim=0
		if(gravityy)src.Gravity=gravityy
		else src.Gravity=GetPlanetGravity(src.z)
		if(temperatures||src.Temperature)
			if(src.TemperatureLock==0)
				src.Temperature=temperatures
			var/TemperatureDamage=src.Temperature
			if(src.TemperatureReducer)
				if(src.TemperatureReduceType==temperaturestype)
					TemperatureDamage*=0.5
			if(src.TemperatureTolerance)
				if(src.TemperatureToleranceType==temperaturestype||src.TemperatureToleranceType=="Both")
					TemperatureDamage-=src.TemperatureTolerance
			if(TemperatureDamage<0)
				TemperatureDamage=0
			if(!src.PureRPMode)
				if(temperaturestype=="Toxic")
					src.Poison+=TemperatureDamage
				else if(temperaturestype=="ThinAtmo")
					src.Oxygen-=0.5
				else
					src.Health-=(TemperatureDamage)
		if(istype(Q.loc,/area/Outside/Planet/Void))
			src.Gravity=10000
		if(src.Gravity>src.GravityMastered && !istype(Q.loc,/area/Outside/Planet/HBTC) && src.z!=10&&src.Gravity<9999)
			if(src.Gravity>src.GravityMastered*10)
				src.Health-=((src.Gravity/src.GravityMastered)/5)
				src.GravityMastered+=src.GravityMod*sqrt(src.Gravity/5)*0.005
//				if(src.Health>=-100)
//					src.Death(null,"was crushed to death!")
			else
				src.GravityMastered+=src.GravityMod*sqrt(src.Gravity/5)*0.002
				src.EXP+=((EXPGains/100)*0.02)*src.PlayerEXPgains*src.PlayerEXPgains*src.PlayerEXPgains
			src.Health-=((src.Gravity/src.GravityMastered)/7.5)
/*		if(src.Temperature<10||src.Temperature>10)
			var/TemperatureDamage
			if(src.Temperature<10)
				TemperatureDamage=(10-src.Temperature)
			if(src.Temperature>10)
				TemperatureDamage=(src.Temperature-10)
			if(src.TemperatureReducer)
				if(src.Temperature<10&&src.TemperatureReduceType=="Cold")
					TemperatureDamage*=0.5
				else if(src.Temperature>10&&src.TemperatureReduceType=="Heat")
					TemperatureDamage*=0.5
			if(src.TemperatureTolerance)
				if(src.Temperature<10&&src.TemperatureToleranceType=="Cold")
					TemperatureDamage-=src.TemperatureTolerance
				else if(src.Temperature>10&&src.TemperatureToleranceType=="Heat")
					TemperatureDamage-=src.TemperatureTolerance
				else if(src.TemperatureToleranceType=="Both")
					TemperatureDamage-=src.TemperatureTolerance
			if(TemperatureDamage<0)
				TemperatureDamage=0
			if(!src.PureRPMode)
				src.Health-=(TemperatureDamage)*/
/*			if(src.Health<=-100)
				if(prob(50))
					if(src.Temperature>10)
						src.Death(null,"burning up!")
					if(src.Temperature<10)
						src.Death(null,"froze to death!")*/
		if(istype(Q.loc,/area/Outside/Planet/HBTC))
			if(!src.HBTCCounter)
				src<< "You have entered the Room of Spirit and Time. You can spend a total of 2 hours in here per character before you're locked away in here for eternity."
			src.HBTCCounter+=1
			src.Age+=0.0005
			if(src.HBTCCounter==3000)
				src<< "You have spent a half an hour in here total."
			if(src.HBTCCounter==6000)
				src<< "You have used up half your total time."
			if(src.HBTCCounter==11000)
				src<< "You're running out of time. Better exit."
			if(src.HBTCCounter==12000)
				src<< "You have run out of time, and can no longer exit of your own accord."
				src.HBTCLock=1

		if(src.Medkitted)
			src.Medkitted--
			spawn()src.Recover("Injury",(1.25*1000))
			spawn()src.Recover("Health",0.5)

		if(src.PercentagePower)
			if(prob(75))
				src.Health-=(src.PercentagePower*0.25)

/*		if(src.BuffPotion>0&&!src.PureRPMode)
			src.BuffPotion--
			if(src.BuffPotion==0)
				if(src.StrengthPotion==1)
					src.StrengthMultiplier/=1.25
					src.StrengthPotion=0
				else if(src.StrengthPotion==2)
					src.StrengthMultiplier/=1.40
					src.StrengthPotion=0
				else if(src.ForcePotion==1)
					src.ForceMultiplier/=1.25
					src.ForcePotion=0
				else if(src.ForcePotion==2)
					src.ForceMultiplier/=1.40
					src.ForcePotion=0
				else if(src.EndurancePotion==1)
					src.EnduranceMultiplier/=1.25
					src.EndurancePotion=0
				else if(src.EndurancePotion==2)
					src.EnduranceMultiplier/=1.40
					src.EndurancePotion=0
				else if(src.ResistancePotion==1)
					src.ResistanceMultiplier/=1.25
					src.ResistancePotion=0
				else if(src.ResistancePotion==2)
					src.ResistanceMultiplier/=1.40
					src.ResistancePotion=0
				else if(src.OffensePotion==1)
					src.OffenseMultiplier/=1.25
					src.OffensePotion=0
				else if(src.OffensePotion==2)
					src.OffenseMultiplier/=1.40
					src.OffensePotion=0
				else if(src.DefensePotion==1)
					src.DefenseMultiplier/=1.25
					src.DefensePotion=0
				else if(src.DefensePotion==2)
					src.DefenseMultiplier/=1.40
					src.DefensePotion=0*/

		if(!src.PureRPMode)
/*			if(src.Poison>0)
				if(prob(25))
					src.Poison-=0.01
				if(src.Poison<=0)
					src.Poison=0
					src.Antidote=0
				if(src.Antidote>src.Poison)
					src.Antidote=src.Poison
				if(prob(50))
					if(src.AlienRacialPassive!="HoneyBadger"&&!src.SpiralResistance)
						src.Health-=(src.Poison-src.Antidote)
				if(src.Antidote)
					src.Poison-=0.1
				if(src.KO && src.Health<=-100)
					src.Death(null, "being poisoned!")
				if(prob(0.01*src.Regeneration*src.RegenerationMultiplier))
					src.Poison=0
					src<< "You have naturally recovered from being poisoned."

			if(src.Burning>0)
				if(src.Burning<=0)
					src.Burning=0
				if(prob(50))
					if(src.AlienRacialPassive!="HoneyBadger"&&!src.PureRPMode&&!src.SpiralResistance||src.BlazingWrath)
						src.Health-=(src.Burning)
				if(src.Burning&& src.BlazingWrath!=1)
					src.Burning-=0.009*src.Regeneration
				if(prob(0.05*src.Regeneration*src.RegenerationMultiplier) && src.BlazingWrath!=1)
					src.Burning=0
					src<< "You manage to put out the flames!"
				if(src.BlazingWrath)
					if(prob(50))
						src.Burning+=0.01
				if(src.BurningShot)
					if(prob(85))
						src.Burning+=0.025*src.BurningShot*/

/*			if(src.EndBreak && prob(10))
				src.EndBreak-=0.50
				if(src.EndBreak>0&&src.Endbroken==0)
					src.EnduranceMultiplier/=1.2
					src.Endbroken=1
				else if(src.EndBreak==0)
					src.EnduranceMultiplier*=1.2
					src.Endbroken=0*/

/*			if(src.Chilled && prob(10))
				src.Chilled-=0.50
				if(src.Chilled>0&&src.SpeedDown==0)
					src.SpeedMultiplier/=1.2
					src.SpeedDown=1
				else if(src.Chilled==0)
					src.SpeedMultiplier*=1.2
					src.SpeedDown=0

			if(src.ElecShock>0 && prob(75))
				src.ElecShock-=0.5
				if(prob(50))
					src.ElecShock-=5
				if(src.ElecShock<=0)
					src.Frozen=0*/

			if(src.Stoneskin>0)
				src.Stoneskin-=1
				if(src.Stoneskin==0&&src.Stoneskinned)
					if(src.Stoneskinned=="Stoneskin")
						src.EnduranceMultiplier/=1.2
						src.Stoneskinned=0
					else if(src.Stoneskinned=="SearingHeart")
						src.StrengthMultiplier/=1.2
						src.Stoneskinned=0
					else if(src.Stoneskinned=="OceanMind")
						src.ForceMultiplier/=1.2
						src.Stoneskinned=0
					else if(src.Stoneskinned=="ZephyrVision")
						src.OffenseMultiplier/=1.1
						src.DefenseMultiplier/=1.1
						src.Stoneskinned=0
//				src.Stoneskin-=1

//		if(src.Momentum<0)
//			src.Momentum=0

			if(src.PotionCD>0)
				src.PotionCD-=1

			if(src.TemperatureReducer>0)
				src.TemperatureReducer-=1
			if(src.TemperatureLock>0)
				src.TemperatureLock-=1

		if(src.AFKTimer>0)
			src.AFKTimer-=1
			if(src.AFKTimer==0)
				src.overlays+=usr.AFKIcon
				for(var/mob/E in hearers(12,usr))
					if(E.Timestamp)
						E<<"<font color=red>[time2text(world.timeofday,"(hh:mm:ss)")]<font color=#D344E3>[src] has gone AFK!"
						Log(E.ChatLog(),"<font color=green>[src][src.key] has gone AFK!")
					else
						E<<"<font color=#D344E3>[src] has gone AFK!"
						Log(E.ChatLog(),"<font color=green>[src][src.key] has gone AFK!")

		if(prob(60))
			if(src.Race=="Makyo"||src.Race=="Demon"||src.Class=="Hellspawn"||src.Race=="Makaioshin"||src.Race=="Half Demon")
				if(prob(30))
					if(MakyoStar)
						if(src.Race=="Makyo")
							if(MakyoPowerBoost==0)
								src.StarYear=Year
								if(src.AscensionsUnlocked==1)
									src.PlusPower+=5000000
								if(src.AscensionsUnlocked==2)
									src.PlusPower+=15000000
								if(src.AscensionsUnlocked==3)
									src.PlusPower+=45000000
								src.Anger=src.AngerMax+0.5
								MakyoPowerBoost=1
						if(src.Race=="Demon"||src.Race=="Makaioshin"||src.Class=="Hellspawn"||src.Race=="Half Demon")
							if(MakyoPowerBoost==0)
								src.StarYear=Year
								src.PlusPower+=100000*(0.15*Year)
								src.MakyoPowerBoost=1
					else
						if(src.StarYear)
							if(src.Race=="Makyo")
								if(src.AscensionsUnlocked==1)
									src.PlusPower-=5000000
								if(src.AscensionsUnlocked==2)
									src.PlusPower-=15000000
								if(src.AscensionsUnlocked==3)
									src.PlusPower-=45000000
								src.Anger=0
								src.MakyoPowerBoost=0
								src.StarYear=0
							if(src.Race=="Demon"||src.Race=="Makaioshin"||src.Class=="Hellspawn"||src.Race=="Half Demon")
								src.PlusPower-=100000*(0.15*StarYear)
								src.Power_Multiplier-=src.MakyoPowerMultiAmount
								src.MakyoPowerMultiAmount=0
								src.MakyoPowerBoost=0
								src.StarYear=0
			if(src.z!=7&&src.z!=13&&src.z!=21)
				for(var/obj/Curse/x in src)
					if(src.Power*src.Energy/3>x.Power)
						src<<"You break the curse due to your immense power!"
						del(x)
					else
						src.loc=locate(55,40,7)
						src<<"The curse takes it toll and you are sent to Hell!"
						break
			/*for(var/obj/PlanetBind/V in src)
				if(src.z!=V.Planet)
					if(p.Planet==1)
						src.x=265
						src.y=260
						src.z=1
					else if(p.Planet==2)
						src.x=92
						src.y=390
						src.z=2
					else if(p.Planet==3)
						src.x=290
						src.y=250
						src.z=3
					else if(p.Planet==4)
						src.x=250
						src.y=250
						src.z=4
					else if(p.Planet==5)
						src.x=246
						src.y=215
						src.z=5 */
			if(Noobs.Find(src.key))
				Body=0.001
				if(src.z!=3)
					src.loc=locate(250,250,3)
					src<<"You are an OOC threat and are condemed to hell!"
			else
				if(Decline>=(50+global.Year)) //This is temp code for one wipe only to get the insane decline values down.
					Decline=50+global.Year
				if(Age>=PrimeAge)
					Body=1
				else
					if(PrimeAge<=0.1)
						PrimeAge=0.1
					Body=Age/PrimeAge
				if(Body<0.01)
					Body=0.01
				if(Age>=Decline) Body=1-((Age-Decline)*Decline_Rate*0.05)
/*				if(Dead&&NecroRisen==0)

					if(!(src.z in list(1,2,3,4,5,6,7,8,10,21,26,27)))
						if(src.Energy/src.EnergyMax<0.25)
							src<<"You have been returned to The Afterlife as you are unable to maintain your form elsewhere!"
						//	src.loc=locate(441,467,13)
							src.loc=locate(200,200,13)
							src.Energy=src.EnergyMax*/

				if(Dead && !HeartHero)
					if(KeepBody)
						Body=Age/PrimeAge*0.75
						if(Body<0.01)
							Body=0.01
						if(Age>=PrimeAge)
							Body=0.75
					else
						Body=Age/PrimeAge*0.15
						if(Body<0.01)
							Body=0.01
						if(Age>=PrimeAge)
							Body=0.15

			//Get_Refire()
			var/Base=SpeedMod
			var/Az=sqrt(sqrt(sqrt((src.SpeedMod*src.SpeedMultiplier))))
			var/Lawl=Base+Az
			Refire=25/Lawl
			for(var/obj/Money/M in src) M.suffix="[Commas(M.Level)] Resources"

			if(src.KaiokenActive||src.SuperKaioken)
				if(!src.SuperKaioken)
					src.TotalInjury+=src.KaiokenLevel/src.KaiokenMastery*0.5*rand(1,6)
				else if(src.SuperKaioken)
					src.TotalInjury+=2*rand(1,6)
				if(src.KO&&src.KaiokenActive)
					src.SkillX("Kaioken",x)
				if(src.KO&&src.SuperKaioken)
					src.SkillX("SuperKaioken",x)
			if(src.InMugetsu&&!src.PureRPMode)
				if(prob(30))
					src.Base*=0.99
/*			if(src.EightGates&&!src.PureRPMode)
				var/GateDrain=0
				if(src.GateNumber==8 && src.Energy<=src.EnergyMax/4)
					src.Death(null, "strain from the final gate!")
					src.GateNumber=0
					src.EightGates=0
				if(src.EightGates && src.GateNumber<8)
					if(src.GateNumber>=3 && src.GateNumber<7)
						if(src.GateNumber==3 && src.GatesUnlocked<6)
							GateDrain=(src.GateNumber/src.GatesUnlocked)/2
						if(src.GateNumber==4 && src.GatesUnlocked<6)
							GateDrain=(src.GateNumber/src.GatesUnlocked)/1.5
						if(src.GateNumber==5 && src.GatesUnlocked<6)
							GateDrain=(src.GateNumber/src.GatesUnlocked)
						if(src.GateNumber==6)
							GateDrain=0.5
					if(src.GateNumber==7)
						if(prob(30))
							src.GatesBaseLost=src.Base*0.01
					src.Health-=GateDrain
					if(src.Health<=5)
						for(var/obj/Skills/MartialArts/Eight_Gates/x in src)
							if(x.BuffUsing)
								src.BuffX("TrueEightGates",x)
								break */

			if(src.EightGates&&!src.PureRPMode)
				var/GateDrain=0
				if(src.GateNumber==8 && src.Energy<=src.EnergyMax/4)
					src.Death(null, "strain from the final gate!")
					src.GateNumber=0
					src.EightGates=0
				if(src.EightGates)
					if(src.GateNumber)
						GateDrain=0.1*src.GateNumber
					if(prob(80))
						src.Health-=GateDrain
					if(src.Energy<=src.EnergyMax/20)
						for(var/obj/Skills/MartialArts/Eight_Gates/x in src)
							if(x.BuffUsing)
								src.BuffX("TrueEightGates",x)
								break
			if(src.TheHunger&&!src.PureRPMode)
				if(prob(50))
					src.Health-=0.5
					if(prob(20))
						src.Health-=0.75
			if(src.CursedBeta=="Death"&&!src.PureRPMode)
				if(prob(70))
					src.Health-=0.25
					if(prob(40))
						src.Health-=0.5

		if(prob(95) && src.TheWorld)
			src.ManaAmount-=8
			for(var/obj/Skills/Rank/TheWorld/x in src)
				if(x.Using)
					if(src.ManaAmount<10||src.KO)
						src.SkillX("TheWorld",x)
						break
		if(prob(95) && src.QuicksilverTime)
			src.ManaAmount-=3
			for(var/obj/Skills/Extra/Quicksilver/x in src)
				if(x.Using)
					if(src.ManaAmount<10||src.KO)
						src.SkillX("QuicksilverTime",x)
						break
		if(prob(95) && src.KageShibari)
			src.ManaAmount-=20/src.KageMastery
			src.KageMastery+=0.25
			if(src.DoubleKageDrain)
				src.ManaAmount-=25/src.KageMastery/2
			if(src.TripleKageDrain)
				src.ManaAmount-=55/src.KageMastery/4
			for(var/obj/Skills/Extra/ShadowBind/x in src)
				if(x.Using)
					if(src.ManaAmount<10||src.KO)
						src.SkillKoon("ShadowBind",x)
						break
		if(prob(95) && src.Silvermists)
			src.Health+=2.25
			src.Energy+=1.25
			if(src.TotalInjury<1)
				src.TotalInjury=0
			src.TotalInjury-=2.25
			if(src.TotalFatigue<1)
				src.TotalFatigue=0
			src.TotalFatigue-=1.25
			if(src.Class=="True Ancestor")
				return
			else
				src.TotalEssence-=2.25
			for(var/obj/Skills/Extra/Silvermists/x in src)
				if(x.Using)
					if(src.TotalEssence<15||src.KO)
						src.SkillX("Silvermists",x)
						break
/*		if(prob(95) && src.AbsorbKarma)
			src.ManaAmount+=10
			for(var/obj/Skills/Extra/AbsorbKarma/x in src)
				if(x.Using)
					if(src.ManaAmount<10||src.KO||src.KarmaEnergy<25)
						src.SkillX("AbsorbKarma",x)
						break*/
		if(src.DriveCounter<=30&&!src.DriveActive)
			src.DriveCounter+=1
		if(prob(95) && src.DriveActive)
			src.DriveCounter-=1
			if(src.DriveCounter<0)
				src.DriveCounter=0
			/*for(var/obj/Skills/Buffs/DriveForm/x in src)
				if(x.BuffUsing)
					if(src.DriveCounter<=2||src.KO)
						src.BuffX("DriveForm",x)
						break*/
		if(prob(95) && src.TheWorldRequiem)
			src.ManaAmount-=5
			for(var/obj/Skills/Rank/TheWorldRequiem/x in src)
				if(x.Using)
					if(src.ManaAmount<10||src.KO)
						src.SkillX("TheWorldRequiem",x)
						break
		if(prob(95) && src.GER)
			src.ManaAmount-=4
			for(var/obj/Skills/Rank/GoldExperienceRequiem/x in src)
				if(x.Using)
					if(src.ManaAmount<10||src.KO)
						src.SkillX("GER",x)
						break
		if(src.TotalInjury >= 90)
			if(prob(0.1) && !src.PureRPMode)
				src.Death(null, "accumulation of brutal wounds!")
		if(prob(75) && !src.PureRPMode)
			if(src.BijuuActive || src.MadeOfSwords)
				src.Health+=0.025
				if(src.Health > 100)
					src.Health=100
			if(src.FlashOfHope)
				src.Health-=(100/300)
			if(src.ManaInfusing)
				var/amount
				if(src.Enlightenment)
					amount=0.25
				if(src.Nirvana)
					amount=0.5
				for(var/mob/m in view(1))
					if(src==m)
						amount/=5
					m.ManaAmount-=amount
					if(m.ManaAmount<0)
						var/dif = m.ManaAmount*(-1)
						m.Health-=dif
						m.ManaAmount=0
			/*if(src.WrathArmor)
				src.Anger-=0.02
				if(src.Anger <= 1.5)
					for(var/obj/Skills/Buffs/WrathArmor/w in src)
						if(w.BuffUsing)
							src.BuffX("WrathArmor", w)
			if(src.WrathShield)
				src.Anger-=0.02
				if(src.Anger <= 2)
					for(var/obj/Skills/Buffs/WrathShield/w in src)
						if(w.BuffUsing)
							src.BuffX("WrathShield", w)
			if(src.WrathBlade)
				src.Anger-=0.02
				if(src.Anger <= 2)
					for(var/obj/Skills/Buffs/WrathBlade/w in src)
						if(w.BuffUsing)
							src.BuffX("WrathBlade", w)
			if(src.MantraArms)
				src.Anger-=0.02
				if(src.Anger <= 1.5)
					for(var/obj/Skills/Buffs/MantraArms/m in src)
						if(m.BuffUsing)
							src.BuffX("MantraArms", m)
			if(src.WrathOfDeva)
				src.Anger-=0.08
				if(src.Anger <= 3)
					for(var/obj/Skills/Buffs/WrathOfDeva/w in src)
						if(w.BuffUsing)
							src.BuffX("WrathOfDeva", w)*/
			if(src.LunarWrath&&!src.PureRPMode)
				src.LunarWrath++
				if(src.LunarWrath>100)
					if(prob(10))
						src.LunarWrath++
				if(src.LunarWrath>600)
					if(prob(10))
						src.LunarWrath+=10
				if(src.LunarWrath>1200)
					if(prob(10))
						src.LunarWrath+=10
				if(src.LunarWrath>1800)
					if(prob(10))
						src.LunarWrath+=10
				if(src.LunarWrath>3000)
					if(prob(10))
						src.LunarWrath+=50
				if(prob(src.LunarWrath/120))//every 12 seconds = 1% chance to fail
					src.LunarWrathFail()
			if(src.Anger < 1 && !src.Mystic)
				src.Anger=0
			if(src.Ripper)
				if(src.MachinaMod < 1)
					src.MachinaMod=1
				src.ManaAmount-=((1/10)/src.MachinaMod)*1.5
				if(src.ManaAmount <= 0)
					src.ManaAmount=0
				if(src.ManaAmount == 0)
					for(var/obj/Skills/Ripper/r in src)
						if(r.BuffUsing)
							src.BuffX("Ripper", r)
			if(src.BladeMode)
				src.ManaAmount-=1
				if(src.ManaAmount < 0)
					src.ManaAmount=0
				if(src.ManaAmount==0)
					for(var/obj/Skills/BladeMode/b in src)
						if(b.BuffUsing)
							src.BuffX("BladeMode", b)
			if(src.DarkMode)
				src.DarkMode--
				if(src.DarkMode<=0)
					src.DarkMode=0
					src.DarkModeCD=1
					spawn(3000)
						src.DarkModeCD=0
					src << "Your Dark Mode has ended."
					src.overlays-='blackflameaura.dmi'
			if(src.Kamui)
				src.Health-=1.5/(src.SexyMod*max(1, src.LifeFiberFusion))
				if(src.Health < 0)
					src.Health=0
				if(src.Health==0)
					src.Unconscious()

			if(src.ssj["active"]==2 && src.Class=="Legendary" && src.PlusPower<=500000000)
				src.ssj["2give"]+=1000000
				src.PlusPower+=1000000
			if(src.ssj["active"]>0)
				//ssj["[src.ssj["active"]]mastery"]+=1/sqrt(ssj["[src.ssj["active"]]mastery"])/(20*ssj["active"])
				//ssj["[src.ssj["active"]]mastery"]=min(ssj["[src.ssj["active"]]mastery"],100)
				if((src.ssj["active"]>=1))
					var/drainE
					var/drainF
					if(src.ssj["1mastery"]==25)
						drainE=((src.EnergyMax*1.5*(1/ssj["[src.ssj["active"]]mastery"]))/(100/ssj["active"])*0.75)
						drainF=((src.EnergyMax*0.15*(1/ssj["[src.ssj["active"]]mastery"]))/(100/ssj["active"])*0.75)
						//src.SaiyanPUNerf=0.1
					if(src.ssj["1mastery"]==50)
						drainE=(((src.EnergyMax*1.5*(1/ssj["[src.ssj["active"]]mastery"]))/(100/ssj["active"])*0.75)*0.5)
						drainF=(((src.EnergyMax*0.15*(1/ssj["[src.ssj["active"]]mastery"]))/(100/ssj["active"])*0.75)*0.5)
						//src.SaiyanPUNerf=0.25
						/*if(!locate(/obj/Skills/Buffs/SSjGrade2, src))
							src.contents+=new/obj/Skills/Buffs/SSjGrade2
						if(!locate(/obj/Skills/Buffs/SSjGrade3, src))
							src.contents+=new/obj/Skills/Buffs/SSjGrade3
							src << "You learn to pour more of your power into the Super Saiyan form at the cost of mobility and fatigue."*/
					if(src.ssj["1mastery"]==100)
						drainE=(((src.EnergyMax*1.5*(1/ssj["[src.ssj["active"]]mastery"]))/(100/ssj["active"])*0.75)*0.5)
						drainF=(((src.EnergyMax*0.15*(1/ssj["[src.ssj["active"]]mastery"]))/(100/ssj["active"])*0.75)*0.5)
						//src.SaiyanPUNerf=1
					if(src.SSjGrade2)
						drainE*=1.5
						drainF*=1.5
					if(src.SSjGrade3)
						drainE*=2
						drainF*=2
					if(src.ssj["active"]==2)
						drainE*=1.2
						drainF*=1.2
						//src.SaiyanPUNerf=0.75
					if(src.ssj["active"]==3)
						drainE*=1.2
						drainF*=1.2
						//src.SaiyanPUNerf=0.25
					src.Energy-=drainE
					src.TotalFatigue+=drainF
					if(src.Energy<(src.EnergyMax/20))
						src.Revert()
						src<<"The strain of Super Saiyan and your low energy forced you to revert!"
				if(src.ssj["active"]==3 && !src.Dead)
					//SSJ3 HEALTH DRAINZ
					src.Health-=min(0.01, (50/src.ssj["[src.ssj["active"]]mastery"]))
			if(src.trans["active"]==2&&src.Race=="Human")
				masteries["[src.trans["active"]]mastery"]+=1/sqrt(masteries["[src.trans["active"]]mastery"])/(20*trans["active"])
				src.Energy-=(src.EnergyMax*1.5*(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])
			if(src.trans["active"]==1 && src.Race=="Demi")
				masteries["[src.trans["active"]]mastery"]+=1/sqrt(masteries["[src.trans["active"]]mastery"])/(15)
			//	src.Health-=((10*(1/masteries["[src.trans["active"]]mastery"]))/1)
				src.Energy-=(src.EnergyMax*1.5*(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])
			if(src.trans["active"]>0 && src.Race=="Hollow")
				if(src.trans["1mastery"]>=100)
					src.trans["1mastery"]=100
				if(!(src.trans["active"]==1&&src.trans["1mastery"]>=100))
					src.Energy-=(src.EnergyMax*1.5*(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])
					masteries["[src.trans["active"]]mastery"]+=1/sqrt(masteries["[src.trans["active"]]mastery"])/(15)
					if(src.Energy<(EnergyMax/20)||src.Health<5)
						src.Revert()
						src<<"The strain of a transformed state and your low energy forced you to revert!"


			if(src.trans["active"]>0 && src.Race=="Kaio")
				masteries["[src.trans["active"]]mastery"]+=1/sqrt(masteries["[src.trans["active"]]mastery"])/(15)
				if(!(src.trans["active"]==1&&src.trans["1mastery"]==100))
					src.ManaAmount-=(src.ManaMax*1.5*(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])
					if(src.ManaAmount<=5)
						src.Revert()
						src<<"The strain of Radiance and your low mana forced you to revert!"
			if(src.trans["active"]>0 && src.Race=="Human")
				masteries["[src.trans["active"]]mastery"]+=1/sqrt(masteries["[src.trans["active"]]mastery"])/(15)
				if(src.Energy<(EnergyMax/20))
					src.Revert()
					src<<"The strain of High Tension and your low energy forced you to revert!"
				if(src.trans["active"]>=3)
					src.Energy-=(src.EnergyMax*1.5*(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])
					if(src.trans["active"]==4)
						src.Health-=((10*(1/masteries["[src.trans["active"]]mastery"]))/0.5)
			if(src.trans["active"]>0 && src.Race=="Namekian")
				masteries["[src.trans["active"]]mastery"]+=1/sqrt(masteries["[src.trans["active"]]mastery"])/(15)
				if(!(src.trans["active"]==1&&src.masteries["1mastery"]==100))
					if(src.Energy<(EnergyMax/20))
						src.Revert()
						src<<"The strain of Super Namekian and your low energy forced you to revert!"
					//src.Health-=((2.5*(1/masteries["[src.trans["active"]]mastery"]))/0.5)
					//src.Energy-=(src.EnergyMax*1.5*(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])
			if(src.trans["active"]>0 && src.Race=="Demon"||src.trans["active"]>0 && src.Race=="Half Demon")
				masteries["[src.trans["active"]]mastery"]+=1/sqrt(masteries["[src.trans["active"]]mastery"])/(15)
				if(!(src.trans["active"]==1&&src.masteries["1mastery"]>=100))
					if(src.Energy<(EnergyMax/20))
						src.Revert()
						src<<"The strain of Devil Trigger and your low energy forced you to revert!"
					if(src.trans["active"]>1)
						src.Health-=((1.25*(1/masteries["[src.trans["active"]]mastery"]))/0.5)
			if(src.trans["active"]>0 && src.Race=="Lycan")
				masteries["[src.trans["active"]]mastery"]+=1/sqrt(masteries["[src.trans["active"]]mastery"])/(15)
				if(!(src.trans["active"]==1&&src.masteries["1mastery"]==100))
					src.Health-=((2.5*(1/masteries["[src.trans["active"]]mastery"]))/0.5)
			/*if(src.Visored==1 && src.InVisored==1 && src.VisoredStage==3)
				if(src.MaskDuration<=0 && MaskMastery<100)
					src.overlays-=image('IchigoMask.dmi')
					src.overlays-=image('LisaMask.dmi')
					src.overlays-=image('MashiroMask.dmi')
					src.overlays-=image('KenseiMask.dmi')
					src.SkillX("MaskForm",x)
					src<<"Your Mask times out, forcing it to break and the power vanish!"
				else if(src.MaskMastery<100 && src.MaskDuration>0)
					src.MaskMastery+=0.05
					src.MaskDuration-=1

			*/
		/*	if(src.trans["active"]>0 && src.Race=="Changeling")
				masteries["[src.trans["active"]]mastery"]+=1/sqrt(masteries["[src.trans["active"]]mastery"])/(15*src.trans["active"])
				if(src.trans["active"]>0&&src.masteries["1mastery"]<100)
					src.Energy-=(src.EnergyMax*0.75(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])
				if((src.trans["active"]>1&&src.masteries["2mastery"]<100))
					src.Energy-=(src.EnergyMax*0.75(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])
				if((src.trans["active"]>2&&src.masteries["3mastery"]<100))
					src.Energy-=(src.EnergyMax*0.75(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])
				if((src.trans["active"]>3&&src.masteries["4mastery"]<100))
					src.Energy-=(src.EnergyMax*0.75(1/masteries["[src.trans["active"]]mastery"]))/(100/trans["active"])*/
			if(src.MajinTrans)
				src.Health-=2/(200/src.Health)
			if(src.TimeAlter)
				if(src.TimeAlterType=="Double Accel")
					src.Health-=0.25
				if(src.TimeAlterType=="Triple Accel")
					src.Health-=1
				if(src.TimeAlterType=="Square Accel")
					src.Health-=5
			if(src.GargantaTimer>0)
				src.GargantaTimer-=1
			if(src.LetztStilOn==1)
				if(prob(20))
					src.Health-=0.25 //Drain might need to be increased, IDK since you lose A LOT from this, this rate allows you to stay in Letzt Stil for a little over 10 minutes if you don't get hurt from anything else so if people try to cheese you and run you can fight them.
			for(var/obj/Skills/Buffs/Focus/x in src)
				if(x.BuffUsing)
					if(src.Energy<src.EnergyMax/10||src.KO)
						src.SkillX("Focus",x)
						break
					src.Energy-=round((src.EnergyMax/(x.Level/1))/(15*(EnergyMax/1000)),10)
					x.Skill_Increase(1)
					if(prob(90))src.SkillLeech(x)
				break
			for(var/obj/Skills/ManaInfusion/x in src)
				if(x.BuffUsing)
					if(src.ManaAmount<10||src.KO)
						src.SkillX("ManaInfusion",x)
						break
					sleep(10)
					if(prob(10))
						src.ManaAmount-=1
				break
			for(var/obj/Skills/Buffs/KiBlade/x in src)
				if(x.Using)
					if(src.Energy<src.EnergyMax/10||src.KO)
						src.SkillX("KiBlade",x)
						break
					src.Energy-=round((src.EnergyMax/(x.Level/1))/(15*(EnergyMax/1000)),10)
					x.Skill_Increase(1)
					if(prob(90))src.SkillLeech(x)
				break
			if(prob(50))
				for(var/obj/Skills/Buffs/Expand/x in src)
					if(x.BuffUsing)
						if(src.KO)
							src.SkillX("Expand",x)
							break
						x.Skill_Increase(1)
						if(prob(90))src.SkillLeech(x)
					break

		if(prob(5))
			if(src.Flying)
				for(var/obj/Skills/Fly/x in src)
					src.SkillLeech(x)
			for(var/obj/Skills/Attacks/Beams/x in src)
				if(x.BuffUsing)src.SkillLeech(x)
			if(src.PowerUp||src.PowerDown)
				for(var/obj/Skills/PowerControl/x in src)
					src.SkillLeech(x)
/*		for(var/mob/M in view(10,src))
			if(M!=src)continue
			if(prob(100) && UniversalTrans)
				if(src.ssj["active"]==1 && M.Race=="Saiyan")
					if(prob(20) && M.ssj["unlocked"]<1)
						M.ssj["unlocked"]=1
				if(src.trans["active"]==1 && src.Race=="Human" && M.Race=="Human")
					if(prob(20) && M.trans["unlocked"]<1)
						M.trans["unlocked"]=1
				if(src.ssj["active"]==1 && M.Race=="Human")
					if(prob(20) && M.trans["unlocked"]<1)
						M.trans["unlocked"]=1
				if(src.trans["active"]==1 && src.Race=="Human" && M.Race=="Saiyan")
					if(prob(20) && M.ssj["unlocked"]<1)
						M.ssj["unlocked"]=1*/
		if(src.FusionTimer)
			if(src.PureRPMode==0)
				src.FusionTimer--
			if(src.FusionTimer==0)
				if(src.Fusee)
					var/FusionScanning=0
					for(var/mob/M in world)
						if(M.key=="[src.FusionTarget]")
							src.loc=M.loc
							FusionScanning=1
					if(!FusionScanning)
						src.x=src.PrevX
						src.y=src.PrevY
						src.z=src.PrevZ
						src<<"Your fusion partner is offline. You might not be at their present location when they relog. They should correctly defuse however when they relog."
					src.client.eye=src
					src.FusionTarget=null
					src.Fusee=0

				else
					src.BaseMod=src.FusionBaseModStorage
					src.Base=src.FusionBaseStorage
					if(src.FusionStrStorage)
						src.Strength=src.FusionStrStorage
						src.FusionStrStorage=0
					if(src.FusionEndStorage)
						src.Endurance=src.FusionEndStorage
						src.FusionEndStorage=0
					if(src.FusionSpeedStorage)
						src.SpeedMod=src.FusionSpeedStorage
						src.FusionSpeedStorage=0
					if(src.FusionForceStorage)
						src.Force=src.FusionForceStorage
						src.FusionForceStorage=0
					if(src.FusionResStorage)
						src.Resistance=src.FusionResStorage
						src.FusionResStorage=0
					if(src.FusionOffStorage)
						src.Offense=src.FusionOffStorage
						src.FusionOffStorage=0
					if(src.FusionDefStorage)
						src.Defense=src.FusionDefStorage
						src.FusionDefStorage=0
					if(src.FusionRegenStorage)
						src.Regeneration=src.FusionRegenStorage
						src.FusionRegenStorage=0
					if(src.FusionRecovStorage)
						src.Recovery=src.FusionRecovStorage
						src.FusionRecovStorage=0
					if(src.FusionAngerStorage)
						src.AngerMax=src.FusionAngerStorage
						src.FusionAngerStorage=0
		if(src.Transfering)
//			var/nullify=1
			var/mob/Players/M=src.Transfering
//			src<<"[M] is the contents of src.Transfering."
//			if(istype(M,/mob/Players))
			if(!src.KO)
//				src<<"Passed checking if [M] is in world, and passed checking if user is KOed."
//				if(M.KO==0)
//				src<<"Passed confirming if [M] and user are on same Z plane, and if [M] is KOed."
				if(M in range(10,src))
//					src<<"Passed range check."
					if(src.Energy>src.Energy/10)
//						src<<"[M] is the target."
						//src.Health--
						src.Energy-=src.EnergyMax/500
						M.Energy+=src.EnergyMax/500
						missile('SE.dmi', src, M)
//							nullify=0
//			if(nullify)src.Transfering=null
		if(prob(0.1))
			src.client.SaveChar()
		if(prob(0.1)&&!src.PureRPMode)
			if(src.Overdrive)
				if(src.Class != "Spiral")
					src.Overdrive=0
					src.CyberPower*=0.75
					src.Health=-50
					src.overlays-=image(icon='AurasBig.dmi',icon_state="Kaioken",pixel_x=-32)
					src<<"The circuits within your body lose function, as your power returns to normal. You are greatly exhausted from this."
					if(src.Race!="Android")
						src.Death(null, "short circuiting!")
				else
				{
					src.Overdrive=0
					for(var/obj/Skills/Attacks/GigaDrillBreaker/drill in src)
					{
						del drill
					}
					src.CyberPower = 0
					src.overlays-=image(icon='AurasBig.dmi',icon_state="HT2",pixel_x=-32)
					src.overlays-=image(icon='SpiralAura.dmi',icon_state="",pixel_x=-32)
					src.Death(null, "a heroic sacrifice!");
				}
		if(src.LimitBreaker&&!src.PureRPMode)
			src.LimitBreaker-=1
			if(src.LimitBreaker==0&&prob(0.1))
				src.Unconscious()
				src.Base/=2
				src.BaseMod/=2
				src.PlusPower=0
				src.RecoveryMultiplier/=1.5
				src.RegenerationMultiplier/=1.5
				src.Health=-50
				src.TotalInjury+=(100-src.TotalInjury)/2
				src.overlays-=image(icon='AurasBig.dmi',icon_state="Demi",pixel_x=-32)
				for(var/obj/Skills/LimitBreaker/X in src)
					X.Using=0
				src<<"Your body caves under the added stress, rendering you unable to fight!"
				if(src.TotalInjury>=90)
					src.Death()
		if(src.Defiance)
			src.Defiance-=1
			src.Health-=1
			if(src.Defiance==0)
				src.Unconscious()
				if(src.TotalInjury>=90)
					src.Death()

mob/proc/WeightFormula(var/Wut)
	var/canlift=src.Strength*2+src.Endurance/2*1.5
	var/lifted=1
	if(Wut==2)
		return canlift
	if(Wut==1)
		for(var/obj/Items/Weights/W in src)
			if(W.suffix)
				lifted+=W.Level
		if(!lifted||!canlift)
			return
		var/gain=lifted/canlift*1.5
		if(gain<1)
			gain=1
		if(gain>2)
			gain=2
		return gain
