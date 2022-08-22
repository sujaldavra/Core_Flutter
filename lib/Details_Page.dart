import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_app/product.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CustomRow {
  final String itemName;
  final String Price;
  final String Quantity;
  final String total;

  CustomRow(this.itemName, this.Price, this.Quantity, this.total);
}

class GetInvoice {
  Future<Uint8List> getInvoice(List<Productsinvoice> soldProducts) {
    final pdf = pw.Document();
    final List<CustomRow> elements = [
      CustomRow("Item Name", "Price", "Quantity", "Total"),
      for (var product in soldProducts)
        CustomRow(
          product.productName,
          product.productPrice.toString(),
          product.productQuantity.toString(),
          (product.productPrice * product.productQuantity).toString(),
        ),
      CustomRow(
        "Total",
        "",
        '',
        "${getTotal(soldProducts)} Rs.",
      ),
    ];
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a5,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Column(
                    children: [
                      pw.Text('Sujal Davra'),
                      pw.Text('A-102 simada,'),
                      pw.Text('NEAR simada gam,'),
                      pw.Text('Surat-394107'),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 30),
              itemList(elements),
              pw.SizedBox(height: 25),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }

  pw.Expanded itemList(List<CustomRow> elements) {
    return pw.Expanded(
      child: pw.Column(
        children: [
          for (var element in elements)
            pw.Row(
              children: [
                pw.Expanded(
                  child:
                  pw.Text(element.itemName, textAlign: pw.TextAlign.left),
                ),
                pw.Expanded(
                  child: pw.Text(element.Price, textAlign: pw.TextAlign.right),
                ),
                pw.Expanded(
                  child:
                  pw.Text(element.Quantity, textAlign: pw.TextAlign.right),
                ),
                pw.Expanded(
                  child: pw.Text(element.total, textAlign: pw.TextAlign.right),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> openPDF(Uint8List data) async {
    final dir = await getExternalStorageDirectory();
    final filePath = '${dir?.path}/Invoice.pdf';
    final file = File(filePath);
    await file.writeAsBytes(data);
    OpenFile.open(filePath);
  }

  String getTotal(List<Productsinvoice> products) {
    return products
        .fold(
        0,
            (int prev, element) =>
        prev + (element.productPrice * element.productQuantity))
        .toStringAsFixed(0);
  }
}
