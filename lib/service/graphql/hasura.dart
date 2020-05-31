import 'package:hasura_connect/hasura_connect.dart';
import 'package:sorucevap/store/user.dart';

class HasuraService {

  HasuraService._private();

  static String serverUrl = "https://ingilizce-soru-cevap.herokuapp.com/v1/graphql";

  static HasuraService _instance = HasuraService._private();

  static HasuraService get instance => _instance;

  HasuraConnect _hasuraConnect;

  HasuraConnect get connection => this._hasuraConnect;

  /*
  initialize function  async
   */
  Future<void> init() async {
    var token = await User().firebaseUser.getIdToken();
    String _userToken = token.token;

    print("Initilize Hasura Service with token : " + _userToken.substring(0, 20).toString());

    _hasuraConnect = HasuraConnect(serverUrl, token: (isError) async {
      return "Bearer " + _userToken.toString();
    });
  }
}
