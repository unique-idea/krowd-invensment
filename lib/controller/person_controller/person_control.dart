import 'package:flutter/material.dart';

import '../../pages/person/services/person_services.dart';

class PersonControl {
  Future<Map<String, dynamic>?> submitDataProfile(
    Map<String, dynamic>? userData,
    String typeSubmit,
    TextEditingController fullName,
    TextEditingController birthDay,
    TextEditingController address,
    TextEditingController gender,
    TextEditingController phone,
    BuildContext context,
  ) async {
    Map<String, dynamic> user = userModel(
        userData, typeSubmit, fullName, birthDay, address, gender, phone);
    Map<String, dynamic>? userDataUpdate;

    final userInUpdate = await PersonServices.updateUser(user);

    if (userInUpdate != null) {
      showSuccessMessage('Update Infor success', context);
      userDataUpdate = user;
      return userDataUpdate;
    } else {
      showErroMessage(context, message: 'Update Failed');
      return null;
    }
  }

  Future<bool> submitDataImage(
    Map<String, dynamic>? userData,
    String imagePath,
    BuildContext context,
  ) async {
    Map<String, dynamic> user = userModelOnlyImage(userData, imagePath);

    final isSuccess = await PersonServices.updateUser(user);

    if (isSuccess != null) {
      showSuccessMessage('Image update success', context);
      return true;
    } else {
      showErroMessage(context, message: 'Update Failed');
      return false;
    }
  }

  void showSuccessMessage(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 30, 255, 0),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );

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

  Map<String, dynamic> userModel(
    Map<String, dynamic>? userData,
    String submitType,
    TextEditingController fullNameController,
    TextEditingController dateOfBirthController,
    TextEditingController addressController,
    TextEditingController genderController,
    TextEditingController phoneController,
  ) {
    final fullName = fullNameController.text;
    final birthday = dateOfBirthController.text;
    final address = addressController.text;
    final gender = genderController.text;
    final phone = phoneController.text;

    return {
      "roleId": "INVESTOR",
      "fullName":
          submitType == "Infor" ? fullName : userData!["fullName"].toString(),
      "phone": submitType == "Infor" ? phone : userData!["phone"].toString(),
      "avatar": userData!["avatar"].toString(),
      "id_card": userData["idCard"].toString(),
      "gender": submitType == "Infor"
          ? gender.toUpperCase()
          : userData["gender"].toString(),
      "birthdate":
          submitType == "Infor" ? birthday : userData["birthdate"].toString(),
      "taxIdentification": userData["taxIdentification"].toString(),
      "address":
          submitType == "Infor" ? address : userData["address"].toString(),
      "bankName": userData["bankName"].toString(),
      "bankAccount": userData["bankAccount"] != null
          ? userData["bankAccount"].toString()
          : userData["bank_account"].toString(),
      "momo": userData["momo"].toString()
    };
  }

  Map<String, dynamic> userModelOnlyImage(
      Map<String, dynamic>? userData, String imagePath) {
    return {
      "roleId": "INVESTOR",
      "fullName": userData!["fullName"] != null
          ? userData["fullName"].toString()
          : userData["full_name"].toString(),
      "phone": userData["phone"].toString(),
      "avatar": imagePath,
      "id_card": userData["idCard"].toString(),
      "gender": userData["gender"].toString(),
      "birthdate": userData["birthdate"].toString(),
      "taxIdentification": userData["taxIdentification"].toString(),
      "address": userData["address"].toString(),
      "bankName": userData["bankName"].toString(),
      "bankAccount": userData["bankAccount"] != null
          ? userData["bankAccount"].toString()
          : userData["bank_account"].toString(),
      "momo": userData["momo"].toString()
    };
  }
}
