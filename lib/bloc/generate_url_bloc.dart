import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:urlshortner/gen_repo.dart';
import 'package:urlshortner/models/failed_model.dart';
import 'package:urlshortner/models/success_model.dart';

part 'generate_url_event.dart';
part 'generate_url_state.dart';

class GenerateUrlBloc extends Bloc<GenerateUrlEvent, GenerateUrlState> {
  GenerateUrlBloc() : super(GenerateUrlInitial()) {
    on<onButtonPressed>(_onButtonPressed);
  }

  GenerateUrlRepo manager = GenerateUrlRepo();
  FutureOr<void> _onButtonPressed(
      onButtonPressed event, Emitter<GenerateUrlState> emit) async {
    log('bloc step 1');
    emit(GenerateUrlLoading());

    log('bloc step 2');
    final Either<FailedResponse, SuccessResponse> respo =
        await manager.hitRepocode(event.url);
    log('bloc step 2');

    respo.fold(
      (failedResponse) {
        log('bloc step 4');
        emit(GenerateUrlFailed());
      },
      (successResponse) {
        log('bloc step 3');
        emit(GenerateUrlSuccess(successdata: successResponse));
      },
    );
  }
}
