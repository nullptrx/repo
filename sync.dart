import 'dart:io';

import 'package:dio/dio.dart';

void main(List<String> arguments) async {
  var file = File('m2');
  var baseUrl = 'http://localhost:8081/repository/m2/';
  var version = '3.9.0.0';
  var actifact = 'pangle';
  var fragment = 'io/github/nullptrx/$actifact';
  var vfragment = fragment + '/' + version;
  var dir = Directory(file.path + '/' + fragment);
  var vdir = Directory(file.path + '/' + vfragment);
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }
  if (!vdir.existsSync()) {
    dir.createSync(recursive: true);
  }
  var files = [
    'maven-metadata.xml',
    'maven-metadata.xml.md5',
    'maven-metadata.xml.sha1',
    'maven-metadata.xml.sha256',
    'maven-metadata.xml.sha512',
  ];

  var dio = Dio(BaseOptions(baseUrl: baseUrl));
  files.forEach((element) async {
    try {
      var urlPath = fragment + '/' + element;
      var savePath = dir.path + '/' + element;
      dio.download(urlPath, savePath);
    } catch (e) {
      print(e);
    }
  });
  var vfiles = [
    '$actifact-$version.aar',
    '$actifact-$version.aar.md5',
    '$actifact-$version.aar.sha1',
    '$actifact-$version.aar.sha256',
    '$actifact-$version.aar.sha512',
    '$actifact-$version.pom',
    '$actifact-$version.pom.md5',
    '$actifact-$version.pom.sha1',
    '$actifact-$version.pom.sha256',
    '$actifact-$version.pom.sha512',
  ];

  vfiles.forEach((element) {
    try {
      var savePath = vdir.path + '/' + element;
      var urlPath = vfragment + '/' + element;
      dio.download(urlPath, savePath);
    } catch (e) {
      print(e);
    }
  });
}
