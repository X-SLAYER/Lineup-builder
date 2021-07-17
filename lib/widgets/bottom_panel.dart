import 'package:flutter/material.dart';

class BottomPanel extends StatefulWidget {
  final Function() onSave;
  final ValueChanged<String> onSelect;

  BottomPanel({this.onSelect, this.onSave});

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

  @override
  void initState() {
    super.initState();
    selectedTactic = tactics[0];
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
                Icon(Icons.contact_mail_outlined),
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
