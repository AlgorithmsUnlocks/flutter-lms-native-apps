import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:trainingtalenew/Components/default_button.dart';


class VerifyOTPEmail extends StatefulWidget {

  @override
  _VerifyOTPEmailState createState() => _VerifyOTPEmailState();
}

class _VerifyOTPEmailState extends State<VerifyOTPEmail> {

  bool submitValid = false;

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();

  late EmailAuth emailAuth;
  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Training Tale Verification Email !",
    );
  }

  void verify() {
    print(emailAuth.validateOtp(
        recipientMail: _emailcontroller.value.text,
        userOtp: _otpcontroller.value.text));
  }

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailcontroller.value.text, otpLength: 4);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please Verify Your Email Address '),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Center(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextField(
                      controller: _emailcontroller,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(top: 20),
                    elevation: 6,
                    child: Container(
                      height: 50,
                      width: 300,
                      color: Colors.green[400],
                      child: GestureDetector(
                        onTap: sendOtp,
                        child: Center(
                          child: Text(
                            "Request For OTP Code",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  (submitValid)
                      ? TextField(
                    controller: _otpcontroller,
                  )
                      : Container(height: 1),
                  (submitValid)
                      ? Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: 200,
                    color: Colors.green[400],
                    child: GestureDetector(
                      onTap: verify,
                      child: Center(
                        child: Text(
                          "Verify",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                      : SizedBox(height: 1)
                ],
              ),
            )),
      ),
    );
  }
}


