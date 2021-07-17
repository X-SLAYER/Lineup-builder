import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class BottomPanel extends StatefulWidget {
  final Function() onSave;
  final ValueChanged<Color> onColorChange;
  final ValueChanged<String> onSelect;

  BottomPanel({this.onSelect, this.onSave, this.onColorChange});

  @override
  _BottomPanelState createState() => _BottomPanelState();
}

class _BottomPanelState extends State<BottomPanel> {
  List<String> tactics = [
    "4-4-2",
    "4-3-3",
    "4-2-3-1",
  ];

  String selectedTactic;
  Color currentColor = Colors.black;

  @override
  void initState() {
    super.initState();
    selectedTactic = tactics[0];
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: currentColor,
            onColorChanged: (color) {
              widget.onColorChange(color);
              currentColor = color;
              setState(() {});
            },
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
            paletteType: PaletteType.hsv,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Done'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Formation: '),
            SizedBox(width: 3.0),
            DropdownButton<String>(
                value: selectedTactic,
                items: tactics.map(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (String tactic) {
                  setState(() {
                    selectedTactic = tactic;
                  });
                  widget.onSelect(tactic);
                }),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      _showDialog();
                    },
                    icon:
                        Icon(Icons.color_lens, color: Colors.red, size: 30.0)),
                SizedBox(width: 10.0),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                  ),
                  onPressed: widget.onSave,
                  child: Text("Save"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
