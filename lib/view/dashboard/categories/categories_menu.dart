import 'dart:convert';

import 'package:FlutterArchitecture/data/model/categories_model.dart';
import 'package:FlutterArchitecture/view/dashboard/categories/categories_list.dart';
import 'package:FlutterArchitecture/view/widgets/reusables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadCategoriesMenu extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // final data = jsonDecode(categoriesMap.toString());
    // data.map((map) => CategoriesModel.fromJson(map)).toList();
    // print(data.length);

    return FutureBuilder(future: categoriesJson(),
        builder: (context, snapshot) {
          if (snapshot.data==null) {
            return Center(child: Text("no data"));
          } else  {
            print("data builder==>${snapshot.data[0].name}");
            return
              Padding(padding: const EdgeInsets.all(10),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,
                mainAxisSpacing: 10,),itemCount: snapshot.data.length, itemBuilder: (context,index)=>gridItem(snapshot.data[index].image,snapshot.data[index].name,Colors.deepOrange,null)),
              );

          }
    });
  }

}

Future<dynamic>categoriesJson()async{
  List<CategoriesModel>listCat=[];
  final jsondata = await rootBundle.loadString('assets/json/categories.json');
  print("data==>${jsondata}");
  final listData = json.decode(jsondata);
  print("data raw==>${listData}");
  for(Map d in listData["categories"]){
    print("data==>pp}");
    listCat.add(CategoriesModel.fromJson(d));
  }

  // final listData = json.decode(jsondata) as List<dynamic>;
  // listData.map((map) => CategoriesModel.fromJson(map)).toList();
   print("data==>${listCat.length}");
return listCat;
}