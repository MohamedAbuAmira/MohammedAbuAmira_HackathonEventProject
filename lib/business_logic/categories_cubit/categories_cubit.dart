import 'package:bloc/bloc.dart';
import 'package:elancer_hackathon/data/models/category.dart';
import 'package:elancer_hackathon/data/repository/categories_repository.dart';

import 'package:meta/meta.dart';



part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository categoryRepository;
  List<Category> categories = [];
  CategoriesCubit(this.categoryRepository) : super(CategoriesInitial());

  List<Category> getAllCategories() {
    categoryRepository.getAllCategories().then((categories_) {
      emit(CategoriesLoaded(categories_)); //sent to ui the state
      this.categories = categories_;
    });

    return categories;
  }
}
