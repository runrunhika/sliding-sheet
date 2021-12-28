import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snapping Bottom Sheet"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 25),
              textStyle: TextStyle(fontSize: 24)),
          child: Text("Open Sheet"),
          onPressed: showSheet,
        ),
      ),
    );
  }

  Future showSheet() => showSlidingBottomSheet(context,
      builder: (context) => SlidingSheetDialog(
          cornerRadius: 16,
          avoidStatusBar: true,
          snapSpec: SnapSpec(initialSnap: 0.7, snappings: [0.4, 0.7, 1.0]),
          builder: buildSheet,
          headerBuilder: buildHeader));

  Widget buildHeader(BuildContext context, SheetState state) {
    return Material(
      child: Container(
        color: Colors.blue,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                width: 32,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSheet(context, state) => Material(
        child: ListView(
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.all(16),
          children: [
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            //         textStyle: TextStyle(fontSize: 24)),
            //     onPressed: () => Navigator.of(context).pop(),
            //     child: Text('Close')),
            Builder(
              builder: (context) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle: TextStyle(fontSize: 24)),
                  onPressed: () => SheetController.of(context)!.expand(),
                  child: Text('Read More')),
            ),
            bodySheet(),
            bodySheet2(),
            bodySheet3(),
          ],
        ),
      );

  Widget bodySheet() {
    final TextEditingController titleController = TextEditingController();

    return Container(
      child: TextField(
        controller: titleController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget bodySheet2() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget bodySheet3() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
