import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/ui/pages/dumpsters/add_edit/add_edit_page.dart';
import 'package:loccon/ui/pages/dumpsters/dumpsters_controller.dart';
import 'package:loccon/ui/shared/controller_provider.dart';
import 'package:loccon/ui/shared/lc_button.dart';
import 'package:loccon/ui/shared/lc_fetch.dart';
import 'package:loccon/ui/shared/lc_future_button.dart';

class DumpstersPage extends StatelessWidget {
  const DumpstersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ControllerScope(
      create: (_) => DumpstersController(
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
              Text('Dumpsters', style: theme.textTheme.titleLarge),
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
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      final dumpster =
                                          controller.dumpsters![index];
                                      return DumpsterCard(dumpster: dumpster);
                                    },
                                    itemCount: controller.dumpsters!.length,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                LCButton(
                                  onPressed: () async {
                                    controller.dumpsterStore.clear();
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
                          )
                        : Expanded(
                            child: ListView(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Welcome to dumpsters page!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      const TextSpan(
                                        text:
                                            '\n\nYou can add a new dumpster by clicking on the button below.',
                                      ),
                                    ],
                                  ),
                                  style: Theme.of(context).textTheme.bodyMedium,
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

class DumpsterCard extends StatelessWidget {
  final Dumpster dumpster;
  const DumpsterCard({super.key, required this.dumpster});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = ControllerScope.of<DumpstersController>(context);
    return Column(
      children: [
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.surface,
          child: ListTile(
            onTap: () async {
              controller.dumpsterStore.setDumpster(dumpster);
              await Navigator.of(context).pushNamed(
                AddEditDumpsterPage.routeName,
              );
              controller.fetch();
            },
            title: Text(
              dumpster.code!,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${dumpster.size} Y',
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
            trailing: LCFutureButton(
              futureBuilder: (_) => controller.delete(dumpster.id!),
              confirmText: 'Are you sure you want to delete this dumpster?',
              isIconButton: true,
              onOk: (_, __) => controller.fetch(),
              child: const Icon(Icons.delete_outline, color: Colors.red),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
