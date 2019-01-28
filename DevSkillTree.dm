var/list/DevSkillTreeList=list("BlastT4"=list(),"BeamT4"=list(),"SwordT4"=list(),"UnarmedT4"=list(),"BuffT4"=list(),"MiscT4"=list(),"SuperStances"=list())
/*proc/MakeDevSkillTreeList()
	for(var/x in DevSkillTree)
		for(var/i in DevSkillTree[x])
			var/obj/DevSkillTreeObj/B=new
			B.cost=DevSkillTree[x][i]
			var/namez=i
			if(copytext("[i]",1,2)=="/")
				var/path=text2path("[i]")
				var/obj/nameref=new path
				namez=nameref.name
				spawn(3)del(nameref)
			B.path=i
			B.name="[namez] ([B.cost])"
			DevSkillTreeList[x]+=B*/
mob/proc/fml()
	usr<<"Your skills have been removed and your reward points have been reaccounted for, sorry! (not really I just didn't feel like making a new proc and needed to reset a few vars lol)"
	usr.fuckingzarkus=0
	if(usr.spentrp>500)
		usr.spentrp=500
	if(usr.TrainedRPP>500)
		usr.TrainedRPP=500
	/*for(var/obj/Skills/x in usr)
		for(var/q in SkillTree)
			if(q=="Stances")continue
			for(var/g in SkillTree[q])
				if(istype(x,text2path("[g]")))
					usr.RewardPoints+=SkillTree[q][g]
					if(usr.RewardPoints>300)
						usr.RewardPoints=300
						usr.TrainedRPP=300
						usr.spentrp=300
					del(x)*/

var/DevSkillTree=list(\
"BlastT4"=list(),\
"BeamT4"=list(),\
"SwordT4"=list("/obj/Skills/Swords/DualWield"=5),\
"UnarmedT4"=list(),\
"BuffT4"=list(),\
"MiscT4"=list("Sense"=170),\
"SuperStances"=list("Dragon"=500,"Tiger"=500,"Phoenix"=500,"Tortoise"=500)
)

/*obj/DevSkillTreeObj
	var/path
	var/cost
	icon='skilltree.dmi'
	layer=9999
	Click()
		if(copytext("[src.path]",1,2)!="/")
			if(src.path=="Dragon"||src.path=="Tiger"||src.path=="Phoenix"||src.path=="Tortoise")
				if(usr.vars["[src.path]Unlocked"])
					usr<<"You already have this Super Stance!"
					return
				else if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.RewardPoints-=src.cost
					usr.vars["[src.path]Unlocked"]=1
					usr<<"You've unlocked [src.path] Stance."
			else if(src.path=="Telepathy Bundle")
				if(locate(/obj/Skills/GlobalTelepathy, usr.contents))
					usr<<"You already have this ability!"
					return
				else if(usr.SpendableDevPoints<src.cost)
					usr<<"You don't have enough points to buy this!"
					return
				else
					usr.SpendableDevPoints-=src.cost
				//	usr.spentrp+=src.cost
					usr.contents+=new/obj/Skills/LocalTelepathy
					usr.contents+=new/obj/Skills/GlobalTelepathy
			else if(src.path=="Sense")
				if(usr.SenseUnlocked>2)
					usr<<"Sense cannot be higher then Tier 3"
					return
				else if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Dev Points to buy this!"
					return
				else
					usr.RewardPoints-=src.cost
					usr.SenseUnlocked++
					usr.contents+=new/obj/Skills/Sense
					usr<<"You've unlocked [src.path] Tier [usr.SenseUnlocked]."

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
		..()


mob/Players/verb
	devskilltreez(var/z as text)
		set hidden=1//interface verb doesnt needa be found out
		winset(usr,"skilltreegrid","cells=0x0")//clears grid
		usr<<output("RPP:[usr.RewardPoints]","STRewardPoints")
		sleep(1)
		var/p=1//used as a positioning locator for rows/columns
		for(var/obj/DevSkillTreeObj/x in DevSkillTreeList[z])
			//p++
			usr<<output(x,"skilltreegrid:1,[p]")
			p++*/


