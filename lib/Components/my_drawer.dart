import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var myDrawer = const Drawer(
  child: Column(
    children: [
      SizedBox(
        height: 50,
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Yash Sharma'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Lead Developer'),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.email, size: 16),
                SizedBox(width: 5),
                Text('yash13767@gmail.com'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(CupertinoIcons.link, size: 16),
                SizedBox(width: 5),
                Text('LinkedIn/yash-codes-dev'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.phone, size: 16),
                SizedBox(width: 5),
                Text('+91 7703841050'),
              ],
            ),
          ],
        ),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Tarun Jhamb'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Front-end'),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.email, size: 16),
                SizedBox(width: 5),
                Text('rajatjhamb45@gmail.com'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(CupertinoIcons.link, size: 16),
                SizedBox(width: 5),
                Text('LinkedIn/tarun'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.phone, size: 16),
                SizedBox(width: 5),
                Text('+91 xxxxxxxxx'),
              ],
            ),
          ],
        ),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Amanpreet Saini'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('backend'),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.email, size: 16),
                SizedBox(width: 5),
                Text('sainiamanpreet@gmail.com'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(CupertinoIcons.link, size: 16),
                SizedBox(width: 5),
                Text('LinkedIn/amanpreet'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.phone, size: 16),
                SizedBox(width: 5),
                Text('+91 xxxxxxxxxx'),
              ],
            ),
          ],
        ),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Manjeet'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('UI/UX'),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.email, size: 16),
                SizedBox(width: 5),
                Text('manjeetdhaiya@gmail.com'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(CupertinoIcons.link, size: 16),
                SizedBox(width: 5),
                Text('LinkedIn/manjeet'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.phone, size: 16),
                SizedBox(width: 5),
                Text('+91 xxxxxxxx'),
              ],
            ),
          ],
        ),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Harsh Choudhary'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Support developer'),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.email, size: 16),
                SizedBox(width: 5),
                Text('harshchoudhary@gmail.com'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(CupertinoIcons.link, size: 16),
                SizedBox(width: 5),
                Text('LinkedIn/harshchoudhary'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.phone, size: 16),
                SizedBox(width: 5),
                Text('+91 xxxxxxxxx'),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
);
