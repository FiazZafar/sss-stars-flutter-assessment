class ProductItem {
  final String id;
  final String imageUrl;
  final String title;
  final String price;
  final String sellerAvatar;
  // aspectRatio comes from backend image metadata
  // tall images > 1.2, wide images < 0.8, square ≈ 1.0
  final double aspectRatio;

  const ProductItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.sellerAvatar,
    this.aspectRatio = 1.0,
  });

  // ── Factory from Firestore document ──────────────────────
  // Later you will use this when fetching from Firebase:
  //
  // factory ProductItem.fromFirestore(DocumentSnapshot doc) {
  //   final data = doc.data() as Map<String, dynamic>;
  //   return ProductItem(
  //     id: doc.id,
  //     imageUrl: data['imageUrl'] ?? '',
  //     title: data['title'] ?? '',
  //     price: data['price'] ?? '',
  //     sellerAvatar: data['sellerAvatar'] ?? '',
  //     aspectRatio: (data['aspectRatio'] as num?)?.toDouble() ?? 1.0,
  //   );
  // }
}
