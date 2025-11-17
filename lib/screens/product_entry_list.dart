import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/product_detail.dart';

class ProductEntryListPage extends StatefulWidget {

  final bool showOnlyMine;
  const ProductEntryListPage({super.key, this.showOnlyMine = false});
  

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListState();
}

class _ProductEntryListState extends State<ProductEntryListPage> {
Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
  final response = await request.get('http://localhost:8000/json/');

  // Jika Django mengirim LIST langsung:
  final List<dynamic> rawList = response;

  // ID user login dari CookieRequest (bukan dari JSON)
  final userInfo = await request.get("http://localhost:8000/get-user/");
  final currentUserId = userInfo['user_id'];

  List<ProductEntry> listProduct = rawList
      .map((item) => ProductEntry.fromJson(item))
      .toList();

  for (var p in listProduct) {
    if (p.userId == currentUserId) {
      print("MATCH → product ${p.name} milik user $currentUserId");
    } else {
      print("NOT MATCH → product ${p.name} milik user ${p.userId}, bukan $currentUserId");
    }
  }

  if (widget.showOnlyMine && currentUserId != null) {
    listProduct = listProduct.where((p) => p.userId == currentUserId).toList();
  }


  return listProduct;
}

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
        widget.showOnlyMine ? 'My Products' : 'All Products',
      ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no product yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Show a snackbar when news card is clicked
                    // ScaffoldMessenger.of(context)
                    //   ..hideCurrentSnackBar()
                    //   ..showSnackBar(
                    //     SnackBar(
                    //       content: Text("You clicked on ${snapshot.data![index].title}"),
                    //     ),
                    //   );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}