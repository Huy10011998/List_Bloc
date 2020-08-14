class ColorsEvent{}

class GetColorsEvent extends ColorsEvent{
  // you can pass pram here
  String id;
  GetColorsEvent({this.id});
}