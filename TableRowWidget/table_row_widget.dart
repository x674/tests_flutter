import 'package:flutter/material.dart';

class TableRowWidget extends StatelessWidget {
  final String text;
  final bool checkBoxState;

  const TableRowWidget(this.text, this.checkBoxState, {super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: MinColumnWidth(FractionColumnWidth(0.6), IntrinsicColumnWidth()),
        1: MaxColumnWidth(FixedColumnWidth(10), FlexColumnWidth()),
        2: IntrinsicColumnWidth()
      },
      children: [
        TableRow(children: <Widget>[
          Text(text, softWrap: false, overflow: TextOverflow.ellipsis),
          CustomPaint(
            painter: DashedLinePainter(),
          ),
          Checkbox(
            value: checkBoxState,
            onChanged: (value) {},
          )
        ])
      ],
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;
    if (size.width > 10) {
      _drawDashedLine(canvas, size, paint);
    }
  }

  _drawDashedLine(Canvas canvas, Size size, Paint paint) {
    const double dashWidth = 4.0;
    const double dashSpace = 2.0;
    double x = 0;

    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dashWidth, 0), paint);
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
