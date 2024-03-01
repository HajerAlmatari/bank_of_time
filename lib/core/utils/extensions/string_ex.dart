extension StringExtensions on String {
  String getFirstTwoInitials() {
    // Split the string into words
    List<String> words = split(' ');

    // Check if there are at least two words
    if (words.length >= 2) {
      // Extract the first letter of the first and second words
      String firstInitial = words[0][0];
      String secondInitial = words[1][0];

      // Return the concatenated initials
      return firstInitial + secondInitial;
    } else {
      // If there are fewer than two words, return an empty string or handle accordingly
      return '';
    }
  }
}