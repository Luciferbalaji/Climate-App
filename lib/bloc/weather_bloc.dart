import 'package:bloc/bloc.dart';
import 'package:climate_app/data/data.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial())  {
    on<Fetchweather>((event, emit) async{
      emit(Weatherloading());
      try {
        WeatherFactory wf =WeatherFactory(url,language: Language.ENGLISH);
      
       Weather weather = await wf.currentWeatherByLocation(event.position.latitude,
       event.position.latitude);
       print(weather);

     emit(Weathersucess(weather));
      } catch (e) {
        emit(Weatherfail());
        
        
      }
    });
  }
}
