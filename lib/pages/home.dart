import 'package:flutter/material.dart';
import 'package:giphy/models/gif.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:giphy/giphy.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GIF> gifs;
  bool loading = true;
  final giphyApi = GiphyAPI(apiKey: "Ci380cV9Rh1etAsqYZfWQvxqYHZ91Yc6");

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _fetch() {
    setState(() {
      loading = true;
      gifs = null;
    });

    giphyApi.trending().then((list) {
      setState(() {
        gifs = list;
        loading = false;
      });
    });
  }

  _loadRandom() {
    giphyApi.random(tag: 'dick', rating: 'r').then((gif) {
      print(gif);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w800,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Giphy"),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _fetch(),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("TRENDING", style: headerStyle),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildTrendingList(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingList(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
          strokeWidth: 2.0,
        ),
      );
    }

    if (gifs == null) {
      return Center(child: Text("There was a problem."));
    }

    return ListView.builder(
      itemBuilder: _buildGifView,
      itemCount: gifs.isNotEmpty ? gifs.length : 0,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _buildGifView(BuildContext ctx, int i) {
    final gif = gifs[i];

    if (gif != null) {
      final image = gif.images.fixedHeight;
      var padding = EdgeInsets.all(4.0);
      if (i == 0) {
        padding = EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0);
      }

      return Column(
        children: <Widget>[
          Padding(
            padding: padding,
            child: Image.network(image.url),
          ),
        ],
      );
    } else {
      return Container(
        child: Center(
          child: Text("Could not load image."),
        ),
        width: 200.0,
        height: 200.0,
      );
    }
  }
}
