import 'package:gradient_appbar/sample_data.dart';
import 'package:gradient_appbar/widgets/color_event.dart';
import 'package:gradient_appbar/widgets/get_color.dart';
import 'package:bloc/bloc.dart';

class GetColorsBloc extends Bloc<ColorsEvent, GetColorsState> {
  @override
  GetColorsState get initialState => GetColorsUnInitial();

  @override
  Stream<GetColorsState> mapEventToState(ColorsEvent event) async* {
    // to notify that is loading
    yield GetColorsLoading();
    // if you have multiple event
    if (event is GetColorsEvent) {
      yield GetColorsSuccess(colors: colors);
    }
    // if have error you can yield GetColorsError state
  }
}
