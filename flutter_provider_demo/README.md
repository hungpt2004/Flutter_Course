# flutter_provider_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

ChangeNotifierProvider
Không giống như Provider, ChangeNotifierProvider lắng nghe các thay đổi trong data model. 
Khi có thay đổi, nó sẽ xây dựng lại bất kỳ widget nào trong Consumer. Trong hàm build thay đổi Provider thành ChangeNotifierProvider. 
Lớp mô hình cần sử dụng extend ChangeNotifier (hoặc with ChangeNotifier). 
Điều này cung cấp cho bạn quyền truy cập vào notifyListeners() và bất kỳ lúc nào bạn gọi notifyListeners() thì 
ChangeNotifierProvider sẽ được thông báo và tất cả các widget bên trong Consumers sẽ được rebuild lại.

