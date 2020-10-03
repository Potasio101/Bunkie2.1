import 'package:bunkieapp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bunkieapp/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // var _bunkie = 1;
  //var _bunker = 2;
  //var _both = 3;

  // create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign_in anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign_in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(
          'Pending First Name',
          'Pending Last Name',
          'Pending Contact',
          'Pending Address1',
          'Pending Address2',
          'Pending City',
          'Pending State',
          'Zip',
          'Nonhuman',
          1980,
          12,
          1);
      // Questionarie Collection
      await DatabaseService(uid: user.uid)
          .updateQuestionnaire(0, 'hometype', 0, 'earlylate');
      //BunkieBunker Collection
      await DatabaseService(uid: user.uid).updateBunkieBunker('bunkieORbunker');

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }

//    // create a new document for the user with the uid
//    await DatabaseService(uid: user.uid).updateUserData('First Name', 'Last Name');
//    return _userFromFirebaseUser(user);
//  } catch(e) {
//  print(e.toString());
//  return null;
//    // create a new document for the user with the uid
//    await DatabaseService(uid: user.uid).updateUserData(3);
//    return _userFromFirebaseUser(user);
//  } catch(e) {
//  print(e.toString());
//  return null;
//  }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
