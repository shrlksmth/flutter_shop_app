import 'package:flutter/material.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:provider/provider.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<CartProvider>(context).cart;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: carts.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                    child: ListTile(
                  title: Text(carts[index]['title'].toString()),
                  subtitle: Text("Size: ${carts[index]['size'].toString()}"),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(carts[index]['imageUrl'].toString()),
                    radius: 25,
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("Delete Item"),
                            content: Text("Are you sure want to remove this item?"),
                            actions: [
                              TextButton(onPressed: (){
                                try{
                                  Provider.of<CartProvider> (context, listen: false).removeProduct(carts[index]);
                                }catch(e){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                                } finally{
                                  Navigator.of(context).pop();
                                }

                              }, child: Text("Yes", style: Theme.of(context).textTheme.titleSmall,)),

                              TextButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, child: Text("No", style: Theme.of(context).textTheme.titleSmall,))
                            ],
                          );
                        }
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[600],
                      )),
                )),
              ],
            );
          }),
    ));
  }
}
