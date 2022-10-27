import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

import 'temperature.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required WeatherCondition condition,
    required DateTime? lastUpdated,
    required String location,
    required Temperature temperature,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  factory Weather.fromRepository(weather_repository.Weather weather) {
    return Weather(
      condition: weather.condition,
      lastUpdated: DateTime.now(),
      location: weather.location,
      temperature: Temperature(value: weather.temperature),
    );
  }

  static const empty = Weather(
    condition: WeatherCondition.unknown,
    lastUpdated: null,
    temperature: Temperature(value: 0),
    location: '--',
  );
}
