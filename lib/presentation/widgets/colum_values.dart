import 'package:flutter/material.dart';

class ColumValues extends StatefulWidget {
  final String headerText;
  final List<int> bodyText;
  final bool? isHistory;
  final bool? isGameWon;

  const ColumValues({
    super.key,
    required this.headerText,
    required this.bodyText,
    this.isHistory,
    this.isGameWon,
  });

  @override
  State<ColumValues> createState() => _ColumValuesState();
}

class _ColumValuesState extends State<ColumValues> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.headerText),
              ),
              Expanded(
                child: widget.bodyText.isNotEmpty
                    ? ListView.builder(
                        itemCount: widget.bodyText.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              widget.bodyText[index].toString(),
                              textAlign: TextAlign.center,
                              style: widget.isHistory == true
                                  ? TextStyle(
                                      color: widget.isHistory == true &&
                                              widget.isGameWon == true
                                          ? Colors.green
                                          : Colors.red)
                                  : TextStyle(color: Colors.black),
                            ),
                          );
                        },
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
