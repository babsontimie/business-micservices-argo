\
{{- define "business.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "business.fullname" -}}
{{- printf "%s-%s" (include "business.name" .) .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "business.labels" -}}
app.kubernetes.io/name: {{ include "business.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- range $k, $v := .Values.commonLabels }}
{{ $k }}: {{ $v | quote }}
{{- end }}
{{- end }}
