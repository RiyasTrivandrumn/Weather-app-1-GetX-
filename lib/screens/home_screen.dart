import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/widgets/Current_Weather_Widget.dart';
import 'package:weatherapp_starter_project/widgets/comfort_level_widget.dart';
import 'package:weatherapp_starter_project/widgets/daily_data_Widget.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Obx(
      () => globalController.checkLoading().isTrue
          ?  Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/clouds.png",height: 200,width: 200,),
                  CircularProgressIndicator()
                ],
              )
            )
          : Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const HeaderWidget(),
                  //for the current temp('value from model current')
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalController.getData().getCurrentWeather(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HourlyDataWidget(
                      weatherdataHourly:
                          globalController.getData().getHourlyWeather()),
                  DailyDataWidget(
                    weatherDataDaily:
                        globalController.getData().getDailyWeather(),
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Comfortlevel(weatherDataCurrent: globalController.getData().getCurrentWeather())
                ],
              ),
            ),
    )));
  }
}
