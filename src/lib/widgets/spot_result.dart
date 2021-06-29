import 'package:car_park_login/theme.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

class SpotResult extends StatelessWidget {
  const SpotResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.17,
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Spot information
          Positioned(
            left: 20,
            child: Container(
                height: SizeConfig.screenHeight * 0.17,
                width: SizeConfig.screenWidth * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: customCyan,
                    width: 3,
                  ),
                  color: Colors.transparent,
                ),
                margin: EdgeInsets.only(
                  left: 35,
                ),
                padding: EdgeInsets.only(
                  left: 80,
                  right: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "University of California, San Diego",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "123 University Ave, La Jolla CA 92092",
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "\$2/hr",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
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
                        )
                      ],
                    )
                  ],
                )),
          ),
          // TODO: Image (production) / Icon(development)
          Positioned(
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                // "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png",
                "https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
