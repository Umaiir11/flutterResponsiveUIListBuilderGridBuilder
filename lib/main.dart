import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the r00oot of your application.
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenSize.height * 0.05,
                  left: screenSize.width * 0.10,
                  right: screenSize.width * 0.10),
              child: Container(
                height: screenSize.height* .300,
                width: screenSize.width,
                color: Colors.cyanAccent,
                child: Center(
                  child:  Text(
                      "List Tiles",
                      style: TextStyle(fontSize: 40),

                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height*.10,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 600) {
                  // Display as grid
                  return Padding(
                    padding: EdgeInsets.only(
                        top: screenSize.height * 0.05,
                        left: screenSize.width * 0.17,
                      right: screenSize.width * 0.17,
                        ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (constraints.maxWidth / 250).floor(),
                        mainAxisExtent: 200,
                        childAspectRatio: 2,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount:5,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.lightBlueAccent,
                          child: SizedBox(
                            height: screenSize.height*.200,
                            width: screenSize.width*400,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text((index + 1).toString()),
                              ),
                              title: Text('List Item ${index + 1}'),
                              subtitle: Text('Description'),
                              trailing: Icon(Icons.arrow_forward),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  // Display as list
                  return Padding(
                    padding: EdgeInsets.only(
                  top: screenSize.height * 0.05,
                    left: screenSize.width * 0.17,
                      right: screenSize.width * 0.17,

                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.lightBlueAccent,
                          child: SizedBox(
                            height: screenSize.height*.200,
                            width: screenSize.width*400,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text((index + 1).toString()),
                              ),
                              title: Text('List Item ${index + 1}'),
                              subtitle: Text('Description'),
                              trailing: Icon(Icons.arrow_forward),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
