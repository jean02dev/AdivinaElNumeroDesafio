import 'package:flutter/material.dart';

class ColumValues extends StatefulWidget {
  final String headerText;
  final List<int> bodyText;

  const ColumValues({
    super.key,
    required this.headerText,
    required this.bodyText,
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
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(widget.headerText),
              Expanded(
                  child: widget.bodyText.isNotEmpty
                      ? ListView.builder(
                          itemCount: widget.bodyText.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Text(widget.bodyText[index].toString()),
                              ),
                            );
                          },
                        )
                      : Container()),
            ],
          ),
        ),
      ),
    );
  }
}
