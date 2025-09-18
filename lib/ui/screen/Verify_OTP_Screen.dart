import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screen/Reset_Password_Screen.dart';
import 'package:task_manager/ui/screen/Sign_Up_Screen.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/widgets/screen_backGround.dart';

class verifyOtpScreen extends StatefulWidget {
  const verifyOtpScreen({super.key});

  @override
  State<verifyOtpScreen> createState() =>
      _verifyOtpScreenState();
}

class _verifyOtpScreenState extends State<verifyOtpScreen> {
  final TextEditingController _OTPController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screenBackGround(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 100),
                      Text(
                        "Enter Your OTP",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "A 6 Digit OTP Code has been Send to Your Email Address",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.deepOrange),
                      ),
                      SizedBox(height: 20),
                      PinCodeTextField(
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        //enableActiveFill: true,
                        controller: _OTPController,
                        appContext: context,
                      ),

                      SizedBox(height: 20),
                      Column(
                        children: [
                          FilledButton(
                            onPressed: _onTabNextButton,
                            child: Text("VERIFY",style:TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              text: "Al Ready have an Account ? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =_onTabLoginButton,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabLoginButton() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => loginScreen()));
  }

  void _onTabNextButton() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => resetPasWordScreen()));
  }

  dispose() {
    _OTPController.dispose();
    super.dispose();
  }
}
