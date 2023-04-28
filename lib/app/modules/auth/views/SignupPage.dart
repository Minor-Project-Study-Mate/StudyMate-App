import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  String name = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: BorderSide.strokeAlignInside,
                  color: Colors.white,
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.indigo.shade800,
          ),
          body: Container(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Hey there,',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.normal,
                            letterSpacing: BorderSide.strokeAlignInside,
                          ),
                        ),
                        const Text(
                          'Create an Account',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: BorderSide.strokeAlignInside,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            prefixIcon: const Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            prefixIcon: const Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xff3B3B98), Color(0xff0072B5)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // perform signup action here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 24.0,
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
