import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/component/getColors.dart';
import 'package:weather_app/models/WeatherData.dart';
import 'package:weather_app/models/state_condition%20_model.dart';
import 'package:weather_app/remote/api_manager.dart';

class WeatherScreen extends StatelessWidget {
  // WeatherData weatherData = WeatherData();
  String cityName;
  WeatherScreen(this.cityName);



  @override
  Widget build(BuildContext context) {
    return FutureBuilder <WeatherData>(
      future: ApiManager.getCityWeather(cityName.toLowerCase().trim()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text('Somethimg went Wrong', style: GoogleFonts.dancingScript(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),),
                SizedBox(height: 5),
                ElevatedButton(onPressed: () {

                }, child: Text('Start New Search',),),
              ],
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors(snapshot.data?.current?.condition?.text ?? ''),),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(snapshot.data?.location?.name ?? '', style: GoogleFonts.anton(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data?.location?.region ?? '', style: GoogleFonts.anton(
                        fontSize: 15,

                      ),),
                      Text(',', style: GoogleFonts.anton(
                        fontSize: 15,

                      ),),
                      SizedBox(width: 5),
                      Text(snapshot.data?.location?.country ?? '', style: GoogleFonts.anton(
                        fontSize: 15,

                      ),),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Latitude: ${snapshot.data?.location?.lat}" ?? '', style: GoogleFonts.anton(
                          fontSize: 12
                      ),),
                      Text(','),
                      SizedBox(width: 5),
                      Text("Longitude: ${snapshot.data?.location?.lon}" ?? '', style: GoogleFonts.anton(
                          fontSize: 12
                      ),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Temp: ${snapshot.data?.current?.tempC.toString()}' ?? '', style: GoogleFonts.teko(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                      Text('Humidity: ${snapshot.data?.current?.humidity.toString()}%' ?? '', style: GoogleFonts.teko(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  SizedBox(height: 20),
                  Image.asset(StateConditionModel.getImage(snapshot.data?.current?.condition?.text ?? ''),),
                  SizedBox(height: 20),
                  Text(snapshot.data?.current?.condition?.text ?? '', style: GoogleFonts.teko(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10),
                  Text('Last Update: ${snapshot.data?.current?.lastUpdated}' ?? '' , style: GoogleFonts.teko(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),




              ],
            ),
          ),
        );
      },
    );
  }
}
