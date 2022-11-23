import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_shop/model/coffee_menu.dart';

class BadgeBloc extends Bloc<BadgeEvent, List<CoffeeMenu>> {
  BadgeBloc() : super([]) {
    on<ChangeBadgeCount>((event, emit) {
      if (event.coffee.isBuy) {
        state.add(event.coffee);
      } else {
        state.remove(event.coffee);
      }
      emit(state.toList());
    });
    on<ClearBadge>((event, emit) {
      state.clear();
      emit(state.toList());
    });
  }
}

abstract class BadgeEvent {}

class ChangeBadgeCount extends BadgeEvent {
  CoffeeMenu coffee;

  ChangeBadgeCount(this.coffee);
}

class ClearBadge extends BadgeEvent {}
