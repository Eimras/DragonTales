var
	TierSEXPCap=20
//proc
//	SetNewTierSCap()
//		TierSEXPCap=Day*20

/*mob
	proc
		HasTierS()
			if(src.KeybladeLevel)
				return 1
			if(locate(/obj/Skills/Buffs/SpiralEnergy,src)||locate(/obj/Skills/Buffs/SpiralNemesis,src))
				return 1
			if(locate(/obj/Skills/MartialArts/Eight_Gates,src))
				return 1
			if(locate(/obj/Skills/TierS/WeaponSoul,src))
				return 1
			/*if(jaganeye)
				return 1*/
			if(src.HitenMitsurugi)
				return 1
			if(locate(/obj/Skills/Buffs/Sharingan, src))
				return 1
			if(src.AnsatsukenMod)
				return 1
			if(src.SpiritLevel)
				return 1
			if(src.HeroLevel)
				return 1
			if(src.SexyMod)
				return 1
			if(src.RippleMod)
				return 1
			if(src.UBWLevel)
				return 1
			if(src.BerserkerMod)
				return 1
			if(src.VisoredStage)
				return 1
			if(src.MadScientist)
				return 1
			return 0
		NotCapped(var/tierS)
			switch(tierS)
				if("Keyblade")
					if(src.TotalKeybladeEXP < global.TierSEXPCap)
						return 1
					return 0
				if("Spiral")
					if(src.TotalSpiralEXP < global.TierSEXPCap*1.25)
						return 1
					return 0
				if("EightGates")
					if(src.TotalEightGatesEXP < global.TierSEXPCap*2)
						return 1
					return 0
				if("WeaponSoul")
					if(src.TotalWeaponSoulEXP < global.TierSEXPCap*2)
						return 1
					return 0
				if("JaganEye")
					if(src.TotalJaganEyeEXP < global.TierSEXPCap)
						return 1
					return 0
				if("HitenMitsurugi")
					if(src.TotalHitenMitsurugiEXP < global.TierSEXPCap)
						return 1
					return 0
				if("Sharingan")
					if(src.TotalSharinganEXP < global.TierSEXPCap)
						return 1
					return 0
				if("Ansatsuken")
					if(src.TotalAnsatsukenEXP < global.TierSEXPCap)
						return 1
					return 0
				if("SpiritEnergy")
					if(src.TotalSpiritEnergyEXP < global.TierSEXPCap)
						return 1
					return 0
				if("HOA")
					if(src.TotalHOAEXP < global.TierSEXPCap)
						return 1
					return 0
				if("Kamui")
					if(src.TotalKamuiEXP < global.TierSEXPCap*2.5)
						return 1
					return 0
				if("Ripple")
					if(src.TotalRippleEXP < global.TierSEXPCap)
						return 1
					return 0
				if("UBW")
					if(src.TotalUBWEXP < global.TierSEXPCap)
						return 1
					return 0
				if("Berserk")
					if(src.TotalBerserkEXP < global.TierSEXPCap)
						return 1
					return 0
				if("Vaizard")
					if(src.TotalVaizardEXP < global.TierSEXPCap)
						return 1
					return 0
				if("Mad Scientist")
					if(src.TotalMadScientistEXP < global.TierSEXPCap)
						return 1
					return 0
		HasEXP(var/tierS)
			switch(tierS)
				if("Keyblade")
					if(src.DamageDone>=1)
						return 1
					if(src.WoundsDone>=1&&(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Darkness",1)))
						return 1
					if(src.LethalDone>=1&&src.HasKeyblade("Darkness", 1))
						return 1
					return 0
				if("Spiral")
					if(src.DamageHealed>=1||src.WoundsHealed>=1||src.FatigueHealed>=1)
						return 1
					return 0
				if("EightGates")
					if(src.DamageDone>=1||src.FatigueHealed>=1)
						return 1
					return 0
				if("WeaponSoul")
					if(src.DamageDone>=1||src.WoundsDone>=1||src.LethalDone>=1||src.KillCount>=1)
						return 1
					return 0
				if("JaganEye")
					if(src.DamageDone>=1||src.WoundsDone>=1||src.LethalDone>=1||src.KillCount>=1)
						return 1
					return 0
				if("HitenMitsurugi")
					if(src.DamageDone>=1||src.WoundsDone>=1||src.LethalDone>=1||src.KillCount>=1)
						return 1
					return 0
				if("Sharingan")
					if(src.SharinganTime>=1)
						return 1
					return 0
				if("Ansatsuken")
					if(src.DamageDone>=1||src.WoundsDone>=1||src.LethalDone>=1||src.KillCount>=1)
						return 1
					return 0
				if("SpiritEnergy")
					if(src.DamageDone>=1||src.DamageHealed>=1||src.WoundsHealed>=1||src.FatigueHealed>=1)
						return 1
					return 0
				if("HOA")
					if(src.DamageDone>=1||src.DamageHealed>=1|src.WoundsDone>=1||src.WoundsHealed>=1||src.LethalDone>=1||src.FatigueHealed>=1)
						return 1
					return 0
				if("Kamui")
					if(src.DamageHealed>=1||src.WoundsHealed>=1)
						return 1
					return 0
				if("Ripple")
					if(src.DamageDone>=1||src.FatigueHealed>=1)
						return 1
					return 0
				if("UBW")
					if(src.DamageDone>=1||src.DamageHealed>=1||src.WoundsHealed>=1||src.FatigueHealed>=1)
						return 1
				if("Berserk")
					if(src.DamageDone>=1||src.DamageHealed>=1||src.WoundsHealed>=1||src.FatigueHealed>=1)
						return 1
					return 0
				if("Vaizard")
					if(src.DamageDone>=1||src.DamageHealed>=1||src.WoundsHealed>=1||src.FatigueHealed>=1)
						return 1
					return 0
				if("Mad Scientist")
					if(src.DamageDone>=1||src.DamageHealed>=1||src.WoundsHealed>=1||src.FatigueHealed>=1)
						return 1
					return 0
		SubtractDamageDealt(var/num)
			src.DamageDone-=num
		SubtractDamageHealed(var/num)
			src.DamageHealed-=num
		SubtractWoundsDealt(var/num)
			src.WoundsDone-=num
		SubtractWoundsHealed(var/num)
			src.WoundsHealed-=num
		SubtractLethalDealt(var/num)
			src.LethalDone-=num
		SubtractEnergyHealed(var/num)
			src.EnergyHealed-=num
		SubtractFatigueHealed(var/num)
			src.FatigueHealed-=num
		SubtractKillCount(var/num)
			src.KillCount-=num
		AddKeybladeEXP(var/num)
			src.KeybladeEXP+=num
			src.TotalKeybladeEXP+=num
			if(src.KeybladeUnlock>=1)
				src.TotalKeybladeEXP+=100*src.KeybladeUnlock
				src.KeybladeUnlock=0
			src.KeybladeLevelUp()
		KeybladeLevelUp()
			if(src.KeybladeEXP>=100)
				src.KeybladeEXP-=100
				src.KeybladeLevel=round(src.TotalKeybladeEXP/100)
				if(src.KeybladeLevel>4)
					src.KeybladeLevel=4
				src.KeybladeAscensions()
				src.SetEXPStats(0)
				return
			return
		AddSpiralEXP(var/num)
			src.SpiralEXP+=num
			src.TotalSpiralEXP+=num
			if(src.SpiralUnlockz>=1)
				src.TotalSpiralEXP+=100*src.SpiralUnlockz
				src.SpiralUnlockz=0
			src.SpiralLevelUp()
		SpiralLevelUp()
			if(src.SpiralEXP>=100)
				src.SpiralEXP-=100
				src.UnlockSpiral=round(src.TotalSpiralEXP/100)
				if(src.UnlockSpiral>5)
					src.UnlockSpiral=5
				src.SetEXPStats(0)
				return
			return
		AddEightGatesEXP(var/num)
			src.EightGatesEXP+=num
			src.TotalEightGatesEXP+=num
			src.EightGatesLevelUp()

		EightGatesLevelUp()
			if(src.EightGatesEXP>=100)
				src.EightGatesEXP-=100
				src.GatesUnlocked=round(src.TotalEightGatesEXP/100)
				if(src.GatesUnlocked>8)
					src.GatesUnlocked=8
				src.SetEXPStats(0)
				return
			return
		AddWeaponSoulEXP(var/num)
			src.WeaponSoulEXP+=num
			src.TotalWeaponSoulEXP+=num
			if(src.WeaponSoulUnlock>=1)
				src.TotalWeaponSoulEXP+=100*src.WeaponSoulUnlock
				src.WeaponSoulUnlock=0
			src.WeaponSoulLevelUp()
		WeaponSoulLevelUp()
			if(src.WeaponSoulEXP>=100)
				src.WeaponSoulEXP-=100
				src.WeaponSoulLevel=round(src.TotalWeaponSoulEXP/100)
				src.WeaponSoulAscensions()
				src.SetEXPStats(0)
				return
			return
		AddJaganEyeEXP(var/num)
			src.JaganEyeEXP+=num
			src.TotalJaganEyeEXP+=num
			if(src.JaganEyeUnlock>=1)
				src.TotalJaganEyeEXP+=100*src.JaganEyeUnlock
				src.JaganEyeUnlock=0
			src.JaganEyeLevelUp()
		JaganEyeLevelUp()
			if(src.JaganEyeEXP>=100)
				src.JaganEyeEXP-=100
				//src.JaganEyeLevel+=1
				//if(src.JaganEyeLevel>5)
				//	src.JaganEyeLevel=5
				//src.JaganEyeAscensions()
				src.SetEXPStats(0)
				return
			return
		AddHitenMitsurugiEXP(var/num)
			src.HitenMitsurugiEXP+=num
			src.TotalHitenMitsurugiEXP+=num
			if(src.HitenMitsurugiUnlock>=1)
				src.TotalHitenMitsurugiEXP+=100*src.HitenMitsurugiUnlock
				src.HitenMitsurugiUnlock=0
			src.HitenMitsurugiLevelUp()
		HitenMitsurugiLevelUp()
			if(src.HitenMitsurugiEXP>=100)
				src.HitenMitsurugiEXP-=100
				src.HitenMitsurugi=round(src.TotalHitenMitsurugiEXP/100)
				if(src.HitenMitsurugi>6)
					src.HitenMitsurugi=6
				src.SetEXPStats(0)
				return
			return
		AddSharinganEXP(var/num)
			src.SharinganEXP+=num
			src.TotalSharinganEXP+=num
			if(src.SharinganUnlock>=1)
				src.TotalSharinganEXP+=100*src.SharinganUnlock
				src.SharinganUnlock=0
			src.SharinganLevelUp()
		SharinganLevelUp()
			if(src.SharinganEXP>=100)
				src.SharinganEXP-=100
				src.SharinganUnlocked=round(src.SharinganEXP/100)
				if(src.MSSharinganUnlocked>=1)
					src.SharinganUnlocked+=src.MSSharinganUnlocked
				if(src.SharinganUnlocked>5)
					src.SharinganUnlocked=5
				src.SetEXPStats(0)
				return
			return
		AddAnsatsukenEXP(var/num)
			src.AnsatsukenEXP+=num
			src.TotalAnsatsukenEXP+=num
			if(src.AnsatsukenUnlock>=1)
				src.TotalAnsatsukenEXP+=100*src.AnsatsukenUnlock
				src.AnsatsukenUnlock=0
			src.AnsatsukenLevelUp()
		AnsatsukenLevelUp()
			if(src.AnsatsukenEXP>=100)
				src.AnsatsukenEXP-=100
				src.AnsatsukenMod=round(src.TotalAnsatsukenEXP/100)
				if(src.AnsatsukenMod>5)
					src.AnsatsukenMod=5
				src.SetEXPStats(0)
				return
			return
		AddSpiritEnergyEXP(var/num)
			src.SpiritEnergyEXP+=num
			src.TotalSpiritEnergyEXP+=num
			if(src.SpiritEnergyUnlock>=1)
				src.TotalSpiritEnergyEXP+=100*src.SpiritEnergyUnlock
				src.SpiritEnergyUnlock=0
//			src.SpiritEnergyLevelUp()
		SpiritEnergyLevelUp()
			if(src.SpiritEnergyEXP>=100)
				src.SpiritEnergyEXP-=100
				src.SpiritLevel=round(src.TotalSpiritEnergyEXP/100)
				if(src.SpiritLevel>5)
					src.SpiritLevel=5
				src.SetEXPStats(0)
				return
			return
		AddHOAEXP(var/num)
			src.HOAEXP+=num
			src.TotalHOAEXP+=num
			if(src.HOAUnlock>=1)
				src.TotalHOAEXP+=100*src.HOAUnlock
				src.HOAUnlock=0
			src.HOALevelUp()
		HOALevelUp()
			if(src.HOAEXP>=100)
				src.HOAEXP-=100
				src.HeroLevel=round(src.TotalHOAEXP/100)
				if(src.HeroLevel>5)
					src.HeroLevel=5
				src.SetEXPStats(0)
				return
			return
		AddKamuiEXP(var/num)
			src.KamuiEXP+=num
			src.TotalKamuiEXP+=num
			if(src.KamuiUnlock>=1)
				src.TotalKamuiEXP+=100*src.KamuiUnlock
				src.KamuiUnlock=0
			src.KamuiLevelUp()
		KamuiLevelUp()
			if(src.KamuiEXP>=100)
				src.KamuiEXP-=100
				src.LifeFiberFusion++
				src.SetEXPStats(0)
				return
			if(src.KamuiUnlock>=1)
				src.KamuiUnlock--
				src.LifeFiberFusion++
				return
			return
		AddRippleEXP(var/num)
			src.RippleEXP+=num
			src.TotalRippleEXP+=num
			if(src.RippleUnlock>=1)
				src.TotalRippleEXP+=100*src.RippleUnlock
				src.RippleUnlock=0
			src.RippleLevelUp()
		RippleLevelUp()
			if(src.RippleEXP>=100)
				src.RippleEXP-=100
				src.RippleMod=round(src.TotalRippleEXP/100)
				if(src.RippleMod>6)
					src.RippleMod=6
				src.SetEXPStats(0)
				return
			return
		AddUBWEXP(var/num)
			src.UBWEXP+=num
			src.TotalUBWEXP+=num
			if(src.UBWUnlock>=1)
				src.TotalUBWEXP+=100*src.UBWUnlock
				src.UBWUnlock=0
			src.UBWLevelUp()
		UBWLevelUp()
			if(src.UBWEXP>=100)
				src.UBWEXP-=100
				src.UBWLevel=round(src.TotalUBWEXP/100)
				if(src.UBWLevel>5)
					src.UBWLevel=5
				src.SetEXPStats(0)
				return
			return
		AddBerserkEXP(var/num)
			src.BerserkEXP+=num
			src.TotalBerserkEXP+=num
			if(src.BerserkUnlock>=1)
				src.TotalBerserkEXP+=100*src.BerserkUnlock
				src.BerserkUnlock=0
			src.BerserkLevelUp()
		BerserkLevelUp()
			if(src.BerserkEXP>=100)
				src.BerserkEXP-=100
				src.BerserkerMod=round(src.TotalBerserkEXP/100)
				if(src.BerserkerMod>4)
					src.BerserkerMod=4
				src.SetEXPStats(0)
				return
			return
		AddVaizardEXP(var/num)
			src.VaizardEXP+=num
			src.TotalVaizardEXP+=num
			if(src.VaizardUnlock>=1)
				src.TotalVaizardEXP+=100*src.VaizardUnlock
				src.VaizardUnlock=0
			src.VaizardLevelUp()
		VaizardLevelUp()
			if(src.VaizardEXP>=100)
				src.VaizardEXP-=100
				src.VisoredStage=round(src.TotalVaizardEXP/100)
				if(src.VisoredStage>3)
					src.VisoredStage=3
				src.SetEXPStats(0)
				return
			return
		AddMadScientistEXP(var/num)
			src.MadScientistEXP+=num
			src.TotalMadScientistEXP+=num
			if(src.MadScientistUnlock>=1)
				src.TotalMadScientistEXP+=100*src.MadScientistUnlock
				src.MadScientistUnlock=0
			src.MadScientistLevelUp()
		MadScientistLevelUp()
			if(src.MadScientistEXP>=100)
				src.MadScientistEXP-=100
				src.MadScientist=round(src.TotalMadScientistEXP/100)
				if(src.MadScientist>4)
					src.MadScientist=4
				src.SetEXPStats(0)
				return
			return
		CanGetDamageDealtEXP()
			if(src.DamageDone>=1)
				return 1
			return 0
		CanGetWoundsDealtEXP()
			if(src.WoundsDone>=1)
				return 1
			return 0
		CanGetLethalDealtEXP()
			if(src.LethalDone>=1)
				return 1
			return 0
		CanGetDamageHealedEXP()
			if(src.DamageHealed>=1)
				return 1
			return 0
		CanGetWoundsHealedEXP()
			if(src.WoundsHealed>=1)
				return 1
			return 0
		CanGetEnergyHealedEXP()
			if(src.EnergyHealed>=1)
				return 1
			return 0
		CanGetFatigueHealedEXP()
			if(src.FatigueHealed>=1)
				return 1
			return 0
		CanGetKillCountEXP()
			if(src.KillCount>=1)
				return 1
			return 0
		SetEXPStats(var/val)
			src.DamageDone=val
			src.DamageTaken=val
			src.WoundsDone=val
			src.WoundsTaken=val
			src.LethalDone=val
			src.EnergyHealed=val
			src.FatigueHealed=val
		GetKeybladeEXP()
			while(src.NotCapped("Keyblade")&&src.HasEXP("Keyblade"))
				src.KeybladeEXPDamageDealt()
				src.KeybladeEXPWoundsDealt()
				src.KeybladeEXPLethalDealt()
				src.KeybladeEXPUnlock()
		KeybladeEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddKeybladeEXP(0.25)
		KeybladeEXPWoundsDealt()
			if(src.CanGetWoundsDealtEXP())
				if(src.KeybladeElement=="Nothingness"||src.KeybladeElement=="Darkness")
					src.SubtractWoundsDealt(1)
					src.AddKeybladeEXP(0.5)
		KeybladeEXPLethalDealt()
			if(src.CanGetLethalDealtEXP())
				if(src.KeybladeElement=="Darkness")
					src.SubtractLethalDealt(1)
					src.AddKeybladeEXP(1)
		KeybladeEXPUnlock()
			src.AddKeybladeEXP(0)
		GetSpiralEXP()
			while(src.NotCapped("Spiral")&&src.HasEXP("Spiral"))
				src.SpiralEXPDamageHealed()
				src.SpiralEXPWoundsHealed()
				src.SpiralEXPFatigueHealed()
				src.SpiralEXPUnlock()
		SpiralEXPDamageHealed()
			if(src.CanGetDamageHealedEXP())
				src.SubtractDamageHealed(1)
				src.AddSpiralEXP(0.25)
		SpiralEXPWoundsHealed()
			if(src.CanGetWoundsHealedEXP())
				src.SubtractWoundsHealed(1)
				src.AddSpiralEXP(0.5)
		SpiralEXPEnergyHealed()
			if(src.CanGetEnergyHealedEXP())
				src.SubtractEnergyHealed(1)
				src.AddSpiralEXP(0.1)
		SpiralEXPFatigueHealed()
			if(src.CanGetFatigueHealedEXP())
				src.SubtractFatigueHealed(1)
				src.AddSpiralEXP(0.25)
		SpiralEXPUnlock()
			src.AddSpiralEXP(0)
		GetEightGatesEXP()
			while(src.NotCapped("EightGates")&&src.HasEXP("EightGates"))
				EightGatesEXPDamageDealt()
				EightGatesEXPFatigueHealed()
		EightGatesEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddEightGatesEXP(0.25)
		EightGatesEXPEnergyHealed()
			if(src.CanGetEnergyHealedEXP())
				src.SubtractEnergyHealed(1)
				src.AddEightGatesEXP(0.1)
		EightGatesEXPFatigueHealed()
			if(src.CanGetFatigueHealedEXP())
				src.SubtractFatigueHealed(1)
				src.AddEightGatesEXP(0.25)
		EightGatesEXPUnlock()
			src.AddEightGatesEXP(0)
		GetWeaponSoulEXP()
			while(src.NotCapped("WeaponSoul")&&src.HasEXP("WeaponSoul"))
				WeaponSoulEXPDamageDealt()
				WeaponSoulEXPWoundsDealt()
				WeaponSoulEXPLethalDealt()
				WeaponSoulEXPPeopleKilled()
		WeaponSoulEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddWeaponSoulEXP(0.25)
		WeaponSoulEXPWoundsDealt()
			if(src.CanGetWoundsDealtEXP())
				src.SubtractWoundsDealt(1)
				src.AddWeaponSoulEXP(0.5)
		WeaponSoulEXPLethalDealt()
			if(src.CanGetLethalDealtEXP())
				src.SubtractLethalDealt(1)
				src.AddWeaponSoulEXP(1)
		WeaponSoulEXPPeopleKilled()
			if(src.CanGetKillCountEXP())
				src.SubtractKillCount(1)
				src.WeaponSoulUnlock++
				src.AddWeaponSoulEXP(0)
		GetJaganEyeEXP()
		CanGetJaganEyeEXPDamageDealt()
		CanGetJaganEyeEXPWoundsDealt()
		CanGetJaganEyeEXPLethalDealt()
		CanGetJaganEyeEXPPeopleKilled()
		GetHitenMitsurugiEXP()
			while(src.NotCapped("HitenMitsurugi")&&src.HasEXP("HitenMitsurugi"))
				HitenMitsurugiEXPDamageDealt()
				HitenMitsurugiEXPWoundsDealt()
				HitenMitsurugiEXPLethalDealt()
				HitenMitsurugiEXPPeopleKilled()
		HitenMitsurugiEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddHitenMitsurugiEXP(0.25)
		HitenMitsurugiEXPWoundsDealt()
			if(src.CanGetWoundsDealtEXP())
				src.SubtractWoundsDealt(1)
				src.AddHitenMitsurugiEXP(0.5)
		HitenMitsurugiEXPLethalDealt()
			if(src.CanGetLethalDealtEXP())
				src.SubtractLethalDealt(1)
				src.AddHitenMitsurugiEXP(1)
		HitenMitsurugiEXPPeopleKilled()
			if(src.CanGetKillCountEXP())
				src.SubtractKillCount(1)
				src.HitenMitsurugiUnlock++
				src.AddHitenMitsurugiEXP(0)
		GetSharinganEXP()
			while(src.NotCapped("Sharingan")&&src.HasEXP("Sharingan"))
				SharinganEXPSharinganTime()
		SharinganEXPSharinganTime()
			if(src.SharinganTime>=1)
				src.SharinganTime--
				src.AddSharinganEXP(0.01)
		GetAnsatsukenEXP()
			while(src.NotCapped("Ansatsuken")&&src.HasEXP("Ansatsuken"))
				AnsatsukenEXPDamageDealt()
				AnsatsukenEXPWoundsDealt()
				AnsatsukenEXPLethalDealt()
				AnsatsukenEXPPeopleKilled()
		AnsatsukenEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddAnsatsukenEXP(0.25)
		AnsatsukenEXPWoundsDealt()
			if(src.CanGetWoundsDealtEXP())
				src.SubtractWoundsDealt(1)
				src.AddAnsatsukenEXP(0.5)
		AnsatsukenEXPLethalDealt()
			if(src.CanGetLethalDealtEXP())
				src.SubtractLethalDealt(1)
				src.AddAnsatsukenEXP(1)
		AnsatsukenEXPPeopleKilled()
			if(src.CanGetKillCountEXP())
				src.SubtractKillCount(1)
				src.AnsatsukenUnlock++
				src.AddAnsatsukenEXP(0)
		GetSpiritEnergyEXP()
			while(src.NotCapped("SpiritEnergy")&&src.HasEXP("SpiritEnergy"))
				src.SpiritEnergyEXPDamageDealt()
				src.SpiritEnergyEXPDamageHealed()
				src.SpiritEnergyEXPWoundsHealed()
				src.SpiritEnergyEXPFatigueHealed()
		SpiritEnergyEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddSpiritEnergyEXP(0.25)
		SpiritEnergyEXPDamageHealed()
			if(src.CanGetDamageHealedEXP())
				src.SubtractDamageHealed(1)
				src.AddSpiritEnergyEXP(0.25)
		SpiritEnergyEXPWoundsHealed()
			if(src.CanGetWoundsHealedEXP())
				src.SubtractWoundsHealed(1)
				src.AddSpiritEnergyEXP(0.5)
		SpiritEnergyEXPEnergyHealed()
			if(src.CanGetEnergyHealedEXP())
				src.SubtractEnergyHealed(1)
				src.AddSpiritEnergyEXP(0.1)
		SpiritEnergyEXPFatigueHealed()
			if(src.CanGetFatigueHealedEXP())
				src.SubtractFatigueHealed(1)
				src.AddSpiritEnergyEXP(0.25)
		GetHOAEXP()
			while(src.NotCapped("HOA")&&src.HasEXP("HOA"))
				src.HOAEXPDamageDealt()
				src.HOAEXPDamageHealed()
				src.HOAEXPWoundsDealt()
				src.HOAEXPWoundsHealed()
				src.HOAEXPLethalDealt()
				src.HOAEXPFatigueHealed()
		HOAEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddHOAEXP(0.25)
		HOAEXPDamageHealed()
			if(src.CanGetDamageHealedEXP())
				src.SubtractDamageHealed(1)
				src.AddHOAEXP(0.25)
		HOAEXPWoundsDealt()
			if(src.CanGetWoundsDealtEXP())
				src.SubtractWoundsDealt(1)
				src.AddHOAEXP(0.5)
		HOAEXPWoundsHealed()
			if(src.CanGetWoundsHealedEXP())
				src.SubtractWoundsHealed(1)
				src.AddHOAEXP(0.5)
		HOAEXPLethalDealt()
			if(src.CanGetLethalDealtEXP())
				src.SubtractLethalDealt(1)
				src.AddHOAEXP(1)
		HOAEXPEnergyHealed()
			if(src.CanGetEnergyHealedEXP())
				src.SubtractEnergyHealed(1)
				src.AddHOAEXP(0.1)
		HOAEXPFatigueHealed()
			if(src.CanGetFatigueHealedEXP())
				src.SubtractFatigueHealed(1)
				src.AddHOAEXP(0.25)
		GetKamuiEXP()
			while(src.NotCapped("Kamui")&&src.HasEXP("Kamui"))
				src.KamuiEXPDamageHealed()
				src.KamuiEXPWoundsHealed()
		KamuiEXPDamageHealed()
			if(src.CanGetDamageHealedEXP())
				src.SubtractDamageHealed(1)
				src.AddKamuiEXP(0.25)
		KamuiEXPWoundsHealed()
			if(src.CanGetWoundsHealedEXP())
				src.SubtractWoundsHealed(1)
				src.AddKamuiEXP(0.5)
		GetRippleEXP()
			while(src.NotCapped("Ripple")&&src.HasEXP("Ripple"))
				src.RippleEXPDamageDealt()
				src.RippleEXPFatigueHealed()
		RippleEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddRippleEXP(0.25)
		RippleEXPEnergyHealed()
			if(src.CanGetEnergyHealedEXP())
				src.SubtractEnergyHealed(1)
				src.AddRippleEXP(0.1)
		RippleEXPFatigueHealed()
			if(src.CanGetFatigueHealedEXP())
				src.SubtractFatigueHealed(1)
				src.AddRippleEXP(0.25)
		GetUBWEXP()
			while(src.NotCapped("UBW")&&src.HasEXP("UBW"))
				src.UBWEXPDamageHealed()
				src.UBWEXPDamageDealt()
				src.UBWEXPWoundsHealed()
				src.UBWEXPFatigueHealed()
		UBWEXPDamageHealed()
			if(src.CanGetDamageHealedEXP())
				src.SubtractDamageHealed(1)
				src.AddUBWEXP(0.25)
		UBWEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddUBWEXP(0.25)
		UBWEXPWoundsHealed()
			if(src.CanGetWoundsHealedEXP())
				src.SubtractWoundsHealed(1)
				src.AddUBWEXP(0.5)
		UBWEXPEnergyHealed()
			if(src.CanGetEnergyHealedEXP())
				src.SubtractEnergyHealed(1)
				src.AddUBWEXP(0.1)
		UBWEXPFatigueHealed()
			if(src.CanGetFatigueHealedEXP())
				src.SubtractFatigueHealed(1)
				src.AddUBWEXP(0.25)
		GetBerserkEXP()
			while(src.NotCapped("Berserk")&&src.HasEXP("Berserk"))
				src.BerserkEXPDamageHealed()
				src.BerserkEXPDamageDealt()
				src.BerserkEXPWoundsHealed()
				src.BerserkEXPFatigueHealed()
		BerserkEXPDamageHealed()
			if(src.CanGetDamageHealedEXP())
				src.SubtractDamageHealed(1)
				src.AddBerserkEXP(0.25)
		BerserkEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddBerserkEXP(0.25)
		BerserkEXPWoundsHealed()
			if(src.CanGetWoundsHealedEXP())
				src.SubtractWoundsHealed(1)
				src.AddBerserkEXP(0.5)
		BerserkEXPEnergyHealed()
			if(src.CanGetEnergyHealedEXP())
				src.SubtractEnergyHealed(1)
				src.AddBerserkEXP(0.1)
		BerserkEXPFatigueHealed()
			if(src.CanGetFatigueHealedEXP())
				src.SubtractFatigueHealed(1)
				src.AddBerserkEXP(0.25)
		GetVaizardEXP()
			while(src.NotCapped("Vaizard")&&src.HasEXP("Vaizard"))
				src.VaizardEXPDamageHealed()
				src.VaizardEXPDamageDealt()
				src.VaizardEXPWoundsHealed()
				src.VaizardEXPFatigueHealed()
		VaizardEXPDamageHealed()
			if(src.CanGetDamageHealedEXP())
				src.SubtractDamageHealed(1)
				src.AddVaizardEXP(0.25)
		VaizardEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddVaizardEXP(0.25)
		VaizardEXPWoundsHealed()
			if(src.CanGetWoundsHealedEXP())
				src.SubtractWoundsHealed(1)
				src.AddVaizardEXP(0.5)
		VaizardEXPEnergyHealed()
			if(src.CanGetEnergyHealedEXP())
				src.SubtractEnergyHealed(1)
				src.AddVaizardEXP(0.1)
		VaizardEXPFatigueHealed()
			if(src.CanGetFatigueHealedEXP())
				src.SubtractFatigueHealed(1)
				src.AddVaizardEXP(0.25)
		GetMadScientistEXP()
			while(src.NotCapped("Mad Scientist")&&src.HasEXP("Mad Scientist"))
				src.MadScientistEXPDamageHealed()
				src.MadScientistEXPDamageDealt()
				src.MadScientistEXPWoundsHealed()
				src.MadScientistEXPFatigueHealed()
		MadScientistEXPDamageHealed()
			if(src.CanGetDamageHealedEXP())
				src.SubtractDamageHealed(1)
				src.AddMadScientistEXP(0.25)
		MadScientistEXPDamageDealt()
			if(src.CanGetDamageDealtEXP())
				src.SubtractDamageDealt(1)
				src.AddMadScientistEXP(0.25)
		MadScientistEXPWoundsHealed()
			if(src.CanGetWoundsHealedEXP())
				src.SubtractWoundsHealed(1)
				src.AddMadScientistEXP(0.5)
		MadScientistEXPEnergyHealed()
			if(src.CanGetEnergyHealedEXP())
				src.SubtractEnergyHealed(1)
				src.AddMadScientistEXP(0.1)
		MadScientistEXPFatigueHealed()
			if(src.CanGetFatigueHealedEXP())
				src.SubtractFatigueHealed(1)
				src.AddMadScientistEXP(0.25)*/