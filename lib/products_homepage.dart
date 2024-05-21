import 'package:flutter/material.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_details.dart';
import 'package:shop_app/products_items.dart';

class ProductsHomepage extends StatefulWidget {
  const ProductsHomepage({super.key});

  @override
  State<ProductsHomepage> createState() => _ProductsHomepageState();
}

class _ProductsHomepageState extends State<ProductsHomepage> {
  List<String> filter = [
    "All33",
    "Nike",
    "Adidaasdasdas",
    "Jordan",
    "Puma",
    "Bata"
  ];

  late String selectedFilter;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Shoes\nCollection",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20))),
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                    itemCount: filter.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = filter[index];
                            });
                          },
                          child: Chip(
                            label: Text(filter[index]),
                            padding: const EdgeInsets.all(10),
                            backgroundColor: selectedFilter != filter[index]
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.primary,
                            side: const BorderSide(
                              //width: 0,
                              color: Colors.transparent,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      );
                    }),
              ),
              // Expanded(
              //   child: SizedBox(
              //       child:
              //       screenSize.width < 1150?
              //       ListView.builder(
              //           itemCount: products.length,
              //           scrollDirection: Axis.vertical,
              //           itemBuilder: (context, index) {
              //             return GestureDetector(
              //               onTap: () {
              //                 Navigator.of(context).push(MaterialPageRoute(
              //                     builder: (context) =>
              //                         ProductDetails(product: products[index])));
              //               },
              //               child: ProductsCard(
              //                   name: products[index]['title'].toString(),
              //                   price: double.parse(
              //                       products[index]['price'].toString()),
              //                   imageUrl: products[index]['imageUrl'].toString()),
              //             );
              //           }):
              //       GridView.builder(
              //           itemCount: products.length,
              //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //              // crossAxisCount: screenSize.width < 1000? 2:3,
              //             crossAxisCount: 2,
              //              childAspectRatio: 2,),
              //
              //              // mainAxisExtent: screenSize.width < 1000? 1.3:1),
              //           itemBuilder: (context, index) {
              //             return GestureDetector(
              //               onTap: () {
              //                 Navigator.of(context).push(MaterialPageRoute(
              //                     builder: (context) => ProductDetails(
              //                         product: products[index])));
              //               },
              //               child: ProductsCard(
              //                   name: products[index]['title'].toString(),
              //                   price: double.parse(
              //                       products[index]['price'].toString()),
              //                   imageUrl:
              //                       products[index]['imageUrl'].toString()),
              //             );
              //           })
              //
              //       ),
              // ),
              Expanded(child: LayoutBuilder(
                builder: (context, constraint) {
                  if (constraint.maxWidth > 650) {
                    return GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // crossAxisCount: screenSize.width < 1000? 2:3,
                          crossAxisCount: 2,
                         mainAxisSpacing: 2
                         // childAspectRatio: 2,
                        ),

                        // mainAxisExtent: screenSize.width < 1000? 1.3:1),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      product: products[index])));
                            },
                            child: ProductsCard(
                                name: products[index]['title'].toString(),
                                price: double.parse(
                                    products[index]['price'].toString()),
                                imageUrl:
                                    products[index]['imageUrl'].toString()),
                          );
                        });
                  } else {
                    return ListView.builder(
                        itemCount: products.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      product: products[index])));
                            },
                            child: ProductsCard(
                                name: products[index]['title'].toString(),
                                price: double.parse(
                                    products[index]['price'].toString()),
                                imageUrl:
                                    products[index]['imageUrl'].toString()),
                          );
                        });
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
