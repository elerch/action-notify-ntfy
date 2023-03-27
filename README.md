Notifies using ntfy
===================

Usage:

```yaml
      - name: Notify
        uses: https://git.lerch.org/lobo/action-notify-ntfy@v1
        if: always()
        with:
          host: ${{ secrets.NTFY_HOST }}
          topic: ${{ secrets.NTFY_TOPIC }}
          user: ${{ secrets.NTFY_USER }}
          password: ${{ secrets.NTFY_PASSWORD }}
```
