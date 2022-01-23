import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:functional_error_handling/features/post/presentation/widgets/custom_list_tile.dart';
import 'package:functional_error_handling/features/post/presentation/widgets/error_dialog.dart';

import 'bloc/posts_list.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<PostsListBloc, PostsListState>(
          builder: (context, state) {
            return state.when(
              // If the state is the initial one -> then loading indicator.
              initial: () => const Center(child: CircularProgressIndicator()),
              // If the state is an error -> then we present the error message.
              loadFailure: (errorObject) =>
                  ErrorDialog(errorObject: errorObject),
              // If the state is successful -> we show the loaded list of posts
              loadSuccess: (posts) => ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return CustomListTile(post: posts[index]);
                },
              ),
            );
          },
        ),
        // Floating action button to refresh the list.
        Positioned(
          bottom: 50,
          right: 18,
          child: FloatingActionButton(
            onPressed: () => BlocProvider.of<PostsListBloc>(context)
                .add(const LoadPostsList()),
            child: const Icon(Icons.refresh),
          ),
        ),
      ],
    );
  }
}
