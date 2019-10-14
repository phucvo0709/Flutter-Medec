import 'package:fl_medec/models/slider_model.dart';
import 'package:flutter/widgets.dart';

class SliderProvider with ChangeNotifier {
  List<SliderModel> _sliders = [
    SliderModel(
      imageUrl: "assets/images/Group 1546.png",
    ),
    SliderModel(
      imageUrl: "assets/images/Group 1546.png",
    ),
    SliderModel(
      imageUrl: "assets/images/Group 1546.png",
    ),
  ];

  List<SliderModel> get sliders {
    return [..._sliders];
  }
}
