import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/shopping/cart/bloc/cart_screen_bloc.dart';
import 'package:learn_bloc/shopping/product_description.dart/bloc/product_description_bloc.dart';
import 'package:learn_bloc/shopping/product_description.dart/product_description_screen.dart';
import 'package:learn_bloc/shopping/products/bloc/product_screen_bloc.dart';
import 'package:learn_bloc/shopping/cart/cart_screen.dart';
import 'package:learn_bloc/shopping/products/components/product_item_card.dart';
import 'package:learn_bloc/shopping/products/components/product_screen_shimmer.dart';
import 'package:learn_bloc/utils/show_snackbar_utils.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late final ProductScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ProductScreenBloc>();
    _bloc.add(ProductInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: () {
              _bloc.add(NavigateTOCartScreenEvent());
            },
            icon: const Icon(Icons.shopping_bag),
          )
        ],
      ),
      body: BlocConsumer<ProductScreenBloc, ProductScreenState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is NavigateTOCartPageState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            );
          } else if (state is ProductAddToCartState) {
            context.read<CartScreenBloc>().add(CartScreenInitialEvent(
                  products: state.products,
                ));
          } else if (state is SetProductIdState) {
            context
                .read<ProductDescriptionBloc>()
                .add(ProductDescriptionInitialEvent(
                  productID: state.productId,
                ));
          } else if (state is NavigateToProductDescriptionScreenState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductDescriptionScreen(),
              ),
            );
          } else if (state is ProductAlreadyExitsInCartState) {
            SnackbarUtil.showSnackbar(context, 'Product Already Exits in Cart');
          } else if (state is ProductAddedInCartState) {
            SnackbarUtil.showSnackbar(context, 'Added to cart');
          }
        },
        listenWhen: (previous, currentState) {
          return currentState is ProductScreenActionState;
        },
        buildWhen: (previousState, currentState) {
          return currentState is! ProductScreenActionState;
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProductScreenLoadingState:
              return ListView.builder(itemBuilder: (_, __) {
                return const ProductScreenShimmer();
              });
            case ProductScreenErrorState:
              return const Center(child: Text('Error'));
            case ProductScreenSuccesState:
              final currentState = state as ProductScreenSuccesState;
              final productData = currentState.model;

              if (productData == null || productData.products!.isEmpty) {
                return const Center(child: Text('No Data'));
              }
              return ListView.builder(
                itemCount: productData.products!.length,
                itemBuilder: (context, index) {
                  final product = productData.products![index];
                  return ProductItemCard(
                    title: product.title!,
                    imageUrl: product.images!.first,
                    productPrice:
                        '₹${((product.price)! * 10).toStringAsFixed(2)}',
                    rating: product.rating.toString(),
                    onTapProductItem: () {
                      _bloc.add(SetProductID(productID: product.id!.toInt()));
                      _bloc.add(NavigateToProductDescriptionScreenEvent());
                    },
                    onTapAddTOCart: () {
                      _bloc.add(ProductAddToCart(product: product));
                    },
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
