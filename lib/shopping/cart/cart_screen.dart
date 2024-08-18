import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/shopping/cart/bloc/cart_screen_bloc.dart';
import 'package:learn_bloc/utils/show_snackbar_utils.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Bag'),
      ),
      body: BlocConsumer<CartScreenBloc, CartScreenState>(
        listener: (BuildContext context, CartScreenState state) {
          if (state is ProductRemovedFromTheCartState) {
            SnackbarUtil.showSnackbar(context, 'Product Removed From Cart');
          }
        },
        builder: (context, state) {
          if (state is CartScreenInitial) {
            if (state.products.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 150,
                      ),
                    ),
                    Text('NO ITEM IN CART'),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    child: Image.network(
                      product.images!.first,
                    ),
                  ),
                  title: Text(product.title!),
                  subtitle: Text('Stock : ${product.stock}'),
                  trailing: IconButton(
                      color: Colors.red,
                      onPressed: () {
                        context.read<CartScreenBloc>().add(
                              ProductRemoveFromCartEvent(product: product),
                            );
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
