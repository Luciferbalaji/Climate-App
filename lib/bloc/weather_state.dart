part of 'weather_bloc.dart';


sealed class WeatherState extends Equatble {}

class Equatble {
  List<Object> get props=>[];
}

final class WeatherInitial extends WeatherState {}

final class Weatherloading extends WeatherState {}
final class Weatherfail extends WeatherState {}
final class Weathersucess extends WeatherState {


final Weather weather;
  Weathersucess( this.weather);
  @override
  List<Object> get props=>[Weather];

}
