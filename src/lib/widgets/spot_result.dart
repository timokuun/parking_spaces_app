import 'package:car_park_login/theme.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

// TODO: add bool for in activeSpotsScreen or in search result
class SpotResult extends StatelessWidget {
  final name;
  final address;
  final price;
  // final height;
  final imageUrl;

  const SpotResult({this.name, this.address, this.price = 0, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Inkwell not working?
    return InkWell(
      splashColor: customCyan,
      radius: 500,
      onTap: () {
        print("pressed");
      },
      child: Container(
        height: SizeConfig.screenHeight * 0.17,
        margin: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            // Spot information
            Positioned(
              left: 10,
              child: Container(
                  height: SizeConfig.screenHeight * 0.17,
                  width: SizeConfig.screenWidth * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: customCyan,
                      width: 2,
                    ),
                    color: Colors.transparent,
                  ),
                  margin: EdgeInsets.only(
                    left: 35,
                  ),
                  padding: EdgeInsets.only(
                    left: 85,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // TODO: Spacing is weird for price and height?
                      //        maybe left align with name/address?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$name",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "$address",
                            style: TextStyle(
                              color: Colors.grey[400],
                              // color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                  // color: Colors.grey,
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "\$$price/hr",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  // color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "150cm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            // TODO: Image (production) / Icon(development)
            Positioned(
              left: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "$imageUrl",
                  height: 110,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
