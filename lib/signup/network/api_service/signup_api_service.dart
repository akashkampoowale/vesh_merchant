import 'dart:io';
import "package:async/async.dart";

import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:vesh_merchant/common/url/url.dart';

class SignupApiService {
  var httpResponse;
  signup({filepath, email, mobile, password,display_name}) async {
    var url =
        Uri.parse("$serviceApiUrl/seller_signup.php");
    //var request = http.MultipartRequest("POST", url);

    var request = http.MultipartRequest('POST', url);
    request.files.add(http.MultipartFile(
        'image',
      http.ByteStream(DelegatingStream.typed(File(filepath).openRead())),
      await File(filepath).length(),
      filename: basename(File(filepath).path),
    )
    );

    request.fields['email'] = email;
    request.fields['mobile'] = mobile;
    request.fields['password'] = password;
    request.fields['display_name'] = display_name;
    //var res = await request.send();

    await request.send().then((response) async{
      httpResponse = await http.Response.fromStream(response);
    });

    return httpResponse.body;
  }
}
