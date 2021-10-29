class CfgPatches
{
    class LRM_Save
    {
        name = "LRM Save";
        author = "Puddleflop";
        url = "http://xkcd.com";
        requiredVersion = 2.06;
        requiredAddons[] = {"A3_Functions_F", "inidbi2"};
        units[] = {};
        weapons[] = {};
    };
};

class cfgFunctions
{
    class lrms
    {
        class functions
        {
            tag = lrms;
            class initLRM
            {
                file = "\lrm_save\functions\fn_initLRM.sqf";
            };
            class loadGear
            {
                file = "\lrm_save\functions\fn_loadGear.sqf";
            };
            class loadMedical
            {
                file = "\lrm_save\functions\fn_loadMedical.sqf";
            };
            class loadPlayer
            {
                file = "\lrm_save\functions\fn_loadPlayer.sqf";
            };
            class loadPosition
            {
                file = "\lrm_save\functions\fn_loadPosition.sqf";
            };
            class saveGear
            {
                file = "\lrm_save\functions\fn_saveGear.sqf";
            };
            class savePosition
            {
                file = "\lrm_save\functions\fn_savePosition.sqf";
            };
            class savePlayer
            {
                file = "\lrm_save\functions\fn_savePlayer.sqf";
            };
            class saveMedical
            {
                file = "\lrm_save\functions\fn_saveMedical.sqf";
            };
        };
    };
};

//CBA Settings
class Extended_PreInit_EventHandlers
{
    class LRMS_CBA_Settings
    {
        init = "call compile preprocessFileLineNumbers '\lrm_save\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers
{
    class LRMS_CBA_Settings
    {
        init = "call compile preprocessFileLineNumbers '\lrm_save\XEH_postInit.sqf'";
    };
};