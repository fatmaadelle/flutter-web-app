import 'package:flutter/material.dart';

void main() {
  runApp(ProposalApp());
}

class ProposalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
         
      ),
      home: ProposalScreen(),
    );
  }
}

class ProposalScreen extends StatefulWidget {
  @override
  _ProposalScreenState createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  bool _showFirstQuestion = true;
  bool _showSecondQuestion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Marriage Proposal'),
      ),
      body:  Center(
          
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showFirstQuestion)
              Column(
                children: [
                  Text(
                    'yasser,\n since we know each other very well,\n can i ask you a question?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showFirstQuestion = false;
                        _showSecondQuestion = true;
                      });
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            if (_showSecondQuestion)
              Column(
                children: [
                  Text(
                    'Will you marry me?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle "Yes" button press
                             showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Finally! 💍'),
                      content: Text('You said YES!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                        },
                        child: Text('Yes'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle "No" button press
                           showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('WTF 😢'),
                      content: Text('You said NO!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}