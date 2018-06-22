
#define true 1
#define false 0

class Logic;

class Module_F : Logic
{
    class ArgumentsBaseUnits
    {
        class Units;
    };
    class ModuleDescription
    {
        class AnyBrain;
    };
};

class KSS_Module : Module_F
{
    scope = 2;
    author = "Kurt";
    displayName = "$STR_KSS_ModuleName";
    category = "KSS";
    function = "KSS_fnc_init";
    icon = "\tf_kss\icon.paa";
    functionPriority = 2;
    isGlobal = 1;
    isTriggerActivated = 0;
    class Arguments : ArgumentsBaseUnits
    {
        class hungerDelay
        {
            displayName = "$STR_KSS_moduleHungerName";
            description = "$STR_KSS_moduleHungerDescription";
            typeName = "NUMBER";
            defaultValue = 60;
        };

        class thirstDelay
        {
            displayName = "$STR_KSS_moduleThirstName";
            description = "$STR_KSS_moduleThirstDescription";
            typeName = "NUMBER";
            defaultValue = 60;
        };

        class drawHUD
        {
            displayName = "$STR_KSS_moduleHUDName";
            description = "";
            typeName = "BOOL";
            class values
            {
                class Enable
                {
                    name = "$STR_KSS_Enabled";
                    value = true;
                };
                class Disable
                {
                    name = "$STR_KSS_Disabled";
                    value = false;
                    default = true;
                };
            };
        };
        class enableHints
        {
            displayName = "$STR_KSS_moduleHintsName";
            description = "";
            typeName = "BOOL";
            class values
            {
                class Enable
                {
                    name = "$STR_KSS_Enabled";
                    value = true;
                    default = true;
                };
                class Disable
                {
                    name = "$STR_KSS_Disabled";
                    value = false;
                };
            };
        };
    };
};

class KSS_Module_Disable : KSS_Module
{
    displayName = "$STR_KSS_moduleDisableName";
    function = "KSS_fnc_disable";
    class Arguments : ArgumentsBaseUnits
    {
        class DisableType
        {
            displayName = "$STR_KSS_moduleDisableTypeName";
            typeName = "NUMBER";
            class values
            {
                class Synched
                {
                    name = "$STR_KSS_moduleDisableSynchedName";
                    value = 0;
                    default = true;
                };
                class AdminOnly
                {
                    name = "$STR_KSS_moduleDisableAdminName";
                    value = 1;
                };
            };
        };
    };
};
