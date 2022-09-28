/*
 * Author: Puddleflop
 * Save the players state.
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

private _playerInfo = ["read", [_sectionName, "position"]] call _database;
_playerPos = _playerInfo select 0;
player setPos _playerPos;
_playerDirection = _playerInfo select 2;
player setDir _playerDirection;
switch (_playerInfo select 1) do
{
	case "STAND":{
		player playAction "PlayerStand"; 
	};
	case "PRONE":{
		player playAction "PlayerProne";
	};
	case "MIDDLE":{
		player playAction "PlayerCrouch";
	};
};