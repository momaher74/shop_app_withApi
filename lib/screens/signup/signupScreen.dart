import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app2/cubit/cubit.dart';
import 'package:shop_app2/cubit/states.dart';

class SignupScreen extends StatelessWidget {
  @override
  var emailController = TextEditingController() ;
  var passwordController = TextEditingController() ;
  var nameController = TextEditingController() ;
  var phoneController = TextEditingController() ;
  Widget build(BuildContext context) {
    var suffex = ShopCubit.get(context).suffix ;
    return BlocConsumer<ShopCubit , ShopAppStates>(
      listener: (context , state){},
      builder: (context , state)=>Scaffold(
        appBar: AppBar(title: Text("Sign up "),),
        body:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.deepPurple[800],
                  Colors.deepPurple[700],
                  Colors.deepPurple[600],
                  Colors.deepPurple[400],
                ],
              )
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign up" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Sign up to buy all you need " , style: TextStyle(fontSize: 14 ,color: Colors.grey ,  ), ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.person) ,
                        labelText: "enter your name " ,
                        //suffixIcon: Icon(Icons.email_outlined) ,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                    controller:emailController ,
                    keyboardType: TextInputType.text,

                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone_android) ,
                        labelText: "enter your phone number " ,
                        suffixIcon: Icon(Icons.phone) ,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                    controller:emailController ,
                    keyboardType: TextInputType.text,

                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.email) ,
                        labelText: "enter your Email" ,
                        suffixIcon: Icon(Icons.email_outlined) ,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                    controller:emailController ,
                    keyboardType: TextInputType.text,

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock) ,
                        labelText: "enter your password" ,
                        suffixIcon: IconButton(icon: Icon(suffex), onPressed: (){
                          ShopCubit.get(context).changeIcon() ;
                        },) ,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                    controller:passwordController ,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: ShopCubit.get(context).isTrue,

                  ),
                  SizedBox(height: 20,),
                  Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(onPressed: (){}, child: Text("Sign up"))) ,
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}
