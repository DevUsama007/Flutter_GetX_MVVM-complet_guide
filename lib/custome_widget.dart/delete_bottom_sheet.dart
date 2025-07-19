import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountSheet extends StatelessWidget {
  const DeleteAccountSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: const Color(0xffFAFAFA),
      ),
      child: Column(
        children: [
         
          Container(
            height: 6,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.zero,
          ),
         
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Delete",
                   
                  ),
                  Text(
                    "Are you Sure You Want To Delete\nyour Account?",
                    textAlign: TextAlign.center,
                 
                  ),
                
                  Row(
                    children: [
                      Expanded(
                        child:ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                        }, child: Text("dkfasj")),
                      ),
                    
                     
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
