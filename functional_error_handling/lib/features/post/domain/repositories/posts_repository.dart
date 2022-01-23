import 'package:dartz/dartz.dart';
import 'package:functional_error_handling/core/error_handling/failures.dart';
import 'package:functional_error_handling/features/post/domain/entities/post_entity.dart';

abstract class PostsRepository {
  Future<Either<FailureEntity, List<PostEntity>>> fetchPosts();
}
