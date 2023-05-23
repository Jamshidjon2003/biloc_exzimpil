import 'package:botton_nav_bar_biloc/bloc/counter.bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: '+998(##)###-##-##',
                  filter: {"#": RegExp(r'[0-9]')},
                  type: MaskAutoCompletionType.lazy,
                )
              ],
              onChanged: (value) =>
                  context.read<CounterBloc>().add(UpdateNameEvent(value)),
            ),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.name,
                // style: Theme.of(context).textTheme.headlineLarge,
              );
            })
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: BlocBuilder<CounterBloc,CounterState>(
          builder: (_,state){
            return ElevatedButton(onPressed: state.name.length>8?(){}:null, child:const Text("Reset"), );
          }
        )
      ),
    );
  }
}
