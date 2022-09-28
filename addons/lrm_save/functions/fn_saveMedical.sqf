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
	playerMedicalState = [player] call ace_medical_fnc_serializeState;
	["write", [_sectionName, "medical", playerMedicalArray]] call _database;
} else {
	playerdamage = damage player;
	["write", [_sectionName, "medical", playerdamage]] call _database;
};
true