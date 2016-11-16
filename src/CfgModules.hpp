
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
    displayName = "Survival System";
    category = "KSS";
    function = "KSS_fnc_init";
    icon = "\KSS\icon.paa";
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
    };
};
