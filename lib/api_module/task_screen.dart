import 'package:flutter/material.dart';
import 'package:flutter_card/api_module/post_logic.dart';
import 'package:provider/provider.dart';
import 'post_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Screen"),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(
                  content: Text("Hello"),
                ),
              );
            },
            icon:const Icon(Icons.share),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    List<PostModel> postList = context.watch<PostLogic>().postList;
    bool loading = context.watch<PostLogic>().loading;
    Object? errorObject = context.watch<PostLogic>().errorObject;

    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if(errorObject != null) {
      return _buildErrorMessage(errorObject);
    }else{
      return _buildListView(postList);
    }
  }

  Widget _buildErrorMessage(Object errorObject) {
    debugPrint("${errorObject.toString()}");
    return Center(
      child: Column(
        children: [
          const Icon(Icons.error, size: 50,),
          const Text("An error occurred"),
          ElevatedButton(
            onPressed: () {
              context.read<PostLogic>().setLoading();
              context.read<PostLogic>().read();
            },
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }

  Widget _buildListView(List<PostModel> records) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PostLogic>().setLoading();
        context.read<PostLogic>().read();
      },
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: records.length,
        itemBuilder: (context, index) {
          return _buildItem(records[index]);
        },
      ),
    );
  }

  Widget _buildItem(PostModel post) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.face),
        title: Text(post.title),
        // subtitle: Text(post.description),
      ),
    );
  }
}