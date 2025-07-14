import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstar_clone/apisetting/api.dart';
import 'package:hotstar_clone/apisetting/constant.dart';
import 'package:hotstar_clone/widgets/colors.dart';
import 'package:hotstar_clone/models/movies.dart';
import 'package:hotstar_clone/widgets/container.dart';
import 'package:hotstar_clone/widgets/custom_horizontal.dart';
import 'package:hotstar_clone/widgets/custom_listview.dart';
import 'package:hotstar_clone/widgets/langugage_tab.dart';
import 'package:hotstar_clone/widgets/logo_appbar.dart';
import 'package:hotstar_clone/widgets/watchnow_button.dart';
import 'package:hotstar_clone/widgets/widget_category_dot.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> latestMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> comingSoonMovies;

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
                      future: trendingMovies,
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
                  LogoAppbar(),
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
                  CircleContainer(count: 7),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListSection(
                    moviesfuture: latestMovies,
                    title: 'Latest Releases',
                    itemHeight: 155,
                    itemWidth: 130,
                  ),
                  const SizedBox(height: 20),
                  ListSection(
                    moviesfuture: trendingMovies,
                    title: 'Popular Shows',
                    itemHeight: 155,
                    itemWidth: 130,
                    center: CustomCircularLoading(),
                  ),
                  const SizedBox(height: 20),
                  ListSection(
                    moviesfuture: topRatedMovies,
                    title: 'Top Rated Movies',
                    itemHeight: 155,
                    itemWidth: 130,
                    itemCount: 12,
                    languageTabs: const LanguageTabs(
                      languages: [
                        'All',
                        'Hindi',
                        'English',
                        'Tamil',
                        'Telugu',
                        'Malayalam',
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListSection(
                    moviesfuture: comingSoonMovies,
                    title: 'Coming Soon',
                    itemHeight: 155,
                    itemWidth: 130,
                    itemCount: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: custom_horizontal(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
