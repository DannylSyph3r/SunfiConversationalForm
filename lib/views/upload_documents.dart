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
    final fileName = file != null ? basename(file!.path) : 'No Files Selected';

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
            primary: HexColor("#011A3C"),
          ),
          label: const Text("",
            style: TextStyle(
                fontSize: 9
            ),),
        ),
        title: Image.asset('assets/SunFiLogo/Logo Blue Blue with Transparent Background.png',
          fit: BoxFit.contain,
          height: 120,
        ),
        backgroundColor: HexColor('#E5E5E5'),
        elevation: 0,
      ),

      body: Container(
        child: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade900),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    WidgetSpan(child: Icon(EvaIcons.alertTriangleOutline)),
                                    TextSpan(text: ' Please upload a picture of yourself and the necessary documents to validate your', style: TextStyle(
                                      fontSize: 17
                                    ),),
                                    TextSpan(text: ' Identiy and Credit Information', style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17
                                    ),),
                                    TextSpan(text: ' to be able to qualify for access to an energy solution!', style: TextStyle(
                                      fontSize: 17
                                    ),),
                                    TextSpan(text: ' Please upload them one at a time',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      fontSize: 17
                                    ),),
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
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
                    padding: const EdgeInsets.only(top: 40,bottom: 20, left: 15, right: 15),
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
                  SizedBox(height: 50),
                  task != null ? buildUploadStatus(task!) : Container(),
                ],
              ),
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
        double progress = snap.bytesTransferred / snap.totalBytes;
        //final percentage = (progress * 100).toStringAsFixed(2);

        return SizedBox(
          height: 50,
          width: 300,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey,
                color: HexColor("#004AAD"),
                ),
              ),
              Center(
                child: Text(
                  '${(100 * progress).roundToDouble()}%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        );

        //return Text(
         // '$percentage %',
          //style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
       // );
      } else {
        return Container();
      }
    },
  );
}
