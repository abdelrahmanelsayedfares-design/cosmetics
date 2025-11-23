import 'package:cosmetics/core/ui/app_images.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  MoviesData? model;
  void getData() async {
    final weather = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/'));

    final response = await weather.get(
      '3/discover/movie',
      queryParameters: {'api_key': '2001486a0f63e9e4ef9c4da157ef37cd'},
    );
    print(response.data);
    model = MoviesData.fromJson(response.data);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Movies'))),
      body: model == null
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: model!.list.length,
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Container(
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: AppImage(
                          image:
                              'http://image.tmdb.org/t/p/original${model!.list[index].backdropPath}',
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      model!.list[index].originalTitle,
                      style: TextStyle(fontSize: 12,
                      fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class MoviesData {
  late final int page;
  late final List<MovieModel> list;
  late final int totalPages;
  late final int totalResults;

  MoviesData.fromJson(Map<String, dynamic> json) {
    page = json['page'] ?? 0;
    list = List.from(
      json['results'] ?? [],
    ).map((e) => MovieModel.fromJson(e)).toList();
    totalPages = json['total_pages'] ?? 0;
    totalResults = json['total_results'] ?? 0;
  }
}

class MovieModel {
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final num popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final num voteAverage;
  late final num voteCount;

  MovieModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] ?? false;
    backdropPath = json['backdrop_path'] ?? "";
    genreIds = List.castFrom<dynamic, int>(json['genre_ids'] ?? []);
    id = json['id'] ?? 0;
    originalLanguage = json['original_language'] ?? "";
    originalTitle = json['original_title'] ?? "";
    overview = json['overview'] ?? "";
    popularity = json['popularity'] ?? 0;
    posterPath = json['poster_path'] ?? "";
    releaseDate = json['release_date'] ?? "";
    title = json['title'] ?? "";
    video = json['video'] ?? false;
    voteAverage = json['vote_average'] ?? 0;
    voteCount = json['vote_count'] ?? 0;
  }
}
