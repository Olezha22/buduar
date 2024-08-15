import 'package:buduar/buduar_app.dart';
import 'package:buduar/constants.dart';
import 'package:buduar/features/complete_order/widgets/widgets.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class CompleteOrderScreen extends StatefulWidget {
  const CompleteOrderScreen({super.key});

  @override
  State<CompleteOrderScreen> createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {
  final String _name = 'Олег';
  final String _surname = 'Максимець';
  final String _phoneNumber = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _oblastController = TextEditingController();
  final TextEditingController _viddilenniaController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _surnameController.text = _surname;
    _phoneNumberController.text = _phoneNumber;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _cityController.dispose();
    _oblastController.dispose();
    _viddilenniaController.dispose();
    _paymentController.dispose();
    super.dispose();
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

  void _closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  final bool _isAutoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Деталі замовлення"),
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
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 226, 226),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Разом до сплати:",
                            style: kBlackStyleDefFont16w700,
                          ),
                          Text(
                            "1700 грн",
                            style: kBlackStyleDefFont16w700,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    InputFieldWidget(
                      onChanged: (value) {
                        _onChangedName(value);
                      },
                      validate: _validateName,
                      isAutoValidate: _isAutoValidate,
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
                      isAutoValidate: _isAutoValidate,
                      controller: _surnameController,
                      textInputType: TextInputType.name,
                      label: 'Прізвище',
                      hint: 'Літинський',
                      inputFormat: true,
                    ),
                    const SizedBox(height: 16),
                    InputFieldWidget(
                      validate: _validatePhoneNumberAndDate,
                      isAutoValidate: _isAutoValidate,
                      controller: _phoneNumberController,
                      textInputType: TextInputType.number,
                      inputFormat: true,
                      label: 'Номер телефона',
                      hint: '0681234567',
                    ),
                    const SizedBox(height: 16),
                    InputFieldWidget(
                      onChanged: (value) {
                        _onChangedSurName(value);
                      },
                      validate: _validateSurname,
                      isAutoValidate: _isAutoValidate,
                      controller: _oblastController,
                      textInputType: TextInputType.name,
                      label: 'Область',
                      hint: 'Львівська',
                      inputFormat: true,
                    ),
                    const SizedBox(height: 16),
                    InputFieldWidget(
                      onChanged: (value) {
                        _onChangedSurName(value);
                      },
                      validate: _validateSurname,
                      isAutoValidate: _isAutoValidate,
                      controller: _cityController,
                      textInputType: TextInputType.name,
                      label: 'Місто або село',
                      hint: 'Львів',
                      inputFormat: true,
                    ),
                    const SizedBox(height: 16),
                    InputFieldWidget(
                      onChanged: (value) {
                        _onChangedSurName(value);
                      },
                      validate: _validateSurname,
                      isAutoValidate: _isAutoValidate,
                      controller: _viddilenniaController,
                      textInputType: TextInputType.name,
                      label: 'Відділення нової пошти',
                      hint: '6',
                      inputFormat: true,
                    ),
                    const SizedBox(height: 16),
                    InputFieldWidget(
                      onChanged: (value) {
                        _onChangedSurName(value);
                      },
                      validate: _validateSurname,
                      isAutoValidate: _isAutoValidate,
                      controller: _paymentController,
                      textInputType: TextInputType.name,
                      label: 'Спосіб оплати',
                      hint: 'Картка/готівка',
                      inputFormat: true,
                    ),
                    const SizedBox(height: 20),
                    ButtonCompleteOrderWidget(
                      onPressed: () {
                        buduarNavigatorKey.currentState!.pop();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
