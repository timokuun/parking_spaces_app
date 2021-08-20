import 'package:car_park_login/widgets/animated_text_field.dart';
import 'package:car_park_login/widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EditSpotScreen extends StatefulWidget {
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // TODO: Convert to SpotCarousel once a photo is added
                  Container(
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
                        onPressed: () {},
                      ),
                    ),
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
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.only(top: 3.h, left: 2.w),
                  textNode: _spotNameNode,
                  fieldController: _spotNameCtrl,
                  fieldLabel: "Spot Name",
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.only(top: 3.h, left: 2.w),
                  textNode: _addressNode,
                  fieldController: _addressCtrl,
                  fieldLabel: "Spot Address",
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.only(top: 3.h, left: 2.w),
                  textNode: _heightNode,
                  fieldController: _heightCtrl,
                  fieldLabel: "Spot Height (cm)",
                ),
              ),
              GeneralButton(
                margin: EdgeInsets.symmetric(vertical: 2.h),
                buttonLabel: "Create Spot",
                height: 5.h,
                width: 27.w,
                // TODO: Create spot in backend
                onTap: () {
                  print("Spot Created!");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
