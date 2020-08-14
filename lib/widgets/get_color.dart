import 'package:gradient_appbar/sample_data.dart';

class GetColorsState {}

class GetColorsUnInitial extends GetColorsState {}

class GetColorsLoading extends GetColorsState {}

class GetColorsSuccess extends GetColorsState {
  List<ColorInformation> colors;
  GetColorsSuccess({this.colors}) : assert(colors != null);
}

class GetColorsError extends GetColorsState {}
