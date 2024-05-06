import 'package:crafty_bay/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _fristNameEditingController =
      TextEditingController();
  final TextEditingController _lastNameEditingController =
      TextEditingController();
  final TextEditingController _mobileEditingController =
      TextEditingController();
  final TextEditingController _cityEditingController = TextEditingController();
  final TextEditingController _addressEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const AppLogo(),
              const SizedBox(height: 16),
              Text(
                "Complete Profile",
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                "Get started with us with your details",
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: 16),
              buildCompleteProfileForm(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Complete",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCompleteProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Email"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(hintText: "Frist Name"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(hintText: "Last Name"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(hintText: "Mobile"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(hintText: "City"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(hintText: "Shipping Address"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fristNameEditingController.dispose();
    _lastNameEditingController.dispose();
    _mobileEditingController.dispose();
    _cityEditingController.dispose();
    _addressEditingController.dispose();

    super.dispose();
  }
}
