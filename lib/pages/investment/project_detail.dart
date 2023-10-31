import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krowd_invesment_footer/config/const.dart';
import 'package:krowd_invesment_footer/models/project.dart';
import 'package:krowd_invesment_footer/pages/investment/widgets/project_services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProjectDetail extends StatefulWidget {

  ProjectDetail(this.project, {super.key});
  Project project;

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  TextEditingController projectTextController = TextEditingController();
  TextEditingController amounInvestController = TextEditingController();

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
              image(),
              projectTitle(),
              detail(),
              description(),
              investNow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1,
            height: 250,
            decoration: BoxDecoration(
              color: const Color(0xFFDBE2E7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Hero(
                      tag: Object,
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          // "${project.image}",
                          "https://www.vinamilk.com.vn/static/uploads/editor/vinamilk-celebrates-14-years-benefiting-vietnamese-children-with-school-milk-program-1.jpg",
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget projectTitle() {
    String endDate = widget.project.endDate!.substring(0, 10);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 12, 24, 0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  '${widget.project.projectName}',
                  style: TextStyle(fontSize: 20, color: Colors.blue[700]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '${widget.project.areaName}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: Color.fromARGB(255, 43, 111, 175),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '${widget.project.fieldName}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: Color.fromARGB(255, 43, 111, 175),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  endDate,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: Color.fromARGB(255, 43, 111, 175),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget detail() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 24, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent[300],
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                const Text(
                                  'Stage',
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Text(
                                      '${widget.project.numberOfStage}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ]),
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                const Text(
                                  'Multiplier',
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Text(
                                      '${widget.project.mutiplier}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ]),
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                const Text(
                                  'Duration',
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Text(
                                      '${widget.project.duration}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  CircularPercentIndicator(
                    percent: widget.project.capital! / (widget.project.targetCapital!),
                    radius: 50,
                    lineWidth: 10,
                    animation: true,
                    progressColor: Colors.blueAccent,
                    backgroundColor: Colors.grey,
                    center: Text(
                      '${widget.project.capital! / (widget.project.targetCapital!)}%',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget description() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 24, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'DESCRIPTION',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Html(
                      data: "${widget.project.projectDescription}",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget investNow() {
    bool isDialogShown = false;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(100, 10, 100, 20),
      child: MaterialButton(
        onPressed: () {
          if (!isDialogShown) {
            // Check if the dialog is not already shown
            setState(() {
              isDialogShown =
                  true; // Set isDialogShown to true to prevent multiple dialogs
            });
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Invest'),
                  content: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: amounInvestController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Amount',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                submitInvestment();
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
        color: primaryColor,
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        height: 58,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Invest now',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }

  Future<void> submitInvestment() async {
    Navigator.of(context).pop();
    final isSuccess = await ProjectServices.submitInvestment(investModel);
    // show success ot fail message based on status
    if (isSuccess) {
      updateDataOnServer(widget.project.projectId!);
      amounInvestController.text = '';
      showSuccessMessage('Invest successfully');
    } else {
      // ignore: use_build_context_synchronously
      showErroMessage(context, message: 'Invest Failed');
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

 Future<void> updateDataOnServer(int id) async  {
    final isSuccess =  await ProjectServices.synchronizeDataOnServer(id);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        widget.project = isSuccess;
      });
    });
  }

  Map get investModel {
    final projectId = widget.project.projectId;
    final amount = amounInvestController.text;
    return {"projectId": projectId, "totalMoney": amount};
  }
}
