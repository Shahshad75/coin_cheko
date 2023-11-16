import 'package:bloc_project/features/watchilist/bloc/watch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchedCoins extends StatelessWidget {
  const WatchedCoins({
    super.key,
    this.index,
    required this.coinob,
  });

  final coinob;
  final index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: coinob.price_change_24h < 0
              ? const Color.fromARGB(63, 255, 0, 0)
              : const Color.fromARGB(88, 76, 175, 79),
          borderRadius: BorderRadius.circular(5)),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '#${coinob.rank.toString()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                )),
            Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(coinob.image))),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Text(
                              coinob.symbol,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ))
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: ListTile(
                    title: Text(
                      coinob.name,
                      maxLines: 1,
                      overflow: null,
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "\$" + coinob.price.toString(),
                        maxLines: 1,
                        overflow: null,
                        style: const TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        coinob.price_change_24h.toStringAsFixed(2),
                        maxLines: 1,
                        overflow: null,
                        style: TextStyle(
                            color: coinob.price_change_24h < 0
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : Colors.green,
                            fontWeight: FontWeight.w400,
                            fontSize: 19),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          confirmSnacbar(context, index);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.remove,
                              color: Color.fromARGB(255, 220, 97, 97),
                            ),
                            Text(
                              'Remove',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 93, 93),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  confirmSnacbar(BuildContext context, index) {
    showDialog(
        barrierColor: const Color.fromARGB(169, 0, 0, 0),
        context: context,
        builder: (ctx1) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 36, 35, 46),
            title: const Text(
              'Remove',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text('Are you sure to remove this coin',
                style: TextStyle(color: Colors.white)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white))),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<WatchBloc>()
                        .add(WatchRemovecoimEvetnt(index: index));
                    context.read<WatchBloc>().add(WatchSucessEvent());

                    Navigator.of(context).pop();
                  },
                  child:
                      const Text('Yes', style: TextStyle(color: Colors.white)))
            ],
          );
        });
  }
}
