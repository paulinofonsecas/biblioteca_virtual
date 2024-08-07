import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/data/models/author_model.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/add_new_author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/autor_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/dropdown_autor_input_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AutorInputWidget extends StatelessWidget {
  const AutorInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownAutorInputCubit(),
      child: const Row(
        children: [
          Expanded(
            child: CustomAuthorDropdown(),
          ),
        ],
      ),
    );
  }
}

class CustomAuthorDropdown extends StatefulWidget {
  const CustomAuthorDropdown({super.key});

  @override
  State<CustomAuthorDropdown> createState() => _CustomAuthorDropdownState();
}

class _CustomAuthorDropdownState extends State<CustomAuthorDropdown> {
  final selectedItems = <String>[];

  @override
  void initState() {
    if (getIt.isRegistered<BookModel>()) {
      final book = getIt.get<BookModel>();

      setState(() {
        selectedItems.addAll(book.authors.map((e) => e.toJson()));
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildAutorList();
  }

  Widget _buildAutorList() {
    return DropdownSearch<String>.multiSelection(
      clearButtonProps: const ClearButtonProps(
        icon: Icon(Icons.close),
      ),
      asyncItems: (text) {
        return context.read<DropdownAutorInputCubit>().getAuthors(text).then(
              (list) =>
                  list.map((e) => AuthorModel.fromEntity(e).toJson()).toList(),
            );
      },
      itemAsString: (item) => AuthorModel.fromJson(item).name,
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
          final author = AuthorModel.fromJson(item);

          return Checkbox(
            value: isSelected,
            onChanged: (value) {
              if (selectedItems.contains(author.id)) {
                selectedItems.remove(author.id);
              } else {
                selectedItems.add(author.id);
              }
            },
            shape: const CircleBorder(),
          );
        },
        itemBuilder: (context, item, isSelected) {
          final author = AuthorModel.fromJson(item);

          return ListTile(
            title: Text(author.name),
          );
        },
      ),
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: 'Selecionar autores',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      onChanged: (value) {
        context.read<AutorInputCubit>().changeAuthors(
              value.map(AuthorModel.fromJson).toList(),
            );
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Seleciona 1 ou mais autores';
        }
        return null;
      },
      selectedItems: selectedItems,
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
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(kDefaultPadding / 2),
//         ),
//       ),
//     );
//   }
// }
