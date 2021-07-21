import 'package:flutter/material.dart';
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Stack(
            children:[
              Container(
                width: MediaQuery.of(context).size.width,
                height:150,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(
                      "assets/images/Rectangle.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,right: 50,left: 50),
                child: Container(
                  width: 400,
                  height:180,
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(
                        "assets/images/Rectangle1.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:150,top: 40),
                    child: Stack(
                      children: [
                        Column(

                          children: [
                            Text("Let's get",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Started",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: TextFormField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  ),
            ),
          )
        ]
      ),
    );
  }
}
