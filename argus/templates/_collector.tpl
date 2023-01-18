{{- define "lmutil.collector-default-pod-sec-context-nonroot" }}
{{- toYaml .Values.collector.podSecurityContext | nindent 0 }}
{{- end }}
{{- define "lmutil.collector-pod-sec-context-nonroot" -}}
{{- include "lmutil.merge" (append . "lmutil.collector-default-pod-sec-context-nonroot" ) -}}
{{- end -}}

{{- define "lmutil.collector-default-container-sec-context-nonroot" }}
{{- toYaml .Values.collector.securityContext | nindent 0 }}
{{- end }}
{{- define "lmutil.collector-container-sec-context-nonroot" -}}
{{- include "lmutil.merge" (append . "lmutil.collector-default-container-sec-context-nonroot" ) -}}
{{- end -}}

{{- define "lmutil.custom-collector-pod-sec-context-nonroot" }}
{{ if eq (include "lmutil.is-openshift" .) "true" }}
{{ if and (hasKey .Values.collector.env "COLLECTOR_NON_ROOT") (eq .Values.collector.env.COLLECTOR_NON_ROOT "true")  }}
runAsUser: 1000
fsGroup: 1000
runAsGroup: 1000
runAsNonRoot: true
{{ else }}
runAsUser: 0
fsGroup: 0
runAsGroup: 0
runAsNonRoot: false
{{ end }}
{{- end }}
{{- end }}


{{- define "lmutil.custom-collector-container-sec-context-nonroot" }}
{{- if eq (include "lmutil.is-openshift" .) "true" }}
allowPrivilegeEscalation: true
capabilities:
  add:
    - NET_RAW
{{- range .Values.collector.securityContext.capabilities.add }}
    {{- if ne "NET_RAW" . }}
    - {{ . }}
    {{- end }}
{{- end }}
seccompProfile:
  type: RuntimeDefault
{{- end }}
{{- if eq (include "lmutil.get-platform" .) "gke" }}
capabilities:
  add:
    - NET_RAW
{{- range .Values.collector.securityContext.capabilities.add }}
    {{- if ne "NET_RAW" . }}
    - {{ . }}
    {{- end }}
{{- end }}
{{- end }}
{{- end }}
