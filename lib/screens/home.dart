import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/providers/home.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>(); // listen to changes
    final items = homeProvider.items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              value: homeProvider.seletedItem,
              hint: const Text("Select a country"),
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: false,
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item["id"],
                  child: Row(
                    children: [
                      Image.asset('assets/imgs/ic_launcher.png'),
                      const SizedBox(width: 8),
                      Text(item["title"]!),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                homeProvider.selectItem(newValue);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, i) => ListTile(
                  // leading: const Icon(Icons.star),
                  leading: Image.asset('assets/imgs/ic_launcher.png'),
                  title: Text(items[i]['title']),
                  // trailing: IconButton(
                  //   icon: const Icon(Icons.delete),
                  //   onPressed: () {
                  //     homeProvider.removeItem(items[i]['id']);
                  //   },
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newId = DateTime.now().millisecondsSinceEpoch.toString();
          context.read<HomeProvider>().addItem({
            'id': newId,
            'title': 'New Item $newId',
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
