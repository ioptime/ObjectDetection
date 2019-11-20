import 'package:flutter/material.dart';
import 'package:objectdetectionapp/themes/colors.dart';
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';
import 'dart:math' as math;
import 'bndbox.dart';
import 'camera.dart';



/*List<CameraDescription> cameras;

Future<Null> setCamera() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
}*/


class OpenCamera extends StatefulWidget {

  /*final List<CameraDescription> cameras;*/


  /*OpenCamera(this.cameras);*/

  @override
  _OpenCameraState createState() => _OpenCameraState();
}

class _OpenCameraState extends State<OpenCamera> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";
/*
  loadModel() async {
    debugPrint('Present in loadModel');
    String res;
    res = await Tflite.loadModel(
        model: "assets/models/mobilenet_v1_1.0_224.tflite",
        labels: "assets/models/mobilenet_v1_1.0_224.txt"
    );
    print('Printing res ' + res);
  }

  onSelect() {
    debugPrint('Yes Present in onSelect method');
    loadModel();
    setState(() {
      _model = "mobilenet";
    });
  }
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }*/


  @override
  Widget build(BuildContext context) {

    return Center(
      child: OpenCameraButton(),
    );
    /*Center(
      child: _model ==""
      ? GestureDetector(
            onTap: () {
              onSelect();
            },
            child: OpenCameraButton()
        )
          :
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
                  _model),
            ],
          ),
    );*/
  }
}


class OpenCameraButton extends StatefulWidget {
  @override
  _OpenCameraButtonState createState() => _OpenCameraButtonState();
}

class _OpenCameraButtonState extends State<OpenCameraButton> {
  Paint paint = Paint();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          decoration: BoxDecoration(color: paint.color = firstColor.withOpacity(1),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.camera,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'Start Detection',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}/*
class ChoiceFull extends StatefulWidget {
  final IconData icon;
  final String text;
  final isBoolSelected;
  ChoiceFull(this.icon, this.text, this.isBoolSelected);
  @override
  _ChoiceFullState createState() => _ChoiceFullState();
}

class _ChoiceFullState extends State<ChoiceFull> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Present in build method of _ChoiceFullState');
    return GestureDetector(
      onTap: () {
        debugPrint("Go for camera");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              widget.icon,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}*/
