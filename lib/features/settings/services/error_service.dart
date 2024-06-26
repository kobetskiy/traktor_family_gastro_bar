import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';

class ErrorService {
  final _storage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<String> _uploadImageToStorage(String child, Uint8List? image) async {
    final ref = _storage.ref().child(child);
    final uploadTask = ref.putData(image!);
    final downloadedURL = await (await uploadTask).ref.getDownloadURL();
    return downloadedURL;
  }

  Future<void> sendError({
    required String text,
    required Uint8List? image
  }) async {
    String? imageURL = image != null
        ? await _uploadImageToStorage('error/${image.hashCode}', image)
        : null;
    await _firestore.collection(DatabaseCollections.errorsCollection).add({
      'text': text,
      'imageURL': imageURL,
    });
  }

  Future<Uint8List?> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      return await file.readAsBytes();
    }
    return null;
  }

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
