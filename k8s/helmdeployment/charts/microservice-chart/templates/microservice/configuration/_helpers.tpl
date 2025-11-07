{{/*
Define a template for common labels.
*/}}
{{- define "microservice-chart.labels" -}}
helm.sh/chart: {{ include "microservice-chart.name" . }}
app.kubernetes.io/name: {{ include "microservice-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}

# Current Date (from Helm's 'now' function)
app.kubernetes.io/deployment-date: {{ now | unixEpoch | quote }}

# Version (from Chart.yaml)
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end -}}

{{/*
Helper template for the chart name.
*/}}
{{- define "microservice-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
