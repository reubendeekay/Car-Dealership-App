import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:media_picker_widget/media_picker_widget.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/models/property_model.dart';
import 'package:vehicle_management/models/vehicle_model.dart';
import 'package:vehicle_management/providers/location_provider.dart';

import 'package:vehicle_management/screens/property_details/vehicle_details_screen.dart';

class AddVehicle extends StatefulWidget {
  static const routeName = '/add-property';
  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  VehicleModel vehicle;
  File coverFile;
  List<File> fileImages;
  String model;
  String manufacturer;
  String yearOfManufacture;
  String regNo;
  String trackingNo;
  String dateOfImport;
  String coverImage;
  String description;
  String price;
  String category;
  List<String> images;
  String location;
  String status;
  double longitude;
  double latitude;
  List<Offer> offers;
  VehicleFeatures features;
  List<Media> mediaList = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locData = Provider.of<LocationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey[50],
        elevation: 0,
        title: Text(
          'Add Vehicle Details',
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          children: [
//COVER IMAGE
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
                        child: Text('Select the cover image'),
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
                      return 'Please enter the vehicle model';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Car model',
                      helperStyle: TextStyle(color: kPrimary),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kPrimary, width: 1)),
                      border: InputBorder.none),
                  onChanged: (text) => {
                        setState(() {
                          model = text;
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
                  maxLines: null,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter the registration no';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Registration Number',
                      helperStyle: TextStyle(color: kPrimary),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kPrimary, width: 1)),
                      border: InputBorder.none),
                  onChanged: (text) => {
                        setState(() {
                          regNo = text;
                        })
                      }),
            ),

            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: TextFormField(
                  maxLines: null,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter the description';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Detailed description',
                      helperStyle: TextStyle(color: kPrimary),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kPrimary, width: 1)),
                      border: InputBorder.none),
                  onChanged: (text) => {
                        setState(() {
                          description = text;
                        })
                      }),
            ),

            Container(
                // height: 50,
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text('\t\tSelect the category'),
                    isExpanded: true,
                    onChanged: (val) {
                      setState(() {
                        category = val;
                      });
                    },
                    value: category,
                    items: categories
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(fontSize: 15),
                              ),
                            ))
                        .toList(),
                  ),
                )),

            Container(
              height: 50,
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: TextFormField(
                  maxLines: null,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter the price';
                    }
                    if (double.parse(val) < 1) {
                      return 'Please enter a valid price';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Price',
                      helperStyle: TextStyle(color: kPrimary),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kPrimary, width: 1)),
                      border: InputBorder.none),
                  onChanged: (text) => {
                        setState(() {
                          price = text;
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
                  maxLines: null,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter the manufacturer';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Manufacturer',
                      helperStyle: TextStyle(color: kPrimary),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kPrimary, width: 1)),
                      border: InputBorder.none),
                  onChanged: (text) => {
                        setState(() {
                          manufacturer = text;
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
                  maxLines: null,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter the year of manufacture';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Year of manufacture',
                      helperStyle: TextStyle(color: kPrimary),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kPrimary, width: 1)),
                      border: InputBorder.none),
                  onChanged: (text) => {
                        setState(() {
                          yearOfManufacture = text;
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
                  maxLines: null,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter the current location';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Current Location',
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

            Container(
              height: 50,
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: TextFormField(
                  maxLines: null,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter the date of import';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Date of import',
                      helperStyle: TextStyle(color: kPrimary),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kPrimary, width: 1)),
                      border: InputBorder.none),
                  onChanged: (text) => {
                        setState(() {
                          dateOfImport = text;
                        })
                      }),
            ),

            // Divider(),

            // Container(
            //   width: size.width,
            //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //   child: Row(
            //     children: [
            //       Text(
            //         locData.longitude != null && locData.latitude != null
            //             ? 'Selected at (${locData.latitude.toStringAsFixed(2)}, ${locData.longitude.toStringAsFixed(2)})'
            //             : 'Select on map',
            //         style: TextStyle(
            //             fontSize: locData.longitude != null &&
            //                     locData.latitude != null
            //                 ? 15
            //                 : 24,
            //             fontWeight: locData.longitude != null &&
            //                     locData.latitude != null
            //                 ? FontWeight.bold
            //                 : FontWeight.w500,
            //             color: locData.longitude != null &&
            //                     locData.latitude != null
            //                 ? Colors.green
            //                 : Colors.black),
            //       ),
            //       Spacer(),
            //       IconButton(
            //           onPressed: () => Navigator.of(context)
            //                   .pushNamed(AddOnMap.routeName, arguments: {
            //                 'lat': latitude,
            //                 'lon': longitude,
            //               }),
            //           icon: Icon(Icons.map))
            //     ],
            //   ),
            // ),
            // Divider(),

            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Add more photos',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            if (fileImages == null)
              IconButton(
                onPressed: () async => await openImagePicker(context, false),
                icon: Icon(
                  Icons.add,
                  size: 36,
                ),
              ),
            if (fileImages != null)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      fileImages.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        height: 150,
                        width: 150,
                        child: Image.file(
                          fileImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            SizedBox(
              height: 30,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: size.width * 0.8,
              height: 50,
              child: RaisedButton(
                color: fileImages != null &&
                        coverFile != null &&
                        model != null &&
                        price != null &&
                        manufacturer != null &&
                        regNo != null &&
                        description != null
                    // locData.latitude != null &&
                    // locData.longitude != null
                    ? kPrimary
                    : Colors.grey,
                onPressed: () async {
                  final property = VehicleModel(
                    coverFile: coverFile,
                    fileImages: fileImages,
                    model: model,
                    price: price,
                    manufacturer: manufacturer,
                    regNo: regNo,
                    description: description,
                    location: location,
                    dateOfImport: dateOfImport,
                    yearOfManufacture: yearOfManufacture,
                    coverImage: coverImage,
                  );

                  if (fileImages != null &&
                      coverFile != null &&
                      model != null &&
                      price != null &&
                      manufacturer != null &&
                      regNo != null &&
                      description != null) {
                    Navigator.of(context).pushNamed(
                        VehicleDetailsScreen.routeName,
                        arguments: property);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Fill in all the fields'),
                    ));
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Preview',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  List<String> categories = [
    'Sedan',
    'SUV',
    'Sports',
    'Convertible',
    'Hatchback',
    'Minivan',
  ];

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
                        } else {
                          fileImages =
                              mediaList.map((media) => media.file).toList();
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
