proc
	GunShot(atom/movable/M)
		var/obj/Effects/Shot/P = new
		P.Target=M
		P.Target_Watch()
		P.pixel_z=M.pixel_z
		P.pixel_x+=rand(-8,8)
		P.pixel_y+=rand(-8,8)
obj/Effects
	Shot
		icon='KunaiMod/Icons/BONKY3.dmi'
		pixel_x=-32
		pixel_y=-32
		var/Target
		proc
			Target_Watch()
				Start
				spawn(1)
					if(Target)
						loc=Target:loc
						goto Start
		New()
			sleep(0)
			animate(src, transform = turn(matrix(), pick(45,-45,0,-90,90,135.-135,180)),time=0)
			spawn(1)

				animate(src,alpha=0,time=5)
			spawn(6)
				del src




mob/proc/SkillKoon(var/Wutt,var/obj/Skills/Z,var/bypass=0)//var/_isSkillActive
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.Stunned)
		if(Wutt!="After Image Strike"||Wutt!="Wild Sense")
			return
	if(bypass||Z)
		switch(Wutt)
			if("DHCombo")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Grab) return
				if(src.Meditating) return
				if(src.Digging) return
				if(src.TimeFrozen)return
				if(src.ShadowBound)return
				if(src.Flying) return
				if(src.Clothesline)
					src << "No stacking."
					return
				var/DistanceZ=2
				var/Ready=0
				for(var/obj/Items/Sword/S in usr)
					if(!S.suffix)
						src<<"Where's your sord?"
						return
				if(src.Energy>EnergyMax/8)
					Z.Cooldown()
					src.ThousandStabs=1
					Z.Using=1
					src.Frozen=1
					if(src.Swordmaster==0)
						src.Swordmaster=1
						src.Gunslinger=0
						src.Royalguard=0
						src.Trickster=0
						for(var/mob/S in view(src,12))
							for(var/obj/Communication/C in src)
								S<<"<font color='red'>[src] yells: <b>Swordmaster!</b>"
					for(var/mob/S in view(src,12))
						S<<sound('KunaiMod/Sounds/nanayaspecial.ogg')
					src.OMessage(10,"[src] spins their sword, holding it back as they take a stance!","<font color=red>[src]([src.key]) prepared Thousand Stabs.")
					sleep(5)
					src.OMessage(10,"[src] lunges forth, thrusting and skewering with their blade a thousand times in an instant!","<font color=red>[src]([src.key]) used Thousand Stabs.")
					for(var/mob/S in view(src,12))
						S<<sound('KunaiMod/Sounds/nanayasensou.ogg')
					while(DistanceZ>0)
						AfterImage(src)
						step(src,src.dir)
						DistanceZ-=1
						for(var/mob/P in view(src,1))
							if(P!=src)
								Stun(P,4)
								DistanceZ=0
								Ready=1
						sleep(1.25)
						if(DistanceZ==0&&Ready==1)
							for(var/mob/S in view(src,12))
								for(var/obj/Communication/C in src)
									S<<"<font color=[C.Text_Color]>[src] yells: <b>Hoooooryaah!!</b>"
							var/Slashes=18
							while(Slashes>0)
								for(var/mob/U in view(src,1))
									if(U!=src)
										Stun(U,1)
										Slash(U)
										var/Damage=src.StrVsEnd(U,2)
										U.Health-=Damage
										if(prob(25))
											U.TotalInjury+=0.25
											SpawnBlood(U)
										for(var/mob/S in view(src,12))
											S<<sound('KunaiMod/Sounds/daggerhit.ogg', volume=35)
									Slashes-=1
								for(var/mob/S in view(src,12))
									S<<sound('KunaiMod/Sounds/daggerswung.ogg')
								sleep(1.75)
								if(DistanceZ<=0&&Slashes<=0)
									src.OMessage(10, "[src] gives a final, strong thrust forward with their sword!", "[src]([src.key]) finished Thousand Stabs.")
									for(var/mob/YE in view(src,1))
										Slash(YE)
									spawn()new/obj/Tipper(src)
									for(var/mob/S in view(src,12))
										S<<sound('KunaiMod/Sounds/daggerswing.ogg')
										S<<sound('KunaiMod/Sounds/impact1.ogg')
									src.Frozen=0
									src.ThousandStabs=0
									src.Using=0
						else if(DistanceZ<=0&&Ready==0)
							src.OMessage(10,"[src] immediately halts their attack--","<font color=red>[src]([src.key]) missed Thousand Stabs.")
							for(var/mob/S in view(src,12))
								for(var/obj/Communication/C in src)
									S<<"<font color=[C.Text_Color]>[src] says: --Oof!"
							src.Frozen=0
							src.ThousandStabs=0
							src.Using=0
				else
					src<<"No energy."

			if("ShadowBind")
				if(src.KO||Blocking)return
				if(src.Grab) return
				if(src.Meditating) return
				if(src.Digging) return
				if(src.TimeFrozen)return
				if(src.ShadowBound)return
				if(src.Flying) return
				if(Z.Using)
					src.Frozen=0
					src.KageShibari=0
					src.DoubleKageDrain=0
					src.TripleKageDrain=0
					Z.Using=0
					Z.Cooldown()
					for(var/mob/B in world)
						if(B.BoundBy==src)
							B.ShadowBound=0
							B.BoundBy=null
							B.IsChoke=0
							B.Frozen=0
							B.IsWeaker=0
							if(B.ShadowGoon==1&&src.ShadowGoon==1)
								B.ShadowGoon=0
								src.ShadowGoon=0
								B.Power_Multiplier+=0.5
								src.Power_Multiplier+=0.5
								B.SpeedMultiplier*=10
								src.SpeedMultiplier*=10
								B.EnduranceMultiplier*=10
								src.EnduranceMultiplier*=10
								B.ResistanceMultiplier*=10
								src.ResistanceMultiplier*=10
					view(src)<<"[src]'s shadow retracts..."
				else
					if(src.ManaAmount<=10) return
					Z.Using=1
					src.Frozen=1
					for(var/mob/E in hearers(12,src))
						E<<sound('KunaiMod/Sounds/handseal.ogg')
					view(src)<<"[src] performs a handseal! \[Rat]!"
					var/list/people=list("Cancel")
					for(var/mob/Players/M in view(15,src))
						people.Add(M)
					var/mob/Choice=input("Who will you use Shadow Bind on? Choose wisely, this skill may drain a lot of Mana.")in people
					if(Choice==src)
						if(src.KageMastery<100)
							view(src)<<"[src] starts training their shadow technique, extending their shadow forth, back, sideways, geometrically..."
							src.KageMastery+=50
							for(var/mob/E in hearers(12,src))
								E<<sound('KunaiMod/Sounds/finalhandseal.ogg')
							sleep(15)
							for(var/mob/E in hearers(12,src))
								for(var/obj/Communication/C in src)
									E<<"<b><font color=[C.Text_Color]>[src] yells: Kagemane no Jutsu!"
							for(var/mob/L in hearers(12,src))
								L<<sound('KunaiMod/Sounds/kagemane.ogg')
							sleep(200)
							src.TotalFatigue+=50
							view(src)<<"[src] retracts their shadow, done with training for now."
							Z.Using=0
							src.Frozen=0
							return
						else
							src<<"You're an expert already. No need to train it further, buddy!"
							return
					if(Choice=="Cancel")
						view(src)<<"[src] sighs before undoing their handseal. What a drag..."
						src.Frozen=0
						Z.Using=0
						return
					if(Choice)
						for(var/mob/E in hearers(12,src))
							E<<sound('KunaiMod/Sounds/finalhandseal.ogg')
						sleep(15)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<b><font color=[C.Text_Color]>[src] yells: Kagemane no Jutsu!"
						for(var/mob/L in hearers(12,src))
							L<<sound('KunaiMod/Sounds/kagemane.ogg')
							L<<"[src]'s shadow extends forth towards [Choice] with an incredible speed--"
						sleep(10)
						if(Choice.Defense+Choice.Resistance<src.Force+src.Offense||prob(30))
							view(src)<<"[Choice] is caught by [src]'s shadow bind!"
							Choice.dir=ReturnDirection(Choice,src)
							src.dir=ReturnDirection(src,Choice)
							src.KageShibari=1
							Choice.ShadowBound=1
							Choice.Frozen=1
							Choice.BoundBy=src
							if(Choice.Power>src.Power)
								src<<"You struggle to maintain your shadow bind on [Choice], they are too strong!"
								src.DoubleKageDrain=1
							else
								src<<"You effortlessly lock down [Choice], they're completely paralyzed!"
						else
							view(Choice)<<"[Choice] nimbly avoids [src]'s shadow bind!"
							src.Frozen=0
							Z.Using=0
							return
					else
						src.Frozen=0
						Z.Using=0
						return

			if("ShadowImitate")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Grab) return
				if(src.Meditating) return
				if(src.Digging) return
				if(src.TimeFrozen)return
				if(src.KageShibari==0)
					src<<"You need to catch someone with your shadow first."
					return
				if(src.ShadowBound)return
				if(src.Flying) return
				var/list/actions=list("Play","Weaken","Approach","Cancel")
				var/mob/Choice=input("What are you going to do with your bound victim?")in actions
				if(Choice=="Cancel")
					return
				if(Choice=="Play")
					var/imitating=input("Do something, they will sure imitate you physically. (Same format as Emote, but actions only! Remember to punctuate on the end for bonus Nara points.)") as text
					for(var/mob/victim in world)
						if(victim.BoundBy==src)
							view(src)<<"[src] performs an action, forcing [victim] to imitate them!"
							view(victim)<<"[victim] [imitating]"
							src.ManaAmount+=50
					return
				if(Choice=="Weaken")
					for(var/mob/victim in world)
						if(victim.BoundBy==src)
							if(ShadowGoon==1)
								src.ShadowGoon=0
								victim.ShadowGoon=0
								src.Power_Multiplier+=0.5
								victim.Power_Multiplier+=0.5
								src.SpeedMultiplier*=10
								victim.SpeedMultiplier*=10
								src.EnduranceMultiplier*=10
								victim.EnduranceMultiplier*=10
								src.ResistanceMultiplier*=10
								victim.ResistanceMultiplier*=10
								view(src)<<"[src] drops their glorious pose..."
								view(victim)<<"[victim] drops their glorious pose..."
							else
								view(src)<<"[src] adopts a silly, Tokusentai-ish pose, leaving themselves wide open!"
								view(victim)<<"[victim] adopts a silly, Tokusentai-ish pose, leaving themselves wide open!"
								for(var/mob/P in view(20,usr)) P<<sound('Tokusentai.wav')
								src.ShadowGoon=1
								victim.ShadowGoon=1
								src.Power_Multiplier-=0.5
								victim.Power_Multiplier-=0.5
								src.SpeedMultiplier/=10
								victim.SpeedMultiplier/=10
								src.EnduranceMultiplier/=10
								victim.EnduranceMultiplier/=10
								src.ResistanceMultiplier/=10
								victim.ResistanceMultiplier/=10
								return
				if(Choice=="Approach")
					var/steps=input("How much will you move around with your victim? (Up to 5 steps)") as num
					if(steps>=5)
						steps=5
					while(steps>0)
						for(var/mob/bound in world)
							if(bound.BoundBy==src)
								walk_to(src,bound)
								walk_to(bound,src)
								steps--
								sleep(25)
								if(steps==0)
									view(src)<<"[src] moves forth [steps] steps, as their bound target is forced to imitate them... doing the same!"
				Z.Using=0
				Z.Cooldown()

			if("ShadowChoke")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Grab) return
				if(src.Meditating) return
				if(src.Digging) return
				if(src.TimeFrozen)return
				if(src.Flying) return
				for(var/mob/E in hearers(12,src))
					E<<sound('KunaiMod/Sounds/handseal.ogg')
				view(src)<<"[src] performs a handseal! \[Dragon]!"
				sleep(9)
				for(var/mob/E in hearers(12,src))
					E<<sound('KunaiMod/Sounds/handseal.ogg')
				view(src)<<"[src] performs a handseal! \[Tiger]!"
				sleep(9)
				for(var/mob/E in hearers(12,src))
					E<<sound('KunaiMod/Sounds/handseal.ogg')
				view(src)<<"[src] performs a handseal! \[Rat]!"
				sleep(9)
				for(var/mob/E in hearers(12,src))
					E<<sound('KunaiMod/Sounds/finalhandseal.ogg')
				sleep(15)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<b><font color=[C.Text_Color]>[src] yells: Kage Kubi-Shibari no Jutsu!"
				for(var/mob/choked in world)
					if(choked.BoundBy==src)
						var/obj/Effects/ShadowGasp/gasp=new
						gasp.loc=choked.loc
						flick("",gasp)
						choked.IsChoke=1
						for(var/mob/L in hearers(12,src))
							L<<sound('KunaiMod/Sounds/kagemane.ogg')
							L<<"[src]'s shadow slowly crawls up [choked]'s body, reaching for their neck and aiming to strangle them!"
						sleep(15)
						if(choked.Power>src.Power)
							src<<"You struggle to maintain your shadow choke on [choked], they are too strong!"
							src.DoubleKageDrain=1
							src.TripleKageDrain=1
							Choke(choked)
						else
							src<<"You effortlessly lock down [choked] and strangle the life out of them!"
							src.DoubleKageDrain=1
							choked.IsWeaker=1
							Choke(choked)
						if(choked.Power>src.Power*1.5)
							view(choked)<<"[choked] seems to be unaffected by the attempt to be strangled..."
							src.DoubleKageDrain=1
							src.TripleKageDrain=1
						del(gasp)
				Z.Using=0
				Z.Cooldown()

			if("ShadowSew")
				if(src.KO||Blocking)return
				if(src.Grab) return
				if(src.Meditating) return
				if(src.Digging) return
				if(src.TimeFrozen)return
				if(src.Flying) return
				if(src.Target==null)
					src<<"You need a target..."
					return
				if(!Z.Using)
					Z.Using=1
					src.Frozen=1
					var/mob/voi=src.Target
					for(var/mob/E in hearers(12,src))
						E<<sound('KunaiMod/Sounds/handseal.ogg')
					view(src)<<"[src] performs a handseal! \[Rat]!"
					sleep(8)
					for(var/mob/E in hearers(12,src))
						E<<sound('KunaiMod/Sounds/handseal.ogg')
					view(src)<<"[src] performs a handseal! \[Bird]!"
					for(var/mob/E in hearers(12,src))
						E<<sound('KunaiMod/Sounds/finalhandseal.ogg')
					sleep(15)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<b><font color=[C.Text_Color]>[src] yells: Kage Nui no Jutsu!"
					src.TotalFatigue+=(rand(5,15))
					src.ManaAmount-=(rand(5,15))
					voi.Frozen=1
					var/obj/Effects/ShadowNui/nui=new
					nui.loc=voi.loc
					flick("",nui)
					view(voi)<<"[src]'s shadow unlatches from the ground in the form of many thin threads and relentlessly pierce [voi] several times!"
					view(voi)<<sound('KunaiMod/Sounds/kagemane.ogg')
					sleep(10)
					view(voi)<<sound('KunaiMod/Sounds/Slash2.ogg')
					SpawnBlood(voi)
					sleep(5)
					view(voi)<<sound('KunaiMod/Sounds/squelch.ogg')
					voi.TotalInjury+=(rand(5,13))
					SpawnBlood(voi)
					view(voi)<<sound('KunaiMod/Sounds/slash.ogg')
					SpawnBlood(voi)
					voi.TotalInjury+=(rand(2,4))
					SpawnBlood(voi)
					sleep(10)
					view(voi)<<sound('KunaiMod/Sounds/squelch.ogg')
					del(nui)
					voi.Frozen=0
					src.Frozen=0
					if(prob(50))
						view(voi)<<"The shadow needles manage to inflict bleeding on [voi]!"
						WeakBleed(voi)
				Z.Using=0
				Z.Cooldown()

			if("NanayaDash")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Meditating) return
				if(src.Grab) return
				if(src.Digging) return
				if(src.Frozen) return
				if(src.TimeFrozen)return
				if(src.ShadowBound)return
				if(!Z.Using)
					var/Distance=8 //5 square dash
					var/DistanceCounter=0
					if(src.Energy>EnergyMax/4)
						src.TotalFatigue+=1
						src.NanayaDash=1
						Z.Using=1
						src.Flying=1
						for(var/mob/D in view(src,12))
							D<<sound('KunaiMod/Sounds/nanayasensou.ogg')
						src.Frozen=1
						while(Z.Using&&Distance)
							step(src,src.dir)
							Distance-=1
							DistanceCounter+=1
						if(Distance<=0)
							src.Frozen=0
							src.NanayaDash=0
							src.Flying=0
						Z.Cooldown()

			if("DHBullet")
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
					return
				if(!Z.Using)
					src.overlays+='KunaiMod/Icons/gunshow.dmi'
					src.dir=ReturnDirection(src,tgt)
					flick("Blast", src)
					if(src.Gunslinger==0)
						src.Swordmaster=0
						src.Gunslinger=1
						src.Royalguard=0
						src.Trickster=0
						for(var/mob/S in view(src,12))
							for(var/obj/Communication/C in src)
								S<<"<font color=green>[src] yells: <b>Gunslinger!</b>"
						view(src)<<"[src] draws forth their firearm(s) and promptly guns down [tgt] with arcane lead!"
					for(var/mob/M in view(10))
						if(M==tgt)
							GunShot(M)
							src.StrVsEnd(M, 1)
							Stun(M,0.5)
					view(src)<<sound('KunaiMod/Sounds/gun.ogg')
					src.overlays-='KunaiMod/Icons/gunshow.dmi'
					Z.Cooldown()

			if("DHLead")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Meditating) return
				if(src.Grab) return
				if(src.Digging) return
				if(src.Frozen) return
				if(src.TimeFrozen)return
				if(src.ShadowBound)return
				if(!Z.Using)
					src.overlays+='KunaiMod/Icons/gunshow.dmi'
					flick("Blast", src)
					if(src.Gunslinger==0)
						src.Swordmaster=0
						src.Gunslinger=1
						src.Royalguard=0
						src.Trickster=0
						for(var/mob/S in view(src,12))
							for(var/obj/Communication/C in src)
								S<<"<font color=green>[src] yells: <b>Gunslinger!</b>"
						view(src)<<"[src] spins around on the tip of their foot, firing their firearm(s) aimed at everywhere!"
					for(var/mob/M in view(10))
						if(M!=src)
							GunShot(M)
							src.StrVsEnd(M, 0.5)
							Stun(M,1)
					view(src)<<sound('KunaiMod/Sounds/gun.ogg')
					src.dir=turn(dir,pick(-45,45,-90,90,180))
					src.overlays-='KunaiMod/Icons/gunshow.dmi'
					Z.Cooldown()

			if("Indomitable")
				if(src.KO||Z.Using||!src.Blocking)return
				if(src.Retaliate==1)return
				if(src.Royalguard==0)
					src.Swordmaster=0
					src.Gunslinger=0
					src.Royalguard=1
					src.Trickster=0
					for(var/mob/S in view(src,12))
						for(var/obj/Communication/C in src)
							S<<"<font color=blue>[src] yells: <b>Royalguard!</b>"
					view(src)<<"[src] raises their forearms, taking a defensive stance as they clench their fists tightly!"
				src.Indomitable=1
				spawn(6)src.Indomitable=0
				Z.Cooldown()

			if("Chaser")
				if(src.KO||Z.Using||!src.Blocking)return
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Meditating) return
				if(src.Grab) return
				if(src.Digging) return
				if(src.Frozen) return
				if(src.TimeFrozen)return
				if(src.ShadowBound)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						var/Distance=20 //5 square dash
						var/DistanceCounter=0
						if(src.Energy>EnergyMax/8)
							src.Chaser=1
							Z.Using=1
							if(src.Swordmaster==0)
								src.Swordmaster=1
								src.Gunslinger=0
								src.Royalguard=0
								src.Trickster=0
								for(var/mob/SA in view(src,12))
									for(var/obj/Communication/C in src)
										SA<<"<font color=red>[src] yells: <b>Swordmaster!</b>"
								view(src)<<"[src] brings their blade back and slides forward, while stylishly thrusting it forth and raising some dust behind!"
							for(var/mob/E2 in hearers(12,src))
								for(var/obj/Communication/C in src)
									E2<<"<font color=[C.Text_Color]>[src] yells: <b>C'mon!!</b>"
							src.Frozen=1
							while(Z.Using&&Distance)
								step(src,src.dir)
								for(var/mob/P in view(src,1))
									var/Accuracy=(((src.Offense*src.OffenseMultiplier)*src.Power)/((P.Defense*P.DefenseMultiplier)*P.Power))*150
									if(P!=src)
										if(prob(Accuracy)&&!P.GER)
											var/Damage=src.StrVsEnd(P, 2+DistanceCounter) // up from 2x
											if(src.DiplomaticImmunity || P.DiplomaticImmunity)
												Damage*=0
												P<<sound('KunaiMod/Sounds/shieldblock.ogg')
												P<<"Damage nullified!"
												src<<sound('KunaiMod/Sounds/shieldblock.ogg')
												src<<"Damage nullified!"
											P.Health-=Damage
											Slash(P)
											Stun(P,3)
											P.Knockback(1,src)
											P<<sound('KunaiMod/Sounds/slash.ogg')
											src<<sound('KunaiMod/Sounds/slash.ogg')
								Distance-=1
								DistanceCounter+=1
								sleep(0.75)
							if(Distance<=0)
								src.Frozen=0
								src.Sidecut=0
							Z.Cooldown()
					else if(!S.suffix)
						src<<"You can't use this without a SORD equiped!"
						return

			if("Retaliate")
				if(src.KO||Z.Using||!src.Blocking)return
				if(src.Indomitable==1)return
				if(src.KarmaEnergy<150)
					src<<"You need at least 150 Karma Energy to use this. (Current: [src.KarmaEnergy])"
					return
				if(src.Royalguard==0)
					src.Swordmaster=0
					src.Gunslinger=0
					src.Royalguard=1
					src.Trickster=0
					for(var/mob/S in view(src,12))
						for(var/obj/Communication/C in src)
							S<<"<font color=blue>[src] yells: <b>Royalguard!</b>"
					view(src)<<"[src] outstretches their arm, pure darkness made of nothing but the Karma coats the limb and distorts erradically... Uh oh!"
				src.Retaliate=1
				spawn(10)src.Retaliate=0
				view(src)<<"[src] arm sizzles, as the Karma dispells quickly!"
				src.KarmaEnergy=0
				Z.Cooldown()

			if("AbsorbKarma")
				if(src.KO||Z.Using||!src.Blocking)return
				if(src.Indomitable==1)return
				if(src.KarmaEnergy<10)
					src<<"You need at least 10 Karma Energy to use this. (Current: [src.KarmaEnergy])"
					return
				if(src.Royalguard==0)
					src.Swordmaster=0
					src.Gunslinger=0
					src.Royalguard=1
					src.Trickster=0
					for(var/mob/S in view(src,12))
						for(var/obj/Communication/C in src)
							S<<"<font color=blue>[src] yells: <b>Royalguard!</b>"
					view(src)<<"[src] exhales a dark fog, wiping their forehead as darkness made of nothing but sheer Karma spreads across their body, healing them!"
				view(src)<<sound('KunaiMod/Sounds/mysticeyes.ogg')
				if(KarmaEnergy<100)
					src.Health-=KarmaEnergy
					src.Energy-=KarmaEnergy
					src.TotalInjury-=KarmaEnergy
					src.TotalFatigue-=KarmaEnergy
					src.KarmaEnergy=0
				else
					src.Health=100
					src.Energy=src.EnergyMax
					src.ManaAmount=src.ManaMax
					src.Burning=0
					src.Poison=0
					src.HealthAnnounce25=0
					src.HealthAnnounce10=0
					src.TotalFatigue=0
					src.TotalInjury=0
					src.InjuryAnnounce=0
					src.InjuryAnnounce75=0
					src.InjuryAnnounce90=0
					src.Bleeding=0
					src.KarmaEnergy/=2
				Z.Cooldown()

			if("Tsukiyomi")
				if(Z.Using)
					return
				if(src.Attacking) return
				if(src.Amaterasu) return
				if(src.KO) return
				src.Tsukiyomi=1
				var/list/people=list("Cancel")
				for(var/mob/Players/M in view(15))
					people.Add(M)
				var/mob/TGT=input("Who will you use Tsukiyomi on? Choose wisely, this skill can get you seriously hurt.")in people
				if(TGT=="Cancel")return
		//		Z.Using=1
				src.Frozen=1
				src.OMessage(5,"[src] focuses their gaze upon [TGT]...","[src]([src.key]) used Tsukiyomi on [TGT]([TGT.key])!")
				sleep(5)
				if(TGT && src.Tsukiyomi)
					Comboz(TGT)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: <b>...Tsukiyomi!!</b>"
							E<<sound('KunaiMod/Sounds/msharingan.ogg')
					sleep(5)
					src.DiplomaticImmunity=1
					TGT.DiplomaticImmunity=1
					if(TGT.IsBoss||TGT.DONTE||TGT.Race=="Synchronizer"||TGT.Power+TGT.Resistance>src.Power+src.Force)
						src<<"They don't seem to be affected by your Tsukiyomi?... (DEBUG: Stat Check = [TGT.Power+TGT.Resistance] vs [src.Power+src.Force]"//Is Boss=[TGT.IsBoss]?/Is Meme Maid=[TGT.Race]?)"
						return
					else
						var/minigame=alert(src, "In the world of Tsukiyomi, time, space and logic matters not. You are the master of this world, although, it is but an illusion... You still need to convince the enemy they're in here. But how?", "Tsukiyomi Attack", "Endless Torture!", "Induce Insanity...", "Direct Death!!")
						if(minigame=="Induce Insanity...")
							if(TGT.SharinganLevel>=3)
								TGT<<"Your eyes see that [src] is trying to <b>confuse</b> you?... Better keep it cool!"
							var/minigame2=alert(TGT, "In the world of Tsukiyomi, time, space and logic matters not. You are stuck in this world, although, you can gamble and try to resist it with all you have... But how?", "Steel yourself!", "Keep Calm...", "Grit Your Teeth!!", "Huh?")
							if(minigame2=="Keep Calm...")
								src<<"<font face=verdana><font color=red><i>Failure!<font color=white> They saw that coming, and were calm through all of your Tsukiyomi's attempt to make them crazy..."
								TGT<<"<font face=verdana><font color=white><i>You breathe in and out, while in this alternative world. You compose youself, steel yourself for what's going to come. Nothing is real here. [src] is clearly using their stupid power to try and confuse you. You resist it fairly easily..."
								view(src)<<"<font color=red>[src] holds up their hands to cover their eyes, as blood gushes out of them!"
								src.TotalFatigue+=25
								SpawnBlood(src)
								SpawnBlood(src)
								src.DiplomaticImmunity=0
								src.Frozen=0
								TGT.DiplomaticImmunity=0
								TGT.Frozen=0
							else
								src<<"<font face=verdana><font color=green><i>Success!<font color=white> You manage to jumble with [TGT]'s mind, making them lose their grip on reality."
								TGT<<"<font face=verdana><font color=white><i>...Your mind blanks out. All you see is dark... Suddenly, a shift of colors. Butterflies... Crows... Cookies... Deers... House... Where? Does it matter? Yesterday, I knew before tomorrow was afternoon night day is not potato... You feel like you gained-- lost your grip to pizza?-- reality. Hahaha... This is crazy. I can't live with this. You can't live with this. We can't anymore. We need help. Psychological help. A hug...? A hug. *sniff*... I'm crying. Why...? Hahahahaha! This is so funny, man! <b>L.</b> regardless. ((IC Fluff. You are temporarily insane, without a grip on what is real or not. You're also free to call a RP Mode On and halt, if this was used in combat.))"
								view(src)<<"<font color=red>[src] grunts, as blood drips down softly from their eye in a single tear..."
								SpawnBlood(src)
								SpawnBBlood(TGT)
								src.DiplomaticImmunity=0
								src.Frozen=0
								TGT.DiplomaticImmunity=0
								TGT.Frozen=0
								if(src.Power+src.Force>TGT.Power+TGT.Resistance)
									view(TGT)<<"[TGT] seems to be permanently cripplied due to Tsukiyomi!"
									TGT.TsukiScars=src.Power
						else if(minigame=="Endless Torture!")
							if(TGT.SharinganLevel>=3)
								TGT<<"Your eyes see that [src] is trying to <b>torture</b> you?... Better steel yourself for the worst!"
							var/minigame2=alert(TGT, "In the world of Tsukiyomi, time, space and logic matters not. You are stuck in this world, although, you can gamble and try to resist it with all you have... You only have one chance.", "Steel yourself!", "Keep Calm...", "Grit Your Teeth!!", "Huh?")
							if(minigame2=="Steel yourself!")
								src<<"<font face=verdana><font color=red><i>Failure!<font color=white> They saw that coming, and endured every single span of second inside your Tsukiyomi..."
								TGT<<"<font face=verdana><font color=white><i>You breathe in and out, while in this alternative world. You compose youself, steel yourself for what's going to come. You start to see yourself being tortured over minutes, days, years... All in the span of a few seconds. You've lost your limbs several times, regained them several times, felt and re-felt pain, but managed to ward off, and keep a grip on it with nothing but sheer, iron willpower..."
								view(src)<<"<font color=red>[src] holds up their hands to cover their eyes, as blood gushes out of them!"
								src.TotalFatigue+=25
								SpawnBlood(src)
								SpawnBlood(src)
								src.DiplomaticImmunity=0
								src.Frozen=0
								TGT.DiplomaticImmunity=0
								TGT.Frozen=0
							else
								src<<"<font face=verdana><font color=green><i>Success!<font color=white> You manage to jumble with [TGT]'s mind, making them extremely frail mentally, and physically..."
								TGT<<"<font face=verdana><font color=white><i>...Your mind blanks out. All you see is dark... Suddenly, a shift of colors. You start to see yourself being tortured over minutes, days, years... All in the span of a few seconds. You've lost your limbs several times, regained them several times, felt and re-felt pain, but no matter how much you try to ward it off, it completely catches you off-guard... ((IC Fluff. You are temporarily under the worst pain of your life. You're also free to call a RP Mode On and halt, if this was used in combat.))"
								view(src)<<"<font color=red>[src] grunts, as blood drips down softly from their eye in a single tear..."
								TGT<<"[TGT] gags and drops to a single knee, crutching randomly at their limbs... They seem to be in an immense pain!"
								SpawnBlood(src)
								SpawnBBlood(TGT)
								src.DiplomaticImmunity=0
								src.Frozen=0
								TGT.DiplomaticImmunity=0
								TGT.Frozen=0
								if(src.Power+src.Force>TGT.Power+TGT.Resistance)
									view(TGT)<<"[TGT] seems to be permanently cripplied due to Tsukiyomi!"
									TGT.TsukiScars=src.Power
						else if(minigame=="Direct Death!!")
							if(TGT.SharinganLevel>=3)
								TGT<<"Your eyes see that [src] is trying to <b>kill</b> your mind?... Better grit those teeth and man up!"
							var/minigame2=alert(TGT, "In the world of Tsukiyomi, time, space and logic matters not. You are stuck in this world, although, you can gamble and try to resist it with all you have... You only have one chance.", "Steel yourself!", "Keep Calm...", "Grit Your Teeth!!", "Huh?")
							if(minigame2=="Grit Your Teeth!!")
								src<<"<font face=verdana><font color=red><i>Failure!<font color=white> They saw that coming, and grit their teeth through their ultimate induced demise, taunting you with a smirk in the end..."
								TGT<<"<font face=verdana><font color=white><i>You grit your teeth, ready to take whatever's thrown at you like a champ...! And it's the fucking moon crashing down against you. You raise your arms and endure it, on your last legs, you throw a fist towards the moon and smirk, before falling back, dead. -- Dead? No. No way in hell you're dying to this shit! Think again, Sharingan user!"
								view(src)<<"<font color=red>[src] holds up their hands to cover their eyes, as blood gushes out of them!"
								src.TotalInjury+=25
								src.TotalFatigue+=25
								SpawnBlood(src)
								SpawnBlood(src)
								SpawnBlood(src)
								SpawnBlood(src)
								src.DiplomaticImmunity=0
								src.Frozen=0
								TGT.DiplomaticImmunity=0
								TGT.Frozen=0
							else
								src<<"<font face=verdana><font color=green><i>Success!<font color=white> You manage to turn [TGT] into nothing but mince meat and ashes in a blink of an eye... There is no way they can recover from that easily."
								TGT<<"<font face=verdana><font color=white><i>...Your mind blanks out. All you see is dark... Suddenly, a shift of colors. You look up and see the fucking moon crashing down towards you. You panic! Torture? Nothing like it! Mindfuck?! Not even close! T-They're trying to kill you! No holding back?!? This... This is just an illusion, right? That's... not real... They-- It's all you can think, before your mind is ultimately erased to primal scraps... ((IC Fluff. My ruling on this is you took an L for not being raw. As per usual, RP Mode On if this was used in combat.))"
								view(src)<<"<font color=red>[src] grunts, as blood drips down softly from their eye in a single tear..."
								TGT<<"[TGT] coughs up blood and falls limp instantly."
								SpawnBlood(src)
								SpawnBBlood(TGT)
								src.DiplomaticImmunity=0
								src.Frozen=0
								TGT.DiplomaticImmunity=0
								TGT.Frozen=0
								TGT.Health=-10
								TGT.TotalFatigue=100
								if(src.Power+src.Force>TGT.Power+TGT.Resistance)
									view(TGT)<<"[TGT] seems to be permanently cripplied due to Tsukiyomi!"
									TGT.TsukiScars=src.Power