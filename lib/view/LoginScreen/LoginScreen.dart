import 'package:api_calling_get_x/view/HomeScreen/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/LoginController/LoginController.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final GlobalKey<FormState> logindata = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passController = TextEditingController();


    return Scaffold(
      backgroundColor: const Color(0xff404654),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 60, top: 300),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 300,
                child: Form(
                  key: logindata,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: emailController,
                        decoration: const InputDecoration(
                          icon: Icon(CupertinoIcons.mail, color: Colors.white),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        validator: (value)
                        {
                          bool emailValidation = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

                          if(value!.isEmpty)
                            {
                              return "Enter Email";
                            }
                         else if(!emailValidation)
                            {
                              return "Enter Valid Email";
                            }
                        },
                      ),
                      const SizedBox(height: 20),
                      Obx(() => TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: passController,
                        obscureText: loginController.validationComplete.value,
                        decoration: InputDecoration(
                          icon: const Icon(CupertinoIcons.padlock_solid, color: Colors.white),
                          hintText: 'Enter your password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          suffix: InkWell(
                            onTap: () {
                              loginController.validation();
                            },
                            child: Icon(
                              loginController.validationComplete.value
                                  ? CupertinoIcons.eye_solid
                                  : CupertinoIcons.eye_slash,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        validator: (value)
                        {
                          if(value!.isEmpty)
                            {
                              return "Enter Password";
                            }
                          else if (passController.text.length<6)
                            {
                              return "Password Length Should be more then 6 characters";
                            }
                        },
                      )),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                if (logindata.currentState!.validate()) {
                  emailController.clear();
                  passController.clear();
                  Get.to(HomeScreen());
                }
              },
              child: Center(
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xff20232b),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'First time here ?',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 5),
                Text(
                  'Sign up.',
                  style: TextStyle(color: Color(0xffa5b8c3)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
