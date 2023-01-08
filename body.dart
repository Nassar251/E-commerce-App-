import 'package:flutter/material.dart';
import 'package:shpping_app/categories.dart';

class BodyApp extends StatelessWidget {
  const BodyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              const SearchField(),

              SizedBox(
                height:  MediaQuery.of(context).size.width *0.05,
              ),
              Container(
                padding:const EdgeInsetsDirectional.only(start: 20,top: 18),

                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text.rich(TextSpan(text: "summer surprise\n",
                style: TextStyle(
                  color: Colors.white,),
                    children:[
                      TextSpan(text: "cashback 25% ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      )),
                    ]
                )
                )
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.width *0.07,
              ),
              const Categories(),
              SizedBox(
                height:  MediaQuery.of(context).size.width *0.07,
              ),
              const SpecialOffers(),
              SizedBox(
                height:  MediaQuery.of(context).size.width *0.07,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 15),
                child: SectionTitle(title: "product ", press: (){}),
              ),
              const ProudectCard(),
              //
                ],
              ),


                    )


          ),
        ),
      );


  }
}

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );
