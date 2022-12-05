import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/pages/home_page.dart';

// ignore: unused_import
import 'contexts/globals.dart' as globals;

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

QuillController _controller = QuillController.basic();

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
            child: QuillToolbar.basic(controller: _controller), 
          ),
          Expanded(child: 
          QuillEditor.basic(controller: _controller, readOnly: false)),

          FloatingActionButton(
            // style: buttonStyle,
            // Within the `FirstRoute` widget
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'Home',)),
              );
            },
            child: const Icon(Icons.add_box),
          ),],
      ),
    ));
  }
}
