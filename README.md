A popular game [Hangman](https://en.wikipedia.org/wiki/Hangman_(game)) to be played through the command line.

Programming language - **Ruby**.
### Rules
Described on [wikihow](https://www.wikihow.com/Play-Hangman).
### Features
* Only 7 errors allowed. That can be changed in the constant `TOTAL_ERRORS_ALLOWED` in the class `Game;
* Figures of the hangman are located in `/data/figures`. **Important:** the name of the file represents the number of errors made.
* The words are located in `/data/words.txt`. Takes a random word from the list. If necessary to play exact word, leave it alone in the file. While editing **be careful**:
  * Each word on a separate line;
  * Use uppercase.
* Works with both English and Russian letters. Made some features to work with Russian.
### Start to play
The game is using the command line. To start playing:
1. Download all files:
  * main.rb
  * /lib
  * /data 
2. In the command line go to the directory with the files downloaded.
3. Type 
```console
ruby main.rb
```
4. Follow the instructions