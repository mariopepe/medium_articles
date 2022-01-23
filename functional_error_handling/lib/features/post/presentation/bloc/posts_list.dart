import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:functional_error_handling/core/error_handling/error_handling.dart';
import 'package:functional_error_handling/features/post/domain/entities/post_entity.dart';
import 'package:functional_error_handling/features/post/domain/repositories/posts_repository.dart';

part 'posts_list.freezed.dart';

class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  PostsListBloc({
    required PostsRepository postsRepository,
  }) : super(const PostsListState.initial()) {
    on<LoadPostsList>(
      (event, emit) async {
        final Either<FailureEntity, List<PostEntity>> postsEither =
            await postsRepository.fetchPosts();

        /// postsEither.fold() from [dartz package] allows to map Failure and
        /// Success with different state emitted from the bloc.
        /// This makes it extremely hard not to handle all errors.
        postsEither.fold(
          (failure) => emit(PostsListState.loadFailure(
              errorObject:
                  ErrorObject.mapFailureToErrorObject(failure: failure))),
          (postsList) => emit(PostsListState.loadSuccess(posts: postsList)),
        );
      },
    );
  }
}

@freezed
class PostsListEvent with _$PostsListEvent {
  const factory PostsListEvent.loadPostsList() = LoadPostsList;
}

@freezed
class PostsListState with _$PostsListState {
  const factory PostsListState.initial() = Initial;
  const factory PostsListState.loadSuccess({
    required List<PostEntity> posts,
  }) = LoadSuccess;
  const factory PostsListState.loadFailure({
    required ErrorObject errorObject,
  }) = LoadFailure;
}
