import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstar_clone/apisetting/api.dart';
import 'package:hotstar_clone/apisetting/constant.dart';
import 'package:hotstar_clone/widgets/colors.dart';
import 'package:hotstar_clone/models/movies.dart';
import 'package:hotstar_clone/widgets/container.dart';
import 'package:hotstar_clone/widgets/custom_listview.dart';
import 'package:hotstar_clone/widgets/watchnow_button.dart';
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
                          return CustomCircularLoading();
                        }
                      },
                    ),
                  ),
                  CustomContainer(),
                  Positioned(
                    bottom: 40,
                    left: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetCategoryDot(),
                        SizedBox(height: 15),
                        WatchnowButton(),
                      ],
                    ),
                  ),
                  CircleContainer(count: 5),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 15),
                  ListSection(
                    moviesfuture: topRatedMovies,
                    title: 'Top Picks For You!',
                    itemHeight: 250,
                    itemWidth: 200,
                    itemCount: 12,
                  ),
                  const SizedBox(height: 20),
                  ListSection(
                    moviesfuture: popularMovies,
                    title: 'Popular Shows',
                    itemHeight: 250,
                    itemWidth: 200,
                    itemCount: 12,
                    center: CustomCircularLoading(),
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
