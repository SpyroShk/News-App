import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fw_news/extensions/nav_extension.dart';
import '../screens/news_details.dart';

class BannerPage extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final DateTime? publishDate;
  final String blogUrl;
  final String content;

  const BannerPage(
      {Key? key,
      required this.imageUrl,
      required this.title,
      this.publishDate,
      required this.blogUrl,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        context.push(
          NewsDetails(
            imageUrl: imageUrl,
            title: title,
            publishDate: publishDate,
            blogUrl: blogUrl,
            content: content,
          ),
        );
      }),
      child: SizedBox(
        width: 243,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: imageUrl ?? "https://picsum.photos/200/300",
                fit: BoxFit.cover,
                height: 137,
                width: 243,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 55,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Color(0xFF403B36),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
