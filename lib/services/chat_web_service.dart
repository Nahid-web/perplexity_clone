import 'dart:async';
import 'dart:convert';

import 'package:web_socket_client/web_socket_client.dart';

class ChatWebService {
  static final _instance = ChatWebService._internal();
  WebSocket? _socket;

  factory ChatWebService() => _instance;

  ChatWebService._internal();
  final _searchResultController = StreamController<Map<String, dynamic>>();
  final _contentController = StreamController<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultController.stream;
  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  void connect() {
    _socket = WebSocket(Uri.parse("wss://perplexity-clone-9fxb.onrender.com/ws/chat"));

    _socket!.messages.listen((message) {
      final data = json.decode(message);
      if (data['type'] == 'search_results') {
        _searchResultController.add(data);
      } else {
        _contentController.add(data);
      }
    });
  }

  void chat(String query) {
    print(query);
    print(_socket);
    _socket!.send(json.encode({'query': query}));
  }
}
