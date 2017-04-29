#Copyright Kevin Wetzel and Robert Vince Peeler
#All Rights Reserved

external string
#DEFINE FUNCTION,STRING

#open list to write out data
list create,9

#Get a file list to process
list create,1
list filelist,1,@path(%0)Articles/*.*
list savefile,1,@path(%0)output.txt
list close,1

#Iterate through files to do something
list create,1
list loadfile,1,@path(%0)output.txt
%%now = 0
%%total = @count(1)
REPEAT
%%document = @next(1)
gosub process
%%now = @succ(%%now)
UNTIL @equal(%%now,%%total)
list savefile,9,@path(%0)output.txt
list close,1

:process
list create,2
list loadfile,2,scorpus.csv
%%nowx = 0
%%totalx = @count(2)
REPEAT
%%data = @next(2)
%%word = @string(GetBefore,%%data,@chr(44),first,)
%%score = @string(GetAfter,%%data,@chr(44),first,)
#HERE
%%nowx = @succ(%%nowx)
UNTIL @equal(%%nowx,%%totalx)
list close,2
exit


