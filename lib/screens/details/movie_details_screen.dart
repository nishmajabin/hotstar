import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotstar_clone/screens/details/action_button.dart';
import 'package:hotstar_clone/apisetting/api.dart';
import 'package:hotstar_clone/models/movies.dart';
import 'package:hotstar_clone/widgets/listview_detailscreen.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  late Future<List<Movie>> comingSoonMovies;
  late Future<List<Movie>> trendingMovies;

  @override
  void initState() {
    super.initState();
    comingSoonMovies = ApiCalling().getComingSoonMovies();
    trendingMovies = ApiCalling().getTrendingMovies();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 200 && !_isScrolled) {
        setState(() => _isScrolled = true);
      } else if (_scrollController.offset <= 200 && _isScrolled) {
        setState(() => _isScrolled = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: const Color.fromARGB(255, 176, 176, 176),
                    size: 25,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
              titleSpacing: 8,
              automaticallyImplyLeading: false,
              title:
                  _isScrolled
                      ? Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                      : null,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie Title Logo Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: SizedBox(
                      height: 60,
                      child: Center(
                        child: Text(
                          movie.title.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Movie Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            "${movie.releaseDate.split('-').first} • U/A 13+ • 2h 3m • 5 Languages",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Watch Now Button
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                                size: 22,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Watch Now",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Genre Tags
                        const Text(
                          "Fantasy | Comedy | Supernatural | Exhilarating | College",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Description
                        Text(
                          movie.overview,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),

                        const SizedBox(height: 32),

                        // Action Buttons Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildActionButton(Icons.add, "Watchlist"),
                            SizedBox(width: 40),
                            buildActionButton(
                              CupertinoIcons.arrowshape_turn_up_right,
                              "Share",
                            ),
                            SizedBox(width: 40),
                            buildActionButton(
                              CupertinoIcons.arrow_down_to_line,
                              "Download",
                            ),
                            SizedBox(width: 40),
                            buildActionButton(Icons.favorite_border, "Rate"),
                          ],
                        ),
                        const SizedBox(height: 40),
                        ListSectionOfDetailScreen(
                          moviesfuture: comingSoonMovies,
                          title: 'More Like This',
                          itemHeight: 170,
                          itemWidth: 130,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
