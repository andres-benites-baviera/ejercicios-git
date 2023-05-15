


create_repo() {

  rm -rf *.txt
  git config --global init.defaultBranch master
  
  mkdir $1 && cd $1

  
  git init && git checkout -b master

  
  touch file1.txt && git add file1.txt && git commit -m "Initial commit"
  touch file2.txt && git add file2.txt && git commit -m "Add readme"
}


delete_repo() {

  cd .. && rm -rf $1
}


RED='\033[0;31m'

echo "${WHITE}Choose an exercise\n"


PURPLE='\033[0;35m'
WHITE='\033[0;37m'



echo  "${PURPLE}1. Exercise 1: Branching"
echo  "${PURPLE}2. Exercise 2: Merging"
echo  "${PURPLE}3. Exercise 3: Reset --hard\n"
echo "${WHITE}"
# Read the user input
read -p "Enter your choice: " exercise


case $exercise in
 1)
 echo "You chose Exercise 1\n"

echo "${WHITE}"


 create_repo ex1

 
 git checkout -b idea

 
 touch file3.txt && git add file3.txt && git commit -m "Crazy idea"

 
 git checkout master

 
 touch file4.txt && git add file4.txt && git commit -m "Fix bug"

 
 git checkout idea

 
 git checkout -b another-idea

 
 echo -e "\nFinal conditions\n"
 git --no-pager log --oneline --decorate --graph --all 
# export to file
git log --oneline --decorate --graph --all > ../ex1.txt

 
 delete_repo ex1
 
 ;;
 2)
 echo -e "\nYou chose Exercise 2\n"







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

 
 delete_repo ex2
 
 ;;
 3)
 echo -e "\nYou chose Exercise 3\n"

 
 create_repo ex3
 
 
 git checkout -b idea
 
 
 touch file3.txt && git add file3.txt && git commit -m "Crazy idea"
 
 
 git checkout master
 
 
 touch file4.txt && git add file4.txt && git commit -m "Fix bug"
 
 
 git checkout idea
 git reset --hard master

 
 echo -e "\nFinal conditions\n"
git --no-pager log --oneline --decorate --graph --all


git log --oneline --decorate --graph --all > ../ex3.txt


 
 delete_repo ex3
 
 ;;
 *)
 echo "Invalid choice"
 ;;
esac


rm -rf .git

read -p "Do you want to continue? (y/n) " choice

while [ $choice == "y" ] || [ $choice == "Y" ]
    
    do
        ./script.sh
    done
