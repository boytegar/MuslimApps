

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  _verifyPhoneNumber() async {
  //  String phoneNumber = "+1" + phoneNumController.text.toString();

    await _auth.verifyPhoneNumber(
        phoneNumber: "0",
        timeout: Duration(seconds: 5),
        verificationCompleted: (authCredential) => _verificationComplete(authCredential),
        verificationFailed: (authException) => _verificationFailed(authException),
        codeAutoRetrievalTimeout: (verificationId) => _codeAutoRetrievalTimeout(verificationId),
        // called when the SMS code is sent
        codeSent: (verificationId, [code]) => _smsCodeSent(verificationId, [code]));

  }

  _verificationComplete(AuthCredential authCredential) {
    FirebaseAuth.instance.signInWithCredential(authCredential).then((authResult) {
    // "Success!!! UUID is: " + authResult.user.uid;
    });
  }

  _smsCodeSent(String verificationId, List<int> code) {
    // set the verification code so that we can use it to log the user in
    //_smsVerificationCode = verificationId;
  }

  _verificationFailed(AuthException authException) {
   // final snackBar = SnackBar(content: Text("Exception!! message:" + authException.message.toString()));

  }

  _codeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
   // _smsVerificationCode = verificationId;
  }

}