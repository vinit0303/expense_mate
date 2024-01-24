import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/ui/profile/datasource/add_username_data_source.dart';
import 'package:expense_manager/ui/profile/model/rest/req/username_model.dart';
import 'package:expense_manager/ui/profile/model/rest/res/res_username.dart';
import 'package:expense_manager/utils/global_var.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RemoteDataSource implements UserDataSource {

  @override
  Stream<ReqUser> editUserData(
    ReqUser reqUser,
   
  ) {
    return Stream.fromFuture(
        FirebaseFirestore.instance.collection('User').doc(reqUser.id).update({
      'firstName': reqUser.firstname,
      'date': reqUser.birthdate,
      'id': reqUser.id,
      'lastName': reqUser.lastName,
      'image_url': reqUser.imageUrl,
      'email': reqUser.email,
      'gender': reqUser.gander
    })).map((event) {
      return ReqUser(
        firstname: reqUser.firstname,
        birthdate: reqUser.birthdate,
        id: reqUser.id,
        imageUrl: reqUser.imageUrl,
        email: reqUser.email,
        gander: reqUser.gander,
        lastName: reqUser.lastName,
      );
    });
  }

  @override
  Stream<ResUser> deleteUser(String id) async* {
    FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('$id.jpg')
        .delete()
        .whenComplete(() {
      FirebaseAuth.instance.signOut();
    });
    await FirebaseAuth.instance.currentUser!.delete();

    Stream.fromFuture(
      FirebaseFirestore.instance.collection('User').doc(id).delete(),
    ).map((value) {
      FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('$id.jpg')
          .delete();

      return ResUser();
    });
  }

  @override
  Stream<ResUser> getuserDetail() {
    return Stream.fromFuture(
      FirebaseFirestore.instance.collection('User').doc(UserId.id).get(),
    ).map(
      (response) {
        return ResUser.fromJson(response.data());
      },
    );
  }

  @override
  Stream updatePass(String newpass) {
    return Stream.fromFuture(
        FirebaseAuth.instance.currentUser!.updatePassword(newpass));
  }
}
