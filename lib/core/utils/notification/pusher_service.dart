// import 'dart:convert';
//
// import 'package:travego/core/utils/notification/notification_services.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
//
// class WebSocketService {
//   final String cluster = 'eu';
//   final String appKey = '77229f6c89eb56dbf7cf';
//   final String channelName = 'Travego';
//
//   late WebSocketChannel channel;
//
//   void connect() {
//     String webSocketUrl = 'wss://ws-$cluster.pusher.com/app/$appKey?protocol=7';
//     final wsUrl = Uri.parse(webSocketUrl);
//     channel = WebSocketChannel.connect(wsUrl);
//
//     channel.stream.listen(
//       (message) {
//         final decodedMessage = jsonDecode(message);
//         print(decodedMessage);
//         LocalNotificationService.showSchduledNotification(
//             decodedMessage.toString());
//         if (decodedMessage['event'] == 'pusher:connection_established') {
//           channel.sink.add('Payment Done Successfully');
//         }
//         // if (decodedMessage['event'] !=
//         //         'pusher_internal:subscription_succeeded' &&
//         //     decodedMessage['event'] != 'pusher:connection_established' ) {
//         //   LocalNotificationService.showSchduledNotification(
//         //       decodedMessage.toString());
//         // }
//       },
//       onError: (error) {
//         print('Error: $error');
//       },
//       onDone: () {
//         connect(); // Attempt to reconnect
//       },
//     );
//     channel.sink.add(jsonEncode({
//       'event': 'Notification',
//       'data': {
//         'channel': channelName,
//       },
//     }));
//   }
// }
