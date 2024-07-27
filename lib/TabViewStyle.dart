import 'package:barkodscanner/Informations.dart';
import 'package:barkodscanner/myHomePage.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class TabViewStyle extends StatelessWidget {
   TabViewStyle({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length, 
      child: Scaffold(
        appBar: AppBar(
        actions: const [Icon(Icons.qr_code_scanner,color: Colors.white,)],
        leading: const Icon(Icons.barcode_reader,color: Colors.white),
      ),

        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
        shape: const CircleBorder() ,
        onPressed: () async {
          var res = await Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => const SimpleBarcodeScannerPage(),
            ));
              if (res is String) {
                var result = res;
                }
                },
        child: const Icon(Icons.barcode_reader),
        ),

      bottomNavigationBar: BottomAppBar(
        notchMargin: 2,
        child: TabBar(
          //unselectedLabelColor: Colors.pink, 
          indicatorColor: Colors.blueGrey[900],
          labelColor: Colors.black,
          tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
        ),),

      body: const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
        MyHomePage(),
        InformationsView(),
        ])
    ));
  }
}

enum _MyTabViews{
    BarScanner, Informations
}
//extension _MyTabViewsExtension on _MyTabViews{

//}
