import 'package:flutter/material.dart';
import 'package:fw_news/providers/news_provider.dart';
import 'package:fw_news/services/news_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/headline_provider.dart';
import 'screens/home_page.dart';

void main() {
  final NewsService newsService = NewsService();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => NewsProvider(newsService: newsService)),
        ChangeNotifierProvider(
            create: (context) => HeadlineProvider(newsService: newsService)),
      ],
      child: MyApp(newsService: newsService),
    ),
  );
}

class MyApp extends StatelessWidget {
  final NewsService newsService;
  const MyApp({Key? key, required this.newsService}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}
