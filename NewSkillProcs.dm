mob
	proc
		DFrenzy(var/wut, var/obj/Skills/Z)
			switch(wut)
				if("DFrenzyH")
					if(!Z.BuffUsing)
						Z.BuffUsing=1
						src.Power_Multiplier+=0.2
						src.StrengthMultiplier*=1.2
						src.EnduranceMultiplier*=0.8
						src.SpeedMultiplier*=1.2
						src.ForceMultiplier*=1.2
						src.ResistanceMultiplier*=0.8
						src.OffenseMultiplier*=0.9
						src.DefenseMultiplier*=0.9
						src.Anger=src.AngerMax
						src.OMessage(10, "[src] enters a frenzied state!", "[src]([src.key]) used Dhampir Human Frenzy.")
					else
						Z.BuffUsing=0
						src.Power_Multiplier-=0.2
						src.StrengthMultiplier/=1.2
						src.EnduranceMultiplier/=0.8
						src.SpeedMultiplier/=1.2
						src.ForceMultiplier/=1.2
						src.ResistanceMultiplier/=0.8
						src.OffenseMultiplier/=0.9
						src.DefenseMultiplier/=0.9
						src.Anger=0
						src.OMessage(10, "[src] exits their frenzied state...", "[src]([src.key]) deactivated Dhampir Human Frenzy.")
				if("DFrenzyV")
					if(!Z.BuffUsing)
						Z.BuffUsing=1
						src.Power_Multiplier+=2
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=0.75
						src.SpeedMultiplier*=1.5
						src.ForceMultiplier*=1.5
						src.ResistanceMultiplier*=0.75
						src.OffenseMultiplier*=0.75
						src.DefenseMultiplier*=0.75
						src.Anger=src.AngerMax
						src.OMessage(10, "[src] enters a monsterously frenzied state!", "[src]([src.key]) used Dhampir Vampire Frenzy.")
					else
						Z.BuffUsing=0
						src.Power_Multiplier-=2
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=0.75
						src.SpeedMultiplier/=1.5
						src.ForceMultiplier/=1.5
						src.ResistanceMultiplier/=0.75
						src.OffenseMultiplier/=0.75
						src.DefenseMultiplier/=0.75
						src.Anger=0
						src.OMessage(10, "[src]'s body sags as they exit their monsterous state...", "[src]([src.key]) deactivated Dhampir Vampire Frenzy.")
				if("DFrenzyB")
					if(!Z.BuffUsing)
						Z.BuffUsing=1
						src.Power_Multiplier+=0.5
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=0.75
						src.SpeedMultiplier*=1.5
						src.ForceMultiplier*=1.5
						src.ResistanceMultiplier*=0.75
						src.OffenseMultiplier*=0.75
						src.DefenseMultiplier*=0.75
						src.Anger=src.AngerMax
						src.OMessage(10, "[src] enters a focused, frenzied state!", "[src]([src.key]) used Dhampir Dhampir Frenzy.")
					else
						Z.BuffUsing=0
						src.Power_Multiplier-=0.5
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=0.75
						src.SpeedMultiplier/=1.5
						src.ForceMultiplier/=1.5
						src.ResistanceMultiplier/=0.75
						src.OffenseMultiplier/=0.75
						src.DefenseMultiplier/=0.75
						src.Anger=0
						src.OMessage(10, "[src]'s shoulders slump as they exit their focused state...", "[src]([src.key]) deactivated Dhampir Dhampir Frenzy.")
mob/proc/SkillHX(var/Wut,var/obj/Skills/Z,var/bypass=0) //Half Demon skills
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.Stunned)
		return
	/* currently does nothing
	var/ManaDrain=1
	var/StaffPower=1
	var/Element=0
	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
		StaffPower=N.Staff_Power
		Element=N.Element
	*/
	if(bypass||Z)
		switch(Wut)
			if("Hotline")
				if(src.KO||Z.Using==1||src.Frozen)return
				if(src.Energy>EnergyMax/10)
					Z.Using=1
					var/wait =180
					spawn(wait)
						if(src)
							Z.Using=0
							src<<"Hotline cooldown finished."
					SweepingKick(src)
					src.OMessage(20,"[src] strangles time with a dimensional rift!","[src]([src.key]) used Hotline!")
					KenShockwave2(src,icon='fevKiai.dmi',Size=5)
					for(var/mob/P in view(4))

						var/Damage=src.StrVsEnd(P)
						var/Accuracy=100//((src.Offense*src.OffenseMultiplier)/(P.Defense*P.DefenseMultiplier))*75
						if(P!=src)
							if(prob(Accuracy)&&!P.GER)
								HitEffect(P)
								if(src.DiplomaticImmunity || P.DiplomaticImmunity)
									Damage*=0
								P.Health-=Damage
								P.Knockback(1,src)
								var/stun_length = 3
								//increase the stun if Silk Armor is active
								for(var/obj/Skills/Buffs/Silk_Armor/S in P)
									if(S.BuffUsing) stun_length*=2
								Stun(P,amount=stun_length)
							src.Energy-=src.EnergyMax/50
					sleep(50)
			/*if("Quicksilver")
				if(Z.Using)return
				Z.Using=1
				for(var/mob/M in view(20,src))
					animate(M.client, color = list(0.3,0.3,0.3, 0.59,0.59,0.59, 0.11,0.11,0.11), time = 10)
					if(M!=src)//&&M.SpiralResistance==0)
						M.QuicksilverFrozen=1
						Slow(M, 4, 50)
					if(M==src)
						Slow(M, 4, 1)
				src.OMessage(20,"[src] travels at lightning-fast speed!","[src]([src.key]) used Quicksilver!")
				src.Quicksilver=1
				Z.Cooldown()*/
			if("Revenge")
				if(!Z.BuffUsing)
					src.OMessage(30, "<b>[src] begins breathing erratically.</b>","[src]([src.key]) used Wrath.")
					Z.BuffUsing=1
					src.WrathRevenge=1
				else
					src.OMessage(30, "[src] calms down.","[src]([src.key]) deactivated Wrath.")
					Z.BuffUsing=0
					src.WrathRevenge=0
mob/proc/Skill1X(var/Wut,var/obj/Skills/Z,var/bypass=0) //A-I
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.Stunned)
		return
	var/ManaDrain=1
	var/StaffPower=1
	var/Element=0
	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
		StaffPower=N.Staff_Power
		Element=N.Element
	if(bypass||Z)
		switch(Wut)
			if("SpaceSwap")
				if(Z.Using)
					return
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				var/list/people=list("Cancel")
				for(var/mob/M in view(15,src))
					var/distance=abs(src.x-M.x)+abs(src.y-M.y)
					if(distance<=Z.Level*sqrt(Z.Level))
						if(M.z!=src.z&&Z.Level<99)
							continue
						people.Add(M)
				var/mob/Choice=input("Magically swap places with who?")in people
				if(Choice=="Cancel")return
				src.OMessage(5,"[src]'s body suddenly contorted...","[src]([src.key]) used Space Swap on [Choice]([Choice.key])!")
				//src.SkillLeech(Z)
				sleep(3)
				if(Choice)
					if(Choice.Divine)
						src<<"NOPE."
						return
					if(Choice.Class=="Bibarel")
						src<<"NOPE."
						return
					else
						Choice.Frozen=1
						Choice.PrevX=Choice.x
						Choice.PrevY=Choice.y
						Choice.PrevZ=Choice.z
						Choice.loc = locate(src.x, src.y, src.z)
						src.loc = locate(Choice.PrevX, Choice.PrevY, Choice.PrevZ)
						usr<<"You appear at [Choice]'s spot as they disappear..!?"
						Choice<<"You feel as if you're torn through fate without warning..."
						sleep(30)
						Choice.Frozen=0
						Z.Skill_Increase()
						src.SkillLeech(Z)
						Z.Cooldown()

			if("Enlarge")
				if(!Z.BuffUsing)
					Z:Iconz=src.icon
					if(src.overlays)Z:Overlayz.Add(src.overlays)
					src.overlays-=src.overlays
					var/icon/Heh=new(src.icon)
					src.icon=null
					if(src.Hair)Heh.Blend(Hair,ICON_OVERLAY)
					var/lolol=2*4*4+32
					Heh.Scale(lolol,lolol)
					src.overlays+=image(Heh,pixel_x=-(lolol-32)/2,pixel_y=-(lolol-32)/2)
					src.OMessage(10,"[src] greatly increases in size!","<font color=red>[src]([src.key]) activated Enlarge.")
					Z.BuffUsing=1
				else
					src.OMessage(10,"[src] decreases in size.","<font color=red>[src]([src.key]) deactivated Enlarge.")
					src.overlays-=src.overlays
					src.icon=Z:Iconz
					src.overlays.Add(Z:Overlayz)
					Z:Iconz=null
					Z:Overlayz-=Z:Overlayz
					Z.BuffUsing=0

			if("MetalVessel")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.DjinnName = input(src, "What is the name of your Metal Vessel?", "Djinn Title") as text
					src.DjinnAction = input(src, "What do declare when you unleash your Metal Vessel? (This is transcribed literally.", "Djinn Chant") as text
					src.DjinnCry = input(src, "What do others see when your Metal Vessel's power is brought out?", "Djinn Appearance") as text
					var/list/magic=list("Cancel","Fire","Lightning","Water","Wind","Sound","Strength","Life","Light")
					if(!src.DjinnMagic)
						src.DjinnMagic = input(src, "What is your potential?", "Djinn Magic") in magic
					for(var/obj/Items/Sword/S in src)
						if(S.suffix&&!src.DjinnMade)
							S.Accuracy_Multiplier=2
							S.Damage_Multiplier=2.5
							S.Delay_Multiplier=2.5
							S.Djinn=1
							S.Explosive=0
							S.Homing=0
							S.Points=0
							S.PointsAssigned=1
							S.Enchanted=1
							if(src.DjinnMagic=="Fire")
								S.EnchantType="Fire"
								S.Explosive=1
							else if(src.DjinnMagic=="Water")
								S.EnchantType="Water"
							else if(src.DjinnMagic=="Wind")
								S.EnchantType="Wind"
							else if(src.DjinnMagic=="Sound")
								S.Homing=1
							else
								S.EnchantType="None"
							src<<"This material possession... [S]... becomes filled with your spirit..."
							src.DjinnMade=1
						else if(src.DjinnMade)
							src<<"You already embued a material possession with your spirit... (if your sword was destroyed or some shit, adminhelp)"
					Z.BuffUsing=0
				else
					return

			if("DjinnEquip")
				if(!src.DjinnCry||!src.DjinnName||!src.DjinnAction)
					src << "You have to use MetalVessel before this."
					return
				if(!Z.BuffUsing)
	/*				if(src.SpecialSlot)
						src << "You're already using a special buff."
						return*/
					if(src.ActiveBuffs)
						src << "You can't use this with other slotted buffs active."
						return
					for(var/obj/Items/Sword/S in src)
						if(S.suffix)
							if(!S.Djinn)
								src<<"You need to have your Djinn equipped to use this buff."
								return
					src.ActiveBuffs=3
					src.SpecialSlot=1
					Z.BuffUsing=1
					src.Power_Multiplier+=0.25
					src.EnduranceMultiplier*=1.25
					src.ForceMultiplier*=1.25
					src.ResistanceMultiplier*=1.5

					src.DjinnActive=1

					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] calls: [src.DjinnName], [src.DjinnAction]!"
					src.OMessage(20, "[src.DjinnCry]", "[src]([src.key]) used Metal Vessel.")
				else
					src.ActiveBuffs=0
					src.SpecialSlot=0
					Z.BuffUsing=0
					src.Power_Multiplier-=0.25
					src.EnduranceMultiplier/=1.25
					src.ForceMultiplier/=1.25
					src.ResistanceMultiplier/=1.5

					src.DjinnActive=0

					src.OMessage(10, "[src] conceals their Djinn's power...", "[src]([src.key]) stopped using Metal Vessel.")


			if("FullDjinnEquip")
				if(!src.DjinnCry||!src.DjinnName)
					src << "You have to use MetalVessel before this."
					return
				if(!Z.BuffUsing)
			/*		if(src.SpecialSlot)
						src << "You're already using a special buff."
						return*/
					if(src.ActiveBuffs)
						src << "You can't use this with other slotted buffs active."
						return
					for(var/obj/Items/Sword/S in src)
						if(S.suffix)
							if(!S.Djinn)
								src<<"You need to have your Djinn equipped to use this buff."
								return
					src.ActiveBuffs=3
					src.SpecialSlot=1
					Z.BuffUsing=1
					src.Power_Multiplier+=1
					src.StrengthMultiplier*=1.2
					src.EnduranceMultiplier*=1.45
					src.ForceMultiplier*=1.45
					src.ResistanceMultiplier*=2
					src.OffenseMultiplier*=1.2
					src.DefenseMultiplier*=1.2
					src.RecoveryMultiplier*=1.25

					src.DjinnActive=1
					src.FullDjinnActive=1

					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] calls: [src.DjinnName], [src.DjinnAction]!"
					src.OMessage(20, "[src.DjinnCry]", "[src]([src.key]) used Metal Vessel.")
				else
					src.ActiveBuffs=0
					src.SpecialSlot=0
					Z.BuffUsing=0
					src.Power_Multiplier-=1
					src.StrengthMultiplier/=1.2
					src.EnduranceMultiplier/=1.45
					src.ForceMultiplier/=1.45
					src.ResistanceMultiplier/=2
					src.OffenseMultiplier/=1.2
					src.DefenseMultiplier/=1.2
					src.RecoveryMultiplier/=1.25

					src.DjinnActive=0
					src.FullDjinnActive=0

					src.OMessage(10, "[src] conceals their Djinn's power...", "[src]([src.key]) stopped using Metal Vessel.")

			if("TheHunger")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs)
						src << "You can't use this with other slotted buffs active."
						return
					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					for(var/obj/Items/Sword/S in src)
						if(!S.suffix)
							src << "You need to be using a sword to utilize this form."
							return
					Z.BuffUsing=1
					src.SpecialSlot=1
					src.ActiveBuffs+=3
					src.Power_Multiplier+=1
					src.EnduranceMultiplier*=1.5
					src.ResistanceMultiplier*=1.75
					src.TheHunger=1
					src.OMessage(10, "[src]'s weapon twists and contorts with a ravenous aura", "[src]([src.key]) indulged The Hunger.")
				else
					src.TheHunger=0
					src.Power_Multiplier-=1
					src.EnduranceMultiplier/=1.5
					src.ResistanceMultiplier/=1.75
					src.SpecialSlot=0
					src.ActiveBuffs-=3
					src.OMessage(10, "[src]'s weapon retakes it's usual form.", "[src]([src.key]) defied The Hunger.")
					Z.BuffUsing=0

			if("NineLivesBladeWorks")
				if(src.KO||Z.Using||src.Blocking)return
				var/obj/Items/Sword/found
				for(var/obj/Items/Sword/s in src)
					if(s.suffix)
						found=s
				if(!found)
					src << "You need to have a sword equipped to ravage your victim."
					return
				src.NineLives=9
				Z.Using=1
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: I must project beyond my limits..."
				sleep(10)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Here I come!"
				sleep(10)
				src.NineLives=9
				sleep(50)
				src.NineLives=0
				src<<"Your mana stores have run dry...!"
				//spawn(100) src.GetDunked=0
				src.ManaAmount=1
				src.TotalFatigue+=50

			if("KakuyokuSanren")
				if(src.KO||Z.Using||src.Blocking)return
				var/obj/Items/Sword/found
				for(var/obj/Items/Sword/s in src)
					if(s.suffix)
						found=s
				if(!found)
					src << "You need to have a sword equipped to ravage your victim."
					return
				src.XStrike=6
				Z.Using=1
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] screams: I'LL MAKE YOU MOVE!"
				sleep(10)
				src.XStrike=6
				sleep(50)
				src.XStrike=0
				src<<"Your mana stores have run dry...!"
				//spawn(100) src.GetDunked=0
				src.ManaAmount-=30
				src.TotalFatigue+=10

			if("RhoAias")
				if(!Z.BuffUsing)
					src.OMessage(10, "[src] holds out a hand and projects an energy shield of seven massive petals!!", "[src]([src.key]) used Rho Aias.");
					src.ResistanceMultiplier*=25
					src.RhoAias=1
					src.overlays+='RhoAias.dmi'
					Z.BuffUsing=1
					sleep(100)
					if(src.RhoAias)
						src.RhoAias=0
						src.ResistanceMultiplier/=25
						src.overlays-='RhoAias.dmi'
						src.OMessage(10, "[src]'s energy shield vanishes.", "[src]([src.key]) deactivated Rho Aias.")
						sleep(2000)
						src<<"Rho Aias may be cast again!"
						Z.BuffUsing=0

			if("Caster")
				if(!Z.BuffUsing)
					if(src.ManaMax<=50)
						src << "You do not have the magical prowess to perform this act..."
						return
					Z.BuffUsing=1
					var/list/people=list("Cancel")
					for(var/mob/Players/M in world)
						people.Add(M)
					var/mob/Choice=input("Who shall you target?")in people
					if(Choice=="Cancel")
						Z.BuffUsing=0
						return
					else
						src.CurseTarget=Choice
						src.OMessage(20, "The area around [src] is filled with malice!", "[src]([src.key]) began to curse [Choice].")
					var/DS=input("How shall you Dark Souls them into oblivion?") in list("Physical", "Metaphysical", "Cancel")
					if(DS=="Cancel")
						Z.BuffUsing=0
						return
					else if(DS=="Physical")
						if(Choice.CursedAlpha)
							src << "Their body is already devastated by a curse..."
							Z.BuffUsing=0
							return
						if(!src.CursedRoll)
							src.CursedRoll=pick(1,2,3,4,5)
						if(src.CursedRoll==1)
							Choice.StrengthMod/=2
							Choice.Strength/=2
							Choice.CursedAlpha="Strength"
							Choice << "Your muscles twinge with agony..."
						else if(src.CursedRoll==2)
							Choice.EnduranceMod/=2
							Choice.Endurance/=2
							Choice.CursedAlpha="Endurance"
							Choice << "Your bones ache without ceasing..."
						else if(src.CursedRoll==3)
							Choice.ResistanceMod/=2
							Choice.Resistance/=2
							Choice.CursedAlpha="Resistance"
							Choice << "Your nerves are on fire..."
						else if(src.CursedRoll==4)
							Choice.ForceMod/=2
							Choice.Force/=2
							Choice.CursedAlpha="Force"
							Choice << "Your grip on ki loosens heavily..."
						else if(src.CursedRoll==5)
							Choice.OffenseMod/=1.5
							Choice.Offense/=1.5
							Choice.DefenseMod/=1.5
							Choice.Defense/=1.5
							Choice.CursedAlpha="Oxywaddle"
							Choice << "Your eyes twitch and your sense of balance continuously feels off..."
						src.OMessage(20, "[src] cackles loudly as the sinister sensation vanishes..!", "[src]([src.key]) finished cursing [Choice].")
						src.CursedRoll=0
						src.ManaMax-=20
						src.ManaAmount-=20
						Z.Cooldown()
					else if(DS=="Metaphysical")
						if(Choice.CursedBeta)
							src << "Their soul has already been stricken with damnation..."
							Z.BuffUsing=0
							return
						if(!src.CursedRoll)
							src.CursedRoll=pick(1,2,3,4,5,6,7,8,9,10)
						if(src.CursedRoll==1)
							Choice.EnergyMod/=2
							Choice.Energy/=2
							Choice.Recovery/=2
							Choice.CursedBeta="Recovery"
							Choice << "Your limbs feel heavy and sluggish..."
						if(src.CursedRoll==2)
							Choice.CursedBeta="Irreverence" // PU gain = 0
							Choice << "An outward pressure pushes upon your reserves..."
						if(src.CursedRoll==3)
							Choice.AngerMax/=5
							Choice.CursedBeta="Peace"
							Choice << "Any frustration you possess fades away..."
						if(src.CursedRoll==4)
							Choice.SpeedMod/=3
							Choice.CursedBeta="Slow" // delay nerf
							Choice << "Your lungs begin to beg for more oxygen... you're heaving..."
						if(src.CursedRoll==5)
							Choice.CursedBeta="Death" // constant health loss
							Choice << "Your entire body is filled with a sense of dread..."
						if(src.CursedRoll==6)
							Choice.CursedBeta="Mute"
							Choice << "An outward pressure pushes against your throat..."
						if(src.CursedRoll==7)
							Choice.CursedBeta="Tome"
							Choice << "When you will your body to move, it struggles to obey..."
						if(src.CursedRoll==8)
							Choice.CursedBeta="Empty" // ( :
							Choice << "You feel as if something is watching you..."
						if(src.CursedRoll==9)
							Choice.CursedBeta="Power" // ratio nerf
							Choice << "An outward pressure pushes against your entire body..."
					/*	if(Beta==10)
							Choice.CursedBeta="Forsaken" // can't wield swords or use stances
							Choice << "An outward pressure pushes against your hands and feet..."*/
						if(src.CursedRoll==10)
							Choice.icon='Wolf.dmi'
							Choice.overlays-=Choice.overlays
							Choice.underlays-=Choice.underlays
							Choice.CursedBeta="Animal"
							Choice.EnhancedSmell=1
							Choice.EnhancedHearing=1
							if(Choice.Gender=="Male")
								Choice.name="John The Wolf"
							else if(Choice.Gender=="Female")
								Choice.name="Jane The Wolf"
							else
								Choice.name="Jinx The Wolf"
							Choice << "You feel as if something about your body has changed..."
						src.OMessage(20, "[src] cackles loudly as the sinister sensation vanishes..!", "[src]([src.key]) finished cursing [Choice].")
						src.CursedRoll=0
						src.ManaMax-=50
						src.ManaAmount-=50
						Z.Cooldown()

			if("GatesOfBabylon")
				var/Mam=input("What shall you do, my Lord?") in list("Launch", "Release", "Manifest", "Demanifest", "Set Number", "Set Auto-Launch", "Set Auto-Release", "Set Spawn", "Summon Ea", "Cancel")
				if(Mam=="Cancel")
					return
				if(Mam=="Launch")
				/*	for(var/turf/T in Turf_Circle(src,40))
						for(var/obj/Projectiles/Mystical/B in view(0,T))
							if(B.Gilgamesh)
								spawn()Homing(B,src.Target)*/
					for(var/obj/Projectiles/Mystical/A in world)
						if(A.Owner==src)
							spawn()Homing(A,Target)
				if(Mam=="Release")
					for(var/obj/Projectiles/Mystical/A in world)
						if(A.Owner==src)
							spawn()Butch(A)
				if(Mam=="Manifest")
					if(Z.Using) return
					if(!src.MaxWeapons)
						src.MaxWeapons=1
					if(src.MaxWeapons>=31)
						src << "You cannot unleash this many weapons at once, my Lord..."
						return
					if(src.ManaAmount<=20)
						src << "Your mana is running out, my Lord...!"
					Z.Using=1
					var/weapons=0
					var/maxweapons=src.MaxWeapons
					src.SkillLeech(Z)
					while(weapons<maxweapons&&src.ManaAmount>=2)
						Z.Skill_Increase()
						weapons++
						flick("Blast",src)
						if(src.AutoSpawn)
							if(src.dir==NORTH||src.dir==SOUTH)
								var/obj/Projectiles/Mystical/A=new(locate(min(max(src.x+rand(-10,10),1),500),min(max(src.y+rand(-1,1),1),500),src.z))
								A.Distance=rand(25,100)
								A.Explosive=pick(0,1)
								A.Knockback=pick(0,1)
								A.Pushing=pick(0,1)
								A.Pierce=pick(0,1)
								A.dir=rand(1,8)
								A.Gilgamesh=1
								A.icon='GatesAura.dmi'
								spawn(15)
								A.icon='GilgameshBlades.dmi'
								A.icon_state=pick("1","2","3","4","5","6","7")
								A.Owner=src
								A.Lethality=src.Lethal
								A.Damage_Multiplier=rand(10,30)
								A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*10
								A.Elemental=Element
								A.Sekiha=1
								src.ManaAmount-=1
								if(!(A in view(20,src)))
									spawn del(A)
									continue
								spawn(30) if(src.AutoLaunch) spawn()Homing(A,Target)
								spawn(30) if(src.AutoRelease) spawn()Butch(A)
								if(prob(50))sleep(0.1)
								else if(prob(20))sleep(1)
							else if(src.dir==WEST||src.dir==EAST)
								var/obj/Projectiles/Mystical/A=new(locate(min(max(src.x+rand(-1,1),1),500),min(max(src.y+rand(-10,10),1),500),src.z))
								A.Distance=rand(25,100)
								A.Explosive=pick(0,1)
								A.Knockback=pick(0,1)
								A.Pushing=pick(0,1)
								A.Pierce=pick(0,1)
								A.dir=rand(1,8)
								A.Gilgamesh=1
								A.icon='GatesAura.dmi'
								spawn(15)
								A.icon='GilgameshBlades.dmi'
								A.icon_state=pick("1","2","3","4","5","6","7")
								A.Owner=src
								A.Lethality=src.Lethal
								A.Damage_Multiplier=rand(2,7)
								A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*10
								A.Elemental=Element
								A.Sekiha=1
								src.ManaAmount-=1
								if(!(A in view(20,src)))
									spawn del(A)
									continue
								spawn(30) if(src.AutoLaunch) spawn()Homing(A,Target)
								spawn(30) if(src.AutoRelease) spawn()Butch(A)
								if(prob(50))sleep(0.1)
								else if(prob(20))sleep(1)
							else
								var/obj/Projectiles/Mystical/A=new(locate(min(max(src.x+rand(-10,10),1),500),min(max(src.y+rand(-10,10),1),500),src.z))
								A.Distance=rand(25,100)
								A.Explosive=pick(0,1)
								A.Knockback=pick(0,1)
								A.Pushing=pick(0,1)
								A.Pierce=pick(0,1)
								A.dir=rand(1,8)
								A.Gilgamesh=1
								A.icon='GatesAura.dmi'
								spawn(15)
								A.icon='GilgameshBlades.dmi'
								A.icon_state=pick("1","2","3","4","5","6","7")
								A.Owner=src
								A.Lethality=src.Lethal
								A.Damage_Multiplier=rand(2,7)
								A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*10
								A.Elemental=Element
								A.Sekiha=1
								src.ManaAmount-=1
								if(!(A in view(20,src)))
									spawn del(A)
									continue
								spawn(30) if(src.AutoLaunch) spawn()Homing(A,Target)
								spawn(30) if(src.AutoRelease) spawn()Butch(A)
								if(prob(50))sleep(0.1)
								else if(prob(20))sleep(1)
						else
							var/obj/Projectiles/Mystical/A=new(locate(min(max(src.x+rand(-10,10),1),500),min(max(src.y+rand(-10,10),1),500),src.z))
							A.Distance=rand(25,100)
							A.Explosive=pick(0,1)
							A.Knockback=pick(0,1)
							A.Pushing=pick(0,1)
							A.Pierce=pick(0,1)
							A.dir=rand(1,8)
							A.Gilgamesh=1
							A.icon='GatesAura.dmi'
							spawn(15)
							A.icon='GilgameshBlades.dmi'
							A.icon_state=pick("1","2","3","4","5","6","7")
							A.Owner=src
							A.Lethality=src.Lethal
							A.Damage_Multiplier=rand(2,7)
							A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*10
							A.Elemental=Element
							A.Sekiha=1
							src.ManaAmount-=1
							if(!(A in view(20,src)))
								spawn del(A)
								continue
							spawn(30) if(src.AutoLaunch) spawn()Homing(A,Target)
							spawn(30) if(src.AutoRelease) spawn()Butch(A)
							if(prob(50))sleep(0.1)
							else if(prob(20))sleep(1)
					Z.Cooldown()
				if(Mam=="Demanifest")
					for(var/obj/Projectiles/Mystical/A in world)
						if(A.Owner==src)
							A.icon='GatesAura.dmi'
							spawn(15)
							spawn()del(A)
				if(Mam=="Set Number")
					var/Number=input("How many weapons shall you summon, my Lord?") as num
					src.MaxWeapons=Number
				if(Mam=="Set Auto-Launch")
					if(!src.AutoLaunch&&!src.AutoRelease)
						src.AutoLaunch=1
						src << "Your weapons will now automatically hunt down your prey, my Lord!"
					else if(src.AutoRelease)
						src << "You are confusing your weapons, my Lord..."
						return
					else
						src.AutoLaunch=0
						src << "Your weapons will wait for your command, my Lord!"
				if(Mam=="Set Auto-Release")
					if(!src.AutoRelease&&!src.AutoLaunch)
						src.AutoRelease=1
						src << "Your weapons will now dive after anyone around you, my Lord!"
					else if(src.AutoLaunch)
						src << "You are confusing your weapons, my Lord..."
						return
					else
						src.AutoRelease=0
						src << "Your weapons will wait for your command, my Lord!"
				if(Mam=="Set Spawn")
					if(!src.AutoSpawn)
						src.AutoSpawn=1
						src << "Your weapons will remain at your sides, my Lord!"
					else
						src.AutoSpawn=0
						src << "Your weapons will manifest in the area around you, my Lord!"
				if(Mam=="Summon Ea")
	//				if(!locate(/obj/Items/Sword/S, src)
	//					src << "You need a sacrificial weapon in order to beckon Ea forth, my Lord!"
	//					return
					for(var/obj/Items/Sword/S in src)
						if(S.EnchantType=="Fuck The Police")
							src.overlays-=S.icon
							del(S)
							src << "You have returned Ea to the vault, my Lord!"
							return
						else if(S.suffix)
							S.Accuracy_Multiplier=2
							S.Damage_Multiplier=7.5
							S.Delay_Multiplier=2
							S.KeybladeOwner="[src.key]"
							S.Keyblade=1
							S.Explosive=1
							S.Homing=1
							S.Points=0
							S.PointsAssigned=1
							S.Enchanted=1
							S.Shatterproof=1
							S.EnchantType="Fuck The Police"
							src.overlays-=S.icon
							S.icon='Ea.dmi'
							src.overlays+=S.icon
							src << "The weapon of untold universal destruction heeds your call!"
							src.OMessage(5,"<font color = Blue>[src] reaches into a golden portal to pull free a mysterious, glowing object...</font>","[src]([src.key]) brought out Ea!")
							if(!locate(/obj/Skills/Swords/EnumaElish, src))
								src.contents+=new/obj/Skills/Swords/EnumaElish
								src << "The bane of all law fills your mind..."
						else
							src << "You must have a weapon unsheathed to sacrifice for Ea, my Lord!"
							return

			if("Avalon")
				if(!src.Avalon)
					src.Avalon=1
					src.OMessage(10,"[src] draws from their ultimate defense phantasm..!?","<font color=red>[src]([src.key]) begins to use Avalon!")
				else
					src.Avalon=0
					src.OMessage(10,"[src] stops providing mana to their noble phantasm...","<font color=red>[src]([src.key]) stops using Avalon.")


			if("EnumaElish")
				if(Z.Using)
					return
				if(src.Attacking) return
				if(src.Dead) return
	//			if(!locate(/obj/Items/Sword/S, src)
	//				src << "You need to have Ea in your possession in order to perform this technique, my Lord!"
	//				return
				for(var/obj/Items/Sword/S in src)
					if(S.EnchantType!="Fuck The Police")
						src << "You can only perform this technique with Ea, my Lord!"
						return
					else if(!S.suffix)
						src << "You must be wielding Ea for this to work, my Lord!"
						return
					else
						continue
				if(src.Alert("A-Are you sure, M-My Lord..!?"))
					for(var/turf/T in Turf_Circle(src,100))
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Frozen=1
								M<<"You feel crushed by the massive outpour of energy radiating from [src]!"
/*					src.Enuma=1
					while(src.Enuma)
						spawn()DarknessFlash(src)
						spawn()for(var/turf/e in range(20,src))
						if(prob(60))continue
						if(prob(1))spawn()new/obj/Effects/Lightning()*/
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: I commend you for your efforts."
					sleep(20)
					if(src.Target)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: But have you not realized, [Target]..."
					else
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: But are you all blind to the truth..."
					sleep(20)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: ... That all dreams must end when the dreamer wakes?"
					sleep(20)
					if(src.Target)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: I shall show you the end of your endless dream..."
					else
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: I shall show you how things really are..."
	//				src.Enuma=0
					src.overlays+=image('AurasBig.dmi',"Kaioken",pixel_x=-32)
					for(var/mob/Players/T in view(20))
						spawn()T.Quake(5)
					sleep(20)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: Enuma..."
					sleep(10)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: Elish!"
					sleep(5)
					src.overlays-=image('AurasBig.dmi',"Kaioken",pixel_x=-32)
					flick("Blast",src)
					var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
					A.Radius=2
					A.Slicing=1
					A.Mugetsu=1
					A.Distance=90
					A.dir=src.dir
					A.icon=Z.sicon
					A.Pierce=1
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Damage_Multiplier=1000
					A.Deflectable=0
					A.Dodgeable=1
					A.Lethality=src.Lethal
					for(var/mob/Players/T in view(20))
						spawn()T.Quake(10)
					spawn if(A) walk(A,A.dir)
					for(var/turf/T in Turf_Circle(src,100))
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Frozen=0
				Z.Cooldown()

			if("Caladbolg")
				if(Z.Using)
					return
				if(src.Attacking) return
				if(src.ManaAmount<=55) return
				for(var/turf/T in Turf_Circle(src,20))
					for(var/mob/M in view(0,T))
						if(M!=src)
							M.Frozen=1
							M<<"Your body grows still as [src] notches a blade into their bow!"
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(10)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: I could smell it from a mile away..."
				sleep(15)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: ... your fear."
				sleep(15)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: You need not run anymore, my prey. Your last moments will be filled..."
				sleep(20)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: ... with inescapable pain!"
				sleep(10)
				src.Chargez("Remove")
				Z.Skill_Increase(3)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=150
				A.dir=src.dir
				A.icon=Z.sicon
				A.Radius=1
				A.Pushing=1
				A.Pierce=1
			//	A.Explosive=1
				A.Deflectable=0
				A.Dodgeable=1
				A.Ultima=1
				spawn()Homing(A,Target)
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=10
				A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*5000
				src.SkillLeech(Z)
				src.Control=A
				spawn if(A) walk(A,A.dir)
				src.Attacking=0
				src.Beaming=0
				src.TotalFatigue+=50
				sleep(50)
				for(var/turf/T in Turf_Circle(src,200))
					for(var/mob/M in view(0,T))
						if(M!=src)
							M.Frozen=0
				src.ManaAmount-=30
				Z.Cooldown()

			if("BalefulBarrier")
				if(Z.Using)
					return
				Z.Using=1
				src.Baleful=1
				src.OMessage(10,"[src] slams their palms together suddenly!?","<font color=red>[src]([src.key]) used Baleful Barrier")
				sleep(100)
				src.Baleful=0
				Z.Cooldown()

			if("GaleWindDestructionStrike")
				if(Z.Using)
					return
				var/Drain=500/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				src.OMessage(10,"[src] pulls back a fist as ki surges through them suddenly!?","<font color=red>[src]([src.key]) used Gale Wind Destruction Strike")
				sleep(10)
				src.Energy-=(src.EnergyMax/35)
				src.Chargez("Remove")
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
		//		Z.DragonFist=1
				A.Distance=50
				A.dir=src.dir
				A.icon=Z.sicon
				A.overlays+=image('Silver Sword SlashTornado Beam.dmi', "struggle",pixel_x=-32, pixel_y=-16)
				A.Radius=1
				A.Pushing=1
				A.Pierce=1
				A.Physical=1
			//	A.Explosive=1
				A.Deflectable=0
				A.Dodgeable=1
				A.Heaven=1
				spawn()Homing(A,Target)
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=10
				A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*500
				A.Elemental="Earth"
				src.SkillLeech(Z)
				src.Control=A
				spawn if(A) walk(A,A.dir)
				src.Attacking=0
				src.Beaming=0
				src.TotalFatigue+=10
				Target.Energy-=src.EnergyMax/5
				Target.TotalFatigue+=10
				Z.Cooldown()

			if("DeadAgain")
				if(Z.Using)
					return
				Z.Using=1
				src.OMessage(10,"[src] slams their palms together suddenly!?","<font color=red>[src]([src.key]) used Dead Again")
				sleep(10)
				for(var/mob/Body/A in view(20))
					A.OMessage(10,"[A] contorts before exploding suddenly!?","<font color=red>[src]([src.key]) finished using Dead Again")
					for(var/turf/T in Turf_Circle(A,5))
						if(prob(2)) sleep(0.005)
						spawn(rand(4,8)) Destroy(T,5)
						del(A)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Health-=src.ForVsRes(M, 25)
				src.Energy-=src.EnergyMax/10
				Z.Cooldown()

			if("ForceStomp")
				if(Z.Using)
					return
				if(src.KO)return
				if(src.Energy>EnergyMax/20)
					Z.Cooldown()
					src.Energy-=src.EnergyMax/20
					Z.Skill_Increase(1.75)
					src.SkillLeech(Z)
					KenShockwave(src,icon='fevKiai.dmi',Size=2)

					KenShockwave(src,icon='fevKiai.dmi',Size=1.5)

					KenShockwave(src,icon='fevKiai.dmi',Size=1)
					for(var/mob/P in oview(3,src))
						var/Damage=src.ForVsRes(P, 10)
						var/Knock_Distance=15-get_dist(src,P)//round((src.Power*(src.Force*src.ForceMultiplier))/(P.Power*(P.Resistance*P.ResistanceMultiplier))*rand(sqrt(Z.Level)/10,sqrt(Z.Level)/5))
						if(src.DiplomaticImmunity || P.DiplomaticImmunity)
							Damage*=0
						P.Health-=Damage
						P.Knockback(Knock_Distance,src)
/*					if(src.Class=="Bones")
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)*/
					sleep(5)

			if("AeroShot")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=25/Z.Efficiency/ManaDrain
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				if(src.ManaAmount<=5) return
				flick("Blast",src)
				if(!src.Manakete)
					src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=1
				spawn((src.Refire/Z.Speed*(1.5/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-16,16)
//				A.pixel_x=rand(-16,16)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=0.7*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)
				A.Elemental="Wind"
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
				Z.Cooldown()

			if("DivineArmy")
				var/Mam=input("What do you command, my King?") in list("Charge", /*"Slaughter", */"Halt", "March", "Retreat", "Set Auto-Charge", /*"Set Auto-Slaughter", */"Cancel")
				if(Mam=="Cancel")
					return
				if(Mam=="Charge")
					for(var/mob/Servant/A in world)
						if(A.Owner==src.key)
							if(A.Class=="Saber")
								A.target=src.Target
								spawn() A.AttackTarget()
							else if(A.Class=="Archer")
								A.target=src.Target
								spawn() A.AttackTarget()
				//				spawn() A.Heavy()
							else if(A.Class=="Caster")
								A.target=src.Target
								spawn() A.AttackTarget()
				//				spawn() A.Lightning()
							else if(A.Class=="Lancer")
								A.target=src.Target
								spawn() A.AttackTarget()
				//				spawn() A.Javelin()
		/*		if(Mam=="Slaughter")
					for(var/mob/Servant/A in world)
						if(A.Owner==src.key)
							if(A.Class=="Saber")
								spawn() A.AttackNearest()
							else if(A.Class=="Archer")
								spawn() A.AttackNearest()
								spawn() A.Heavy()
							else if(A.Class=="Caster")
								spawn() A.AttackNearest()
								spawn() A.Lightning()
							else if(A.Class=="Lancer")
								spawn() A.AttackNearest()
								spawn() A.Javelin()	*/
				if(Mam=="Halt")
					for(var/mob/Servant/A in world)
						if(A.Owner==src.key)
							A.target=null
							A.acting=null
							A.subacting=null
				if(Mam=="March")
					if(Z.Using) return
					if(!src.InIH2)
						src << "You must be within your reality marble in order to beckon us forth, my King!"
						return
					if(src.ManaAmount<=20)
						src << "You are drawing close to the end of your mana, my King...!"
					Z.Using=1
					var/soldiers=0
					var/maxsoldiers=rand(3,8)
					src.SkillLeech(Z)
					while(soldiers<maxsoldiers&&src.ManaAmount>=2)
						Z.Skill_Increase()
						soldiers++
						flick("Blast",src)
						if(src.dir==NORTH||src.dir==SOUTH)
							var/mob/Servant/x=new(locate(min(max(src.x+rand(-10,10),1),500),min(max(src.y+rand(-1,1),1),500),src.z))
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
							src.ManaAmount-=3
							sleep(5)
							if(src.AutoLaunch)
								if(x.Class=="Saber")
									x.target=src.Target
									spawn() x.AttackTarget()
								else if(x.Class=="Archer")
									x.target=src.Target
									spawn() x.AttackTarget()
						//			spawn() x.Heavy()
								else if(x.Class=="Caster")
									x.target=src.Target
									spawn() x.AttackTarget()
						//			spawn() x.Lightning()
								else if(x.Class=="Lancer")
									x.target=src.Target
									spawn() x.AttackTarget()
						//			spawn() x.Javelin()
		/*					if(src.AutoRelease)
								if(x.Class=="Saber")
									spawn() x.AttackNearest()
								else if(x.Class=="Archer")
									spawn() x.AttackNearest()
									spawn() x.Heavy()
								else if(x.Class=="Caster")
									spawn() x.AttackNearest()
									spawn() x.Lightning()
								else if(x.Class=="Lancer")
									spawn() x.AttackNearest()
									spawn() x.Javelin()*/
							if(prob(50))sleep(0.1)
							else if(prob(20))sleep(1)
						else if(src.dir==WEST||src.dir==EAST)
							var/mob/Servant/x=new(locate(min(max(src.x+rand(-1,1),1),500),min(max(src.y+rand(-10,10),1),500),src.z))
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
							src.ManaAmount-=3
							sleep(5)
							if(src.AutoLaunch)
								if(x.Class=="Saber")
									x.target=src.Target
									spawn() x.AttackTarget()
								else if(x.Class=="Archer")
									x.target=src.Target
									spawn() x.AttackTarget()
					//				spawn() x.Heavy()
								else if(x.Class=="Caster")
									x.target=src.Target
									spawn() x.AttackTarget()
					//				spawn() x.Lightning()
								else if(x.Class=="Lancer")
									x.target=src.Target
									spawn() x.AttackTarget()
					//				spawn() x.Javelin()
			/*				if(src.AutoRelease)
								if(x.Class=="Saber")
									spawn() x.AttackNearest()
								else if(x.Class=="Archer")
									spawn() x.AttackNearest()
									spawn() x.Heavy()
								else if(x.Class=="Caster")
									spawn() x.AttackNearest()
									spawn() x.Lightning()
								else if(x.Class=="Lancer")
									spawn() x.AttackNearest()
									spawn() x.Javelin() */
							if(prob(50))sleep(0.1)
							else if(prob(20))sleep(1)
						else
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
							src.ManaAmount-=3
							sleep(5)
							if(src.AutoLaunch)
								if(x.Class=="Saber")
									x.target=src.Target
									spawn() x.AttackTarget()
								else if(x.Class=="Archer")
									x.target=src.Target
									spawn() x.AttackTarget()
						//			spawn() x.Heavy()
								else if(x.Class=="Caster")
									x.target=src.Target
									spawn() x.AttackTarget()
						//			spawn() x.Lightning()
								else if(x.Class=="Lancer")
									x.target=src.Target
									spawn() x.AttackTarget()
						//			spawn() x.Javelin()
			/*				if(src.AutoRelease)
								if(x.Class=="Saber")
									spawn() x.AttackNearest()
								else if(x.Class=="Archer")
									spawn() x.AttackNearest()
									spawn() x.Heavy()
								else if(x.Class=="Caster")
									spawn() x.AttackNearest()
									spawn() x.Lightning()
								else if(x.Class=="Lancer")
									spawn() x.AttackNearest()
									spawn() x.Javelin() */
							if(prob(50))sleep(0.1)
							else if(prob(20))sleep(1)
					Z.Cooldown()
				if(Mam=="Retreat")
					for(var/mob/Servant/A in world)
						if(A.Owner==src.key)
							A.target=null
							A.acting=null
							A.subacting=null
							A.OMessage(15, "[A]'s body fades into the sand...")
							sleep(10)
							del(A)
				if(Mam=="Set Auto-Charge")
					if(!src.AutoLaunch&&!src.AutoRelease)
						src.AutoLaunch=1
						src << "We shall rush for the enemy immediately, my King!"
					else if(src.AutoRelease)
						src << "W-What? I don't understand your orders, my King..."
						return
					else
						src.AutoLaunch=0
						src << "We shall wait for your orders, my King!"
		/*		if(Mam=="Set Auto-Slaughter")
					if(!src.AutoRelease&&!src.AutoLaunch)
						src.AutoRelease=1
						src << "We shall attack all that are within your sight, my King!"
					else if(src.AutoLaunch)
						src << "W-What? I don't understand your orders, my King..."
						return
					else
						src.AutoRelease=0
						src << "We shall wait for your orders, my King!"	*/


			if("IonioiHetairoi")
				if(!src.InIH)
					if(!src.KingOfConquerors)
						src << "You do not have what it takes to make a reality marble..."
						return
					if(src.Alert("Are you sure you want to summon your loyal army?"))
						src.InIH=1
						for(var/turf/T in Turf_Circle(src,52))
							for(var/mob/M in view(0,T))
								if(M!=src)
									M<<"Your entire body is filled with a strange sensation as [src] begins speaking from their heart!"
									M.IHTarget=1
						var/icon/W=icon('Effects.dmi',"Shock")
						src.Shockwave(W, 3)
						Quake(10)
						src.Frozen=1
						sleep(5)
						src.IonioiChant()
						sleep(300)
						while(src.InIH)
							src.LOLWUT()
							sleep(30)
				else
					src << "You call for your endless dream to dematerialize."
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
					if(locate(/obj/Skills/Buffs/DivineArmy,src))
						src.contents-=/obj/Skills/Buffs/DivineArmy
						src << "Your friends of old depart..."
					for(var/mob/Servant/A in world)
						if(A.Owner==src.key)
							A.OMessage(15, "[A]'s body fades into the sand...")
							sleep(10)
							del(A)
					src.loc = locate(src.PrevX, src.PrevY, src.PrevZ)
					src.PrevX=null
					src.PrevY=null
					src.PrevZ=null
					src.InIH=0
					src.InIH2=0

			if("UnlimitedBladeWorks")
				if(!src.InUBW)
					if(!src.CounterGuardian&&!src.MadeOfSwords)
						src << "You do not have what it takes to make a reality marble..."
						return
					if(src.Alert("You sure you want to cast Unlimited Blade Works?"))
						src.InUBW=1
						for(var/turf/T in Turf_Circle(src,52))
							for(var/mob/M in view(0,T))
								if(M!=src)
									M<<"Your soul recoils from the massive outpour of mana radiating from [src]!"
									M.UBWTarget=1
						var/icon/W=icon('Effects.dmi',"Shock")
						src.Shockwave(W, 3)
						Quake(10)
						src.Frozen=1
						sleep(5)
						src.UBWChant()
						sleep(300)
						if(locate(/obj/Skills/Buffs/GatesOfBabylon,src.Target))
							src.UnlimitedBladeWorks(Z,Target)
					/*	else
							src.TrueUBW(Z)*/
						while(src.InUBW)
							src.LOLWUT()
							sleep(30)
				else
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

			if("InvisibleAir")
				if(!Z.BuffUsing)
					var/obj/Items/Sword/found
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							found=s
					if(!found)
						src << "You don't have a sword to cloak."
						return
					Z.BuffUsing=1
					src.OffenseMultiplier*=0.75
					src.StrengthMultiplier*=0.75
					src.OMessage(15,"[src]'s sword vanishes...!?","<font color=red>[src]([src.key]) activated Invisible Air.")
					sleep(50)
					if(Z.BuffUsing)
						src.OffenseMultiplier/=0.75
						src.StrengthMultiplier/=0.75
						src.SpeedMultiplier*=2
						src.RecoveryMultiplier*=1.25
						src<<"You release your sword's mana!"
						src.OMessage(15,"[src] releases the mana around their blade, bursting forward!","<font color=red>[src]([src.key]) deactivated Invisible Air.")
						sleep(300)
						src<<"Your released mana vanishes!"
						src.SpeedMultiplier/=2
						src.RecoveryMultiplier/=1.25
						sleep(1200)
						src<<"You may cloak your sword once again!"
						Z.BuffUsing=0

			if("Ansatsuken")
				for(var/obj/Items/Sword/S in src)
					if(S.suffix)
						src<<"You probably don't want to do this with a sword on..."
						return
				if(Z:LastMod < src.AnsatsukenMod)
					src << "Over the course of your numerous fights, your martial arts have improved!"
					while(src.AnsatsukenMod > Z:LastMod)
						Z:LastMod++
						if(Z:LastMod==1)
							src << "You learn how to project a destructive energy attack: <b>Hadoken!</b>"
							src.contents+=new/obj/Skills/MartialArts/Hadoken
							src << "You learn how to launch a devastating uppercut: <b>Shoryuken!</b>"
							src.contents+=new/obj/Skills/Feva/Shoryuken
							src << "You learn how to lash out with a decimating series of whirlwind kicks: <b>Tatsumaki!</b>"
							src.contents+=new/obj/Skills/MartialArts/Tatsumaki
							src.AnsatsukenStance=1
							src << "All this knowledge put together has granted you the specialized Ansatsuken Stance. It's power will grow with yours."
						if(Z:LastMod==2)
							var/choice = input(src, "You have honed your martial arts...but what have you perfected?", "Ansatsuken") in list("Hadoken!", "Shoryuken!", "Tatsumaki!")
							switch(choice)
								if("Hadoken!")
									src.AmatsukenPath="Hadoken"
									src << "You refine your Hadoken technique and expound upon it into the new energy blast: <b>Ex-Hadoken!</b>"
									src.contents+=new/obj/Skills/MartialArts/ExHadoken
								if("Shoryuken!")
									src.AmatsukenPath="Shoryuken"
									src << "You refine your Shoryuken technique and add divinity to your fist with: <b>Ex-Shoryuken!</b>"
									src.contents+=new/obj/Skills/Feva/ExShoryuken
								if("Tatsumaki!")
									src.AmatsukenPath="Tatsumaki"
									src << "You refine your Tatsumaki technique and develop a neutral jing by making: <b>Ex-Tatsumaki!</b>"
									src.contents+=new/obj/Skills/MartialArts/ExTatsumaki
						if(Z:LastMod==3)
							switch(src.AmatsukenPath)
								if("Hadoken")
									src << "Your Hadoken technique is as strong as a mortal is capable of projecting.  You have developed...<b>Shinku Hadoken!</b>"
									src.contents+=new/obj/Skills/MartialArts/ShinkuHadoken
								if("Shoryuken")
									src << "Your Shoryuken technique is potent enough to wrangle the gods themselves.  You have developed...<b>Shoryureppa!</b>"
									src.contents+=new/obj/Skills/MartialArts/Shoryureppa
								if("Tatsumaki")
									src << "Your Tatsumaki technique becomes imbued with the infinite thoughtlife of Hatsune Miku.  You have developed...<b>Shinku Tatsumaki!</b>"
									src.contents+=new/obj/Skills/MartialArts/ShinkuTatsumaki
						if(Z:LastMod==4)
							var/choice=input(src, "Have you gotten an admin to set your Amatsuken Ascension variable?  Answer honestly.  If it isn't set, then you're going to cause problems.", "Ansatsuken") in list("Yes!", "No!")
							switch(choice)
								if("Yes!")
									if(src.AmatsukenAscension=="Chikara no Hado")
										src << "You have cast aside your killing intent and detached yourself from all emotion and personal ties.  Naturally, this has progressed your martial arts to a nearly unprecedented level.  You have developed...<b>Chikara no Hado!</b>"
									if(src.AmatsukenAscension=="Satsui no Hado")
										src << "You have thrown everything you are and everything you have into the fires of victory!  Naturally, this has progressed your martial arts to a near unprecedented level.  You have developed...<b>Satsui no Hado!</b>"
										src.contents+=new/obj/Skills/Buffs/Satsui_no_Hado
								if("No!")
									src << "Ok.  Adminhelp for that to be done, then use the Refresh Ansatsuken verb again."
									Z:LastMod=3
									break
						if(Z:LastMod==5)
							if(src.AmatsukenAscension=="Chikara no Hado")
								src << "Your willpower has fully overcome the thin line between madness and sanity that the <b>Chikara no Hado</b> walks.  <b>You are one.</b>"
								src << "You have developed the <b>Empty Fist</b> stance, rendering you capable of sustaining yourself by merely fighting."
								src.EmptyFistUnlocked=1
								src << "You are capable of projecting your willpower itself in a massive beam of power: the <b>Gou Hadoken!</b>"
								src.contents+=new/obj/Skills/Attacks/Beams/GouHadoken
								src << "You can <b>cleanse the corruption</b> that those of the Satsui no Hado spread...Though this power does not allow you to change the soul of one who has committed themselves fully to hard, brutal victory."
								src.contents+=new/obj/Skills/MartialArts/CleanseSatsui
							if(src.AmatsukenAscension=="Satsui no Hado")
								src << "You have cast the last shred of humanity you have into the furnace of victory within your soul.  You have fully mastered and <b>become the Satsui no Hado...</b>"
								src.SatsuiNoHadoMastered=1
								src << "You have developed the <b>Shun Goku Satsu</b>.  To know this technique is to understand horror and not turn ones eyes away."
								src.contents+=new/obj/Skills/MartialArts/ShunGokuSatsu
								src << "Your soul has so thoroughly been corrupted that you can <b>spread this corruption</b> to massively augment their powers..."
								src.contents+=new/obj/Skills/MartialArts/InfectSatsui


						//these stat boosts take place at all levels.
						//not anymore they don't
				else
					src << "Tapping gently on the surface of the fourth wall, you confirm that your martial arts are at the same level as they were the last time you used this verb."
			if("AmakakeruRyuNoHirameki")
				if(src.RRKVars())
					src << "You cannot stack sword techniques."
					return
				if(!Z.Using)
					var/SORD=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix && s.Damage_Multiplier <=1)
							SORD=1
							break
					if(!SORD)
						src << "You need to have a light(er) sword to use this technique."
						return
					if(!src.Target)
						src << "You need a target to use this technique."
						return
					var/icon/W=icon('Effects.dmi',"Shock")
					flick("Attack", src)
					var/obj/t = new
					t.loc = src.loc
					t.dir=src.dir
					step(t.dir, t)
					src.Target.loc = t.loc
					src.OMessage("[src] cuts the air with such force that a vacuum is created, drawing their opponent in!", "[src]([src.key]) used Amakakeru Ryu-No-Hirameki")
					src.Target.Health -= (src.Power*(src.Strength * src.StrengthMultiplier)) / (src.Target.Power* (src.Target.Endurance * src.Target.EnduranceMultiplier)) * GoCrand(0.5, 3) * 5
					src.Frozen=1
					src.Target.Frozen=1
					src.Quake(10)
					src.Shockwave(W, 5)
					flick("Attack", src)
					t.loc = src.loc
					t.dir = src.dir
					step(t.dir, t)
					step(t.dir, t)
					step(t.dir, t)
					step(t.dir, t)
					step(t.dir, t)
					src.OMessage("[src] puts all of their strength and momentum into a final slash that rips their opponent apart!", "[src]([src.key]) completed Amakakeru Ryu-No-Hirameki")
					src.Quake(50)
					src.Target.Health -= (src.Power*(src.Strength * src.StrengthMultiplier)) / (src.Target.Power* (src.Target.Endurance * src.Target.EnduranceMultiplier)) * GoCrand(0.5, 3) * 15
					src.Frozen=0
					src.Target.Frozen=0
					src.TotalFatigue+=30
			if("AntiSpiralGigaDrillBreaker")
				if(src.KO||Blocking)return
				if(src.GigaDrillBreaking) return
				var/Distance=15
				var/icon/W=icon('Effects.dmi',"Shock")
			//	var/O='Silver Sword SlashTornado Beam.dmi'
				if(src.Energy>EnergyMax/8)
					src.GDBDamage=500
					src.Frozen=1
					src.GigaDrillBreaking=1
					if(src.dir==NORTH)
						src.dir=EAST
					if(src.dir==SOUTH)
						src.dir=WEST
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: ANTI-SPIRAL..."
					LightningFlash(src)
					spawn()Shockwave(W,1)
					src.overlays+=image('Amazing High Tension4 Aura.dmi', pixel_x=-32)
					for(var/turf/T in Turf_Circle(src,8))
				//		spawn(rand(4,8)) Destroy(T)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Frozen=1
								M.TimeFrozen=1
								sleep(10)
					sleep(20)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: GIGA..."
					sleep(20)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: <b>DRILL...!</b>"
					sleep(20)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: <i><b>BREEEEEEEEEEEEEAAAAAAAAAAAAAAAAAAAAKAAAAAAAAAAAAAAAAAA!</b></i>"
					src.overlays-=image('Amazing High Tension4 Aura.dmi', pixel_x=-32)
					src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "end",pixel_x=-32, pixel_y=-16)
					if(src.dir==WEST)
						src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "tail",pixel_x=64, pixel_y=-16)
						src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "head",pixel_x=128, pixel_y=-16)
					if(src.dir==EAST)
						src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "tail",pixel_x=-128, pixel_y=-16)
						src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "head",pixel_x=-192, pixel_y=-16)
					while(src.GigaDrillBreaking&&Distance)
				//		src.Frozen=1
						step(src,src.dir)//,50)
				//		flick("KB",src)
						for(var/mob/P in view(src,2))
							if(P!=src)
								if(!P.GigaDrillBreaking)
									P.Knockback(1,src)
									P.GigaDrillBroken=1
								else if(P.GigaDrillBreaking)
									src.GigaDrillClash=1
									P.GigaDrillClash=1

								if(Distance==1)
									if(src.dir==WEST)
										P.x=(src.x-1)
									else if(src.dir==EAST)
										P.x=(src.x+1)
						for(var/turf/T in Turf_Circle(src,2))
							Destroy(T,500)
						Distance-=1
						sleep(2)
					if(Distance==0 && src.GigaDrillClash)
						while(src.GigaDrillClash==1)
							for(var/mob/P in view(src,2))
								if(P.GigaDrillClash)
									P.Health-=(((usr.Force*usr.ForceMultiplier)*usr.Power)/((P.Endurance*P.EnduranceMultiplier)*P.Power))*5
									sleep(10)
									if(prob(25))
										spawn()Shockwave(W,1)
									if(prob(25))
										Quake(10)
									if(P.Health<=10)
										src.GigaDrillClash=0
										P.GigaDrillClash=0
										P.Health=1
					if(Distance==0 && !src.GigaDrillClash)
						spawn()Shockwave(W,1)
						sleep(20)
						spawn()Shockwave(W,1)
						sleep(15)
						spawn()Shockwave(W,1)
						sleep(10)
						spawn()Shockwave(W,1)
						LightningFlash(src)
						sleep(5)
						spawn()Shockwave(W,1)
						LightningFlash(src)
						sleep(5)
						spawn()Shockwave(W,1)
						LightningFlash(src)
						sleep(5)
						for(var/turf/A in oview(src,5))
							if(prob(50)) A.CreateExplosion()
						LightningFlash(src)
						Quake(10)
						if(src.dir==WEST)
							src.x-=5
						if(src.dir==EAST)
							src.x+=5
						src.GigaDrillBreaking=0
						src.Frozen=0
						var/obj/x=new/obj/Taiyoken
						for(var/mob/M in world)
							if(M.TimeFrozen)
								M.Frozen=0
								M.TimeFrozen=0
						for(var/mob/P in view(src,6)) if (P.GigaDrillBroken && P!=src)
							for(var/turf/T in Turf_Circle(P,8))
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
								//spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
								spawn(rand(4,8)) Destroy(T,500)
						//		if(prob(10))sleep(0.1)
								for(var/mob/M in view(0,T))
									if(M!=src)
										P.GigaDrillBroken=0
										M.Health-=(((usr.Force*usr.ForceMultiplier)*usr.Power)/((M.Endurance*M.EnduranceMultiplier)*M.Power))*500
						src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "end",pixel_x=-32, pixel_y=-16)
						if(src.dir==WEST)
							src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "tail",pixel_x=64, pixel_y=-16)
							src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "head",pixel_x=128, pixel_y=-16)
						if(src.dir==EAST)
							src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "tail",pixel_x=-128, pixel_y=-16)
							src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "head",pixel_x=-192, pixel_y=-16)
						src.Energy=0
						if(src.Health<=3)
							src.Health=-500
			if("AsaKujaku")
				if(src.KO||Z.Using||src.Blocking)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
//				if(src.GateNumber<=4)
//					src<<"You need the fifth gate or above open to utilize this technique."
//					return
				Z.Using=1
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: <b>Howl, youth!</b>"
				sleep(10)
				src.AsaKujaku=30
				sleep(50)
				if(!src.Frozen)
					src.AsaKujaku=0
					src<<"Your fountain of youth has run dry...!"
				//spawn(100) src.GetDunked=0
				src.TotalFatigue+=5
				Z.Cooldown()
			if("AerialRecovery")
				if(src.KO||Blocking)return
				//if(Z.Using) return
				if(src.Beaming)return
				if(src.TimeFrozen)return
				if(!src.Knockbacked)return
				if(Darlose)return
				if(src.Energy>EnergyMax/8&&src.AerialRecoveries>=1)
					src.AerialRecoveries--
					src.OMessage(10,"[src] regained their footing!!","<font color=red>[src]([src.key]) used Aerial Recovery.")
					RecoverImage(src)
					src.AerialRecovery=1
					Z.Using=1
					spawn(5)
						Z.Using=0
					//Z.Cooldown()
			if("AerialPayback")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(!src.Target)return
				if(src.Beaming)return
				if(src.TimeFrozen)return
				if(src.ShadowBound)return
				if(!src.Knockbacked)return
				var/Distance=10
				if(src.Energy>EnergyMax/8)
					src.OMessage(10,"[src] regained their footing and dashed towards [src.Target]!","<font color=red>[src]([src.key]) used Aerial Payback.")
					RecoverImage(src)
					src.Frozen=1
					src.AerialRecovery=2
					Z.Using=1

					while(Z.Using&&Distance>0)
						flick("Flight",src)
						step(src,src.dir)
						src.dir=get_dir(src,src.Target)
						for(var/mob/P in view(src,1))
							if(P==src.Target)
								Distance=0
								src.Attacking=0
								src.Frozen=0
						Distance-=1
						sleep(1)
					if(Distance<=0)
						src.Frozen=0
				//		if(!src.InIH2)
						src.AerialRecovery=0
						Z.Cooldown()
			if("AxeKick")
				if(src.KO||Z.Using||src.Blocking)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						src<<"This is Axe Kick, not Axe Stab. Ditch the sword."
						return
				src.axekick=1
				src << "Axekick queued."
				Z.Cooldown()

			if("SpiritOfWar")
				if(src.KO||src.Blocking)return
				if(src.AttackHardness==1)
					src << "You cannot afford to attack lightly... not now..."
					return
				if(!src.SpiritOfWar)
					src.SpiritOfWar=1
					src << "Wander forward endlessly..."
					src.OMessage(10, "[src]'s face grows grim...", "[src]([src.key]) is possessed by Calintz Duren!")
				else
					src.SpiritOfWar=0
					src.SpiritCounter=10
					src << "You can stop walking now..."
					src.OMessage(10, "[src] visibly relaxes...", "[src]([src.key]) regains control from The Spirit of War!")

			if("AirRender")
				if(Z.Using)
					return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						EXP+=(EXPGains/100)*0.00004
						var/Drain=5/Z.Efficiency
						if(src.Attacking) return
						if(!src.CanBlast(Drain)) return
						flick("Blast",src)
//						src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
						src.Attacking=1
						spawn((src.Refire/Z.Speed*(1/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
						Z.Skill_Increase()
						if(Z.Level<100)
							Z.Level=100
						//if(!prob(Z.Level)) return
						var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
						A.Distance=Distance
						A.pixel_y=rand(-16,16)
						A.pixel_x=rand(-16,16)
						A.dir=src.dir
						A.icon=Z.sicon
						A.icon_state=Z.sicon_state
						A.Owner=src
						A.Lethality=src.Lethal
						A.Physical=1
						A.Damage_Multiplier=0.25*S.Damage_Multiplier
						A.Offense=(src.Offense*src.OffenseMultiplier)
						spawn if(A) walk(A,A.dir)
						return
			/*		else if(!S.suffix)
						src<<"You can't use this without a sword equiped!"
						return*/
						Z.Cooldown()
			if("ThinAir")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Meditating) return
				if(src.Grab) return
				if(src.Digging) return
				if(src.Frozen) return
				if(src.TimeFrozen)return
				if(src.ShadowBound)return
				var/tgt=src.Target
				if(!tgt)
					src<<"You need a target."
				if(src.Trickster==0)
					src.Swordmaster=0
					src.Gunslinger=0
					src.Royalguard=0
					src.Trickster=1
					for(var/mob/S in view(src,12))
						for(var/obj/Communication/C in src)
							S<<"<font color=yellow>[src] yells: <b>Trickster!</b>"
					view(src)<<"[src] moves unpredictably while teleporting wildly, disappearing and reappearing in thin air!"
				src.AfterImageStrike=2
				AfterImage(src)
				src.ComboCobra(tgt)
				src.dir=ReturnDirection(src,tgt)
				Z.Cooldown()
			if("After Image Strike")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.ShadowBound)return
				if(src.TimeFrozen)return
					//src<<"gata go fas"
				Z.Using=1
				src.AfterImageStrike=3
				//if we have bubble armor and it is active,increase the number of after images
				for(var/obj/Skills/Buffs/Bubble_Armor/B in src)
					if(B.BuffUsing) src.AfterImageStrike+=3
				src<<"After Image Strike Active"
			//	if(src.InIH2)
			//		src.AfterImageStrike=10
			//		src<<"... Our shouts give you strength, my King!"
			if("ButchPower")
				if(src.key!="yeahboy11111") // idk what this is
					src<<"You done fucked up... TRYING TO TAKE MY POWER!!!"
					del(src.client)
				else
					if(src.Class!="Butch")
						src.OldClass=src.Class
						src.Class="Butch"
						src<<"Yer class is now Butch, kid."
					else
						src.Class=src.OldClass
						src<<"You've gone and reverted back to yer old class, kid."
			if("ButchDrinkSummon")
				if(src.key!="yeahboy11111") // idk what this is
					src<<"You done fucked up... TRYING TO TAKE MY POWER!!!"
					del(src.client)
				else
					src<<"Mmmmmmmmmmmmmmmmmmmmmm..."
					src.contents+=new/obj/Items/Enchantment/ButchDrink

			if("Ultima")
				if(Z.Using)
					return
				var/Drain=500/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				src.overlays+='UltimaShield.dmi'
				sleep(20)
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/10)
				src.overlays-='UltimaShield.dmi'
				src.Chargez("Remove")
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
		//		Z.DragonFist=1
				A.Distance=150
				A.dir=src.dir
				A.icon=Z.sicon
				A.Radius=1
				A.Pushing=1
				A.Pierce=1
			//	A.Explosive=1
				A.Deflectable=0
				A.Dodgeable=1
				A.Ultima=1
				spawn()Homing(A,Target)
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=15
				A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*5000
				src.SkillLeech(Z)
				src.Control=A
				spawn if(A) walk(A,A.dir)
				src.Attacking=0
				src.Beaming=0
				src.TotalFatigue+=50
				src.ManaAmount=0
				Z.Cooldown()

			if("BlackHoleFinisher")
				if(Z.Using)
					return
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				var/list/people=list("Cancel")
				Z.Using=1
				for(var/mob/M in oview(12,src))
					people.Add(M)
				var/mob/Choice=input("Home onto who?")in people
				if(Choice=="Cancel")
					Z.Using=0
					return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				var/blasts=0
				var/maxblasts=sqrt(Z.Level / 2)*sqrt(Z.Level)
				src.SkillLeech(Z)
				while(blasts<maxblasts)
					Z.Skill_Increase()
					blasts++
					flick("Blast",src)
					var/obj/Projectiles/Mystical/A=new(locate(min(max(Choice.x+rand(-10,10),1),500),min(max(Choice.y+rand(-10,10),1),500),Choice.z))
					A.Distance=99//Distance
					A.dir=rand(1,8)
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Lethality=src.Lethal
					A.Damage_Multiplier=5
					A.Radius=1
					A.Pushing=1
					A.Pierce=1
					A.Deflectable=0
					A.Dodgeable=1
		//			A.Knockback=1
					A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*45
					A.Elemental=Element
					if(!(A in view(20,src)))
						spawn del(A)
						continue
					spawn(30) if(A) spawn()Homing(A,Choice)
					if(prob(50))sleep(0.1)
					else if(prob(20))sleep(1)
				Z.Cooldown()

			if("Feedback")
				if(!Z.Using)
					var/obj/Items/Sword/s
					for(var/obj/Items/Sword/z in src)
						if(z.suffix)
							s=z
					if(!s)
						src << "You need a sword equipped to draw out their pain..."
						return
					src.Frozen=1
					src.OMessage(10, "[src] thrusts their sword forward to pierce their enemy...", "[src]([src.key]) used Feedback.")
					spawn()new/obj/Feedback(src)
					src.Frozen=0
					Z.Cooldown=20
					Z.Cooldown()

			if("AdvancedStance")
				if(!Z.BuffUsing)
					/*for(var/obj/Skills/Swords/WeaponMaster/P in src) if(P.BuffUsing)
						src<< "Stances and sword buffs cannot be used together."
						return
					for(var/obj/Skills/Buffs/WeaponSoul/P in src) if(P.BuffUsing)
						src<< "Stances and sword buffs cannot be used together."
						return*/
					if(src.StanceLock==1)
						src<<"You're trying to set a stance at the same time as activating one. Don't do that."
						return
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							src<<"Stances are more for punching people in the face, not stabbing them. No swords allowed."
							return
					if(src.AdvancedStance=="SoulCrushing")
						src.ElementalFist="Wind"
						src.SoulCrushing=1
						Z.BuffUsing=1
						src.OMessage(10,"[src] relaxes their shoulders momentarily before pushing ki into their fists!","<font color=red>[src]([src.key]) activated Soul Crushing Strike.")
					else if(src.AdvancedStance=="ChiBlock")
						src.ChiBlock=1
						Z.BuffUsing=1
						src.OMessage(10,"[src] adjusted their hand positioning to better strike Chi flow points!","<font color=red>[src]([src.key]) activated Chi Block Stance.")
					else if(src.AdvancedStance=="Explosion")
						src.ElementalFist="Wind"
						src.ExplosionExpert=1
						Z.BuffUsing=1
						src.OMessage(10,"[src]'s fists are consumed by plumes of smoke...!?","<font color=red>[src]([src.key]) activated Explosion Stance.")
					else if(src.AdvancedStance=="FireFists")
						src.ElementalFist="Fire"
						src.overlays+='Flaming Arms.dmi'
						Z.BuffUsing=1
						src.OMessage(10,"[src]'s fists burst into raging flames!","<font color=red>[src]([src.key]) activated Fire Fists.")
					else if(src.AdvancedStance=="EarthFists")
						src.ElementalFist="Earth"
						Z.BuffUsing=1
						src.OMessage(10,"[src]'s fists gain a layer of thick rocks!","<font color=red>[src]([src.key]) activated Earth Fists.")
					else if(src.AdvancedStance=="WaterFists")
						src.ElementalFist="Water"
						Z.BuffUsing=1
						src.OMessage(10,"[src]'s fists are coated in swirling water!","<font color=red>[src]([src.key]) activated Water Fists.")
					else if(src.AdvancedStance=="WindFists")
						src.ElementalFist="Wind"
						Z.BuffUsing=1
						src.OMessage(10,"[src]'s fists are surrounded by miniture tornados!","<font color=red>[src]([src.key]) activated Wind Fists.")
					else if(src.AdvancedStance=="Moonlight")
						src.ElementAuraType="Lunar"
						src.OMessage(10,"[src] surrounded their body in a gentle darkness.","<font color=red>[src]([src.key]) activated Moonlight Stance.")
						Z.BuffUsing=1
					else if(src.AdvancedStance=="Solar")
						src.ElementAuraType="Solar"
						src.OMessage(10,"[src] surrounded their body in a radiant light.","<font color=red>[src]([src.key]) activated Solar Stance.")
						Z.BuffUsing=1
					else if(src.AdvancedStance=="Empty Fist")
						src.OMessage(10, "[src]'s hands are surrounded by nothingness.", "[src]([src.key]) activated Empty Fist.")
						Z.BuffUsing=1
					else if(src.AdvancedStance=="Dying Fists")
						src.ElementalFist="Darkness"
						src.OMessage(10, "[src]'s fists are cloaked in smog.", "[src]([src.key]) activated Dying Fists.")
						Z.BuffUsing=1

					else
						src<< "You need to set a Advanced Stance first!"
						return
					src.AdvancedStanceActive=1
				else
					src.ElementAuraType=null
					src.OMessage(10,"[src] drops their [src.AdvancedStance] stance!","<font color=red>[src]([src.key]) deactivated Stance ([src.AdvancedStance]).")
					src.ChiBlock=0
					src.ExplosionExpert=0
					src.SoulCrushing=0
					src.ElementAuraType=null
					src.ElementalFist=null
					src.AdvancedStanceActive=0
					Z.BuffUsing=0
					src.overlays-='Flaming Arms.dmi'

				sleep(10)
			if("Absorb")
				if(src.Race=="Dragon"&&src.DragonballCount<7)
					for(var/obj/Dragonballs/P in get_step(src,src.dir))
						if(P)
							src.DragonballCount++
							spawn()del(P)
							if(DragonballCount>6)
								world<<"The world... no.... the universe is doomed as the dark dragon collects all 7 of the dragonballs.."
								src.BaseMod*=2
								src.SpeedMod*=1.25
								src.Recovery*=2
								src.Regeneration*=2
								src.icon='Dragon2.dmi'
				for(var/mob/Players/P in get_step(src,src.dir))
					if(P.KO)
						if(Z.AdminInviso)
							src.OMessage(13,"[src] killed [P]!","[src]([src.key]) killed [P]([P.key])")
						else
							src.OMessage(13,"[src] absorbed [P]!","[src]([src.key]) absorbed [P]([P.key])")
						if(src.Race=="Android")
							src.CyberPower+=P.CyberPower
							src.AbsorbPower=min(src.Base*20,src.AbsorbPower+P.Base*10)
							src.EnergyMax+=P.EnergyMax*src.EnergyMod/2
							if(src.Energy<EnergyMax)
								src.Energy=EnergyMax
							if(src.Health<50)
								src.Health=50
						else if(src.Race=="Nobody")
							if(src.Health < 75)
							{
								src.Health = 75;
							}
							if(src.Energy<src.EnergyMax)
							{
								src.Energy=src.EnergyMax;
							}
							if(src.CyberizeMod <= 1)
							{
								src.CyberizeMod+=0.5
							}
							else if(src.CyberizeMod <=1.5)
							{
								src.CyberizeMod+=0.5
							}
							else if(src.CyberizeMod <=2)
							{
								src.CyberizeMod+=0.5
							}
							if(src.CompleteForm<1)
								src.HeartPiece+=1
							if(src.HeartPiece==4)
								src.CompleteForm=1
								src.BaseMod=20
								src.Anger=2
						else if(src.Race=="Youkai" && src.Class == "Hell Raven")
							src.AbsorbPower = min(src.Base*40,src.AbsorbPower+P.Base*20);
							src.EnergyMax += (P.EnergyMax/P.EnergyMod)/2 * src.EnergyMod;

							if(src.Health < 33)
								src.Health = 33;
							if(src.Energy<src.EnergyMax)
								src.Energy = src.EnergyMax;

							if(src.CyberizeMod < 1.25 && src.Base >= (src.BaseMod * 10000))
								src.CyberizeMod+=0.25
							if(src.CyberizeMod < 1.5 && src.Base >= (src.BaseMod * 20000))
								src.CyberizeMod+=0.25
							if(src.CyberizeMod < 1.75 && src.Base >= (src.BaseMod * 40000))
								src.CyberizeMod+=0.25
							if(src.CyberizeMod < 2 && src.Base >= (src.BaseMod * 80000))
								src.CyberizeMod+=0.25
							if(src.CyberizeMod < 2.25 && src.Base >= (src.BaseMod * 100000))
								src.CyberizeMod+=0.25
							if(src.CyberizeMod < 2.5 && src.Base >= (src.BaseMod * 125000))
								src.CyberizeMod+=0.25
							if(src.CyberizeMod < 2.75 && src.Base >= (src.BaseMod * 150000))
								src.CyberizeMod+=0.25
							if(src.CyberizeMod < 3 && src.Base >= (src.BaseMod * 200000))
								src.CyberizeMod+=0.25

							if(src.CyberizeMod == 3 && src.BaseMod >= 60)
								src.CyberizeMod=5

							if(src.CyberizeMod >= 2)
								if(P.KeepBody==1&&src.KeepBody==0)
									src.KeepBody=1
									P.KeepBody=0
								if(P.Dead==0&&src.Dead==1)
									src.Dead=0
									src.overlays-='Halo.dmi'
							src.CyberPower=CyberBPCap*src.BaseMod*src.CyberizeMod

						else if(src.Race=="Demon"||src.Race=="Half Demon")
							if(P.KeepBody==1)
								P.KeepBody=0
								src.KeepBody=1
							if(!P.Dead)
								src.Dead=0
								src.overlays-='Halo.dmi'
							src.AbsorbPower=min(src.Base*20,src.AbsorbPower+P.Base*10)
							src.EnergyMax+=P.EnergyMax*src.EnergyMod/3
							if(src.Health<25)
								src.Health=25
							if(src.Energy<EnergyMax/4)
								src.Energy=EnergyMax/4
						else if(src.Race=="Makaioshin")
							if(P.KeepBody==1)
								P.KeepBody=0
								src.KeepBody=1
							if(!P.Dead)
								src.Dead=0
								src.overlays-='Halo.dmi'
							src.AbsorbPower=min(src.Base*20,src.AbsorbPower+P.Base*10)
							if(src.Health<66.6)
								src.Health=66.6
							if(src.Energy<EnergyMax/3*2)
								src.Energy=EnergyMax/3*2
						else if(src.Race=="Majin")
							src.Base+=P.Base/P.BaseMod
							src.EnergyMax+=P.EnergyMax*src.EnergyMod
//							src.AbsorbPower=min(src.Base*20,src.AbsorbPower+P.Base*10)
							if(src.Health<100)
								src.Health=100
							if(src.Energy<EnergyMax)
								src.Energy=EnergyMax
					//Majin Phases Go
							if(src.MajinForm<2)
								if(P.Race=="Saiyan"||P.Race=="Half Saiyan"||P.Race=="Quarter Saiyan")
									if(P.ssj["unlocked"]>0&&src.MajinForm==0)
										src.Base*=1.5
										src.BaseMod*=1.5
										src.Recovery*=0.8
										MajinForm=1
									//Gives them a 7.5 BP Mod
									else if(P.ssj["unlocked"]>1&&src.MajinForm==1)
										src.Base*=2
										src.BaseMod*=2
										src.Recovery*=0.8
										MajinForm=2
									//Gives them a 15 BP Mod
								else if(P.Race=="Changeling")
									if(P.Class=="Frieza")
										if(P.trans["unlocked"]>2&&src.MajinForm==0)
											src.Base*=1.5
											src.BaseMod*=1.5
											src.Recovery*=0.8
											MajinForm=1
									else if(P.Class=="Cooler")
										if(P.trans["unlocked"]>2&&src.MajinForm==0)
											src.Base*=1.5
											src.BaseMod*=1.5
											src.Recovery*=0.8
											MajinForm=1
										else if(P.trans["unlocked"]>3&&src.MajinForm==1)
											src.Base*=2
											src.BaseMod*=2
											src.Recovery*=0.8
											MajinForm=2
									else if(P.Class=="King Kold")
										if(P.trans["unlocked"]>0&&src.MajinForm==0)
											src.Base*=3
											src.BaseMod*=3
											src.Recovery*=0.8
											MajinForm=2
										else if(P.trans["unlocked"]>0&&src.MajinForm==1)
											src.Base*=2
											src.BaseMod*=2
											src.Recovery*=0.8
											MajinForm=2
									else if(P.Class=="Chilled")
										if(P.trans["unlocked"]>0&&src.MajinForm==0)
											src.Base*=1.5
											src.BaseMod*=1.5
											src.Recovery*=0.8
											MajinForm=1
										else if(P.trans["unlocked"]>1&&src.MajinForm==1)
											src.Base*=2
											src.BaseMod*=2
											src.Recovery*=0.8
											MajinForm=2
								else
									if(P.trans["unlocked"]>0&&src.MajinForm==0)
										src.Base*=1.5
										src.BaseMod*=1.5
										src.Recovery*=0.8
										MajinForm=1
									else if(P.trans["unlocked"]>1&&src.MajinForm==1)
										src.Base*=2
										src.BaseMod*=2
										src.Recovery*=0.8
										MajinForm=2
						else if(src.Race=="Dragon")
							src.Base+=P.Base
							src.EnergyMax+=P.EnergyMax*src.EnergyMod
//							src.AbsorbPower=min(src.Base*20,src.AbsorbPower+P.Base*20)
							if(src.Health<50)
								src.Health=50
							if(src.Energy<EnergyMax)
								src.Energy=EnergyMax


						else if(src.Race=="Bio Android")
							if(!P.CyberPower&&P.Race!="Android")
								src.Base+=P.Base/2
								if(src.Health<75)
									src.Health=75
								if(src.Energy<EnergyMax/4*3)
									src.Energy=EnergyMax/4*3
							else
								if(!src.bioform2)
									src.BaseMod*=2.5
									src.bioform2=1
									src.icon = 'BioAndroid2.dmi'
									src.Regeneration*=0.80
									src.Recovery*=0.80
									src<<"You've absorbed a Cyborg or a Android! You incorperate them into your body, evolving your form."
									return
								if(!src.bioform3 && src.bioform2)
									src.BaseMod=40
									src.bioform3=1
									src.icon='BioAndroid3.dmi'
									src.Regeneration*=0.80
									src.Recovery*=0.80
									src<<"You've absorbed another Cyborg or Android! You incorperate them into your body, completing the evolution of your form."
								else
									src.Base+=P.Base/2
									if(src.Health<75)
										src.Health=75
									if(src.Energy<EnergyMax/4*3)
										src.Energy=EnergyMax/4*3
						else
							src.AbsorbPower=min(src.Base*20,src.AbsorbPower+P.Base*10)
							if(src.Class=="Hellspawn"||src.Race=="Half Demon")
								if(P.Dead==1)
									if(P.KeepBody==1)
										P.KeepBody=0
										src.KeepBody=1
								src.EnergyMax+=P.EnergyMax*src.EnergyMod/5
								if(P.ssj["unlocked"]>=1)
									src.ssj["1give"]+=P.ssj["1give"]
								if(src.Health<25)
									src.Health=25
								if(src.Energy<EnergyMax/4)
									src.Energy=EnergyMax/4
						P.Death(src)
					return

			if("AquaRing")
				if(src.KO||Blocking)return
				if(src.ManaAmount<=75) return
				view(src)<<"[src] heals everyone around them!"
				var/obj/x=new/obj/AREffect
				for(var/turf/T in view(src,10))
					x.layer=MOB_LAYER+1
					if(src.z==6)
						x.icon_state="NamekUnderwater2"
					else
						x.icon_state="Underwater2"
					T.overlays+=x
					spawn(10)T.overlays-=x
					for(var/mob/P in view(0,T))
						Z.Level++
						if(P!=src)
							if(P.KO)
								P.Conscious()
								P.Health=1
							else
								P.Health=100
						if(P.Burning)
							P.Burning=0
						if(P.Poison)
							P.Poison=0
//					src.SkillLeech(Z)
				if(!src.Manakete)
					src.ManaAmount-=75

			if("AuroraRadiance")
/*				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return*/
				if(src.Attacking) return
				if(Z.Using==1) return
				var/list/people=list("Cancel")
				for(var/mob/Players/M in view(5))
					people.Add(M)
				var/mob/Choice=input("Cast Aurora Radiance on who?")in people
				if(Choice=="Cancel")return
				Z.Using=1
				src.OMessage(5,"[src] begins to cast a spell...","[src]([src.key]) used Aurora Radiance on [Choice]([Choice.key])!")
				sleep(35)
				if(Choice)
					if(Choice.Stoneskin>0)
						src<<"They already have a Support Buff."
						return
					Choice.Stoneskin=240
					Choice.EnduranceMultiplier*=1.25
					Choice.ResistanceMultiplier*=1.25
					Choice.DefenseMultiplier*=1.25
					Choice.Recovery*=1.1
					Choice.Stoneskinned="AuroraRadiance"
					src<<"You cast Aurora Radiance on [Choice]!"
					Choice<<"You feel the power of light build in you!"
					Z.Skill_Increase()
					if(!src.Manakete)
						src.ManaAmount-=15/ManaDrain
				Z.Cooldown()

			if("BrokenPhantasm")
				if(!Z.BuffUsing)
					var/obj/Items/Sword/found
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							found=s
					if(!found)
						src << "You don't have a sword to break."
						return
					Z.BuffUsing=1
					src.OMessage(10, "[src] overloads their weapon with a ridiculous amount of mana!", "[src]([src.key]) used Broken Phantasm.");
					found.Damage_Multiplier+=1
					found.Accuracy_Multiplier+=1
					found.Delay_Multiplier+=1
					found.Explosive=1
				else
					var/obj/Items/Sword/found
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							found=s
					if(found)
						found.Equip(usr)
						src.OMessage(10, "The immense strain on [found]'s structure finally causes the weapon to collapse into dust.", "[src]([src.key]) stopped using Broken Phantasm.");
						del found
					else
						src << "You draw your mana back within in order to prepare for a new blade..."
					Z.BuffUsing=0
			/*if("BestowKeyblade")
				var/list/choices=list("Cancel")
				for(var/mob/m in oview(12))
					choices+=m
				var/mob/choice = input(src, "Who do you want to give your Keyblade to?", "Bestow Keyblade") in choices
				if(choice=="Cancel"||choice==src)
					return
				choice.KeybladeLevel=src.KeybladeLevel
				src.KeybladeLevel=0
				choice.KeybladeElement=src.KeybladeElement
				src.KeybladeElement=null
				if(choice.KeybladeElement=="Light")
					src.OMessage(30, "[src]'s Keyblade vanishes in a burst of light!", "[src]([src.key]) used Bestow Keyblade on [choice].")
				if(choice.KeybladeElement=="Dark")
					src.OMessage(30, "[src]'s Keyblade vanishes in a flash of darkness!", "[src]([src.key]) used Bestow Keyblade on [choice].")*/
			if("BloodSport")
				if(!Z.Using)
					src.OMessage(10, "All of the blood in the area begins migrating towards [src]...!", "[src]([src.key]) used Blood Sport.")
					src.BloodSport=1
					Z.Cooldown()
					spawn(50)
						src.BloodSport=0
						view(10, src) << "The blood in the area resumes normal physics."
			if("BladeMode")
				if(!Z.BuffUsing)
					src.BladeMode=1
					Z.BuffUsing=1
					src << "You overclock your perception and movement augmentations..."
					for(var/mob/m in view(12, src))
						if(m==src)
							continue
						m.BladeSlow=1
						m<<"[src] seems to speed up while everything else slows down...!"
						spawn(500)
							if(m.BladeSlow)
								m.BladeSlow=0
								m<<"Your perception of time returns to normal."
				else
					Z.BuffUsing=0
					src.BladeMode=0
					src << "You stop overclocking your perception."
					for(var/mob/m in view(12, src))
						if(m==src)
							continue
						m.BladeSlow=0
						m<<"Your perception of time returns to normal."
			if("BreakSpiritCuffs")
				var/confirm = alert("Are you sure you want to break the Spirit Cuffs?", "Break Spirit Cuffs", "Yes", "No")
				if(confirm=="Yes")
					var/cuffsword = input("Select a word to use.") as text
					if(cuffsword==src.SpiritCuffsWord)
						src.Base+=src.SpiritCuffsBP*2
						if(src.Race=="Kurama")
							src.trans["1give"]+=src.SpiritCuffsBP*2*20
						src.SpiritCuffs=0
						src.OMessage(30,"[src] breaks their Spirit Cuffs and explodes with a massive surge of energy!","<font color=red>[src]([src.key]) broke their Spirit Cuffs.")
						del Z
					if(cuffsword!=src.SpiritCuffsWord)
						var/confirm2 = alert("You got the password wrong. Do you want to break them early to get weaker power?", "Break Spirit Cuffs early", "Yes", "No")
						if(confirm2=="Yes")
							src.Base+=src.SpiritCuffsBP*1.5
							if(src.Race=="Kurama")
								src.trans["1give"]+=src.SpiritCuffsBP*1.5*20
							src.SpiritCuffs=0
							src.OMessage(30,"[src] breaks their Spirit Cuffs and explodes with a massive surge of energy!","<font color=red>[src]([src.key]) broke their Spirit Cuffs.")
							del Z
			if("HeavySmash")
				if(src.KO||Z.Using==1||src.Frozen)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						usr<< "Hitting with the blunt side of a sword would probably break it."
						return
				if(src.Energy>EnergyMax/10)
					Z.Using=1
					var/wait = rand(200, 800)
					spawn(wait)
						if(src)
							Z.Using=0
							src<<"Hulk Smash CD finished."
					SweepingKick(src)
					src.OMessage(20,"[src] slams their fists into the ground!","[src]([src.key]) used Hulk Smash!")
					for(var/mob/P in view(2))

						var/Damage=src.StrVsEnd(P,10)
						var/Accuracy=((src.Offense*src.OffenseMultiplier)/(P.Defense*P.DefenseMultiplier))*75
						if(P!=src)
							if(prob(Accuracy)&&!P.GER)
								HitEffect(P)
								if(src.DiplomaticImmunity || P.DiplomaticImmunity)
									Damage*=0
								P.Health-=Damage
								P.Knockback(1,src)
								Stun(P,amount=5)
							src.Energy-=src.EnergyMax/35
					sleep(50)
			if("BodyMorph")
				if(src.KO||Z.Using||src.Blocking)return
				if(src.ManaAmount<=30)return
				Z.Using=1
				var/Stat1=1
				var/StatMod1=1
				var/Stat2=1
				var/StatMod2=1
				var/SwapAlpha=0
				if(SwapAlpha==0)
					SwapAlpha=pick(1,2,3,4,5,6)
				if(SwapAlpha==1)
					Stat1=src.Offense
					StatMod1=src.OffenseMod
					Stat2=src.Strength
					StatMod2=src.StrengthMod
					src.Strength=Stat1
					src.StrengthMod=StatMod1
					src.Offense=Stat2
					src.OffenseMod=StatMod2
				else if(SwapAlpha==2)
					Stat1=src.Defense
					StatMod1=src.DefenseMod
					Stat2=src.Endurance
					StatMod2=src.EnduranceMod
					src.Endurance=Stat1
					src.EnduranceMod=StatMod1
					src.Defense=Stat2
					src.DefenseMod=StatMod2
				else if(SwapAlpha==3)
					Stat1=src.Resistance
					StatMod1=src.ResistanceMod
					Stat2=src.Force
					StatMod2=src.ForceMod
					src.Force=Stat1
					src.ForceMod=StatMod1
					src.Resistance=Stat2
					src.ResistanceMod=StatMod2
				else if(SwapAlpha==4)
					Stat1=src.Force
					StatMod1=src.ForceMod
					Stat2=src.Strength
					StatMod2=src.StrengthMod
					src.Strength=Stat1
					src.StrengthMod=StatMod1
					src.Force=Stat2
					src.ForceMod=StatMod2
				else if(SwapAlpha==5)
					Stat1=src.Resistance
					StatMod1=src.ResistanceMod
					Stat2=src.Endurance
					StatMod2=src.EnduranceMod
					src.Endurance=Stat1
					src.EnduranceMod=StatMod1
					src.Resistance=Stat2
					src.ResistanceMod=StatMod2
				else if(SwapAlpha==6)
					Stat1=src.Defense
					StatMod1=src.DefenseMod
					Stat2=src.Offense
					StatMod2=src.OffenseMod
					src.Offense=Stat1
					src.OffenseMod=StatMod1
					src.Defense=Stat2
					src.DefenseMod=StatMod2
				SwapAlpha=0
				src.ManaAmount-=25
				src.OMessage(10,"[src]'s body twists and contorts momentarily before reforming...!?","<font color=green>[src]([src.key]) used Body Morph.")
				Z.Cooldown()
			if("BurstRegen")
				if(src.KO||Z.Using||src.Blocking)return
				if(src.Health>=85) return
				if(src.Energy<=src.EnergyMax/5) return
				if(src.TotalFatigue>=75) return
				Z.Using=1
				var/regenmod=1
				regenmod+=min(1, (src.Regeneration*src.RegenerationMultiplier)/10)
				src.Health+=10*regenmod
				src.Health*=(1.1+(regenmod/10))
				src.Energy*=0.75+(regenmod*0.125)
				src.TotalFatigue+=50/(regenmod*regenmod)
				src.OMessage(10,"[src]'s power drops as their wounds heal!","<font color=red>[src]([src.key]) used Burst Regeneration.")
				Z.Cooldown()
			if("MayuriRegen")
				if(src.KO||Z.Using||src.Blocking)return
				if(src.Health>=85) return
				Z.Using=1
				var/regenmod=1
				regenmod+=min(1, (src.Regeneration*src.RegenerationMultiplier)/10)
				src.Frozen=1
				sleep(30)
				src.Frozen=0
				src.Health+=10*regenmod
				src.Health*=(1.1+(regenmod/10))
				src.Energy*=0.85+(regenmod*0.125)
				src.TotalFatigue+=30/(regenmod*regenmod)
				src.OMessage(10,"[src]'s power drops as their wounds heal!","<font color=red>[src]([src.key]) used Mayuri Regeneration.")
				Z.Cooldown()
			if("Block:Counter")
				if(src.KO||Z.Using||!src.Blocking)return
				src<<"You'll attempt to counter the next attack within 3 seconds."
				src.CounterBlock=1
				spawn(3)src.CounterBlock=0
				Z.Cooldown()
			if("Block:Parry")
				if(src.KO||Z.Using||!src.Blocking)return
				src<<"You'll attempt to parry the next attack within 3 seconds."
				src.CounterParry=1
				spawn(3)src.CounterParry=0
				Z.Cooldown()
			if("BrokenMagnum")
				if(Z.Using)
					return
				if(src.BraveType=="Defense"||src.BraveType=="None")
					src<<"This cannot be used unless you are fighting offensively."
					return
				var/Drain=50/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/20)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Explosive=1
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=2
				A.Physical=1
				A.Offense=(src.Offense*src.OffenseMultiplier)//*(Skill/50)
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()
				return

			if("FrontLotus")
				if(Z.Using||src.Attacking)return
				if(!src.GateNumber)
					src<<"You have to be using Gates to utilize this technique."
					return
				Z.Using=1
				src.FrontLotus=1
				src<<"You're ready to deliver pain..."
				sleep(100)
				src<<"You flinched! Now you have to wait for another chance!"
				src.FrontLotus=0
				Z.Cooldown()

			if("ReverseLotus")
				if(!Z.Using)
					if(src.GateNumber<=2)
						src<<"You need the third gate or above open to utilize this technique."
						return
					if(!src.Target)
						src << "You need a target to use this technique."
						return
					Z.Using=1
					var/icon/W=icon('Effects.dmi',"Shock")
					flick("Attack", src)
					var/obj/t = new
					t.loc = src.loc
					t.dir=src.dir
					step(t.dir, t)
					src.Target.loc = t.loc
					src.OMessage(15,"[src] launches through the air to deliver a powerful kick!", "[src]([src.key]) used Reverse Lotus")
					src.Target.Health -= (src.Power*(src.Strength * src.StrengthMultiplier)) / (src.Target.Power* (src.Target.Endurance * src.Target.EnduranceMultiplier)) * GoCrand(0.5, 3) * 3
					src.Frozen=1
					src.Target.Frozen=1
					src.Quake(10)
					src.Shockwave(W, 5)
					flick("Attack", src)
					t.loc = src.loc
					t.dir = src.dir
					step(t.dir, t)
					src.Target.loc = t.loc
					src.OMessage(15,"[src] puts all of their strength and momentum into a single strike downward!", "[src]([src.key]) completed Lotus")
					src.Quake(50)
					src.Target.Health -= (src.Power*(src.Strength * src.StrengthMultiplier)) / (src.Target.Power* (src.Target.Endurance * src.Target.EnduranceMultiplier)) * GoCrand(0.5, 3) * 30
					src.ReverseLotus=1
					flick("Attack", src)
					src.ReverseLotus=0
					src.Frozen=0
					src.Target.Frozen=0
					src.TotalFatigue+=50
					src.TotalInjury+=20
					Z.Cooldown()

			if("BrokenPhantom")
				if(Z.Using)
					return
				if(src.BraveType=="Defense"||src.BraveType=="None")
					src<<"This cannot be used unless you are fighting offensively."
					return
				var/Drain=60/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/18)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<120)
					Z.Level=120
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Explosive=1
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=10
				A.Physical=1
				A.Offense=(src.Offense*src.OffenseMultiplier)*1.5//*(Skill/50)
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()
				return
			if("BurningFinger")
				if(Z.Using||src.Attacking)return
				Z.Using=1
				src.BurningFinger=1
				src.OMessage(10,"[src]'s hand is burning red!","<font color=red>[src]([src.key]) used Burning Finger.")
				sleep(100)
				src.BurningFinger=0
				Z.Cooldown()
			if("BigBang")
				if(Z.Using)
					return
				var/Drain=400/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain))
					src << "Not enough energy."
					return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(30)
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				Z.Skill_Increase(10)
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
				A.x=(src.x)
				A.y=(src.y)
				A.z=(src.z)
				A.Distance=sqrt(Z.Level)*2
				A.Radius=2
			//	A.Deflectable=1
				A.Dodgeable=1
				A.Explosive=1
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=30
				A.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/3)
				src.SkillLeech(Z)
				src.Control=A
				while(A)
					if(!src)break
					step(A,src.dir)
					sleep(1)//sleep((100/(sqrt(Z.Level)*sqrt(Z.Level)))/src.SpeedMod)
					for(var/mob/Players/T in view(18))
						spawn()T.Quake(8)
					for(var/turf/T in Turf_Circle(src,8))
						if(prob(1)) sleep(0.005)
						spawn(rand(4,8)) Destroy(T,30)
				//		if(prob(10))sleep(0.1)
					for(var/mob/M in view(0,18))
						if(M!=src)
							M.Health-=((((usr.Force*usr.ForceMultiplier)*1.3)*usr.Power)/((M.Resistance*M.ResistanceMultiplier)*M.Power))*30
							//src.Energy-=(((usr.Force/100)/Z.Level)+5000)
				src.Attacking=0
				src.Beaming=0
				Z.Cooldown()
			if("Blast")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
//				src.TotalFatigue+=(Drain/src.Efficiency*100*(1/Z.Level))/20
				Z.Skill_Increase()
				var/Blast_Chance=100
				while(round(Blast_Chance))
					if(prob(Blast_Chance))
						flick("Blast",src)
						Create_Projectile(usr,/obj/Projectiles/fevProjectile/Blast,Icon=Z.sicon,Icon_State=Z.sicon_state)//short and sweet procedure to handle projectile creation
						Blast_Chance*=0.25
						for(var/mob/X in view(10,usr))
							if(X.MusicToggle=="On")
								X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
						sleep(3)
					else
						Blast_Chance=0
				if(Z.Level<100)
					Z.Level=100
				src.SkillLeech(Z)
				Z.Cooldown()
			if("Barrage")
				if(Z.Using)
					return
		//		EXP+=(EXPGains/100)*0.00004
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				flick("Blast",src)
//				src.Energy-=Drain/src.Efficiency*300*(1/Z.Level)
				src.Attacking=1
				Z.Using=1
		//		spawn((src.Refire/Z.Speed*(1/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
//				spawn(10) Z.Using=0
				sleep(5)
				src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-10,10)
//				A.pixel_x=rand(-10,10)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=1
				A.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				A.Elemental=Element
				var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
				B.Distance=Distance
//				B.pixel_y=rand(-10,10)
//				B.pixel_x=rand(-10,10)
				B.dir=src.dir
				B.icon=Z.sicon
				B.icon_state=Z.sicon_state
				B.Owner=src
				B.Lethality=src.Lethal
				B.Damage_Multiplier=1
				B.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				B.Elemental=Element
				var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
				C.Distance=Distance
//				C.pixel_y=rand(-10,10)
//				C.pixel_x=rand(-10,10)
				C.dir=src.dir
				C.icon=Z.sicon
				C.icon_state=Z.sicon_state
				C.Owner=src
				C.Lethality=src.Lethal
				C.Damage_Multiplier=1
				C.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				C.Elemental=Element
				spawn
					if(B)
						step(B,turn(B.dir,90))
					if(C)
						step(C,turn(C.dir,-90))
						//step(B,A.dir)
						//step(D,A.dir)
					if(A)
						walk(A,A.dir)
						if(B)walk(B,A.dir)
						if(C)walk(C,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()
			if("KunaiBarrage")
				if(Z.Using)
					return
		//		EXP+=(EXPGains/100)*0.00004
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return

				flick("Blast",src)
//				src.Energy-=Drain/src.Efficiency*300*(1/Z.Level)
				src.Attacking=1
				Z.Using=1
		//		spawn((src.Refire/Z.Speed*(1/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
//				spawn(10) Z.Using=0
				sleep(5)
				src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-10,10)
//				A.pixel_x=rand(-10,10)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=1
				A.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				A.Elemental=Element
				var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
				B.Distance=Distance
//				B.pixel_y=rand(-10,10)
//				B.pixel_x=rand(-10,10)
				B.dir=src.dir
				B.icon=Z.sicon
				B.icon_state=Z.sicon_state
				B.Owner=src
				B.Lethality=src.Lethal
				B.Damage_Multiplier=1
				B.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				B.Elemental=Element
				var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
				C.Distance=Distance
//				C.pixel_y=rand(-10,10)
//				C.pixel_x=rand(-10,10)
				C.dir=src.dir
				C.icon=Z.sicon
				C.icon_state=Z.sicon_state
				C.Owner=src
				C.Lethality=src.Lethal
				C.Damage_Multiplier=1
				C.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				C.Elemental=Element
				spawn
					if(B)
						step(B,turn(B.dir,90))
					if(C)
						step(C,turn(C.dir,-90))
						//step(B,A.dir)
						//step(D,A.dir)
					if(A)
						walk(A,A.dir)
						if(B)walk(B,A.dir)
						if(C)walk(C,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()
			if("Beam")
				if(src.KO||Blocking)return
				if(Z.Using)
					return
				var/Drain=5/Z.Efficiency
				if(!src.CanBlast(Drain)) return
				if(!Z:Charging&&!Z.BeamUsing&&!src.Attacking)
					src.Beam_Charge(Z)
				else if(Z:Charging&&!Z.BeamUsing)
					src.Beam_Go(Z)
				else if(Z.BeamUsing)
					src.Beam_Stop(Z)
					Z.Cooldown();
				if(Z.Level<100)
					Z.Level=100


/*proc/Butch()
	spawn(rand(1,10))
	for(var/mob/P in oview(30,src))
		if(P!=Owner)
			walk_to(src,P,0,MoveDelay,0)*/

/*mob/proc/Skill2X(var/Wut,var/obj/Skills/Z,var/bypass=0) //J-R
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.Stunned)
		return
	var/ManaDrain=1
	var/StaffPower=1
//	var/Element=0
	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
		StaffPower=N.Staff_Power
//		Element=N.Element
	if(bypass||Z)
		switch(Wut)
mob/proc/Skill3X(var/Wut,var/obj/Skills/Z,var/bypass=0) //S-Z
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.Stunned)
		return
	var/ManaDrain=1
	var/StaffPower=1
//	var/Element=0
	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
		StaffPower=N.Staff_Power
//		Element=N.Element
	if(bypass||Z)
		switch(Wut)*/