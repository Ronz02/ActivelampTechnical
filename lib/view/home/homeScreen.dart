import 'package:activelamp/provider/shortlinkprovider.dart';
import 'package:activelamp/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final shortD = ref.watch(shortLinker);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            ),
            color: Colors.white
          ),
          child: Form(
            key: _formKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'The URL must not be empty';
                        }
                        if (!RegExp(r'^https?://').hasMatch(value)) {
                          return 'The URL must start with "http" or "https"';
                        }
                        return null;
                      },
                      controller: shortD.inputLonglinkDick,
                      decoration: InputDecoration(hintText: "Paste long url link"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (!RegExp(r"^.{5,}$").hasMatch(value!)) {
                          return 'The Alias must be at least 5 characters';
                        }
                        return null;
                      },
                      controller: shortD.aliasnameunique,
                      decoration:
                          InputDecoration(hintText: "Put an alias for the link"),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Text(shortD.currentgeneratdLink),
                    SizedBox(
                      height: 55,
                    ),
                    SizedBox(
                      width: 290,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            shortD.generateShortDickLink();
                          }
                          //
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: Center(
                          child: Text("Generate Short Link"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    SizedBox(
                      width: 290,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          shortD.launchInBrowser();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: Center(
                          child: Text("Go to the link"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
