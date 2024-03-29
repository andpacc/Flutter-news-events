import 'package:example/presentation/pages/play/video_play/video_bloc/play_video_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/models/categories_video.dart';

class SearchVideoDelegate extends SearchDelegate {
  final List<CategoryVideo> categories;

  SearchVideoDelegate({required this.categories});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<PlayVideoBloc, PlayVideoState>(
      builder: (context, state) {
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = categories
        .where((category) =>
            category.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].name),
          onTap: () {
            close(context, suggestions[index]);
          },
        );
      },
    );
  }
}
