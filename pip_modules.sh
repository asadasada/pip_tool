#!/usr/bin/env fish
set var (pip list)
set var (string replace -ra '([0-9.]+) ' '$1\\\n' (echo $var))
set var (string replace -ra 'Package                        Version ------------------------------ -------------- ' '' (echo $var))

set var_to_arr (string split '\n' $var)
# just init files! wasurezu ni
echo "" > piyo
echo "" > pip_show_list.txt
printf $var > hoge.txt
set index 1
set count 1
for x in $var_to_arr
        set var (string match -r '[A-Za-z]+[-.0-9a-z]+|[A-Za-z]+' (echo $x))
        printf $x"\n"
        printf $var"\n"
        set arr[$index] $var
        # printf "array values = "$arr[$index]"\n"
        # printf $status"\n"
        if test "$arr[$index]" = ""
                # printf "if check status = $status value is $x\n"
                # printf $x"/n"
                set arr[$index] "error"
                # printf "error\n"$status
        else
                printf "if check status = $status value is $arr[$index]\n"
                # printf "hoge  \n"
                echo "$arr[$index]" >> piyo
                pip show $arr[$index] >> pip_show_list.txt
                printf "\n" >> pip_show_list.txt
                printf "value is 2 = $arr[$index]\n"
                set index (math $index + 1)
        end
        set count (math $count + 1)
end
# set -g hoge "piyo"
# set -g hoge2 (echo $index)
printf (math $count - $index)"\n"

#sed '/^$/d ./piyo' to onaji 
string replace -r '^$' (cat piyo) > piyo⏎      