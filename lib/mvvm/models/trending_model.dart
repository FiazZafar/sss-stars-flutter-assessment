class TrendingBrand {
  final String avatarUrl;
  final String name;
  final String? description;

  const TrendingBrand({
    required this.avatarUrl,
    required this.name,
    this.description,
  });
}