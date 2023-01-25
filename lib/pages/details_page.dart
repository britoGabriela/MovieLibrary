import 'package:flutter/material.dart';
import 'package:proj_estudos2/models/movies_model.dart';
import 'package:proj_estudos2/pages/home_page.dart';
import 'package:proj_estudos2/widgets/custom_bottom_navigationbar_widget.dart';
import 'package:proj_estudos2/widgets/custom_elevated_buttom_widget.dart';
import 'package:proj_estudos2/widgets/custom_titles_widget.dart';
import 'package:proj_estudos2/widgets/custom_movie_list_widget.dart';

class DetailsPage extends StatefulWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF01002C),
      body: Column(
        children: [
          SizedBox(
            child: Container(
              height: size.height * .1,
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.cast),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .82,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .58,
                    child: Stack(
                      children: [
                        CustomMovieListWidget(movie: widget.movie),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                const Color(0xFF01002C).withOpacity(1),
                                const Color(0xFF01002C).withOpacity(1),
                                const Color(0xFF01002C).withOpacity(1),
                                const Color(0xFF01002C).withOpacity(1),
                                const Color(0xFF01002C).withOpacity(.5),
                                const Color(0xFF01002C).withOpacity(0),
                                const Color(0xFF01002C).withOpacity(0),
                                const Color(0xFF01002C).withOpacity(0),
                              ],
                            ),
                          ),
                        ),
                        CustomTitlesWidget(
                          alignment: const Alignment(0, .8),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          title: widget.movie.title,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTitlesWidget(
                              alignment: const Alignment(0, .95),
                              padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFCC00),
                                  borderRadius: BorderRadius.circular(4)),
                              title: 'IMDb',
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                            CustomTitlesWidget(
                              alignment: const Alignment(0, .92),
                              padding: const EdgeInsets.only(left: 2, top: 30),
                              title: widget.movie.voteAverage.toString(),
                              color: const Color(0xFFBBBBBB),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0400FF),
                        fixedSize: Size(size.width, size.height * .06),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.play_arrow),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'A S S I S T I R',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomElevatedButtonWidget(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow_outlined,
                          size: 32,
                        ),
                        title: 'Trailer',
                      ),
                      CustomElevatedButtonWidget(
                        onPressed: () {
                          setState(() {
                            tapped = !tapped;
                          });
                        },
                        icon: Icon(
                          tapped ? Icons.check : Icons.add,
                          color: const Color(0xFFBBBBBB),
                          size: 32,
                        ),
                        title: 'Minha Lista',
                      ),
                      CustomElevatedButtonWidget(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.vertical_align_bottom,
                          size: 30,
                        ),
                        title: 'Download',
                      ),
                    ],
                  ),
                  CustomTitlesWidget(
                    padding: const EdgeInsets.only(
                        left: 15, top: 12, right: 15, bottom: 30),
                    title: widget.movie.overview,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * .08,
            child: const CustomBottomNavigationBarWidget(),
          )
        ],
      ),
    );
  }
}
