part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(WeatherStatus.initial) WeatherStatus status,
    @Default(TemperatureUnits.celsius) TemperatureUnits temperatureUnits,
    @Default(Weather.empty) Weather weather,
  }) = _WeatherState;

  factory WeatherState.initial() => const WeatherState();

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);
}
