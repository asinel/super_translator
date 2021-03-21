import 'package:freezed_annotation/freezed_annotation.dart';

part 'loadable.freezed.dart';

@freezed
class Loadable<T> with _$Loadable<T> {

  factory Loadable(int key, T data, {@Default(false) bool isLoading, Exception? error}) = _Loadable;
}