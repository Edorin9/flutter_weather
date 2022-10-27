import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/weather/weather.dart';

void main() {
  group('WeatherEvent', () {
    test('SearchSubmitted toJson/fromJson works properly', () {
      const event = WeatherEvent.searchSubmitted('');
      expect(WeatherEvent.fromJson(event.toJson()), event);
    });

    test('PageRefreshed toJson/fromJson works properly', () {
      const event = WeatherEvent.pageRefreshed();
      expect(WeatherEvent.fromJson(event.toJson()), event);
    });

    test('UnitsToggled toJson/fromJson works properly', () {
      const event = WeatherEvent.unitsToggled();
      expect(WeatherEvent.fromJson(event.toJson()), event);
    });
  });
}
