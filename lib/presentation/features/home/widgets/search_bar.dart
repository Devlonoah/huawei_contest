import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/device_size.dart';

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Container(
            alignment: Alignment.center,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(children: [
              Icon(Icons.search),
              SizedBox(
                width: 14,
              ),
              Text('Search Note',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 12)),
            ])),
      ),
    );
  }
}
