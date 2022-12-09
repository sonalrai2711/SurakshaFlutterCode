import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../Model/SafetyIndexModel.dart';
import '../Model/UserModel.dart';
import '../Model/delhiCrime.dart';

class DbHelper {
  static Database? _db;

  static const String DB_Name = 'test20.db';
  static const String Table_User = 'user';
  static const String Table_Safe = 'safetyIndex';
  static const String Table_CrimeData = 'crimeData5';
  static const int Version = 20;

  //User table columns
  static const String C_UserName = 'user_name';
  static const String C_Email = 'email';
  static const String C_Phone = 'phone';
  static const String C_Gender = 'gender';
  static const String C_AreaSelected = 'area';
  static const String C_EmergencyContact1 = 'emergency_contact1';
  static const String C_EmergencyContact2 = 'emergency_contact2';
  static const String C_Password = 'password';

  //Fields for SafetyIndex table
  static const String C_Area = 'area';
  static const String C_SafetyIndex = 'safetyIndex';
  static const String C_Category = 'category';

  //Fields for Delhi Crime
  static const String C_Delhi_Area = 'Area';
  static const String C_Safety_index = 'Safety_index';
  static const String C_Safety_index_code = 'Safety_index_code';
  static const String C_Safety_index_code_val = 'Safety_index_code_val';
  static const String C_count = 'count';
  static const String C_Chain_Snatching = 'Chain_Snatching';
  static const String C_Petty_Robbery = 'Petty_Robbery';
  static const String C_Taking_pictures_without_permission = 'Taking_pictures_without_permission';
  static const String C_Sexual_Invites = 'Sexual_Invites';
  static const String C_Catcalls_Whistles = 'Catcalls_Whistles';
  static const String C_Commenting = 'Commenting';
  static const String C_Ogling_Lewd_Facial_Expressions_Staring = 'Ogling_Lewd_Facial_Expressions_Staring';
  static const String C_Touching_Groping = 'Touching_Groping';
  static const String C_Others = 'Others';
  static const String C_Stalking = 'Stalking';
  static const String C_Poor_No_Street_Lighting = 'Poor_No_Street_Lighting';
  static const String C_Indecent_exposure = 'Indecent_exposure';
  static const String C_Indecent_Exposure_Masturbation_in_public = 'Indecent_Exposure_Masturbation_in_public';
  static const String C_Rape_Sexual_Assault = 'Rape_Sexual_Assault';
  static const String C_North_East_India_Report = 'North_East_India_Report';
  static const String C_Human_Trafficking = 'Human_Trafficking';
  static const String C_Online_Harassment = 'Online_Harassment';
  static const String C_Quarter1 = 'Quarter1';
  static const String C_Quarter2 = 'Quarter2';
  static const String C_Quarter3 = 'Quarter3';
  static const String C_Quarter4 = 'Quarter4';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int StringVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserName TEXT, "
        " $C_Email TEXT, "
        " $C_Phone TEXT, "
        " $C_Gender TEXT, "
        " $C_AreaSelected TEXT, "
        " $C_EmergencyContact1 TEXT , "
        " $C_EmergencyContact2 TEXT , "
        " $C_Password TEXT , "
        " PRIMARY KEY ($C_UserName)"
        ")");

    await db.execute("CREATE TABLE $Table_Safe ("
        " $C_Area TEXT, "
        " $C_SafetyIndex TEXT, "
        " $C_Category TEXT, "
        " PRIMARY KEY ($C_Area)"
        ")");


    SafetyIndexModel sm1 = SafetyIndexModel('AIIMS','0.0126396775966294','Green');

    await db.insert(Table_Safe, sm1.toMap());

    SafetyIndexModel sm2 = SafetyIndexModel('Adarsh Nagar','0.00439640959882762','Green');

    await db.insert(Table_Safe, sm2.toMap());

    SafetyIndexModel sm3 = SafetyIndexModel('Adchini','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm3.toMap());

    SafetyIndexModel sm4 = SafetyIndexModel('Ajmeri Gate','0.0130060450631984','Green');

    await db.insert(Table_Safe, sm4.toMap());

    SafetyIndexModel sm5 = SafetyIndexModel('Akbar Road','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm5.toMap());

    SafetyIndexModel sm6 = SafetyIndexModel('Alaknanda','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm6.toMap());

    SafetyIndexModel sm7 = SafetyIndexModel('Alipur','0.00989192159736216','Green');

    await db.insert(Table_Safe, sm7.toMap());

    SafetyIndexModel sm8 = SafetyIndexModel('Anand Parbat','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm8.toMap());

    SafetyIndexModel sm9 = SafetyIndexModel('Anand Vihar','0.0194174757281553','Green');

    await db.insert(Table_Safe, sm9.toMap());

    SafetyIndexModel sm10 = SafetyIndexModel('Andrews Ganj','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm10.toMap());

    SafetyIndexModel sm11 = SafetyIndexModel('Ashok Nagar','0.00622824693167247','Green');

    await db.insert(Table_Safe, sm11.toMap());

    SafetyIndexModel sm12 = SafetyIndexModel('Ashok Vihar','0.00714416559809489','Green');

    await db.insert(Table_Safe, sm12.toMap());

    SafetyIndexModel sm13 = SafetyIndexModel('Aya Nagar','0.00109910239970691','Green');

    await db.insert(Table_Safe, sm13.toMap());

    SafetyIndexModel sm14 = SafetyIndexModel('Ayurvigyan Nagar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm14.toMap());

    SafetyIndexModel sm15 = SafetyIndexModel('Azadpur','0.00457959333211211','Green');

    await db.insert(Table_Safe, sm15.toMap());

    SafetyIndexModel sm16 = SafetyIndexModel('BK Dutt Colony','0.000183183733284484','Green');

    await db.insert(Table_Safe, sm16.toMap());

    SafetyIndexModel sm17 = SafetyIndexModel('Badarpur','0.0199670269280088','Green');

    await db.insert(Table_Safe, sm17.toMap());

    SafetyIndexModel sm18 = SafetyIndexModel('Bahadur Shah Zafar Marg','0.00183183733284484','Green');

    await db.insert(Table_Safe, sm18.toMap());

    SafetyIndexModel sm19 = SafetyIndexModel('Barakhamba','0.0384685839897417','Green');

    await db.insert(Table_Safe, sm19.toMap());

    SafetyIndexModel sm20 = SafetyIndexModel('Barwala','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm20.toMap());

    SafetyIndexModel sm21 = SafetyIndexModel('Bawana','0.00806008426451731','Green');

    await db.insert(Table_Safe, sm21.toMap());

    SafetyIndexModel sm22 = SafetyIndexModel('Begumpur','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm22.toMap());

    SafetyIndexModel sm23 = SafetyIndexModel('Ber Sarai','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm23.toMap());

    SafetyIndexModel sm24 = SafetyIndexModel('Bhalswa','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm24.toMap());

    SafetyIndexModel sm25 = SafetyIndexModel('Bijwasan','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm25.toMap());

    SafetyIndexModel sm26 = SafetyIndexModel('Budh Vihar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm26.toMap());

    SafetyIndexModel sm27 = SafetyIndexModel('Central Secretariat','0.0337058069243451','Green');

    await db.insert(Table_Safe, sm27.toMap());

    SafetyIndexModel sm28 = SafetyIndexModel('Chanakyapuri','0.0201502106612933','Green');

    await db.insert(Table_Safe, sm28.toMap());

    SafetyIndexModel sm29 = SafetyIndexModel('Chandni Chowk','0.0870122733101301','Green');

    await db.insert(Table_Safe, sm29.toMap());

    SafetyIndexModel sm30 = SafetyIndexModel('Chawri Bazaar','0.00714416559809489','Green');

    await db.insert(Table_Safe, sm30.toMap());

    SafetyIndexModel sm31 = SafetyIndexModel('Chhatarpur','0.012090126396776','Green');

    await db.insert(Table_Safe, sm31.toMap());

    SafetyIndexModel sm32 = SafetyIndexModel('Chirag Dilli','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm32.toMap());

    SafetyIndexModel sm33 = SafetyIndexModel('Chittaranjan Park','0.00183183733284484','Green');

    await db.insert(Table_Safe, sm33.toMap());

    SafetyIndexModel sm34 = SafetyIndexModel('Civil Lines','0.0144715149294743','Green');

    await db.insert(Table_Safe, sm34.toMap());

    SafetyIndexModel sm35 = SafetyIndexModel('Connaught Place','0.336874885510167','Yellow');

    await db.insert(Table_Safe, sm35.toMap());

    SafetyIndexModel sm36 = SafetyIndexModel('Dakshinpuri','0.15973621542407','Green');

    await db.insert(Table_Safe, sm36.toMap());

    SafetyIndexModel sm37 = SafetyIndexModel('Dallupura','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm37.toMap());

    SafetyIndexModel sm38 = SafetyIndexModel('Dariya Ganj','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm38.toMap());

    SafetyIndexModel sm39 = SafetyIndexModel('Defence Colony','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm39.toMap());

    SafetyIndexModel sm40 = SafetyIndexModel('Delhi Cantt.','0.00439640959882762','Green');

    await db.insert(Table_Safe, sm40.toMap());

    SafetyIndexModel sm41 = SafetyIndexModel('Delhi Gate Bazaar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm41.toMap());

    SafetyIndexModel sm42 = SafetyIndexModel('Dhaula Kuan','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm42.toMap());

    SafetyIndexModel sm43 = SafetyIndexModel('Dilshad Garden','0.0239970690602675','Green');

    await db.insert(Table_Safe, sm43.toMap());

    SafetyIndexModel sm44 = SafetyIndexModel('Dwarka, Delhi','1','Red');

    await db.insert(Table_Safe, sm44.toMap());

    SafetyIndexModel sm45 = SafetyIndexModel('East of Kailash','0.000183183733284484','Green');

    await db.insert(Table_Safe, sm45.toMap());

    SafetyIndexModel sm46 = SafetyIndexModel('Fateh Nagar','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm46.toMap());

    SafetyIndexModel sm47 = SafetyIndexModel('Fatehpuri','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm47.toMap());

    SafetyIndexModel sm48 = SafetyIndexModel('G.B. Road','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm48.toMap());

    SafetyIndexModel sm49 = SafetyIndexModel('GTB Nagar','0.0104414727972156','Green');

    await db.insert(Table_Safe, sm49.toMap());

    SafetyIndexModel sm50 = SafetyIndexModel('Garhi','0','Green');

    await db.insert(Table_Safe, sm50.toMap());

    SafetyIndexModel sm51 = SafetyIndexModel('Gautam Nagar','0.000366367466568969','Green');

    await db.insert(Table_Safe, sm51.toMap());

    SafetyIndexModel sm52 = SafetyIndexModel('Gazipur','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm52.toMap());

    SafetyIndexModel sm53 = SafetyIndexModel('Geeta Colony','0.00183183733284484','Green');

    await db.insert(Table_Safe, sm53.toMap());

    SafetyIndexModel sm54 = SafetyIndexModel('Gharoli','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm54.toMap());

    SafetyIndexModel sm55 = SafetyIndexModel('Gokalpur','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm55.toMap());

    SafetyIndexModel sm56 = SafetyIndexModel('Gole Market','0.00183183733284484','Green');

    await db.insert(Table_Safe, sm56.toMap());

    SafetyIndexModel sm57 = SafetyIndexModel('Govindpuri','0.0126396775966294','Green');

    await db.insert(Table_Safe, sm57.toMap());

    SafetyIndexModel sm58 = SafetyIndexModel('Greater Kailash','0.0360871954570434','Green');

    await db.insert(Table_Safe, sm58.toMap());

    SafetyIndexModel sm59 = SafetyIndexModel('Green Park','0.00897600293093973','Green');

    await db.insert(Table_Safe, sm59.toMap());

    SafetyIndexModel sm60 = SafetyIndexModel('Hari Nagar','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm60.toMap());

    SafetyIndexModel sm61 = SafetyIndexModel('Hastsal','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm61.toMap());

    SafetyIndexModel sm62 = SafetyIndexModel('Hauz Khas','0.063931122916285','Green');

    await db.insert(Table_Safe, sm62.toMap());

    SafetyIndexModel sm63 = SafetyIndexModel('Hazrat Nizamuddin','0.0108078402637846','Green');

    await db.insert(Table_Safe, sm63.toMap());

    SafetyIndexModel sm64 = SafetyIndexModel('IGI Airport','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm64.toMap());

    SafetyIndexModel sm65 = SafetyIndexModel('INA Colony','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm65.toMap());

    SafetyIndexModel sm66 = SafetyIndexModel('IP Estate','0.00366367466568969','Green');

    await db.insert(Table_Safe, sm66.toMap());

    SafetyIndexModel sm67 = SafetyIndexModel('ITO','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm67.toMap());

    SafetyIndexModel sm68 = SafetyIndexModel('Inder Puri','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm68.toMap());

    SafetyIndexModel sm69 = SafetyIndexModel('India Gate','0.0199670269280088','Green');

    await db.insert(Table_Safe, sm69.toMap());

    SafetyIndexModel sm70 = SafetyIndexModel('Jahangirpuri','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm70.toMap());

    SafetyIndexModel sm71 = SafetyIndexModel('Jaitpur','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm71.toMap());

    SafetyIndexModel sm72 = SafetyIndexModel('Jamia Nagar','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm72.toMap());

    SafetyIndexModel sm73 = SafetyIndexModel('Janakpuri','0.0675947975819747','Green');

    await db.insert(Table_Safe, sm73.toMap());


    SafetyIndexModel sm75 = SafetyIndexModel('Jasola','0.00659461439824144','Green');

    await db.insert(Table_Safe, sm75.toMap());

    SafetyIndexModel sm76 = SafetyIndexModel('Jhandewalan','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm76.toMap());

    SafetyIndexModel sm77 = SafetyIndexModel('Jharoda Kalan','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm77.toMap());

    SafetyIndexModel sm78 = SafetyIndexModel('Jhilmil Colony','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm78.toMap());

    SafetyIndexModel sm79 = SafetyIndexModel('Jor Bagh','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm79.toMap());

    SafetyIndexModel sm80 = SafetyIndexModel('Kakrola','0.00806008426451731','Green');

    await db.insert(Table_Safe, sm80.toMap());

    SafetyIndexModel sm81 = SafetyIndexModel('Kalindi Colony','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm81.toMap());

    SafetyIndexModel sm82 = SafetyIndexModel('Kalkaji','0.0450631983879831','Green');

    await db.insert(Table_Safe, sm82.toMap());

    SafetyIndexModel sm83 = SafetyIndexModel('Kalyan Vihar','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm83.toMap());

    SafetyIndexModel sm84 = SafetyIndexModel('Kalyanpuri','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm84.toMap());

    SafetyIndexModel sm85 = SafetyIndexModel('Kamla Market','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm85.toMap());

    SafetyIndexModel sm86 = SafetyIndexModel('Kamla Nagar','0.0115405751969225','Green');

    await db.insert(Table_Safe, sm86.toMap());

    SafetyIndexModel sm87 = SafetyIndexModel('Kapashera','0.0109910239970691','Green');

    await db.insert(Table_Safe, sm87.toMap());

    SafetyIndexModel sm88 = SafetyIndexModel('Karawal Nagar','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm88.toMap());

    SafetyIndexModel sm89 = SafetyIndexModel('Karol Bagh','0.575929657446419','Yellow');

    await db.insert(Table_Safe, sm89.toMap());

    SafetyIndexModel sm90 = SafetyIndexModel('Kashmere Gate','0.0401172375893021','Green');

    await db.insert(Table_Safe, sm90.toMap());

    SafetyIndexModel sm91 = SafetyIndexModel('Katwaria Sarai','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm91.toMap());

    SafetyIndexModel sm92 = SafetyIndexModel('Khan Market','0.0082432679978018','Green');

    await db.insert(Table_Safe, sm92.toMap());

    SafetyIndexModel sm93 = SafetyIndexModel('Khanpur','0.011723758930207','Green');

    await db.insert(Table_Safe, sm93.toMap());

    SafetyIndexModel sm94 = SafetyIndexModel('Khayala','0.00183183733284484','Green');

    await db.insert(Table_Safe, sm94.toMap());

    SafetyIndexModel sm95 = SafetyIndexModel('Kirti Nagar','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm95.toMap());

    SafetyIndexModel sm96 = SafetyIndexModel('Krishna Nagar','0.017402454662026','Green');

    await db.insert(Table_Safe, sm96.toMap());

    SafetyIndexModel sm97 = SafetyIndexModel('Lado Sarai','0.0390181351895952','Green');

    await db.insert(Table_Safe, sm97.toMap());

    SafetyIndexModel sm98 = SafetyIndexModel('Lajpat Nagar','0.0677779813152592','Green');

    await db.insert(Table_Safe, sm98.toMap());

    SafetyIndexModel sm99 = SafetyIndexModel('Lal Kuan','0.110093423703975','Green');

    await db.insert(Table_Safe, sm99.toMap());

    SafetyIndexModel sm100 = SafetyIndexModel('Laxmi Bai Nagar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm100.toMap());

    SafetyIndexModel sm101 = SafetyIndexModel('Laxmi Nagar','0.0366367466568969','Green');

    await db.insert(Table_Safe, sm101.toMap());

    SafetyIndexModel sm102 = SafetyIndexModel('Lodhi Road','0.0153874335958967','Green');

    await db.insert(Table_Safe, sm102.toMap());

    SafetyIndexModel sm103 = SafetyIndexModel('Madangir','0.0318739695915003','Green');

    await db.insert(Table_Safe, sm103.toMap());

    SafetyIndexModel sm104 = SafetyIndexModel('Madanpur Khadar','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm104.toMap());

    SafetyIndexModel sm105 = SafetyIndexModel('Mahipalpur','0.00293093973255175','Green');

    await db.insert(Table_Safe, sm105.toMap());

    SafetyIndexModel sm106 = SafetyIndexModel('Majnu Ka Tilla','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm106.toMap());

    SafetyIndexModel sm107 = SafetyIndexModel('Malka Ganj','0.0201502106612933','Green');

    await db.insert(Table_Safe, sm107.toMap());

    SafetyIndexModel sm108 = SafetyIndexModel('Malviya Nagar','0.0459791170544056','Green');

    await db.insert(Table_Safe, sm108.toMap());

    SafetyIndexModel sm109 = SafetyIndexModel('Mandi House','0.011357391463638','Green');

    await db.insert(Table_Safe, sm109.toMap());



    SafetyIndexModel sm110 = SafetyIndexModel('Manglapuri','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm110.toMap());

    SafetyIndexModel sm111 = SafetyIndexModel('Mangolpuri','0.018135189595164','Green');

    await db.insert(Table_Safe, sm111.toMap());

    SafetyIndexModel sm112 = SafetyIndexModel('Maurice Nagar','0.000549551199853453','Green');

    await db.insert(Table_Safe, sm112.toMap());

    SafetyIndexModel sm113 = SafetyIndexModel('Mayur Vihar','0.0512914453196556','Green');

    await db.insert(Table_Safe, sm113.toMap());

    SafetyIndexModel sm114 = SafetyIndexModel('Meena Bazaar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm114.toMap());

    SafetyIndexModel sm115 = SafetyIndexModel('Mehrauli','0.0172192709287415','Green');

    await db.insert(Table_Safe, sm115.toMap());

    SafetyIndexModel sm116 = SafetyIndexModel('Mirpur Turk','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm116.toMap());

    SafetyIndexModel sm117 = SafetyIndexModel('Mithapur','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm117.toMap());

    SafetyIndexModel sm118 = SafetyIndexModel('Model Town','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm118.toMap());

    SafetyIndexModel sm119 = SafetyIndexModel('Mori Gate','0.00366367466568969','Green');

    await db.insert(Table_Safe, sm119.toMap());

    SafetyIndexModel sm120 = SafetyIndexModel('Moti Bagh','0.0144715149294743','Green');

    await db.insert(Table_Safe, sm120.toMap());

    SafetyIndexModel sm121 = SafetyIndexModel('Mukherjee Nagar','0.0397508701227331','Green');

    await db.insert(Table_Safe, sm121.toMap());

    SafetyIndexModel sm122 = SafetyIndexModel('Mundka','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm122.toMap());

    SafetyIndexModel sm123 = SafetyIndexModel('Munirka','0.0694266349148196','Green');

    await db.insert(Table_Safe, sm123.toMap());

    SafetyIndexModel sm124 = SafetyIndexModel('Najafgarh','0.034804909324052','Green');

    await db.insert(Table_Safe, sm124.toMap());

    SafetyIndexModel sm125 = SafetyIndexModel('Nangloi','0.0119069426634915','Green');

    await db.insert(Table_Safe, sm125.toMap());

    SafetyIndexModel sm126 = SafetyIndexModel('Naraina','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm126.toMap());

    SafetyIndexModel sm127 = SafetyIndexModel('Nawada','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm127.toMap());

    SafetyIndexModel sm128 = SafetyIndexModel('Nehru Place','0.0163033522623191','Green');

    await db.insert(Table_Safe, sm128.toMap());

    SafetyIndexModel sm129 = SafetyIndexModel('Netaji Nagar','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm129.toMap());

    SafetyIndexModel sm130 = SafetyIndexModel('New Aruna Nagar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm130.toMap());

    SafetyIndexModel sm131 = SafetyIndexModel('New Delhi Railway Station','0.0208829455944312','Green');

    await db.insert(Table_Safe, sm131.toMap());

    SafetyIndexModel sm132 = SafetyIndexModel('New Friends Colony','0.0190511082615864','Green');

    await db.insert(Table_Safe, sm132.toMap());

    SafetyIndexModel sm133 = SafetyIndexModel('Nilothi','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm133.toMap());

    SafetyIndexModel sm134 = SafetyIndexModel('Nirman Vihar','0.00274775599926727','Green');

    await db.insert(Table_Safe, sm134.toMap());

    SafetyIndexModel sm135 = SafetyIndexModel('North Campus','0.0545887525187763','Green');

    await db.insert(Table_Safe, sm135.toMap());

    SafetyIndexModel sm136 = SafetyIndexModel('Okhla','0.156988459424803','Green');

    await db.insert(Table_Safe, sm136.toMap());

    SafetyIndexModel sm137 = SafetyIndexModel('Old Delhi Railway Station','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm137.toMap());

    SafetyIndexModel sm138 = SafetyIndexModel('Paharganj','0.566037735849057','Yellow');

    await db.insert(Table_Safe, sm138.toMap());

    SafetyIndexModel sm139 = SafetyIndexModel('Palam','0.0155706173291812','Green');

    await db.insert(Table_Safe, sm139.toMap());

    SafetyIndexModel sm140 = SafetyIndexModel('Panchsheel Park','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm140.toMap());

    SafetyIndexModel sm141 = SafetyIndexModel('Pandav Nagar','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm141.toMap());

    SafetyIndexModel sm142 = SafetyIndexModel('Paschim Vihar','0.0338889906576296','Green');

    await db.insert(Table_Safe, sm142.toMap());

    SafetyIndexModel sm143 = SafetyIndexModel('Patel Chowk','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm143.toMap());

    SafetyIndexModel sm144 = SafetyIndexModel('Patel Nagar','0.00989192159736216','Green');

    await db.insert(Table_Safe, sm144.toMap());

    SafetyIndexModel sm145 = SafetyIndexModel('Patparganj','0.00659461439824144','Green');

    await db.insert(Table_Safe, sm145.toMap());

    SafetyIndexModel sm146 = SafetyIndexModel('Pitampura','0.433046345484521','Yellow');

    await db.insert(Table_Safe, sm146.toMap());

    SafetyIndexModel sm147 = SafetyIndexModel('Pragati Maidan','0.0208829455944312','Green');

    await db.insert(Table_Safe, sm147.toMap());

    SafetyIndexModel sm148 = SafetyIndexModel('Pragati Vihar','0.0128228613299139','Green');

    await db.insert(Table_Safe, sm148.toMap());

    SafetyIndexModel sm149 = SafetyIndexModel('Preet Vihar','0.0144715149294743','Green');

    await db.insert(Table_Safe, sm149.toMap());

    SafetyIndexModel sm150 = SafetyIndexModel('Prem Nagar','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm150.toMap());

    SafetyIndexModel sm151 = SafetyIndexModel('Purana Quila','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm151.toMap());

    SafetyIndexModel sm152 = SafetyIndexModel('Pushp Vihar','0.00806008426451731','Green');

    await db.insert(Table_Safe, sm152.toMap());

    SafetyIndexModel sm153 = SafetyIndexModel('Pushpa Bhavan','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm153.toMap());

    SafetyIndexModel sm154 = SafetyIndexModel('RK Puram','0.018135189595164','Green');

    await db.insert(Table_Safe, sm154.toMap());

    SafetyIndexModel sm155 = SafetyIndexModel('Rabindra Nagar','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm155.toMap());

    SafetyIndexModel sm156 = SafetyIndexModel('Race Course','0.00714416559809489','Green');

    await db.insert(Table_Safe, sm156.toMap());

    SafetyIndexModel sm157 = SafetyIndexModel('Raj Ghat','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm157.toMap());

    SafetyIndexModel sm158 = SafetyIndexModel('Rajinder Nagar','0.00567869573181902','Green');

    await db.insert(Table_Safe, sm158.toMap());

    SafetyIndexModel sm159 = SafetyIndexModel('Rajiv Chowk','0.00622824693167247','Green');

    await db.insert(Table_Safe, sm159.toMap());

    SafetyIndexModel sm160 = SafetyIndexModel('Rajokri','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm160.toMap());

    SafetyIndexModel sm161 = SafetyIndexModel('Rajouri Garden','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm161.toMap());

    SafetyIndexModel sm162 = SafetyIndexModel('Rangpuri','0.00897600293093973','Green');

    await db.insert(Table_Safe, sm162.toMap());

    SafetyIndexModel sm163 = SafetyIndexModel('Red Fort','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm163.toMap());

    SafetyIndexModel sm164 = SafetyIndexModel('Ridge Area','0.00183183733284484','Green');

    await db.insert(Table_Safe, sm164.toMap());

    SafetyIndexModel sm165 = SafetyIndexModel('Rithala','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm165.toMap());
    SafetyIndexModel sm167 = SafetyIndexModel('Rohini','0.0496427917200953','Green');

    await db.insert(Table_Safe, sm167.toMap());

    SafetyIndexModel sm168 = SafetyIndexModel('Roop Nagar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm168.toMap());

    SafetyIndexModel sm169 = SafetyIndexModel('Sadar Bazaar','0.00714416559809489','Green');

    await db.insert(Table_Safe, sm169.toMap());

    SafetyIndexModel sm170 = SafetyIndexModel('Safdarjung Enclave','0.0135555962630518','Green');

    await db.insert(Table_Safe, sm170.toMap());

    SafetyIndexModel sm171 = SafetyIndexModel('Sagarpur','0.00714416559809489','Green');

    await db.insert(Table_Safe, sm171.toMap());

    SafetyIndexModel sm172 = SafetyIndexModel('Saidabad','0.00439640959882762','Green');

    await db.insert(Table_Safe, sm172.toMap());

    SafetyIndexModel sm173 = SafetyIndexModel('Sainik Farm','0.00989192159736216','Green');

    await db.insert(Table_Safe, sm173.toMap());

    SafetyIndexModel sm174 = SafetyIndexModel('Saket','0.0567869573181901','Green');

    await db.insert(Table_Safe, sm174.toMap());

    SafetyIndexModel sm175 = SafetyIndexModel('Samalka','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm175.toMap());

    SafetyIndexModel sm176 = SafetyIndexModel('Sangam Vihar','0.0058618794651035','Green');

    await db.insert(Table_Safe, sm176.toMap());

    SafetyIndexModel sm177 = SafetyIndexModel('Sarai Kale Khan','0.00439640959882762','Green');

    await db.insert(Table_Safe, sm177.toMap());

    SafetyIndexModel sm178 = SafetyIndexModel('Sarita Vihar','0.00531232826525005','Green');

    await db.insert(Table_Safe, sm178.toMap());

    SafetyIndexModel sm179 = SafetyIndexModel('Sarojini Nagar','0.0439640959882762','Green');

    await db.insert(Table_Safe, sm179.toMap());

    SafetyIndexModel sm180 = SafetyIndexModel('Sarup Nagar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm180.toMap());

    SafetyIndexModel sm181 = SafetyIndexModel('Sarvapriya Vihar','0.00439640959882762','Green');

    await db.insert(Table_Safe, sm181.toMap());

    SafetyIndexModel sm182 = SafetyIndexModel('Satya Niketan','0.00274775599926727','Green');

    await db.insert(Table_Safe, sm182.toMap());

    SafetyIndexModel sm183 = SafetyIndexModel('Savitri Nagar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm183.toMap());

    SafetyIndexModel sm184 = SafetyIndexModel('Seelampur','0.0128228613299139','Green');

    await db.insert(Table_Safe, sm184.toMap());

    SafetyIndexModel sm185 = SafetyIndexModel('Seemapuri','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm185.toMap());

    SafetyIndexModel sm186 = SafetyIndexModel('Shadipur','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm186.toMap());

    SafetyIndexModel sm187 = SafetyIndexModel('Shahabad Mohammadpur','0.00732734933137937','Green');

    await db.insert(Table_Safe, sm187.toMap());

    SafetyIndexModel sm188 = SafetyIndexModel('Shahdara','0.0494596079868108','Green');

    await db.insert(Table_Safe, sm188.toMap());

    SafetyIndexModel sm189 = SafetyIndexModel('Shakarpur','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm189.toMap());

    SafetyIndexModel sm190 = SafetyIndexModel('Shakurpur','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm190.toMap());

    SafetyIndexModel sm191 = SafetyIndexModel('Shalimar Bagh','0.00897600293093973','Green');

    await db.insert(Table_Safe, sm191.toMap());

    SafetyIndexModel sm192 = SafetyIndexModel('Shankar Vihar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm192.toMap());

    SafetyIndexModel sm193 = SafetyIndexModel('Shastri Nagar','0.00439640959882762','Green');

    await db.insert(Table_Safe, sm193.toMap());

    SafetyIndexModel sm194 = SafetyIndexModel('Shastri Park','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm194.toMap());

    SafetyIndexModel sm195 = SafetyIndexModel('Sheikh Sarai','0.0401172375893021','Green');

    await db.insert(Table_Safe, sm195.toMap());

    SafetyIndexModel sm196 = SafetyIndexModel('Sidhartha Nagar','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm196.toMap());

    SafetyIndexModel sm197 = SafetyIndexModel('Siri Fort','0.0100751053306466','Green');

    await db.insert(Table_Safe, sm197.toMap());

    SafetyIndexModel sm198 = SafetyIndexModel('Sita Ram Bazar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm198.toMap());

    SafetyIndexModel sm199 = SafetyIndexModel('South Campus','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm199.toMap());

    SafetyIndexModel sm200 = SafetyIndexModel('South Extension','0.0210661293277157','Green');

    await db.insert(Table_Safe, sm200.toMap());

    SafetyIndexModel sm201 = SafetyIndexModel('Sri Niwaspuri','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm201.toMap());

    SafetyIndexModel sm202 = SafetyIndexModel('Subhash Nagar','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm202.toMap());

    SafetyIndexModel sm203 = SafetyIndexModel('Subzi Mandi','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm203.toMap());

    SafetyIndexModel sm204 = SafetyIndexModel('Sultanpuri','0.00549551199853453','Green');

    await db.insert(Table_Safe, sm204.toMap());

    SafetyIndexModel sm205 = SafetyIndexModel('Swasthya Vihar','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm205.toMap());

    SafetyIndexModel sm206 = SafetyIndexModel('Teen Murti Marg','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm206.toMap());

    SafetyIndexModel sm207 = SafetyIndexModel('Tilak Nagar','0.0217988642608536','Green');

    await db.insert(Table_Safe, sm207.toMap());

    SafetyIndexModel sm208 = SafetyIndexModel('Timarpur','0.0137387799963363','Green');

    await db.insert(Table_Safe, sm208.toMap());

    SafetyIndexModel sm209 = SafetyIndexModel('Tis Hazari','0.00439640959882762','Green');

    await db.insert(Table_Safe, sm209.toMap());

    SafetyIndexModel sm210 = SafetyIndexModel('Tri Nagar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm210.toMap());

    SafetyIndexModel sm211 = SafetyIndexModel('Trilokpuri','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm211.toMap());

    SafetyIndexModel sm212 = SafetyIndexModel('Tughlakabad','0.00622824693167247','Green');

    await db.insert(Table_Safe, sm212.toMap());

    SafetyIndexModel sm213 = SafetyIndexModel('University Enclave','0.0840813335775783','Green');

    await db.insert(Table_Safe, sm213.toMap());

    SafetyIndexModel sm214 = SafetyIndexModel('Uttam Nagar','0.385052207363986','Yellow');

    await db.insert(Table_Safe, sm214.toMap());

    SafetyIndexModel sm215 = SafetyIndexModel('Vasant Kunj','0.00622824693167247','Green');

    await db.insert(Table_Safe, sm215.toMap());

    SafetyIndexModel sm216 = SafetyIndexModel('Vasant Vihar','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm216.toMap());

    SafetyIndexModel sm217 = SafetyIndexModel('Vasundhara Enclave','0.00164865359956036','Green');

    await db.insert(Table_Safe, sm217.toMap());

    SafetyIndexModel sm218 = SafetyIndexModel('Vijay Nagar','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm218.toMap());

    SafetyIndexModel sm219 = SafetyIndexModel('Vikas Nagar','0.0163033522623191','Green');

    await db.insert(Table_Safe, sm219.toMap());

    SafetyIndexModel sm220 = SafetyIndexModel('Vikaspuri','0.0456127495878366','Green');

    await db.insert(Table_Safe, sm220.toMap());

    SafetyIndexModel sm221 = SafetyIndexModel('Vikram Nagar','0.00256457226598278','Green');

    await db.insert(Table_Safe, sm221.toMap());

    SafetyIndexModel sm222 = SafetyIndexModel('Vinod Nagar','0.00549551199853453','Green');

    await db.insert(Table_Safe, sm222.toMap());

    SafetyIndexModel sm223 = SafetyIndexModel('Vishwavidyalaya','0.012090126396776','Green');

    await db.insert(Table_Safe, sm223.toMap());

    SafetyIndexModel sm224 = SafetyIndexModel('Wazirabad','0.00622824693167247','Green');

    await db.insert(Table_Safe, sm224.toMap());

    SafetyIndexModel sm225 = SafetyIndexModel('Yamuna Bank','0.00989192159736216','Green');

    await db.insert(Table_Safe, sm225.toMap());

    SafetyIndexModel sm226 = SafetyIndexModel('Yamuna Vihar','0.0034804909324052','Green');

    await db.insert(Table_Safe, sm226.toMap());

    SafetyIndexModel sm227 = SafetyIndexModel('Yusuf Sarai','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm227.toMap());

    SafetyIndexModel sm228 = SafetyIndexModel('Zamrudpur','0.000732734933137937','Green');

    await db.insert(Table_Safe, sm228.toMap());

   await db.execute("CREATE TABLE $Table_CrimeData ("
        " $C_Delhi_Area TEXT , "
       " $C_Safety_index String , "
       " $C_Safety_index_code TEXT , "
       " $C_Safety_index_code_val String , "
       " $C_count String , "
       " $C_Chain_Snatching String , "
       " $C_Petty_Robbery String , "
       " $C_Taking_pictures_without_permission String , "
       " $C_Sexual_Invites String , "
       " $C_Catcalls_Whistles String , "
       " $C_Commenting String , "
       " $C_Ogling_Lewd_Facial_Expressions_Staring String , "
       " $C_Touching_Groping String , "
       " $C_Others String , "
       " $C_Stalking String , "
       " $C_Poor_No_Street_Lighting String , "
       " $C_Indecent_exposure String , "
       " $C_Indecent_Exposure_Masturbation_in_public String , "
       " $C_Rape_Sexual_Assault String , "
       " $C_North_East_India_Report String , "
       " $C_Human_Trafficking String , "
       " $C_Online_Harassment String , "
       " $C_Quarter1 String , "
       " $C_Quarter2 String , "
       " $C_Quarter3 String , "
       " $C_Quarter4 String , "
       " PRIMARY KEY ($C_Delhi_Area)"
       ")");



    /*delhiCrimeModel dc1 = delhiCrimeModel('Adarsh Nagar',0.18082264957265,'Green',2,4,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0);
    await db.insert(Table_CrimeData, dc1.toMap());

    delhiCrimeModel dc2=delhiCrimeModel('Adchini',0.0285714285714286,'Green',2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0);
    await db.insert(Table_CrimeData, dc2.toMap());

    delhiCrimeModel dc3= delhiCrimeModel('AIIMS',0.0657108461837568,'Green',2,11,0,0,0,0,5,2,1,3,0,0,0,0,0,0,0,0,0,1,3,5,2);
    await db.insert(Table_CrimeData, dc3.toMap());

    delhiCrimeModel dc4= delhiCrimeModel('Ajmeri Gate',0.128638743437356,'Green',2,14,0,0,1,0,5,4,0,2,2,0,0,0,0,0,0,0,0,0,3,9,2);
    await db.insert(Table_CrimeData, dc4.toMap());

    delhiCrimeModel dc5= delhiCrimeModel('Akbar Road',0.00409836065573771,'Green',2,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0);
    await db.insert(Table_CrimeData, dc5.toMap());

    delhiCrimeModel dc6= delhiCrimeModel('Alaknanda',0.026452443354648,'Green',2,6,0,0,0,0,1,3,2,0,0,0,0,0,0,0,0,0,0,2,3,1,0);
    await db.insert(Table_CrimeData, dc6.toMap());

    delhiCrimeModel dc7= delhiCrimeModel('Alipur',0.111283538159598,'Green',2,10,1,0,0,0,4,2,1,0,0,2,0,0,0,0,0,0,0,0,4,2,4);
    await db.insert(Table_CrimeData, dc7.toMap());

    delhiCrimeModel dc8= delhiCrimeModel('Anand Parbat',0.00757575757575758,'Green',2,2,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,1,1);
    await db.insert(Table_CrimeData, dc8.toMap());

    delhiCrimeModel dc9= delhiCrimeModel('Anand Vihar',0.121468434177071,'Green',2,20,0,0,0,0,4,6,5,3,0,0,2,0,0,0,0,0,0,4,4,11,1);
    await db.insert(Table_CrimeData, dc9.toMap());

    delhiCrimeModel dc10= delhiCrimeModel('Andrews Ganj',0.0185662039110315,'Green',2,4,0,0,0,0,0,3,1,0,0,0,0,0,0,0,0,0,0,0,1,1,2);
    await db.insert(Table_CrimeData, dc10.toMap());

    delhiCrimeModel dc11= delhiCrimeModel('Ashok Nagar',0.0350032089834535,'Green',2,5,0,0,0,0,1,2,0,2,0,0,0,0,0,0,0,0,0,1,0,3,1);
    await db.insert(Table_CrimeData, dc11.toMap());

    delhiCrimeModel dc12= delhiCrimeModel('Ashok Vihar',0.0558612858782446,'Green',2,8,0,0,0,0,3,3,1,0,0,1,0,0,0,0,0,0,0,1,3,4,0);
    await db.insert(Table_CrimeData, dc12.toMap());

    delhiCrimeModel dc13= delhiCrimeModel('Aya Nagar',0.0299261083743842,'Green',2,3,0,0,0,0,0,1,0,0,0,0,2,0,0,0,0,0,0,0,1,2,0);
    await db.insert(Table_CrimeData, dc13.toMap());

    delhiCrimeModel dc14= delhiCrimeModel('Ayurvigyan Nagar',0.133333333333333,'Green',2,2,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0);
    await db.insert(Table_CrimeData, dc14.toMap());

    delhiCrimeModel dc15= delhiCrimeModel('Kashmere Gate',0.507260525647263,'Yellow',1,39,1,0,3,2,6,10,5,6,5,0,0,1,0,0,0,0,0,9,7,14,9);
    await db.insert(Table_CrimeData, dc15.toMap());

    delhiCrimeModel dc16= delhiCrimeModel('Karol Bagh',5.85508547827153,'Red',0,545,21,0,11,15,133,191,41,71,26,13,4,10,8,1,0,0,0,76,140,260,69);
    await db.insert(Table_CrimeData, dc16.toMap());
*/
 }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient!.insert(Table_User, user.toMap());
    return res;
  }

  Future<UserModel?> getLoginUser(String user_name, String password) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserName = '$user_name' AND "
        "$C_Password = '$password'");

    if (res.length > 0) {
      return UserModel.fromMap(res.first);
    }
    return null;

  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient!.update(Table_User, user.toMap(),
        where: '$C_UserName = ?', whereArgs: [user.user_name]);
    return res;
  }

  Future<int> deleteUser(String user_name) async {
    var dbClient = await db;
    var res = await dbClient!
        .delete(Table_User, where: '$C_UserName = ?', whereArgs: [user_name]);
    return res;
  }

  Future<int> saveAreaData(SafetyIndexModel safetyIndex) async {
    var dbClient = await db;
    var res = await dbClient!.insert(Table_User, safetyIndex.toMap());
    return res;
  }

  Future<SafetyIndexModel?> getCategory(String area) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_Safe WHERE "
        "$C_Area = '$area' ");
    print("-----------DATA $res-------------------");
    return SafetyIndexModel.fromMap(res.first);


  }


  Future<int> updateArea(SafetyIndexModel safetyIndexModel) async {
    var dbClient = await db;
    var res = await dbClient!.update(Table_User, safetyIndexModel.toMap(),
        where: '$C_Area = ?', whereArgs: [safetyIndexModel.area]);
    return res;
  }

  Future<int> deleteAreaData(String area) async {
    var dbClient = await db;
    var res = await dbClient!
        .delete(Table_User, where: '$C_Area = ?', whereArgs: [area]);
    return res;
  }
}
