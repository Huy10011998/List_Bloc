import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_appbar/widgets/bloc.dart';
import 'package:gradient_appbar/widgets/color_event.dart';
import 'package:gradient_appbar/widgets/color_item.dart';
import 'package:gradient_appbar/widgets/get_color.dart';
import 'package:gradient_appbar/widgets/khong_co_data.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'sample_data.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: new MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double _endReachedThreshold = 200;
  static const int _itemsPerPage = 20;

  final ScrollController _controller = ScrollController();
  //List<ColorInformation> _colors = colors;
  List<ColorInformation> _colors = [];
  int _nextPage = 1;
  bool _loading = true;
  bool _canLoadMore = true;
  GetColorsBloc _getColorsBloc;

  @override
  void initState() {
    _controller.addListener(_onScroll);
    _colors = List<ColorInformation>();
    _getColors();

    super.initState();
    print("Color: " + _colors.length.toString());
    print("CanLoadMore: " + _canLoadMore.toString());
    print("Loading: " + _loading.toString());
    _getColorsBloc = GetColorsBloc();
  }

  Future<void> _getColors() async {
    _loading = true;

    final newColors =
        await getColorsFromServer(page: _nextPage, limit: _itemsPerPage);

    setState(() {
      _colors.addAll(newColors);
      //colors.length.toString();
      _nextPage++;

      if (newColors.length < _itemsPerPage) {
        _canLoadMore = false;
      }

      print("NewColor: " + newColors.length.toString());
      print("ColorsAdd: " + _colors.length.toString());
      print("NextPage: " + _nextPage.toString());
      print("ItemsPerPage: " + _itemsPerPage.toString());
      print("CanLoadMoreData: " + _canLoadMore.toString());
      print("LoadingData: " + _loading.toString());

      _loading = false;
    });
  }

  void _onScroll() {
    if (!_controller.hasClients || _loading) {
      return;
    }

    final thresholdReached =
        _controller.position.extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      _getColors();
    }
  }

  Future<void> _refresh() async {
    _canLoadMore = true;
    _colors.clear();
    _nextPage = 1;
    await _getColors();
  }

  // Widget _checkCanLoadMore() {
  //   if (_colors.length <= 10 || _colors.length == 0) {
  //     _canLoadMore = true;
  //   } else {
  //     _canLoadMore = false;
  //     return Container(
  //       padding: EdgeInsets.only(bottom: 16),
  //       alignment: Alignment.center,
  //       child: CircularProgressIndicator(
  //         valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
  //       ),
  //     );
  //   }
  //   return Container();
  // }

  @override
  Widget build(BuildContext context) {
    _getColorsBloc.dispatch(GetColorsEvent());
    return BlocProvider(
      builder: (BuildContext context) => _getColorsBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Demo BLoC"),
          centerTitle: true,
        ),
        body: BlocBuilder(
          bloc: _getColorsBloc,
          builder: (context, GetColorsState state) {
            if (state is GetColorsUnInitial)
              return Container();
            else if (state is GetColorsLoading)
              return Center(child: KhongCoData());
            else if (state is GetColorsSuccess)
              return _buildListColor(state.colors);
            else {
              return Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }

  Widget _buildColorItem(BuildContext context, int index) {
    return ColorItem(_colors[index]);
  }

  Widget _buildListColor(List<ColorInformation> colors) {
    return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (_colors.length == 0) {
            Container();
            return Center(
              child: JumpingText(
                'Đang tải ...',
                style: TextStyle(color: Color(0xff3F36AE)),
              ),
            );
          } else {
            return CustomScrollView(
              controller: _controller,
              slivers: <Widget>[
                CupertinoSliverRefreshControl(
                  onRefresh: _refresh,
                ),
                SliverPadding(
                  padding: EdgeInsets.all(16),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.6,
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 16,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      _buildColorItem,
                      childCount: _colors.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _canLoadMore
                      ? Container(
                          padding: EdgeInsets.only(bottom: 16),
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(),
                ),

                //SliverToBoxAdapter(child: _checkCanLoadMore()),
              ],
            );
          }
        }
        return Container();
      },
    );
  }
}
