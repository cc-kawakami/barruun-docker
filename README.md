# Barruun Docker

Barruun is a simple tool for Infrastructure as Code of Google Cloud Platform using `gcloud` command.

## Usage

### Local
To use this image, pull from Docker Hub, run the following command:

```
docker pull cckawakami/barruun:latest
```

Then, authenticate by running:

```
docker run -ti --name gcloud-config cckawakami/barruun gcloud auth login
```

Once you authenticate successfully, credentials are preserved in the volume of the gcloud-config container.

To list compute instances using these credentials, run the container with `--volumes-from`:
```
docker run --rm -ti \
  --env PROJECT_ID=xxx \
  --volumes-from gcloud-config \
  --volume $PWD/sink.yml:/workspace/sink.yml \
  cckawakami/barruun barruun logging sink /workspace/sink.yml
```

For more information on how to use Barruun, see [here](https://github.com/cc-kawakami/barruun).

### Cloud Build

Authentication and file mount are done automatically.

But you must set environment variables.

```yaml
steps
  - name: cckawakami/barruun:latest
    waitFor: ['-']
    args: ['barruun', 'logging', 'sink', '/workspace/cloudbuild/logging/sink.yml']
    env:
      - 'PROJECT_ID=$PROJECT_ID'
```
