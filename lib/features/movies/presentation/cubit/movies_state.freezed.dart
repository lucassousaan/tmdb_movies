// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieSection {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieSection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieSection()';
}


}

/// @nodoc
class $MovieSectionCopyWith<$Res>  {
$MovieSectionCopyWith(MovieSection _, $Res Function(MovieSection) __);
}


/// Adds pattern-matching-related methods to [MovieSection].
extension MovieSectionPatterns on MovieSection {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<Movie> movies)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.movies);case _Error() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<Movie> movies)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Success():
return success(_that.movies);case _Error():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<Movie> movies)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.movies);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements MovieSection {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieSection.loading()';
}


}




/// @nodoc


class _Success implements MovieSection {
  const _Success(final  List<Movie> movies): _movies = movies;
  

 final  List<Movie> _movies;
 List<Movie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of MovieSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'MovieSection.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $MovieSectionCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<Movie> movies
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of MovieSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(_Success(
null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}


}

/// @nodoc


class _Error implements MovieSection {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of MovieSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MovieSection.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $MovieSectionCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of MovieSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MoviesState {

 MovieSection get popular; MovieSection get topRated; MovieSection get trending; MovieSection get upcoming;
/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoviesStateCopyWith<MoviesState> get copyWith => _$MoviesStateCopyWithImpl<MoviesState>(this as MoviesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesState&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.topRated, topRated) || other.topRated == topRated)&&(identical(other.trending, trending) || other.trending == trending)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming));
}


@override
int get hashCode => Object.hash(runtimeType,popular,topRated,trending,upcoming);

@override
String toString() {
  return 'MoviesState(popular: $popular, topRated: $topRated, trending: $trending, upcoming: $upcoming)';
}


}

/// @nodoc
abstract mixin class $MoviesStateCopyWith<$Res>  {
  factory $MoviesStateCopyWith(MoviesState value, $Res Function(MoviesState) _then) = _$MoviesStateCopyWithImpl;
@useResult
$Res call({
 MovieSection popular, MovieSection topRated, MovieSection trending, MovieSection upcoming
});


$MovieSectionCopyWith<$Res> get popular;$MovieSectionCopyWith<$Res> get topRated;$MovieSectionCopyWith<$Res> get trending;$MovieSectionCopyWith<$Res> get upcoming;

}
/// @nodoc
class _$MoviesStateCopyWithImpl<$Res>
    implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._self, this._then);

  final MoviesState _self;
  final $Res Function(MoviesState) _then;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? popular = null,Object? topRated = null,Object? trending = null,Object? upcoming = null,}) {
  return _then(_self.copyWith(
popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as MovieSection,topRated: null == topRated ? _self.topRated : topRated // ignore: cast_nullable_to_non_nullable
as MovieSection,trending: null == trending ? _self.trending : trending // ignore: cast_nullable_to_non_nullable
as MovieSection,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as MovieSection,
  ));
}
/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionCopyWith<$Res> get popular {
  
  return $MovieSectionCopyWith<$Res>(_self.popular, (value) {
    return _then(_self.copyWith(popular: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionCopyWith<$Res> get topRated {
  
  return $MovieSectionCopyWith<$Res>(_self.topRated, (value) {
    return _then(_self.copyWith(topRated: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionCopyWith<$Res> get trending {
  
  return $MovieSectionCopyWith<$Res>(_self.trending, (value) {
    return _then(_self.copyWith(trending: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionCopyWith<$Res> get upcoming {
  
  return $MovieSectionCopyWith<$Res>(_self.upcoming, (value) {
    return _then(_self.copyWith(upcoming: value));
  });
}
}


/// Adds pattern-matching-related methods to [MoviesState].
extension MoviesStatePatterns on MoviesState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoviesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoviesState value)  $default,){
final _that = this;
switch (_that) {
case _MoviesState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoviesState value)?  $default,){
final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MovieSection popular,  MovieSection topRated,  MovieSection trending,  MovieSection upcoming)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that.popular,_that.topRated,_that.trending,_that.upcoming);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MovieSection popular,  MovieSection topRated,  MovieSection trending,  MovieSection upcoming)  $default,) {final _that = this;
switch (_that) {
case _MoviesState():
return $default(_that.popular,_that.topRated,_that.trending,_that.upcoming);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MovieSection popular,  MovieSection topRated,  MovieSection trending,  MovieSection upcoming)?  $default,) {final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that.popular,_that.topRated,_that.trending,_that.upcoming);case _:
  return null;

}
}

}

/// @nodoc


class _MoviesState implements MoviesState {
  const _MoviesState({this.popular = const MovieSection.loading(), this.topRated = const MovieSection.loading(), this.trending = const MovieSection.loading(), this.upcoming = const MovieSection.loading()});
  

@override@JsonKey() final  MovieSection popular;
@override@JsonKey() final  MovieSection topRated;
@override@JsonKey() final  MovieSection trending;
@override@JsonKey() final  MovieSection upcoming;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoviesStateCopyWith<_MoviesState> get copyWith => __$MoviesStateCopyWithImpl<_MoviesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoviesState&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.topRated, topRated) || other.topRated == topRated)&&(identical(other.trending, trending) || other.trending == trending)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming));
}


@override
int get hashCode => Object.hash(runtimeType,popular,topRated,trending,upcoming);

@override
String toString() {
  return 'MoviesState(popular: $popular, topRated: $topRated, trending: $trending, upcoming: $upcoming)';
}


}

/// @nodoc
abstract mixin class _$MoviesStateCopyWith<$Res> implements $MoviesStateCopyWith<$Res> {
  factory _$MoviesStateCopyWith(_MoviesState value, $Res Function(_MoviesState) _then) = __$MoviesStateCopyWithImpl;
@override @useResult
$Res call({
 MovieSection popular, MovieSection topRated, MovieSection trending, MovieSection upcoming
});


@override $MovieSectionCopyWith<$Res> get popular;@override $MovieSectionCopyWith<$Res> get topRated;@override $MovieSectionCopyWith<$Res> get trending;@override $MovieSectionCopyWith<$Res> get upcoming;

}
/// @nodoc
class __$MoviesStateCopyWithImpl<$Res>
    implements _$MoviesStateCopyWith<$Res> {
  __$MoviesStateCopyWithImpl(this._self, this._then);

  final _MoviesState _self;
  final $Res Function(_MoviesState) _then;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? popular = null,Object? topRated = null,Object? trending = null,Object? upcoming = null,}) {
  return _then(_MoviesState(
popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as MovieSection,topRated: null == topRated ? _self.topRated : topRated // ignore: cast_nullable_to_non_nullable
as MovieSection,trending: null == trending ? _self.trending : trending // ignore: cast_nullable_to_non_nullable
as MovieSection,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as MovieSection,
  ));
}

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionCopyWith<$Res> get popular {
  
  return $MovieSectionCopyWith<$Res>(_self.popular, (value) {
    return _then(_self.copyWith(popular: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionCopyWith<$Res> get topRated {
  
  return $MovieSectionCopyWith<$Res>(_self.topRated, (value) {
    return _then(_self.copyWith(topRated: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionCopyWith<$Res> get trending {
  
  return $MovieSectionCopyWith<$Res>(_self.trending, (value) {
    return _then(_self.copyWith(trending: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionCopyWith<$Res> get upcoming {
  
  return $MovieSectionCopyWith<$Res>(_self.upcoming, (value) {
    return _then(_self.copyWith(upcoming: value));
  });
}
}

// dart format on
