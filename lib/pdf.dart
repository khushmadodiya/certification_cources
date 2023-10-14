// ignore_for_file: prefer_const_constructors
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFView extends StatefulWidget {
  String name;
  String cources;
  @override
   PDFView({
    super.key,
    required this.name,
    required this.cources,


  });

  @override
  State<PDFView> createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pdf'),),
      body: PdfPreview(
        build: (format) => _createPdf(
          format,
        ),
      ),
    );
  }

  Future<Uint8List> _createPdf(
      PdfPageFormat format,
      ) async {
    final pdf = pw.Document();

    // Define your custom page format for the certificate
    final pageFormat = PdfPageFormat((150.0 * (72.0 / 25.4)), (80 * (72.0 / 25.4)));
    final customColor = PdfColor.fromInt(0xFF3366CC);
    final ContainerColor = PdfColor.fromInt(0xFF3366CC);
    final now = DateTime.now();
    final formattedDate = "${now.day}-${(now.month)}-${(now.year)}";
    // Add content to the certificate
    pdf.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (pw.Context context) {
          return pw.Container(
            decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.circular(0),
              border:  pw.Border.all(),
            ),
           child: pw.Center(
            child: pw.Column(
              // mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: <pw.Widget>[
                pw.SizedBox(height: 10),
                pw.Container(
                  height: 30,
                  width: double.infinity,
                  child: pw.Center(
                    child: pw.Text(
                      'Certificate of Achievement',
                      style: pw.TextStyle(fontSize: 18.0, fontWeight: pw.FontWeight.bold,color:customColor ),
                    ),
                  )
                ),
                pw.SizedBox(height: 30),
                pw.Text('This is to certify that', style: pw.TextStyle(fontSize: 14.0)),
                pw.SizedBox(height: 8),

                pw.Text(''' ${widget.name.toString()}''',
                  style: pw.TextStyle(fontSize: 18.0, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 8),
                pw.Text('has successfully completed the course', style: pw.TextStyle(fontSize: 14.0)),
                pw.SizedBox(height: 8),
                pw.Text(
                  '''${widget.cources.toString()}''',
                  style: pw.TextStyle(fontSize: 18.0, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 10),
                pw.Container(
                    // color: customColor,
                    // height: ,
                    // height: 50,
                     width: double.infinity,
                    alignment: pw.Alignment.centerLeft,
                    child:pw.Row(
                      children: [
                        pw.Text('      Date \n  $formattedDate',style:pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold,font: pw.Font.helvetica())),
                        pw.SizedBox(width: 200),
                        pw.Text('khushvant   ',style:pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold,font: pw.Font.helvetica()))
                      ]
                    )
                ),


              ],
            ),
           )
          );
        },
      ),
    );

  return pdf.save();
  }
}