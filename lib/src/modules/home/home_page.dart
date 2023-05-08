import 'package:flutter/material.dart';

import '../../core/env/env.dart';

class HomePage extends StatelessWidget {

  const HomePage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Home Page'),),
           body: Container(
            child: Text(Env.instance.get('backend_base_url')),
           ),
       );
  }
}