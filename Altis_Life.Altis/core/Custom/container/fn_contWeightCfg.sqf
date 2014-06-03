/*
	File: fn_contWeightCfg.sqf
	Author: cammygames
	
	Description:
	Master configuration for Container weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "Land_Cargo20_military_green_F": {250};
	case "Land_Cargo20_blue_F": {250};
	case "Land_Cargo20_brick_red_F": {250};
	case "Land_Cargo20_orange_F": {250};
	case "Land_Cargo20_cyan_F": {250};
	case "Land_Cargo20_red_F": {250};
	case "Land_Cargo20_sand_F": {250};
	case "Land_Cargo20_grey_F": {250};
	case "Land_Cargo20_white_F": {250};
	case "Land_Cargo20_light_blue_F": {250};
	case "Land_Cargo20_light_green_F": {250};
	case "Land_Cargo20_yellow_F": {250};
	case "Land_CargoBox_V1_F": {150};
	case "Land_WaterBarrel_F": {100};
	case "Land_WaterTank_F": {100};
	case "Land_BarrelEmpty_F": {50};
	case "Box_NATO_AmmoVeh_F": {150};

	default {-1};
};