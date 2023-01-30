
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hea_apps/models/usermodel.dart';

import 'database.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  UserModel? _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // auth change user stream
  /*Stream<User> get user  {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }*/

  Stream<UserModel> get user {
    return _auth.authStateChanges().map((
        firebaseUser,
        ) {
      if (firebaseUser != null) {
        return UserModel(uid: firebaseUser.uid);
      } else {
        return null!;
      }
    });
  }
  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

     // x.docs[0]['type']
     // name = vari.data()['firstname'];


      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  Future registerWithEmailAndPassword(String name,String email, String password,String type,String age,
      String address,String phone,String gender,String clinic,
      String location,String myImage,String myCv,
  String weight,String height,String diseases, String caneSearch ,String myCover,String latlang,) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      // create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).addUserData(email,name,type,age,address,phone,gender,clinic,
          location,myImage,myCv,weight,height,diseases,caneSearch,myCover,latlang);
      return _userFromFirebaseUser(user!);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}