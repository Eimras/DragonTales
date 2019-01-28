obj/SaySpark
	icon='Say Spark.dmi'
	var/AnimateStuff=1
	Del()
		animate(src,alpha=0,time=10)
		spawn(10)
			..()
	New()
		Sparky()
		spawn(25)
			del src
	proc
		Sparky()
			spawn(1)
				animate(src,pixel_x=rand(-1*AnimateStuff,1*AnimateStuff),pixel_y=rand(0,1*AnimateStuff))
				spawn(1)
					animate(src,pixel_x=0,pixel_y=0)
					Sparky()
		Follow(mob/m)
			spawn(1)
				if(m)
					loc=m.loc
					Follow(m)
mob/proc/Say_Spark(Jumpy=1)
	var/obj/SaySpark/SS=new
	SS.loc=src.loc
	SS.AnimateStuff=Jumpy
	SS.Follow(src)