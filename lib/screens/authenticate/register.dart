import 'package:bunkieapp/Utilities/constants.dart';
import 'package:bunkieapp/services/auth.dart';
import 'package:bunkieapp/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bunkieapp/screens/authenticate/bunkieBunker.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';
  String firstName = '';
  String lastName = '';
  bool _eighteen = false;
  bool _terms = false;
  var _gender = ['Gender', 'Male', 'Female', 'Non-Binary', 'Do Not Specify'];
  var _currentItemSelected = 'Gender';

  void _navigateToBunkieBunker(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BunkieBunker(),
        )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar, background color, sign in navigation button, and title text
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0.0,
        title: Text('Become a Bunkie'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              //widget.toggleView();
              Navigator.pop(context);
            },
          )
        ],
      ),

        // formatting, theme and colors for background
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
    'Sign Up',
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

      // user input boxes for email, password, and first and last name
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
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                validator: (val) => val.isEmpty ? 'Enter Your First Name' : null,
                onChanged: (val) {
                  setState(() => firstName = val);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                validator: (val) => val.isEmpty ? 'Enter Your Last Name' : null,
                onChanged: (val) {
                  setState(() => lastName = val);
                },
              ),

            // drop down menu button for gender that displays user input
            new DropdownButton<String>(
            items: _gender.map((String dropDownStringItem){
              return DropdownMenuItem<String>(
              value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
              }).toList(),
            onChanged: (String newValueSelected) {
              setState(() {
                this._currentItemSelected = newValueSelected;
              });
            },
              value: _currentItemSelected,
            ),

            // are you 18 years or older check bax this includes formatting, text styles and colors
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.blueGrey[800]),
                    child: Checkbox(
                      value: _eighteen,
                      checkColor: Colors.white,
                      activeColor: Colors.blueGrey[800],
                      onChanged: (value) {
                        setState(() {
                          _eighteen = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    'Are You 18 Years or Older?',
                    style: kLabelStyle,
                  ),
                ],
              ),
            ),

              // register button and validator for valid emails
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blueGrey[800],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                     _navigateToBunkieBunker(context);
                    if (result == null) {
                      setState(() => error = 'Please enter a valid email');
                      //else (result == !null)
                    }
                  }
                },
              ),

              // terms and conditions check box, and applicable formatting values
              Container(
                height: 170.0,
                child: Row(
                  children: <Widget>[
                    Theme(
                      data: ThemeData(unselectedWidgetColor: Colors.blueGrey[800]),
                      child: Checkbox(
                        value: _terms,
                        checkColor: Colors.white,
                        activeColor: Colors.blueGrey[800],
                        onChanged: (value) {
                          setState(() {
                            _terms = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      'I Agree to Bunkies Terms and Conditions'
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
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
        ),
    );
  }
}
