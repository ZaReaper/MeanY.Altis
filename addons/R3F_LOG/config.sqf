/**
 * MAIN CONFIGURATION FILE
 * 
 * English and French comments
 * Commentaires anglais et français
 * 
 * (EN)
 * This file contains the configuration variables of the logistics system.
 * For the configuration of the creation factory, see the file "config_creation_factory.sqf".
 * IMPORTANT NOTE : when a logistics feature is given to an object/vehicle class name, all the classes which inherit
 *                  of the parent/generic class (according to the CfgVehicles) will also have this feature.
 *                  CfgVehicles tree view example : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 * 
 * (FR)
 * Fichier contenant les variables de configuration du système de logistique.
 * Pour la configuration de l'usine de création, voir le fichier "config_creation_factory.sqf".
 * NOTE IMPORTANTE : lorsqu'une fonctionnalité logistique est accordée à un nom de classe d'objet/véhicule, les classes
 *                   héritant de cette classe mère/générique (selon le CfgVehicles) se verront également dotées de cette fonctionnalité.
 *                   Exemple d'arborescence du CfgVehicles : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 */

/**
 * DISABLE LOGISTICS ON OBJECTS BY DEFAULT
 * 
 * (EN)
 * Define if objects and vehicles have logistics features by default,
 * or if it must be allowed explicitely on specific objects/vehicles.
 * 
 * If false : all objects are enabled according to the class names listed in this configuration file
 *            You can disable some objects with : object setVariable ["R3F_LOG_disabled", true];
 * If true :  all objects are disabled by default
 *            You can enable some objects with : object setVariable ["R3F_LOG_disabled", false];
 * 
 * 
 * (FR)
 * Défini si les objets et véhicules disposent des fonctionnalités logistiques par défaut,
 * ou si elles doivent être autorisés explicitement sur des objets/véhicules spécifiques.
 * 
 * Si false : tous les objets sont actifs en accord avec les noms de classes listés dans ce fichier
 *            Vous pouvez désactiver certains objets avec : objet setVariable ["R3F_LOG_disabled", true];
 * Si true :  tous les objets sont inactifs par défaut
 *            Vous pouvez activer quelques objets avec : objet setVariable ["R3F_LOG_disabled", false];
 */
R3F_LOG_CFG_disabled_by_default = true;

/**
 * LOCK THE LOGISTICS FEATURES TO SIDE, FACTION OR PLAYER
 * 
 * (EN)
 * Define the lock mode of the logistics features for an object.
 * An object can be locked to the a side, faction, a player (respawn) or a unit (life).
 * If the object is locked, the player can unlock it according to the
 * value of the config variable R3F_LOG_CFG_unlock_objects_timer.
 * 
 * If "none" : no lock features, everyone can used the logistics features.
 * If "side" : the object is locked to the last side which interacts with it.
 * If "faction" : the object is locked to the last faction which interacts with it.
 * If "player" : the object is locked to the last player which interacts with it. The lock is transmitted after respawn.
 * If "unit" : the object is locked to the last player which interacts with it. The lock is lost when the unit dies.
 * 
 * Note : for military objects (not civilian), the lock is initialized to the object's side.
 * 
 * See also the config variable R3F_LOG_CFG_unlock_objects_timer.
 * 
 * (FR)
 * Défini le mode de verrouillage des fonctionnalités logistics pour un objet donné.
 * Un objet peut être verrouillé pour une side, une faction, un joueur (respawn) ou une unité (vie).
 * Si l'objet est verrouillé, le joueur peut le déverrouiller en fonction de la
 * valeur de la variable de configiration R3F_LOG_CFG_unlock_objects_timer.
 * 
 * Si "none" : pas de verrouillage, tout le monde peut utiliser les fonctionnalités logistiques.
 * Si "side" : l'objet est verrouillé pour la dernière side ayant interagit avec lui.
 * Si "faction" : l'objet est verrouillé pour la dernière faction ayant interagit avec lui.
 * Si "player" : l'objet est verrouillé pour le dernier joueur ayant interagit avec lui. Le verrou est transmis après respawn.
 * Si "unit" : l'objet est verrouillé pour le dernier joueur ayant interagit avec lui. Le verrou est perdu quand l'unité meurt.
 * 
 * Note : pour les objets militaires (non civils), le verrou est initialisé à la side de l'objet.
 * 
 * Voir aussi la variable de configiration R3F_LOG_CFG_unlock_objects_timer.
 */
R3F_LOG_CFG_lock_objects_mode = "none";

/**
 * COUNTDOWN TO UNLOCK AN OBJECT
 * 
 * Define the countdown duration (in seconds) to unlock a locked object.
 * Set to -1 to deny the unlock of objects.
 * See also the config variable R3F_LOG_CFG_lock_objects_mode.
 * 
 * Défini la durée (en secondes) du compte-à-rebours pour déverrouiller un objet.
 * Mettre à -1 pour qu'on ne puisse pas déverrouiller les objets.
 * Voir aussi la variable de configiration R3F_LOG_CFG_lock_objects_mode.
 */
R3F_LOG_CFG_unlock_objects_timer = 1;

/**
 * ALLOW NO GRAVITY OVER GROUND
 * 
 * Define if movable objects with no gravity simulation can be set in height over the ground (no ground contact).
 * The no gravity objects corresponds to most of decoration and constructions items.
 * 
 * Défini si les objets déplaçable sans simulation de gravité peuvent être position en hauteur sans être contact avec le sol.
 * Les objets sans gravité correspondent à la plupart des objets de décors et de construction.
 */
R3F_LOG_CFG_no_gravity_objects_can_be_set_in_height_over_ground = true;

/**
 * LANGUAGE
 * 
 * Automatic language selection according to the game language.
 * New languages can be easily added (read below).
 * 
 * Sélection automatique de la langue en fonction de la langue du jeu.
 * De nouveaux langages peuvent facilement être ajoutés (voir ci-dessous).
 */
R3F_LOG_CFG_language = switch (language) do
{
	case "English":{"en"};
	case "French":{"fr"};
	
	// Feel free to create you own language file named "XX_strings_lang.sqf", where "XX" is the language code.
	// Make a copy of an existing language file (e.g. en_strings_lang.sqf) and translate it.
	// Then add a line with this syntax : case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};
	// For example :
	
	//case "Czech":{"cz"}; // Not supported. Need your own "cz_strings_lang.sqf"
	//case "Polish":{"pl"}; // Not supported. Need your own "pl_strings_lang.sqf"
	//case "Portuguese":{"pt"}; // Not supported. Need your own "pt_strings_lang.sqf"
	//case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};  // Need your own "LANGUAGE_CODE_strings_lang.sqf"
	
	default {"en"}; // If language is not supported, use English
};

/**
 * CONDITION TO ALLOW LOGISTICS
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny all logistics features only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow logistics only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * The condition is evaluted in real time, so it can use condition depending on the mission progress : "alive officer && taskState task1 == ""Succeeded"""
 * Or to deny logistics in a circular area defined by a marker : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/vehicle, you can use the command cursorTarget
 * To allow the logistics to everyone, just set the condition to "true".
 * 
 * (FR)
 * Cette variable permet d'utiliser une condition SQF dynamique pour autoriser ou non les fonctions logistiques sur des clients spécifiques.
 * La variable doit être une CHAINE de caractères délimitée par des guillemets et doit contenir une condition SQF valide qui sera évaluée durant la mission.
 * Par exemple pour autoriser la logistique sur seulement quelques joueurs ayant un ID de jeu connu, la variable peut être défini comme suit :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Ou elle peut se baser sur le nom de profil : "profileName in [""maxime"", ""martin"", ""marc""]"
 * Ou pour n'autoriser que l'admin de serveur : "serverCommandAvailable "#kick"""
 * Les condition sont évaluées en temps réel, et peuvent donc dépendre du déroulement de la mission : "alive officier && taskState tache1 == ""Succeeded"""
 * Ou pour interdire la logistique dans la zone défini par un marqueur circulaire : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Notez que les guillemets des chaînes de caractères dans la chaîne de condition doivent être doublés.
 * Note : si la condition dépend de l'objet/véhicule pointé, vous pouvez utiliser la commande cursorTarget
 * Pour autoriser la logistique chez tout le monde, il suffit de définir la condition à "true".
 */
R3F_LOG_CFG_string_condition_allow_logistics_on_this_client = "true";

/**
 * CONDITION TO ALLOW CREATION FACTORY
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny the access to the creation factory only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow the creation factory only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/véhicule, you can use the command cursorTarget
 * Note also that the condition is evaluted in real time, so it can use condition depending on the mission progress :
 * "alive officer && taskState task1 == ""Succeeded"""
 * To allow the creation factory to everyone, just set the condition to "true".
 * 
 * (FR)
 * Cette variable permet d'utiliser une condition SQF dynamique pour rendre accessible ou non l'usine de création sur des clients spécifiques.
 * La variable doit être une CHAINE de caractères délimitée par des guillemets et doit contenir une condition SQF valide qui sera évaluée durant la mission.
 * Par exemple pour autoriser l'usine de création sur seulement quelques joueurs ayant un ID de jeu connu, la variable peut être défini comme suit :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Ou elle peut se baser sur le nom de profil : "profileName in [""maxime"", ""martin"", ""marc""]"
 * Ou pour n'autoriser que l'admin de serveur : "serverCommandAvailable "#kick"""
 * Notez que les guillemets des chaînes de caractères dans la chaîne de condition doivent être doublés.
 * Note : si la condition dépend de l'objet/véhicule pointé, vous pouvez utiliser la commande cursorTarget
 * Notez aussi que les condition sont évaluées en temps réel, et peuvent donc dépendre du déroulement de la mission :
 * "alive officier && taskState tache1 == ""Succeeded"""
 * Pour autoriser l'usine de création chez tout le monde, il suffit de définir la condition à "true".
 */
R3F_LOG_CFG_string_condition_allow_creation_factory_on_this_client = "false";

/*
 ********************************************************************************************
 * BELOW IS THE CLASS NAMES CONFIGURATION / CI-DESSOUS LA CONFIGURATION DES NOMS DE CLASSES *
 ********************************************************************************************
 * 
 * (EN)
 * There are two ways to manage new objects with the logistics system. The first one is to add these objects in the
 * following appropriate lists. The second one is to create a new external file in the /addons_config/ directory,
 * based on /addons_config/TEMPLATE.sqf, and to add a #include below to.
 * The first method is better to add/fix only some various class names.
 * The second method is better to take into account an additional addon.
 * 
 * These variables are based on the inheritance principle according to the CfgVehicles tree.
 * It means that a features accorded to a class name, is also accorded to all child classes.
 * Inheritance tree view : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 * 
 * (FR)
 * Deux moyens existent pour gérer de nouveaux objets avec le système logistique. Le premier consiste à ajouter
 * ces objets dans les listes appropriées ci-dessous. Le deuxième est de créer un fichier externe dans le répertoire
 * /addons_config/ basé sur /addons_config/TEMPLATE.sqf, et d'ajouter un #include ci-dessous.
 * La première méthode est préférable lorsqu'il s'agit d'ajouter ou corriger quelques classes diverses.
 * La deuxième méthode est préférable s'il s'agit de prendre en compte le contenu d'un addon supplémentaire.
 * 
 * Ces variables sont basées sur le principe d'héritage utilisés dans l'arborescence du CfgVehicles.
 * Cela signifie qu'une fonctionnalité accordée à une classe, le sera aussi pour toutes ses classes filles.
 * Vue de l'arborescence d'héritage : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 */

/****** LIST OF ADDONS CONFIG TO INCLUDE / LISTE DES CONFIG D'ADDONS A INCLURE ******/
//#include "addons_config\A3_vanilla.sqf"
//#include "addons_config\All_in_Arma.sqf"
//#include "addons_config\R3F_addons.sqf"
//#include "addons_config\YOUR_ADDITIONAL_ADDON.sqf"

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of ground vehicles which can tow objects.
 * Liste des noms de classes des véhicules terrestres pouvant remorquer des objets.
 */
R3F_LOG_CFG_can_tow = R3F_LOG_CFG_can_tow +
[
	// e.g. : "MyTowingVehicleClassName1", "MyTowingVehicleClassName2"
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Van_01_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	"Truck_01_base_F",
	"Truck_02_base_F",
	"Truck_03_base_F",
	"Wheeled_APC_F",
	"APC_Tracked_01_base_F",
	"APC_Tracked_02_base_F",
	"APC_Tracked_03_base_F",
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F",
	"Boat_Armed_01_base_F",
	"B_UGV_01_F",
	"B_UGV_01_rcws_F",
	"I_UGV_01_F",
	"I_UGV_01_rcws_F",
	"O_UGV_01_F",
	"O_UGV_01_rcws_F"
];

/**
 * List of class names of objects which can be towed.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_can_be_towed = R3F_LOG_CFG_can_be_towed +
[
	// e.g. : "MyTowableObjectClassName1", "MyTowableObjectClassName2"
	"Hatchback_01_base_F",
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Van_01_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	"Truck_01_base_F",
	"Truck_02_base_F",
	"Truck_03_base_F",
	"UGV_01_base_F",
	"SDV_01_base_F",
	"Boat_Civil_01_base_F",
	"Boat_Armed_01_base_F",
	"Helicopter_Base_F",
	"Wheeled_APC_F",
	"APC_Tracked_01_base_F",
	"APC_Tracked_02_base_F",
	"APC_Tracked_03_base_F",
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F",
	"Plane"
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of helicopters which can lift objects.
 * Liste des noms de classes des hélicoptères pouvant héliporter des objets.
 */
R3F_LOG_CFG_can_lift = R3F_LOG_CFG_can_lift +
[
	// e.g. : "MyLifterVehicleClassName1", "MyLifterVehicleClassName2"
	"Helicopter_Base_F"
];

/**
 * List of class names of objects which can be lifted.
 * Liste des noms de classes des objets héliportables.
 */
R3F_LOG_CFG_can_be_lifted = R3F_LOG_CFG_can_be_lifted +
[
	// e.g. : "MyLiftableObjectClassName1", "MyLiftableObjectClassName2"
	"Hatchback_01_base_F",
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Van_01_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	"Truck_01_base_F",
	"Truck_02_base_F",
	"Truck_03_base_F",
	"UGV_01_base_F",
	"SDV_01_base_F",
	"Boat_Civil_01_base_F",
	"Boat_Armed_01_base_F",
	"Wheeled_APC_F",
	"APC_Tracked_01_base_F",
	"APC_Tracked_02_base_F",
	"APC_Tracked_03_base_F",
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F",
	"Land_Cargo40_military_green_F", 
	"Land_Cargo40_red_F", 
	"Land_Cargo40_white_F",
	"Land_Cargo20_grey_F", 
	"Land_Cargo20_blue_F"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
* (EN)
 * This section uses a numeric quantification of capacity and cost of the objets.
 * For example, in a vehicle has a capacity of 100, we will be able to load in 5 objects costing 20 capacity units.
 * The capacity doesn't represent a real volume or weight, but a choice made for gameplay.
 * 
 * (FR)
 * Cette section utilise une quantification numérique de la capacité et du coût des objets.
 * Par exemple, dans un véhicule d'une capacité de 100, nous pouvons charger 5 objets coûtant 20 unités de capacité.
 * La capacité ne représente ni un poids, ni un volume, mais un choix fait pour la jouabilité.
 */

/**
 * List of class names of vehicles or cargo objects which can transport objects.
 * The second element of the nested arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * Liste des noms de classes des véhicules ou "objets contenant" pouvant transporter des objets.
 * Le deuxième élément des sous-tableaux est la capacité de chargement (en relation avec le coût de capacité des objets).
 */
R3F_LOG_CFG_can_transport_cargo = R3F_LOG_CFG_can_transport_cargo +
[
	// e.g. : ["MyTransporterClassName1", itsCapacity], ["MyTransporterClassName2", itsCapacity]
	["Quadbike_01_base_F", 5],
	["UGV_01_base_F", 10],
	["Hatchback_01_base_F", 10],
	["SUV_01_base_F", 20],
	["Offroad_01_base_F", 30],
	["Van_01_base_F", 40],
	["MRAP_01_base_F", 20],
	["MRAP_02_base_F", 20],
	["MRAP_03_base_F", 20],
	["B_Truck_01_box_F", 120],
	["Truck_F", 65],
	["Wheeled_APC_F", 30],
	["Tank_F", 30],
	["Rubber_duck_base_F", 10],
	["Boat_Civil_01_base_F", 10],
	["Boat_Armed_01_base_F", 20],
	["Heli_Light_01_base_F", 10],
	["Heli_Light_02_base_F", 20],
	["Heli_light_03_base_F", 30],
	["Heli_Transport_01_base_F", 35],
	["Heli_Transport_02_base_F", 45],
	["Heli_Transport_03_base_F", 45],
	["Heli_Transport_04_base_F", 50],
	["Heli_Attack_01_base_F", 10],
	["Heli_Attack_02_base_F", 20],
	["Land_Cargo40_military_green_F", 180],
	["Land_Cargo40_red_F", 150],
	["Land_Cargo40_white_F", 100],
	["Land_Cargo20_grey_F", 40],
	["Land_Cargo20_blue_F", 40]
];

/**
 * List of class names of objects which can be loaded in transport vehicle/cargo.
 * The second element of the nested arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * Liste des noms de classes des objets transportables.
 * Le deuxième élément des sous-tableaux est le coût de capacité (en relation avec la capacité des véhicules).
 */
R3F_LOG_CFG_can_be_transported_cargo = R3F_LOG_CFG_can_be_transported_cargo +
[
	// e.g. : ["MyTransportableObjectClassName1", itsCost], ["MyTransportableObjectClassName2", itsCost]
	//["Land_Flush_Light_yellow_F", 1], //Size- 1 Cost- 15 Loadable
	["Land_Flush_Light_yellow_F", 1],
	["Land_BagFence_Short_F", 3],	
	["FlagPole_F", 5],
	["Static_Designator_01_base_F", 2],
	["Static_Designator_02_base_F", 2],
	["Box_NATO_AmmoVeh_F", 4],
	["Land_Device_assembled_F", 10], //Re Locker
	["FirePlace_burning_F", 2],
	["Land_MetalBarrel_F", 6],
	["Land_Pipes_Large_F", 5],
	["Land_ShelvesWooden_blue_F", 1],
	["Land_Shoot_House_Wall_F", 3],
	["Land_ToiletBox_F", 2],
	["StaticWeapon", 1],
	["Kart_01_Base_F", 1],
	["Quadbike_01_base_F", 1],
	["Rubber_duck_base_F", 1],
	["SDV_01_base_F", 5],
	["UAV_01_base_F", 5],
	["ReammoBox_F", 3],
	["Land_BarrelWater_F", 1],
	["Land_Sacks_goods_F", 1],
	["B_supplyCrate_F", 3],
	["Land_FuelStation_Feed_F", 9],
	["Land_Atm_01_F", 25],
	["Land_Swing_01_F", 5],
	["Land_HBarrier_1_F", 3],
	["Land_HBarrier_3_F", 3],
	["Land_Airport_Tower_F", 150],
	["Land_BagBunker_Large_F", 6],
	["Land_BagBunker_Small_F", 6],
	["Land_BagBunker_Tower_F", 6],
	["Land_BagFence_Corner_F", 6],
	["Land_BagFence_End_F", 4],
	["Land_BagFence_Long_F", 4],
	["Land_BagFence_Round_F", 4],
	["Land_i_Barracks_V1_F", 150],
	["Land_BC_Court_F", 120],
	["Land_BarGate_F", 8],
	["Land_Kiosk_redburger_F", 12],
	["Land_Canal_Wall_Stairs_F", 5],
	["Land_Canal_Wall_10m_F", 2],
	["Land_Canal_WallSmall_10m_F", 2],
	["Land_Chapel_V2_F", 55],
	["Land_Church_01_V1_F", 15],
	["Land_CncBarrierMedium4_F", 3],
	["Land_CncBarrierMedium_F", 3],
	["Land_CncBarrier_F", 3],
	["BlockConcrete_F", 9],
	["Land_CncShelter_F", 6],
	["Land_Mil_ConcreteWall_F", 4],
	["Land_RampConcreteHigh_F", 4],
	["Land_RampConcrete_F", 3],
	["Land_CncWall4_F", 4],
	["Land_CncWall1_F", 4],
	["Land_Dome_Big_F", 160],
	["Land_Dome_Small_F", 150],
	["Land_i_Garage_V1_F", 35],
	["Land_Net_Fence_Gate_F", 4],
	["Land_Mil_WallBig_Gate_F", 4],
	["Land_City_Gate_F", 4],
	["Land_Grave_rocks_F", 5],
	["Land_TentHangar_V1_F", 80],
	["Land_Hangar_F", 160],
	["Land_HBarrier_5_F", 3],
	["Land_HBarrierBig_F", 4],
	["Land_HBarrierWall4_F", 4],
	["Land_HBarrierWall6_F", 5],
	["Land_HBarrierTower_F", 6],
	["Land_Crash_barrier_F", 2],
	["Land_Pier_F", 120],
	["Land_PierLadder_F", 3],
	["Land_LampHarbour_F", 3],
	["Land_LampShabby_F", 3],
	["Land_LightHouse_F", 95],
	["Land_LampHalogen_F", 9],
	["Land_Medevac_house_V1_F", 12],
	["Land_Cargo_House_V1_F", 12],
	["Land_Cargo_HQ_V1_F", 12],
	["Land_Cargo_Patrol_V1_F", 12],
	["Land_Cargo_Tower_V1_F", 55],
	["Land_MilOffices_V1_F", 85],
	["Land_Mil_WallBig_4m_F", 5],
	["Land_WIP_F", 85],
	["Land_Scaffolding_F", 6],
	["Land_i_Shed_Ind_F", 36],
	["Land_Shed_Small_F", 25],
	["Land_Shed_Big_F", 25],
	["Land_spp_Tower_F", 151],
	["Land_GH_Stairs_F", 4],
	["Land_Maroula_F", 3],
	["TargetP_Civ2_NoPop_F", 2],
	["Land_FieldToilet_F", 2]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects which can be carried and moved by a player.
 * Liste des noms de classes des objets qui peuvent être portés et déplacés par le joueur.
 */
R3F_LOG_CFG_can_be_moved_by_player = R3F_LOG_CFG_can_be_moved_by_player +
[
	// e.g. : "MyMovableObjectClassName1", "MyMovableObjectClassName2"
	"ReammoBox_F",
	"FlagPole_F",
	"Static_Designator_01_base_F",
	"Static_Designator_02_base_F",
	"Land_Flush_Light_yellow_F",
	"Land_BagFence_Short_F",
	"FirePlace_burning_F", 
	"Land_Cargo20_blue_F", //Item so large to prevent loading. Towable item, Medium Capacity 40, Suggest $40K
	"Land_Cargo20_grey_F", //Item so large to prevent loading. Towable item, Medium Capacity 40, Suggest $40K
	"Land_Cargo40_white_F", //Item so large to prevent loading. Towable item,  Large Capacity 75, Suggest $80K
	"Land_MetalBarrel_F",
	"Land_Pipes_Large_F",
	"Land_Device_assembled_F", //relocker
	"Land_ShelvesWooden_blue_F",
	"Land_Shoot_House_Wall_F",
	"Land_ToiletBox_F",
	"StaticWeapon",
	"Kart_01_Base_F",
	"Quadbike_01_base_F",
	"Rubber_duck_base_F",
	"SDV_01_base_F",
	"UAV_01_base_F",
	"Land_BarrelWater_F",
	"Land_Sacks_goods_F",
	"B_supplyCrate_F",
	"Land_FuelStation_Feed_F",
	"Land_Atm_01_F",
	"Land_Cargo40_red_F", //Item so large to prevent loading. Towable item,  Large Capacity 120, Suggest $80K
	"Land_Cargo40_military_green_F", //Item so large to prevent loading. Towable item, Extra Large Capacity 150, Suggest $100K
	"Land_Swing_01_F", //Cheap Gimic Item
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F", 
	"Land_Airport_Tower_F", //Large Structure, Suggest $150K
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_i_Barracks_V1_F", //Expensive Item Suggest $150K
	"Land_BC_Court_F", //Expensive Item due to vertical construction ability Suggest $60k
	"Land_BarGate_F",
	"Land_Kiosk_redburger_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_Canal_Wall_10m_F", // Suggest $1K
	"Land_Canal_WallSmall_10m_F",
	"Land_Chapel_V2_F", //Slum House Container
	"Land_Church_01_V1_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncBarrierMedium_F",
	"Land_CncBarrier_F",
	"BlockConcrete_F",  //Matches in with Ramps Suggest $10K Alot smaller than pier
	"Land_CncShelter_F",
	"Land_Mil_ConcreteWall_F",
	"Land_RampConcreteHigh_F",
	"Land_RampConcrete_F",
	"Land_CncWall4_F",
	"Land_CncWall1_F",
	"Land_Dome_Big_F",
	"Land_Dome_Small_F",
	"Land_i_Garage_V1_F",
	"Land_Net_Fence_Gate_F", //Suggest $3.5K
	"Land_Mil_WallBig_Gate_F", //Suggest $20K
	"Land_City_Gate_F", //Suggest $8K
	"Land_Grave_rocks_F",
	"Land_TentHangar_V1_F",  //Open on 2 sides, Suggest $50K
	"Land_Hangar_F",  //Large Structure, Only moveable by largest vehciles/containers Suggest $150K
	"Land_HBarrier_5_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierWall4_F", 
	"Land_HBarrierWall6_F",
	"Land_HBarrierTower_F",
	"Land_Crash_barrier_F",
	"Land_Pier_F", //Large flat object for base building, Expensive Item Suggest $80K
	"Land_PierLadder_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_LightHouse_F",
	"Land_LampHalogen_F", //Size- 5 Cost- 1000 Loadable
	"Land_Medevac_house_V1_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_HQ_V1_F", // Added on player request
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Tower_V1_F",
	"Land_MilOffices_V1_F",
	"Land_Mil_WallBig_4m_F",
	"Land_WIP_F",
	"Land_Scaffolding_F",
	"Land_i_Shed_Ind_F",
	"Land_Shed_Small_F",
	"Land_Shed_Big_F",
	"Land_spp_Tower_F", 
	"Land_GH_Stairs_F",
	"Land_Maroula_F",
	"TargetP_Civ2_NoPop_F",
	"Land_FieldToilet_F"
];