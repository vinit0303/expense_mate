import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/ui/dashboard/data_source/dashboard_data_source.dart';
import 'package:expense_manager/ui/dashboard/model/dashboard_model.dart';

import 'package:expense_manager/utils/global_var.dart';

class RemoteDataSource implements DashboardDatasource {
  @override
  Stream<DashboardData> getuserDetail() {
    return Stream.fromFuture(
      FirebaseFirestore.instance.collection('User').doc(UserId.id).get(),
    ).map(
      (response) {
        return DashboardData(userName: response.data()!['userName']);
      },
    );
  }
}
