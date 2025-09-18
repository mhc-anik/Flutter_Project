import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/widgets/screen_backGround.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
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
                        "Join With Us",style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(hintText: "First Name"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(hintText: "Last Name"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _mobileController,
                        decoration: InputDecoration(hintText: "Mobile"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          FilledButton(
                            onPressed: () {},
                            child: Icon(Icons.arrow_circle_right_outlined,size: 25,),
                          ),
                          SizedBox(height: 20),

                          RichText(
                            text: TextSpan(
                              text: "Already Have an Account ? ",
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()..onTap = _onTabLogInButton,
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

  void _onTabLogInButton(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => loginScreen()),
    );
  }

  dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

}
