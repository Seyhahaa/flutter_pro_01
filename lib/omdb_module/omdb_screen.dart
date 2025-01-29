import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card/omdb_module/api_logic.dart';
import 'package:flutter_card/omdb_module/omdb_model.dart';
import 'package:flutter_card/omdb_module/search_screen.dart';
import 'package:provider/provider.dart';


class OmdbScreen extends StatefulWidget {
  const OmdbScreen({super.key});

  @override
  State<OmdbScreen> createState() => _OmdbScreenState();
}

class _OmdbScreenState extends State<OmdbScreen> {
  
  final _scroller = ScrollController();
  bool _showUpButton = false;

  @override
  void initState() {
    super.initState();
    _scroller.addListener(_scrollListener);
  }

  _scrollListener() {
    setState(() {
      if (_scroller.hasClients && _scroller.position.pixels >= 1000) {
        _showUpButton = true;
      } else {
        _showUpButton = false;
      }

      if (_scroller.hasClients &&
          _scroller.position.pixels == _scroller.position.maxScrollExtent) {
        debugPrint("Reached the bottom");
        context.read<OmdbLogic>().readAppend();
      }
    });
  }

  @override
  void dispose() {
    _scroller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: _showUpButton ? _buildUpButton() : null,
    );
  }

  Widget _buildUpButton() {
    return FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      onPressed: () {
        _scroller.animateTo(
          0.0,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  Widget _buildBody() {
    Object? error = context.watch<OmdbLogic>().error;
    bool loading = context.watch<OmdbLogic>().loading;
    List<Movie> records = context.watch<OmdbLogic>().records;

    if (loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return _buildErrorMessage(error);
    } else {
      return _buildListView(records);
    }
  }

  Widget _buildErrorMessage(Object error) {
    debugPrint(error.toString());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 50),
          Text("Something went wrong"),
          ElevatedButton(
            onPressed: () {
              context.read<OmdbLogic>().setLoading();
              context.read<OmdbLogic>().readAppend();
            },
            child: Text("RETRY"),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<Movie> items) {
    bool showLoading = context.watch<OmdbLogic>().loading;
    bool endOfResult = context.watch<OmdbLogic>().endOfResult;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<OmdbLogic>().setLoading();
        context.read<OmdbLogic>().readAppend();
      },
      child: showLoading == false || endOfResult == true
          ? _buildList(items)
          : _buildListPlusOne(items),
    );
  }

  Widget _buildList(List<Movie> items) {
    return ListView.builder(
      controller: _scroller,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildListItem(items[index]);
      },
    );
  }

  Widget _buildListPlusOne(List<Movie> items) {
    return ListView.builder(
      controller: _scroller,
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index < items.length) {
          return _buildListItem(items[index]);
        } else {
          return Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildListItem(Movie item) {
    return Card(
      child: ListTile(
        title: Image.network(item.poster),
        subtitle: Text("${item.title}"),
      ),
    );
  }

  // Widget _buildGridView(List<Search> items) {
  //   return RefreshIndicator(
  //     onRefresh: () async {
  //       context.read<OmdbLogic>().setLoading();
  //       context.read<OmdbLogic>().read();
  //     },
  //     child: GridView.builder(
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         mainAxisSpacing: 5,
  //         crossAxisSpacing: 5,
  //         childAspectRatio: 4 / 6,
  //       ),
  //       itemCount: items.length,
  //       physics: BouncingScrollPhysics(),
  //       itemBuilder: (context, index) {
  //         return _buildItem(items[index]);
  //       },
  //     ),
  //   );
  // }

  // Widget _buildItem(Search item) {
  //   return Card(
  //     child: Column(
  //       children: [
  //         Expanded(
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10),
  //             child: Image.network(
  //               item.poster,
  //               width: double.maxFinite,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             "${item.title}",
  //             maxLines: 1,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}