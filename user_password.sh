#!/bin/env bash
#
# create 5 user and password for each.then set password to each user
# 

echo user0{1..5}:IT$[$RANDOM%9000+1000]@|tr " " "\n" >> new_userfile.txt

for ((i=1;i<=5;i++));
do
		user=$(head -$i new_userfile.txt |tail -1|cut -d: -f1)

		pass=$(head -$i new_userfile.txt |tail -1|cut -d: -f2)

		useradd $user
		echo $pass|passwd --stdin $user

done

# second way to do it
for j in $( cat new_userfile.txt); 
do 
	user=`echo $j |cut -d: -f1`
	pass=`echo $J |cut -d: -f2`


done


