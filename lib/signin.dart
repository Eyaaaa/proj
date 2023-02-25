
import 'package:ecommerce_app1/pages/test.dart';
import 'package:ecommerce_app1/providers/emailSignIn.dart';
import 'package:ecommerce_app1/providers/facebookSignIn.dart';
import 'package:ecommerce_app1/signup.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';




final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;




  void _signInWithEmailAndPassword() async {
    if (_formKey.currentState!.validate()) {
      UserCredential? userCredential = await signInWithEmail(
        _emailController.text,
        _passwordController.text,
      );
      if (userCredential != null) {
        // Navigate to the next screen or do something else
      } else {
        // Show an error message to the user
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
        padding: EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: SingleChildScrollView(
    child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:30.0 ),
              Image.asset(
                "assets/images/black.png",
                height: 120.0,
                width: 150.0,
              ),
              SizedBox(height:20.0 ),
              Text(

                'Login to Your Account',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),





    //Email-------------------------------------------------------------------------------
              Container(
                margin: const EdgeInsets.fromLTRB(5, 30, 5, 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email or phone number",


                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),


                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),

                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },


                ),

              ),



              //Password-------------------------------------------------------------------------------
              Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1.0),

                  borderRadius: BorderRadius.all(Radius.circular(5.0)),),

                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true ,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),

                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye ,color: Colors.grey),
                      onPressed: () {
                        // toggle password visibility here
                      },
                    ),


                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The password field cannot be empty";
                    } else if (value.length < 6) {
                      return "the password has to be at least 6 characters long";
                    }
                    return null;
                  },
                ),
              ),


//-------------------------------------------------------------------
              SizedBox(height: 12.0 ),

              Row(
                children: <Widget>[

                  Checkbox(

                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe != value;
                      });
                    },
                  ),

                  Text('Remember Me'),
                ],
              ),



//---------------------------------------------------------------------------------------

          Padding(
            padding:
            const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
            child: Material(

                borderRadius: BorderRadius.circular(13.0),
                color: Colors.red,
                elevation: 0.0,
                child: MaterialButton(

               onPressed: _signInWithEmailAndPassword,
                  minWidth: MediaQuery.of(context).size.width,
                  child: Text(

                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                )
            ),
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(200, 5, 10, 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupPage()
                        )
                    );
                  },
                  child:

                      Text(

                        "Forgot password?",
                        style: TextStyle(color: Colors.black,),
                      ),


                ),
              )





            ],
          ),







//---------------------------------------or--------------------------------

              SizedBox(height: 10),
              Text("OR"),
              SizedBox(height: 10),






//---------------------------------------------Google login -------------
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.white,
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: ()  async {
                      // Call the signInWithGoogle() function
                      UserCredential? userCredential = await signInWithGoogle();
                      if (userCredential != null) {
                        // Successfully signed in with Google
                        // Navigate to the home screen or perform any other action here
                        print('Sign-in successful for user: ${userCredential.user?.displayName}');
                      } else {
                        print('no');
                        // Google sign-in was cancelled
                        // Display an error message or perform any other action here
                      }
                    },
                    minWidth: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 28.0,
                          width: 28.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "          Login with Google ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

//*--------------------------facebook login -----------------
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(

                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.indigoAccent,

                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {

                     await  signInWithFacebook() ;
                    },
                    minWidth: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/facebook.png',
                          height: 30.0,
                          width: 30.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "          Login with Facebook ",
                          style: TextStyle(
                              color: Colors.white,


                              fontWeight: FontWeight.normal,
                              fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),













              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1,20, 1, 20),
                  child:
                  Text(

                    "Don't have an account? Click here to",
                    style: TextStyle(color: Colors.black,fontSize: 15),
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,20, 10, 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()
                            )
                        );
                      },
                      child:

                      Text(

                        "Signup !",
                        style: TextStyle(color: Colors.red,fontSize: 15),
                      ),


                    ),
                  )





                ],
              ),



            ],
          ),
        ),
      ),
    ),);
  }


}
