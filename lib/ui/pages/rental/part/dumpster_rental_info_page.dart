import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/core/models/rental.dart';
import 'package:dumpin/ui/pages/rental/add_edit/add_edit_page.dart';
import 'package:dumpin/ui/pages/rental/part/dumpster_rental_info_controller.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_app_bar.dart';
import 'package:dumpin/ui/shared/lc_button.dart';
import 'package:dumpin/ui/shared/lc_fetch.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';

class DumpsterRentalInfoPage extends StatelessWidget {
  static const routeName = '/rental/dumpster/info';
  const DumpsterRentalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ControllerScope(
      create: (_) => DumpsterRentalInfoController(
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
        return Scaffold(
          appBar: const LCAppBar(),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
            ),
            child: Observer(
              builder: (_) {
                return LCFetch(
                  future: controller.dumpsterLoading,
                  onReload: () => controller.fetch(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const RentalInfoCard(),
                      const SizedBox(height: 16),
                      Text(
                        'Rental history',
                        style: theme.textTheme.titleMedium,
                      ),
                      Expanded(
                        flex: 2,
                        child: FutureBuilder(
                          future: controller.rentalHistory(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(
                                child: Text(
                                  'No rental history',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      color: theme.colorScheme.tertiary),
                                ),
                              );
                            }
                            final rentalHistory = snapshot.data;
                            return ListView.builder(
                              itemBuilder: (_, index) {
                                final rental = rentalHistory[index];
                                return RentalHistoryCard(rental: rental);
                              },
                              itemCount: rentalHistory!.length,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class RentalInfoCard extends StatelessWidget {
  const RentalInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = ControllerScope.of<DumpsterRentalInfoController>(
      context,
    );
    return Expanded(
      child: Card(
        elevation: 15,
        color: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: theme.colorScheme.tertiary,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Observer(
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Dumpster ${controller.dumpster.code ?? ''}',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Size: ${controller.dumpster.size ?? ''}Y',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.dumpster.isRented ? 'Rented' : 'Available',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: controller.dumpster.isRented
                          ? theme.colorScheme.error
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  controller.dumpster.isRented
                      ? Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: LCButton(
                                  isOutlined: true,
                                  onPressed: () {
                                    controller.rentalStore
                                        .setRental(controller.rental!);
                                    Navigator.of(context).pushNamed(
                                      AddEditRentalPage.routeName,
                                    );
                                  },
                                  child: Text(
                                    'Edit rental',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Observer(
                                  builder: (_) {
                                    return LCFutureButton(
                                      futureBuilder: (_) =>
                                          controller.retrieveOrCancel(),
                                      confirmText:
                                          'Are you sure you want to ${controller.isBeforeRentalDate ? 'cancel this rental' : 'retrieve this dumpster'}?',
                                      onOk: (_, __) {
                                        controller.fetch();
                                      },
                                      child: Text(
                                        controller.isBeforeRentalDate
                                            ? 'Cancel'
                                            : 'Retrive',
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      : LCButton(
                          onPressed: () async {
                            await Navigator.of(context).pushNamed(
                              AddEditRentalPage.routeName,
                            );
                            controller.fetch();
                          },
                          child: const Text('Rent'),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class RentalHistoryCard extends StatelessWidget {
  final Rental rental;
  const RentalHistoryCard({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 15,
      color: theme.colorScheme.tertiary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Client: ${rental.client}',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Price: '),
                  TextSpan(
                    text: '\$${rental.price}'.replaceAll('.', ','),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Rental date: ${rental.rentalDate}',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(width: 10),
            Text(
              'Ritrieval date: ${rental.retrievalDate}',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
