import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krowd_invesment_footer/pages/notification/services/notification_services/notification_services/notification_services.dart';

import 'model/transaction_person_to_wallet.dart';
import 'model/transaction_response.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int selectedIndex = 0;
  String? notificationTitle, notificationMsg, formattedSentTime;

//Init catch event send notify from firebase
  @override
  void initState() {
    super.initState();

    //Get message when app not running
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        final DateTime sentTime =
            DateTime.fromMillisecondsSinceEpoch(event.sentTime as int);

        setState(() {
          formattedSentTime = sentTime.toString();
          notificationTitle = "${event.notification!.title}";
          notificationMsg = "${event.notification!.body}";
        });
      }
    });

    //Get message while app is running
    FirebaseMessaging.onMessage.listen((event) {
      final DateTime sentTime =
          DateTime.fromMillisecondsSinceEpoch(event.sentTime as int);

      setState(() {
        formattedSentTime = sentTime.toString();
        notificationTitle = "${event.notification!.title}";
        notificationMsg = "${event.notification!.body}";
      });
    });

    //Get message while app is running but in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      final DateTime sentTime =
          DateTime.fromMillisecondsSinceEpoch(event.sentTime as int);

      setState(() {
        formattedSentTime = sentTime.toString();
        notificationTitle = "${event.notification!.title}";
        notificationMsg = "${event.notification!.body}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 208, 207, 207),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 125,
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Personal To Project Wallet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<TransactionResponse?>(
                future: NotificationServices.fetchTransaction(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final transactionResponse = snapshot.data;

                    List<TransactionPersonToWallet>? transaction =
                        transactionResponse?.fromPersonalToProjectWallet;
                    return Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: transaction!.isNotEmpty
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: transaction!.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                          '${transaction[index].description}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                      subtitle: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                                '${transaction[index].createdAt}',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                                '+ ${transaction[index].amount}',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 81, 255, 0))),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      color: Colors.black,
                                    );
                                  },
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(52, 20, 0, 0),
                                  child: Text(
                                      'Sorry You Are Not Have Transaction Yet',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0))),
                                )),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
