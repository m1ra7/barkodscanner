import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key}); 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String barkod="Unread!";

  @override
  void initState() {
    super.initState();
  }

  _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Failed to initialize $url';
  }
}

  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title:  Text('Scanner', 
      style: GoogleFonts.firaCode(textStyle: TextStyle(
                  fontSize: 30,fontWeight: FontWeight.bold),color: Colors.white
                  ),)
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 350,width:350,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.blueGrey[300],
                    child: Card(color: Colors.blueGrey[500],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(width: 250,child: Image.asset("images/logo.jpg")),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              var res = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SimpleBarcodeScannerPage(),
                                  ));
                              print("Result: $res");
                              setState(() {
                                if (res is String) {
                                   barkod = res;
                                }
                              });
                            },
                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black87)),
                            child: const Text('Scan Barcode or QR Code',style: TextStyle(color: Colors.white))),
                        Text('ScanResult: ', 
                        style: const TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold)),
                        Text("$barkod",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),), 
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blueGrey[300],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4),
                    child: ElevatedButton(onPressed: (){
                            setState((){
                              launchURL(String url) async {
                                if (await canLaunch(url)) {
                                  await launch(url);
                                  } else {
                                    throw 'Failed to initialize $url';
                                    }
                                    }
                                if(barkod!='Unread!'){
                                _launchURL('https://www.google.com/search?q=$barkod');// Açılacak URL buraya yazılır
                                 }
                                 else{
                                  print("$barkod");
                                  }
                                  });}, child: const Text("* Click to search on the internet *",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    ),),
                              ),
                                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}