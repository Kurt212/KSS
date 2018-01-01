class KSS_Info
{
    idd = 21998;
    movingEnable = false;
    enableSimulation = false;

    onLoad = "uiNamespace setVariable ['KSS_Info', _this select 0]";
    onUnload = "uiNamespace setVariable ['KSS_Info', displayNull]"

    class Controls
    {
        class Group : RscControlsGroupNoHScrollbars
        {
            onLoad = "uiNamespace setVariable ['KSS_Info_Group', _this select 0]";
            x = 0.237567 * safezoneW + safezoneX;
            y = 0.15 * safezoneH + safezoneY;
            w = 0.524866 * safezoneW;
            h = 0.6 * safezoneH;
            class Controls
            {
                class KSS_RscHTML
                {
                    onLoad = "uiNamespace setVariable ['KSS_Info_RscHTML', _this select 0]";
                    x = 0;
                    y = 0;
                    w = 0.5 * safezoneW;
                    h = 2 * safezoneH
                    deletable = 0;
                    fade = 0;
                    access = 0;
                    type = 9;
                    idc = -1;
                    style = 0;
                    filename = "";
                    colorBackground[] = {1,1,1,1};
                    colorText[] = {0,0,0,1};
                    colorBold[] = {0,0,0,1};
                    colorLink[] = {0.643,0.329,0.8,1};
                    colorLinkActive[] = {0.643,0.329,0.8,1};
                    colorPicture[] = {1,1,1,1};
                    colorPictureLink[] = {0.8,0.329,0.706,1};
                    colorPictureSelected[] = {0.8,0.329,0.706,1};
                    colorPictureBorder[] = {0,0,0,0};
                    tooltipColorText[] = {1,1,1,1};
                    tooltipColorBox[] = {1,1,1,1};
                    tooltipColorShade[] = {0,0,0,0.65};
                    class H1
                    {
                        font = "PuristaSemiBold";
                        fontBold = "PuristaSemiBold";
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
                        align = "left";
                    };
                    class H2
                    {
                        font = "PuristaLight";
                        fontBold = "PuristaSemiBold";
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                        align = "left";
                    };
                    class H3
                    {
                        font = "PuristaLight";
                        fontBold = "PuristaSemiBold";
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                        align = "left";
                    };
                    class H4
                    {
                        font = "PuristaLight";
                        fontBold = "PuristaSemiBold";
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                        align = "left";
                    };
                    class H5
                    {
                        font = "PuristaLight";
                        fontBold = "PuristaSemiBold";
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                        align = "left";
                    };
                    class H6
                    {
                        font = "PuristaLight";
                        fontBold = "PuristaSemiBold";
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                        align = "left";
                    };
                    class P
                    {
                        font = "PuristaLight";
                        fontBold = "PuristaSemiBold";
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                        align = "left";
                    };
                    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                    prevPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_left_ca.paa";
                    nextPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa";
                    shadow = 0;
                };
            };
        };
    };
};