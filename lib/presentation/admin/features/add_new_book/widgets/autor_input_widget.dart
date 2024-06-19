import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AutorInputWidget extends StatelessWidget {
  const AutorInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomAuthorDropdown(),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class CustomAuthorDropdown extends StatelessWidget {
  const CustomAuthorDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildAutorList();
  }

  DropdownSearch<String> _buildAutorList() {
    return DropdownSearch<String>.multiSelection(
      items: const [
        'Brazil',
        'Italia (Disabled)',
        'Tunisia',
        'Canada',
        'Brazil',
        'Italia (Disabled)',
        'Tunisia',
        'Canada',
        'Brazil',
        'Italia (Disabled)',
        'Tunisia',
        'Canada',
      ],
      clearButtonProps: const ClearButtonProps(
        icon: Icon(Icons.close),
      ),
      popupProps: PopupPropsMultiSelection.modalBottomSheet(
        modalBottomSheetProps: const ModalBottomSheetProps(
          padding: EdgeInsets.only(
            left: kDefaultPadding * 2,
            right: kDefaultPadding * 2,
            top: kDefaultPadding,
          ),
        ),
        showSearchBox: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Pesquisar autores',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        containerBuilder: (context, popupWidget) => Container(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding / 2,
          ),
          child: popupWidget,
        ),
        selectionWidget: (context, item, isSelected) {
          return Checkbox(
            value: isSelected,
            onChanged: (value) {},
            shape: const CircleBorder(),
          );
        },
        itemBuilder: (context, item, isSelected) {
          return const ListTile(
            title: Text('Elemento'),
          );
        },
      ),
      onChanged: print,
      selectedItems: const ['Brazil'],
    );
  }
}


// class _TextInputWidget extends StatelessWidget {
//   const _TextInputWidget();

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: (value) {
//         context.read<AutorInputCubit>().changeText(value);
//       },
//       decoration: InputDecoration(
//         prefixIcon: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             FontAwesomeIcons.user,
//             size: 16,
//           ),
//         ),
//         label: const Text('Autor do livro'),
//         border: UnderlineInputBorder(
//           borderRadius: BorderRadius.circular(kDefaultPadding / 2),
//         ),
//       ),
//     );
//   }
// }
