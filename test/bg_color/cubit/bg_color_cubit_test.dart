import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/bg_color/cubit/bg_color_cubit.dart';
import 'package:flutter_weather/weather/weather.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/hydrated_bloc.dart';

class MockWeather extends Mock implements Weather {
  MockWeather(this._condition);

  final WeatherCondition _condition;

  @override
  WeatherCondition get condition => _condition;
}

void main() {
  initHydratedStorage();

  group('BgColorCubit', () {
    test('initial state is correct', () {
      expect(BgColorCubit().state, BgColorCubit.defaultColor);
    });

    group('toJson/fromJson', () {
      test('work properly', () {
        final themeCubit = BgColorCubit();
        expect(
          themeCubit.fromJson(themeCubit.toJson(themeCubit.state)),
          themeCubit.state,
        );
      });
    });

    group('updateBgColor', () {
      final clearWeather = MockWeather(WeatherCondition.clear);
      final snowyWeather = MockWeather(WeatherCondition.snowy);
      final cloudyWeather = MockWeather(WeatherCondition.cloudy);
      final rainyWeather = MockWeather(WeatherCondition.rainy);
      final unknownWeather = MockWeather(WeatherCondition.unknown);

      blocTest<BgColorCubit, Color>(
        'emits correct color for WeatherCondition.clear',
        build: BgColorCubit.new,
        act: (cubit) => cubit.updateBgColor(clearWeather),
        expect: () => <Color>[Colors.orangeAccent],
      );

      blocTest<BgColorCubit, Color>(
        'emits correct color for WeatherCondition.snowy',
        build: BgColorCubit.new,
        act: (cubit) => cubit.updateBgColor(snowyWeather),
        expect: () => <Color>[Colors.lightBlueAccent],
      );

      blocTest<BgColorCubit, Color>(
        'emits correct color for WeatherCondition.cloudy',
        build: BgColorCubit.new,
        act: (cubit) => cubit.updateBgColor(cloudyWeather),
        expect: () => <Color>[Colors.blueGrey],
      );

      blocTest<BgColorCubit, Color>(
        'emits correct color for WeatherCondition.rainy',
        build: BgColorCubit.new,
        act: (cubit) => cubit.updateBgColor(rainyWeather),
        expect: () => <Color>[Colors.indigoAccent],
      );

      blocTest<BgColorCubit, Color>(
        'emits correct color for WeatherCondition.unknown',
        build: BgColorCubit.new,
        act: (cubit) => cubit.updateBgColor(unknownWeather),
        expect: () => <Color>[BgColorCubit.defaultColor],
      );
    });
  });
}
