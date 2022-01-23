import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:functional_error_handling/features/post/presentation/bloc/posts_list.dart";
import "package:functional_error_handling/features/post/presentation/posts_list_page.dart";

import 'features/post/data/repositories_impl/posts_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Functional Error Handling",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Functional Error Handling"),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<PostsListBloc>(
              create: (BuildContext context) => PostsListBloc(
                postsRepository: PostsRepositoryImpl(),
              )..add(const LoadPostsList()),
            ),
          ],
          child: const PostPage(),
        ),
      ),
    );
  }
}
