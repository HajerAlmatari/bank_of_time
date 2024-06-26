import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/core/utils/cherry_toast_util.dart';
import 'package:bank_off_time/features/home/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../view_models/order_view_model.dart';

class OrderView extends ConsumerStatefulWidget {
  final int providerId;
  final int requesterId;
  final double providerBalance;
  final int skillId;

  const OrderView({required this.providerBalance , required this.requesterId, required this.skillId, required this.providerId, super.key});

  @override
  ConsumerState<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends ConsumerState<OrderView> {
  late OrderModel orderModel;

  @override
  void initState() {
    super.initState();
    orderModel = OrderModel(
      providerId: widget.providerId,
      requesterId: widget.requesterId,
      date: "",
      price: 0.0,
      skillId: widget.skillId,
    );
  }

  @override
  Widget build(BuildContext context) {

    print("providerBalance  ${widget.providerBalance}");
    final viewModel = ref.watch(orderViewModel(orderModel));
    return Container(
      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Form(
        key: viewModel.formKey,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            CustomTextFormField(
              hintText: AppLocalizations.of(context)!.date,
              inputController: viewModel.textEditingControllers.dateController,
              readOnly: true,
              onTap: () async {
                final result =
                    await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(3000));

                if (result != null) {
                  viewModel.textEditingControllers.dateController.text = DateFormat('yyyy-MM-dd').format(result);
                }
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: AppLocalizations.of(context)!.price,
              inputController: viewModel.textEditingControllers.priceController,
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            CustomButton(
              buttonChild: viewModel.isLoading
                  ? const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  :  Text(
                AppLocalizations.of(context)!.send,
                      style: const TextStyle(color: Colors.white),
                    ),
              onTap: () {
                if (viewModel.formKey.currentState!.validate()) {

                  if(double.parse(viewModel.textEditingControllers.priceController.text) > double.parse(ref.watch(sessionProvider).authUser?.balance.toString() ?? "0.0")) {
                    ToastUtil.showError(
                    AppLocalizations.of(context)!.insufficient_balance
                    , context);
                    return;
                  }
                  viewModel.sendOrder(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
