# add something in alphabetical order to a file
# need to add tests to make sure that this is correct
function orderadd {
    echo "$0" >> $1 && echo "$(sort $1)" > $1
}

# get the size of files in a directory
function sizeof {
    du -sh $0
}
