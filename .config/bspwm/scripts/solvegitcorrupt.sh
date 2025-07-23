# This is essentially an instruction file so i don't have to google. When power is unexpectedly lost, git corrupts. This is how to solve it.
# cd .git
# find . -type f -empty -delete -print
# tail -n 2 .git/logs/refs/heads/master
# # take first result
# #
# #git update-ref HEAD (second result)
# rm .git/index
# git reset


# DONE
