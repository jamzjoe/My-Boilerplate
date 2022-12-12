part of 'places_bloc.dart';

@immutable
class PlacesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoadingSuccess extends PlacesState {
  final List<Places> places;

  PlacesLoadingSuccess(this.places);
}

class PlacesLoadingError extends PlacesState {
  final String error;

  PlacesLoadingError(this.error);
}
