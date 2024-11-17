import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/dio_practice/bloc/dio_practice_bloc.dart';

class DioPracticePage extends StatefulWidget {
  const DioPracticePage({super.key});

  @override
  State<DioPracticePage> createState() => _DioPracticePageState();
}

class _DioPracticePageState extends State<DioPracticePage> {
  late final DioPracticeBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<DioPracticeBloc>();
    _bloc.add(DioPracticeInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dio Practice')),
      body: BlocConsumer<DioPracticeBloc, DioPracticeState>(
        listener: (context, state) {
          if (state is DioPracticeFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          } else if (state is DioPracticeSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Success'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is DioPracticeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DioPracticeSuccessState) {
            return _buildProductList(state);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildProductList(DioPracticeSuccessState state) {
    final data = state.productsModel;
    final products = data.products ?? [];
    if (products.isEmpty) {
      return const Text('Product list is empty');
    } else {
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(products[index].title ?? ''),
          );
        },
      );
    }
  }
}
