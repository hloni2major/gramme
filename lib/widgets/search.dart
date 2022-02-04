import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: const TextField(
                maxLines: 1,
                autofocus: false,
                style: TextStyle(
                  color: Color(0xff107163),
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
