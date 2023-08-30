import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/core/ui/widgets/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppDependencyTree();
  runApp(const AppWidget());
}
