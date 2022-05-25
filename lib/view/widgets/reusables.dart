import 'package:flutter/material.dart';
import 'package:FlutterArchitecture/provider/theme_provider.dart';
import 'package:FlutterArchitecture/util/color_resources.dart';
import 'package:FlutterArchitecture/util/custom_theme.dart';
import 'package:provider/provider.dart';


Widget topAppBar(String title,BuildContext  context,Widget leading,Widget action){
  return AppBar(
      title: Text(title,style: TextStyle(color:ColorResources.normalTextbg(context) ),),
      centerTitle: true,
      backgroundColor: Provider.of<ThemeProvider>(context).darkTheme ? Colors.black : null,
      brightness: Provider.of<ThemeProvider>(context).darkTheme ?Brightness.light : Brightness.dark ,
      elevation: 0,
      leading: leading??null,
    actions: [
      action
    ],

  );
}

Widget defaultAppBar(String title,BuildContext  context){
  return AppBar(
    title: Text(title,style: TextStyle(color:ColorResources.normalTextbg(context) ),),
    centerTitle: true,
    backgroundColor: Provider.of<ThemeProvider>(context).darkTheme ? Colors.black : null,
    brightness: Provider.of<ThemeProvider>(context).darkTheme ?Brightness.dark : Brightness.light,
    elevation: 0,
  );
}

Widget topSliversBar(String title,BuildContext  context){
  return AppBar(
    title: Text(title,style: TextStyle(color:ColorResources.normalTextbg(context) ),),
    centerTitle: true,
    backgroundColor: Provider.of<ThemeProvider>(context).darkTheme ? Colors.black : null,
    elevation: 0,

  );
}

Widget categoriesDropDownAppBar(String title,BuildContext  context,Widget action){
  return AppBar(
    title: Text(title,style: TextStyle(color:ColorResources.normalTextbg(context) ),),
    centerTitle: true,
    backgroundColor: Provider.of<ThemeProvider>(context).darkTheme ? Colors.black : null,
    brightness: Provider.of<ThemeProvider>(context).darkTheme ?Brightness.light : Brightness.dark ,
    elevation: 0,
    actions: [
      action
    ],

  );
}


Widget searchTextField(TextEditingController searchController, BuildContext context){

  return Container(
    margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    padding: EdgeInsets.only(bottom: 10, top: 40),
    height: 100,
    alignment: Alignment.center,
    child: Row(children: [
      SizedBox(width: 10),
      Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0)),
          child: TextFormField(
            controller: searchController,
            onFieldSubmitted: (query) {
             // _runFilter(query);
            },
            onChanged: (query) {
             // _runFilter(query);
            },
            textInputAction: TextInputAction.search,
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                hintText:
                "Search..",
                isDense: true,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorResources.iconColor(context),
                )),
          ),
        ),
      ),
      SizedBox(width: 10),
    ]),
  );
}

Widget jobCategories(BuildContext context){
  return GridView.count(
       shrinkWrap: true,
      // physics: const ClampingScrollPhysics(),
     primary: false,
    //physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(10),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    crossAxisCount: 3,
    children: <Widget>[
      gridItem( "", "Electrical", Colors.deepOrange, null),

      gridItem( "", "Building Construction", Colors.deepOrange, null),
      gridItem( "", "Plumbing", Colors.deepOrange, null),
      gridItem( "", "Carpentry", Colors.deepOrange, null),
      gridItem( "", "Office Assistant", Colors.deepOrange, null),
      gridItem( "", "Survey", Colors.deepOrange, null),

      gridItem( "", "House Manager", Colors.deepOrange, null),
      gridItem( "", "Electrical", Colors.deepOrange, null)

    ],
  );
}

Widget gridItem(String image,String msg, Color color,Function function){
  return ConstrainedBox(constraints: BoxConstraints(
    minHeight: 120
  ),
  child: Container(
    decoration: BoxDecoration(
      color: color??Colors.white,
      borderRadius: BorderRadius.circular(5.0),

      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 2.0,
          spreadRadius: 1.0,
          // offset: Offset(2.0, 2.0,), // shadow direction: bottom right
        )
      ],
    ),
    padding: const EdgeInsets.all(5),

    child: Column(
      children: [
        Text(getLetters(msg),style: menuHead,textScaleFactor: 2.5,),
        Expanded(child: Text(msg,overflow: TextOverflow.fade,textAlign: TextAlign.center,))

      ],
    ),

  ),
  );
}

String getLetters(String title) {
  if (title.contains(" ")) {
    var titleList = title.split(' ');
    switch(titleList.length){
      case 1:
        return title.substring(0, 1).toUpperCase();
        break;
      case 2:
        try {
          return titleList[0].substring(0, 1).toUpperCase() + titleList[1].substring(0, 1).toLowerCase();
        } catch (e) {

          return title.substring(0, 1).toUpperCase();
        }
        break;

      case 3:
        try {
          return titleList[0].substring(0, 1).toUpperCase() + titleList[2].substring(0, 1).toLowerCase();
        } catch (e) {
          return title.substring(0, 1).toUpperCase();
        }
        break;

      default:
        return title.substring(0, 1).toUpperCase();
        break;
    }
//     if (titleList.length > 1) {
//       try {
//         return titleList[0].substring(0, 1).toUpperCase() + titleList[1].substring(0, 1).toLowerCase();
//       } catch (e) {
// print(titleList);
//         return "-";
//       }
//     } else {
//       try {
//         return titleList[0].substring(0, 1).toUpperCase()+titleList[0].substring(0, 1).toLowerCase();
//       } catch (e) {
//         return "-";
//       }
//     }
  } else {
    return title.substring(0, 1).toUpperCase();
  }
}

Widget slivers(){
  return   NestedScrollView(
  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
  return <Widget>[
  SliverAppBar(
  brightness: Brightness.dark,
  backgroundColor: ColorResources.appbarColor(context),
  expandedHeight: 200,
  floating: false,
  pinned: true,
  title: Text(
  'Home',
  ),
  centerTitle: true,

  flexibleSpace: FlexibleSpaceBar(
  background: Column(
  children: [
  SizedBox(
  height: MediaQuery.of(context).padding.top + 60,
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


  ],
  ),
  );
}
