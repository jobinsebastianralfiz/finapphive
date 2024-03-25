import 'package:finapphive/models/user_model.dart';
import 'package:finapphive/services/auth_service.dart';
import 'package:finapphive/widgets/appbutton.dart';
import 'package:finapphive/widgets/apptext.dart';
import 'package:finapphive/widgets/customtextformfiled.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final _registerKey = GlobalKey<FormState>();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff535353).withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
          key: _registerKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  data: "Regsiter Page",
                  color: Colors.white,
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
                    hintText: "Enter Email"),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is Mandatory";
                      }
                    },
                    controller: _passwordController,
                    hintText: "Enter Password"),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name is Mandatory";
                      }
                    },
                    controller: _nameController,
                    hintText: "Enter Name"),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone is Mandatory";
                      }
                    },
                    controller: _phoneController,
                    hintText: "Enter Phone"),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: AppButton(
                      height: 48,
                      width: 250,
                      color: Colors.teal,
                      onTap: () async {
                        print("hello");
            
                        if (_registerKey.currentState!.validate()) {
                          UserModel user = UserModel(
                              username: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                              phone: _phoneController.text,
                              status: 1);
            
                        final res= await _authService.registerUser(user);
            
                         if(res==true){
            
                           Navigator.pop(context);
                         }
                        }
                      },
                      child: AppText(
                        data: "Register",
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      data: "Already have an Account",
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: AppText(
                          data: "Login",
                          color: Colors.white,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
