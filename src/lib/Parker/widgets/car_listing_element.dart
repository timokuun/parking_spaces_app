import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../theme.dart';

// TODO: add bool for in activeSpotsScreen or in search result
class CarListingElement extends StatefulWidget {
  final String carModel;
  final String carYear;
  final String licensePlate;
  final String carImgUrl;

  CarListingElement(
      {this.carModel, this.carYear, this.licensePlate, this.carImgUrl});

  @override
  _CarListingElementState createState() => _CarListingElementState();
}

class _CarListingElementState extends State<CarListingElement> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        splashColor: customCyan,
        radius: 500.sp,
        onTap: () {},
        child: Container(
          height: 17.h,
          margin: EdgeInsets.symmetric(
            vertical: 2.5.h,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Car information
              Positioned(
                left: 2.5.w,
                child: Container(
                  height: 17.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    border: Border.all(
                      color: customCyan,
                      width: 1.5.sp,
                    ),
                    color: Colors.transparent,
                  ),
                  margin: EdgeInsets.only(
                    left: 8.w,
                  ),
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 5.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.carModel}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 0.75.h),
                            child: Text(
                              "${widget.carYear}",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Plate: ${widget.licensePlate}",
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                ),
              ),

              // Car Image
              Positioned(
                left: 2.5.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.sp),
                  child: Image.network(
                    "${widget.carImgUrl}",
                    height: 13.h,
                    width: 26.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Delete car button
              Positioned(
                right: 10.w,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                    size: 24.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
