import 'dart:io';

import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FileView extends StatefulWidget {
  FileView({super.key, required this.imgObjs});
  List<ImageObject> imgObjs = [];

  @override
  State<FileView> createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            GridView.builder(
                shrinkWrap: true,
                itemCount: widget.imgObjs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisSpacing: 2, crossAxisSpacing: 2),
                itemBuilder: (BuildContext context, int index) {
                  final image = widget.imgObjs[index];
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image.file(File(image.modifiedPath),
                        height: 80, fit: BoxFit.cover),
                  );
                }),
          ],
        ),
      ),
    );
  }
}