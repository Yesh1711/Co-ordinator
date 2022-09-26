import 'package:coordinator_app/attendance.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetApi{
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "can-cer-vive-363012",
  "private_key_id": "d583a58538610e9c1ed62b91fa91637755de0980",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDWVMa5tYX97eW/\ncOUBl9bIR53wJI5+qNwzAYgu7P6nkJyUHozMblAI5dD9fDptNHR62Se4Iyiq7eFe\nwoX/eigjzPTj7t5IeqaAV+H9TVhVTPnojPaSr3L7cYJHnDnEyEnxzF2yPdekSSpH\nMnWPWjzPY4nWJJ5x+HSm4MfIW4X1NWdCNPIveL6Z7ZsxFYvS4g83ooCyGeuKrtle\neS+L9LyqVRwAqW36tz8yWDGgJvj1mqaO7VNVdJecaNs0Bq12LWL58Di0BL5Q/PdH\nfkrSzV+R6DM2/USoDO4A/JPVviPJ1xsSUjlceoNkZ9mgYeB3IPhn3DorDkwVwIWs\nNs5kn9JRAgMBAAECggEACzXGahaqMjCT7GondCigqXuDcXi8AjhrQfixyoCHRjTc\nV6vsYdHgOkLo5iUt+iG8+OLsPqeKHDySZc4nS4g0WsEAyv4mnqRZmoteLM0zkkyT\nIpxi1iO6kBetAHlVlSsDoRO3D9hHs9ZG0Y/8UZne5dr3Ld3e8qeT1Fmb4WkWDc/b\nfBOgWeuIwYq1dT+azPLZ2eXU+NH/lxIv7nfDVD5SnubvnXojl9Vftlc9iWEyVhQD\nIVZMPGanX+6iBUaYUOJj+/vLF7R0sM1m8fz0A0cbrVnOHNAlx7YX4z5aUKr9xvy6\n/BlfOuhkMPkOHePNfQwKGcDHn1UMi1bVUjkG4EufMQKBgQDtheqvbZz7scZk5o0t\n8kjkBRERJS8rpjhfwE9+J44pUJXvxhmdx++lFBks87lHBGVcuwpP1XcsGoy+32h0\nadVq8KcSEMXxggOpnRl2BosOp4Ikdnlc7hEg3CqLYv9s/wT5gsMLYu96Zd+ftfQc\n/idDtLhY6/XwScVZGfVvcyoXmQKBgQDnAQKf/1nfK1Wlr7T36Qa+9gXJDGymwYIk\n84gNqht9i2hjVXKpkd/QqMCRWgPs9bgew73aRyUAN2ra5R/BoRAAX30Df6xVLpAq\nlznn/kUev9Rs66BMCdSyU1mBpBt1KjFDPNHK1CxPHVI0NNuiNjlYQXqsMYIoklCt\nCxGoof7jeQKBgQCQlDdqWTp5KpksyfmdwiEESuE8onm4BBHElvbMP5+VHmxl6xuk\noxMIVNeOOTzKMa7RZzi7p6BGxFJvzOV0FwfFdH79zB/xBcbc87eP1CPI48WgFE2D\nd5YNfnaXKcd4vTJ1/lZjE/HZezFHsiXJkBquZ87esaKehQkPV3HCSUOR4QKBgG4R\niimoZy8yG8YtuaHik8dLvKf2VpMCYzuuGmbAZgbk9SFXpqHrkuR+c/sOFA7Faiym\nggDOo2+9+BlC0WXWk6RJ22xeWkPgQus4UWwcON0U9GfNwfxZNtKdammeQ0MJjp2G\nDkSB4nbz9qZPhVN+WMaXtJb1pBom1XAOdSSPw76pAoGAHKXfciHmWsSWfUdl8gwE\nSA5nxNJNhMiPcQjT21TNrXEbxyr3HdUsKsbH73tqT0pPp1iY30CqMiTcs/LCZKda\nqXYZUkuWM3476JjNtQh1xrrYO1MZ72FvNeMEGH1dVInHEHSK+tMSdhbtW6+q5Z9Q\no1C0FrabkmVbRu2EQam6Q4M=\n-----END PRIVATE KEY-----\n",
  "client_email": "cancervive@can-cer-vive-363012.iam.gserviceaccount.com",
  "client_id": "100304568428090568101",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/cancervive%40can-cer-vive-363012.iam.gserviceaccount.com"
}  
  ''';
  static final _spreadsheetId = '1lAeqcwhrBwmdf-Qbs3GXwbFVbV8V4BrarD-xNTcNrsI';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try{
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    _userSheet = await _getWorkSheet(spreadsheet, title: 'Sheet1');

    final firstRow = UserFields.getFields();
    _userSheet!.values.insertRow(1, firstRow);
    }
    catch(e){
      print('Init Error: $e');
    }
  }
  static Future<Worksheet?> _getWorkSheet(
      Spreadsheet spreadsheet, {
        required String title,
      }) async{
    try {
      return await spreadsheet.addWorksheet(title);
    }
    catch(e){
      return spreadsheet.worksheetByTitle(title);
    }
  }
  static Future insert (Map<String, dynamic> rowList) async{
    if(_userSheet == null) return;
    _userSheet!.values.map.appendRow(rowList) ;
  }
}