import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Customdropdownsearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController drobdownselectname;
  final TextEditingController drobdoselectedid;

  const Customdropdownsearch(
      {super.key,
      this.title,
      required this.drobdownselectname,
      required this.listdata,
      required this.drobdoselectedid});

  @override
  State<Customdropdownsearch> createState() => _CustomdropdownsearchState();
}

class _CustomdropdownsearchState extends State<Customdropdownsearch> {
  void showdrobdownsearch() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.drobdownselectname.text = selectedListItem.name;
          widget.drobdoselectedid.text = selectedListItem.value!;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.drobdownselectname,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showdrobdownsearch();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
        hintText: widget.drobdownselectname.text == ''
            ? widget.title
            : widget.drobdownselectname.text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

//  TextFormField(
//                         controller: controller.dropdowenname,
//                         cursorColor: Colors.black,
//                         onTap: () {
//                           FocusScope.of(context).unfocus();
//                           controller.showdrobdown(context);
//                         },
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.black12,
//                           contentPadding: const EdgeInsets.only(
//                               left: 8, bottom: 0, top: 0, right: 15),
//                           hintText: 'chose from list',
//                           border: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                               width: 0,
//                               style: BorderStyle.none,
//                             ),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8.0),
//                             ),
//                           ),
//                         ),
//                       ),
