import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item_logic.dart';
import 'item_model.dart';
import 'item_service.dart';
import 'utile.dart';

class ItemUpdateScreen extends StatefulWidget {
  // const ItemUpdateScreen({super.key});

  Item item;
  String searchKeyword;

  ItemUpdateScreen(this.item, this.searchKeyword);

  @override
  State<ItemUpdateScreen> createState() => _ItemUpdateScreenState();
}

class _ItemUpdateScreenState extends State<ItemUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Item Update Screen"),
        backgroundColor: Colors.amber,
      ),
      body: _buildBody(),
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          _buildTitleTextField(),
          _buildQtyTextField(),
          _buildPriceTextField(),
          _buildRateTextField(),
          _buildImageUrlTextField(),
          _buildSaveButton(),
        ],
      ),
    );
  }

  late final _titleCtrl = TextEditingController(text: widget.item.title);
  Widget _buildTitleTextField() {
    return TextFormField(
      controller: _titleCtrl,
      decoration:const InputDecoration(
        icon: Icon(Icons.title),
        hintText: "Enter Title",
      ),
      keyboardType: TextInputType.text,
      validator: (text) {
        if (text!.isEmpty) {https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc4/The-entire-Samsung-Galaxy-S25-series-will-launch-with-12-GB-RAM-minimum.jpg
          return "Title is required";
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  late final _qtyCtrl = TextEditingController(text: widget.item.qty);
  Widget _buildQtyTextField() {
    return TextFormField(
      controller: _qtyCtrl,
      decoration: const InputDecoration(
        icon: Icon(Icons.numbers),
        hintText: "Enter Qty",
      ),
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text!.isEmpty) {
          return "Qty is required";
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  late final _priceCtrl = TextEditingController(text: widget.item.price);
  Widget _buildPriceTextField() {
    return TextFormField(
      controller: _priceCtrl,
      decoration: const InputDecoration(
        icon: Icon(Icons.currency_exchange),
        hintText: "Enter Price",
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (text) {
        if (text!.isEmpty) {
          return "Price is required";
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  late final _imageUrlCtrl = TextEditingController(text: widget.item.imgUrl);
  Widget _buildImageUrlTextField() {
    return TextFormField(
      controller: _imageUrlCtrl,
      decoration: const InputDecoration(
        icon: Icon(Icons.title),
        hintText: "Enter Image Url",
      ),
      keyboardType: TextInputType.text,
      maxLines: 5,
      validator: (text) {
        if (text!.isEmpty) {
          return "Image Url is required";
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  late final _rateCtrl = TextEditingController(text: widget.item.rate);
  Widget _buildRateTextField() {
    return TextFormField(
      controller: _rateCtrl,
      decoration: const InputDecoration(
        icon: Icon(Icons.star),
        hintText: "Enter Rate",
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (text) {
        if (text!.isEmpty) {
          return "Rate is required";
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  bool _posting = false;

  Widget _buildSaveButton() {
    return AbsorbPointer(
      absorbing: _posting,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final item = Item(
                      id: widget.item.id,
                      title: _titleCtrl.text.trim(),
                      qty: _qtyCtrl.text.trim(),
                      price: _priceCtrl.text.trim(),
                      rate: _rateCtrl.text.trim(),
                      imgUrl: _imageUrlCtrl.text.trim(),
                    );

                    setState(() {
                      _posting = true;
                    });

                    await Future.delayed(const Duration(seconds: 1), () {});

                    ItemService.post(item, PostMethod.update).then((value) {
                      context.read<ItemLogic>().search(this.widget.searchKeyword);
                      showSnackBar(context, value);
                      setState(() {
                        _posting = false;
                      });
                    }).onError((error, stack) {
                      showSnackBar(context, error.toString());
                      setState(() {
                        _posting = false;
                      });
                    });
                  } else {
                    showSnackBar(context, "Some fields are not filled yet");
                  }
                },
                child:const Text("UPDATE"),
              ),
            ],
          ),
          _posting ? const CircularProgressIndicator() : const SizedBox(),
        ],
      ),
    );
  }
}