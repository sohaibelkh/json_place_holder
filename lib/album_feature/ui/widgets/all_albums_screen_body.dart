import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/album_feature/ui/state/get_albums_cubit/cubit/get_albums_cubit.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';

import 'albums_list_view_item.dart';

class AllAlbumsScreenBody extends StatefulWidget {
  const AllAlbumsScreenBody({super.key, required this.userId});

  final int userId;

  @override
  State<AllAlbumsScreenBody> createState() => _AllAlbumsScreenBodyState();
}

final GetAlbumsCubit _albumsCubit = injection<GetAlbumsCubit>();

class _AllAlbumsScreenBodyState extends State<AllAlbumsScreenBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _albumsCubit.loadAlbums(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAlbumsCubit, GetAlbumsState>(
      bloc: _albumsCubit,
      builder: (context, state) {
        if (state is GetAlbumsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        } else if (state is GetAlbumsFailure) {
          return Center(
            child: Text(state.errMessage),
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
                child: GestureDetector(
                  onTap: () {},
                  child: AlbumsListViewItem(
                    title: state.albums[index].title,
                    albumId: 1,
                    id: state.albums[index].userId,
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

