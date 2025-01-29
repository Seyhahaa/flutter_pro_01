import 'package:flutter/material.dart';
import 'package:flutter_card/omdb_module/omdb_model.dart';
import 'package:flutter_card/omdb_module/search_logic.dart';
import "package:provider/provider.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(),
      ),
      body: _buildBody(),
    );
  }
  final _searchCtrl = TextEditingController();

  Widget _buildSearchBar() {
    return TextField(
        controller: _searchCtrl,
      decoration: const InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
      ),
      onSubmitted: (value) {
        context.read<SearchLogic>().setLoading();
        context.read<SearchLogic>().search(value.trim());
      },
    );
  }
  Widget _buildBody() {
    Object? error = context.watch<SearchLogic>().error;
    bool loading = context.watch<SearchLogic>().isLoading;
    List<Movie> productsList = context.watch<SearchLogic>().movies;

    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (error!= null) {
      return _buildErrorMessage();
    }else{
      return _buildGridView(productsList);
    }
  }

  Widget _buildErrorMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("An error occurred while fetching Movie"),
          ElevatedButton(
            onPressed: () {
              context.read<SearchLogic>().setLoading();
              context.read<SearchLogic>().search(_searchCtrl.text.trim());
            }, 
            child: const Text("Retry"),
          ),
        ],
      )
    );
  }

  Widget _buildGridView(List<Movie> items) {
    return RefreshIndicator(
      child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 4/6),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildProductItem(items[index]);
        },
  
    ), onRefresh:() async{
      context.read<SearchLogic>().setLoading();
      context.read<SearchLogic>().search(_searchCtrl.text.trim());
    });
  }

  Widget _buildProductItem(Movie item) {
    return Card(
      child: Column(
        children: [
          Image.network(item.poster, height: 250,width: double.maxFinite,fit: BoxFit.cover,),          
          Text(item.title),
          Text(item.year),
        ],
      ),
    );
  }
}