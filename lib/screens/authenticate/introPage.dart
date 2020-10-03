import 'package:bunkieapp/screens/authenticate/sign_in.dart';
import 'package:bunkieapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class IntroPage extends StatefulWidget {

  final Function toggleView;
 IntroPage({ this.toggleView });

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar, title text and button to get to sign in page
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0.0,
        title: Text('Welcome'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Get Started'),
            onPressed: () {
              //widget.toggleView();
              _navigateToSignIn(context);
            },
          )
        ],
      ),

      // theme, formatting, colors and Bunkie logo for the intro page
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
      Image.asset('lib/assets/Bunkie_wCircle_Transparent.png'),
    ]
    ),
    ),
      ),
    );
  }

  // function for navigating to sign in
  void _navigateToSignIn(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignIn(),
        )
    );
  }
  }