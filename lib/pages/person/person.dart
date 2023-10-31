import 'package:flutter/material.dart';
import 'package:krowd_invesment_footer/pages/person/about.dart';
import 'package:krowd_invesment_footer/pages/person/qr.dart';
import 'package:krowd_invesment_footer/pages/person/services/person_services.dart';
import 'package:krowd_invesment_footer/pages/person/widgets/appbar_widget.dart';
import 'package:krowd_invesment_footer/pages/person/widgets/extension_item_widget.dart';
import 'package:krowd_invesment_footer/pages/person/widgets/profile_widget.dart';
import 'package:krowd_invesment_footer/pages/person/widgets/threepart_widget.dart';

import '../../controller/person_controller/person_control.dart';
import '../../modules/authentication/auth_controller.dart';

class Person extends StatefulWidget {
  const Person({Key? key, required this.user}) : super(key: key);

  final Future<Map<String, dynamic>> user;

  @override
  State<StatefulWidget> createState() {
    return PersonSate();
  }
}

class PersonSate extends State<Person> {
  bool isVisible = false, light = true;
  Map<String, dynamic>? userDataUpdate;

  Future<void> setUpdate() async {
    final user = await PersonServices.fetchUser();
    setState(() {
      if (user != null) {
        userDataUpdate = user;
      }
    });
  }

  void setVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void setTheme() {
    setState(() {
      light = !light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: widget.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final userData = snapshot.data;
            return Scaffold(
              appBar: buildAppBar(context, setTheme),
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: light ? Colors.white : Colors.grey.shade900,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 12, 5, 5),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5.0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 5.0,
                                ),
                                width: 500.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 201, 201, 201),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  children: [
                                    userDataUpdate == null
                                        ? UserOverview(
                                            userData: userData,
                                            setUpdate: setUpdate)
                                        : UserOverview(
                                            userData: userDataUpdate,
                                            setUpdate: setUpdate),
                                    const AboutApp(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 100, 5),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Manage ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: light ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 5.0,
                        ),
                        width: 500.0,
                        height: isVisible ? 220.0 : 150.0,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 201, 201, 201),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            userDataUpdate == null
                                ? HeadManage(
                                    setVisibility: setVisibility,
                                    isVisible: isVisible,
                                    userData: userData,
                                    setUpdate: setUpdate,
                                  )
                                : HeadManage(
                                    setVisibility: setVisibility,
                                    isVisible: isVisible,
                                    userData: userDataUpdate,
                                    setUpdate: setUpdate,
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 100, 5),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Extension ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: light ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 1, 10, 10),
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 201, 201, 201),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const HeadExtension(),
                      ),
                      Container(
                        height: 45,
                        width: 375,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const LogOut(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class UserOverview extends StatefulWidget {
  const UserOverview(
      {super.key, required this.userData, required this.setUpdate});
  final Map<String, dynamic>? userData;
  final VoidCallback setUpdate;
  @override
  State<StatefulWidget> createState() => _UserOverviewState();
}

class _UserOverviewState extends State<UserOverview> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            ProfileWidget(
                              userData: widget.userData,
                              setUpdate: widget.setUpdate,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: buildName(widget.userData),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: buildQR(widget.userData),
          ),
        ],
      ),
    );
  }

  Widget buildName(Map<String, dynamic>? userData) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 16, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userData!['full_name'] == null
                  ? userData['fullName'].toString()
                  : userData['full_name'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
            const SizedBox(height: 5),
            Text(
              userData['phone'] != null
                  ? userData['phone'].toString()
                  : "You not have phone yet",
              style: const TextStyle(color: Colors.white, fontSize: 9),
            ),
            const SizedBox(height: 5),
            Container(
              width: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 24, 251, 47),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Opacity(
                opacity: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                  child: Text(
                    textAlign: TextAlign.center,
                    userData['enabled'] ? 'Activate' : 'InAtivate',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildQR(Map<String, dynamic>? userData) => Padding(
        padding: const EdgeInsets.only(bottom: 17),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QrWidget(
                  fullName: userData!['fullName'] != null
                      ? userData['fullName'].toString()
                      : "Full name is null",
                  phone: userData['phone'] != null
                      ? userData['phone'].toString()
                      : "You not have phone yet",
                ),
              ),
            );
          },
          child: Image.asset(
            "images/constant_QR.png",
            width: 70,
            height: 40,
          ),
        ),
      );
}

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<StatefulWidget> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            width: 500,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 152, 203, 152),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor:
                            1, // Set the width factor to 0.2 (20% of parent width)
                        heightFactor: 3,
                        child: Row(
                          children: [
                            buildBackgroundImage(),
                            buildTextRefferent(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: buildForwardArrow(),
                ),
              ],
            )));
  }

  Widget buildBackgroundImage() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: const DecorationImage(
            image: AssetImage('images/referent.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: 30,
        height: 30,
      );

  Widget buildTextRefferent() => const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          "Application Refferent",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        ),
      );

  Widget buildForwardArrow() => Container(
        margin: const EdgeInsets.only(left: 135),
        child: TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AboutInforWidget(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.black,
            size: 17,
          ),
          label: const Text(''),
        ),
      );
}

class HeadManage extends StatefulWidget {
  const HeadManage(
      {Key? key,
      required this.setVisibility,
      required this.isVisible,
      required this.userData,
      required this.setUpdate})
      : super(key: key);
  final VoidCallback setVisibility, setUpdate;
  final bool isVisible;
  final Map<String, dynamic>? userData;
  @override
  State<StatefulWidget> createState() => _HeadManageSate();
}

class _HeadManageSate extends State<HeadManage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            buildTitle(),
            buildAnimationTitle(),
          ],
        ),
        AnimatedContainer(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 152, 203, 152),
            borderRadius: BorderRadius.circular(8),
          ),
          duration: const Duration(milliseconds: 500),
          height: widget.isVisible ? 75 : 0,
          width: 500,
          child: Visibility(
            visible: widget.isVisible,
            child: Column(
              children: [
                buildElementHidden(
                    'images/momo.png',
                    widget.userData!['momo'] != null
                        ? widget.userData!['momo'].toString()
                        : "You not have momo",
                    "4.548.300\$",
                    12,
                    170),
                buildElementHidden(
                    'images/bank.png',
                    widget.userData!['bankName'] != null
                        ? widget.userData!['bankName'].toString()
                        : "You not have bank",
                    widget.userData!['bank_account'] != null
                        ? widget.userData!['bank_account'].toString()
                        : widget.userData!['bankAccount'].toString(),
                    12,
                    187),
                buildCatchEventText("Link Now"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        buildThreePartItem(
          'images/change_image.png',
          "Change Image",
          const Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 20,
            color: Colors.black,
          ),
          173,
          "Image",
          context,
          widget.userData,
          widget.setUpdate,
        ),
        const SizedBox(height: 3),
        buildThreePartItem(
            'images/setting.png',
            "Setting",
            const Icon(
              Icons.keyboard_arrow_right_sharp,
              size: 20,
              color: Colors.black,
            ),
            218,
            "Password",
            context,
            widget.userData,
            widget.setUpdate),
      ],
    );
  }

  Widget buildTitle() => Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 0, 200, 0),
          child: const Text(
            "Security / Card",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      );

  Widget buildAnimationTitle() => GestureDetector(
        onTap: widget.setVisibility,
        child: Container(
          height: 35,
          width: 40,
          margin: const EdgeInsets.fromLTRB(27, 0, 0, 0),
          child: Icon(
            widget.isVisible
                ? Icons.keyboard_arrow_up_sharp
                : Icons.keyboard_arrow_down_sharp,
            size: 24,
            color: Colors.black,
          ),
        ),
      );

  Widget buildElementHidden(String imagePath, String textOne, String textTwo,
      double fontSize, double paddingLeft) {
    if (textOne == "string") {
      textOne = "Not linked yet";
      textTwo = "";
    }

    return Row(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 7, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          width: 15,
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 6, 0, 0),
          child: Text(
            textOne,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingLeft, 6, 0, 0),
          child: Text(
            textTwo,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget buildCatchEventText(String text) => GestureDetector(
        onTap: () {},
        child: Container(
          height: 15,
          width: 50,
          margin: const EdgeInsets.fromLTRB(27, 10, 0, 0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Color.fromARGB(255, 138, 138, 138)),
          ),
        ),
      );
}

class HeadExtension extends StatefulWidget {
  const HeadExtension({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeadExtensionState();
}

class _HeadExtensionState extends State<HeadExtension> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildItemExtension(
          'images/expense.png',
          "Expense Overview",
          "Record and track your expanse every day",
          0,
          35,
          10,
          0,
          152,
          const Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 20,
            color: Colors.black,
          ),
        ),
        buildItemExtension(
          'images/voucher.png',
          "Voucher Collected",
          "3 gift vouchers",
          10,
          0,
          0,
          35,
          197,
          const Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 20,
            color: Colors.black,
          ),
        ),
        buildItemExtension(
          'images/app_score.png',
          "App Score",
          "Show up score activity",
          10,
          40,
          0,
          5,
          200,
          const Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        image: DecorationImage(
            image: AssetImage('images/loginbtn.png'), fit: BoxFit.cover),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            AuthController.instance.logout();
          },
          child: const Text(
            "Sign out",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
