import 'package:cake_app/data/repository/cake_repository.dart';
import 'package:flutter/material.dart';
import '../../../data/models/cake_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cakeRepository = CakeRepository();

  List<Cake> cakes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cakes"),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed("/add");
                setState(() {});
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: cakeRepository.getAllCakes(),
        builder: (context, snapshot) {
          if (snapshot.error != null) {
            return Center(
              child: Text(snapshot.error!.toString()),
            );
          } else if (snapshot.hasData == true || cakes.isNotEmpty) {
            cakes = snapshot.data ?? cakes;
            return ListView.separated(
              itemCount: cakes.length,
              itemBuilder: (BuildContext context, int index) => Text(
                cakes[index].name,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
