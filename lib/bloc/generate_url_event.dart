part of 'generate_url_bloc.dart';

sealed class GenerateUrlEvent extends Equatable {
  const GenerateUrlEvent();

  @override
  List<Object> get props => [];
}

final class onButtonPressed extends GenerateUrlEvent {
  final String url;
  onButtonPressed({required this.url});
}
