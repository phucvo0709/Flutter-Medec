import 'package:fl_medec/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage, keepPage: false);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void jumpToPage(int page, int pageLength) {
    if (page + 1 < pageLength) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          page + 1,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);
    final pageList = pageProvider.pages;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: pageList.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        var page = pageList[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(page.imageUrl),
                            SizedBox(
                              height: 57.0,
                            ),
                            Text(
                              page.title,
                              style: TextStyle(
                                color: Color.fromRGBO(51, 51, 72, 1),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              page.body,
                              style: TextStyle(
                                color: Color.fromRGBO(51, 51, 72, 1),
                                letterSpacing: 2.0,
                              ),
                            ),
                            SizedBox(
                              height: 165.0,
                            ),
                            OutlineButton(
                              onPressed: () {
                                jumpToPage(index, pageList.length);
                              },
                              color: Colors.transparent,
                              borderSide: BorderSide(
                                color: Color.fromRGBO(122, 63, 225, 1),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              padding:
                                  EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 15.0),
                              textColor: Color.fromRGBO(122, 63, 225, 1),
                              child: Container(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 21.0,
                                    letterSpacing: 1.6,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
