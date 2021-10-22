class PostFeed {
  String? title;
  String? description;
  String? image;

  PostFeed({this.title, this.description, this.image});

  PostFeed.fromJson(Map<String, dynamic> data) {
    this.title = data['title']??" There is no title";
    this.description = data['description'];
    this.image = data['image'];
  }
}
