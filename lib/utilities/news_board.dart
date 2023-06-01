import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fw_news/extensions/nav_extension.dart';
import 'package:fw_news/screens/news_details.dart';

class NewsBoard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final DateTime? publishDate;
  final String blogUrl;
  final String content;
  const NewsBoard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.publishDate,
      required this.content,
      required this.blogUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        context.push(NewsDetails(
            imageUrl: imageUrl,
            title: title,
            publishDate: publishDate,
            blogUrl: blogUrl,
            content: content));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageUrl == null
                  ? const Icon(Icons.error)
                  : CachedNetworkImage(
                      width: screenSize.width * 0.2,
                      height: screenHeight * 0.07,
                      imageUrl: imageUrl ?? "https://picsum.photos/200/300",
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: screenSize.width * 0.65,
              height: screenHeight * 0.08,
              child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF595550)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
