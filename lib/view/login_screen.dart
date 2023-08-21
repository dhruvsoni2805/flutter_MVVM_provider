import 'package:flutter/material.dart';
import 'package:mvvm_provider/resources/appcolor.dart';
import 'package:provider/provider.dart';

import '../utils/routes/utlis.dart';
import '../viewmodel/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Form(
              key: _formkey,
              // autovaldateMode: _autoValidate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   "assets/images/contact_admin.jpg",
                  //   fit: BoxFit.fitWidth,
                  //   height: 350,
                  // ),
                  Text(
                    "login form".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff02386E)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your User ID";
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: "Enter Your User ID",
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Consumer<LoginScreenProvider>(
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: value.showpassword,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Password";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: "Enter Your Password",
                            // counter: Text("hey"),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  value.togglePasswordState();
                                },
                                icon: value.showpassword == false
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off))),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<LoginScreenProvider>(
                    builder: (context, value, child) {
                      return ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Map data = {
                                'email': emailController.text.toString(),
                                'password': passwordController.text.toString(),
                              };
                              value.loginApi(context, data);
                              // Utils.toastSuccessMessage(
                              //     "Successful Login", context);
                            } else {
                              Utils.toastErrorMessage(
                                  "Enter Your Valid Credentials Please",
                                  context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.Light_Green,
                            fixedSize: const Size(250, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            "login".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("email : eve.holt@reqres.in"),
                  const Text("password : cityslicka"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
