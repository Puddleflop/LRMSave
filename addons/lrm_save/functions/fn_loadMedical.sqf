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
            playerMedicalArray = ["read", [_sectionName, "medical"]] call _database;
            private _unit = player;
            
            // Blood and heart
            _unit setVariable ["ace_medical_bloodVolume", playerMedicalArray select 0, true];
            _unit setVariable ["ace_medical_heartRate", playerMedicalArray select 1, true];
            _unit setVariable ["ace_medical_bloodPress", playerMedicalArray select 2, true];
            _unit setVariable ["ace_medical_peripheralresistance", playerMedicalArray select 3, true];
            _unit setVariable ["ace_medical_hemorrhage", playerMedicalArray select 5, true];
            
            // Pain
            _unit setVariable ["ace_medical_pain", playerMedicalArray select 6, true];
            _unit setVariable ["ace_medical_inPain", playerMedicalArray select 7, true];
            _unit setVariable ["ace_medical_painSuppress", playerMedicalArray select 8, true];
            
            // Wounds
            _unit setVariable ["ace_medical_openWounds", playerMedicalArray select 9, true];
            _unit setVariable ["ace_medical_bandagedWounds", playerMedicalArray select 10, true];
            _unit setVariable ["ace_medical_stitchedWounds", playerMedicalArray select 11, true];
            _unit setVariable ["ace_medical_isLimping", playerMedicalArray select 12, true];
            _unit setVariable ["ace_medical_fractures", playerMedicalArray select 13, true];
            
            // Treatments
            _unit setVariable ["ace_medical_tourniquets", playerMedicalArray select 15, true];
            _unit setVariable ["ace_medical_occludedMedications", playerMedicalArray select 16, true];
            // Delayed Medications (from tourniquets)
            _unit setVariable ["ace_medical_ivBags", playerMedicalArray select 17, true];
            
            // Triage card and logs
            _unit setVariable ["ace_medical_triageLevel", playerMedicalArray select 18, true];
            _unit setVariable ["ace_medical_triageCard", playerMedicalArray select 19, true];
            
            // damage storage
            _unit setVariable ["ace_medical_bodyPartdamage", playerMedicalArray select 20, true];
            
            // Medication
            _unit setVariable ["ace_medical_Medications", playerMedicalArray select 21, true];
            
            // Unconscious spontanious wake up chance
            _unit setVariable ["ace_medical_lastWakeUpCheck", playerMedicalArray select 22];
            
            // Misc
            [_unit, playerMedicalArray select 14] call ace_medical_status_fnc_setUnconsciousState;
            [_unit, playerMedicalArray select 4] call ace_medical_status_fnc_setCardiacArrestState;
            
            // Update wound bleeding
            [_unit] call ace_medical_status_fnc_updateWoundBloodLoss;
            [_unit] call ace_medical_engine_fnc_updatedamageEffects;

        } else {
                player setDamage ["read", [_sectionName, "medical"]] call _database;
        };