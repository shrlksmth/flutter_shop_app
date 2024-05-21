import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;
  const ProductsCard({super.key, required this.name, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 2,
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: Theme.of(context).textTheme.titleMedium,),
              const SizedBox(height: 5,),
              Text(
                'RM ${price.toString()}', style: Theme.of(context).textTheme.titleSmall,),
              Image.asset(imageUrl,height: 200, width: double.infinity,)
            ],
          ),
        ),
      ),
    );
  }
}
