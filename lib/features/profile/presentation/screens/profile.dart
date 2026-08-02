import 'dart:io';
import 'package:ecommerce2/core/routes/routes.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:ecommerce2/features/profile/presentation/screens/image_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late File? _profileImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: _showImagePickerDialog,
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              ' Mina',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(
              'Minaromany@gmail.com',
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account'),
              onTap: () {},
            ),
            Divider(color: Colors.grey, thickness: .5),
            ListTile(
              leading: const Icon(Icons.location_on_rounded),
              title: const Text('Address'),
              onTap: () {},
            ),
            Divider(color: Colors.grey, thickness: .5),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            Divider(color: Colors.grey, thickness: .5),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                context.read<AuthCubit>().Logout();
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(Routes.login, (_) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose Image"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await ImageFunctions.getCamera();
                  if (image != null) {
                    setState(() {
                      _profileImage = image;
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await ImageFunctions.getGallery();
                  if (image != null) {
                    setState(() {
                      _profileImage = image;
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
