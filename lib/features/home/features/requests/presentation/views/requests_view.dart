import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/home/features/requests/presentation/view_models/requests_view_model.dart';
import 'package:bank_off_time/features/home/features/requests/presentation/views/modals/confirm_request_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class RequestsView extends ConsumerWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(requestsViewModel);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Requests",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverLayoutBuilder(
                builder: (context, c) {
                  if (viewModel.isLoading) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }

                  if (viewModel.requestsList.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text("No Data"),
                      ),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ...viewModel.requestsList.map(
                          (request) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: request.isPending
                                      ? Colors.amber.withOpacity(0.1)
                                      : Theme.of(context).primaryColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Date : ${DateFormat("yyyy-MM-dd").format(request.date)}"),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text("Price : ${request.price}"),
                                        ],
                                      ),
                                    ),
                                    if (request.isPending)
                                      CustomButton(
                                        onTap: () async{
                                          final result = await showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) {
                                              return ConfirmRequestModal(request: request);
                                            },
                                          );

                                          if(result){
                                            viewModel.refresh();
                                          }
                                        },
                                        buttonChild: const Text(
                                          "Accept",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        borderRadius: 10,
                                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.5),
                                        height: 35,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
