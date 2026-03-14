import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            const Icon(Icons.search, color: Color(0xFFAAAAAA), size: 20),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Search your product...',
                style:
                    TextStyle(fontSize: 13, color: Color(0xFFBBBBBB)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.tune,
                color: Color(0xFF4A90D9),
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBarWithAvatar extends StatelessWidget {
  const SearchBarWithAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.search,
                      color: Color(0xFFAAAAAA), size: 20),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Air Jordan 1, dark mocha',
                      style: TextStyle(
                          fontSize: 13, color: Color(0xFF888888)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.tune,
                        color: Color(0xFF4A90D9), size: 18),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Avatar with notification badge
          Stack(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xFF4A90D9), width: 2),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: 'https://i.pravatar.cc/80?img=10',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4A90D9),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                          fontSize: 9,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

