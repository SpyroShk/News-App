import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fw_news/extensions/nav_extension.dart';
import 'package:fw_news/screens/web_page.dart';
import 'package:intl/intl.dart';

class NewsDetails extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final DateTime? publishDate;
  final String blogUrl;
  final String content;
  const NewsDetails(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.publishDate,
      required this.blogUrl,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EEE2),
      body: Stack(children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              stretch: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 25, bottom: 10),
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Color(0xFF595550),
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        if (publishDate != null)
                          Text(
                            DateFormat.yMMMd().format(publishDate!),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Text(
                            content,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFF403B36)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(25),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              minWidth: double.infinity,
              height: 50,
              onPressed: () {
                context.push(WebPage(blogUrl: blogUrl));
              },
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Read More',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
