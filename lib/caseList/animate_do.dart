// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
//
// class Animate extends StatefulWidget {
//   const Animate({Key? key}) : super(key: key);
//
//   @override
//   State<Animate> createState() => _AnimateState();
// }
//
// class _AnimateState extends State<Animate> {
//   bool launchAnimation = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             '切换',
//             style: TextStyle(fontSize: 20),
//           ),
//           Text('布尔动画值: $launchAnimation'),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               ElasticInDown(animate: launchAnimation,child:  const Square()),
//               FadeInUp(animate: launchAnimation, child: const Square()),
//               FadeInDown(animate: launchAnimation, child: const Square()),
//               // FadeInLeft(animate: launchAnimation,child:  Square()),
//               // FadeInRight(animate: launchAnimation,child:  Square()),
//             ],
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   launchAnimation = !launchAnimation;
//                 });
//               },
//               child: const Text('切换动画'))
//         ],
//       ),
//     );
//   }
// }
//
// class Square extends StatelessWidget {
//   const Square({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: const BoxDecoration(
//         color: Colors.blueAccent,
//       ),
//     );
//   }
// }
