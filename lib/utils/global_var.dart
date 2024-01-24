import 'package:firebase_auth/firebase_auth.dart';

class  UserId{
  
   static String id = FirebaseAuth.instance.currentUser!.uid;
   static String? email = FirebaseAuth.instance.currentUser!.email;
 }