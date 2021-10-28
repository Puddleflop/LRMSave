/*
 * Author: Puddleflop
 * Save a player's gear to their database.
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
// Loads the players gear
player setUnitLoadout (configFile >> "Emptyloadout");
_playerloadout = ["read", [_sectionName, "gear"]] call _database;
player setUnitLoadout _playerloadout;

// Radios
if !(isnil "acre_api_fnc_getCurrentradiolist") then {
	private _playerRadioList = call acre_api_fnc_getCurrentradiolist;
	if !(count _playerRadioList == 0) then {
		try {
			_playerradios = ["read", [_section, "radio"]] call _database;
			{
				// loads the radio settings
				_currentradiosettings = _playerradios select _forEachindex;
				[_x, _currentradiosettings select 0] call acre_api_fnc_setradioChannel;
				[_x, _currentradiosettings select 1] call acre_api_fnc_setradioVolume;
				[_x, _currentradiosettings select 2] call acre_api_fnc_setradioSpatial;
			} forEach _playerRadioList;
			_success = true;
		} catch {
			_success = false;
		};
	};
};

//TODO
//Add TFAR support if available