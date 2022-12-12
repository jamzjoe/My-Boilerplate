import 'package:flutter/material.dart';
import 'package:my_boilerplate/bloc/places/places_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/components/loading.dart';
import 'package:my_boilerplate/components/placesTile.dart';
import 'package:my_boilerplate/models/places.dart';

class Beach extends StatefulWidget {
  const Beach({super.key});

  @override
  State<Beach> createState() => _BeachState();
}

class _BeachState extends State<Beach> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesBloc, PlacesState>(
      listener: (context, state) {
        if (state is PlacesLoadingError) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 1)));
        }
      },
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
        return Scaffold(
          body: Container(),
        );
      },
    );
  }

  Widget createPlacesTiles(Places e) => PlacesTiles(e: e);
}
