import 'package:finapphive/widgets/appbutton.dart';
import 'package:finapphive/widgets/apptext.dart';
import 'package:finapphive/widgets/customtextformfiled.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  TextEditingController _amountController = TextEditingController();
  String? category;

  final _expeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff535353).withOpacity(0.9),
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
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
                  onTap: () {
                    print("hello");

                    if (_expeKey.currentState!.validate()) {
                      //login logic
                    }
                  },
                  child: AppText(
                    data: "Add Expense",
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
