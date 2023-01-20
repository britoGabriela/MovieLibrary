import 'package:flutter/material.dart';
import 'package:proj_estudos2/models/movies_model.dart';
import 'package:proj_estudos2/widgets/custom_movie_list_widget.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF01002C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF01002C),
        centerTitle: true,
        title: Text(movie.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * .5,
            child: CustomMovieListWidget(movie: movie),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      height: size.height * .026,
                      width: size.width * .053,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCC00),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Text(
                        movie.voteAverage.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: size.height * .026,
                      width: size.width * .053,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCC00),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Text(
                        movie.originalLanguage,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
