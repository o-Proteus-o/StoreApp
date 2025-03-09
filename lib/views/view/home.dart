import 'package:fake_store/models/all_product_model.dart';
import 'package:fake_store/services/all_product_service.dart';
import 'package:fake_store/views/widgets/get/card_view.dart';
import 'package:fake_store/views/widgets/put/update.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Trend",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder:
                      (context) => Container(
                        height: 200,
                        child: Center(child: Text('Modal Bottom Sheet')),
                      ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Icon(
                    FontAwesomeIcons.cartShopping,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: GetAllProduct().getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AllProductModel> products = snapshot.data!;
            return GridView.builder(
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 130,
                crossAxisCount: 2,
              ),
              itemBuilder:
                  (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, UpdatePage.routeName);
                    },
                    child: CardView(product: products[index]),
                  ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
