// import 'package:expense_manager/ui/auth/datasource/auth_data_source.dart';
// import 'package:expense_manager/ui/auth/models/rest/req/req_login.dart';
// import 'package:expense_manager/ui/auth/models/rest/res/res_login.dart';

// class MockDataSource implements AuthDataSource {
//   @override
//   Stream<ResLogin> login(ReqLogin reqLogin) {
//     return Stream.fromFuture(
//       Future.delayed(const Duration(seconds: 2), () {
//         return {
//           'token': 'akgbakegblkajbeglkae',
//           'id': 'abc123',
//           'role': 'admin',
//         };
//       }),
//     ).map(
//       (response) => ResLogin.fromJson(response),
//     );
//   }
// }
