import "package:firebase_auth/firebase_auth.dart";
import "package:speakwise/models/user.dart";

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Create a user object based on FirebaseUser
User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  signInAnon() {}

  Stream<User> get user {
    return _auth.onAuthStateChanged;
    .map(_userFromFirebaseUser);

  }


  Future signInAnon() async {
  try {
    AuthResult result = (await _auth.signInAnonymously()) as AuthResult;
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  } catch(e) {
    print(e.toString());
    return null;
  }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    } 
  }


  
}




class FirebaseUser {
}

class AuthResult {
}

// auth change user stream
// Stream listing for all changes... whenever changes occur, we get a 
// value based on the user class if the off-set is the user signing in
// Or a null value if the user signs out 



