import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:flutter/material.dart';

class LeaveHistory extends StatelessWidget {
  const LeaveHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave History"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: CommonWidget.commonBackground(),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          // child: ListView.builder(
          // itemCount: _customerController.customers.length,
          // itemBuilder: (BuildContext context, index) {
          // return Slidable(
          //   key: Key(
          //       _customerController.customers[index].id.toString()),
          // endActionPane: ActionPane(
          //   motion: const ScrollMotion(),
          //   children: [
          // SlidableAction(
          //   flex: 1,
          //   onPressed: (context) {
          //     Get.to(() => Add(
          //         cus: _customerController.customers[index]));
          //   },
          //   backgroundColor: const Color(0xFF7BC043),
          //   foregroundColor: Colors.white,
          //   icon: Icons.edit_document,
          //   label: 'Edit',
          // ),
          // SlidableAction(
          // flex: 1,
          // onPressed: (context) {
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return Dialog(
          //         child: Container(
          //           padding: const EdgeInsets.all(16),
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: <Widget>[
          //               const Text("Delete Customer?",
          //                   style: TextStyle(
          //                       fontSize: 20,
          //                       fontWeight:
          //                           FontWeight.bold)),
          //               const SizedBox(height: 8),
          //               const Divider(
          //                   color: Colors.black,
          //                   thickness: 1),
          //               const SizedBox(height: 8),
          //               Text(
          //                 "Hello ${_customerController.customers[index].name!},",
          //               ),
          //               const SizedBox(height: 8),
          //               const Text(
          //                   "Are you sure to delete this account?"),
          //               const SizedBox(height: 16),
          //               Row(
          //                 mainAxisAlignment:
          //                     MainAxisAlignment.center,
          //                 children: [
          //                   ElevatedButton(
          //                     style: ButtonStyle(
          //                       backgroundColor:
          //                           MaterialStateProperty
          //                               .all<Color>(Colors
          //                                   .blueGrey),
          //                     ),
          //                     child: const Text("Close"),
          //                     onPressed: () {
          //                       Navigator.of(context).pop();
          //                     },
          //                   ),
          //                   const SizedBox(width: 20),
          //                   ElevatedButton(
          //                     style: ButtonStyle(
          //                       backgroundColor:
          //                           MaterialStateProperty
          //                               .all<Color>(
          //                                   Colors.red),
          //                     ),
          //                     child: const Text("Delete"),
          //                     onPressed: () {
          //                       _customerController
          //                           .deleteCustomers(
          //                               _customerController
          //                                   .customers[
          //                                       index]
          //                                   .id!,index);
          //                       Get.back();
          //                       ScaffoldMessenger.of(
          //                               context)
          //                           .showSnackBar(
          //                               const SnackBar(
          //                         content: Text(
          //                             "Delete Successful!"),
          //                       ));
          //                     },
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   );
          // },
          //   backgroundColor: const Color(0xFFFE4A49),
          //   foregroundColor: Colors.white,
          //   icon: Icons.delete,
          //   label: 'Delete',
          // )
          //   ],
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidget.commonLeftLeave("Annual Leave"),
                  CommonWidget.commonLeftLeave("Sick Leave"),
                  CommonWidget.commonLeftLeave("Casual Leave")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidget.commonLeftLeave("(10.0)"),
                  CommonWidget.commonLeftLeave("(30.0)"),
                  CommonWidget.commonLeftLeave("(6.0)")
                ],
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0XFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 3,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonWidget.commonLeftLeave("1.0 D"),
                          CommonWidget.profileTitle("TBD")
                        ],
                      ),
                      title: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_month,
                                      color: CommonWidget.primaryColor),
                                  const SizedBox(width: 8),
                                  const Text("05/04/2022"),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.message,
                                      color: CommonWidget.primaryColor),
                                  const SizedBox(width: 8),
                                  const Text("Event Name"),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CommonWidget.primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text("Request",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: CommonWidget.primaryColor)),
                              )),
                        ],
                      )),
                ),
              ),
            ],
          ),
          // );
          //   },
          // )
        ),
      ),
    );
  }
}
