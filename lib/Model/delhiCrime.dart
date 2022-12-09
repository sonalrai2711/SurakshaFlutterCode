import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

class delhiCrimeModel {
  late String Area;
  late String Safety_index;
  late String Safety_index_code;
     late String Safety_index_code_val;
      late String count;
      late String Chain_Snatching;
      late String Petty_Robbery;
      late String Taking_pictures_without_permission;
      late String Sexual_Invites;
      late String Catcalls_Whistles;
      late String Commenting;
      late String Ogling_Lewd_Facial_Expressions_Staring;
      late String Touching_Groping;
      late String Others;
      late String Stalking;
      late String Poor_No_Street_Lighting;
      late String Indecent_exposure;
      late String Indecent_Exposure_Masturbation_in_public;
      late String Rape_Sexual_Assault;
      late String North_East_India_Report;
      late String Human_Trafficking;
      late String Online_Harassment;
      late String Quarter1;
      late String Quarter2;
      late String Quarter3;
      late String Quarter4;


  delhiCrimeModel(this.Area,  this.Safety_index, this.Safety_index_code, this.Safety_index_code_val,
      this.count,  this.Chain_Snatching,  this.Petty_Robbery, this.Taking_pictures_without_permission,
      this.Sexual_Invites,
      this.Catcalls_Whistles,
      this.Commenting, this.Ogling_Lewd_Facial_Expressions_Staring,
      this.Touching_Groping, this.Others, this.Stalking, this.Poor_No_Street_Lighting,
      this.Indecent_exposure, this.Indecent_Exposure_Masturbation_in_public, this.Rape_Sexual_Assault,
      this.North_East_India_Report,
      this.Human_Trafficking, this.Online_Harassment,
       this.Quarter1, this.Quarter2, this.Quarter3, this.Quarter4,

        );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'Area' : Area ,
      'Safety_index' : Safety_index  ,
      'Safety_index_code' : Safety_index_code  ,
      'Safety_index_code_val' : Safety_index_code_val ,
      'count' : count ,
      'Chain_Snatching' : Chain_Snatching  ,
      'Petty_Robbery' : Petty_Robbery  ,
      'Taking_pictures_without_permission' : Taking_pictures_without_permission  ,
      'Sexual_Invites' : Sexual_Invites ,
      'Catcalls_Whistles' : Catcalls_Whistles ,
      'Commenting' : Commenting  ,
      'Ogling_Lewd_Facial_Expressions_Staring' : Ogling_Lewd_Facial_Expressions_Staring ,
      'Touching_Groping' : Touching_Groping  ,
      'Others' : Others ,
      'Stalking' : Stalking ,
      'Poor_No_Street_Lighting' : Poor_No_Street_Lighting ,
      'Indecent_exposure' : Indecent_exposure,
      'Indecent_Exposure_Masturbation_in_public' : Indecent_Exposure_Masturbation_in_public  ,
      'Rape_Sexual_Assault' : Rape_Sexual_Assault ,
      'North_East_India_Report' : North_East_India_Report ,
      'Human_Trafficking' : Human_Trafficking ,
      'Online_Harassment' : Online_Harassment ,
      'Quarter1' : Quarter1 ,
      'Quarter2' : Quarter2 ,
      'Quarter3' :  Quarter3,
      'Quarter4' :  Quarter4
    };
    return map;
  }

  delhiCrimeModel.fromMap(Map<String, dynamic> map) {
    Area = map['Area'] ;
    Safety_index = map['Safety_index'] ;
    Safety_index_code = map['Safety_index_code'] ;
    Safety_index_code_val = map['Safety_index_code_val'] ;
    count = map['count'] ;
    Chain_Snatching = map['Chain_Snatching'] ;
    Petty_Robbery = map['Petty_Robbery'] ;
    Taking_pictures_without_permission = map['Taking_pictures_without_permission'] ;
    Sexual_Invites = map['Sexual_Invites'] ;
    Catcalls_Whistles = map['Catcalls_Whistles'] ;
    Commenting = map['Commenting'] ;
    Ogling_Lewd_Facial_Expressions_Staring = map['Ogling_Lewd_Facial_Expressions_Staring'] ;
    Touching_Groping = map['Touching_Groping'] ;
    Others = map['Others'] ;
    Stalking = map['Stalking'] ;
    Poor_No_Street_Lighting = map['Poor_No_Street_Lighting'] ;
    Indecent_exposure = map['Indecent_exposure'] ;
    Indecent_Exposure_Masturbation_in_public = map['Indecent_Exposure_Masturbation_in_public'] ;
    Rape_Sexual_Assault = map['Rape_Sexual_Assault'] ;
    North_East_India_Report = map['North_East_India_Report'] ;
    Human_Trafficking = map['Human_Trafficking'] ;
    Online_Harassment = map['Online_Harassment'] ;
    Quarter1 = map['Quarter1'] ;
    Quarter2 = map['Quarter2'] ;
    Quarter3 = map['Quarter3'] ;
    Quarter4 = map['Quarter4'] ;
  }

  //final delhiCrimeData = new File('assets/Delhi_Dashboard.csv').openRead();

  //final fields = delhiCrimeData.transform(utf8.decoder).transform(CsvToListConverter()).toList();

}