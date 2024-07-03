// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).faq),
          ],
          body: ListView(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              _ExpansionTileWidget(
                title: S.of(context).howToReturnTheProduct,
                content: [
                  Text(
                    S.of(context).howToReturnTheProductContent,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              _ExpansionTileWidget(
                title: S.of(context).whatAreThePaymentMethods,
                content: [
                  Text(
                    S.of(context).whatAreThePaymentMethodsContent,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              _ExpansionTileWidget(
                title: S.of(context).howDoesDeliveryWork,
                content: [
                  Text(
                    S.of(context).howDoesDeliveryWorkContent,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              _ExpansionTileWidget(
                title: S.of(context).howToPlaceAnOrder,
                content: [
                  Text(
                    S.of(context).howToPlaceAnOrderContent,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  S.of(context).inCaseOfAnyQuestionsPleaseCall,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExpansionTileWidget extends StatelessWidget {
  const _ExpansionTileWidget({
    required this.title,
    required this.content,
    this.subtitle,
    this.leading,
  });

  final String title;
  final List<Widget> content;
  final String? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      tilePadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: leading != null ? const Icon(Icons.inbox) : null,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey[600]),
            )
          : null,
      children: content,
    );
  }
}
