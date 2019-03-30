# notion-blog-sync
syncs my notion to my blog on a cron.

crontab:
```
0,20,40 * * * * cd ~/Projects/notion-sync-cron && pipenv run notion-log-exec --log_failure_only --task_name="Blog Cron" --config ./log-config.json ./run.sh
```

