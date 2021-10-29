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

private _databaseName = lrms_lrmName;

private _database = ["new", _databaseName] call OO_INIDBI;
_database