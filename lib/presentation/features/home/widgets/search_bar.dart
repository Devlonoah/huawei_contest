import 'package:flutter/material.dart';
import 'package:huawei_contest/core/device_size.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: DS.sh * 0.06,
          padding: EdgeInsets.symmetric(horizontal: DS.sw * 0.04),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            color: Colors.black,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(children: [
            Icon(Icons.search),
            SizedBox(
              width: DS.sw * 0.03,
            ),
            Text('Search Note',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.grey, fontWeight: FontWeight.w300)),
          ])

          //  TextField(
          //   style: Theme.of(context).textTheme.subtitle2,
          //   decoration: InputDecoration.collapsed(hintText: 'Hint'),
          // ),
          ),
    );
  }
}
