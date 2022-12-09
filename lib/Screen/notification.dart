import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:surakshaproj/Screen/navDart.dart';
import 'package:fl_chart/fl_chart.dart';


class NotifScreen extends StatefulWidget {
  const NotifScreen({Key? key}) : super(key: key);

  @override
  State<NotifScreen> createState() => _NotifScreen();
}

class _NotifScreen extends State<NotifScreen> {
  int touchedIndex = -1;
  late String valueChoosen1;

  List areaList=[
    'Select Area','AIIMS','Adarsh Nagar', 'Adchini', 'Ajmeri Gate','Akbar Road',
    'Alaknanda',
    'Alipur',
    'Anand Parbat',
    'Anand Vihar',
    'Andrews Ganj',
    'Ashok Nagar',
    'Ashok Vihar',
    'Aya Nagar',
    'Ayurvigyan Nagar',
    'Azadpur',
    'BK Dutt Colony',
    'Badarpur',
    'Bahadur Shah Zafar Marg',
    'Barakhamba',
    'Barwala',
    'Bawana',
    'Begumpur',
    'Ber Sarai',
    'Bhalswa',
    'Bijwasan',
    'Budh Vihar',
    'Central Secretariat',
    'Chanakyapuri',
    'Chandni Chowk',
    'Chawri Bazaar',
    'Chhatarpur',
    'Chirag Dilli',
    'Chittaranjan Park',
    'Civil Lines',

  ];

  @override
  void initState() {
    super.initState();
    valueChoosen1 = "Select Area";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Text('Dashboard'),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => NavBarScreen()))
              },
            )),
        body: Container(
    padding: EdgeInsets.symmetric(horizontal: 30),
    margin: EdgeInsets.only(top:10),
    child: DropdownButton(
    hint: Text('Select Area'),
    isExpanded: true,
    //value: valueChoosen,
    onChanged: (newValue){
    setState(() {
    valueChoosen1 = newValue.toString();
    });
    },
    value: valueChoosen1,
    items: areaList.map((valueItem){
    return DropdownMenuItem(
    value: valueItem,
    child: Text(valueItem));
    },
    ).toList(),
    ),
    ));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
