class News {
  final String? imageUrl;
  final String title;
  final String description;
  final DateTime? publishDate;
  final String blogUrl;
  final String content;

  News({
    required this.content,
    required this.blogUrl,
    required this.publishDate,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  News.fromJson(Map<String, dynamic> json)
      : imageUrl = json['urlToImage'],
        title = json['title'],
        description = json['description'],
        publishDate = json['publishedAt'] != null
            ? DateTime.parse(json['publishedAt'])
            : null,
        blogUrl = json['url'],
        content = json['content'];
}
