import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:krowd_invesment_footer/models/project.dart';
import 'package:krowd_invesment_footer/pages/investment/project_detail.dart';
import 'package:krowd_invesment_footer/pages/investment/widgets/project_services.dart';

class Invest extends StatefulWidget {
  const Invest({super.key});

  @override
  _InvestState createState() => _InvestState();
}

double fem = 1;

String selectedCategory = '';

class _InvestState extends State<Invest> {
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invest'),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _field(),
              _listProject1(context),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Project>> _listProject1(BuildContext context) {
    return FutureBuilder<List<Project>>(
      future: ProjectServices.fetchProjects(),
      builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the projects are being fetched
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Show an error message if there was an error fetching the projects
          return Text('Error: ${snapshot.error}');
        } else {
          // Display the projects once they are fetched
          List<Project> projects = snapshot.data!;
          return Container(
            margin: EdgeInsets.fromLTRB(4.5 * fem, 0 * fem, 5.5 * fem, 0 * fem),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: projects.map((project) {
                const SizedBox(
                  height: 20,
                );
                return _projectEach1(project, context);
              }).toList(),
            ),
          );
        }
      },
    );
  }
}

Widget _field() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: CarouselSlider(
      options: CarouselOptions(
        height: 50.0,
        viewportFraction: 0.3,
      ),
      items: ['All', 'Education', 'Technology', 'Market'].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 100, // Adjust the width as needed
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(
                      255, 65, 90, 234), // Set the desired border color
                  width: 1.0, // Set the desired border width
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0), // Set the desired padding
                child: FittedBox(
                  // Wrap the TextButton with FittedBox
                  fit: BoxFit.scaleDown,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      i,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 65, 90, 234),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    ),
  );
}

Widget _projectEach1(Project project, BuildContext context) {
  return ElevatedButton(
    onPressed: () async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProjectDetail(project)),
      );
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
    ),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xfff6f6f6)),
        color: const Color.fromARGB(255, 94, 22, 22),
        borderRadius: BorderRadius.circular(18 * fem),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3f000000),
            offset: Offset(0 * fem, 4 * fem),
            blurRadius: 2 * fem,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _part11(project),
          _part21(project),
        ],
      ),
    ),
  );
}

Widget _part11(Project project) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(300 * fem, 8 * fem, 15.45 * fem, 8 * fem),
        width: double.infinity,
        height: 142 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18 * fem),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://www.vinamilk.com.vn/static/uploads/editor/vinamilk-celebrates-14-years-benefiting-vietnamese-children-with-school-milk-program-1.jpg'),
          ),
        ),
      ),
      // Rest of the code
    ],
  );
}

Container _part21(Project project) {
  return Container(
    padding: EdgeInsets.fromLTRB(15.5 * fem, 8 * fem, 12 * fem, 10 * fem),
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Color(0xffffffff),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleInvest1(project),
        SizedBox(
          height: 10 * fem,
        ),
        sideBar1(project),
        SizedBox(
          height: 9 * fem,
        ),
        lastRowProject1(project),
      ],
    ),
  );
}

Widget _titleInvest1(Project project) {
  return SizedBox(
    width: double.infinity,
    height: 48 * fem,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 58.5 * fem, 0 * fem),
            constraints: BoxConstraints(
              maxWidth: 204 * fem,
            ),
            child: Text(
              project.projectName!,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16 * fem,
                fontWeight: FontWeight.w600,
                height: 1.5 * fem / fem,
                color: const Color(0xff000000),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 10 * fem, 0 * fem, 9 * fem),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 76 * fem,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7 * fem),
                  gradient: const LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: <Color>[Color(0xffff607d), Color(0xb2ff607d)],
                    stops: <double>[0, 1],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Invest',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14 * fem,
                      fontWeight: FontWeight.w600,
                      height: 1.5 * fem / fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget sideBar1(Project project) {
  double invested = project.capital! / 1000000;
  double target = project.targetCapital! / 1000000;
  if (target == 0) {
    target = 1;
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 14 * fem,
            fontWeight: FontWeight.w400,
            height: 1.6428571429 * fem / fem,
            letterSpacing: 0.5 * fem,
            color: const Color(0xff78858f),
          ),
          children: [
            TextSpan(
              text: '$invested M',
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 14 * fem,
                fontWeight: FontWeight.w500,
                height: 1.6428571429 * fem / fem,
                letterSpacing: 0.5 * fem,
                color: const Color(0xff0a66c2),
              ),
            ),
            TextSpan(
              text: ' fund raised from $target M',
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 14 * fem,
                fontWeight: FontWeight.w500,
                height: 1.6428571429 * fem / fem,
                letterSpacing: 0.5 * fem,
                color: const Color(0xff78858f),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 9 * fem,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          LinearProgressIndicator(
            value: invested / target,
            // value: 12/100,
            semanticsLabel: 'Linear progress indicator',
          ),
        ],
      ),
    ],
  );
}

Widget sideBar() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 14 * fem,
            fontWeight: FontWeight.w400,
            height: 1.6428571429 * fem / fem,
            letterSpacing: 0.5 * fem,
            color: const Color(0xff78858f),
          ),
          children: [
            TextSpan(
              text: '\$150k',
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 14 * fem,
                fontWeight: FontWeight.w500,
                height: 1.6428571429 * fem / fem,
                letterSpacing: 0.5 * fem,
                color: const Color(0xff0a66c2),
              ),
            ),
            TextSpan(
              text: ' fund raised from \$500k',
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 14 * fem,
                fontWeight: FontWeight.w500,
                height: 1.6428571429 * fem / fem,
                letterSpacing: 0.5 * fem,
                color: const Color(0xff78858f),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 9 * fem,
      ),
      Container(
        // group33621g9U (102:927)
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12 * fem),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://th.bing.com/th/id/R.272a7788575b354074a9fb5b429afd39?rik=1AYBEj844F8C2A&pid=ImgRaw&r=0',
            ),
          ),
        ),
        child: Align(
          // rectangle421hY (102:929)
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 99.3 * fem,
            height: 7 * fem,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12 * fem),
                color: const Color(0xff407bff),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget lastRowProject1(Project project) {
  DateTime dateTime = DateFormat('yyyy-MM-dd').parse(project.endDate!);
  String dateString = dateTime.toString().substring(0, 10);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(
        height: 25 * fem,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 23.31 * fem, 0 * fem),
              width: 66.2 * fem,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0x33407bff),
                borderRadius: BorderRadius.circular(9 * fem),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x19000000),
                    offset: Offset(0 * fem, 2 * fem),
                    blurRadius: 8 * fem,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  project.fieldName!,
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 14 * fem,
                    fontWeight: FontWeight.w500,
                    height: 1.3025 * fem / fem,
                    color: const Color(0xff0052ce),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 27.96 * fem, 0 * fem),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 14 * fem,
              fontWeight: FontWeight.w500,
              height: 1.3025 * fem / fem,
              color: const Color(0xff78858f),
            ),
            children: [
              TextSpan(
                text: project.areaName,
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 14 * fem,
                  fontWeight: FontWeight.w500,
                  height: 1.3025 * fem / fem,
                  color: const Color(0xff0052ce),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 0 * fem, 0 * fem),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 14 * fem,
              fontWeight: FontWeight.w500,
              height: 1.3025 * fem / fem,
              color: const Color(0xff78858f),
            ),
            children: [
              TextSpan(
                text: dateString,
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 14 * fem,
                  fontWeight: FontWeight.w500,
                  height: 1.3025 * fem / fem,
                  color: const Color(0xff0052ce),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget lastRowProject() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(
        height: 25 * fem,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 23.31 * fem, 0 * fem),
              width: 66.2 * fem,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0x33407bff),
                borderRadius: BorderRadius.circular(9 * fem),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x19000000),
                    offset: Offset(0 * fem, 2 * fem),
                    blurRadius: 8 * fem,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'EdTech',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 14 * fem,
                    fontWeight: FontWeight.w500,
                    height: 1.3025 * fem / fem,
                    color: const Color(0xff0052ce),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        // kinvestorsDh8 (102:931)
        margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 27.96 * fem, 0 * fem),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 14 * fem,
              fontWeight: FontWeight.w500,
              height: 1.3025 * fem / fem,
              color: const Color(0xff78858f),
            ),
            children: [
              TextSpan(
                text: '117K',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 14 * fem,
                  fontWeight: FontWeight.w500,
                  height: 1.3025 * fem / fem,
                  color: const Color(0xff0052ce),
                ),
              ),
              const TextSpan(
                text: ' investor’s',
              ),
            ],
          ),
        ),
      ),
      Container(
        // daysleft7AE (102:932)
        margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 0 * fem, 0 * fem),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 14 * fem,
              fontWeight: FontWeight.w500,
              height: 1.3025 * fem / fem,
              color: const Color(0xff78858f),
            ),
            children: [
              TextSpan(
                text: '28',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 14 * fem,
                  fontWeight: FontWeight.w500,
                  height: 1.3025 * fem / fem,
                  color: const Color(0xff0052ce),
                ),
              ),
              const TextSpan(
                text: ' days left',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
