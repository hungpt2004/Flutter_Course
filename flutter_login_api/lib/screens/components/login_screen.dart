import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_api/controller/LoginController.dart';
import 'package:flutter_login_api/screens/components/forgot_password_screen.dart';
import 'package:flutter_login_api/screens/components/register_screen.dart';
import 'package:flutter_login_api/screens/home_screen.dart';
import 'package:flutter_login_api/widget/slide_page_route.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

class LoginSreen extends StatefulWidget {
  const LoginSreen({super.key});

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  // TextEditingController _usernameController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  String? _selectedLanguage;
  final List<String> _languages = [
    'English',
    'Vietnamese',
    'Spanish',
    'French'
  ];
  bool seePassword = true;

  @override
  Widget build(BuildContext context) {
    
    LoginController controller = Get.put(LoginController());
    
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //DROP DOWN LANGUAGE
            Positioned(
              top: 20,
              right: 20,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedLanguage,
                  items: _languages.map((String language) {
                    return DropdownMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLanguage = newValue;
                    });
                  },
                  icon: const Icon(
                      Icons.language), // Optional icon for the dropdown
                ),
              ),
            ),

            //LOGO
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  ClipRRect(
                    child: Center(
                      child: Image.asset(
                        "assets/images/logo.jpg",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(180, 50)), // Kích thước nút
                              ),
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/google_logo.png',
                                height: 30, // Điều chỉnh kích thước icon
                              ),
                              label: const Text(
                                "Login with Google",
                                style: TextStyle(
                                    color: Colors
                                        .black), // Thêm text bên cạnh icon
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(200, 50)), // Kích thước nút
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.facebook_rounded,
                                size: 30, // Điều chỉnh kích thước icon
                                color: Colors.blue,
                              ),
                              label: const Text(
                                "Login with Facebook",
                                style: TextStyle(
                                    color: Colors
                                        .black), // Thêm text bên cạnh icon
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        onTap: () {},
                        controller: controller.username,
                        decoration: InputDecoration(
                            label: const Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                "Email/Username",
                                style: TextStyle(fontFamily: 'SFPro'),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        onTap: () {},
                        controller: controller.password,
                        obscureText: seePassword,
                        decoration: InputDecoration(
                            label: const Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontFamily: 'SFPro', fontSize: 15),
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  seePassword = !seePassword;
                                });
                              },
                              icon: seePassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

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
                        onPressed: () async {
                          // Navigator.push(
                          //     context,
                          //     SlidePageRoute(
                          //         page: HomeScreen(),
                          //         beginOffset: Offset(0, 1),
                          //         endOffset: Offset.zero,
                          //         duration: Duration(milliseconds: 1000)));

                          //Create Model User
                          print("Login Credentials =====");
                          await controller.submit();

                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SFPro',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Forget password
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              SlidePageRoute(
                                  page: ForgotPasswordScreen(),
                                  beginOffset: Offset(0, 1),
                                  endOffset: Offset.zero,
                                  duration: Duration(milliseconds: 1000)));
                        },
                        child: const Text("Forgot password ?",
                            style:
                                TextStyle(fontFamily: 'SFPro', fontSize: 15))),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Button login by google, facebook
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("DON'T HAVE AN ACCOUNT ?",
                            style: TextStyle(fontFamily: 'SFPro')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  SlidePageRoute(
                                      page: RegisterScreen(),
                                      beginOffset: Offset(1, 0),
                                      endOffset: Offset.zero,
                                      duration: Duration(milliseconds: 1000)));
                            },
                            child: const Text("SIGN UP",
                                style: TextStyle(fontFamily: 'SFPro'))),
                      ],
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
