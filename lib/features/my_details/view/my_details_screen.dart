import 'package:buduar/constants.dart';
import 'package:buduar/features/my_details/widgets/widgets.dart';
import 'package:buduar/preferences/user/current_user.dart';
import 'package:buduar/features/auth/data/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _populateUserData();
  }

  void _populateUserData() {
    if (!_currentUser.isLoading.value) {
      _nameController.text = _currentUser.user.user_name;
      _surnameController.text = _currentUser.user.user_surname;
      _emailController.text = _currentUser.user.user_email!;
      _phoneNumberController.text = _currentUser.user.user_phoneNumber;

      // Format date if needed
      String _dateTime = _currentUser.user.user_date;
      RegExp dateRegExp = RegExp(r'(\d{4}-\d{2}-\d{2})');
      Match? match = dateRegExp.firstMatch(_dateTime);
      if (match != null) {
        _dateTime = match.group(1)!;
      }
      _dateTimeController.text = _dateTime;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (dateTime != null) {
      _dateTimeController.text = dateTime.toString().split(" ")[0];
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте електронну пошту';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Введіть корректну електронну пошту';
    }

    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте ім\'я';
    }

    if (value.length < 3) {
      return 'Введіть корректне ім\'я';
    }

    return null;
  }

  String? _validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте прізвище';
    }

    if (value.length < 3) {
      return 'Введіть корректне прізвище';
    }

    return null;
  }

  String? _validatePhoneNumberAndDate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (value.isNotEmpty && value.length != 10) {
      return 'Введіть корректний номер телефону';
    }

    return null;
  }

  void _onChangedName(String value) {
    if (value.isNotEmpty) {
      _nameController.value = TextEditingValue(
        text: value.substring(0, 1).toUpperCase() + value.substring(1),
        selection: _nameController.selection,
      );
    }
  }

  void _onChangedSurName(String value) {
    if (value.isNotEmpty) {
      _surnameController.value = TextEditingValue(
        text: value.substring(0, 1).toUpperCase() + value.substring(1),
        selection: _surnameController.selection,
      );
    }
  }

  void _onPressedChangePassword() {
    _vibration();
    _closeKeyboard();
    // buduarNavigatorKey.currentState!.pushNamed('/changePassword');
    Get.toNamed('/changePassword');
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _vibration() {
    HapticFeedback.selectionClick();
  }

  void _onPressedButtonSaveChanges() {
    _vibration();
    _closeKeyboard();
    if (_formKey.currentState!.validate()) {
      // buduarNavigatorKey.currentState!
      //     .pushNamedAndRemoveUntil('/bottomNavBar', (route) => false);
      Get.back();
    } else {
      _isAutoValidate.value = true;
    }
  }

  void _onPressedIconButtonLogOut() {
    _closeKeyboard();
    _vibration();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Вихід з аккаунта',
            style: kTitleStyle,
          ),
          content: const Text(
            'Ви впевнені що хочете вийти?',
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(backgroundColor: kLogInUpButtonColor),
              onPressed: () {
                _vibration();
                // buduarNavigatorKey.currentState!.pop();
                Get.back();
                Get.find<CurrentUser>().getUserInfo();
              },
              child: const Text('Ні'),
            ),
            TextButton(
              style: ButtonStyle(backgroundColor: kLogInUpButtonColor),
              onPressed: () {
                _vibration();
                RememberUserPrefs.removeUserInfo().then((value) {
                  Get.offAllNamed('/login');
                });
                Get.find<CurrentUser>().logout();
              },
              child: Text(
                'Так',
                style: kInputErrorStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  var _isAutoValidate = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_currentUser.isLoading.value) {
        return const Scaffold(
          backgroundColor: kMainBackgroudColor,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        _populateUserData();
        return Scaffold(
          backgroundColor: kMainBackgroudColor,
          appBar: AppBar(
            title: const Text("Мої дані"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: IconButton(
                  icon: const Icon(Icons.logout_outlined),
                  onPressed: _onPressedIconButtonLogOut,
                ),
              )
            ],
          ),
          body: GestureDetector(
            onTap: _closeKeyboard,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        InputFieldWidget(
                          onChanged: (value) {
                            _onChangedName(value);
                          },
                          validate: _validateName,
                          isAutoValidate: _isAutoValidate.value,
                          controller: _nameController,
                          textInputType: TextInputType.name,
                          label: 'Ім\'я',
                          hint: 'Максим',
                          inputFormat: true,
                        ),
                        const SizedBox(height: 16),
                        InputFieldWidget(
                          onChanged: (value) {
                            _onChangedSurName(value);
                          },
                          validate: _validateSurname,
                          isAutoValidate: _isAutoValidate.value,
                          controller: _surnameController,
                          textInputType: TextInputType.name,
                          label: 'Прізвище',
                          hint: 'Літинський',
                          inputFormat: true,
                        ),
                        const SizedBox(height: 16),
                        InputFieldWidget(
                          validate: _validateEmail,
                          isAutoValidate: _isAutoValidate.value,
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          label: 'Електронна адреса',
                          hint: 'makslit@gmail.com',
                        ),
                        const SizedBox(height: 16),
                        InputFieldWidget(
                          validate: _validatePhoneNumberAndDate,
                          isAutoValidate: _isAutoValidate.value,
                          controller: _phoneNumberController,
                          textInputType: TextInputType.number,
                          inputFormat: true,
                          label: 'Номер телефона',
                          hint: '0681234567',
                        ),
                        const SizedBox(height: 16),
                        InputFieldWidget(
                          validate: _validatePhoneNumberAndDate,
                          isAutoValidate: _isAutoValidate.value,
                          controller: _dateTimeController,
                          textInputType: TextInputType.datetime,
                          label: 'Дата народження',
                          hint: '2000-01-01',
                          readOnly: true,
                          onPressed: _selectDate,
                        ),
                        const SizedBox(height: 16),
                        ButtonSaveChangesWidget(
                          onPressed: _onPressedButtonSaveChanges,
                        ),
                        const SizedBox(height: 10),
                        UnderlinedButtonWidget(
                          text: "Змінити пароль",
                          onPressed: _onPressedChangePassword,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}



// ElevatedButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return MyDatePicker(
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2101),
//                       onDateSelected: (DateTime selectedDate) {
//                         // Do something with the selected date
//                         print('Selected date: $selectedDate');
//                       },
//                     );
//                   },
//                 );
//               },
//               child: const Text('Show Date Picker'),
//             ),
// class MyDatePicker extends StatelessWidget {
//   final DateTime initialDate;
//   final DateTime firstDate;
//   final DateTime lastDate;
//   final void Function(DateTime) onDateSelected;

//   MyDatePicker({
//     required this.initialDate,
//     required this.firstDate,
//     required this.lastDate,
//     required this.onDateSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const Text(
//               'Оберіть вашу дату народження',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20.0,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             MyCalendarDatePicker(
//               initialDate: initialDate,
//               firstDate: firstDate,
//               lastDate: lastDate,
//               onDateChanged: onDateSelected,
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Ок'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// class MyCalendarDatePicker extends StatefulWidget {
//   final DateTime initialDate;
//   final DateTime firstDate;
//   final DateTime lastDate;
//   final void Function(DateTime) onDateChanged;

//   MyCalendarDatePicker({
//     required this.initialDate,
//     required this.firstDate,
//     required this.lastDate,
//     required this.onDateChanged,
//   });

//   @override
//   _MyCalendarDatePickerState createState() => _MyCalendarDatePickerState();
// }

// class _MyCalendarDatePickerState extends State<MyCalendarDatePicker> {
//   late DateTime _selectedDate;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = widget.initialDate;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text(
//             'Select a date',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20.0,
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () {
//                   _changeMonth(-1);
//                 },
//               ),
//               Text(
//                 '${_selectedDate.month}/${_selectedDate.year}',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_forward),
//                 onPressed: () {
//                   _changeMonth(1);
//                 },
//               ),
//             ],
//           ),
//           SizedBox(height: 20.0),
//           GridView.builder(
//             shrinkWrap: true,
//             itemCount: DateTime(
//               _selectedDate.year,
//               _selectedDate.month + 1,
//               0,
//             ).day,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 7,
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               final day = index + 1;
//               return InkWell(
//                 onTap: () {
//                   final selectedDate = DateTime(
//                     _selectedDate.year,
//                     _selectedDate.month,
//                     day,
//                   );
//                   if (selectedDate.isBefore(widget.firstDate) ||
//                       selectedDate.isAfter(widget.lastDate)) {
//                     return;
//                   }
//                   setState(() {
//                     _selectedDate = selectedDate;
//                   });
//                   widget.onDateChanged(_selectedDate);
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   child: Text(
//                     '$day',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _changeMonth(int offset) {
//     setState(() {
//       _selectedDate = DateTime(
//         _selectedDate.year,
//         _selectedDate.month + offset,
//         1,
//       );
//     });
//   }
// }
