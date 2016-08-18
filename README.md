# fog credentials checker

This project includes an executable `dingo-postgresql-fog-check` that checks one or more [fog](https://fog.io) configuration files for valid access to an object storage bucket.

Currently it supports testing Amazon S3 storage credentials (the object storage supported by Dingo PostgreSQL).

## Simple testing

Ok, so this draft of the tool was written quickly and manually tested against some sample input files.

You can recreate sample input files with your own credentials and your own Amazon S3 account.

Create `tmp/creds.yml`:

```yaml
default:
  aws_access_key_id: XXX
  aws_secret_access_key: YYY
  bucket_name: bucket-in-eu-central-1
```

Then merge it with the fixture files:

```
./fixtures/make_fog_files.sh tmp/creds.yml
```

The `tmp` directory will be filled with sample files. Those ending with `-good.yml` should complete successfully. All other should error.
