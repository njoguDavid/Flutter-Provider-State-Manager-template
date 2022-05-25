import 'dart:ffi';

import 'package:FlutterArchitecture/helper/svg_assets.dart';
import 'package:FlutterArchitecture/util/app_constants.dart';
import 'package:FlutterArchitecture/util/color_resources.dart';
import 'package:FlutterArchitecture/util/custom_theme.dart';
import 'package:FlutterArchitecture/util/dimensions.dart';
import 'package:FlutterArchitecture/util/images.dart';
import 'package:FlutterArchitecture/view/dashboard/categories/CategoriesDropdown.dart';
import 'package:FlutterArchitecture/view/dashboard/shimmers/dashboard_shimmers.dart';
import 'package:FlutterArchitecture/view/widgets/reusables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import 'categories/categories_menu.dart';
import 'home_widgets.dart';

class JobsTab extends StatefulWidget {
  JobsTabState createState() => JobsTabState();
}

class JobsTabState extends State<JobsTab> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
      body: SlidingUpPanel(
        panel: Padding(
          padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT),
          child: LoadCategoriesMenu(),
        ),
        collapsed: Container(
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: radius),
            child: Column(
              children: [
                // GrabbingWidget(),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 70,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Text(
                  AppConstants.CATEGORIES,
                  style: titleHead.apply(
                    color: ColorResources.getTextBg(context),
                  ),
                  textScaleFactor: 1.3,
                )
              ],
            )),
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                brightness: Brightness.dark,
                backgroundColor: ColorResources.homeContainerBg(context),
                expandedHeight: 150 + MediaQuery.of(context).padding.top,
                floating: false,
                pinned: true,
                elevation: 0,
                title: Text(
                  'Home',
                ),
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.PADDING_SIZE_DEFAULT,
                            right: Dimensions.PADDING_SIZE_DEFAULT,
                            top: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                                child:
                                    searchTextField(searchController, context)),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 35 + MediaQuery.of(context).padding.top),
                              child: SvgAsset().filterIcon(context),
                            )
                          ],
                        ),
                      ),

//ViewCustomer()
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleNearbyJobs(AppConstants.ExploreNearby),
                      IconButton(
                          onPressed: () {

                          }, icon: Icon(Icons.arrow_forward,color:  ColorResources.iconColor(context),))
                    ],
                  ),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: Dimensions.getSize(context).width / 1.5,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: NearbyJobs(),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleNearbyJobs(AppConstants.LATESTPOST),
                      IconButton(
                          onPressed: () {
                          viewAllPosts("Latest Posts");
                          }, icon: Icon(Icons.arrow_forward,color:  ColorResources.iconColor(context),))
                    ],
                  ),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: Dimensions.getSize(context).width / 1.5,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: NearbyJobs(),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleNearbyJobs(AppConstants.NEARWORKERS),
                      IconButton(
                          onPressed: () {
                          }, icon: Icon(Icons.arrow_forward,color:  ColorResources.iconColor(context),))
                    ],
                  ),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: Dimensions.getSize(context).width / 1.5,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: NearbyWorkers(),
                    )),
                SizedBox(
                  height: 120,
                )
              ],
            ),
          ),
        ),
        borderRadius: radius,
      ),
    );
  }

  titleNearbyJobs(String msg) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_DEFAULT,
          horizontal: Dimensions.PADDING_SIZE_DEFAULT),
      child: Row(
        children: [
          Text(
            msg,
            style: titleHead.apply(
              color: ColorResources.getTextBg(context),
            ),
            textScaleFactor: 1.3,
          )
        ],
      ),
    );
  }

  //navigate to view all posts in dropdown list
  void viewAllPosts(String _title){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CategoriesDropdown(
          title:"$_title",
        )));
  }
}

class GrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(blurRadius: 25, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 70,
            height: 7,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 2,
            margin: EdgeInsets.all(15).copyWith(top: 0, bottom: 0),
          )
        ],
      ),
    );
  }
}

class NearbyJobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      primary: false,
      children: [
        LoadingNearbyJobs(),
        jobItem(context, AppImages.slide1, "Plumber needed ", "Roysambu,Nairobi"),
        jobItem(context, AppImages.slide2, "Plumber needed Urgently",
            "Kasarani,Nairobi"),
        jobItem(context, AppImages.topBarImage, "Plumber needed",
            "Zimmerman,Nairobi")
      ],
    );
  }

  Widget jobItem(
      BuildContext context, String image, String title, String desc) {
    // margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
    // elevation: 4,
    //shadowColor: Colors.grey.shade200,
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
              Container(
                height: (Dimensions.getSize(context).width / 1.5) - 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
                    image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: Text("$title",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: itemsCardTitle.apply(
                              color: ColorResources.getTextBg(context)),
                          textScaleFactor: 1.1),
                    ),
                    Row(children: [
                      SizedBox(
                        width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                      ),
                      Expanded(
                          child: Text(
                        desc,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorResources.hintTextColor(context)),
                      ))
                    ]),
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

class NearbyWorkers extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
     scrollDirection: Axis.horizontal,
     primary: false,
     children: [
       workerItem(context, AppImages.slide1, "Plumber", "Mwiki,Nairobi","+254719415471"),
       workerItem(context, AppImages.slide1, "Driver", "Zimmermann,Nairobi","+254719415471"),
       workerItem(context, AppImages.slide1, "ECD Teacher", "Kasarani,Nairobi","+254719415471"),
     ],
   );
  }

  Widget workerItem(
      BuildContext context, String image, String title, String desc,String phone) {
    // margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
    // elevation: 4,
    //shadowColor: Colors.grey.shade200,
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
              Container(
                height: (Dimensions.getSize(context).width / 1.5) - 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: Text("$title",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: itemsCardTitle.apply(
                              color: ColorResources.getTextBg(context)),
                          textScaleFactor: 1.1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_SMALL,
                          right:  Dimensions.PADDING_SIZE_SMALL,
                          bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: callButton(context, null, phone),
                    ),
                    Row(children: [
                      SizedBox(
                        width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                      ),
                      Expanded(
                          child: Text(
                            desc,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ColorResources.hintTextColor(context)),
                          ))
                    ]),
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

  Widget callButton(BuildContext context,Function function,String phoneNumber){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 0),
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
            primary: ColorResources.buttonColor(context)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.call,color: ColorResources.iconColor(context),),
              Text(
                  AppConstants.CALL,
                  style: itemsCardTitle.apply(color: Colors.white)
              ),

            ],
          ),
        ),
      ),
    );
  }


}
