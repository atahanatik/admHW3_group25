#!/bin/bash

#First question: 
# 1) We use awk '(NR>1)' to take the file ignoring the header
# 2.a) We search for the pattern 'Italy', 'France', 'Spain', 'England' in the placeTags and so we 
# needed to remove the punctuation through sed cause it was saved as a list of string and after we update the 
# counter when we find a match 
#2.b) We search for the pattern 'United States' in the address (column 8) using the last part of it 
# that contain the name of the State


awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '{print$2}' | awk -F ',' '{print$2}' | sed "s/[^:alnum:]]//g" | awk '/Italy/{++cnt} END {print "In Italy there are ", cnt, " places"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '{print$2}' | awk -F ',' '{print$2}' | sed "s/[^:alnum:]]//g" | awk '/Spain/{++cnt} END {print "In Spain there are ", cnt, " places"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '{print$2}' | awk -F ',' '{print$2}' | sed "s/[^:alnum:]]//g" | awk '/France/{++cnt} END {print "In France there are ", cnt, " places"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '{print$2}' | awk -F ',' '{print$2}' | sed "s/[^:alnum:]]//g" | awk '/England/{++cnt} END {print "In England there are ", cnt, " places"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '{print$8}' | awk -F',' '{print $NF}' | awk '/United States/{++cnt} END {print "In United States there are ", cnt, " places"}'

#Second question:
# 1) We use awk '(NR>1)' to take the file ignoring the header
# 2.a) Search for the substring 'State' in the second column (PlaceTags=list of string) to select the rows of our interest and after that we calculate the mean of the numPeopleVisited
# 2.b) For United States such that we have the states of the federation instead of U.S. we use grep command to extract the rows which contain the word and after we calculate the mena   


awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '(index($2, "Italy") != 0) {print$3,$4}' | awk '{total+=$1} END {print "On average ", total/NR, " people have visited the places in Italy"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '(index($2, "Spain") != 0) {print$3,$4}' | awk '{total+=$1} END {print "On average ", total/NR, " people have visited the places in Spain"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '(index($2, "France") != 0) {print$3,$4}' | awk '{total+=$1} END {print "On average ", total/NR, " people have visited the places in France"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '(index($2, "England") != 0) {print$3,$4}' | awk '{total+=$1} END {print "On average ", total/NR, " people have visited the places in England"}'
 
awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | grep 'United States' | awk -F '\t' '{print$3}' | awk '{total+=$1} END {print "On average ", total/NR, " people have visited the places in United States"}'

#Third question: 
#The only difference with the previous point is that the column of our interest is the NumPeopleWant and that we only sum instead of calculate the mean

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '(index($2, "Italy") != 0) {print$3,$4}' | awk '{total+=$2} END {print "In total ", total, " people want to visit the places in Italy"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '(index($2, "Spain") != 0) {print$3,$4}' | awk '{total+=$2} END {print "In total ", total, " people want to visit the places in Spain"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '(index($2, "France") != 0) {print$3,$4}' | awk '{total+=$2} END {print "In total ", total, " people want to visit the places in France"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | awk -F '\t' '(index($2, "England") != 0) {print$3,$4}' | awk '{total+=$2} END {print "In total ", total, " people want to visit the places in England"}'

awk '(NR>1)' /Users/giacomo/Desktop/ADM[HM3]/new_places2.tsv | grep 'United States' | awk -F '\t' '{print$4}' | awk '{total+=$1} END {print "In total ", total, " people want to visit the places in United States"}'

