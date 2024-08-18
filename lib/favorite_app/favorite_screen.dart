import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/favorite_app/bloc/favorite_screen_bloc.dart';
import 'package:learn_bloc/favorite_app/bloc/favorite_screen_event.dart';
import 'package:learn_bloc/favorite_app/bloc/favorite_screen_state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persons'),
      ),
      body: BlocListener<FavoriteScreenBloc, FavoriteScreenState>(
        listener: (context, state) {
          if (state is PersonAlreadyExistsState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<FavoriteScreenBloc, FavoriteScreenState>(
          builder: (context, state) {
            state as FavoriteScreenInitial;
            if (state.nameList.isEmpty) {
              return const Center(
                child: Text('No Record'),
              );
            } else {
              return ListView.builder(
                itemCount: state.nameList.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(
                      state.nameList[index],
                    ),
                    trailing: IconButton(
                      color: Colors.red,
                      onPressed: () {
                        context.read<FavoriteScreenBloc>().add(
                              RemoveFavoriteList(state.nameList[index]),
                            );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MyCustomDialog();
            },
          );
        },
        child: const Text('+'),
      ),
    );
  }
}

class MyCustomDialog extends StatefulWidget {
  const MyCustomDialog({super.key});

  @override
  State<MyCustomDialog> createState() => _MyCustomDialogState();
}

class _MyCustomDialogState extends State<MyCustomDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _inputValue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter your name'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          decoration: const InputDecoration(hintText: 'Name'),
          onSaved: (value) {
            _inputValue = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              Navigator.of(context).pop(); // Close the dialog
              context.read<FavoriteScreenBloc>().add(
                    AddFavoriteList(_inputValue.toString()),
                  );
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
