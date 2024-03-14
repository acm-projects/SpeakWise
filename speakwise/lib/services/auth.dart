
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:speakwise/models/usermodel.dart';

class AuthService {
  final FirebaseAuth.FirebaseAuth _auth = FirebaseAuth.FirebaseAuth.instance;
  
  // Create a user object based on FirebaseUser
  UserTag? _userFromFirebaseUser(FirebaseAuth.User? user) {
    return user != null ? UserTag(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<UserTag?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Sign in anonymously
  Future<UserTag?> signInAnon() async {
    try {
      FirebaseAuth.UserCredential result = await _auth.signInAnonymously();
      FirebaseAuth.User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
