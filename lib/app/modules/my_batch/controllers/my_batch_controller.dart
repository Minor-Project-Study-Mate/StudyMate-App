import 'package:get/get.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';

class MyBatchController extends GetxController {
  static const studentsNames = [
    "Alok",
    "Aman",
    "Ankit",
    "Anshul",
    "Anurag",
    "Aryan",
    "Ashish",
    "Ayush",
    "Bhavya",
    "Bhuvan",
    "Chirag",
    "Deepak",
    "Dhruv",
    "Divyansh",
    "Gaurav",
    "Harsh",
    "Himanshu",
    "Kartik",
    "Kunal",
    "Lakshay",
    "Manish",
    "Mohit",
    "Naman",
    "Nikhil",
    "Nishant",
    "Nitin",
    "Prakhar",
    "Pranav",
    "Prashant",
    "Rahul",
    "Rajat",
    "Rajesh",
    "Rishabh",
    "Rohit",
    "Sahil",
    "Saksham",
    "Sarthak",
    "Shivam",
    "Shubham",
    "Siddharth",
    "Sneha",
    "Sourabh",
    "Sudhanshu",
    "Suryansh",
    "Utkarsh",
    "Vansh",
    "Vikas",
    "Vishal",
    "Yash",
    "Yogesh"
  ];

  AuthService get authService => Get.find<AuthService>();

  Future<List<String>> getUser() async => studentsNames;

  bool isMe(String userName) =>
      (authService.displayName ?? "").contains(userName);
}
