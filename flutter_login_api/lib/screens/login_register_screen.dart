import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSreen extends StatefulWidget {
  const LoginSreen({super.key});

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? _selectedLanguage;
  final List<String> _languages = ['English', 'Vietnamese', 'Spanish', 'French'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 30,
                left: 20,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  child: const Icon(Icons.arrow_back),
                )),
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
                  icon: Icon(Icons.language), // Optional icon for the dropdown
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  ClipRRect(
                    child: Center(
                      child: Image.asset(
                        "assets/images/logo.jpg",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              'assets/images/google_logo.png', // Đường dẫn đến hình ảnh của Google
                              height: 30, // Điều chỉnh kích thước hình ảnh
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.facebook_rounded,
                              size: 28,
                            ),
                          ),
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
                        controller: _usernameController,
                        obscureText: false,
                        decoration: InputDecoration(
                            label: const Text(
                              "Username",
                              style: TextStyle(fontFamily: 'SFPro'),
                            ),
                            prefixIcon: const Icon(Icons.person),
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            label: const Text(
                              "Password",
                              style:
                                  TextStyle(fontFamily: 'SFPro', fontSize: 15),
                            ),
                            prefixIcon: const Icon(Icons.key),
                            suffixIcon: const Icon(Icons.remove_red_eye_sharp),
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
                        onPressed: () {},
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

                  //Forget password
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgot password ?",
                            style:
                                TextStyle(fontFamily: 'SFPro', fontSize: 15))),
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
                            onPressed: () {},
                            child: const Text("SIGN UP",
                                style: TextStyle(fontFamily: 'SFPro'))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
