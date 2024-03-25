import 'package:finapphive/models/user_model.dart';
import 'package:finapphive/screens/list_all_income.dart';
import 'package:finapphive/services/fin_service.dart';
import 'package:finapphive/widgets/apptext.dart';
import 'package:finapphive/widgets/customcontainer.dart';
import 'package:finapphive/widgets/dashboard_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomeScreen extends StatefulWidget {
  final UserModel? user;
  const HomeScreen({super.key,this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserModel user; // Declare a field to hold user data


  @override
  Widget build(BuildContext context) {
    // Receive the user data passed from the previous screen
    final UserModel? args = ModalRoute.of(context)!.settings.arguments as UserModel?;
    if (args != null) {
      user = args;
    }
    return Scaffold(
      backgroundColor: Color(0xff535353).withOpacity(0.9),
      appBar: AppBar(
        title: AppText(data: "Fin Dashboard",),
        actions: [
          IconButton(onPressed: (){
            //todo

          }, icon: Icon(Icons.logout))
        ],
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(data: "Welcome ${user.name}",color: Colors.white,),
                InkWell(
                  onTap: (){
                    //profile Page
                  },
                  child: CircleAvatar(
                    child: Text("${user.name[0].toUpperCase()}"),
                  ),
                )
              ],
            ),

SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomContainer(

                ontap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllIncomes()));
                },


                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(data: "Income",color: Colors.white,),
                    AppText(data: "25000",color: Colors.white,size: 18,)
                  ],
                ),
              
              ),
            ),
            SizedBox(width: 10,), 
            Expanded(
              child: CustomContainer(

                ontap: (){},



                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(data: "Income",color: Colors.white,),
                    AppText(data: "25000",color: Colors.white,size: 18,)
                  ],
                ),
              
              ),
            ),


          ],
        ),

            SizedBox(
              height: 10,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomContainer(

                    ontap: (){
                      Navigator.pushNamed(context, '/addincome');
                      
                      
                    },


                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(data: "Add Income",color: Colors.white,),
                        Icon(Icons.add,color: Colors.white,)
                      ],
                    ),

                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: CustomContainer(

                    ontap: (){

                      Navigator.pushNamed(context, '/addexpense');
                    },


                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(data: "Add Expense",color: Colors.white,),
                        Icon(Icons.add,color: Colors.white,)
                      ],
                    ),

                  ),
                ),


              ],
            ),







          ],
        ),
      ),


    );
  }
}
