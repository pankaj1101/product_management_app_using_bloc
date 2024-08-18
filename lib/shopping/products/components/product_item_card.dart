import 'package:flutter/material.dart';

class ProductItemCard extends StatelessWidget {
  final String title, imageUrl, productPrice, rating;
  final VoidCallback onTapProductItem, onTapAddTOCart;

  const ProductItemCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTapProductItem,
    required this.onTapAddTOCart,
    required this.productPrice,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTapProductItem,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child; // Image loaded successfully
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                        value: progress.expectedTotalBytes != null
                            ? progress.cumulativeBytesLoaded /
                                (progress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(productPrice),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: onTapAddTOCart,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(rating),
          ],
        ),
      ),
    );
  }
}
