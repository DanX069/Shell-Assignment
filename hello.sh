#! /usr/bin/bash
echo "Hello World" # this is a comment

echo $BASH # prints the path to the bash executable and here BASH is system variable
echo $BASH_VERSION # prints the version of bash again system variable
echo $HOME # prints the path to the home directory again system variable
echo $PWD # prints the path to the current working directory again system variable

name=Dan # here for user defined variables we declare them first and then assign them a value
echo The name is $name # prints the value of the user defined variable

echo Bash version is $BASH_VERSION # prints the version of bash

10val=10 # here we cannot start a variable with a number
echo value is $10val # when we run it we will see that it doesn't print the value of the variable because variable name cannot start with a number
val=10 # correct way to declare a variable
echo value is $val # prints the correct value of the variable

echo "Enter the name: " # prints the message
read name # reads the input from the user and stores it in the variable name
echo "The name is $name" # prints the value of the variable name

echo "Enter the name: " # prints the message
read name1 name2 name3 # reads multiple inputs from the user and stores it in the variables name1, name2, name3
echo "The names are $name1, $name2, $name3" # prints the values of the variables name1, name2, name3

read -p 'Username: ' user_var # reads the input from the user and stores it in the variable user_var, the -p command makes the cursor stay on the same line in the terminal or we can use -e flag with /c to make the cursor stay on the same line
echo "Username is: $user_var" # prints the value of the variable user_var

read -sp 'Password: ' pass_var # reads the input from the user and stores it in the variable pass_var, the -sp command hides the input and the cursor stays on the same line
echo # empty echo prints a new line
echo "Password is: $pass_var" # prints the value of the variable pass_var

echo "Enter the names: " # prints the message
read -a names # reads the input from the user and the -a command helps to store it in the array 'names'
echo "The names are: ${names[0]}, ${names[2]}" # prints the values of the array 'names' the square brackets are used to access the values of the array at specific index
echo "Names: ${names[*]}" # prints all the values of the array 'names'

echo "Enter Name: " # prints the message
read # if we don't give any variable to the read command, it reads the input from the user and stores it in the default variable REPLY
echo "Name: $REPLY" # prints the value of the default variable REPLY

count=10 # here we declare a variable and assign it a value
if [ $count -eq 9 ] # here we check if the value of the variable count is equal to 10
then # if the condition is true then the code inside the if block is executed
    echo "Condition is true" # prints the message, the msg is not printed because the condition is false
fi # fi is used to end the if block

word=a # here we declare a variable and assign it a value
if [ $word == "a" ] # here we check if the value of the variable word is equal to "a"
then # if the condition is true then the code inside the if block is executed
    echo "Condition is true" # prints the message, the msg is printed because the condition is true
else # if the condition is false then the code inside the else block is executed
    echo "Condition is false" # prints the message, the msg is not printed because the condition is true
fi # fi is used to end the if block

word=a # here we declare a variable and assign it a value
if [ $word == "a" ] # here we check if the value of the variable word is equal to "a"
then # if the condition is true then the code inside the if block is executed
    echo "Condition is true" # prints the message, the msg is printed because the condition is true
elif [ $word == "b" ] # elif is used to check for multiple conditions, here we check if the value of the variable word is equal to "b"
then # if the condition is true then the code inside the elif block is executed
    echo "Condition is true" # prints the message, the msg is not printed because the condition is false
else # if the condition is false then the code inside the else block is executed
    echo "Condition is false" # prints the message, the msg is not printed because the condition is true
fi # fi is used to end the if block

#file test operators
echo -e "Enter the name of the file: \c" # prints the message and the -e flag is used to interpret the escape sequences
read file_name # reads the input from the user and stores it in the variable file_name
if [ -e $file_name ] # -e checks if the file exists or not, if we use -f here it checks if the file is a regular file or not, if we use -d here it checks if there is a directory or not, if we use -c here it checks if the file is a character file(meaning that it has characters only) or not, if we use -b here it checks if the file is a block file(files other than text like image music video etc) or not, if we use -s here it checks if the file is empty or not, if we use -r here it checks if the file is readable or not, if we use -w here it checks if the file is writable or not, if we use -x here it checks if the file is executable or not
then # if the condition is true then the code inside the if block is executed
    echo "$file_name found" # prints the message
else # if the condition is false then the code inside the else block is executed
    echo "$file_name not found" # prints the message
fi # fi is used to end the if block
#basically the above code checks if a file is in the directory we are in or not



