/*
 * @Author: wangtianji
 * @Date: 2021-08-03 14:37:17
 * @LastEditTime: 2021-08-03 14:39:39
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/bloc/sb_counter_view.dart
 */

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'sb_counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SbCounterBloc(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: BlocListener<SbCounterBloc, SbCounterState>(
        listener: (context, state) {
          if (state is SbCounterSuccess) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Success'),
              ),
            );
          }
        },
        child: BlocBuilder<SbCounterBloc, SbCounterState>(
          builder: (context, state) {
            if (state is SbCounterInitial) {
              return Center(child: Text('Press the Button'));
            }
            if (state is SbCounterSuccess) {
              return Center(child: Text('Success'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              BlocProvider.of<SbCounterBloc>(context).add(SbFetchData());
            },
          ),
        ],
      ),
    );
  }
}
