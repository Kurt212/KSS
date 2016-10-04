class CfgPatches
{
	class KSS
	{
		name = "Kurt's Survival System";
		author = "Kurt";
		authorUrl = "https://github.com/Kurt212";

		version = "1.2.0";

		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"cba_main", "A3_Modules_F"};
	};
};

class CfgFunctions
{
	#include "CfgFunctions.hpp"
};

class CfgWeapons
{
	#include "CfgWeapons.hpp"
};

class CfgSounds
{
	sounds[] = {};
	#include "CfgSounds.hpp"
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class KSS: NO_CATEGORY
	{
		displayName = "KSS";
	};
};


#include "CfgVehicles.hpp"

#include "dialogs.hpp"
