import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  late File _image;
  List<dynamic>? _output = [];
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadMode().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadMode() async {
    await Tflite.loadModel(
        model: 'assets/model_cat_dog.tflite',
        labels: 'assets/model_cat_dog.txt');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    detectImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    detectImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Cats and Dogs Detector App',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: _loading
                    ? Container(
                        width: 250,
                        child: Column(children: [
                          Image.asset('assets/cat_dog_icon.png'),
                          SizedBox(
                            height: 10,
                          )
                        ]),
                      )
                    : Container(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: MediaQuery.of(context).size.width - 250,
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Capture a Photo',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width - 250,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Select a Photo',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
