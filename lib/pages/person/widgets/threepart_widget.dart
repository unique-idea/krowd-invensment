import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

import '../../../controller/person_controller/person_control.dart';

Widget buildThreePartItem(
  String imagePath,
  String text,
  Icon icon,
  double paddingLeft,
  String typeEvent,
  BuildContext context,
  Map<String, dynamic>? userData,
  VoidCallback setUpdateImage,
) =>
    Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          width: 15,
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        buildCatchEventIcon(
            icon, paddingLeft, typeEvent, context, userData, setUpdateImage)
      ],
    );

Widget buildCatchEventIcon(
        Icon icon,
        double paddingLeft,
        String typeEvent,
        BuildContext context,
        Map<String, dynamic>? userData,
        VoidCallback setUpdateImage) =>
    GestureDetector(
      onTap: () {
        if (typeEvent == "Image") {
          showImageInputPopup(
              context, userData!['avatar'], userData, setUpdateImage);
        }
      },
      child: Container(
        height: 20,
        width: 40,
        margin: EdgeInsets.fromLTRB(paddingLeft, 10, 0, 12),
        child: icon,
      ),
    );

void showImageInputPopup(BuildContext context, String currentImage,
    Map<String, dynamic>? userData, VoidCallback setUpdate) {
  final personControl = PersonControl();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final picker = ImagePicker();
      File? pickedImage;
      double dialogHeight = 150.0;

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text("Update Image"),
            backgroundColor: Colors.pink,
            content: Container(
              height: dialogHeight,
              color: Colors.pink,
              child: Column(
                children: [
                  if (pickedImage != null)
                    Image.file(
                      pickedImage!,
                      width: 150,
                      height: 100,
                    ),
                  if (currentImage.isNotEmpty && pickedImage == null)
                    currentImage.contains("/data")
                        ? Image(
                            image: FileImage(File(currentImage)),
                            height: 100,
                            width: 150,
                          )
                        : Image(
                            image: AssetImage(currentImage),
                            height: 100,
                            width: 150,
                          ),
                  ElevatedButton(
                    onPressed: () async {
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);

                      if (pickedFile != null) {
                        setState(() {
                          pickedImage = File(pickedFile.path);
                        });
                      }
                    },
                    child: const Text("Choose Image"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (pickedImage != null) {
                    final appDir = await getApplicationDocumentsDirectory();
                    final imagesDir = Directory('${appDir.path}/images');
                    if (!await imagesDir.exists()) {
                      imagesDir.create(recursive: true);
                    }

                    final fileName =
                        'image_${DateTime.now().millisecondsSinceEpoch}.png';
                    final imagePath = '${imagesDir.path}/$fileName';

                    await pickedImage!.copy(imagePath);

                    final imageFile = File(imagePath);
                    final isImageSaved = await imageFile.exists();
                    if (isImageSaved) {
                      bool isSuccess = await personControl.submitDataImage(
                          userData, imagePath, context);
                      if (isSuccess) {
                        log('Image saved successfully: $imagePath');
                      }
                      setUpdate();
                      Navigator.pop(context);
                    } else {
                      log('Failed to save image');
                    }
                  } else {
                    bool isSuccess = await personControl.submitDataImage(
                        userData, userData!['avatar'], context);
                    if (isSuccess) {
                      log('Image saved successfully: ' +
                          userData!['avatar'].toString());
                    }
                    Navigator.pop(context);
                    setUpdate();
                  }
                },
                child:
                    const Text("Save", style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Go Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
