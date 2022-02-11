import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb_app/models/movie.dart';
import 'package:get_it/get_it.dart';

class MovieTile extends StatelessWidget {
  final double height;
  final double width;
  final Movie movie;

  final getIt = GetIt.instance;

  MovieTile({required this.height, required this.width, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _poster(movie.posterUrl()),
          _info(),
        ],
      ),
    );
  }

  Widget _poster(String imageUrl) {
    return Container(
      height: height,
      width: width * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }

  Widget _info() {
    return Container(
      width: width * 0.66,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              SizedBox(
                width: width * 0.56,
                child: Text(
                  movie.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                movie.rating.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: height * 0.02),
            child: Text(
              "${movie.language.toUpperCase()} | R: ${movie.isAdult} | ${movie.releaseDate}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: height * 0.07),
            child: Text(
              movie.description,
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
