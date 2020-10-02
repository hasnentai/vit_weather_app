import 'package:flutter/material.dart';
import 'package:vit_weatherapp/service/weather_data_service.dart';
import 'package:vit_weatherapp/utils/weather_app_colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherHome(),
    );
  }
}

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  String description;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    WeatherService().getWeather().then((value) {
      print(value.desc);
      this.setState(() {
        description = value.desc;
        this.isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: weatherAppBar(),
        body: !isLoading
            ? weatherAppBody()
            : Center(child: CircularProgressIndicator()));
  }

  /// Build App body
  Widget weatherAppBody() {
    return Center(
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(gradient: bgcolor),
        child: ListView(
          children: [
            mainTemp(),
            mainTempInText(),
            SizedBox(
              height: 150.0,
            ),
            buildTodaysInfo(),
            Divider(
              color: Colors.white,
            ),
            for (int i = 0; i < 7; i++) ...[buildFutureInfo()],
            Divider(
              color: Colors.white,
            ),
            iconsInfoBuilder(),
            SizedBox(
              height: 20.0,
            ),
            iconsInfoBuilder()
          ],
        ),
      ),
    );
  }

  /// Build the icons info,
  Widget iconsInfoBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(WeatherIcons.wi_thermometer, color: Colors.white),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "23\u02DA",
              style: commonTextStyle,
            )
          ],
        ),
        Column(
          children: [
            Icon(WeatherIcons.wi_time_11, color: Colors.white),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "23\u02DA",
              style: commonTextStyle,
            )
          ],
        ),
        Column(
          children: [
            Icon(WeatherIcons.wi_volcano, color: Colors.white),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "23\u02DA",
              style: commonTextStyle,
            )
          ],
        )
      ],
    );
  }

  /// Build future weather;
  ///
  Widget buildFutureInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [
          Text(
            "Sun",
            style: commonTextStyle,
          ),
          Spacer(),
          Icon(
            WeatherIcons.wi_sunrise,
            color: Colors.white,
          ),
          Spacer(),
          Text(
            "20\u02DA",
            style: commonTextStyle,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "27\u02DA",
            style: commonTextStyle,
          ),
        ],
      ),
    );
  }

  /// Build todays info;
  Widget buildTodaysInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Text(
            "Sat",
            style: commonTextStyle,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "Today",
            style: commonTextStyle,
          ),
          Spacer(),
          Text(
            "20\u02DA",
            style: commonTextStyle,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "27\u02DA",
            style: commonTextStyle,
          ),
        ],
      ),
    );
  }

  /// Bild Main temp text
  Widget mainTempInText() {
    return Center(
      child: Text(
        description,
        style: commonTextStyle,
      ),
    );
  }

  /// Build main temp builder
  Widget mainTemp() {
    return Center(
      child: Text(
        "21\u02DA",
        style: TextStyle(
            color: Colors.white, fontSize: 100.0, fontWeight: FontWeight.w100),
      ),
    );
  }

  /// Build App Bar for home page
  Widget weatherAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: appBarBG,
      title: Text("Bangalore"),
      elevation: 0,
    );
  }
}
