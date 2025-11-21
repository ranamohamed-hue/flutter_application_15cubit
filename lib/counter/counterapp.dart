import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/counter/countercubit.dart';
import 'package:flutter_application_15cubit/counter/counterstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counterapp extends StatefulWidget {
  const Counterapp({super.key});

  @override
  State<Counterapp> createState() => CounterappState();
}

class CounterappState extends State<Counterapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,

        title: Text(
          'Counter App',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 228, 70, 18),
                const Color.fromARGB(255, 192, 85, 50),
                const Color.fromARGB(255, 189, 51, 5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Counter:',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  SizedBox(width: 10),
                  BlocConsumer<Countercubit, Counterstates>(
                    listener: (context, state) {
                      if (state is Counterincreament) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Increament'),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      } else if (state is Counterdecreament) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Decreament'),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (state is Counterrefresh) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Reset'),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Text(
                        '${context.read<Countercubit>().counter}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: 'Increament',
                    onPressed: context.read<Countercubit>().increament,
                    backgroundColor: const Color.fromARGB(255, 32, 84, 228),
                    child: Icon(Icons.add, size: 50, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  FloatingActionButton(
                    heroTag: 'Decreament',
                    onPressed: context.read<Countercubit>().decreament,
                    backgroundColor: const Color.fromARGB(255, 228, 60, 18),
                    child: Icon(Icons.add, size: 50, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  FloatingActionButton(
                    heroTag: 'Reset',
                    onPressed: context.read<Countercubit>().reset,
                    backgroundColor: const Color.fromARGB(255, 21, 163, 8),
                    child: Icon(Icons.add, size: 50, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
