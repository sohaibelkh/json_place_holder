import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/user_feature/ui/screens/users_list_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppDependencyTree();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UsersListScreen(),
    );
  }
}
