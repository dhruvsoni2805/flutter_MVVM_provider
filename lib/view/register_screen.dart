import 'package:flutter/material.dart';
import 'package:mvvm_provider/resources/appcolor.dart';
import 'package:mvvm_provider/viewmodel/register_provider.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utlis.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  Image.asset(
                    "assets/images/user_sign_up.jpg",
                    fit: BoxFit.fitWidth,
                    height: 350,
                  ),
                  Text(
                    "Sign Up".toUpperCase(),
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
                      return null;
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
                  Consumer<RegisterScreenProvider>(
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
                          return null;
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
                  Consumer<RegisterScreenProvider>(
                    builder: (context, value, child) {
                      return ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Map data = {
                                'email': emailController.text.toString(),
                                'password': passwordController.text.toString(),
                              };
                              value.registerUser(context, data);
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
                            "sign up".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteName.loginscreen);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Already A  Member? "),
                        Text(
                          "Sign In",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("email : eve.holt@reqres.in"),
                  const Text("password : pistol"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
