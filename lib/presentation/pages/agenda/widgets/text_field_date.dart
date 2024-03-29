//PARTE DEL CALENDARIO
import 'package:example/presentation/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class CustomCalendarTextField extends StatelessWidget {
  final void Function(DateTime date) onDateSelected;
  final DateTime? selectedDate;
  final String title;
  const CustomCalendarTextField({
    super.key,
    required this.onDateSelected,
    this.selectedDate,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: TextEditingController(
            text: selectedDate != null
                ? FormateadorFecha.formatFecha2(selectedDate!).toString()
                : "ELEGIR FECHA"),
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_month_outlined),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate == null ? DateTime.now() : selectedDate!,
            firstDate: DateTime.now(),
            lastDate: DateTime(2050),
          );

          onDateSelected(pickedDate!);
        },
      ),
    );
  }
}
