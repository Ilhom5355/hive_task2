class User {
  var email;
  var password;
  var phone;
  var address;

  User({this.email, this.password, this.address, this.phone});

  // #Stringga o`tkazib olish
  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        phone = json['phone'],
        address = json['address'];


  // Json ni Map ga o`tkazish
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'phone': phone,
    'address': address,

  };
}
