import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterbotv2/api/firebase_api.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UploadDocumentsView extends StatefulWidget {
  const UploadDocumentsView({Key? key}) : super(key: key);

  @override
  State<UploadDocumentsView> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocumentsView> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      backgroundColor: HexColor('#E5E5E5'),
      appBar: AppBar(
        centerTitle: true,
        leading: TextButton.icon(
          icon: const Icon(EvaIcons.arrowIosBackOutline),
          onPressed: () {
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          },
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
          label: const Text("",
            style: TextStyle(
                fontSize: 9
            ),),
        ),
        title: Image.asset('assets/SunFiLogo/Logo Yellow White with Transparent Background.png',
          fit: BoxFit.contain,
          height: 20.72,
        ),
        backgroundColor: HexColor("#011A3C"),
        elevation: 0,
      ),

      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,),
                child: ElevatedButton.icon(
                  onPressed: selectFile,
                  icon: const Icon(EvaIcons.attach),
                  label: const Text("Select Files", style: TextStyle(
                    fontSize: 17
                  ),),

                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#011A3C"),
                    fixedSize: const Size(380,60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
             SizedBox(height: 8),
             Text(
                fileName,
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
             ),
              Padding(
                padding: const EdgeInsets.only(top: 60,bottom: 50),
                child: ElevatedButton.icon(
                  onPressed: uploadFile,
                    icon: const Icon(EvaIcons.cloudUploadOutline),
                    label: const Text("Upload Files",
                    style: TextStyle(
                      fontSize: 17
                    ),),
                    style: ElevatedButton.styleFrom(
                    primary: HexColor("#011A3C"),
                    fixedSize: const Size(380,60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/SunFiDocuments/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final snap = snapshot.data!;
        final progress = snap.bytesTransferred / snap.totalBytes;
        final percentage = (progress * 100).toStringAsFixed(2);

        return Text(
          '$percentage %',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        );
      } else {
        return Container();
      }
    },
  );
}
