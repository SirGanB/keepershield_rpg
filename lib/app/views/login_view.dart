import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/repository/tables_repository.dart';
import 'package:keepershield_rpg/services/auth.service.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, collWelcomeMsg});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  late TablesRepository tables;

  bool isLogin = true;
  bool isLoading = false;
  late String title;
  late String actionButton;
  late String toggleButton;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool action) {
    setState(() {
      isLogin = action;

      if (isLogin) {
        title = 'Bem-vindo';
        actionButton = 'Entrar';
        toggleButton = 'Novo por aqui?';
      } else {
        title = 'Registre-se';
        actionButton = 'Registrar';
        toggleButton = 'Voltar';
      }
    });
  }

  void login() async {
    setState(() => isLoading = true);

    try {
      await context.read<AuthService>().login(
            email: email.text,
            password: password.text,
          );
    } on AuthException catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Center(child: Text(e.message))),
      );
    }
  }

  void register() async {
    setState(() => isLoading = true);

    try {
      await context.read<AuthService>().register(
            email: email.text,
            password: password.text,
          );
    } on AuthException catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Center(child: Text(e.message))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    tables = Provider.of<TablesRepository>(context);
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CustomDividerWdgt(title: title),
              const SizedBox(height: 20),
              _buildEmailTFF(),
              _buildPasswordTFF(),
              _buildBtnLabel(),
              _buildActionBtn(),
              const SizedBox(height: 60),
              const CustomDividerWdgt(title: 'Ou'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLoginExample(icon: Icons.facebook, title: 'Facebook'),
                  _buildLoginExample(
                      icon: Icons.camera_alt, title: 'Instagram'),
                  _buildLoginExample(icon: Icons.telegram, title: 'Telegram'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) => AppBar(
        title: Text(
          'KeeperShield RPG',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
      );

  Widget _buildLoginExample({required IconData icon, required String title}) {
    return Column(children: [
      Icon(icon, size: 50),
      Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      )
    ]);
  }

  Widget _buildEmailTFF() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: email,
        decoration: const InputDecoration(
          hintText: 'email@exemplo.com',
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(),
          labelText: 'E-Mail',
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return 'E-Mail incorreto!';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordTFF() {
    return TextFormField(
      controller: password,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        labelText: 'Senha',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Senha incorreto!';
        }
        return null;
      },
    );
  }

  Widget _buildBtnLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildForgotPasswordBtn(),
        _buildToggleBtn(),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Recuperar Senha'.toUpperCase(),
        style: const TextStyle(fontSize: 10),
      ),
    );
  }

  Widget _buildToggleBtn() {
    return TextButton(
      onPressed: () => setFormAction(!isLogin),
      child: Text(
        toggleButton.toUpperCase(),
        style: const TextStyle(fontSize: 10),
      ),
    );
  }

  Widget _buildActionBtn() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (isLogin) {
                login();
              } else {
                register();
              }
            }
          },
          child: SizedBox(
            height: 40,
            child: isLoading
                ? Center(
                    child: SizedBox(
                      height: 12,
                      width: 12,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      actionButton.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
