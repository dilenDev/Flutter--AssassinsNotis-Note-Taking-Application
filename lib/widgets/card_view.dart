// import 'package:final_note/models/note.dart';
// import 'package:final_note/models/theme.dart';
// import 'package:flutter/material.dart';

// class NoteTile extends StatelessWidget {
//   final Task? task;
//   const NoteTile({Key? key, this.task}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       width: MediaQuery.of(context).size.width,
//       margin: const EdgeInsets.only(bottom: 12),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         //  width: SizeConfig.screenWidth * 0.78,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//          // color: _getBGClr(task?.color ?? 0),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//                 child: Column(
//               children: [
//                 Text(task?.title ?? ""),
//                 Text(task?.note ?? "")
//               ],
//             ))
//           ],
//         ),
//       ),
//     );
//   }

//   _getBGClr(int no) {
//     switch (no) {
//       case 0:
//         return bluishClra;
//       case 1:
//         return pinkClr;
//       case 2:
//         return yellowClr;
//       default:
//         return bluishClr;
//     }
//   }
// }
