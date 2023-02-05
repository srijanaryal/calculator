import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Putting  the controller in the Email and password Section

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _hidePassword = true;

  //--Creating Key in the form
  // final formKey = GlobalKey<FormState>();
  Future<void> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  }

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } catch (e) {
      print('');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Form(
//--providing key there
            // key: formKey,

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 85,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 40, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    //Adding Richtext
                    RichText(
                      text: TextSpan(
                        style:
                            TextStyle(fontSize: 30, color: Colors.deepPurple),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'to ',
                              style: TextStyle(
                                  fontSize: 40, color: Colors.deepPurple)),
                          TextSpan(
                              text: 'Khalti',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Text(
                      'Sign in to your Khalti Account',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          label: Text('Mobile Number or Email'),
                        )),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: _hidePassword,
                      decoration: InputDecoration(
                          label: Text('Password'),
                          suffix: InkWell(
                              onTap: () {
                                _hidePassword = !_hidePassword;
                                setState(() {});
                              },

                              ///logo change in password making
                              ///

                              child: Icon(_hidePassword == true
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined))),
                    ),

                    SizedBox(
                      height: 12,
                    ),

                    Text(
                      '                                                                 FORGOT PASSWORD?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: signIn,
                      child: Container(
                        // decoration: InputDecoration(border: BorderRadius.circular(10)),
                        height: 40,
                        color: Colors.deepPurple,
                        alignment: Alignment.center,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                              // fontWeight: FontWeight.bold),
                              ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          GestureDetector(
            onTap: signIn,
            child: Container(
              // decoration: InputDecoration(border: BorderRadius.circular(10)),
              height: 40,
              color: Colors.white,
              alignment: Alignment.center,
              child: Text(
                'New User?',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                    // fontWeight: FontWeight.bold),
                    ),
              ),
            ),
          ),
          Container(
            child: MaterialButton(
              visualDensity: VisualDensity(horizontal: 0, vertical: 1),
              height: 47,
              color: Colors.white,
              onPressed: () {
                final _email = _emailController.text;
                final _password = _passwordController.text;

                print(_email);
              },
              minWidth: double.infinity,
              child: Text(
                'CREATE AN ACCOUNT',
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
