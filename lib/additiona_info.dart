import 'package:flutter/material.dart';

class AdditionaInfoBox extends StatefulWidget {
  final double textSize;
  final IconData icon;
  final String value;
  final String information;
  const AdditionaInfoBox(
      {super.key,
      required this.textSize,
      required this.icon,
      required this.value,
      required this.information});

  @override
  State<AdditionaInfoBox> createState() => _AdditionaInfoBoxState();
}

class _AdditionaInfoBoxState extends State<AdditionaInfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1, // Set the border width for all sides
          color: Colors.black, // Set the border color (optional)
        ),
      ),

      // height: 180,
      // width: 140,
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.30,
      // color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 32,
          ),
          Text(
            widget.information,
            style: TextStyle(fontSize: widget.textSize),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.value.toString(),
            style: TextStyle(fontSize: widget.textSize),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
