/*mob/Players
	verb/Target_Switch()
		set category="Skills"
		var
			NewTarget
			NewTgtDist=25
		for(var/mob/m in oview(15,usr))
			if(m.client)
			if(get_dist(usr,m)<NewTgtDist)
				NewTgtDist=get_dist(usr,m)
				NewTarget=m
		usr.Target=NewTarget
		usr<<"You target [NewTarget]."*/

mob
	proc
		TargetSkillX(var/wut, var/obj/Skills/Z)
			switch(wut)
				if("TargetSwitch")
					var
						NewTarget
						NewTgtDist=25
					for(var/mob/m in oview(15,usr))
						if(m.client)
							if(get_dist(usr,m)<NewTgtDist)
								NewTgtDist=get_dist(usr,m)
								NewTarget=m
					usr.Target=NewTarget
					usr<<"You target [NewTarget]."
					Z.Cooldown()