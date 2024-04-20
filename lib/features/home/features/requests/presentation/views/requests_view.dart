import 'package:bank_off_time/features/home/features/requests/presentation/view_models/requests_view_model.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child:  Text(
                    AppLocalizations.of(context)!.skills,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Builder(
                    builder: (context) {


                      if(viewModel.isLoading){
                        return Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if(viewModel.requestsList.isEmpty){
                        return Center(
                          child: Text(
                              "No Data"
                          ),
                        );
                      }

                      return Column(
                        children: [
                          ...viewModel.requestsList.map((e) {
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
                                  color: e.isPending ? Colors.amber.withOpacity(0.1) : Theme.of(context).primaryColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date : ${e.date}"),
                                    const SizedBox(height: 10,),
                                    Text("Price : ${e.price}"),
                                  ],
                                ),
                              ),
                            );
                          })
                        ],
                      );

                      /*
                      SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: viewModel.skillsList.length,
                        (context, index) {

                          final item = viewModel.skillsList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(ref.watch(mainProvider).isArabic ? item.nameAr : item.nameEn),
                            ),
                          );
                        },
                      ),
                    );


                       */
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
