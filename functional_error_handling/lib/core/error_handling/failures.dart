import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class FailureEntity with _$FailureEntity {
  const FailureEntity._(); // This constructor is needed to have custom methods in Freezed.
  const factory FailureEntity.serverFailure() = ServerFailure;
  const factory FailureEntity.dataParsingFailure() = DataParsingFailure;
  const factory FailureEntity.noConnectionFailure() = NoConnectionFailure;
}
