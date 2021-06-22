import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';

class ShowPDF extends StatefulWidget {
  const ShowPDF({Key key}) : super(key: key);

  @override
  _ShowPDFState createState() => _ShowPDFState();
}

class _ShowPDFState extends State<ShowPDF> {
  String urlPDF = '${MyConstant().domain}/mlao/pdf/testPDF.pdf';
  PDFDocument pdfDocument;

  @override
  void initState() {
    super.initState();
    loadProcess();
  }

  Future<Null> loadProcess() async {
    try {
      var result = await PDFDocument.fromURL(urlPDF);
      setState(() {
        pdfDocument = result;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show PDF'),
      ),body: pdfDocument == null ? MyStyle().showProgress() : PDFViewer(document: pdfDocument) ,
    );
  }
}
