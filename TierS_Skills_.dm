mob
	proc
		TierSX(var/wut, var/obj/Skills/Z)
			switch(wut)
				if("WeaponSoul")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "You're already using a primary buff."
							return
						var/obj/Items/Sword/s=src.EquippedSword()
						if(!s)
							src << "You need to wield a sword to use Weapon Soul."
							return
						src.ActiveBuffs=3
						Z.BuffUsing=1
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.25
						src.SpeedMultiplier*=1.35
						src.OffenseMultiplier*=1.25
						src.OMessage(10, "[src]'s soul flows into their weapon...", "[src]([src.key]) used Weapon Soul.")
					else
						src.ActiveBuffs=0
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.25
						src.SpeedMultiplier/=1.35
						src.OffenseMultiplier/=1.25
						src.OMessage(10, "[src] halts the flow of soul into their weapon.", "[src]([src.key]) deactivated Weapon Soul.")
				if("HolyBlade")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "You're already using a primary buff."
							return
						var/obj/Items/Sword/s=src.EquippedSword()
						if(!s)
							src << "You need to wield a sword to use Holy Blade."
							return
						src.ActiveBuffs=3
						Z.BuffUsing=1
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.25
						src.SpeedMultiplier*=1.5
						src.HolyBlade=1
						src.overlays+=image(icon='AurasBig.dmi',icon_state="Demi",pixel_x=-32)
						src.OMessage(10, "[src]'s radiant soul calls forth a holy blade!", "[src]([src.key]) used Holy Blade.")
					else
						src.ActiveBuffs=0
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.25
						src.SpeedMultiplier/=1.5
						src.HolyBlade=0
						src.overlays-=image(icon='AurasBig.dmi',icon_state="Demi",pixel_x=-32)
						src.OMessage(10, "[src] releases the power of a holy blade...", "[src]([src.key]) deactivated Holy Blade.")
				if("CorruptEdge")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "You're already using a primary buff."
							return
						var/obj/Items/Sword/s=src.EquippedSword()
						if(!s)
							src << "You need to wield a sword to use Corrupt Edge."
							return
						src.ActiveBuffs=3
						Z.BuffUsing=1
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.75
						src.OffenseMultiplier*=1.25
						src.CorruptEdge=1
						src.overlays+=image(icon='AurasBig.dmi',icon_state="",pixel_x=-32)
						src.OMessage(10, "[src]'s darkness calls forth a cursed blade!", "[src]([src.key]) used Corrupt Edge.")
					else
						src.ActiveBuffs=0
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.75
						src.OffenseMultiplier/=1.25
						src.CorruptEdge=0
						src.overlays-=image(icon='AurasBig.dmi',icon_state="",pixel_x=-32)
						src.OMessage(10, "[src] halts the flow of soul into their weapon.", "[src]([src.key]) deactivated Corrupt Edge.")
				if("DualWield")
					if(!Z.BuffUsing)
						var/obj/Items/Sword/s=src.EquippedSword()
						if(!s)
							src << "You need to wield a sword to dual wield."
							return
						src.MakeDualWield(s)
						Z.BuffUsing=1
						src.SpeedMultiplier*=1.5
						src.DualWield=1
						src.SwordAccuracy=1.5
						src.OMessage(10, "[src] draws a second blade from the depths of their soul!", "[src]([src.key]) used Dual Wield.")
					else
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.SpeedMultiplier/=1.5
						src.DualWield=0
						src.SwordAccuracy=1
						src.OMessage(10, "[src] sheathes their second blade...", "[src]([src.key]) deactivated Dual Wield.")
				if("Kusanagi")
					if(!Z.BuffUsing)
						var/obj/Items/Sword/s=src.EquippedSword()
						if(!s)
							src << "You need to wield a sword to call on Kusanagi."
							return
						if(src.ActiveBuffs)
							src << "You already have a primary buff on."
							return
						src.MakeKusanagi(s)
						Z.BuffUsing=1
						src.HolyBlade=2
						src.Kusanagi=1
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=1.25
						src.OffenseMultiplier*=1.25
						src.DefenseMultiplier*=1.25
						src.overlays+=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays+=image(icon='KusanagiSparks.dmi')
						src.OMessage(10, "<font color='#CCCCCC'>[src] calls forth Kusanagi, the Sword of Faith, from the depths of their soul!</font color>", "[src]([src.key]) used Kusanagi.")
					else
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.HolyBlade=0
						src.Kusanagi=0
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=1.25
						src.OffenseMultiplier/=1.25
						src.DefenseMultiplier/=1.25
						src.overlays-=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='KusanagiSparks.dmi')
						src.OMessage(10, "<font color='#CCCCCC'>[src] releases Kusanagi back to the light...</font color>", "[src]([src.key]) deactivated Kusanagi.")
				if("Durendal")
					if(!Z.BuffUsing)
						var/obj/Items/Sword/s=src.EquippedSword()
						if(!s)
							src << "You need to wield a sword to call on Durendal."
							return
						if(src.ActiveBuffs)
							src << "You already have a primary buff on."
							return
						src.MakeDurendal(s)
						Z.BuffUsing=1
						src.HolyBlade=2
						src.Durendal=1
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.75
						src.overlays+=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays+=image(icon='DurendalSparks.dmi')
						src.OMessage(10, "<font color='#CCCCCC'>[src] calls forth Durendal, the Sword of Hope, from the depths of their soul!</font color>", "[src]([src.key]) used Durendal.")
					else
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.HolyBlade=0
						src.Durendal=0
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.75
						src.overlays-=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='DurendalSparks.dmi')
						src.OMessage(10, "<font color='#CCCCCC'>[src] releases Durendal back to the light...</font color>", "[src]([src.key]) deactivated Durendal.")
				if("Masamune")
					if(!Z.BuffUsing)
						var/obj/Items/Sword/s=src.EquippedSword()
						if(!s)
							src << "You need to wield a sword to call on Masamune."
							return
						if(src.ActiveBuffs)
							src << "You already have a primary buff on."
							return
						src.MakeMasamune(s)
						Z.BuffUsing=1
						src.HolyBlade=2
						src.Masamune=1
						src.Power_Multiplier+=0.5
						src.EnduranceMultiplier*=1.5
						src.DefenseMultiplier*=1.5
						src.overlays+=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays+=image(icon='MasamuneSparks.dmi')
						src.OMessage(10, "<font color='#CCCCCC'>[src] calls forth Masamune, the Sword of Purity, from the depths of their soul!</font color>", "[src]([src.key]) used Masamune.")
					else
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.HolyBlade=0
						src.Masamune=0
						src.Power_Multiplier-=0.5
						src.EnduranceMultiplier/=1.5
						src.DefenseMultiplier/=1.5
						src.overlays-=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='MasamuneSparks.dmi')
						src.OMessage(10, "<font color='#CCCCCC'>[src] releases Masamune back to the light...</font color>", "[src]([src.key]) deactivated Masamune.")
				if("TripleWield")
					if(!Z.BuffUsing)
						var/obj/Items/Sword/s=src.EquippedSword()
						if(!s)
							src << "You need to wield a sword to triple wield."
							return
						src.MakeTripleWield(s)
						Z.BuffUsing=1
						src.SpeedMultiplier*=1.5
						src.SpeedMultiplier*=1.5
						src.DualWield=1
						src.TripleWield=1
						src.SwordAccuracy=2.25
						src.OMessage(10, "[src]'s three swords burst from the sea of their soul!", "[src]([src.key]) used Triple Wield.")
					else
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.SpeedMultiplier/=1.5
						src.SpeedMultiplier/=1.5
						src.DualWield=0
						src.TripleWield=0
						src.SwordAccuracy=1
						src.OMessage(10, "[src] withdraws their trifecta of weaponry...", "[src]([src.key]) deactivated Triple Wield.")
				if("SoulCalibur")
					if(!Z.BuffUsing)
						var/obj/Items/Sword/s=src.EquippedSword()
						if(src.ActiveBuffs)
							src << "You're already using a primary buff."
							return
						if(!s)
							src << "You need a sword equipped to use Soul Calibur."
							return
						src.MakeSoulCalibur(s)
						src.ActiveBuffs=3
						Z.BuffUsing=1
						src.SoulCalibur=1
						src.Power_Multiplier+=0.5
						src.EnduranceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.DefenseMultiplier*=1.25
						src.overlays+=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays+=image(icon='MasamuneSparks.dmi')
						src.OMessage(10, "<font color='#0000FF'>[src] calls forth Soul Calibur, the Blade of Order, from the depths of their soul!</font color>", "[src]([src.key]) used Soul Calibur.")
					else
						src.ActiveBuffs=0
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.SoulCalibur=0
						src.Power_Multiplier-=0.5
						src.EnduranceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.DefenseMultiplier/=1.25
						src.overlays-=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='MasamuneSparks.dmi')
						src.OMessage(10, "<font color='#0000FF'>[src] releases Soul Calibur back into the sea of their soul...</font color>", "[src]([src.key]) deactivated Soul Calibur.")
				if("SoulEdge")
					if(!Z.BuffUsing)
						var/obj/Items/Sword/s=src.EquippedSword()
						if(src.ActiveBuffs)
							src << "You're already using a primary buff."
							return
						if(!s)
							src << "You need a sword equipped to use Soul Edge."
							return
						src.MakeSoulEdge(s)
						src.ActiveBuffs=3
						Z.BuffUsing=1
						src.SoulEdge=1
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.25
						src.OffenseMultiplier*=1.25
						src.overlays+=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.overlays+=image(icon='DurendalSparks.dmi')
						src.OMessage(10, "<font color='#FF0000'>[src] calls forth Soul Edge, the Eye of Chaos, from the depths of their soul!</font color>", "[src]([src.key]) used Soul Edge.")
					else
						src.ActiveBuffs=0
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.SoulEdge=0
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.25
						src.OffenseMultiplier/=1.25
						src.overlays-=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='DurendalSparks.dmi')
						src.OMessage(10, "<font color='#FF0000'>[src] releases Soul Edge back into the sea of their soul...</font color>", "[src]([src.key]) deactivated Soul Edge.")
				if("Muramasa")
					if(!Z.BuffUsing)
						var/obj/Items/Sword/s=src.EquippedSword()
						if(src.ActiveBuffs)
							src << "You're already using a primary buff."
							return
						if(!s)
							src << "You need a sword equipped to use Muramasa."
							return
						src.MakeMuramasa(s)
						src.ActiveBuffs=3
						Z.BuffUsing=1
						src.Muramasa=1
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.5
						src.SpeedMultiplier*=1.5
						src.overlays+=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.overlays+=image(icon='KusanagiSparks.dmi')
						src.OMessage(10, "<font color='#666666'>[src] calls forth Muramasa, the Bane of Blades, from the depths of their soul!</font color>", "[src]([src.key]) used Soul Edge.")
					else
						src.ActiveBuffs=0
						Z.BuffUsing=0
						Z:LevelUsed=null
						src.Muramasa=0
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.5
						src.SpeedMultiplier/=1.5
						src.overlays-=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='KusanagiSparks.dmi')
						src.OMessage(10, "<font color='#666666'>[src] releases Muramasa back into the sea of their soul...</font color>", "[src]([src.key]) deactivated Soul Edge.")
				if("LightBringer")
					if(!Z.BuffUsing)
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						if(!src.Kusanagi)
							src << "You have to use Kusanagi to trigger Light Bringer."
							return
						Z.BuffUsing=1
						src.SpecialSlot=1
						src.Kusanagi=2
						src.StrengthMultiplier*=1.5
						src.overlays-=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='KusanagiSparks.dmi')
						src.overlays+=image(icon='T3HolyAura.dmi',icon_state="Green",pixel_x=-32)
						src.OMessage(10, "<font color='#CCFFCC'>[src] erupts with an aura of vitality: <b>Light Bringer!</b></font color>", "[src]([src.key]) used Light Bringer.")
					else
						Z.BuffUsing=0
						src.SpecialSlot=0
						src.Kusanagi=0
						src.StrengthMultiplier/=1.5
						src.overlays-=image(icon='T3HolyAura.dmi',icon_state="Green",pixel_x=-32)
						src.OMessage(10, "<font color='#CCFFCC'>[src] mutes their soul's immense life force...</b></font color>", "[src]([src.key]) deactivated Light Bringer.")
				if("DawnTreader")
					if(!Z.BuffUsing)
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						if(!src.Durendal)
							src << "You have to use Durendal to trigger Dawn Treader."
							return
						Z.BuffUsing=1
						src.SpecialSlot=1
						src.Durendal=2
						src.EnduranceMultiplier*=1.5
						src.overlays-=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='DurendalSparks.dmi')
						src.overlays+=image(icon='T3HolyAura.dmi',icon_state="Red",pixel_x=-32)
						src.OMessage(10, "<font color='#FFCCCC'>[src] radiates with overwhelming courage: <b>Dawn Treader!</b></font color>", "[src]([src.key]) used Dawn Treader.")
					else
						Z.BuffUsing=0
						src.SpecialSlot=0
						src.Durendal=0
						src.EnduranceMultiplier/=1.5
						src.overlays-=image(icon='T3HolyAura.dmi',icon_state="Red",pixel_x=-32)
						src.OMessage(10, "<font color='#FFCCCC'>[src] reigns in their robust bravery...</b></font color>", "[src]([src.key]) deactivated Dawn Treader.")
				if("SolZenith")
					if(!Z.BuffUsing)
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						if(!src.Masamune)
							src << "You have to use Masamune to trigger Sol Zenith."
							return
						Z.BuffUsing=1
						src.SpecialSlot=1
						src.Masamune=2
						src.OffenseMultiplier*=1.25
						src.DefenseMultiplier*=1.25
						src.overlays-=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='MasamuneSparks.dmi')
						src.overlays+=image(icon='T3HolyAura.dmi',icon_state="Blue",pixel_x=-32)
						src.OMessage(10, "<font color='#CCCCFF'>[src] pours out a deluge of kindness: <b>Sol Zenith!</b></font color>", "[src]([src.key]) used Sol Zenith.")
					else
						Z.BuffUsing=0
						src.SpecialSlot=0
						src.Durendal=0
						src.OffenseMultiplier/=1.25
						src.DefenseMultiplier/=1.25
						src.overlays-=image(icon='T3HolyAura.dmi',icon_state="Blue",pixel_x=-32)
						src.OMessage(10, "<font color='#CCCCFF'>[src] siphons the flow of their kindness...</b></font color>", "[src]([src.key]) deactivated Sol Zenith.")
				if("WeaponMastersFury")
					if(!Z.BuffUsing)
						var/obj/Items/Sword/s=src.EquippedSword()
						if(src.SpecialSlot)
							src << "You're already using a secondary buff."
							return
						if(!s)
							src << "You need to wear a sword to use Weapon Master's Fury."
							return
						Z.BuffUsing=1
						src.SpecialSlot=1
						src.StrengthMultiplier*=2
						src.WeaponMaster=1
						src.OMessage(10, "<font color='#555555'>[src]'s soul surges with fury: <b>Weapon Master's Fury!</b></font color>","[src]([src.key]) used Weapon Master's Fury.")
					else
						Z.BuffUsing=0
						src.SpecialSlot=0
						src.StrengthMultiplier/=2
						src.WeaponMaster=0
						src.OMessage(10, "<font color='#555555'>[src] quiets the rage of their soul...</font color>","[src]([src.key]) deactivated Weapon Master's Fury.")
				if("SoulSanctum")
					if(!Z.BuffUsing)
						if(src.SpecialSlot)
							src << "You're already using a secondary buff."
							return
						if(!src.SoulCalibur)
							src << "You have to use Soul Calibur to use Soul Sanctum."
							return
						Z.BuffUsing=1
						src.SpecialSlot=1
						src.SoulCalibur=2
						src.EnduranceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.overlays-=image(icon='T3HolyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='MasamuneSparks.dmi')
						src.overlays+=image(icon='T3UnholyAura.dmi',icon_state="Blue",pixel_x=-32)
						src.OMessage(10, "<font color='#333355'>[src] binds their will to order itself: <b>Soul Sanctum!</b></font color>", "[src]([src.key]) used Soul Sanctum.")
					else
						Z.BuffUsing=0
						src.SpecialSlot=0
						src.SoulCalibur=0
						src.EnduranceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.overlays-=image(icon='T3UnholyAura.dmi',icon_state="Blue",pixel_x=-32)
						src.OMessage(10, "<font color='#333355'>[src]'s resolution unravels...</font color>", "[src]([src.key]) deactivated Soul Sanctum.")
				if("SoulSlayer")
					if(!Z.BuffUsing)
						if(src.SpecialSlot)
							src << "You're already using a secondary buff."
							return
						if(!src.SoulEdge)
							src << "You have to use Soul Edge to use Soul Slayer."
							return
						Z.BuffUsing=1
						src.SpecialSlot=1
						src.SoulEdge=2
						src.StrengthMultiplier*=1.5
						src.overlays-=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='DurendalSparks.dmi')
						src.overlays+=image(icon='T3UnholyAura.dmi',icon_state="Red",pixel_x=-32)
						src.OMessage(10, "<font color='#553333'>[src] surrenders their mind to destruction: <b>Soul Slayer!</b></font color>", "[src]([src.key]) used Soul Slayer.")
					else
						Z.BuffUsing=0
						src.SpecialSlot=0
						src.SoulEdge=0
						src.StrengthMultiplier/=1.5
						src.overlays-=image(icon='T3UnholyAura.dmi',icon_state="Red",pixel_x=-32)
						src.OMessage(10, "<font color='#553333'>[src] draws together the shattered fragments of their will...</font color>", "[src]([src.key]) used Soul Slayer.")
				if("SoulSanguine")
					if(!Z.BuffUsing)
						if(src.SpecialSlot)
							src << "You're already using a secondary buff."
							return
						if(!src.Muramasa)
							src << "You have to use Muramasa to use Soul Sanguine."
							return
						Z.BuffUsing=1
						src.SpecialSlot=1
						src.Muramasa=2
						src.StrengthMultiplier*=1.25
						src.OffenseMultiplier*=1.25
						src.overlays-=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='KusanagiSparks.dmi')
						src.overlays+=image(icon='T3UnholyAura.dmi',icon_state="Green",pixel_x=-32)
						src.OMessage(10, "<font color='#335533'>[src]'s heart flows into their weapon, allowing it to steal the souls of others: <b>Soul Sanguine!</b>", "[src]([src.key]) used Soul Sanguine.")
					else
						Z.BuffUsing=0
						src.SpecialSlot=0
						src.Muramasa=0
						src.StrengthMultiplier/=1.25
						src.OffenseMultiplier/=1.25
						src.overlays-=image(icon='T3UnholyAura.dmi',icon_state="Green",pixel_x=-32)
						src.OMessage(10, "<font color='#335533'>[src] contains their rotten soul...", "[src]([src.key]) deactivated Soul Sanguine.")

				if("BlackOriginThreshold")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						if(src.Alert("Are you sure you want to enter this? It -can- kill you."))
							src.ActiveBuffs+=3
							src.SpecialSlot=1
							Z.BuffUsing=1
							src.Berserkering=1
							src.EarthAndHeaven=1
							src.overlays+=image(icon='BlackOrigin.dmi')
							src.OMessage(20,"[src] becomes eerily still as thick ki trails from their mouth and fists rapidly, their eyes growing blank...", "[src]([src.key]) entered The Black Origin Threshold.")
							src.Power_Multiplier+=2.5
							src.Anger=src.AngerMax
					else
						if(src.BerserkerInsanityLock==1)
							src << "You can no longer leave The Black Origin Threshold..."
							return
						if(src.BlackOriginLock)
							src << "Your inner mind is trembling too hard for you to concentrate..."
							return
						if(src.BerserkerInsanity)
							if(prob(25))
								src << "You tried to return to the forefront of your mind... it didn't work."
								src.BlackOriginLock=1
								sleep(20)
								src.BlackOriginLock=0
								src << "Your inner mind becomes steady enough to try to leave again, if you wish..."
								return
						src.OMessage(20,"[src] grows still, their ki returning to normal...", "[src]([src.key]) somehow survived The Black Origin Threshold")
						src.overlays-=image(icon='BlackOrigin.dmi')
						src.Power_Multiplier-=2.5
						src.Anger=1
						src.ActiveBuffs-=3
						src.SpecialSlot=0
						src.EarthAndHeaven=0
						Z.BuffUsing=0
						src.BerserkerInsanity=0
						src.Berserkering=0
						src.EarthAndHell=0

			/*	if("BerserkerArmor1")
					if(!Z.BuffUsing)
						Z.BuffUsing=1
						Z:LevelUsed=1
						src.Berserkering=1
						src.overlays+=image(icon='GutsHelm.dmi')
						src.overlays+=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] is consumed by enchanted armor...!?", "[src]([src.key]) wore T1 Berserker Armor.")
						src.Power_Multiplier+=0.25
						src.Anger=src.AngerMax
					else
						if(src.BerserkerInsanityLock==1)
							src << "You cannot tear free from the armor..."
							return
						src.overlays-=image(icon='GutsHelm.dmi')
						src.overlays-=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] pulls themself free from the armor...", "[src]([src.key]) tore off T1 Berserker Armor.")
						src.Power_Multiplier-=0.25
						src.Anger=1
						Z.BuffUsing=0
						Z:LevelUsed=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0

				if("BerserkerArmor2")
					if(!Z.BuffUsing)
						Z.BuffUsing=1
						Z:LevelUsed=1
						src.Berserkering=1
						src.overlays+=image(icon='GutsHelm.dmi')
						src.overlays+=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] is forcibly restrained by enchanted armor...!?", "[src]([src.key]) wore T2 Berserker Armor.")
						src.Power_Multiplier+=0.5
						src.Anger=src.AngerMax
					else
						if(src.BerserkerInsanityLock==1)
							src << "You cannot tear free from the armor..."
							return
						src.overlays-=image(icon='GutsHelm.dmi')
						src.overlays-=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] pulls themself free from the armor...", "[src]([src.key]) tore off T2 Berserker Armor.")
						src.Power_Multiplier-=0.5
						src.Anger=1
						Z.BuffUsing=0
						Z:LevelUsed=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.Berserkering=0 */

				if("BerserkerArmor3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						Z:LevelUsed=3
						src.Berserkering=3
						src.overlays+=image(icon='GutsHelm.dmi')
						src.overlays+=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] unleashes a wild scream as their armor overcomes them!?", "[src]([src.key]) wore T3 Berserker Armor.")
						src<<"Your body screams for blood and revenge... It's become immensely hard to hold back your malicious wants and desires."
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.SpeedMultiplier*=1.5
						src.Anger=src.AngerMax
					else
						if(src.BerserkerInsanityLock==1)
							src << "You cannot tear free from the armor..."
							return
						src.overlays-=image(icon='GutsHelm.dmi')
						src.overlays-=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] somehow pulls themself free from the armor...", "[src]([src.key]) tore off T3 Berserker Armor.")
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.SpeedMultiplier/=1.5
						src.Anger=1
						src.ActiveBuffs-=3
						src.SpecialSlot=0
						Z.BuffUsing=0
						Z:LevelUsed=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.Berserkering=0

				if("BerserkerArmor4")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						Z:LevelUsed=4
						src.Berserkering=4
						src.overlays+=image(icon='GutsHelm.dmi')
						src.overlays+=image(icon='GutsArmor.dmi')
						src.overlays+=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.OMessage(20,"[src]'s armor begins to devour any mercy and compassion within them!!", "[src]([src.key]) wore T4 Berserker Armor.")
						src<<"Your body has never lusted for this much death and destruction. You will spare no one."
						src.Power_Multiplier+=0.7
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.SpeedMultiplier*=1.5
						src.Anger=src.AngerMax
					else
						if(src.BerserkerInsanityLock==1)
							src << "You cannot tear free from the armor..."
							return
						src.overlays-=image(icon='GutsHelm.dmi')
						src.overlays-=image(icon='GutsArmor.dmi')
						src.overlays-=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.OMessage(20,"[src] somehow survives pulling themself free from the armor...", "[src]([src.key]) tore off T4 Berserker Armor.")
						src.Power_Multiplier-=0.7
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.SpeedMultiplier/=1.5
						src.Anger=1
						src.ActiveBuffs-=3
						src.SpecialSlot=0
						Z.BuffUsing=0
						Z:LevelUsed=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.Berserkering=0

				if("BerserkerArmor5")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						Z:LevelUsed=5
						src.Berserkering=5
						src.overlays+=image(icon='GutsHelm.dmi')
						src.overlays+=image(icon='GutsArmor.dmi')
						src.overlays+=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.OMessage(20,"[src] is bitten into firmly by their armor!?", "[src]([src.key]) wore T4 Berserker Armor.")
						src<<"Your body has never lusted for this much death and destruction. You will spare no one."
						src.Power_Multiplier+=1
						src.StrengthMultiplier*=1.75
						src.EnduranceMultiplier*=1.75
						src.ResistanceMultiplier*=1.75
						src.SpeedMultiplier*=1.5
						src.Anger=src.AngerMax
					else
						if(src.BerserkerInsanityLock==1)
							src << "You cannot tear free from the armor..."
							return
						src.overlays-=image(icon='GutsHelm.dmi')
						src.overlays-=image(icon='GutsArmor.dmi')
						src.overlays-=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.OMessage(20,"[src] somehow survives pulling themself free from the armor...", "[src]([src.key]) tore off T4 Berserker Armor.")
						src.Power_Multiplier-=1
						src.StrengthMultiplier/=1.75
						src.EnduranceMultiplier/=1.75
						src.ResistanceMultiplier/=1.75
						src.SpeedMultiplier/=1.5
						src.Anger=1
						src.ActiveBuffs-=3
						src.SpecialSlot=0
						Z.BuffUsing=0
						Z:LevelUsed=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.Berserkering=0

				if("BerserkerArmor1")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						Z:LevelUsed=1
						src.overlays+=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] is consumed by enchanted armor... but manages to keep the helmet off!?", "[src]([src.key]) wore T1 Controlled Berserker Armor.")
						src<<"You have subtle control over your benevolence and retain mercy."
						src.Power_Multiplier+=0.4
						src.StrengthMultiplier*=1.25
						src.EnduranceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.SpeedMultiplier*=1.25
						src.Anger=src.AngerMax
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "You cannot tear free from the armor..."
							return
						src.overlays-=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] pulls themself free from the armor...", "[src]([src.key]) tore off T1 Controlled Berserker Armor.")
						src.Power_Multiplier-=0.4
						src.StrengthMultiplier/=1.25
						src.EnduranceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.SpeedMultiplier/=1.25
						src.Anger=1
						src.ActiveBuffs-=3
						src.SpecialSlot=0
						Z.BuffUsing=0
						Z:LevelUsed=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.Berserkering=0

				if("BerserkerArmor2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						Z:LevelUsed=2
						src.overlays+=image(icon='GutsHelm.dmi')
						src.overlays+=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] is forcibly restrained by enchanted armor... but one of their eyes are still visible!?", "[src]([src.key]) wore T2 Controlled Berserker Armor.")
						src<<"Your ties to demonic corruption grow deeper...."
						src.Power_Multiplier+=0.45
						src.StrengthMultiplier*=1.40
						src.EnduranceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.SpeedMultiplier*=1.4
						src.Anger=src.AngerMax
						src.Berserkering=2
					else
						if(src.BerserkerInsanityLock==1)
							src << "You cannot tear free from the armor..."
							return
						src.overlays-=image(icon='GutsHelm.dmi')
						src.overlays-=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] pulls themself free from the armor...", "[src]([src.key]) tore off T2 Controlled Berserker Armor.")
						src.Power_Multiplier-=0.45
						src.StrengthMultiplier/=1.4
						src.EnduranceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.SpeedMultiplier/=1.4
						src.Anger=1
						Z.BuffUsing=0
						Z:LevelUsed=0
						src.ActiveBuffs-=3
						src.SpecialSlot=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.Berserkering=0

				if("BerserkerArmorC")
					if(!Z.BuffUsing)
						Z.BuffUsing=1
						Z:LevelUsed=6
						src.Berserkering=6
						src.overlays+=image(icon='GutsHelm.dmi')
						src.overlays+=image(icon='GutsArmor.dmi')
						src.overlays+=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.OMessage(20,"[src] merges with their armor...", "[src]([src.key]) wore T5 Berserker Armor.")
						src.Power_Multiplier+=10
						src.Anger=src.AngerMax
					else
						if(src.BerserkerInsanityLock==1)
							src << "You cannot tear free from the armor..."
							return
						src.overlays-=image(icon='T3UnholyAura.dmi',pixel_x=-32)
						src.overlays-=image(icon='GutsHelm.dmi')
						src.overlays-=image(icon='GutsArmor.dmi')
						src.OMessage(20,"[src] somehow survives pulling themself free from the armor...", "[src]([src.key]) tore off T5 Berserker Armor.")
						src.Power_Multiplier-=10
						src.Anger=1
						Z.BuffUsing=0
						Z:LevelUsed=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.Berserkering=0

				if("PhysicalMask1")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s face is engulfed by a white substance...!?", "[src]([src.key]) activated T1 Vaizard Mask.")
						src.Power_Multiplier+=0.35
						src.StrengthMultiplier*=1.35
						src.EnduranceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.OffenseMultiplier*=1.35
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s mask shatters!", "[src]([src.key]) deactivated T1 Vaizard Mask.")
						src.Power_Multiplier-=0.35
						src.StrengthMultiplier/=1.35
						src.EnduranceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.OffenseMultiplier/=1.35
						src.Berserkering=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("PhysicalMask2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s face is engulfed by a white substance...!?", "[src]([src.key]) activated T2 Vaizard Mask.")
						src.Power_Multiplier+=0.6
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=1.35
						src.ResistanceMultiplier*=1.35
						src.OffenseMultiplier*=1.5
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s mask shatters!", "[src]([src.key]) deactivated T2 Vaizard Mask.")
						src.Power_Multiplier-=0.6
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=1.35
						src.ResistanceMultiplier/=1.35
						src.OffenseMultiplier/=1.5
						src.Berserkering=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("PhysicalMask3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s face is engulfed by a white substance...!?", "[src]([src.key]) activated T3 Vaizard Mask.")
						src.Power_Multiplier+=1.1
						src.StrengthMultiplier*=1.75
						src.EnduranceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.OffenseMultiplier*=1.75
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s mask shatters!", "[src]([src.key]) deactivated T3 Vaizard Mask.")
						src.Power_Multiplier-=1.1
						src.StrengthMultiplier/=1.75
						src.EnduranceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.OffenseMultiplier/=1.75
						src.Berserkering=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("PhysicalFullHollow")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon='VastoLorde.dmi')
						src.OMessage(20,"[src]'s entire body is engulfed in a white substance!?", "[src]([src.key]) activated T4 Vaizard Mask.")
						src.Power_Multiplier+=2
						src.StrengthMultiplier*=2.5
						src.EnduranceMultiplier*=2
						src.ResistanceMultiplier*=2
						src.OffenseMultiplier*=2.5
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask material won't come off..."
							return
						src.overlays-=image(icon='VastoLorde.dmi')
						src.OMessage(20,"[src]'s body shatters!", "[src]([src.key]) deactivated T4 Vaizard Mask.")
						src.Power_Multiplier-=2
						src.StrengthMultiplier/=2.5
						src.EnduranceMultiplier/=2
						src.ResistanceMultiplier/=2
						src.OffenseMultiplier/=2.5
						src.Berserkering=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.ActiveBuffs-=3
						src.SpecialSlot=0
						Z.BuffUsing=0

				if("ReiatsuMask1")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s face is engulfed by a white substance...!?", "[src]([src.key]) activated T1 Vaizard Mask.")
						src.Power_Multiplier+=0.35
						src.ForceMultiplier*=1.35
						src.SpeedMultiplier*=1.25
						src.EnergyMax*=1.25
						src.Energy*=1.25
						src.DefenseMultiplier*=1.35
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s mask shatters!", "[src]([src.key]) deactivated T1 Vaizard Mask.")
						src.Power_Multiplier-=0.35
						src.ForceMultiplier/=1.35
						src.SpeedMultiplier/=1.25
						src.EnergyMax/=1.25
						src.Energy/=1.25
						src.DefenseMultiplier/=1.35
						src.Berserkering=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("ReiatsuMask2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s face is engulfed by a white substance...!?", "[src]([src.key]) activated T2 Vaizard Mask.")
						src.Power_Multiplier+=0.6
						src.ForceMultiplier*=1.5
						src.SpeedMultiplier*=1.35
						src.EnergyMax*=1.35
						src.Energy*=1.35
						src.DefenseMultiplier*=1.5
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s mask shatters!", "[src]([src.key]) deactivated T2 Vaizard Mask.")
						src.Power_Multiplier-=0.6
						src.ForceMultiplier/=1.5
						src.SpeedMultiplier/=1.35
						src.EnergyMax/=1.35
						src.Energy/=1.35
						src.DefenseMultiplier/=1.5
						src.Berserkering=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("ReiatsuMask3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s face is engulfed by a white substance...!?", "[src]([src.key]) activated T3 Vaizard Mask.")
						src.Power_Multiplier+=1.25
						src.ForceMultiplier*=1.75
						src.SpeedMultiplier*=1.5
						src.EnergyMax*=1.5
						src.Energy*=1.5
						src.DefenseMultiplier*=1.75
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s mask shatters!", "[src]([src.key]) deactivated T3 Vaizard Mask.")
						src.Power_Multiplier-=1.25
						src.ForceMultiplier/=1.75
						src.SpeedMultiplier/=1.5
						src.EnergyMax/=1.5
						src.Energy/=1.5
						src.DefenseMultiplier/=1.75
						src.Berserkering=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("ReiatsuFullHollow")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon='VastoLorde.dmi')
						src.OMessage(20,"[src]'s entire body is engulfed in a white substance!?", "[src]([src.key]) activated T4 Vaizard Mask.")
						src.Power_Multiplier+=2
						src.ForceMultiplier*=2.5
						src.SpeedMultiplier*=2
						src.EnergyMax*=2
						src.Energy*=2
						src.DefenseMultiplier*=2.5
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask material won't come off..."
							return
						src.overlays-=image(icon='VastoLorde.dmi')
						src.OMessage(20,"[src]'s body shatters!", "[src]([src.key]) deactivated T4 Vaizard Mask.")
						src.Power_Multiplier-=2
						src.ForceMultiplier/=2.5
						src.SpeedMultiplier/=2
						src.EnergyMax/=2
						src.Energy/=2
						src.DefenseMultiplier/=2.5
						src.Berserkering=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("BalancedMask1")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s face is engulfed by a white substance...!?", "[src]([src.key]) activated T1 Vaizard Mask.")
						src.Power_Multiplier+=0.25
						src.ForceMultiplier*=1.2
						src.SpeedMultiplier*=1.2
						src.EnergyMax*=1.1
						src.Energy*=1.1
						src.DefenseMultiplier*=1.2
						src.StrengthMultiplier*=1.2
						src.EnduranceMultiplier*=1.2
						src.ResistanceMultiplier*=1.2
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s mask shatters!", "[src]([src.key]) deactivated T1 Vaizard Mask.")
						src.Power_Multiplier-=0.25
						src.ForceMultiplier/=1.2
						src.SpeedMultiplier/=1.2
						src.EnergyMax/=1.1
						src.Energy/=1.1
						src.DefenseMultiplier/=1.2
						src.StrengthMultiplier/=1.2
						src.EnduranceMultiplier/=1.2
						src.ResistanceMultiplier/=1.2
						src.Berserkering=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("BalancedMask2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s face is engulfed by a white substance...!?", "[src]([src.key]) activated T2 Vaizard Mask.")
						src.Power_Multiplier+=0.5
						src.ForceMultiplier*=1.3
						src.SpeedMultiplier*=1.3
						src.EnergyMax*=1.2
						src.Energy*=1.2
						src.DefenseMultiplier*=1.3
						src.StrengthMultiplier*=1.3
						src.EnduranceMultiplier*=1.3
						src.ResistanceMultiplier*=1.3
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s mask shatters!", "[src]([src.key]) deactivated T2 Vaizard Mask.")
						src.Power_Multiplier-=0.5
						src.ForceMultiplier/=1.3
						src.SpeedMultiplier/=1.3
						src.EnergyMax/=1.2
						src.Energy/=1.2
						src.DefenseMultiplier/=1.3
						src.StrengthMultiplier/=1.3
						src.EnduranceMultiplier/=1.3
						src.ResistanceMultiplier/=1.3
						src.Berserkering=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("BalancedMask3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s face is engulfed by a white substance...!?", "[src]([src.key]) activated T3 Vaizard Mask.")
						src.Power_Multiplier+=1
						src.ForceMultiplier*=1.4
						src.SpeedMultiplier*=1.4
						src.EnergyMax*=1.3
						src.Energy*=1.3
						src.DefenseMultiplier*=1.4
						src.StrengthMultiplier*=1.4
						src.EnduranceMultiplier*=1.4
						src.ResistanceMultiplier*=1.4
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon=src.MaskAlpha)
						src.OMessage(20,"[src]'s mask shatters!", "[src]([src.key]) deactivated T3 Vaizard Mask.")
						src.Power_Multiplier-=1
						src.ForceMultiplier/=1.4
						src.SpeedMultiplier/=1.4
						src.EnergyMax/=1.3
						src.Energy/=1.3
						src.DefenseMultiplier/=1.4
						src.StrengthMultiplier/=1.4
						src.EnduranceMultiplier/=1.4
						src.ResistanceMultiplier/=1.4
						src.Berserkering=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("BalancedFullHollow")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon='VastoLorde.dmi')
						src.OMessage(20,"[src]'s entire body is engulfed in a white substance!?", "[src]([src.key]) activated T4 Vaizard Mask.")
						src.Power_Multiplier+=2
						src.ForceMultiplier*=1.75
						src.SpeedMultiplier*=1.75
						src.EnergyMax*=1.5
						src.Energy*=1.5
						src.DefenseMultiplier*=1.75
						src.StrengthMultiplier*=1.75
						src.EnduranceMultiplier*=1.75
						src.ResistanceMultiplier*=1.75
						src.Berserkering=1
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask material won't come off..."
							return
						src.overlays-=image(icon='VastoLorde.dmi')
						src.OMessage(20,"[src]'s body shatters!", "[src]([src.key]) deactivated T4 Vaizard Mask.")
						src.Power_Multiplier-=2.75
						src.ForceMultiplier/=1.75
						src.SpeedMultiplier/=1.75
						src.EnergyMax/=1.5
						src.Energy/=1.5
						src.DefenseMultiplier/=1.75
						src.StrengthMultiplier/=1.75
						src.EnduranceMultiplier/=1.75
						src.ResistanceMultiplier/=1.75
						src.Berserkering=0
						src.BerserkerRise=0
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("ConductorMask")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						if(src.SpecialSlot)
							src << "You're already using a special buff."
							return
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.overlays+=image(icon='OpposerMask.dmi')
						src.OMessage(20,"[src]'s face contorts..!?", "[src]([src.key]) activated T5 Vaizard Mask.")
						src.Power_Multiplier+=2.5
						src.ForceMultiplier*=1.5
						src.SpeedMultiplier*=2
						src.EnergyMax*=2
						src.Energy*=2
						src.DefenseMultiplier*=1.5
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.Recovery*=1.25
						src.Regeneration*=1.25
					else
						if(src.BerserkerInsanityLock==1)
							src << "The mask won't come off..."
							return
						src.overlays-=image(icon='OpposerMask.dmi')
						src.OMessage(20,"[src]'s face shatters!", "[src]([src.key]) deactivated T5 Vaizard Mask.")
						src.Power_Multiplier-=2.5
						src.ForceMultiplier/=1.5
						src.SpeedMultiplier/=2
						src.EnergyMax/=2
						src.Energy/=2
						src.DefenseMultiplier/=1.5
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.Recovery/=1.25
						src.Regeneration/=1.25
						src.BerserkerInsanity=0
						src.SpecialSlot=0
						src.ActiveBuffs-=3
						Z.BuffUsing=0

				if("SpiritEnergy1")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						src.ActiveBuffs+=3
						Z.BuffUsing=1
						Z:LevelUsed=1
						src.OMessage(20,"[src] begins to emit a light glow of energy!", "[src]([src.key]) activated T1 Spirit Energy.")
						src.Power_Multiplier+=0.25
						src.StrengthMultiplier*=1.25
						src.EnduranceMultiplier*=1.25
						src.ForceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.OffenseMultiplier*=1.25
						src.DefenseMultiplier*=1.25
					else
						src.OMessage(20,"[src]'s light glow of energy fades away...", "[src]([src.key]) deactivated T1 Spirit Energy.")
						src.Power_Multiplier-=0.25
						src.StrengthMultiplier/=1.25
						src.EnduranceMultiplier/=1.25
						src.ForceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.OffenseMultiplier/=1.25
						src.DefenseMultiplier/=1.25
						Z:LevelUsed=0
						Z.BuffUsing=0
						src.ActiveBuffs-=3
				if("SpiritEnergy2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						src.ActiveBuffs+=3
						Z.BuffUsing=1
						Z:LevelUsed=2
						src.OMessage(20,"[src] is bathed in gentle illumination!", "[src]([src.key]) activated T2 Spirit Energy.")
						src.Power_Multiplier+=0.3
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=1.5
						src.ForceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.OffenseMultiplier*=1.5
						src.DefenseMultiplier*=1.5
					else
						src.OMessage(20,"[src]'s illumination dies down...", "[src]([src.key]) activated T2 Spirit Energy.")
						src.Power_Multiplier-=0.3
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=1.5
						src.ForceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.OffenseMultiplier/=1.5
						src.DefenseMultiplier/=1.5
						Z:LevelUsed=0
						Z.BuffUsing=0
						src.ActiveBuffs-=3
				if("SpiritEnergy3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						src.ActiveBuffs+=3
						Z.BuffUsing=1
						Z:LevelUsed=3
						src.OMessage(20,"[src] releases a vibrant radiance!", "[src]([src.key]) activated T3 Spirit Energy.")
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=1.5
						src.ForceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.OffenseMultiplier*=1.5
						src.DefenseMultiplier*=1.5
					else
						src.OMessage(20,"[src] reigns in their radiance...", "[src]([src.key]) activated T3 Spirit Energy.")
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=1.5
						src.ForceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.OffenseMultiplier/=1.5
						src.DefenseMultiplier/=1.5
						Z:LevelUsed=0
						Z.BuffUsing=0
						src.ActiveBuffs-=3
				if("SpiritEnergy4")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						src.ActiveBuffs+=3
						Z.BuffUsing=1
						Z:LevelUsed=4
						src.OMessage(20,"[src] is surging with the utmost brilliance!", "[src]([src.key]) activated T4 Spirit Energy.")
						src.Power_Multiplier+=0.75
						src.StrengthMultiplier*=1.75
						src.EnduranceMultiplier*=1.75
						src.ForceMultiplier*=1.75
						src.ResistanceMultiplier*=1.75
						src.OffenseMultiplier*=1.75
						src.DefenseMultiplier*=1.75
					else
						src.OMessage(20,"[src] cuts off the flow of their brilliance...", "[src]([src.key]) activated T4 Spirit Energy.")
						src.Power_Multiplier-=0.75
						src.StrengthMultiplier/=1.75
						src.EnduranceMultiplier/=1.75
						src.ForceMultiplier/=1.75
						src.ResistanceMultiplier/=1.75
						src.OffenseMultiplier/=1.75
						src.DefenseMultiplier/=1.75
						Z:LevelUsed=0
						Z.BuffUsing=0
						src.ActiveBuffs-=3
				if("SacredEnergy")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						src.ActiveBuffs+=3
						Z.BuffUsing=1
						Z:LevelUsed=5
						src.Divine=1
						src.OMessage(20,"[src] rises up with an almighty golden power!", "[src]([src.key]) activated Sacred Energy.")
						src.Power_Multiplier+=1.5
						src.StrengthMultiplier*=1.75
						src.EnduranceMultiplier*=1.75
						src.ForceMultiplier*=1.75
						src.ResistanceMultiplier*=1.75
						src.OffenseMultiplier*=1.75
						src.DefenseMultiplier*=1.75
					else
						src.OMessage(20,"[src]'s golden incandescence subsides..", "[src]([src.key]) activated Sacred Energy.")
						src.Power_Multiplier-=1.5
						src.StrengthMultiplier/=1.75
						src.EnduranceMultiplier/=1.75
						src.ForceMultiplier/=1.75
						src.ResistanceMultiplier/=1.75
						src.OffenseMultiplier/=1.75
						src.DefenseMultiplier/=1.75
						Z:LevelUsed=0
						Z.BuffUsing=0
						src.ActiveBuffs-=3
				if("DemonEnergy1")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						src.ActiveBuffs+=3
						Z.BuffUsing=1
						Z:LevelUsed=1
						src.OMessage(20,"[src] begins to emit a dark glow of energy!", "[src]([src.key]) activated T1 Demon Energy.")
						src.Power_Multiplier+=0.75
					else
						src.OMessage(20,"[src]'s dark glow of energy fades away...", "[src]([src.key]) activated T1 Demon Energy.")
						src.Power_Multiplier-=0.75
						Z:LevelUsed=0
						Z.BuffUsing=0
						src.ActiveBuffs-=3
				if("DemonEnergy2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						src.ActiveBuffs+=3
						Z.BuffUsing=1
						Z:LevelUsed=2
						src.OMessage(20,"[src] forces their aura to permeate menacingly!", "[src]([src.key]) activated T2 Demon Energy.")
						src.Power_Multiplier+=1
						src.StrengthMultiplier*=1.1
						src.EnduranceMultiplier*=1.1
						src.ForceMultiplier*=1.1
						src.ResistanceMultiplier*=1.1
						src.OffenseMultiplier*=1.1
						src.DefenseMultiplier*=1.1
					else
						src.OMessage(20,"[src] retracts their aura of menace...", "[src]([src.key]) activated T2 Demon Energy.")
						src.Power_Multiplier-=1
						src.StrengthMultiplier/=1.1
						src.EnduranceMultiplier/=1.1
						src.ForceMultiplier/=1.1
						src.ResistanceMultiplier/=1.1
						src.OffenseMultiplier/=1.1
						src.DefenseMultiplier/=1.1
						Z:LevelUsed=0
						Z.BuffUsing=0
						src.ActiveBuffs-=3
				if("DemonEnergy3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						src.ActiveBuffs+=3
						Z.BuffUsing=1
						Z:LevelUsed=3
						src.OMessage(20,"[src]'s aura becomes suffocatingly powerful!", "[src]([src.key]) activated T3 Demon Energy.")
						src.Power_Multiplier+=1.25
						src.StrengthMultiplier*=1.15
						src.EnduranceMultiplier*=1.15
						src.ForceMultiplier*=1.15
						src.ResistanceMultiplier*=1.15
						src.OffenseMultiplier*=1.15
						src.DefenseMultiplier*=1.15
					else
						src.OMessage(20,"[src] allows others to breathe by lowering their aura...", "[src]([src.key]) activated T3 Demon Energy.")
						src.Power_Multiplier-=1.25
						src.StrengthMultiplier/=1.15
						src.EnduranceMultiplier/=1.15
						src.ForceMultiplier/=1.15
						src.ResistanceMultiplier/=1.15
						src.OffenseMultiplier/=1.15
						src.DefenseMultiplier/=1.15
						Z:LevelUsed=0
						Z.BuffUsing=0
						src.ActiveBuffs-=3
				if("DemonEnergy4")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta turn off your basic buff."
							return
						src.ActiveBuffs+=3
						Z.BuffUsing=1
						Z:LevelUsed=4
						src.OMessage(20,"[src]'s crushing aura causes the ground itself to wail!", "[src]([src.key]) activated T4 Demon Energy.")
						src.Power_Multiplier+=1.5
						src.StrengthMultiplier*=1.25
						src.EnduranceMultiplier*=1.25
						src.ForceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.OffenseMultiplier*=1.25
						src.DefenseMultiplier*=1.25
					else
						Z:LevelUsed=0
						Z.BuffUsing=0
						src.ActiveBuffs-=3
						src.OMessage(20,"[src] represses their earth-shattering aura...", "[src]([src.key]) activated T4 De,pm Energy.")
						src.Power_Multiplier-=1.5
						src.StrengthMultiplier/=1.25
						src.EnduranceMultiplier/=1.25
						src.ForceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.OffenseMultiplier/=1.25
						src.DefenseMultiplier/=1.25
				if("SacredEnergyArmorOffense")
					if(!Z.BuffUsing)
						if(src.SpecialSlot)
							src << "You're already using a secondary buff."
							return
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.5
						src.ForceMultiplier*=1.5
						src.SpeedMultiplier*=1.25
						src.OffenseMultiplier*=1.25
						src.OMessage(10, "<font color='#FFFF00'>[src] manifests a regalia of <b>offense</b>.</font color>", "[src]([src.key]) used Sacred Energy Offense.")
						Z:ArmorUsed="Offense"
					else
						src.SpecialSlot=0
						Z.BuffUsing=0
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.5
						src.ForceMultiplier/=1.5
						src.SpeedMultiplier/=1.25
						src.OffenseMultiplier/=1.25
						src.OMessage(10, "<font color='#FFFF00'>[src] disperses their armor...</font color>", "[src]([src.key]) deactivated Sacred Energy Offense.")
						Z:ArmorUsed=null
				if("SacredEnergyArmorDefense")
					if(!Z.BuffUsing)
						if(src.SpecialSlot)
							src << "You're already using a secondary buff."
							return
						src.SpecialSlot=1
						Z.BuffUsing=1
						src.Power_Multiplier+=0.5
						src.EnduranceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.SpeedMultiplier*=1.25
						src.DefenseMultiplier*=1.25
						src.OMessage(10, "<font color='#FFFF00'>[src] manifests a regalia of <b>defense</b>.</font color>", "[src]([src.key]) used Sacred Energy Defense.")
						Z:ArmorUsed="Defense"
					else
						src.SpecialSlot=0
						Z.BuffUsing=0
						src.Power_Multiplier-=0.5
						src.EnduranceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.SpeedMultiplier/=1.25
						src.DefenseMultiplier/=1.25
						src.OMessage(10, "<font color='#FFFF00'>[src] disperses their armor...</font color>", "[src]([src.key]) deactivated Sacred Energy Defense.")
						Z:ArmorUsed=null
				/*
				if("SpiritShotgun")
					var/Drain=src.EnergyMax/20
					if(Z.Using) return
					if(!src.CanBlast(Drain)) return
					if(src.Attacking)return
					src.Attacking=1
					spawn((src.Refire/Z.Speed*10)+1) src.Attacking=0
					var/Blasts=5
					src.Energy*=0.95
					Z.Using=1
					while(Blasts>1)
						Blasts-=1
						if(!src.CanBlast(Drain)) return
						flick("Blast",src)
						//do mana
						src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
						var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
						A.Distance=Distance
						A.pixel_y=rand(-48,48)
						A.pixel_x=rand(-48,48)
						A.x+=rand(-2,2)
						A.y+=rand(-2,2)
						A.dir=src.dir
						A.icon=Z.sicon
						A.icon_state=Z.sicon_state
						A.Owner=src
						A.Damage_Multiplier=1.5
						A.Lethality=src.Lethal
						A.Shotgun=1
						A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill
						spawn if(A) walk(A,A.dir)
					Z.Cooldown()
				*/

				if("SpiritShotgun")
					if(Z.Using) return
					var/Drain=src.EnergyMax/3
					if(src.SpiritLevel==3) Drain=src.EnergyMax/5
					if(src.SpiritLevel==4) Drain=src.EnergyMax/20
					if(src.SpiritLevel==5) Drain=1
					if(src.Attacking) return
					if(!src.CanBlast(Drain)) return
					src.Attacking=1
					src.Beaming=1
					src.Chargez("Add")
					sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
					src.Chargez("Remove")
					src.Attacking=0
					src.Beaming=0
					Z.Skill_Increase(3)
					if(Z.Level<100)
						Z.Level=100
					flick("Blast",src)
					src.SkillLeech(Z)
					src.TotalFatigue+=10
					src.Energy-=Drain
					for(var/i = 1, i <= 9, i++)
						var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
						A.dir=src.dir
						var/amount = 0
						if(i <= 3) amount = -1
						else if(i > 6) amount = 1
						//we want these to be scattered out side to side based on which direction we are facing
						if(A.dir == NORTH || A.dir == SOUTH)
							A.x+=amount
							A.pixel_x = 8*amount
						else
							A.y+=amount
							A.pixel_y = 8*amount
						A.Distance=Distance
						A.Radius=1
						A.Explosive=1
						A.Deflectable=1
						A.Dodgeable=1
						A.Knockback=1
						A.icon=Z.sicon
						A.icon_state=Z.sicon_state
						A.Owner=src
						A.Lethality=src.Lethal
						A.Damage_Multiplier=5
						A.Shotgun = 1
						if(src.SpiritWeaponChosen=="Demon Gun") A.Elemental="Fire"
						A.Offense=(src.Offense*src.OffenseMultiplier)*2
						spawn if(A) walk(A,A.dir)
					Z.Cooldown()

				if("BeamSwordSlash")
					if(!Z.Using)
						//ill do this later.
						Z.Cooldown()
				if("Kamui1")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.25
						src.EnduranceMultiplier*=1.25
						src.SpeedMultiplier*=1.25
						src.OffenseMultiplier*=1.25
						src.DefenseMultiplier*=1.25

						src.OMessage(10, "[src]'s outfit explodes into an exhibitionistic uniform!", "[src]([src.key]) used Kamui.")

						src.Kamui=1
						Z:LevelUsed=1
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.25
						src.EnduranceMultiplier/=1.25
						src.SpeedMultiplier/=1.25
						src.OffenseMultiplier/=1.25
						src.DefenseMultiplier/=1.25

						src.OMessage(10, "[src]'s outfit transmogrifies back into a less revealing form.", "[src]([src.key]) deactivated Kamui.")

						src.Kamui=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("Kamui2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.35
						src.EnduranceMultiplier*=1.35
						src.SpeedMultiplier*=1.25
						src.OffenseMultiplier*=1.35
						src.DefenseMultiplier*=1.35

						src.OMessage(10, "[src]'s outfit explodes into an exhibitionistic uniform!", "[src]([src.key]) used Kamui.")

						src.Kamui=1
						Z:LevelUsed=2
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.35
						src.EnduranceMultiplier/=1.35
						src.SpeedMultiplier/=1.25
						src.OffenseMultiplier/=1.35
						src.DefenseMultiplier/=1.35

						src.OMessage(10, "[src]'s outfit transmogrifies back into a less revealing form.", "[src]([src.key]) deactivated Kamui.")

						src.Kamui=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("Kamui3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.Power_Multiplier+=0.75
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=1.5
						src.SpeedMultiplier*=1.25
						src.OffenseMultiplier*=1.5
						src.DefenseMultiplier*=1.5

						src.OMessage(10, "[src]'s outfit explodes into an exhibitionistic uniform!", "[src]([src.key]) used Kamui.")

						src.Kamui=1
						Z:LevelUsed=3
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.Power_Multiplier-=0.75
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=1.5
						src.SpeedMultiplier/=1.25
						src.OffenseMultiplier/=1.5
						src.DefenseMultiplier/=1.5

						src.OMessage(10, "[src]'s outfit transmogrifies back into a less revealing form.", "[src]([src.key]) deactivated Kamui.")

						src.Kamui=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("KamuiSenjin1")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.StrengthMultiplier*=1.25
						src.EnduranceMultiplier*=1.25
						src.OffenseMultiplier*=1.25

						src.OMessage(10, "[src]'s outfit explodes into a collection of blades!", "[src]([src.key]) used Kamui Senjin.")

						src.KamuiSenjin=1
						Z:LevelUsed=1
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.StrengthMultiplier/=1.25
						src.EnduranceMultiplier/=1.25
						src.OffenseMultiplier/=1.25

						src.OMessage(10, "[src]'s outfit slinks back into its original state.", "[src]([src.key]) deactivated Kamui Senjin.")

						src.KamuiSenjin=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("KamuiSenjin2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.Power_Multiplier+=0.25
						src.StrengthMultiplier*=1.25
						src.EnduranceMultiplier*=1.25
						src.OffenseMultiplier*=1.25

						src.OMessage(10, "[src]'s outfit explodes into a collection of blades!", "[src]([src.key]) used Kamui Senjin.")

						src.KamuiSenjin=1
						Z:LevelUsed=2
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.Power_Multiplier-=0.25
						src.StrengthMultiplier/=1.25
						src.EnduranceMultiplier/=1.25
						src.OffenseMultiplier/=1.25

						src.OMessage(10, "[src]'s outfit slinks back into its original state.", "[src]([src.key]) deactivated Kamui Senjin.")

						src.KamuiSenjin=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("KamuiSenjin3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.Power_Multiplier+=0.25
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=1.5
						src.OffenseMultiplier*=1.5

						src.OMessage(10, "[src]'s outfit explodes into a collection of blades!", "[src]([src.key]) used Kamui Senjin.")

						src.KamuiSenjin=1
						Z:LevelUsed=3
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.Power_Multiplier-=0.25
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=1.5
						src.OffenseMultiplier/=1.5

						src.OMessage(10, "[src]'s outfit slinks back into its original state.", "[src]([src.key]) deactivated Kamui Senjin.")

						src.KamuiSenjin=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("KamuiShippu1")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.ForceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.DefenseMultiplier*=1.25

						src.OMessage(10, "[src]'s outfit slinks into a formfitting airsuit!", "[src]([src.key]) used Kamui Shippu.")

						src.KamuiShippu=1
						Z:LevelUsed=1
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.ForceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.DefenseMultiplier/=1.25

						src.OMessage(10, "[src]'s outfit returns to its original state..", "[src]([src.key]) deactivated Kamui Shippu.")

						src.KamuiShippu=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("KamuiShippu2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.Power_Multiplier+=0.25
						src.ForceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.DefenseMultiplier*=1.25

						src.OMessage(10, "[src]'s outfit slinks into a formfitting airsuit!", "[src]([src.key]) used Kamui Shippu.")

						src.KamuiShippu=1
						Z:LevelUsed=2
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.Power_Multiplier-=0.25
						src.ForceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.DefenseMultiplier/=1.25

						src.OMessage(10, "[src]'s outfit returns to its original state..", "[src]([src.key]) deactivated Kamui Shippu.")

						src.KamuiShippu=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("KamuiShippu3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.Power_Multiplier+=0.25
						src.ForceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.DefenseMultiplier*=1.5

						src.OMessage(10, "[src]'s outfit slinks into a formfitting airsuit!", "[src]([src.key]) used Kamui Shippu.")

						src.KamuiShippu=1
						Z:LevelUsed=3
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.Power_Multiplier-=0.25
						src.ForceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.DefenseMultiplier/=1.5

						src.OMessage(10, "[src]'s outfit returns to its original state..", "[src]([src.key]) deactivated Kamui Shippu.")

						src.KamuiShippu=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("SenjinShippu2")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.Power_Multiplier+=0.25
						src.StrengthMultiplier*=1.25
						src.ForceMultiplier*=1.25
						src.SpeedMultiplier*=1.25

						src.OMessage(10, "[src]'s outfit morphs into a formfitting airsuit augmented by a fuckton of blades!", "[src]([src.key]) used Senjin Shippu.")

						src.KamuiSenjin=1
						src.KamuiShippu=1
						Z:LevelUsed=2
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.Power_Multiplier-=0.25
						src.StrengthMultiplier/=1.15
						src.ForceMultiplier/=1.15
						src.SpeedMultiplier/=1.25

						src.OMessage(10, "[src]'s outfit slinks back down to its original state...", "[src]([src.key]) deactivated Senjin Shippu.")

						src.KamuiSenjin=0
						src.KamuiShippu=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("SenjinShippu3")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							if(src.SpecialSlot)
								src << "You're using active buffs and slotted buffs already."
								return
							else
								Z:UsedSpecial=1
								src.SpecialSlot=1
						else
							Z:UsedBuff=1
							src.ActiveBuffs=3

						src.Power_Multiplier+=0.25
						src.StrengthMultiplier*=1.25
						src.ForceMultiplier*=1.25
						src.SpeedMultiplier*=1.5

						src.OMessage(10, "[src]'s outfit morphs into a formfitting airsuit augmented by a fuckton of blades!", "[src]([src.key]) used Senjin Shippu.")

						src.KamuiSenjin=1
						src.KamuiShippu=1
						Z:LevelUsed=3
						Z.BuffUsing=1
					else
						if(Z:UsedSpecial)
							Z:UsedSpecial=0
							src.SpecialSlot=0
						if(Z:UsedBuff)
							Z:UsedBuff=0
							src.ActiveBuffs=0

						src.Power_Multiplier-=0.25
						src.StrengthMultiplier/=1.25
						src.ForceMultiplier/=1.25
						src.SpeedMultiplier/=1.5

						src.OMessage(10, "[src]'s outfit slinks back down to its original state...", "[src]([src.key]) deactivated Senjin Shippu.")

						src.KamuiSenjin=0
						src.KamuiShippu=0
						Z:LevelUsed=0
						Z.BuffUsing=0
				if("KamuiRegen")
					if(!Z.Using)
						if(src.Health > 75)
							return
						var/mult=max(1,src.LifeFiberFusion)/4
						var/amt=src.SexyMod*5
						amt*=mult
						if(amt<10)
							amt=10
						src.TotalInjury-=amt/3
						if(src.TotalInjury < 0)
							src.TotalInjury = 0
						src.Health+=amt
						if(src.Health > 100)
							src.Health = 100
						src.OMessage(10, "[src]'s affinity for life fibers allows them to knit their body back together!", "[src]([src.key]) used Kamui Regen.")
						Z.Cooldown()
				if("ManifestScissorBlade")
					var/obj/Items/Sword/sord=null
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							sord=s
							break
					if(!sord)
						src << "You need to wear a sword to force it to become a scissor blade."
						return
					sord.ScissorBlade=src.SexyMod
					if(sord.ScissorBlade==1)
						src.OMessage(10, "[src] forces their blade to acquire the sharpness needed to sever Life Fibers!", "[src]([src.key]) used Manifest Scissor Blade.")
					if(sord.ScissorBlade==2)
						src.OMessage(10, "[src]'s sword assumes the edginess required to utterly annihilate Life Fibers!", "[src]([src.key]) used Manifest Scissor Blade.")
					if(sord.ScissorBlade==3)
						src.OMessage(10, "[src]'s weapon is so keen that it can cut things out of existence!", "[src]([src.key]) used Manifest Scissor Blade.")
				if("ManifestKeyblade")
					if(Z.Using)
						return
					var/obj/Items/Sword/s
					for(var/obj/Items/Sword/s1 in src)
						if(s1.suffix)
							s=s1
					if(!s)
						src << "Wear a sword before trying to dive into your heart."
						return
					Z.Using=1
					src.ChooseKeybladeElement()
					src.ChooseKeybladeWeapon()
					src.ChooseKeybladeAbandon()
					src.KeybladeStatChanges()
					src.MakeKeyblade(s)
					del Z
				if("BestowKeyblade")
					if(Z.Using)
						return
					Z.Using=1
					var/list/mob/choices = list()
					for(var/mob/m in oview(10, src))
						choices+=m
					var/mob/choice=input(src,"Who would you like you bestow your keyblade to?", "Bestow Keyblade") in choices
					var/confirm=alert(src,"Are you sure you want to give up your keyblade to [choice]?", "Bestow Keyblade", "Yes", "No")
					if(confirm=="No")
						Z.Using=0
						return
					if(confirm=="Yes")
						var/obj/Items/Sword/nuKeyblade=src.FetchKeyblade()
						if(!nuKeyblade)
							src << "Bestow Cancelled."
							Z.Using=0
							return
						nuKeyblade.loc=choice.contents
						if(src.SecondKeyblade)
							src.PassOnSecondKeyblade(choice)
						else
							src.PassOnKeyblade(choice)
					Z.Using=0
				if("SetFinisher")
					if(!Z.Using)
						Z.Using=1
						var/list/options=list("Physical")
						if(src.HasKeyblade("Light", 2)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
							options+="Ice"
						if(src.HasKeyblade("Light", 3)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
							options+="Fire"
						if(src.HasKeyblade("Light", 4)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
							options+="Omega"
						Z:FinisherType=input(src, "What kind of finisher do you want to deliver?", "Finisher") in options
						src << "Finisher Type set to [Z:FinisherType]."
						Z.Using=0
				if("Finisher")
					if(!Z.Using)
						if(!src.Target||src.Target==src)
							src << "You need a target to drop your finisher on them."
							return
						var/hits = src.ComboPlusNumber
						src.ComboPlusNumber=0
						var/FinisherMult
						if(Z:FinisherType=="Physical")
							FinisherMult=1.5
						if(Z:FinisherType=="Ice")
							FinisherMult=1
						if(Z:FinisherType=="Fire")
							FinisherMult=1.5
						if(Z:FinisherType=="Omega")
							FinisherMult=3
						src.Comboz(src.Target)
						flick("Attack", src)
						src.StrVsEnd(src.Target, 5*(hits/100)*FinisherMult)
						src.Target.Finishered=Z:FinisherType
						src.Target.Knockback(3*src.GetLightKeybladeLevel()*rand(3,5)*FinisherMult, src)
						Z.Cooldown()
				if("EventHorizon")
					//todo: actual things here.
					var/obj/Projectiles/Mystical/A=new(src.Target.loc)
					A.Distance=7
					A.dir=NORTH
					A.icon=null
					A.Deflectable=0
					A.Dodgeable=1
					A.Physical=1
					A.Divide=1
					A.Owner=src
					A.Damage_Multiplier=2.5
					A.Offense=(src.Offense*src.OffenseMultiplier)

					var/obj/Projectiles/Mystical/B=new(src.Target.loc)
					B.Distance=7
					B.dir=SOUTH
					B.icon=null
					B.Deflectable=0
					B.Dodgeable=1
					B.Physical=1
					B.Divide=1
					B.Owner=src
					B.Damage_Multiplier=2.5
					B.Offense=(src.Offense*src.OffenseMultiplier)

					var/obj/Projectiles/Mystical/C=new(src.Target.loc)
					C.Distance=7
					C.dir=EAST
					C.icon=null
					C.Deflectable=0
					C.Dodgeable=1
					C.Physical=1
					C.Divide=1
					C.Owner=src
					C.Damage_Multiplier=2.5
					C.Offense=(src.Offense*src.OffenseMultiplier)

					var/obj/Projectiles/Mystical/D=new(src.Target.loc)
					D.Distance=7
					D.dir=WEST
					D.icon=null
					D.Deflectable=0
					D.Dodgeable=1
					D.Physical=1
					D.Divide=1
					D.Owner=src
					D.Damage_Multiplier=2.5
					D.Offense=(src.Offense*src.OffenseMultiplier)
				if("FlashOfHope")
					if(!Z.BuffUsing)
						if(src.ActiveBuffs)
							src << "Gotta take those buffs off first."
							return
						Z.BuffUsing=1
						src.ActiveBuffs=3
						src.Ascend(src.BaseMod*1.25)
						src.StrengthMultiplier*=1.75
						src.ForceMultiplier*=1.75
						src.EnduranceMultiplier*=2
						src.ResistanceMultiplier*=2
						src.SpeedMultiplier*=1.5
						src.OffenseMultiplier*=2
						src.DefenseMultiplier*=2
						if(src.EnergyMod<5)
							Z:PreHopeEnergy=src.EnergyMod
							src.EnergyMod=5
							src.EnergyMax=5000
							src.Energy=5000
						if(src.Recovery<5)
							Z:PreHopeRecovery=src.Recovery
							src.Recovery=5
						src.FlashOfHope=1
						if(src.Class!="Hope of the Future"&&(src.Race=="Human"||src.Race=="1/16th Saiyan"))
							src.Class="Hope of the Future"
						src.OMessage(10, "[src] surges with a newfound hope!!", "[src]([src.key]) used Flash of Hope.")
						src.overlays+=image('FlashOfHopeAura.dmi')
						if(!locate(/obj/Skills/TierS/HopeOverload,src))
							src.contents+=new/obj/Skills/TierS/HopeOverload

					else
						Z.BuffUsing=0
						src.ActiveBuffs=0
						src.Ascend(src.BaseMod/1.25)
						src.StrengthMultiplier/=1.75
						src.ForceMultiplier/=1.75
						src.EnduranceMultiplier/=2
						src.ResistanceMultiplier/=2
						src.SpeedMultiplier/=1.5
						src.OffenseMultiplier/=2
						src.DefenseMultiplier/=2
						src.FlashOfHope=0
						if(Z:PreHopeEnergy!=null)
							src.EnergyMod=Z:PreHopeEnergy
							src.EnergyMax=src.EnergyMod*1000
							src.Energy=src.Energy*(5/src.EnergyMod)
							Z:PreHopeEnergy=null
						if(Z:PreHopeRecovery!=null)
							src.Recovery=Z:PreHopeRecovery
							Z:PreHopeRecovery=null
						if(src.TotalInjury < 50)
							src.TotalInjury=50
						src.OMessage(10, "[src] releases their hope and strength to catch a breath...", "[src]([src.key]) deactivated Flash of Hope.")
						src.overlays-=image('FlashOfHopeAura.dmi')

				if("Overload")
					if(!Z.BuffUsing)
						if(src.SpecialSlot)
							src << "Take off your special buff first."
							return
						Z.BuffUsing=1
						src.HopeOverload=1
						src.SpecialSlot=1
						src.OMessage(10, "[src] becomes overloaded with tenacity and the will to persevere!", "[src]([src.key]) used Hope Overload!")
						src.overlays+=image('FlashOfHopeSparks.dmi')

					else
						Z.BuffUsing=0
						src.HopeOverload=0
						src.SpecialSlot=0
						if(src.TotalInjury < 75)
							src.TotalInjury=75
						src.OMessage(10, "[src] forfeits their power to lessen the pain...", "[src]([src.key]) deactivated Hope Overload.")
						src.overlays-=image('FlashOfHopeSparks.dmi')

				if("DriveForm")
					if(!Z.BuffUsing)
						if(src.DriveCounter<=30)
							src<<"You need to wait before Driving again."
							return
						if(src.SpecialSlot) return
						if(Z:SpamLockout==1)
							usr<<"Stop spamming Drive!"
							return
						if(src.Energy<src.EnergyMax/10)return
						Z:SpamLockout=1
						src.SpecialSlot=1
						Z.BuffUsing=1
						var/list/ChosenKeybladeLevel=list("Valor")
						if(src.KeybladeLevel>=1)
							ChosenKeybladeLevel.Add("Wisdom")
						if(src.KeybladeLevel>=3)
							ChosenKeybladeLevel.Add("Master")
						if(src.KeybladeLevel>=4)
							ChosenKeybladeLevel.Add("Final")
						ChosenKeybladeLevel.Add("Cancel")
						Z:KeybladeLevelSelected=input("Pick a Drive level!") in ChosenKeybladeLevel
						if(Z:KeybladeLevelSelected=="Cancel")
							Z:SpamLockout=0
							src.SpecialSlot=0
							Z.BuffUsing=0
							return
						if(prob(AntiFormCounter))
							Z:KeybladeLevelSelected="Anti"
						if(Z:KeybladeLevelSelected=="Valor")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier+=0.25
							src.Power_Multiplier+=0.5
							src.OffenseMultiplier*=1.55
							src.StrengthMultiplier*=1.55
							src.DriveType="Valor"
							src.DriveCounter=180
							src.AntiFormCounter+=15
							src.overlays+='ValorFormElec.dmi'
							src.OMessage(30,"[src] surrounded themselves in a red aura, increasing their physical might!","<font color=red>[src]([src.key]) activated Valor Form.")
						else if(Z:KeybladeLevelSelected=="Wisdom")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier+=0.25
							src.Power_Multiplier+=0.5
							src.SpeedMultiplier*=1.25
							src.ForceMultiplier*=1.55
							src.AntiFormCounter+=15
							src.DriveType="Wisdom"
							src.overlays+='WisdomFormElec.dmi'
							src.OMessage(30,"[src] surrounded themselves in a blue aura, increasing their spiritual might!","<font color=red>[src]([src.key]) activated Wisdom Form.")
						else if(Z:KeybladeLevelSelected=="Master")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier+=0.5
							src.Power_Multiplier+=0.5
							src.SpeedMultiplier*=1.45
							src.StrengthMultiplier*=1.45
							src.ForceMultiplier*=1.45
							src.AntiFormCounter+=15
							src.DriveType="Master"
							src.DriveCounter=105
							src.overlays+='MasterFormElec.dmi'
							src.OMessage(30,"[src] surrounded themselves in a yellow aura, bringing their physical and spiritual might to its apex!","<font color=red>[src]([src.key]) activated Master Form.")
						else if(Z:KeybladeLevelSelected=="Final")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier+=0.5
							src.Power_Multiplier+=1
							src.SpeedMultiplier*=2
							src.OffenseMultiplier*=1.5
							src.StrengthMultiplier*=1.75
							src.ForceMultiplier*=1.75
							src.DriveType="Final"
							src.AntiFormCounter=0
							src.DriveCounter=60
							src.overlays+=image('FinalFormAura.dmi',pixel_x=-32)
							src.OMessage(30,"[src] surrounded themselves in a silver aura, commanding the full power of light and darkness!","<font color=red>[src]([src.key]) activated Final Form.")
						else if(Z:KeybladeLevelSelected=="Anti")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier+=0.25
							src.Power_Multiplier+=0.5
							src.SpeedMultiplier*=2
							src.OffenseMultiplier*=1.5
							src.StrengthMultiplier*=0.5
							src.EnduranceMultiplier*=0.75
							src.DriveType="Anti"
							src.AntiFormCounter=0
							src.DriveCounter=60
							src.overlays+='blackflameaura.dmi'
							src<<"Once you attack, you'll ruthlessly pursue your opponent with no end."
							src.OMessage(30,"[src] loses control of their power, bringing forth their innermost darkness!","<font color=red>[src]([src.key]) activated Anti-Form.")

						src.DriveActive=1
						Z:SpamLockout=0
					else
						if(src.DriveType=="Anti" && src.DriveCounter>=11)
							src<<"You cannot revert from Anti-Form yet."
							return
						src.DriveActive=0
						src.SpecialSlot=0
						Z.BuffUsing=0
						src.OMessage(30,"[src] deactivates their Drive Form!","<font color=red>[src]([src.key]) deactivated Drive.")
						if(Z:KeybladeLevelSelected=="Valor")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier-=0.25
							src.Power_Multiplier-=0.5
							src.OffenseMultiplier/=1.55
							src.StrengthMultiplier/=1.55
							src.DriveType="None"
							src.overlays-='ValorFormElec.dmi'
						else if(Z:KeybladeLevelSelected=="Wisdom")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier-=0.25
							src.Power_Multiplier-=0.5
							src.SpeedMultiplier/=1.25
							src.ForceMultiplier/=1.55
							src.DriveType="None"
							src.overlays-='WisdomFormElec.dmi'
						else if(Z:KeybladeLevelSelected=="Master")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier-=0.5
							src.Power_Multiplier-=0.5
							src.SpeedMultiplier/=1.45
							src.StrengthMultiplier/=1.45
							src.ForceMultiplier/=1.45
							src.DriveType="None"
							src.DriveCounter=0
							src.overlays-='MasterFormElec.dmi'
						else if(Z:KeybladeLevelSelected=="Final")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier-=0.5
							src.Power_Multiplier-=1
							src.SpeedMultiplier/=2
							src.OffenseMultiplier/=1.5
							src.StrengthMultiplier/=1.75
							src.ForceMultiplier/=1.75
							src.DriveType="None"
							src.AntiFormCounter=0
							src.DriveCounter=0
							src.overlays-=image('FinalFormAura.dmi',pixel_x=-32)
						else if(Z:KeybladeLevelSelected=="Anti")
							if(src.HasKeyblade("Nothingness", 1)||src.HasKeyblade("Semi-Divine", 4)||src.HasKeyblade("Divine", 4))
								src.Power_Multiplier-=0.25
							src.Power_Multiplier-=0.5
							src.SpeedMultiplier/=2
							src.OffenseMultiplier/=1.5
							src.StrengthMultiplier/=0.5
							src.EnduranceMultiplier/=0.75
							src.DriveType="None"
							src.AntiFormCounter=0
							src.DriveCounter=0
							src.overlays-='blackflameaura.dmi'

				if("Hadoken")
					if(Z.Using)
						return
					if(src.Attacking) return

					var/Distance=15
					if(src.AmatsukenPath=="Shoryuken")
						Distance-=5
					if(src.AmatsukenPath=="Tatsumaki")
						Distance-=8

					var/Drain=src.EnergyMax/75
					if(src.AmatsukenAscension=="Chikara no Hado")
						Drain=0
						Z.sicon='HadokenFlame.dmi'
					if(src.AmatsukenAscension=="Satsui no Hado")
						Drain*=0.5
						Z.sicon='HadokenSatsui.dmi'
					if(src.Energy < Drain)
						return
					src.Energy-=Drain

					flick("Blast",src)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>HADOKEN!</b>"
					var/count=1
					if(src.SatsuiNoHado)
						count=2
					while(count)
						count--
						var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
						A.Distance=Distance
						A.dir=src.dir
						A.icon=Z.sicon
						A.icon_state=Z.sicon_state
						A.Owner=src
						A.Lethality=src.Lethal
						A.Damage_Multiplier=1.5
						A.Sekiha=1
						A.Hadoken=1
						A.Offense=(src.Offense*src.OffenseMultiplier)

						var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
						B.Distance=Distance
						B.dir=src.dir
						B.icon=Z.sicon
						B.icon_state=Z.sicon_state
						B.Owner=src
						B.Lethality=src.Lethal
						B.Damage_Multiplier=1.5
						B.Sekiha=1
						B.Hadoken=1
						B.Offense=(src.Offense*src.OffenseMultiplier)

						var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
						C.Distance=Distance
						C.dir=src.dir
						C.icon=Z.sicon
						C.icon_state=Z.sicon_state
						C.Owner=src
						C.Lethality=src.Lethal
						C.Damage_Multiplier=1.5
						C.Sekiha=1
						C.Hadoken=1
						C.Offense=(src.Offense*src.OffenseMultiplier)

						spawn
							if(B)
								step(B,turn(B.dir,90))
							if(C)
								step(C,turn(C.dir,-90))
							if(A)
								walk(A,A.dir)
								if(B)walk(B,A.dir)
								if(C)walk(C,A.dir)

					if(src.AmatsukenAscension=="Chikara no Hado")
						Z.Cooldown=10

					Z.Cooldown()

				if("ExHadoken")
					if(Z.Using)
						return
					if(src.Attacking) return

					var/Drain=(src.EnergyMax/75)*2
					if(src.AmatsukenAscension=="Chikara no Hado")
						Drain=0
						Z.sicon='HadokenFlame.dmi'
					if(src.AmatsukenAscension=="Satsui no Hado")
						Drain*=0.5
						Z.sicon='HadokenSatsui.dmi'
					if(src.Energy < Drain)
						return
					src.Energy-=Drain

					flick("Blast",src)
					var/Distance=30
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>EX-HADOKEN!</b>"
					var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
					A.Distance=Distance
					A.dir=src.dir
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Lethality=src.Lethal
					A.Damage_Multiplier=3
					A.Sekiha=1
					A.ExHadoken=1
					A.Offense=(src.Offense*src.OffenseMultiplier)

					var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
					B.Distance=Distance
					B.dir=src.dir
					B.icon=Z.sicon
					B.icon_state=Z.sicon_state
					B.Owner=src
					B.Lethality=src.Lethal
					B.Damage_Multiplier=3
					B.Sekiha=1
					B.ExHadoken=1
					B.Offense=(src.Offense*src.OffenseMultiplier)

					var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
					C.Distance=Distance
					C.dir=src.dir
					C.icon=Z.sicon
					C.icon_state=Z.sicon_state
					C.Owner=src
					C.Lethality=src.Lethal
					C.Damage_Multiplier=3
					C.Sekiha=1
					C.ExHadoken=1
					C.Offense=(src.Offense*src.OffenseMultiplier)

					spawn
						if(B)
							step(B,turn(B.dir,90))
						if(C)
							step(C,turn(C.dir,-90))
						if(A)
							walk(A,A.dir)
							if(B)walk(B,A.dir)
							if(C)walk(C,A.dir)

					if(src.AmatsukenAscension=="Chikara no Hado")
						Z.Cooldown=90

					Z.Cooldown()

				if("ShinkuHadoken")
					if(world.realtime < (Z:LastUse+(600*60*24)))
						src << "You cannot use this technique again yet."
						return
					if(src.Attacking) return

					var/Drain=(src.EnergyMax/75)*5
					if(src.AmatsukenAscension=="Chikara no Hado")
						Drain=0
						Z.sicon='HadokenFlame.dmi'
					if(src.AmatsukenAscension=="Satsui no Hado")
						Drain*=0.5
						Z.sicon='HadokenSatsui.dmi'
					if(src.Energy < Drain)
						return
					src.Energy-=Drain

					for(var/mob/m in view(12, src))
						m.Frozen=1

					var/icon/W=icon('Effects.dmi',"Shock")
					src.Shockwave(W, 2)
					spawn()DarknessFlash(src)

					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>SHINKU...</b>"
					src.Quake(16)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>HADOOOOOOOOKEN!</b>"

					sleep(20)
					for(var/mob/m in view(12, src))
						m.Frozen=0

					flick("Blast",src)
					var/Distance=50


					var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
					A.Distance=Distance
					A.dir=src.dir
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Lethality=src.Lethal
					A.Damage_Multiplier=5
					A.Sekiha=1
					A.ShinkuHadoken=1
					A.Offense=(src.Offense*src.OffenseMultiplier)

					var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
					B.Distance=Distance
					B.dir=src.dir
					B.icon=Z.sicon
					B.icon_state=Z.sicon_state
					B.Owner=src
					B.Lethality=src.Lethal
					B.Damage_Multiplier=5
					B.Sekiha=1
					B.ShinkuHadoken=1
					B.Offense=(src.Offense*src.OffenseMultiplier)

					var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
					C.Distance=Distance
					C.dir=src.dir
					C.icon=Z.sicon
					C.icon_state=Z.sicon_state
					C.Owner=src
					C.Lethality=src.Lethal
					C.Damage_Multiplier=5
					C.Sekiha=1
					C.ShinkuHadoken=1
					C.Offense=(src.Offense*src.OffenseMultiplier)

					spawn
						if(B)
							step(B,turn(B.dir,90))
						if(C)
							step(C,turn(C.dir,-90))
						if(A)
							walk(A,A.dir)
							if(B)walk(B,A.dir)
							if(C)walk(C,A.dir)

					Z:LastUse=world.realtime


				if("Shoryureppa")
	/*				Cooldown=120
					if(usr.Frozen||usr.Stunned||Using||usr.KO||usr.Knockbacked)
						return
					var
						ShoryukenHits=rand(7,12)

						DashDash=3
						mob/ShorTarget
						LockedDir=usr.dir
					Cooldown()
					while(DashDash>0)
						sleep(1)
						DashDash--
						step(usr,LockedDir)
						for(var/mob/P in get_step(usr,usr.dir))
							if(ShorTarget)
							else
								ShorTarget=P
								DashDash=0
					if(ShorTarget)
						var/Damage=0.90*(usr.Power*(usr.Strength*usr.StrengthMultiplier)*rand(5,30)/10)/(ShorTarget.Power*(ShorTarget.Endurance*ShorTarget.EnduranceMultiplier))

						Create_Shadow(usr)
						Create_Shadow(ShorTarget)
						var/matrix/State1=matrix()
						State1.Scale(0.85,0.425)
						animate(ShorTarget:Shadow,transform=State1,alpha=190)
						animate(usr:Shadow,transform=State1,alpha=190)
						var

							TargetZ=ShorTarget:pixel_z

							NewZ=TargetZ
						if(TargetZ>usr.pixel_z)
							usr.Frozen=1
							ShorTarget.Frozen=1
							usr.pixel_z=TargetZ-1
						var
							HitNum=1
							ShoryuDelay=1.5
						Stun(usr,0.8)
						Stun(ShorTarget,0.8)
					/*	for(var/mob/E in hearers(12,usr))
							for(var/obj/Communication/C in usr)
								E<<"<font color=[C.Text_Color]>[usr] yells: <b>SHO-</b>"*/
						usr:Quake(8)
						KenShockwave(ShorTarget,Size=2)
					/*	for(var/mob/E in hearers(12,usr))
							for(var/obj/Communication/C in usr)
								E<<"<font color=[C.Text_Color]>[usr] yells: <b>-RYUKEN!!!</b>"*/

						KenShockwave(ShorTarget,Size=2)
						var/obj/Effects/ShoryukenEffect/SE=new
						SE.loc=usr.loc
						animate(SE,alpha=0)
						animate(SE,alpha=255,time=1.5)
						flick("Appear",SE)
						while(ShoryukenHits>0)

							Damage=BlockDamage(ShorTarget,Damage)
							ShorTarget.Health-=Damage
							Injure(ShorTarget,Damage)
							animate(ShorTarget:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)
							animate(usr:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)

							animate(ShorTarget,pixel_z=NewZ+15,ShoryuDelay)
							animate(usr,pixel_z=NewZ+13,ShoryuDelay)
							animate(SE,pixel_z=NewZ,ShoryuDelay)
							Stun(usr,1)
							Stun(ShorTarget,2)
							HitEffect(ShorTarget)
							KenShockwave(ShorTarget,Size=0.5)
							sleep(ShoryuDelay)
							usr.dir=turn(usr.dir,90)
							NewZ=ShorTarget:pixel_z
							ShoryukenHits--
							HitNum++
						flick("Vanish",SE)
						animate(SE,alpha=0,time=1.5)
						spawn(1.5)
							del SE
						if(ShorTarget.Health<=0&&!ShorTarget.KO) ShorTarget.Unconscious(usr)
						animate(ShorTarget,pixel_z=NewZ+4,time=4)
						animate(usr,pixel_z=NewZ+2,time=4)
						sleep(4)
						animate(ShorTarget,pixel_z=1,time=7.5)
						animate(usr,pixel_z=1,time=5.5)
						spawn(2.5)
							usr.Frozen=0
							usr.Flying=0
							ShorTarget:Flying=0
							RemoveShadow(ShorTarget)
							RemoveShadow(usr)
	*/


					var/Drain=src.EnergyMax/5
					if(src.AmatsukenAscension=="Chikara no Hado")
						Drain=0
					if(src.AmatsukenAscension=="Satsui no Hado")
						Drain*=0.5
					if(src.Energy < Drain)
						return
					src.Energy-=Drain
					if(world.realtime < (Z:LastUse+(600*60*24)))
						src << "You cannot use this technique again yet."
						return
					var/found=0
					var/mob/Trg=src.Target

					var/obj/o = new(src.loc)
					step(o, src.dir)
					for(var/mob/m in o.loc)
						if(m==src)
							continue
						if(m)
							Trg=m
					if(!Trg)
						step(o, src.dir)
						for(var/mob/m in o.loc)
							if(m==src)
								continue
							if(m)
								Trg=m
					if(Trg)
						found=1
						src.ShoryukenCount=rand(1,5)
						src.ShoryukenQuake=1
						src.Comboz(Trg)
						src.Melee(2.5,1)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] yells: <b>SHO...</b>"
						sleep(10)
						src.ShoryukenCount=rand(2,7)
						src.ShoryukenBurn=1
						src.ShoryukenQuake=1
						src.Comboz(Trg)
						src.Melee(5,1)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] yells: <b>...RYU...</b>"
						sleep(10)
						src.ShoryukenCount=rand(4,8)
						src.ShoryukenBurn=1
						src.ShoryukenQuake=1
						src.Shoryureppa=1
						src.Comboz(Trg)
						src.Melee(7.5,1)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] yells: <b>...REPPAAAAAAAA!</b>"
						src.Shoryureppa=0
						src.ShoryukenQuake=0
						src.ShoryukenBurn=0

					if(found)
						Z:LastUse = world.realtime

				if("Tatsumaki")
					if(Z.Using)
						return
					var/found=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							found=1
							break
					if(found)
						src << "You Tatsucan't Tatsumaki with a Tatsusword equipped."
						return
					spawn()Z.Cooldown()
					var/Drain=(src.EnergyMax/20)
					if(src.AmatsukenAscension=="Chikara no Hado")
						Drain=0
					if(src.AmatsukenAscension=="Satsui no Hado")
						Drain*=0.5
					if(src.Energy < Drain)
						return
					src.Energy-=Drain

					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>TATSUMAKI...</b>"

					var/triggered=0
					var/Distance
					switch(src.AmatsukenPath)
						if("Hadoken")
							Distance=3
						if("Shoryuken")
							Distance=3
						if("Tatsumaki")
							Distance=6
						else
							Distance=4
					while(Distance)
						if(src.AmatsukenAscension=="Chikara no Hado")
							for(var/mob/m in oview(5, src))
								var/Dir = get_dir(m, src)
								step(m, Dir)
						Distance--
						for(var/mob/P in view(src,1))
							var/Accuracy=(((src.Offense*src.OffenseMultiplier)*src.Power)/((P.Defense*P.DefenseMultiplier)*P.Power))*250
							if(P!=src)
								if(!triggered)
									triggered=1
									var/TatsumakiCount=rand(1,3)
									while(TatsumakiCount)
										TatsumakiCount--
										if(!prob(Accuracy_Formula(src,P,Accuracy)))
											Accuracy=0
										if(prob(Accuracy)&&!P.GER)
											P.Knockback(3,src)
											var/KnockbackDir=pick(-45,45)

											var/Damage=src.StrVsEnd(P, 3)
											if(!prob(Accuracy_Formula(src,P,10)))
												Damage/=rand(3,7)/5

											P.dir=turn(src.dir, KnockbackDir)
											if(src.DiplomaticImmunity || P.DiplomaticImmunity)
												Damage*=0
											if(src.AmatsukenPath && src.AmatsukenPath!="Tatsumaki")
												Damage*=0.9
											if(src.AmatsukenPath=="Tatsumaki")
												Damage*=1.1
											if(src.AmatsukenAscension=="Satsui no Hado")
												P.Burning+=0.1
												P.dir = turn(get_dir(P, src), 180)
											P.Health-=Damage
						step(src, src.dir)
						sleep(2.5)

					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>...SENPUKYAKU!!!</b>"

					if(src.AmatsukenAscension=="Chikara no Hado")
						Z.Cooldown=35
	//				Z.Cooldown()
				if("ExTatsumaki")
					if(Z.Using)
						return
					spawn()Z.Cooldown()
					var/Drain=(src.EnergyMax/20)*2.5
					if(src.AmatsukenAscension=="Chikara no Hado")
						Drain=0
					if(src.AmatsukenAscension=="Satsui no Hado")
						Drain*=0.5
					if(src.Energy < Drain)
						return
					src.Energy-=Drain

					var/triggered=0
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>EX...</b>"

					for(var/mob/P in view(src,2))
						var/Accuracy=(((src.Offense*src.OffenseMultiplier)*src.Power)/((P.Defense*P.DefenseMultiplier)*P.Power))*50
						if(P!=src)
							if(!triggered)
								triggered=1
								var/TatsumakiCount=rand(3,5)
								while(TatsumakiCount)
									TatsumakiCount--

									if(!prob(Accuracy_Formula(src,P,Accuracy)))
										Accuracy=0
									if(prob(Accuracy)&&!P.GER)
										var/Damage=src.StrVsEnd(P, 5)
										if(!prob(Accuracy_Formula(src,P,10)))
											Damage/=rand(3,7)
										if(src.DiplomaticImmunity || P.DiplomaticImmunity)
											Damage*=0
										if(TatsumakiCount==0 && triggered)
											step_towards(P,src)
											sleep(1)
											var/KBDir=turn(src.dir, rand(45, -45))
											P.Knockback(6, KBDir)
										P.Health-=Damage

					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>...TATSUMAKI!!!</b>"

					if(src.AmatsukenAscension=="Chikara no Hado")
						Z.Cooldown=90
	//				Z.Cooldown()

				if("ShinkuTatsumaki")
					if(world.realtime < (Z:LastUse+(600*60*24)))
						src << "You cannot use this technique again yet."
						return
					var/Drain=(src.EnergyMax/20)*5
					if(src.AmatsukenAscension=="Chikara no Hado")
						Drain=0
					if(src.AmatsukenAscension=="Satsui no Hado")
						Drain*=0.5
					if(src.Energy < Drain)
						return
					src.Energy-=Drain

					var/triggered=0
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>SHIN...</b>"
					sleep(2)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>KU...</b>"
					sleep(2)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>TAT...</b>"
					sleep(2)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>SU...</b>"
					sleep(2)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>MAKI---</b>"

					var/Distance=7
					while(Distance)
						if(src.AmatsukenAscension=="Chikara no Hado")
							for(var/mob/m in oview(5, src))
								var/Dir = get_dir(m, src)
								step(m, Dir)
						Distance--
						for(var/mob/P in view(src,1))
							if(P!=src)
								if(!triggered)
									triggered=1
									src.SunlightYellowOverdrive=30
									src.ShinkuTatsumaki=1
									src.dir=get_dir(src, P)
									src.Melee(1,1)
									break

						step(src, src.dir)
						sleep(1)

					Z:LastUse = world.realtime
				if("CleanseSatsui")
					var/list/options = list()
					for(var/mob/m in get_step(src, src.dir))
						options+=m
					var/mob/Choice = input("Who do you want to cleanse?", "Cleanse Satsui") in options
					if(Choice.KO)
						for(var/obj/Skills/Buffs/SatsuiCorruption/s in Choice)
							if(s.BuffUsing)
								Choice.BuffX("SatsuiCorruption", s)
							del s
						Choice << "You've been forcefully cleansed of your corruption."
					else
						var/choice = input(Choice, "Do you want to allow [src] to cleanse you of your Satsui Corruption?", "Cleanse Satsui") in list("Yes", "No")
						if(choice=="Yes")
							for(var/obj/Skills/Buffs/SatsuiCorruption/s in Choice)
								if(s.BuffUsing)
									Choice.BuffX("SatsuiCorruption", s)
								del s
							Choice << "You've been cleansed of your corruption."
						else
							src << "[Choice] has denied your offer."

				if("InfectSatsui")
					var/list/options = list()
					for(var/mob/m in get_step(src, src.dir))
						options+=m
					var/mob/Choice = input("Who do you want to infect?", "Infect Satsui") in options
					if(Choice.KO)
						Choice.contents+=new/obj/Skills/Buffs/SatsuiCorruption
						Choice << "You have been forcefully infected with the Satsui Corruption."
						Choice << "You find that victory is now the most important thing in life..."
						Choice << "In fact, it surpasses life itself!"
					else
						var/choice = input(Choice, "Do you want to relinquish everything and place victory above all in order for greater power?", "Satsui Corruption") in list("Yes", "No")
						if(choice=="Yes")
							Choice.contents+=new/obj/Skills/Buffs/SatsuiCorruption
							Choice << "You have been infected with the Satsui Corruption."
							Choice << "You find that victory is now the most important thing in life..."
							Choice << "In fact, it surpasses life itself!"
						else
							src << "[Choice] has denied your offer."
				if("RagingDemon")
					if(Z.Using)
						return

					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>Shun...</b>"

					for(var/mob/m in view(12, src))
						m.Frozen=1

					var/Distance=16
					while(Distance)
						Distance--
						step(src, src.dir)
						sleep(1)
						for(var/mob/m in view(1, src))
							if(m&&src!=m)
								for(var/mob/E in hearers(12,src))
									for(var/obj/Communication/C in src)
										E<<"<font color=[C.Text_Color]>[src] yells: <b>GOKU...</b>"
								var/obj/x=new/obj/Taiyoken
								for(var/turf/T in Turf_Circle(m,8))
									if(prob(1)) sleep(0.005)
									x.layer=MOB_LAYER+1
									x.icon_state=pick("1","2","3","4","5","6","7")
									T.overlays+=x
									spawn(rand(1,2))T.overlays+=x
									spawn(rand(2,3))T.overlays+=x
									spawn(rand(3,4))T.overlays+=x
									spawn(rand(1,2))T.overlays-=x
									spawn(rand(2,3))T.overlays-=x
									spawn(rand(3,4))T.overlays-=x
									spawn(rand(1,2))T.overlays-=x
									spawn(rand(3,4))T.overlays-=x
									spawn(rand(4,8)) Destroy(T,500)
								var/punches=16
								var/icon/W=icon('Effects.dmi',"Shock")
								var/turf/starting = src.loc
								var/Dir = get_dir(src, m)
								while(punches)
									punches--
									src.Comboz(m)
									flick("Attack", src)
									src.Shockwave(W, 16-punches)
									m.Health-=src.StrVsEnd(m,16-punches)
									sleep(1)
								var/obj/o = new(starting)
								step(o, Dir)
								step(o, Dir)
								src.loc = o.loc
								del o
								for(var/mob/E in hearers(12,src))
									for(var/obj/Communication/C in src)
										E<<"<font color=[C.Text_Color]>[src] yells: <b>SATSU!!!!</b>"
								if(m.KO)
									src.Anger+=m.AngerMax
								Distance=0
								break
					for(var/mob/m in view(50, src))
						m.Frozen=0
					Z.Cooldown()
				if("ArmamentHaki")
					if(!Z.BuffUsing)
						Z:UsingArmament=1
						Z.BuffUsing=1
						switch(src.WillPower)
							if(1)
								Z:StatsUsed=1.15
								src.OMessage(10, "[src] focuses their will in their body!", "[src]([src.key]) used Haki Armament.")
							if(2)
								Z:StatsUsed=1.35
								src.OMessage(10, "[src]'s attacks carry their unusual spirit!", "[src]([src.key]) used Haki Armament.")
							if(3)
								Z:StatsUsed=1.6
								src.OMessage(10, "[src]'s body darkens from their mighty concentration!", "[src]([src.key]) used Haki Armament.")
							if(4)
								Z:StatsUsed=1.9
								src.OMessage(10, "[src]'s torso turns entirely black from their mastery over Armament Haki!", "[src]([src.key]) used Haki Armament.")
							if(5)
								Z:StatsUsed=2.35
								src.OMessage(10, "[src] has an inpenetrable body with endless strength!", "[src]([src.key]) used Haki Armament.")
							else
								src << "INVALID WILLPOWER."
								Z.BuffUsing=0
								Z:UsingArmament=0
								Z:StatsUsed=0
								return
						src.StrengthMultiplier*=Z:StatsUsed
						src.EnduranceMultiplier*=Z:StatsUsed
					else
						Z.BuffUsing=0
						Z:UsingArmament=0
						src.StrengthMultiplier/=Z:StatsUsed
						src.EnduranceMultiplier/=Z:StatsUsed
						Z:StatsUsed=0
						src.OMessage(10, "The force of will fades from [src]...", "[src]([src.key]) turned off Haki Armament.")
				if("ObservationHaki")
					if(!Z.BuffUsing)
						Z:UsingObservation=1
						Z.BuffUsing=1
						switch(src.WillPower)
							if(1)
								Z:StatsUsed=1.15
								src.OMessage(10, "[src] focuses their will to their perceptions!", "[src]([src.key]) used Haki Observation.")
							if(2)
								Z:StatsUsed=1.35
								src.OMessage(10, "[src]'s mind deduces trajectories with alarming accuracy!", "[src]([src.key]) used Haki Observation.")
							if(3)
								Z:StatsUsed=1.6
								src.OMessage(10, "[src]'s body dances like a willow between any offense!", "[src]([src.key]) used Haki Observation.")
							if(4)
								Z:StatsUsed=1.9
								src.OMessage(10, "[src]'s mind defeats any attack as soon as it is seen!", "[src]([src.key]) used Haki Observation.")
							if(5)
								Z:StatsUsed=2.35
								src.OMessage(10, "[src] is untouchable!", "[src]([src.key]) used Haki Observation.")
							else
								src << "INVALID WILLPOWER."
								Z.BuffUsing=0
								Z:UsingObservation=0
								Z:StatsUsed=0
								return
						src.OffenseMultiplier*=Z:StatsUsed
						src.DefenseMultiplier*=Z:StatsUsed
					else
						Z.BuffUsing=0
						Z:UsingObservation=0
						src.OffenseMultiplier/=Z:StatsUsed
						src.DefenseMultiplier/=Z:StatsUsed
						Z:StatsUsed=0
						src.OMessage(10, "[src] reigns in their perceptions...", "[src]([src.key]) turned off Haki Observation.")


mob
	proc
		ChooseKeybladeElement()
			var/choice
			var/confirm="No"
			while(confirm=="No")
				choice=input(src, "What element will your keyblade manifest as?", "Keyblade") in list("Light", "Darkness", "Nothingness")
				if(choice=="Light")
					confirm=alert(src, "Light Keyblades progress at an average rate.  They are well balanced and easy to use.  Do you want Light to be your keyblade's element?", "Keyblade", "Yes", "No")
				if(choice=="Darkness")
					confirm=alert(src, "Dark Keyblades progress slowly.  They are difficult to use effectively but extremely powerful.  Do you want to use Darkness as your keyblade's element?", "Keyblade", "Yes", "No")
				if(choice=="Nothingness")
					confirm=alert(src, "Nothingness Keyblades progress quickly.  They are somewhat difficult to use effectively but very versatile.  Do you want to use Nothingness as your keyblade's element?", "Keyblade", "Yes", "No")
			src.KeybladeElement=choice
		ChooseKeybladeWeapon()
			var/choice
			var/confirm="No"
			while(confirm=="No")
				var/list/choices=list("Sword", "Staff", "Shield")
				choice=input(src, "What weapon will you choose to symbolize your keyblade?", "Keyblade") in choices

				if(choice=="Sword")
					confirm=alert(src, "The power of the warrior.  Invincible courage.  A sword of terrible destruction.  Is this your weapon?", "Keyblade", "Yes", "No")
				if(choice=="Staff")
					confirm=alert(src, "The power of the mystic.  Inner strength.  A staff of wonder and ruin.  Is this your weapon?", "Keyblade", "Yes", "No")
				if(choice=="Shield")
					confirm=alert(src, "The power of the guardian. Kindness to aid friends.  A shield to repel all.  Is this your weapon?", "Keyblade", "Yes", "No")
			src.DiveWeapon=choice
			if(src.DiveWeapon=="Sword")
				src.UnlockComboPlus()
			if(src.DiveWeapon=="Staff")
				src.UnlockMPRage()
			if(src.DiveWeapon=="Shield")
				src.UnlockSecondChance()
		ChooseKeybladeAbandon()
			var/choice
			var/confirm="No"
			while(confirm=="No")
				var/list/choices=list("Sword", "Staff", "Shield")
				if(src.DiveWeapon=="Sword")
					choices-="Sword"
				if(src.DiveWeapon=="Staff")
					choices-="Staff"
				if(src.DiveWeapon=="Shield")
					choices-="Shield"
				choice=input(src, "All things must have weakness.  What symbolizes your keyblade's weakness?", "Keyblade") in choices
				if(choice=="Sword")
					if(src.DiveWeapon=="Sword")
						src << "You can't abandon what you have, Riku."
						confirm="No"
					else
						confirm=alert(src, "The power of the warrior.  Invincible courage.  A sword of terrible destruction.  Is this your weakness?", "Keyblade", "Yes", "No")
				if(choice=="Staff")
					if(src.DiveWeapon=="Staff")
						src << "You can't abandon what you have, Sora."
						confirm="No"
					else
						confirm=alert(src, "The power of the mystic.  Inner strength.  A staff of wonder and ruin.  Is this your weakness?", "Keyblade", "Yes", "No")
				if(choice=="Shield")
					if(src.DiveWeapon=="Shield")
						src << "You can't abandon what you have, Kairi."
						confirm="No"
					else
						confirm=alert(src, "The power of the guardian. Kindness to aid friends.  A shield to repel all.  Is this your weakness?", "Keyblade", "Yes", "No")
			src.DiveAbandon=choice
		KeybladeStatChanges()
			if(src.KeybladeStatAlter)
				return
			if(!src.KeybladeLevel)
				src.KeybladeLevel=1
			var/mult=1
			if(src.KeybladeElement=="Light")
				mult+=0.2
			if(src.KeybladeElement=="Darkness")
				mult+=0.3
			if(src.KeybladeElement=="Nothingness")
				mult+=0.1
			if(src.DiveWeapon=="Sword")
				src.StrMult(1.25*mult)
				src.ForMult(1.25*mult)
				src.OffMult(1.25*mult)
			if(src.DiveWeapon=="Staff")
				src.EnergyMult(1.25*mult)
				src.RecovMult(1.25*mult)
			if(src.DiveWeapon=="Shield")
				src.EndMult(1.25*mult)
				src.ResMult(1.25*mult)
				src.DefMult(1.25*mult)
			if(src.DiveAbandon=="Sword")
				src.StrMult(1-(0.25*(2-mult)))
				src.ForMult(1-(0.25*(2-mult)))
				src.OffMult(1-(0.25*(2-mult)))
			if(src.DiveAbandon=="Staff")
				src.EnergyMult(1-(0.25*(2-mult)))
				src.RecovMult(1-(0.25*(2-mult)))
			if(src.DiveAbandon=="Shield")
				src.EndMult(1-(0.25*(2-mult)))
				src.ResMult(1-(0.25*(2-mult)))
				src.DefMult(1-(0.25*(2-mult)))
			src.KeybladeStatAlter=1
		MakeKeyblade(var/obj/Items/Sword/s)
			s.Damage_Multiplier=1.5
			s.Accuracy_Multiplier=1.5
			s.Delay_Multiplier=1.5
			s.PointsAssigned=1
			s.Points=0
			s.Keyblade=1
			s.KeybladeOwner=src.key
			if(src.KeybladeElement=="Light")
				s.icon='Kingdom Key.dmi'
				s.KeybladeElement="Light"
			if(src.KeybladeElement=="Darkness")
				s.icon='Soul Eater.dmi'
				s.KeybladeElement="Darkness"
			if(src.KeybladeElement=="Nothingness")
				s.icon='KingdomKeyD.dmi'
				s.KeybladeElement="Nothingness"

		PassOnKeyblade(var/mob/m)
			if(m.KeybladeLevel)
				m.InheritSecondKeyblade(src)
				return
			m.KeybladeLevel=src.KeybladeLevel
			m.KeybladeElement=src.KeybladeElement
			src.KeybladeLevel=null
			m.DiveWeapon=src.DiveWeapon
			m.DiveAbandon=src.DiveAbandon
			src.DiveWeapon=null
			src.DiveAbandon=null
			m.ComboPlus=src.ComboPlus
			src.ComboPlus=0
			m.MPRage=src.MPRage
			src.MPRage=0
			m.SecondChance=src.SecondChance
			src.SecondChance=0
			m.KeybladeStatChanges()
		InheritSecondKeyblade(var/mob/m)
			src.SecondKeybladeLevel=m.KeybladeLevel
			src.SecondKeybladeElement=m.KeybladeElement
			src.SecondKeyblade=1
			src.GainDriveForms()
			m.KeybladeLevel=0
			m.KeybladeElement=null
			m.ComboPlus=0
			m.MPRage=0
			m.SecondChance=0
			m.DiveWeapon=null
			m.DiveAbandon=null
			m.LoseDriveForms()
		InheritSecondKeyblade2(var/mob/m)
			src.SecondKeybladeLevel=m.SecondKeybladeLevel
			src.SecondKeybladeElement=m.SecondKeybladeElement
			src.SecondKeyblade=1
			src.GainDriveForms()
			m.SecondKeybladeLevel=0
			m.SecondKeybladeElement=null
			m.SecondKeyblade=0
			m.LoseDriveForms()
		PassOnSecondKeyblade(var/mob/m)
			if(m.KeybladeLevel)
				m.InheritSecondKeyblade2(src)
				return
			m.KeybladeLevel=src.SecondKeybladeLevel
			m.KeybladeElement=src.SecondKeybladeElement
			src.SecondKeyblade=0
			src.SecondKeybladeLevel=0
			src.SecondKeybladeElement=null
			src.LoseDriveForms()
			if(!m.DiveWeapon&&!m.DiveAbandon)
				m.DiveWeapon=src.DiveWeapon
				m.DiveAbandon=src.DiveAbandon
				m.KeybladeStatChanges()
		FetchKeyblade()
			var/obj/Items/Sword/passBack
			if(src.SecondKeyblade)
				var/element=src.SecondKeybladeElement
				if(element=="Light")
					for(var/obj/Items/Sword/s in src)
						if(s.Keyblade)
							if(s.KeybladeElement=="Light")
								passBack=s
				if(element=="Darkness")
					for(var/obj/Items/Sword/s in src)
						if(s.Keyblade)
							if(s.KeybladeElement=="Darkness")
								passBack=s
				if(element=="Nothingness")
					for(var/obj/Items/Sword/s in src)
						if(s.Keyblade)
							if(s.KeybladeElement=="Nothingness")
								passBack=s
			else
				var/element=src.KeybladeElement
				if(element=="Light")
					for(var/obj/Items/Sword/s in src)
						if(s.Keyblade)
							if(s.KeybladeElement=="Light")
								passBack=s
				if(element=="Darkness")
					for(var/obj/Items/Sword/s in src)
						if(s.Keyblade)
							if(s.KeybladeElement=="Darkness")
								passBack=s
				if(element=="Nothingness")
					for(var/obj/Items/Sword/s in src)
						if(s.Keyblade)
							if(s.KeybladeElement=="Nothingness")
								passBack=s
			if(passBack.suffix)
				src << "Take off your keyblade before bestowing it."
				return
			return passBack

		Guts()
			var/list/options=list("Cancel")
			if(src.BerserkerMod>=0)
//				options+=("Insane")
				options+=("Sane")
			if(src.BerserkerMod>3)
				options+=("Insane")
			if(src.BerserkerMod==6)
				options+=("Evolve")
//			if(src.Class=="Deus"||src.Class=="Mazoku")
//				options+=("Evolve")
			if(src.BerserkerInsanityLock==1)
				options-=("Sane")
			var/choice=input(src, "How would you like to wield your armor?", "Corruption Od") in options
			if(choice=="Cancel")
				return 0
			if(choice=="Sane")
				if(src.BerserkerMod>3)
					return 3
				else
					return src.BerserkerMod
			if(choice=="Insane")
				var/choice2=input("Rip them to shreds with even more malice and chaos. Don't use this for non-lethal moments. You will be save-deleted if caught. Are you sure?") in list("Yes","No")
				if(choice2=="Yes")
					return src.BerserkerMod
			if(choice=="Evolve")
				return 6

		ShinjiSenpai()
			usr.MaskType=pick("Physical","Reiatsu","Balanced")
			return

		IWouldMarryRukia()
			usr.MaskAlpha=pick('Kensei.dmi','Kaname.dmi','Ichigo.dmi','Hiyori.dmi','Mashiro.dmi','Rojuro.dmi','Shinji.dmi','Showlong.dmi','Love.dmi','Lisa.dmi')
			return

		BasicStudies()
			src.MadScientistRoll=pick(1,2,3,4,5,6)
			if(src.MadScientistRoll==1)
				if(!locate(/obj/Cyberize,src.contents))
					src.contents+=new/obj/Cyberize
					src<< "You can now perform surgery on yourself!"
					return
				else if(!src.AlienRacialPassive)
					src.AlienRacialPassive="Honeybadger"
					src.StrengthMod*=1.1
					src.EnduranceMod*=1.15
					src.ResistanceMod*=1.2
					src<< "Your studies have led you to become able to withstand poisons and burns!"
					return
				else
					src.StrengthMod*=1.1
					src.EnduranceMod*=1.25
					src.ResistanceMod*=1.5
					src<< "Your studies have made you more resistant to pain..."
					if(src.TechnologyUnlocks.Find("Teleport")&&!locate(/obj/Skills/ChaosTeleport,src.contents))
						src.contents+=new/obj/Skills/ChaosTeleport
						src<< "... and become able to teleport to people from around the universe!"
					if(src.TechnologyUnlocks.Find("Cloak")&&!locate(/obj/Skills/LastBreath,src.contents))
						src.contents+=new/obj/Skills/LastBreath
						src<< "... and become able to hide yourself from defeat!"
					if(locate(/obj/Skills/Rank/Imitation,src.contents)&&!locate(/obj/Skills/Rank/ChaosImitate))
						src.contents+=new/obj/Skills/Rank/ChaosImitate
						src<< "... and become able to take the appearance of anyone in the universe!"
					return
			if(src.MadScientistRoll==2)
				if(!locate(/obj/Cyberize,src.contents))
					src.contents+=new/obj/Cyberize
					src<< "You can now perform surgery on yourself!"
					return
				else if(!locate(/obj/WeirdCreation/CreateAndroid,src.contents))
					src.contents+=new/obj/WeirdCreation/CreateAndroid
					src<< "You can now create an Android!"
					return
				else if(!locate(/obj/WeirdCreation/CreateBioAndroid,src.contents))
					src.contents+=new/obj/WeirdCreation/CreateBioAndroid
					src<< "You can now create an Bio Android!"
					src.MadScientistType="Bio"
					return
			if(src.MadScientistRoll==3)
				if(!locate(/obj/Cyberize,src.contents))
					src.contents+=new/obj/Cyberize
					src<< "You can now perform surgery on yourself!"
					return
				else if(!locate(/obj/WeirdCreation/CreateMajin,src.contents))
					src.contents+=new/obj/WeirdCreation/CreateMajin
					src<< "You can now create a Majin!"
					return
				else if(!locate(/obj/Skills/Buffs/Majin,src.contents))
					src.contents+=new/obj/Skills/Buffs/Majin
					src.contents+=new/obj/Skills/Rank/Contractor
					src<< "You have discovered a plethora of curses..."
					src.MadScientistType="Majin"
					return
			if(src.MadScientistRoll==4)
				if(!locate(/obj/Skills/MayuriRegenerate,src.contents))
					src.contents+=new/obj/Skills/MayuriRegenerate
					src<< "You are now able to repair your body!"
					return
				else if(!locate(/obj/Skills/Namekian/InjuryRecovery,src.contents))
					src.contents+=new/obj/Skills/Namekian/InjuryRecovery
					src.contents+=new/obj/Skills/Namekian/ExtendAttack
					src.contents+=new/obj/Skills/Namekian/ExtendGrab
					src.Regeneration*=2
					src<< "You have become a true master of repairing your form..."
					return
				else
					src.contents+=new/obj/Skills/Buffs/DiplomaticImmunity
					src.Regeneration*=3
					src<< "You can now shift into a liquid state in order to escape battle..!?"
					src.MadScientistType="Regen"
					return
			if(src.MadScientistRoll==5)
				if(!locate(/obj/Skills/Buffs/LockOn,src.contents))
					src.contents+=new/obj/Skills/Buffs/LockOn
					src.OffenseMod*=1.2
					src<< "Your precision and focus rival that of heroes of legend!"
					return
				else if(!locate(/obj/Skills/Buffs/Byakugan,src.contents))
					src.contents+=new/obj/Skills/Buffs/Byakugan
					src.OffenseMod*=1.35
					src.DefenseMod*=1.35
					src.SpeedMod*=1.2
					src<< "You have explored the depths of the windows to the soul..."
					return
				else if(!locate(/obj/Skills/Gravity,src.contents))
					src.contents+=new/obj/Skills/Gravity
					src.StrengthMod*=1.2
					src.EnduranceMod*=1.2
					src.ForceMod*=1.2
					src.ResistanceMod*=1.2
					src<< "You can now manipulate the force that binds matter to other matter!"
					src.MadScientistType="Gravity"
					return
			if(src.MadScientistRoll==6)
				if(!locate(/obj/Skills/Rank/GunKata,src.contents))
					src.contents+=new/obj/Skills/Rank/GunKata
					src.contents+=new/obj/Skills/Attacks/Fire_Shot
					src.contents+=new/obj/Skills/Rank/LosLobos
					src<< "You become able to mix swordplay with gunplay!"
					return
				else if(!locate(/obj/Skills/MartialArts/SuperHumanDrug,src.contents))
					src.contents+=new/obj/Skills/MartialArts/SuperHumanDrug
					src.SpeedMod*=1.2
					src<< "You are now able to trap people within their minds...!?"
				else
					src.EnergyMod*=1.5
					src.Energy*=1.5
					src.Intelligence*=1.25
					src<< "You study harder..."
					if(src.TechnologyUnlocks.Find("Teleport")&&!locate(/obj/Skills/Rank/ShunkanIdo,src.contents))
						src.contents+=new/obj/Skills/Rank/ShunkanIdo
						src<< "... and become able to teleport to people that you are familiar with!"
					if(src.TechnologyUnlocks.Find("Cloak")&&!locate(/obj/Skills/Rank/DesoInvisibility,src.contents))
						src.contents+=new/obj/Skills/Rank/DesoInvisibility
						src<< "... and become able to hide yourself from view without cloaking technology!"
					if(locate(/obj/Skills/Rank/Imitation,src.contents)&&!locate(/obj/Skills/Attacks/DragonFist,src.contents))
						src.contents+=new/obj/Skills/Attacks/DragonFist
						src<< "... and stumble upon the power to destroy enemies with your fists!"
					return

		AdvancedStudies()
			src.MadScientistRollv2=pick(1,2,3)
			if(src.MadScientistRollv2==1)
				if(!src.TechnologyUnlocks.Find("Cloak"))
					src.TechnologyUnlocks.Add("Cloak")
					src<< "You've become able to make things invisible!"
					return
	/*		if(pick==2)
				if(!src.TechnologyUnlocks.Find("Pocket"))
					src.TechnologyUnlocks.Add("Pocket")
					src<< "You've become able to carve out holes in the universe!"
					return*/
			if(src.MadScientistRollv2==2)
				src.contents+=new/obj/Skills/Rank/Imitation
				src<< "You've become able to mimic the appearances of others!"
				return
			if(src.MadScientistRollv2==3)
				if(!src.TechnologyUnlocks.Find("Teleport"))
					src.TechnologyUnlocks.Add("Teleport")
					src<< "You've become able to move yourself around the world!"
					return

		TabooStudies()
			if(src.MadScientistType=="Bio")
				src.contents+=new/obj/Skills/Rank/Necromancy
				src.contents+=new/obj/Skills/Rank/AgonyField
				src<< "You have reaped all knowledge of biology that is possible..."
			else if(src.MadScientistType=="Majin")
				src.contents+=new/obj/Skills/Rank/Majinize
				src.contents+=new/obj/Skills/Rank/Conjure
				src<< "You have reaped all knowledge of curses that is possible..."
			else if(src.MadScientistType=="Regen")
				src.contents+=new/obj/Skills/Bebi
				src<< "You have reaped all knowledge of chemistry that is possible..."
			else if(src.MadScientistType=="Gravity")
				src.contents+=new/obj/Skills/Rank/KyokaSuigetsuClone
				src.contents+=new/obj/Skills/Attacks/KuroHitsugi
				src.GravityMastered+=100
				src<< "You have reaped all knowledge of natural forces that is possible..."
			src.StrengthMod*=1.5
			src.EnduranceMod*=1.5
			src.SpeedMod*=1.3
			src.ForceMod*=1.5
			src.Resistance*=1.5
			src.Offense*=1.35
			src.Defense*=1.35
			src.Recovery*=1.25
			src.Regeneration*=1.25
			src.Potential=0
			src.Divine=1
			src<< "Your endless drive for knowledge has met an immense wall..."
			return

		ChooseSpiritEnergyLevel()
			var/list/options=list("Cancel")
			if(src.SpiritLevel>=1)
				options+=("Level 1")
			if(src.SpiritLevel>=2)
				options+=("Level 2")
			if(src.SpiritLevel>=3)
				options+=("Level 3")
			if(src.SpiritLevel>=4)
				options+=("Level 4")
			if(src.SpiritLevel>=5)
				options+=("Sacred Energy")
			var/choice=input(src, "What level of Spirit Energy do you want to use?", "Spirit/Demon Energy") in options
			if(choice=="Cancel")
				return 0
			if(choice=="Level 1")
				return 1
			if(choice=="Level 2")
				return 2
			if(choice=="Level 3")
				return 3
			if(choice=="Level 4")
				return 4
			if(choice=="Sacred Energy")
				return 5

		ChooseSpiritWeapon()
			var/list/choices=list("Spirit Gun", "Spirit Sword", "Spirit Style")
			var/choice
			var/confirm="No"
			while(confirm=="No")
				choice=input(src,"What specialty will you focus your Spirit Energy on?", "Spirit Energy Ascension") in choices
				if(choice=="Spirit Gun")
					confirm=alert(src,"Spirit Gun is a style that focuses on dealing high damage quickly.  It has high risks by its nature.  Do you want to learn Spirit Gun?", "Spirit Energy Ascension", "Yes", "No")
				if(choice=="Spirit Sword")
					confirm=alert(src,"Spirit Sword is a style that focuses on manifesting a sword and doing battle with it.  It is a safe, linear option which becomes dangerously effective at higher levels.  Do you want to learn Spirit Sword?", "Spirit Energy Ascension", "Yes", "No")
				if(choice=="Spirit Style")
					confirm=alert(src,"Spirit Style is a...style...that focuses on increasing the bonuses of various martial arts and mastering them to the fullest extent.  Do you want to learn Spirit Style?", "Spirit Energy Ascension", "Yes", "No")
			if(choice=="Spirit Gun")
				src.SpiritWeaponChosen="Gun"
				src << "You harness the overwhelming destructive ability of Spirit Gun!"
				src.contents+=new/obj/Skills/Attacks/SpiritGun
			if(choice=="Spirit Sword")
				src.SpiritWeaponChosen="Sword"
				src << "You shackle the force of your soul into a Spirit Sword!"
				src.contents+=new/obj/Skills/Attacks/SpiritSword
			if(choice=="Spirit Style")
				src.SpiritWeaponChosen="Spirit"
				src << "You devote yourself to martial arts!"
		LocateSpiritT3()
			if(src.SpiritWeaponChosen=="Gun")
				if(!locate(/obj/Skills/TierS/SpiritShotgun,src))
					return 0
			if(src.SpiritWeaponChosen=="Sword")
				if(!locate(/obj/Skills/TierS/BeamSwordSlash,src))
					return 0
			if(src.SpiritWeaponChosen=="Style")
				if(!locate(/obj/Skills/TierS/CustomStyle,src))
					return 0
			return 1
		LocateSpiritT4()
			if(src.SpiritWeaponChosen=="Gun")
				if(!locate(/obj/Skills/TierS/SpiritGunMega,src))
					return 0
			if(src.SpiritWeaponChosen=="Sword")
				if(!locate(/obj/Skills/Attacks/DimensionSword, src)&&!src.MadeDimensionSword)
					return 0
			if(src.SpiritWeaponChosen=="Style")
				if(!locate(/obj/Skills/TierS/RefineStyle,src))
					return 0
			return 1
		GetSpiritT3()
		GetSpiritT4()
		ChooseDemonWeapon()
		LocateDemonT3()
		LocateDemonT4()
		GetDemonT3()
		GetDemonT4()

		ChooseKamuiForm()
			var/list/options=list()
			var/choice
			if(!locate(/obj/Skills/TierS/SenjinNu, src))
				options+="Power!"
			if(!locate(/obj/Skills/TierS/ShippuNu, src))
				options+="Speed!"
			choice=input(src, "You have advanced in your affinity with Life Fibers to the point where you can make additional modifications to your outfit.  What suits your fancy?", "Kamui Advancement") in options
			if(choice=="Power!")
				src.contents+=new/obj/Skills/TierS/SenjinNu
				src << "You learn to make your outfit acquire a fuckton of blades!"
			if(choice=="Speed!")
				src.contents+=new/obj/Skills/TierS/ShippuNu
				src << "You learn to turn your outfit into a mobile airsuit!"
			if(options.len == 0)
				src.contents+=new/obj/Skills/TierS/SenjinShippu
				src << "You learn to turn your outfit into a mobile airsuit with a fuckton of blades!"
		SuperKamuiAscension()
			src.SuperKamuiAscension=1
			src << "Your Kamui becomes a part of your body, fusing with you forever."
			for(var/obj/Skills/TierS/SenjinNu/n in src)
				del n
			for(var/obj/Skills/TierS/ShippuNu/n in src)
				del n
			for(var/obj/Skills/TierS/SenjinShippu/n in src)
				del n
			for(var/obj/Skills/TierS/KamuiNu/n in src)
				del n