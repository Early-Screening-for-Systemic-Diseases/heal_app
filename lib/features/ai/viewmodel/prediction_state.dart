import 'package:equatable/equatable.dart';

abstract class PredictionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PredictionInitial extends PredictionState {}

class PredictionLoading extends PredictionState {}

class PredictionSuccess extends PredictionState {
  final String prediction;

  PredictionSuccess(this.prediction);

  @override
  List<Object?> get props => [prediction];
}

class PredictionError extends PredictionState {
  final String message;

  PredictionError(this.message);

  @override
  List<Object?> get props => [message];
}