// ignore_for_file: prefer_const_constructors, unused_local_variable

// import 'package:advance_image_picker/models/image_object.dart';
import 'package:advance_image_picker/advance_image_picker.dart' as i;
import 'package:advance_image_picker/models/image_object.dart';
import 'package:flutter/material.dart';
import 'package:pdf_maker/camera_screen.dart';
import 'package:pdf_maker/expandable_fab.dart';
import 'package:image_picker/image_picker.dart'as d;
import 'package:advance_image_picker/widgets/picker/image_picker.dart';
import 'package:pdf_maker/file_view.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // List<ImageObject> _imgObjs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pdf Maker'),
        ),
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: ((context, index) {
              return Container(
                height: 20,
                width: 50,
                child: Text('hiiii $index'),
              );
            })),
        // Container(child: Text('hielo')),

        floatingActionButton: ExpandableFab(
          // ignore: sort_child_properties_last
          children: [
            ActionButton(
              icon: Icon(Icons.camera),
              onPressed: ()async {
                 selectByCamera();
                List<ImageObject> _imgObjs = await Navigator.of(context)
              .push(PageRouteBuilder(pageBuilder: (context, animation, __) {
            return  i.ImagePicker(maxCount: 19);
          }));
          Navigator.push(context,MaterialPageRoute(builder: (context) => FileView(imgObjs: _imgObjs)));

              }
            ),
            ActionButton(
              icon: Icon(Icons.image_outlined),
              onPressed: () async {
                var gallery = await d.ImagePicker().pickMultiImage();
              },
            )
          ],
          distance: 112,
        ));
  }
}
