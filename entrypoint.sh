#!/bin/sh

env | sort
echo "status should be: $1"
#GITHUB_RUN_NUMBER
# Job status: success/failure/cancelled

      #   if: success()
      #   run: |
      #          curl -u '${{ secrets.NTFY_USER }}:${{ secrets.NTFY_PASSWORD }}' \
      #          -H 'Title: Job Succeeded. ${{ github.repository }}/${{ github.ref }}' \
      #          -H "Tags: +1" \
      #          -d 'Job succeeded. See '$GITHUB_SERVER_URL'/${{ github.repository }}/actions/runs/${{ github.run_number }} for details' \
      #          '${{ secrets.NTFY_HOST }}${{ secrets.NTFY_TOPIC }}'
      # - name: Failure Notification
      #   if: failure()
      #   run: |
      #          curl -u '${{ secrets.NTFY_USER }}:${{ secrets.NTFY_PASSWORD }}' \
      #          -H "Priority: high" \
      #          -H 'Title: Job FAILED. ${{ github.repository }}/${{ github.ref }}' \
      #          -H "Tags: warning" \
      #          -d 'Job failed. See '$GITHUB_SERVER_URL'/${{ github.repository }}/actions/runs/${{ github.run_number }} for details' \
      #          '${{ secrets.NTFY_HOST }}${{ secrets.NTFY_TOPIC }}'
      #
