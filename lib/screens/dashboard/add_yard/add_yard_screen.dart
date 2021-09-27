import 'dart:io';

import 'package:flutter/material.dart';
import 'package:media_picker_widget/media_picker_widget.dart';
import 'package:vehicle_management/constants.dart';

class AddYardScreen extends StatefulWidget {
  static const routeName = '/add-yard';

  @override
  _AddYardScreenState createState() => _AddYardScreenState();
}

class _AddYardScreenState extends State<AddYardScreen> {
  File coverFile;

  String yardName;

  String managerName;

  String location;

  List<String> carsAvailable;

  List<String> employees;
  List<Media> mediaList = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Yard'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () async => openImagePicker(context, true),
            child: Container(
              height: size.width * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: coverFile == null
                  ? Center(
                      child: Text('Select the yard cover image'),
                    )
                  : Image.file(
                      coverFile,
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          //PROPERTY NAME
          Container(
            height: 50,
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor),
            child: TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please enter the name of the yard';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: 'Yard name',
                    helperStyle: TextStyle(color: kPrimary),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kPrimary, width: 1)),
                    border: InputBorder.none),
                onChanged: (text) => {
                      setState(() {
                        yardName = text;
                      })
                    }),
          ),
          Container(
            height: 50,
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor),
            child: TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please enter the name of manager';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: 'Manager name',
                    helperStyle: TextStyle(color: kPrimary),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kPrimary, width: 1)),
                    border: InputBorder.none),
                onChanged: (text) => {
                      setState(() {
                        managerName = text;
                      })
                    }),
          ),
          Container(
            height: 50,
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor),
            child: TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please enter the location of the yard';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: 'Location',
                    helperStyle: TextStyle(color: kPrimary),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kPrimary, width: 1)),
                    border: InputBorder.none),
                onChanged: (text) => {
                      setState(() {
                        location = text;
                      })
                    }),
          ),
        ],
      ),
    );
  }

  Future<void> openImagePicker(BuildContext context, bool isCover) async {
    // openCamera(onCapture: (image){
    //   setState(()=> mediaList = [image]);
    // });
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).pop(),
              child: DraggableScrollableSheet(
                initialChildSize: 0.6,
                maxChildSize: 0.95,
                minChildSize: 0.6,
                builder: (ctx, controller) => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    color: Theme.of(context).primaryColor,
                    child: MediaPicker(
                      scrollController: controller,
                      mediaList: mediaList,
                      onPick: (selectedList) {
                        setState(() => mediaList = selectedList);
                        if (isCover) {
                          coverFile = mediaList.first.file;
                          mediaList.clear();
                        }
                        mediaList.clear();

                        Navigator.pop(context);
                      },
                      onCancel: () => Navigator.pop(context),
                      mediaCount:
                          isCover ? MediaCount.single : MediaCount.multiple,
                      mediaType: MediaType.image,
                      decoration: PickerDecoration(
                        cancelIcon: Icon(Icons.close),
                        albumTitleStyle: TextStyle(fontWeight: FontWeight.bold),
                        actionBarPosition: ActionBarPosition.top,
                        blurStrength: 2,
                        completeText: 'Change',
                      ),
                    )),
              ));
        });
  }
}
