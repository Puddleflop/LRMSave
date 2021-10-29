[
	"lrms_LRMName", "EDITBOX", ["LRM Name", "Set the overaching lrm name (no spaces)"], ["LRM Saving", "Player"], "nameOfLRM", 1 
] call CBA_fnc_addSetting;
[
	"lrms_playerGear", "CHECKBOX", ["Save Player Gear", "Enables the gear saving for the player"], ["LRM Saving", "Player"], true, 1
] call CBA_fnc_addSetting;
[
	"lrms_playerMedical", "CHECKBOX", ["Save Player Medical", "Enables the medical saving for the player"], ["LRM Saving", "Player"], true, 1
] call CBA_fnc_addSetting;
[
	"lrms_playerPosition", "CHECKBOX", ["Save Player Position", "Enables the position saving for the player"], ["LRM Saving", "Player"], true, 1
] call CBA_fnc_addSetting;

