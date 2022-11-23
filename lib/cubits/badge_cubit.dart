import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_shop/model/coffee_menu.dart';

class BadgeCubit extends Cubit<List<CoffeeMenu>> {
  BadgeCubit() : super([]);

  void changeBadgeCount(CoffeeMenu coffee) {
    if (coffee.isBuy) {
      state.add(coffee);
    } else {
      state.remove(coffee);
    }
    emit(state.toList());
  }

  void clearBadge() {
    state.clear();
    emit(state.toList());
  }
}
