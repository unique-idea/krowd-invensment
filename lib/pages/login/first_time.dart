// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krowd_invesment_footer/pages/home/dashboard.dart';
import 'package:krowd_invesment_footer/pages/login/widgets/user_services.dart';

class FirstTime extends StatefulWidget {
  final Map? userModel;
  const FirstTime({super.key, this.userModel});
  
  @override
  State<FirstTime> createState() => _FirstTimeState();
}

class _FirstTimeState extends State<FirstTime> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  FirstTime instance = const FirstTime();
  @override
  void initState() {
    super.initState();
    final userModel = widget.userModel;
    if (userModel != null) {
      final fullName = userModel['fullName'];
      fullNameController.text = fullName;
      final phone = userModel['phone'];
      phoneController.text = phone;
      final address = userModel['address'];
      addressController.text = address;
      final birthdate = userModel['birthdate'];
      birthdateController.text = birthdate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _title(),
              _personInfo(fullNameController, phoneController,
                  addressController, birthdateController),
            ],
          ),
        ),
      ),
    );
  }

  Container _title() {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 30, 15, 10),
      child: const Text(
        'Enter Your Details',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Column _personInfo(
      TextEditingController fullNameController,
      TextEditingController phoneController,
      TextEditingController addressController,
      TextEditingController birthdateController) {
    double fem = 1;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding:
              EdgeInsets.fromLTRB(15 * fem, 8.51 * fem, 173 * fem, 8.49 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff006ed4)),
            borderRadius: BorderRadius.circular(8 * fem),
          ),
          child: TextField(
            controller: fullNameController,
            decoration: const InputDecoration(
              hintText: "Full name",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding:
              EdgeInsets.fromLTRB(15 * fem, 8.51 * fem, 173 * fem, 8.49 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff006ed4)),
            borderRadius: BorderRadius.circular(8 * fem),
          ),
          child: TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              hintText: "Phone number",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding:
              EdgeInsets.fromLTRB(15 * fem, 8.51 * fem, 173 * fem, 8.49 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff006ed4)),
            borderRadius: BorderRadius.circular(8 * fem),
          ),
          child: TextField(
            controller: addressController,
            decoration: const InputDecoration(
              hintText: "Address",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding:
              EdgeInsets.fromLTRB(15 * fem, 8.51 * fem, 173 * fem, 8.49 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff006ed4)),
            borderRadius: BorderRadius.circular(8 * fem),
          ),
          child: TextField(
            controller: birthdateController,
            decoration: const InputDecoration(
              hintText: "2002-02-02",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 300,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
                image: AssetImage('images/loginbtn.png'), fit: BoxFit.cover),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                submitData();
              },
              child: const Text(
                "Submit",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> submitData() async {

    final isSuccess = await UserService.registerUser(userModel);

    // show success ot fail message based on status
    if (isSuccess) {
      fullNameController.text = '';
      addressController.text = '';
      phoneController.text = '';
      birthdateController.text = '';
      Get.offAll(() => const DashBoard(
            index: 0,
          ));
      showSuccessMessage('Creation success');
    } else {
      showErroMessage(context, message: 'Creation Failed');
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> showErroMessage(BuildContext context,
      {required String message}) async {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Map get userModel {
    final fullName = fullNameController.text;
    final phone = phoneController.text;
    final birthday = birthdateController.text;
    final address = addressController.text;
    return {
      "roleId": "INVESTOR",
      "fullName": fullName,
      "phone": phone,
      "avatar": "string",
      "id_card": "0123456789",
      "gender": "MALE",
      "birthdate": birthday,
      "taxIdentification": "0123456789",
      "address": address,
      "bankName": "string",
      "bankAccount": "string",
      "momo": phone
    };
  }


}
