// To parse this JSON data, do
//
//     final restaurantes = restaurantesFromJson(jsonString);

import 'dart:convert';

import 'package:restaurantes/App/Data/Models/Reviews.dart';

Restaurantes restaurantesFromJson(String str) => Restaurantes.fromJson(json.decode(str));

String restaurantesToJson(Restaurantes data) => json.encode(data.toJson());

class Restaurantes {
    Restaurantes({
        this.slug,
        this.name,
        this.description,
        this.logo,
        this.rating,
        this.foodType,
        this.reviews,
    });

    String slug;
    String name;
    String description;
    String logo;
    String rating;
    List<String> foodType;
    List<Review> reviews;

    factory Restaurantes.fromJson(Map<String, dynamic> json) => Restaurantes(
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        rating: json["rating"].toString(),
        foodType: List<String>.from(json["food_type"].map((x) => x)),
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "description": description,
        "logo": logo,
        "rating": rating,
        "food_type": List<dynamic>.from(foodType.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    };
}


