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
{{/* Tolerations template for Argus. */}}
{{- define "argus.tolerations" -}}
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

# TODO - When we implement 'custom values YAML file', remove this template and use tolerations values directly.
{{/* Tolerations template for collectorset. */}}
{{- define "collectorset.tolerations" -}}
{{- range .Values.collector.tolerations }}
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
{{- if .Values.rbacVersionOverride -}}
{{- print .Values.rbacVersionOverride -}}
{{- else if .Capabilities.APIVersions.Has "rbac.authorization.k8s.io/v1" }}
{{- print "rbac.authorization.k8s.io/v1" -}}
{{- else -}}
{{- print "rbac.authorization.k8s.io/v1beta1" -}}
{{- end -}}
{{- end -}}

{{- define "lmutil.get-platform" }}
{{- if contains "-gke" .Capabilities.KubeVersion.Version }}
{{- printf "%s" "gke" }}
{{- else if contains "-eks" .Capabilities.KubeVersion.Version }}
{{- printf "%s" "eks" }}
{{- else if contains "+vmware" .Capabilities.KubeVersion.Version }}
{{- printf "%s" "vmware" }}
{{- else if contains "-mirantis" .Capabilities.KubeVersion.Version }}
{{- printf "%s" "mirantis" }}
{{- else if eq (include "is-openshift" .) "true" }}
{{- printf "%s" "openshift" }}
{{- else }}
{{- printf "%s" "unknown" }}
{{- end }}
{{- end }}

{{- define "is-openshift" }}
{{- $is := false }}
{{- range (.Capabilities.APIVersions | toStrings)}}
{{- if contains "openshift.io" . }}
{{- $is = true }}
{{- end }}
{{- end }}
{{- printf "%t" $is }}
{{- end }}

{{/*
Collector Pod security context
*/}}
{{- define "collector-psp" }}
{{ toYaml .Values.collector.podSecurityContext | nindent 0 }}
{{- end }}

{{- define "collector-csp" }}
{{- $addCaps := .Values.collector.securityContext.capabilities.add }}
{{- if and (eq (include "lmutil.get-platform" .) "gke") (not (has "NET_RAW" $addCaps)) }}
{{- $addCaps = append $addCaps "NET_RAW" }}
{{- end }}
{{- with .Values.collector.securityContext }}
{{- if not (hasKey . "capabilities") }}
{{ toYaml . | nindent 0 }}
{{- end }}
{{- end }}
capabilities:
  drop: {{ toYaml .Values.collector.securityContext.capabilities.drop | nindent 4 }}
  add: {{ toYaml $addCaps | nindent 4 }}
{{- end }}