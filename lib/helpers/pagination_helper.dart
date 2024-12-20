class PaginationHelper{
  static bool fetchHasPagination({required int totalSize,required int pageNumber,required int length}){
    if(length<=totalSize||(totalSize==0&&length==0)){
      return true;
    }
    else{
      return false;
    }

  }

}