part of 'generate_url_bloc.dart';

sealed class GenerateUrlState extends Equatable {
  const GenerateUrlState();

  @override
  List<Object> get props => [];
}

final class GenerateUrlInitial extends GenerateUrlState {}

final class GenerateUrlLoading extends GenerateUrlState {}

final class GenerateUrlSuccess extends GenerateUrlState {
  final SuccessResponse successdata;
  GenerateUrlSuccess({required this.successdata});
}

final class GenerateUrlFailed extends GenerateUrlState {}
