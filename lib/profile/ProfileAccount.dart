import 'package:FlutterArchitecture/util/color_resources.dart';
import 'package:FlutterArchitecture/view/widgets/reusables.dart';
import 'package:flutter/material.dart';

class ProfileAccount extends StatefulWidget {
  ProfileAccountState createState() => ProfileAccountState();
}

class ProfileAccountState extends State<ProfileAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar("Account Profile", context),
        body: Column(
          children: [
            Stack(children: [
              Container(
                color: ColorResources.containerColour,
                height: 100,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50.0,
                      backgroundImage: AssetImage(
                        'assets/images/user.jpg',
                      ),
                    ),
                    Text("Name"),
                    Text("Admin Profile")
                  ]),
                ),
              )
            ]),
            Flexible(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [],
                ),
              ),
            ))
          ],
        ));
  }
}
