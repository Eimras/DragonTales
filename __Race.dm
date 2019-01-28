RaceType
	var
		name="Generic Race"




	proc
		Get(var/stat_name)
		Set(var/stat_name, var/amount)
		ApplyRaceTo(var/mob/subject)
			subject.Race = src.name





