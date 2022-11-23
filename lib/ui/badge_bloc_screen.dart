import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_shop/blocs/badge_bloc.dart';
import 'package:flutter_bloc_shop/blocs/menu_bloc.dart';
import 'package:flutter_bloc_shop/model/coffee_menu.dart';
import 'package:oktoast/oktoast.dart';

class BadgeBlocScreen extends StatelessWidget {
  const BadgeBlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Корзина'),
          centerTitle: true,
        ),
        body: BlocBuilder<BadgeBloc, List<CoffeeMenu>>(
          builder: (_, state) {
            return state.isEmpty
                ? const Center(
                    child: Text(
                      'Корзина пуста',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                          flex: 12,
                          child: ListView.builder(
                              itemCount: state.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.yellow,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/${state[index].image}',
                                          fit: BoxFit.fitWidth,
                                        ),
                                        Expanded(
                                            child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                state[index].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                  'Цена: ${state[index].price} руб.',
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                );
                              })),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            child: const Text(
                              'Оформить заказ',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
                              context.read<BadgeBloc>().add(ClearBadge());
                              context.read<MenuBloc>().add(ClearByStatus());
                              Navigator.pop(context);
                              showToast('Заказ успешно выполнен');
                            },
                          ),
                        ),
                      )
                    ],
                  );
          },
        ));
  }
}
