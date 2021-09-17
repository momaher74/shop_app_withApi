import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app2/cubit/cubit.dart';
import 'package:shop_app2/cubit/states.dart';
import 'package:shop_app2/myData/cachehelper.dart';
import 'package:shop_app2/myData/shared.dart';
import 'package:shop_app2/screens/homeScreen.dart';
import 'package:shop_app2/screens/signup/signupScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  var emailController = TextEditingController() ;
  var passwordController = TextEditingController() ;
  var formKey = GlobalKey<FormState>() ;

  Widget build(BuildContext context) {
    var suffex = ShopCubit.get(context).suffix ;
    return BlocConsumer<ShopCubit , ShopAppStates>(
      listener: (context , state){
        if(state is ShopAppLoginLoadingState){
          Center(child: CircularProgressIndicator());
        }
        if(ShopCubit.get(context).userModel.status==true){
          CacheHelper.saveData(key: "token", value: ShopCubit.get(context).userModel.data.token).then((value) {
            navigatorAndReplacment(context, HomeScreen()) ;
          }) ;
        }else{
          Fluttertoast.showToast(
              msg: ShopCubit.get(context).userModel.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );


        }
      },
      builder: (context , state)=>Scaffold(
       appBar: AppBar(title: Text("Login "),),
        body:Container(
          width: double.infinity,
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
            child: Form(
              key:formKey ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("login to buy all you need " , style: TextStyle(fontSize: 14 ,color: Colors.grey ,  ), ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (String value){
                      if(value.isEmpty){
                        return "Data Not Valid" ;
                      }else{
                        return null ;
                      }
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.email) ,
                        labelText: "enter your Email " ,
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
                    validator: (String value){
                      if(value.isEmpty){
                        return "Data Not Valid" ;
                      }
                      else{
                        return null ;
                      }
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock) ,
                        labelText: "enter your password " ,
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
                  if(state is ShopAppLoginLoadingState )
                    SizedBox(height: 15,),
                  if(state is ShopAppLoginLoadingState )
                    Center(child: CircularProgressIndicator()),
                  if(state is ! ShopAppLoginLoadingState )
                  Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(onPressed: (){
                        if(formKey.currentState.validate()){
                          ShopCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
                        }
                      }, child: Text("Login"))) ,
                  SizedBox(height: 10,),
                  Row(children: [
                    Text("Don't have an account" , style: TextStyle(fontSize: 18 ,color: Colors.black ,  fontWeight: FontWeight.bold),),
                    TextButton(onPressed: (){
                      navigatorTo(context, SignupScreen()) ;
                    }, child: Text("Register now"))
                  ],) ,
                  // if(state is ShopAppLoginErrorState)
                  //    Container(
                  //      child: Text("Not Valid"),
                  //    )
                ],
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}
