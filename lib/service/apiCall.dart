import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Service {
  final keyApplicationId = 'hycD1RKBj2bTMndyn72GJ6IMgG1LPQ1FICTdRKXL';
  final keyClientKey = 'DTb2w3KD568Bdz5yw9mGqWYRkaKss3f8t5INXlRd';
  final keyParseServerUrl = 'https://parseapi.back4app.com/';

  Future getProjects() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, autoSendSessionId: true);

    var response = await ParseObject('Projects').getAll();
    if (response.success) {
      print(response.result);
    } else {
      print(response.error);
    }
  }

  void getProject() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, autoSendSessionId: true);

    var response = await ParseObject('Projects').getObject('1');
    if (response.success) {
      print(response.result);
    } else {
      print(response.error);
    }
  }

  void addProject(
    String titre,
    String desc,
  ) {
    WidgetsFlutterBinding.ensureInitialized();

    Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, autoSendSessionId: true);

    var project = ParseObject('Projects')
      ..set('titre', titre)
      ..set('description', desc);

    project.save().then((response) {
      if (response.success) {
        print(response.result);
      } else {
        print(response.error);
      }
    });
  }
}
