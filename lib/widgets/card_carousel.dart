import 'package:flutter/material.dart';

class CardCarousel extends StatefulWidget {
  const CardCarousel({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<String> children;

  @override
  State<CardCarousel> createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  late PageController _pageController;
  var activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.children.length,
      pageSnapping: true,
      controller: _pageController,
      onPageChanged: (page) {
        setState(() {
          activePage = page;
        });
      },
      itemBuilder: (context, pagePosition) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: SizedBox(
            child: Card(
              elevation: 2,
              color: Theme.of(context).backgroundColor.withBlue(100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.68,
                ),
              ),
              //   Container(
              //   margin: const EdgeInsets.all(20.0),
              //   color: Colors.transparent,
              //   width: MediaQuery.of(context).size.width,
              //   height: 150.0,
              //   child: GridView.count(
              //     scrollDirection: Axis.horizontal,
              //     crossAxisCount: 1,
              //     crossAxisSpacing: 8.0,
              //     mainAxisSpacing: 16.0,
              //     children: List.generate(
              //       children.length,
              //       (index) {
              //         return Center(
              //           child: Container(
              //             color: Theme.of(context).primaryColor,
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 const Icon(
              //                   Icons.settings_cell,
              //                   size: 50.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(4.0),
              //                   child: Text(
              //                     children[index],
              //                     textAlign: TextAlign.center,
              //                     style: const TextStyle(
              //                       fontFamily: 'Roboto',
              //                       fontSize: 20,
              //                       fontWeight: FontWeight.bold,
              //                       leadingDistribution:
              //                           TextLeadingDistribution.even,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.settings_cell,
                      size: 50.0,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.children[pagePosition],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          leadingDistribution: TextLeadingDistribution.even,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //,
        );
      },
    );
  }
}
