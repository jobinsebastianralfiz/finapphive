import 'package:finapphive/services/fin_service.dart';
import 'package:finapphive/widgets/appbutton.dart';
import 'package:finapphive/widgets/apptext.dart';
import 'package:finapphive/widgets/customtextformfiled.dart';
import 'package:flutter/material.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  TextEditingController _amountController = TextEditingController();
  String? category;

  final _incomeKey = GlobalKey<FormState>();
  FinService _finservice=FinService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff535353).withOpacity(0.9),
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
          key: _incomeKey,
          child: Column(
            children: [
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Select Category"),
                  items: ["Salary", "Commission", "Incentive", "Others"]
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      category = value;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  controller: _amountController, hintText: "Enter the Amount"),
              SizedBox(
                height: 20,
              ),
              Center(
                child: AppButton(
                    height: 48,
                    width: 250,
                    color: Colors.teal,
                    onTap: () async {
                      print("hello");

                      if (_incomeKey.currentState!.validate()) {


                      final res=await   _finservice.addIncome(category!,
                           double.parse(_amountController.text),



                       DateTime.now(),

                        );

                      if(res==true){

                        Navigator.pop(context);
                      }

                      }


                    },
                    child: AppText(
                      data: "Add Income",
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
