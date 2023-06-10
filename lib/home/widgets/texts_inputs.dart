import 'package:flutter/material.dart';

class Texts_inputs extends StatefulWidget {
  final String inputType;
  final Function(String) onTextChange;

  const Texts_inputs(
      {Key? key, required this.inputType, required this.onTextChange})
      : super(key: key);

  @override
  _Texts_inputsState createState() => _Texts_inputsState();
}

class _Texts_inputsState extends State<Texts_inputs> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(
        children: [
          TextField(
            controller: _textEditingController,
            onChanged: (value) {
              widget.onTextChange(value);
            },
            decoration: InputDecoration(
              labelText: widget.inputType,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF1565C0)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF1565C0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
