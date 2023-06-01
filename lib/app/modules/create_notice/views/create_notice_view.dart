
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import '../controllers/create_notice_controller.dart';

// // class CreateNoticeView extends GetView<CreateNoticeController> {
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //   TextEditingController _dateController = TextEditingController();
// //   DateTime? selectedDate;

// //   Future<void> _selectDate(BuildContext context) async {
// //     final DateTime? pickedDate = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(1900),
// //       lastDate: DateTime(2100),
// //     );

// //     if (pickedDate != null && pickedDate != selectedDate) {
// //       // Date selected
// //       selectedDate = pickedDate;
// //       // Update the value of the form field
// //       _dateController.text = selectedDate.toString();
// //       _formKey.currentState!.validate();
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _dateController.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('CreateNoticeView'),
// //         centerTitle: true,
// //       ),
// //       body: LayoutBuilder(
// //         builder: (context, constraints) {
// //           return Center(
// //             child: ConstrainedBox(
// //               constraints: BoxConstraints(
// //                 maxWidth: constraints.maxWidth <= 600 ? double.infinity : 600,
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Card(
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(16.0),
// //                     child: Form(
// //                       key: _formKey,
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.stretch,
// //                         children: [
// //                           TextFormField(
// //                             decoration: InputDecoration(labelText: 'Title'),
// //                             validator: (value) {
// //                               if (value == null || value.isEmpty) {
// //                                 return 'Please enter a title';
// //                               }
// //                               return null;
// //                             },
// //                           ),
// //                           SizedBox(height: 16.0),
// //                           TextFormField(
// //                             decoration: InputDecoration(labelText: 'Description'),
// //                             validator: (value) {
// //                               if (value == null || value.isEmpty) {
// //                                 return 'Please enter a description';
// //                               }
// //                               return null;
// //                             },
// //                           ),
// //                           SizedBox(height: 16.0),
// //                           TextFormField(
// //                             decoration: InputDecoration(labelText: 'URL'),
// //                             validator: (value) {
// //                               if (value == null || value.isEmpty) {
// //                                 return 'Please enter a URL';
// //                               }
// //                               return null;
// //                             },
// //                           ),
// //                           SizedBox(height: 16.0),
// //                           TextFormField(
// //                             readOnly: true,
// //                             decoration: InputDecoration(
// //                               labelText: 'Date',
// //                               suffixIcon: Icon(Icons.calendar_today),
// //                             ),
// //                             onTap: () => _selectDate(context),
// //                             validator: (value) {
// //                               if (selectedDate == null) {
// //                                 return 'Please select a date';
// //                               }
// //                               return null;
// //                             },
// //                             controller: _dateController,
// //                           ),
// //                           SizedBox(height: 24.0),
// //                           ElevatedButton(
// //                             style: ElevatedButton.styleFrom(
// //                               primary: Colors.blue, // Set the button color to blue
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(8.0),
// //                               ),
// //                               padding: EdgeInsets.symmetric(vertical: 16.0),
// //                             ),
// //                             onPressed: () {
// //                               if (_formKey.currentState!.validate()) {
// //                                 // Form is valid, process the data
// //                                 // You can access form values using _formKey.currentState!.value
// //                               }
// //                             },
// //                             child: Text('Submit'),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/create_notice_controller.dart';

// class CreateNoticeView extends GetView<CreateNoticeController> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController _dateController = TextEditingController();
//   DateTime? selectedDate;

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );

//     if (pickedDate != null && pickedDate != selectedDate) {
//       // Date selected
//       selectedDate = pickedDate;
//       // Update the value of the form field
//       _dateController.text = selectedDate.toString();
//       _formKey.currentState!.validate();
//     }
//   }

//   @override
//   void dispose() {
//     _dateController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CreateNoticeView'),
//         centerTitle: true,
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Center(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 maxWidth: constraints.maxWidth <= 600 ? double.infinity : 600,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: IntrinsicHeight(
//                   child: Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             TextFormField(
//                               decoration: InputDecoration(labelText: 'Title'),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter a title';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(height: 16.0),
//                             TextFormField(
//                               decoration: InputDecoration(labelText: 'Description'),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter a description';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(height: 16.0),
//                             TextFormField(
//                               decoration: InputDecoration(labelText: 'URL'),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter a URL';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(height: 16.0),
//                             TextFormField(
//                               readOnly: true,
//                               decoration: InputDecoration(
//                                 labelText: 'Date',
//                                 suffixIcon: Icon(Icons.calendar_today),
//                               ),
//                               onTap: () => _selectDate(context),
//                               validator: (value) {
//                                 if (selectedDate == null) {
//                                   return 'Please select a date';
//                                 }
//                                 return null;
//                               },
//                               controller: _dateController,
//                             ),
//                             SizedBox(height: 24.0),
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.blue, // Set the button color to blue
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                               ),
//                               onPressed: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   // Form is valid, process the data
//                                   // You can access form values using _formKey.currentState!.value
//                                 }
//                               },
//                               child: Text('Submit'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_notice_controller.dart';

class CreateNoticeView extends GetView<CreateNoticeController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      // Date selected
      selectedDate = pickedDate;
      // Update the value of the form field
      _dateController.text = selectedDate.toString();
      _formKey.currentState!.validate();
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth <= 600 ? double.infinity : 600,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Title'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a title';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Description'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a description';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'URL'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a URL';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              onTap: () => _selectDate(context),
                              validator: (value) {
                                if (selectedDate == null) {
                                  return 'Please select a date';
                                }
                                return null;
                              },
                              controller: _dateController,
                            ),
                            SizedBox(height: 24.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // Set the button color to blue
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Form is valid, process the data
                                  // You can access form values using _formKey.currentState!.value
                                }
                              },
                              child: Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
