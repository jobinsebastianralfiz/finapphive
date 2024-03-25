import 'package:finapphive/models/income_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FinService with ChangeNotifier{

  Box<IncomeModel>? _incomeBox;



  // Future<void> openBox() async {
  //   _userBox = await Hive.openBox<UserModel>('users');
  // }

  Future<void> openIncomeBox() async {
    _incomeBox = await Hive.openBox<IncomeModel>('income');
  }

  Future<bool?> addIncome(String category, double amount, DateTime date) async {
   try{

     if (_incomeBox == null) {
       await openIncomeBox();
     }
     final newIncome = IncomeModel(category: category, amount: amount, date: date);
     _incomeBox!.add(newIncome);
     notifyListeners();

     return true;
   }catch(e){
     print(e);
     return false;
   }
  }


  Future<List<IncomeModel>>getAllIncome()async{

    if(_incomeBox==null){
      await openIncomeBox();
    }

    final List<IncomeModel> incomes=await _incomeBox!.values.toList();

    print(incomes);

    return incomes;



  }



}