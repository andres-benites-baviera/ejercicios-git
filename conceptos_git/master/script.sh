# Create a bash script that prints a menu for exercises

# Define a function to create and initialize a git repository
create_repo() {
  # remove all .txt
  rm -rf *.txt
  git config --global init.defaultBranch master
  # Create a directory with the given name and enter it
  mkdir $1 && cd $1

  # Initialize a git repository and create a master branch
  git init && git checkout -b master

  # Create two files and commit them
  touch file1.txt && git add file1.txt && git commit -m "Initial commit"
  touch file2.txt && git add file2.txt && git commit -m "Add readme"
}

# Define a function to delete a directory
delete_repo() {
  # Go back to the parent directory and remove the given directory
  cd .. && rm -rf $1
}

# Create a menu
# make red text
RED='\033[0;31m'
# echo red text
echo "${WHITE}Choose an exercise\n"

# change to PURPLE
PURPLE='\033[0;35m'
WHITE='\033[0;37m'

# space 

echo  "${PURPLE}1. Exercise 1: Branching"
echo  "${PURPLE}2. Exercise 2: Merging"
echo  "${PURPLE}3. Exercise 3: Reset --hard\n"
echo "${WHITE}"
# Read the user input
read -p "Enter your choice: " exercise

# Create a case statement
case $exercise in
 1)
 echo "You chose Exercise 1\n"

# white text
echo "${WHITE}"

 # Call the create_repo function with the name ex1
 create_repo ex1

 # Create a new branch called idea and switch to it
 git checkout -b idea

 # Create another file and commit it
 touch file3.txt && git add file3.txt && git commit -m "Crazy idea"

 # Switch back to master branch
 git checkout master

 # Create another file and commit it
 touch file4.txt && git add file4.txt && git commit -m "Fix bug"

 # Switch back to idea branch
 git checkout idea

 # Create another branch called another-idea and switch to it
 git checkout -b another-idea

 # Print the final conditions
 echo -e "\nFinal conditions\n"
 git --no-pager log --oneline --decorate --graph --all 
# export to file
git log --oneline --decorate --graph --all > ../ex1.txt

 # Call the delete_repo function with the name ex1
 delete_repo ex1
 
 ;;
 2)
 echo -e "\nYou chose Exercise 2\n"

#  ask user if they want to use fast forward or 3 way merge

# read the user input



 # Call the create_repo function with the name ex2
 create_repo ex2
 
 # Create a new branch called idea and switch to it
 git checkout -b idea
 
 # Create another file and commit it
 touch file3.txt && git add file3.txt && git commit -m "Crazy idea"
 
 # Switch back to master branch
 git checkout master
 
 # Create another file and commit it
 touch file4.txt && git add file4.txt && git commit -m "Fix bug"
 
 # Switch back to master branch and merge idea branch into it
 git checkout master
#  if merge type is fast forward

git merge --no-edit  idea



 # Print the final conditions
 echo -e "\nFinal conditions\n"
 git --no-pager log --oneline --decorate --graph --all
#  export to a file
git log --oneline --decorate --graph --all > ../ex2.txt

 # Call the delete_repo function with the name ex2 
 delete_repo ex2
 
 ;;
 3)
 echo -e "\nYou chose Exercise 3\n"

 # Call the create_repo function with the name ex3
 create_repo ex3
 
 # Create a new branch called idea and switch to it
 git checkout -b idea
 
 # Create another file and commit it
 touch file3.txt && git add file3.txt && git commit -m "Crazy idea"
 
 # Switch back to master branch
 git checkout master
 
 # Create another file and commit it
 touch file4.txt && git add file4.txt && git commit -m "Fix bug"
 
 # Switch back to idea branch and reset it to master branch using --hard option
 git checkout idea
 git reset --hard master

 # Print the final conditions
 echo -e "\nFinal conditions\n"
git --no-pager log --oneline --decorate --graph --all

# export this to a file
git log --oneline --decorate --graph --all > ../ex3.txt


 # Call the delete_repo function with the name ex3 
 delete_repo ex3
 
 ;;
 *)
 echo "Invalid choice"
 ;;
esac

# delet .git
rm -rf .git

read -p "Do you want to continue? (y/n) " choice

while [ $choice == "y" ] || [ $choice == "Y" ]
    # go to statr
    do
        ./script.sh
    done
