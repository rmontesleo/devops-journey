

```bash

devskim verify -r  ./rules/cobol-redefines.json  -x

#
#devskim analyze   --source-code  ./cobol/  --options-json ./rules/cobol-redefines.json 

devskim analyze   --source-code  ./cobol/  -r ./rules/cobol-redefines.json  | jq

devskim analyze  -I  ./cobol/ --ignore-default-rules   -r ./rules/cobol-redefines.json >   results.sarif

```

## REFERENCES

- [DevSkim](https://github.com/microsoft/DevSkim/wiki)
- [Analyze Command](https://github.com/microsoft/DevSkim/wiki/Analyze-Command)
- [Writing Rules](https://github.com/microsoft/DevSkim/wiki/Writing-Rules)
- [Cobol Sample Rule](https://github.com/microsoft/DevSkim/blob/main/rules/default/security/TLS/tls_cobol.json)
- [SSL/TLS Configuration Guidance](https://github.com/microsoft/DevSkim/blob/main/guidance/DS440000.md)
- [GitHub Tun Project](https://github.com/EnriqueTun23/1640-LOCAL-ORDER-ADMI/blob/main/Codigo/Cobol/Noncompliance/COBVALU.cbl)