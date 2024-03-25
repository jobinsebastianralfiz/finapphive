import 'package:finapphive/models/income_model.dart';
import 'package:finapphive/services/fin_service.dart';
import 'package:flutter/material.dart';


class AllIncomes extends StatefulWidget {
  const AllIncomes({super.key});

  @override
  State<AllIncomes> createState() => _AllIncomesState();
}

class _AllIncomesState extends State<AllIncomes> {

  FinService _finService=FinService();
  List<IncomeModel> incomes=[];

  getIncome() async{

    incomes=await   _finService.getAllIncome();


  }


  @override
  void initState() {
  getIncome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: incomes.length,
            itemBuilder: (context,index){
        
              return Card(
                child: ListTile(  
                  title: Text(incomes[index].category,),
                  subtitle: Text(incomes[index].amount.toStringAsFixed(2),),
                ),
              );
        
        
        
        }),
      ),
    );
  }
}
