import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_camera_demo/screens/captures_screen.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PreviewScreen extends StatelessWidget {

  // final List<File> fileList;
  final File imageFile;

  const PreviewScreen({

    // required this.fileList,
    required this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image gallery'),
        elevation: 0,
        backgroundColor: Colors.black87,

      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(
          //           builder: (context) => CapturesScreen(
          //             imageFileList: fileList,
          //           ),
          //         ),
          //       );
          //     },
          //     child: Text('Go to all captures'),
          //     style: TextButton.styleFrom(
          //       primary: Colors.black,
          //       backgroundColor: Colors.white,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: PhotoViewGallery.builder(
          //       scrollDirection:  Axis.horizontal ,
          //       itemCount: 5,
          //       builder: (context, index) {
          //         final imagelist = fileList[index];
          //
          //         return PhotoViewGalleryPageOptions(
          //             imageProvider:FileImage(imagelist),
          //             minScale: PhotoViewComputedScale.contained,
          //             maxScale: PhotoViewComputedScale.contained * 4);
          //       }),
          // ),

          Expanded(
            child: InteractiveViewer(
              panEnabled: false, // Set it to false
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.1,
              maxScale: 5,
              child: Image.file(
                imageFile,
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
