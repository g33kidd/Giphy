import 'package:flutter/material.dart';
import 'package:giphy/models/gif.dart';

class TrendingListView extends StatefulWidget {
  final Widget empty;
  final Widget loading;
  final Axis scrollDirection;

  TrendingListView({this.empty, this.loading, this.scrollDirection});

  @override
  State<StatefulWidget> createState() => _TrendingListViewState();
}

class _TrendingListViewState extends State<TrendingListView> {
  bool loading = true;

  List<GIF> gifs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: gifs.isNotEmpty ? gifs.length : 0,
      scrollDirection: widget.scrollDirection,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return null;
  }
}
