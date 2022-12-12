import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_boilerplate/models/places.dart';
import 'package:my_boilerplate/repository/places_repository.dart';

part 'places_event.dart';
part 'places_state.dart';

final PlacesRepository _placesRepository = PlacesRepository();

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesBloc() : super(PlacesInitial()) {
    on<PlacesEvent>((event, emit) {});

    on<LoadPlaces>((event, emit) async {
      
      emit(PlacesInitial());
      emit(PlacesLoading());
      try {
        final places = await _placesRepository.getPlaces();
        emit(PlacesLoadingSuccess(places));
      } catch (error) {
        emit(PlacesLoadingError(error.toString()));
      }
    });
  }
}
