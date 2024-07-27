import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class InformationsView extends StatelessWidget {
  const InformationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(leading: IconButton(onPressed: (){}, icon: Icon(Icons.chevron_left_outlined),),),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("${text.FlutterProject}\nScanScreen:\n${text.BarcodeScanScreen}\nMain Page:\n${text.MainPage}\nTab View Style:\n${text.Informations}\nDesign and Navigation:\n${text.DesignAndNavigation}",                
            style: GoogleFonts.mPlusCodeLatin(textStyle: TextStyle(
                      fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),
                      ),)
          ],
        )
      ),
    );
  }
}

 class text{
 static const String FlutterProject="This Flutter project has the functionality to scan barcodes and QR codes and display the scanning results.\nHere are the general features of the project:\n";
 static const String BarcodeScanScreen="A screen called SimpleBarcodeScannerPage is used to scan barcodes. This screen was created using the simple_barcode_scanner package.\n";
 static const String MainPage="The home page is the entry point of the app. The MyHomePage widget contains an app bar with the name of the app and a barcode scan button. It also includes a section showing the scan result and a button to search the scan result on the internet.\n";
 static const String Informations= "The InfoView widget provides a display for scan results or other information. Currently it is only used to show the 'data' text, but this widget can contain more information or hold a place for features added later in the project.\n";
 static const String DesignAndNavigation= "The design widget allows navigation between different tabs using a DefaultTabController. The tab bar contains tabs that include the browsing screen (MyHomePage) and the informational screen (informationalView). Some packages (url_launcher, simple_barcode_scanner) are also used in the project. url_launcher is used to search the scanned barcode on the internet, while simple_barcode_scanner provides barcode scanning functionality. You also used the Material design language for the UI components.\n";
 }
