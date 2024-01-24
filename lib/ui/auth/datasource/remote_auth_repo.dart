import 'package:expense_manager/ui/auth/datasource/auth_data_source.dart';
import 'package:expense_manager/ui/auth/models/rest/req/req_login.dart';
import 'package:expense_manager/ui/auth/models/rest/res/res_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteDataSource implements AuthDataSource {
  @override
  Stream<ResLogin> login(ReqLogin reqLogin) {
    return Stream.fromFuture(FirebaseAuth.instance.signInWithEmailAndPassword(
            email: reqLogin.email, password: reqLogin.password))
        .map(
      (response) => ResLogin(
          isLogin: response.user!.uid.isEmpty,
          id: response.user!.uid,
          email: response.user!.email!),
    );
  }

  @override
  Stream<ResLogin> signup(ReqLogin reqLogin) {
    return Stream.fromFuture(FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: reqLogin.email, password: reqLogin.password)
            .then((value) => FirebaseFirestore.instance
                    .collection('User')
                    .doc(value.user!.uid)
                    .set({
                  'id': value.user!.uid,
                  'userName': reqLogin.username,
                  'email': reqLogin.email
                })))
        .map((event) => ResLogin(isLogin: true, id: '', email: reqLogin.email));
      
  }

  @override
  Stream<ResLogin> forgot(ReqLogin reqLogin) {
    return Stream.fromFuture(
            FirebaseAuth.instance.sendPasswordResetEmail(email: reqLogin.email))
        .map((event) => ResLogin(isLogin: true, id: '', email: ''));
  }
}
