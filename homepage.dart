
import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "firebase_options.dart";
import "package:firebase_core/firebase_core.dart";
import "color.dart";
import "package:location/location.dart";
import "settings.dart";
import 'package:geolocator/geolocator.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super (key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget
  State<MyHomePage> createState() => _MyHomePageState();
}






class _MyHomePageState extends State<MyHomePage> {


  



  Future<Position> _determinePosition() async {
  
  
  await Geolocator.requestPermission().then((value){}).onError((error, stackTrace) {print("err");});

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}


  Position? position;
  
  

  void initState(){
    _determinePosition().then((val) {
      position = val;
    });
    print("Position: $position");
    super.initState();


    
  }
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: NavigationBar(
        
        backgroundColor: black,
        
        
        height: MediaQuery.of(context).size.height/10,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: lightgrey,
        indicatorShape: RoundedRectangleBorder(
    
     
    borderRadius: BorderRadius.circular(20.0),
  ),
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected, 
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Bestblue),
            icon: Icon(Icons.home, color: lighttext),
            label: '',
            
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings, color: Bestblue),
            icon: Icon(Icons.settings, color: lighttext),
            label: '',
          ),    
        ],
       
      ),
      body:  <Widget>[(position==null? 
      Center(
          child: TextButton(
            onPressed: () {
              _determinePosition().then((value) {
                setState(() {
                  position = value;
                  print(position.toString());
                });
              });
            },
            child: Text("Konuma erişim gerekiyor"),
          ),
        ):
      GoogleMap(
        initialCameraPosition: 
        CameraPosition(
          target: LatLng(position!.latitude!, position!.longitude!),
        ),

        markers: {
          Marker (
            markerId : const MarkerId("kullanıcı"),
            position: LatLng(position!.latitude!, position!.longitude!),
          ),
        }
      )
    ),SettingsPage() ][currentPageIndex]);
  }

}