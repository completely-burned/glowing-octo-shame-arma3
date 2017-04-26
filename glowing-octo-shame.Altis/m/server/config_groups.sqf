﻿
private ["_west","_east","_guer","_woodland","_deserted"];
_west=[];_east=[];_guer=[];

_woodland=false; _deserted=false;
if(toLower worldname in ["altis"])then{_deserted=true};
if(toLower worldname in ["tanoa"])then{_woodland=true};

// A3
if(configName(LIB_cfgVeh >> "B_Soldier_F") != "")then{

	// B_
	if(!_woodland && _deserted)then{
		_west=_west+[
			[[[["B_soldier_TL_F","B_soldier_AR_F","B_medic_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_soldier_TL_F","B_engineer_F","B_soldier_exp_F","B_soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_soldier_TL_F","B_engineer_F","B_engineer_F","B_soldier_repair_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-5,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_soldier_TL_F","B_support_MG_F","B_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_soldier_TL_F","B_support_GMG_F","B_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_soldier_TL_F","B_support_Mort_F","B_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_soldier_SL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_soldier_SL_F","B_soldier_AR_F","B_soldier_GL_F","B_soldier_M_F","B_soldier_AT_F","B_soldier_AAT_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_Soldier_TL_F","B_Soldier_AR_F","B_soldier_GL_F","B_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_Soldier_TL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_Soldier_TL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_soldier_GL_F","B_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["B_Soldier_SL_F","B_soldier_AR_F","B_HeavyGunner_F","B_soldier_AAR_F","B_soldier_M_F","B_Sharpshooter_F","B_soldier_LAT_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_G_Soldier_TL_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_engineer_F","B_G_engineer_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_G_soldier_SL_F","B_G_soldier_F","B_G_soldier_LAT_F","B_G_Soldier_M_F","B_G_soldier_TL_F","B_G_soldier_AR_F","B_G_Soldier_A_F","B_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_G_soldier_SL_F","B_G_soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_soldier_LAT_F","B_G_soldier_LAT_F","B_G_soldier_A_F","B_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_G_Soldier_TL_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_G_Soldier_GL_F","B_G_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["B_G_Soldier_M_F","B_G_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["B_G_Sharpshooter_F","B_G_Soldier_M_F"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.5],
			[[[["B_G_Soldier_SL_F","B_G_Sharpshooter_F","B_G_Soldier_AR_F","B_G_Soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// разведка
			[[[["B_recon_TL_F","B_recon_exp_F","B_recon_exp_F","B_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_LAT_F","B_recon_JTAC_F","B_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_recon_M_F","B_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_F","B_recon_LAT_F","B_recon_JTAC_F","B_recon_exp_F","B_Recon_Sharpshooter_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL"]]],0.5],
			[[[["B_sniper_F","B_spotter_F"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.5],
			// водолазы
			[[[["B_diver_TL_F","B_diver_exp_F","B_diver_F","B_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// колесный
			[[[["B_MRAP_01_gmg_F","B_soldier_AR_F","B_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["PRIVATE","SERGEANT","CORPORAL"]]],0.5],
			[[[["B_MRAP_01_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","CORPORAL","CORPORAL"]]],0.5],
			[[[["B_MRAP_01_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","CORPORAL","CORPORAL"]]],0.5],
			[[[["B_MRAP_01_F","B_soldier_TL_F","B_support_MG_F","B_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["B_MRAP_01_F","B_soldier_TL_F","B_support_GMG_F","B_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["B_MRAP_01_F","B_soldier_TL_F","B_support_Mort_F","B_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["B_Truck_01_transport_F","B_soldier_SL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F","B_soldier_SL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],["PRIVATE","SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_G_Offroad_01_F","B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F","B_G_medic_F","B_G_Soldier_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["PRIVATE","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
			[[[["B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","CORPORAL"]]],0.5],
			// бтр
			[[[["B_APC_Wheeled_01_cannon_F","B_soldier_SL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_APC_Wheeled_01_cannon_F","B_soldier_SL_F","B_soldier_TL_F","B_soldier_repair_F","B_engineer_F","B_medic_F","B_soldier_AR_F","B_soldier_exp_F","B_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
			// гусеничный
			[[[["B_APC_Tracked_01_rcws_F","B_soldier_SL_F","B_soldier_AR_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F","B_soldier_AAT_F","B_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_APC_Tracked_01_aa_F","B_soldier_SL_F","B_soldier_AR_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F","B_soldier_AAA_F","B_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// танки
			[[[["B_MBT_01_cannon_F","B_MBT_01_cannon_F","B_MBT_01_cannon_F","B_MBT_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["B_MBT_01_cannon_F","B_APC_Tracked_01_aa_F","B_MBT_01_cannon_F","B_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["B_MBT_01_cannon_F","B_MBT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5]
			// артиллерия
			// [[[["B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			// [[[["B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
			// [[[["B_MBT_01_mlrs_F","B_MBT_01_mlrs_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
		];
	};
	if(true)then{
		_west=_west+[
			// беспилотники
			[[[["B_UAV_01_F"],[],["PRIVATE"]]],0.5],
			[[[["B_UGV_01_F"],[],["PRIVATE"]]],0.5],
			[[[["B_UGV_01_rcws_F"],[],["PRIVATE"]]],0.5],
			[[[["B_UAV_02_F"],[],["PRIVATE"]]],0.5],
			[[[["B_UAV_02_CAS_F"],[],["PRIVATE"]]],0.5],
			// авиация
			[[[["B_Plane_CAS_01_F","B_Plane_CAS_01_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5],
			[[[["B_Heli_Light_01_armed_F","B_Heli_Light_01_armed_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5],
			[[[["B_Heli_Attack_01_F","B_Heli_Attack_01_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5],
			[[[["B_Heli_Transport_03_F","B_Heli_Transport_03_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5],
			[[[["B_Heli_Transport_01_F","B_Heli_Transport_01_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5]
		];
	};

	// O_
	if(!_woodland && _deserted)then{
		_east=_east+[
			// пехота
			[[[["O_soldierU_SL_F","O_soldierU_F","O_soldierU_LAT_F","O_soldierU_M_F","O_soldierU_TL_F","O_soldierU_AR_F","O_soldierU_A_F","O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldierU_TL_F","O_soldierU_AR_F","O_soldierU_GL_F","O_soldierU_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldierU_GL_F","O_soldierU_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["O_soldier_SL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldier_SL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_M_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldier_TL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldier_TL_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldier_TL_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldier_GL_F","O_soldier_F"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["O_Soldier_SL_F","O_Soldier_AR_F","O_HeavyGunner_F","O_Soldier_AAR_F","O_soldier_M_F","O_Sharpshooter_F","O_Soldier_LAT_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldier_TL_F","O_soldier_AR_F","O_medic_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldier_TL_F","O_engineer_F","O_soldier_exp_F","O_soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldier_TL_F","O_engineer_F","O_engineer_F","O_soldier_repair_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_soldier_TL_F","O_support_MG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_soldier_TL_F","O_support_GMG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_soldier_TL_F","O_support_Mort_F","O_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// разведка
			[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_LAT_F","O_recon_JTAC_F","O_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_recon_M_F","O_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_F","O_recon_LAT_F","O_recon_JTAC_F","O_recon_exp_F","O_Pathfinder_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL"]]],0.5],
			[[[["O_recon_TL_F","O_recon_exp_F","O_recon_exp_F","O_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_sniper_F","O_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			// водолазы
			[[[["O_diver_TL_F","O_diver_exp_F","O_diver_F","O_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// колесный
			[[[["O_MRAP_02_GMG_F","O_soldier_AR_F","O_soldier_AT_F"],[[0,0,0],[-5,-5,0],[-5,-5,0]],["PRIVATE","SERGEANT","CORPORAL"]]],0.5],
			[[[["O_MRAP_02_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_MRAP_02_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_MRAP_02_F","O_soldier_TL_F","O_support_MG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["O_MRAP_02_F","O_soldier_TL_F","O_support_GMG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["O_MRAP_02_F","O_soldier_TL_F","O_support_Mort_F","O_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["O_Truck_03_transport_F","O_soldier_SL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0]],["PRIVATE","SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// бтр
			[[[["O_APC_Wheeled_02_rcws_F","O_soldier_SL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_APC_Wheeled_02_rcws_F","O_soldier_SL_F","O_soldier_TL_F","O_soldier_repair_F","O_engineer_F","O_medic_F","O_soldier_AR_F","O_soldier_exp_F","O_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
			// гусеничный
			[[[["O_APC_Tracked_02_cannon_F","O_soldier_SL_F","O_soldier_AR_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_AAT_F","O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_APC_Tracked_02_cannon_F","O_soldier_SL_F","O_soldier_AR_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F","O_soldier_AAA_F","O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// танки
			[[[["O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["O_MBT_02_cannon_F","O_MBT_02_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5]
			// артиллерия
			// [[[["O_MBT_02_arty_F","O_MBT_02_arty_F","O_MBT_02_arty_F","O_MBT_02_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			// [[[["O_MBT_02_arty_F","O_MBT_02_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
		];
	};
	if(true)then{
		_east=_east+[
			// беспилотники
			[[[["O_UAV_01_F"],[],["PRIVATE"]]],0.5],
			[[[["O_UGV_01_F"],[],["PRIVATE"]]],0.5],
			[[[["O_UGV_01_rcws_F"],[],["PRIVATE"]]],0.5],
			[[[["O_UAV_02_F"],[],["PRIVATE"]]],0.5],
			[[[["O_UAV_02_CAS_F"],[],["PRIVATE"]]],0.5],
			// авиация
			[[[["O_Heli_Attack_02_black_F","O_Heli_Attack_02_black_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5],
			[[[["O_Heli_Light_02_F","O_Heli_Light_02_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5],
			[[[["O_Plane_CAS_02_F","O_Plane_CAS_02_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5]
		];
	};

	// I_
	if(true)then{
		_guer=_guer+[
			// пехота
			[[[["I_Soldier_TL_F","I_Soldier_AR_F","I_medic_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_Soldier_TL_F","I_engineer_F","I_Soldier_exp_F","I_Soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_Soldier_TL_F","I_engineer_F","I_engineer_F","I_Soldier_repair_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_Soldier_TL_F","I_support_MG_F","I_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_Soldier_TL_F","I_support_GMG_F","I_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_Soldier_TL_F","I_support_Mort_F","I_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_soldier_SL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_soldier_SL_F","I_soldier_AR_F","I_soldier_GL_F","I_soldier_M_F","I_soldier_AT_F","I_soldier_AAT_F","I_soldier_A_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_GL_F","I_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_Soldier_TL_F","I_Soldier_AT_F","I_Soldier_AT_F","I_Soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_Soldier_TL_F","I_Soldier_AA_F","I_Soldier_AA_F","I_Soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_Soldier_GL_F","I_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			// разведка
			[[[["I_Sniper_F","I_Spotter_F"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.5],
			// водолазы
			[[[["I_diver_TL_F","I_diver_exp_F","I_diver_F","I_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// колесный
			[[[["I_MRAP_03_gmg_F","I_Soldier_AR_F","I_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_MRAP_03_F","I_Soldier_AT_F","I_Soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_MRAP_03_F","I_Soldier_AA_F","I_Soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_MRAP_03_F","I_support_MG_F","I_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["I_MRAP_03_F","I_support_GMG_F","I_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["I_MRAP_03_F","I_support_Mort_F","I_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["I_Truck_02_transport_F","I_soldier_SL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F","I_soldier_SL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],["PRIVATE","SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// бтр
			[[[["I_APC_Wheeled_03_cannon_F","I_soldier_SL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_APC_Wheeled_03_cannon_F","I_soldier_SL_F","I_soldier_TL_F","I_soldier_repair_F","I_engineer_F","I_medic_F","I_soldier_AR_F","I_soldier_exp_F","I_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
			// гусеничный
			[[[["I_APC_tracked_03_cannon_F","I_soldier_SL_F","I_soldier_AT_F","I_soldier_AT_F","I_soldier_AT_F","I_soldier_AAT_F","I_soldier_AAT_F","I_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_APC_tracked_03_cannon_F","I_soldier_SL_F","I_soldier_AA_F","I_soldier_AA_F","I_soldier_AA_F","I_soldier_AAT_F","I_soldier_AAA_F","I_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["PRIVATE","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// танки
			[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_MBT_03_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_soldier_SL_F","I_soldier_AA_F","I_soldier_AA_F","I_soldier_AA_F","I_soldier_AAA_F","I_soldier_AAA_F","I_soldier_AAA_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[0,-15,0],[0,-20,0],[5,-25,0],[-5,-25,0],[10,-30,0],[-10,-30,0],[15,-35,0],[-15,-35,0]],["LIEUTENANT","CORPORAL","CORPORAL","SERGEANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
			// беспилотники
			[[[["I_UAV_01_F"],[],["PRIVATE"]]],0.5],
			[[[["I_UGV_01_F"],[],["PRIVATE"]]],0.5],
			[[[["I_UGV_01_rcws_F"],[],["PRIVATE"]]],0.5],
			[[[["I_UAV_02_F"],[],["PRIVATE"]]],0.5],
			[[[["I_UAV_02_CAS_F"],[],["PRIVATE"]]],0.5],
			// авиация
			[[[["I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_CAS_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5],
			[[[["I_Heli_light_03_F","I_Heli_light_03_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","CAPTAIN"]]],0.5]
			// артиллерия
		];
	};
};

if(configName(LIB_cfgVeh >> "B_T_soldier_F") != "")then{
	if(_woodland && !_deserted)then{
		// B_T_
		_west=_west+[
			// пехота
			[[[["B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_medic_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_TL_F","B_T_engineer_F","B_T_soldier_exp_F","B_T_soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_TL_F","B_T_engineer_F","B_T_engineer_F","B_T_soldier_repair_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-5,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_TL_F","B_T_support_MG_F","B_T_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_soldier_TL_F","B_T_support_GMG_F","B_T_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_soldier_TL_F","B_T_support_Mort_F","B_T_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_soldier_SL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_GL_F","B_T_soldier_M_F","B_T_soldier_AT_F","B_T_soldier_AAT_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_soldier_GL_F","B_T_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_TL_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_TL_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_GL_F","B_T_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["B_GEN_Commander_F","B_GEN_Soldier_F"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.5],
			// разведка
			[[[["B_T_recon_TL_F","B_T_recon_exp_F","B_T_recon_exp_F","B_T_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_recon_TL_F","B_T_recon_M_F","B_T_recon_medic_F","B_T_recon_LAT_F","B_T_recon_JTAC_F","B_T_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_recon_TL_F","B_T_recon_M_F","B_T_recon_medic_F","B_T_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_recon_M_F","B_T_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_sniper_F","B_T_spotter_F"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.5],
			[[[["B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_Exp_tna_F","B_CTRG_Soldier_AR_tna_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_LAT_tna_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_tna_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			// водолазы
			[[[["B_T_diver_TL_F","B_T_diver_exp_F","B_T_diver_F","B_T_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// колесный
			[[[["B_T_MRAP_01_gmg_F","B_T_soldier_AR_F","B_T_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_MRAP_01_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_MRAP_01_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_MRAP_01_F","B_T_soldier_TL_F","B_T_support_MG_F","B_T_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_MRAP_01_F","B_T_soldier_TL_F","B_T_support_GMG_F","B_T_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_MRAP_01_F","B_T_soldier_TL_F","B_T_support_Mort_F","B_T_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_Truck_01_transport_F","B_T_soldier_SL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F","B_T_soldier_SL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_LSV_01_unarmed_CTRG_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_Exp_tna_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["B_T_LSV_01_armed_CTRG_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_LAT_tna_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT"]]],0.5],
			[[[["B_GEN_Offroad_01_gen_F","B_GEN_Soldier_F"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.5],
			// бтр
			[[[["B_T_APC_Wheeled_01_cannon_F","B_T_soldier_SL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_APC_Wheeled_01_cannon_F","B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_repair_F","B_T_engineer_F","B_T_medic_F","B_T_soldier_AR_F","B_T_soldier_exp_F","B_T_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// гусеничный
			[[[["B_T_APC_Tracked_01_rcws_F","B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AAT_F","B_T_soldier_AAT_F","B_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_APC_Tracked_01_aa_F","B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AAA_F","B_T_soldier_AAA_F","B_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// танки
			[[[["B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["B_T_MBT_01_cannon_F","B_T_APC_Tracked_01_aa_F","B_T_MBT_01_cannon_F","B_T_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5]
			// авиация
			// артиллерия
			// [[[["B_T_MBT_01_arty_F","B_T_MBT_01_arty_F","B_T_MBT_01_arty_F","B_T_MBT_01_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			// [[[["B_T_MBT_01_arty_F","B_T_MBT_01_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
			// [[[["B_T_MBT_01_mlrs_F","B_T_MBT_01_mlrs_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
		];
	};
	if(_woodland && !_deserted)then{
		// O_T_
		_east=_east+[
			// пехота
			[[[["O_T_soldier_SL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_soldier_SL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_M_F","O_T_soldier_AT_F","O_T_soldier_AAT_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_soldier_TL_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_soldier_TL_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_soldier_GL_F","O_T_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_medic_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_soldier_TL_F","O_T_engineer_F","O_T_soldier_exp_F","O_T_soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_soldier_TL_F","O_T_engineer_F","O_T_engineer_F","O_T_soldier_repair_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_soldier_TL_F","O_T_support_MG_F","O_T_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_T_soldier_TL_F","O_T_support_GMG_F","O_T_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_T_soldier_TL_F","O_T_support_Mort_F","O_T_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// разведка
			[[[["O_V_Soldier_TL_hex_F","O_V_Soldier_JTAC_hex_F","O_V_Soldier_M_hex_F","O_V_Soldier_Exp_hex_F","O_V_Soldier_LAT_hex_F","O_V_Soldier_Medic_hex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_recon_TL_F","O_T_recon_M_F","O_T_recon_medic_F","O_T_recon_LAT_F","O_T_recon_JTAC_F","O_T_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_recon_TL_F","O_T_recon_M_F","O_T_recon_medic_F","O_T_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_recon_M_F","O_T_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			[[[["O_T_recon_TL_F","O_T_recon_exp_F","O_T_recon_exp_F","O_T_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_sniper_F","O_T_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
			// водолазы
			[[[["O_T_diver_TL_F","O_T_diver_exp_F","O_T_diver_F","O_T_diver_F"],[],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// колесный
			[[[["O_T_MRAP_02_gmg_ghex_F","O_T_soldier_AR_F","O_T_soldier_AT_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_T_MRAP_02_ghex_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_MRAP_02_ghex_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_MRAP_02_ghex_F","O_T_soldier_TL_F","O_T_support_MG_F","O_T_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_T_MRAP_02_ghex_F","O_T_soldier_TL_F","O_T_support_GMG_F","O_T_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_T_MRAP_02_ghex_F","O_T_soldier_TL_F","O_T_support_Mort_F","O_T_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			[[[["O_T_LSV_02_unarmed_viper_F","O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_LSV_02_armed_viper_F","O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_Truck_03_transport_ghex_F","O_T_soldier_SL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F","O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_LAT_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// бтр
			[[[["O_T_APC_Wheeled_02_rcws_ghex_F","O_T_soldier_SL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_APC_Wheeled_02_rcws_ghex_F","O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_repair_F","O_T_engineer_F","O_T_medic_F","O_T_soldier_AR_F","O_T_soldier_exp_F","O_T_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-2,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// гусеничный
			[[[["O_T_APC_Tracked_02_cannon_ghex_F","O_T_soldier_SL_F","O_T_soldier_AR_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AAT_F","O_T_soldier_AAT_F","O_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_APC_Tracked_02_cannon_ghex_F","O_T_soldier_SL_F","O_T_soldier_AR_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AAA_F","O_T_soldier_AAA_F","O_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-20,0],[-10,-20,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// танки
			[[[["O_T_MBT_02_cannon_ghex_F","O_T_MBT_02_cannon_ghex_F","O_T_MBT_02_cannon_ghex_F","O_T_MBT_02_cannon_ghex_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["O_T_MBT_02_cannon_ghex_F","O_T_APC_Tracked_02_AA_ghex_F","O_T_MBT_02_cannon_ghex_F","O_T_APC_Tracked_02_AA_ghex_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			[[[["O_T_MBT_02_cannon_ghex_F","O_T_MBT_02_cannon_ghex_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5]
			// артиллерия
			// [[[["O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			// [[[["O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5]
		];
	};
	if(_woodland && !_deserted)then{
		// I_C_
		_guer=_guer+[
			// пехота
			[[[["I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_3_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_C_Soldier_Para_6_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_3_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_1_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_8_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
			[[[["I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_8_F","I_C_Soldier_Bandit_1_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5]
		];
	};
};

AllGroupsWest=_west;
AllGroupsEast=_east;
AllGroupsGuerrila=_guer;

			// пехота
			// разведка
			// водолазы
			// колесный
			// бтр
			// гусеничный
			// танки
			// беспилотники
			// авиация
			// артиллерия