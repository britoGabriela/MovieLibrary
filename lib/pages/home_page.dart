import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proj_estudos2/controllers/movies_controller.dart';
import 'package:proj_estudos2/models/movies_model.dart';
import 'package:proj_estudos2/repositories/movies_repository_imp.dart';
import 'package:proj_estudos2/services/dio_service_imp.dart';
import 'package:proj_estudos2/widgets/custom_bottom_navigationbar_widget.dart';
import 'package:proj_estudos2/widgets/custom_carousel_widget.dart';
import 'package:proj_estudos2/widgets/custom_titles_widget.dart';
import 'package:proj_estudos2/widgets/custom_movie_list_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MoviesController _controller = MoviesController(
    MoviesRepositoryImp(DioServiceImp()),
  );

  int pageOnTap = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: const Color(0xFF01002C),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * .20,
              child: ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 60),
                      child: Column(
                        children: [
                          const CustomTitlesWidget(
                            alignment: Alignment.center,
                            title: 'STRING',
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomTitlesWidget(
                                onTap: () {},
                                title: 'Todos',
                                fontSize: 16,
                              ),
                              CustomTitlesWidget(
                                onTap: () {},
                                title: 'Filmes',
                                fontSize: 16,
                              ),
                              CustomTitlesWidget(
                                onTap: () {},
                                title: 'Séries',
                                fontSize: 16,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              height: size.height * .71,
              child: SingleChildScrollView(
                child: ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return movies != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  CustomCarouselWidget(
                                    itemCount: 5,
                                    initialPage: 3,
                                    viewportFraction: 1,
                                    height: 300,
                                    autoPlay: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        pageOnTap = index;
                                      });
                                    },
                                    itemBuilder: (_, index, __) {
                                      return Stack(
                                        children: [
                                          CustomMovieListWidget(
                                            movie: movies.listMovies[index],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.center,
                                                colors: [
                                                  Color(0xFF01002C)
                                                      .withOpacity(1),
                                                  Color(0xFF01002C)
                                                      .withOpacity(.85),
                                                  Color(0xFF01002C)
                                                      .withOpacity(.55),
                                                  Color(0xFF01002C)
                                                      .withOpacity(.35),
                                                  Color(0xFF01002C)
                                                      .withOpacity(.1),
                                                  Color(0xFF01002C)
                                                      .withOpacity(0),
                                                  Color(0xFF01002C)
                                                      .withOpacity(0),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  AnimatedSmoothIndicator(
                                    activeIndex: pageOnTap,
                                    count: 5,
                                    effect: ColorTransitionEffect(
                                      dotHeight: 8,
                                      dotWidth: 8,
                                      spacing: 12,
                                      dotColor: Colors.grey.withOpacity(.8),
                                      activeDotColor: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              const CustomTitlesWidget(
                                padding: EdgeInsets.only(
                                    left: 15, top: 28, bottom: 8),
                                title: 'Em alta',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomCarouselWidget(
                                itemCount: 10,
                                viewportFraction: 0.35,
                                height: 160,
                                itemBuilder: (_, index, __) {
                                  return CustomMovieListWidget(
                                    padding: const EdgeInsets.only(left: 8),
                                    movie: movies.listMovies[index],
                                  );
                                },
                              ),
                              const CustomTitlesWidget(
                                padding: EdgeInsets.only(
                                    left: 15, top: 24, bottom: 8),
                                title: 'Lançamentos',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomCarouselWidget(
                                itemCount: movies.listMovies.length,
                                initialPage: 3,
                                viewportFraction: 0.35,
                                height: 160,
                                itemBuilder: (_, index, __) {
                                  return CustomMovieListWidget(
                                    padding: const EdgeInsets.only(left: 8),
                                    movie: movies.listMovies[index],
                                  );
                                },
                              ),
                              const CustomTitlesWidget(
                                padding: EdgeInsets.only(
                                    left: 15, top: 24, bottom: 8),
                                title: 'Sugestões',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomCarouselWidget(
                                itemCount: movies.listMovies.length,
                                initialPage: 8,
                                viewportFraction: 0.35,
                                height: 160,
                                itemBuilder: (_, index, __) {
                                  return CustomMovieListWidget(
                                    padding: const EdgeInsets.only(left: 8),
                                    movie: movies.listMovies[index],
                                  );
                                },
                              ),
                              const SizedBox(height: 30),
                            ],
                          )
                        : Center(child: Lottie.asset('assets/lottie.json'));
                  },
                ),
              ),
            ),
            ValueListenableBuilder<Movies?>(
              valueListenable: _controller.movies,
              builder: (_, movies, __) {
                return Visibility(
                  visible: movies != null,
                  child: const CustomBottomNavigationBarWidget(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
