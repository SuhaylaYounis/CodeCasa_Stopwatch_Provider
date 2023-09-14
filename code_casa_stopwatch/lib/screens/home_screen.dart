import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:code_casa_stopwatch/provider/stopwatch_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Provider.of<StopWatchProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 5,
        title: Text("Stop Watch", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ),),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      body: homeScreenBody(),
    );
  }

  Widget homeScreenBody() {
    return Container(child: Consumer<StopWatchProvider>(

      builder: (context, timeprovider, widget) {

        return Padding(
          padding: const EdgeInsets.only(top:200.0, left: 8, right: 8),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '${timer.hour} : ' + '${timer.minute} : ' + '${timer.seconds} ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (timer.startEnable)
                      ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                    onPressed: timer.startTimer,
                    child: Text('Start', style: TextStyle(fontSize: 25),),
                  ),
                      )
                      : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                    onPressed: null,
                    child: Text('Start', style: TextStyle(fontSize: 25)),
                  ),
                      ),
                  (timer.stopEnable)
                      ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                    onPressed: timer.stopTimer,
                    child: Text('Stop', style: TextStyle(fontSize: 25)),
                  ),
                      )
                      : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                    onPressed: null,
                    child: Text('Stop', style: TextStyle(fontSize: 25)),
                  ),
                      ),
                  (timer.continueEnable)
                      ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                    onPressed: timer.continueTimer,
                    child: Text('Continue', style: TextStyle(fontSize: 25)),
                  ),
                      )
                      : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                    onPressed: null,
                    child: Text('Continue', style: TextStyle(fontSize: 25)),
                  ),
                      ),
                ],
              ),
            ],
          ),
        );
      },
    ));
  }
}