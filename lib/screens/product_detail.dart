import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  String _formatDate(DateTime date) {
    // Simple date formatter without intl package
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail image
            if (product.thumbnail.isNotEmpty)
              Image.network(
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              // category and featured
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 0, 0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      product.category.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4.0),
                      margin: const EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 243, 208),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(

                          fontSize: 12,
                        ),
                      ),
                    ),
                ]
              ),
            
                  // Product name
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: 
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          height: 1.25
                        ),
                      ),
                      
                  ),
                  
                  // Price
                  Row(
                    children: [
                      const SizedBox(width: 2),
                      Text(
                        'Rp ${product.price}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red[700],
                          fontWeight: FontWeight.w600,
                          height: 1.375
                        ),
                      ),
                    ],
                  ),

                  // Date
                  Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: 
                      
                      // const SizedBox(width: 2),
                      Text(
                        _formatDate(product.addedAt),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    
                  ),
                  const SizedBox(height: 8),

                  const Divider(height: 32),

                  // Description
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),

                  // Merchant
                  Row(
                    children: [
                      const Text(
                        'Merchant: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.username, // pastikan ProductEntry punya field username
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}