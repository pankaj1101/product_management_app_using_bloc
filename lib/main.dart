import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/app_bloc_observer.dart';
import 'package:learn_bloc/shopping/cart/bloc/cart_screen_bloc.dart';
import 'package:learn_bloc/shopping/cart/cart_screen.dart';
import 'package:learn_bloc/counter/bloc/counter_app_bloc.dart';
import 'package:learn_bloc/favorite_app/bloc/favorite_screen_bloc.dart';
import 'package:learn_bloc/shopping/product_description.dart/bloc/product_description_bloc.dart';
import 'package:learn_bloc/shopping/product_description.dart/product_description_screen.dart';
import 'package:learn_bloc/shopping/products/bloc/product_screen_bloc.dart';
import 'package:learn_bloc/shopping/products/product_screen.dart';
import 'package:learn_bloc/slider/bloc/slider_screen_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterAppBloc>(create: (context) => CounterAppBloc()),
        BlocProvider<SliderScreenBloc>(create: (context) => SliderScreenBloc()),
        BlocProvider<FavoriteScreenBloc>(
          create: (context) => FavoriteScreenBloc(),
        ),
        BlocProvider<ProductScreenBloc>(
          create: (context) => ProductScreenBloc(),
          child: const ProductsScreen(),
        ),
        BlocProvider<ProductDescriptionBloc>(
          create: (context) => ProductDescriptionBloc(),
          child: const ProductDescriptionScreen(),
        ),
        BlocProvider<CartScreenBloc>(
          create: (context) => CartScreenBloc(),
          child: const CartScreen(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: const ProductsScreen(),
      ),
    );
  }
}
