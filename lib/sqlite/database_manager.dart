import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static final String veritabaniAdi = "todo_app_sqlite.db";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi);

    if(await databaseExists(veritabaniYolu)){
      print("Veritabanı zaten var.Kopyalamaya gerek yok.");
    }else{
      ByteData data  = await rootBundle.load("database/$veritabaniAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veritabanı kopyalandı.");
    }

    return openDatabase(veritabaniYolu);
  }
}
