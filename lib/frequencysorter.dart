library frequencysorter;

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class FrequencyModel {
  List<dynamic> identifier;
  List userObject;
  Map frqCount;
  List<dynamic> orderedList;
  List<dynamic> sortedList;
  FrequencyModel(identifier, userObject) {
    this.identifier = identifier;
    this.userObject = userObject;
    this.frqCount = {};
    this.orderedList = [];
    this.sortedList = [];
  }
}

class FrequencyGenerator {
  FrequencyModel frequencyModel;
  FrequencyGenerator(identifier, userObject) {
    frequencyModel = new FrequencyModel(identifier, userObject);
    this.init();
  }
  init() {
    List userObj = this.frequencyModel.userObject;
    userObj.forEach((item) {
      dynamic valueInList;
      for (int i = 0; i < this.frequencyModel.identifier.length; i++) {
        if (i == 0) {
          valueInList = item[this.frequencyModel.identifier[i]];
        } else {
          valueInList = valueInList[this.frequencyModel.identifier[i]];
        }
      }
      if (valueInList != null && this.frequencyModel.frqCount[valueInList] != null) {
        this.frequencyModel.frqCount[valueInList] += 1;
        int matchingIndex = this.frequencyModel.sortedList.indexWhere((item) => item["iden"] == valueInList);
        this.frequencyModel.sortedList[matchingIndex]["freq"] = this.frequencyModel.frqCount[valueInList]; 
      } else {
        this.frequencyModel.frqCount[valueInList] = 1;
        item["freq"] = 1;
        item["iden"] = valueInList;
        this.frequencyModel.sortedList.add(item);
      }
    });
  }

 /// Add new item to the frequency list.
 /// 
 /// If item already exists, updates the count of the item. Else, adds it to the list
  registerItem(dynamic item) {
      dynamic valueInList;
      for(int i =0;i<this.frequencyModel.identifier.length;i++)
      {
        if(i==0)
        {
          valueInList = item[this.frequencyModel.identifier[i]];
        }
        else {
          valueInList = valueInList[this.frequencyModel.identifier[i]];
        }
      }
      if(valueInList!= null && this.frequencyModel.frqCount[valueInList]!= null)
      {
        this.frequencyModel.frqCount[valueInList] +=1;
        int matchingIndex = this.frequencyModel.sortedList.indexWhere((item) => item["iden"] == valueInList);
        this.frequencyModel.sortedList[matchingIndex]["freq"] = this.frequencyModel.frqCount[valueInList];
      }
      else{
        this.frequencyModel.frqCount[valueInList] = 1;
        item["freq"] = 1;
        item["iden"] = valueInList;
        this.frequencyModel.sortedList.add(item);
      }
  }
  /// Get frequency of a particular item in the sorted list;
  /// 
  /// Returns back an integer value, corresponding to the frequency of the item in the list
  getFrequencyByValue(dynamic value) {
    dynamic valueInList;
    for(int i=0;i<this.frequencyModel.identifier.length;i++)
  {
    if(i==0)
    {
      valueInList = value[this.frequencyModel.identifier[i]];
    }
    else{
      valueInList = valueInList[this.frequencyModel.identifier[i]];
    }
  }
  if(valueInList!= null && this.frequencyModel.frqCount[valueInList]!= null)
  {
    int matchingIndex = this.frequencyModel.sortedList.indexWhere((item) => item["iden"] == valueInList);
    return this.frequencyModel.sortedList[matchingIndex]["freq"];
  }
  else return 0;
  }
  /// Returns back the list, sorted based on preference.
  /// 
  /// Parameter true indicates descending sort, false indicates ascending.
  getSortedList(bool reverse){
      if (reverse) {
        List<dynamic> itemList = this.frequencyModel.sortedList;
    List keys = itemList;
    keys.sort((k1, k2)  => k2['freq'].compareTo(k1['freq']));
    return keys;
  } else {
  List<dynamic> itemList = this.frequencyModel.sortedList;
    List keys = itemList;
    keys.sort((k1, k2)  => k1['freq'].compareTo(k2['freq']));

    return keys;
  }
  }
  /// Get back original data provided to the module;
  /// 
  /// Original data is untouched and can be safely retieved back, if needed
 getOriginalData(){
   return this.frequencyModel.userObject;
 } 
}