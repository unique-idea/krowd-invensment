import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:krowd_invesment_footer/controller/person_controller/person_control.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget(
      {super.key, required this.userData, required this.setUpdate});
  final Map<String, dynamic>? userData;
  final VoidCallback setUpdate;

  @override
  State<StatefulWidget> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileWidget> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isEditProfile = false, isEditContact = false, isUpdated = false;
  final personControl = PersonControl();
  Map<String, dynamic>? userDataUpdate;

  void setUpdated() {
    setState(() {
      if (isUpdated == false) {
        isUpdated = !isUpdated;
      }
    });
    didChangeDependencies();
  }

  void setEditProfile() {
    setState(() {
      isEditProfile = !isEditProfile;
    });
  }

  void setEditContact() {
    setState(() {
      isEditContact = !isEditContact;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log('Called init ');
    if (isUpdated == true && userDataUpdate != null) {
      fullNameController.text = userDataUpdate!['fullName'].toString();
      phoneController.text = userDataUpdate!['phone'].toString();
      addressController.text = userDataUpdate!['address'].toString();
      dateOfBirthController.text = userDataUpdate!['birthdate'] != null
          ? userDataUpdate!['birthdate'].toString()
          : "You have not setting birth day yet";
      emailController.text = userDataUpdate!['email'].toString();
      genderController.text = userDataUpdate!['gender'].toString();
    } else if (widget.userData != null) {
      fullNameController.text = widget.userData!['fullName'] != null
          ? widget.userData!['fullName'].toString()
          : widget.userData!['full_name'].toString();

      phoneController.text = widget.userData!['phone'].toString();
      addressController.text = widget.userData!['address'].toString();
      dateOfBirthController.text = widget.userData!['birthdate'] != null
          ? widget.userData!['birthdate'].toString()
          : "You have not setting birth day yet";
      emailController.text = widget.userData!['email'].toString();
      genderController.text = widget.userData!['gender'].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 136, 136, 136),
        leading: BackButton(
          onPressed: () {
            widget.setUpdate();
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text("My Profile"),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 137, 137, 137),
        ),
        child: Column(
          children: [
            Container(
              width: 370,
              height: 300,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 42, 244, 197),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                children: [
                  buildHeadProfile(10, "Personal Information", 180, "Edit",
                      setEditProfile, setUpdated),
                  isEditProfile == false
                      ? buildInformation(
                          const Icon(
                            Icons.abc,
                            color: Colors.white,
                            size: 24,
                          ),
                          10,
                          12,
                          6,
                          12,
                          "Full name: ",
                          6,
                          12,
                          userDataUpdate == null
                              ? widget.userData!['fullName'] != null
                                  ? widget.userData!['fullName'].toString()
                                  : widget.userData!['full_name'].toString()
                              : userDataUpdate!['fullName'] != null
                                  ? userDataUpdate!['fullName'].toString()
                                  : widget.userData!['full_name'].toString())
                      : buildInformationInput(
                          const Icon(
                            Icons.abc,
                            color: Colors.white,
                            size: 24,
                          ),
                          10,
                          12,
                          6,
                          12,
                          "Full name: ",
                          6,
                          12,
                          fullNameController),
                  const SizedBox(height: 20),
                  isEditProfile == false
                      ? buildInformation(
                          const Icon(
                            Icons.date_range_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          10,
                          12,
                          6,
                          12,
                          "Date of birth: ",
                          10,
                          12,
                          userDataUpdate == null
                              ? widget.userData!['birthdate'] != null
                                  ? widget.userData!['birthdate'].toString()
                                  : "Your birth day is not setting"
                              : userDataUpdate!['birthdate'] != null
                                  ? userDataUpdate!['birthdate'].toString()
                                  : "Your birth day is not setting")
                      : buildInformationInputForDate(
                          const Icon(
                            Icons.date_range_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          10,
                          12,
                          6,
                          12,
                          "Date of birth: ",
                          10,
                          12,
                          dateOfBirthController),
                  const SizedBox(height: 20),
                  isEditProfile == false
                      ? buildInformation(
                          Icon(
                            userDataUpdate == null
                                ? widget.userData!['gender'].toString() ==
                                        "MALE"
                                    ? Icons.male
                                    : Icons.female
                                : userDataUpdate!['gender'].toString() == "MALE"
                                    ? Icons.male
                                    : Icons.female,
                            color: Colors.white,
                            size: 20,
                          ),
                          10,
                          12,
                          6,
                          12,
                          "Gender: ",
                          10,
                          12,
                          userDataUpdate == null
                              ? widget.userData!['gender'].toString()
                              : userDataUpdate!['gender'].toString())
                      : GenderInputWidget(
                          icon: Icon(
                            isUpdated == false
                                ? widget.userData!['gender'].toString() ==
                                        "MALE"
                                    ? Icons.male
                                    : Icons.female
                                : userDataUpdate == null
                                    ? widget.userData!['gender'].toString() ==
                                            "MALE"
                                        ? Icons.male
                                        : Icons.female
                                    : userDataUpdate!['gender'].toString() ==
                                            "MALE"
                                        ? Icons.male
                                        : Icons.female,
                            color: Colors.white,
                            size: 20,
                          ),
                          paddingLeftIcon: 10,
                          paddingTopIcon: 12,
                          paddingLeftTextOne: 6,
                          paddingTopTextOne: 12,
                          textOne: "Gender: ",
                          paddingLeftTextTwo: 10,
                          paddingTopTextTwo: 12,
                          textTwo: genderController),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
                          child: Icon(
                            Icons.house,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
                          child: Text(
                            "Address: ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                          child: isEditProfile == false
                              ? Text(
                                  userDataUpdate == null
                                      ? widget.userData!['address'] != null
                                          ? widget.userData!['address']
                                              .toString()
                                          : "You are not have address"
                                      : userDataUpdate!['address'] != null
                                          ? userDataUpdate!['address']
                                              .toString()
                                          : "You are not have address",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : SizedBox(
                                  height: 35,
                                  child: Center(
                                    child: TextField(
                                      controller: addressController,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10),
                                      decoration: const InputDecoration(
                                        hintText: "Address",
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      userDataUpdate == null
                          ? personControl
                              .submitDataProfile(
                                  widget.userData,
                                  "Infor",
                                  fullNameController,
                                  dateOfBirthController,
                                  addressController,
                                  genderController,
                                  phoneController,
                                  this.context)
                              .then((userUpdate) {
                              if (userUpdate != null) {
                                this.userDataUpdate = userUpdate;
                              }
                            })
                          : personControl
                              .submitDataProfile(
                                  userDataUpdate,
                                  "Infor",
                                  fullNameController,
                                  dateOfBirthController,
                                  addressController,
                                  genderController,
                                  phoneController,
                                  this.context)
                              .then((userUpdate) {
                              if (userUpdate != null) {
                                this.userDataUpdate = userUpdate;
                              }
                            });
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      margin: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          color: isEditProfile == true
                              ? const Color.fromARGB(255, 232, 237, 235)
                              : const Color.fromARGB(255, 42, 244, 197),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          isEditProfile == true ? "Save" : "",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 61, 60, 60),
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 370,
              height: 180,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 42, 244, 197),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                children: [
                  buildHeadProfile(10, "My Contact", 240, "Edit",
                      setEditContact, setUpdated),
                  buildInformation(
                      const Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 20,
                      ),
                      10,
                      12,
                      8,
                      12,
                      "Email: ",
                      10,
                      12,
                      widget.userData!['email'] != null
                          ? widget.userData!['email'].toString()
                          : "You are not have email"),
                  const SizedBox(height: 20),
                  isEditContact == false
                      ? buildInformation(
                          const Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 20,
                          ),
                          10,
                          12,
                          8,
                          12,
                          "Phone number: ",
                          10,
                          12,
                          userDataUpdate == null
                              ? widget.userData!['phone'] != null
                                  ? widget.userData!['phone'].toString()
                                  : "You are not have phone yet"
                              : userDataUpdate!['phone'] != null
                                  ? userDataUpdate!['phone'].toString()
                                  : "You are not have phone yet")
                      : buildInformationInput(
                          const Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 20,
                          ),
                          10,
                          12,
                          8,
                          12,
                          "Phone number: ",
                          10,
                          12,
                          phoneController),
                  GestureDetector(
                    onTap: () {
                      userDataUpdate == null
                          ? personControl
                              .submitDataProfile(
                                  widget.userData,
                                  "Contact",
                                  fullNameController,
                                  dateOfBirthController,
                                  addressController,
                                  genderController,
                                  phoneController,
                                  this.context)
                              .then((userUpdate) {
                              if (userUpdate != null) {
                                this.userDataUpdate = userUpdate;
                              }
                            })
                          : personControl
                              .submitDataProfile(
                                  userDataUpdate,
                                  "Contact",
                                  fullNameController,
                                  dateOfBirthController,
                                  addressController,
                                  genderController,
                                  phoneController,
                                  this.context)
                              .then((userUpdate) {
                              if (userUpdate != null) {
                                this.userDataUpdate = userUpdate;
                              }
                            });
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      margin: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          color: isEditContact == true
                              ? const Color.fromARGB(255, 232, 237, 235)
                              : const Color.fromARGB(255, 42, 244, 197),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          isEditContact == true ? "Save" : "",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 61, 60, 60),
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 370,
              height: 100,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 42, 244, 197),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                children: [
                  buildHeadProfile(
                      10, "Privacy", 265, "Edit", setEditContact, setUpdated),
                  buildInformation(
                      const Icon(
                        Icons.block,
                        color: Colors.white,
                        size: 20,
                      ),
                      10,
                      12,
                      8,
                      12,
                      "Block List",
                      0,
                      0,
                      ""),
                  buildInformation(
                      const Icon(
                        Icons.person_search_sharp,
                        color: Colors.white,
                        size: 20,
                      ),
                      10,
                      12,
                      8,
                      12,
                      "Friend List ",
                      0,
                      0,
                      ""),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeadProfile(
      double topPadding,
      String textOne,
      double widthSizeBox,
      String textTwo,
      VoidCallback settingType,
      VoidCallback settingUpdated) {
    void handleTap() {
      settingType(); // Call the first callback
      settingUpdated(); // Call the second callback
    }

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, topPadding, 0, 0),
          child: Text(
            textOne,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: widthSizeBox,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, topPadding, 5, 10),
          child: GestureDetector(
            onTap: handleTap,
            child: const SizedBox(
              height: 10,
              width: 10,
              child: Icon(
                Icons.edit,
                color: Colors.pink,
                size: 14,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            textTwo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildInformation(
    Icon icon,
    double paddingLeftIcon,
    double paddingTopIcon,
    double paddingLeftTextOne,
    double paddingTopTextOne,
    String textOne,
    double paddingLeftTextTwo,
    double paddingTopTextTwo,
    String textTwo,
  ) =>
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(paddingLeftIcon, paddingTopIcon, 0, 0),
              child: icon,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  paddingLeftTextOne, paddingTopTextOne, 0, 0),
              child: Text(
                textOne,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  paddingLeftTextTwo, paddingTopTextTwo, 0, 0),
              child: Text(
                textTwo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );

  Widget buildInformationInput(
    Icon icon,
    double paddingLeftIcon,
    double paddingTopIcon,
    double paddingLeftTextOne,
    double paddingTopTextOne,
    String textOne,
    double paddingLeftTextTwo,
    double paddingTopTextTwo,
    TextEditingController textTwo,
  ) =>
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(paddingLeftIcon, paddingTopIcon, 0, 0),
              child: icon,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  paddingLeftTextOne, paddingTopTextOne, 0, 0),
              child: Text(
                textOne,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: SizedBox(
              height: 25, // Set the desired height
              child: TextField(
                controller: textTwo,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
                decoration: InputDecoration(
                    hintText: textOne,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0)),
              ),
            ),
          ),
        ],
      );

  Widget buildInformationInputForDate(
    Icon icon,
    double paddingLeftIcon,
    double paddingTopIcon,
    double paddingLeftTextOne,
    double paddingTopTextOne,
    String textOne,
    double paddingLeftTextTwo,
    double paddingTopTextTwo,
    TextEditingController textTwo,
  ) =>
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(paddingLeftIcon, paddingTopIcon, 0, 0),
              child: icon,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  paddingLeftTextOne, paddingTopTextOne, 0, 0),
              child: Text(
                textOne,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  paddingLeftTextTwo, paddingTopTextTwo, 0, 0),
              child: GestureDetector(
                onTap: () async {
                  final DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    var formattedDate = "";
                    if (selectedDate.month < 10 && selectedDate.day < 10) {
                      formattedDate =
                          "${selectedDate.year}-0${selectedDate.month}-0${selectedDate.day}";
                    } else {
                      if (selectedDate.month < 10) {
                        formattedDate =
                            "${selectedDate.year}-0${selectedDate.month}-${selectedDate.day}";
                      }
                      if (selectedDate.day < 10) {
                        formattedDate =
                            "${selectedDate.year}-${selectedDate.month}-0${selectedDate.day}";
                      }
                    }
                    textTwo.text = formattedDate;
                  }
                },
                child: AbsorbPointer(
                  child: SizedBox(
                    height: 25, // Set the desired height
                    child: TextField(
                      controller: textTwo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10),
                      decoration: InputDecoration(
                          hintText: textOne,
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}

class GenderInputWidget extends StatefulWidget {
  final Icon icon;
  final double paddingLeftIcon;
  final double paddingTopIcon;
  final double paddingLeftTextOne;
  final double paddingTopTextOne;
  final String textOne;
  final double paddingLeftTextTwo;
  final double paddingTopTextTwo;
  final TextEditingController textTwo;

  const GenderInputWidget({
    Key? key,
    required this.icon,
    required this.paddingLeftIcon,
    required this.paddingTopIcon,
    required this.paddingLeftTextOne,
    required this.paddingTopTextOne,
    required this.textOne,
    required this.paddingLeftTextTwo,
    required this.paddingTopTextTwo,
    required this.textTwo,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GenderInputWidgetState();
}

class _GenderInputWidgetState extends State<GenderInputWidget> {
  bool isFemaleChecked = false;
  bool isMaleChecked = false;

  @override
  void initState() {
    super.initState();
    isFemaleChecked = widget.textTwo.text == "FEMALE";
    isMaleChecked = widget.textTwo.text == "MALE";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              widget.paddingLeftIcon,
              widget.paddingTopIcon,
              5,
              0,
            ),
            child: widget.icon,
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              widget.paddingLeftTextOne,
              widget.paddingTopTextOne,
              0,
              0,
            ),
            child: Text(
              widget.textOne,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 6,
          child: SizedBox(
            height: 25,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                  child: Text(
                    "Female",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Checkbox(
                    value: isFemaleChecked,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          isFemaleChecked = true;
                          if (isMaleChecked) {
                            isMaleChecked = false;
                          }
                          widget.textTwo.text = "FEMALE";
                        } else {
                          isFemaleChecked = false;
                        }
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Male",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Checkbox(
                    value: isMaleChecked,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          isMaleChecked = true;
                          if (isFemaleChecked) {
                            isFemaleChecked = false;
                          }
                          widget.textTwo.text = "MALE";
                        } else {
                          isMaleChecked = false;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
