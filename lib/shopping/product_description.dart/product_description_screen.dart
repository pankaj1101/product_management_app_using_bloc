import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/shopping/product_description.dart/bloc/product_description_bloc.dart';
import 'package:learn_bloc/shopping/products/bloc/product_screen_bloc.dart';
import 'package:learn_bloc/utils/show_snackbar_utils.dart';

class ProductDescriptionScreen extends StatelessWidget {
  const ProductDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ProductDescriptionBloc, ProductDescriptionState>(
          builder: (context, state) {
            if (state is ProductDescriptionSuccessState) {
              return Text(state.product.title ?? '');
            } else {
              return const Text('');
            }
          },
        ),
      ),
      body: BlocConsumer<ProductDescriptionBloc, ProductDescriptionState>(
        listener: (BuildContext context, ProductDescriptionState state) {},
        listenWhen: (previous, currentState) {
          return currentState is ProductDescriptionActionState;
        },
        buildWhen: (previousState, currentState) {
          return currentState is! ProductDescriptionActionState;
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProductDescriptionLoadingState:
              return const Center(child: CircularProgressIndicator());
            case ProductDescriptionErrorState:
              return const Center(child: Text('Error'));
            case ProductDescriptionSuccessState:
              final currentState = state as ProductDescriptionSuccessState;
              final product = currentState.product;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      color: Colors.grey.shade100,
                      child: Image.network(
                        product.images!.first,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) {
                            return child; // Image loaded successfully
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product.title!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Text(product.rating.toString()),
                            ],
                          ),
                          Text(product.description!),
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
      floatingActionButton:
          BlocBuilder<ProductDescriptionBloc, ProductDescriptionState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              if (state is ProductDescriptionSuccessState) {
                context
                    .read<ProductScreenBloc>()
                    .add(ProductAddToCart(product: state.product));
              } else {
                SnackbarUtil.showSnackbar(context, 'Something Error');
              }
            },
            foregroundColor: Colors.white,
            backgroundColor: Colors.black87,
            child: const Icon(Icons.add_shopping_cart_rounded),
          );
        },
      ),
    );
  }
}
