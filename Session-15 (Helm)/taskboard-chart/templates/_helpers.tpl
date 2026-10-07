{{- define "taskboard-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "taskboard-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "taskboard-chart.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "taskboard-chart.labels" -}}
app.kubernetes.io/name: {{ include "taskboard-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
{{- end }}

{{- define "taskboard-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "taskboard-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
