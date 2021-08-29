import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/animated_text_field.dart';
import '../widgets/general_button.dart';

// Enum for photo selection
enum PhotoOptions { camera, gallery, none }

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  TextEditingController _phoneCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _usernameCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  final FocusNode _phoneNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _usernameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var selectedOption = PhotoOptions.none;
  XFile userImage;

  // Attempts to make changes to account
  void _submitChanges() {
    if (_formKey.currentState.validate()) {
      // Save current user input
      _formKey.currentState.save();

      // Save edited account info to DB to be saved
      print("input valid, submit to DB");
    } else {
      // snackbar notifying user that input is incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Invalid input",
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }

  // Function to obtain new image from camera or gallery
  Future<void> _getImage() async {
    selectedOption = PhotoOptions.none;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Adding a photo",
          style: TextStyle(color: Theme.of(context).accentColor),
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
            ),
          ),
          TextButton(
            onPressed: () {
              selectedOption = PhotoOptions.gallery;
              Navigator.of(context).pop();
            },
            child: Text(
              "Gallery",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
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
          userImage = image;
        });
      }
    } else {
      print("User did not select an option");
    }
  }

  // TODO: Add username/email etc... to a provider to load in
  @override
  void initState() {
    super.initState();
    _phoneCtrl.text = "(123) 456-7890";
    _emailCtrl.text = "tester@gmail.com";
    _usernameCtrl.text = "tester1";
    _passwordCtrl.text = "tester";
  }

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _phoneNode.dispose();
    _emailCtrl.dispose();
    _emailNode.dispose();
    _usernameCtrl.dispose();
    _usernameNode.dispose();
    _passwordCtrl.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        title: Text(
          "Edit Account",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          // Edit Account Form
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3.h),

                  // TODO: Use actual user profile image
                  // TODO: complete implementation of ImagePicker once method to store images is decided
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 40.sp,
                      ),
                      Positioned(
                        bottom: -0.5.h,
                        child: TextButton(
                          child: Text(
                            "Edit Image",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          style: TextButton.styleFrom(
                            minimumSize: Size(50.w, 5.h),
                            backgroundColor: Theme.of(context)
                                .backgroundColor
                                .withOpacity(0.3),
                          ),
                          onPressed: _getImage,
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  textNode: _phoneNode,
                  fieldController: _phoneCtrl,
                  fieldLabel: "Phone #",
                  textInputAction: TextInputAction.next,
                ),
                AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  textNode: _emailNode,
                  fieldController: _emailCtrl,
                  fieldLabel: "Email",
                  textInputAction: TextInputAction.next,
                ),
                AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  textNode: _usernameNode,
                  fieldController: _usernameCtrl,
                  fieldLabel: "Username",
                  textInputAction: TextInputAction.next,
                ),
                AnimatedTextField(
                  width: 75.w,
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  textNode: _passwordNode,
                  fieldController: _passwordCtrl,
                  isPassword: true,
                  fieldLabel: "Password",
                  textInputAction: TextInputAction.done,
                ),
                GeneralButton(
                  buttonLabel: "Save Changes",
                  height: 5.h,
                  width: 30.w,
                  onTap: _submitChanges,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
