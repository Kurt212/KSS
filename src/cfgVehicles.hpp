class CfgEditorCategories
{
    class KSS
    {
        displayName = "KSS";
    };
};

class CfgEditorSubCategories
{
    class KSS_boxes
    {
        displayName="KSS boxes";
    };
};

#define item(_name, _count) class _xx_##_name { \
name = #_name; \
count = _count; \
};
#define item10(_name) item(_name, 10)
#define item20(_name) item(_name, 20)

class CfgVehicles
{
    #include "cfgModules.hpp"

    class Box_NATO_Equip_F;
    class KSS_fullBoxNATO10 : Box_NATO_Equip_F
    {
        scope = 2;
        _generalMacro = "KSS_fullBox10";
        displayName = "$STR_KSS_fullBox10";
        DLC = "";
        editorSubcategory = "KSS_boxes";
        editorCategory = "KSS";
        hiddenSelectionsTextures[] = {
            "\a3\supplies_F_Exp\ammoboxes\data\equipment_box_blufor_co.paa",
            "\tf_kss\data\box_eng_CA.paa"
        };
        class TransportItems
        {
            item10(kss_beer_dark);
            item10(kss_beer_light);
            item10(kss_bottle_big);
            item10(kss_bottle_small);
            item10(kss_bread);
            item10(kss_caviar);
            item10(kss_chicken);
            item10(kss_chips);
            item10(kss_corn);
            item10(kss_cucumbers);
            item10(kss_irp);
            item10(kss_kilka);
            item10(kss_losos);
            item10(kss_mre);
            item10(kss_mushrooms);
            item10(kss_pea);
            item10(kss_red_beans);
            item10(kss_sausage);
            item10(kss_shproti);
            item10(kss_soda_coke);
            item10(kss_soda_drpepper);
            item10(kss_soda_mdew);
            item10(kss_soda_pepsi);
            item10(kss_soup_chicken);
            item10(kss_soup_vegetable);
            item10(kss_steak);
            item10(kss_tomatoes);
            item10(kss_tushenka_beef);
            item10(kss_tushenka_pork);
            item10(kss_vodka);
        };
    };
    class KSS_fullBoxNATO20 : KSS_fullBoxNATO10
    {
        _generalMacro = "KSS_fullBox20";
        displayName = "$STR_KSS_fullBox20";
        class TransportItems
        {
            item20(kss_beer_dark);
            item20(kss_beer_light);
            item20(kss_bottle_big);
            item20(kss_bottle_small);
            item20(kss_bread);
            item20(kss_caviar);
            item20(kss_chicken);
            item20(kss_chips);
            item20(kss_corn);
            item20(kss_cucumbers);
            item20(kss_irp);
            item20(kss_kilka);
            item20(kss_losos);
            item20(kss_mre);
            item20(kss_mushrooms);
            item20(kss_pea);
            item20(kss_red_beans);
            item20(kss_sausage);
            item20(kss_shproti);
            item20(kss_soda_coke);
            item20(kss_soda_drpepper);
            item20(kss_soda_mdew);
            item20(kss_soda_pepsi);
            item20(kss_soup_chicken);
            item20(kss_soup_vegetable);
            item20(kss_steak);
            item20(kss_tomatoes);
            item20(kss_tushenka_beef);
            item20(kss_tushenka_pork);
            item20(kss_vodka);
        };
    };
    class Box_CSAT_Equip_F;
    class KSS_fullBoxEAST10 : Box_CSAT_Equip_F
    {
        scope = 2;
        _generalMacro = "KSS_fullBox10";
        displayName = "$STR_KSS_fullBox10";
        DLC = "";
        editorSubcategory = "KSS_boxes";
        editorCategory = "KSS";
        hiddenSelectionsTextures[] = {
            "\a3\supplies_f_exp\ammoboxes\data\equipment_box_opfor_co.paa",
            "\tf_kss\data\box_ru_CA.paa"
        };
        class TransportItems
        {
            item10(kss_beer_dark);
            item10(kss_beer_light);
            item10(kss_bottle_big);
            item10(kss_bottle_small);
            item10(kss_bread);
            item10(kss_caviar);
            item10(kss_chicken);
            item10(kss_chips);
            item10(kss_corn);
            item10(kss_cucumbers);
            item10(kss_irp);
            item10(kss_kilka);
            item10(kss_losos);
            item10(kss_mre);
            item10(kss_mushrooms);
            item10(kss_pea);
            item10(kss_red_beans);
            item10(kss_sausage);
            item10(kss_shproti);
            item10(kss_soda_coke);
            item10(kss_soda_drpepper);
            item10(kss_soda_mdew);
            item10(kss_soda_pepsi);
            item10(kss_soup_chicken);
            item10(kss_soup_vegetable);
            item10(kss_steak);
            item10(kss_tomatoes);
            item10(kss_tushenka_beef);
            item10(kss_tushenka_pork);
            item10(kss_vodka);
        };
    };
    class KSS_fullBoxEAST20 : KSS_fullBoxEAST10
    {
        _generalMacro = "KSS_fullBox20";
        displayName = "$STR_KSS_fullBox20";
        class TransportItems
        {
            item20(kss_beer_dark);
            item20(kss_beer_light);
            item20(kss_bottle_big);
            item20(kss_bottle_small);
            item20(kss_bread);
            item20(kss_caviar);
            item20(kss_chicken);
            item20(kss_chips);
            item20(kss_corn);
            item20(kss_cucumbers);
            item20(kss_irp);
            item20(kss_kilka);
            item20(kss_losos);
            item20(kss_mre);
            item20(kss_mushrooms);
            item20(kss_pea);
            item20(kss_red_beans);
            item20(kss_sausage);
            item20(kss_shproti);
            item20(kss_soda_coke);
            item20(kss_soda_drpepper);
            item20(kss_soda_mdew);
            item20(kss_soda_pepsi);
            item20(kss_soup_chicken);
            item20(kss_soup_vegetable);
            item20(kss_steak);
            item20(kss_tomatoes);
            item20(kss_tushenka_beef);
            item20(kss_tushenka_pork);
            item20(kss_vodka);
        };
    };
};
