import 'package:finapphive/services/auth_service.dart';
import 'package:finapphive/widgets/appbutton.dart';
import 'package:finapphive/widgets/apptext.dart';
import 'package:finapphive/widgets/customtextformfiled.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();
  String _errorMessage = ''; // Variable to hold error message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff535353).withOpacity(0.9),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                data: "Login Page",
                color: Colors.white,
                size: 22,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email is Mandatory";
                  }
                },
                controller: _emailController,
                hintText: "Enter Email",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is Mandatory";
                  }
                },
                obscureText: true,
                controller: _passwordController,
                hintText: "Password",
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: AppButton(
                  height: 48,
                  width: 250,
                  color: Colors.teal,
                  onTap: () async {
                    if (_loginKey.currentState!.validate()) {
                      AuthService _authService = AuthService();

                      final user = await _authService.loginUser(
                        _emailController.text,
                        _passwordController.text,
                      );

                      if (user != null) {
                        // Clear TextFields after successful login
                        _emailController.clear();
                        _passwordController.clear();

                        // Navigate to home screen
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                              (route) => false,
                          arguments: user
                        );
                      } else {
                        // Display error message for invalid credentials
                        setState(() {
                          _errorMessage = 'Invalid email or password';
                        });

                        ScaffoldMessenger.of(context).showSnackBar(

                            SnackBar(
                                backgroundColor:Colors.red,content: Text(_errorMessage)));
                      }
                    }
                  },
                  child: AppText(
                    data: "Login",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Display error message if login fails
              if (_errorMessage.isNotEmpty)
                AppText(data: _errorMessage, color: Colors.red),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    data: "Create an Account",
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: AppText(
                      data: "Register",
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
