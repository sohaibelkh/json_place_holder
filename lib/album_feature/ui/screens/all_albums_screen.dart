import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/album_feature/ui/state/get_albums/get_albums_cubit.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/core/ui/widgets/user_failure_widget.dart';

import '../widgets/albums_list_view_item.dart';

@RoutePage()
class AllAlbumsScreen extends StatefulWidget {
  const AllAlbumsScreen({super.key, required this.userId});

  final int userId;

  @override
  State<AllAlbumsScreen> createState() => _AllAlbumsScreenState();
}



class _AllAlbumsScreenState extends State<AllAlbumsScreen> {

  final GetAlbumsCubit _albumsCubit = injection<GetAlbumsCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _albumsCubit.loadAlbums(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:  const Text(
          'User Albums',
          style:  TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GetAlbumsCubit, GetAlbumsState>(
        bloc: _albumsCubit,
        builder: (context, state) {
          if (state is GetAlbumsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          } else if (state is GetAlbumsFailure) {
            return UserFailureWidget(
              message: state.errMessage,
              onRetry: () async => _albumsCubit.loadAlbums(widget.userId),
            );
          } else if (state is GetAlbumsSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.albums.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: AlbumsListViewItem(
                    title: state.albums[index].title,
                    id: state.albums[index].userId,
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

