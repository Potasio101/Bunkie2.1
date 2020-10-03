import 'package:bunkieapp/screens/authenticate/introPage.dart';
import 'package:bunkieapp/screens/authenticate/register.dart';
import 'package:bunkieapp/screens/authenticate/sign_in.dart';
import 'package:bunkieapp/screens/authenticate/bunkieBunker.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  // conditional statement for showing intro page
  bool showIntroPage = true;

  void toggleView() {
    setState(() => showIntroPage = !showIntroPage);
  }

  // conditional statement for showing register page
  bool showRegisterPage = true;

  void toggleRegister() {
    setState(() => showRegisterPage = !showRegisterPage);
  }

  // conditional statement for showing sign in page
  bool showSignIn = true;

  void toggleSignIn() {
    setState(() => showSignIn = !showSignIn);
  }

  // conditional statement for showing Bunkie/Bunker page
  bool showBunkieBunker = true;

  void toggleBunkieBunker(){
    setState(() => showBunkieBunker = !showBunkieBunker);
  }
  // if else statements for toggling between pages
  @override
  Widget build(BuildContext context) {
     if (showIntroPage) {
       return IntroPage(toggleView: toggleView);
    } else if (showIntroPage = false) {
       return SignIn(toggleView: toggleSignIn);
     } else if (showSignIn = false){
       return Register(toggleView: toggleRegister);
     } else if (showSignIn = false) {
     return SignIn(toggleView: toggleSignIn);
    } else {
       return BunkieBunker(toggleView: toggleBunkieBunker);
     }
    }
   }
