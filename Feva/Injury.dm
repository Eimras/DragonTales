proc
	Injure(mob/P,Amount)
		var/Injury=Amount/3
		if(P.KO)
			Injury=0
		P.TotalInjury+=Injury
		if(P.TotalInjury>99)
			P.TotalInjury=99

/*proc
	MysticInjure(mob/P,Amount)
		var/Injury=Amount/3
		if(P.KO)
			Injury=0
		P.TotalInjury+=Injury
		if(P.TotalInjury>99)
			P.TotalInjury=99*/