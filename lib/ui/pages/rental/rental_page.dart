import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/ui/pages/dumpsters/add_edit/add_edit_page.dart';
import 'package:loccon/ui/pages/rental/part/dumpster_rental_info_page.dart';
import 'package:loccon/ui/pages/rental/rental_controller.dart';
import 'package:loccon/ui/shared/controller_provider.dart';
import 'package:loccon/ui/shared/lc_button.dart';
import 'package:loccon/ui/shared/lc_fetch.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class RentalPage extends StatelessWidget {
  const RentalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ControllerScope(
      create: (_) => RentalController(
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rental dumpsters', style: theme.textTheme.titleLarge),
              const SizedBox(height: 16),
              Observer(
                builder: (_) {
                  return LCFetch(
                    future: controller.dumpstersLoading,
                    onReload: () => controller.fetch(),
                    child: controller.dumpsters != null &&
                            controller.dumpsters!.isNotEmpty
                        ? Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Dumpsters available',
                                    style: theme.textTheme.titleSmall),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final sizeHeader =
                                          controller.sizeHeaders![index];
                                      final itemCount =
                                          controller.sizeHeaders!.length;
                                      final dumpsters = controller.dumpsters!;
                                      final screenWidth =
                                          MediaQuery.of(context).size.width;
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: (screenWidth /
                                                    (2 * itemCount)) /
                                                itemCount),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '$sizeHeader: ',
                                                style: theme
                                                    .textTheme.bodyLarge!
                                                    .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${dumpsters.where((dumpster) => sizeHeader.contains('${dumpster.size}Y') && !dumpster.isRented).length}',
                                              ),
                                            ],
                                          ),
                                          style: theme.textTheme.bodyLarge,
                                        ),
                                      );
                                    },
                                    itemCount: controller.sizeHeaders!.length,
                                  ),
                                ),
                                Expanded(
                                  flex: 19,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      final sizeHeader =
                                          controller.sizeHeaders![index];
                                      final dumpsters = controller.dumpsters!;
                                      return StickyHeader(
                                        header: RentalSizeHeader(
                                          sizeHeader: sizeHeader,
                                        ),
                                        content: Column(
                                          children: dumpsters
                                              .where((dumpster) =>
                                                  sizeHeader.contains(
                                                      '${dumpster.size}Y'))
                                              .map(
                                                (dumpster) => RentalCard(
                                                  dumpster: dumpster,
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      );
                                    },
                                    itemCount: controller.sizeHeaders!.length,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text.rich(
                                style: theme.textTheme.bodyMedium,
                                const TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'It appears that you don\'t have any dumpsters yet.',
                                    ),
                                    TextSpan(
                                      text:
                                          '\nClick on the button below to add one.',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              LCButton(
                                onPressed: () async {
                                  await Navigator.of(context).pushNamed(
                                    AddEditDumpsterPage.routeName,
                                  );
                                  controller.fetch();
                                },
                                isIconButton: true,
                                backgroundColor: theme.colorScheme.primary,
                                foregroundColor: theme.colorScheme.onPrimary,
                                child: const Icon(Icons.add_home_outlined),
                              ),
                            ],
                          ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class RentalSizeHeader extends StatelessWidget {
  final String sizeHeader;
  const RentalSizeHeader({super.key, required this.sizeHeader});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const SizedBox(height: 3),
        Container(
          height: 75.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.tertiary,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            sizeHeader,
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class RentalCard extends StatelessWidget {
  final Dumpster dumpster;
  const RentalCard({
    super.key,
    required this.dumpster,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = ControllerScope.of<RentalController>(context);
    return Column(
      children: [
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.surface,
          child: ListTile(
            onTap: () async {
              controller.rentalStore.setDumpster(dumpster);
              await Navigator.of(context).pushNamed(
                DumpsterRentalInfoPage.routeName,
              );
              controller.fetch();
            },
            title: Text(
              dumpster.code!,
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              dumpster.isRented ? 'Rented' : 'Available',
              style: theme.textTheme.bodySmall!.copyWith(
                color:
                    dumpster.isRented ? theme.colorScheme.error : Colors.green,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
