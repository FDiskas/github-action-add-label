# Get the check run action.
action=$(jq --raw-output .action "$GITHUB_EVENT_PATH")

# If it's not opened action return early.
if [[ "$action" != "opened" ]]; then
    # Return early we only care about opened.
    echo "Check run has action: $action"
    echo "Want synchronize or opened"
    exit 0
fi

# Get the issue number.
NUMBER=$(jq --raw-output .issue.number "$GITHUB_EVENT_PATH")

# Get the issue title.
TITLE=$(jq --raw-output .issue.title "$GITHUB_EVENT_PATH")

echo "running $GITHUB_ACTION for Issue #${NUMBER} with title ${TITLE}"
