import 'dart:ui';

class ColorInformation {
  final int id;
  final String name;
  final Color color;

  const ColorInformation({
    this.id,
    this.name,
    this.color,
  });
}

const colors = [
  ColorInformation(
    id: 0,
    name: 'Black',
    color: Color(0xFF000000),
  ),
  ColorInformation(
    id: 1,
    name: 'Maroon',
    color: Color(0xFF800000),
  ),
  ColorInformation(
    id: 2,
    name: 'Green',
    color: Color(0xFF008000),
  ),
  ColorInformation(
    id: 3,
    name: 'Olive',
    color: Color(0xFF808000),
  ),
  ColorInformation(
    id: 4,
    name: 'Navy',
    color: Color(0xFF000080),
  ),
  ColorInformation(
    id: 5,
    name: 'Purple',
    color: Color(0xFF800080),
  ),
  ColorInformation(
    id: 6,
    name: 'Teal',
    color: Color(0xFF008080),
  ),
  ColorInformation(
    id: 7,
    name: 'Silver',
    color: Color(0xFFC0C0C0),
  ),
  ColorInformation(
    id: 8,
    name: 'Grey',
    color: Color(0xFF808080),
  ),
  ColorInformation(
    id: 9,
    name: 'Red',
    color: Color(0xFFFF0000),
  ),
  ColorInformation(
    id: 10,
    name: 'Lime',
    color: Color(0xFF00FF00),
  ),
  ColorInformation(
    id: 11,
    name: 'Yellow',
    color: Color(0xFFFFFF00),
  ),
  ColorInformation(
    id: 12,
    name: 'Blue',
    color: Color(0xFF0000FF),
  ),
  ColorInformation(
    id: 13,
    name: 'Fuchsia',
    color: Color(0xFFFF00FF),
  ),
  ColorInformation(
    id: 14,
    name: 'Aqua',
    color: Color(0xFF00FFFF),
  ),
  ColorInformation(
    id: 15,
    name: 'White',
    color: Color(0xFFFFFFFF),
  ),
  ColorInformation(
    id: 16,
    name: 'Grey0',
    color: Color(0xFF000000),
  ),
  ColorInformation(
    id: 17,
    name: 'NavyBlue',
    color: Color(0xFF00005F),
  ),
  ColorInformation(
    id: 18,
    name: 'DarkBlue',
    color: Color(0xFF000087),
  ),
  ColorInformation(
    id: 19,
    name: 'Blue3',
    color: Color(0xFF0000AF),
  ),
  ColorInformation(
    id: 20,
    name: 'Blue3',
    color: Color(0xFF0000D7),
  ),
  ColorInformation(
    id: 21,
    name: 'Blue1',
    color: Color(0xFF0000FF),
  ),
  ColorInformation(
    id: 22,
    name: 'DarkGreen',
    color: Color(0xFF005F00),
  ),
  ColorInformation(
    id: 23,
    name: 'DeepSkyBlue4',
    color: Color(0xFF005F5F),
  ),
  ColorInformation(
    id: 24,
    name: 'DeepSkyBlue4',
    color: Color(0xFF005F87),
  ),
  ColorInformation(
    id: 25,
    name: 'DeepSkyBlue4',
    color: Color(0xFF005FAF),
  ),
  ColorInformation(
    id: 26,
    name: 'DodgerBlue3',
    color: Color(0xFF005FD7),
  ),
  ColorInformation(
    id: 27,
    name: 'DodgerBlue2',
    color: Color(0xFF005FFF),
  ),
  ColorInformation(
    id: 28,
    name: 'Green4',
    color: Color(0xFF008700),
  ),
  ColorInformation(
    id: 29,
    name: 'SpringGreen4',
    color: Color(0xFF00875F),
  ),
  ColorInformation(
    id: 30,
    name: 'Turquoise4',
    color: Color(0xFF008787),
  ),
  ColorInformation(
    id: 31,
    name: 'DeepSkyBlue3',
    color: Color(0xFF0087AF),
  ),
  ColorInformation(
    id: 32,
    name: 'DeepSkyBlue3',
    color: Color(0xFF0087D7),
  ),
  ColorInformation(
    id: 33,
    name: 'DodgerBlue1',
    color: Color(0xFF0087FF),
  ),
  ColorInformation(
    id: 34,
    name: 'Green3',
    color: Color(0xFF00AF00),
  ),
  ColorInformation(
    id: 35,
    name: 'SpringGreen3',
    color: Color(0xFF00AF5F),
  ),
  ColorInformation(
    id: 36,
    name: 'DarkCyan',
    color: Color(0xFF00AF87),
  ),
  ColorInformation(
    id: 37,
    name: 'LightSeaGreen',
    color: Color(0xFF00AFAF),
  ),
  ColorInformation(
    id: 38,
    name: 'DeepSkyBlue2',
    color: Color(0xFF00AFD7),
  ),
  ColorInformation(
    id: 39,
    name: 'DeepSkyBlue1',
    color: Color(0xFF00AFFF),
  ),
  ColorInformation(
    id: 40,
    name: 'Green3',
    color: Color(0xFF00D700),
  ),
  ColorInformation(
    id: 41,
    name: 'SpringGreen3',
    color: Color(0xFF00D75F),
  ),
  ColorInformation(
    id: 42,
    name: 'SpringGreen2',
    color: Color(0xFF00D787),
  ),
  ColorInformation(
    id: 43,
    name: 'Cyan3',
    color: Color(0xFF00D7AF),
  ),
  ColorInformation(
    id: 44,
    name: 'DarkTurquoise',
    color: Color(0xFF00D7D7),
  ),
  ColorInformation(
    id: 45,
    name: 'Turquoise2',
    color: Color(0xFF00D7FF),
  ),
  ColorInformation(
    id: 46,
    name: 'Green1',
    color: Color(0xFF00FF00),
  ),
  ColorInformation(
    id: 47,
    name: 'SpringGreen2',
    color: Color(0xFF00FF5F),
  ),
  ColorInformation(
    id: 48,
    name: 'SpringGreen1',
    color: Color(0xFF00FF87),
  ),
  ColorInformation(
    id: 49,
    name: 'MediumSpringGreen',
    color: Color(0xFF00FFAF),
  ),
];

Future<List<ColorInformation>> getColorsFromServer(
    {int page, int limit}) async {
  if (limit <= 0) return [];

  await Future.delayed(Duration(seconds: 1));

  return colors.skip((page - 1) * limit).take(limit).toList();
}
