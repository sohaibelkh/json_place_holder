// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:jsonplaceholder_full_project/album_feature/ui/screens/all_albums_screen.dart'
    as _i1;
import 'package:jsonplaceholder_full_project/post_details/ui/screens/post_detail_screen.dart'
    as _i2;
import 'package:jsonplaceholder_full_project/posts_feature/ui/screens/posts_list_screen.dart'
    as _i3;
import 'package:jsonplaceholder_full_project/todo_feature/ui/screens/todo_list_screen.dart'
    as _i5;
import 'package:jsonplaceholder_full_project/user_feature/ui/screens/single_user_infos.dart'
    as _i4;
import 'package:jsonplaceholder_full_project/user_feature/ui/screens/user_list_screen.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AllAlbumsRoute.name: (routeData) {
      final args = routeData.argsAs<AllAlbumsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AllAlbumsScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    PostDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PostDetailScreen(
          key: args.key,
          id: args.id,
          userId: args.userId,
        ),
      );
    },
    PostsListRoute.name: (routeData) {
      final args = routeData.argsAs<PostsListRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PostsListScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    SingleUserInfos.name: (routeData) {
      final args = routeData.argsAs<SingleUserInfosArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SingleUserInfos(
          key: args.key,
          id: args.id,
        ),
      );
    },
    TodoListRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.TodoListScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    UsersListRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.UsersListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AllAlbumsScreen]
class AllAlbumsRoute extends _i7.PageRouteInfo<AllAlbumsRouteArgs> {
  AllAlbumsRoute({
    _i8.Key? key,
    required int userId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AllAlbumsRoute.name,
          args: AllAlbumsRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'AllAlbumsRoute';

  static const _i7.PageInfo<AllAlbumsRouteArgs> page =
      _i7.PageInfo<AllAlbumsRouteArgs>(name);
}

class AllAlbumsRouteArgs {
  const AllAlbumsRouteArgs({
    this.key,
    required this.userId,
  });

  final _i8.Key? key;

  final int userId;

  @override
  String toString() {
    return 'AllAlbumsRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i2.PostDetailScreen]
class PostDetailRoute extends _i7.PageRouteInfo<PostDetailRouteArgs> {
  PostDetailRoute({
    _i8.Key? key,
    required int id,
    required int userId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PostDetailRoute.name,
          args: PostDetailRouteArgs(
            key: key,
            id: id,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'PostDetailRoute';

  static const _i7.PageInfo<PostDetailRouteArgs> page =
      _i7.PageInfo<PostDetailRouteArgs>(name);
}

class PostDetailRouteArgs {
  const PostDetailRouteArgs({
    this.key,
    required this.id,
    required this.userId,
  });

  final _i8.Key? key;

  final int id;

  final int userId;

  @override
  String toString() {
    return 'PostDetailRouteArgs{key: $key, id: $id, userId: $userId}';
  }
}

/// generated route for
/// [_i3.PostsListScreen]
class PostsListRoute extends _i7.PageRouteInfo<PostsListRouteArgs> {
  PostsListRoute({
    _i8.Key? key,
    required int userId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PostsListRoute.name,
          args: PostsListRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'PostsListRoute';

  static const _i7.PageInfo<PostsListRouteArgs> page =
      _i7.PageInfo<PostsListRouteArgs>(name);
}

class PostsListRouteArgs {
  const PostsListRouteArgs({
    this.key,
    required this.userId,
  });

  final _i8.Key? key;

  final int userId;

  @override
  String toString() {
    return 'PostsListRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i4.SingleUserInfos]
class SingleUserInfos extends _i7.PageRouteInfo<SingleUserInfosArgs> {
  SingleUserInfos({
    _i8.Key? key,
    required int id,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SingleUserInfos.name,
          args: SingleUserInfosArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleUserInfos';

  static const _i7.PageInfo<SingleUserInfosArgs> page =
      _i7.PageInfo<SingleUserInfosArgs>(name);
}

class SingleUserInfosArgs {
  const SingleUserInfosArgs({
    this.key,
    required this.id,
  });

  final _i8.Key? key;

  final int id;

  @override
  String toString() {
    return 'SingleUserInfosArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.TodoListScreen]
class TodoListRoute extends _i7.PageRouteInfo<TodoListRouteArgs> {
  TodoListRoute({
    _i8.Key? key,
    required int userId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          TodoListRoute.name,
          args: TodoListRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i7.PageInfo<TodoListRouteArgs> page =
      _i7.PageInfo<TodoListRouteArgs>(name);
}

class TodoListRouteArgs {
  const TodoListRouteArgs({
    this.key,
    required this.userId,
  });

  final _i8.Key? key;

  final int userId;

  @override
  String toString() {
    return 'TodoListRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i6.UsersListScreen]
class UsersListRoute extends _i7.PageRouteInfo<void> {
  const UsersListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          UsersListRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersListRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
