import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/constants.dart';
import 'package:jsonplaceholder_full_project/core/ui/routes/app_router.gr.dart';
import 'package:jsonplaceholder_full_project/user_feature/ui/state/get_all_users/get_all_users_cubit.dart';
import 'package:jsonplaceholder_full_project/core/ui/widgets/user_failure_widget.dart';
import 'package:jsonplaceholder_full_project/user_feature/ui/widgets/users_list_view_item.dart';

@RoutePage()
class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final GetAllUsersCubit _cubit = injection<GetAllUsersCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await _cubit.loadAllUsers();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPurpleColor,
        title: const Text(
          'Users List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is GetAllUsersLoading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: kPurpleColor,
              ),
            );
          } else if (state is GetAllUsersFailure) {
            return UserFailureWidget(
              message: state.errMessage,
              onRetry: () async => _cubit.loadAllUsers(),
            );
          } else if (state is GetAllUsersSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
              shrinkWrap: true,
              itemCount: state.users.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.pushRoute(
                        SingleUserInfosRoute(id: state.users[index].id),
                      );
                    },
                    child: UsersListViewItem(
                      name: state.users[index].name,
                      email: state.users[index].email,
                      city: state.users[index].address.city,
                      company: state.users[index].company.name,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Something wrong happened, please try again later'),
            );
          }
        },
      ),
    );
  }
}
