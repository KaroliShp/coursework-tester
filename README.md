# Coursework tester for MIPS and C

Basic shell script for executing MIPS and C code and comparing their outputs. So you can compare your results which should be the same.

## Setup

1. Place it in the same folder as your other files and Mars
2. Compile your C code and keep the names of .s and executables of C code the same
4. Create ```input_all.txt``` and put every test case into a new line. Script will write these test cases line by line to ```input.txt```.

## Usage

Run the following commands in your terminal (might be different for Windows):

```
chmod u+x cw_tester.sh
./cw_tester.sh 0 tokenizer Mars4_5.jar
```

The first argument is either 0 (false) or 1 (true) and it displays the output of each individual code if true. Last new line characters of the output may not be read for some reason (possible fix in the future)

Second argument is the name of your task (name is the same for executable and .s files)

Third argument is the name of your Mars file
