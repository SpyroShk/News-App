import 'package:flutter/material.dart';
import 'package:fw_news/models/news.dart';
import 'package:fw_news/providers/news_provider.dart';
import 'package:fw_news/utilities/news_board.dart';
import 'package:provider/provider.dart';
import '../providers/headline_provider.dart';
import '../utilities/appbar.dart';
import '../utilities/banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() => context.read<NewsProvider>().loadEverything());
    Future.microtask(() => context.read<HeadlineProvider>().loadHeadline());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<News> newss = context.watch<NewsProvider>().newss;
    List<News> hnewss = context.watch<HeadlineProvider>().hnewss;
    return Scaffold(
      backgroundColor: const Color(0xFFF8EEE2),
      appBar: appbar(),
      body: context.read<NewsProvider>().isLoading ||
              context.read<HeadlineProvider>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : newss.isEmpty && hnewss.isEmpty
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "No Connection!\nTry again.",
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 2, letterSpacing: 0.25),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<NewsProvider>().loadEverything();
                            context.read<HeadlineProvider>().loadHeadline();
                          },
                          icon: const Icon(Icons.replay_outlined),
                        )
                      ]),
                )
              : CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.only(left: 30),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Top Headlines',
                          style: TextStyle(
                              color: Color(0xFF403B36),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 240,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, _) {
                            return const SizedBox(width: 16);
                          },
                          itemCount: hnewss.length,
                          itemBuilder: (context, index) {
                            News news = hnewss[index];
                            return BannerPage(
                              imageUrl: news.imageUrl,
                              title: news.title,
                              blogUrl: news.blogUrl,
                              content: news.content,
                            );
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.only(left: 30),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'More News',
                          style: TextStyle(
                              color: Color(0xFF403B36),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        News news = newss[index];
                        return NewsBoard(
                          imageUrl: news.imageUrl,
                          title: news.title,
                          content: news.content,
                          publishDate: news.publishDate,
                          blogUrl: news.blogUrl,
                        );
                      }, childCount: newss.length),
                    )
                  ],
                ),
    );
  }
}
