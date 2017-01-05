class KSS_HUD_0
{
    idd = 2100;

    duration = 60*60*24;

    onLoad = "uiNamespace setVariable ['RSS_HUD_0', _this select 0]";
    class controls
    {
        class Text_Hunger : RscStructuredText
        {
            idc = 2110;
            x = "0.00125001 * safezoneW + safezoneX";
            y = "0.85 * safezoneH + safezoneY";
            w = "0.118125 * safezoneW";
            h = "0.07 * safezoneH";
        };
        class Text_Thirst : RscStructuredText
        {
            idc = 2120;
            x = "0.00125001 * safezoneW + safezoneX";
            y = "0.92 * safezoneH + safezoneY";
            w = "0.118125 * safezoneW";
            h = "0.07 * safezoneH";
        };
    };
};