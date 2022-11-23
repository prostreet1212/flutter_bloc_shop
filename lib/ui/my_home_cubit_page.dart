import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_shop/cubits/badge_cubit.dart';
import 'package:flutter_bloc_shop/cubits/menu_cubit.dart';

import 'package:flutter/material.dart';

import '../model/coffee_menu.dart';
import 'badge_cubit_screen.dart';

class MyHomeCubitPage extends StatelessWidget {
  const MyHomeCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: BlocBuilder<BadgeCubit, List<CoffeeMenu>>(
          builder: (_, state) {
            return AppBar(
                title: const Text('Flutter_cubit_shop'),
                leading: Badge(
                  badgeContent: Text(state.length.toString()),
                  position: const BadgePosition(start: 26, bottom: 26),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const BadgeCubitScreen();
                      }));
                    },
                  ),
                ));
          },
        ),
      ),
      body: BlocBuilder<MenuCubit, List<CoffeeMenu>>(
        builder: (_, state) {
          return GridView.count(
            shrinkWrap: true,
            //primary: false,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.5),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: state.map(
              (menu) {
                return Card(
                  color: const Color.fromARGB(255, 255, 229, 85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Wrap(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/${menu.image}',
                              fit: BoxFit.fitWidth,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  alignment: Alignment.center,
                                  color:
                                      const Color.fromARGB(255, 174, 206, 231),
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.shopping_basket,
                                      color: !menu.isBuy
                                          ? Colors.grey
                                          : Colors.red,
                                    ),
                                    onPressed: () {
                                      context.read<MenuCubit>().butNot(menu);
                                      context
                                          .read<BadgeCubit>()
                                          .changeBadgeCount(menu);
                                    },
                                  )),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            menu.name,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Цена: '),
                              Text(
                                '${menu.price} руб.',
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
