import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../theme.dart';

import '../../models/parking_spot_v2.dart';

import '../../widgets/animated_text_field.dart';
import '../widgets/create_spot_image_display.dart';
import '../../widgets/general_button.dart';
import '../../widgets/spot_carousel.dart';

// Enum for photo selection
enum PhotoOptions { camera, gallery, none }

class EditSpotScreen extends StatefulWidget {
  final ParkingSpotV2 spot;

  EditSpotScreen({this.spot});

  @override
  _EditSpotScreenState createState() => _EditSpotScreenState();
}

class _EditSpotScreenState extends State<EditSpotScreen> {
  TextEditingController _spotNameCtrl = TextEditingController();
  TextEditingController _addressCtrl = TextEditingController();
  TextEditingController _heightCtrl = TextEditingController();
  final FocusNode _spotNameNode = FocusNode();
  final FocusNode _addressNode = FocusNode();
  final FocusNode _heightNode = FocusNode();
  bool creatingSpot;

  // Init so when user dismisses camera/gallery prompt
  var selectedOption = PhotoOptions.none;

  // Images to create a spot (all are files)
  List<XFile> fileImages = [];

  // Function to obtain new image from camera or gallery
  Future<void> _getImage() async {
    selectedOption = PhotoOptions.none;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Adding a photo",
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        content: Text("Take a picture from your camera or gallery?"),
        actions: [
          TextButton(
              onPressed: () {
                selectedOption = PhotoOptions.camera;
                Navigator.of(context).pop();
              },
              child: Text(
                "Camera",
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),
          TextButton(
              onPressed: () {
                selectedOption = PhotoOptions.gallery;
                Navigator.of(context).pop();
              },
              child: Text(
                "Gallery",
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),
        ],
      ),
    );

    // Obtain picture via user selected option
    if (selectedOption != PhotoOptions.none) {
      final picker = ImagePicker();
      final userSource = selectedOption == PhotoOptions.camera
          ? ImageSource.camera
          : ImageSource.gallery;

      // Get image and append to list of images to be displayed
      final image = await picker.pickImage(source: userSource);

      // TODO: Convert all photos to common type (base64 string?) cannot combine dummy data
      if (image != null) {
        setState(() {
          fileImages.add(image);
        });
      }
    } else {
      print("User did not select an option");
    }
  }

  // Temp vars used before making changes to spot
  bool isOpen = true;
  List<String> spotImages = [];

  // TODO: Connect these two functions with the backend
  void _createSpot() {
    print("create a spot in the backend");
  }

  void _editSpot() {
    print("edit current spot in the backend");
    // Use "isOpen" and "spotImages"
  }

  @override
  void initState() {
    super.initState();

    // Set current mode: Edit or create
    creatingSpot = widget.spot == null ? true : false;

    // Set temp vars and init values for text fields when editing spot
    if (!creatingSpot) {
      _spotNameCtrl.text = widget.spot.name;
      _addressCtrl.text = widget.spot.address;
      _heightCtrl.text = widget.spot.height.toString();
      isOpen = !widget.spot.bought;
      spotImages = [...widget.spot.imageUrls];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              creatingSpot
                  ? CreateSpotImageDisplay(
                      images: fileImages,
                      getImage: _getImage,
                    )
                  : Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        SpotCarousel(
                          height: 40.h,
                          // Feed temp var into spot carousel for potential editing
                          // images: widget.spot.imageUrls,
                          images: spotImages,
                          fileImages: fileImages,
                          useFiles: creatingSpot,
                          editMode: true,
                          getImage: _getImage,
                        ),
                        // Back button
                        Positioned(
                          top: 2.h,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.chevron_left,
                              size: 43.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),

              // Screen title
              Container(
                margin: EdgeInsets.only(top: 2.h),
                // alignment: Alignment.centerLeft,
                child: Text(
                  creatingSpot ? "Create Spot" : "Edit Spot",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),

              GeneralButton(
                margin: EdgeInsets.only(top: 2.h),
                buttonLabel: isOpen ? "Open" : "Reserved",
                height: 4.h,
                width: 24.w,
                color: isOpen ? Colors.green : reservedColor,
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
              ),

              // Textfield for Spot name
              Align(
                // alignment: Alignment.centerLeft,
                child: AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.only(top: 3.h, left: 2.w),
                  textNode: _spotNameNode,
                  fieldController: _spotNameCtrl,
                  fieldLabel: "Spot Name",
                ),
              ),

              // Textfield for Spot address
              Align(
                // alignment: Alignment.centerLeft,
                child: AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.only(top: 3.h, left: 2.w),
                  textNode: _addressNode,
                  fieldController: _addressCtrl,
                  fieldLabel: "Spot Address",
                ),
              ),

              // Textfield for Spot max height
              Align(
                // alignment: Alignment.centerLeft,
                child: AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.only(top: 3.h, left: 2.w),
                  textNode: _heightNode,
                  fieldController: _heightCtrl,
                  fieldLabel: "Spot Max Height (cm)",
                  textInputType: TextInputType.number,
                ),
              ),
              GeneralButton(
                margin: EdgeInsets.symmetric(vertical: 2.h),
                buttonLabel: creatingSpot ? "Create Spot" : "Edit Spot",
                height: 5.h,
                width: 27.w,
                // TODO: Create spot in backend
                onTap: creatingSpot ? _createSpot : _editSpot,
              )
            ],
          ),
        ),
      ),
    );
  }
}
