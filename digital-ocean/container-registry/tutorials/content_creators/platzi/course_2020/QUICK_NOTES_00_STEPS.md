## Problems in software development
  Build   -> Construir
  Deploy  -> Distribucion
  Execute -> Ejecucion

### Problemas al construir
 * Dependencias de desarrollo
 * Versiones de entornos de ejecucion
 * Equivlancia de entornos de desarrollo
 * Equivalencia con entornos productivos
 * Versiones/compatibilidad 3rd party

### Problemas al distribuir
 * Output de build heterogeneo
 * Acceso a servidores productivos
 * Ejecucion nativa vs virtualizada
 * Serverless

### Problemas al ejecutar
 * Dependencias de aplicacion
 * Compatibilidad de sistema operativo
 * Disponibilidad de servicios externos
 * Recursos de hardware

`Docker promise: Build, ship and run your code Anywhere`

---

## What is Docker? Containariztion vs Virtualization

Analogia : Logistica 
ProblemaEl problema de distribucion de mercancias en siglo XIX
Solucion: Contenedores, manejar un standar, peso, volumen..

Virtualizacion: A computer runing inside another computer.

Problems
** heavy
- a lot of GB
- a lot of vms, a lot of redundancy

** Administration high cost
- patching, updates, 

** Slow
- a lot of time of waiting while booting

Container: A set of processes

**Versatil
-- order of MB
-- all dependencies they need
-- run same any where

**Efficient
-- images inmutable
-- oly run a set of process, not a complete Operative System.
-- the apps share dependencies, dont dupplicate dependencies

**Isolation.
-- Do in the container.. keeps in the container

---

## Docker instalation


## Before install
Verify in every  Operative System the settings configuration
Check the current version of docker when you're installing first time


## Crete an account in docker.com

## Instalation in Linux
-- Check the documentation of your linux distribution, and docker will run like a deamon
Un contenedor ejecuta sus procesos de forma nativa


## After installall
```bash
docker --version
docker info
```
---
 
## First steps in Docker: Hello World and Docker Engine

### to run a container just with the commands
```bash
docker run hello-world
```
---

## Containers

Los contenedores son el concepto fundamentalal hablar de docker. Un contenedor es una entidad lógica, una agrupación de procesos que se ejecutan de forma nativa como cualquier otra aplicación en la máquina host.
Un contenedor ejecuta sus procesos de forma nativa

## chroot, cgroups and namespaces — An overview
https://itnext.io/chroot-cgroups-and-namespaces-an-overview-37124d995e3d

---
