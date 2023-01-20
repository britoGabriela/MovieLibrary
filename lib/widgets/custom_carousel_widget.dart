import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselWidget extends StatelessWidget {
  final int itemCount;
  final double viewportFraction;
  final double height;
  final ExtendedIndexedWidgetBuilder itemBuilder;
  final int initialPage;
  final bool padEnds;
  final bool autoPlay;
  final CarouselController? carouselController;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;

  const CustomCarouselWidget({
    super.key,
    required this.itemCount,
    required this.viewportFraction,
    required this.height,
    required this.itemBuilder,
    this.initialPage = 0,
    this.padEnds = false,
    this.autoPlay = false,
    this.carouselController,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    int pageOnTap = 0;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: itemCount,
          carouselController: carouselController,
          options: CarouselOptions(
            initialPage: initialPage,
            padEnds: padEnds,
            viewportFraction: viewportFraction,
            height: height,
            autoPlay: autoPlay,
            onPageChanged: onPageChanged,
          ),
          itemBuilder: itemBuilder,
        ),
        
      ],
    );
  }
}
