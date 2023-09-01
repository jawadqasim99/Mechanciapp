// import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:mechanci/dashbord.dart';
// import 'package:mechanci/dashbord.dart';
import 'package:mechanci/platte.dart';
import 'package:mechanci/screens/button.dart/login_field.dart';
import 'package:mechanci/screens/button.dart/signbutton.dart';
import 'package:uuid/uuid.dart';
// import 'package:flutter_images_picker/flutter_images_picker.dart';

class SaveForm extends StatefulWidget {
  const SaveForm({super.key});

  @override
  State<SaveForm> createState() => SaveFormState();
}

class SaveFormState extends State<SaveForm> {
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController phoneNo = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController degree = TextEditingController();
  File? pickerImage;
  void saveData() async {
    String firstNametext = firstName.text.trim();
    String secindNametext = secondName.text.trim();
    String phoneCell = phoneNo.text.trim();
    String emailText = email.text.trim();
    String degreeText = degree.text.trim();
    String agetext = age.text.trim();
    if (firstNametext == '' ||
        secindNametext == '' ||
        phoneCell == '' ||
        emailText == '' ||
        degreeText == '' ||
        agetext == '' ||
        pickerImage == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              titlePadding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 70),
              backgroundColor: Platte.gradient2,
              title: const Text("Please Fill First"),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 223, 132, 248)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Platte.whiteColor, fontSize: 17),
                  ),
                )
              ],
            );
          });
    } else {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref('Image Folder')
          .child('Mechanci Folder')
          .child(const Uuid().v1())
          .putFile(pickerImage!);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      Map<String, dynamic> addUser = {
        'First name': firstNametext,
        'Second name': secindNametext,
        'Email': emailText,
        'Phone No': phoneCell,
        'Age': agetext,
        'Degree': degreeText,
        'Url': downloadUrl
      };
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('usersData').add(addUser).then((value) => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              titlePadding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 70),
              backgroundColor: Platte.gradient2,
              title: const Text("Successfully Upload"),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 223, 132, 248)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Platte.whiteColor, fontSize: 17),
                  ),
                )
              ],
            );
          }).catchError((error) => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              titlePadding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 70),
              backgroundColor: Platte.gradient2,
              title: const Text("Please Fill First"),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 223, 132, 248)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Platte.whiteColor, fontSize: 17),
                  ),
                )
              ],
            );
          })));
      firstName.clear();
      secondName.clear();
      phoneNo.clear();
      email.clear();
      age.clear();
      degree.clear();
      pickerImage = null;
      // ignore: use_build_context_synchronously
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const MyHome()));
    }
  }

  void imagePicker() async {
    XFile? selectImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectImage != null) {
      File convertFile = File(selectImage.path);
      setState(() {
        pickerImage = convertFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 30,
        backgroundColor: Platte.gradient2,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Image.asset('assets/images/bal.png'),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  imagePicker();
                },
                child: CircleAvatar(
                  backgroundColor: Platte.borderColor,
                  backgroundImage:
                      (pickerImage != null) ? FileImage(pickerImage!) : null,
                  radius: 60,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              LoginField(
                hintText: 'First Name',
                controlar: firstName,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginField(
                hintText: 'Second Name',
                controlar: secondName,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginField(
                hintText: 'Phone no',
                controlar: phoneNo,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginField(
                hintText: 'Email',
                controlar: email,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginField(
                hintText: 'Age',
                controlar: age,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginField(
                hintText: 'Degree',
                controlar: degree,
              ),
              const SizedBox(
                height: 30,
              ),
              SignButton(
                lable: 'Save',
                callback: () {
                  saveData();
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => const MyHome())));
                },
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
