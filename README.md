# Frequency Sorter

A Flutter utility package, written in Dart, sort a list based on number of occurrences of duplicate items in the list;

Usage: 

- Install the package. Add to pubspec.yaml

     -   frequencysorter: 0.1;

- Import the package

   - import 'package:frequencysorter/frequencysorter.dart';

- Create reference point, requires two parameters --     List of identifiers and List of items

    ```dart
    List<String> identifier = ['name', 'defValue'];
    FrequencyGenerator fr =
        new FrequencyGenerator(identifier, itemList);
    ```
    - Identifier List contains the parameters of nesting in your model, if any

- Available methods:
   - registerItem(dynamic item) // Takes an item as parameter
      - Add new item to the frequency list. If item already exists, updates the count of the item. Else, adds it to the list  
     ```dart
           Ex: fr.registerItem(itemList[itemList.length - 1]);
     ``` 

    - getFrequencyByValue(dynamic value) // Takes a parameter value 
       - Get frequency of a particular item in the sorted list. Returns back an integer value, corresponding to the frequency of the item in the list
      ```dart
        Ex: int frequency = fr.getFrequencyByValue(itemList[0]);
        ```
    - getSortedList(bool reverse) // Takes a boolean parameter
        -  Returns back the list, sorted based on preference. True indicates descending sort, false indicates ascending.
        ```dart
        Ex: List sr = fr.getSortedList(false);
         sr.forEach((element) {
         print('${element['name']['defValue']} - ${element['freq']}')
      ``` 
    


      


          
  


