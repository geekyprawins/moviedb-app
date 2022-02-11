import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:themoviedb_app/models/search_category.dart';
import 'package:themoviedb_app/models/movie.dart';

import 'package:themoviedb_app/widgets/movie_tile.dart';

class MainPage extends ConsumerWidget {
  double? _deviceHeight;
  double? _deviceWidth;
  TextEditingController? _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _controller = TextEditingController();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildBg(),
            _buildFg(),
          ],
        ),
      ),
    );
  }

  Widget _buildBg() {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
              'https://thumbs.dreamstime.com/b/imagination-girl-kiss-lion-love-nature-abstract-concept-young-steals-male-wildlife-children-like-to-imagine-play-129595579.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
      ),
    );
  }

  Widget _buildFg() {
    return Container(
      padding: EdgeInsets.only(
        top: _deviceHeight! * 0.02,
      ),
      width: _deviceWidth! * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBar(),
          Container(
            height: _deviceHeight! * 0.83,
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight! * 0.01,
            ),
            child: _moviesLV(),
          ),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: _deviceHeight! * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchField(),
          _categorySelect(),
        ],
      ),
    );
  }

  Widget _searchField() {
    return Container(
      height: _deviceHeight! * 0.05,
      width: _deviceWidth! * 0.50,
      child: TextField(
        controller: _controller,
        onSubmitted: (_input) {},
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white24,
          ),
          hintText: "Search...",
          hintStyle: TextStyle(
            color: Colors.white54,
          ),
          fillColor: Colors.white24,
          filled: false,
        ),
      ),
    );
  }

  Widget _categorySelect() {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: SearchCategory.popular,
          child: Text(
            SearchCategory.popular,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.upcoming,
          child: Text(
            SearchCategory.upcoming,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.none,
          child: Text(
            SearchCategory.none,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
      dropdownColor: Colors.black38,
      value: SearchCategory.popular,
      icon: const Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (_value) {},
    );
  }

  Widget _moviesLV() {
    final List<Movie> _movies = [];
    if (_movies.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight! * 0.01,
              horizontal: 0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: MovieTile(
                movie: _movies[index],
                width: _deviceWidth! * 0.85,
                height: _deviceHeight! * 0.20,
              ),
            ),
          );
        },
        itemCount: _movies.length,
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
