import 'package:bank_off_time/features/home/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../view_models/order_view_model.dart';

class OrderView extends ConsumerStatefulWidget {
  final int providerId;
  final int requesterId;
  final int skillId;

  const OrderView({required this.requesterId, required this.skillId, required this.providerId, super.key});

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

  final textEditingControllers = (
    dateController: TextEditingController(),
    priceController: TextEditingController(),
  );

  final focusNodes = (
    dateFocusNode: FocusNode(),
    priceFocusNode: FocusNode(),
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        key: _formKey,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            CustomTextFormField(
              hintText: "Date",
              inputController: textEditingControllers.dateController,
              readOnly: true,
              onTap: () async {
                final result =
                    await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(3000));

                if (result != null) {
                  textEditingControllers.dateController.text = DateFormat('yyyy-MM-dd').format(result);
                }
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "Price",
              inputController: textEditingControllers.priceController,
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            CustomButton(
              buttonChild: false
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
                  : const Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    ),
              onTap: () {
                if (_formKey.currentState!.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
