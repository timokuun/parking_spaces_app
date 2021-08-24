import 'package:car_park_login/widgets/spot_carousel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';

// Enum for photo selection
enum PhotoOptions { camera, gallery, none }

class CreateSpotImageDisplay extends StatefulWidget {
  // Function to obtain image using ImagePicker
  final Function getImage;
  // Pass through images list since edit screen handles spot creation
  final List<XFile> images;

  CreateSpotImageDisplay({@required this.images, @required this.getImage});

  @override
  _CreateSpotImageDisplayState createState() => _CreateSpotImageDisplayState();
}

class _CreateSpotImageDisplayState extends State<CreateSpotImageDisplay> {
  @override
  void initState() {
    super.initState();
    print("IMAGES LEN INSIDE OF DISPLAY ${widget.images.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // TODO: Convert to SpotCarousel once a photo is added
        widget.images.isEmpty
            ? Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    15.sp,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      fixedSize: Size(35.w, 5.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.sp),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.edit),
                        Text(
                          "Add a photo!",
                          style: TextStyle(
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    // TODO: Use ImagePicker package to take pic or select from user gallery
                    onPressed: widget.getImage,
                  ),
                ),
              )

            // Once images are added by user, display them
            : SpotCarousel(
                height: 40.h,
                fileImages: widget.images,
                editMode: true,
                useFiles: true,
                images: [],
                getImage: widget.getImage,
              ),

        // Back button
        Positioned(
          top: 1.h,
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
    );
  }
}
