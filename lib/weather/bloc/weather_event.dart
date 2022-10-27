part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.searchSubmitted(String? city) = SearchSubmitted;

  const factory WeatherEvent.pageRefreshed() = PageRefreshed;

  const factory WeatherEvent.unitsToggled() = UnitsToggled;

  factory WeatherEvent.fromJson(Map<String, dynamic> json) =>
      _$WeatherEventFromJson(json);
}
