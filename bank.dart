import 'dart:io';

void account() {
  String? username;
  int opening_bal;

  print("Enter Username : ");
  username = stdin.readLineSync();
  print("Enter $username's opening balance :");
  opening_bal = int.parse(stdin.readLineSync() ?? "0");
  choice(username, opening_bal: opening_bal);
}

void choice(username, {opening_bal = 5000}) {
  int opt;
  int dep, wd, bal = opening_bal;
  print("----------------------------------------");
  print("Choices :\n 1) Deposit\n 2) Withdrawl\n 3) Details");
  opt = int.parse(stdin.readLineSync() ?? "-1");

  switch (opt) {
    case 1:
      print("Enter amount : ");
      dep = int.parse(stdin.readLineSync() ?? "0");
      bal += dep;
      choice(username, opening_bal: bal);
      break;

    case 2:
      print("Enter amount : ");
      wd = int.parse(stdin.readLineSync() ?? "0");
      if (bal >= wd) {
        bal -= wd;
      } else
        print("Insufficient funds");
      choice(username, opening_bal: bal);
      break;

    case 3:
      print("Account holder's name : $username");
      print("Account Balance : ₹ $bal");
      choice(username, opening_bal: bal);
      break;

    default:
      print("Exiting..Good Bye :)");
      exit(0);
  }
}

void main() {
  int attempts, password;
  print("------------------System Login------------------");
  for (attempts = 1; attempts <= 3; attempts++) {
    print("Enter password :");
    password = int.parse(stdin.readLineSync()!);

    if (password == 123)
      account();
    else
      print("Password Incorrect.. Try again");
    if (attempts == 3) {
      print("Maximum Limit Exceeded");
      break;
    }
  }
}
