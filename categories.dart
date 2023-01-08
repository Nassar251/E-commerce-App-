import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'cart.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,


      children: [
        Container(
          width: MediaQuery.of(context).size.width *0.6,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            onChanged: (value) => print(value),
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 9.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
                prefixIcon: Icon(Icons.search)),
          ),

        ),
        InkWell(
          onTap: ()
          {
            navigateTo(
                context,
                const CartScreen());

          },
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            padding: const EdgeInsets.all(15.0,),
            height: MediaQuery.of(context).size.height *0.06 ,
            width: MediaQuery.of(context).size.width *0.14,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/icons/Cart Icon.svg'),
          ),
        ),
      ],
    );


  }
}

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> categories =[
      {"icon": "assets/icons/Flash Icon.svg","text" : "Flash deal"},
      {"icon": "assets/icons/Bill Icon.svg","text" : "Bill"},
      {"icon": "assets/icons/Game Icon.svg","text" : "Game"},
      {"icon": "assets/icons/Gift Icon.svg","text" : "Daily Gift"},
      {"icon": "assets/icons/Discover.svg","text" : "Discover"},
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ...List.generate(categories.length, (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {}, )),

        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
     Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.13,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),

                ),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(text,
              textAlign: TextAlign.center,),
          ],
        ),

      ),
    );
  }

}

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(left: 20.0,right: 20.0,),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height *0.03),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/smartphone2.jpg",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/fashion.PNG",
                category: "Fashion",
                numOfBrands: 24,
                press: () {},
              ),
              SizedBox(width: MediaQuery.of(context).size.width *0.05,),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: MediaQuery.of(context).size.width *0.5,
          height: MediaQuery.of(context).size.height *0.13,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
            "See More",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}

class CustomTextStyle {
  static var textFormFieldRegular = const TextStyle(
      fontSize: 16,
      fontFamily: "Helvetica",
      color: Colors.black,
      fontWeight: FontWeight.w400);

  static var textFormFieldLight =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w200);

  static var textFormFieldMedium =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w500);

  static var textFormFieldSemiBold =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w600);

  static var textFormFieldBold =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w700);

  static var textFormFieldBlack =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w900);
}


class ProudectCard extends StatelessWidget {
  const ProudectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      //childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics() ,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i =1 ;i < 8 ;i++)
        FittedBox(fit: BoxFit.contain,

          child: Container(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10,),
            margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
            decoration: BoxDecoration(

              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20.0),

            ),
            child: Column(
              children: [
                InkWell(
                  onTap: ()
                  {

                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 120,
                    width: 120,
                     child: Image.asset('assets/images/home.jpg'
                     ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  alignment: Alignment.centerLeft,
                  child: const Text('product title',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,


                  ),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('write product description here',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white54,
                  ),),

                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10,),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text('60 \$' ,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),

                    IconButton(onPressed: ()
                    {
                      navigateTo(context, const CartScreen());

                    },
                        icon: const Icon(Icons.shopping_cart_outlined,
                        color: Colors.deepOrange,))
                    

                  ],
                ) ,
                ),







              ],
            ),
          ),
        )
      ],
    );
  }
}






// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     Key ? key,
//     this.width =140,
//     this.aspectRetion =1.02,
//     required this.product,
// }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SizedBox(
//       width:  MediaQuery.of(context).size.width *0.4,
//       child: Column(
//         children: [
//           AspectRatio(
//             aspectRatio: aspectRetion,
//             child: Container(
//               padding: const EdgeInsetsDirectional.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.grey.withOpacity(0.4),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Image.asset('assets/images/home.jpg'),
//
//             ),
//           ),
//           const Text('product1 product1 product1 product1 product1',
//             style: TextStyle(
//               color: Colors.black,
//
//             ),
//             maxLines: 2,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children:const [
//               Text('60 \$',
//                 style: TextStyle(
//                   color: Colors.deepOrange,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                 ),),
//             ],
//           ),
//         ],
//       ),
//     ),;
//   }
// }

