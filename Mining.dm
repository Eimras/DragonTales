//First part of the file: Materials! Can't do much else without those.
//Current Material list: Coal, Bronze, Iron, Steel, Gold, Diamond, and Obsidian

var/MaterialMaximum=1000
var/list/CommonResources=list("DullOre","Coal","Bronze","Iron","Steel")
var/list/RareResources=list("ShimmeringOre","Gold","Diamond","Obsidian")
var/list/UniqueResources=list("RhapsodicOre","Refractor","Klangite","Drakium","Chimerite","ApexCrystal","Mythril")


obj/HCMaterials
	icon='Materials.dmi'
	var/Weighting
	var/AmountHeld=0
	DullOre
		Weighting=50
	ShimmeringOre
		Weighting=20
	RhapsodicOre
		Weighting=5
	Coal
		icon_state="Coal"
		Weighting=30
	Bronze
		icon_state="Bronze"
		Weighting=25
	Iron
		icon_state="Iron"
		Weighting=30
	Steel
		icon_state="Steel"
		Weighting=15
	Gold
		icon_state="Gold"
		Weighting=15
	Diamond
		icon_state="Diamond"
		Weighting=10
	Obsidian
		icon_state="Obsidian"
		Weighting=10
	Refractor
		icon_state="Refractor"
		Weighting=1
	Klangite
		icon_state="Klangite"
		Weighting=1
	Drakium
		icon_state="Drakium"
		Weighting=1
	Chimerite
		icon_state="Chimerite"
		Weighting=1
	ApexCrystal
		icon_state="ApexCrystal"
		Weighting=1
	Mythril
		icon_state="Mythril"
		Weighting=1

	proc/Grab()
		var/MaterialAlreadyInInv=0
		var/MaterialCounter=0
		for(var/obj/HCMaterials/M in usr)
			if(M==src)
				MaterialAlreadyInInv=1
			MaterialCounter+=M.AmountHeld
			if(MaterialCounter>=MaterialMaximum)
				return
			if(MaterialAlreadyInInv)
				M.AmountHeld+=src.AmountHeld
				del(src)
			else
				src.loc=usr

obj/Materials
	icon='Materials.dmi'
	var/
		MaterialType //Probably should be one of the things on the Material List
		MaterialTotal //Tracks how much you actually have

	New(var/MatType as text, var/MatTotal as num)
		MaterialType = MatType
		MaterialTotal = MatTotal
		icon_state = MatType

	proc/Grab()
		var/MaterialAlreadyInInv=0
		var/MaterialCounter=0
		for(var/obj/Materials/M in usr)
			if(M.MaterialType==src.MaterialType)
				MaterialAlreadyInInv=1
			MaterialCounter+=M.MaterialTotal
			if(MaterialCounter>=MaterialMaximum)
				return
			if(MaterialAlreadyInInv)
				M.MaterialTotal+=src.MaterialTotal
				del(src)
			else
				src.loc=usr


/*	verb/Get()
		var/CurrentMaterial[0]
		for(var/obj/Materials/M in usr)
			CurrentMaterial["[M.MaterialType]"]++
		if(CurrentMaterial["[src.MaterialType]"] >= MaterialMaximum["[src.MaterialType]"])
			return
		else
			return*/

//Digging code, manual version. Also test version, as it'll ignore a node requirement the full system will have.
obj/Skills/TestDig
	Level=100
	SkillCost=5
	Learn=list("energyreq"=1000,"difficulty"=2)
	desc="A developer/admin testing tool set. Used to test the new dig system in various configurations."
	verb/Test_Dig_Random() //Used to get a random resource, with default weighting, only gives one type.
		set category="Skills"
		var/list/resourcetypes
		resourcetypes.Add(list("Coal"=list("weight"=30,"name"="Coal")))
//		var/list/resourcetypes=list("Coal"=list("weight"=30,"name"="Coal"))//,Bronze=list(weight=20,name="Bronze"),Iron=list(weight=20,name="Iron"),Steel=list(weight=15,name="Steel"),Gold=list(weight=5,name="Gold"),Diamond=list(weight=5,name="Diamond"),Obsidian=list(weight=5,name="Obsidian"))
		usr<<"DEBUG: generated resource list"
		var/resourcefound=0
		var/list/materialcheck
		for(materialcheck in resourcetypes)
			usr<<"DEBUG:[materialcheck["weight"]] Weight, name: [materialcheck["name"]]"
			var/weighting=materialcheck["weight"]
			if(prob(weighting)&&!resourcefound)
				resourcefound=materialcheck["name"]
		if(resourcefound)
			usr<<"Resource found:[resourcefound]"
			var/obj/Materials=new/obj/Materials
			Materials.New("[resourcefound]", rand(1,5))
			Materials.loc=usr.loc

//for(var/q in vars[variable])
//	usr<<"[q] - [vars[variable][q]]"

	verb/Test_Dig_Multi_Random() //Used to get a random resource, with default weighting, gives many types potentially.
		set category="Skills"
		usr<<"Starting multi dig."
		var/list/resourcetypes=list("Coal"=30,"Bronze"=20,"Iron"=20,"Steel"=15,"Gold"=5,"Diamond"=5,"Obsidian"=5)
		usr<<"Mat list generated."
		var/resourcefound=0
		for(var/materialcheck in resourcetypes)
			usr<<"Rolling chance for [materialcheck]"
			if(prob(materialcheck))
				resourcefound=materialcheck
				usr<<"Prob check passed"
			if(resourcefound)
				usr<<"Resource found:[resourcefound]"
				var/obj/Materials=new/obj/Materials
				Materials.New("[resourcefound]", rand(1,5))
				Materials.loc=usr.loc

	verb/Test_Dig_Hardcoded_Rsc()
		set category="Skills"
		var/weighting=0
		usr<<"Starting dig, drawing upon hardcoded resource list."
		var/diggingtoolcheck=0 //If the user has no digging tools at all, they can only draw from the common pool of materials.
		for(var/obj/Items/Tech/EnhanceDigger/A in usr)
			if(A.suffix)
				diggingtoolcheck=1
//				dullweight+=A.DullRate
//				shimmerweight+=A.ShimmerRate
//				rhapsodicweight+=A.RhapsodicRate
		if(!diggingtoolcheck)
			weighting-=25
		for(var/B in CommonResources)
			if(B=="DullOre")
				weighting+=50
			if(B=="Coal")
				weighting+=30
			if(B=="Iron")
				weighting+=30
			if(B=="Bronze")
				weighting+=25
			if(B=="Steel")
				weighting+=15
			if(prob(weighting))
				for(var/obj/Money/X in usr)
					X.vars["[B]"]+=1
				usr<<"Successfully got 1 [B]!"
		if(diggingtoolcheck)
			for(var/C in RareResources)
				if(C=="ShimmeringOre")
					weighting+=25
				if(C=="Gold")
					weighting+=15
				if(C=="Obsidian")
					weighting+=10
				if(C=="Diamond")
					weighting+=5
				if(prob(weighting))
					for(var/obj/Money/X in usr)
						X.vars["[C]"]+=1
					usr<<"Successfully got 1 [C]!"