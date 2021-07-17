import 'package:flutter/material.dart';
import 'package:huawei_contest/core/device_size.dart';

class HeaderInput extends StatelessWidget {
  const HeaderInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(),
          SizedBox(height: DS.sh * 0.02),
          DateCreated(),
        ],
      ),
    );
  }
}

class DateCreated extends StatelessWidget {
  const DateCreated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //TODO: Filter the date to required format
        //! Using the dateformat package

        Text(DateTime.now().toString(),
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                )),
        SizedBox(
          width: DS.sw * 0.03,
        ),
        Container(
          color: Colors.blue,
          width: DS.sw * 0.009,
          height: 25.0,
        ),
        Text('')
      ],
    );
  }
}
