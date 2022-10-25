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
  int activePage = 1;
  int totalPage=1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [Container(color: Colors.black,height: 98,),
          Expanded(
            child: PageView.builder(
                dragStartBehavior: DragStartBehavior.down,
                itemCount: widget.imgObjs.length,
                pageSnapping: true,
                physics: ScrollPhysics(),
                controller: _pageController,
                onPageChanged: (page) {
                  if (mounted){
                    setState(() {
                    activePage = page;
                    activePage= activePage+1;
                    totalPage = widget.imgObjs.length;
                  });
                  }
                  
                },
                itemBuilder: (context, pagePosition) {
                  return Container(
                     
                      // margin: EdgeInsets.all(10),
                      child: Image.file(File(widget.imgObjs[pagePosition].originalPath)));
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,6, 8.0, 20),
            child: Container(
            height: 30.0,
            width: 50,
            color: Colors.transparent,
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                )
              ),
              child: Center(
              child: Text("$activePage / $totalPage"),
             )
                   ),
                  ),
          ),
          Expanded(
            flex: -3,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              // color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ElevatedButton(onPressed: (){},style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(78, 10)),) , child:Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon( Icons.arrow_back,size: 27,),
                      SizedBox(height: 2,),
                      Text('Back',style: TextStyle(fontSize: 12),)
                      ],
                    )
                    ),
                    SizedBox(width: 1,),
                    ElevatedButton(onPressed: (){},style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(78, 10)),) ,child:Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon( Icons.transform,size: 27,),
                      SizedBox(height: 2,),
                      Text('Edit',style: TextStyle(fontSize: 12),),
                      ],
                    )
                    ),SizedBox(width: 1,),
                    ElevatedButton(onPressed: (){},style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(78, 10)),) , child:Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon( Icons.share,size: 27,),
                      SizedBox(height: 2,),
                      Text('Share',style: TextStyle(fontSize: 12),)
                      ],
                    )
                    ),SizedBox(width: 1,),
                    ElevatedButton(onPressed: (){},style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(78, 10)),) , child:Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon( Icons.save_sharp,size: 27,),
                      SizedBox(height: 2,),
                      Text('Save',style: TextStyle(fontSize: 12),)
                      ],
                    )
                    ),SizedBox(width: 1,),
                    ElevatedButton(onPressed: (){},style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(78, 10)),) , child:Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon( Icons.drive_file_rename_outline_rounded,size: 27,),
                      SizedBox(height: 2,),
                      Text('Rename',style: TextStyle(fontSize: 12),)
                      ],
                    )
                    ),SizedBox(width: 1,),
                  ],
                ),
              )
              // ListView.builder(
              //         itemCount: _items.length,
              //         shrinkWrap: true,
              //         scrollDirection: Axis.horizontal,
              //         itemBuilder: (_, index) {
              //           return GestureDetector(
              //             onTap: () {
              //               for (int i = 0; i < _items.length; i++) {
              //                 setState(() {
              //                   if (index == i) {
              //                     _items[index].isSelected = true;
              //                   } else {
              //                     //the condition to change the highlighted item
              //                     _items[i].isSelected = false;
              //                   }
              //                 });
              //               }
              //             },
              //             child: Row(
              //               children: [
              //                 Container(
              //                   width: 100,
              //                   height: MediaQuery.of(context).size.height,
              //                   color: _items[index].isSelected
              //                       ? Colors.blueAccent
              //                       : Colors.white,
              //                   child: Container(child: Icon(_items[index].icon),),

              //                   // ListTile(
              //                     //   //i want to display different items for each list in the leading property.
              //                     //   leading: Icon(_items[index].icon),
              //                     //   title: Text(_items[index].title),
              //                     // ),
              //                 ),
              //               ],
              //             ),
              //           );
              //         }),

            ),
          ),
          SizedBox(
            height: 5,
          )
            
        ],
      ),
    );
    
  } 
}