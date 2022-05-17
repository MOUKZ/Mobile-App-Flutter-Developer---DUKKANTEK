import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String? Function(String?) validator;
  final void Function(String?) onSaved;
  final String? hintText;
  final IconData icon;
  const CustomInputWidget({
    Key? key,
    required this.validator,
    required this.onSaved,
    this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: const Color(0xffebefff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
              )
            ]),
        child: TextFormField(
          validator: validator,
          onSaved: onSaved,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                icon,
                color: Color(0xff4c5166),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black38)),
        ));
  }
}
