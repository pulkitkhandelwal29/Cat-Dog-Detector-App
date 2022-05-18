import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;

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
                height: 50,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Cats and Dogs Detector App',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: _loading
                    ? Container(
                        width: 350,
                        child: Column(children: [
                          Image.asset('assets/cat_dog_icon.png'),
                          SizedBox(
                            height: 50,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
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
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width - 250,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 18),
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
