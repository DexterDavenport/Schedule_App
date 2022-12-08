import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import '../../main.dart';
// ignore: unused_import
import '../components/globals.dart' as globals;

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

QuillController descriptionController = QuillController.basic();
String description = descriptionController.document.toPlainText();

class _DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.document_scanner),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: QuillToolbar.basic(controller: descriptionController),
          ),
          Expanded(
              child: QuillEditor.basic(
                  controller: descriptionController, readOnly: false)),
          FloatingActionButton(

            onPressed: () {
              description = descriptionController.document.toPlainText();
              Navigator.pop(context, description);
              description = descriptionController.document.toPlainText();
            },
            child: const Icon(Icons.add_box),
          ),
        ],
      ),
    ));
  }
}
