import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

    @override
    Widget build(BuildContext context) {

      TextEditingController _usernameController = TextEditingController();
      TextEditingController _passwordController = TextEditingController();
      TextEditingController _phoneNumberController = TextEditingController();
      TextEditingController _fullNameController = TextEditingController();
      String? _selectedLanguage;
      final List<String> _languages = ['English', 'Vietnamese', 'Spanish', 'French'];
      bool seePassword = true;

      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [

              Positioned(
                top: 20,
                right: 20,
                child:
                DropdownButtonHideUnderline(
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
                    icon: const Icon(Icons.language), // Optional icon for the dropdown
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
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)), // Kích thước nút
                            ),
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/google_logo.png',
                              height: 30, // Điều chỉnh kích thước icon
                            ),
                            label: const Text(
                              "Login with Google",
                              style: TextStyle(color: Colors.black), // Thêm text bên cạnh icon
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)), // Kích thước nút
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook_rounded,
                              size: 30, // Điều chỉnh kích thước icon
                              color: Colors.blue,
                            ),
                            label: const Text(
                              "Login with Facebook",
                              style: TextStyle(color: Colors.black), // Thêm text bên cạnh icon
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Column(
                      children: [
                        Text("or", style: TextStyle(fontSize: 13, fontFamily: 'SFPro'),),
                        Text("Sign up with email", style: TextStyle(fontSize: 15, fontFamily: 'SFPro'),),
                        Text("Please sign up to continue our app",  style: TextStyle(fontSize: 14, fontFamily: 'SFPro', color: Colors.grey),),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

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
                                  "Full name",
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
                          controller: _usernameController,
                          decoration: InputDecoration(
                              label: const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  "Email/Username",
                                  style:
                                  TextStyle(fontFamily: 'SFPro', fontSize: 15),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextField(
                          onTap: () {},
                          controller: _passwordController,
                          obscureText: seePassword,
                          decoration: InputDecoration(
                              label: const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  "Password",
                                  style:
                                  TextStyle(fontFamily: 'SFPro', fontSize: 15),
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    seePassword = !seePassword;
                                  });
                                },
                                icon: seePassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
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
                              label: const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  "Phone Number",
                                  style: TextStyle(fontFamily: 'SFPro'),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
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
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SFPro',
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

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

