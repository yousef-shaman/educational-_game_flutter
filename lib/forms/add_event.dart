// import 'package:flutter/material.dart';
// import 'package:graduation_project_flutter/widgets/date_picker.dart';
// import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
// import 'package:graduation_project_flutter/widgets/text_form_field.dart';

// class AddEvent extends StatefulWidget {
//   const AddEvent({super.key});

//   @override
//   State<AddEvent> createState() => _AddEventState();
// }

// class _AddEventState extends State<AddEvent> {
//   final _eventNameController = TextEditingController();
//   final _eventDescriptionController = TextEditingController();

//   @override
//   void dispose() {
//     _eventNameController.dispose();
//     _eventDescriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GradientScaffold(
//       appBar: AppBar(
//         title: const Text("Create a new Event"),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 'New Event',
//                 textAlign: TextAlign.left,
//                 style: Theme.of(context).textTheme.displayLarge,
//               ),

//               const SizedBox(height: 30),
//               CustomTextFormField(
//                 labelText: 'Event Name',
//                 hintText: 'Enter the Event Name',
//                 controller: _eventNameController,
//               ),

//               const SizedBox(height: 30), //Some spacing between the fields
//               CustomTextFormField(
//                 maxLines: 4,
//                 labelText: 'Event Description',
//                 keyboardType: TextInputType.multiline,
//                 hintText: 'Enter the Event Description',
//                 controller: _eventDescriptionController,
//               ),

//               // const SizedBox(height: 30),
//               // CustomDropdown(
//               //   items: _fields,
//               //   selectedValue: _selectedTheField,
//               //   onChanged: (value) => setState(() => _selectedTheField = value),
//               //   hint: 'Select the Field',
//               // ),
//               const SizedBox(height: 30),
//               const CustomDatePickerField(
//                 labelText: 'Event start date',
//                 hintText: 'pick the date',
//               ),
//                const SizedBox(height: 30),
//               const CustomDatePickerField(
//                 labelText: 'Event end date',
//                 hintText: 'pick the date',
//               ),
//               const SizedBox(height: 30),
//               // CustomDropdown(
//               //   items: _maxpoint,
//               //   selectedValue: _selectedMaxPoint,
//               //   onChanged: (value) => setState(() => _selectedMaxPoint = value),
//               //   hint: 'Select Max Point',
//               // ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {
//                   // Logic to handle form submission
//                 },
//                 style: Theme.of(context).elevatedButtonTheme.style,
//                 child: const Text('Craete'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
