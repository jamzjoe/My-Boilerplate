import 'package:flutter/material.dart';
import 'package:my_boilerplate/bloc/places/places_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/components/error.dart';
import 'package:my_boilerplate/components/loading.dart';
import 'package:my_boilerplate/components/placesTile.dart';
import 'package:my_boilerplate/models/places.dart';

class Camping extends StatefulWidget {
  const Camping({super.key});

  @override
  State<Camping> createState() => _CampingState();
}

class _CampingState extends State<Camping> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesBloc, PlacesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PlacesLoadingSuccess) {
          return RefreshIndicator(
            onRefresh: (() async {
              setState(() {
                BlocProvider.of<PlacesBloc>(context).add(LoadPlaces());
              });
            }),
            child: ListView(
              children: state.places.map(createPlacesTiles).toList(),
            ),
          );
        } else if (state is PlacesLoading) {
          return const Loading();
        }
        return ErrorScreen(function: () {
          loadPlaces(context);
        });
      },
    );
  }

  void loadPlaces(BuildContext context) {
    setState(() {
      BlocProvider.of<PlacesBloc>(context).add(LoadPlaces());
    });
  }

  Widget createPlacesTiles(Places e) => PlacesTiles(e: e);
}
