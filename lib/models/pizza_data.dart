import 'package:pizzeria/models/pizza.dart';

class PizzaData{
  static List<Pizza> buildList(){
    List<Pizza> list = [];
    list.add(Pizza(1,'Barbecue','La graniture', 'pizza-bbq.jpg',8));
    list.add(Pizza(2,'Hawai','La graniture', 'pizza-hawai.jpg',9));
    list.add(Pizza(3,'Epinards','La graniture', 'pizza-spinach.jpg',7));
    list.add(Pizza(4,'Végétarienne','La graniture', 'pizza-vegetable.jpg',10));
    return list;

  }
}