class Review {
    Review({
        this.slug,
        this.restaurant,
        this.email,
        this.comments,
        this.rating,
        this.created,
    });

    String slug;
    String restaurant;
    String email;
    String comments;
    String rating;
    DateTime created;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        slug: json["slug"],
        restaurant: json["restaurant"],
        email: json["email"],
        comments: json["comments"],
        rating: json["rating"].toString(),
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "restaurant": restaurant,
        "email": email,
        "comments": comments,
        "rating": rating,
        "created": created.toIso8601String(),
    };
}