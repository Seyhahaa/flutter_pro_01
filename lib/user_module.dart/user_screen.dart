import 'package:flutter/material.dart';
import 'package:flutter_card/user_module.dart/user_logic.dart';
import "package:provider/provider.dart";

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Users',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const UserListScreen(),
    );
  }
}

// user_list_screen.dart
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<UserLogic>().read(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<UserLogic>().refreshUsers(),
          ),
        ],
      ),
      body: Consumer<UserLogic>(
        builder: (context, userLoUserLogic, child) {
          if (userLoUserLogic.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userLoUserLogic.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(userLoUserLogic.error!),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: userLoUserLogic.refreshUsers,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => userLoUserLogic.read(),
            child: ListView.builder(
              itemCount: userLoUserLogic.users.length,
              itemBuilder: (context, index) {
                final user = userLoUserLogic.users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.picture.large),
                  ),
                  title: Text(user.name.first),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.email),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () {
                      // Handle phone call
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}