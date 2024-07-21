import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ur_sugar/screens/admittedPatients/dischargeNow.dart';
import 'package:ur_sugar/utils/nowLoading.dart';

class AdmitsModals extends StatefulWidget {
  AdmitsModals({
    Key key,
    this.namePatient,
    this.patientId,
    this.doctorName,
    this.refId,
    this.userId,
    this.casedId,
    this.gender,
    this.age,
    this.docId,
    this.referral_code_id,
    this.user_id,
  }) : super(key: key);
  final String namePatient;
  final String patientId;
  final String doctorName;
  final int refId;
  final int userId;
  final String casedId;
  final int gender;
  final String age;
  final String docId;
  final int referral_code_id;
  final int user_id;

  @override
  _AdmitsModalsState createState() => _AdmitsModalsState();
}

class _AdmitsModalsState extends State<AdmitsModals> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 6,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 3,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    (widget.gender == 1)
                        ? Text(
                            widget.namePatient + ' ' + widget.age + ' yrs/Male',
                            style: TextStyle(
                                fontFamily: 'DmSans',
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: Colors.black),
                          )
                        : Text(
                            widget.namePatient +
                                ' ' +
                                widget.age +
                                ' yrs/Female',
                            style: TextStyle(
                                fontFamily: 'DmSans',
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Center(
                  child: Wrap(
                    runSpacing: 50,
                    spacing: 50,
                    alignment: WrapAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DischargeNow(
                                              refId: widget.referral_code_id,
                                              userId: widget.user_id,
                                              namePatient: widget.namePatient,
                                              age: widget.age,
                                              docId: widget.docId,
                                              casedId: widget.casedId,
                                              patientId: widget.patientId,
                                              doctorName: widget.doctorName,
                                              gender: widget.gender,
                                            ))).then((value) {
                                  setState(() {});
                                });
                              },
                              child: Icon(
                                Icons.history_outlined,
                                color: Colors.blueGrey.shade700,
                              ),
                            ),
                            Text(
                              'Discharge Now',
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.blueGrey.shade400),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.blueGrey.shade700,
                              ),
                            ),
                            Text(
                              'Chat with Doc',
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.blueGrey.shade400),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}

/*

Container(
      //height: 800,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 3,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    (gender == 1)
                        ? Text(
                            namePatient + ' ' + age + ' yrs/Male',
                            style: TextStyle(
                                fontFamily: 'DmSans',
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: Colors.black),
                          )
                        : Text(
                            namePatient + ' ' + age + ' yrs/Female',
                            style: TextStyle(
                                fontFamily: 'DmSans',
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Diagnosis',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: TextFormField(
                controller: diagnosis,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    isDense: true,
                    hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9B9B9B)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF667975), width: 0.5)),
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF667975), width: 0.5)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF667975), width: 0.5)),
                    hintText: "Diagnosis"),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Discharge Notes',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: TextFormField(
                controller: dischargeNotes,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    isDense: true,
                    hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9B9B9B)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF667975), width: 0.5)),
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF667975), width: 0.5)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF667975), width: 0.5)),
                    hintText: "Discharge Notes"),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Follow up advice',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: TextFormField(
                controller: followUpAdvice,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    isDense: true,
                    hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9B9B9B)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF667975), width: 0.5)),
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF667975), width: 0.5)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF667975), width: 0.5)),
                    hintText: "Follow up advice"),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Date Of Admission',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                IconButton(
                    icon: Icon(Icons.date_range_outlined,
                        size: 18, color: Colors.black),
                    onPressed: () {}),
                Text(formatted)
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'File Upload (Allow jpeg | jpg formats)',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      print('choose file clicked');
                    },
                    child: Container(
                      color: Colors.lightGreen.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Choose File',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('No file chosen')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  functionLoaderBox(context);
                  http.Response response = await http.post(
                      Uri.parse(
                          'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
                      body: json.encode({
                        "dml_indicator": "IDAD",
                        "case_id": casedId,
                        "referral_code_id": refId,
                        "created_by": userId,
                        "discharge_date": formatted,
                        "diagnosis": diagnosis.text,
                        "discharge_notes": dischargeNotes.text,
                        "followup_advice": followUpAdvice.text,
                        "discharge_attachment_file": "filepath"
                      }),
                      headers: {"Content-Type": "application/json"});

                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  //setState(() {});
                  print(response.statusCode);
                  print(response.body);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 10, bottom: 10),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );



*/
