import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';

import '../models/parking_spot_V2.dart';

// TODO: Convert image lists to final once completely coverted to files
class SpotCarousel extends StatefulWidget {
  final double height;
  List<String> images;
  List<XFile> fileImages;
  final Function getImage;
  final bool editMode;
  final bool useFiles;

  // TODO: Convert to XFiles, away from network images
  SpotCarousel({
    Key key,
    @required this.height,
    this.images,
    this.fileImages,
    @required this.getImage,
    this.editMode = false,
    this.useFiles = false,
  }) : super(key: key);

  @override
  _SpotCarouselState createState() => _SpotCarouselState();
}

class _SpotCarouselState extends State<SpotCarousel> {
  int _current = 0;

  // Temp vars used before making changes to spot
  List<String> editedImages = [];

  @override
  void initState() {
    super.initState();
    editedImages = widget.images;
    // print("At render of spot carousel: ${widget.fileImages.length}");
    if (widget.fileImages == null) widget.fileImages = [];
    if (widget.images == null) widget.images = [];
  }

  // Called to delete image at current index of carousel
  void _deletePic() {
    setState(() {
      widget.useFiles
          ? widget.fileImages.removeAt(_current)
          : widget.images.removeAt(_current);
      _current = _current == 0 ? 0 : _current - 1;
    });
  }

  // TODO: Correct the page indicator for spot pictures
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              height: widget.height,
              aspectRatio: 1.3,
              viewportFraction: 1,
              autoPlay: false,
              scrollPhysics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),

            // TODO: convert to use type "File" for user camera/gallery pics
            items: widget.useFiles
                // Images are files, using FileImage()
                ? widget.fileImages.map(
                    (e) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                // TODO: temp usage of Network Image, spots images will only be files
                                image: FileImage(File(e.path)),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      );
                    },
                  ).toList()

                // Images are from internet, using NetworkImage()
                : widget.images.map(
                    (e) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                // TODO: temp usage of Network Image, spots images will only be files
                                image: NetworkImage(e),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.useFiles
              // Use fileImages list for image indices
              ? widget.fileImages.map((url) {
                  int index = widget.fileImages.indexOf(url);
                  return Container(
                    width: 5.sp,
                    height: 5.sp,
                    margin: EdgeInsets.symmetric(
                        vertical: 0.75.h, horizontal: 0.5.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                  );
                }).toList()

              // Use network images list for image indices
              : widget.images.map((url) {
                  int index = widget.images.indexOf(url);
                  return Container(
                    width: 5.sp,
                    height: 5.sp,
                    margin: EdgeInsets.symmetric(
                        vertical: 0.75.h, horizontal: 0.5.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                  );
                }).toList(),
        ),

        // TODO: Cannot have both carousels in one, must split them FileCarousel and NetworkCarousel
        if (widget.editMode &&
            (widget.images.length > 1 || widget.fileImages.length > 1))
          // Delete button
          Positioned(
            right: 4.w,
            top: 4.h,
            child: Material(
              type: MaterialType.transparency,
              child: IconButton(
                padding: EdgeInsets.zero,
                highlightColor: Theme.of(context).primaryColor,
                // TODO: Correct deleting pic, carousel does NOT update despite setState()
                onPressed: () {
                  print("delete pic");
                  _deletePic();
                  // print("deleted: ${widget.images.length}");
                },
                icon: Icon(
                  Icons.clear,
                  size: 30.sp,
                ),
              ),
            ),
          ),
        if (widget.editMode)
          // TODO: Fix add/delete buttons splash on click
          // Add button
          Positioned(
            right: 4.w,
            bottom: 2.h,
            child: Material(
              type: MaterialType.transparency,
              borderRadius: BorderRadius.circular(20.sp),
              child: IconButton(
                padding: EdgeInsets.zero,
                highlightColor: Theme.of(context).primaryColor,
                // TODO: Implement adding pic with ImagePicker
                onPressed: widget.getImage,
                icon: Icon(
                  Icons.add,
                  size: 30.sp,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
