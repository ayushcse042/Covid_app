import 'package:covidify/screens/country/covid_data.dart';
import 'package:covidify/screens/vacination.dart';
import 'package:flutter/material.dart';
import '../theme.dart';
import 'dashboard.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List _screens = [DashBoard(), Vaccination(), CovidData()];
  bool falg = false;
  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covidify'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                //Color(0xffb74093)
                color: Colors.grey,
              ),
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 98,
                      width: 160,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircularProfileAvatar('',
                              child: Icon(Icons.person,
                                  color: Color(0xFFFF2800), size: 72),
                              borderColor: Colors.indigo,
                              borderWidth: 1,
                              elevation: 1,
                              radius: 65, onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  title: const Text('Change Profile Picture'),
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () async =>
                                          await _pickImageFromCamera(),
                                      child: const Text(
                                          'Take picture from Camera'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () async =>
                                          await _pickImageFromGallery(),
                                      child: const Text('Select from Gallery'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }),
                          Positioned(
                            bottom: -10,
                            right: -15,
                            //top:-70,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Color(0xFFF5F6F9),
                              child: Icon(Icons.camera_alt_outlined,
                                  color: Colors.blue, size: 20),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, top: 8.0, bottom: 0.0, right: 0.0),
                      child: Text(
                        'Hello, Omkar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment(-1, 1),
                  child: IconButton(
                    icon: Icon(
                        falg ? Icons.wb_sunny : Icons.wb_incandescent_outlined),
                    onPressed: () {
                      setState(() {
                        falg = !falg;
                        currentTheme.switchTheme();
                      });
                    },
                  ),
                ),
              ]),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Omkar"),
              subtitle: Text("User"),
              //trailing: Icon(Icons.edit),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("abhiomkar7@gmail.com"),
              //trailing: Icon(Icons.edit),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact"),
              subtitle: Text("8292416686"),
              //trailing: Icon(Icons.edit),
              onTap: () {},
            ),
            SizedBox(
              height: 20.0,
              width: 1.0,
              child: Divider(
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "DashBoard",
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(
            label: "Vaccine",
            icon: Icon(Icons.volunteer_activism),
          ),
          BottomNavigationBarItem(
            label: "Covid Data",
            icon: Icon(Icons.coronavirus),
          ),
          // BottomNavigationBarItem(
          //   label: "My Account",
          //   icon: Icon(Icons.account_circle_outlined),
          // ),
        ],
      ),
    );
  }

  Future<Null> _pickImageFromGallery() async {
    final PickedFile imageFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
  }

  Future<Null> _pickImageFromCamera() async {
    // final PickedFile? imageFile =
    // await ImagePicker.getImage(source: ImageSource.camera);
  }
}
