import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterArchitecture/util/color_resources.dart';
import 'package:FlutterArchitecture/util/custom_theme.dart';
import 'package:FlutterArchitecture/util/dimensions.dart';
import 'package:FlutterArchitecture/util/images.dart';

Widget latestPosts(@required String title, String location, String wage,
    String hrs, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
        left: Dimensions.PADDING_SIZE_EXTRA_SMALL,
        top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
        bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
    child: ConstrainedBox(
      constraints: BoxConstraints(minHeight: 120),
      child: Material(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Material(
                  color: ColorResources.orangeTheme,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4)),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(AppImages.slide3),
                        width: 100,
                        height: 100,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5, bottom: 5),
                                child: Text("$title",
                                    style: itemsCardTitle.apply(
                                        color:
                                            ColorResources.getTextBg(context)),
                                    textScaleFactor: 1.1),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 20,
                                  ),
                                  Text(
                                    location,
                                    style: TextStyle(
                                        color: ColorResources.hintTextColor(
                                            context)),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5, top: 5),
                                child: Text("KES $wage",
                                    style: itemsCardTitle,
                                    textScaleFactor: 1.1),
                              ),
                            ],
                          ),
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 0, top: 0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  size: 20,
                                ),
                                Text("$hrs hrs",
                                    style: itemsCardTitle.apply(
                                        color: ColorResources.hintTextColor(
                                            context)),
                                    textScaleFactor: 1.1),
                              ],
                            )),
                        flex: 1,
                      )
                    ],
                  )
                ],
              ))
            ],
          ),
          onTap: () {

          },
        ),
      ),
    ),
  );
}
