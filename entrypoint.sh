#!/bin/sh

echo "Notifying job status: $1"

#GITHUB_RUN_NUMBER
# Job status: success/failure/cancelled

if [ "$1" = "success" ]; then
  curl -s -u "${INPUT_USER}:${INPUT_PASSWORD}" \
    -H "Title: Job Succeeded. ${GITHUB_REPOSITORY}/${GITHUB_REF}" \
    -H "Tags: +1" \
    -d "Job succeeded. See $GITHUB_SERVER_URL/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_NUMBER} for details" \
    "${INPUT_HOST}${INPUT_TOPIC}"
elif [ "$1" = "failure" ]; then
  curl -s -u "${INPUT_USER}:${INPUT_PASSWORD}" \
    -H "Title: Job FAILED. ${GITHUB_REPOSITORY}/${GITHUB_REF}" \
    -H "Priority: high" \
    -H "Tags: warning" \
    -d "Job failed. See $GITHUB_SERVER_URL/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_NUMBER} for details" \
    "${INPUT_HOST}${INPUT_TOPIC}"
elif [ "$1" = "cancelled" ]; then
  curl -s -u "${INPUT_USER}:${INPUT_PASSWORD}" \
    -H "Title: Job cancelled. ${GITHUB_REPOSITORY}/${GITHUB_REF}" \
    -H "Priority: low" \
    -H "Tags: x" \
    -d "Job cancelled. See $GITHUB_SERVER_URL/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_NUMBER} for details" \
    "${INPUT_HOST}${INPUT_TOPIC}"
else
  echo "Unknown job status $1"
  exit 1
fi
