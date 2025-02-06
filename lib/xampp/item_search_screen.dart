import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item_insert_screen.dart';
import 'item_logic.dart';
import 'item_model.dart';
import 'item_service.dart';
import 'item_update_screen.dart';
import 'utile.dart';

class ItemSearchScreen extends StatefulWidget {
  const ItemSearchScreen({super.key});

  @override
  State<ItemSearchScreen> createState() => _ItemSearchScreenState();
}

class _ItemSearchScreenState extends State<ItemSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        title: _buildSearchScreen(),
        actions: [
          IconButton(
            onPressed: () {
              goto(context, ItemInsertScreen(_searchCtrl.text.trim()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _builbBody(),
    );
  }

  final _searchCtrl = TextEditingController();

  Widget _buildSearchScreen() {
    return TextField(
      controller: _searchCtrl,
      decoration: const InputDecoration(
        hintText: "Search...",
      ),
      onSubmitted: (text) async {
        context.read<ItemLogic>().setLoading();
        await context.read<ItemLogic>().search(text.trim());
      },
    );
  }

  Widget _builbBody() {
    bool loading = context.watch<ItemLogic>().loading;
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    Object? error = context.watch<ItemLogic>().error;

    if (error != null) {
      return Center(
        child: Text("Error: ${error.toString()}"),
      );
    } else {
      return _buildListView();
    }
  }

  Widget _buildListView() {
    UserRandom itemModel = context.watch<ItemLogic>().itemModel;
    if (itemModel.items.length == 0) {
      return Center(
        child: Icon(
          Icons.shopping_bag_sharp,
          color: Colors.grey.shade300,
          size: 100,
        ),
      );
    }
    return ListView.builder(
      itemCount: itemModel.items.length,
      itemBuilder: (context, index) {
        return _buildItem(itemModel.items[index]);
      },
    );
  }

  Widget _buildItem(Item item) {
    return Card(
      child: ListTile(
          leading: SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              item.imgUrl,
              fit: BoxFit.cover,
              errorBuilder: (x, y, z) {
                return Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          onTap: () {
            goto(context, ItemUpdateScreen(item, _searchCtrl.text.trim()));
          },
          title: Text("Code: ${item.id}\n${item.title}"),
          subtitle: Text(item.price),
          trailing: IconButton(
            onPressed: () async {
              bool? deleted = await _showDeleteDialog(item);
              if (deleted == true) {
                ItemService.post(item, PostMethod.delete).then((value) {
                  context.read<ItemLogic>().search(_searchCtrl.text);
                  showSnackBar(context, value);
                }).onError((error, stack) {
                  showSnackBar(context, error.toString());
                });
              }
            },
            icon: Icon(Icons.delete),
          )),
    );
  }

  Future _showDeleteDialog(Item item){
    return showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Delete Confirmation"),
                      content: Text("Wanna delete item #${item.id}?"),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child:const Text("DELETE"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("DON'T"),
                        ),
                      ],
                    );
                  });
  }
}