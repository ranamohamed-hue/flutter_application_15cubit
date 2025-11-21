import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/newsapp/articlecubit.dart';
import 'package:flutter_application_15cubit/newsapp/articlestates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Widget لإظهار السطر بالايقونة
class ArticlesDetailRow extends StatelessWidget {
  final String content;
  final Icon icon;

  const ArticlesDetailRow({
    super.key,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 129, 126, 125),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleDetailsScreen extends StatelessWidget {
  final dynamic article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    context.read<ArticleCubit>().fetchArticle(article);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: const Text(
          'Article Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticleLoaded) {
            final articleData = state.article;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الصورة
                    if (articleData.urlToImage != null &&
                        articleData.urlToImage!.isNotEmpty)
                      Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,
                          clipBehavior: Clip.antiAlias,
                          child: CachedNetworkImage(
                            imageUrl: articleData.urlToImage!,
                            width: double.infinity,
                            height: 220,
                            fit: BoxFit.fill,
                            placeholder:
                                (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height: 220,
                                    color: Colors.white,
                                  ),
                                ),
                            errorWidget:
                                (context, url, error) =>
                                    const Icon(Icons.broken_image, size: 50),
                          ),
                        ),
                      ),
                    const SizedBox(height: 15),

                    // العنوان
                    Text(
                      articleData.title ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // معلومات الكاتب والتاريخ
                    Row(
                      children: [
                        Expanded(
                          child: ArticlesDetailRow(
                            icon: const Icon(Icons.person, color: Colors.black),
                            content:
                                articleData.author ?? 'No Author available',
                          ),
                        ),
                        Expanded(
                          child: ArticlesDetailRow(
                            icon: const Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                            content:
                                articleData.publishedAt ?? 'No date available',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // المحتوى
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ArticlesDetailRow(
                        icon: const Icon(Icons.book, color: Colors.black),
                        content: articleData.content ?? 'No Content Available',
                      ),
                    ),
                    const SizedBox(height: 15),

                    // الوصف
                    ArticlesDetailRow(
                      icon: const Icon(Icons.description, color: Colors.black),
                      content: articleData.description ?? 'No Description',
                    ),
                    const SizedBox(height: 15),

                    // المصدر
                    ArticlesDetailRow(
                      icon: const Icon(Icons.source, color: Colors.black),
                      content: articleData.source?.name ?? 'No Source',
                    ),
                    const SizedBox(height: 20),

                    // الأزرار
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<ArticleCubit>().fetchArticle(
                                articleData,
                              );
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: Colors.black,
                              size: 20,
                            ),
                            label: const Text(
                              "Refresh",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shadowColor: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // شارك المقال
                            },
                            icon: const Icon(
                              Icons.share,
                              size: 20,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "Share",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shadowColor: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ArticleError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
