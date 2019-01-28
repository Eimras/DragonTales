var/money_name="Beri"

obj/Money
	Level=0
	icon='ArtificalObj.dmi'
	icon_state="ZenniBag"
	name="Beri"
	var/MoneyCreator
	var/DullOre=0
	var/ShimmeringOre=0
	var/RhapsodicOre=0
	var/Coal=0
	var/Bronze=0
	var/Iron=0
	var/Steel=0
	var/Gold=0
	var/Obsidian=0
	var/Refractor=0
	var/Klangite=0
	var/Drakium=0
	var/Chimerite=0
	var/ApexCrystal=0
	var/Mythril=0

	Savable=1
	Stealable=1
	Spirited=0
	New()
		Update()
		..()

	Click()
		if(src in usr)
			var/Amount=input("Drop how much money?") as num
			Amount=round(Amount)
			if(Amount>Level) Amount=Level
			if(Amount<1) return
			var/obj/Money/M=new(get_step(usr,usr.dir))
			M.Level=Amount
			M.icon=src.icon
			M.icon_state=src.icon_state
			M.name="[Commas(Amount)] Resources"
			M.MoneyCreator=usr.key
			Level-=Amount

	proc
		Update()
			name = money_name
			return


obj
	Click()
		if(!(src in usr))
			if(istype(src.loc,/mob))
				var/mob/Q=src.loc
				if(Q.KO||istype(Q,/mob/Body))
					if(src.Stealable)
						if(istype(src,/obj/Money))
							for(var/obj/Money/X in usr)
								X.Level+=src.Level
							src.Level=0
							oview(10,usr)<<"[usr] stole [src] from [Q]"
						if(src.Spirited)
							usr.OMessage(30,"[Q] resists [usr], even unconscious, refusing to part with [src]!","")
							return
						else
							if(usr.RippleMod&&src.type==/obj/Items/Enchantment/Staff)
								src << "You can't equip staves as a Ripple user."
								return
							if(src.suffix=="Equipped")
								src.Equip(Q)
								spawn(5) src.suffix=null
							src.loc=usr.contents
							oview(10,usr)<<"[usr] stole [src] from [Q]"
		..()



obj/proc/Equip(mob/A,var/show=1)
	if(suffix)
		suffix=null
		A.overlays-=icon//image(icon,pixel_x=src.pixel_x,pixel_y=src.pixel_y)
	else
		suffix="Equipped"
		if(show)
			A.overlays+=icon//image(src.icon,pixel_x=src.pixel_x,pixel_y=src.pixel_y)

obj/proc/AlignEquip(mob/A,var/show=1)
	if(suffix)
		suffix=null
		A.overlays-=image(icon,pixel_x=pixel_x,pixel_y=pixel_y)
	else
		suffix="Equipped"
		if(show)
			A.overlays+=image(icon,pixel_x=pixel_x,pixel_y=pixel_y)

obj/proc/ObjectUse() if(src in usr)
	if(istype(src,/obj/Items/Senzu)) src:Senzu_Eat()
	if(istype(src,/obj/Items/Enchantment/Devil_Fruit)) src:Devil_Raping()
	if(istype(src,/obj/Items/Enchantment/Might_Fruit)) src:Might_Nomming()
	if(istype(src,/obj/Items/Enchantment/Half_Might_Fruit)) src:Half_Might_Nomming()
	if(istype(src,/obj/Items/Enchantment/Quarter_Might_Fruit)) src:Quarter_Might_Nomming()
	if(istype(src,/obj/Items/Enchantment/Potions/Antidote))
		src:Anti_Drink()
	if(istype(src,/obj/Items/Enchantment/BuffPotions))
		if(usr.BuffPotion>0)
			usr<<"You can't drink another one right now!"
			return
		if(usr.PotionCD)
			usr<<"You can't drink another one right now!"
			return
		usr.BuffPotion=90
		usr.PotionCD=180
		spawn()usr.BuffPotionTimer()
		spawn()src:Buff_Drink()


	if(istype(src,/obj/Items/Enchantment/Potions/HealingPotion))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		usr.PotionCD=10
		src:PoH_Drink()
	if(istype(src,/obj/Items/Enchantment/Potions/ManaPotion))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		usr.PotionCD=10
		src:PoM_Drink()
	if(istype(src,/obj/Items/Enchantment/Potions/EnergyPotion))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		usr.PotionCD=10
		src:PoE_Drink()
	if(istype(src,/obj/Items/Enchantment/Potions/HiPotion))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		usr.PotionCD=10
		src:PoH_Drink()
	if(istype(src,/obj/Items/Enchantment/Potions/Ether))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		usr.PotionCD=10
		src:PoE_Drink()
	if(istype(src,/obj/Items/Enchantment/Potions/Elixer))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		usr.PotionCD=10
		src:PoM_Drink()
	if(istype(src,/obj/Items/Enchantment/ButchDrink))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		var/warning=input(usr,"This looks dangerous! Proceed?") in list ("Yes","No")
		switch(warning)
			if("Yes")
				usr.PotionCD=10
				src:Butch_Drink()
			if("No")
				return
	if(istype(src,/obj/Items/Enchantment/ElixerOfKnowledge))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		var/warning=input(usr,"This looks dangerous! Proceed?") in list ("Yes","No")
		switch(warning)
			if("Yes")
				usr.PotionCD=10
				src:EoK_Drink()
			if("No")
				return
	if(istype(src,/obj/Items/Enchantment/ElixerOfYouth))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		var/warning=input(usr,"This could be dangerous! Proceed?") in list ("Yes","No")
		switch(warning)
			if("Yes")
				usr.PotionCD=10
				src:EoY_Drink()
			if("No")
				return
	if(istype(src,/obj/Items/Tech/NaniteIntelligenceBooster))
		if(usr.PotionCD>0)
			usr<<"You can't use another potion yet!"
			return
		var/warning=input(usr,"This looks dangerous! Process?") in list ("Yes","No")
		switch(warning)
			if("Yes")
				usr.PotionCD=10
				src:NIB_Drink()
			if("No")
				return
	if(istype(src,/obj/Items/Tech/HeatPack))
		if(usr.TemperatureReducer>0)
			usr<<"You can't use another one yet!"
			return
		usr.TemperatureReducer=300
		usr.TemperatureReduceType="Cold"
		usr<<"You apply the heatpack to yourself. It helps in repeling the cold (if any)!"
		del(src)
	if(istype(src,/obj/Items/Tech/KelotanePill))
		if(usr.TemperatureReducer>0)
			usr<<"You can't use another one yet!"
			return
		usr.TemperatureReducer=300
		usr.TemperatureReduceType="Heat"
		usr<<"You swallow the pill. You feel like you could handle hotter temperatures!"
		del(src)
	if(istype(src,/obj/Items/Enchantment/Potions/FrostPotion))
		if(usr.TemperatureReducer>0)
			usr<<"You can't use another one yet!"
			return
		usr.TemperatureReducer=300
		usr.TemperatureReduceType="Heat"
		usr<<"You drink the potion. You feel much cooler now!"
		var/obj/Items/Enchantment/Potions/FrostPotion/A=src
		A.PotionsRemaining--
		A.suffix="[Commas(A.PotionsRemaining)]"
		if(A.PotionsRemaining==0)
			del(src)
	if(istype(src,/obj/Items/Enchantment/Potions/FlamePotion))
		if(usr.TemperatureReducer>0)
			usr<<"You can't use another one yet!"
			return
		usr.TemperatureReducer=300
		usr.TemperatureReduceType="Cold"
		usr<<"You drink the potion. You feel much hotter now!"
		var/obj/Items/Enchantment/Potions/FrostPotion/A=src
		A.PotionsRemaining--
		A.suffix="[Commas(A.PotionsRemaining)]"
		if(A.PotionsRemaining==0)
			del(src)
	if(istype(src,/obj/Items/Wearables)) Equip(usr)
	if(istype(src,/obj/Items/AlignWearable)) AlignEquip(usr)
	if(istype(src,/obj/Items/Weights))
		var/numz=0
		var/weight=0
		for(var/obj/Items/Weights/M in usr.contents)
			if(M.suffix&&M!=src)
				numz++
				weight+=M.Level
		if(numz>2)
			usr<<"You cannot wear more than 3 weights."
			return
		var/lawl=weight+Level
		if(lawl>usr.WeightFormula(2))
			usr<<"Too heavy! Max weight is [Commas(usr.WeightFormula(2))]"
			return
		usr<<"Max weight is [Commas(usr.WeightFormula(2))]."
		Equip(usr)
	if(istype(src,/obj/Items/Enchantment/ArcanicEye))
		Equip(usr)
	if(istype(src,/obj/Items/Enchantment/ArcanicEar))
		Equip(usr)
	if(istype(src,/obj/Items/Enchantment/ArcanicTongue))
		Equip(usr)
	if(istype(src,/obj/Items/Enchantment/Staff))
		for(var/obj/Items/Enchantment/Staff/S in usr)
			if(S.suffix&&S!=src)
				usr<<"You already have a weapon equipped"
				return
		Equip(usr)
	if(istype(src,/obj/Items/BambooStaff))
		for(var/obj/Items/BambooStaff/S in usr)
			if(S.suffix&&S!=src)
				usr<<"You already have a weapon equipped. (DEBUG:Staff)"
				return
		Equip(usr)
	if(istype(src,/obj/Items/Dagger))
		for(var/obj/Items/Dagger/S in usr)
			if(S.suffix&&S!=src)
				usr<<"You already have a weapon equipped. (DEBUG:Dagger)"
				return
		Equip(usr)
	if(istype(src,/obj/Items/Sword))
		if(usr.AnsatsukenMod)
			usr << "You cannot equip a sword after embracing the path of Amatsuken."
			return
		for(var/obj/Items/Sword/S in usr)
			if(S.suffix&&S!=src)
				usr<<"You already have a weapon equipped"
				return
			if(usr.StanceActive||usr.AdvancedStanceActive)
				usr<<"You're in a stance!"
				return
		for(var/obj/Items/BuffItem/S in usr) if(S.EquipType=="Sword" && S.suffix)
			usr<<"You already have a weapon equipped"
			return
		for(var/obj/Skills/Buffs/Reinforcement/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Reinforcement active!"
				return
		for(var/obj/Skills/TierS/WeaponSoul/B in usr)
			if(B.BuffUsing)
				usr << "You can't unequip a sword with Weapon Soul active!"
				return
		for(var/obj/Skills/Buffs/Projection/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Projection active!"
				return
		for(var/obj/Skills/Rank/GunKata/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Gun Kata active!"
				return
		/*for(var/obj/Skills/Swords/Excalibur/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Excalibur active!"
				return
		for(var/obj/Skills/Swords/Lightbringer/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Lightbringer active!"
				return
		for(var/obj/Skills/Swords/WeaponMaster/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Weapon Master active!"
				return
		for(var/obj/Skills/Swords/Muramasa/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Muramasa active!"
				return
		for(var/obj/Skills/Swords/Deathbringer/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Deathbringer active!"
				return*/
		for(var/obj/Skills/Swords/BuffGetsu/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Mugetsu active!"
				return
		for(var/obj/Skills/Swords/Bladed_Flurry/B in usr)
			if(B.BuffUsing)
				usr<<"You can't unequip a sword with Bladed Flurry active!"
				return
		/*for(var/obj/Skills/Swords/DualWield/D in usr)
			if(D.BuffUsing)
				usr << "You can't unequip a sword with Dual Wield active!"
				return
		for(var/obj/Skills/Swords/TripleWield/D in usr)
			if(D.BuffUsing)
				usr << "You can't unequip a sword with Tri Wield active!"
				return*/
		for(var/obj/Skills/MartialArts/Activate_Stance/B in usr)
			if(B.BuffUsing)
				usr<<"You can't use a sword with a stance active!"
				return
		for(var/obj/Skills/MartialArts/Activate_Advanced_Stance/B in usr)
			if(B.BuffUsing)
				usr<<"You can't use a sword with a stance active!"
				return
		AlignEquip(usr)
	if(istype(src,/obj/Items/Shield))
		for(var/obj/Items/Shield/S in usr)
			if(S.suffix&&S!=src)
				usr<<"You already have a shield equipped."
				return
		Equip(usr)
	if(istype(src,/obj/Items/Armor))
		for(var/obj/Items/Armor/S in usr)
			if(S.suffix&&S!=src)
				usr<<"You already have armor equipped."
				return
		Equip(usr)
	if(istype(src,/obj/Items/StoneMask))
		for(var/obj/Items/StoneMask/S in usr)
			if(S.suffix&&S!=src)
				usr<<"You already have a Stone Mask equipped."
				return
		Stun(src,amount=2)
		Equip(usr)
	if(istype(src,/obj/Items/Tech/Scouter))
		for(var/obj/Items/Tech/Scouter/S in usr) if(S.suffix&&S!=src)
			usr<<"You already have a Scouter equipped"
			return
		Equip(usr)
	if(istype(src,/obj/Items/Tech/SpaceMask))
		for(var/obj/Items/Tech/SpaceMask/S in usr)
			if(S.suffix&&S!=src)
				usr<<"You already have a Space Mask equipped"
				return
			if(S.Oxygen<=0)
				usr<<"You can't equip a mask if it's out of Oxygen!"
				return
		Equip(usr)
	if(istype(src,/obj/Items/Enchantment/Rings))
		var/ringnumber=0
		for(var/obj/Items/Enchantment/Rings/S in usr) if(S.suffix&&S!=src)
			if(S.suffix&&S!=src)
				ringnumber++
		if(ringnumber>0)
			usr<<"Equiping more then one enchanted would cause the enchantment to cancel out!"
			return
		if(usr.Class in list("Wizard", "Healer", "Envy", "Kitsune", "Kitty","Spiritualist"))
			SorceryEquip(usr)
		else
			usr<<"You lack the magical prowess to utilize a ring."
			return
	if(istype(src,/obj/Items/BuffItem))
		for(var/obj/Items/BuffItem/S in usr) if(S.suffix&&S!=src)
			usr<<"You already have a item that grants a buff equipped."
			return
		BuffEquip(usr)
	if(istype(src,/obj/Items/Tech/EnhanceDigger)||istype(src,/obj/Items/Enchantment/DigEnhancement))
		for(var/obj/Items/Tech/EnhanceDigger/S in usr) if(S.suffix&&S!=src)
			usr<<"You already have a dig enhancement equipped."
			return
		for(var/obj/Items/Enchantment/DigEnhancement/T in usr) if(T.suffix&&T!=src)
			usr<<"You already have a dig enhancement equipped."
			return
		Equip(usr,0)
	if(istype(src,/obj/Items/Ammo)) usr.Reload(src)
	if(istype(src,/obj/Items/NGun)) src:Gun_Fire2()

obj/Items
	Stealable=1
	Savable=1
	Spirited=0
	var/list/Creator=new
	var/CreatorKey
	var/Enchanted=0
	var/EnchantType
	var/PrevX
	var/PrevY
	var/PrevZ
	proc/Drop()
		/*if(istype(src,/obj/Items/Sword))
			var/obj/Items/Sword/s = src
			if(s.SpiritSword)
				if(!src.suffix)
					usr << "Your Spirit Sword is dissipated."
					del s
				else
					usr << "Unequip your Spirit Sword first."
					return*/

		if(istype(src,/obj/Items/Food))
			var/obj/Items/Food/P=new(get_step(usr,usr.dir))
			P.pixel_x+=rand(-8,8)
			P.pixel_y+=rand(-8,8)
		if(istype(src,/obj/Items/Drink))
			var/obj/Items/Drink/D=new(get_step(usr,usr.dir))
			D.pixel_x+=rand(-8,8)
			D.pixel_y+=rand(-8,8)
		if(istype(src,/obj/Items/Senzu))
			spawn()src:Senzu_Grow()
			usr<<"The Senzu starts to grow..."
		if(suffix=="Equipped") Equip(usr)
		if(istype(src,/obj/Items/Enchantment/BuffPotions))
			var/obj/Items/Enchantment/BuffPotions/Z=src
			if(Z.PotionsRemaining>1)
				var/MultiDrop=input("How many potions would you like to drop? Just hit enter to drop one.")as num|null
				if(MultiDrop==null)
					MultiDrop=1
				if(MultiDrop>=Z.PotionsRemaining)
					MultiDrop=Z.PotionsRemaining
				if(Z.PotionType=="Strength")
					if(Z.Cost==50000)
						var/obj/Items/Enchantment/BuffPotions/StrengthPotion/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
					else if(Z.Cost==125000)
						var/obj/Items/Enchantment/BuffPotions/StrengthPotion2/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
				else if(Z.PotionType=="Endurance")
					if(Z.Cost==50000)
						var/obj/Items/Enchantment/BuffPotions/EndurancePotion/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
					else if(Z.Cost==125000)
						var/obj/Items/Enchantment/BuffPotions/EndurancePotion2/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
				else if(Z.PotionType=="Force")
					if(Z.Cost==50000)
						var/obj/Items/Enchantment/BuffPotions/ForcePotion/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
					else if(Z.Cost==125000)
						var/obj/Items/Enchantment/BuffPotions/ForcePotion2/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
				else if(Z.PotionType=="Resistance")
					if(Z.Cost==50000)
						var/obj/Items/Enchantment/BuffPotions/ResistancePotion/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
					else if(Z.Cost==125000)
						var/obj/Items/Enchantment/BuffPotions/ResistancePotion2/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
				else if(Z.PotionType=="Offense")
					if(Z.Cost==50000)
						var/obj/Items/Enchantment/BuffPotions/OffensePotion/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
					else if(Z.Cost==125000)
						var/obj/Items/Enchantment/BuffPotions/OffensePotion2/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
				else if(Z.PotionType=="Defense")
					if(Z.Cost==50000)
						var/obj/Items/Enchantment/BuffPotions/DefensePotion/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
					else if(Z.Cost==125000)
						var/obj/Items/Enchantment/BuffPotions/DefensePotion2/A=new(get_step(usr,usr.dir))
						A.icon=src.icon
						A.icon_state=src.icon_state
						A.name=src.name
						A.PotionsRemaining=MultiDrop
						A.suffix="[Commas(A.PotionsRemaining)]"
				Z.PotionsRemaining-=MultiDrop
				src.suffix="[Commas(Z.PotionsRemaining)]"
				if(Z.PotionsRemaining==0)
					del(src)
			else if(Z.PotionsRemaining==1)
				loc=get_step(usr,usr.dir)
		else if(istype(src,/obj/Items/Enchantment/Potions))
			var/obj/Items/Enchantment/Potions/Z=src
			if(Z.PotionsRemaining>1)
				var/MultiDrop=input("How many potions would you like to drop? Just hit enter to drop one.")as num|null
				if(MultiDrop==null)
					MultiDrop=1
				if(MultiDrop>=Z.PotionsRemaining)
					MultiDrop=Z.PotionsRemaining
				if(istype(src,/obj/Items/Enchantment/Potions/HealingPotion))
					var/obj/Items/Enchantment/Potions/HealingPotion/A=new(get_step(usr,usr.dir))
					A.icon=src.icon
					A.icon_state=src.icon_state
					A.name=src.name
					A.PotionsRemaining=MultiDrop
					A.suffix="[Commas(A.PotionsRemaining)]"
				else if(istype(src,/obj/Items/Enchantment/Potions/EnergyPotion))
					var/obj/Items/Enchantment/Potions/EnergyPotion/A=new(get_step(usr,usr.dir))
					A.icon=src.icon
					A.icon_state=src.icon_state
					A.name=src.name
					A.PotionsRemaining=MultiDrop
					A.suffix="[Commas(A.PotionsRemaining)]"
				else if(istype(src,/obj/Items/Enchantment/Potions/Antidote))
					var/obj/Items/Enchantment/Potions/Antidote/A=new(get_step(usr,usr.dir))
					A.icon=src.icon
					A.icon_state=src.icon_state
					A.name=src.name
					A.PotionsRemaining=MultiDrop
					A.suffix="[Commas(A.PotionsRemaining)]"
				else if(istype(src,/obj/Items/Enchantment/Potions/ManaPotion))
					var/obj/Items/Enchantment/Potions/ManaPotion/A=new(get_step(usr,usr.dir))
					A.icon=src.icon
					A.icon_state=src.icon_state
					A.name=src.name
					A.PotionsRemaining=MultiDrop
					A.suffix="[Commas(A.PotionsRemaining)]"
				else if(istype(src,/obj/Items/Enchantment/Potions/HiPotion))
					var/obj/Items/Enchantment/Potions/HiPotion/A=new(get_step(usr,usr.dir))
					A.icon=src.icon
					A.icon_state=src.icon_state
					A.name=src.name
					A.PotionsRemaining=MultiDrop
					A.suffix="[Commas(A.PotionsRemaining)]"
				else if(istype(src,/obj/Items/Enchantment/Potions/Ether))
					var/obj/Items/Enchantment/Potions/Ether/A=new(get_step(usr,usr.dir))
					A.icon=src.icon
					A.icon_state=src.icon_state
					A.name=src.name
					A.PotionsRemaining=MultiDrop
					A.suffix="[Commas(A.PotionsRemaining)]"
				else if(istype(src,/obj/Items/Enchantment/Potions/Elixer))
					var/obj/Items/Enchantment/Potions/Elixer/A=new(get_step(usr,usr.dir))
					A.icon=src.icon
					A.icon_state=src.icon_state
					A.name=src.name
					A.PotionsRemaining=MultiDrop
					A.suffix="[Commas(A.PotionsRemaining)]"
				else if(istype(src,/obj/Items/Enchantment/Potions/FrostPotion))
					var/obj/Items/Enchantment/Potions/FrostPotion/A=new(get_step(usr,usr.dir))
					A.icon=src.icon
					A.icon_state=src.icon_state
					A.name=src.name
					A.PotionsRemaining=MultiDrop
					A.suffix="[Commas(A.PotionsRemaining)]"
				else if(istype(src,/obj/Items/Enchantment/Potions/FlamePotion))
					var/obj/Items/Enchantment/Potions/FlamePotion/A=new(get_step(usr,usr.dir))
					A.icon=src.icon
					A.icon_state=src.icon_state
					A.name=src.name
					A.PotionsRemaining=MultiDrop
					A.suffix="[Commas(A.PotionsRemaining)]"
				Z.PotionsRemaining-=MultiDrop
				src.suffix="[Commas(Z.PotionsRemaining)]"
				if(Z.PotionsRemaining==0)
					del(src)
			else if(Z.PotionsRemaining==1)
				loc=get_step(usr,usr.dir)
		else
			loc=get_step(usr,usr.dir)
	verb/DropItem()
		set name="Drop Item"
		if(src.suffix&&!istype(src,/obj/Items/NGun)&&!istype(src,/obj/Items/Ammo)&&!istype(src,/obj/Items/Enchantment/BuffPotions)&&!istype(src,/obj/Items/Enchantment/Potions)&&!istype(src,/obj/Items/Tech/TeleportWatch))
			usr<<"You can't drop a equiped item. Take it off first!"
			return
		else
			Drop()
	Click()
		if(src in Technology_List)
			var/heh
			var/list/already=new
			if(Can_Afford_Technology(usr,src))
				if(istype(src,/obj/Items/Tech/SpaceTravel/Ship))
					for(var/obj/Items/Tech/SpaceTravel/Ship/W in world)
						already.Add(W.Password)
					for(var/i=1, i<12, i++)
						if(already.Find(i))
							continue
						else
							heh=i
							break
					if(!heh)
						usr<<"There are too many of them!"
						return
				for(var/obj/Money/M in usr)
					M.Level-=Technology_Price(usr,src)
					usr.UpdateTechnologyWindow()
					if(istype(src,/obj/Items/Tech/SpaceTravel/SpacePod))
						var/obj/Items/Tech/SpaceTravel/SpacePod/Q=new(usr.loc)
						Q.PodID=heh
						Q.CreatorKey=usr.key
					else
						if(istype(src,/obj/Items/Tech/AutoDrill))
							var/autodrillcounter=0
							var/autodrilllimit=(round(usr.IntelligenceLevel/20))+1
							for(var/obj/Items/Tech/AutoDrill/A in world)
								if(A.CreatorKey==usr.key)
									autodrillcounter++
							if(autodrillcounter>autodrilllimit)
								usr<<"You already own too many active Auto Drills. You can't have more."
								return
						var/obj/Items/Q=new type(usr.loc)
						if(heh)
							Q.Password=heh
						Q.CreatorKey=usr.key
					//new type(usr.loc)
				if(istype(src,/obj/Items/Tech/SpaceTravel/SpacePod))
					for(var/obj/Items/Tech/SpaceTravel/SpacePod/W in world)
						if(W.PodIcon==0)
							var/choice=input("What icon would you like for the pod?") in list("Generic","Earth Pod","Alien Pod 1","Alien Pod 2","Alien Pod 3","Alien Pod 4","Namek Pod","Icer Pod","Vegeta Pod")
							switch(choice)
								if("Generic")
									W.PodIcon=1
								if("Earth Pod")
									W.icon='PodEarth.dmi'
									W.PodIcon=1
								if("Alien Pod 1")
									W.icon='PodArconia.dmi'
									W.PodIcon=1
								if("Alien Pod 2")
									W.icon='PodDesert.dmi'
									W.PodIcon=1
								if("Alien Pod 3")
									W.icon='PodJungle.dmi'
									W.PodIcon=1
								if("Alien Pod 4")
									W.icon='PodNewVegeta.dmi'
									W.PodIcon=1
								if("Namek Pod")
									W.icon='PodNamek.dmi'
									W.PodIcon=1
								if("Icer Pod")
									W.icon='PodChangeling.dmi'
									W.PodIcon=1
								if("Vegeta Pod")
									W.icon='PodVegeta.dmi'
									W.PodIcon=1

						already.Add(W.PodID)
					for(var/i=1, i<40, i++)
						if(already.Find(i))
							continue
						else
							heh=i
							break
					if(!heh)
						usr<<"There are too many of them!"
						return
				if(istype(src,/obj/Items/Tech/Scouter))
					for(var/obj/Items/Tech/Scouter/W)
						if(W.ScouterIcon!=1)
							W.ScouterIcon=1
							var/Choice=input("What icon would you like for the scouter?") in list ("Green","Blue","Red","Yellow")
							switch(Choice)
								if("Green")
									W.icon='GreenScouter.dmi'
								if("Blue")
									W.icon='BlueScouter.dmi'
								if("Red")
									W.icon='RedScouter.dmi'
								if("Yellow")
									W.icon='YellowScouter.dmi'
							if(usr.Race=="Tsufurujin")
								W.Lvl+=4
				if(istype(src,/obj/Items/Sword))
					for(var/obj/Items/Sword/W)
						W.SwordPot=0.01
						if(W.SwordIconSelected!=1)
							var/Choice=input("What icon would you like for the sword?") in list ("Long Sword","Basic","Broad","Katana","Two Katanas","Dual Blades","Great","Samurai")
							switch(Choice)
								if("Long Sword")
									W.icon='TechSword.dmi'
									W.SwordIconSelected=1
								if("Basic")
									W.icon='SwordBasic.dmi'
									W.SwordIconSelected=1
								if("Broad")
									W.icon='SwordBroad.dmi'
									W.SwordIconSelected=1
								if("Katana")
									W.icon='SwordKatana.dmi'
									W.SwordIconSelected=1
								if("Two Katanas")
									W.icon='SwordDualKatana.dmi'
									W.SwordIconSelected=1
								if("Dual Blades")
									W.icon='SwordDual.dmi'
									W.SwordIconSelected=1
								if("Great")
									W.icon='SwordGreat.dmi'
									W.SwordIconSelected=1
								if("Samurai")
									W.icon='SwordSamurai.dmi'
									W.SwordIconSelected=1
		else if(src in Enchantments_List)
			if(istype(src,/obj/Items/Enchantment/Cauldron))
				var/autodrillcounter=0
				var/autodrilllimit=(round(usr.EnchantmentLevel/20))+1
				for(var/obj/Items/Enchantment/Cauldron/A in world)
					if(A.CreatorKey==usr.key)
						autodrillcounter++
				if(autodrillcounter>autodrilllimit)
					usr<<"You already own too many active Cauldrons. You can't have more."
					return
			if(istype(src,/obj/Items/Enchantment/BuffPotions))
				var/CauldCheck=0
				for(var/obj/Items/Enchantment/Cauldron/A in view(1,usr))
					CauldCheck=1
				for(var/obj/Items/Enchantment/PotionBrewingStand/B in usr)
					CauldCheck=1
				for(var/obj/Items/Enchantment/PotionBrewingStand/C in view(1,usr))
					CauldCheck=1
				if(CauldCheck==0)
					usr<<"You need to be near a Cauldron or Potion Making Stand to make this!"
					return
			if(Can_Afford_Enchantment(usr,src))
				for(var/obj/Money/M in usr)
					if(istype(src,/obj/Items/Enchantment/BuffPotions))
						var/MultiMake=input("How many potions would you like to make? Just hit enter to make one.")as num|null
						if(MultiMake==null)
							MultiMake=1
						var/MultiCost=Enchantment_Price(usr,src)
						if(M.Level<MultiCost*MultiMake)
							usr<<"You don't have enough resources! You need [Commas(MultiCost*MultiMake)] resources to make [MultiMake] [src]."
							return
						else
							M.Level-=MultiCost*MultiMake
							var/obj/Items/Enchantment/BuffPotions/Q=new type(usr.loc)
							Q.CreatorKey=usr.key
							Q.PotionsRemaining=MultiMake
							Q.suffix="[MultiMake]"
						if(MultiMake>1)
							usr<<"You made [MultiMake] [src]."
					else if(istype(src,/obj/Items/Enchantment/Potions))
						var/MultiMake=input("How many potions would you like to make? Just hit enter to make one.")as num|null
						if(MultiMake==null)
							MultiMake=1
						var/MultiCost=Enchantment_Price(usr,src)
						if(M.Level<MultiCost*MultiMake)
							usr<<"You don't have enough resources! You need [Commas(MultiCost*MultiMake)] resources to make [MultiMake] [src]."
							return
						else
							M.Level-=MultiCost*MultiMake
							var/obj/Items/Enchantment/Potions/Q=new type(usr.loc)
							Q.CreatorKey=usr.key
							Q.PotionsRemaining=MultiMake
							Q.suffix="[MultiMake]"
						if(MultiMake>1)
							usr<<"You made [MultiMake] [src]."
					else
						M.Level-=Enchantment_Price(usr,src)
						var/obj/Items/Q=new type(usr.loc)
						Q.CreatorKey=usr.key
					usr.UpdateTechnologyWindow()
				if(istype(src,/obj/Items/Enchantment/Staff))
					for(var/obj/Items/Enchantment/Staff/X)
						if(X.StaffIconSelected!=1)
							var/Choice=input("What icon would you like for the staff?") in list ("Red","Grey","Brown","Red 2","Green","Cyan","Red 3")
							switch(Choice)
								if("Red")
									X.icon='MageStaff.dmi'
									X.StaffIconSelected=1
								if("Grey")
									X.icon='MageStaff2.dmi'
									X.StaffIconSelected=1
								if("Brown")
									X.icon='MageStaff3.dmi'
									X.StaffIconSelected=1
								if("Red 2")
									X.icon='MageStaff4.dmi'
									X.StaffIconSelected=1
								if("Green")
									X.icon='MageStaff5.dmi'
									X.StaffIconSelected=1
								if("Cyan")
									X.icon='MageStaff6.dmi'
									X.StaffIconSelected=1
								if("Red 3")
									X.icon='MageStaff8.dmi'
									X.StaffIconSelected=1
		else if(src in Clothes_List)
			if(usr.IconClicked==0)
				usr.IconClicked=1
				var/Color=input("Choose color") as color|null
				if(Color) icon+=Color
				usr.IconClicked=0
				var/obj/A=new type
				A.icon=icon
				usr.contents+=A

				icon=initial(icon)
		else
			spawn(5) ObjectUse()
//	DblClick() if(src in usr) Drop()
	Wearables
		Eyes_1 icon='Eyes.dmi'
		Icon_1 icon='Clothes1.dmi'
		Icon_2 icon='Clothes2.dmi'
		Icon_3 icon='Clothes3.dmi'
		Icon_4 icon='Clothes4.dmi'
		Icon_5 icon='Clothes5.dmi'
		Icon_6 icon='Clothes6.dmi'
		Icon_7 icon='Clothes7.dmi'
		Icon_8 icon='Clothes8.dmi'
		Icon_9 icon='Clothes9.dmi'
		Icon_10 icon='Clothes10.dmi'
		Icon_11 icon='Clothes11.dmi'
		Icon_12 icon='Clothes12.dmi'
		Icon_13 icon='Clothes13.dmi'
		Icon_14 icon='Clothes14.dmi'
		Icon_15 icon='Clothes15.dmi'
		Icon_16 icon='Clothes16.dmi'
		Icon_17 icon='Clothes17.dmi'
		Icon_18 icon='Clothes18.dmi'
		Icon_19 icon='Clothes19.dmi'
		Icon_20 icon='Clothes20.dmi'
		Icon_21 icon='Clothes21.dmi'
		Icon_22 icon='Clothes22.dmi'
		Icon_23 icon='Clothes23.dmi'
		Icon_24 icon='Clothes24.dmi'
		Icon_25 icon='Clothes25.dmi'
		Icon_26 icon='Clothes26.dmi'
		Icon_27 icon='Clothes27.dmi'
		Icon_28 icon='Clothes28.dmi'
		Icon_29 icon='Clothes29.dmi'
		Icon_30 icon='Clothes30.dmi'
		Icon_31 icon='Clothes31.dmi'
		Icon_32 icon='Clothes32.dmi'
		Icon_33 icon='Clothes33.dmi'
		Icon_34 icon='Clothes34.dmi'
		Icon_35 icon='Clothes35.dmi'
		Icon_36 icon='Clothes36.dmi'
		Icon_37 icon='Clothes37.dmi'
		Icon_38 icon='Clothes38.dmi'
		Icon_39 icon='Clothes39.dmi'
		Icon_40 icon='Clothes40.dmi'
		Icon_41 icon='Clothes41.dmi'
		Icon_42 icon='Clothes42.dmi'
		Icon_43 icon='Clothes43.dmi'
		Icon_44 icon='Clothes44.dmi'
		Icon_45 icon='Clothes45.dmi'
		Icon_46 icon='Clothes46.dmi'
		Icon_47 icon='Clothes47.dmi'
		Icon_48 icon='Clothes48.dmi'
		Icon_49 icon='Clothes49.dmi'
		Icon_50 icon='Clothes50.dmi'
		Icon_51 icon='Clothes51.dmi'
		Icon_52 icon='Clothes52.dmi'
		Icon_53 icon='Clothes52.dmi'

	AlignWearable
		Align_1 icon='Clothes1.dmi'
	Weights
		desc="Enhancements for training purposes."
	Senzu
		icon='Gardening.dmi'
		icon_state="Senzu"
		desc="You can eat this and it will accelerate regeneration temporarily. You can also throw it to others. \
		You can use it on yourself, or you can use it on an unconscious person by stepping next to them and \
		facing them and using this. You can also split it, which will half its effect but give you two of them. \
		Each senzu is also a seed, so if you drop it on the ground, it will grow into a bigger senzu (Unless it \
		already is a big senzu)."
		Level=4
		New() spawn if(src) Senzu_Grow()
		proc/Senzu_Grow()
			if(Level>=16) return
			while(src)
				if(!src.z)return
				var/Old_Name=name
				if(Level>=16)
					return
				else
					if(Level>=4)
						if(prob(5*Level))
							Level/=2
							Senzu_Name()
							view(src)<<"The [Old_Name] has trouble growing, and reverts back to a [src]."
					else
						Level*=2
						Senzu_Name()
						view(src)<<"The [Old_Name] grows into a [src]!"
				if(Level>=4)
					sleep(5000*Level)
				else
					sleep(4000*Level)
		proc/Senzu_Eat()
			for(var/mob/Players/P in get_step(usr,usr.dir)) if(P.KO)
				view(usr)<<"[usr] gives a [src] to [P]"
				P.Senzu_Heal(Level)
				del(src)
				break
			if(src)
				view(usr)<<"[usr] eats a [src]"
				usr.Senzu_Heal(Level)
				del(src)
		verb/Throw()
			var/list/Choices=new
			Choices+="Cancel"
			for(var/mob/Players/P in oview(10,usr)) Choices+=P
			var/mob/Choice=input("Throw to who?") in Choices
			if(Choice=="Cancel") return
			var/obj/S=new
			S.icon='Gardening.dmi'
			S.icon_state="Senzu"
			view(usr)<<"[usr] throws a [src] to [Choice]"
			missile(S,usr,Choice)
			Choice.contents+=src
		verb/Split()
			if(Level>=2)
				var/obj/Items/Senzu/A=new(usr)
				var/obj/Items/Senzu/B=new(usr)
				A.Level=Level*0.5
				B.Level=Level*0.5
				A.Senzu_Name()
				B.Senzu_Name()
				del(src)
			else usr<<"You cannot split it any further."
		proc/Senzu_Name() name="Senzu ([Level]x)"

mob/proc/Senzu_Heal(Amount)
	var/Time=Amount
	var/SenzuPower=Amount
	while(Time)
		Time-=1
		Recover("Health",SenzuPower)
		Recover("Injury",SenzuPower)
		Recover("Energy",SenzuPower)
		Recover("Fatigue",SenzuPower)
		sleep(10)

// KOONAI //

obj/Items/Food
	icon='KunaiMod/Icons/foods.dmi'
	icon_state="ingredients"
	desc="Cook this into something that'd be tasty beyond belief! Just don't get too over it or you'll end up burning shit. (Sidenote: You can customize this if you change the icon and rename, after the food's ready, of course.)"
	Level=0
	var/Bite
	var/Ready
	Cost=10000
	verb/EatFood()
		set name ="Eat"
		if(src.Ready==0)
			src<<"It's raw, you can't eat this. Cook into something, boy."
			return
		if(src.Bite>1)
			view(usr)<<"[usr] eats the [src]"
			view(usr)<<sound('KunaiMod/Sounds/eatfood.ogg',volume=25)
			usr<<"DEBUG: [src] bites left are [src.Bite]"
			usr.Food_Heal(Level)
			src.Bite-=1
			sleep(20)
		else if(src.Bite==1)
			del(src)
			view(usr)<<"[usr] finishes eating the [src]"
			view(usr)<<sound('KunaiMod/Sounds/eatfood.ogg',volume=25)
			usr<<"DEBUG: [src] bites left are [src.Bite]"
		if(src.Bite==0)
			usr<<"DEBUG: You could eat this with 0 bites left. Report it please. (Probably due to spam. If it was spam, report it too.)"
			del(src)


	verb/Throw()
		var/list/Choices=new
		Choices+="Cancel"
		for(var/mob/Players/P in view(10,usr)) Choices+=P
		var/mob/Choice=input("Throw to who?") in Choices
		if(Choice=="Cancel") return
		view(usr)<<"[usr] carefully throws over the [src] to [Choice]"
		Choice.contents+=src

	verb/Cook()
		if(Ready==0)
			var/list/Choices=new
			Choices+="Soup"
			Choices+="Ice Cream"
			Choices+="Pancake"
			Choices+="Pizza"
			Choices+="Cookie"
			Choices+="Hamburger"
			Choices+="Big Shak Burguer"
			Choices+="Sausage"
			Choices+="KFC"
			Choices+="Cake"
			Choices+="Cake Slice"
			Choices+="Fudge"
			Choices+="Cancel"
			var/mob/Choice=input("Cook those ingredients into what?") in Choices
			if(Choice=="Cancel") return
			if(Choice=="Soup")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Soup"
				src.name="Soup"
				src.desc="This is a soup of various ingredients. You'll probably love this taste! (Bites left: [src.Bite])"
				src.Level=4
				src.Bite=4
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Ice Cream")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Ice Cream Bowl"
				src.name="Ice Cream Bowl"
				src.desc="This is an Ice Cream. If you like this, you should definitely try DONTE's delicious white cream! (Bites left: [src.Bite])"
				src.Level=3
				src.Bite=3
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Pancake")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Pancake"
				src.name="Pancake"
				src.desc="This is a couple of duhleeshious pancakes. Puns not included in this cake! (Bites left: [src.Bite])"
				src.Level=2
				src.Bite=2
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="KFC")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Chicken"
				src.name="[usr]-fried Chicken"
				src.desc="This is a fried chicken. No fried chicken is equal to another, my man, just by the way it's fried you can figure who cooked it. (Bites left: [src.Bite])"
				src.Level=2
				src.Bite=2
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Cake")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Cake"
				src.name="Big Cake"
				src.desc="A big cake. Always hinted to be a lie, by many. (Bites left: [src.Bite])"
				src.Level=15
				src.Bite=15
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Cake Slice")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Cake Slice"
				src.name="Cake Slice"
				src.desc="A slice of cake. Quarter as fun as the real cake... Might be a quarter lie too! (Bites left: [src.Bite])"
				src.Level=3
				src.Bite=3
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Fudge")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Fudge"
				src.name="Fudge"
				src.desc="Often used as profanity when Kunai's mom is around... ''Ah fudgecakes!'' (Bites left: [src.Bite])"
				src.Level=2
				src.Bite=2
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Cookie")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Actual Cookie"
				src.name="Cookie"
				src.desc="You're a good boy. (Bites left: [src.Bite])"
				src.Level=2
				src.Bite=2
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Hamburger")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Smol Borger"
				src.name="Hamburger"
				src.desc="Buns, cheese, burger, lettuce and possibly szechuan sauce. (Bites left: [src.Bite])"
				src.Level=6
				src.Bite=6
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Big Shak Burguer")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="BBurguer"
				src.name="Big Shak Burguer"
				src.desc="Man, by the moment you finish eating this, your stomach will be like SKRRA, KUH PUH PAH PAH PAH! SKIBDI PAH PAH, ERR KUH PUH PUH PUH PUM! SRYA-- KUH KUH PUH PUH PUM PUM!... PUM PUM! You don't kno' man. And man's not hot. The sauce is raw sauce. No ketchup.<i> Maaaybe ketchup, doe...</i> (Bites left: [src.Bite])"
				src.Level=20
				src.Bite=20
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Sausage")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Corn Dog"
				src.name="Sausage"
				src.desc="<i>Sosig...</i> One of the lewdest foods in existence. (Bites left: [src.Bite])"
				src.Level=4
				src.Bite=4
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Pizza")
				view(usr)<<"[usr] begins working their cooking magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Pizza"
				src.name="Pizza Slice"
				src.desc="The most stylish and delicious food in the shape of a triangle you'll ever see, with molten cheese, and three types of meat for extra grease. Demon Hunters will crave for this every second they're not slashing demons and their halflings! (Bites left: [src.Bite])"
				src.Level=6
				src.Bite=6
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			view(usr)<<"[usr] cooked the ingredients into [Choice]"
			Choice.contents+=src
		else
			usr<<"Dude, you can't cook a cooked food. Just eat it for heck's sake!"
			return

obj/Items/Drink
	icon='KunaiMod/Icons/foods.dmi'
	icon_state="ingredients1"
	desc="Prepare this into something that'd be tasty beyond recognition! Just don't get too over it or you'll end up messing up. (Sidenote: You can customize this if you change the icon and rename, after the drink's ready, of course.)"
	Level=0
	var/Ready
	var/Sip
	Cost=10000
	verb/Drink()
		if(src.Ready==0)
			src<<"Prepare it first, buddy."
			return
		if(src.Sip>1)
			view(usr)<<"[usr] drinks the [src]"
			view(usr)<<sound('KunaiMod/Sounds/drinkfood.ogg',volume=25)
			usr.Food_Heal(Level)
			src.Sip-=1
		if(src.Sip==1)
			view(usr)<<"[usr] finishes drinking the [src]"
			view(usr)<<sound('KunaiMod/Sounds/drinkfood.ogg',volume=25)
			usr.Food_Heal(Level)
			del(src)
		if(src.Sip==0)
			usr<<"DEBUG: You could drink this with 0 sips left. Report it please. (Probably due to spam. If it was spam, report it too.)"
			del(src)

	verb/Throw()
		var/list/Choices=new
		Choices+="Cancel"
		for(var/mob/Players/P in oview(10,usr)) Choices+=P
		var/mob/Choice=input("Throw to who?") in Choices
		if(Choice=="Cancel") return
		view(usr)<<"[usr] fancily throws over the [src] to [Choice]"
		Choice.contents+=src

	verb/Prepare()
		if(Ready==0)
			var/list/Choices=new
			Choices+="Soda"
			Choices+="Beer"
			var/mob/Choice=input("Prepare those ingredients into what?") in Choices
			if(Choice=="Cancel") return
			if(Choice=="Soda")
				view(usr)<<"[usr] begins working their brewing magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Soda"
				src.name="Soda"
				src.desc="This is a very refreshing soda pop. (Sips left: [src.Sip])"
				src.Level=4
				src.Sip=4
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
			if(Choice=="Beer")
				view(usr)<<"[usr] begins working their brewing magic..."
				usr.Frozen=1
				sleep(60)
				src.icon_state="Beer"
				src.name="Beer"
				src.desc="Alcohol always tastes like wasting your life away. (Sips left: [src.Sip])"
				src.Level=4
				src.Sip=4
				src.Ready=1
				view(usr)<<"and... Voilá!"
				usr.Frozen=0
		else
			usr<<"Dude, you can't brew an already prepared drink. Just down it for heck's sake!"
			return

mob/proc/Food_Heal(Amount)
	var/Time=Amount
	var/FoodPower=Amount
	while(Time)
		Time-=1
		Recover("Energy",FoodPower)
		Recover("Fatigue",FoodPower)
		sleep(10)

/obj/Items/SelfFultonBalloon
	icon='KunaiMod/Icons/fultonrecov2.dmi'
	desc="A cardboard box with a single fulton balloon. Attach it on yourself and lift midair."
	verb/Attach()
		usr.Fulton=1
		usr.Frozen=1
		usr.Flying=1
		usr.Using=1
		spawn(30)
		Create_Shadow(usr) // Creates a shadow to give the appearance of floating above ground
		Flight(usr) // Handles shadow's opacity; makes player bob up and down while flying
		del(src)

obj/Items/FultonBalloon
	icon='KunaiMod/Icons/fultonrecov2.dmi'
	desc="A cardboard box with a single fulton balloon. Attach it on someone incapacitated, restrained or wrecked to lift them midair."
	verb/Attach()
		var/list/Choices=new
		Choices+="Cancel"
		for(var/mob/Players/P in oview(1,usr)) Choices+=P
		var/mob/A=input("Who will you attach the Fulton to?") in Choices
		if(A=="Cancel")return
		if(A.Class=="Boss")
			usr<<"Oh the irony..."
		if(A.Class=="Maid")
			usr<<"What a score!"
		if(A.Stunned||A.Cuffed||A.Meditating||A.Health<=20)
			A.icon_state="KO"
			A.Fulton=1
			A.Flying=1
			A.Frozen=1
			A.Using=1
			spawn(30)
			Create_Shadow(A) // Creates a shadow to give the appearance of floating above ground
			Flight(A) // Handles shadow's opacity; makes player bob up and down while flying
			del(src)
		else
			usr<<"Enemy must be incapacitated, restrained, meditating or wrecked."
			return

/*obj/Items/FultonController
	icon='KunaiMod/Icons/controller.dmi'
	verb/Use()
		var/list/destination=list("Cancel")
		for(var/Items/FultonBeacon/D in world)
			destination.Add(D)
		var/mob/Choice=input("Send your fultons to which Beacon?")in destination
		if(Choice=="Cancel")return
		if(Choice)
			for(var/mob/Y in world)
				if(Y.Fulton==1)
					Y.loc=Choice.loc
					usr<<"[Y] gets fulton'd away to [Choice]!"
					spawn(30)
					Y.overlays-=image('KunaiMod/Icons/fultonrecov.dmi',pixel_y=32)
					Y.Fulton=0
					Y.Frozen=0
					Y.Using=0
					Flight(Y)*/


/*obj/Items/DeathNote
	Health=69
	desc="Keikaku doori..."
	icon='KunaiMod/Icons/deathnote.dmi'
	verb/Write()
	verb/RememberFace()
	verb/EatPotatoChip*/


obj/Items/Jukebox
	Health=999999999999999999999999999
	desc="A neat, polished and very stylish jukebox for you to start some noise! (It costs 25'000 resources per use, the song will keep playing for everyone in view. (probably!)) <i><font color='red'>Shoutout for Remillia Nightmare, the author of this icon! Thank 'em a lot!</i>"
	Grabbable=0
	icon='KunaiMod/Icons/jukebox.dmi'
	icon_state="off"
	density=1
	var/ison=0
	var/BoxedMoney=0
	var/OwnerSet=0
	var/OwnerWho
	var/BrandNew=1
	verb/TurnOn()
		set src in view(1)
		set name = "Turn On"
		if(src.ison==1)
			usr<<"Turn it off first!"
			return
		for(var/obj/Money/Q in usr)
			if(Q.Level<25000&&OwnerWho!=usr.key)
				usr<<"You don't have enough money for a song, headass. 25'000$ or quit!"
				return
			else
				Q.Level-=25000
				src.BoxedMoney+=25000
				src.ison=1
				var/musiccount=0
				var/volumez=input("Input the Volume! (5% to 75%)") as num
				if(volumez>100)
					volumez=100
				else if(volumez<20)
					volumez=20
				var/rangez=input("Input the hearing range! (5 to 35 squares)") as num
				if(rangez>35)
					rangez=35
				else if(rangez<5)
					rangez=5
				var/musicfile=input(usr,"Pick a song! MIDI or OGGs under 2MB only! Cost: 25000$","Soooooooong")as sound
				if(length(musicfile) > 2084000)
					usr<<"T-That's too big, thick and delicious, onii-chan!~ You'll make me choke on it!~"
					return
				for(var/mob/Players/P in view(rangez,usr))
					if(P.MusicToggle=="On")
						P << sound(musicfile, repeat = 1, wait = 0, channel = 777, volume = volumez)
						musiccount++
					else
						continue
				usr<<"Successfully played your song for [musiccount] players near you."
				view(src)<<"<font face='verdana'><font color='green'>The Jukebox fancily juke-beeps into life and starts playing a song, thanks to [usr]! <i>([musicfile])</i>"
				src.icon_state="on"
	verb/TurnOff()
		set src in view(1)
		set name="Turn Off"
		var/whocount=0
		for(var/mob/Players/P in view(40,usr))
			P << sound(null, repeat = 0, wait = 0, channel = 777, volume = 70)
			whocount++
		usr<<"Successfully stopped for [whocount] players near you."
		view(src)<<"<font face='verdana'><font color='red'>The Jukebox stops playing a song, as [usr] turns it off!"
		src.icon_state="off"
		src.ison=0
	verb/Manage()
		set src in view(1)
		set name = "Tamper with Jukebox"
		if(src.ison)
			usr<<"Turn it off first!"
			return
		if(src.OwnerWho!=usr.key&&BrandNew==0)
			usr<<"You're not the owner. Slip out, nigga."
		else
			var/jukeboxmanage=input("What exactly are you going to do with this?") in list("Withdraw Money","Unpack","Set Owner")
			switch(jukeboxmanage)
				if("Withdraw Money")
					if(src.BoxedMoney==0)
						usr<<"Nope, sadly this is empty."
						return
					else
						usr<<"Ka-Chim! You've just scored [BoxedMoney]$ of raw dough with this baby!"
						for(var/obj/Money/Q in usr)
							Q.Level+=BoxedMoney
	/*				if("Fix Jukebox")
						if(src.IsBroken==0)
							usr<<"Nothing to fix here, boss!"
						else
							*/
				if("Unpack")
					if(src.ison)
						usr<<"Turn it off first!"
						return
					else
						usr.contents+=new/obj/Items/Jukebox
						usr<<"You remove the Jukebox from the ground."
						del(src)
				if("Set Owner")
					if(OwnerSet!=1)
						OwnerWho=usr.key
						src.BrandNew=0
						return
					else
						usr<<"Owner's already been set, and can only be reset by an admin. ([OwnerWho] is the current owner.)"


/*
obj/Items/Jukebox_2.0_electric_boogaloo
	Health=99999999999999999999999
	desc="A SOON TO BE neat, polished and very stylish jukebox for you to start some noise! (It costs 25'000 resources per use, the song will keep playing for everyone in view. (probably!)) <i><font color='red'>Shoutout for Remillia Nightmare, the author of this icon! Thank 'em a lot!</i>"
	Grabbable=0
	icon='KunaiMod/Icons/jukebox.dmi'
	icon_state="off"
	density=1
	var/ison2=0
	var/rangez2=5
	verb/TurnOn()
		set src in view(1)
		for(var/obj/Money/Q in usr)
			if(Q.Level<25000)
				usr<<"You don't have enough money for a song, headass."
				return
			else
				var/musiccount=0
//				var/repeatz=0
//				var/list/Choices=new
//				var/list/Choice=input("Will the song repeat?") in Choices
//				Choices+="Yes"
//				Choices+="No"
//				if(Choice=="Yes")
//					repeatz=1
//				else if(Choice=="No")
//					repeatz=0
				var/volumez=input("Input the Volume!") in list ("Max","Medium","Low")
				switch(volumez)
				if(volumez=="Max")
					volumez=100
				else if(volumez=="Medium")
					volumez=50
				else if(volumez=="Low")
					volumez=25
				var/rangez=input("Input the hearing range! (12 to 40 squares)") as num
				if(rangez>40)
					rangez=40
				if(rangez<12)
					rangez=12
				var/musicfile=input(usr,"Pick a song! MIDI or OGGs under 2.5MB only! Cost: 25000$","Soooooooong")as sound
				if(length(musicfile) > 2024000)
					usr<<"T-That's too big, thick and delicious, onii-chan!~ You'll make me choke on it!~"
					return
				src.ison=1
				for(var/mob/Players/P in view(rangez,src))
					if(P.MusicToggle=="On")
//						P << sound(musicfile, repeat = repeatz, wait = 0, channel = 777, volume = volumez)
						musiccount++
						while(src.ison==1)
							for(var/mob/Players/P in view(rangez,src))
								if(P.MusicToggle=="On")
									P << sound(musicfile, repeat = 0, wait = 1, channel = 777, volume = volumez)
									sleep(30)
									P<<"You're listening to music, ye."
								else
									continue
					else
						continue
				usr<<"Successfully played your song for [musiccount] people near you!"
				view(src)<<"<font face='verdana'><font color='green'>The Jukebox fancily juke-beeps into life and starts playing a song, thanks to [usr]!"
				src.icon_state="on"
				src<<"DEBUG: Won't cost money for now, debug purposes!"
				//Q.Level-=25000
	verb/TurnOff()
		set src in view(1)
		var/whocount=0
		for(var/mob/Players/P in view(40,usr))
			P << sound(null, repeat = 0, wait = 0, channel = 777, volume = 70)
			whocount++
		usr<<"Successfully stopped for [whocount] players near you."
		view(src)<<"<font face='verdana'><font color='red'>The Jukebox stops playing a song, as [usr] turns it off!"
		src.icon_state="off"
		src.ison=0
	verb/Unmount()
		set src in view(1)
		if(src.ison)
			usr<<"Turn it off first!"
			return
		else
			usr.contents+=new/obj/Items/Jukebox
			usr<<"You remove the Jukebox from the ground."
			del(src)*/

obj/Items/FultonBeacon
	Health=99999999999999999999999
	desc="Drop on the ground to deploy a beacon to receive your Fulton'd units!"
	Grabbable=0
	icon='Tech.dmi'
	icon_state="beaconon"
	verb/Unmount()
		set src in view(1)
		usr.contents+=new/obj/Items/FultonBeacon
		usr<<"You remove the beacon."
		del(src)
	verb/ClaimFulton()
		set src in view(1)
		usr.contents+=new/obj/Items/FultonBalloon
		usr<<"You extract a Fulton cardboard box from the beacon."


obj/Items/Handcuffs
	icon='KunaiMod/Icons/cuffs.dmi'
	desc="Use those for either subdue criminal scumbags or indulge Alaina's fetishes."
	Level=1
	Cost=1000000
	verb/Restrain()
		var/list/Choices=new
		Choices+="Cancel"
		for(var/mob/Players/P in oview(1,usr)) Choices+=P
		var/mob/Choice=input("Who will you restrain?") in Choices
		if(Choice=="Cancel") return
		if(Choice.Cuffed)
			usr<<"They're already restrained."
			return
		if(Choice.icon_state=="KO"||Choice.icon_state=="Meditate"||Choice.Health<=10)
			for(var/mob/P in oview(10,usr))
				P<<sound('KunaiMod/Sounds/cuff.ogg')
			view(usr)<<"[usr] nimbly slaps [Choice]'s wrists with [src]!"
			Choice.Cuffed=1
			Choice.Handcuffed=1
			del(src)
		else
			src<<"[Choice] is not worn out, knocked out or meditating."

obj/Items/Cablecuffs
	icon='KunaiMod/Icons/cablecuffs.dmi'
	Cost=100000
	desc="Use those for either subdue criminal scumbags or indulge Alaina's fetishes... In a ghetto, not-so-safe way."
	verb/Restrain()
		var/list/Choices=new
		Choices+="Cancel"
		for(var/mob/Players/P in oview(1,usr)) Choices+=P
		var/mob/Choice=input("Who will you restrain?") in Choices
		if(Choice=="Cancel") return
		if(Choice.Cuffed)
			usr<<"They're already restrained."
			return
		if(Choice.icon_state=="KO"||Choice.icon_state=="Meditate"||Choice.Health<=10)
			for(var/mob/P in oview(10,usr))
				P<<sound('KunaiMod/Sounds/cablecuff.ogg')
			view(usr)<<"[usr] wraps and restrains [Choice]'s wrists with [src]!"
			Choice.Cuffed=1
			Choice.Cablecuffed=1
			del(src)
		else
			usr<<"[Choice] is not worn out, knocked out or meditating."
			return

obj/Items/Wirecutters
	icon='KunaiMod/Icons/wirecutters.dmi'
	Cost=10000
	verb/CutRestrain()
		var/list/Choices=new
		Choices+="Cancel"
		for(var/mob/Players/P in oview(1,usr)) Choices+=P
		var/mob/Choice=input("Who will you remove their restrains?") in Choices
		if(Choice=="Cancel") return
		if(Choice.Cuffed&&Choice.Handcuffed)
			usr<<"You wish."
			return
		if(Choice.Cuffed&&Choice.Cablecuffed)
			for(var/mob/Players/P in oview(10,usr))
				P<<sound('KunaiMod/Sounds/cuff.ogg')
			view(usr)<<"[usr] releases [Choice] from their cable restrains."
			Choice.Cuffed=0
			Choice.Cablecuffed=0
			view(usr)<<"[usr]'s [src] breaks apart for some reason."
			del(src)
		else
			usr<<"They're not restrained."
			return

obj/Items/HandcuffKeycard
	icon='KunaiMod/Icons/keys.dmi'
	Cost=6000000
	verb/Release()
		var/list/Choices=new
		Choices+="Cancel"
		for(var/mob/Players/P in oview(1,usr)) Choices+=P
		var/mob/Choice=input("Who will you remove their restrains?") in Choices
		if(Choice=="Cancel") return
		if(Choice.Cuffed&&Choice.Cablecuffed)
			usr<<"Try a wirecutter on them, or wait for them to break free anyway."
			return
		if(Choice.Cuffed&&Choice.Handcuffed)
			for(var/mob/Players/P in oview(10,usr))
				P<<sound('KunaiMod/Sounds/interference.ogg', volume=50)
			sleep(10)
			for(var/mob/Players/P in oview(10,usr))
				P<<sound('KunaiMod/Sounds/cuff.ogg')
			view(usr)<<"[usr] releases [Choice] from their handcuffs with their keycard."
			Choice.Cuffed=0
			Choice.Cablecuffed=0
			usr.contents+=new/obj/Items/Handcuffs
		else
			usr<<"They're not restrained."
			return

obj/Items/Ammo
	Level=10
	Cost=100000
	desc="Click this to reload whichever gun you want."
	icon='Guns.dmi'
	icon_state="Ammo 1"
	Stealable=1
	var/Ammo=1000
	var/MaxAmmo=1000
	var/tmp/Reloading
	New() suffix="[Commas(Ammo)]/[Commas(MaxAmmo)]"

obj/Items/NGun
	var/Lvl=1
	var/Points=0
	var/PointsAssigned=0
	var/Ammo=0 //The current amount of ammo in the gun. If this is zero, it cannot be fired.
	var/MaxAmmo=0 //The maximum amount of ammo a gun can possibly hold.
	var/Strength=0 //This is used if the gun is a Projectile Shooter.
	var/StrengthMod=0 //100xMod Strength is added to the gun's Strength per point spent.
	var/Penetration=0 //Penetration ignores a percentage of Endurance.
	var/PenetrationMod=0 //0.2xMod Penetration is added to the gun's Penetration per point spent.
	var/Force=0 //This is used if the gun is a Energy Shooter.
	var/ForceMod=0 //100xMod Force is added to the gun's Force per point spent.
	var/RPenetration=0 //RPenetration ignores a percentage of Resistance.
	var/RPenetrationMod=0 //0.2xMod RPenetration is added per point spent.
	var/Accuracy=0 //The Offense of the gun.
	var/AccuracyMod=0 //1000xMod Accuracy is added per point spent.
	var/Delay=0 //This effects how often the gun can be fired.
	var/Range=0 //How far a projectile can travel in tiles. Unused currently.
	var/ProjectileSpeed=1 //How fast a projectile travels.
	var/Explodes=0 //If the projectile explodes on hit.
	var/Spread=0 //Spread mode uses more bullets but causes a Barrage like bullet formation.
	var/Knockbacks=0 //This will knock a victim back if a bullet connects.
	var/Elemental=0 //This will make the projectiles elementally aligned, and subject to Elemental Rules.
	var/Deviation=4 //This will cause the pixelx/y of a projectile to shift accordingly.
//	var/Gun=1 //Tells Mystical that this is a Gun.
	var/GunType //Tells Mystical what type of gun this is. Valid types: Physical, Energy, Ion
	var/Bullet_Icon='Bullet.dmi'
	var/Bullet_State
	var/Bullet_Color="Red"
	var/tmp/Firing
	icon='Guns.dmi'
	New()
		suffix="[Commas(Ammo)]/[Commas(MaxAmmo)]"
	Projectile
		Level=10
		Cost=1000000
		icon_state="Handgun"
		GunType="Physical"
		Ammo=50
		MaxAmmo=50
		Strength=100
		StrengthMod=2
		Penetration=1
		PenetrationMod=1
		Accuracy=1200
		AccuracyMod=1.5
		Delay=10
		Range=16
		Deviation=6
		ProjectileSpeed=3
		Bullet_Icon='Bullet.dmi'
		verb/Projectile()
			set category="Skills"
			Gun_Fire2()
		verb/BulletColor()
			set src in usr
			set name="Bullet Color"
			var/bc=input("Select the color for the bullet.") in list ("Blue","Red","Green","Yellow")
			switch(bc)
				if("Blue")
					src.Bullet_Color="Blue"
				if("Red")
					src.Bullet_Color="Red"
				if("Green")
					src.Bullet_Color="Green"
				if("Yellow")
					src.Bullet_Color="Yellow"
		verb/Customize_Gun()
			set src in usr
			winshow(usr,"GunCustom",0)
			if(src in usr.contents)
				if(PointsAssigned==0)
					Points=usr.IntelligenceLevel
					Lvl=(usr.IntelligenceLevel*usr.IntelligenceLevel*(usr.IntelligenceLevel/2)*3)
					if(Points>=150)
						Points=150
					PointsAssigned=1
				winshow(usr,"GunCustom",1)
				usr.Customizing=src
				usr.UpdateGunWindow(src)
	Laser
		Level=20
		Cost=1000000
		icon_state="2"
		GunType="Energy"
		Ammo=50
		MaxAmmo=50
		Force=100
		ForceMod=3
		RPenetration=1
		RPenetrationMod=1
		Accuracy=1200
		AccuracyMod=2
		Range=10
		Deviation=6
		ProjectileSpeed=1.5
		Bullet_Icon='Blasts.dmi'
		Bullet_State="26"
		verb/Laser()
			set category="Skills"
			Gun_Fire2()
		verb/BulletColor()
			set src in usr
			set name="Laser Color"
			var/bc=input("Select the color for the laser.") in list ("Blue","Red","Green","Yellow")
			switch(bc)
				if("Blue")
					src.Bullet_Color="Blue"
				if("Red")
					src.Bullet_Color="Red"
				if("Green")
					src.Bullet_Color="Green"
				if("Yellow")
					src.Bullet_Color="Yellow"
		verb/Customize_Gun()
			set src in usr
			winshow(usr,"GunCustom",0)
			if(src in usr.contents)
				if(PointsAssigned==0)
					Points=usr.IntelligenceLevel
					Lvl=(usr.IntelligenceLevel*usr.IntelligenceLevel*(usr.IntelligenceLevel/2)*3)
					if(Points>=150)
						Points=150
					PointsAssigned=1
				winshow(usr,"GunCustom",1)
				usr.Customizing=src
				usr.UpdateGunWindow(src)
	Ion
		Level=30
		Cost=10000000
		icon_state="3"
		GunType="Ion"
		Ammo=10
		MaxAmmo=10
		Force=100
		ForceMod=2.5
		RPenetration=1
		RPenetrationMod=2
		Accuracy=1200
		AccuracyMod=1.5
		Delay=10
		Range=10
		Deviation=6
		ProjectileSpeed=2.5
		Bullet_Icon='Blasts.dmi'
		Bullet_State="59"
		verb/Ion()
			set category="Skills"
			Gun_Fire2()
		verb/BulletColor()
			set src in usr
			set name="Ion Color"
			var/bc=input("Select the color for the ion bolt.") in list ("Blue","Red","Green","Yellow")
			switch(bc)
				if("Blue")
					src.Bullet_Color="Blue"
				if("Red")
					src.Bullet_Color="Red"
				if("Green")
					src.Bullet_Color="Green"
				if("Yellow")
					src.Bullet_Color="Yellow"
		verb/Customize_Gun()
			set src in usr
			winshow(usr,"GunCustom",0)
			if(src in usr.contents)
				if(PointsAssigned==0)
					Points=usr.IntelligenceLevel
					Lvl=(usr.IntelligenceLevel*usr.IntelligenceLevel*(usr.IntelligenceLevel/2)*8)
					if(Points>=150)
						Points=150
					PointsAssigned=1
				winshow(usr,"GunCustom",1)
				usr.Customizing=src
				usr.UpdateGunWindow(src)
	Sniper
		Level=35
		Cost=10000000
		icon_state="Rifle"
		GunType="Physical"
		Ammo=12
		MaxAmmo=12
		Strength=100
		StrengthMod=1.5
		Penetration=1
		PenetrationMod=4
		Accuracy=1200
		AccuracyMod=3
		Delay=10
		Range=10
		Deviation=1
		ProjectileSpeed=1.5
		Bullet_Icon='Bullet.dmi'
		verb/Sniper()
			set category="Skills"
			Gun_Fire2()
		verb/BulletColor()
			set src in usr
			set name="Sniper Color"
			var/bc=input("Select the color for the high calibur bullet.") in list ("Blue","Red","Green","Yellow")
			switch(bc)
				if("Blue")
					src.Bullet_Color="Blue"
				if("Red")
					src.Bullet_Color="Red"
				if("Green")
					src.Bullet_Color="Green"
				if("Yellow")
					src.Bullet_Color="Yellow"
		verb/Customize_Gun()
			set src in usr
			winshow(usr,"GunCustom",0)
			if(src in usr.contents)
				if(PointsAssigned==0)
					Points=usr.IntelligenceLevel
					Lvl=(usr.IntelligenceLevel*usr.IntelligenceLevel*(usr.IntelligenceLevel/2)*4)
					if(Points>=150)
						Points=150
					PointsAssigned=1
				winshow(usr,"GunCustom",1)
				usr.Customizing=src
				usr.UpdateGunWindow(src)
	verb/Reset_Gun()
		set src in usr
		var/rg=input("Are you sure? This will reset all attributes on the gun.") in list("Yes","No")
		switch(rg)
			if("Yes")
				src.Points=0
				src.Lvl=0
				if(src.GunType=="Physical")
					src.Strength=100
					src.Penetration=1
					src.ProjectileSpeed=3
				else if(src.GunType=="Ion"||src.GunType=="Energy")
					src.Force=100
					src.RPenetration=1
					src.ProjectileSpeed=2.5
				src.Accuracy=1200
				src.Delay=10
				src.Range=10
				if(src.PenetrationMod==4)
					src.ProjectileSpeed=1.5
				src.Explodes=0
				src.Spread=0
				src.Knockbacks=0
				src.PointsAssigned=0
	proc/Gun_Fire2()
		if((usr.icon_state in list("Meditate","Train","KO","KB"))||usr.Frozen) return
		if(Firing) return
		if(usr.GunShot==1)
			return
		if(Ammo<=0) return
		/*if(usr.key in Noobs)
			usr<<"Noobed people cannot use Guns"
			return*/
		Ammo-=1
		if(Spread) Ammo-=2
		if(Ammo<0) Ammo=0
		suffix="[Commas(Ammo)]/[Commas(MaxAmmo)]"
		Firing=1
		usr.GunShot=1
		spawn(Delay)
			Firing=0
			usr.GunShot=0
		var/obj/Projectiles/Mystical/A=new
		A.Owner=usr
		A.Lethality=usr.Lethal
		A.Power=(Strength+Force)
		A.GunBP=Lvl
		A.Penetration=Penetration
		A.RPenetration=RPenetration
		A.Damage_Multiplier=1
		A.Offense=Accuracy
		A.Knockback=Knockbacks
		A.Explosive=Explodes
		A.Gun=1
		A.GunType=GunType
		A.Deflectable=1
		A.Dodgeable=1
		if(usr.GunKata)
			A.Offense=(usr.Offense*usr.OffenseMultiplier)*2
		if(usr.GunKata)
			A.GunBP=(usr.Power*2)+(src.Lvl/2)
		if(Elemental)
			A.Elemental=Elemental
		A.icon=Bullet_Icon
		if(Bullet_State)
			A.icon_state=Bullet_State
		if(Bullet_Color=="Red")
			A.icon+=rgb(150,10,10)
		if(Bullet_Color=="Blue")
			A.icon+=rgb(10,10,150)
		if(Bullet_Color=="Green")
			A.icon+=rgb(10,150,10)
		if(Bullet_Color=="Yellow")
			A.icon+=rgb(150,150,10)
		A.pixel_x=rand(-Deviation,Deviation)
		A.pixel_y=rand(-Deviation,Deviation)
		A.loc=get_step(usr,turn(usr.dir,90))
		A.dir=usr.dir
		A.loc=usr.loc
		walk(A,A.dir,ProjectileSpeed)
		if(usr.GunKata==2)
			for(var/obj/Skills/Rank/GunKata/GK in usr)
				if(GK.GunKataType=="Equilibrium")
					spawn(10)
						var/obj/Projectiles/Mystical/E=new
						E.Owner=usr
						E.Lethality=usr.Lethal
						E.Power=(Strength+Force)
						E.GunBP=Lvl
						E.Penetration=Penetration
						E.RPenetration=RPenetration
						E.Damage_Multiplier=1
						E.Offense=Accuracy
						E.Knockback=Knockbacks
						E.Explosive=Explodes
						E.Gun=1
						E.GunType=GunType
						E.Deflectable=1
						A.Dodgeable=1
						if(usr.GunKata)
							E.Offense=(usr.Offense*usr.OffenseMultiplier)*2
						if(usr.GunKata)
							E.GunBP=(usr.Power*1.25)+(src.Lvl/2.25)
						if(Elemental)
							E.Elemental=Elemental
						E.icon=Bullet_Icon
						if(Bullet_State)
							E.icon_state=Bullet_State
						if(Bullet_Color=="Red")
							E.icon+=rgb(150,10,10)
						if(Bullet_Color=="Blue")
							E.icon+=rgb(10,10,150)
						if(Bullet_Color=="Green")
							E.icon+=rgb(10,150,10)
						if(Bullet_Color=="Yellow")
							E.icon+=rgb(150,150,10)
						E.pixel_x=rand(-Deviation,Deviation)
						E.pixel_y=rand(-Deviation,Deviation)
						E.loc=get_step(usr,turn(usr.dir,90))
						E.dir=usr.dir
						E.loc=usr.loc
						walk(E,E.dir,ProjectileSpeed)

		if(Spread)
			spawn(2) if(src)
				var/obj/Projectiles/Mystical/B=new
				B.Owner=usr
				B.Lethality=usr.Lethal
				B.Power=(Strength+Force)
				B.GunBP=Lvl
				B.Penetration=Penetration
				B.RPenetration=RPenetration
				B.Damage_Multiplier=1
				B.Offense=Accuracy
				B.Knockback=Knockbacks
				B.Explosive=Explodes
				B.Gun=1
				B.GunType=GunType
				B.Deflectable=1
				A.Dodgeable=1
				if(Elemental)
					B.Elemental=Elemental
				B.icon=Bullet_Icon
				if(Bullet_State)
					B.icon_state=Bullet_State
				B.pixel_x=rand(-Deviation,Deviation)
				B.pixel_y=rand(-Deviation,Deviation)
				B.loc=get_step(usr,turn(usr.dir,90))
				B.dir=usr.dir
				walk(B,B.dir,ProjectileSpeed)
			spawn(4) if(src)
				var/obj/Projectiles/Mystical/C=new
				C.Owner=usr
				C.Lethality=usr.Lethal
				C.Power=(Strength+Force)
				C.GunBP=Lvl
				C.Penetration=Penetration
				C.RPenetration=RPenetration
				C.Damage_Multiplier=1
				C.Offense=Accuracy
				C.Knockback=Knockbacks
				C.Explosive=Explodes
				C.Gun=1
				C.GunType=GunType
				C.Deflectable=1
				A.Dodgeable=1
				if(Elemental)
					C.Elemental=Elemental
				C.icon=Bullet_Icon
				if(Bullet_State)
					C.icon_state=Bullet_State
				C.pixel_x=rand(-Deviation,Deviation)
				C.pixel_y=rand(-Deviation,Deviation)
				C.loc=get_step(usr,turn(usr.dir,-90))
				C.dir=usr.dir
				walk(C,C.dir,ProjectileSpeed)


obj/Items/Gun
	Cost=1000
	Level=3
	Power=1
	var/Ammo=500
	var/Points=0
	var/PointsAssigned=0
	var/Max_Ammo=500
	var/Delay=5
	var/Velocity=1
	var/Precision=1000
	var/Knockbacks=0
	var/Explodes=0
	var/Spread=0
	var/Deviation=4
	var/HandGun=0
	var/Bullet_Icon='Bullet.dmi'
	var/tmp/Firing
	Handgun
		icon_state="Handgun"
		Ammo=32
		Max_Ammo=32
		Power=500
		Delay=2
		Velocity=1
		Precision=1000
		Knockbacks=0
		Explodes=0
		Spread=0
		Deviation=4
		Bullet_Icon='Bullet.dmi'
		verb/Handgun()
			Gun_Fire()
		verb/Customize_Gun()
			set src in usr
			usr<<"Sorry, this feature has been disabled for this weapon."
	Rifle
		icon_state="Rifle"
		Ammo=16
		Max_Ammo=16
		Power=2000
		Delay=20
		Velocity=1
		Precision=1000
		Knockbacks=2
		Explodes=0
		Spread=0
		Deviation=4
		Bullet_Icon='Bullet.dmi'
		verb/Rifle()
			Gun_Fire()
		verb/Customize_Gun()
			set src in usr
			usr<<"Sorry, this feature has been disabled for this weapon."
	SMG
		icon_state="SMG"
		Ammo=500
		Max_Ammo=500
		Power=100
		Delay=1
		Velocity=1
		Precision=1000
		Knockbacks=0
		Explodes=0
		Spread=1
		Deviation=4
		Bullet_Icon='Bullet.dmi'
		verb/SMG()
			Gun_Fire()
		verb/Customize_Gun()
			set src in usr
			usr<<"Sorry, this feature has been disabled for this weapon."
	/*
	Default Ammo is 500, divided by the power of the gun.
	Each Knockback is x0.8 ammo
	Each explosion level is x0.8 ammo
	Damage is multiplied by the square root of the movement speed.
	(x2 movement = x1.42 damage)
	(x3 movement = 1.73x damage)
	(x4 movement = 2x damage)
	(x5 movement = 2.24x damage)
	(x10 movement = 3.17x damage)
	*/
	desc="Guns are a bit weak per shot, but they have a greater effect against non-players. Guns are very \
	accurate and rarely miss their target, and they drain no energy."
	icon='Guns.dmi'
	New()
		suffix="[Commas(Ammo)]"
		Gun_Description_Update()
	proc/Gun_Fire()
		if((usr.icon_state in list("Meditate","Train","KO","KB"))||usr.Frozen) return
		if(Firing) return
		if(Ammo<=0) return
		/*if(usr.key in Noobs)
			usr<<"Noobed people cannot use Guns"
			return*/
		Ammo-=1
		if(Spread) Ammo-=2
		if(Ammo<0) Ammo=0
		suffix="[Commas(Ammo)]"
		Firing=1
		spawn(Delay) Firing=0
		var/obj/Projectiles/Mystical/A=new
		A.Owner=usr
		A.Power=Power
		A.Damage_Multiplier=(3.99*(Year/2))
/*		if(usr.GunKata && HandGun)
			A.Offense=usr.Offense*2
		else*/
		A.Offense=Precision
		A.Knockback=Knockbacks
		A.Explosive=Explodes
		A.Gun=1
		A.Deflectable=1
		A.Dodgeable=1
		A.icon=Bullet_Icon
		A.pixel_x=rand(-Deviation,Deviation)
		A.pixel_y=rand(-Deviation,Deviation)
		A.loc=get_step(usr,turn(usr.dir,90))
		A.dir=usr.dir
		A.loc=usr.loc
		walk(A,A.dir,Velocity)
		if(Spread)
			spawn(2) if(src)
				var/obj/Projectiles/Mystical/B=new
				B.Owner=usr
				B.Power=Power
				B.Damage_Multiplier=(3.99*(Year/2))
				B.Offense=Precision
				B.Knockback=Knockbacks
				B.Explosive=Explodes
				B.Gun=1
				B.Deflectable=1
				B.Dodgeable=1
				B.icon=Bullet_Icon
				B.pixel_x=rand(-Deviation,Deviation)
				B.pixel_y=rand(-Deviation,Deviation)
				B.loc=get_step(usr,turn(usr.dir,90))
				B.dir=usr.dir
				walk(B,B.dir,Velocity)
			spawn(4) if(src)
				var/obj/Projectiles/Mystical/C=new
				C.Owner=usr
				C.Power=Power
				C.Damage_Multiplier=(3.99*(Year/2))
				C.Offense=Precision
				C.Knockback=Knockbacks
				C.Explosive=Explodes
				C.Gun=1
				C.Deflectable=1
				C.Dodgeable=1
				C.icon=Bullet_Icon
				C.pixel_x=rand(-Deviation,Deviation)
				C.pixel_y=rand(-Deviation,Deviation)
				C.loc=get_step(usr,turn(usr.dir,-90))
				C.dir=usr.dir
				walk(C,C.dir,Velocity)
	proc/Gun_Description_Update()
		desc="*[src]*<br>\
		Ammo Capacity: [Commas(Max_Ammo)]<br>\
		Refire Delay: [Delay]<br>\
		Shot Precision: [Commas(Precision*0.01)]<br>\
		Damage: [Power]<br>\
		Projectile Velocity: [Commas(1000/Velocity)]<br>\
		Knockback Effect: [Knockbacks+Explodes]<br>\
		Explosion Radius: [Explodes]<br>"
		if(Spread) desc+="Fires 3 shots at once.<br>"
mob/proc/Reload(obj/Items/Ammo/O)
	for(var/obj/Items/Ammo/A in usr) if(A.Reloading)
		src<<"You are busy reloading already."
		return
	var/list/Guns=new
	for(var/obj/Items/NGun/A in src) if(A.Ammo<A.MaxAmmo) Guns+=A
	if(!Guns) return
	//Guns+="Cancel"
	var/obj/Items/NGun/A=input(src,"Which gun do you want to reload?") in Guns
	if(A=="Cancel") return
	O.Reloading=1
	view(src)<<"[src] is reloading their weapon"
	spawn(50) if(O&&A&&src)
		O.Reloading=0
		view(src)<<"[src] is done reloading their weapon"
		var/Needed_Amount=A.MaxAmmo-A.Ammo
		if(Needed_Amount>O.Ammo) Needed_Amount=O.Ammo
		A.Ammo+=Needed_Amount
		O.Ammo-=Needed_Amount
		A.suffix="[Commas(A.Ammo)]/[Commas(A.MaxAmmo)]"
		O.suffix="[Commas(O.Ammo)]/[Commas(O.MaxAmmo)]"
		if(O.Ammo<=0) del(O)

obj/Items/BuffItem
	var/EquipType="Ring"
	var/Active=0
	var/PowerMulti=1
	var/PowerPlus=0
	var/MaxManaMulti=1
	var/MaxManaPlus=0
	var/AngerMulti=1
	var/AngerPlus=0
	var/StrengthMulti=1
	var/EnduranceMulti=1
	var/SpeedMulti=1
	var/ForceMulti=1
	var/ResistanceMulti=1
	var/OffenseMulti=1
	var/DefenseMulti=1
	var/RegenerationMulti=1
	var/RecoveryMulti=1
	desc="A admin really should edit the description!"
	verb/BuffItemInferface()
		set src in usr
		set name="Buff Item Interface"
		if(src.Active==1)
			usr<<"Don't try using this while its equipped..."
			return
		if(usr.Admin==0)
			usr<<"You can't use this unless you're a admin..."
			return
		else
			winshow(usr,"BuffItemCustom",0)
			if(src in usr.contents)
				winshow(usr,"BuffItemCustom",1)
				usr.Customizing=src
				usr.UpdateBuffItemWindow(src)

obj/Items/StoneMask
	var/Active=0
	desc="A mysterious mask that has unknown effects to those who are knocked unconscious with it."

obj/proc/BuffEquip(mob/A,var/show=1)
	var/obj/Items/BuffItem/_buffitem
	if(istype(src,/obj/Items/BuffItem)){_buffitem = src}
	else return
	if(_buffitem.suffix&&_buffitem.Active==1)
		_buffitem.suffix=null
		_buffitem.Active=0
		A.overlays-=_buffitem.icon
		usr.Power_Multiplier/=_buffitem.PowerMulti
		usr.PlusPower-=_buffitem.PowerPlus
		usr.ManaMax-=_buffitem.MaxManaPlus
		usr.ManaMax/=_buffitem.MaxManaMulti
		usr.ManaAmount-=_buffitem.MaxManaPlus
		usr.ManaAmount/=_buffitem.MaxManaMulti
		usr.AngerMax-=_buffitem.AngerPlus
		usr.AngerMax/=_buffitem.AngerMulti
		usr.StrengthMultiplier/=_buffitem.StrengthMulti
		usr.EnduranceMultiplier/=_buffitem.EnduranceMulti
		usr.SpeedMultiplier/=_buffitem.SpeedMulti
		usr.ForceMultiplier/=_buffitem.ForceMulti
		usr.ResistanceMultiplier/=_buffitem.ResistanceMulti
		usr.OffenseMultiplier/=_buffitem.OffenseMulti
		usr.DefenseMultiplier/=_buffitem.DefenseMulti
		usr.RegenerationMultiplier/=_buffitem.RegenerationMulti
		usr.RecoveryMultiplier/=_buffitem.RecoveryMulti
	else
		_buffitem.suffix="Equipped"
		_buffitem.Active=1
		usr.Power_Multiplier*=_buffitem.PowerMulti
		usr.PlusPower+=_buffitem.PowerPlus
		usr.ManaMax*=_buffitem.MaxManaMulti
		usr.ManaMax+=_buffitem.MaxManaPlus
		usr.AngerMax*=_buffitem.AngerMulti
		usr.AngerMax+=_buffitem.AngerPlus
		usr.StrengthMultiplier*=_buffitem.StrengthMulti
		usr.EnduranceMultiplier*=_buffitem.EnduranceMulti
		usr.SpeedMultiplier*=_buffitem.SpeedMulti
		usr.ForceMultiplier*=_buffitem.ForceMulti
		usr.ResistanceMultiplier*=_buffitem.ResistanceMulti
		usr.OffenseMultiplier*=_buffitem.OffenseMulti
		usr.DefenseMultiplier*=_buffitem.DefenseMulti
		usr.RegenerationMultiplier*=_buffitem.RegenerationMulti
		usr.RecoveryMultiplier*=_buffitem.RecoveryMulti
		if(show)
			A.overlays+=_buffitem.icon

obj/Items/RedVWatch
	Level=9001
	Cost=1010101010101010
	icon='VWatches.dmi'
	icon_state="Red"
	desc="Sweep through the hearts of the audience!"
	verb/ObtainHenshin()
		set src in usr
		if(!locate(/obj/Skills/Buffs/RedHenshin, usr))
			usr.contents+=new/obj/Skills/Buffs/RedHenshin
			usr<< "You become able to channel your inner Chain"
		else
			return
	verb/SwitchType()
		set src in usr
		var/choice=input(usr, "What aspect of your body do you want to empower?", "Aether Configuration") in list("Muscles", "Skin", "Eyes", "Ki")
		if(usr.SpecialSlot==1)
			usr<<"Do not try to switch types while... well, channeling some sort of power!"
			return
		else
			switch(choice)
				if("Muscles")
					usr.WatchType="Muscle"
				if("Skin")
					usr.WatchType="Skin"
				if("Eyes")
					usr.WatchType="Eyes"
				if("Ki")
					usr.WatchType="Ki"

obj/Items/HelenasNail
	Level=9001
	Cost=100000000000000000000000
	icon='VWatches.dmi'
	icon_state="Blue"
	desc="Become a Monster of God..."
	verb/Impale()
		set src in usr
		if(!locate(/obj/Skills/Buffs/MonsterofGod, usr))
			usr.contents+=new/obj/Skills/Buffs/MonsterofGod
			usr<< "You impale yourself with the needle."
		else
			return


obj/Items/BlueVWatch
	Level=9001
	Cost=1010101010101010
	icon='VWatches.dmi'
	icon_state="Blue"
	desc="Dazzle the minds of the audience!"
	verb/ObtainHenshin()
		set src in usr
		if(!locate(/obj/Skills/Buffs/BlueHenshin, usr))
			usr.contents+=new/obj/Skills/Buffs/BlueHenshin
			usr<< "You become able to channel your inner Chain!"
		else
			return
	verb/SwitchType()
		set src in usr
		var/choice=input(usr, "What aspect of your body do you want to empower?", "Aether Configuration") in list("Power", "Accuracy")
		if(usr.SpecialSlot==1)
			usr<<"Do not try to switch types while... well, channeling some sort of power!"
			return
		else
			switch(choice)
				if("Power")
					usr.WatchType="Power"
				if("Accuracy")
					usr.WatchType="Accuracy"

obj/Items/BlackVWatch
	Level=9001
	Cost=1010101010101010
	icon='VWatches.dmi'
	icon_state="Blue"
	desc="Conquer the realities of your audience!"
	verb/ObtainHenshin()
		set src in usr
		if(!locate(/obj/Skills/Buffs/BlackHenshin, usr))
			usr.contents+=new/obj/Skills/Buffs/BlackHenshin
			usr<< "You become able to channel your inner Chain!"
		else
			return
	verb/SwitchType()
		set src in usr
		var/choice=input(usr, "What aspect of your body do you want to empower?", "Aether Configuration") in list("Muscles", "Skin", "Eyes", "Ki")
		if(usr.SpecialSlot==1)
			usr<<"Do not try to switch types while... well, channeling some sort of power!"
			return
		else
			switch(choice)
				if("Muscles")
					usr.WatchType="Muscle"
				if("Skin")
					usr.WatchType="Skin"
				if("Eyes")
					usr.WatchType="Eyes"
				if("Ki")
					usr.WatchType="Ki"

obj/Items/TransEmblem
	Level=75
	Cost=500000000
	icon='Armor1.dmi'
	var/TransBP
	var/TransMulti
	var/TransStolen
	var/TransRace
	desc="Allows you to steal the transformation of one person in view."
	verb/Steal_Transformation()
		set src in usr
		set category="Skills"
		if(TransStolen)
			usr<< "You have aleady stolen a transformation with this emblem."
			return
		var/list/people=list("Cancel")
		for(var/mob/M in oview(12,usr))
			if(M.trans["active"]>=1)
				people.Add(M)
			if(M.ssj["active"]>=1)
				people.Add(M)
		var/mob/Choice=input("Steal who's transformation?")in people
		if(Choice=="Cancel")return
		Choice.Revert()
		if(Choice.Race=="Changeling")
			usr<< "You cannot steal their transformation."
			return
		if(Choice.Race!="Saiyan" || Choice.Race!="Half-Saiyan")
			TransBP=Choice.trans["1give"]*0.85
			TransMulti=Choice.trans["1multi"]
			TransRace=Choice.Race
			Choice.TransLock=1
			TransStolen=1
		if(Choice.Race=="Saiyan" || Choice.Race=="Half-Saiyan")
			TransBP=Choice.ssj["1give"]*0.85
			TransMulti=Choice.ssj["1multi"]
			TransRace=Choice.Race
			Choice.TransLock=1
			TransStolen=1
	verb/Use_Transformation()
		set src in usr
		set category="Skills"
		if(!TransRace)
			return
		if(!usr.EmblemTrans)
			usr.PlusPower+=TransBP
			usr.BaseMod*=TransMulti
			usr.Base*=TransMulti
			usr.EmblemTrans=1
			if(TransRace=="Saiyan"||TransRace=="Half-Saiyan")
				usr.ssj["active"]=1
				if(usr.Hair_SSJ1==null)
					if(usr.Hair_Base)
						var/icon/x=new(usr.Hair_Base)
						if(x)
							x.Blend(rgb(153,153,5),ICON_ADD)
						usr.Hair_SSJ1=x
				usr.Hairz("Add")
				usr.Auraz("Add")
			if(TransRace=="Human")
				usr.StrengthMultiplier*=1.15
				usr.EnduranceMultiplier*=1.15
				usr.ForceMultiplier*=1.15
				usr.ResistanceMultiplier*=1.15
				usr.OffenseMultiplier*=1.15
				usr.DefenseMultiplier*=1.15
			if(TransRace=="Namekian")
				usr.RecoveryMultiplier*=2
				usr.overlays+=image('Auras.dmi',"Mystic")
		//	return
		else if(usr.EmblemTrans)
			usr.PlusPower-=TransBP
			usr.BaseMod/=TransMulti
			usr.Base/=TransMulti
			usr.EmblemTrans=0
			if(TransRace=="Saiyan"||TransRace=="Half-Saiyan")
				usr.ssj["active"]=0
				usr.Hairz("Add")
				usr.Auraz("Remove")
			if(TransRace=="Human")
				usr.StrengthMultiplier/=1.15
				usr.EnduranceMultiplier/=1.15
				usr.ForceMultiplier/=1.15
				usr.ResistanceMultiplier/=1.15
				usr.OffenseMultiplier/=1.15
				usr.DefenseMultiplier/=1.15
			if(TransRace=="Namekian")
				usr.RecoveryMultiplier/=2
				usr.overlays-=image('Auras.dmi',"Mystic")
	verb/Unseal_Transformation()
		set src in usr
		set category="Skills"
		if(usr.EmblemTrans) return
		if(!usr.TransLock) return
		usr<< "You have unsealed your racial transformation. The medallion vanishes as a result."
		del src
obj/Items/Armor
	Level=14
	Cost=80000
	icon='Armor1.dmi'
	var/Durability=1
	desc="Halves Speed. Halves damage while equipped. Eventually breaks if worn out enough, but it breaks slower if your body can naturally take more damage."
	verb/Enchant_Armor()
		set src in usr
		if(usr.EnchantmentLevel<30)
			usr<<"You don't have enough magical knowledge to enchant this armor."
			return
		else if(Enchanted)
			usr<<"This weapon is already enchanted. It would be too dangerous to try to stack enchantments."
			return
		else
			var/Choice=input("What type of Enchantment?") in list ("Elemental", "Nevermind")
			switch(Choice)
				if("Elemental")
					var/Choice2=input("Select a Element. You may only have one.") in list ("Fire","Wind","Earth","Water","Nevermind")
					switch(Choice2)
						if("Fire")
							usr<<"The armor glows a vibrant red for a few moments, and now feels eternally warm to the touch."
							Enchanted=1
							EnchantType="Fire"
						if("Wind")
							usr<<"The armor glows a bright green for a few moments. It feels like wind is slowly swirling around it."
							Enchanted=1
							EnchantType="Wind"
						if("Earth")
							usr<<"The armor glows a dull yellow for a few moments. It feels harder, for some reason."
							Enchanted=1
							EnchantType="Earth"
						if("Water")
							usr<<"The armor glows a deep blue for a few moments. Moisture seems to gather about the armor."
							Enchanted=1
							EnchantType="Water"
						if("Light")
							usr<<"The armor glows a bright silver for a few moments. Wearing it seems to make you feel revitalized."
							Enchanted=1
							EnchantType="Light"
						if("Darkness")
							usr<<"The armor glows a deep purple for a few moments. Wearing it seems to hurt somewhat."
							Enchanted=1
							EnchantType="Darkness"
						if("Nevermind")
							return
				if("Nevermind")
					return
	verb/Fortify_Armor()
		set src in usr
		set category="Skills"
		var/obj/Money/Q
//		var/obj/Items/Armor/I=usr.Customizing
		for(var/obj/Money/_moneybag in usr)
			Q=_moneybag
			break
		var/blah=input("Reinforce to how much BP? (Each BP is [3/usr.Intelligence] resources.)") as num
		if(Durability>=blah)
			usr<<"The armor is more durable than that already!"
			desc="This armor has [Commas(Durability)] BP worth of durability. Halves damage while equipped. Eventually breaks if worn out enough, but it breaks slower if your body can naturally take more damage."
			return
		else
			for(Q in usr)
				if(Q.Level>=(blah-Durability)*3/usr.Intelligence)
					Q.Level-=(blah-Durability)*3/usr.Intelligence
					Durability+=(blah-Durability)
					desc="This armor has [Commas(Durability)] BP worth of durability. Halves damage while equipped. Eventually breaks if worn out enough, but it breaks slower if your body can naturally take more damage."

				else
					usr<<"You do not have enough resources for that! It would cost you [Commas(blah*(3/usr.Intelligence))]."
					return
				break
obj/Items/Shield
	Level=7
	Cost=50000
	icon='KunaiMod/Icons/shield.dmi'
	var/Durability=1
	desc="Reduces your offense by 25%. Reduces physical damage taken by 25% while equipped. Eventually breaks if worn out enough, but it breaks slower if your body can naturally take more damage."
	verb/Fortify_Shield()
		set src in usr
		set category="Skills"
		var/obj/Money/Q
//		var/obj/Items/Armor/I=usr.Customizing
		for(var/obj/Money/_moneybag in usr)
			Q=_moneybag
			break
		var/blah=input("Reinforce to how much BP? (Each BP is [3/usr.Intelligence] resources. (Hard Cap = 10'000 BP)") as num
		if(Durability>10000)
			Durability=10000
		if(Durability>=blah)
			usr<<"The shield is more durable than that already!"
			desc="This shield has [Commas(Durability)] BP worth of durability. Halves damage while equipped. Eventually breaks if worn out enough, but it breaks slower if your body can naturally take more damage."
			return
		else
			for(Q in usr)
				if(Q.Level>=(blah-Durability)*3/usr.Intelligence)
					Q.Level-=(blah-Durability)*3/usr.Intelligence
					Durability+=(blah-Durability)
					desc="This shield has [Commas(Durability)] BP worth of durability. Halves damage while equipped. Eventually breaks if worn out enough, but it breaks slower if your body can naturally take more damage."

				else
					usr<<"You do not have enough resources for that! It would cost you [Commas(blah*(3/usr.Intelligence))]."
					return
				break

obj/Items/Scraps
	icon='KunaiMod/Icons/scraps.dmi'
	desc="What a load of junk! Maybe you can salvage it?"
	var/ScrapLevel=1
	var/obj/Money/Q
	verb/Salvage()
		set src in usr
		if(ScrapLevel<1)
			usr<<"There's nothing salvageable left but trash, in which you discard."
			del src
			return
		else
			for(Q in usr)
				if(Q.Level>=0)
					var/mathymath
					var/smartness
					mathymath=ScrapLevel*75
					smartness=mathymath*usr.Intelligence
					Q.Level+=smartness
					ScrapLevel-=1
					usr<<"You attempt to salvage the scraps..."
					sleep(50)
					usr<<"And voilá! You receive [smartness] resources!"
					return
				else
					usr<<"Negative money? lol"
				break


obj/Items/Sword
	Level=7
	Cost=35000
	icon='TechSword.dmi'
	var/Points=0
	var/PointsAssigned=0
	Damage_Multiplier=0.1
	var/Shatterproof=0
	var/ShatterTier=0
	var/ShatterCounter=0
	var/Accuracy_Multiplier=0
	var/Delay_Multiplier=0.1
	var/Drain_Multiplier=1
	var/Explosive=0
	var/Homing=0
	var/Cursed=0
	var/SwordIconSelected=0
	var/EnchantLock
	var/SwordPot=0
	var/Upgraded=0
	var/Improved=0
	var/Lightsaber=0
	var/ScissorBlade=0
	var/SpiritSword=0
	var/Keyblade=0
	var/KeybladeOwner="None"
	var/KeybladeElement
	var/Djinn=0
	desc="Swords alter the effects of melee combat and have their own advantages and disadvantages."
	New()
		..()
		spawn()src.Update_Description()

	proc/Update_Description()
		desc="[src]<br>\
		Damage Multiplier: [Damage_Multiplier]<br>\
		Accuracy Multiplier: [Accuracy_Multiplier]<br>\
		Delay Multiplier: [Delay_Multiplier]<br>\
		Drain Multiplier: [Drain_Multiplier]<br>\
		Explosive:[Explosive]<br>\
		Homing:[Homing]<br>"
	//Katana icon='Item - Katana 2.dmi'
	//Great_Sword icon='Item, Great Sword.dmi'

	verb/UseDefaultSwordIcon()
		set src in usr
		var/Choice=input("What icon would you like for the sword?") in list ("Long Sword","Basic","Broad","Katana","Two Katanas","Dual Blades","Great","Samurai")
		switch(Choice)
			if("Long Sword")
				src.icon='TechSword.dmi'
			if("Basic")
				src.icon='SwordBasic.dmi'
			if("Broad")
				src.icon='SwordBroad.dmi'
			if("Katana")
				src.icon='SwordKatana.dmi'
			if("Two Katanas")
				src.icon='SwordDualKatana.dmi'
			if("Dual Blades")
				src.icon='SwordDual.dmi'
			if("Great")
				src.icon='SwordGreat.dmi'
			if("Samurai")
				src.icon='SwordSamurai.dmi'

	verb/Enchant_Sword()
		set src in usr
		if(EnchantLock)
			usr<<"You're already trying to enchant this weapon, or it's already enchanted."
			return
		src.EnchantLock=1
		if(usr.EnchantmentLevel<30)
			usr<<"You don't have enough magical knowledge to enchant this weapon."
			return
		else if(Enchanted)
			usr<<"This weapon is already enchanted. It would be too dangerous to try to stack enchantments."
			return
		else
			var/Choice=input("What type of Enchantment?") in list ("Elemental","Additional Points","Weapon Poison", "Nevermind")
			switch(Choice)
				if("Elemental")
					var/Choice2=input("Select a Element. You may only have one.") in list ("Fire","Wind","Earth","Water","Darkness","SORD.....","Nevermind")
					switch(Choice2)
						if("Fire")
							usr<<"The weapon glows a vibrant red for a few moments, and now feels eternally warm to the touch."
							Enchanted=1
							EnchantType="Fire"
						if("Wind")
							usr<<"The weapon glows a bright green for a few moments. It feels like wind is slowly swirling around it."
							Enchanted=1
							EnchantType="Wind"
						if("Earth")
							usr<<"The weapon glows a dull yellow for a few moments. It feels harder, for some reason."
							Enchanted=1
							EnchantType="Earth"
						if("Water")
							usr<<"The weapon glows a deep blue for a few moments. Moisture seems to gather about the weapon."
							Enchanted=1
							EnchantType="Water"
						if("Darkness")
							usr<<"The weapon glows a deep purple for a few moments. Grasping the weapon seems to hurt your hand."
							Enchanted=1
							EnchantType="Darkness"
						if("Light")
							usr<<"The weapon glows a bright silver for a few moments. Grasping the weapon seems to revitalize you."
							Enchanted=1
							EnchantType="Light"
						if("SORD.....")
							if(EnchantType=="SORD....")
								EnchantType="SORD....."
								usr<<"You've managed to unlock the secret element! The sword is slightly less shitty now. But still pretty terrible."
								Enchanted=1
							else
								EnchantType="SORD...."
								usr<<"This sword is now a useless piece of shit. It literally hurts to wield, and you probably won't be able to hit the broad side of a barn. What were you thinking?"
								EnchantLock=0

						if("Nevermind")
							EnchantLock=0
							return
				if("Additional Points")
					Points+=5
					usr<<"The weapon now can be enhanced slightly more."
					Enchanted=1
					EnchantLock=0
				if("Weapon Poison")
					Enchanted=1
					EnchantType="Poison"
					EnchantLock=0
					usr<<"You concoct a magical poison and apply it to the weapon. It does not look like the poison can be removed now..."
				if("Nevermind")
					EnchantLock=0
					return
	verb/Customize_Sword()
		set src in usr
		winshow(usr,"SwordCustom",0)
		if(src in usr.contents)
			if(PointsAssigned==0)
				Points+=35//35+round((usr.IntelligenceLevel/2.5))
				//if(Points>=35)
				//	Points=35
				PointsAssigned=1
			winshow(usr,"SwordCustom",1)
			usr.Customizing=src
			usr.UpdateSwordWindow(src)

mob/proc
	UpdateSwordWindow(var/obj/Items/Sword/I)
		if(I)
			if(istype(I,/obj/Items/Sword))
				winset(usr,"SwordPoints","text=[I.Points]")
				var/list/changes=list("LabelDamage","LabelAccuracy","LabelDelay","LabelDrain","LabelExplosive","LabelHoming")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelDamage")blah="[I.Damage_Multiplier]"
						if("LabelAccuracy")blah="[I.Accuracy_Multiplier]"
						if("LabelDelay")blah="[I.Delay_Multiplier]"
						if("LabelDrain")blah="[I.Drain_Multiplier]"
						if("LabelExplosive")blah="[I.Explosive]"
						if("LabelHoming")blah="[I.Homing]"
					winset(usr,x,"text=[blah]")


mob/var/tmp/Customizing
mob/Players/verb/CustomizeSword(type as text)
	set name=".SwordCustom"
	set hidden=1
	var/obj/Items/Sword/Q=usr.Customizing
	if(Q)
		if(istype(Q,/obj/Items/Sword))
			if(Q.Points>0)
				if(type in list("Damage","Accuracy","Drain","Delay"))
					if(type == "Delay" && Q.Delay_Multiplier>=3)
						return
					if(type == "Accuracy" && Q.Accuracy_Multiplier>=1)
						return
/*					if(type == "Damage" && Q.Damage_Multiplier>=2.5)
						return
					if(Q.vars["Accuracy_Multiplier"]>=0.75 && type == "Accuracy" && Q.Cursed==0)
						Q.Cursed=1
					if(Q.vars["Damage_Multiplier"]>=2 && type == "Damage" && Q.Cursed==0)
						Q.Cursed=1
					if(Q.vars["Delay_Multiplier"]>=1.75 && type == "Delay" && Q.Cursed==0)
						Q.Cursed=1
					if(Q.vars["Accuracy_Multiplier"]>=1 && type == "Accuracy" && Q.Cursed==0)
						return*/
					if(type == "Drain")
						src<< "Disabled."
						return
					if(type == "Accuracy")
						Q.vars["[type]_Multiplier"]+=0.05
					if(type == "Delay")
						Q.vars["[type]_Multiplier"]+=0.1
					else
						Q.vars["[type]_Multiplier"]+=0.1
					Q.Points--
				else
					if(Q.Points>=10)
						if(type in list("Explosive","Homing"))
							if(!Q.vars["[type]"])
								Q.vars["[type]"]=1
								Q.Points-=10
/*								if(Q.vars["[type]"]== "Homing")
									Q.Cursed=1
									src<<"<b>The sword begins to glow a blackish color for a moment, as if something about it changed.</b>"*/
				UpdateSwordWindow(Q)
				Q.Update_Description()
				sleep(1)

obj/Items/Dagger
	Level=7
	Cost=35000
	icon='KunaiMod/Icons/dagger.dmi'
	var/Points=0
	var/PointsAssigned=0
	Damage_Multiplier=0.4
	var/Shatterproof=0
	var/ShatterTier=0
	var/ShatterCounter=0
	var/Accuracy_Multiplier=2
	var/Delay_Multiplier=1.5
	var/Drain_Multiplier=1
	var/Explosive=0
	var/Homing=1
	var/Cursed=0
	var/SwordIconSelected=0
	var/EnchantLock
	var/SwordPot=0

	desc="Knives/Daggers alter the effects of melee combat and have their own advantages and disadvantages. Daggers are extremely agile, but do very low damage."
	New()
		..()
		spawn()src.Update_Description()

	proc/Update_Description()
		desc="[src]<br>\
		Damage Multiplier: [Damage_Multiplier]<br>\
		Accuracy Multiplier: [Accuracy_Multiplier]<br>\
		Delay Multiplier: [Delay_Multiplier]<br>\
		Drain Multiplier: [Drain_Multiplier]<br>\
		Explosive:[Explosive]<br>\
		Homing:[Homing]<br>"
	//Katana icon='Item - Katana 2.dmi'
	//Great_Sword icon='Item, Great Sword.dmi'

mob/proc
	UpdateDaggerWindow(var/obj/Items/Dagger/I)
		if(I)
			if(istype(I,/obj/Items/Dagger))
				winset(usr,"DaggerPoints","text=[I.Points]")
				var/list/changes=list("LabelDamage","LabelAccuracy","LabelDelay","LabelDrain","LabelExplosive","LabelHoming")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelDamage")blah="[I.Damage_Multiplier]"
						if("LabelAccuracy")blah="[I.Accuracy_Multiplier]"
						if("LabelDelay")blah="[I.Delay_Multiplier]"
						if("LabelDrain")blah="[I.Drain_Multiplier]"
						if("LabelExplosive")blah="[I.Explosive]"
						if("LabelHoming")blah="[I.Homing]"
					winset(usr,x,"text=[blah]")


obj/Items/BambooStaff
	Level=7
	Cost=35000
	icon='KunaiMod/Icons/staff.dmi'
	var/Points=0
	var/PointsAssigned=0
	Damage_Multiplier=0.8
	var/Shatterproof=0
	var/ShatterTier=0
	var/ShatterCounter=0
	var/Accuracy_Multiplier=3
	var/Delay_Multiplier=0.4
	var/Drain_Multiplier=1
	var/Explosive=0
	var/Homing=1
	var/Cursed=0
	var/SwordIconSelected=0
	var/EnchantLock
	var/SwordPot=0

	desc="Staves alter the effects of melee combat and have their own advantages and disadvantages. Staves/Blunt objects have an immense accuracy, but low firepower and refire."
	New()
		..()
		spawn()src.Update_Description()

	proc/Update_Description()
		desc="[src]<br>\
		Damage Multiplier: [Damage_Multiplier]<br>\
		Accuracy Multiplier: [Accuracy_Multiplier]<br>\
		Delay Multiplier: [Delay_Multiplier]<br>\
		Drain Multiplier: [Drain_Multiplier]<br>\
		Explosive:[Explosive]<br>\
		Homing:[Homing]<br>"
	//Katana icon='Item - Katana 2.dmi'
	//Great_Sword icon='Item, Great Sword.dmi'

mob/proc
	UpdateBoStaffWindow(var/obj/Items/BambooStaff/I)
		if(I)
			if(istype(I,/obj/Items/BambooStaff))
				winset(usr,"BambooStaffPoints","text=[I.Points]")
				var/list/changes=list("LabelDamage","LabelAccuracy","LabelDelay","LabelDrain","LabelExplosive","LabelHoming")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelDamage")blah="[I.Damage_Multiplier]"
						if("LabelAccuracy")blah="[I.Accuracy_Multiplier]"
						if("LabelDelay")blah="[I.Delay_Multiplier]"
						if("LabelDrain")blah="[I.Drain_Multiplier]"
						if("LabelExplosive")blah="[I.Explosive]"
						if("LabelHoming")blah="[I.Homing]"
					winset(usr,x,"text=[blah]")


mob/proc
	UpdateGunWindow(var/obj/Items/NGun/I)
		if(I)
			if(istype(I,/obj/Items/NGun))
				winset(usr,"GunPoints","text=[I.Points]")
				var/list/changes=list("LabelGunStrength","LabelGunForce","LabelGunPenetration","LabelGunRPenetration","LabelGunAccuracy","LabelGunExplosive","LabelGunSpread","LabelGunKnockbacks","LabelGunFiringRate","LabelGunProjectileSpeed")
				for(var/x in changes)
					var/blah
					switch(x)
						if("LabelGunStrength")blah="[Commas(round(I.Strength))]"
						if("LabelGunForce")blah="[Commas(round(I.Force))]"
						if("LabelGunPenetration")blah="[I.Penetration]%"
						if("LabelGunRPenetration")blah="[I.RPenetration]%"
						if("LabelGunAccuracy")blah="[Commas(I.Accuracy)]"
						if("LabelGunExplosive")blah="[I.Explodes]"
						if("LabelGunSpread")blah="[I.Spread]"
						if("LabelGunKnockbacks")blah="[I.Knockbacks]"
						if("LabelGunFiringRate")blah="[I.Delay]"
						if("LabelGunProjectileSpeed")blah="[I.ProjectileSpeed]"
					winset(usr,x,"text=[blah]")

mob/Players/verb/CustomizeGun(type as text)
	set name=".GunCustom"
	set hidden=1
	var/obj/Items/NGun/Q=usr.Customizing
	if(Q)
		if(istype(Q,/obj/Items/NGun))
			if(Q.Points>0)
				if(type in list("Strength","Force","Penetration","RPenetration","Accuracy","Help"))
					if(type in list("Help"))
						alert("Strength:Physical Damage. Force:Energy Damage. Penetration:Ignores a percentage of Endurance on hit. Res Penetration: Ignores a percentage of Resistance on hit. Accuracy: The Offense of the gun. Firing Delay: How often you can fire the gun. Projectile Speed: How fast each projectile moves. Explosive: Shots will release a explosive effect. Spread: Uses more ammo, but more bullets are shot at once. Knockback: Causes the target to be knocked back on hit.")
						return
					else if(type == "Penetration" && Q.Penetration>=20)
						return
					else if(type == "RPenetration" && Q.RPenetration>=20)
						return
					else if(type in list("Strength","Force","Penetration","RPenetration") && Q.vars["[type]"]==0)
						return
					else
						if(type in list("Strength"))
							Q.vars["[type]"]+=(100*Q.StrengthMod)
						else if(type in list("Force"))
							Q.vars["[type]"]+=(100*Q.ForceMod)
						else if(type in list("Accuracy"))
							Q.vars["[type]"]+=(1000*Q.AccuracyMod)
						else if(type in list("Penetration"))
							Q.vars["[type]"]+=(0.25*Q.PenetrationMod)
						else if(type in list("RPenetration"))
							Q.vars["[type]"]+=(0.25*Q.RPenetrationMod)
						Q.Points--
				else if(type in list("Explodes","Spread","Knockbacks"))
					if(Q.Points>=5)
						if(!Q.vars["[type]"])
							Q.vars["[type]"]=1
							Q.Points-=5
				else
					if(type in list("Delay","ProjectileSpeed"))
						if(type == "Delay" && Q.Delay<=0.5)
							return
						else if(type == "ProjectileSpeed" && Q.ProjectileSpeed<=0.5)
							return
						Q.vars["[type]"]-=0.25
						Q.Points--
				UpdateGunWindow(Q)
				sleep(1)
