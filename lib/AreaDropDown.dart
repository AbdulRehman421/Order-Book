import 'package:Order_Book/partiesDropDown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(OrderBookDropDown());
}

class OrderBookDropDown extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Order Book'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedCity="ABDUL HAKIM";
  var City={'ABDUL HAKIM':'AH','COUNTER':'C','GARAH MORE':'GM','JAHANIA':'JH','KABIRWALA':'KW','KACHA KHOH':'KK','KHANEWAL-1':'K1','KHANEWAL-2':'K2','MAILSI':'M','MIAN CHUNNU':'MC','PUL 12 MEEL':'P12M','VEHARI':'VH'};

  List _countries=[];
  CityDependentDropDown(){
    City.forEach((key, value) {
      _countries.add(key);
    });
  }

  String _selectedState="";
  var state={'Abdul Hakim':'AH','COUNTER':'C','Garah More':'GM','Jahania':'JH','Jahania-2':'JH','Kabir Wala-1':'KW','Kabir Wala-2':'KW','KACHA KHOH':'KK','KHANEWAL-1A':'K1','KHANEWAL-1B':'K1','KHANEWAL-1C':'K1','KHANEWAL-2A':'K2','KHANEWAL-2B':'K2','KHANEWAL-2C':'K2','MAILSI':'M','MIAN CHUNNU':'MC','PUL 12 MEEL':'P12M','VEHARI':'VH'};

  List _states=[];
  StateDependentDropDown(CityShortName){
    state.forEach((key, value) {
      if(CityShortName==value){
        _states.add(key);
      }

    });
    _selectedState= _states[0];
  }

  String _selectedArea="";
  var area={'Abdul Hakim':'Abdul Hakim','MAKH-PUR':'Abdul Hakim','TULAMBA':'Abdul Hakim','KHALIQ ABAD':'Abdul Hakim','GUL ABAD':'Abdul Hakim','HANOMAN GARH':'Abdul Hakim',
    'COUNTER':'COUNTER',
    'GarahMore':'Garah More','KACHA KHOH':'Garah More','PEROWAL':'Garah More','KACHI PAKKI':'Garah More','NAWAN CHOWK':'Garah More','75 ADDA':'Garah More','CHOWK JAMAL':'Garah More','VIJAYAN WALI':'Garah More','CHAB CHOWKI':'Garah More','PUL MUSAFIR':'Garah More','27 ADDA':'Garah More',
    'JAHANIA':'Jahania','T-SULTAN-PR':'Jahania','DOKOTA':'Jahania','MAILSI':'Jahania','QUTUB PUR':'Jahania',
    'CH-MAITLA':'Jahania-2','THATTA':'Jahania-2','MAKH-RASHID':'Jahania-2','PULL-14':'Jahania-2','BODHLA SANT':'Jahania-2','TATAY PUR':'Jahania-2','MEHER SHAH':'Jahania-2','JUNGLE MARYALA':'Jahania-2',
    'kUKAR HATAH':'Kabir Wala-1','KabirWala':'Kabir Wala-1','PULL 12 - MEEL':'Kabir Wala-1','KOT ISLAM':'Kabir Wala-1','8 KASSI':'Kabir Wala-1','JODH PUR':'Kabir Wala-1',
    'Kabir Wala' : 'Kabir Wala-2',
    'kACHA KHOH':'KACHA KHOH',
    'KHANEWAL':'KHANEWAL-1A',
    'KHANEWAL':'KHANEWAL-1B',
    'KHANEWAL':'KHANEWAL-1C',
    'KHANEWAL':'KHANEWAL-2A',
    'KHANEWAL':'KHANEWAL-2B',
    'KHANEWAL':'KHANEWAL-2C',
    'MAILSI':'MAILSI',
    'MIAN CHUNNU':'MIAN CHUNNU',
    'PUL 12 MEEL':'PUL 12 MEEL',
    'VEHARI':'VEHARI',

  };

  List _cities=[];
  AreaDependentDropDown(stateShortName){
    area.forEach((key, value) {
      if(stateShortName==value){
        _cities.add(key);
      }

    });
    _selectedArea= _cities[0];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CityDependentDropDown();
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Book'),
      ),
      body: Container(
        margin:EdgeInsets.all(15),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Select Your Area',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 18),
            Align(
              alignment: Alignment.centerLeft,
              child:
              Text("City",  style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
            ),
            Container(
              width: 400,
              child: DropdownButton(
                value: _selectedCity,
                onChanged: (newValue){
                  setState(() {
                    _cities=[];
                    _states=[];
                    StateDependentDropDown(City[newValue]);
                    _selectedCity="$newValue";
                  });

                },
                items:_countries.map((City){
                  return DropdownMenuItem(
                    child: new Text(City),
                    value:City,
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 23,),

            Align(
                alignment: Alignment.centerLeft,
                child:Text("Sector", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)
            ),
            Container(
              width: 400,
              child: DropdownButton(
                value: _selectedState,
                onChanged: (newValue){
                  print(newValue);
                  setState(() {
                    print(newValue);
                    _cities=[];
                    AreaDependentDropDown(newValue);

                    _selectedState="$newValue";
                  });

                },
                items:_states.map((state){
                  return DropdownMenuItem(
                    child: new Text(state),
                    value:state,
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 23,),

            Align(
                alignment: Alignment.centerLeft,
                child:Text("Area", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)
            ),
            Container(
              width: 400,
              child: DropdownButton(
                value: _selectedArea,
                onChanged: (newValue){
                  setState(() {
                    _selectedArea="$newValue";
                  });

                },
                items:_cities.map((area){
                  return DropdownMenuItem(
                    child: new Text(area),
                    value:area,
                  );
                }).toList(),
              ),
            ),
            Text(
              '                         Selected Value:                         \n ${_selectedCity}>${_selectedState}>${_selectedArea}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(style: BorderStyle.solid)))),
                      onPressed: () {

                      }, child: Text('Cancel',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                  ElevatedButton(
                      style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(style: BorderStyle.solid)))),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PartiesDropDown(),));
                  }, child: Text('Book',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                ],
              ),
            )
          ],
        ),

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}