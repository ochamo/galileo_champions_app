// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rockstar_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RockstarScreenCubitState {
  RockStarScreenStatus get status => throw _privateConstructorUsedError;
  bool get isRockstar => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RockStarScreenStatus status, bool isRockstar)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RockStarScreenStatus status, bool isRockstar)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RockStarScreenStatus status, bool isRockstar)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RockstarScreenCubitStateCopyWith<RockstarScreenCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RockstarScreenCubitStateCopyWith<$Res> {
  factory $RockstarScreenCubitStateCopyWith(RockstarScreenCubitState value,
          $Res Function(RockstarScreenCubitState) then) =
      _$RockstarScreenCubitStateCopyWithImpl<$Res, RockstarScreenCubitState>;
  @useResult
  $Res call({RockStarScreenStatus status, bool isRockstar});
}

/// @nodoc
class _$RockstarScreenCubitStateCopyWithImpl<$Res,
        $Val extends RockstarScreenCubitState>
    implements $RockstarScreenCubitStateCopyWith<$Res> {
  _$RockstarScreenCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isRockstar = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RockStarScreenStatus,
      isRockstar: null == isRockstar
          ? _value.isRockstar
          : isRockstar // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $RockstarScreenCubitStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RockStarScreenStatus status, bool isRockstar});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$RockstarScreenCubitStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isRockstar = null,
  }) {
    return _then(_$_Initial(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RockStarScreenStatus,
      isRockstar: null == isRockstar
          ? _value.isRockstar
          : isRockstar // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.status = RockStarScreenStatus.loading, this.isRockstar = false});

  @override
  @JsonKey()
  final RockStarScreenStatus status;
  @override
  @JsonKey()
  final bool isRockstar;

  @override
  String toString() {
    return 'RockstarScreenCubitState.initial(status: $status, isRockstar: $isRockstar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isRockstar, isRockstar) ||
                other.isRockstar == isRockstar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, isRockstar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RockStarScreenStatus status, bool isRockstar)
        initial,
  }) {
    return initial(status, isRockstar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RockStarScreenStatus status, bool isRockstar)? initial,
  }) {
    return initial?.call(status, isRockstar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RockStarScreenStatus status, bool isRockstar)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(status, isRockstar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RockstarScreenCubitState {
  const factory _Initial(
      {final RockStarScreenStatus status, final bool isRockstar}) = _$_Initial;

  @override
  RockStarScreenStatus get status;
  @override
  bool get isRockstar;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
