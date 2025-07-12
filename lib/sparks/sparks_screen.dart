import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstar_clone/apisetting/api.dart';
import 'package:hotstar_clone/apisetting/constant.dart';
import 'package:hotstar_clone/widgets/colors.dart';
import 'package:hotstar_clone/models/movies.dart';
import 'package:hotstar_clone/widgets/custom_listview.dart';
import 'package:hotstar_clone/widgets/widget_category_dot.dart';

class SparksScreen extends StatefulWidget {
  const SparksScreen({super.key});

  @override
  State<SparksScreen> createState() => _SparksScreenState();
}

class _SparksScreenState extends State<SparksScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> latestMovies;
  late Future<List<Movie>> comingSoonMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> popularMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = ApiCalling().getTrendingMovies();
    latestMovies = ApiCalling().getLatestMovies();
    topRatedMovies = ApiCalling().getTopRatedMovies();
    popularMovies = ApiCalling().getPopularMovies();
    comingSoonMovies = ApiCalling().getComingSoonMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 450, // Prevents overflow
                    child: FutureBuilder(
                      future: comingSoonMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'There issue in fetching movies, please try again..',
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return CarouselSlider(
                            options: CarouselOptions(
                              height: 450,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1.0,
                            ),
                            items:
                                snapshot.data!.map<Widget>((movie) {
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          '${AppApi.imagePath}${movie.posterPath}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withAlpha(153),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 40,
                    left: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildCategory('1Cr Views'),
                            buildDot(),
                            buildCategory('Fukra Insaan'),
                            buildDot(),
                            buildCategory('Hindi'),
                            buildDot(),
                            buildCategory('Game Show'),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 230, // Full width like in the image
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF1083EE), // Blue
                                    Color(0xFFF50057), // Pink/Magenta
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0.5, 1.0],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 21,
                                ),
                                label: Text(
                                  'Watch Now',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    51,
                                    51,
                                    51,
                                  ),
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10, // Position from bottom
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0 ? Colors.white : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'There issue in fetching movies, please try again..',
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        return ListSection(
                          moviesfuture: topRatedMovies,
                          title: 'Top Picks For You!',
                          itemHeight: 250,
                          itemWidth: 200,
                          itemCount: 12,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  ListSection(
                    moviesfuture: popularMovies,
                    title: 'Popular Shows',
                    itemHeight: 250,
                    itemWidth: 200,
                    itemCount: 12,
                  ),
                  const SizedBox(height: 20),
                  ListSection(
                    moviesfuture: latestMovies,
                    title: 'Latest Picks',
                    itemHeight: 125,
                    itemWidth: 200,
                    itemCount: 12,
                  ),
                  const SizedBox(height: 20),
                  ListSection(
                    moviesfuture: trendingMovies,
                    title: 'Now Trending',
                    itemHeight: 250,
                    itemWidth: 200,
                    itemCount: 12,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
