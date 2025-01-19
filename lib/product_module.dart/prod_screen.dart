import 'package:flutter/material.dart';
import 'package:flutter_card/product_module.dart/prod_logic.dart';
import 'package:flutter_card/product_module.dart/prod_module.dart';
import "package:provider/provider.dart";

class ProdScreen extends StatefulWidget {
  const ProdScreen({super.key});

  @override
  State<ProdScreen> createState() => _ProdScreenState();
}

class _ProdScreenState extends State<ProdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    Object? error = context.watch<ProductLogic>().error;
    bool loading = context.watch<ProductLogic>().loading;
    List<Welcome> productsList = context.watch<ProductLogic>().prodductList;

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
          const Text("An error occurred while fetching products"),
          ElevatedButton(
            onPressed: () {
              context.read<ProductLogic>().setLoading();
              context.read<ProductLogic>().read();
            }, 
            child: const Text("Retry"),
          ),
        ],
      )
    );
  }

  Widget _buildGridView(List<Welcome> items) {
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
      context.read<ProductLogic>().setLoading();
      context.read<ProductLogic>().read();
    });
  }

  Widget _buildProductItem(Welcome item) {
    return Image.network(
      item.image,
      width:  double.maxFinite,
      fit: BoxFit.cover,
    );
  }
}