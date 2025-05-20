# syntax=docker/dockerfile:1

# 🔧 Etapa 1: Builder - instala dependencias y construye la app
FROM node:lts-alpine AS builder
WORKDIR /src

# Copiar archivos necesarios para instalar dependencias
COPY package.json package-lock.json ./
RUN npm ci

# 🧪 Etapa 2: Test - corre las pruebas unitarias
FROM builder AS test
COPY . .
RUN npm test
