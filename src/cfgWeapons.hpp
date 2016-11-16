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
    displayName = "Бутылка (Маленькая)";
    descriptionShort = "Бутылка воды 0.25";
    picture = "\kss\data\bottle_small_CA.paa";
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
    displayName = "Бутылка (Большая)";
    descriptionShort = "Большая бутылка воды 0.5";
    picture = "\kss\data\bottle_big_CA.paa";
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
    displayName = "Кока-кола";
    descriptionShort = "В алюминиевой банке";
    picture = "\kss\data\soda_coke_CA.paa";
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
    displayName = "Маунтин Дью";
    descriptionShort = "В алюминиевой банке";
    picture = "\kss\data\soda_mdew_CA.paa";
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
    displayName = "Пепси-кола";
    descriptionShort = "В алюминиевой банке";
    picture = "\kss\data\soda_pepsi_CA.paa";
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
    displayName = "Чипсы";
    descriptionShort = "Хрустящие с солью";
    picture = "\kss\data\chips_CA.paa";
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
    displayName = "Стейк";
    descriptionShort = "Зажаренный стейк";
    picture = "\kss\data\steak_CA.paa";
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
    displayName = "Куриная ножка";
    descriptionShort = "Зажаренная куриная ножка";
    picture = "\kss\data\chicken_CA.paa";
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
    displayName = "Буханка хлеба";
    descriptionShort = "Буханка белого хлеба";
    picture = "\kss\data\bread_CA.paa";
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
    displayName = "Колбаса";
    descriptionShort = "Батон варено-копченой колбасы";
    picture = "\kss\data\sausage_CA.paa";
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
    displayName = "ИРП";
    descriptionShort = "Дорогостоящий армейский ИРП";
    picture = "\kss\data\irp_CA.paa";
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
    displayName = "MRE";
    descriptionShort = "Дорогостоящий армейский ИРП";
    picture = "\kss\data\mre_CA.paa";
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
    displayName = "Тушёнка (Говядина)";
    descriptionShort = "Тушёная говядина в консервах";
    picture = "\kss\data\tushenka_beef_CA.paa";
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
    displayName = "Тушёнка (Свинина)";
    descriptionShort = "Тушёная свинина в консервах";
    picture = "\kss\data\tushenka_ham_CA.paa";
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
    displayName = "Шпроты";
    descriptionShort = "Шпроты в масле";
    picture = "\kss\data\shproti_CA.paa";
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
    displayName = "Лосось";
    descriptionShort = "Лосось в консервах";
    picture = "\kss\data\losos_CA.paa";
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
    displayName = "Килька";
    descriptionShort = "Килька в консервах";
    picture = "\kss\data\kilka_CA.paa";
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
    displayName = "Икра";
    descriptionShort = "Икра лососевая";
    picture = "\kss\data\caviar_CA.paa";
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
    displayName = "Кукуруза";
    descriptionShort = "Кукуруза в консервах";
    picture = "\kss\data\corn_CA.paa";
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
    displayName = "Горох";
    descriptionShort = "Горох в консервах";
    picture = "\kss\data\pea_CA.paa";
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
    displayName = "Красная фасоль";
    descriptionShort = "Законсервированная красная фасоль";
    picture = "\kss\data\red_beans_CA.paa";
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
    displayName = "Томаты";
    descriptionShort = "Томаты в собственном соку";
    picture = "\kss\data\tomatoes_CA.paa";
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
    displayName = "Огурцы";
    descriptionShort = "Замаринованные огурцы";
    picture = "\kss\data\cucumbers_CA.paa";
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

class kss_soup: kss_itemcore
{
    displayName = "Суп (Овощной)";
    descriptionShort = "Консервированный овощной суп";
    picture = "\kss\data\soup_vegetable_CA.paa";
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
    displayName = "Суп (Куриный)";
    descriptionShort = "Консервированный куриный суп";
    picture = "\kss\data\soup_chicken_CA.paa";
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
    displayName = "Грибы";
    descriptionShort = "Свежие грибы";
    picture = "\kss\data\mushrooms_CA.paa";
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
    displayName = "Водка";
    descriptionShort = "";
    picture = "\kss\data\vodka_CA.paa";
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
    displayName = "Светлое пиво";
    descriptionShort = "";
    picture = "\kss\data\beer_light_CA.paa";
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
    displayName = "Тёмное пиво";
    descriptionShort = "";
    picture = "\kss\data\beer_dark_CA.paa";
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
    descriptionShort = "";
    picture = "\kss\data\cocktail_patron_CA.paa";
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
