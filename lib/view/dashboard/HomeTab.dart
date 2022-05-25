import 'package:flutter/material.dart';
import 'package:FlutterArchitecture/helper/svg_assets.dart';
import 'package:FlutterArchitecture/util/app_constants.dart';
import 'package:FlutterArchitecture/util/color_resources.dart';
import 'package:FlutterArchitecture/util/dimensions.dart';
import 'package:FlutterArchitecture/view/widgets/reusables.dart';

import 'home_widgets.dart';

class HomeTab extends StatelessWidget {
  // final ScrollController _scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: ColorResources.bgColor(context),
        body: RefreshIndicator(
            displacement: 50,
            backgroundColor: Theme.of(context).primaryColor,
            color: ColorResources.normalTextbg(context),
            onRefresh: () async {
              return true;
            },
            child: NestedScrollView(
              physics: BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
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
                                    child: searchTextField(
                                        searchController, context)),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 35 +
                                          MediaQuery.of(context).padding.top),
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
              body: Column(
                children: [
                  jobCategories(context),

                  // Flexible(child: Column(
                  //   children: [
                  //     ListView(
                  //       scrollDirection: Axis.horizontal,
                  //       children: [
                  //         latestPosts("Plumber Needed","Nairobi CBD", "20,000-30,000","4",context),
                  //         latestPosts("Electrician","Kasarani", "20,000-30,000","2",context),
                  //         latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
                  //         latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
                  //       ],
                  //     ),
                  //   ],
                  // )),
                  // ListView(
                  //   children: [
                  latestPosts("Plumber Needed", "Nairobi CBD", "20,000-30,000",
                      "4", context),
                  //     latestPosts("Electrician","Kasarani", "20,000-30,000","2",context),
                  //     latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
                  //     latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
                  //     latestPosts("Plumber Needed","Nairobi CBD", "20,000-30,000","4",context),
                  //     latestPosts("Electrician","Kasarani", "20,000-30,000","2",context),
                  //     latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
                  //     latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
                  //   ],
                  //
                  //
                  //
                  //
                  // ),
                ],
              ),
            )));
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 ||
        oldDelegate.minExtent != 50 ||
        child != oldDelegate.child;
  }
}
