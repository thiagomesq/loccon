import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/core/models/client.dart';
import 'package:dumpin/ui/pages/clients/add_edit/add_edit_page.dart';
import 'package:dumpin/ui/pages/clients/clients_controller.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_button.dart';
import 'package:dumpin/ui/shared/lc_fetch.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ControllerScope(
      create: (_) => ClientsController(
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
              Text('Clients', style: theme.textTheme.titleLarge),
              const SizedBox(height: 16),
              Observer(
                builder: (_) {
                  return LCFetch(
                    future: controller.clientsLoading,
                    onReload: () => controller.fetch(),
                    child: controller.clients != null &&
                            controller.clients!.isNotEmpty
                        ? Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      final client = controller.clients![index];
                                      return ClientCard(client: client);
                                    },
                                    itemCount: controller.clients!.length,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                LCButton(
                                  onPressed: () async {
                                    controller.clientStore.clear();
                                    await Navigator.of(context).pushNamed(
                                      AddEditClientPage.routeName,
                                    );
                                    controller.fetch();
                                  },
                                  isIconButton: true,
                                  backgroundColor: theme.colorScheme.primary,
                                  foregroundColor: theme.colorScheme.onPrimary,
                                  child: const Icon(Icons.person_add_outlined),
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
                                        text: 'Welcome to clients page!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      const TextSpan(
                                        text:
                                            '\n\nYou can add a new client by clicking on the button below.',
                                      ),
                                    ],
                                  ),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 16),
                                LCButton(
                                  onPressed: () async {
                                    await Navigator.of(context).pushNamed(
                                      AddEditClientPage.routeName,
                                    );
                                    controller.fetch();
                                  },
                                  isIconButton: true,
                                  backgroundColor: theme.colorScheme.primary,
                                  foregroundColor: theme.colorScheme.onPrimary,
                                  child: const Icon(Icons.person_add_outlined),
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

class ClientCard extends StatelessWidget {
  final Client client;
  const ClientCard({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = ControllerScope.of<ClientsController>(context);
    return Column(
      children: [
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.surface,
          child: ListTile(
            onTap: () async {
              controller.clientStore.setClient(client);
              await Navigator.of(context).pushNamed(
                AddEditClientPage.routeName,
              );
              controller.fetch();
            },
            title: Text(
              client.name!,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              client.phone!,
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
            trailing: LCFutureButton(
              futureBuilder: (_) => controller.delete(client.id!),
              confirmText: 'Are you sure you want to delete this client?',
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
