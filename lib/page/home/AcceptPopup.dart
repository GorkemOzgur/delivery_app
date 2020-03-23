import 'package:delivery_app/color/DeliveryColor.dart';
import 'package:delivery_app/httpRequest/OrderRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcceptPopup{
  final _getTimeController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  OrderRequest orderRequest;
  AlertDialog _alertDialog;
  BuildContext context;
  int orderId;
  int expectedArrivalTime;

  AcceptPopup(BuildContext context, OrderRequest orderRequest){
    this.context = context;
    this.orderRequest = orderRequest;
    this._alertDialog = new AlertDialog(
      actions: <Widget>[
        MaterialButton(
          minWidth: 400.0,
          height: 50,
          color: DeliveryColor.activeButtonColor,
          child: Text(
            'Tamam',

          ),
          onPressed: () {
            this.orderRequest.accept(this.orderId, _getTimeController.text);
            Navigator.of(context).pop();
          },
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          minWidth: 400.0,
          height: 50,
          color: Colors.red,
          child: Text(
            'Çık',

          ),
          onPressed: () {
            Navigator.of(context).pop();
            _getTimeController.clear();
          },
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
        ),
      ],

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.85),
//          side: BorderSide(color, width: 1)
         ),
      title: Column(
        children: <Widget>[
          Text(
            'Tahmini teslim alma sürenizi giriniz',
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Örn. 10',
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10))),
                    keyboardType: TextInputType.number,
                    controller: _getTimeController,
                    textInputAction: TextInputAction.done,

                    autocorrect: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }

  Function getPopUp(orderId) {
    this.orderId = orderId;
    showDialog(
      context: context,

      barrierDismissible: true,
      builder: (BuildContext context) {
        return _alertDialog;
      },
    );
  }

}

