/*
 * Author: Puddleflop
 * Creates or loads the database at the start of the mission.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Database object <CODE>
 *
 * Example:
 * 
 *
*/

params[];

if (isServer) then {
	private _databaseName = lrms_lrmName;
};

if (hasInterface) then {
	private _playerUID = getPlayerUID player;
	private _databaseName = lrms_lrmName + _playerUID;
};
private _database = ["new", _databaseName] call 00_inIDBI;
_database