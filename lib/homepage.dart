import 'package:flutter/material.dart';
import 'package:loadingpage/secondpage.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ValueNotifier<bool> isloading = ValueNotifier(false);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isloading.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isloading,
      builder: (context, bool value, __) {
        return Stack( 
          children: [

            Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextFormField(
                      decoration: _inputdecoration(),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    color: Colors.blueAccent,
                    child: MaterialButton(
                        child: Text('Continuar'),
                        onPressed: (() async {
                          FocusScope.of(context).unfocus();

                          isloading.value = true;

                          await Future.delayed(Duration(seconds: 3));

                          isloading.value = false;

                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) =>  SecondPage(),)
                          );



                        })),
                  ),
                ],
              ),
            ),

            if(value)
            Positioned.fill(child: 
            LoadingCustom()
            ),

          ],
        );
      }, );
  }

  InputDecoration _inputdecoration() {
    return const InputDecoration(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.blueAccent,
        style: BorderStyle.solid,
      )),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 2,
      )),
      hintText: 'Ejem. Juan',
      labelText: 'Nombre',
      helperText: 'ingrese solo su nombre',
      labelStyle: TextStyle(color: Colors.grey),
      prefixIcon: Icon(Icons.person),
      suffixIcon: Icon(Icons.person_pin_circle),
    );
  }
}

class LoadingCustom extends StatelessWidget {
  const LoadingCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.black.withOpacity(0.7),
      child: Center(child:  
      Lottie.asset('assets/loading.json')
      ,));
  }
}


