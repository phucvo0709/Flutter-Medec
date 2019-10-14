import 'package:fl_medec/providers/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderHome extends StatefulWidget {
  @override
  _SliderHomeState createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  PageController _sliderController;
  int currentSlider = 0;

  @override
  void initState() {
    super.initState();
    _sliderController = PageController(
        initialPage: currentSlider, viewportFraction: 0.8, keepPage: false);
  }

  @override
  void dispose() {
    _sliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(context);
    final sliders = sliderProvider.sliders;
    return Center(
      child: Container(
        child: PageView.builder(
          controller: _sliderController,
          itemCount: sliders.length,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _sliderController,
              builder: (context, child) {
                var slider = sliders[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    slider.imageUrl,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
