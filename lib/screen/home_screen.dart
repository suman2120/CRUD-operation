import 'package:crud/screen/user_card.dart';
import 'package:crud/screen/user_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSecure = true;
  bool isUpdate = false;
  int indexNo = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  void changeSecure() {
    isSecure = !isSecure;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Student Details'),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
              flex: 3,
              child: Container(
                width: double.maxFinite,
                color: Color.fromARGB(255, 235, 235, 235),
                child: Column(
                  children: [
                    Container(
                        width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: TextField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                      labelText: 'Username',
                                      // hintText: 'Enter username...',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 235, 173, 110),
                                              width: 3)))),
                            ),
                            TextField(
                                controller: _addressController,
                                decoration: InputDecoration(
                                    //  hintText: 'Enter your address...',
                                    labelText: 'Address',
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 235, 173, 110),
                                            width: 3)))),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: TextField(
                                  keyboardType: TextInputType.phone,
                                  controller: _contactController,
                                  obscureText: isSecure,
                                  decoration: InputDecoration(
                                      labelText: 'Contact No.',
                                      //hintText: 'Enter name',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: isSecure == false
                                          ? IconButton(
                                              onPressed: (() {
                                                setState(() {
                                                  changeSecure();
                                                });
                                              }),
                                              icon: Icon(Icons.visibility))
                                          : IconButton(
                                              onPressed: (() {
                                                setState(() {
                                                  changeSecure();
                                                });
                                              }),
                                              icon: Icon(Icons.visibility_off)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 235, 173, 110),
                                              width: 3)))),
                            ),
                          ],
                        )),
                    isUpdate == false
                        ? ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (!_nameController.text.isEmpty &&
                                    !_addressController.text.isEmpty &&
                                    !_contactController.text.isEmpty) {
                                  studentDetails.add({
                                    'Name': _nameController.text,
                                    'Address': _addressController.text,
                                    'Contact': _contactController.text,
                                  });
                                  _nameController.clear();
                                  _addressController.clear();
                                  _contactController.clear();
                                }
                              });
                            },
                            child: Text("Add Student"))
                        : ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (!_nameController.text.isEmpty &&
                                    !_addressController.text.isEmpty &&
                                    !_contactController.text.isEmpty) {
                                  studentDetails[indexNo]['Name'] =
                                      _nameController.text;
                                  studentDetails[indexNo]['Address'] =
                                      _addressController.text;
                                  studentDetails[indexNo]['Contact'] =
                                      _contactController.text;
                                  _nameController.clear();
                                  _addressController.clear();
                                  _contactController.clear();
                                  isUpdate = false;
                                }
                              });
                            },
                            child: Text("Update Student")),
                  ],
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                color: Color.fromARGB(255, 230, 219, 182),
                child: ListView.builder(
                    itemCount: studentDetails.length,
                    itemBuilder: ((context, index) => UserCard(
                          cardNo: index + 1,
                          userName: studentDetails[index]['Name'],
                          userAddress: studentDetails[index]['Address'],
                          userContact: studentDetails[index]['Contact'],
                          onDeleteButton: () {
                            setState(() {
                              studentDetails.removeAt(index);
                            });
                          },
                          onEditButton: () {
                            setState(() {
                              _nameController.text =
                                  studentDetails[index]['Name'];
                              _addressController.text =
                                  studentDetails[index]['Address'];
                              _contactController.text =
                                  studentDetails[index]['Contact'];

                              isUpdate = true;
                              indexNo = index;
                            });
                          },
                        ))),
              )),
        ]));
  }
}
