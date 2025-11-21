import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/newsapp/articledetailsscreen.dart';
import 'package:flutter_application_15cubit/newsapp/newscubit.dart';
import 'package:flutter_application_15cubit/newsapp/newstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Newsapp extends StatefulWidget {
  const Newsapp({super.key});
  //shimmer loading

  @override
  State<Newsapp> createState() => _NewsappState();
}

class _NewsappState extends State<Newsapp> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<Newscubit>(context).Getnews();
  }

  Widget shimmerloading() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 180,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: const Text(
          'Articles ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 3, 3, 3),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: const Color.fromARGB(255, 194, 191, 191),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star_border_outlined, color: Colors.black),
          ),
        ],
      ),
      body: BlocConsumer<Newscubit, Newstates>(
        listener: (context, state) {
          if (state is NewsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is NewsLoading) {
            return shimmerloading();
          } else if (state is NewsLoaded) {
            final news = state.news;
            return ListView.builder(
              itemCount: news.articles?.length ?? 0,
              itemBuilder: (context, index) {
                final article = news.articles![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                ArticleDetailsScreen(article: article),
                        transitionDuration: Duration(seconds: 3),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    child: Row(
                      children: [
                        if (article.urlToImage != null &&
                            article.urlToImage!.isNotEmpty &&
                            article.urlToImage!.toLowerCase() != 'null')
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: article.urlToImage!,
                                  height: 180,
                                  width: 130,
                                  fit: BoxFit.fill,
                                  placeholder:
                                      (context, url) => Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(color: Colors.white),
                                      ),
                                  errorWidget:
                                      (context, url, error) =>
                                          Image.asset("assets/image.jpg"),
                                ),
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: Container(
                              height: 180,
                              width: 130,
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/image.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title ?? "No Title",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 25),
                                Text(
                                  article.description ?? "No Description",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
            );
          }
          return Container();
        },
      ),
    );
  }
}
