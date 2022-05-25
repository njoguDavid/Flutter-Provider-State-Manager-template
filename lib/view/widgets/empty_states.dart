import 'package:FlutterArchitecture/util/color_resources.dart';
import 'package:FlutterArchitecture/util/custom_theme.dart';
import 'package:FlutterArchitecture/util/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String msg;

  const EmptyState({Key key, this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Center(
          child: Image(
            image: AssetImage(AppImages.emptyState2),
            height: size.width / 1.5,
            width: size.width / 1.5,
          ),
        ),
        Text(
          "$msg",
          style: itemsCardTitle.apply(
            color: ColorResources.getTextBg(context),
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
