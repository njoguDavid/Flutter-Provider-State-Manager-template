import 'package:FlutterArchitecture/util/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingNearbyJobs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
          right: Dimensions.PADDING_SIZE_SMALL, left: 2, top: 2, bottom: 2),
      width: Dimensions.getSize(context).width / 2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 2.0,
            spreadRadius: 1.0,
            // offset: Offset(2.0, 2.0,), // shadow direction: bottom right
          )
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
          Shimmer.fromColors(
          baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
              child:Container(
                height: (Dimensions.getSize(context).width / 1.5) - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      // offset: Offset(2.0, 2.0,), // shadow direction: bottom right
                    )
                  ],
                ),
              )),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    right:Dimensions.PADDING_SIZE_EXTRA_SMALL ,
                    top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.PADDING_SIZE_EXTRA_SMALL ,
                          bottom: Dimensions.PADDING_SIZE_SMALL),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],child:Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey
                        ),
                      ),
                    )),
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
                     child: Container(
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                         color: Colors.grey
                        ),
                      ),)

                  ],
                ),
              )
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }

}