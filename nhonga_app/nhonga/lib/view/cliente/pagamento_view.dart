import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagamento_view extends StatelessWidget {
  const Pagamento_view({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'Conta Bancaria',
            child: Row(
              children: [
                Text('Conta Bancaria'),
                Spacer(),
                Icon(CupertinoIcons.creditcard)
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'Carteira Movel',
            child: Row(
              children: [
                Text('Carteira Movel'),
                Spacer(),
                Icon(CupertinoIcons.device_phone_portrait)
              ],
            ),
          ),
        ],
        onSelected: (String result) {
          
          switch (result) {
            case 'Conta Bancaria':
              
              break;
            case 'Carteira Movel':
              
              break;
            default:
              
              break;
          }
        },
      ),
    );
  }
}
