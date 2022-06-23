User actualUser = User();

List<User> users = [];

class User {
  String username;
  String password;
  String image;

  User({
    this.username = "Username",
    this.password = "",
    this.image = ""
  });

  set setUsername(String name) { 
    username = name; 
  }
  
  set setPassword(String pw) { 
    password = pw; 
  } 
  
  set setImage(String img) { 
    image = img; 
  } 
  
}

void createUser(String us, String pw, String img) {
  User user = User();
  user.setUsername = us;
  user.setPassword = pw;
  user.image = img;

  users.add(user);
}

String getLoggedIn() {
  if (actualUser.password.isNotEmpty) {
    return "Logout";
  }
  else {
    return "LogIn";
  }
}