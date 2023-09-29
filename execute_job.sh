#!/bin/bash

ARTIFACTS_DIR="artifacts/"  # leave this empty string "" if no root dir
DEFAULT_TARGET_PATH="target"

if [[ -n $ARTIFACTS_DIR ]]; then
    echo "Clearing the $ARTIFACTS_DIR directory"
    trash $ARTIFACTS_DIR
fi

# Get the absolute path to the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set the target path flag for the first command
TARGET_PATH="target_1"

# Loop over the lines of the job.sh file and execute them
while read line; do
    if [[ $line == dbt* ]]; then
        echo $TARGET_PATH
        if [[ $TARGET_PATH == "target_1" ]]; then
            target_path_for_command="$ARTIFACTS_DIR"target
        else
            target_path_for_command="$ARTIFACTS_DIR$TARGET_PATH"
        fi
        echo "target_path: $target_path_for_command"

        mkdir -p $target_path_for_command
        if [[ $line == dbt\ source* ]]; then
            # Backup the target directory to target_bak
            mv "$DEFAULT_TARGET_PATH" "$DEFAULT_TARGET_PATH""_bak"

            # Execute the command with the target flag
            echo "$line"
            eval "$line"

            # Move the contents of target to TARGET_PATH
            mv "$DEFAULT_TARGET_PATH/"* "$target_path_for_command"

            # Rename target_bak to target
            mv "$DEFAULT_TARGET_PATH""_bak" "$DEFAULT_TARGET_PATH"
        else
            # Execute the command with the target path flag
            echo "$line --target-path $target_path_for_command"
            eval "$line --target-path $target_path_for_command"
        fi

        # Increment the target path flag for the next command
        TARGET_PATH="target_$(( ${TARGET_PATH##*_} + 1 ))"
    fi
done < "$DIR/job.sh"
