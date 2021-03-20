import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String code;
  final String name;

  Language(this.code, this.name);

  @override
  List<Object> get props => [code, name];
}