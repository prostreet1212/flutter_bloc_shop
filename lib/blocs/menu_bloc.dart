import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_shop/model/coffee_menu.dart';
import 'package:flutter_bloc_shop/repository/menu_repository.dart';

class MenuBloc extends Bloc<MenuEvent, List<CoffeeMenu>> {
  MenuBloc() : super(ConstMenuRepository().getListMenu()) {
    on<BuyNot>(
      (event, emit) => emit(state.map((e) {
        if (e == event.coffee) {
          e.isBuy = !e.isBuy;
          return e;
        } else {
          return e;
        }
      }).toList()),
    );
    on<ClearByStatus>((event, emit) {
      state.map((e) {
        if (e.isBuy == true) {
          e.isBuy = false;
          return e;
        } else {
          return e;
        }
      }).toList();
      emit(state.toList());
    });
  }
}

abstract class MenuEvent {}

class BuyNot extends MenuEvent {
  CoffeeMenu coffee;

  BuyNot(this.coffee);
}

class ClearByStatus extends MenuEvent {}
