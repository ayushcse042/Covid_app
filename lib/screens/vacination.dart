import 'package:covidify/screens/district.dart';
import 'package:covidify/screens/pincode.dart';
import 'package:flutter/material.dart';
import 'package:covidify/utility/bubble_indicator_painter.dart';
class Vaccination extends StatefulWidget {
  @override
  _VaccinationState createState() => _VaccinationState();
}

class _VaccinationState extends State<Vaccination>{
  PageController _pageController;
  Color left = Colors.white;
  Color right = Colors.indigo;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("COVID VACCINE AVAILABILITY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text("Tracker",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 30),
                    child: Container(
                      width: double.infinity,
                      height: 451,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text("Search by Pincode or District",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                                child: Column(
                                    children:[
                                      Container(
                                        width: double.infinity,
                                        height: 400,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20.0),
                                              child: _buildMenuBar(context),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: PageView(
                                                controller: _pageController,
                                                physics: const ClampingScrollPhysics(),
                                                onPageChanged: (int i) {
                                                  FocusScope.of(context).requestFocus(FocusNode());
                                                  if (i == 0) {
                                                    setState(() {
                                                      right =Colors.indigo;
                                                      left = Colors.white;
                                                    });
                                                  } else if (i == 1) {
                                                    setState(() {
                                                      right = Colors.white;
                                                      left = Colors.indigo;
                                                    });
                                                  }
                                                },
                                                children: <Widget>[
                                                  ConstrainedBox(
                                                    constraints: const BoxConstraints.expand(),
                                                    child: Pincode(),
                                                  ),
                                                  ConstrainedBox(
                                                    constraints: const BoxConstraints.expand(),
                                                    child: District(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
        ),
    );
  }
  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 51.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(125, 25, 21, 25, _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'PINCODE',
                  style: TextStyle(
                    color: left,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'DISTRICT',
                  style: TextStyle(
                    color: right,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
 }
