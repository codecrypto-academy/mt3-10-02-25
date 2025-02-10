# criptografia


## LIBRERIAS
https://paulmillr.com/noble/

https://www.npmjs.com/package/@noble/curves
https://www.npmjs.com/package/@noble/hashes
https://www.npmjs.com/package/@noble/ciphers
https://www.npmjs.com/package/@noble/asymmetric
https://www.npmjs.com/package/@noble/ed25519


## 1. Hash

### 1.1. SHA-2
#### 1.1.1. SHA-256
#### 1.1.2. SHA-384
#### 1.1.3. SHA-512

### 1.2. SHA-3
#### 1.2.1. SHA3-224
#### 1.2.2. SHA3-256
#### 1.2.3. SHA3-384
#### 1.2.4. SHA3-512

### 1.3. Keccak

privatekey --> Keccak-256(publickey).slice(20) --> address

#### 1.3.1. Keccak-224
#### 1.3.2. Keccak-256
#### 1.3.3. Keccak-384
#### 1.3.4. Keccak-512

## 2. Criptografia Simétrica

### 2.1. AES

#### 2.1.1. AES-128 
#### 2.1.2. AES-192
#### 2.1.3. AES-256

#### MODOS

##### CBC (chaining block, NECESITA IV)
##### ECB (el mas simple)
##### CTR (counter mode, NECESITA IV)
##### OFB (output feedback, NECESITA IV)
##### CFB (cipher feedback, NECESITA IV y es similar al OFB)
##### GCM (Galois/Counter Mode, usado por la OTAN y NECESITA IV)


### 2.2. ChaCha20

#### 2.2.1. ChaCha20-128
#### 2.2.2. ChaCha20-192
#### 2.2.3. ChaCha20-256

### 2.3. Salsa20

#### 2.3.1. Salsa20-128
#### 2.3.2. Salsa20-192
#### 2.3.3. Salsa20-256

## 3. Criptografia Assimétrica

### 3.1. RSA

#### 3.1.1. RSA-1024
#### 3.1.2. RSA-2048
#### 3.1.3. RSA-4096

### 3.2. CURVAS ELIPTICAS
https://neuromancer.sk/std/secg/secp256k1

#### CURVAS ELIPTICAS SEGUN NIST

##### P-256
##### P-384
##### P-521

#### CURVAS ELIPTICAS SEGUN SECG

##### secp256k1
##### secp384r1
##### secp521r1

#### SIGN AND VERIFY

##### ECDSA
##### EdDSA
##### Schnorr
##### BLS

#### 3.3. ECDH

#### 3.3.1. ECDH-P256
#### 3.3.2. ECDH-P384
#### 3.3.3. ECDH-P521


prompt para la ia
==================

Un script que me genere una ca y un certificado x509. Tambien quiero un certificado de servidor para el dominio www.bbva.com y la clave privada del servidor. Haz un certificado para conectarme desde el navegador. Por otro lado voy a hacer una aplicacion express , un api que este configurada con la ca y con el certificado de servidor. Usaremos el certificado de la ca. Usaremos criptografia de curvas elipticas. genera todos los ficheros necesarios.  

