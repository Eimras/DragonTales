mob/proc/ObtainRelease()
	if(Class=="Shinigami" && src.Base>=src.ShikaiReq && !src.ShikaiObtained)
		if(prob(1))
			src.ZarakiType=1
		src.Obtain_Shikai()
		return



mob/proc/Obtain_Shikai()
	if(!locate(/obj/Skills/Zanpakuto/Shikai,src.contents) && !src.ZarakiType && src.Class=="Shinigami")
		src.contents+=new/obj/Skills/Zanpakuto/Shikai
		src.CustomizeShikai()
		src.ShikaiObtained=1
		return

mob/proc/CustomizeShikai()
	var/Select=input("Which type of release do you want?") in list ("Physical","Reiatsu","Defensive","Technical","Balanced","Nigga I'm Ichigo")
	switch(Select)
		if("Physical")
			for(var/obj/Skills/Zanpakuto/Shikai/S in src.contents)
				S.Physical=1
				S.StrengthBoost=1.3
				S.EnduranceBoost=1.2
		if("Reiatsu")
			for(var/obj/Skills/Zanpakuto/Shikai/S in src.contents)
				S.Reiatsu=1
				S.ForceBoost=1.3
				S.ResistanceBoost=1.2
		if("Defensive")
			for(var/obj/Skills/Zanpakuto/Shikai/S in src.contents)
				S.Physical=1
				S.ResistanceBoost=1.25
				S.EnduranceBoost=1.25
		if("Technical")
			for(var/obj/Skills/Zanpakuto/Shikai/S in src.contents)
				S.Technical=1
				S.OffenseBoost=1.2
				S.DefenseBoost=1.2
				S.SpeedBoost=1.1
		if("Balanced")
			for(var/obj/Skills/Zanpakuto/Shikai/S in src.contents)
				S.Balanced=1
				S.StrengthBoost=1.15
				S.EnduranceBoost=1.15
				S.ForceBoost=1.15
				S.ResistanceBoost=1.15
				S.OffenseBoost=1.2
				S.DefenseBoost=1.2
				S.SpeedBoost=1.1
		if("Nigga I'm Ichigo")
			for(var/obj/Skills/Zanpakuto/Shikai/S in src.contents)
				src << "Nigga you're not Ichigo."
				S.Ichigo=1
				S.StrengthBoost=1.1
				S.EnduranceBoost=1.1
				S.ForceBoost=1.1
				S.ResistanceBoost=1.1
	for(var/obj/Skills/Zanpakuto/Shikai/S in src.contents)
		S.ShikaiPoints=10
mob/proc/ObtainShikaiSkills() //I'll do this later.
	return



obj/Skills/Zanpakuto
	var/StrengthBoost=1
	var/EnduranceBoost=1
	var/ForceBoost=1
	var/ResistanceBoost=1
	var/OffenseBoost=1
	var/DefenseBoost=1
	var/SpeedBoost=1
	var/ShikaiName
	var/ShikaiCall
	var/BankaiName
	var/Ichigo
	var/Balanced
	var/Physical
	var/Reiatsu
	var/Defensive
	var/Technical
	var/ShikaiPoints=0
	Shikai
		Level=100
		Teachable=0
		desc="Don't hurt me Bones"
		verb/Shikai()
			set category="Skills"
			usr.SkillX("Shikai",src)