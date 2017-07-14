class KSS_HUD_0
{
    idd = 2100;

    duration = 60*60*24;

    onLoad = "uiNamespace setVariable ['KSS_HUD_0', _this select 0]";
    class controls
    {
        class Text_Hunger : RscText
        {
            idc = 2110;

            font = "EtelkaMonospacePro";
            SizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) / 1.5;

            x = "0.01 * safezoneW + safezoneX";
            y = "0.90 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.03 * safezoneH";
        };
        class Text_Thirst : Text_Hunger
        {
            idc = 2120;

            y = "0.94 * safezoneH + safezoneY";
        };
    };
    class controlsBackground
    {
        class Progress_Hunger : RscProgress
        {
            idc = 2111;

            colorFrame[] = {0,0,0,0.8};
            colorBar[] = {0.427, 0.651, 0.227, 0.9};

            x = "0.01 * safezoneW + safezoneX";
            y = "0.90 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.03 * safezoneH";
        };
        class Progress_Thirst : Progress_Hunger
        {
            idc = 2121;

            colorBar[] = {0.18, 0.349, 0.635, 0.9};

            y = "0.94 * safezoneH + safezoneY";
        };
    };
};
