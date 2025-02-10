#!/bin/bash

# Crear directorios necesarios
mkdir -p certs
cd certs

# Generar clave privada de la CA usando curva elíptica prime256v1
openssl ecparam -name prime256v1 -genkey -noout -out ca.key

# Generar certificado autofirmado de la CA
openssl req -x509 -new -nodes -key ca.key -sha256 -days 3650 -out ca.crt \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=BBVA CA/CN=BBVA Root CA"

# Generar clave privada del servidor
openssl ecparam -name prime256v1 -genkey -noout -out server.key

# Generar CSR (Certificate Signing Request) para el servidor
openssl req -new -key server.key -out server.csr \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=BBVA/CN=www.bbva.com"

# Crear archivo de configuración para el certificado del servidor
cat > server.ext << EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = www.bbva.com
DNS.2 = bbva.com
EOF

# Firmar el certificado del servidor con la CA
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial \
    -out server.crt -days 365 -sha256 -extfile server.ext

# Generar clave privada del cliente
openssl ecparam -name prime256v1 -genkey -noout -out client.key

# Generar CSR para el cliente
openssl req -new -key client.key -out client.csr \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=BBVA Client/CN=12323232I VIEJO HUERTA JOSE"

# Firmar el certificado del cliente con la CA
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial \
    -out client.crt -days 365 -sha256

# Convertir certificado de cliente a formato PKCS#12 para el navegador
openssl pkcs12 -export -out client.p12 -inkey client.key -in client.crt -certfile ca.crt \
    -passout pass:changeit

# Limpiar archivos temporales
rm *.csr *.ext *.srl

echo "Certificados generados con éxito" 