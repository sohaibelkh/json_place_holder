import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: "Screen,Route",
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: UsersListRoute.page,
          initial: true,
        ),
        AutoRoute(page: SingleUserInfosRoute.page),
        AutoRoute(page: TodoListRoute.page),
        AutoRoute(page: AllAlbumsRoute.page),
        AutoRoute(page: PostsListRoute.page),
        AutoRoute(page: PostDetailRoute.page),
      ];
}
