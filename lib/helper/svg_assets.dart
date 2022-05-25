import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:FlutterArchitecture/util/color_resources.dart';

class SvgAsset {

  Widget filterIcon(BuildContext context) {
    return SvgPicture.asset("assets/images/filter.svg",
        color: ColorResources.iconColor(context),width: 30,height: 30, semanticsLabel: 'Icon');
  }
}