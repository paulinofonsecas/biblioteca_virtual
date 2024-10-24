import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/add_new_author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/categoria_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/dropdown_category_input_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CategoriesInputWidget extends StatelessWidget {
  const CategoriesInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownCategoryInputCubit(),
      child: const Row(
        children: [
          Expanded(
            child: CustomCategoryDropdown(),
          ),
        ],
      ),
    );
  }
}

class CustomCategoryDropdown extends StatefulWidget {
  const CustomCategoryDropdown({super.key});

  @override
  State<CustomCategoryDropdown> createState() => _CustomCategoryDropdownState();
}

class _CustomCategoryDropdownState extends State<CustomCategoryDropdown> {
  final selectedItems = <String>[];

  @override
  void initState() {
    if (getIt.isRegistered<BookModel>()) {
      final book = getIt.get<BookModel>();

      setState(() {
        selectedItems.addAll(book.categorias.map((e) => e.toJson()));
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  Widget _buildList() {
    return DropdownSearch<String>.multiSelection(
      clearButtonProps: const ClearButtonProps(
        icon: Icon(Icons.close),
      ),
      asyncItems: (text) {
        return context.read<DropdownCategoryInputCubit>().getList(text).then(
              (list) =>
                  list.map((e) => e.toJson()).toList(),
            );
      },
      itemAsString: (item) => Categoria.fromJson(item).nome,
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
            hintText: 'Pesquisar categorias',
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
          final dado = Categoria.fromJson(item);

          return Checkbox(
            value: isSelected,
            onChanged: (value) {
              if (selectedItems.contains(dado.id)) {
                selectedItems.remove(dado.id);
              } else {
                selectedItems.add(dado.id);
              }
            },
            shape: const CircleBorder(),
          );
        },
        itemBuilder: (context, item, isSelected) {
          final categoria = Categoria.fromJson(item);

          return ListTile(
            title: Text(categoria.nome),
          );
        },
      ),
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: 'Selecionar categorias',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      onChanged: (value) {
        context.read<CategoriaInputCubit>().changeList(
              value.map(Categoria.fromJson).toList(),
            );
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Seleciona 1 ou mais categorias';
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
