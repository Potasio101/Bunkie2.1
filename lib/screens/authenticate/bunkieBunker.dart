import 'package:bunkieapp/screens/authenticate/sign_in.dart';
import 'package:bunkieapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class BunkieBunker extends StatefulWidget {

  final Function toggleView;
  BunkieBunker({ this.toggleView });

  @override
  _BunkieBunkerState createState() => _BunkieBunkerState();
}

class _BunkieBunkerState extends State<BunkieBunker> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  Widget _buildBunkieBunkerBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildBunkieBunkerBtn(
                () => print('Bunker Button'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildBunkieBunkerBtn(
                () => print('Bunkie Button'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBunkieBunkerBtn(Function onTap, AssetImage logo) {
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
      // app bar, title text and button to get to sign in page
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0.0,
        title: Text('Bunkie or Bunker?'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Next'),
            onPressed: () {
              //widget.toggleView();
              _navigateToSignIn(context);
            },
          )
        ],
      ),

      // theme, formatting, colors for background of the questionnaire
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