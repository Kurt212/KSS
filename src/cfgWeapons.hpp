class ItemCore;
class InventoryItem_Base_F;

class kss_itemcore : ItemCore {
    type = 0;
    detectRange = -1;
    simulation = "ItemMineDetector";
    scope = 2;
    author = "Kurt";
    displayName = "Настоящий предмет!";
    descriptionShort = "Нихрена не делает";
    class ItemInfo: InventoryItem_Base_F
    {
        mass = 5;
    };
    class Armory
    {
        disabled = 0;
    };
};

class kss_bottle_small : kss_itemcore
{
    displayName = "$STR_KSS_bottle_small";
    descriptionShort = "";
    picture = "\tf_kss\data\bottle_small_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 7;
    };
    class KSS
    {
        delay = 10;
        type = "drink";
        add = "25";
    };
};

class kss_bottle_big : kss_itemcore
{
    displayName = "$STR_KSS_bottle_big";
    descriptionShort = "";
    picture = "\tf_kss\data\bottle_big_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 10;
    };
    class KSS
    {
        delay = 15;
        type = "drink";
        add = "40";
    };
};

class kss_soda_coke : kss_itemcore
{
    displayName = "$STR_KSS_soda_coke";
    descriptionShort = "";
    picture = "\tf_kss\data\soda_coke_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 5;
    };
    class KSS
    {
        delay = 8;
        type = "drink";
        add = "20";
    };
};

class kss_soda_mdew : kss_itemcore
{
    displayName = "$STR_KSS_soda_mdew";
    descriptionShort = "";
    picture = "\tf_kss\data\soda_mdew_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 5;
    };
    class KSS
    {
        delay = 8;
        type = "drink";
        add = "20";
    };
};

class kss_soda_pepsi : kss_itemcore
{
    displayName = "$STR_KSS_soda_pepsi";
    descriptionShort = "";
    picture = "\tf_kss\data\soda_pepsi_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 5;
    };
    class KSS
    {
        delay = 8;
        type = "drink";
        add = "20";
    };
};

class kss_chips: kss_itemcore
{
    displayName = "$STR_KSS_chips";
    descriptionShort = "";
    picture = "\tf_kss\data\chips_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 8;
    };
    class KSS
    {
        delay = 8;
        type = "food";
        add = "20";
    };
};

class kss_steak : kss_itemcore
{
    displayName = "$STR_KSS_steak";
    descriptionShort = "";
    picture = "\tf_kss\data\steak_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 15;
    };
    class KSS
    {
        delay = 25;
        type = "food";
        add = "60";
    };
};

class kss_chicken: kss_itemcore
{
    displayName = "$STR_KSS_chicken";
    descriptionShort = "";
    picture = "\tf_kss\data\chicken_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 10;
    };
    class KSS
    {
        delay = 20;
        type = "food";
        add = "40";
    };
};

class kss_bread: kss_itemcore
{
    displayName = "$STR_KSS_bread";
    descriptionShort = "";
    picture = "\tf_kss\data\bread_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 8;
    };
    class KSS
    {
        delay = 10;
        type = "food";
        add = "20";
    };
};

class kss_sausage : kss_itemcore
{
    displayName = "$STR_KSS_sausage";
    descriptionShort = "";
    picture = "\tf_kss\data\sausage_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 8;
    };
    class KSS
    {
        delay = 10;
        type = "food";
        add = "30";
    };
};

class kss_irp : kss_itemcore
{
    displayName = "$STR_KSS_irp";
    descriptionShort = "";
    picture = "\tf_kss\data\irp_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 25;
    };
    class KSS
    {
        delay = 30;
        type = "both";
        add = "90";
    };
};

class kss_mre : kss_itemcore
{
    displayName = "$STR_KSS_mre";
    descriptionShort = "";
    picture = "\tf_kss\data\mre_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 25;
    };
    class KSS
    {
        delay = 30;
        type = "both";
        add = "90";
    };
};

class kss_tushenka_beef : kss_itemcore
{
    displayName = "$STR_KSS_tushenka_beef";
    descriptionShort = "";
    picture = "\tf_kss\data\tushenka_beef_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 10;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "30";
    };
};

class kss_tushenka_ham : kss_itemcore
{
    displayName = "$STR_KSS_tushenka_pork";
    descriptionShort = "";
    picture = "\tf_kss\data\tushenka_pork_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 10;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "30";
    };
};

class kss_shproti : kss_itemcore
{
    displayName = "$STR_KSS_shproti";
    descriptionShort = "";
    picture = "\tf_kss\data\shproti_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 10;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "25";
    };
};

class kss_losos : kss_itemcore
{
    displayName = "$STR_KSS_losos";
    descriptionShort = "";
    picture = "\tf_kss\data\losos_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 10;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "30";
    };
};

class kss_kilka : kss_itemcore
{
    displayName = "$STR_KSS_kilka";
    descriptionShort = "";
    picture = "\tf_kss\data\kilka_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 10;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "30";
    };
};

class kss_caviar: kss_itemcore
{
    displayName = "$STR_KSS_caviar";
    descriptionShort = "";
    picture = "\tf_kss\data\caviar_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 7;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "20";
    };
};

class kss_corn: kss_itemcore
{
    displayName = "$STR_KSS_corn";
    descriptionShort = "";
    picture = "\tf_kss\data\corn_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 10;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "30";
    };
};

class kss_pea: kss_itemcore
{
    displayName = "$STR_KSS_pea";
    descriptionShort = "";
    picture = "\tf_kss\data\pea_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 8;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "30";
    };
};

class kss_red_beans: kss_itemcore
{
    displayName = "$STR_KSS_red_beans";
    descriptionShort = "";
    picture = "\tf_kss\data\red_beans_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 8;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "30";
    };
};

class kss_tomatoes: kss_itemcore
{
    displayName = "$STR_KSS_tomatoes";
    descriptionShort = "";
    picture = "\tf_kss\data\tomatoes_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 8;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "20";
    };
};

class kss_cucumbers: kss_itemcore
{
    displayName = "$STR_KSS_cucumbers";
    descriptionShort = "";
    picture = "\tf_kss\data\cucumbers_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 8;
    };
    class KSS
    {
        delay = 15;
        type = "food";
        add = "20";
    };
};

class kss_soup_vegetable: kss_itemcore
{
    displayName = "$STR_KSS_soup_vegetable";
    descriptionShort = "";
    picture = "\tf_kss\data\soup_vegetable_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 15;
    };
    class KSS
    {
        delay = 20;
        type = "both";
        add = "35";
    };
};


class kss_soup_chicken: kss_itemcore
{
    displayName = "$STR_KSS_soup_chicken";
    descriptionShort = "";
    picture = "\tf_kss\data\soup_chicken_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 15;
    };
    class KSS
    {
        delay = 20;
        type = "both";
        add = "35";
    };
};

class kss_mushrooms: kss_itemcore
{
    displayName = "$STR_KSS_mushrooms";
    descriptionShort = "";
    picture = "\tf_kss\data\mushrooms_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 5;
    };
    class KSS
    {
        delay = 10;
        type = "food";
        add = "floor (random 5) + 10";
    };
};

class kss_vodka : kss_itemcore
{
    displayName = "$STR_KSS_vodka";
    descriptionShort = "";
    picture = "\tf_kss\data\vodka_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 5;
    };
    class KSS
    {
        delay = 10;
        type = "alcohol";
        add = "3";
        addWater = "-(round random 6)";
        duration = "3 * 60";
    };
};

class kss_beer_light : kss_itemcore
{
    displayName = "$STR_KSS_beer_light";
    descriptionShort = "";
    picture = "\tf_kss\data\beer_light_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 5;
    };
    class KSS
    {
        delay = 10;
        type = "alcohol";
        add = "1";
        addWater = "10";
        duration = "1 * 60";
    };
};

class kss_beer_dark : kss_itemcore
{
    displayName = "$STR_KSS_beer_dark";
    descriptionShort = "";
    picture = "\tf_kss\data\beer_dark_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 5;
    };
    class KSS
    {
        delay = 10;
        type = "alcohol";
        add = "1";
        addWater = "10";
        duration = "1 * 60";
    };
};

class kss_cocktail_patron : kss_itemcore
{
    displayName = "Коктель ""Патрон""";
    descriptionShort = "Приготовлен по рецепту тв. Москвина";
    picture = "\tf_kss\data\cocktail_patron_CA.paa";
    class ItemInfo: InventoryItem_Base_F {
        mass = 5;
    };
    class KSS
    {
        delay = 10;
        type = "alcohol";
        add = "2";
        addWater = "-(round random 6)";
        duration = "2 * 60";
    };
};
