var/list/TierSSkillTreeList=list("Sharingan"=list(),"SpiritEnergy"=list(),"Ansatsuken"=list(),"HitenMitsurugi"=list(),"HeroOfAspect"=list(),"KingOfBraves"=list(),"Keyblade"=list(),"DualWield"=list(),"Stand"=list(),"Ripple"=list())
/*proc/MakeTierSSkillTreeList()
	for(var/x in TierSSkillTree)
		for(var/i in TierSSkillTree[x])
			var/obj/TierSSkillTreeObj/B=new
			B.cost=TierSSkillTree[x][i]
			var/namez=i
			if(copytext("[i]",1,2)=="/")
				var/path=text2path("[i]")
				var/obj/nameref=new path
				namez=nameref.name
				spawn(3)del(nameref)
			B.path=i
			B.name="[namez] ([B.cost])"
			TierSSkillTreeList[x]+=B*/

var/TierSSkillTree=list(\
"Sharingan"=list("Sharingan"=5),\
"SpiritEnergy"=list("SpiritEnergy"=5),\
"Ansatsuken"=list("Ansatsuken"=5),\
"HitenMitsurugi"=list("HitenMitsurugi"=5),\
"HeroOfAspect"=list("HeroOfAspect"=5),\
"KingOfBraves"=list("KingOfBraves"=5),\
"Keyblade"=list("Keyblade"=8),\
"DualWield"=list("DualWield"=5),\
"Stand"=list("Stand"=5),\
"Ripple"=list("Ripple"=5)
)

/*obj/TierSSkillTreeObj
	var/path
	var/cost
	icon='skilltree.dmi'
	layer=9999
	Click()
		if(copytext("[src.path]",1,2)!="/")
			if(src.path=="Sharingan")
				if(TierSLockOut.Find("Sharingan"))
					usr<<"The Sharingan has been locked out. No weird red eyes for you."
					return
				if(usr.SharinganUnlocked>=2)
					usr<<"You already have the highest level you can attain without admin assistance."
					return
				if(usr.TierSPurchased&&usr.TierSPurchased!="Sharingan")
					usr<<"You already possess a Tier S and cannot buy another!"
					return
				if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					if(!locate(/obj/Skills/Buffs/Sharingan, usr.contents))
						usr.contents+=new/obj/Skills/Buffs/Sharingan
						usr.TierSPurchased="Sharingan"
						usr<<"You've unlocked [src.path]."
					else
						usr.SharinganUnlocked++
						usr<<"You've unlocked the next level of [src.path]."
					usr.SpendableDevPoints-=src.cost

			if(src.path=="SpiritEnergy")
				if(TierSLockOut.Find("SpiritEnergy"))
					usr<<"Spirit Energy has been locked out. No drawing upon spiritual power allowed."
					return
				if(usr.SpiritLevel>=2)
					usr<<"You already have the highest level you can attain without admin assistance."
					return
				if(usr.TierSPurchased&&usr.TierSPurchased!="SpiritEnergy")
					usr<<"You already possess a Tier S and cannot buy another!"
					return
				if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					if(!locate(/obj/Skills/Buffs/SpiritEnergy, usr.contents))
						usr.contents+=new/obj/Skills/Buffs/SpiritEnergy
						usr.TierSPurchased="SpiritEnergy"
						usr<<"You've unlocked [src.path]."
					else
						usr.SpiritLevel++
						usr<<"You've unlocked the next level of [src.path]."
					if(usr.SpiritLevel<1)
						usr.SpendableDevPoints-=src.cost
					else
						usr.SpendableDevPoints-=(src.cost-1)

			if(src.path=="Ansatsuken")
				if(TierSLockOut.Find("Ansatsuken"))
					usr<<"The Ansatsuken has been locked out. The power of the Assassin's Fist is not yours to have."
					return
				if(usr.AnsatsukenMod>=3)
					usr<<"You already have the highest level you can attain without admin assistance."
					return
				if(usr.TierSPurchased&&usr.TierSPurchased!="Ansatsuken")
					usr<<"You already possess a Tier S and cannot buy another!"
					return
				if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					if(!locate(/obj/Skills/Buffs/Ansatsuken, usr.contents))
						usr.contents+=new/obj/Skills/Buffs/Ansatsuken
						usr.TierSPurchased="Ansatsuken"
						usr<<"You've unlocked [src.path]. Be sure to use it before purchasing the next tier."
						usr.AnsatsukenMod++
					else
						usr.AnsatsukenMod++
						usr<<"You've unlocked the next level of [src.path]."
					if(usr.AnsatsukenMod<1)
						usr.SpendableDevPoints-=src.cost
					else
						usr.SpendableDevPoints-=(src.cost-1)

			if(src.path=="HitenMitsurugi")
				if(TierSLockOut.Find("HitenMitsurugi"))
					usr<<"Hiten Mitsurugi has been locked out. Rapid sword skills are...something."
					return
				if(usr.AnsatsukenMod>=2)
					usr<<"You already have the highest level you can attain without admin assistance."
					return
				if(usr.TierSPurchased&&usr.TierSPurchased!="HitenMitsurugi")
					usr<<"You already possess a Tier S and cannot buy another!"
					return
				if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					if(!locate(/obj/Skills/Swords/HitenMitsurugi, usr.contents))
						usr.contents+=new/obj/Skills/Swords/HitenMitsurugi
						usr.TierSPurchased="HitenMitsurugi"
						usr<<"You've unlocked [src.path]. Be sure to use it before purchasing the next tier."
					else
						usr.HitenMitsurugi++
						usr<<"You've unlocked the next level of [src.path]."
					usr.SpendableDevPoints-=src.cost

			if(src.path=="HeroOfAspect")
				if(TierSLockOut.Find("HeroOfAspect"))
					usr<<"Hero of Aspect has been locked out. Random powers are strange..."
					return
				if(usr.HeroLevel>=2)
					usr<<"You already have the highest level you can attain without admin assistance."
					return
				if(usr.TierSPurchased&&usr.TierSPurchased!="HeroOfAspect")
					usr<<"You already possess a Tier S and cannot buy another!"
					return
				if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					if(!locate(/obj/Skills/Buffs/HeroOfAspect, usr.contents))
						usr.HeroTitle=pick("Maid","Page","Mage","Knight","Rogue","Sylph","Seer","Thief","Heir","Bard","Prince","Witch")
						usr.AspectTitle=pick("Time","Breath","Doom","Blood","Heart","Space","Mind","Light","Void","Rage","Hope","Life")
						usr.contents+=new/obj/Skills/Buffs/HeroOfAspect
						usr.TierSPurchased="HeroOfAspect"
						usr<<"You've unlocked [src.path]. Be sure to use it before purchasing the next tier."
					else
						usr.HeroLevel++
						usr<<"You've unlocked the next level of [src.path]."
					usr.SpendableDevPoints-=src.cost

			if(src.path=="KingOfBraves")
				if(TierSLockOut.Find("KingOfBraves"))
					usr<<"King of Braves has been locked out. The power of courage is unavailable!"
					return
				if(usr.BraveLevel>=2)
					usr<<"You already have the highest level you can attain without admin assistance."
					return
				if(usr.TierSPurchased&&usr.TierSPurchased!="KingOfBraves")
					usr<<"You already possess a Tier S and cannot buy another!"
					return
				if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					if(!locate(/obj/Skills/Buffs/KingofBraves, usr.contents))
						usr.contents+=new/obj/Skills/Buffs/KingofBraves
						usr.TierSPurchased="KingOfBraves"
						usr<<"You've unlocked [src.path]."
					else
						usr.BraveLevel++
						usr<<"You've unlocked the next level of [src.path]."
					usr.SpendableDevPoints-=src.cost

			if(src.path=="Keyblade")
				if(TierSLockOut.Find("Keyblade"))
					usr<<"Keyblade has been locked out. No being Sora or Riku or that other person allowed."
					return
				if(usr.KeybladeLevel>=1)
					usr<<"You already have the highest level you can attain without admin assistance."
					return
				if(usr.TierSPurchased&&usr.TierSPurchased!="Keyblade")
					usr<<"You already possess a Tier S and cannot buy another!"
					return
				if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					if(!locate(/obj/Skills/Keyblade/ManifestKeyblade, usr.contents))
						usr.contents+=new/obj/Skills/Keyblade/ManifestKeyblade
						usr.TierSPurchased="Keyblade"
						usr<<"You've unlocked [src.path]. This has also given you a free sword; please equip it -before- using Manifest Keyblade."
						usr.contents+=new/obj/Items/Sword
						usr.KeybladeWielder=1
					else
						usr.KeybladeLevel++
						usr<<"You've unlocked the next level of [src.path]."
					if(usr.KeybladeLevel<1)
						usr.SpendableDevPoints-=src.cost
					else
						usr.SpendableDevPoints-=(src.cost-2)

			if(src.path=="Stand")
				if(TierSLockOut.Find("Stand"))
					usr<<"Stand User has been locked out. No summoning your fighting spirit!"
					return
				if(usr.StandLevel>=2)
					usr<<"You already have the highest level you can attain without admin assistance."
					return
				if(usr.TierSPurchased&&usr.TierSPurchased!="Stand")
					usr<<"You already possess a Tier S and cannot buy another!"
					return
				if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					if(!locate(/obj/Skills/Buffs/StandCustom, usr.contents))
						usr.contents+=new/obj/Skills/Buffs/StandCustom
						usr.TierSPurchased="Stand"
						usr<<"You've unlocked [src.path]."
						usr.StandLevel=0
					else
						usr.StandLevel++
						usr<<"You've unlocked the next level of [src.path]."
					usr.SpendableDevPoints-=src.cost

			if(src.path=="Ripple")
				if(TierSLockOut.Find("Ripple"))
					usr<<"Ripple User has been locked out. No breathing oddly allowed!"
					return
				if(usr.RippleMod>=2)
					usr<<"You already have the highest level you can attain without admin assistance."
					return
				if(usr.TierSPurchased&&usr.TierSPurchased!="Ripple")
					usr<<"You already possess a Tier S and cannot buy another!"
					return
				if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					if(!locate(/obj/Skills/RefineRipple, usr.contents))
						usr.contents+=new/obj/Skills/RefineRipple
						usr.TierSPurchased="Ripple"
						usr<<"You've unlocked [src.path]. Be sure to use Refine Ripple before purchasing the next tier."
					else
						usr.RippleMod++
						usr<<"You've unlocked the next level of [src.path]."
					if(usr.RippleMod<1)
						usr.SpendableDevPoints-=src.cost
					else
						usr.SpendableDevPoints-=(src.cost-1)

		else
			var/path=text2path("[src.path]")
			var/obj/s=new path

			if(locate(s,usr.contents))
				usr<< "You already know this skill!"
				del(s)
				return
			if(usr.SpendableDevPoints<src.cost)
				usr<<"You don't have enough Dev Points to purchase this skill!"
				del(s)
				return
			if(usr.SpendableDevPoints>=src.cost)
				usr.contents+=s
				usr.SpendableDevPoints-=src.cost
				usr<<"You bought [s] for [src.cost] Dev Points!"
		..()*/


//mob/Players/verb
/*TierSSkillTree()
		set category="Other"
		winshow(usr,"tierstree",1)
	tiersskilltreez(var/z as text)
		set hidden=1//interface verb doesnt needa be found out
		winset(usr,"tiersskilltreegrid","cells=0x0")//clears grid
		usr<<output("Tier S Tree (Dev Points: [usr.SpendableDevPoints]","TierSRewardPoints")
		sleep(1)
		var/p=1//used as a positioning locator for rows/columns
		for(var/obj/TierSSkillTreeObj/x in TierSSkillTreeList[z])
			if(TierSLockOut.Find(z))
				x.icon_state="NotAvailable"
			else if(!TierSLockOut.Find(z))
				x.icon_state="Available"
			else
				x.icon_state="Unknown"
			//p++
			usr<<output(x,"tiersskilltreegrid:1,[p]")
			if(z=="Sharingan")
				usr<<output("Source: Naruto. Red eyes that are powered by negative emotions and hatred, and usually advance from great loss. A very powerful buff, but doesn't come with any actual -skills- until much later on. Costs (In Dev Points): T1-3:5, T4-5:Moment Required.","tiersinfolabel")
			if(z=="SpiritEnergy")
				usr<<output("Source: Spirit Energy is a type of energy that exists within all, but only some can manifest. At first, it's just a small power boost, but it can eventually take the form of an sword or a gun. Costs (In Dev Points): T1:5,T2-5:4.","tiersinfolabel")
			if(z=="Ansatsuken")
				usr<<output("Source: Street Fighter. Casting away all usage of weapons, the Ansatsuken, or Assassination Fist, is a martial arts style revolving around murdering all you face. Some have adapted it to be far less lethal, while others have fully succumbed to its dark power. Which will you choose? Costs (In Dev Points): T1:5, T2-5:4","tiersinfolabel")
			if(z=="HitenMitsurugi")
				usr<<output("Source: Rurouni Kenshin: A powerful sword style based on speed and reaction. Costs (In Dev Points):T1-3:5, T4:6, T5:Moment Required.","tiersinfolabel")
			if(z=="HeroOfAspect")
				usr<<output("Source: Homestuck. Hero of Aspect is perhaps one of the more complex Tier S available. When you select it, it will randomly assign you a Title or Class, and a Aspect. It repersents who you are, and who you will become. Should the randomization give you something completely unworkable, shoot a admin help. Costs (In Dev Points): T1-3:5, T4:6, T5:Moment Required.","tiersinfolabel")
			if(z=="KingOfBraves")
				usr<<output("Source: GaoGaiGar. King of Braves revolves around drawing power from courage. Be it from within, or focused though a object such as the G-Stone, you'll always be able to grasp victory if you have courage! It's expected and required that you never show fear, or be a coward, with this Tier S. Costs (In Dev Points): T1-3:5, T4:6, T5:Moment Required.","tiersinfolabel")
			if(z=="Keyblade")
				usr<<output("Source: Kingdom Hearts. Keyblades are weapons spawned from one's heart, taking shape based on the darkness, light, or even nothingness held within. These are the most powerful swords you can obtain in-game, hence the large cost. Costs (In Dev Points): T1:8, T2:6, T3:7, T4:Moment Required.","tiersinfolabel")
			if(z=="Stand")
				usr<<output("Source: JoJo's Bizzare Adventure. A Stand is a manifestation of your FIGHTING SPIRIT. It can take many forms...its evolution as it grows is not in your hands. Costs (In Dev Points): T1-3:5, T4:6, T5:Moment Required.","tiersinfolabel")
			if(z=="Ripple")
				usr<<output("Source: JoJo's Bizzare Adventure. The Ripple, also known as Hamon, is a mysterious energy generated by breathing in a specific way. It is the bane of evil and undead everywhere, being the power of the sun. Costs (In Dev Points): T1:5, T2-5:4","tiersinfolabel")
			p++*/