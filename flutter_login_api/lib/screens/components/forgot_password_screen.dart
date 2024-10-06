import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
      
            Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [

                  SizedBox(height: 70,),

                  Column(
                    children: [
                      Text("Forgot Password", style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),),
                      Text("Enter your email account to reset your password", style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 15,
                        color: Colors.grey
                      ),)
                    ],
                  ),

                  SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        onTap: () {},
                        controller: _usernameController,
                        obscureText: false,
                        decoration: InputDecoration(
                            label: const Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                "Username",
                                style: TextStyle(fontFamily: 'SFPro'),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextButton(
                        style: const ButtonStyle(),
                        onPressed: () {},
                        child: const Text(
                          "Reset Password",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SFPro',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            //BACK BUTTON
            Positioned(
              top: 30,
              left: 20,
              child: GestureDetector(
                onTap: () => {
                  Navigator.pop(context),
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}
