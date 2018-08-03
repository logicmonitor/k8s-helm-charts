# Release Manager

This Helm chart installs [Release Manager](https://github.com/logicmonitor/k8s-release-manager).

```bash
$ helm upgrade
  --install \
  --debug \
  --wait \
  --tiller-namespace $NAMESPACE \
  --set debug=$DEBUG \
  --set verbose=$VERBOSE \
  --set tillerNamespace=$NAMESPACE \
  --set daemon.pollingInterval=$POLLING_INTERVAL \
  --set backend.type=s3 \
  --set backend.path=$BACKEND_PATH \
  --set s3.bucket=$S3_BUCKET \
  --set s3.region=$S3_REGION \
  --set s3.accessKeyID=$AWS_ACCESS_KEY_ID \
  --set s3.secretAccessKey=$AWS_SECRET_ACCESS_KEY \
  --set s3.sessionToken=$AWS_SESSION_TOKEN \
  releasemanager logicmonitor/releasemanager
```

## Values:
-   **debug:** Enable debugging output
-   **dryRun:** Print planned actions without making any modifications
-   **verbose:** Enable verbose output
-   **tillerNamespace:** Communicate with the instance of Tiller in this namespace (default "kube-system")
-   **backend.path:** Required. Use this path within the backend for state storage
-   **backend.type:** Required: The backend type to use. Valid options are: s3
-   **daemon.pollingInterval:** Specify, in seconds, how frequently the daemon should export the current state (default 30)

### s3 backend configuration values
-   **s3.bucket:** Required for s3 backend. Use this S3 bucket for backend storage
-   **s3.region:** The backend S3 bucket's region
-   **s3.accessKeyID:** An AWS Access Key ID for accessing the S3 bucket, otherwise use the default AWS credential provider chain
-   **s3.secretAccessKey:** An AWS Secret Access Key for accessing the S3 bucket, otherwise use the default AWS credential provider chain
-   **s3.sessionToken:** An AWS STS Session Token  for accessing the S3 bucket, otherwise use the default AWS credential provider chain
