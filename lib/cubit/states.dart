abstract class ShopAppStates {}
class ShopAppInitialState extends ShopAppStates {}
class ShopAppChangeIconState extends ShopAppStates {}
class ShopAppLoginLoadingState extends ShopAppStates {}

class ShopAppLoginErrorState extends ShopAppStates {
  final String error ;

  ShopAppLoginErrorState(this.error);
}

class ShopAppLoginSuccessState extends ShopAppStates {}

class ShopAppGetHomeDataLoadingState extends ShopAppStates {}

class ShopAppGetHomeDataErrorState extends ShopAppStates {
  final String error ;

  ShopAppGetHomeDataErrorState(this.error);
}

class ShopAppGetHomeDataSuccessState extends ShopAppStates {}

class ChangeBottomNavBarState extends ShopAppStates {}

class ShopAppGetCategoryDataLoadingState extends ShopAppStates {}

class ShopAppGetCategoryDataErrorState extends ShopAppStates {
  final String error ;

  ShopAppGetCategoryDataErrorState(this.error);
}

class ShopAppGetCategoryDataSuccessState extends ShopAppStates {}

class ShopAppGetFavouriteDataLoadingState extends ShopAppStates {}

class ShopAppGetFavouriteDataErrorState extends ShopAppStates {
  final String error ;

  ShopAppGetFavouriteDataErrorState(this.error);
}

class ShopAppGetFavouriteDataSuccessState extends ShopAppStates {}


class ShopAppGetChangeFavouriteDataLoadingState extends ShopAppStates {}

class ShopAppGetChangeFavouriteDataErrorState extends ShopAppStates {
  final String error ;

  ShopAppGetChangeFavouriteDataErrorState(this.error);
}

class ShopAppGetChangeFavouriteDataSuccessState extends ShopAppStates {}

class ShopAppGetSearchDataLoadingState extends ShopAppStates {}

class ShopAppGetSearchDataErrorState extends ShopAppStates {
  final String error ;

  ShopAppGetSearchDataErrorState(this.error);
}

class ShopAppGetSearchDataSuccessState extends ShopAppStates {}

class ShopAppGetProfileDataLoadingState extends ShopAppStates {}

class ShopAppGetProfileDataErrorState extends ShopAppStates {
  final String error ;

  ShopAppGetProfileDataErrorState(this.error);
}

class ShopAppGetProfileDataSuccessState extends ShopAppStates {}

class ShopAppUpdateProfileDataLoadingState extends ShopAppStates {}

class ShopAppUpdateProfileDataErrorState extends ShopAppStates {
  final String error ;

  ShopAppUpdateProfileDataErrorState(this.error);
}

class ShopAppUpdateProfileDataSuccessState extends ShopAppStates {}