import 'package:flutter/material.dart';

class QrWidget extends StatefulWidget {
  const QrWidget({super.key, required this.fullName, required this.phone});
  final String fullName;
  final String phone;
  @override
  State<StatefulWidget> createState() => _QrState();
}

class _QrState extends State<QrWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 26, 157),
        leading: const BackButton(),
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text("My QR"),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 412,
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.fullName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Text(
                    widget.phone,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('images/signup.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/constant_QR.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 6),
                width: 500,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 253, 68, 185),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: const Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 5, 0, 0),
                          child: Icon(
                            Icons.download,
                            color: Colors.black,
                            size: 17,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 3, 0, 0),
                          child: Text(
                            "Download",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 5, 0, 0),
                          child: Icon(
                            Icons.share,
                            color: Colors.black,
                            size: 17,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 3, 0, 0),
                          child: Text(
                            "Share QR Code",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
