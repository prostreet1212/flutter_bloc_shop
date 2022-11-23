import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_shop/model/coffee_menu.dart';
import 'package:flutter_bloc_shop/repository/menu_repository.dart';

class MenuCubit extends Cubit<List<CoffeeMenu>> {
  MenuCubit() : super(ConstMenuRepository().getListMenu());

    void butNot(CoffeeMenu coffee){
      state.map((e) {
        if (e == coffee) {
          e.isBuy = !e.isBuy;
          return e;
        } else {
          return e;
        }
      }).toList();
      emit(state.toList());
    }

    void clearByStatus(){
      state.map((e) {
        if (e.isBuy == true) {
          e.isBuy = false;
          return e;
        } else {
          return e;
        }
      }).toList();
      emit(state.toList());
    }


}