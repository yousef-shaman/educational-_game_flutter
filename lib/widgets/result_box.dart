// import 'package:flutter/material.dart';
// import 'package:graduation_project_flutter/constants/colors.dart';

// class ResultBox extends StatelessWidget {
//   final int result;
//   final int totalPoints;
//   final VoidCallback onPressed;
//   final int questionLength;
//   const ResultBox({
//     super.key,
//     required this.result,
//     required this.totalPoints,
//     required this.onPressed,
//     required this.questionLength,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: background,
//       content: Padding(
//         padding: const EdgeInsets.all(60.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Result',
//               style: TextStyle(color: neutralA, fontSize: 22.0),
//             ),
//             const SizedBox(height: 20.0),
//             CircleAvatar(
//               radius: 70.0,
//               backgroundColor: result == totalPoints / 2
//                   ? Colors.yellow // when the result is half of the questions
//                   : result < totalPoints / 2
//                       ? incorrect // when the result is less than half
//                       : correct,
//               child: Text(
//                 '$result/$totalPoints',
//                 style: const TextStyle(fontSize: 30.0),
//               ), // when the result is more than half
//             ),
//             const SizedBox(height: 20.0),
//             Text(
//               result == totalPoints / 2
//                   ? 'Almost There' // when the result is half of the questions
//                   : result < totalPoints / 2
//                       ? 'Try Again ?' // when the result is less than half
//                       : 'Great!', // when the result is more than half
//               style: const TextStyle(color: neutralA),
//             ),
//             const SizedBox(height: 25.0),
//             GestureDetector(
//               onTap: onPressed,
//               child: const Text(
//                 'Start Over',
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 20.0,
//                   letterSpacing: 1.0,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 25.0),
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.black,
//                   shape: const StadiumBorder(),
//                 ),
//                 child: const Text('Done'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ResultBox extends StatelessWidget {
  final int result;
  final int totalPoints;
  final VoidCallback onPressed;
  final VoidCallback onSaveAndComplete;
  final int questionLength;

  const ResultBox({
    super.key,
    required this.result,
    required this.totalPoints,
    required this.onPressed,
    required this.onSaveAndComplete,
    required this.questionLength,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(color: neutralA, fontSize: 22.0),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              radius: 70.0,
              backgroundColor: result == totalPoints / 2
                  ? Colors.yellow
                  : result < totalPoints / 2
                      ? incorrect
                      : correct,
              child: Text(
                '$result/$totalPoints',
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              result == totalPoints / 2
                  ? 'Almost There'
                  : result < totalPoints / 2
                      ? 'Try Again ?'
                      : 'Great!',
              style: const TextStyle(color: neutralA),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: onPressed,
              child: const Text(
                'Start Over',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: onSaveAndComplete,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: const StadiumBorder(),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

