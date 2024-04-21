import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/home/features/requests/data/models/request_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_models/confirm_request_view_model.dart';

class ConfirmRequestModal extends ConsumerStatefulWidget {
  final RequestModel request;

  const ConfirmRequestModal({required this.request, super.key});

  @override
  ConsumerState<ConfirmRequestModal> createState() => _ConfirmRequestModalState();
}

class _ConfirmRequestModalState extends ConsumerState<ConfirmRequestModal> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(confirmRequestViewModel(widget.request));
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Are you sure you want to approve this request?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    viewModel.acceptRequest(context);
                  },
                  borderRadius: 10,
                  buttonChild: viewModel.isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          "Accept",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  borderRadius: 10,
                  backgroundColor: Colors.grey.withOpacity(.05),
                  buttonChild: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
