
//  SizedBox(
//   width:  double.infinity,
//   child: Row(
//
//     mainAxisAlignment: MainAxisAlignment.start,
//
//     children: [
//       SizedBox(
//         height:  MediaQuery.of(context).size.width *0.07,
//       ),
//     ],
//   ),
// ),
// Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     SizedBox(
//       width:  MediaQuery.of(context).size.width *0.4,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           AspectRatio(
//             aspectRatio: 1.02,
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
//           style: TextStyle(
//             color: Colors.black,
//
//           ),
//             maxLines: 2,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children:const [
//                Text('60 \$',
//               style: TextStyle(
//                 color: Colors.deepOrange,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.w600,
//               ),),
//             ],
//           ),
//         ],
//       ),
//     ),