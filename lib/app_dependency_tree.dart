import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_full_project/album_feature/album_injection.dart';
import 'package:jsonplaceholder_full_project/album_feature/photo_injection.dart';
import 'package:jsonplaceholder_full_project/core/core_injection.dart';
import 'package:jsonplaceholder_full_project/post_details/comment_injection.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/posts_injection.dart';
import 'package:jsonplaceholder_full_project/todo_feature/todo_injection.dart';
import 'package:jsonplaceholder_full_project/user_feature/users_injection.dart';

final GetIt injection = GetIt.instance;

void initAppDependencyTree(){
  injectCoreDependencies(injection);
  injectUsersDependencies(injection);
  injectTodosDependencies(injection);
  injectPostsDependencies(injection);
  injectCommentsDependencies(injection);
  injectPhotosDependencies(injection);
  injectAlbumsDependencies(injection);
}