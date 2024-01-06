part of 'weather_bloc.dart';


sealed class WeatherEvent  extends Equatble{
   WeatherEvent();
  @override
  List<Object> get props=>[];
}
class Fetchweather extends WeatherEvent{
 final Position position;

  Fetchweather( this.position);
    @override
  List<Object> get props=>[Position];

  
}