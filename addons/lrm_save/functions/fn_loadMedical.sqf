/*
 * Author: Puddleflop
 * Loads a player's medical information from their database.
 *
 * Arguments:
 * 0: _database <CODE>: The database for the save to be loaded from.
 * 1: _sectionName <SRTING>: The section in the database for the save to be loaded from.
 *
 * Return Value:
 * True <BOOL>
 *
 * Example:
 * 
 *
*/
params["_database", "_sectionName"];

if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
        playerMedicalState = ["read", [_sectionName, "medical"]] call _database;
        [player, playerMedicalState] call ace_medical_fnc_deserializeState;

} else {
        player setDamage ["read", [_sectionName, "medical"]] call _database;
};