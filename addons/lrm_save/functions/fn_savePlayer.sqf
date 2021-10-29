/*
 * Author: Puddleflop
 * Save the players state.
 *
 * Arguments:
 * 0: _database <CODE>: The database for the Save to be saved to.
 *
 * Return Value:
 * None
 *
 * Example:
 * 
 *
*/

params ["_database"];

private _sectionName = format["%1:%2:%3:%4:%5", systemtimeUTC select 0, systemtimeUTC select 1, systemtimeUTC select 2, systemtimeUTC select 3, systemtimeUTC select 4];

if (lrms_playerPosition) then {
	[_database, _sectionName] call lrms_fnc_savePosition;
};

if (lrms_playerGear) then {
	[_database, _sectionName] call lrms_fnc_saveGear;
};

if (lrms_playerMedical) then {
	[_database, _sectionName] call lrms_fnc_saveMedical;
};