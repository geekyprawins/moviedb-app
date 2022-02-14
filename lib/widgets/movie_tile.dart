import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb_app/models/movie.dart';
import 'package:get_it/get_it.dart';

class MovieTile extends StatelessWidget {
  final double? height;
  final double? width;
  final Movie? movie;

  final getIt = GetIt.instance;

  MovieTile({required this.height, required this.width, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: _poster(movie!.posterUrl())),
            Expanded(flex: 2, child: _info()),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _poster(String imageUrl) {
    return Container(
      height: height!,
      width: width! * 0.30,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }

  Widget _info() {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  movie!.name!,
                  // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                movie!.rating.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Text(
            "${movie!.language!.toUpperCase()} | ${movie!.releaseDate!}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          Text(
            movie!.description!,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
