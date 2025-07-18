import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gig_buddy/src/service/model/enum/gender.dart';
import 'package:gig_buddy/src/service/model/interest/interest_dto.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
@immutable
class UserDto with _$UserDto {
  factory UserDto({
    required String id,
    required String email,
    required String username,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'user_image') required String userImage,
    @JsonKey(name: 'birthdate') required DateTime? birthdate,
    @JsonKey(name: 'gender') required Gender? gender,
    @JsonKey(name: 'interests', disallowNullValue: false)
    List<InterestDto>? interests,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

extension UserDtoExtension on UserDto {
  bool get isValid =>
      birthdate != null &&
      gender != null;
}
