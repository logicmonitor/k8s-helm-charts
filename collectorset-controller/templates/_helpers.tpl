{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- printf "%s" .Release.Name -}}
{{- end -}}

# TODO - When we implement 'custom values YAML file', remove this template and use tolerations values directly.
{{/* Tolerations template for Collectorset-controller. */}}
{{- define "csc.tolerations" -}}
    {{- range .Values.tolerations }}
      {{- if and (eq .operator "Exists") (ne .value "") }}
          {{- fail "Value must be empty when 'operator' is 'Exists'"}}
      {{- else if and (ne .operator "Exists") (eq .key "") }}
          {{- fail "Operator must be 'Exists' when 'key' is empty." }}
      {{- else if and (ne .effect "NoExecute") (.tolerationSeconds)}}
          {{- fail "Effect must be 'NoExecute' when 'tolerationSeconds' is set." }}
      {{- else }}
      - key: {{ .key | quote }}
        value: {{ .value | quote }}
        operator: {{ .operator | quote }}
        effect: {{ .effect | quote }}
        tolerationSeconds: {{ .tolerationSeconds }}
      {{- end }}
    {{- end }}
{{- end -}}

{{/*
Return the appropriate apiVersion for rbac.
*/}}
{{- define "rbac.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "rbac.authorization.k8s.io/v1" }}
{{- print "rbac.authorization.k8s.io/v1" -}}
{{- else -}}
{{- print "rbac.authorization.k8s.io/v1beta1" -}}
{{- end -}}
{{- end -}}
