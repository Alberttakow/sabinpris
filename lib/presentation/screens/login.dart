// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/presentation/screens/home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _pswdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset(
                'assets/bckgrnd.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                height: size.height * .7,
                width: size.height * .48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 0),
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Center(
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.06),
                                      spreadRadius: 4,
                                      blurRadius: 4,
                                      offset: const Offset(0, 0),
                                    ),
                                  ]),
                              child: Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 34),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Username',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )),
                        const SizedBox(height: 4),
                        LoginTextField(
                            hint: 'enter username',
                            controller: _emailController),
                        const SizedBox(height: 10),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )),
                        const SizedBox(height: 4),
                        LoginTextField(
                          hint: 'enter password',
                          controller: _pswdController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            splashColor: Colors.greenAccent[800],
                            onTap: () {
                              final email = _emailController.text;
                              final pwd = _pswdController.text;

                              if (email.isNotEmpty && pwd.isNotEmpty) {
                                //Check typed credentials
                                int emailIndex = allowedEmails.indexOf(email);
                                if (emailIndex != -1) {
                                  final allowedPassword =
                                      allowedPasswords[emailIndex];
                                  if (allowedPassword == pwd) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return const Home();
                                      }),
                                    );
                                  } else {
                                    //TODO:Show wrong password
                                    debugPrint("Incorrect Password");
                                  }
                                } else {
                                  //TODO:Show email not found error
                                  debugPrint("Incorrect Email");
                                }
                              } else {
                                //TODO:Show an error here
                                debugPrint("No Email and Password Entered");
                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Center(
                                  child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
