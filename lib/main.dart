
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_shop/blocs/badge_bloc.dart';
import 'package:flutter_bloc_shop/blocs/menu_bloc.dart';
import 'package:flutter_bloc_shop/cubits/badge_cubit.dart';
import 'package:flutter_bloc_shop/cubits/menu_cubit.dart';
import 'package:flutter_bloc_shop/ui/my_home_bloc_page.dart';
import 'package:flutter_bloc_shop/ui/my_home_cubit_page.dart';
import 'package:flutter_bloc_shop/ui/welcome_screen.dart';
import 'package:oktoast/oktoast.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuBloc>(create:(_)=>MenuBloc()),
        BlocProvider<BadgeBloc>(create: (_)=>BadgeBloc()),
        BlocProvider<MenuCubit>(create:(_)=>MenuCubit()),
        BlocProvider<BadgeCubit>(create: (_)=>BadgeCubit())
      ],
      child: OKToast(
        textStyle: const TextStyle(fontSize: 19.0, color: Colors.white),
        backgroundColor: const Color.fromARGB(113, 145, 148, 139),
        position: ToastPosition.bottom,
        textPadding: const EdgeInsets.all(8),
        duration: const Duration(seconds: 3),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //home: const MyHomeBlocPage(),
          home: const WelcomeScreen(),
        ),
      ),
    );
  }
}


