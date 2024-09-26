import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../di/module.dart';
import '../view_model/random_quote_view_model.dart';

class RandomQuoteView extends StatelessWidget {
  const RandomQuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<RandomQuoteViewModel>()..fetchRandomQuote(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Random Quote'),
        ),
        body: Consumer<RandomQuoteViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (viewModel.error != null) {
              return Center(child: Text(viewModel.error!));
            } else if (viewModel.quote != null) {
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Quote of the day',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        viewModel.quote!.quote,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        viewModel.quote!.author,
                        style: const TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                  child: Text('Press the button to fetch a quote.'));
            }
          },
        ),
      ),
    );
  }
}
