import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

import '../../model/pengeluaran.dart';

class JelekongKeluarSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "bsi-projects",
  "private_key_id": "3091377038ff9486ec1bfe620c867c37eb0878ce",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCWZF0/IURPUGfZ\n/jNTHBNOT0awwxr+bC8Pc2WuqsXGc/FnUFplQWxqda8tcTOz5TfMpoItiDNnsTzT\n7tCszU7+xVKCB0p89WJkIslCuMst1qj7NYU9lRLxqgTbmW/qD+qH2CoyzATJyAPI\nl4V5uUXZuTRDABKMiYBWeK29wIT+hNB9DoIsS/mV6z+pRrUyWUYVzE0f4l/wrzsE\n+55rSHeF1cU9Ok+0wJgKBDF4QQ9siY1wdmEfpvewNWbQotsaTBo9SnyDUjXrMP7g\nZieYivGdwN6qad+kwQzTKcUt8APchyRFQZ+FIPovNQtkKS8UHPqLAHC/+iHRwzF+\nShnHgFlRAgMBAAECggEACbF62XPmC1Gp++uN4ycIWdqzZPcSVpXiUPXgYX9uzhbQ\n11afGO8m/dP2KvDkraKSHo3t4+GR5KFQbnLc/tege5HReqwzIXY5ywKl+Q0K8CT+\n5mrMRXbwuLmmD1cRVvit0RHToyCyFKULFLhVbqN3LIHALABaxwr2xhFdq2u3oWWU\nmfLDa/7anSHEMIGtms/9p36UY9kxhKOgk1SJPiSBvkmp6M6PRsrr+34j+Hi0FDol\ne39sVKV2MiZlQ7loZ6aroRZIPnG02LZWI/DrgclZ8UxkTKngCsLmMFoXQlL8LW77\nEXZ151791hk/3JxDnjbbY51eCkRuflLH/q2Ou+uHFQKBgQDMoLKcuhVM88Si8uvr\nGH8132U34OkiDWyjFZfQ0+2NGF8NcIfkOWduXLJBk9wqtAN9+02mpzHf5ZuJyjv2\nPLw7RXJiQu1Y6Bs/ZoDyTduXu8VkQHT7Y6dl1St+cASmPjHqX7BxPStppX1kFlQ3\nRv2m4YsZJvr0CJCU7QkwCz3MtQKBgQC8JfjGWF/HLJRg3mHQGKygeSJ4Wr2f77Sj\niySEX/Euq8gB5+48ohPzVbVSOMkzl5YfhPE5iNadoByJppSKtlDXDwp9luKcZFmH\nPPvaL2A7k4d+pyMBJ5BZlu7SBvBCarksb5AJkd4/3MQgGRfObLJNb7869rqeczfV\nqin+nC3XrQKBgGVwJBrdhEGpdgjxM1JPyoACRkL1E5z12qzdv2yeIlyXgEdBSZwx\neLyU5yjrC3F/21tQgKXkrCy5vekIf8EJSqZ3PsTHOLGiHh/HyJRVVE5bnvabnWIh\nfJJWokEDdsqSelwdI3J/SE4O46ICD613W7amiDXnxO/EbyfkeXF/oRshAoGALF6M\nB0JJ++9gYmOvD2LyOrm2Tkmf1Dq0D6k9iFYTy1zJQuHOBdB3AfhhVS19DUSfK3mv\nZVEGw49Bi5iUCQ4rjDvIzospj5X+ouzXu8FWYVZOKqkBkUEiQm5cjX0DZbZDSt5Y\nSlly3v6R5bvlKFHrzmUe5KnQopMrRKDnXFq6WNUCgYBU7/QNpZQN0m2bDWT1BcBl\nDVL5EIwYOoms2eco22LV7ZPUuEsqAmNQgfiAIc7+GmvTDp2c//xLAb0WMmqdkR3G\nbFtMAaYhJP0wLnhvWoR1QGqlVRiSBgZ72ZF0SV/18D+/AE0vphOfeG7MbKPjjUEv\nwONbGVeEIDVrtIgw5LV0HA==\n-----END PRIVATE KEY-----\n",
  "client_email": "bsi-project@bsi-projects.iam.gserviceaccount.com",
  "client_id": "108584539328168636246",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/bsi-project%40bsi-projects.iam.gserviceaccount.com"
}
''';
  static const _spreadsheetId = '10TUHxSSMrHHvHDRxoxgCG9-umEvFpZvq8hgk2wYSPNc';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _pengeluaranSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _pengeluaranSheet =
          await _getWorksheet(spreadsheet, title: 'pengeluaran');

      final firstRow = PengeluaranFields.getFields();
      _pengeluaranSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      debugPrint('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorksheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (error) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<int> getRowCount() async {
    if (_pengeluaranSheet == null) return 0;

    final lastRow = await _pengeluaranSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<String?> getLastNomor() async {
    if (_pengeluaranSheet == null) return null;

    final lastNomor = await _pengeluaranSheet!.cells
        .cell(column: 2, row: _pengeluaranSheet!.rowCount);
    return (lastNomor.value).toString();
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_pengeluaranSheet == null) return;
    _pengeluaranSheet!.values.map.appendRows(rowList);
  }
}
