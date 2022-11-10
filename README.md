# Nextcloud Directory Sync
> Docker app for syncing a single directory from a Nextcloud server

This docker application provides a simple interface that allows you to perpetually synchronise a directory from a Nextcloud server to a local directory, mounted using a volume.

## Obtaining the image

Pull the latest image to get started: `perrymitchell/nextcloud-directory-sync:latest`. Check it out on [DockerHub](https://hub.docker.com/r/perrymitchell/nextcloud-directory-sync).

## Configuring

For the app to run successfully, a number of environment variables are required:

| Variable          | Default       | Required  | Description                                       |
|-------------------|---------------|-----------|---------------------------------------------------|
| `NC_HOST`         | _None_        | Yes       | The host URL of the target Nextcloud instance.    |
| `NC_USERNAME`     | _None_        | Yes       | Nextcloud username.                               |
| `NC_PASSWORD`     | _None_        | Yes       | Nextcloud password.                               |
| `PATH_LOCAL`      | `/nextcloud`  | No        | The local directory inside the Docker container to sync to. |
| `PATH_REMOTE`     | `/`           | No        | The remote Nextcloud directory to sync with.      |
| `PGID`            | `1000`        | No        | Optional group ID for the `nextcloud` user to use for syncing. |
| `PUID`            | `1000`        | No        | Optional user ID for the `nextcloud` user to use for syncing. |
| `SYNC_WAIT`       | `60`          | No        | Delay, in seconds, between sync attempts.         |

There is also an example `.env.example` file, showing overrides.
