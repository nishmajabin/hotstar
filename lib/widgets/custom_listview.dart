import 'package:flutter/material.dart';
import 'package:hotstar_clone/models/movies.dart';
import 'package:hotstar_clone/screens/details/movie_details_screen.dart';
import 'package:hotstar_clone/widgets/container.dart';

class ListSection extends StatelessWidget {
  final Future<List<Movie>> moviesfuture;
  final String? title;
  final double itemHeight;
  final double itemWidth;
  final int? itemCount;
  final bool numbers;
  final Widget? languageTabs;
  final Widget? center; // Optional LanguageTabs widget

  const ListSection({
    super.key,
    required this.moviesfuture,
    this.title,
    required this.itemHeight,
    required this.itemWidth,
    this.itemCount,
    this.numbers = false,
    this.languageTabs, 
    this.center// Accepts an optional LanguageTabs widget
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: moviesfuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: center ?? Text(''),);
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'There issue in fetching movies, please try again..',
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              "No movies available",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          final movies = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title ?? '',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 206, 196, 196),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (languageTabs != null) // Show languageTabs only if provided
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: languageTabs!,
                ),
              SizedBox(
                height: itemHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => MovieDetailsPage(movie: movie),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Stack(
                          children: [
                            Container(
                              width: itemWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (numbers)
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
