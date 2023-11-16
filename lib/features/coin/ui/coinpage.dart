import 'package:bloc_project/features/coin/ui/typeofCoins.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Coinpage extends StatelessWidget {
  const Coinpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 1, 30),
        body: BlocConsumer<HomeBloc, HomeState>(
          listenWhen: (previous, current) => current is HomeActionsState,
          buildWhen: (previous, current) => current is! HomeActionsState,
          listener: (context, state) {
            if (state is CoinAddedMessageState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added Watchlist')));
            } else if (state is CointainTrueMessageState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This Coin already added')));
            }
          },
          builder: (context, state) {
            if (state is CoinloadedState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CoinloadedeSucessState) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: state.coins.length,
                    itemBuilder: (context, index) {
                      final coin = state.coins[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Allcoins(
                          coinob: coin,
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is SocketExceptionstate) {
              return const Center(
                child: Text(
                  'Network issue, check your interner',
                  style: TextStyle(color: Colors.amber),
                ),
              );
            } else if (state is CoinErrorState) {
              return const Center(
                child: Text(
                  'Server issue',
                  style: TextStyle(color: Colors.amber),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
