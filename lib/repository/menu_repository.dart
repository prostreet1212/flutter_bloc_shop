import '../model/coffee_menu.dart';

abstract class MenuRepository {
  const MenuRepository();

  List<CoffeeMenu> getListMenu();

  void changeMenuStatus(CoffeeMenu coffeeMenu);
}

class ConstMenuRepository extends MenuRepository {
  ConstMenuRepository();

  List<CoffeeMenu> listMenu = <CoffeeMenu>[
    CoffeeMenu('latte.jpg', 'Латте', 80),
    CoffeeMenu('latte_grusha.jpg', 'Латте груша', 100),
    CoffeeMenu('malina_kokos.jpg', 'Раф малина-кокос', 100),
    CoffeeMenu('raf.jpg', 'Раф', 100),
  ];

  @override
  List<CoffeeMenu> getListMenu() {
    return listMenu;
  }

  @override
  void changeMenuStatus(CoffeeMenu coffeeMenu) {
    return;
  }
}
