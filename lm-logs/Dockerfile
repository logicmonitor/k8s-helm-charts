FROM fluent/fluentd-kubernetes-daemonset:v1.11-debian-forward-1
USER root
RUN gem install fluent-plugin-lm-logs -v 0.0.12
RUN gem install fluent-plugin-multi-format-parser -v 1.0.0