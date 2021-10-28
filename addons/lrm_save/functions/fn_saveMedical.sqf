/*
 * Author: Puddleflop
 * Save a player's medical information to their database.
 *
 * Arguments:
 * 0: _database <CODE>: The database for the save to be saved to.
 * 1: _sectionName <SRTING>: The section in the database for the save to be saved to.
 *
 * Return Value:
 * True <BOOL>
 *
 * Example:
 * 
 *
*/
params["_database", "_sectionName"];
// Checks for ace medical and saves that information, otherwise save vanillia medical.
if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then {
	private _unit = player;
	// - Blood and heart ----------------------------------------------------------
	playerBloodVol = _unit getVariable ["ace_medical_bloodVolume", 6.0];
	playerHeartRate = _unit getVariable ["ace_medical_heartRate", 80];
	playerBloodPressure = _unit getVariable ["ace_medical_bloodPress", [80, 120]];
	playerPeripheralresistance = _unit getVariable ["ace_medical_peripheralResistance", 100];
	playerinCardiacArrest = _unit getVariable ["ace_medical_inCardiacArrest", false];
	playerHemorrhage = _unit getVariable ["ace_medical_hemorrhage", 0];
	
	playerBloodHeartArray = [playerBloodVol, playerHeartRate, playerBloodPressure, playerPeripheralresistance, playerinCardiacArrest, playerHemorrhage];
	
	// - Pain ---------------------------------------------------------------------
	playerPain = _unit getVariable ["ace_medical_pain", 0];
	playerinPain = _unit getVariable ["ace_medical_inPain", false];
	playerPainSupp = _unit getVariable ["ace_medical_painSuppress", 0];
	
	playerPainArray = [playerPain, playerinPain, playerPainSupp];
	
	// - Wounds -------------------------------------------------------------------
	playerOpenWounds = _unit getVariable ["ace_medical_openWounds", []];
	playerBandagedWounds = _unit getVariable ["ace_medical_bandagedWounds", []];
	playerStitchedWounds = _unit getVariable ["ace_medical_stitchedWounds", []];
	playerIsLimping = _unit getVariable ["ace_medical_isLimping", false];
	playerFractures = _unit getVariable ["ace_medical_fractures", [0, 0, 0, 0, 0, 0]];
	
	playerWoundArray = [playerOpenWounds, playerBandagedWounds, playerStitchedWounds, playerIsLimping, playerFractures];
	
	// - Misc ---------------------------------------------------------------------
	playerIsUnconscious = _unit getVariable ["ACE_isUnconscious", false];
	
	// - Treatments ---------------------------------------------------------------
	playertourniquets = _unit getVariable ["ace_medical_tourniquets", [0, 0, 0, 0, 0, 0]];
	playerOccludedMedications = _unit getVariable ["ace_medical_occludedMedications", nil];
	playerIvBags = _unit getVariable ["ace_medical_ivBags", nil];
	
	playerTreatmentArray = [playertourniquets, playerOccludedMedications, playerIvBags];
	
	// Triage card and logs
	playerTriageLevel = _unit getVariable ["ace_medical_triageLevel", 0];
	playerTriageCard = _unit getVariable ["ace_medical_triageCard", []];
	
	// damage storage
	playerBodyPartdamage = _unit getVariable ["ace_medical_bodyPartdamage", [0, 0, 0, 0, 0, 0]];
	
	// Medication
	playerMedications = _unit getVariable ["ace_medical_Medications", []];
	
	// Unconscious spontanious wake up chance
	playerLastWakeUpCheck = _unit getVariable ["ace_medical_lastWakeUpCheck", nil];
	
	playerMedicalArray = playerBloodHeartArray + playerPainArray + playerWoundArray + [playerIsUnconscious] + playerTreatmentArray + [playerTriageLevel, playerTriageCard, playerBodyPartdamage, playerMedications, playerLastWakeUpCheck, playerStateMachine];
	
	["write", [_sectionName, "medical", playerMedicalArray]] call _database;
} else {
	playerdamage = damage player;
	["write", [_sectionName, "medical", playerdamage]] call _database;
};