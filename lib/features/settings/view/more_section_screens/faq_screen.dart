import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ExpansionTileWidget(
                title: 'Як повернути товар?',
                content: [
                  Text(
                    "Відмова від товару можлива в момент отримання і при умові неналежної якості його. Повернення переказаних коштів проводиться на Ваш банківський рахунок протягом 5 - 30 робочих днів (термін залежить від Банку, який видав Вашу банківську карту).",
                    style: AppTextStyles.subtitle,
                  )
                ],
              ),
              ExpansionTileWidget(
                title: 'Які є способи оплати?',
                content: [
                  Text(
                    "Для вибору оплати товару за допомогою банківської картки на відповідній сторінці необхідно натиснути кнопку «Оплата замовлення банківською карткою». Оплата відбувається через систему liqpay з використанням Банківських карток платіжних систем Visa та Mastercard",
                    style: AppTextStyles.subtitle,
                  )
                ],
              ),
              ExpansionTileWidget(
                title: 'Як працює доставка?',
                content: [
                  Text(
                    "Доставка замовлень здійснюється виключно службами таксі міста Харкова, за тарифами служб. Мінімальна сума замовлення для доставки 300грн.\n\nПри замовленні від 500грн в межах 7км від ресторану доставка замовлень - БЕЗКОШТОВНА!\n\nУ разі замовлень, відстань яких більше 7км від ресторану вартість доставки сплачує клієнт по тарифу служби таксі. В таких випадках ресторан компенсує клієнту вартість доставки в розмірі 100грн. Різницю сплачує клієнт! Наприклад, вартість доставки вашого замовлення скла 250грн. В такому випадку ресторан, з свого боку сплачує 100грн а залишок вартості 150грн сплачує клієнт.\n\nЗамовлення сума яких від 3000грн доставляються по Харкову - БЕЗКОШТОВНО! Орієнтовний час приготування замовлень від 15хв до 40хв. в залежності від завантажень кухні.\n\nЧас доставки залежить від швидкості подачі авто службою таксі та швидкістю доставки водієм.\n\nВсі замовлення клієнт отримує біля під'їзду свого будинку. Доставка до дверей відсутня!",
                    style: AppTextStyles.subtitle,
                  )
                ],
              ),
              ExpansionTileWidget(
                title: 'Як оформити замовлення?',
                content: [
                  Text(
                    "Замовлення можна зробити онлайн у застосунку Traktor Family Gastro Bar або за телефоном 073-133-61-87 / 093-676-76-46.\n\nОплата замовлень здійснюється онлайн у застосунку Traktor Family Gastro Bar або картковим переказом на рахунок ресторану.\n\nПрийняття замовлень здійснюється з понеділка по неділю з 11:00 до 20:45год. ",
                    style: AppTextStyles.subtitle,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "У разі виникнення будь яких питань будь ласка просимо звертатися за телефоном 073-133-61-87.",
                  style: AppTextStyles.titleSmall
                      .copyWith(color: AppColors.subtitleColor),
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

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
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
        style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: subtitle != null
          ? Text(subtitle!, style: AppTextStyles.subtitle)
          : null,
      children: content,
    );
  }
}
