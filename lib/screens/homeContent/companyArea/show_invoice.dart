import 'dart:convert';

import 'dart:io';
import 'dart:typed_data';

import 'package:apptest/screens/homeContent/companyArea/html_template_invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';S
import 'package:printing/printing.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import '../../apis/global_variables.dart';
import 'package:pdf/widgets.dart' as pw;
import 'invoice_pdf.dart';
import 'show_invoice.dart';
import './widget/button_widget.dart';

class Show_invoice extends StatefulWidget {
  // Show_invoice({Key? key}) : super(key: key);

  @override
  State<Show_invoice> createState() => _Show_invoiceState();
}

class _Show_invoiceState extends State<Show_invoice> {
  late final String title;

  @override
  Widget build(BuildContext context) {
    print(InvoiceID);

    var invoiceProducts = jsonDecode(InvoiceDAta)['productos'];
    List? tags = invoiceProducts != null ? List.from(invoiceProducts) : null;
    print(tags?.length);
    print(invoiceProducts);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network('https://cutt.ly/iZo6Y0b', fit: BoxFit.cover),
            ElevatedButton(
              onPressed: _getTemplate,
              child: Text("pdf"),
            ),
            ButtonWidget(
              text: 'Image PDF',
              onClicked: () async {
                final pdfFile = await PdfApi.generateImage();

                PdfApi.openFile(pdfFile);
              },
            ),
            Divider(),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(2),
              },
              children: [
                for (var item in tags!)
                  TableRow(children: [
                    Expanded(
                      // height: 44,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['producto'],
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0))
                          ]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(item['precio'], style: TextStyle(fontSize: 20.0))
                        ]),
                  ]),
              ],
            )
          ],
        )),
      ))),
    );
  }

  Future<void> _getTemplate() async {
    // final pdf = pw.Document();
    // final imageJpg =
    //     (await rootBundle.load('descarga.jpg')).buffer.asUint8List();

    // pdf.addPage(pw.MultiPage(
    //     build: (context) => [
    //           // JpgImage(jpg:imageJpg),
    //           Image(MemoryImage(imageJpg)),
    //         ]));

    // const htmlData = r"""<p style=\"text-align: right;\">wdqk</p>""";
    // PdfDocument document = PdfDocument();
    // final page = document.pages.add();
    // page.graphics
    //     .drawString(htmlData, PdfStandardFont(PdfFontFamily.helvetica, 30));

    // page.graphics.drawImage(PdfBitmap(await _readImageData('descarga.jpg')),
    //     Rect.fromLTWH(0, 100, 440, 550));
    // PdfGrid grid = PdfGrid();
    // // grid.draw(
    // //     page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    // List<int> bytes = await document.save();
    // document.dispose();

    // saveAndLaunchFile('bytes', 'Output.pdf');
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('./lib/assets/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
