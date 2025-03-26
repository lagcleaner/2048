// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:game2048/presentation/screens/not_found/models/not_found_arguments_model.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, required this.arguments});

  static const String route = '/not_found';
  final NotFoundArgumentsModel arguments;

  @override
  Widget build(BuildContext context) {
    return _NotFoundScreenInternal(notFoundRoute: arguments.routeNotFound);
  }
}

class _NotFoundScreenInternal extends StatelessWidget {
  const _NotFoundScreenInternal({Key? key, this.notFoundRoute})
    : super(key: key);

  final String? notFoundRoute;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Not Found $notFoundRoute.'));
  }
}
