import 'package:flutter/material.dart';
import 'package:webapp/data/movie_data.dart';
import 'package:webapp/model/movie_model.dart';
import 'package:webapp/skeleton_loading/now_skeleton.dart';
import 'package:webapp/skeleton_loading/popular_skeleton.dart';
import 'package:webapp/widget/footer.dart';
import 'package:webapp/widget/icon_searchbar.dart';
import 'package:webapp/widget/main_carousel_slider.dart';
import 'package:webapp/widget/main_drawer.dart';
import 'package:webapp/skeleton_loading/carousel_skeleton.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> _topratedMovies = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMovieData();
    });
  }

  void getMovieData() async {
    var data = MovieData();
    _topratedMovies = await data.fetchTopRatedMovies();
    setState(() {
      isLoading = false;
    });
    // print('xxxxx====${_topratedMovies[0].originalTitle}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconSearchbar(),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Top rated movies',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Flexible(
                    child: isLoading
                        ? CarouselSkeleton()
                        : MainCarouselSlider(
                            topratedMovies: _topratedMovies,
                          ),
                    flex: 2),
                SizedBox(width: 20),
                Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: const Text(
                            'Now playing',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        NowSkeleton(),
                      ],
                    ),
                    flex: 1),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Text(
                'Explore popular movies',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(builder: (context, constraints) {
                double gridviewHight = (constraints.maxWidth / 5) * 1.3 * 4;
                return SizedBox(
                  height: gridviewHight,
                  child: PopularSkeleton(),
                );
              }),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
