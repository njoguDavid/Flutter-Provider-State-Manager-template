import 'package:FlutterArchitecture/helper/shared_pref.dart';
import 'package:FlutterArchitecture/view/dashboard/JobsTab.dart';
import 'package:FlutterArchitecture/view/widgets/empty_states.dart';
import 'package:FlutterArchitecture/view/widgets/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:FlutterArchitecture/util/color_resources.dart';

String dashboardRoute = "DashboardScreen";

class DashboardScreen extends StatefulWidget {
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.rectangle;

  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);

  Color unselectedColor = Colors.blueGrey;
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  @override
  void initState() {
    SharedPref.isFirstTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color selectedColor = ColorResources.selectedTabColor(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: AnimatedContainer(
        color: containerColor ?? containerColors[0],
        duration: const Duration(seconds: 1),
        child: switchPage(_selectedItemPosition),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 80,
        behaviour: snakeBarStyle,
        snakeShape: SnakeShape.circle,
        // shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        padding: EdgeInsets.zero,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.blueGrey,

        ///configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: true,
        showSelectedLabels: true,

        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'History'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.deepOrange), label: 'Post'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Account'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Messages')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }

  Widget switchPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return JobsTab();
        break;
      case 1:
        return Scaffold(
          appBar: topAppBar(
              "History",
              context,
              null,
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: null,
              )),
          body: Align(
            alignment: Alignment.center,
            child: EmptyState(msg: "Coming soon"),
          ),
        );
        break;
      case 2:
        return JobsTab();
        break;
      case 3:
        return JobsTab();
      case 4:
        return Scaffold(
          appBar: topAppBar(
              "Notifications",
              context,
              null,
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: null,
              )),
          body: Align(
            alignment: Alignment.center,
            child: EmptyState(msg: "Coming soon"),
          ),
        );
        break;
    }
  }
}

class PagerPageWidget extends StatelessWidget {
  final String text;
  final String description;
  final Image image;
  final TextStyle titleStyle =
      const TextStyle(fontSize: 40, fontFamily: 'Poppins');
  final TextStyle subtitleStyle = const TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w200,
  );

  const PagerPageWidget({
    Key key,
    this.text,
    this.description,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _portraitWidget()
              : _horizontalWidget(context);
        }),
      ),
    );
  }

  Widget _portraitWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(text, style: titleStyle),
            const SizedBox(height: 16),
            Text(description, style: subtitleStyle),
          ],
        ),
        image
      ],
    );
  }

  Widget _horizontalWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(text, style: titleStyle),
              Text(description, style: subtitleStyle),
            ],
          ),
        ),
        Expanded(child: image)
      ],
    );
  }
}
