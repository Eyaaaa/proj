import 'package:ecommerce_app1/pages/test.dart';
import 'package:ecommerce_app1/providers/emailSignUp.dart';
import 'package:ecommerce_app1/providers/googleSignUp.dart';

import 'package:ecommerce_app1/sigupPhone.dart';
import 'package:ecommerce_app1/verifyE.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'signin.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();



  void handleSignUp() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    await signUp(name, email, password, confirmPassword);
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

                  'Create an Account',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height:10.0 ),


                //---------------------2 buttons-----------------------






                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()
                            )
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],

                          borderRadius: BorderRadius.all(
                            Radius.circular(5),

                          ),

                        ),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignuppPage()
                            )
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],


                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Phone',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Name-------------------------------------------------------------------------------
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                  child: TextFormField(
                    controller: _nameController,


                    decoration: InputDecoration(

                      hintText: "Full name",
                      prefixIcon: Icon(Icons.person , color: Colors.grey,),



                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),

                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },

                  ),

                ),

               //email------------------------------------------------------------
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 3, 5, 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(

                      hintText: "Email ",
                      prefixIcon: Icon(Icons.email_outlined ,color: Colors.grey,),



                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),

                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },



                  ),

                ),




                //Password-------------------------------------------------------------------------------
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 3, 5, 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                  child: TextFormField(

                    controller: _passwordController,
                    obscureText: true,

                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_outline , color: Colors.grey,),


                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),



                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye , color: Colors.grey,),

                        onPressed: () {
                          // toggle password visibility here
                        },
                      ),

                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),



                //-------------confirm password
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 3, 5, 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                  child: TextFormField(

                    controller: _confirmPasswordController,
                    obscureText: true,

                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon:Icon(Icons.lock_outline, color: Colors.grey,),


                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),




                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                        onPressed: () {
                          // toggle password visibility here
                        },
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },

                  ),
                ),

                //-------------------------------



//---------------------------------------------------------------------------------------

                Padding(
                  padding:
                  const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
                  child: Material(
                      borderRadius: BorderRadius.circular(13.0),
                      color: Colors.red,
                      elevation: 0.0,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            handleSignUp();
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyVerifyE()
                              )
                          );
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        child: Text(
                          "Signup",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      )
                  ),
                ),


                SizedBox(height: 10),
                Text("OR"),
                SizedBox(height: 10),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[




                  ],
                ),
//---------------------------------------------Google login -------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(

                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.white,

                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        // Call the signInWithGoogle() function
                        UserCredential? userCredential = await signUpWithGoogle();
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
                                fontSize: 15.0),
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
                      onPressed: () {},
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

                        "Already a member?",
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
                                  builder: (context) => LoginPage()
                              )
                          );
                        },
                        child:

                        Text(

                          "Login!",
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
      ),


    );
  }
}




