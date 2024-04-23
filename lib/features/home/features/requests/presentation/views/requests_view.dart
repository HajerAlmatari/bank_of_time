import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/conversations/features/chat/presentations/view/chat_view.dart';
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    AppLocalizations.of(context)!.requests,
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
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.no_data,
                        ),
                      ),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ...viewModel.requestsList.map(
                          (request) {

                            bool showAccept = request.requester.id != ref.watch(sessionProvider).authUser?.id;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: InkWell(
                                onTap: (){

                                  final user = ref.watch(sessionProvider).authUser?.id == request.requester.id
                                    ? request.provider
                                    : request.requester;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatView(
                                        receiverUserEmail: user.email,
                                        receiverUserID: user.id.toString(),
                                      ),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(10),
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
                                            RowTitleWithValue(
                                              title: AppLocalizations.of(context)!.skill,
                                              value: "${request.skill.category!.nameAr} - ${request.skill.nameAr}",
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            RowTitleWithValue(
                                              title: AppLocalizations.of(context)!.user_name,
                                              value: request.requester.name,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            RowTitleWithValue(
                                              title: AppLocalizations.of(context)!.date,
                                              value: DateFormat("yyyy-MM-dd").format(request.date),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            RowTitleWithValue(
                                              title: AppLocalizations.of(context)!.price,
                                              value: request.price,
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (request.isPending && showAccept)
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
                                          buttonChild: Text(
                                            AppLocalizations.of(context)!.accept,
                                            style: const TextStyle(
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

class RowTitleWithValue extends StatelessWidget {
  const RowTitleWithValue({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("$title : "),
        Text(value),
      ],
    );
  }
}

