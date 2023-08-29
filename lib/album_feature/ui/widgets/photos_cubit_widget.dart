import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/album_feature/ui/state/get_photos/get_photos_cubit.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/core/ui/widgets/user_failure_widget.dart';

class PhotosCubitWidget extends StatefulWidget {
  const PhotosCubitWidget({
    super.key,
    required this.albumId,
    required this.id,
  });

  final int albumId;
  final int id;

  @override
  State<PhotosCubitWidget> createState() => _PhotosCubitWidgetState();
}

class _PhotosCubitWidgetState extends State<PhotosCubitWidget> {
  final GetPhotosCubit _photosCubit = injection<GetPhotosCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _photosCubit.loadPhotos(albumId: widget.albumId, id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPhotosCubit, GetPhotosState>(
      bloc: _photosCubit,
      builder: (context, state) {
        if (state is GetPhotosLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        } else if (state is GetPhotosFailure) {
          return UserFailureWidget(
            message: state.errMessage,
            onRetry: () async => _photosCubit.loadPhotos(
              albumId: widget.albumId,
              id: widget.id,
            ),
          );
        } else if (state is GetPhotosSuccess) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              image: NetworkImage(
                state.photos.first.thumbnailUrl,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
