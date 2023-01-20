import 'package:flutter/material.dart';
import 'package:proj_estudos2/models/movies_model.dart';
import 'package:proj_estudos2/pages/details_page.dart';
import 'package:proj_estudos2/utils/apis_util.dart';

class CustomMovieListWidget extends StatelessWidget {
  final Movie movie;
  final EdgeInsets padding;

  const CustomMovieListWidget({
    super.key,
    required this.movie,
    this.padding = const EdgeInsets.only(),
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsPage(movie: movie),
            fullscreenDialog: true,
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          width: size.width,
          padding: padding,
          child: Image.network(
            API.REQUEST_IMG(movie.posterPath),
            loadingBuilder: (_, child, progress) {
              if (progress == null) return child;
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xFFFFCC00),
                  color: Color(0xFFFFCC00),
                ),
              );
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
