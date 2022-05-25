import 'package:FlutterArchitecture/util/app_constants.dart';
import 'package:FlutterArchitecture/util/color_resources.dart';
import 'package:FlutterArchitecture/util/dimensions.dart';
import 'package:FlutterArchitecture/view/widgets/reusables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_widgets.dart';

class CategoriesDropdown extends StatelessWidget{
  final String title;

  const CategoriesDropdown({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: categoriesDropDownAppBar("${title}",context,IconButton(icon:Icon(Icons.search,color: ColorResources.appbarIconColor(context),),onPressed: (){},)),
      body: Column(
         children: [
           Material(
             color: ColorResources.appbarOptionsBg(context),
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 0),
               child:  Row(
                 children: [

                   Expanded(child: Material(
                     color: ColorResources.appbarOptionsBg(context),
                     child: InkWell(
                       splashColor: ColorResources.appbarSplashbg(context),
                       child:Padding(
                         padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL,horizontal: Dimensions.PADDING_SIZE_DEFAULT),

                       child: Row(
                         children: [
                           Icon(Icons.sort_outlined ,color: ColorResources.iconColor(context),),
                           Text(AppConstants.SORT_BY,style: TextStyle(color:ColorResources.getTextBg(context)),)
                         ],
                       ),),
                       onTap: (){

                       },
                     ),
                   )
                   ),
                   SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT ,),
                   Expanded(child: Material(
                     color: ColorResources.appbarOptionsBg(context),
                     child: InkWell(
                       splashColor: ColorResources.appbarSplashbg(context),
    child:Padding(
    padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT,vertical: Dimensions.PADDING_SIZE_SMALL),
                       child: Row(
                         mainAxisAlignment:MainAxisAlignment.center,
                         children: [
                           Icon(Icons.filter_alt_sharp,color: ColorResources.iconColor(context),),
                           Text(AppConstants.FILTER_BY,style: TextStyle(color:ColorResources.getTextBg(context)),)
                         ],
                       )),
                       onTap: (){

                       },
                     ),
                   )
                   )
                 ],
               ),
             ),
           ),
           Flexible(child: RefreshIndicator(
          displacement: 50,
          backgroundColor: Theme.of(context).primaryColor,
          color: ColorResources.normalTextbg(context),
          onRefresh: () async {
            return true;
          },child:ListView(
             physics: BouncingScrollPhysics(),
            children: [
              latestPosts("Plumber Needed","Nairobi CBD", "20,000-30,000","4",context),
              latestPosts("Electrician","Kasarani", "20,000-30,000","2",context),
              latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
              latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
              latestPosts("Plumber Needed","Nairobi CBD", "20,000-30,000","4",context),
              latestPosts("Electrician","Kasarani", "20,000-30,000","2",context),
              latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
              latestPosts("Mounting Tv","Zimmerman", "1,000-1,500","2",context),
            ],))
           )
         ],
        ),
    );
  }

}