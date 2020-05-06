import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pis/ui/screens/home/root_page.dart';
import 'package:pis/ui/screens/login/forgot/reset_password_page.dart';
import 'package:pis/ui/screens/login/signup_page.dart';
import 'package:pis/ui/widgets/full_width_raisedbutton_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email, _pass;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/user.png',
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please type email';
                        }
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.length < 5) {
                          return 'Please type password more then 5 charator';
                        }
                      },
                      onSaved: (input) => _pass = input,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                FullWidthRaisedButtonWidget(
                  title: "Login",
                  onPressed: signIn,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPasswordPage()));
                      },
                      child: Text('Forgot password'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Text('Create an account?'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: _handleSignIn,
                        icon: Icon(
                          FontAwesomeIcons.googlePlusG,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.apple,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.phone,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.microsoft,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;

    if (formState.validate()) {
      formState.save();
      //  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _pass);
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _pass);
        print("User login: $user And Password: $_pass");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RootPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  // Sign in with google
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
       Navigator.push(
            context, MaterialPageRoute(builder: (context) => RootPage()));
    } catch (error) {
      print(error);
    }
  }
}
