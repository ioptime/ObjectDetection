import 'package:flutter/material.dart';
import 'package:objectdetectionapp/top_bar.dart';
import 'package:tflite/tflite.dart';
import 'OpenCamera.dart';
import 'package:camera/camera.dart';
import 'dart:math' as math;
import 'bndbox.dart';
import 'camera.dart';
import 'models.dart';

List<CameraDescription> cameras;
Future<Null> setCamera() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
}
/*Future<Null> main() async {

  runApp(new MyApp());
}*/


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  loadModel() async {
    debugPrint('Present in loadModel');
    String res;
    if(_model == ""){debugPrint('Not able to load model because model name is not specified yet');}
    else{
      debugPrint('Present in else');
      switch (_model) {
        case mobilenet:
          res = await Tflite.loadModel(
              model: "assets/models/mobilenet_v1_1.0_224.tflite",
              labels: "assets/models/mobilenet_v1_1.0_224.txt");
          break;
        case ssd:
          res = await Tflite.loadModel(
              model: "assets/models/ssd_mobilenet.tflite",
              labels: "assets/models/ssd_mobilenet.txt");
          break;
      }
    }
    print('Printing res ' + res);
  }

  onSelect(model) {
    debugPrint('Yes Present in onSelect method');

    setState(() {
      _model = model;
    });
    loadModel();
  }
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }


  @override
  Widget build(BuildContext context) {
    debugPrint('***********   _HomeScreenState  build method run   *****************   The value of _model is $_model');
    Size screen = MediaQuery.of(context).size;
    setCamera();
    return Scaffold(
      body: _model ==""
          ? SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MainScreen(),
              SizedBox(height: 18.0,),
              GestureDetector(
                  onTap: (){
                    debugPrint("Present in GestureDetector........");
                    onSelect(ssd);
                    },
                  child: OpenCamera()
              ),
            ],
          ),
        )
          :
     /* Stack(children: <Widget>[
        *//*Text('safdadsfdsf'),*//*
        Camera(
            cameras,
            _model,
            setRecognitions,
          )
        ],
      )*/

      Stack(
        children: [
          Camera(
            cameras,
            _model,
            setRecognitions,
          ),
          BndBox(
              _recognitions == null ? [] : _recognitions,
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              _model
          ),
        ],
      ),
    );
  }
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              TopBar(),
              Positioned(
                top: 60.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    /*IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 35.0,),
                  onPressed: () {},
                ),*/
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text('iOPTIME', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0,  color: Colors.white),),
                          Text('Every Customer Every Day', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),),
                        ],
                      ),
                    ),
                    /*IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white, size: 35.0,),
                  onPressed: () {},
                ),*/
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
        ],
    );
  }
}

