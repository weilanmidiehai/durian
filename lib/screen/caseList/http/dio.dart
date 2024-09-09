import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FutureBuilderRoute extends StatefulWidget {
  const FutureBuilderRoute({super.key});

  @override
  State<FutureBuilderRoute> createState() => _FutureBuilderRouteState();
}

class _FutureBuilderRouteState extends State<FutureBuilderRoute> {
  final Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
            future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //请求完成
              if (snapshot.connectionState == ConnectionState.done) {
                debugPrint('$snapshot');
                Response response = snapshot.data;
                //发生错误
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                //请求成功，通过项目信息构建用于显示项目名称的ListView
                return ListView(
                    children: response.data
                        .map<Widget>((e) =>
                            Card(child: ListTile(title: Text(e["full_name"]))))
                        .toList());
              }
              //请求未完成时弹出loading
              return const Column(
                mainAxisSize: MainAxisSize.min,
                children: [CircularProgressIndicator(), Text('\n正在加载...')],
              );
            }),
      ),
    );
  }
}
