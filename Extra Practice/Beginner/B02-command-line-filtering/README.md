# B02 — Command-Line Filtering

## Goal

Practice using Linux commands together instead of reading a file manually.

## Setup

~~~bash
chmod +x setup.sh
./setup.sh
cd ~/cyberclub/extra-beginner-b02
~~~

## Tasks

Use the supplied `events.log` to answer:

1. How many lines contain `FAIL`?
2. Which users appear in failed-login events?
3. Which failed-login user appears most often?
4. Find the line containing `FILTER_COMPLETE` and recover the flag.

Try to solve the questions with pipelines rather than counting by hand.

## Commands to Practice

~~~bash
cat
grep
cut
sort
uniq
wc
|
~~~

Example pattern:

~~~bash
grep FAIL events.log | wc -l
~~~

## Deliverable

Submit the flag plus the commands you used.

## Cleanup

~~~bash
rm -rf ~/cyberclub/extra-beginner-b02
~~~
