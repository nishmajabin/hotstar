import 'package:flutter/material.dart';
import 'package:hotstar_clone/models/movies.dart';
import 'package:hotstar_clone/screens/details/movie_details_screen.dart';
import 'package:hotstar_clone/widgets/container.dart';

class ListSectionOfDetailScreen extends StatelessWidget {
  final Future<List<Movie>> moviesfuture;
  final String? title;
  final double itemHeight;
  final double itemWidth;
  final int? itemCount;
  final bool numbers;
  final Widget? languageTabs;

  const ListSectionOfDetailScreen({
    super.key,
    required this.moviesfuture,
    this.title,
    required this.itemHeight,
    required this.itemWidth,
    this.itemCount,
    this.numbers = false,
    this.languageTabs,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: moviesfuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CustomCircularLoading());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'There is an issue in fetching movies, please try again..',
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
              if (title != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 206, 196, 196),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (languageTabs != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: languageTabs!,
                ),
              SizedBox(
                height: itemHeight * 2 + 10, // height for 2 posters + spacing
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (movies.length / 2).ceil(), // pair two per column
                  itemBuilder: (context, index) {
                    final first = movies[index * 2];
                    final second =
                        (index * 2 + 1 < movies.length)
                            ? movies[index * 2 + 1]
                            : null;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Column(
                        children: [
                          _buildPoster(context, first),
                          const SizedBox(height: 5),
                          if (second != null) _buildPoster(context, second),
                        ],
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

  Widget _buildPoster(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(movie: movie),
          ),
        );
      },
      child: Container(
        width: itemWidth,
        height: itemHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
