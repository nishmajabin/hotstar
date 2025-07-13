import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hotstar_clone/apisetting/api.dart';
import 'package:hotstar_clone/widgets/colors.dart';
import 'package:hotstar_clone/models/movies.dart';
import 'package:hotstar_clone/screens/searching/category.dart';
import 'package:hotstar_clone/widgets/container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  late Future<List<Movie>> _movies;
  List<Movie> _filteredMovies = [];
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  bool _isSearching = false; // To track loading state

  @override
  void initState() {
    super.initState();
    _movies = ApiCalling().getLatestMovies();
    _searchController.addListener(_onSearchChanged);
    _focusNode.addListener(() {
      setState(() {}); // rebuild to update UI on focus change
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    setState(() {
      _isSearching = true; // Show loading icon
    });

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      String query = _searchController.text.trim().toLowerCase();
      log('Searching for: $query');

      if (query.isEmpty) {
        setState(() {
          _filteredMovies = [];
          _isSearching = false; // Hide loading icon
        });
        return;
      }

      List<Movie> allMovies = await _movies;
      List<Movie> filteredResults =
          allMovies
              .where((movie) => movie.title.toLowerCase().contains(query))
              .toList();

      setState(() {
        _filteredMovies = filteredResults;
        _isSearching = false;
      });
    });
  }

  List<String> trendingCategories = [
    'India',
    'Movies',
    'Shows',
    'Action',
    'Comedy',
    'Crime',
    'Drama',
    'Romance',
    'Thriller',
    'Horror',
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus;

    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Updated search bar with SearchBarWidget UI
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 12, right: 12),
            child: Container(
              height: 42, // compact height
              decoration: BoxDecoration(
                color:
                    isFocused
                        ? const Color.fromARGB(138, 72, 73, 79)
                        : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: "Search for 'movies'",
                  hintStyle: TextStyle(
                    color:
                        isFocused
                            ? const Color.fromARGB(157, 255, 255, 255)
                            : const Color.fromARGB(248, 15, 15, 20),
                    fontSize: 13,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child:
                        _isSearching
                            ? Icon(Icons.arrow_back, color: Colors.white)
                            : Icon(
                              CupertinoIcons.search,
                              color: isFocused ? Colors.white : mainColor,
                              size: 20,
                            ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child:
                        _isSearching
                            ? Icon(CupertinoIcons.multiply, color: Colors.white)
                            : Icon(
                              Icons.mic_none_outlined,
                              color: isFocused ? Colors.white : mainColor,
                              size: 22.5,
                            ),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 8),
                ),
                style: TextStyle(
                  color: isFocused ? Colors.white : mainColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Category(),
          SizedBox(height: 5),
          Expanded(
            child: FutureBuilder<List<Movie>>(
              future: _movies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CustomCircularLoading());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                List<Movie> movies =
                    _searchController.text.isNotEmpty
                        ? _filteredMovies
                        : snapshot.data ?? [];

                if (movies.isEmpty) {
                  return const Center(
                    child: Text(
                      'No movies found',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return GridView.custom(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: const [
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate((
                    context,
                    index,
                  ) {
                    Movie movie = movies[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/placeholder.png');
                        },
                      ),
                    );
                  }, childCount: movies.length),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
