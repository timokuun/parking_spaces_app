import 'package:car_park_login/theme.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

class SpotResult extends StatelessWidget {
  const SpotResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.20,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Spot information
          Positioned(
            left: 20,
            child: Container(
              height: SizeConfig.screenHeight * 0.20,
              width: SizeConfig.screenWidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(
                left: 20,
              ),
              padding: EdgeInsets.only(
                left: 70,
                right: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        "Address",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        "Height",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // TODO: Image (production) / Icon(development)
          Positioned(
            left: 20,
            child: ClipRect(
              child: Image.network(
                "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png",
                height: SizeConfig.screenHeight * 0.07,
                color: customCyan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
