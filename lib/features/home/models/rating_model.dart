class RatingModel {
  const RatingModel({required this.rate, required this.count});
  final num rate;
  final int count;

  Map<String, dynamic> toJson() {
    return {"rate": rate, "count": count};
  }

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }

  @override
  String toString() {
    return 'RatingModel(rate: $rate, count: $count)';
  }
}

/*
    "rating": {
            "rate": 3.9,
            "count": 120
        }
 */
