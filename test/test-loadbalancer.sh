#!/bin/bash

echo "Probando balanceo de carga en http://localhost:8080/api/version"

for i in {1..10}; do
  echo -n "Solicitud $i -> "
  curl -s http://localhost:8080/api/version
  echo ""
done