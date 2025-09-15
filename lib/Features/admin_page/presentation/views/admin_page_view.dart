import 'package:auto_swift/Features/admin_page/data/repos/car_repo_impl.dart';
import 'package:auto_swift/Features/admin_page/presentation/view_models/car_cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_page/presentation/views/mobile/admin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminPageView extends StatelessWidget {
  const AdminPageView({super.key});
  static List<String> availableColors = ['red', 'black', 'blue'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Page"), centerTitle: true),
      body: BlocProvider(
        create: (context) => CarCubit(
          CarRepoImpl(firestore: FirebaseFirestore.instance, storage: FirebaseStorage.instance, picker: ImagePicker()),
        ),
        child: AdminPageMobileLayout(),
      ),
    );
  }
}
