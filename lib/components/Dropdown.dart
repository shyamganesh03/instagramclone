import 'package:flutter/material.dart';
import '../components/LabelText.dart';
import '../utils/colors.dart';

// ignore: must_be_immutable
class DropDown extends StatefulWidget {
  DropDown({super.key, required this.dropdownList});
  final List<String> dropdownList;
  String dropdownValue = 'English';
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final ThemeColor colors = ThemeColor();
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      iconEnabledColor: Colors.grey[500],
      elevation: 16,
      style: TextStyle(
          fontSize: 14, color: Colors.grey[400], fontFamily: 'Roboto'),
      underline: Container(
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          widget.dropdownValue = value!;
        });
      },
      dropdownColor: colors.backgroundSurface,
      items: widget.dropdownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: LabelText(
            label: value,
            variant: 'helperContent',
          ),
        );
      }).toList(),
    );
  }
}
