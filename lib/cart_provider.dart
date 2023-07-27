import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_modal.dart';
import 'db_helper.dart';

class CartProvider with ChangeNotifier {

DBHelper db = DBHelper();

int _counter = 0;
int get counter => _counter;


double _totalPrice = 0.0;
double get totalPrice => _totalPrice;

late Future<List<Cart>> _cart;
Future <List<Cart>> get cart => _cart;


Future<List<Cart>> getData() async {

_cart = db.getCartList();
return _cart;

}


void _setPrefItems() async{

SharedPreferences pref = await SharedPreferences.getInstance();
pref.setInt('cart_item', _counter);
pref.setDouble('total_price', _totalPrice);
notifyListeners();
}



void _getPrefItems() async{

SharedPreferences pref = await SharedPreferences.getInstance();
_counter = pref.getInt('cart_item') ?? 0 ;

_totalPrice = pref.getDouble('_totalPrice') ?? 0.0 ;

notifyListeners();
}

void addTotalPrice(double productPrice){

 _totalPrice = _totalPrice + productPrice;
  _setPrefItems();
  notifyListeners();

}


void removeTotalPrice(double productPrice){

 _totalPrice = _totalPrice - productPrice;
  _setPrefItems();
  notifyListeners();

}



void addCounter(){

  _counter++;
  _setPrefItems();
  notifyListeners();

}


double gettotalPrice(){

  _getPrefItems();
  return _totalPrice;

}



void removeCounter(){

  _counter--;
  _setPrefItems();
  notifyListeners();

}

int getCounter(){

  _getPrefItems();
  return _counter;

}
}