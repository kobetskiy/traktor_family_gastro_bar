import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';

class HomePopularMealsListView extends StatelessWidget {
  const HomePopularMealsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return const _HomeMealsCardContent();
        },
        separatorBuilder: (_, __) => const SizedBox(width: 20),
      ),
    );
  }
}

class _HomeMealsCardContent extends StatelessWidget {
  const _HomeMealsCardContent();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 155,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white12,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  'https://cdn-media.choiceqr.com/prod-eat-traktorgastrobar/menu/rLkzkqD-CgLSkyx-qeJBPMJ.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text("Шакшука з трюфельним крем-сиром та кензою",
                    maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.subtitleColor)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(Icons.favorite_border_rounded),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Center(
                                child: Text('0'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '300грн',
                      style: TextStyle(color: AppColors.primaryColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
