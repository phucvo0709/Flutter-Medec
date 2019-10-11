import 'package:fl_medec/models/page_model.dart';
import 'package:flutter/widgets.dart';

class PageProvider with ChangeNotifier {
  List<PageModel> _pages = [
    PageModel(
      imageUrl: "assets/images/f1.png",
      title: 'Search Doctor',
      body: 'Get list of best doctor nearby you',
    ),
    PageModel(
      imageUrl: "assets/images/f2.png",
      title: 'Book Appointment',
      body: 'Book an appointment with a right doctor',
    ),
    PageModel(
      imageUrl: "assets/images/f3.png",
      title: 'Search Doctor',
      body: 'Search and book diagnostic test',
    ),
  ];

  List<PageModel> get pages {
    return [..._pages];
  }
}
