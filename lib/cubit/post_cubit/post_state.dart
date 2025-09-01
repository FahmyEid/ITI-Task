import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  const PostState();
  @override
  List<Object?> get props => [];
}

class LoadingPostStatae extends PostState {}

class ErrorPostStatae extends PostState {
  final String error;

  const ErrorPostStatae({required this.error});
  @override
  List<Object?> get props => [error];
}

class SucsessPostStatae extends PostState {
  final List products;

  const SucsessPostStatae({required this.products});
  @override
  List<Object?> get props => [products];
}
