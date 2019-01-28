obj
	Skills
		TierS
			WeaponSoul
				var/LevelUsed
				verb/Weapon_Soul()
					set category="Skills"
					if(!src.LevelUsed)
						src.LevelUsed=usr.WeaponSoul
					if(src.LevelUsed==0||src.LevelUsed==null)
						usr.TierSX("WeaponSoul", src)
					if(src.LevelUsed=="Holy")
						usr.TierSX("HolyBlade", src)
					if(src.LevelUsed=="Corrupt")
						usr.TierSX("CorruptEdge", src)
					if(src.LevelUsed=="Dual")
						usr.TierSX("DualWield", src)
					if(src.LevelUsed=="Kusanagi")
						usr.TierSX("Kusanagi", src)
					if(src.LevelUsed=="Durendal")
						usr.TierSX("Durendal", src)
					if(src.LevelUsed=="Masamune")
						usr.TierSX("Masamune", src)
					if(src.LevelUsed=="Triple")
						usr.TierSX("TripleWield", src)
					if(src.LevelUsed=="Calibur")
						usr.TierSX("SoulCalibur", src)
					if(src.LevelUsed=="Edge")
						usr.TierSX("SoulEdge", src)
					if(src.LevelUsed=="Muramasa")
						usr.TierSX("Muramasa", src)
			LightBringer
				verb/Light_Bringer()
					set category="Skills"
					usr.TierSX("LightBringer", src)
			DawnTreader
				verb/Dawn_Treader()
					set category="Skills"
					usr.TierSX("DawnTreader", src)
			SolZenith
				verb/Sol_Zenith()
					set category="Skills"
					usr.TierSX("SolZenith", src)
			MastersFury
				verb/Weapon_Masters_Fury()
					set category="Skills"
					set name="Weapon Master's Fury"
					usr.TierSX("WeaponMastersFury", src)
			SoulSanctum
				verb/Soul_Sanctum()
					set category="Skills"
					usr.TierSX("SoulSanctum", src)
			SoulSlayer
				verb/Soul_Slayer()
					set category="Skills"
					usr.TierSX("SoulSlayer", src)
			SoulSanguine
				verb/Soul_Sanguine()
					set category="Skills"
					usr.TierSX("SoulSanguine", src)

			BlackOriginThreshold
				desc="Pass into the depths of your ki, to where only monsters exist, and become lost for the sake of immense power."
				verb/Black_Origin_Threshold()
					set category="Skills"
					usr.TierSX("BlackOriginThreshold", src)

			BerserkerArmor
				var/LevelUsed
				desc="Give your hatred sentience in order to slay what haunts you..."
				verb/Berserker_Armor()
					set category="Skills"
					if(!locate(/obj/Skills/Emotion,src.contents))
						src.contents+=new/obj/Skills/Emotion
					if(usr.BerserkerMod < 1)
						usr<< "The armor shifts to a shape more akin to your inner demons..."
						usr.BerserkerMod=1
					if(!src.LevelUsed)
						src.LevelUsed = usr.Guts()
//						return
					if(src.LevelUsed==0)
						return
//					if(src.LevelUsed==1)
					/*	if(usr.BerserkerMod==1)
							/*if(usr.BerserkerInsanity == 0)
								usr.BerserkerInsanity=1*/
							usr.TierSX("BerserkerArmor1", src)
							return
						if(usr.BerserkerMod==2)
							/*if(usr.BerserkerInsanity == 0)
								usr.BerserkerInsanity=1*/
							usr.TierSX("BerserkerArmor2", src)
							return */
					if(src.LevelUsed)
						if(src.LevelUsed==1)
							usr.TierSX("BerserkerArmor1")
						if(src.LevelUsed==2)
							usr.TierSX("BerserkerArmor2")
						if(src.LevelUsed==3)
							usr.TierSX("BerserkerArmor3")
						if(src.LevelUsed==4)
							usr.TierSX("BerserkerArmor4")
						if(src.LevelUsed==5)
							usr.TierSX("BerserkerArmor5")
						if(src.LevelUsed==6)
							usr.TierSX("BerserkerArmorC")

//						if(usr.BerserkerMod<=3)
							/*if(usr.BerserkerInsanity == 0)
								usr.BerserkerInsanity=1*/
//							usr.TierSX("BerserkerArmor3", src)
//							return
//						if(usr.BerserkerMod==4)
							/*if(usr.BerserkerInsanity == 0)
								usr.BerserkerInsanity=1*/
//							usr.TierSX("BerserkerArmor4", src)
//							return
//					if(src.LevelUsed==2)
//						if(usr.BerserkerMod==1)
//							usr.TierSX("BerserkerArmorA", src)
//						if(usr.BerserkerMod==2)
//							usr.TierSX("BerserkerArmorB", src)
//						if(usr.BerserkerMod>=2)
//							usr << "You cannot control the corrupted Od of this armor..."
//							src.LevelUsed=0
//							return
//					if(src.LevelUsed==6)
//						usr.TierSX("BerserkerArmorC", src)

			VisoredMask
				desc="Be engulfed by the hollow of your soul."
				verb/Vaizard_Mask()
					set category="Skills"
					if(usr.VisoredStage>=0)
						if(!locate(/obj/Skills/Attacks/Beams/Cero,usr.contents))
							usr.contents+=new/obj/Skills/Attacks/Beams/Cero
							usr<<"You become able to release hollow reishi..."
					if(usr.VisoredStage>=2)
						if(!locate(/obj/Skills/Attacks/Beams/GranReyCero,usr.contents))
							usr.contents+=new/obj/Skills/Attacks/Beams/GranReyCero
							usr<<"You have mastered the release of hollow reishi!"
					if(!usr.MaskType)
						usr.ShinjiSenpai()
						usr<<"Your soul is overcome with tremors..."
						return
					if(!usr.MaskAlpha)
						usr.IWouldMarryRukia()
						usr<<"The tremors die down..."
						return
					if(usr.MaskType=="Physical")
						if(usr.VisoredStage==1)
							usr.TierSX("PhysicalMask1", src)
						if(usr.VisoredStage==2)
							usr.TierSX("PhysicalMask2", src)
						if(usr.VisoredStage==3)
							usr.TierSX("PhysicalMask3", src)
						if(usr.VisoredStage==4)
							usr.TierSX("PhysicalFullHollow", src)
					if(usr.MaskType=="Reiatsu")
						if(usr.VisoredStage==1)
							usr.TierSX("ReiatsuMask1", src)
						if(usr.VisoredStage==2)
							usr.TierSX("ReiatsuMask2", src)
						if(usr.VisoredStage==3)
							usr.TierSX("ReiatsuMask3", src)
						if(usr.VisoredStage==4)
							usr.TierSX("ReiatsuFullHollow", src)
					if(usr.MaskType=="Balanced")
						if(usr.VisoredStage==1)
							usr.TierSX("BalancedMask1", src)
						if(usr.VisoredStage==2)
							usr.TierSX("BalancedMask2", src)
						if(usr.VisoredStage==3)
							usr.TierSX("BalancedMask3", src)
						if(usr.VisoredStage==4)
							usr.TierSX("BalancedFullHollow", src)
					if(usr.MaskType=="Conductor")
						usr.TierSX("ConductorMask", src)

			Experiment
				var/LevelUsed
				desc="Delve into the depths of science and morality..."
				verb/Experiment()
					set category="Skills"
					if(usr.MadScientist < 1)
						usr.MadScientist=1
					if(src.LevelUsed < usr.MadScientist)
						usr<< "Your studies have been fruitful as of late..."
						while(src.LevelUsed < usr.MadScientist)
							src.LevelUsed++
							if(src.LevelUsed==1)
								if(usr.MadScientistType)
									usr<< "You have already acheived the height of science in a particular field! Go wild!"
									usr.Intelligence*=1.25
									return
								usr.BasicStudies()
								usr.Intelligence*=1.1
								return
							if(src.LevelUsed==2)
								usr.AdvancedStudies()
								if(usr.MadScientistType)
									usr<< "You have already acheived the height of science in a particular field! Go wild!"
									usr.Intelligence*=1.5
									return
								usr.BasicStudies()
								usr.Intelligence*=1.25
								return
							if(src.LevelUsed==3)
								if(usr.MadScientistType)
									usr<< "You have already acheived the height of science in a particular field! Go wild!"
									usr.Intelligence*=2
									return
								usr.BasicStudies()
								usr.Intelligence*=1.5
								return
							if(src.LevelUsed==4)
								if(usr.MadScientistType)
									usr<< "You have already acheived the height of science in a particular field! Go wild!"
									usr.Intelligence*=2
									return
								usr.BasicStudies()
								usr.Intelligence*=1.5
								return
							if(src.LevelUsed==5)
								usr.TabooStudies()
								return
							if(src.LevelUsed>=6)
								usr<< "You need not study anymore... just ravage the world with your knowledge!"
								return

			SpiritEnergyNu
				var/LevelUsed
				desc="Tap into your innate spiritual power."
				verb/Spirit_Energy()
					set category="Skills"
					if(usr.SpiritLevel < 1)
						usr.SpiritLevel=1
					if(!src.LevelUsed)
						src.LevelUsed = usr.ChooseSpiritEnergyLevel()
					if(src.LevelUsed==0)
						return
					if(src.LevelUsed==1)
						usr.TierSX("SpiritEnergy1", src)
						return
					if(src.LevelUsed==2)
						if(!usr.SpiritWeaponChosen)
							usr.ChooseSpiritWeapon()
						usr.TierSX("SpiritEnergy2", src)
						return
					if(src.LevelUsed==3)
						usr.TierSX("SpiritEnergy3", src)
						if(!usr.LocateSpiritT3())
							usr.GetSpiritT3()
						return
					if(src.LevelUsed==4)
						usr.TierSX("SpiritEnergy4", src)
						if(!usr.LocateSpiritT4())
							usr.GetSpiritT4()
						return
					if(src.LevelUsed==5)
						usr.TierSX("SacredEnergy", src)
						return
			DemonEnergy
				var/LevelUsed
				desc="Tap into your innate demonic power."
				verb/Demon_Energy()
					set category="Skills"
					if(usr.SpiritLevel < 1)
						usr.SpiritLevel=1
					if(!src.LevelUsed)
						src.LevelUsed = usr.ChooseSpiritEnergyLevel()
					if(src.LevelUsed==0)
						return
					if(src.LevelUsed==1)
						usr.TierSX("DemonEnergy1", src)
					if(src.LevelUsed==2)
						if(!usr.SpiritWeaponChosen)
							usr.ChooseDemonWeapon()
						usr.TierSX("DemonEnergy2", src)
					if(src.LevelUsed==3)
						usr.TierSX("DemonEnergy3", src)
						if(!usr.LocateDemonT3())
							usr.GetDemonT3()
					if(src.LevelUsed==4)
						usr.TierSX("DemonEnergy4", src)
						if(!usr.LocateDemonT4())
							usr.GetDemonT4()
					if(src.LevelUsed==5)
						usr.TierSX("SacredEnergy", src)
			SacredEnergyArmorNuNu
				var/ArmorUsed
				desc="Cloak yourself in a mantle with the power to change the world."
				verb/Sacred_Energy_Offense()
					set category="Skills"
					set name="Sacred Energy Armor: Offense"
					if(src.ArmorUsed==null||src.ArmorUsed=="Offense")
						usr.TierSX("SacredEnergyArmorOffense", src)
					else
						usr << "You cannot stack Sacred Energy Armors."
				verb/Sacred_Energy_Defense()
					set category="Skills"
					set name="Sacred Energy Armor: Defense"
					if(src.ArmorUsed==null||src.ArmorUsed=="Defense")
						usr.TierSX("SacredEnergyArmorDefense", src)
					else
						usr << "You cannot stack Sacred Energy Armors."
			SpiritShotgun
				Cooldown=10
				sicon='Hadoken.dmi'
				verb/Spirit_Shotgun()
					set category="Skills"
					usr.TierSX("SpiritShotgun", src)
			SpiritGunMega
				Cooldown=300
				verb/Spirit_Gun_Mega()
					set category="Skills"
					usr.TierSX("SpiritGunMega", src)
			BeamSwordSlash
				Cooldown=300
				verb/Beam_Sword_Slash()
					set category="Skills"
					usr.TierSX("BeamSwordSlash", src)
			CustomStyle
				verb/Customize_Style()
					set category="Skills"
					usr.TierSX("CustomizeStyle", src)
			RefineStyle
				verb/Add_Style_Effect()
					set category="Skills"
					usr.TierSX("AddStyleEffect", src)
				verb/Clear_Style_Effects()
					set category="Skills"
					usr.TierSX("ClearStyleEffects", src)
			DemonGun
			DemonGunBarrage
			DemonGunMega
			PercentagePower
			FingerFlip
			AuraProjection
			ArmSweep//nope.


			KamuiNu
				var/UsedBuff
				var/UsedSpecial
				var/LevelUsed
				verb/Kamui()
					set category="Skills"
					if(usr.SexyMod < 1)
						usr.SexyMod=1
					if(usr.SexyMod==3&&!usr.PerfectSyncKamui)
						usr.PerfectSyncKamui=1
						usr << "You learn to perfectly synchronize with your Kamui, lending you incredible energy!"
					if(usr.LifeFiberFusion==10&&usr.Zenkai_Rate!=50)
						usr.Zenkai_Rate=50
						usr << "Your body has learned to knit itself back together stronger after every defeat!"
					while(usr.LifeFiberTriggered < usr.LifeFiberFusion)
						usr.LifeFiberTriggered++
						if(usr.LifeFiberTriggered < 6)
							usr.AllMult(1.05)
						if(usr.LifeFiberTriggered==1)
							usr.ChooseKamuiForm()
						if(usr.LifeFiberTriggered==2)
							usr.contents+=new/obj/Skills/TierS/ManifestScissorBladeNu
							usr << "You learn to force your weapon to take the form of a scissor blade!"
						if(usr.LifeFiberTriggered==3)
							usr.ChooseKamuiForm()
						if(usr.LifeFiberTriggered==4)
							usr.ChooseKamuiForm()
						if(usr.LifeFiberTriggered==5)
							usr.contents+=new/obj/Skills/TierS/KamuiRegenNu
							usr << "You learn to knit your body back together with Life Fibers!"
						if(usr.LifeFiberTriggered>5)
							usr.Regeneration+=0.5
							usr.Recovery+=0.25
					if(usr.SexyMod==1||src.LevelUsed==1)
						usr.TierSX("Kamui1", src)
					if(usr.SexyMod==2||src.LevelUsed==2)
						usr.TierSX("Kamui2", src)
					if(usr.SexyMod==3||src.LevelUsed==3)
						usr.TierSX("Kamui3", src)
			SenjinNu
				var/UsedBuff
				var/UsedSpecial
				var/LevelUsed
				verb/Kamui_Senjin()
					set category="Skills"
					if(usr.SexyMod < 1)
						usr.SexyMod=1
					if(usr.SexyMod==1||src.LevelUsed==1)
						usr.TierSX("KamuiSenjin1", src)
					if(usr.SexyMod==2||src.LevelUsed==2)
						usr.TierSX("KamuiSenjin2", src)
					if(usr.SexyMod==3||src.LevelUsed==3)
						usr.TierSX("KamuiSenjin3", src)
			ShippuNu
				var/UsedBuff
				var/UsedSpecial
				var/LevelUsed
				verb/Kamui_Shippu()
					set category="Skills"
					if(usr.SexyMod < 1)
						usr.SexyMod=1
					if(usr.SexyMod==1||src.LevelUsed==1)
						usr.TierSX("KamuiShippu1", src)
					if(usr.SexyMod==2||src.LevelUsed==2)
						usr.TierSX("KamuiShippu2", src)
					if(usr.SexyMod==3||src.LevelUsed==3)
						usr.TierSX("KamuiShippu3", src)
			SenjinShippu
				var/UsedBuff
				var/UsedSpecial
				var/LevelUsed
				verb/Senjin_Shippu()
					set category="Skills"
					if(usr.SexyMod < 2)
						usr.SexyMod=2
					if(usr.SexyMod==2||src.LevelUsed==2)
						usr.TierSX("SenjinShippu2", src)
					if(usr.SexyMod==3||src.LevelUsed==3)
						usr.TierSX("SenjinShippu3", src)
			KamuiRegenNu
				Cooldown=600
				verb/Kamui_Regeneration()
					set category="Skills"
					usr.TierSX("KamuiRegen", src)
			ManifestScissorBladeNu
				verb/Manifest_Scissor_Blade()
					set category="Skills"
					usr.TierSX("ManifestScissorBlade", src)

			ManifestKeyblade
				desc="Call your very own keyblade."
				verb/Dive_To_The_Heart()
					set category="Skills"
					usr.TierSX("ManifestKeyblade", src)
			BestowKeyblade
				desc="Give up your keyblade to someone else."
				verb/Bestow_Keyblade()
					set category="Skills"
					usr.TierSX("BestowKeyblade", src)
			Finisher
				desc="Finish your string of attacks with one massive hit!  The element can be set to different things."
				var/FinisherType="Physical"
				Cooldown=60
				verb/Finisher()
					set category="Skills"
					usr.TierSX("Finisher", src)
				verb/Set_Finisher()
					set category="Other"
					usr.TierSX("SetFinisher", src)
			EventHorizon
				desc="An overwhelming combo with a stunning finish."
				verb/Event_Horizon()
					set category="Skills"
					usr.TierSX("EventHorizon", src)
			DarkMode
				desc="Call forth the darkness that lies within your heart."
				verb/Dark_Mode()
					set category="Skills"
					usr.TierSX("DarkMode", src)
			FatalMode
				desc="is that the best you can do?"
				verb/Fatal_Mode()
					set category="Skills"
					usr.TierSX("FatalMode", src)
			DarkBreak
				desc="A combo to devestate your enemy."
				verb/Dark_Break()
					set category="Skills"
					usr.TierSX("DarkBreak", src)
			DriveForm
				var/KeybladeLevelSelected
				var/SpamLockout
				desc="Wield two keyblades at once and imbue yourself with extra strength."
				verb/Drive_Form()
					set category="Skills"
					usr.TierSX("DriveForm", src)



			FlashOfHope
				var/PreHopeEnergy=null
				var/PreHopeRecovery=null
				verb
					Flash_of_Hope()
						set category="Skills"
						usr.TierSX("FlashOfHope", src)
			HopeOverload
				verb
					Overload()
						set category="Skills"
						usr.TierSX("Overload", src)
			Haki
				var
					UsingObservation
					UsingArmament
					StatsUsed
				verb
					Observation_Haki()
						set category="Skills"
						if(!src.UsingArmament)
							usr.TierSX("ObservationHaki", src)
						else
							usr << "You can't use Observation Haki while using Armament Haki."
					Armament_Haki()
						set category="Skills"
						if(!src.UsingObservation)
							usr.TierSX("ArmamentHaki", src)
						else
							usr << "You can't use Armament Haki while using Observation Haki."