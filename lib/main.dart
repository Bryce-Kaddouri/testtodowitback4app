import 'package:flutter/material.dart';
import 'package:flutter_parse/service/apiCall.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Parse Server SDK'),
        ),
        body: [
          Home(),
          Projects(),
          Team(),
          Calendar(),
        ][selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          // fixedColor: Colors.white,
          elevation: 20,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Projects',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Team',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            onItemTapped(index);
            print(index);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Service().addProject("test", "test desc");
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Home'),
      ),
    );
  }
}

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

List<Map<String, dynamic>> projects = [];

class _ProjectsState extends State<Projects> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var test = Service().getProjects();
    // test.then((value) {
    //   setState(() {
    //     projects = value;
    //   });
    // });
    // ProjectListView({this.projects});

    print('projects: $projects');
    // print('test: ${projects.length}');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> project = projects[index];
        return ListTile(
          title: Text(project['titre']),
          subtitle: Text(project['desc']),
        );
      },
    );
  }
}

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Team'),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Calendar'),
      ),
    );
  }
}
