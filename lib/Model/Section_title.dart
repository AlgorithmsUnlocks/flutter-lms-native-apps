import 'package:flutter/material.dart';

class SectionTitleDynamic extends StatelessWidget {
  final String title;
  const SectionTitleDynamic({
    Key? key,
    required this.title,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}