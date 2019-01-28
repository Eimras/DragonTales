mob/proc/GetAssess()
//	var/TrueAge=Year-src.Birth_Year
	var/PowerDisplay
	//var/YourMods=((StrengthMod)+(EnduranceMod)+(ResistanceMod)+(ForceMod)+(OffenseMod)+(DefenseMod))/7
	//var/YourStats=((Strength)+(Endurance)+(Resistance)+(Force)+(Offense)+(Defense))/7
	var/StatAverage=((Strength/StrengthMod)+(Endurance/EnduranceMod)+(Resistance/ResistanceMod)+(Force/ForceMod)+(Offense/OffenseMod)+(Defense/DefenseMod))/6 //YourStats/YourMods//((src.Strength)+(src.Endurance)+(src.Speed)+(src.Resistance)+(src.Force)+(src.Offense)+(src.Defense))/7
	if(src.Power>1)
		PowerDisplay=Commas(src.Power+src.CyberPower)
	else
		PowerDisplay=1




	var/blahh={"

			<html>
	<style type="text/css">
	<!--
	body {
	     color:#449999;
	     background-color:black;
	     font-size:12;
	 }
	table {
	     font-size:12;
	 }
	//-->
	</style>
	<body>
	[src.name]<br>
	Current Anger: [src.Anger*100]%<br>
	<table cellspacing="6%" cellpadding="1%">
	<tr><td>Body:</td><td>[src.Body*100]%</td></tr>
	<tr><td>Base:</td><td>[Commas(round(src.Base))]/([src.BaseMod])</td></tr>
	<tr><td>Current BP:</td><td>[PowerDisplay]</td></tr>
	<tr><td>Energy:</td><td>[Commas(round(src.EnergyMax))]([src.EnergyMod])</td></tr>
	<tr><td>Buffed Stat/True Stat (Mod)</td></tr>
	<tr><td>Strength (x[src.StrengthMultiplier]):</td><td>[Commas(src.Strength*src.StrengthMultiplier)]/[Commas(src.Strength)] ([src.StrengthMod])</td></tr>
	<tr><td>Endurance (x[src.EnduranceMultiplier]):</td><td>[Commas(src.Endurance*src.EnduranceMultiplier)]/[Commas(src.Endurance)] ([src.EnduranceMod])</td></tr>
	<tr><td>Speed (x[src.SpeedMultiplier]):</td><td>[(src.SpeedMod*src.SpeedMultiplier)]/[(src.SpeedMod)] ([src.SpeedMod])</td></tr>
	<tr><td>Force (x[src.ForceMultiplier]):</td><td>[Commas(src.Force*src.ForceMultiplier)]/[Commas(src.Force)] ([src.ForceMod])</td></tr>
	<tr><td>Resistance (x[src.ResistanceMultiplier]):</td><td>[Commas(src.Resistance*src.ResistanceMultiplier)]/[Commas(src.Resistance)] ([src.ResistanceMod])</td></tr>
	<tr><td>Offense (x[src.OffenseMultiplier]):</td><td>[Commas(src.Offense*src.OffenseMultiplier)]/[Commas(src.Offense)] ([src.OffenseMod])</td></tr>
	<tr><td>Defense (x[src.DefenseMultiplier]):</td><td>[Commas(src.Defense*src.DefenseMultiplier)]/[Commas(src.Defense)] ([src.DefenseMod])</td></tr>
	<tr><td>Regeneration (x[src.RegenerationMultiplier]):</td><td>[(src.Regeneration*src.RegenerationMultiplier)]/[src.Regeneration]</td></tr>
	<tr><td>Recovery (x[src.RecoveryMultiplier]):</td><td>[(src.Recovery*src.RecoveryMultiplier)]/[src.Recovery]</td></tr>
	<tr><td>Zenkai:</td><td>[src.Zenkai_Rate]</td></tr>
	<tr><td>Gravity:</td><td>[Commas(src.GravityMastered)]([src.GravityMod])</td></tr>
	<tr><td>Anger:</td><td>[src.AngerMax*100]%</td></tr>
	<tr><td>Meditation Rate:</td><td>[src.Meditation_Rate]</td></tr>
	<tr><td>Training Rate:</td><td>[src.Training_Rate]</td></tr>
	<tr><td>Flying:</td><td>([src.FlySkillMod])</td></tr>
	<tr><td>Zanzoken:</td><td>([src.ZanzokenSkillMod])</td></tr>
	<tr><td>Intelligence:</td><td>[src.IntelligenceLevel]([src.Intelligence])</td></tr>
	<tr><td>Enchantment:</td><td>[src.EnchantmentLevel]([src.Enchantment])</td></tr>
	<tr><td>Potential:</td><td>[src.Potential]</td></tr>
	<tr><td>Gain Multiplier: [Commas(src.EXP)]</td></tr>
	<tr><td>Average Stats: [StatAverage]</td></tr>
			</table>"}
/*	if(src.Race=="Quarter Saiyan")
		blahh+={"<font color=#0066CC>Third Eye at: [Commas(src.ThirdEyeReq)]<br><font color=#FFFF00>Super Saiyan at: [Commas(src.ssj["1req"])]"}
	if(src.Race=="Changeling")
		if(src.Class=="Cooler")
			blahh+={"<br><font color=#CC99FF>Low-Power Restricted Form at: [Commas(src.trans["1req"])]
<br>Restricted Form at: [Commas(src.trans["2req"])]
<br>True Form at: [Commas(src.trans["3req"])]
<br>Super Changeling at: [Commas(src.trans["4req"])]
"}
	if(src.Race=="Popo" && !allowFBM)
		blahh+={"<font color='#000000'>BLACK: [Commas(75000*src.BaseMod*20)]<br>
"}
	if(src.Race=="Throwback" && !allowFBM)
		if(src.Class!="Shifter" & src.Class != "Sage")
			if(src.Class!="Dhampir")
				blahh+={"<font color=#0066CC>Third Eye at: [Commas(src.ThirdEyeReq)]<br>
"}
			blahh+={"<font color='#FF00FF'>Terrible High Tension: [Commas(src.trans["1req"])]<br>
			<font color='#FF00FF'>Good High Tension: [Commas(src.trans["2req"])]<br>
			<font color='#FF00FF'>GGwipe High Tension: [Commas(src.trans["3req"])]<br>
			<font color='#FF00FF'>Nevermind High Tension: [Commas(src.trans["4req"])]<br>
"}
	if(src.Race=="Human" && !allowFBM)
		if(src.Class!="Shifter" & src.Class != "Sage")
			if(src.Class!="Dhampir")
				blahh+={"<font color=#0066CC>Third Eye at: [Commas(src.ThirdEyeReq)]<br>
"}
			blahh+={"
			<font color='#FF00FF'>Red Ascension: [Commas(50000*BaseMod*20)]<br>
			<font color='#FF00FF'>Blue Ascension: [Commas(300000*BaseMod*20)]<br>

"}
		if(src.Class=="Shifter")
		{
			blahh+={"<font color='#FF9900'>Titan Ascension 1 at: [Commas(50000*BaseMod*20)]<br>
			<font color='#FF9900'>Titan Ascension 2 at: [Commas(500000*BaseMod*20)]<br>
"}
		}
	if(src.Race=="Android"&&!allowFBM)
		if(src.SuperDroid==1)
			blahh+={"<font color=#AAAAAA>Super Android at: [Commas(src.SuperDroidReq)]
"}

	if(src.Race=="Namekian"&&!allowFBM)
		if(src.Class=="Fighter"||src.Class=="Healer")
			blahh+={"<font color=#009900>Namekian Ascension at: 2'000'000
<br>
"}
		if(src.Class=="Ancient")
			blahh+={"<font color=#009900>Namekian Ascension at: 3'000'000

<br>Final Namekian Ascension at: 20'000'000
"}


	if(src.Race=="Lycan")
		blahh+={"<font color=#999900>Alpha Form at: [Commas(src.trans["1req"])]
"}

	if(src.Race=="Hollow"&&!allowFBM)
		if(src.Class=="Gillian Arrancar"||src.Class=="Adjuucha Arrancar"||src.Class=="Vasto Arrancar"||src.Class=="Ascended Arrancar")
			blahh+={"<font color=#AAAAAA>Resurreccion at: [Commas(src.trans["1req"])]
<br>Resurreccion: Segunda Etapa at: [Commas(src.trans["2req"])]
"}
		else
			blahh+={"<font color=#AAAAAA>Menos Grande Gillian at: [Commas(2500*BaseMod*20)] <br>
Menos Grande Adjuuchas at: [Commas(25000*BaseMod*20)] <br>
Menos Grande Vasto Lorde at: [Commas(50000*BaseMod*20)] <br>

"}
		if(src.Class=="Gillian")
			blahh+={"<font color=#AAAAAA>Gillian Arrancar at: [Commas(10000*BaseMod*20)]<br>
"}
		if(src.Class=="Adjuucha")
			blahh+={"<font color=#AAAAAA>Adjuucha Arrancar at: [Commas(50000*BaseMod*20)]<br>
"}
		if(src.Class=="Vasto Lorde")
			blahh+={"<font color=#AAAAAA>Vasto Arrancar at: [Commas(100000*BaseMod*20)]<br>
"}

	if(src.Race=="Tsufurujin"&&!allowFBM)
		blahh+={"<font color=#666699>Tsufurujin Ascension 1 at: 300'000
<br>Tsufurujin Ascension 2 at: 1'000'000
<br>Tsufurujin Ascension 3 at: 3'000'000
<br>Tsufurujin Final Ascensionst: 6'000'000
"}
	if(src.Race=="Demi"&&!allowFBM)
		blahh+={"<font color=#FF9933>Olympian Fury at: [Commas(src.OlympianReq)]<br>
"}
	if(src.Race=="Spirit Doll"&&!allowFBM)
		blahh+={"<font color=#EE5262>Mana Infusion at: 50'000<br>
		 Mana Infusion Tier 2 at: 500'000<br>
		 Mana Infusion Tier 3 at: 5'000'000<br>
		 Mana Infusion Tier 4 at: 25'000'000
"}
	if(src.Race=="Makyo"&&!allowFBM)
		blahh+={"<font color=#EE5262>
		Makyo Asc 1: 2'000'000
		Makyo Asc 2: 4'000'000
"}
	if(src.Race=="Kaio"&&!allowFBM)
		blahh+={"<font color=#CCCCFF>
		Hyper Radiance: 2'600'000<br>
		Divine Radiance: 14'000'000<br>
		Kaioshin Ascension: 105'000'000<br>

"}
	if(src.Race=="Neko"&&!allowFBM)
	{
		blahh+={"<font color='990099'>Reincarnated Domestic Cat at: [Commas(2500*BaseMod*20)]<br>
		<font color='990099'>It won't die at: [Commas(25000*BaseMod*20)]<br>
		<font color='990099'>Why won't it die? at: [Commas(50000*BaseMod*20)]<br>
		<font color='990099'>Schrodinger's Descendant at: [Commas(100000*BaseMod*20)]<br>
		<font color='990099'>faggot cat: [Commas(150000*BaseMod*20)]<br>
		<font color='990099'>Lucky Cat at: [Commas(200000*BaseMod*20)]<br>
		<font color='990099'>NO NO NO NO at: [Commas(250000*BaseMod*20)]<br>
		<font color='990099'>heavy breathing at: [Commas(300000*BaseMod*20)]<br>
"}
	}
	if(src.Race=="Manakete"&&!allowFBM)
	{
		blahh+={"<font color='990099'>Ascended Dragon at: 500,000(<br>
		<font color='990099'>Divine Dragon at: 1,000,000<br>
"}
	}
	if(src.Race=="Youkai"&&src.Class=="Kitsune"&&!allowFBM)
	{
		blahh+={"<font color='#FFFF00'>Three Tails Ascension at: [Commas(25000*BaseMod*20)]<br>
		<font color='FFFF00'>Six Tails Ascension at: [Commas(100000*BaseMod*20)]<br>
		<font color='FFFF00'>Nine Tails Ascension at: [Commas(200000*BaseMod*20)]<br>
"}
	}
	if(src.Race=="Golem"&&!allowFBM)
	{
		blahh+={"<font color='#00FFFF'>Enchanted Golem at: [Commas(25000*BaseMod*20)]<br>
		<font color='00FFFF'>Blessed Ascension at: [Commas(100000*BaseMod*20)]<br>
		<font color='00FFFF'>Hallowed Ascension at: [Commas(200000*BaseMod*20)]<br>
"}
	}
	if(src.Race == "Youkai" && src.Class == "Tanuki" && !allowFBM)
	{
		blahh+={"<font color='#996600'>BALLS OF EARTH: [Commas(75000*BaseMod*20)]<br>
		<font color='#996600'>BALLS OF STEEL: [Commas(350000*BaseMod*20)]<br>
"}
	}
	if(src.Race == "Youkai" && src.Class == "Hell Raven" && !allowFBM)
	{
		blahh+={"<font color='#CC3300'>Super Hell Raven: [Commas(100000*BaseMod*20)]<br>
		<font color='#CC3300'>Nuclear Raven: [Commas(250000*BaseMod*20)]<br>
		<font color='#CC3300'>Yatagarasu: [Commas(400000*BaseMod*20)]<br>
"}
	}
	if(src.Class=="Spiral")
	{
		blahh+={"<font color='#00FF00'>Gurren Lagann Revolution: [Commas(10000*BaseMod*20)]<br>
		<font color='#00FF00'>Arc-Gurren Lagann Revolution: [Commas(50000*BaseMod*20)]<br>
		<font color='#00FF00'>Dreadnaught Revolution: lol unlockspiral = 1<br>
		<font color='#00FF00'>MAN Revolution: [Commas(250000*BaseMod*20)]<br>
		<font color='#00FF00'>WHO THE HELL DO YOU THINK I AM?! Revolution: lol unlockspiral 2<br>
"}
	}
	if(src.Class=="Sage")
	{
		blahh+={"<font color='#666666'>Path One at: [Commas(2500*BaseMod*20)]<br>
		<font color='#666666'>Path Two at: [Commas(10000*BaseMod*20)]<br>
		<font color='#666666'>Path Three at: [Commas(15000*BaseMod*20)]<br>
		<font color='#666666'>Path Four at: [Commas(50000*BaseMod*20)]<br>
		<font color='#666666'>Path Five at: [Commas(100000*BaseMod*20)]<br>
		<font color='#666666'>Path Six at: [Commas(200000*BaseMod*20)]<br>
"}
	}*/
	return blahh
	//	<font color=#FFFF00>Super Saiyan at: 1'500'000<br>Super Saiyan 2 at: 200'000'000<br>Super Saiyan 3 at: 550'000'000


obj/Package
	Crandal
		verb
			MusicToggle()
				set category="Other"
				if(usr.MusicToggle=="On")
					usr.MusicToggle="Off"
					usr<<"You have turned off music playing, and stopped all music."
					usr<<sound(null,volume=0)
				else if(usr.MusicToggle=="Off")
					usr.MusicToggle="On"
					usr<<"You have turned on music playing."

			CustomHair(var/mob/A as mob in view(usr,5))
				set src=usr.client
				set category="Other"
				if(istype(A,/mob))
					if(usr.Alert("You sure you wanna change [A]'s hair icon?"))
						var/Z=input(usr,"Choose an icon for [A]!","ChangeIcon")as icon|null
						if(Z==null)
							return
						if((length(Z) > 102400))
							usr <<"This file exceeds the limit of 100KB. It cannot be used."
							return
						if(A!=usr)
							var/hm=input(A,"Do you want to change your hair icon into [Z] which [usr] presented?")in list("No","Yes")
							if(hm=="No")
								return
//						A.Hair=Z
						var/Color=input(A,"Choose color if needed, otherwise hit cancel.") as color|null
						if(Color) Z+=Color
						A.Hair_Base=Z
						A.Hair_Color=Color
						A.Hair_Forms()
						A.Hairz("Add")

			ChangeIcon(var/atom/A as mob|obj in view(usr,5))
				set src=usr.client
				set category="Other"
				if(istype(A,/obj))
					if(istype(A,/obj/Planets)||istype(A,/obj/Oozaru)||istype(A,/obj/Lycan))
						usr<<"You're not allowed to change these icons."
						return
					if(usr.Alert("You sure you wanna change [A]'s icon?"))
						var/Z=input(usr,"Choose an icon for [A]!","ChangeIcon")as icon|null
						if(Z==null)
							return
						if((length(Z) > 102400))
							usr <<"This file exceeds the limit of 100KB. It cannot be used."
							return
						A.icon=Z
						A.icon_state=input("icon state") as text
						A.pixel_x=input("X adjustment.") as num
						A.pixel_y=input("Y adjustment.") as num
				if(istype(A,/mob))
					if(usr.CursedBeta=="Animal")
						usr << "You cannot change your icon while cursed..."
						return
					if(usr.Alert("You sure you wanna change [A]'s icon?"))
						var/Z=input(usr,"Choose an icon for [A]!","ChangeIcon")as icon|null
						if(Z==null)
							return
						if((length(Z) > 102400))
							usr <<"This file exceeds the limit of 100KB. It cannot be used."
							return
						if(A!=usr)
							var/hm=input(A,"Do you want to change your icon into [Z] which [usr] presented?")in list("No","Yes")
							if(hm=="No")
								return
						A.icon=Z
						A.pixel_x=input("X adjustment.") as num
						A.pixel_y=input("Y adjustment.") as num

			ChangeFormIcons(var/atom/A as mob in view(usr,5))
				set src=usr.client
				set category="Other"
				if(istype(A,/mob))
					if(usr.Race=="Changeling")
						if(usr.Alert("You sure you wish to change [A]'s form icons?"))
							var/Z=input(usr,"Choose an icon for [A]!","ChangeIcon")as icon|null
							if(Z==null)
								return
							if((length(Z) > 102400))
								src <<"This file exceeds the limit of 100KB. It cannot be used."
								return
							var/hm=input(A,"Which form do you wish to reicon?")in list("Form 1(Base)","Form 2","Form 3","Form 4","Form 5(Cooler Only)","Cancel")
							if(hm=="Form 1(Base)")
								usr.SCLForm_1=Z
							else if(hm=="Form 2")
								usr.SCLForm_2=Z
							else if(hm=="Form 3")
								usr.SCLForm_3=Z
							else if(hm=="Form 4")
								usr.SCLForm_4=Z
							else if(hm=="Form 5(Cooler Only)")
								usr.SCLForm_5=Z
							else if(hm=="Cancel")
								return

					else if(usr.Race=="Demon"||usr.Race=="Half Demon"||usr.Race=="Hollow")
						if(usr.Alert("You sure you wish to change [A]'s form icons?"))
							var/Z=input(usr,"Choose an icon for [A]!","ChangeIcon")as icon|null
							if(Z==null)
								return
							if((length(Z) > 102400))
								src <<"This file exceeds the limit of 100KB. It cannot be used."
								return
							var/hm=input(A,"Which form do you wish to reicon?")in list("Super Demon Body","Ascended Super Demon Body","Super Demon Hair","Ascended Super Demon Hair","","Cancel")
							if(hm=="Super Demon Body")
								usr.SuperDemonBody=Z
							else if(hm=="Ascended Super Demon Body")
								usr.SuperDemonBody2=Z
							else if(hm=="Super Demon Hair")
								usr.SuperDemonHair=Z
							else if(hm=="Ascended Super Demon Hair")
								usr.SuperDemonHair2=Z
							else if(hm=="Cancel")
								return
					else if(usr.Race=="Saiyan"||usr.Race=="Half Saiyan"||usr.Race=="Quarter Saiyan")
						if(usr.Alert("You sure you wish to change [A]'s Super Sand Hair icons?"))
							var/Z=input(usr,"Choose an icon for [A]!","ChangeIcon")as icon|null
							if(Z==null)
								return
							var/hm=input(A,"Which form do you wish to reicon?")in list("Super Saiyan","Super Saiyan 2","Super Saiyan 3","Use Default Hair","Cancel")
							if(hm=="Super Saiyan")
								usr.Hair_SSJ1=Z
							else if(hm=="Super Saiyan 2")
								usr.Hair_SSJ2=Z
							else if(hm=="Super Saiyan 3")
								usr.Hair_SSJ3=Z
							else if(hm=="Use Default Hair")
								if(!usr.Default_Hair)
									usr.Default_Hair=1
									usr<< "You are using your default hair for SSJ1."
									return
								if(usr.Default_Hair==1)
									usr.Default_Hair=0
									usr<< "You are no longer using your default hair for SSJ1."
									return
							else if(hm=="Cancel")
								return
					else if(usr.Race=="Human")
						if(usr.Alert("You sure you wish to change [A]'s High Tension hair icons?"))
						//	var/Z=input(usr,"Choose an icon for [A]!","ChangeIcon")as icon
							var/hm=input(A,"Which form do you wish to reicon?")in list("Customize High Tension","Use Default Hair","Cancel")
							if(hm=="Customize High Tension")
								var/Z=input(usr,"Choose an icon for HT Hair!","ChangeIcon")as icon|null
								if(Z==null)
									return
								usr.Hair_HT=Z
							else if(hm=="Use Default Hair")
								if(!usr.Default_Hair)
									usr.Default_Hair=1
									usr<< "You are using your default hair."
									return
								if(usr.Default_Hair==1)
									usr.Default_Hair=0
									usr<< "You are no longer using your default hair."
									return
							else if(hm=="Cancel")
								return
					else
						usr<<"Only certain races can alter their form icons."
						return

			ChangeExpandIcon(var/atom/A as mob in view(usr,5))
				set src=usr.client
				set category="Other"
				if(istype(A,/mob))
					if(usr.Alert("Are you sure you wish to change your Expand Icon?"))
						var/Z=input(usr,"Choose an icon for [A]'s Expand!","ChangeIcon")as icon|null
						if(Z==null)
							return
						usr.ExpandIcon=Z
				else
					usr<<"Only mobs have a Expand icon variable."

			Rename(var/atom/A as mob|obj in view(usr,5))
				set src=usr.client
				set category="Other"
				if(istype(A,/obj/Planets)||istype(A,/obj/PlanetFlag))
					usr<<"You're not allowed to rename these objects."
					return
				var/blah=input("") as text
				if(istype(A,/mob))
					if(A!=usr)
						usr<<"You cannot rename other people!"
						return
					else if(usr.CursedBeta=="Animal")
						usr<<"You cannot rename yourself while cursed..."
						return
				if(blah&&blah!=""&&blah!=" ")
					A.name=copytext(blah,1,30)

			DiceRoll()
				set category="Other"
				var/textstring=""
				var/total=0
				var/dienumber=input("How many dice?") as num
				if(dienumber>10)
					dienumber=10
				var/diesides=input("How many sides?") as num
				if(diesides>100)
					diesides=100
				var/diemodifer=input("Modify the total?") as num
				if(diemodifer>100)
					diemodifer=100
				if(diemodifer<-100)
					diemodifer=-100
				var/decision=input("Seperate the dice rolls?") in list("Yes","No")
				if(decision=="Yes")
					while(dienumber>0)
						var/die="1d[diesides]"
						var/dieroll=roll(die)
						textstring+="[dieroll] "
						total+=dieroll
						dienumber--
					total+=diemodifer
					usr.OMessage(10,"[usr] rolled a total of [total], rolls were [textstring].")
				if(decision=="No")
					var/dice="[dienumber]d[diesides]+[diemodifer]"
					var/roll=roll(dice)
					usr.OMessage(10,"[usr] rolled [roll] ([dienumber]d[diesides]+[diemodifer]).")

	Assess
		verb/Assess()
			set category="Other"
			//<font color="#449999">
			usr<<browse(usr.GetAssess(),"window=Assess;size=280x652")



	PowerRanks
		verb/PowerRanks()
			set category="Other"
			var/View
			if(usr.Admin)
				View={"<html><head><title>Power Ranks</title><body><br>Strongest BP:[StrongestBP]<br>Highest Energy:[StrongestEnergy]<br>Highest Points:[HighestPoints]<br>
		<font size=3><font color=red>Power Ranks:<hr><font size=2><font color=black><b>BPRank(StatRank)</b><b>EXP</b><br>"}
				var/list/people=new
				for(var/mob/M in world)
					if(M.client)
						people.Add(M.key)
				var/list/sortedpeople=dd_sortedTextList(people,0)
				for(var/x in sortedpeople)
					for(var/mob/M in world)
						if(M.key==x)
							View+="<b>[M.key]</b> - [M.GetPowerRank(2)]([M.GetPowerRank(1)])[M.EXP]<br>"
							break
			else
				View+="[usr.GetPowerRank(2)]([usr.GetPowerRank(1)])[usr.EXP]"
			usr<<browse(View,"window=Log;size=250x400")


	MaterializeSpecial
		AdminInviso=1
		verb/MakeTrainingEquipment()
			set category="Other"
			var/blah=input("make what") in list("Nevermind","Log","Bag")
			if(blah=="Nevermind")return
			if(blah=="Log")
				var/obj/Items/Tech/Log/Q=new(usr.loc)
				Q.Health=rand(115656,3213211)
			if(blah=="Bag")
				var/obj/Items/Tech/PunchingBag/Q=new(usr.loc)
				Q.Health=rand(115656,3213211)


	Colorfy
		verb/Colorize(obj/O in view(8))
			set category="Other"
			switch(input("Add, Subtract, or Multiply color?", "", text) in list ("Add", "Subtract","Multiply"))
				if("Add")
					var/rred=input("How much red?") as num
					var/ggreen=input("How much green?") as num
					var/bblue=input("How much blue?") as num
					O.icon=O.icon
					O.icon+=rgb(rred,ggreen,bblue)
				if("Subtract")
					var/rred=input("How much red?") as num
					var/ggreen=input("How much green?") as num
					var/bblue=input("How much blue?") as num
					O.icon=O.icon
					O.icon-=rgb(rred,ggreen,bblue)
				if("Multiply")
					var/colorz=input("Multiply") as color
					var/icon/I=new(O.icon)
					I.Blend((colorz),ICON_MULTIPLY)
					O.icon=I

mob/var/list/Package=new

mob/proc/CheckIfPackaged()
	//Disabled- Everyone gets these skills for now.  if(src.key=="Nightmare Zarkus")//All Packages - Owner
	if(client)
		if(!(locate(/obj/Package/Crandal,src.contents)))
			src.contents+=new/obj/Package/Crandal
		if(!(locate(/obj/Package/Assess,src.contents)))
			src.contents+=new/obj/Package/Assess
		if(!(locate(/obj/Package/Colorfy,src.contents)))
			src.contents+=new/obj/Package/Colorfy
	if(src.key==""||src.key==""||src.Admin)
		if(!(locate(/obj/Package/PowerRanks,src.contents)))
			src.contents+=new/obj/Package/PowerRanks
			src<<"Here's your Power Ranks verb, lazy fag."

	if(src.key==""||src.key==""||src.key=="") //programmers, fuck with us
		if(!(locate(/obj/Package/MaterializeSpecial,src.contents)))
			src.contents+=new/obj/Package/MaterializeSpecial