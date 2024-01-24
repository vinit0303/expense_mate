import 'dart:io';

import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_stateful_widget.dart';
import 'package:expense_manager/ui/profile/bloc/profile_sccreen_bloc.dart';
import 'package:expense_manager/utils/extensions.dart';
import 'package:expense_manager/utils/image_const.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class UserImagePicker extends StatefulWidget {
  UserImagePicker(
      {super.key,
      required this.bloc,
      required this.id,
      required this.imageUrl});
  String? id;
  String imageUrl;
  AddUserBloc bloc;

  @override
  State<UserImagePicker> createState() {
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends BaseState<UserImagePicker> {
  @override
  void initState() {
    super.initState();
    if (widget.imageUrl.isNotEmpty) {
      widget.bloc.url.add(widget.imageUrl);
    }
  }

  File? _pickedImageFile;
  String url = '';
  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
      image();
    });
  }

  image() async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${widget.id}.jpg');
    storageRef.putFile(_pickedImageFile!);
    url = await storageRef.getDownloadURL();
    widget.bloc.url.add(url);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.bloc.url,
      builder: (context, snapshot) {
        return InkWell(
            onTap: _pickImage,
            child: snapshot.data?.trim().isNotEmpty ?? false
                ? CircleAvatar(
                    radius: 38,
                    backgroundImage: NetworkImage(snapshot.data!),
                  ).tp(25)
                : SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(ImageConsts.profileImage),
                  ).tp(25));
      },
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return widget.bloc;
  }
}


//  CircleAvatar(
//         radius: 40,
//         backgroundColor: ColorConst.whiteblue,
//         foregroundImage:
//             _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
//       ),



