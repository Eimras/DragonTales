mob
	var/Boss=0

	proc
		AutoFace()
			if(src.Target in view(50))//if(src.Target:Boss&&src.Target in oview(src))
				src.dir=get_dir(src,src.Target)