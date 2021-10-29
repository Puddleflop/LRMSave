[
	"CAManBase",
	"killed",
	{
		_sectionName = format["%1:%2:%3:%4:%5", systemtimeUTC select 0, systemtimeUTC select 1, systemtimeUTC select 2, systemtimeUTC select 3, systemtimeUTC select 4];
		["write", [_sectionName, "Event", "Death"]] call database;
	}
] call CBA_fnc_addClassEventHandler;

[
	"CAManBase",
	"Respawn",
	{
		_sectionName = format["%1:%2:%3:%4:%5", systemtimeUTC select 0, systemtimeUTC select 1, systemtimeUTC select 2, systemtimeUTC select 3, systemtimeUTC select 4];
		["write", [_sectionName, "Event", "Respawn"]] call database;
		[database] call lrms_fnc_savePlayer;
	}
] call CBA_fnc_addClassEventHandler;

publicVariable "database";
database = ["new", lrms_LRMName] call OO_INIDBI;