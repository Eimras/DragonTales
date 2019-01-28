mob
	proc
		DeleteAllRippleSkills()
			for(var/obj/Skills/s in src)
				if(s.type == /obj/Skills/RefineRipple||s.type == /obj/Skills/RebuffOverdrive||s.type == /obj/Skills/ZoomPunch||s.type == /obj/Skills/HealingRipple||s.type == /obj/Skills/HamonHairAttack||s.type == /obj/Skills/TimelyCounter||s.type == /obj/Skills/OverdriveBarrage||s.type == /obj/Skills/SendoWaveKick||s.type == /obj/Skills/UltimateDeepPassOverdrive /*s.type == /obj/Skills/TornadoOverdrive*/||s.type == /obj/Skills/MartialArts/SunlightYellowOverdrive||s.type == /obj/Skills/FinalRipple)
					del s
		ChooseRRKTech()
			var/list/choices = src.GetRRKTechs()
			var/choice=input(src, "What technique do you want to learn?", "Hiten Mitsurugi-ryu Ascension") in choices
			switch(choice)
				if("Kuzuryusen")
					src.StrengthMod*=1.25
					src.Strength*=1.25
					src << "You learn to unleash a devestating nine hit combo: Kuzuryusen!"
					src.contents+=new/obj/Skills/Swords/Kuzuryusen
				if("Soryusen")
					src.OffenseMod*=1.15
					src.Offense*=1.15
					src << "You learn to attack as fluently with your sheath as your blade: Soryusen!"
					src.contents+=new/obj/Skills/Swords/Soryusen
				if("Ryumeisen")
					src.DefenseMod*=1.25
					src.Defense*=1.25
					src << "You learn to halt fighting with body language alone: Ryumeisen!"
					src.contents+=new/obj/Skills/Swords/Ryumeisen
		GetRRKTechs()
			var/list/option=list()
			if(!locate(/obj/Skills/Swords/Kuzuryusen, src))
				option+="Kuzuryusen"
			if(!locate(/obj/Skills/Swords/Soryusen, src))
				option+="Soryusen"
			if(!locate(/obj/Skills/Swords/Ryumeisen, src))
				option+="Ryumeisen"
			return option
		WeaponSoulAscensions()
			if(!src.WeaponSoul)
				src.SoullessAscension()
				return
			if(src.WeaponSoul=="Holy")
				src.HolyBladeAscension()
				return
			if(src.WeaponSoul=="Corrupt")
				src.CorruptEdgeAscension()
				return
			if(src.WeaponSoul=="Dual")
				src.DualWieldAscension()
				return
			if(src.WeaponSoul=="Kusanagi")
				src.KusanagiAscension()
				return
			if(src.WeaponSoul=="Durendal")
				src.DurendalAscension()
				return
			if(src.WeaponSoul=="Masamune")
				src.MasamuneAscension()
				return
			if(src.WeaponSoul=="Triple")
				src.TripleWieldAscension()
				return
			if(src.WeaponSoul=="Calibur")
				src.SoulCaliburAscension()
				return
			if(src.WeaponSoul=="Edge")
				src.SoulEdgeAscension()
				return
			if(src.WeaponSoul=="Muramasa")
				src.MuramasaAscension()
				return
		GetWeaponAscensionReq(var/num)
			var/mod=1+(src.WeaponSoulLevel)
			return num/mod
		SoullessAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1))
				src.ChooseTier2Weapon()
		HolyBladeAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1))
				src.ChooseTier3HolyWeapon()
		CorruptEdgeAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1))
				src.ChooseTier3UnholyWeapon()
		DualWieldAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1))
				src.GetTripleWield()
		KusanagiAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1)&&!locate(/obj/Skills/TierS/LightBringer,src))
				src.GetFinalWeapon()
		DurendalAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1)&&!locate(/obj/Skills/TierS/DawnTreader,src))
				src.GetFinalWeapon()
		MasamuneAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1)&&!locate(/obj/Skills/TierS/SolZenith,src))
				src.GetFinalWeapon()
		TripleWieldAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1)&&!locate(/obj/Skills/TierS/MastersFury,src))
				src.GetFinalWeapon()
		SoulCaliburAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1)&&!locate(/obj/Skills/TierS/SoulSanctum,src))
				src.GetFinalWeapon()
		SoulEdgeAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1)&&!locate(/obj/Skills/TierS/SoulSlayer,src))
				src.GetFinalWeapon()
		MuramasaAscension()
			if(src.GetBPM() >= GetWeaponAscensionReq(1)&&!locate(/obj/Skills/TierS/SoulSanguine,src))
				src.GetFinalWeapon()
		ChooseTier2Weapon()
			if(src.UsingWeaponSoul())
				return
			if(!src.ChoosingWeapon)
				src.ChoosingWeapon=1
				var/list/choices=list("Holy Blade", "Dual Wield", "Corrupt Edge")
				if(KusanagiTaken&&DurendalTaken&&MasamuneTaken)
					choices-="Holy Blade"
				if(DualTaken)
					choices-="Dual Wield"
				if(CaliburTaken&&EdgeTaken&&MuramasaTaken)
					choices-="Corrupt Edge"
				if(choices.len < 1)
					ResetSwords()
					src.ChoosingWeapon=0
					src.ChooseTier2Weapon()
					return
				var/choice
				var/confirm="No"
				while(confirm=="No")
					choice=input(src, "What form will the weapon of your soul take?", "Weapon Soul Ascension") in choices
					if(choice=="Holy Blade")
						confirm=alert(src,"Holy Blades are well balanced and deal critical damage to evil things.  Do you want a Holy Blade?", "Weapon Soul Ascension", "Yes", "No")
					if(choice=="Dual Wield")
						confirm=alert(src,"Dual Wield allows you to wield two swords.  They are fast but hard to use.  These boost you the least but they take up no slots.  Do you want to Dual Wield?", "Weapon Soul Ascension", "Yes", "No")
					if(choice=="Corrupt Edge")
						confirm=alert(src,"Corrupt Edges do huge damage and deal lasting harm.  They will ensure that you are recognized as a demonic presence.  Do you want a Corrupt Edge?", "Weapon Soul Ascension", "Yes", "No")
				if(choice!="Dual Wield")
					src << "Your soul has manifested a [choice] from deep within your soul."
				else
					src << "You learn to draw a second blade from the sea of your soul."
				if(choice=="Holy Blade")
					src.WeaponSoul="Holy"
				if(choice=="Corrupt Edge")
					src.WeaponSoul="Corrupt"
				if(choice=="Dual Wield")
					src.WeaponSoul="Dual"
		ChooseTier3HolyWeapon()
			if(src.UsingWeaponSoul())
				return
			var/list/choices=list("Kusanagi", "Durendal", "Masamune")
			if(KusanagiTaken)
				choices-="Kusanagi"
			if(DurendalTaken)
				choices-="Durendal"
			if(MasamuneTaken)
				choices-="Masamune"
			if(choices.len < 1)
				src.CorruptHolyBlade()
				return
			var/choice
			var/confirm="No"
			while(confirm=="No")
				choice=input(src,"Which holy sword will your soul manifest as?", "Weapon Soul Ascension") in choices
				if(choice=="Kusanagi")
					confirm=alert(src,"Kusanagi is the Sword of Faith.  It slashes through the enemy's confidence while its performance is based on your own.  Do you want to inherit Kusanagi?", "Weapon Soul Ascension", "Yes", "No")
				if(choice=="Durendal")
					confirm=alert(src,"Durendal is the Sword of Hope.  It bolsters your courage while annihilating the bravest of enemies.  Do you want to inherit Durendal?", "Weapon Soul Ascension", "Yes", "No")
				if(choice=="Masamune")
					confirm=alert(src,"Masamune is the Sword of Purity.  It is by far the kindest sword.  It will ruthlessly destroy evil yet will never harm innocents.  Do you want to inherit Masamune?", "Weapon Soul Ascension", "Yes", "No")
			src.WeaponSoul=choice
			src << "You have inherited the powers of [choice].  Use them well in your fight against the darkness."
			if(choice=="Kusanagi")
				KusanagiTaken=1
			if(choice=="Durendal")
				DurendalTaken=1
			if(choice=="Masamune")
				MasamuneTaken=1
		CorruptHolyBlade()
			if(!DualTaken)
				src.HolyToTriple()
			else
				src.HolyToEvil()
		HolyToTriple()
			src << "Your soul's true nature has come out; you are no holy warrior.  Within your soul lies tenacity, skill, and <b>rage</b>..."
			src.WeaponSoul="Triple"
			DualTaken=1
		HolyToEvil()
			src << "Your soul's true nature has come to light; you are no holy warrior.  Try as you might, your soul is counted among the legions of the Destroyer."
			var/list/choices=list("Calibur", "Edge", "Muramasa")
			if(CaliburTaken)
				choices-="Calibur"
			if(EdgeTaken)
				choices-="Edge"
			if(MuramasaTaken)
				choices-="Muramasa"
			if(choices.len < 1)
				src << "Something has gone horribly wrong with Weapon Soul.  Contact Jinx as soon as possible."
				return
			var/choice=pick(choices)
			src.WeaponSoul=choice
			if(choice=="Calibur")
				src << "The true measure of your soul has been judged clearly; you value <b>your own order</b> above all else."
			if(choice=="Edge")
				src << "The true measure of your soul has been judged peerlessly; you value <b>destruction</b> above all else."
			if(choice=="Muramasa")
				src << "The true measure of your soul has been judged unerringly; you value <b>yourself</b> above all else."
		ChooseTier3UnholyWeapon()
			if(src.UsingWeaponSoul())
				return
			var/list/choices=list("Calibur", "Edge", "Muramasa")
			if(CaliburTaken)
				choices-="Calibur"
			if(EdgeTaken)
				choices-="Edge"
			if(MuramasaTaken)
				choices-="Muramasa"
			if(choices.len < 1)
				src.SanctifyCorruptEdge()
				return
			var/choice
			var/confirm="No"
			while(confirm=="No")
				choice=input(src,"Which cursed blade will your soul manifest as?", "Weapon Soul Ascension") in choices
				if(choice=="Calibur")
					confirm=alert(src,"Soul Calibur is a blade of order above all else.  It is manipulative and devious, twisting the user's mind to suit its own ideals.  Are you cursed to bear Soul Calibur?", "Weapon Soul Ascension", "Yes", "No")
				if(choice=="Edge")
					confirm=alert(src,"Soul Edge is a weapon of pure destruction.  It corrupts the user's mind and sanity without reservation, using them as mere pawns to destroy more and more.  Are you cursed to bear Soul Edge?", "Weapon Soul Ascension", "Yes", "No")
				if(choice=="Muramasa")
					confirm=alert(src,"Muramasa is a peerless weapon filled with bloodlust.  It cuts through all it touches, and what it does not cut, it consumes.  Are you cursed to bear Muramasa?", "Weapon Soul Ascension", "Yes", "No")
			src.WeaponSoul=choice
			if(choice=="Muramasa")
				src << "Your will draws the attention of Muramasa.  It urges you to fight without ceasing, sustaining yourself on the blood of the fallen..."
			else
				src << "Your will draws the attention of Soul [choice].  It takes root within your mind, consuming your ideals from within..."
			if(choice=="Calibur")
				CaliburTaken=1
			if(choice=="Edge")
				EdgeTaken=1
			if(choice=="Muramasa")
				MuramasaTaken=1
		SanctifyCorruptEdge()
			if(!DualTaken)
				src.EvilToTriple()
			else
				src.EvilToHoly()
		EvilToTriple()
			src << "Your true nature has come out; you are no minion of darkness.  Your soul relies upon tenacity, skill, and <b>rage</b> to work great deeds!"
			src.WeaponSoul="Triple"
		EvilToHoly()
			src << "Your soul's true nature has come to light; you are no damned soul.  Try as you might, your soul is pure and just."
			var/list/choices=list("Kusanagi", "Durendal", "Masamune")
			if(KusanagiTaken)
				choices-="Kusanagi"
			if(DurendalTaken)
				choices-="Durendal"
			if(MasamuneTaken)
				choices-="Masamune"
			if(choices.len < 1)
				src << "Something has gone horribly wrong with Weapon Soul.  Contact Jinx as soon as possible."
				return
			var/choice=pick(choices)
			src.WeaponSoul=choice
			if(choice=="Kusanagi")
				src << "The true measure of your soul has been judged clearly; you value <b>faith in yourself and others</b> above all else."
			if(choice=="Durendal")
				src << "The true measure of your soul has been judged peerlessly; you value <b>courage and hope</b> above all else."
			if(choice=="Masamune")
				src << "The true measure of your soul has been judged unerringly; you value <b>kindness</b> above all else."
		UsingWeaponSoul()
			for(var/obj/Skills/TierS/WeaponSoul/ws in src)
				if(ws.BuffUsing)
					src << "Turn off Weapon Soul then meditate again."
					return 1
			return 0
		GetTripleWield()
			if(src.UsingWeaponSoul())
				return
			src.WeaponSoul="Triple"
			src << "You learn to draw three blades from the sea of your soul."
		GetFinalWeapon()
			if(src.WeaponSoul=="Kusanagi")
				src.contents+=new/obj/Skills/TierS/LightBringer
				src << "Your soul has acquired limitless vitality."
			if(src.WeaponSoul=="Durendal")
				src.contents+=new/obj/Skills/TierS/DawnTreader
				src << "Your soul has acquired boundless courage."
			if(src.WeaponSoul=="Masamune")
				src.contents+=new/obj/Skills/TierS/SolZenith
				src << "Your soul has acquired selfless kindness."
			if(src.WeaponSoul=="Triple")
				src.contents+=new/obj/Skills/TierS/MastersFury
				src << "Your soul has been tainted by wrath."
			if(src.WeaponSoul=="Calibur")
				src.contents+=new/obj/Skills/TierS/SoulSanctum
				src << "Your soul has been blessed by clarity."
			if(src.WeaponSoul=="Edge")
				src.contents+=new/obj/Skills/TierS/SoulSlayer
				src << "Your soul has been cursed with destruction."
			if(src.WeaponSoul=="Muramasa")
				src.contents+=new/obj/Skills/TierS/SoulSanguine
				src << "Your soul has rotted from demonic influence."
		LightKeybladeAscensions()
			var/level=src.GetLightKeybladeLevel()
			if(level>=3)
				if(!locate(/obj/Skills/TierS/EventHorizon,src))
					src.contents+=new/obj/Skills/TierS/EventHorizon
					src << "You learn to unleash a spectacular combo with a stunning finish!"
		DarkKeybladeAscensions()
			var/level=src.GetDarkKeybladeLevel()
			if(level>=2)
				if(!locate(/obj/Skills/Keyblade/DarkMode,src))
					src.contents+=new/obj/Skills/Keyblade/DarkMode
					src << "You learn how to call forth the darkness within your heart."
			if(level>=3)
				if(!locate(/obj/Skills/Feva/Fatal_Mode,src))
					src.contents+=new/obj/Skills/Feva/Fatal_Mode
					src << "You learn how to use your inner darkness to add an edge of fatality to all your attacks."
			if(level>=4)
				if(!locate(/obj/Skills/Feva/Dark_Break,src))
					src.contents+=new/obj/Skills/Feva/Dark_Break
					src << "You learn how to channel your darkness into a tide of unrelenting attacks."
		NothingnessKeybladeAscensions()
			if(!locate(/obj/Skills/TierS/DriveForm,src))
				src.contents+=new/obj/Skills/TierS/DriveForm
				src << "You have learned how to use two keyblades at once: DRIVE FORM."
		UnlockComboPlus()
			src.ComboPlus=1
			src.contents+=new/obj/Skills/TierS/Finisher
		UnlockSecondChance()
			src.SecondChance=1
			src.SecondChanceActive=0
		UnlockMPRage()
			src.MPRage=1
		KeybladeAscensions()
			if(src.HasKeyblade("Light", 1))
				src.LightKeybladeAscensions()
			if(src.HasKeyblade("Darkness", 1))
				src.DarkKeybladeAscensions()
			if(src.HasKeyblade("Nothingness", 1))
				src.NothingnessKeybladeAscensions()
			if(src.DiveWeapon=="Sword")
				if(src.DiveAbandon=="Shield")
					if(src.KeybladeLevel>1&&!src.MPRage)
						src.UnlockMPRage()
					if(src.KeybladeLevel>2&&!src.SecondChance)
						src.UnlockSecondChance()
				if(src.DiveAbandon=="Staff")
					if(src.KeybladeLevel>1&&!src.SecondChance)
						src.UnlockSecondChance()
					if(src.KeybladeLevel>2&&!src.MPRage)
						src.UnlockMPRage()
			if(src.DiveWeapon=="Shield")
				if(src.DiveAbandon=="Sword")
					if(src.KeybladeLevel>1&&!src.MPRage)
						src.UnlockMPRage()
					if(src.KeybladeLevel>2&&!src.ComboPlus)
						src.UnlockComboPlus()
				if(src.DiveAbandon=="Staff")
					if(src.KeybladeLevel>1&&!src.ComboPlus)
						src.UnlockComboPlus()
					if(src.KeybladeLevel>2&&!src.MPRage)
						src.UnlockMPRage()
			if(src.DiveWeapon=="Staff")
				if(src.DiveAbandon=="Sword")
					if(src.KeybladeLevel>1&&!src.SecondChance)
						src.UnlockSecondChance()
					if(src.KeybladeLevel>2&&!src.ComboPlus)
						src.UnlockComboPlus()
				if(src.DiveAbandon=="Shield")
					if(src.KeybladeLevel>1&&!src.ComboPlus)
						src.UnlockComboPlus()
					if(src.KeybladeLevel>2&&!src.SecondChance)
						src.UnlockSecondChance()
		DeleteNonForceSkills()
			var/found=0
			for(var/obj/Skills/s in src)
				if(!s.ForceSpec&&!s.Basic)
					found=1
					del s
			if(found)
				src << "Your attunement to The Force blocks out all other knowledge."
		TriggerSpiralAscension()
		{
			var/list/available = list()
			if(!src.SpiralStrength)
			{
				available += "Strength"
			}
			if(!src.SpiralEndurance)
			{
				available += "Endurance"
			}
			if(!src.SpiralResistance2)
			{
				available += "Resistance"
			}
			if(!src.SpiralOffense)
			{
				available += "Offense"
			}
			if(available.len > 0)
			{
				var/choice
				choice = input("How do you want to hone your spiral energy?", "Ascension") in available;
				switch(choice)
				{
					if("Strength") src.SpiralStrength = 1
					if("Endurance") src.SpiralEndurance = 1
					if("Resistance") src.SpiralResistance2 = 1
					if("Offense") src.SpiralOffense = 1
				}
			}
			else
			{
				src << "You have become the epitome of MAN. Your spiral energy is endless."
				src.SpiralEndless = 1
				src.contents += new/obj/Skills/Attacks/GigaDrillBreaker;
			}
		}
		CheckForSpiralAscensions()
		{
			var/rev = src.GetRevNum();
			if(!rev&& src.UnlockSpiral==1)
			{
				src.TriggerSpiralAscension();
			}
			if(rev == 1 && src.UnlockSpiral==2)
			{
				src.TriggerSpiralAscension();
			}
			if(rev == 2 && src.UnlockSpiral == 3)
			{
				src.TriggerSpiralAscension();
			}
			if(rev == 3 && src.UnlockSpiral==4)
			{
				src.TriggerSpiralAscension();
			}
			if(rev == 4 && src.UnlockSpiral == 5)
			{
				src.TriggerSpiralAscension();
			}
		}
		GetRevNum()
		{
			var/rev = 0
			if(src.SpiralStrength)
			{
				rev++
			}
			if(src.SpiralEndurance)
			{
				rev++
			}
			if(src.SpiralResistance2)
			{
				rev++
			}
			if(src.SpiralOffense)
			{
				rev++
			}
			if(src.SpiralEndless)
			{
				rev++
			}
			return rev
		}
		CountRinneganAscensions()
		{
			var/returned = 0
			if(src.DevaUnlocked)
			{
				returned++
			}
			if(src.PretaUnlocked)
			{
				returned++
			}
			if(src.HumanUnlocked)
			{
				returned++
			}
			if(src.AsuraUnlocked)
			{
				returned++
			}
			if(src.NarakaUnlocked)
			{
				returned++
			}
			if(src.AnimalUnlocked)
			{
				returned++
			}
			return returned
		}
		GiveRinnegan(var/mob/choice)
		{
			choice.contents+=/obj/Skills/Buffs/Rinnegan
			choice.DevaUnlocked=src.DevaUnlocked
			choice.PretaUnlocked=src.PretaUnlocked
			choice.HumanUnlocked=src.HumanUnlocked
			choice.AsuraUnlocked=src.AsuraUnlocked
			choice.NarakaUnlocked=src.NarakaUnlocked
			choice.AnimalUnlocked=src.AnimalUnlocked
			choice.OuterUnlocked=src.OuterUnlocked;
			for(var/obj/Skills/Buffs/Rinnegan/r in src)
			{
				src.contents -= r;
			}
			src.OMessage("[src] gave [choice] their Rinnegan.", "[src] used Give Rinnegan on [choice].");
		}
		TriggerRinneganAscension()
		{
			var/list/available = list();
			if(!src.DevaUnlocked)
			{
				available+="Deva"
			}
			if(!src.PretaUnlocked)
			{
				available+="Preta"
			}
			if(!src.HumanUnlocked)
			{
				available+="Human"
			}
			if(!src.AsuraUnlocked)
			{
				available+="Asura"
			}
			if(!src.NarakaUnlocked)
			{
				available+="Naraka"
			}
			if(!src.AnimalUnlocked)
			{
				available+="Animal"
			}
			var/choice=input("Which path do you wish to master?", "Rinnegan") in available
			switch(choice)
				if("Deva")
					src.DevaUnlocked=1
					src.contents+=new/obj/Skills/Rank/Kiai
				if("Preta")
					src.PretaUnlocked=1
					src.contents+=new/obj/Skills/Rank/Shield
				if("Human")
					src.HumanUnlocked=1
					src.contents+=new/obj/Skills/Telepathy
				if("Asura")
					src.AsuraUnlocked=1
					src.contents+=new/obj/Skills/Attacks/WolfFangFist
					src.CyberizeMod += 0.5
				if("Naraka")
					src.NarakaUnlocked=1
					src.contents+=new/obj/Skills/Rank/SuperGhostKamikaze
					src.EnergyMod*=2
					src.EnergyMax*=2
				if("Animal")
					src.AnimalUnlocked=1
					src.contents+=new/obj/Skills/Rank/Splitclone
			src << "You grasped the [choice] path.";
		}