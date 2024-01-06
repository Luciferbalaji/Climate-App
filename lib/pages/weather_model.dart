import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:climate_app/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
Widget getWeatherIcon(int code) {
  if (code >= 200 && code < 300) {
    return Image.asset('assets/1.png');
  } else if (code >= 300 && code < 400) {
    return Image.asset('assets/2.png');
  } else if (code >= 500 && code < 600) {
    return Image.asset('assets/3.png');
  } else if (code >= 600 && code < 700) {
    return Image.asset('assets/4.png');
  } else if (code >= 700 && code < 800) {
    return Image.asset('assets/5.png');
  } else if (code == 800) {
    return Image.asset('assets/6.png');
  } else if (code > 800 && code <= 804) {
    return Image.asset('assets/7.png');
  } else {
    return Image.asset('assets/7.png');
  }
}




   String getGreeting() {
    var currentTime = DateTime.now();
    var formatter = DateFormat('HH');
    var hour = int.parse(formatter.format(currentTime));

    if (hour < 12) {
      return 'Good morning!';
    } else if (hour < 17) {
      return 'Good afternoon!';
    } else if (hour < 20) {
      return 'Good evening!';
    } else {
      return 'Good night!';
    }
  }

  @override
  Widget build(BuildContext context) {
     String greeting = getGreeting();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.blueAccent, shape: BoxShape.circle),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.blueAccent, shape: BoxShape.circle),
                ),
              ),

              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.rectangle),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100,
                  sigmaY: 100,
                ),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              //
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if(state is Weathersucess)
                  {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Text(
                          '📍' '${state.weather.areaName}',
                          style: const TextStyle(fontSize:16,
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          greeting,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                       // Image.asset('assets/3.png'),
                        getWeatherIcon(state.weather.weatherConditionCode!),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text(
                           '${state.weather.temperature!.celsius!.round()}' ' °C',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize:
                                45,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        //
                         Center(
                          child: Text(
                            state.weather.weatherMain!.toUpperCase(),
                            style:const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        //
                        const SizedBox(
                          height: 8,
                        ),

                        Center(
                          child: Text(
                            DateFormat('EEEE  dd').add_jm().format(state.weather.date!),
                            style:const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // First Row
                            Row(
                              children: [
                                Image.asset(
                                  'assets/11.png',
                                  scale: 8,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'sunrise',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                       DateFormat().add_jm().format(state.weather.sunrise!),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Second Row
                            Row(
                              children: [
                                Image.asset(
                                  'assets/12.png',
                                  scale: 8,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'sunset',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        DateFormat().add_jm().format(state.weather.sunset!),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        //divider
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                        ),

                        //over
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // First Row
                            Row(
                              children: [
                                Image.asset(
                                  'assets/13.png',
                                  scale: 8,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'temp max',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${state.weather.tempMax!.celsius!.round()}' '°C',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Second Row
                            Row(
                              children: [
                                Image.asset(
                                  'assets/14.png',
                                  scale: 8,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'temp min',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${state.weather.tempMin!.celsius!.round()}''°C',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                  }else{
                    return Container();
                  }
    },
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
