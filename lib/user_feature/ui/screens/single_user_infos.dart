import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/album_feature/ui/screens/all_albums_screen.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/constants.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/ui/screens/posts_list_screen.dart';
import 'package:jsonplaceholder_full_project/todo_feature/ui/screens/todo_list_screen.dart';
import 'package:jsonplaceholder_full_project/user_feature/ui/state/get_single_user/get_single_user_cubit.dart';
import 'package:jsonplaceholder_full_project/user_feature/ui/widgets/custom_button.dart';

class SingleUserInfos extends StatefulWidget {
  const SingleUserInfos({super.key, required this.id});

  final int id;

  @override
  State<SingleUserInfos> createState() => _SingleUserInfosState();
}

class _SingleUserInfosState extends State<SingleUserInfos> {
  final GetSingleUserCubit _cubit = injection<GetSingleUserCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await _cubit.loadSingleUser(widget.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPurpleColor,
        title: const Text(
          'User Infos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is GetSingleUserLoading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: kPurpleColor,
              ),
            );
          } else if (state is GetSingleUserFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else if (state is GetSingleUserSuccess) {
            return Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.width * 2,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name : ${state.users.first.name}',
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Username : ${state.users.first.userName}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Email : ${state.users.first.email}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Street : ${state.users.first.address.street}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'City : ${state.users.first.address.city}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Zipcode : ${state.users.first.address.zipCode}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lat : ${state.users.first.address.geo.lat}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lng : ${state.users.first.address.geo.lng}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Phone : ${state.users.first.phone}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Website : ${state.users.first.website}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Company : ${state.users.first.company.name}',
                    style: const TextStyle(fontSize: 22, color: kGreyColor),
                  ),
                  const SizedBox(height: 35),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoListScreen(
                            userId: state.users.first.id,
                          ),
                        ),
                      );
                    },
                    color: Colors.purple,
                    text: 'Go To User Todos',
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllAlbumsScreen(
                            userId: state.users.first.id,
                          ),
                        ),
                      );
                    },
                    color: Colors.green,
                    text: 'Go To User Albums',
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostsListScreen(
                            userId: state.users.first.id,
                            username: state.users.first.name,
                          ),
                        ),
                      );
                    },
                    color: Colors.blue,
                    text: 'Go To User Posts',
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
