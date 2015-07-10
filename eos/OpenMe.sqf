
EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";

null=[] execVM "eos\core\spawn_fnc.sqf";

onplayerConnected {
[] execVM "eos\Functions\EOS_Markers.sqf";
};
//Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";

/* EOS 1.98 by BangaBob 
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[1,2,70],[0,1],[1,2,30],[2,45],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],
 [LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],
 [FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG]
 ,[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/
VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=false;		// Counts killed units

null = [["EOS_Chap_1","EOS_1_30","EOS_1_31","EOS_1_28","EOS_1_29","EOS_1_26","EOS_1_27","EOS_1_24","EOS_1_25","EOS_1_22","EOS_1_23","EOS_1_20","EOS_1_21","EOS_1_18","EOS_1_19","EOS_1_15","EOS_1_16","EOS_1_17","EOS_1_14","EOS_1_6","EOS_1_7","EOS_1_8","EOS_1","EOS_1_3","EOS_1_133","EOS_1_134","EOS_1_58","EOS_1_59","EOS_1_56","EOS_1_57","EOS_1_54","EOS_1_55","EOS_1_52","EOS_1_53","EOS_1_50","EOS_1_51","EOS_1_48","EOS_1_49","EOS_1_46","EOS_1_47","EOS_1_44","EOS_1_42","EOS_1_43","EOS_1_40","EOS_1_41","EOS_1_38","EOS_1_39","EOS_1_37","EOS_1_32","EOS_1_33","EOS_1_60","EOS_1_61","EOS_1_62","EOS_1_63","EOS_1_64","EOS_1_65","EOS_1_66","EOS_1_67","EOS_1_68","EOS_1_69","EOS_1_70","EOS_1_71","EOS_1_72","EOS_1_73","EOS_1_74","EOS_1_75","EOS_1_76","EOS_1_77","EOS_1_78","EOS_1_80","EOS_1_81","EOS_1_82","EOS_1_83","EOS_1_84","EOS_1_85","EOS_1_86","EOS_1_88","EOS_1_89","EOS_1_90","EOS_1_91","EOS_1_92","EOS_1_93","EOS_1_95","EOS_1_96","EOS_1_97","EOS_1_98","EOS_1_99","EOS_1_100","EOS_1_101","EOS_1_102","EOS_1_103","EOS_1_104","EOS_1_106","EOS_1_105","EOS_1_107","EOS_1_108","EOS_1_110","EOS_1_111","EOS_1_112","EOS_1_113","EOS_1_114","EOS_1_115","EOS_1_116","EOS_1_117","EOS_1_118","EOS_1_119","EOS_1_120","EOS_1_121","EOS_1_122","EOS_1_123","EOS_1_124","EOS_1_125","EOS_1_126","EOS_1_127","EOS_1_128","EOS_1_129","EOS_1_130","EOS_1_131","EOS_1_132"],[2,1,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;

/*
null = [["EOS_1_133","EOS_1_134"],[1,2,55],[1,1,45],[0,0,0],[0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1","EOS_1_3"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_6","EOS_1_7","EOS_1_8"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_14"],[1,2,55],[1,1,45],[0,0,0],[0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_16","EOS_1_17"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_15"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_18","EOS_1_19"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_20","EOS_1_21"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_22","EOS_1_23"],[1,2,55],[1,1,45],[0,0,0],[0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_24","EOS_1_25"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_26","EOS_1_27"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_28","EOS_1_29"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_30","EOS_1_31"],[1,2,55],[1,1,45],[0,0,0],[0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_32","EOS_1_33"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
//null = [["EOS_1_36"],[1,8],[1,1],[0,0],[1,2],[0,1,EAST,false],[120,2,120,TRUE,TRUE]] call Bastion_Spawn;
null = [["EOS_1_37"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_38","EOS_1_39"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_40","EOS_1_41"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_42","EOS_1_43"],[1,2,55],[1,1,45],[0,0,0],[0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_44"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_46","EOS_1_47"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_48","EOS_1_49"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_50","EOS_1_51"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_52","EOS_1_53"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_54","EOS_1_55"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_56","EOS_1_57"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_58","EOS_1_59"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_60","EOS_1_61"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_62","EOS_1_63"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_64","EOS_1_65"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_66","EOS_1_67"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_68","EOS_1_69"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_70","EOS_1_71"],[1,2,55],[1,1,45],[0,0,0],[0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_72","EOS_1_73"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_74","EOS_1_75"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_76","EOS_1_77"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_78"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_80","EOS_1_81"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_82","EOS_1_83"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_84","EOS_1_85"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_86","EOS_1_88","EOS_1_89"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_90","EOS_1_91","EOS_1_92"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_93","EOS_1_95"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_96","EOS_1_97","EOS_1_98"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_99","EOS_1_100","EOS_1_101","EOS_1_102"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_103","EOS_1_104","EOS_1_106","EOS_1_105"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_107","EOS_1_108"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_110","EOS_1_111","EOS_1_112"],[1,2,55],[1,1,45],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_113","EOS_1_114","EOS_1_115"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_116","EOS_1_117","EOS_1_118","EOS_1_119"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_120","EOS_1_121","EOS_1_122"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_123","EOS_1_124","EOS_1_125"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_126","EOS_1_127","EOS_1_128","EOS_1_129"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
null = [["EOS_1_130","EOS_1_131","EOS_1_132"],[1,2,55],[1,1,45],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,750,EAST,false]] call EOS_Spawn;
*/
// Eos on one line - Test frame rates


//null = [["EOS_Chap_1","EOS_Chap_2"],[3,3,100],[0,0,0],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,300,EAST,false]] call EOS_Spawn;
//null = [["EOS_Chap_4","EOS_Chap_3"],[3,3,100],[0,0,0],[0,0,0],[0,0,0],[0,0],[0,0,0],[0,0,750,EAST,false]] call EOS_Spawn;




