import 'dart:io';
import 'dart:convert';
import 'package:apptest/screens/homeContent/companyArea/html_template_invoice.dart';
import 'package:apptest/screens/homeContent/companyArea/show_invoice.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:http/http.dart' show get;
import 'package:flutter_html/flutter_html.dart';
import 'package:apptest/screens/apis/getTemplateInvoice.dart';

import '../../apis/global_variables.dart';

class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});
}

var jsonrespones;

postData() async {
  var templatemap;
  getTemplate().then((response) async => {
        if (response != 'not invoices')
          {
            // print(jsonDecode(response)),

            jsonrespones = jsonDecode(response)['data'],
            print("aja"),
            print(jsonrespones)
          }
      });
}

class PdfApi {
  static Future<File> generateTable() async {
    final pdf = Document();

    final headers = ['Name', 'Age'];

    final users = [
      User(name: 'James', age: 19),
      User(name: 'Sarah', age: 21),
      User(name: 'Emma', age: 28),
    ];
    final data = users.map((user) => [user.name, user.age]).toList();

    pdf.addPage(Page(
      build: (context) => Table.fromTextArray(
        headers: headers,
        data: data,
      ),
    ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> generateImage() async {
    final pdf = Document();

    const htmlData = Html_template_invoice();
    // final imageJpg = await rootBundle.loadString('descarga.jpg');
    final imageJpg =
        (await rootBundle.load('lib/assets/descarga.jpg')).buffer.asUint8List();
    var url =
        "https://img.freepik.com/free-vector/modern-flowing-blue-wave-banner-white-background_1035-18960.jpg?w=1380&t=st=1660654567~exp=1660655167~hmac=37b70de5f997e80469e8dedf46f93fc5dcb11347073822db1e62c703dd5a365e";
    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;

    var logourl =
        "http://static.donquijote.org/images/blogs/dq-reg/don-quijote-de-la-mancha.jpg";
    var responseLogo = await get(Uri.parse(logourl));
    var dataLogo = responseLogo.bodyBytes;

    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) {
        if (context.pageNumber == 1) {
          return FullPage(
            ignoreMargins: true,

            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image(MemoryImage(data), fit: BoxFit.contain),
              // ignore: prefer_const_constructors
              // Html_template_invoice() as Widget,
              Expanded(
                // ignore: prefer_const_constructors
                child: Text('htmlData'),
              ),
            ]),
            // child: Image.network(
            //     'https://img.freepik.com/free-vector/modern-flowing-blue-wave-banner-white-background_1035-18960.jpg?w=1380&t=st=1660654567~exp=1660655167~hmac=37b70de5f997e80469e8dedf46f93fc5dcb11347073822db1e62c703dd5a365e'),
          );
        } else {
          return Container();
        }
      },
    );

    pdf.addPage(
      MultiPage(
        pageTheme: pageTheme,
        build: (context) => [
          Container(
            height: pageTheme.pageFormat.availableHeight - 1,
            width: pageTheme.pageFormat.availableWidth,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Image(MemoryImage(dataLogo), fit: BoxFit.contain),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Compañia: " + "hola",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: PdfColors.black,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              )),
            ]),
          ),
          // SvgImage(svg: imageSvg),
          Image(MemoryImage(data)),
          Center(
            child: ClipRRect(
              horizontalRadius: 32,
              verticalRadius: 32,
              child: Image(
                MemoryImage(data),
                width: pageTheme.pageFormat.availableWidth / 2,
              ),
            ),
          ),
          GridView(
            crossAxisCount: 3,
            childAspectRatio: 1,
            children: [
              // SvgImage(svg: imageSvg),
              // SvgImage(svg: imageSvg),
              // SvgImage(svg: imageSvg),
              // SvgImage(svg: imageSvg),
              // SvgImage(svg: imageSvg),
              // SvgImage(svg: imageSvg),
            ],
          )
        ],
      ),
    );

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);
    postData();

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
