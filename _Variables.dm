var
	AdminLogCount=1 //Only thing in the code referencing this??
	AnnoyingCD=0 //Cooldown on annoying things
	GlobalZenkai=1 //Normal zenaki gain. Could perhaps be taken out due to no training
	Gains=0//1 //??????????
	EnchantmentRate=10 // Enchantment isn't in-- could perhaps be taken out
	IntRate=10 // Int gain isn't in-- could perhaps be taken out
	EnergyGains=0 // Energy gain-- could perhaps be taken out
	StatGains=0//10 //Stat gain-- could perhaps be taken out
	EXPGains=30//30 // EXP gain-- could perhaps be taken out
	SpeedEffect=1 //Can most likely be taken out?
	DiggingMultiplier=0.05
	ControlRegen=1
	ControlRecov=0.75
	ControlTrainRate=1
	ControlMedRate=1
	LeechHard=100
	DrainHard=1
	MasteryHard=1 //Used in teach
	DeclineGains=30000000 // lol decline.
	GetUpVar=2.2 // KO Timer
	sparmod=1 //Melee gain. Can possibly be taken out
	allowFBM=0 // lol FMBM
	StrongestBP //Calculation of power rank
	StrongestStats
	StatRankEffect=1
	DestroyedRacesAllowed=0 //Determines if destroyed races are allowed
	SpecialSpawnPoints=0 // Determines alternate spawn points
	ItemSaveAmounts=1 //Only part in the code. Could probably be taken out
	RecoilToggle=0 //Beam recoil
	WarpToggle=0 //Zanzoken ForceWarp. Not used in any other part but toggling it on and off; could probably be taken out
	StrongestEXP=0 //Sets strongest possible exp according to year. Helps determine power/stat rank.
	StrongestEnergy=0 //Determined how much energy raised by using rpp. Determined power rank.
	ZenkaiReset //Reset's everyone's zenkai value.
	SpeedCap=25 //Isn't present in any other part of the code; most likely can be removed
	StarsActivated=0 //Boosts Makyo BP according to number of stars
	RankToggle=1 //Alternate configuration for power ranks
	Destroyer //Anti spiral class
	DustControl=1 //Dust Toggle!
	TabTick=10 //Useless now beyond toggling it off/on.
	MinimumBase=1 //Sets minimum base
	MaximumBase=100 //Sets maximum base
	MaximumEXP=10000 //Sets maximum Exp
	NegateBPMod=1 //Proportional BP Ranks.
	GlobalTurfDestroyer //Global turf destroyer
	StarActive=1 //If Makyo star is active or not.  Can actually be taken out; the only code it's in is commented out.
	UniversalTrans //UniversalTrans code was commented out.
	HitSoundsOn //Battle sounds
	HighestPoints //Helps calculate BP/Stat rank
	PointCap=1000 //RPP Cap. Not sure if still used.
	AscensionLevel=0 // Determines ascension level.
	KSPGrav=50 //Gravity of Kaioshin planet
	LowerHellGrav=50 //Gravity of Lower Hell/Demon World
	StartingRPP=0 //Sets number of RPP players start with
	//WorldDevPoints=0 //Adds Dev points to the world
	SuperCatchUp=0 //Useful when training was in in order to catch up quickly
	StatUpdate=1 //Updates Stats
	WorldStatAmount=1 //Set's everyone's stats to a number multiplied by their mod
	BPUpdate=0 //Updates BP
	BPUpdateAmount=0 //The number of base increase
	WorldEnergyAmount=1000//30000 //Amount of energy in the world?
	WorldDamageMult=1.5 //Damage everyone in the world?
	ForceDamageMulti=1 //Alters damage for force based moves.
	WorldDefaultAcc=60 //Global accuracy
	WorldWhiffChance=20 // Global whiff
	PassiveStatCap=5 //Adjusts passive stat cap
	BaseReward=500 //Base level reward
	WorldPUDrain=1.5 //Sets the drain of PU
	KusanagiTaken
	DurendalTaken
	MasamuneTaken
	DualTaken
	CaliburTaken
	EdgeTaken
	MuramasaTaken
proc
	ResetSwords()
		KusanagiTaken=0
		DurendalTaken=0
		MasamuneTaken=0
		DualTaken=0
		CaliburTaken=0
		EdgeTaken=0
		MuramasaTaken=0

mob/Health=100
mob/var
	WoundIntent=0
	tmp/StandCried=0
	TierSPurchased //If someone has purchased a Tier S
	OneTimePassiveReset=0 // If someone has used the Redo Stats verb
	tmp/PassiveGain //Temp var for passive gain
	tmp/UsingRPP // Temp var if one is using RPP
	LogVersion=1 // Not used in any other part of the code
	fuckingzarkus=0 //???????????????
	ChaosPunching=0 //If the person is using Chaos punch
	spentrp=0 //How much RPP someone spends
	DragonballCount=0 // How many dragonballs are there?!
	ZenkaiMatch=0 //Gain from zenkai
	AntiBuild=0 // Locks out build
	Baby=0 // Do they has baby?
	Diving=0 // Are they diving underwater?
	FinalBasic=0 //Not used in other part of code; its commented out.
	FinalUnarmed=0 //Not used in other part of code; its commented out.
	NewUnarmed=0 //Not used in other part of code; its commented out.
	FinalSword=0 //Not used in other part of code; its commented out.
	FinalEarth=0 //Not used in other part of code; its commented out; earth magic
	FinalFire=0 //Not used in other part of code; its commented out; fire magic
	FinalWind=0 //Not used in other part of code; its commented out; wind magic
	FinalWater=0 //Not used in other part of code; its commented out; water magic
	AutoChecks=1 //Automatic skill learn-- could possibly be removed
	Overview=1 //If overview is toggled on or not
	AFKTimer=1200 // AFK timer stuff
	AFKTimeLimit=1200 // AFK timer stuff
	AFKIcon='DefaultAFK.dmi' // AFK icon
	AlienRacialActive // Active alien skill
	AlienRacialPassive // Passive alien skill
	Fishman
	Necromancy
	Conjure
	Conjured
	NecroRisen=0
	NecroLevel=0
	RacialsSelected=0
	PrevX
	PrevY
	PrevZ
	ESpeed=0
	CustomObj1Icon='ArtificalObj.dmi'
	CustomObj1State="QuestionMark"
	CustomObj1X=0
	CustomObj1Y=0
	CustomObj1Density=0
	CustomObj1Opacity=0
	CustomObj1Layer=3
	CustomTurfIcon='ArtificalObj.dmi'
	CustomTurfState="QuestionMark"
	CustomTurfRoof=0
	CustomTurfDensity=0
	CustomTurfOpacity=0
	tmp/GunShot=0
	tmp/mob/Transfering=0
	Special=0
	asexual=0
	Warp=0
	list/GenRaces=new
	Rewarded
	tmp/Digging=0
	Transforming=0
	Regenerate=0
	BebiAbsorbs=0
	StrongMind=0
	Steroid=0
	TrainModule=0
	MeditateModule=0
//	WarGod=0
	WrathGod=0
	list/Parents=new
	tmp/Observing=0
	tmp/SaveDelay
	tmp/SenseCD
//	tmp/UniverseSense=0
	ThirdEyeReq=0
	Tengenkotsu=0
	Tengenkotsued=0
	ZenkaiAdjusted
	Gender
	DisplayKey
	Oxygen=100
	MaxOxygen=100
	StrFocus="Balanced"
	ForFocus="Balanced"
	OffFocus="Balanced"
	Toji=0
	HealingDelay=0
	Gaining=1
	DelayMod=1
/*  CursedSword=1
	CursedSwordMastery=1
	CursedExperience=1
	CursedExperienceExperience=1*/
	Cursed=0
	KaiokenMod=1
	PlayerEXPgains=1
	KaiokenBP
	KaiokenMastery=1
	KaiokenLevel
	KaiokenActive
	SuperKaioken
	SuperKaiokenUnlocked
	PowerUp=0
	PowerDown=0
	PowerRecovery=0
	image/ChargeIcon
	AbsorbPower
	SSJ=0
	EXP=1
	Potential=1
	FlySkill=1
	FlySkillMod=1
	ZanzokenSkill=1
	ZanzokenSkillMod=1
	Race
	Class="Fighter"
	KO
	Build=0
	Inside=1
	ShallowMode=0
	UnderwaterMode=0
	Sight_Range=10
	Spawn="Earth"
	BodyType="Medium"
	PureRPMode
	BojackUnlocked=0
	CyberTrans=0
	RareModule=0
	IronLung=0
	InBojack=0
	DemiType
	OlympianReq
	InGiji
//	GijiAllowed
	GijiTrigger
	Authorized
	OriginalPotential
	OriginalBaseMod
	CyberizeMod = 1
	tmp/IconClicked=0
	tmp/Attacking
	tmp/mob/Grab
	tmp/mob/SparGuy
	PrimeAge=20.
	Power_Multiplier=1 //This changes temporarily with the use of power altering abilities.
	BaseMod=1 //The inherent power of the race this person is playing
	StrengthMod=1
	StrengthPassive=0
	Strength=1
	EnduranceMod=1
	EndurancePassive=0
	Endurance=1
	ForceMod=1
	ForcePassive=0
	Force=1
	Resistance=1
	ResistancePassive=0
	CantZanzo
	ResistanceMod=1
	SenseReq=2
	GravityMastered=1
	GravityMod=1
	Base=1
//	ElementalKaio=0
	DemonWill=0
	SuperDemon=0
	SuperDemonStats=0
	SuperDemonBody
	SuperDemonBody2
	SuperDroid=0
	SuperDroidReq=5000000
	RPPower=1 //Multiplies overall power, edited by admins to increase power when it is suited to do so.
	Gravity_Power=1
	Body=1
	EnergyMax=30000
	Energy=100
	EnergyMod=1
	EnergyPassive=0
	Regeneration=1
	RegenerationPassive=0
	Recovery=1
	RecoveryPassive=0
	ControlPower=100
	ActiveBuffs=0
	SpecialSlot=0
	Infecting=0
	CurrentlyInfected=0
	Infected=0
	Anger=0
	AngerMax=1
	AngerStorage=1
	Grow_Rate=1
	Decline=50
	Decline_Rate=1
	OffenseMod=1
	OffensePassive=0
	Age=0.1
	Birth_Year=0
	Log_Year=0
	FBM=1
	infbm=0
	usingfinalflash=0
	FreezaExpand
	FormMastery
	UltraSSJ
	Golden
	Emitter
	SSJ4Unlocked
	beenssj4=0
	ssj4active=0
	bioform2=0
	bioform3=0
	superperfect=0
	MajinForm=0
	usingbuff=0
	//Offense listed under 'atom'
	DefenseMod=1
	DefensePassive=0
	Defense=1
	SpeedMod=1
	SpeedPassive=0
	Regenning=0
	//Speed listed under 'atom
	//Skill=1 //This raisable stat multiplies Offense and Defense effect.
	Tail
	tmp/mob/Opponent
	tmp/mob/Target
	tmp/obj/Control //An object your controlling
	SenseActive=0
	SenseUnlocked=0
	Dead
	KeepBody=0
	Flying
	Charged_Power=0
	Charge_Icon
	list/TechnologyUnlocks=list()
	MaterialTechnology=0
	Intelligence=1
	IntelligenceLevel=1
	IntelligenceEXP=0
	IntelligenceEXPNeeded=1000
	IntFocus=0
	Genius=0
	Enchantment=1
	EnchantmentLevel=1
	EnchantmentEXP=0
	EnchantmentEXPNeeded=1000
	EnchantmentFocus=0
	Arcane=0
	Elixer=0 //Determines if the Elixer of Knowledge or the Nanite Intelligence Booster has been used.
	ElixerY=0
	MightConsumption=0 // Max of four. Which is a whole fruit eaten. Two means a half has been eaten. One a Quarter. 3 is 3 quarters or a quarter and a half.
	MortallyWounded
	AvatarUnique=0
	tmp/mob/Zenkai //The person you will gain Zenkai from, derived from your Opponent usually.
	Last_Zenkai
	ZenkaiAmount=0
	Zenkai_Rate=1
	Training_Rate=1 //How fast a player catches up to a superior when being taught
	Meditation_Rate=1
//	DeathBallLevel=1
	Lethal=0 //Lethality
	Timestamp=0 //Timestamp Setting
	CustomSpeed=1
	CustomChargeRate=1
	CustomPower=1
	CustomDistance=1
	CustomEfficiency=1
	CustomPoints=0
	Fusee=0
	Fused=0
	FusionTarget
	kiblade=0
	lockon=0
	axekick=0
	HeavyShot
	tmp/GetDunked
	BurningFinger //THIS HAND OF MINE IS BURNING RED
	DragonFist
	DragonFisted
	GokuDragonFist
	GokuDragonFisted
	DelayedDamage
	UsingFist
	CoinSetting="ZenniBag"
	StatModules=0
	EnhancedStrength=0
	EnhancedEndurance=0
	EnhancedReflexes=0
	EnhancedForce=0
	EnhancedResistance=0
	EnhancedOffense=0
	EnhancedDefense=0
	EnhancedSpeed=0
	JuggernautMode=0
	TurtleCannonMode=0
	HeavyDrain=0
	EnhancedSensors=0
	InternalScouter=0
	EnhancedSmell=0
	playerdescription="This character has not yet received a description..."
	ExpandIcon
	NormalIcon
	OriginalSpeedMod
	StrengthMultiplier=1
	EnduranceMultiplier=1
	SpeedMultiplier=1
	ForceMultiplier=1
	ResistanceMultiplier=1
	OffenseMultiplier=1
	DefenseMultiplier=1
	RegenerationMultiplier=1
	RecoveryMultiplier=1
	MakyoPowerBoost=0
	MakyoPowerMultiAmount=0
	WitnessedStars=0
	StarYear=0
	ShikaiReq
	ShikaiObtained
	ZarakiType
	Meditating
	MeditationCD=0
	DiggingCD=0
	TrainingCD=0
	Mystic
	MysticTrans
	MysticTransUnlocked
	Majin
	MajinTrans
	MajinTransUnlocked
	Void
	FrenzySuper=0
	//Bleach Stuff here
	SanreiActive=0
	LetztStilOn=0
	SanreiBreak=0
	BlutMode="Artere"
	BlutOn=0
	RasontengaiSaysFuckYou=0
	Arrancar=0
	GargantaTimer=0
	DevourCount=0
	ResType
	InMugetsu
	MugetsuUsed
//	Visored=0
//	InVisored=0
	VisoredStage=0
	MaskType
	MaskAlpha
//	MaskDuration=0
	SpiritBurst
	Overdrive
	LimitBreaker=0
	LimitBreakerTime=0
	GunKata
	GunKataSelected
	DONTE=0 // KOONAI
	HasGun=0
	FreeShot
	Headbutt
	tmp/Headbuttantispam=0
	WhirlwindStrike
	Stance
	StanceActive
	AdvancedStance
	AdvancedStanceActive
	TrainingStanceUnlocked=0
	TurtleStanceUnlocked=0
	CraneStanceUnlocked=0
	WolfStanceUnlocked=0
	ArmadilloStanceUnlocked=0
	BatStanceUnlocked=0
	CheetahStanceUnlocked=0
	HorseStanceUnlocked=0
	CirculationUnlocked=0
//	KyuubiStanceUnlocked=0
	WeaponBreakerUnlocked=0
	RippleStanceUnlocked=0
	ResshukenUnlocked=0
	SoulCrushingUnlocked=0
	StrongFistUnlocked=0
	StrongestFistUnlocked=0
	BlackLegUnlocked=0
	SouthpawUnlocked=0
	MonkeyUnlocked=0
	DrunkenFistUnlocked=0
	ExplosionUnlocked=0
	ChiBlockUnlocked=0
	FireFistsUnlocked=0
	EarthFistsUnlocked=0
	WaterFistsUnlocked=0
	WindFistsUnlocked=0
	SolarUnlocked=0
	MoonlightUnlocked=0
	DragonUnlocked
	PhoenixUnlocked
	TigerUnlocked
	TortoiseUnlocked
	EmptyFistUnlocked
	DyingFistsUnlocked
	HamonOverdriveUnlocked
	//rinnegan
	DevaUnlocked=0
	PretaUnlocked=0
	HumanUnlocked=0
	AsuraUnlocked=0
	NarakaUnlocked=0
	AnimalUnlocked=0
	OuterUnlocked=0
	EnhancedHearing=0

	//TTGL vars
	SpiralStrength = 0
	SpiralEndurance = 0
	SpiralResistance = 0
	SpiralResistance2 = 0
	SpiralOffense = 0
	SpiralEndless = 0
	SpiralEnergyEnabled = 0
	UnlockSpiral = 0 //0, 1, or 2
	FirstSpiralSeal=0//lol bugs
	SpiralSeal = 0 //Lock out Spiral Energy

	WatchLevel=0
	WatchType
	TheZoneLevel=0
	WeaponBreaker
	CurrentUnarmed
	BuffCalc
	Poison=0
	Poisoned=0
	Antidote=0
	Burning=0
	Burned=0
	Chilled=0
	QuickChilled=0
	SpeedDown=0
	EndBreak=0
	Endbroken=0
	Stoneskin=0
	Stoneskinned=0
	ElecShock=0
	ElecStunned=0
	PotionCD=0
	Medkitted=0
	TransLock
	EmblemTrans
	MusicToggle="On"
	WeatherEffects
	HBTCCounter
	HBTCLock
	Momentum
	AngerFail
	Effects='Effects.dmi'
	BloodDrain
	LifeDrain
	BurningShot
	BurningShotBP
	Regenerating
	UnarmedReset
	PowerSense
	SelfDestructed
	EnergyRank
	PlayerEnergyGains=1
	MugetsuRemoved
	UltimateRemoved
	StanceLock
	TabCount
	OFUnlocked
	StatDisplay=0
	EnlightenmentFruit
	ManaAmount=100
	ManaMax=100
	ManaInfusing=0
	Enlightenment
	Nirvana
	FireShield
	BlazingWrath
	SlicingW
	MeteorS
	DualWield
	TripleWield
	HexaWield
	ElementType
	SecondElementType
	ThirdElementType //Note to self: Light and Darkness go here
	ElementAuraType
	SkillRemoved
	Default_Hair
	Megiddo
	Soultear
	GigaDrillBreaking
	GigaDrillBroken
	GigaDrillClash
	GDBDamage
	LastBreath
	TitanForm
//	SunForm
	Temperature=10
	TemperatureReducer=0
	TemperatureReducerCD=0
	TemperatureReduceType
	TemperatureTolerance=0
	TemperatureToleranceType
	TemperatureLock=0
	SSJGod
	UsedTanks = 0
	FrenzyLevel
	LockOnM
	SweepingKicked
	AgonyField
	HeartlessAngel
	Divine //Makes Ki unsensible
	Immortal
	AdvancedElement
	LightningAura
	LightningArmor
	StormArmor
	MagmaArmor
	BloodArmor
	IceArmor
	ReactiveCuirass
	IceCoffined
	BloodHealthCap
	ChiBlock
	FireFists //Outdated .
	ElementalFist
	ChiBlockTimer
	BuffPotion=0 //Timer variable for buff potions
	StrengthPotion=0 //Strength Potion flag, can be 1,2,or 3.
	ForcePotion=0
	EndurancePotion=0
	ResistancePotion=0
	OffensePotion=0
	DefensePotion=0
	UsingTree //I don't have wood
	UBWUser
	UBWTarget
	Voided
	AdjustedStats
	///Nobody vars
	HeartPiece
	CompleteForm
	WONApproved
	CompleteFormApproved
	WoNing
	LunarWrath
	tmp/LunarWrathCD
	LunarRage//Recharges every time a moon comes out.
	BerserkMode
	//Hero Tier S Vars
	WarriorLevel
	WarriorType
	Resolve
	Spirit
	StrengthOfWill
	Defiance
	Believe
	BelievePower
	BeliefRequest
	//
	HTroll //accurate name
	SkillPoints
	SkillPointsSpent
	TotalSkillPoints
	SpentRPRank
	TrainedRPP
	UsedTrainedRPP
	//YYH vars
	KuramaAscension
	DemonEnergyShield
	Shotgunned
	SpiritLevel //determines spirit energy level and demon energy level.  5 is sacred.
	SpiritStyleUnlocked=0 //Toggle this to 1 to allow a player to access Spirit Style, aka Resshuken.
	SpiritWeaponChosen //Can either be Gun, Sword, or Style. Recommended to leave this be and let the game assign it.
	MadeDimensionSword
	PercentagePower=0 //Used to determine health drain from Percentage power.
	SpiritSword
	SpiritStance
	SpiritWave
	SacredEnergy
	SacredEnergyUnlocked
	JaganEye
	JaganEyeReq
	JaganAsc
	JaganAscReq
	JaganFullAsc
	MazokuAscend
	MazokuEarly
	SpiritCuffs
	SpiritCuffsGiven
	SpiritCuffsBP
	SpiritCuffsWord
	//JJBA vars
	StarPlatinum
	StarPlatUnlocked
	TheWorld
	TheWorldRequiem
	Epitaph
	EpitaphUse
	TimeFrozen
	WorldImmune=0
	GER
	BER
	KingCrimson
	SunlightYellowOverdrive
	SunlightFinal
	//Naruto Vars
	EightGates
	GateNumber
	GatesUnlocked=1
	GatesBaseLost
	SusanooCount
	EternalSusanoo
	SusanooActive
	EveningElephant
	NightGuyTarget
	AsaKujaku
	AsaFireball
	AsaKujakuFinal
	AsaKujakuued
	SageActive
	SageType //Might not finish this concept
	SageSplit //Determines if the split form was made in Sage Mode.
	SageBunshin //Determines how many are active
	Byakugan
	SharinganUnlocked
	MSSharinganUnlocked
	SharinganLevel
	SharinganActive
	SharinganStrain
	SharinganTime
	TransplantedSharingan
	EternalMangekyo
	SharinneganUnlocked
	SixPathUnlocked
	//We have become a PVP rip vars
	SSJ5Hair
	SSJ5Unlocked
	SSJ5Active
	//Pathfinder Vars
	GoddamnitJumpy
	DiplomaticImmunity
	PriceOfSafety
	SafeRPPower
	PathOfLuck
	PathOfSafety
	PathOfSacrifice
	PathOfRejuvenation
	PathOfDeath
	PathType="None"
	//TTGL Vars
	SuperSpiralMode
	SpiralAscension
	SuperSpiralIcon
	SuperSpiralAura
	TengenToppaSuperSpiralMode
	//??!!?!??!
	StealthVoid
	//ffffuuuuuuuuck
	Darlose
	AizenSplit
	AizenClone
	Berserkering
	BerserkerMod=0
	BerserkerRise=0
	BerserkerInsanity
	BerserkerInsanityLock
	JohnTheWolf
	JohnWolf
	MadScientist=0
	MadScientistType
	MadScientistRoll
	MadScientistRollv2
	SuperHumanDrug
	SuperHumanDrugTimer
	WarGod
	PridefulSoul
	Bojack
	TheKnee
	TimeAlter
	TimeAlterType
	ExplosionExpert
	Kowala
	ChinChin
	Southpaw
	SoulCrushing
	Rebooter
	OldClass
	SpiritOfWar
	SpiritCounter
	TheHunger
	Clothesline
	AlphaLycan
	//fate
	MaxWeapons
	AutoLaunch
	AutoRelease
	AutoSpawn
	Enuma
	Baleful
	Avalon
	KingOfConquerors
	InIH
	InIH2
	IHTarget
	//breaker
	EarthAndHeaven
	EarthAndHell
	BlackOriginLock
	//gates
	GatesNerf
	GatesNerfPerc
	FrontLotus
	ReverseLotus
	//curses
	CursedAlpha
	CursedBeta
	CursedRoll
	CurseTarget
	//jewjew
	TranceForm
	TranceCounter=30
	TranceObtained
	Omnislash
	OmnislashFinal
	//One Piece Vars
	WillPower
	DevilFruitType="None"
	FruitEaten //Max of one
	LogiaDefense
	//
	AscendedSSj2
	AscendedSSj2Active
	AscendedSSj3
	AscendedSSj3Active
	SSJ1Ascended
	SSJ2Ascended
	SSJ3Ascended
	ZenkaiZero
	//God of Chaos vars
	RedAscension
	OrangeAscension
	YellowAscension
	GreenAscension
	BlueAscension
	IndigoAscension
	VioletAscension
	GodOfChaosAscension
	FistOfTheChaosStar
	//Homestuck vars
	HeroLevel
	HeroTitle
	AspectTitle
	GodTierAllowed
	GodTier
	//Aspect vars
	TimeHero
	TimeHits
	list/TimeLoc = list("x"=null, "y"=null, "z"=null)
	BreathHero
	WindyThing
	DoomHero
	DeathTolls
	BloodHero
	BloodSport
	HeartHero
	SpaceHero
	SpaceHits
	SpaceDamage
	MindHero
	MindHits
	MindDodges
	LightHero
	LightLuck
	VoidHero
	VoidPain
	RageHero
	RageMax
	HopeHero
	HopeHarpoon
	LifeHero
	//Rurouni Kenshin vars
	HitenMitsurugi
	Ryutsuisen
	Ryukansen
	Ryushosen
	Kuzuryusen
	Soryusen
	//GaoGaiVars
	BraveType="None"
	BraveLevel
	BraveheartBP
	HellAndHeaven
	ProtectShade
	//Kingdom Varts
	KeybladeWielder
	KeybladeElement
	KeybladeLevel
	SecondKeyblade
	SecondKeybladeElement
	SecondKeybladeLevel
	KeybladeStatAlter
	tmp/DarkMode
	tmp/DarkModeCD //locks out anger
	DiveWeapon
	DiveAbandon
	DiveLock
	SecondChance
	SecondChanceActive
	ComboPlus
	ComboPlusNumber
	Finishered
	MPRage
	DriveActive
	DriveType="None"
	DriveCounter
	AntiFormCounter=10
	//Amatsuken vars
	AnsatsukenMod=0
	AnsatsukenStance=0 //Unlocks Ansatsuken Stance, which the game grants at T1 Ansatsuken.
	AnsatsukenUnlocked=0
	AmatsukenPath
	AmatsukenAscension
	SatsuiNoHado
	SatsuiNoHadoMastered
	SatsuiFist
	ShoryukenCount
	ShoryukenBurn
	ShoryukenQuake
	Shoryureppa
	ShinkuTatsumaki
	//Deus Ex Machina vars
	MachinaMod
	Ripper
	BladeMode
	BladeSlow
	DelayedKB
	tmp/mob/DelayedKBCatalyst
	//Jinchuuriki vars
	TailedBeast
	JinchLevel
	BijuuActive
	JinVersionOne
	JinV1FirstTrans=1
	JinVersionTwo
	JinV2FirstTrans=1
	JinFullTrans
	JinFTFirstTrans=1
	KyuubiControlledMode
	JinEnergyChange
	JinAngerAmp
	JinchBP
	//Primordial OF
	ZeusPUNerf
	FirstOF
	SecondOF
	HerculesLevel
	//dragons
	Manakete
	//Kill la Kill Reworked
	SexyMod
	LifeFiberFusion
	LifeFiberEXP
	LifeFiberTriggered
	Kamui
	KamuiShippu
	KamuiShippu2
	KamuiSenjin
	PerfectSyncKamui
	SuperKamuiAscension
	//Jojo's Bizarre variables
	RippleMod
	RipplePassive
	tmp/RebuffOverdrive
	tmp/HealingRipple
	tmp/TimelyCounter
	tmp/OverdriveBarrage
	tmp/SendoWaveKick
	//Djinn variables
	DjinnMade
	DjinnActive
	DjinnMagic
	FullDjinnActive
	DjinnName
	DjinnAction
	DjinnCry
	//Stand variables
	StandActive
	StandLevel
	StandLevelTriggered
	StandName
	StandAction
	StandCry
	StandStrength
	StandEndurance
	StandSpeed
	StandForce
	StandResistance
	StandOffense
	StandDefense
	//Vitalic
	VitalicMod
	VitalicLast
	WrathArmor
	WrathShield
	WrathBlade
	WrathOfDeva
	ShutUp
	MantraArms
	//The Force vars
	ForceSensitive
	ForceLevel
	ForceAlignment
	ShiichoUnlocked
	MakashiUnlocked
	SoresuUnlocked
	AtaruUnlocked
	ShienUnlocked
	NimanUnlocked
	VaapadUnlocked
	AltusSopor
	CuratoSalva
	Tutaminis
	ForceSpeed
	ForceStealth
	StealthSensitive
	StealthAlignment
	//UBW vars
	UBWLevel
	ProjectExcalibur
	ProjectLightbringer
	ProjectMuramasa
	ProjectDeathbringer
	ProjectDualWield
	ProjectTriWield
	ProjectWMF
	CounterGuardian
	MadeOfSwords
	PerfectProjection
	RhoAias
	InUBW
	InUBW2
	NineLives
	NineLivesFinal
	NineLivesVictim
	XStrike
	XStrikeFinal
	XStrikeVictim
	//Half Demon Ascension
	LowPower
	TuffleAscension
	NamekianAscension
	YoukaiAscension
	SaiyanAscension
	SaiyanAscensionTriggered
	SaiyanPUNerf=1
	FirstSSj=0
	FirstSSj3=0
	SSjAscension
	SSjGrade2
	SSjGrade3
	SSjAscension2
	SSjAscension3
	IsLegendarySaiyan
	IsHellspawnSaiyan
	SaiyanAnger=0
	SaiyanAngerAscensions=0
	CanTrainSSj
	CanTrainSSj2
	CanTrainSSj3
	Oozaru=0
	AscensionsUnlocked
	AscensionsAcquired
	ChangieMaxHealth
	SoldierMember
	NPCImmune
	//Willpower
	Willpower
	Miracle
	WillTriggered
	WillSpeed
	WillHealed
	WillDrain
	WillGER
	WillSecondChance
	//
	AdminHelpMute
	//TotalDevPoints
	//PurchasedDevPoints
	//SpendableDevPoints
	//DevPointBank
	//DonatedDevPoints
	ReallyBehindStat
	ReallyBehindBP
	BuildGiven
	IgnoreFlyOver=0
	TurfInvincible=0
	TotalFatigue=0
	TotalInjury=0
	AttackHardness=2 //1=light, 2=normal, 3=hard
	Pursuiting
	Pursuited
	HypersonicCombo
	HypersonicVictim
	AerialRecovery
	HealthAnnounce25
	HealthAnnounce10
	InjuryAnnounce
	InjuryAnnounce75
	InjuryAnnounce90
	UpdatedStats=0
	UpdatedBP=0
	EightArms
	OneHundredArms
	FatigueImmune
	InjuryImmune
	FallenMystic
	StatFocusLastUse
	//new tier S variables
	DamageDone
	WoundsDone
	LethalDone
	DamageTaken
	WoundsTaken
	LethalTaken
	DamageHealed
	WoundsHealed
	EnergyUsed
	FatigueUsed
	EnergyHealed
	FatigueHealed
	KillCount
	PermanentWounds=1
	FlashOfHopeFirstTime=1
	FlashOfHope
	HopeOverload
	FlashOfHopeFreePeriod
	FlashOfHopePainPeriod
	//more tier s variables
	SaiyanEXP
	TotalKeybladeEXP
	KeybladeEXP
	KeybladeUnlock
	TotalSpiralEXP
	SpiralEXP
	SpiralUnlockz
	TotalEightGatesEXP
	EightGatesEXP
	EightGatesUnlock
	TotalWeaponSoulEXP
	WeaponSoulEXP
	WeaponSoulUnlock
	TotalJaganEyeEXP
	JaganEyeEXP
	JaganEyeUnlock
	TotalHitenMitsurugiEXP
	HitenMitsurugiEXP
	HitenMitsurugiUnlock
	TotalSharinganEXP
	SharinganEXP
	SharinganUnlock
	TotalAnsatsukenEXP
	AnsatsukenEXP
	AnsatsukenUnlock
	TotalSpiritEnergyEXP
	SpiritEnergyEXP
	SpiritEnergyUnlock
	TotalHOAEXP
	HOAEXP
	HOAUnlock
	TotalKamuiEXP
	KamuiEXP
	KamuiUnlock
	TotalRippleEXP
	RippleEXP
	RippleUnlock
	TotalUBWEXP
	UBWEXP
	UBWUnlock
	BerserkEXP
	BerserkUnlock
	TotalBerserkEXP
	VaizardEXP
	VaizardUnlock
	TotalVaizardEXP
	MadScientistEXP
	MadScientistUnlock
	TotalMadScientistEXP
	//new weapon soul
	ChoosingWeapon
	WeaponSoulLevel
	SwordAccuracy=1
	WeaponSoul=0
	HolyBlade
	CorruptEdge
	Kusanagi
	Durendal
	Masamune
	SoulCalibur
	SoulEdge
	Muramasa
	WeaponMaster
	//Fusion variables
	FusionBaseStorage=0
	FusionBaseModStorage=0
	FusionStrStorage=0
	FusionEndStorage=0
	FusionSpeedStorage=0
	FusionForceStorage=0
	FusionResStorage=0
	FusionOffStorage=0
	FusionDefStorage=0
	FusionRegenStorage=0
	FusionRecovStorage=0
	FusionAngerStorage=0
	FusionTimer=0
	JumpyPunch
	NekoAscensionQueued=0
	NekoAscensionTriggered=0
	TierS
	//Variables for the new Half Demon abilities.
	Doppleganger //Lust
	WrathRevenge //Wrath
	AccelWorld //Gluttony
	Quicksilver //Sloth
	QuicksilverDamage
	QuicksilverFrozen
	YinYang //Envy
	//Kaio bullshit
	KaioAscension
	NorthAsc
	SouthAsc
	EastAsc
	WestAsc
	WestAscHealth
	//Pixel Movement bullshit
	//PixelMovespeed=4
	//Running
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//New Variables go here
	Walking
	Sneaking

	GatheringEnergy

	UltraInstinct
	Preordinance
	InstinctTrans

	Omnislash2
	OmnislashFinal2

	IsBoss
	CQCUnlocked
	CQC
	CQCRestrain
	CQCChokehold
	CQCSlam
	ConCQC
	CQCDisarm
	Cuffed
	IgnoreHandcuffs
	Handcuffed
	Cablecuffed
	Fulton

	HandsealMastery=1
	Amaterasu
	SharinGen
	SixFourPalms
	Rotation
	Rasengan
	RasenganHit
	RasenganMastery=1
	RasenganCharge
	RasenganReady
	Chidori
	Raikiri
	ChidoriHit
	ChidoriReady
	ChidoriCharge
	KageShibari
	ShadowBound
	BoundBy
	IsChoke
	ShadowGoon
	KageMastery=1
	DoubleKageDrain
	TripleKageDrain
	IsWeaker
	InGenjutsu
	Bleeding
	Tsukiyomi
	TsukiScars

	HiddenBlade //meme maid counterstrike
	HiddenBlade2 //meme maid non-injury counterstrike
	SweepingBroom //meme maid sweeping blade
	SpinCleaner //meme maid bigger sweeping blade
	MemeHomerun //revamped memewreck that's more fluff and less broken (in all ways)
	MemeTrap //more trap
	TeeHee //lay trap
	Crippled //slowed by trap
	GETEM //bot swarm attack
	PROTECCME //bot defensive shield
	ALLAAHH //exploding bots
	IdiotSandwich//food meme

/*	SMASH
	SmashLevel
	BrokenArm
	BrokenLeg
	BrokenFinger
	BrokenToes
	BrokenSkull*/

	IsDemonHunter //DH variable for future
	Trickster=0 //stances
	WingedSerpent
	LeapingLizard
	QuicksilverTime // halt boy
	Swordmaster=0 //stances
	Chaser
	Roundtrip
	RoundtripStun
	ThousandStabs
	Gunslinger=0 //stances
	BulletTime
	LeadStorm
	Royalguard=0 //stances
	Indomitable
	Retaliate
	KarmaEnergy=0
	AbsorbKarma
	DemonicWillUses=0

	PoisonBite //future naga/alien stuff
	SnakeHug // future naga stuff
	Stoned // Naga slow that becomes a stun debuff thing
	SnakeRestrain // still in a dreeeam snek eaterrrr

	IsVamp
	Banquet //its hereeeee
	TotalEssence
	EssenceMax=100
	EssenceAnnounce
	EssenceAnnounce2
	EssenceAnnounce3
	Silvermists

	Sidecut //it's hereeee, dash in line and slash through people
	Sidewhack //variant for sidecut

	SeeLines //If you have eyes on, you'll see the lines.
	MysticEyes //MEoDP, inflicts injures (MysticInjury) that don't heal by normal means. Fatigue/Injury goes up on Kaioken levels while using this.
	TrueMysticEyes //Used for when you reach Ryougi levels of mastery, your Mystic Eyes won't drain you anymore.
	OneHitKill //A one-time skill that deletes itself once used. You'll instantly put someone who attacked you to near-death with Mystic Wounds. Nanaya version.
	TrueOneHitKill //A one-time skill that deletes itself once used. You'll instantly put someone who attacked you to near-death with Mystic Wounds. Ryougi version.
	TotalMInjury //Variable for Mystic Eyes injury
	MInjuryAnnounce25
	MInjuryAnnounce50
	MInjuryAnnounce90
	NanayaMode //Ansatsuken for knives (speed/off/def up immensely)
	NanayaDash //Dash forward, or towards your target
	NanayaKick //Next attack's a shoryuken with your foot that stuns briefly.
	NanayaCombo //17-hit combo when you dash into an enemy/enemies.
	FatalStrike //The slow variable for the effects and all of that shit.
	KyokushiNanaya //Still WIP in planning.

	zblade //Reploid's 'Ki Blade'.
	ElemSaberCombo //Reploid's 3-hit combo that inflicts a variety of debuffs on the enemy. (Burn/Freeze/Stun)
	RedLotusSaber //Sweeping Blade + Tsunami Strike at 4 cardinal directions, that can't be dodged.
	SoulSaber //Great Divide with a faster cast, but heavily drains Fatigue and Mana.

	PrototypeDNA // Prototype Tier S
	DNAWeapon //Prototype Tier S

atom/var
	SenseAbility=1
	SenseRange=500
	SenseRangeOverride=0
	AdminInviso=0
	RealBP=1
	Power=1 //Current available power, a compilation of many factors. Editing will do nothing
	LogPEndurance=100
	Offense=1
	Skill=1
	Speed=1
	Efficiency=1 //Lessens the drain from energy draining abilities.
	Health=100
	Refire=20
	Gravity
	Password
	Level=1
	Savable
	Builder
	Buildable=1
	Stealable
	Spirited
	Grabbable=1
	tmp/Using
	Distance=15
	Damage_Multiplier=1
	tmp/mob/Owner
	tmp/mob/Partner
	tmp/turf/Spawn_Location
	Spawn_Timer=0
	Tabs
	isOutside
	isUnderwater

/*atom/movable/New()
	Set_Respawn(src)
	..()
atom/movable/Del()
	Respawn(src)
	..()*/
/*proc/Set_Respawn(mob/P) if(P.Spawn_Timer) P.Spawn_Location=P.loc
proc/Respawn(mob/P)
	if(P.Spawn_Timer&&P.Spawn_Location&&!P.Builder) Remake(P.type,P.Spawn_Location,P.Spawn_Timer)
	P.Spawn_Location=null
proc/Remake(Type,turf/Location,Timer) spawn(Timer) if(!Location.Builder)
	for(var/obj/A in Location) return
	new Type(Location)*/