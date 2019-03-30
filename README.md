# notion-blog-sync
syncs my notion to my blog on a cron.

crontab:
```
0,20,40 * * * * cd ~/Projects/notion-sync-cron && pipenv run notion-log-exec --log_failure_only --task_name="Blog Cron" --config ./log-config.json ./run.sh
```

You need a `sync-config.json` and a `log-config.json` set up to run this.
See [notion-sync](https://github.com/Adjective-Object/notion-sync) for an example of sync-config.json
See [notion-log-exec](https://github.com/Adjective-Object/notion-log-exec) for an example of log-config.json
