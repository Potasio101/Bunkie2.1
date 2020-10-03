//import 'package:bunkieapp/models/userdocs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
// Stoare UID of the user
  final String uid;
  //var gender = ['Gender', 'Male', 'Female', 'Non-Binary', 'Do Not Specify'];
  //var homeType = ['house', 'apartment', 'Misc'];
  //var earlyLate = ['Early Bird', 'Night Owl'];
  DatabaseService({this.uid});

  // Update Jonathan 9.28.20
  // collection reference user
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
    String fname,
    String lname,
    String contact,
    String address1,
    String address2,
    String city,
    String state,
    String zip,
    String gender,
    int birthyear,
    int birthmonth,
    int birthdate,
  ) async {
    return await userCollection.document(uid).setData({
      'First Name': fname,
      'Last Name': lname,
      'Phone Number': contact,
      'Adresss 1': address1,
      'Address 2': address2,
      'City': city,
      'State': state,
      'Zip': zip,
      'Gender': gender,
      'Birthyear': birthyear,
      'Birthmonth': birthmonth,
      'Birthdate': birthdate
    });
  }

  // Future updateAccountLevel(int accountLevel) async {
  // return await userCollection.document(uid).setData({
  // 'Account Level': accountLevel,
  //   });
  // }

  // Update Jonathan 9.28.20
  // collection reference Questionnaire
  final CollectionReference userQuestionnaire =
      Firestore.instance.collection('questionnaire');
  Future updateQuestionnaire(
      int pets, String hometype, int budget, String earlylate) async {
    return await userQuestionnaire.document(uid).setData({
      'How Many Pets': pets,
      'Home Type': hometype,
      'Monthly Budget': budget,
      'Early Bird or Night Owl': earlylate,
    });
  }

  final CollectionReference userbunkiebunker =
      Firestore.instance.collection('bunkiebunker');
  Future updateBunkieBunker(String bunkieORbunker1) async {
    return await userbunkiebunker.document(uid).setData({
      'Bunkie OR Bunker': bunkieORbunker1,
    });
  }

  final CollectionReference userschool =
      Firestore.instance.collection('school');
  Future updateschool(String school) async {
    return await userschool.document(uid).setData({
      'School': school,
    });
  }

  final CollectionReference userbio = Firestore.instance.collection('bio');
  Future updatebio(String bio) async {
    return await userbio.document(uid).setData({
      'Biography': bio,
    });
  }

  //Future updateGender(var gender) async {
  //  return await userCollection.document(uid).setData({
  //    'Gender': gender,
  //   });
  // }

  //Future updateAge(int birthYear, int birthMonth) async {
  // return await userCollection.document(uid).setData({
  //   'Birth Month': birthMonth,
  //    'Birth Year': birthYear,
  // });
  // }

//  //User list from snapshot
//  List<UserDocs> _userListFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc) {
//      return UserDocs(
//        fname: doc.data['First Name'] ?? '',
//        lname: doc.data['Last Name'] ?? ''
//      );
//    });
//  //

//  // get users stream
//  Stream<UserDocs> get users {
//    return userCollection.document(uid).snapshots()
//      .map(_userListFromSnapshot);

//  get users stream
// Date added 10.1.20 Stream display the information from the database
// Episode 18

//Stream<QuerySnapshot> get users {
// return userCollection.snapshots();
//      .map(_userListFromSnapshot);
//  }
}
