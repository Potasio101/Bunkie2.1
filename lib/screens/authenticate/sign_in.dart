import 'package:bunkieapp/screens/authenticate/register.dart';
import 'package:bunkieapp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:bunkieapp/services/auth.dart';
import 'package:flutter/services.dart';
import 'package:bunkieapp/Utilities/constants.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  // function for navigating to Register page
  void _navigateToRegister(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Register(),
        )
    );
  }

  // widget for social media buttons formatting
  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  // widget for social media button sizes and shaping
  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar title sign in text and register button for navigating to register page
         appBar: AppBar(
           backgroundColor: Colors.green[200],
           elevation: 0.0,
           title: Text('Sign in to Bunkie'),
           actions: <Widget>[
             FlatButton.icon(
               icon: Icon(Icons.person),
               label: Text('Register'),
               onPressed: () {
                 //setState (() => ShowRegisterPage);
                 _navigateToRegister(context);
               }
             )
           ],
         ),
      // backgroundColor: Colors.lime[200],

      // coloring, formatting and styles for sign in background
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
    child: Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
           width: double.infinity,
            decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
              colors: [
              Color(0xFFF0F4C3),
              Color(0xFFB9F6CA),
                      ],
              stops: [0.5, 0.8],
              ),
            ),
        ),
    Container(
      height: double.infinity,
        child: SingleChildScrollView(
         physics: AlwaysScrollableScrollPhysics(),
         padding: EdgeInsets.symmetric(
         horizontal: 40.0,
         vertical: 50.0,
    ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Text(
                'Sign In',
                  style: TextStyle(
                  color: Colors.blueGrey[800],
                  fontFamily: 'OpenSans',
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
            ),
          ),
    SizedBox(height: 5.0), // height of email and password boxes
    SizedBox(
    height: 30.0,
    ),

    // formatting, validators, and text for user input fields for email and password
    Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Form(
          key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0), //spacing between email and password up
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0), //spacing between email and password down
                RaisedButton(
                  color: Colors.blueGrey[800],
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => error = 'Could not sign in with those credentials');
                      }
                    }
                  },
                ),
                SizedBox(height: 24.0), //height for login button
                Text(
                  error,
                  style: TextStyle(color: Colors.lightGreen[200], fontSize: 14.0),
                        ),
                       ],
                    ),
                  ),
                ),

                // forgot password button and function that displays button pressed text when the button is pressed
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    onPressed: () => print('Forgot Password Button Pressed'),
                    //padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Forgot Password?',
                      style: kLabelStyle,
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
       // _buildSocialBtnRow(),
        //_buildSocialBtn(),
    ],
    ),
    ),
        ),
    );
  }
}

