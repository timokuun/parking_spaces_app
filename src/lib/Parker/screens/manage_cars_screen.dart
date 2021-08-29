import 'package:flutter/material.dart';

import '../widgets/car_listing_element.dart';

// TODO: Add list of cars to user provider
class ManageCarsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        title: Text(
          "Manage Cars",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CarListingElement(
            carModel: "Chevy Camaro",
            carYear: "2015",
            carImgUrl:
                "https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
            licensePlate: "1234567",
          ),
          CarListingElement(
            carModel: "Hyundai G70",
            carYear: "2019",
            carImgUrl:
                "https://media.wired.com/photos/5d09594a62bcb0c9752779d9/1:1/w_1500,h_1500,c_limit/Transpo_G70_TA-518126.jpg",
            licensePlate: "7654321",
          ),
          CarListingElement(
            carModel: "Chevy Camaro",
            carYear: "2015",
            carImgUrl:
                "https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
            licensePlate: "1234567",
          ),
          CarListingElement(
            carModel: "Hyundai G70",
            carYear: "2019",
            carImgUrl:
                "https://media.wired.com/photos/5d09594a62bcb0c9752779d9/1:1/w_1500,h_1500,c_limit/Transpo_G70_TA-518126.jpg",
            licensePlate: "7654321",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
        // TODO: Add Create car screen
        onPressed: () {},
      ),
    );
  }
}
