import 'package:flutter/material.dart';
import 'package:todoapp/shared/widgets/button.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  var isLoading = false;
  var isSuccess = false;
  var hasError = false;
  String? messageError;

  final buttonKey = GlobalKey<ButtonState>();
  final formKey = GlobalKey<FormState>();

  void changeStateButton(bool value) {
    final buttonState = buttonKey.currentState!;
    buttonState.onChange(value);
  }

  bool validateForm() {
    final form = formKey.currentState!;

    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void onSaved(
      {String? name,
      String? email,
      String? password,
      String? confirmPassword}) {
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.confirmPassword = confirmPassword ?? this.confirmPassword;

    if (this.name != null &&
        this.email != null &&
        this.password != null &&
        this.password == this.confirmPassword) {
      changeStateButton(true);
    } else {
      changeStateButton(false);
    }
  }

  Future<void> register() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 5));
    hasError = true;
    isLoading = false;
    messageError = "  Nao foi possivel logar";
    setState(() {});
    // ignore: use_build_context_synchronously
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   changeStateButton(true);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 200),
                      const Text(
                        "Welcome Onboard!",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Text(
                        "Let’s help you meet up your task",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13),
                      ),
                      const SizedBox(
                        height: 68,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            onChanged: (value) => onSaved(name: value),
                            onSaved: (value) => onSaved(name: value),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                (value?.isEmpty ?? false) ? "Nome Vazio" : null,
                            decoration: const InputDecoration(
                              hintText: "Enter your full name",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            onChanged: (value) => onSaved(email: value),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onSaved: (value) => onSaved(email: value),
                            validator: (value) => (value?.isEmpty ?? false)
                                ? "Email Vazio"
                                : null,
                            decoration: const InputDecoration(
                              hintText: "Enter your email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) => onSaved(password: value),
                            onSaved: (value) => onSaved(password: value),
                            validator: (value) => (value?.isEmpty ?? false)
                                ? "Password Vazio"
                                : null,
                            decoration: const InputDecoration(
                              hintText: "Enter password",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) =>
                                onSaved(confirmPassword: value),
                            onSaved: (value) => onSaved(confirmPassword: value),
                            validator: (value) =>
                                (password == null || confirmPassword == null) ||
                                        (password != confirmPassword)
                                    ? "As senha não conferem"
                                    : null,
                            decoration: const InputDecoration(
                              hintText: "Confirm Password",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      if (hasError) Text(messageError!),
                      if (isLoading) const CircularProgressIndicator(),
                      if (!isLoading)
                        Button(
                            key: buttonKey,
                            title: "Create Account",
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              register();
                            })
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
