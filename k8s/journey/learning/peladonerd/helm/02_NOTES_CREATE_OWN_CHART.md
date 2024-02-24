

```bash
# in some directory create your chart folder
helm create peladochart

# verify the content
tree peladochart

# chage to the created directory
cd peladochart

# see a dry install 
helm install --dry-run debug .
helm install --dry-run chanchito .
helm install --dry-run --generate-name .

#####################################################
# edit the values.yaml add the following section
healdcheck:
  readinessProbe:
    path: /readiness
    port: http
  livenessProbe:
    path: /liveness
    port: http
#####################################################

#####################################################
# edti the templates/deployment.yaml
 livenessProbe:
            #{{- toYaml .Values.livenessProbe | nindent 12 }}
            httpGet:
              path: {{ .Values.healthcheck.livenessProbe.path }}
              port: {{ .Values.healthcheck.livenessProbe.port }}
          readinessProbe:            
            #{{- toYaml .Values.readinessProbe | nindent 12 }}
            httpGet:
              path: {{ .Values.healthcheck.readinessProbe.path }}
              port: {{ .Values.healthcheck.readinessProbe.port }}

#####################################################

# validate the edited files
helm lint

# make the package of your chart
helm package peladochart/

# or if your are inside the helm folder
helm package .

mkdir charts
mv $CHART_IN_TGZ charts

# create a index file, whith this helm knows about how many charts contains, create a index.yml 
helm repo index .

vim index.yaml


# inside the repository folder
helm install . --generate-name

# override the values from values.yaml file
helm install mychart . --set healthcheck.livenessProbe.path=/ --set healthcheck.readinessProbe.path=/



```


## References
- [HELM Parte 2 - Creando y hosteando tu chart GRATIS](https://www.youtube.com/watch?v=jScW2XaS8uI)