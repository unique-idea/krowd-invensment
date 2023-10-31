import 'package:flutter/material.dart';

class AboutInforWidget extends StatelessWidget {
  const AboutInforWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 26, 157),
        leading: const BackButton(),
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text("App Refferent"),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 221, 10, 10),
        ),
        child: Column(children: [
          Container(
              width: 370,
              height: 500,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 42, 244, 197),
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Column(
                children: [
                  Text(
                    "Let consider a banking app called krow invesment The developers of BankEasy have incorporated various external components and libraries to enhance the functionality and security. To ensure compliance with licensing requirements and give credit to the original creators, they have implemented proper app referencing and obtained the necessary licenses",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "App Referencing krow invesment has integrated a barcode scanning feature to enable quick depositing of checks",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "krow invesment App License krow invesment has its own proprietary license that governs the usage, distribution, and modification of the app itself...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
