/*
 * Author: Puddleflop
 * Loads the players previous state.
 *
 * Arguments:
 * 0: _database <CODE>: The database for the Save to be loaded from.
 *
 * Return Value:
 * None
 *
 * Example:
 * 
 *
*/

params ["_database"];

private _sections = "getSections" call _database;
private _numberSections = count _sections;
if (_numberSections < 2) exitwith {false};

private _sectionName = _sections select _numberSections - 1;
if (lrms_playerPosition) then {
	[_database, _sectionName] call lrms_fnc_loadPosition;
};

if (lrms_playerGear) then {
	[_database, _sectionName] call lrms_fnc_loadGear;
};

if (lrms_playerMedical) then {
	[_database, _sectionName] call lrms_fnc_loadMedical;
};

true
