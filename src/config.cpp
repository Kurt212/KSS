class CfgPatches
{
    class KSS
    {
        name = "Kurt's Survival System";
        author = "Kurt";
        authorUrl = "https://github.com/Kurt212";

        version = "1.5.2";

        units[] = {
            "KSS_fullBoxNATO10",
            "KSS_fullBoxNATO20",
            "KSS_fullBoxEAST10",
            "KSS_fullBoxEAST20"
        };
        weapons[] = {
            "kss_beer_dark",
            "kss_beer_light",
            "kss_bottle_big",
            "kss_bottle_small",
            "kss_bread",
            "kss_caviar",
            "kss_chicken",
            "kss_chips",
            "kss_cocktail_patron",
            "kss_corn",
            "kss_cucumbers",
            "kss_irp",
            "kss_kilka",
            "kss_losos",
            "kss_mre",
            "kss_mushrooms",
            "kss_pea",
            "kss_red_beans",
            "kss_sausage",
            "kss_shproti",
            "kss_soda_coke",
            "kss_soda_drpepper",
            "kss_soda_mdew",
            "kss_soda_pepsi",
            "kss_soup_chicken",
            "kss_soup_vegetable",
            "kss_steak",
            "kss_tomatoes",
            "kss_tushenka_beef",
            "kss_tushenka_pork",
            "kss_vodka"
        };
        requiredVersion = 0.1;
        requiredAddons[] = {"A3_Weapons_F_Items", "cba_main", "A3_Modules_F"};
    };
};

class CfgFunctions
{
    #include "cfgFunctions.hpp"
};

class CfgWeapons
{
    #include "cfgWeapons.hpp"
};

class CfgSounds
{
    // sounds[] = {};
    #include "cfgSounds.hpp"
};

class CfgFactionClasses
{
    class NO_CATEGORY;
    class KSS: NO_CATEGORY
    {
        displayName = "KSS";
    };
};


#include "cfgVehicles.hpp"

#include "dialogs.hpp"

class CfgCommands
{
    allowedHTMLLoadURIs[] += {
        "http://kurt212.github.io/kss_en.html",
        "http://kurt212.github.io/kss_ru.html"
    };
};

class Cfg3DEN
{
    class EventHandlers
    {
        class KSS
        {
            OnMissionPreview = "if (!(profileNamespace getVariable ['KSS_info_seen', false]) && (count (allMissionObjects 'KSS_Module') > 0)) then { [] call KSS_fnc_showKSSInfo }";
        };
    };
};
