mob/Players/verb
	Customize()
		set category="Other"
		usr.Grid("Blasts","Auras","Charges")
		src.Auraz("Remove")
	Hair()
		set category="Other"
		usr.Hairz("Remove")
		usr.Grid("Hair")
	Clothes()
		set category="Other"
		usr.Grid("Clothes")
	Build()
		set category="Other"
		if(usr.AntiBuild==1)
			usr<<"You have been blocked from using the Build command."
			return
		usr.Grid("Turfs")
//	Technology()
//		if(!usr.Genius)
//			usr<<"Only someone well vested in technology can possibly use this."
//			return
//		set category="Other"
//		usr.Grid("Tech")
	Technology()
		set category="Other"
		if(!usr.Genius)
			usr.Grid("LimitedTech")
		else
			usr.Grid("OldTech")
	Enchantment()
		set category="Other"
		if(!usr.Arcane)
			usr<<"Only someone well vested in magic can possibly use this."
			return
		usr.Grid("Enchant")

mob/proc/Auraz(var/Z)
	for(var/obj/Skills/PowerControl/M in src.contents)
		if(Z=="Add")
			src.Auraz("Remove")
			//if(src.SacredEnergyUnlocked)
			//	src.overlays+=image(sacredenergyaura)
			if(src.ssj["active"])
				if(src.ssj["active"]==1||src.ssj["active"]==2)
					if(src.Toji==1)
						src.overlays+=image('AurasBig.dmi',"Toji",pixel_x=-32)
					if(src.SSJGod&&src.Toji==0)
						src.overlays+=image(icon='Auras.dmi',icon_state="Mystic")
					if(src.Class == "Legendary"&&src.Toji==0)
						src.overlays+=image('AurasBig.dmi',"LSSJ",pixel_x=-32)
					else if(src.Class == "Hellspawn"||src.Class == "Fire God")
						src.overlays+=image('AurasBig.dmi',"Kaioken",pixel_x=-32)
					else
						if(src.Race=="1/16th Saiyan"&&src.Class=="Hope of the Future")
							if(src.ssj["active"]==1)
								src.overlays+=image('AurasBig.dmi',"HT1",pixel_x=-32)
								src.overlays+=image('FlashOfHopeBig.dmi',"",pixel_x=-32)
							if(src.ssj["active"]==2)
								src.overlays+=image('AurasBig.dmi',"HT2",pixel_x=-32)
								src.overlays+=image('FlashOfHopeTall.dmi',"",pixel_x=-32)
						else
							src.overlays+=image('AurasBig.dmi',"SSJ",pixel_x=-32)

					return
				if(src.ssj["active"]>2)
					if(src.Class=="Legendary")
						src.overlays+=image('Amazing LSSj Aura.dmi',pixel_x=-32)
					else
						src.overlays+=image('Amazing SSj Aura.dmi',pixel_x=-32)

			else if(src.trans["active"])
				src.Auraz("Remove")
				if(src.Race=="Youkai"&&src.Class=="Hell Raven")
					if(src.trans["active"]==1)
						src.overlays+=image(icon='NuclearRaven.dmi',icon_state="One",pixel_x=-32)
					if(src.trans["active"]==2)
						src.overlays+=image(icon='NuclearRaven.dmi',icon_state="Two",pixel_x=-32)
						src.overlays+=image(icon='NuclearRavenSparks.dmi',icon_state="Two")
					if(src.trans["active"]==3)
						src.overlays+=image(icon='NuclearRaven.dmi',icon_state="Three",pixel_x=-32)
						src.overlays+=image(icon='NuclearRavenSparks.dmi',icon_state="Three")

				if(src.Race=="Nobody")
					if(src.trans["active"]>=1)
						if(!src.WoNing)
							src.overlays+=image('TwilightSpectre.dmi', pixel_x=-32)
						else
							src.overlays+=image('TwilightSpectre.dmi', icon_state="WoN", pixel_x=-32)
				if(src.Race=="Neko"||src.Toji)
					if(src.trans["active"]==1)
						src.overlays+=image('FriskyNekoOne.dmi', pixel_x=-32)
					if(src.trans["active"]==2)
						src.overlays+=image('FriskyNekoTwo.dmi', pixel_x=-32)
					if(src.trans["active"]==3)
						src.overlays+=image('FriskyNekoThree.dmi', pixel_x=-32)
				else if(src.Race=="Kurama")
					if(src.Toji==1)
						src.overlays+=image('AurasBig.dmi',"Toji",pixel_x=-32)
					else
						src.overlays+=image('AuraMystic.dmi',pixel_x=-32)
				else if((src.Race=="Human"||src.Race=="1/16th Saiyan")&&!src.MazokuAscend)
					//if(src.Toji==1)
					//	src.overlays+=image('AurasBig.dmi',"Toji",pixel_x=-32)
					if(src.Class=="Dhampir"&&src.Toji==0)
						if(src.trans["active"]>0)
							src.overlays+=image('AurasBig.dmi',"Demon",pixel_x=-32)
					else if(src.Class=="Quincy"&&src.Toji==0)
						if(src.trans["active"]>0)
							src.overlays+=image('AurasBig.dmi',"Vollstandig",pixel_x=-32)
					else if(src.Class=="Spiral"&&src.Toji==0)
					{
						if(src.trans["active"]==1)
						{
							src.overlays+=image('SpiralBigAura.dmi',"",pixel_x=-32);
						}
						if(src.trans["active"]==2)
						{
							src.overlays+=image('SpiralAura.dmi',"",pixel_x=-32);
						}
					}
					else if(src.Class=="Hope of the Future")
						if(src.trans["active"]==1)
							src.overlays+=image('AurasBig.dmi',"HT1",pixel_x=-32)
							src.overlays+=image('FlashOfHopeBig.dmi',"",pixel_x=-32)
						if(src.trans["active"]==2)
							src.overlays+=image('AurasBig.dmi',"HT2",pixel_x=-32)
							src.overlays+=image('FlashOfHopeTall.dmi',"",pixel_x=-32)
					else
						if(src.trans["active"]==1)
							src.overlays+=image('AurasBig.dmi',"HT1",pixel_x=-32)
						else if(src.trans["active"]==2)
							src.overlays+=image('AurasBig.dmi',"HT2",pixel_x=-32)
				/*else if(src.Race=="Youkai")
				{
					if(src.Class == "Hell Raven")
						{
						if(src.trans["active"]==1)
						{
							src.overlays+=image('SuperHellRaven.dmi', pixel_x=-32);
						}
						if(src.trans["active"]==2)
						{
							src.overlays+=image('NuclearRaven.dmi', pixel_x=-32);
						}
						if(src.trans["active"]==3)
						{
							src.overlays+=image('Yatagarasu.dmi', pixel_x=-32);
						}
					}
				}*/
				else if(src.Race=="Demon" || src.Race=="Half Demon" || src.MazokuAscend || src.Race=="Dhampir")
					if(src.trans["active"]>0)
						if(src.Toji==1)
							src.overlays+=image('AurasBig.dmi',"Toji",pixel_x=-32)
						else
							src.overlays+=image('AurasBig.dmi',"Demon",pixel_x=-32)
				else if(src.Race=="Hollow")
					if(src.trans["active"]>0)
						if(src.Toji==1)
							src.overlays+=image('AurasBig.dmi',"Toji",pixel_x=-32)
						else if(src.Class=="Vasto Arrancar")
							src.overlays+=image('Demonic Aura.dmi',"Vastocar",pixel_x=-32)
						else if(src.Class=="Ascended Arrancar")
							src.overlays+=image('Demonic Aura.dmi',"Ascended",pixel_x=-32)
						else
							src.overlays+=image('Demonic Aura.dmi',pixel_x=-32)
				else if(src.Race=="Kaio")
					if(src.trans["active"]>0)
						src.overlays+=image('AurasBig.dmi',"Rainbow",pixel_x=-32)
				else if(src.Race=="Heran")
					if(src.trans["active"]>0)
						if(src.Toji==1)
							src.overlays+=image('AurasBig.dmi',"Toji",pixel_x=-32)
						else
							src.overlays+=image('AurasBig.dmi',"Heran",pixel_x=-32)
					if(src.Class=="Dhampir")
						if(src.trans["active"]>0)
							src.overlays+=image('AurasBig.dmi',"Demon",pixel_x=-32)
					else
						if(src.trans["active"]==1||src.trans["active"]==2)
							src.overlays+=image('AurasBig.dmi',"HT1",pixel_x=-32)
						else if(src.trans["active"]>2)
							src.overlays+=image('AurasBig.dmi',"HT2",pixel_x=-32)
				else if(src.Race=="Namekian")
					if(src.trans["active"]>0)
						if(src.Class=="Ancient")
							src.overlays+=image('Amazing Super Namekian Aura.dmi',pixel_x=-32)
						else if(src.Toji==1)
							src.overlays+=image('AurasBig.dmi',"Toji",pixel_x=-32)
						else
							src.overlays+=image('AurasBig.dmi',"Namekian",pixel_x=-32)
				else if(src.Race=="Changeling")
					if(src.Class=="King Kold")
						if(src.trans["active"]>0)
							src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
					else if(src.Class=="Chilled")
						if(src.trans["active"]>1)
							src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
					else if(src.Class=="Frieza"||src.Class=="Cooler")
						if(src.trans["active"]>2)
							src.overlays+=image('AurasBig.dmi',"Changeling",pixel_x=-32)
			else if(src.JinchLevel>=1&&!src.JinVersionOne&&!src.JinVersionTwo&&!src.KyuubiControlledMode&&!src.JinFullTrans)
				src.overlays+=image(icon='BijuuInitial.dmi', pixel_x=-32, pixel_y=-32)
			else if(src.ssj4active==1)
				src.overlays+=image('Amazing SSj4 Aura.dmi',pixel_x=-32)
			else if(src.DragonballCount>6)
				src.overlays+=image('DragonAura.dmi',pixel_x=-32)
			else
				src.overlays += image(M.sicon,M.sicon_state,pixel_x=M.pixel_x,pixel_y=M.pixel_y)
		if(Z=="Remove")
			src.overlays -= image(M.sicon,M.sicon_state,pixel_x=M.pixel_x,pixel_y=M.pixel_y)
			src.overlays-=image(icon='BijuuInitial.dmi', pixel_x=-32, pixel_y=-32)
			src.overlays-=image('SuperHellRaven.dmi', pixel_x=-32);
			src.overlays-=image('NuclearRaven.dmi', pixel_x=-32);
			src.overlays-=image('Yatagarasu.dmi', pixel_x=-32);
			src.overlays-=image('DragonAura.dmi',pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"SSJ",pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"LSSJ",pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"Kaioken",pixel_x=-32)
			src.overlays-=image('Amazing SSj Aura.dmi',pixel_x=-32)
			src.overlays-=image('Amazing SSj4 Aura.dmi',pixel_x=-32)
			src.overlays-=image('Amazing LSSj Aura.dmi',pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"HT1",pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"HT2",pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"Demon",pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"Heran",pixel_x=-32)
			src.overlays-=image(icon='TwilightSpectre.dmi', pixel_x=-32)
			src.overlays-=image(icon='TwilightSpectre.dmi', icon_state="WoN", pixel_x=-32)
			src.overlays-=image('Amazing Super Namekian Aura.dmi',pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"Namekian",pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"Changeling",pixel_x=-32)
			src.overlays-=image('Auras.dmi',"Demi",pixel_x=-32)
			src.overlays-=image('Auras.dmi',"Rainbow",pixel_x=-32)
			src.overlays-=image('Auras.dmi',"Toji",pixel_x=-32)
			src.overlays-=image('SpiralBigAura.dmi',"",pixel_x=-32)
			src.overlays-=image('SpiralAura.dmi',"",pixel_x=-32)
			src.overlays-=image('FlashOfHopeBig.dmi',"",pixel_x=-32)
			src.overlays-=image('FlashOfHopeTall.dmi',"",pixel_x=-32)
			src.overlays-=image('AurasBig.dmi',"Vollstandig",pixel_x=-32)
			src.overlays-=image('Demonic Aura.dmi',pixel_x=-32)
			src.overlays-=image('Demonic Aura.dmi',"Vastocar",pixel_x=-32)
			src.overlays-=image('Demonic Aura.dmi',"Ascended",pixel_x=-32)
			src.overlays-=image('AuraMystic.dmi',pixel_x=-32)
			src.overlays-=image('FriskyNekoOne.dmi', pixel_x=-32)
			src.overlays-=image('FriskyNekoTwo.dmi', pixel_x=-32)
			src.overlays-=image('FriskyNekoThree.dmi', pixel_x=-32)
			src.overlays-=image(icon='NuclearRaven.dmi',icon_state="One",pixel_x=-32)
			src.overlays-=image(icon='NuclearRaven.dmi',icon_state="Two",pixel_x=-32)
			src.overlays-=image(icon='NuclearRavenSparks.dmi',icon_state="Two")
			src.overlays-=image(icon='NuclearRaven.dmi',icon_state="Three",pixel_x=-32)
			src.overlays-=image(icon='NuclearRavenSparks.dmi',icon_state="Three")
			if(src.SSJGod)
				src.overlays-=image(icon='Auras.dmi',icon_state="Mystic")

mob/proc/Chargez(var/Z)
	if(Z=="Add")
		src.overlays -= image(ChargeIcon)
		src.overlays += image(ChargeIcon)
	if(Z=="Remove")
		src.overlays -= image(ChargeIcon)


/*
mob/proc/Hairz(var/Z)
	if(Z=="Add")
		if(src.Tail)
			Tail(1)
		src.Hairz("Remove")
		Hair=Hair_Base
		if(Hair_Color) Hair+=Hair_Color
		if(src.ssj["active"]==1)
			src.overlays += src.Hair_SSJ1//image(Hair_SSJ1)
			src.overlays -= Hair
		else if(src.ssj["active"]==2)
			src.overlays += src.Hair_SSJ2//image(Hair_SSJ2)
			src.overlays -= Hair
		else if(src.ssj["active"]==3)
			src.overlays += src.Hair_SSJ3//image(Hair_SSJ3)
			src.overlays -= Hair
		else if(src.trans["active"]>=1 && src.Race=="Human")
			src.overlays+=src.Hair_HT
			src.overlays-=Hair
		else if(src.trans["active"]==1 && src.Race=="Heran")
			src.overlays+=Hair_SHeran
			src.overlays -= Hair
		else if(src.trans["active"]==2 && src.Race=="Heran")
			src.overlays+=Hair_SHeran2
			src.overlays -= Hair
	if(Z=="Remove")
		src.overlays -= Hair
		src.overlays -= src.Hair_SSJ1
		src.overlays -= src.Hair_SSJ2
		src.overlays -= src.Hair_SSJ3
		src.overlays-=src.Hair_HT
		src.overlays-=src.Hair_SHeran
		src.overlays-=src.Hair_SHeran2*/
mob/proc/Hairz(var/Z)
	if(Z=="Add")
		if(src.Tail)
			Tail(1)
		src.Hairz("Remove")
		Hair=Hair_Base
		if(Hair_Color) Hair+=Hair_Color
		if(src.ssj["active"]==1 && !src.SSJGod && src.Class != "Fire God"&& src.Class != "Legendary")
			src.overlays += src.Hair_SSJ1//image(Hair_SSJ1)
			src.overlays -= Hair
		else if(src.ssj["active"]==2)
			src.overlays += src.Hair_SSJ2//image(Hair_SSJ2)
			src.overlays -= Hair
		else if(src.ssj["active"]==3)
			src.overlays += src.Hair_SSJ3//image(Hair_SSJ3)
			src.overlays -= Hair
		else if(src.trans["active"]>=1 && src.Race=="Human")
			src.overlays += src.Hair_HT
			src.overlays -= Hair
		else if(src.trans["active"]>1 && src.Race=="Throwback") //formerly "Throwback"
			src.overlays += src.Hair_HT
			src.overlays -= Hair
		else if(src.trans["active"]>0 && src.Race=="1/16th Saiyan")
			src.overlays += src.Hair_HT
			src.overlays -= Hair
		else if(src.SSJGod)
			src.overlays+=Hair_SSJGod
			src.overlays-=Hair
		else if(src.trans["active"]==1 && (src.Race=="Demon" || src.Race=="Kurama"))
			src.overlays += src.SuperDemonHair
			src.overlays -= Hair
		else if(src.trans["active"]==2 && src.Race=="Demon")
			src.overlays += src.SuperDemonHair2
			src.overlays -= Hair
			src.overlays -= src.SuperDemonHair
		else if(src.trans["active"]==1 && src.Race=="Half Demon")
			src.overlays += src.SuperDemonHair
			src.overlays -= Hair
		else if(src.trans["active"]==2 && src.Race=="Half Demon")
			src.overlays += src.SuperDemonHair2
			src.overlays -= Hair
			src.overlays -= src.SuperDemonHair
		else if(src.trans["active"]==3 && src.Race=="Half Demon")
			src.overlays += src.SuperDemonHair2
			src.overlays -= Hair
			src.overlays -= src.SuperDemonHair
		else if(src.trans["active"]==1 && src.Race=="Heran")
			src.overlays += src.Hair_SHeran
			src.overlays -= Hair
		/*else if(src.trans["active"]==2 && src.Race=="Heran")
			src.overlays += src.Hair_SHeran2
			src.overlays -= Hair*/
		else if(src.ssj4active && src.Race=="Saiyan")
			src.overlays += src.Hair_SSJ4
			if(Hair_Color)
				src.Hair_SSJ4+=Hair_Color
			src.overlays -= Hair
		else if(src.ssj4active && src.Race=="Half Saiyan")
			src.overlays += src.Hair_SSJ4
			if(Hair_Color)
				src.Hair_SSJ4+=Hair_Color
			src.overlays -= Hair
		else
			src.overlays += Hair
	if(Z=="Remove")
		src.overlays -= Hair
		src.overlays -= src.Hair_SSJ1
		src.overlays -= src.Hair_SSJ2
		src.overlays -= src.Hair_SSJ3
		src.overlays -= src.Hair_SSJGod
		src.overlays -= src.Hair_SSJ4
		src.overlays -= src.Hair_HT
		src.overlays -= src.Hair_SHeran
		src.overlays -= src.Hair_SHeran2
		src.overlays -= src.SuperDemonHair
		src.overlays -= src.SuperDemonHair2

mob/var
	Hair
	Hair_Base
	Hair_Color
	Hair_SSJ1
	Hair_SSJ2
	Hair_SSJ3
	Hair_SSJGod
	Hair_SSJ4
	Hair_HT
	Hair_SHeran
	Hair_SHeran2
	SCLForm_1
	SCLForm_2
	SCLForm_3
	SCLForm_4
	SCLForm_5
	SCLForm_6
	SuperDemonHair
	SuperDemonHair2
	KingofBravesHair

mob/proc/Hair_Forms()
	Hair_SSJ1=null
	Hair_SSJ2=null
	Hair_SSJ3=null
	Hair_SSJGod=null
	Hair_SSJ4=null
	Hair_HT=null
	Hair_SHeran=null
	Hair_SHeran2=null
	SuperDemonHair=null
	SuperDemonHair2=null
	KingofBravesHair=null
	if(src.Race=="Saiyan"||src.Race=="Kurama"||src.Race=="Half Saiyan"||src.Race=="Human"||src.Race=="Heran"||src.Race=="Quarter Saiyan"||src.Race=="Demon"||src.Race=="Half Demon"||src.Race=="1/16th Saiyan"||src.Race=="Human")
		if(Class=="Legendary")
			Hair_SSJ3='Hair_LSSj3.dmi'
		else
			Hair_SSJ3='Hair_SSj3.dmi'
		switch(src.Hair_Base)
			if('Hair1.dmi')
				Hair_SSJ1='Hair1_SSj.dmi'
				Hair_SSJ2='Hair1_USSj.dmi'
				Hair_HT='Hair1_UHT.dmi'
			if('Hair2.dmi')
				Hair_SSJ1='Hair3_SSj.dmi'
				Hair_SSJ2='Hair3_USSj.dmi'
				Hair_HT='Hair3_HT.dmi'
			if('Hair3.dmi')
				Hair_SSJ1='Hair3_SSj.dmi'
				Hair_SSJ2='Hair3_USSj.dmi'
				Hair_HT='Hair3_HT.dmi'
			if('Hair4.dmi')
				Hair_SSJ1='Hair4_SSj.dmi'
				Hair_SSJ2='Hair4_USSj.dmi'
				Hair_HT='Hair4_UHT.dmi'
			if('Hair5.dmi')
				Hair_SSJ1='Hair4_SSj.dmi'
				Hair_SSJ2='Hair4_USSj.dmi'
				Hair_HT='Hair4_HT.dmi'
			if('Hair6.dmi')
				Hair_SSJ1='Hair1_SSj.dmi'
				Hair_SSJ2='Hair1_USSj.dmi'
				Hair_HT='Hair1_HT.dmi'
			if('Hair7.dmi')
				Hair_SSJ1='Hair7_SSj.dmi'
				Hair_SSJ2='Hair7_USSj.dmi'
				Hair_HT='Hair7_HT.dmi'
			if('Hair9.dmi')
				Hair_SSJ1='Hair9_SSj.dmi'
				Hair_SSJ2='Hair9_SSj.dmi'
				Hair_HT='Hair9_HT.dmi'
			if('Hair10.dmi')
				Hair_SSJ1='Hair15_SSj.dmi'
				Hair_SSJ2='Hair15_USSj.dmi'
				Hair_HT='Hair15_UHT.dmi'
			if('Hair11.dmi')
				Hair_SSJ1='Hair7_SSj.dmi'
				Hair_SSJ2='Hair7_USSj.dmi'
				Hair_HT='Hair7_UHT.dmi'
			if('Hair12.dmi')
				Hair_SSJ1='Hair12_SSj.dmi'
				//Hair_SSJ2='Hair12_SSj.dmi'//bah
				Hair_HT='Hair12_HT.dmi'
			if('Hair13.dmi')
				Hair_SSJ1='Hair13_SSj.dmi'
				//Hair_SSJ2='Hair13_SSj.dmi'//bah
				Hair_HT='Hair3_HT.dmi'
			if('Hair15.dmi')
				Hair_SSJ1='Hair15_SSj.dmi'
				Hair_SSJ2='Hair15_USSj.dmi'
				Hair_HT='Hair15_HT.dmi'
			if('Hair20.dmi')
				Hair_HT='Hair20_HT.dmi'
			if('Hair23.dmi')
				Hair_SSJ1='Hair7_SSj.dmi'
				Hair_SSJ2='Hair7_USSj.dmi'
				Hair_HT='Hair7_UHT.dmi'
			if('Hair26.dmi')
				Hair_HT='Hair20_HT.dmi'
			if('AndreaHair.dmi')
				Hair_SSJ1='SSjGoku Female.dmi'
				Hair_SSJ2='AndreaSuper2.dmi'
				Hair_HT='AndreaHair_HT.dmi'
			if('HairHanasia.dmi')
				Hair_SSJ1='HairHanasiaSSJ.dmi'
				Hair_SSJ2='HairHanasiaSSJ2.dmi'
			if('Amelies_Hair.dmi')
				Hair_SSJ1='Amelies_Hair_SSJ.dmi'
			if('AyameHairblack.dmi')
				Hair_SSJ1='AyameHair_Yellow.dmi'
	/*		if('HairF4.dmi')
			//	Hair_SSJ1='HairF4_SSj.dmi'
				Hair_SSJ2='HairF_USSj.dmi'*/
		if(src.Default_Hair)
			src.Hair_SSJ1=null
			src.Hair_HT=null
		if(Hair_Base)
			if(Hair_SSJ1==null || Default_Hair)
				if(Hair_Base)
					var/icon/x=new(Hair_Base)
					if(x)
						x.Blend(rgb(153,153,5),ICON_ADD)
					Hair_SSJ1=x
			if(Hair_SSJ2==null || Default_Hair)
				if(Hair_Base)
					var/icon/x=new(Hair_Base)
					if(x)
						x.Blend(rgb(150,150,-10),ICON_ADD)
					Hair_SSJ2=x
			if(Hair_SSJGod==null)
				if(Hair_Base)
					var/icon/x=new(Hair_Base)
					if(x)
						x.Blend(rgb(153,153,153),ICON_ADD)
					Hair_SSJGod=x
			if(SSJ5Hair==null)
				if(Hair_Base)
					var/icon/x=new(Hair_SSJ3)
					if(x)
						x.Blend(rgb(153,153,153),ICON_ADD)
					Hair_SSJGod=x
			if(KingofBravesHair==null)
				if(Hair_Base)
					var/icon/x=new(Hair_Base)
					if(x)
						x.Blend(rgb(108,255,182,99),ICON_ADD)
					KingofBravesHair=x
	/*		if(Hair_SSJ4==null)
				if(src.Gender=="Male")
					src.Hair_SSJ4="Hair_SSJ4.dmi"
				else if(src.Gender=="Female")
					src.Hair_SSJ4="FemaleSSJ4.dmi"*/
			if(Hair_HT==null || Default_Hair && Class!="Drampir")
				if(Hair_Base && !Default_Hair)
					var/icon/x=new(Hair_Base)
					if(x)
						if(src.Class=="Hope of the Future")
							x.Blend(rgb(-50,150,150),ICON_ADD)
						else
							x.Blend(rgb(150,-10,150),ICON_ADD)
					Hair_HT=x
				if(Default_Hair)
					var/icon/x=new(Hair_Base)
					Hair_HT=x
			if(Hair_HT==null || Default_Hair && Class=="Drampir")
				if(Hair_Base && !Default_Hair)
					var/icon/x=new(Hair_Base)
					if(x)
						x.Blend(rgb(150,-10,-10),ICON_ADD)
					Hair_HT=x
			if(Hair_HT && Class=="Drampir")
				if(Hair_HT && !Default_Hair)
					var/icon/x=new(Hair_HT)
					if(x)
						x.Blend(rgb(0,-10,-255),ICON_ADD)
					Hair_HT=x
				if(Default_Hair)
					var/icon/x=new(Hair_Base)
					Hair_HT=x
			if(Hair_SHeran==null)
				if(Hair_Base)
					var/icon/x=new(Hair_Base)
					if(x)
						x.Blend(rgb(153,0,0),ICON_ADD)
					Hair_SHeran=x
			/*if(Hair_SHeran2==null)
				if(Hair_Base)
					var/icon/x=new(Hair_Base)
					if(x)
						x.Blend(rgb(255,0,0),ICON_ADD)
					Hair_SHeran=x*/
			if(SuperDemonHair==null)
				if(Hair_Base)
					var/icon/x=new(Hair_Base)
					if(x)
						x.Blend(rgb(153,153,153),ICON_ADD)
					SuperDemonHair=x
			if(SuperDemonHair2==null)
				if(Hair_Base)
					var/icon/x=new(Hair_Base)
					if(x)
						x.Blend(rgb(153,153,190),ICON_ADD)
					SuperDemonHair2=x

proc/Add_Customizations()
	for(var/A in typesof(/obj/Hairs)) if(A!=/obj/Hairs) Hair_List+=new A
	for(var/A in typesof(/obj/Items/Wearables)) if(A!=/obj/Items/Wearables) Clothes_List+=new A
	for(var/A in typesof(/obj/Items/AlignWearable)) if(A!=/obj/Items/AlignWearable) Clothes_List+=new A
	for(var/A in typesof(/obj/Charge_Icons)) if(A!=/obj/Charge_Icons) Charge_List+=new A
	for(var/A in typesof(/obj/Aura_Icons)) if(A!=/obj/Aura_Icons) Aura_List+=new A
	for(var/A in typesof(/obj/Blast_Icons)) if(A!=/obj/Blast_Icons) Blast_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/Human)) if(A!=/obj/Creation_Icons/Human) Human_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/Alien)) if(A!=/obj/Creation_Icons/Alien) Alien_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/Demon)) if(A!=/obj/Creation_Icons/Demon) Demon_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/Heran)) if(A!=/obj/Creation_Icons/Heran) Heran_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/Makyo)) if(A!=/obj/Creation_Icons/Makyo) Makyo_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/Namekian)) if(A!=/obj/Creation_Icons/Namekian) Namekian_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/Changeling)) if(A!=/obj/Creation_Icons/Changeling) Changeling_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/BalaKrishna)) if(A!=/obj/Creation_Icons/BalaKrishna) BalaKrishna_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/Kaio)) if(A!=/obj/Creation_Icons/Kaio) Kaio_List+=new A
	for(var/A in typesof(/obj/Creation_Icons/Android)) if(A!=/obj/Creation_Icons/Android) Android_List+=new A

var/list/Hair_List=new
obj/Hairs
	proc/Hair_Click(mob/A)
		if(A.IconClicked==0)
			A.IconClicked=1
			var/Color=input(A,"Choose color") as color|null
			if(Color) src.icon+=Color
			A.Hair_Base=initial(icon)
			A.Hair_Color=Color
			A.Hair_Forms()
			A.Hairz("Add")
			A.IconClicked=0
			winshow(usr,"Grid1",0)
			src.icon=initial(icon)
	Click() Hair_Click(usr)
	None
	Bald
		icon='Hair_Bald.dmi'
	Hair_1F
		icon='HairF1.dmi'
	Hair_2F
		icon='HairF2.dmi'
	Hair_3F
		icon='HairF3.dmi'
	Hair_4F
		icon='HairF4.dmi'
	Hair_5F
		icon='HairF5.dmi'
	Hair_6F
		icon='HairF6.dmi'
	Hair_7F
		icon='HairF7.dmi'
	Hair_8F
		icon='AndreaHair.dmi'
	Hair_9F
		icon='Long-femaleblackier.dmi'
	Hair_10F
		icon='HairHanasia.dmi'
	Hair_11F
		icon='AyameHairblack.dmi'
	Hair_12F
		icon='Amelies_Hair.dmi'
	Hair_13F
		icon='Agnes Hair.dmi'
	Hair_14F
		icon='X-BitGirl Hair.dmi'
	Hair_15F
		icon='Mezu Hair.dmi'
	Hair_1
		icon='Hair1.dmi'
	Hair_2
		icon='Hair2.dmi'
	Hair_3
		icon='Hair3.dmi'
	Hair_4
		icon='Hair4.dmi'
	Hair_5
		icon='Hair5.dmi'
	Hair_6
		icon='Hair6.dmi'
	Hair_7
		icon='Hair7.dmi'
	Hair_8
		icon='Hair8.dmi'
	Hair_9
		icon='Hair9.dmi'
	Hair_10
		icon='Hair10.dmi'
	Hair_11
		icon='Hair11.dmi'
	Hair_12
		icon='Hair12.dmi'
	Hair_13
		icon='Hair13.dmi'
	Hair_14
		icon='Hair14.dmi'
	Hair_15
		icon='Hair15.dmi'
	Hair_16
		icon='Hair16.dmi'
	Hair_17
		icon='Hair17.dmi'
	Hair_18
		icon='Hair18.dmi'
	Hair_19
		icon='Hair19.dmi'
	Hair_20
		icon='Hair20.dmi'
	Hair_21
		icon='Hair21.dmi'
	Hair_22
		icon='Hair22.dmi'
	Hair_23
		icon='Hair23.dmi'
	Hair_24
		icon='Hair24.dmi'
	Hair_25
		icon='Hair25.dmi'
	Hair_26
		icon='Hair26.dmi'
	Hair_27
		icon='Hair27.dmi'
	Hair_28
		icon='Blackhairreggi.dmi'
	Hair_29
		icon='Zidane Hair.dmi'

mob/verb/ToggleInt(var/blah as text)
	set name=".ToggleInterface"
	set hidden=1
	switch(blah)
		if("Customization")
			winshow(usr,"Grid2",0)
//			if(usr.UniverseSense==1)
//				usr.UniverseSense=0

mob/proc
	Grid(var/Z,var/X,var/E)
		if(istype(src,/mob/Creation))
			winshow(src,"Grid1",0)
			sleep()
			winshow(src,"Grid1",1)
		else
			winshow(src,"Grid2",0)
			sleep()
			winshow(src,"Grid2",1)
		winset(src,"GridZ","cells=0x0")
		sleep()
		winset(src,"GridX","cells=0x0")
		var/Row=0
		if(Z=="SkillSheet")
			src<<output("Fucking skills man!","SelectedCustomize")
			for(var/obj/Skills/A in src.contents)
				Row++
				src<<output(A,"GridX:1,[Row]")
				Row++
				if(istype(A,/obj/Skills/Rank/Zanzoken))
					src<<output("<font color=white>[src.ZanzokenSkill]x","GridX:1,[Row]")
				else if(istype(x,/obj/Skills/Rank/Kaioken))
					src<<output("<font color=white>[src.KaiokenMastery]x","GridX:1,[Row]")
				else if(istype(x,/obj/Skills/Fly))
					src<<output("<font color=white>[src.FlySkill]x","GridX:1,[Row]")

				else if(istype(x,/obj/Skills/Attacks/Beams/CustomBeam))
					src<<output({"<li><b>Power:</b> [usr.CustomPower]</li>","GridX:1,[Row]"})
					Row++
					src<<output({"<li><b>Speed:</b> [usr.CustomSpeed]</li>","GridX:1,[Row]"})
					Row++
					src<<output({"<li><b>Charge Rate:</b> [usr.CustomChargeRate]x</li>","GridX:1,[Row]"})
					Row++
					src<<output({"<li><b>Distance:</b> [usr.CustomDistance]</li>","GridX:1,[Row]"})
					Row++
					src<<output({"<li><b>Drain:</b> [usr.CustomEfficiency]</li>","GridX:1,[Row]"})


				else
					src<<output("<font color=white>[A.Level]%","GridX:1,[Row]")
				Row++
				src<<output("<font color=blue>[A.desc]%","GridX:1,[Row]")







		if(X=="Auras")
			src<<output("Flashy flashy.","SelectedCustomize")
			if(locate(/obj/Skills/PowerControl,src.contents))
				for(var/A in Aura_List)
					Row++
					src<<output(A,"GridX:1,[Row]")
		if(E=="Charges")
			for(var/A in Charge_List)
				Row++
				src<<output(A,"GridX:1,[Row]")

		if(Z=="Clothes")
			src<<output("Use these to not be naked.","SelectedCustomize")
			for(var/A in Clothes_List)
				Row++
				src<<output(A,"GridX:1,[Row]")

		if(Z=="Turfs")
			src<<output("Tiles everywhere!","SelectedCustomize")
			for(var/A in Builds)
				Row++
				src<<output(A,"GridX:1,[Row]")
			if(usr.Admin)
				for(var/B in AdminBuilds)
					Row++
					src<<output(B,"GridX:1,[Row]")

		if(Z=="LimitedTech")
			src<<output("You're a bit too low tech for most stuff.","SelectedCustomize")
			for(var/obj/Money/M in usr)
				Row++
				src<<output(M,"GridX:1,[Row]")
				src<<output("[Commas(M.Level)]","GridX:2,[Row]")
			for(var/obj/BT in BasicTechnology_List)
				Row++
				src<<output(BT,"GridX:1,[Row]")
				src<<output("[Commas(BT.Cost/usr.Intelligence)]","GridX:2,[Row]")

		if(Z=="Tech")
			src<<output("High tech, low prices.","SelectedCustomize")
			for(var/obj/Money/M in usr)
				Row++
				src<<output(M,"GridX:1,[Row]")
				src<<output("[Commas(M.Level)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("BasicTechnology"))
				Row++
				src<<output("-Basic Technology-","GridX:1,[Row]")
				for(var/obj/BT in BasicTechnology_List)
					Row++
					src<<output(BT,"GridX:1,[Row]")
					src<<output("[Commas(BT.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("SwordTechnology"))
				Row++
				src<<output("-Sword Technology-","GridX:1,[Row]")
				for(var/obj/ST in SwordTechnology_List)
					Row++
					src<<output(ST,"GridX:1,[Row]")
					src<<output("[Commas(ST.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("SwordTechnology"))
				Row++
				src<<output("-Moving Technology-","GridX:1,[Row]")
				for(var/obj/ST in MovingTechnology_List)
					Row++
					src<<output(ST,"GridX:1,[Row]")
					src<<output("[Commas(ST.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("CommunicationTechnology"))
				Row++
				src<<output("-Communication Technology-","GridX:1,[Row]")
				for(var/obj/CT in CommTechnology_List)
					Row++
					src<<output(CT,"GridX:1,[Row]")
					src<<output("[Commas(CT.Cost/usr.Intelligence)]","GridX:2,[Row]")

			if(usr.TechnologyUnlocks.Find("ModernCommunicationTechnology"))
				for(var/obj/CT in ModernCommTechnology_List)
					Row++
					src<<output(CT,"GridX:1,[Row]")
					src<<output("[Commas(CT.Cost/usr.Intelligence)]","GridX:2,[Row]")

			if(usr.TechnologyUnlocks.Find("SecurityTechnology"))
				Row++
				src<<output("-Security Technology-","GridX:1,[Row]")
				for(var/obj/ST in SecurityTechnology_List)
					Row++
					src<<output(ST,"GridX:1,[Row]")
					src<<output("[Commas(ST.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("ModernSecurityTechnology"))
				for(var/obj/ST in ModernSecurityTechnology_List)
					Row++
					src<<output(ST,"GridX:1,[Row]")
					src<<output("[Commas(ST.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("MiningTechnology"))
				Row++
				src<<output("-Mining Technology-","GridX:1,[Row]")
				for(var/obj/MT in MiningTechnology_List)
					Row++
					src<<output(MT,"GridX:1,[Row]")
					src<<output("[Commas(MT.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("ModernMiningTechnology"))
				for(var/obj/MMT in ModernMiningTechnology_List)
					Row++
					src<<output(MMT,"GridX:1,[Row]")
					src<<output("[Commas(MMT.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("MaterialsTechnology"))
				for(var/obj/MATT in MaterialsTechnology_List)
					Row++
					src<<output(MATT,"GridX:1,[Row]")
					src<<output("[Commas(MATT.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("ScannerTechnology"))
				Row++
				src<<output("-Scanner Technology-","GridX:1,[Row]")
				for(var/obj/SCT in ScannerTechnology_List)
					Row++
					src<<output(SCT,"GridX:1,[Row]")
					src<<output("[Commas(SCT.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("PortableScannerTechnology"))
				for(var/obj/PST in PortableScannerTech_List)
					Row++
					src<<output(PST,"GridX:1,[Row]")
					src<<output("[Commas(PST.Cost/usr.Intelligence)]","GridX:2,[Row]")
/*			if(usr.TechnologyUnlocks.Find("DeluxeBasicScannerTechnology"))
				for(var/obj/DBST in DeluxeBasicUpgrade_List)
					Row++
					src<<output(DBST,"GridX:1,[Row]")
					src<<output("[Commas(DBST.Cost/usr.Intelligence)]","GridX:2,[Row]")*/
			if(usr.TechnologyUnlocks.Find("ModernScannerKit"))
				for(var/obj/DBST in ModernUpgradeKit_List)
					Row++
					src<<output(DBST,"GridX:1,[Row]")
					src<<output("[Commas(DBST.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("ModernScannerTechnology"))
				for(var/obj/MST in ModernScannerUpgrade_List)
					Row++
					src<<output(MST,"GridX:1,[Row]")
					src<<output("[Commas(MST.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("AdvancedScannerKit"))
				for(var/obj/DBST in AdvancedUpgradeKit_List)
					Row++
					src<<output(DBST,"GridX:1,[Row]")
					src<<output("[Commas(DBST.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("AdvancedScannerTechnology"))
				for(var/obj/MST in AdvancedScannerUpgrade_List)
					Row++
					src<<output(MST,"GridX:1,[Row]")
					src<<output("[Commas(MST.Cost/usr.Intelligence)]","GridX:2,[Row]")
/*			if(usr.TechnologyUnlocks.Find("DeluxeModernScannerTechnology"))
				for(var/obj/DMST in DeluxeModernUpgrade_List)
					Row++
					src<<output(DMST,"GridX:1,[Row]")
					src<<output("[Commas(DMST.Cost/usr.Intelligence)]","GridX:2,[Row]")*/
			if(usr.TechnologyUnlocks.Find("MedicalTechnology"))
				Row++
				src<<output("-Medical Technology-","GridX:1,[Row]")
				for(var/obj/MEDT in MedicalTechnology_List)
					Row++
					src<<output(MEDT,"GridX:1,[Row]")
					src<<output("[Commas(MEDT.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("RegenTankTechnology"))
				for(var/obj/RTT in RegenTankTechnology_List)
					Row++
					src<<output(RTT,"GridX:1,[Row]")
					src<<output("[Commas(RTT.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("RegenTankUpgrades"))
				for(var/obj/RTT in RegenTankUpgrade_List)
					Row++
					src<<output(RTT,"GridX:1,[Row]")
					src<<output("[Commas(RTT.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("ModernRegenTankUpgrades"))
				for(var/obj/RTT in ModernRegenTankUpgrades_List)
					Row++
					src<<output(RTT,"GridX:1,[Row]")
					src<<output("[Commas(RTT.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("Teleport"))
				for(var/obj/DAR in Teleportation_List)
					Row++
					src<<output(DAR,"GridX:1,[Row]")
					src<<output("[Commas(DAR.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("Cloak"))
				for(var/obj/DAR in Cloaking_List)
					Row++
					src<<output(DAR,"GridX:1,[Row]")
					src<<output("[Commas(DAR.Cost/usr.Intelligence)]","GridX:2,[Row]")
			if(usr.TechnologyUnlocks.Find("Pocket"))
				for(var/obj/DAR in Pocket_Dimension_List)
					Row++
					src<<output(DAR,"GridX:1,[Row]")
					src<<output("[Commas(DAR.Cost/usr.Intelligence)]","GridX:2,[Row]")

		if(Z=="OldTech")
			for(var/obj/Money/M in usr)
				Row++
				src<<output(M,"GridX:1,[Row]")
				src<<output("[Commas(M.Level)]","GridX:2,[Row]")
			for(var/obj/A in Technology_List)
				if(usr.IntelligenceLevel>=A.Level&&A.Level)
					Row++
					src<<output(A,"GridX:1,[Row]")
					src<<output("[Commas(A.Cost/usr.Intelligence)]","GridX:2,[Row]")

		if(Z=="Enchant")
			src<<output("Magical goods! Boil and bubble...","SelectedCustomize")
			for(var/obj/Money/M in usr)
				Row++
				src<<output(M,"GridX:1,[Row]")
				src<<output("[Commas(M.Level)]","GridX:2,[Row]")
			for(var/obj/A in Enchantments_List)
				if(usr.EnchantmentLevel>=A.Level)
					Row++
					src<<output(A,"GridX:1,[Row]")
					src<<output("[Commas(A.Cost/usr.Enchantment)]","GridX:2,[Row]")

		if(Z=="NullTester")
			for(var/mob/Players/Q in world)
//				if(Q.client!=null)
//					src<<output(Q,"GridX:1,[Row]")
//					src<<output("CLIENT OK","GridX:2,[Row]")
				if(Q.client==null)
					Row++
					src<<output(Q,"GridX:1,[Row]")
					src<<output("CLIENT NULL","GridX:2,[Row]")

		if(Z=="MaxMana")
			for(var/mob/Players/Q in world)
				Row++
				src<<output(Q,"GridX:1,[Row]")
				src<<output("Max Mana:[Q.ManaMax]","GridX:2,[Row]")

		if(Z=="ThirdEye")
			for(var/mob/Players/Q in world)
				if(Q.Race=="Human")
					Row++
					src<<output(Q,"GridX:1,[Row]")
					src<<output("Third Eye Req:[Q.ThirdEyeReq]","GridX:2,[Row]")

		if(Z=="IntelLevel")
			for(var/mob/Players/Q in world)
				Row++
				src<<output(Q,"GridX:1,[Row]")
				src<<output("IntelLvl:[Q.IntelligenceLevel]/EnchantLvl:[Q.EnchantmentLevel]","GridX:2,[Row]")

		if(Z=="LocalSense")
			src<<output("Only folks around you here!","SelectedCustomize")
			var/rangefinder
			var/rangebooster=round(usr.EnergyMax/5000)
			if(rangebooster>25)
				rangebooster=25
			for(var/mob/Players/M in world)
				if(!M.AdminInviso&&M.z==usr.z&&M!=usr)
					rangefinder=abs(usr.x-M.x)+abs(usr.y-M.y)
					if(M.Race!="Android" || M.Race=="Android" && M.PowerSense)
						if(M.Power>(10*Day))
							if(rangefinder<(50+rangebooster))
								Row++
								src<<output("[M]:","GridX:1,[Row]")
								src<<output("[Commas(usr.Get_Sense_Reading(M))]% your power,[usr.CheckDirection(M)]","GridX:2,[Row]")

		if(Z=="GlobalSense")
			src<<output("A whole planet of people!","SelectedCustomize")
			for(var/mob/Players/M in world)
				if(!M.AdminInviso&&M.z==usr.z&&M!=usr)
					if(M.Race!="Android" || M.Race=="Android" && M.PowerSense)
						if(M.Power>(20*Day))
							Row++
							src<<output("[M]:","GridX:1,[Row]")
							src<<output("[Commas(usr.Get_Sense_Reading(M))]% your power,[usr.CheckDirection(M)]","GridX:2,[Row]")

		if(Z=="UniverseSense")
			var/planetfinder
//			usr.UniverseSense=1
			src<<output("All the people...","SelectedCustomize")
			for(var/mob/Players/M in world)
				if(!M.AdminInviso)
					if(M.Race!="Android" || M.Race=="Android" && M.PowerSense)
						if(M.Power>(30*Day))
							if(M.z==1||M.z==15)
								planetfinder="Earth"
							else if(M.z==2||M.z==23)
								planetfinder="Namek"
							else if(M.z==3||M.z==22)
								planetfinder="Vegeta"
							else if(M.z==4||M.z==24)
								planetfinder="Ice"
							else if(M.z==5||M.z==25)
								planetfinder="Arconia"
							else if(M.z==6)
								planetfinder="Heaven"
							else if(M.z==7)
								planetfinder="Hell"
							else if(M.z==8)
								planetfinder="Checkpoint"
							else if(M.z==12)
								planetfinder="Space"
							else if(M.z==18||M.z==20)
								planetfinder="Sanctuary"
							else
								planetfinder="Unknown Location"
							Row++
							src<<output("[M]:","GridX:1,[Row]")
							src<<output("[Commas(usr.Get_Sense_Reading(M))]% your power,[planetfinder]","GridX:2,[Row]")

		if(Z=="Hair")
			src<<output("Select an icon!","SelectedCustomize")
			for(var/A in Hair_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
				else
					src<<output(A,"GridX:1,[Row]")
		if(Z=="Blasts")
			for(var/A in Blast_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
				else
					src<<output(A,"GridX:1,[Row]")
		if(Z=="CreationHuman")
			for(var/A in Human_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
				else
					src<<output(A,"GridX:1,[Row]")
		if(Z=="CreationSD")
			for(var/A in BalaKrishna_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
				else
					src<<output(A,"GridX:1,[Row]")

		if(Z=="CreationDemon")
			for(var/A in Demon_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
		if(Z=="CreationHeran")
			for(var/A in Heran_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")

		if(Z=="CreationAlien")
			for(var/A in Alien_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
		if(Z=="CreationNamekian")
			for(var/A in Namekian_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
		if(Z=="CreationMakyo")
			for(var/A in Makyo_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
		if(Z=="CreationChangeling")
			for(var/A in Changeling_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
		if(Z=="CreationKaio")
			for(var/A in Kaio_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")
		if(Z=="CreationAndroid")
			for(var/A in Android_List)
				Row++
				if(istype(usr,/mob/Creation))
					src<<output(A,"GridZ:1,[Row]")



var/list
	Human_List=new
	Alien_List=new
	Demon_List=new
	Heran_List=new
	Namekian_List=new
	Makyo_List=new
	Changeling_List=new
	BalaKrishna_List=new
	Kaio_List=new
	Android_List=new

obj/Creation_Icons
	proc/Creation_Click(mob/A)
		if(A.IconClicked==0)
			A.IconClicked=1
			if(A.Race=="Demi"||A.Race=="Alien"||A.Race=="Demon"||A.Race=="Spirit Doll"||A.Race=="Kaio"||A.Race=="Popo")
				var/Icon_Color=input(A,"Choose color") as color|null
				if(Icon_Color) icon+=Icon_Color
			A.IconClicked=0
			A.icon=src
			winshow(A,"Grid1",0)
			if(A.Race=="Alien"||A.Race=="Human"||A.Race=="Saiyan"||A.Race=="Demi"||A.Race=="Half Saiyan"||A.Race=="Kaio"||A.Race=="Heran"||A.Race=="Quarter Saiyan")
				A.Grid("Hair")
			//else
			//	A.BodyType()
			icon=initial(icon)
	Click() Creation_Click(usr)
	Heran
		Icon_1
			icon='HeranBase.dmi'
	Kaio
		Icon_1
			icon='CustomMale.dmi'
		Icon_2
			icon='CustomFemale.dmi'
	BalaKrishna
		Icon_1
			icon='BalaKrishna.dmi'
		Icon_2
			icon='BalaKrishna2.dmi'
	Human
		Icon_1
			icon='MaleLight.dmi'
		Icon_2
			icon='MaleTan.dmi'
		Icon_3
			icon='MaleDark.dmi'
		Icon_1Female
			icon='FemaleLight.dmi'
		Icon_2Female
			icon='FemaleTan.dmi'
		Icon_3Female
			icon='FemaleDark.dmi'
	Makyo
		Icon_1
			icon='Makyo1.dmi'
		Icon_2
			icon='Makyo2.dmi'
		Icon_3
			icon='Makyo3.dmi'
		Icon_4
			icon='Makyo4.dmi'
	Namekian
		Icon_1
			icon='Namek1.dmi'
		Icon_2
			icon='Namek2.dmi'
		Icon_3
			icon='Namek3.dmi'
		Icon_4
			icon='Namek4.dmi'
	Demon
		Icon_1
			icon='Demon1.dmi'
		Icon_2
			icon='Demon2.dmi'
		//Icon_3
		//	icon='Demon3.dmi'
		//	Click() Creation_Click(usr)
		Icon_4
			icon='Demon4.dmi'
		Icon_5
			icon='Demon5.dmi'
		Icon_6
			icon='Demon6.dmi'
		Icon_6Female
			icon='Demon6Female.dmi'
		Icon_7
			icon='Demon7.dmi'
		Icon_8
			icon='Demon8.dmi'
		Icon_9
			icon='Demon9.dmi'
	Android
		Icon_1
			icon='Android1.dmi'
		Icon_2
			icon='Android2.dmi'
		Icon_3
			icon='Android3.dmi'
		Icon_4
			icon='Android4.dmi'
		Icon_5
			icon='Android5.dmi'
		Icon_6
			icon='Android6.dmi'
		Icon_7
			icon='Android7.dmi'
		Icon_8
			icon='Android8.dmi'
		Icon_9
			icon='Android9.dmi'
		Icon_10
			icon='Android10.dmi'
		Icon_11
			icon='Android11.dmi'
		Icon_12
			icon='Android12.dmi'
	Alien
		Icon_1
			icon='Alien1.dmi'
		Icon_2
			icon='Alien2.dmi'
		Icon_3
			icon='Alien3.dmi'
		Icon_4
			icon='Alien4.dmi'
		Icon_5
			icon='Alien5.dmi'
		Icon_6
			icon='Alien6.dmi'
		Icon_7
			icon='Alien7.dmi'
		Icon_8
			icon='Alien8.dmi'
		Icon_9
			icon='Alien9.dmi'
		Icon_10
			icon='Alien10.dmi'
		Icon_10F
			icon='Alien10F.dmi'
		Icon_11
			icon='Alien11.dmi'
		Icon_12
			icon='Alien12.dmi'
		Icon_13
			icon='Alien13.dmi'
		Icon_14
			icon='Alien14.dmi'
		Icon_15
			icon='Alien15.dmi'
		Icon_16
			icon='Alien16.dmi'
		Icon_17
			icon='Alien17.dmi'
		Icon_18
			icon='Alien18.dmi'
		Icon_19
			icon='Alien19.dmi'
	Changeling
		Frieza
			icon='Frieza1.dmi'
		Cooler
			icon='Cooler1.dmi'
		King_Kold
			icon='KingKold1.dmi'

var/list/Clothes_List=new
var/list/Turfs_List=new

var/list/Aura_List=new
obj/Aura_Icons
	proc/Aura_Click(mob/A)
		if(A.IconClicked==0)
			A.IconClicked=1
//			var/HTAuraIcon=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
			var/Aura_Color=input(A,"Choose color") as color|null
			if(Aura_Color)
				icon+=Aura_Color
//				HTAuraIcon+=Aura_Color
			A.Auraz("Remove")
			for(var/obj/Skills/PowerControl/Z in A.contents)
				Z.sicon=src.icon
				Z.sicon_state=src.icon_state
			//	Z.HTAura=HTAuraIcon
			A.IconClicked=0
			icon=initial(icon)
	Click() Aura_Click(usr)
	Aura_1
		icon='Auras.dmi'
		icon_state="1"
	Aura_2
		icon='Auras.dmi'
		icon_state="2"
	Aura_3
		icon='Auras.dmi'
		icon_state="3"
	Aura_4
		icon='Auras.dmi'
		icon_state="4"
	Aura_5
		icon='Auras.dmi'
		icon_state="5"
	Aura_6
		icon='Auras.dmi'
		icon_state="6"
	Aura_7
		icon='Auras.dmi'
		icon_state="7"


var/list/Charge_List=new
obj/Charge_Icons
	proc/Charge_Click(mob/A)
		if(A.IconClicked==0)
			A.IconClicked=1
			var/Blast_Color=input(A,"Choose color") as color|null
			if(Blast_Color) icon+=Blast_Color
			A.ChargeIcon=image(src.icon,src.icon_state)
			A.IconClicked=0
			icon=initial(icon)
	Click() Charge_Click(usr)
	Charge_1
		icon='BlastCharges.dmi'
		icon_state="1"
	Charge_2
		icon='BlastCharges.dmi'
		icon_state="2"
	Charge_3
		icon='BlastCharges.dmi'
		icon_state="3"
	Charge_4
		icon='BlastCharges.dmi'
		icon_state="4"
	Charge_5
		icon='BlastCharges.dmi'
		icon_state="5"
	Charge_6
		icon='BlastCharges.dmi'
		icon_state="6"
	Charge_7
		icon='BlastCharges.dmi'
		icon_state="7"
	Charge_8
		icon='BlastCharges.dmi'
		icon_state="8"
	Charge_9
		icon='BlastCharges.dmi'
		icon_state="9"










var/list/Blast_List=new
obj/Blast_Icons
	proc/Blast_Click(mob/A)
		if(A.IconClicked==0)
			A.IconClicked=1
			var/Blast_Color=input(A,"Choose color") as color|null
			if(Blast_Color) icon+=Blast_Color
			switch(input(A,"Are you sure?") in list("Yes","No"))
				if("Yes")
					var/list/Skills=new
					Skills+="Cancel"
					for(var/obj/Skills/Attacks/B in A) Skills+=B
					var/obj/B=input(A,"Add icon to which skill?") in Skills
					if(isobj(B))
						B:sicon=icon
						B:sicon_state=icon_state
					A.IconClicked=0
				if("No")
					A.IconClicked=0
			icon=initial(icon)
	Click() Blast_Click(usr)
	Blast_1
		icon='Blasts.dmi'
		icon_state="1"
	Blast_2
		icon='Blasts.dmi'
		icon_state="2"
	Blast_3
		icon='Blasts.dmi'
		icon_state="3"
	Blast_4
		icon='Blasts.dmi'
		icon_state="4"
	Blast_5
		icon='Blasts.dmi'
		icon_state="5"
	Blast_6
		icon='Blasts.dmi'
		icon_state="6"
	Blast_7
		icon='Blasts.dmi'
		icon_state="7"
	Blast_8
		icon='Blasts.dmi'
		icon_state="8"
	Blast_9
		icon='Blasts.dmi'
		icon_state="9"
	Blast_10
		icon='Blasts.dmi'
		icon_state="10"
	Blast_11
		icon='Blasts.dmi'
		icon_state="11"
	Blast_12
		icon='Blasts.dmi'
		icon_state="12"
	Blast_13
		icon='Blasts.dmi'
		icon_state="13"
	Blast_14
		icon='Blasts.dmi'
		icon_state="14"
	Blast_15
		icon='Blasts.dmi'
		icon_state="15"
	Blast_16
		icon='Blasts.dmi'
		icon_state="16"
	Blast_17
		icon='Blasts.dmi'
		icon_state="17"
	Blast_18
		icon='Blasts.dmi'
		icon_state="18"
	Blast_19
		icon='Blasts.dmi'
		icon_state="19"
	Blast_20
		icon='Blasts.dmi'
		icon_state="20"
	Blast_21
		icon='Blasts.dmi'
		icon_state="21"
	Blast_22
		icon='Blasts.dmi'
		icon_state="22"
	Blast_23
		icon='Blasts.dmi'
		icon_state="23"
	Blast_24
		icon='Blasts.dmi'
		icon_state="24"
	Blast_25
		icon='Blasts.dmi'
		icon_state="25"
	Blast_26
		icon='Blasts.dmi'
		icon_state="26"
	Blast_27
		icon='Blasts.dmi'
		icon_state="27"
	Blast_28
		icon='Blasts.dmi'
		icon_state="28"
	Blast_29
		icon='Blasts.dmi'
		icon_state="29"
	Blast_30
		icon='Blasts.dmi'
		icon_state="30"
	Blast_31
		icon='Blasts.dmi'
		icon_state="31"
	Blast_32
		icon='Blasts.dmi'
		icon_state="32"
	Blast_33
		icon='Blasts.dmi'
		icon_state="33"
	Blast_34
		icon='Blasts.dmi'
		icon_state="34"
	Blast_35
		icon='Blasts.dmi'
		icon_state="35"
	Blast_36
		icon='Blasts.dmi'
		icon_state="36"
	Blast_37
		icon='Blasts.dmi'
		icon_state="37"
	Blast_38
		icon='Blasts.dmi'
		icon_state="38"
	Blast_39
		icon='Blasts.dmi'
		icon_state="39"
	Blast_40
		icon='Blasts.dmi'
		icon_state="40"
	Blast_41
		icon='Blasts.dmi'
		icon_state="41"
	Blast_42
		icon='Blasts.dmi'
		icon_state="42"
	Blast_43
		icon='Blasts.dmi'
		icon_state="43"
	Blast_44
		icon='Blasts.dmi'
		icon_state="44"
	Blast_45
		icon='Blasts.dmi'
		icon_state="45"
	Blast_46
		icon='Blasts.dmi'
		icon_state="46"
	Blast_47
		icon='Blasts.dmi'
		icon_state="47"
	Blast_48
		icon='Blasts.dmi'
		icon_state="48"
	Blast_49
		icon='Blasts.dmi'
		icon_state="49"
	Blast_50
		icon='Blasts.dmi'
		icon_state="50"
	Blast_51
		icon='Blasts.dmi'
		icon_state="51"
	Blast_52
		icon='Blasts.dmi'
		icon_state="52"
	Blast_53
		icon='Blasts.dmi'
		icon_state="53"
	Blast_54
		icon='Blasts.dmi'
		icon_state="54"
	Blast_55
		icon='Blasts.dmi'
		icon_state="55"
	Blast_56
		icon='Blasts.dmi'
		icon_state="56"
	Blast_57
		icon='Blasts.dmi'
		icon_state="57"
	Blast_58
		icon='Blasts.dmi'
		icon_state="58"
	Blast_59
		icon='Blasts.dmi'
		icon_state="59"
	Blast_60
		icon='Blasts.dmi'
		icon_state="60"
	Blast_61
		icon='Blasts.dmi'
		icon_state="61"
	Blast_62
		icon='Blasts.dmi'
		icon_state="62"
	Blast_63
		icon='Blasts.dmi'
		icon_state="63"
	Blast_64
		icon='Blasts.dmi'
		icon_state="64"
	Blast_65
		icon='Blasts.dmi'
		icon_state="65"
	Blast_66
		icon='Blasts.dmi'
		icon_state="66"
	Blast_67
		icon='Blasts.dmi'
		icon_state="67"
	Blast_68
		icon='Blasts.dmi'
		icon_state="68"
	Blast_69
		icon='Blasts.dmi'
		icon_state="69"
	Blast_70
		icon='Blasts.dmi'
		icon_state="70"
	Blast_71
		icon='Blasts.dmi'
		icon_state="71"
	Beam_1
		icon='Beam1.dmi'
		icon_state="head"
	Beam_2
		icon='Beam2.dmi'
		icon_state="head"
	Beam_3
		icon='Beam3.dmi'
		icon_state="head"
	Beam_4
		icon='Beam4.dmi'
		icon_state="head"
	Beam_5
		icon='Beam5.dmi'
		icon_state="head"
	Beam_6
		icon='Beam6.dmi'
		icon_state="head"
	//Beam_7
	//	icon='Beam7.dmi'
	Beam_8
		icon='Beam8.dmi'
		icon_state="head"
	Beam_9
		icon='Beam9.dmi'
		icon_state="head"
	Beam_10
		icon='Beam10.dmi'
		icon_state="head"
	Beam_11
		icon='Beam11.dmi'
		icon_state="head"
	Beam_12
		icon='Beam12.dmi'
		icon_state="head"
	Beam_13
		icon='Beam13.dmi'
		icon_state="head"
	Beam_14
		icon='Beam14.dmi'
		icon_state="head"
	Beam_15
		icon='Beam15.dmi'
		icon_state="head"
	Beam_16
		icon='Beam16.dmi'
		icon_state="head"
	Beam_17
		icon='Beam17.dmi'
		icon_state="head"
	Beam_18
		icon='Beam18.dmi'
		icon_state="head"



/*mob/proc/Customize_Stats(Amount)
	Tabs="Customize Stats"
	client.show_verb_panel=0
	while(Amount)
		switch(input(src,"Increase which stat? You have [Amount] points remaining.") in list("Strength","Endurance",\
		"Force","Resistance","Speed","Efficiency","Regeneration","Recovery","Offense","Defense"))
			if("Strength") StrengthMod+=initial(StrengthMod)*0.2
			if("Endurance") Endurance+=initial(Endurance)*0.2
			if("Force") Force+=initial(Force)*0.2
			if("Resistance") Resistance+=initial(Resistance)*0.2
			if("Speed") Speed+=initial(Speed)*0.2
			if("Efficiency") Efficiency+=initial(Efficiency)*0.2
			if("Regeneration") Regeneration+=initial(Regeneration)*0.2
			if("Recovery") Recovery+=initial(Recovery)*0.2
			if("Offense") Offense+=initial(Offense)*0.2
			if("Defense") Defense+=initial(Defense)*0.2
		Amount-=1*/