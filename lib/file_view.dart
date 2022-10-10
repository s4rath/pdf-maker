import 'dart:io';

import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FileView extends StatefulWidget {
  FileView({super.key, required this.imgObjs});
  List<ImageObject> imgObjs = [];

  @override
  State<FileView> createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  late PageController _pageController;
  int activePage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PageView.builder(
            dragStartBehavior: DragStartBehavior.down,
            itemCount: widget.imgObjs.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              if (mounted){
                setState(() {
                activePage = page;
              });
              }
              
            },
            itemBuilder: (context, pagePosition) {
              return Container(
                  color: Color.fromARGB(37, 22, 109, 122),
                  margin: EdgeInsets.all(10),
                  child: Image.file(File(widget.imgObjs[pagePosition].originalPath)));
            }),
      ),
    );
  }
}
